Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C6F866A2C9D
	for <lists+dri-devel@lfdr.de>; Sun, 26 Feb 2023 00:39:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3182210E63C;
	Sat, 25 Feb 2023 23:39:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1031.google.com (mail-pj1-x1031.google.com
 [IPv6:2607:f8b0:4864:20::1031])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 95F2310E63C
 for <dri-devel@lists.freedesktop.org>; Sat, 25 Feb 2023 23:39:38 +0000 (UTC)
Received: by mail-pj1-x1031.google.com with SMTP id
 x20-20020a17090a8a9400b00233ba727724so8826604pjn.1
 for <dri-devel@lists.freedesktop.org>; Sat, 25 Feb 2023 15:39:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:content-language:references
 :cc:to:subject:from:user-agent:mime-version:date:message-id:from:to
 :cc:subject:date:message-id:reply-to;
 bh=Pio0uRP/ewoQJQAm/tSRW/tGkbea/TOip01WmAMHVzo=;
 b=FO5Jb1+wDZrmKC1gE6gtni9QN39RJ74fJZm3VMr582oRKOwFt0N2fK5tXG2Y2NvWXs
 3flNlNgc8YSguTXnMZrQyzOrkkP9MOIz+Jv75lhaa81O2rWJgoIN7JhvySJjv+S+6eGG
 sWWRt5G3DCTGSJSe1oFD8CQzBjOdL1rp15IY1XPJfK68FUrjiB/SZphDLAuZwE58l4jw
 zuu/SkPOoNrgP+P+/Z2jd02qjZKOaJvxFRZEHsD6INVi/fqrTOFuzrvOTuepwJD63BpL
 DuXaqqE8f0p5R3WImzdCAEVAUzP2Uu2sLlac16M6mIQlmC8dupzyikNOvJxEnnB46H4K
 IF3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:content-language:references
 :cc:to:subject:from:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Pio0uRP/ewoQJQAm/tSRW/tGkbea/TOip01WmAMHVzo=;
 b=H1x0QQm9DtSR+RNQeHWhh0scfA4S/hy5BTfEVLWehByUTBFE2IpOHy6SejqRD0UtBi
 sute/AzOrCsq8O6vn7/7JxdzhfLgTBJOJSo30f7CGjfYgvfwFgXp3aTIsNz/WDTwJ9zM
 FV3D4dDVCydcyMjnRkHGrnT3KcbaoYMm78tN3LW8EN0vpmdiuMKopdoe5TIb5pWdMiwJ
 xJBQKoNWaCYrkWlCVx1A3Rl4mB31m3ZDeIoNqElQgyL2LlY8mjDXGRL0/+QsmrVomqVE
 HxOBMTjvoi+n+Luzk1kOZfMWfM5Zz209tatqAMKwTO4Kagun+krGdtGdPrg46e06eo9W
 PcOQ==
X-Gm-Message-State: AO0yUKWBG6dEvpfvdUzrJodIcDDqJupkqxlvm7NNwSh8aFV2utqP9izw
 CtCornEy/ICT9qJOS1qNQx4=
X-Google-Smtp-Source: AK7set89d/ivG7PS04MXWl/22Xdl6Zd0rGjXDVOF53H4hiShuf17qLdp5MNCESTV6PwDgFeKAvng2w==
X-Received: by 2002:a17:903:8ce:b0:199:3a4a:d702 with SMTP id
 lk14-20020a17090308ce00b001993a4ad702mr4223586plb.0.1677368378086; 
 Sat, 25 Feb 2023 15:39:38 -0800 (PST)
Received: from [192.168.11.9] (KD106167171201.ppp-bb.dion.ne.jp.
 [106.167.171.201]) by smtp.gmail.com with ESMTPSA id
 e6-20020a170902d38600b0019cb8ffd592sm1761602pld.163.2023.02.25.15.39.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 25 Feb 2023 15:39:37 -0800 (PST)
Message-ID: <307dbafd-6fe7-1b75-a484-67553529a5e0@gmail.com>
Date: Sun, 26 Feb 2023 08:39:32 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
From: Akira Yokosawa <akiyks@gmail.com>
Subject: Re: [PATCH] media: Fix building pdfdocs
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
References: <20230208082916.68377-1-tomi.valkeinen@ideasonboard.com>
Content-Language: en-US
In-Reply-To: <20230208082916.68377-1-tomi.valkeinen@ideasonboard.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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
Cc: Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Dave Airlie <airlied@redhat.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

[+CC: Jon, linux-doc]

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
Link: https://lore.kernel.org/r/12250823-8445-5854-dfb8-b92c0ff0851e@gmail.com/

> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
> ---
> 
> Note: the offending patch was merged via drm tree, so we may want to
> apply the fix to the drm tree also.

So, the offending commit is now in mainline without this fix...
I believe this build regression -- a real build error of "make pdfdocs"
-- should be fixed ASAP.

Tomi, Laurent has suggested a typo fix in the Changelog.
Can you respin ?

Or, Laurent, can you do the fix on your own?

Hopefully, the fix can make v6.3-rc1.

        Thanks, Akira

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
