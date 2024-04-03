Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7893F896C7F
	for <lists+dri-devel@lfdr.de>; Wed,  3 Apr 2024 12:32:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4667C1129AF;
	Wed,  3 Apr 2024 10:32:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="ULOAWaDl";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com
 [46.235.227.194])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 152471129B0
 for <dri-devel@lists.freedesktop.org>; Wed,  3 Apr 2024 10:32:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1712140324;
 bh=g339Nfakmy10N8LmQYjcsqMkACofjFVwJwlCIJNtuNY=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=ULOAWaDlnGej6ZoXI94u56QiKae1+eyLqorV0zT1tS0I+JDbK45OP+5yqAKDN4BbX
 oh8c7chaZV7h40n/QhFLhlCkkucfVBhCFX2iPOgaeoThYsRhKbrKcanWRQc4fowgHN
 r0OIeRrmHxmZw50tFaKcBbWoxXh8wIrBTnMIT9cQ9NRFsRItJy733BXL2o/D/0jQNj
 l9nZfJCQd3hgsrk3ZIcCDVv/UL1JzLBKQ9sSaPjvAylJmm8TCuM+reIfSOEcQP8N4g
 lZE7sBpkjzBfSRRbRlOisH9c5LFNlvZX/p3GDiThLwiT9WybtY6mY10F30KUFFxHcV
 3oZDAIDKfyICw==
Received: from IcarusMOD.eternityproject.eu (cola.collaboradmins.com
 [195.201.22.229])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: kholk11)
 by madrid.collaboradmins.com (Postfix) with ESMTPSA id 19CFE37820EF;
 Wed,  3 Apr 2024 10:32:03 +0000 (UTC)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: Matthias Brugger <matthias.bgg@gmail.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Moudy Ho <moudy.ho@mediatek.com>,
 "Jason-JH . Lin" <jason-jh.lin@mediatek.com>,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 =?UTF-8?q?N=C3=ADcolas=20F=2E=20R=2E=20A=2E=20Prado?=
 <nfraprado@collabora.com>
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 kernel@collabora.com
Subject: Re: [PATCH v2] soc: mediatek: cmdq: Don't log an error when
 gce-client-reg is not found
Date: Wed,  3 Apr 2024 12:31:58 +0200
Message-ID: <171214017002.130010.3184925664722710524.b4-ty@collabora.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240229-gce-client-reg-log-dbg-v2-1-4975077173d0@collabora.com>
References: <20240229-gce-client-reg-log-dbg-v2-1-4975077173d0@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Direct Rendering Infrastructure - Development
 <dri-devel.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 29 Feb 2024 14:51:08 -0500, Nícolas F. R. A. Prado wrote:
> Most of the callers to this function do not require CMDQ support, it is
> optional, so the missing property shouldn't cause an error message.
> However, it could result on degraded performance, so the fact that it's
> missing should still be alerted. Furthermore, the callers that do
> require CMDQ support already log at the error level when an error is
> returned.
> 
> [...]

Applied to v6.9-next/soc, thanks!

[1/1] soc: mediatek: cmdq: Don't log an error when gce-client-reg is not found
      commit: ef964918d42b9d9cf534754f82ccdaa402783ecd

Cheers,
Angelo

