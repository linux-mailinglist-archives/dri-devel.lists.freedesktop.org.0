Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FA5A2A2797
	for <lists+dri-devel@lfdr.de>; Mon,  2 Nov 2020 10:59:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B0D426E461;
	Mon,  2 Nov 2020 09:59:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [IPv6:2a00:1450:4864:20::42f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 67F0D6E461
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Nov 2020 09:59:02 +0000 (UTC)
Received: by mail-wr1-x42f.google.com with SMTP id 33so3018855wrl.7
 for <dri-devel@lists.freedesktop.org>; Mon, 02 Nov 2020 01:59:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=Bbmmwq7p80A46K8FPfO0vzkl4kIv6LRkoiQ3goMCQ/o=;
 b=VvJKyAOgfHWG32a+jImBHNw5tE9L2rLVEqHeXsm9F/WVKFj70P4SqEHos6ZnCcb3Tu
 hD6iUF9rYZUQ3x8xi4066xLRppu45JreavIHxsDeu/HddPzBq3CwImlL3JzANaNuLYlw
 4APb/fdykbXBPIndErZghm9bflvxSoe7P2blw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=Bbmmwq7p80A46K8FPfO0vzkl4kIv6LRkoiQ3goMCQ/o=;
 b=HIYLTwZu83nmRjJQ80X29+YJINXI1DVS0rMsdDlwFP1FcmDGE2KjXvn58HGf6y8qYm
 3/SFZOANsnmhQA9eOgEQ1yZ2m+BCHr4NIf67P8jhSI4VMWFqPOIPI6ASA69W0FXUrw/5
 xVsnodGjnQzVZNi/vAwNQuOP5DPMzeTW6QCU7uxhRAutISkBRXBLHJenohKomtzhTjou
 MLDIL4Bp1pcM2Qf0jXuaE2jKBc1hrmwtbFdDVyelHgMYbPqjl6uPLLEgZyZWi9Q20p/b
 16U3HEWSacOjaE9EgoGAKBhBBQ85Eo3GFcZuxOF/s5/NRo5dPUhmnqicEVpS3KKk2T5R
 uK8Q==
X-Gm-Message-State: AOAM532i1wdaKXecd2hNZQPYf4MgAZrpyi4nkES8dBO9f50O9oG/iMDa
 6ylDYmuFG5vu/PLspq7BT2ci8g==
X-Google-Smtp-Source: ABdhPJy85GmBox53ZyVqEQkN6ZMosWYQqKXDEJMIXLTzFkmU4v5P/jz0qcRGI3qoiVy673nW2MAMEQ==
X-Received: by 2002:adf:ea0e:: with SMTP id q14mr18854905wrm.373.1604311140897; 
 Mon, 02 Nov 2020 01:59:00 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id f4sm21388536wrq.54.2020.11.02.01.58.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Nov 2020 01:59:00 -0800 (PST)
Date: Mon, 2 Nov 2020 10:58:58 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Philipp Zabel <p.zabel@pengutronix.de>
Subject: Re: [GIT PULL] drm/imx: fixes and cleanups
Message-ID: <20201102095858.GL401619@phenom.ffwll.local>
References: <7e4af582027bbec269364b95f6978d061b48271a.camel@pengutronix.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <7e4af582027bbec269364b95f6978d061b48271a.camel@pengutronix.de>
X-Operating-System: Linux phenom 5.7.0-1-amd64 
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
Cc: David Airlie <airlied@linux.ie>, kernel@pengutronix.de,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Oct 30, 2020 at 05:53:37PM +0100, Philipp Zabel wrote:
> Hi Dave, Daniel,
> 
> The following changes since commit 3650b228f83adda7e5ee532e2b90429c03f7b9ec:
> 
>   Linux 5.10-rc1 (2020-10-25 15:14:11 -0700)
> 
> are available in the Git repository at:
> 
>   git://git.pengutronix.de/git/pza/linux.git tags/imx-drm-next-2020-10-30
> 
> for you to fetch changes up to 36fba366cf9fa386e5905976e68380061feabd2e:
> 
>   drm/imx: tve remove extraneous type qualifier (2020-10-27 10:30:09 +0100)

btw I have vague memories that you worked on drmm_ versions for
encoder/crtc/connector cleanup? Are they still somewhere, or am I just
mixing stuff up?
-Daniel

> 
> ----------------------------------------------------------------
> drm/imx: fixes and cleanups
> 
> Remove unused functions and empty callbacks, let the dw_hdmi-imx driver
> reuse imx_drm_encoder_parse_of() instead of reimplementing it, replace
> the custom register spinlock with the regmap default spinlock and remove
> redundant tracking of enabled state in imx-tve, drop the explicit
> drm_mode_config_cleanup() call in imx-drm-core, reduce the scope of edid
> length variables that are not otherwise used in imx-ldb and
> parallel-display, fix a memory leak in the parallel-display bind error
> path, and drop an extraneous type qualifier from of_get_tve_mode().
> 
> ----------------------------------------------------------------
> Arnd Bergmann (1):
>       drm/imx: tve remove extraneous type qualifier
> 
> Marco Felsch (1):
>       drm/imx: parallel-display: fix edid memory leak
> 
> Philipp Zabel (9):
>       gpu: ipu-v3: remove unused functions
>       drm/imx: dw_hdmi-imx: use imx_drm_encoder_parse_of
>       drm/imx: imx-tve: use regmap fast_io spinlock
>       drm/imx: imx-tve: remove redundant enable tracking
>       drm/imx: drop explicit drm_mode_config_cleanup
>       drm/imx: dw_hdmi-imx: remove empty encoder_disable callback
>       drm/imx: imx-ldb: reduce scope of edid_len
>       drm/imx: parallel-display: remove unused function enc_to_imxpd()
>       drm/imx: parallel-display: reduce scope of edid_len
> 
>  drivers/gpu/drm/imx/dw_hdmi-imx.c      | 17 ++-------
>  drivers/gpu/drm/imx/imx-drm-core.c     | 10 ++---
>  drivers/gpu/drm/imx/imx-ldb.c          | 10 ++---
>  drivers/gpu/drm/imx/imx-tve.c          | 40 +++-----------------
>  drivers/gpu/drm/imx/parallel-display.c | 20 ++--------
>  drivers/gpu/ipu-v3/ipu-common.c        | 67 ----------------------------------
>  include/video/imx-ipu-v3.h             |  3 --
>  7 files changed, 21 insertions(+), 146 deletions(-)

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
