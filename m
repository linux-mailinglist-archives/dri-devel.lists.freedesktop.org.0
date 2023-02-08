Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 48B6669022A
	for <lists+dri-devel@lfdr.de>; Thu,  9 Feb 2023 09:30:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DEFFB10E938;
	Thu,  9 Feb 2023 08:30:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1033.google.com (mail-pj1-x1033.google.com
 [IPv6:2607:f8b0:4864:20::1033])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 259F010E07A
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Feb 2023 08:43:56 +0000 (UTC)
Received: by mail-pj1-x1033.google.com with SMTP id j1so11846017pjd.0
 for <dri-devel@lists.freedesktop.org>; Wed, 08 Feb 2023 00:43:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=NS4IVSq1qNCOV4SCAWWy8InxgC7I2O3FeG5OkoKqBYI=;
 b=lRQPFc/aa5uGG2aajxQ0jFFiWc6LFvK25rzD2LE716Dyggqp0eILu2OhJnMMTGHiw/
 LChSItrFE4UN8VVKhXC5MBk24noCoMH/ug9T00VWoPLGBjsZI6l5gqka+mYCuHrNERk2
 ITI15TDZ4yd6BuofdpY8wCa4MRdAknLlZ/7Smo9WcKqQyp6z9tE+R+d2twTa/W/yWZhe
 E/QRbpWTRac0f27ADOLV7KnG9scVOdhL2MP3CVj8e8Dejq+K+lWXT119sFYwayc0p95Q
 sLrZci/k4Gre+Xqb1S2gxlWDprJccmhx7V+7xNEnmi9k7dzF75VBR8uU3Qu0YswYeW1W
 WycQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=NS4IVSq1qNCOV4SCAWWy8InxgC7I2O3FeG5OkoKqBYI=;
 b=lfwMLBTk2fvLAtjqrAqqqDmv0Ct/Xo62OnUH5Qb3GHpD6a2EEOA5mTek3ya9OeQ+XB
 e8+ZMK8nRK6hgnvHZ+Awil96K/uA9+ip/7WTwV87xnp3ohJ4Vv93wS79l7YDmjY0ywys
 SkEPQ5Z4t6GUeYy7KsSYFywIu8x+CzzV1Dlm2Sm9MbPD3DqZplB+QggICsMygdFkD+hI
 /a0M7+MiCzspqYxpCazT2p2w/mbjXz6oIVdjwGQOyOrWvHgtQTDYNpGVE5+DavQwbkSf
 4rJTh5bKaPypQKkTcW95weQm87qAuguSd6ZTUMX7I4fR+Tcs9Jomct/rGGv8J9OvBJBv
 dhDA==
X-Gm-Message-State: AO0yUKVWBo4sxOq1jhlVF/ZT2WPRNdtmBlbrRNymB1krsWF8CJ6fb9eP
 5qir0PHXX1TsFMzpbjbBWTo=
X-Google-Smtp-Source: AK7set8+U9ZkbS04q8MMl2NOPcO5mkYK0s/1agghaxGWf8Xl51sRM/2C0pce/HikvgBMQc7+mxIeBQ==
X-Received: by 2002:a17:903:446:b0:199:7ad:42f7 with SMTP id
 iw6-20020a170903044600b0019907ad42f7mr5907617plb.33.1675845835717; 
 Wed, 08 Feb 2023 00:43:55 -0800 (PST)
Received: from [192.168.11.9] (KD106167171201.ppp-bb.dion.ne.jp.
 [106.167.171.201]) by smtp.gmail.com with ESMTPSA id
 d9-20020a170902aa8900b001991e59fde6sm4954507plr.216.2023.02.08.00.43.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 08 Feb 2023 00:43:55 -0800 (PST)
Message-ID: <5dda1d0b-a132-0a34-b2a0-4ecd29cd9b8a@gmail.com>
Date: Wed, 8 Feb 2023 17:43:49 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH] media: Fix building pdfdocs
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
References: <20230208082916.68377-1-tomi.valkeinen@ideasonboard.com>
Content-Language: en-US
From: Akira Yokosawa <akiyks@gmail.com>
In-Reply-To: <20230208082916.68377-1-tomi.valkeinen@ideasonboard.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Mailman-Approved-At: Thu, 09 Feb 2023 08:30:13 +0000
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
Cc: Dave Airlie <airlied@redhat.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed,  8 Feb 2023 10:29:16 +0200, Tomi Valkeinen wrote:
> Commit 8d0e3fc61abd ("media: Add 2-10-10-10 RGB formats") added
> documatation for a few new RGB formats. For some reason these break the
> pdfdocs build, even if the same style seems to work elsewhere in the
> file.
> 
> Remove the trailing empty dash lines, which seems to fix the issue.
> 
> Fixes: 8d0e3fc61abd ("media: Add 2-10-10-10 RGB formats")
> Reported-by: Akira Yokosawa <akiyks@gmail.com>
> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>

Tested-by: Akira Yokosawa <akiyks@gmail.com>

> ---
> 
> Note: the offending patch was merged via drm tree, so we may want to
> apply the fix to the drm tree also.
> 
>  Documentation/userspace-api/media/v4l/pixfmt-rgb.rst | 3 ---
>  1 file changed, 3 deletions(-)
> 
> diff --git a/Documentation/userspace-api/media/v4l/pixfmt-rgb.rst b/Documentation/userspace-api/media/v4l/pixfmt-rgb.rst
> index d330aeb4d3eb..ea545ed1aeaa 100644
> --- a/Documentation/userspace-api/media/v4l/pixfmt-rgb.rst
> +++ b/Documentation/userspace-api/media/v4l/pixfmt-rgb.rst
> @@ -868,7 +868,6 @@ number of bits for each component.
>        - r\ :sub:`4`
>        - r\ :sub:`3`
>        - r\ :sub:`2`
> -      -
>      * .. _V4L2-PIX-FMT-RGBA1010102:
>  
>        - ``V4L2_PIX_FMT_RGBA1010102``
> @@ -909,7 +908,6 @@ number of bits for each component.
>        - r\ :sub:`4`
>        - r\ :sub:`3`
>        - r\ :sub:`2`
> -      -
>      * .. _V4L2-PIX-FMT-ARGB2101010:
>  
>        - ``V4L2_PIX_FMT_ARGB2101010``
> @@ -950,7 +948,6 @@ number of bits for each component.
>        - r\ :sub:`6`
>        - r\ :sub:`5`
>        - r\ :sub:`4`
> -      -
>  
>  .. raw:: latex
>  
