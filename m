Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BAF80A0739B
	for <lists+dri-devel@lfdr.de>; Thu,  9 Jan 2025 11:44:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6C63210ED4C;
	Thu,  9 Jan 2025 10:44:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="JlTn3qBf";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 242D910ED4C
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Jan 2025 10:44:52 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id BC0F0A416E1;
 Thu,  9 Jan 2025 10:43:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C8AFDC4CED2;
 Thu,  9 Jan 2025 10:44:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1736419490;
 bh=6qW64tcaNVuQcvr/bXNMsqkIFqcHbVYP22OKh44D8yc=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=JlTn3qBfLDPqSLk+mFjzOnZKsZL9nUXlsVSNKS5Cp1Bua94eSiwWX1e7gelK2aSVy
 z6sDmXlmVCjbj9zZGT+7pTxHnDwDVoTm9ge2NwvMU7gMrxo4DXEILUbbHphtX2TLqw
 TYTWY8ZqehP2FgjSISEdlkIKO+vlAzcOawPzQgNhRi7+LzFHdYGpmZLGlUAP5qxew4
 +WD3LkYCUJbYwBVUzmMzdcLGdThzj/Pq1WlnprSqWndfNUMtMrVzfAbgc3fdXG2F0X
 3CaAWGSD7xJKcht4Hdo+lW4YWBUy6ywdWd2ObO0i1jvWuANvV98ByksiwbOynYpMMg
 /LJP81T16iAQg==
From: Lee Jones <lee@kernel.org>
To: linux-leds@vger.kernel.org, devicetree@vger.kernel.org, 
 "A. Sverdlin" <alexander.sverdlin@siemens.com>
Cc: dri-devel@lists.freedesktop.org, Lee Jones <lee@kernel.org>, 
 Daniel Thompson <danielt@kernel.org>, Jingoo Han <jingoohan1@gmail.com>, 
 Pavel Machek <pavel@ucw.cz>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Andrew Davis <afd@ti.com>
In-Reply-To: <20241218210829.73191-3-alexander.sverdlin@siemens.com>
References: <20241218210829.73191-1-alexander.sverdlin@siemens.com>
 <20241218210829.73191-3-alexander.sverdlin@siemens.com>
Subject: Re: (subset) [PATCH v5 2/2] leds: lp8864: New driver
Message-Id: <173641948755.2580762.16328854038994481476.b4-ty@kernel.org>
Date: Thu, 09 Jan 2025 10:44:47 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.13.0
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

On Wed, 18 Dec 2024 22:08:27 +0100, A. Sverdlin wrote:
> Add driver for TI LP8864, LP8864S, LP8866 4/6 channel LED-backlight drivers
> with I2C interface.
> 
> 

Applied, thanks!

[2/2] leds: lp8864: New driver
      commit: e14d879292b0f7755c0d51b82a19b30859bb080a

--
Lee Jones [李琼斯]

