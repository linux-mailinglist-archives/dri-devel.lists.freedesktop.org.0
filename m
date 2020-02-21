Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 89A9916891D
	for <lists+dri-devel@lfdr.de>; Fri, 21 Feb 2020 22:18:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C9D596F581;
	Fri, 21 Feb 2020 21:18:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk3.altibox.net (asavdk3.altibox.net [109.247.116.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4D6726F581
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Feb 2020 21:18:00 +0000 (UTC)
Received: from ravnborg.org (unknown [158.248.194.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk3.altibox.net (Postfix) with ESMTPS id 73F1420083;
 Fri, 21 Feb 2020 22:17:57 +0100 (CET)
Date: Fri, 21 Feb 2020 22:17:56 +0100
From: Sam Ravnborg <sam@ravnborg.org>
To: Kevin Tang <kevin3.tang@gmail.com>
Subject: Re: [PATCH RFC v3 0/6] Add Unisoc's drm kms module
Message-ID: <20200221211756.GB3456@ravnborg.org>
References: <1582271336-3708-1-git-send-email-kevin3.tang@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1582271336-3708-1-git-send-email-kevin3.tang@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=eMA9ckh1 c=1 sm=1 tr=0
 a=UWs3HLbX/2nnQ3s7vZ42gw==:117 a=UWs3HLbX/2nnQ3s7vZ42gw==:17
 a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=kj9zAlcOel0A:10
 a=AmJ3NbpF4YMwtd5JfE4A:9 a=CjuIK1q_8ugA:10
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
Cc: mark.rutland@arm.com, baolin.wang@linaro.org, airlied@linux.ie,
 zhang.lyra@gmail.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, robh+dt@kernel.org, orsonzhai@gmail.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Kevin.

On Fri, Feb 21, 2020 at 03:48:50PM +0800, Kevin Tang wrote:
> ChangeList:
> v1:
> 1. only upstream modeset and atomic at first commit. 
> 2. remove some unused code;
> 3. use alpha and blend_mode properties;
> 3. add yaml support;
> 4. remove auto-adaptive panel driver;
> 5. bugfix
> 
> v2:
> 1. add sprd crtc and plane module for KMS, preparing for multi crtc&encoder
> 2. remove gem drivers, use generic CMA handlers
> 3. remove redundant "module_init", all the sub modules loading by KMS
> 
> v3:
> 1. multi crtc&encoder design have problem, so rollback to v1
> 
> Kevin Tang (6):
>   dt-bindings: display: add Unisoc's drm master bindings
>   drm/sprd: add Unisoc's drm kms master
>   dt-bindings: display: add Unisoc's dpu bindings
>   drm/sprd: add Unisoc's drm display controller driver
>   dt-bindings: display: add Unisoc's mipi dsi&dphy bindings
>   drm/sprd: add Unisoc's drm mipi dsi&dphy driver
> 
>  .../devicetree/bindings/display/sprd/dphy.yaml     |   78 ++
>  .../devicetree/bindings/display/sprd/dpu.yaml      |   85 ++
>  .../devicetree/bindings/display/sprd/drm.yaml      |   38 +
>  .../devicetree/bindings/display/sprd/dsi.yaml      |  101 ++
Good to see you are using DT Schema format.
Consider to drop the sprd directory and then use
filename with "sprd-" prefix.
sprd.yaml
sprd-dphy.yaml
sprd-dpu.yaml
sprd-dsi.yaml

	Sam

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
