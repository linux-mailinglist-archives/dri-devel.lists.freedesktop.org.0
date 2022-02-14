Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DF2D94B42EE
	for <lists+dri-devel@lfdr.de>; Mon, 14 Feb 2022 08:37:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DDFD210E21F;
	Mon, 14 Feb 2022 07:37:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com
 [IPv6:2a00:1450:4864:20::52d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 66BA610E150
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Feb 2022 07:08:42 +0000 (UTC)
Received: by mail-ed1-x52d.google.com with SMTP id b13so25687140edn.0
 for <dri-devel@lists.freedesktop.org>; Sun, 13 Feb 2022 23:08:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=bT6rvQckvjjqoQ/XD4T+3/+zVByG4H4VWI5uUBKOAg4=;
 b=HPn4S+tf8qOXyHQ5GU6E8u5bHjBSKm5IzPld4ZhfDFML1a+poKQibfGDvysgT7hOhf
 nqFFLgTxXhiCiVP8XWcGz54JAHJ7gd5yI90I7mAeLZOb18apwb3t4DL+VZldUZB5gO5P
 44q+bLKCrDFZkzbiECM4djYg9a1T6TlAdrDWxelvbD3XZ/+wVeaMzHi+n18libKQDXkR
 wpUTYEj2KhKlG8SWPVXVpE2VBweDTvQmZ3GzfmB+ptDb20CU8z0uEIywewyRZ54qNpTX
 OCva1p86LeH2mYN2ppeBYFuJgJIK8vUEdbXuUt6jkgrupsrh27a4K5dkvJydJfvhD5MD
 vsew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=bT6rvQckvjjqoQ/XD4T+3/+zVByG4H4VWI5uUBKOAg4=;
 b=hvYE6TGq7pXdtLkP3xVFZ6a/rJ2PXk7aOKVFK8Jn5yPTl2JXAW1ko8t2q+p5INBJ0Q
 Nxbn7iwZwkgvCCw7tBnlnkk6Rr3M9w3CYU8LZcc5SceJXt/TEtAN/N09Nh0zkKvoW69f
 zaMQ2f8ubgBIdF/AIsMuKznrrQ7dW0MHFCQ6XlBPZTtIdZ6jV3kLaAaSYcRAwNLFoL8S
 2NWypiavME8BI7QXXQDiX+Uo3HNn+pXH/WGT6qEBYuwe/LmmGv485Hbs4Hg+O9BPKEbf
 toz1+UvZNOMGE9w4PEDUHGfi4m7YRMTUNd4+7K7FasUToMP8u9YqCC5CNznxUrim4q87
 qdQQ==
X-Gm-Message-State: AOAM531zLaryYApN1UqCV2mzqhLlcJ82MJRdXvhMVkOq+3gLv9uiwT7g
 fmdDVD+eQpcJSsO3/u3EhndWGq8jshc=
X-Google-Smtp-Source: ABdhPJx1Hoca/TwI6wHcpTR272SAt0DNLGixxwUD/8psz9wtNQ/AA9N812ZwSUSsT5muW/9SzKJpxA==
X-Received: by 2002:aa7:cdc1:: with SMTP id h1mr407580edw.398.1644822520764;
 Sun, 13 Feb 2022 23:08:40 -0800 (PST)
Received: from [192.168.1.10] ([46.249.74.23])
 by smtp.googlemail.com with ESMTPSA id j8sm626580edw.40.2022.02.13.23.08.39
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Sun, 13 Feb 2022 23:08:40 -0800 (PST)
Subject: Re: [PATCH 0/3] drm: omapdrm: Fix excessive GEM buffers DMM/CMA usage
To: tomba@kernel.org, airlied@linux.ie, daniel@ffwll.ch
References: <1642587791-13222-1-git-send-email-ivo.g.dimitrov.75@gmail.com>
From: Ivaylo Dimitrov <ivo.g.dimitrov.75@gmail.com>
Message-ID: <f517358f-fb6c-3343-5d3a-006bd459f6ba@gmail.com>
Date: Mon, 14 Feb 2022 09:08:35 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Firefox/60.0 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <1642587791-13222-1-git-send-email-ivo.g.dimitrov.75@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Mon, 14 Feb 2022 07:37:40 +0000
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
Cc: tony@atomide.com, merlijn@wizzup.org, linux-omap@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

gentle ping

On 19.01.22 г. 12:23 ч., Ivaylo Dimitrov wrote:
> This patch series fixes excessive DMM or CMA usage of GEM buffers leading to
> various runtime allocation failures. The series enables daily usage of devices
> without exausting limited resources like CMA or DMM space if GPU rendering is
> needed.
> 
> The first patch doesn't bring any functional changes, it just moves some
> TILER/DMM related code to a separate function, to simplify the review of the
> next two patches.
> 
> The second patch allows off-CPU rendering to non-scanout buffers. Without that
> patch, it is basically impossible to use the driver allocated GEM buffers on
> OMAP3 for anything else but a basic CPU rendered examples as if we want GPU
> rendering, we must allocate buffers as scanout buffers, which are CMA allocated.
> CMA soon gets fragmented and we start seeing allocation failures. Such failres
> in Xorg cannot be handeled gracefully, so the system is basically unusable.
> 
> Third patch fixes similar issue on OMAP4/5, where DMM/TILER spaces get
> fragmented with time, leading to allocation failures.
> 
> Series were tested on Motolola Droid4 and Nokia N900, with OMAP DDX and
> PVR EXA from https://github.com/maemo-leste/xf86-video-omap
> 
> Ivaylo Dimitrov (3):
>    drm: omapdrm: simplify omap_gem_pin
>    drm: omapdrm: Support exporting of non-contiguous GEM BOs
>    drm: omapdrm: Do no allocate non-scanout GEMs through DMM/TILER
> 
>   drivers/gpu/drm/omapdrm/omap_gem.c        | 198 +++++++++++++++++-------------
>   drivers/gpu/drm/omapdrm/omap_gem.h        |   3 +-
>   drivers/gpu/drm/omapdrm/omap_gem_dmabuf.c |   5 +-
>   3 files changed, 116 insertions(+), 90 deletions(-)
> 
