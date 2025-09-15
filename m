Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 455DFB5864B
	for <lists+dri-devel@lfdr.de>; Mon, 15 Sep 2025 23:04:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AD61B10E54D;
	Mon, 15 Sep 2025 21:03:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="HNUwUXWB";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DFBA510E54D
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Sep 2025 21:03:56 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id DFE7360233;
 Mon, 15 Sep 2025 21:03:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 52755C4CEF1;
 Mon, 15 Sep 2025 21:03:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1757970235;
 bh=Vl/2UwRLWIc2Twy5cb1SCnv2Oc2q927fYGWoOEiYOFE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=HNUwUXWBkEU+iT8i7OJG5Z9hBVnQU1tG9eDMvQdeBXCSvX2cd7DsfED8lc6m7LuHz
 fnSXgMVKG5BodyB+x6YT2qAD/BopRjeYal7uOjK3X/5F16OseQ5hGqLsO5P3IVqJT4
 Pz+kkBIjJxl3+epvZiKwJD6a2ko6YwDYLjF4DZZ9GmNFII1M3ikF8SamApq1dhuVwl
 2atQeXv3m5yP6Y1QJn9hbKdcf2sd6ZZ3uPfXAEjdVOb4maSVfFPhWOTzvdmI9AZM6O
 xUNb07x1xErY/bqsKYWZ1biCdljZXY+n8VgVsL5SJPvj4Z8rHidP6xd5wViAMjR4ZR
 rYUgd7Yumi/ug==
Date: Mon, 15 Sep 2025 16:03:54 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Svyatoslav Ryhel <clamor95@gmail.com>
Cc: Maxime Ripard <mripard@kernel.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>,
 David Airlie <airlied@gmail.com>, Thomas Zimmermann <tzimmermann@suse.de>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Simona Vetter <simona@ffwll.ch>
Subject: Re: [PATCH v2 1/2] dt-bindings: display: panel: document Sharp
 LQ079L1SX01 panel
Message-ID: <175797023343.3389573.3144162099437423417.robh@kernel.org>
References: <20250912064253.26346-1-clamor95@gmail.com>
 <20250912064253.26346-2-clamor95@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250912064253.26346-2-clamor95@gmail.com>
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


On Fri, 12 Sep 2025 09:42:52 +0300, Svyatoslav Ryhel wrote:
> Document Sharp LQ079L1SX01 panel found in Xiaomi Mi Pad.
> 
> Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> ---
>  .../display/panel/sharp,lq079l1sx01.yaml      | 99 +++++++++++++++++++
>  1 file changed, 99 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/panel/sharp,lq079l1sx01.yaml
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>

