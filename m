Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 12AD77737BB
	for <lists+dri-devel@lfdr.de>; Tue,  8 Aug 2023 05:30:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B4B5210E39A;
	Tue,  8 Aug 2023 03:30:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x52b.google.com (mail-pg1-x52b.google.com
 [IPv6:2607:f8b0:4864:20::52b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2A0CC10E39A
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Aug 2023 03:30:41 +0000 (UTC)
Received: by mail-pg1-x52b.google.com with SMTP id
 41be03b00d2f7-563de62f861so3053388a12.1
 for <dri-devel@lists.freedesktop.org>; Mon, 07 Aug 2023 20:30:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1691465440; x=1692070240;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=QRbjstWWvF9ALXdKHc6bElEhDUdhTPBszU3JNhEDHw4=;
 b=QlDc7fmtTbeW1gIG4QrPPK93pMUagI8ZXdc+dA7Z4smOrZdzmXzccAFEM0ogZTPhdo
 RNklm+S7vgxuWT+eM/u/b5EPkdbktPK7aYbB6CVq18LmtQHOVSfLOJbKMI1EGBh8FkUk
 oP+GiMwr+FTDHRjtoc2Qj0/1sGrSmCxgmNptQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1691465440; x=1692070240;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=QRbjstWWvF9ALXdKHc6bElEhDUdhTPBszU3JNhEDHw4=;
 b=PXJvLCaLtm2se4TEs1V5SbGCgFw9mzcwwY0JiDkTb3K0WGQE1/cUrBHIq6UHJORhnS
 z2EtvfzR2uIZsQ4m2V09+yLbi9Z4rVu9k1aAzI6lyPhAG/LwkKszvpUtBFWZLOFx3/gp
 iEHfBGboWnX5zEmUJskDs7pA9XhDrZ5zEVzKiUyIeKh37zeBZXyhMaQDE9EG5UPUE9O2
 wwJ9O0t89EWCnd1UAx0QZ/WoLRB2u2+qRYN7cPgEa6EgARboyEZL9nFgpK7FZ/CyXEsu
 +srgb737izFLU6FN/hoJEcw3gDjHHyshFcVe1dWpHnVIoZUQG8//2zo97Ab036xDWx7z
 4BbA==
X-Gm-Message-State: AOJu0Yx8CxIdhYeLwJepcItFnxfbDJRgPCgjvBZpN4/IYaDr78736Wbe
 Fsj3e1E8i93iKBRxxFO+Vi23hj/gMW3SA5A/oBifeGXy
X-Google-Smtp-Source: AGHT+IHRxTzQi6HhDGd11DfLGBFypqQcbJAjPvxqNzneXv9oLIFu/sabDmagBTAeqVRKTouTthNhgA==
X-Received: by 2002:a05:6a20:3d1b:b0:13b:7757:d5b6 with SMTP id
 y27-20020a056a203d1b00b0013b7757d5b6mr13522271pzi.57.1691465440458; 
 Mon, 07 Aug 2023 20:30:40 -0700 (PDT)
Received: from ?IPV6:2401:fa00:8f:203:d5c2:4727:df7c:14d1?
 ([2401:fa00:8f:203:d5c2:4727:df7c:14d1])
 by smtp.gmail.com with ESMTPSA id
 e8-20020a170902744800b001b8b1f6619asm7710708plt.75.2023.08.07.20.30.39
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 07 Aug 2023 20:30:40 -0700 (PDT)
Message-ID: <17326fa0-b0f9-1a6b-e9c5-d7801b383f04@chromium.org>
Date: Tue, 8 Aug 2023 12:30:38 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v2 0/6] Adds support for ConfigFS to VKMS!
Content-Language: en-US
To: dri-devel@lists.freedesktop.org
References: <20230623222353.97283-1-jshargo@chromium.org>
From: Brandon Ross Pollack <brpol@chromium.org>
In-Reply-To: <20230623222353.97283-1-jshargo@chromium.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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

Some of these comments have been sitting for a while.  Would it be ok if 
yixie@chromium.org and myself picked these up and did an iteration so we 
could also get 
https://patchwork.kernel.org/project/dri-devel/patch/20230711013148.3155572-1-brpol@chromium.org/ 
submitted?  These will enable a lot of virtual multi display testing in 
linux! :)

