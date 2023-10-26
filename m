Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 46C4E7D837A
	for <lists+dri-devel@lfdr.de>; Thu, 26 Oct 2023 15:26:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C77B710E136;
	Thu, 26 Oct 2023 13:26:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org
 [IPv6:2604:1380:40e1:4800::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D8FCB10E136
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Oct 2023 13:26:19 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 96575CE3F62;
 Thu, 26 Oct 2023 13:26:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7C8E9C433C8;
 Thu, 26 Oct 2023 13:26:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1698326776;
 bh=EkEQs9N23jDDNdbmrMAfm/n0wa1XEFhc3nFLxMLQBfk=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=phCC8uNydBc6FI51+5GxUnplh0W6pHKM/k1kCBdgKGdSLVRB25tPZzMSM5b9CSEi6
 NnDL+8L6rdKgTWVvBT/NBBIj0EfltwYqA99WgClIVDgnKFQTa5pKv5sHghnpJ6iH2L
 a1Dz1GENta9hCJTNryRzvDwV+Ex5MzGGjK22BdAgwJwpcbcrXqx+zZ2otAAu/7NPZe
 y1m71EsEfiDdLlwmTX0xT8jkN/b+wKmE7vvRFfWoJIgWZ2xPFy7gBBBGAqFAEw8MkG
 rKx97y13DM1ZB7pbH/QFsTr7zFLVbyFrDGPF9dKYp0U4R2ckI7QXWHf+yEJ8U2aqn9
 uWfObGYv/9nUg==
From: Maxime Ripard <mripard@kernel.org>
To: dri-devel@lists.freedesktop.org, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Helen Koike <helen.koike@collabora.com>
In-Reply-To: <20231024004525.169002-1-helen.koike@collabora.com>
References: <20231024004525.169002-1-helen.koike@collabora.com>
Subject: Re: [PATCH v3 00/10] drm/ci: fixes and improvements
Message-Id: <169832677439.958223.17998130799046222765.b4-ty@kernel.org>
Date: Thu, 26 Oct 2023 15:26:14 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.3
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
Cc: robdclark@chromium.org, daniels@collabora.com, vignesh.raman@collabora.com,
 guilherme.gallo@collabora.com, sergi.blanch.torne@collabora.com,
 quic_abhinavk@quicinc.com, linux-kernel@vger.kernel.org,
 david.heidelberg@collabora.com, linux-mediatek@lists.infradead.org,
 dmitry.baryshkov@linaro.org, quic_jesszhan@quicinc.com,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, 23 Oct 2023 21:45:15 -0300, Helen Koike wrote:
> This series contains the several fixes, making drm/ci much
> more reliable and useful.
> 
> Highlights:
> 
> * Current DRM/CI in drm-misc is broken, this series fixes it with mesa
>   uprev (commit 1/9).
> 
> [...]

Applied to drm/drm-misc (drm-misc-next).

Thanks!
Maxime

