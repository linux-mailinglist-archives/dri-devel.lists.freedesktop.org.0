Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 96420135FCD
	for <lists+dri-devel@lfdr.de>; Thu,  9 Jan 2020 18:52:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 39ECA6E93F;
	Thu,  9 Jan 2020 17:51:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 428 seconds by postgrey-1.36 at gabe;
 Wed, 08 Jan 2020 12:16:03 UTC
Received: from lb2-smtp-cloud8.xs4all.net (lb2-smtp-cloud8.xs4all.net
 [194.109.24.25])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7F3DE6E1C4
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Jan 2020 12:16:03 +0000 (UTC)
Received: from [IPv6:2001:420:44c1:2577:919a:30e7:f323:4bf1]
 ([IPv6:2001:420:44c1:2577:919a:30e7:f323:4bf1])
 by smtp-cloud8.xs4all.net with ESMTPA
 id pA8liVTFJpLtbpA8piGST2; Wed, 08 Jan 2020 13:08:54 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s1;
 t=1578485334; bh=1C0KidIyiLVO8lwHIf540UFf1K42WRXWnuM8epXFZNw=;
 h=Subject:From:To:Message-ID:Date:MIME-Version:Content-Type:From:
 Subject;
 b=q9Gsb9RT5m8IVE0R9IllFFtcoA/4erYYwBb7GEA/IF9HMxiEhyuMNkUjfrrBwq2E3
 Z47dZAhFzskFSF3g5ttC4VD0LKhCCUgDBa2xurGDAg65gG8+cUJFV4QYyvKOijzJPw
 wIs3mtlNyy3N+bs444FDU3kqd+h6Lsji5rl1KpF5Dzqzk8p/SbLSFnxh+wTR5qiNRv
 H88Ms6yfeGfvRhOG2BTHDp/2agrycIL2s916RxyzLARa8CUhHrFxjquue4vrs6xOIE
 KVWrLB9Wyug0vqfijuN1ZfQv/bTICOj45vX93u1tQZcGeXwCCBSnyplebEa3UkATHP
 gmcfnrhQM2c6g==
Subject: Re: [PATCH] drm/Kconfig: add missing 'depends on DRM' for DRM_DP_CEC
From: Hans Verkuil <hverkuil-cisco@xs4all.nl>
To: Maling list - DRI developers <dri-devel@lists.freedesktop.org>
References: <489bdaae-9b05-2d70-12e1-4fda7899dfc1@xs4all.nl>
Message-ID: <bbbef09d-6c90-75ba-e480-28365474b1a5@xs4all.nl>
Date: Wed, 8 Jan 2020 13:08:47 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <489bdaae-9b05-2d70-12e1-4fda7899dfc1@xs4all.nl>
Content-Language: en-US
X-CMAE-Envelope: MS4wfAYfwofXI8ne6Q6yhVgrGvPLD/zxwNq2q6mztlCWWgWgoAv4NW0M2XXSlfY09uG4RbmlvFiIDWPtPT19dd0KbqR4ANU2Nd2J+S1CrgdwZskROWo0Fc9N
 5c6UzcxMzpfJdrfF1CbgOptP5vj3OiH4SLqCCMErYELzN8Y8QPjXHoh11eL2Q6qIij8k1t112N8R76YVVUibScyaEGlYQZC0uThe8HO/ec4tb2Qht6TPLkH3
 j77oM5JOEjba9lpLjmNLR1mm1QtdP6oSB58Bf5PE13+l4pA+vYKra1Mb/hdiTLLd8/Svz8bCoQfoSARKrpkW3BNGadrPJFmC2RyW809egV7zJkHY6Mu2cpoN
 YFHmNMlkQpgmhIZ63iuYWBrE9j9FIw==
X-Mailman-Approved-At: Thu, 09 Jan 2020 17:51:28 +0000
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>,
 Linux Media Mailing List <linux-media@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 12/6/19 12:26 PM, Hans Verkuil wrote:
> Add a missing 'depends on DRM' for the DRM_DP_CEC config
> option. Without that enabling DRM_DP_CEC will force CEC_CORE
> to =y instead of =m if DRM=m as well.
> 
> Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>

Daniel, can you review this? It's annoying that the cec core is
compiled as part of the kernel when it can just be a module.

Regards,

	Hans

> ---
> diff --git a/drivers/gpu/drm/Kconfig b/drivers/gpu/drm/Kconfig
> index 1168351267fd..e8e478d6da9c 100644
> --- a/drivers/gpu/drm/Kconfig
> +++ b/drivers/gpu/drm/Kconfig
> @@ -163,6 +163,7 @@ config DRM_LOAD_EDID_FIRMWARE
> 
>  config DRM_DP_CEC
>  	bool "Enable DisplayPort CEC-Tunneling-over-AUX HDMI support"
> +	depends on DRM
>  	select CEC_CORE
>  	help
>  	  Choose this option if you want to enable HDMI CEC support for
> 

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
