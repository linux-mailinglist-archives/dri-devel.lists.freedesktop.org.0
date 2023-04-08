Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 25C956DB9A7
	for <lists+dri-devel@lfdr.de>; Sat,  8 Apr 2023 10:23:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 346FA10E134;
	Sat,  8 Apr 2023 08:23:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 909 seconds by postgrey-1.36 at gabe;
 Sat, 08 Apr 2023 08:23:04 UTC
Received: from sender-of-o51.zoho.in (sender-of-o51.zoho.in [103.117.158.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5F65710E134
 for <dri-devel@lists.freedesktop.org>; Sat,  8 Apr 2023 08:23:04 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1680941265; cv=none; d=zohomail.in; s=zohoarc; 
 b=KWoq/BDSD1asMcSy0D9FCEUwTle7J4nr43DDY3fBiPTYG9/i+Kk3aCOjeNoOcAmNAKSTdA/bYB01meEhk0iQN0PciRbvOQq/XKZLP5iFywT7mx+879vREwwzivmMSRS3b0yN2gjzLgCqgITJAu6FbNJfSiI82EbLOn1CM8uWNC8=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.in;
 s=zohoarc; t=1680941265;
 h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To;
 bh=qh8xtmC1qTrqy5bGNgR12Ei7zL2n3kqYPlSYKbj6iHg=; 
 b=e0nG4N6ouIEOHn7ecCZVfa7lkbhM016lVyo5/0knlPCC+6DMyFck87fn974avb7VP18TatSwb5ndgv8vdG9msIyKziVJRKVWgiTYAM2VsGtrjyL5ByhFhBdbDv4jnjDoy1yxT1PjlYZ8fOAFQdk/t1voDF21fvWZ6M05vkcXTvQ=
ARC-Authentication-Results: i=1; mx.zohomail.in; dkim=pass  header.i=siddh.me;
 spf=pass  smtp.mailfrom=code@siddh.me;
 dmarc=pass header.from=<code@siddh.me>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1680941265; 
 s=zmail; d=siddh.me; i=code@siddh.me;
 h=Date:Date:From:From:To:To:Cc:Cc:Message-ID:In-Reply-To:References:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
 bh=qh8xtmC1qTrqy5bGNgR12Ei7zL2n3kqYPlSYKbj6iHg=;
 b=E9XsTWEI5+hjDKNFyApLlYnL0V4Gr/tMr3uVwPmfmi4XPtqYqCdwjMGvFriLwlDu
 0BJMynqkuE+YlS3GHNAUmxJh7jEqWmZAcfmXsmc0huqeP503mET5RR7Ys/z8RShbWxq
 CgADTqF1gCvAzg6rBwgv753lUtHNo3/7mQq1eFAM=
Received: from mail.zoho.in by mx.zoho.in
 with SMTP id 1680941252991104.24842012139527;
 Sat, 8 Apr 2023 13:37:32 +0530 (IST)
Date: Sat, 08 Apr 2023 13:37:32 +0530
From: Siddh Raman Pant <code@siddh.me>
To: "Maarten Lankhorst" <maarten.lankhorst@linux.intel.com>,
 "Maxime Ripard" <mripard@kernel.org>,
 "Thomas Zimmermann" <tzimmermann@suse.de>,
 "David Airlie" <airlied@gmail.com>, "Daniel Vetter" <daniel@ffwll.ch>,
 "Jim Cromie" <jim.cromie@gmail.com>, "Sam Ravnborg" <sam@ravnborg.org>,
 "Jani Nikula" <jani.nikula@linux.intel.com>,
 "Suraj Upadhyay" <usuraj35@gmail.com>
Message-ID: <1875fe8015d.134ced49297190.1370743243402238612@siddh.me>
In-Reply-To: <cover.1677574322.git.code@siddh.me>
References: <cover.1677574322.git.code@siddh.me>
Subject: Re: [PATCH v8 0/8] drm: Remove usage of deprecated DRM_* macros
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Importance: Medium
User-Agent: Zoho Mail
X-Mailer: Zoho Mail
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
Cc: linux-kernel <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 28 Feb 2023 14:55:04 +0530, Siddh Raman Pant wrote:
> This patchset aims to remove usages of deprecated DRM_* macros from the
> files residing in drivers/gpu/drm root.
> 
> In process, I found out that NULL as first argument of drm_dbg_* wasn't
> working, but it was listed as the alternative in deprecation comment,
> so I fixed that before removing usages of DRM_DEBUG_* macros.
> 
> Courtesy discussion on v1, I added support for NULL in drm_()* macros too.
> 
> Courtesy discussion on v7, I removed generic macro stuff meant to accomodate
> stuff like mipi_dsi_host, and instead reverted a commit which used the
> drm_err() macro incorrectly by passing mipi_dsi_host.
> 
> This patchset should be applied in order as changes might be dependent.
> 
> Please review and let me know if any errors are there, and hopefully
> this gets accepted.
> 
> [...]
> 
> Siddh Raman Pant (8):
>   Revert "drm: mipi-dsi: Convert logging to drm_* functions."
>   drm/print: Fix and add support for NULL as first argument in drm_*
>     macros
>   drm: Remove usage of deprecated DRM_INFO
>   drm: Remove usage of deprecated DRM_NOTE
>   drm: Remove usage of deprecated DRM_ERROR
>   drm: Remove usage of deprecated DRM_DEBUG
>   drm: Remove usage of deprecated DRM_DEBUG_DRIVER
>   drm: Remove usage of deprecated DRM_DEBUG_KMS
> 
>  [...]

Hello,

Please review these patches and let me know if any further changes
are required. I feel they should be good to merge now.

Context: https://lore.kernel.org/dri-devel/cover.1677574322.git.code@siddh.me/

Thanks,
Siddh
