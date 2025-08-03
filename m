Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E1840B19483
	for <lists+dri-devel@lfdr.de>; Sun,  3 Aug 2025 18:53:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CA5EE10E032;
	Sun,  3 Aug 2025 16:53:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="QDcKqE33";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 417D710E032
 for <dri-devel@lists.freedesktop.org>; Sun,  3 Aug 2025 16:53:25 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 0F6AC601D6;
 Sun,  3 Aug 2025 16:53:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8FC5EC4CEEB;
 Sun,  3 Aug 2025 16:53:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1754240003;
 bh=qezdTFcR7X537i4pxy5meG/TintI1Jbhp+Yp8Rrbvn8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=QDcKqE33CcTBcv8Z+MBG0ZBWBEx5VCPWrvJtmTBUfU2xc/2nZSFDelYBDKm38ANpk
 PeijJbflJhwyEZrNj5L2fe5hNeXZu3vi36TtscWjnaPl9wG2Bxu0EcmM0mD6vvVUxY
 v2JEpin1I4WyGS7ELosG/KjPpXkGLo1ede6/NLxU8/nnDIkQQMQJXby2YJcwVN4wF6
 1YJOLg1sez03QPzmEPMLLuwmRARlbI2lo+47TP+YRDxw2XJQg00cqZnQSzPkzbll2Y
 9iP1KtGVIvoKHRY/vAzgMkeKFFo1LI1pNlGCaUo0DLTgGcuuZMUYtX5arS90ym1u3W
 Qi+JbcXcjoBrw==
Date: Sun, 3 Aug 2025 11:53:22 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Otto =?iso-8859-1?Q?Pfl=FCger?= <otto.pflueger@abscue.de>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Russell King <rmk+kernel@arm.linux.org.uk>,
 devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 Kevin Tang <kevin3.tang@gmail.com>, Chunyan Zhang <zhang.lyra@gmail.com>,
 Orson Zhai <orsonzhai@gmail.com>,
 Baolin Wang <baolin.wang@linux.alibaba.com>,
 Kevin Tang <kevin.tang@unisoc.com>,
 Liviu Dudau <Liviu.Dudau@arm.com>, Simona Vetter <simona@ffwll.ch>,
 David Airlie <airlied@gmail.com>,
 Maxime Ripard <mripard@kernel.org>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Eric Anholt <eric@anholt.net>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Subject: Re: [PATCH v3 01/16] dt-bindings: display: sprd: adapt for UMS9230
 support
Message-ID: <175424000200.522677.10470224183997281701.robh@kernel.org>
References: <20250731-ums9230-drm-v3-0-06d4f57c4b08@abscue.de>
 <20250731-ums9230-drm-v3-1-06d4f57c4b08@abscue.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250731-ums9230-drm-v3-1-06d4f57c4b08@abscue.de>
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


On Thu, 31 Jul 2025 17:51:14 +0200, Otto Pflüger wrote:
> Add new compatible strings for the DPU and DSI controller found in the
> UMS9230 SoC.
> 
> Signed-off-by: Otto Pflüger <otto.pflueger@abscue.de>
> ---
>  .../devicetree/bindings/display/sprd/sprd,sharkl3-dpu.yaml         | 7 ++++++-
>  .../devicetree/bindings/display/sprd/sprd,sharkl3-dsi-host.yaml    | 4 +++-
>  2 files changed, 9 insertions(+), 2 deletions(-)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>

