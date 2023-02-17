Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BDA2D69A937
	for <lists+dri-devel@lfdr.de>; Fri, 17 Feb 2023 11:45:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1C4A710E02F;
	Fri, 17 Feb 2023 10:45:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailrelay2-1.pub.mailoutpod2-cph3.one.com
 (mailrelay2-1.pub.mailoutpod2-cph3.one.com [IPv6:2a02:2350:5:401::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0AC8F10E02F
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Feb 2023 10:45:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ravnborg.org; s=rsa2;
 h=in-reply-to:content-type:mime-version:references:message-id:subject:cc:to:
 from:date:from;
 bh=Iq/Jl/8yB9466T9tGIxwfLG5ylTLm+hDRobrHF9ofJQ=;
 b=Mgsv2s1ZOU0Glc29b02b0NL25a2dw/vWANUS4vOUoC467Dv26O+J1O3YXQCXfb2tcEZCPl66esHKV
 JFyTRSy4TlMm2pwnhaHwyLIpRwPttUDdE8uGEdsZ62vRnL9O9w65QnipQq71WRIMylk6Rw0REQyyU7
 zgucbT69AVJNT998DuRHxkkQg2zJr7zgNuJ9VC7Zo9PCSGE1JW1gj7fr2JKO9bVqcuwRHBuqSjf+H1
 5ok62Su4yxY3KQpWJ9ROrX9ndHaPW7loN2NWXt+lsxeC4z8WYgZI45Mb0l3XVzLr/7k9Ug7u6wUeEK
 dzR4opLmzZ1w6gwE9XhgYN/io4aEDFA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed;
 d=ravnborg.org; s=ed2;
 h=in-reply-to:content-type:mime-version:references:message-id:subject:cc:to:
 from:date:from;
 bh=Iq/Jl/8yB9466T9tGIxwfLG5ylTLm+hDRobrHF9ofJQ=;
 b=0kjk8enjO1WJK2bX7JN3kFI2+ExDAz43AcD/L8/lMhMP5CmyjJvC50HWt0v7N3yeVA3hpfyLlZutG
 iZo9HwvCw==
X-HalOne-ID: 2d029dc3-aeb0-11ed-9ef3-3df7d73157c4
Received: from ravnborg.org (2-105-2-98-cable.dk.customer.tdc.net [2.105.2.98])
 by mailrelay2 (Halon) with ESMTPSA
 id 2d029dc3-aeb0-11ed-9ef3-3df7d73157c4;
 Fri, 17 Feb 2023 10:45:23 +0000 (UTC)
Date: Fri, 17 Feb 2023 11:45:22 +0100
From: Sam Ravnborg <sam@ravnborg.org>
To: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH] MAINTAINERS: Add myself as co-maintainer for DRM Panels
 drivers
Message-ID: <Y+9awrqcQIOQNeaX@ravnborg.org>
References: <20230216-topic-drm-panel-upstream-maintainance-v1-1-ae1cf9268217@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230216-topic-drm-panel-upstream-maintainance-v1-1-ae1cf9268217@linaro.org>
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
Cc: linux-arm-msm@vger.kernel.org, Thierry Reding <thierry.reding@gmail.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Feb 17, 2023 at 10:58:15AM +0100, Neil Armstrong wrote:
> Add myself as co-maintainer for DRM Panel Drivers in order to help
> reviewing and getting new panels drivers merged.
> 
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>

Thanks for stepping up!

Acked-by: Sam Ravnborg <sam@ravnborg.org>
> ---
>  MAINTAINERS | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index be167c695c64..18fd7548a49b 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -7043,6 +7043,7 @@ F:	drivers/gpu/drm/xlnx/
>  
>  DRM PANEL DRIVERS
>  M:	Thierry Reding <thierry.reding@gmail.com>
> +M:	Neil Armstrong <neil.armstrong@linaro.org>
>  R:	Sam Ravnborg <sam@ravnborg.org>
>  L:	dri-devel@lists.freedesktop.org
>  S:	Maintained
> 
> ---
> base-commit: 9d9019bcea1aac7eed64a1a4966282b6b7b141c8
> change-id: 20230216-topic-drm-panel-upstream-maintainance-6d5cae28d184
> 
> Best regards,
> -- 
> Neil Armstrong <neil.armstrong@linaro.org>