On 6/24/23 07:23, Jim Shargo wrote:
> Intro
> =====
>
> At long last, we're back!
>
> This patchset adds basic ConfigFS support to VKMS, allowing users to
> build new DRM devices with user-defined DRM objects and object
> relationships by creating, writing, and symlinking files.
>
> Usageubmitted
> =====
>
> After installing these patches, you can create a VKMS device with two
> displays and a movable overlay like so (this is documented in the
> patches):
>
>    $ modprobe vkms enable_overlay=1 enable_cursor=1 enable_writeback=1
>    $ mkdir -p /config/
>    $ mount -t configfs none /config
>
>    $ export DRM_PLANE_TYPE_PRIMARY=1
>    $ export DRM_PLANE_TYPE_CURSOR=2
>    $ export DRM_PLANE_TYPE_OVERLAY=0
>
>    $ mkdir /config/vkms/test
>
>    $ mkdir /config/vkms/test/planes/primary
>    $ echo $DRM_PLANE_TYPE_PRIMARY > /config/vkms/test/planes/primary/type
>
>    $ mkdir /config/vkms/test/planes/other_primary
>    $ echo $DRM_PLANE_TYPE_PRIMARY > /config/vkms/test/planes/other_primary/type
>
>    $ mkdir /config/vkms/test/planes/cursor
>    $ echo $DRM_PLANE_TYPE_CURSOR > /config/vkms/test/planes/cursor/type
>
>    $ mkdir /config/vkms/test/planes/overlay
>    $ echo $DRM_PLANE_TYPE_OVERLAY > /config/vkms/test/planes/overlay/type
>
>    $ mkdir /config/vkms/test/crtcs/crtc
>    $ mkdir /config/vkms/test/crtcs/crtc_other
>    $ mkdir /config/vkms/test/encoders/encoder
>    $ mkdir /config/vkms/test/connectors/connector
>
>    $ ln -s /config/vkms/test/encoders/encoder /config/vkms/test/connectors/connector/possible_encoders
>    $ ln -s /config/vkms/test/crtcs/crtc /config/vkms/test/encoders/encoder/possible_crtcs/
>    $ ln -s /config/vkms/test/crtcs/crtc /config/vkms/test/planes/primary/possible_crtcs/
>    $ ln -s /config/vkms/test/crtcs/crtc /config/vkms/test/planes/cursor/possible_crtcs/
>    $ ln -s /config/vkms/test/crtcs/crtc /config/vkms/test/planes/overlay/possible_crtcs/
>    $ ln -s /config/vkms/test/crtcs/crtc_other /config/vkms/test/planes/overlay/possible_crtcs/
>    $ ln -s /config/vkms/test/crtcs/crtc_other /config/vkms/test/planes/other_primary/possible_crtcs/
>
>    $ echo 1 > /config/vkms/test/enabled
>
> Changes within core VKMS
> ========================
>
> This introduces a few important changes to the overall structure of
> VKMS:
>
>    - Devices are now memory managed!
>    - Support for multiple CRTCs and other objects has been added
>
> Since v1
> ========
>
>    - Added DRMM memory management to automatically clean up resources
>    - Added a param to disable the default device
>    - Renamed "cards" to "devices" to improve legibility
>    - Added a lock for the configfs setup handler
>    - Moved all the new docs into the relevant .c file
>    - Addressed as many of sean@poorly.run as possible
>
> Testing
> =======
>
>    - New IGT tests (see
>      gitlab.freedesktop.org/jshargo/igt-gpu-tools/-/merge_requests/1)
>    - Existing IGT tests (excluding .*suspend.*, including .*kms_flip.*
>      .*kms_writeback.* .*kms_cursor_crc.*, .*kms_plane.*)
>
> Outro
> =====
>
> I'm excited to share these changes, it's my still my first kernel patch
> and I've been putting a lot of love into these.
>
> Jim Shargo (6):
>    drm/vkms: Back VKMS with DRM memory management instead of static
>      objects
>    drm/vkms: Support multiple DRM objects (crtcs, etc.) per VKMS device
>    drm/vkms: Provide platform data when creating VKMS devices
>    drm/vkms: Add ConfigFS scaffolding to VKMS
>    drm/vkms: Support enabling ConfigFS devices
>    drm/vkms: Add a module param to enable/disable the default device
>
>   Documentation/gpu/vkms.rst            |  17 +-
>   drivers/gpu/drm/Kconfig               |   1 +
>   drivers/gpu/drm/vkms/Makefile         |   1 +
>   drivers/gpu/drm/vkms/vkms_composer.c  |  28 +-
>   drivers/gpu/drm/vkms/vkms_configfs.c  | 657 ++++++++++++++++++++++++++
>   drivers/gpu/drm/vkms/vkms_crtc.c      |  97 ++--
>   drivers/gpu/drm/vkms/vkms_drv.c       | 208 +++++---
>   drivers/gpu/drm/vkms/vkms_drv.h       | 166 +++++--
>   drivers/gpu/drm/vkms/vkms_output.c    | 299 ++++++++++--
>   drivers/gpu/drm/vkms/vkms_plane.c     |  44 +-
>   drivers/gpu/drm/vkms/vkms_writeback.c |  26 +-
>   11 files changed, 1312 insertions(+), 232 deletions(-)
>   create mode 100644 drivers/gpu/drm/vkms/vkms_configfs.c
