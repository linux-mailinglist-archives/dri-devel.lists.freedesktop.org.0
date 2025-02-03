Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5774BA2677C
	for <lists+dri-devel@lfdr.de>; Tue,  4 Feb 2025 00:05:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B910810E58A;
	Mon,  3 Feb 2025 23:04:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="W73U2Do3";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7789410E588;
 Mon,  3 Feb 2025 23:04:55 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 2A042A41F6A;
 Mon,  3 Feb 2025 23:03:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D6B72C4CEEA;
 Mon,  3 Feb 2025 23:04:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1738623893;
 bh=8LXNfDj0XbdIAmhPvi+TuYd1/opSOX2Sn7nRqUMekVU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=W73U2Do3p8HRpob25XLwSf3uFb+Uj7d/dFfMIyFRZwRt7Foo28qldEsHhuEr9Heun
 A9z/eoBtcyF2nTtz2xAMc5oYBLvgFCVNfhLfDsZi5UMyOzJV8ZwlFNnBpqr2sZsrfT
 sXLfoAdGPWyUMLtEcYR2Mbna2AXWtk9ynv9dR7MhTmcJPk/9WqYl07AKMu/zmbPY0b
 v/mYDKfMtkgiWWK+6wMl+rNOMhuCxuoPip9ZDKzHRSec9oHP8a4VOVJIwwjMPm5xsr
 2QnmeGncsFD5N5KDaQ9H6jvDOC9imsSR/UFMTbQ41ikzR18cID0hlssuc3rS25xo67
 u12dLkBwxJdhA==
Date: Mon, 3 Feb 2025 17:04:51 -0600
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Danila Tikhonov <danila@jiaxyga.com>
Cc: maarten.lankhorst@linux.intel.com, konradybcio@kernel.org,
 freedreno@lists.freedesktop.org, linux@mainlining.org,
 tzimmermann@suse.de, dmitry.baryshkov@linaro.org,
 devicetree@vger.kernel.org, quic_abhinavk@quicinc.com,
 ~postmarketos/upstreaming@lists.sr.ht, krzk+dt@kernel.org,
 jun.nie@linaro.org, fekz115@gmail.com, robdclark@gmail.com,
 marijn.suijten@somainline.org, simona@ffwll.ch, airlied@gmail.com,
 mripard@kernel.org, conor+dt@kernel.org, sean@poorly.run,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 quic_jesszhan@quicinc.com, neil.armstrong@linaro.org,
 linux-arm-msm@vger.kernel.org, andersson@kernel.org, jonathan@marek.ca
Subject: Re: [PATCH 1/4] dt-bindings: display: panel: Add Visionox RM692E5
Message-ID: <173862389119.509853.11162021545785979711.robh@kernel.org>
References: <20250203181436.87785-1-danila@jiaxyga.com>
 <20250203181436.87785-2-danila@jiaxyga.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250203181436.87785-2-danila@jiaxyga.com>
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


On Mon, 03 Feb 2025 21:14:24 +0300, Danila Tikhonov wrote:
> The Visionox RM692E5 is a 6.55” AMOLED panel used in Nothing Phone (1)
> (sm7325-nothing-spacewar).
> 
> Signed-off-by: Danila Tikhonov <danila@jiaxyga.com>
> ---
>  .../display/panel/visionox,rm692e5.yaml       | 77 +++++++++++++++++++
>  1 file changed, 77 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/panel/visionox,rm692e5.yaml
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>

