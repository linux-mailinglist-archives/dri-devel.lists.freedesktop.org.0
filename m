Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 99A846D0BFF
	for <lists+dri-devel@lfdr.de>; Thu, 30 Mar 2023 18:56:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F36F410EF16;
	Thu, 30 Mar 2023 16:56:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [IPv6:2a00:1450:4864:20::32a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4B9E210E42D
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Mar 2023 16:56:17 +0000 (UTC)
Received: by mail-wm1-x32a.google.com with SMTP id
 u11-20020a05600c19cb00b003edcc414997so12234192wmq.3
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Mar 2023 09:56:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1680195376; x=1682787376;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=rSWBz3mIBXBdxw6TcqTLatMi79mw1Y62Q64fcwwg5XQ=;
 b=gUhdOPd+Up9qPAdQUYDa8lvbClM59gdqiYAopfZpomdemOlRmBp0G8LVud1yU4blJO
 q6F8CoPwbjXxsTCLt6YRDgxoXLTI3wr23Jyf03ben6fb2JGQHZRO86B+0bAdLB+p0ZMd
 McLwYmfe+oy6rqzo9UCBUDwrg4WcKmyqqSsxg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680195376; x=1682787376;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=rSWBz3mIBXBdxw6TcqTLatMi79mw1Y62Q64fcwwg5XQ=;
 b=Goomo1uV3Mhxaqi5tIQFhXhkxwafJX3D0bcXDVrlLI3vCE62GJvHmemRt0oh21NUpj
 0Ltqmm0hFJIM8qHiZFU+eU8yS62Tw+vjJZaFgi4PV72VidFddJUz2kROwztv6/Rv4Bbx
 7w7Ty5B6yTCJkcdlYgqe4G8q6QJ4xqBvc1L7HHreNCBY+DarUthzbj5OZl5HScDktsYs
 QYKjTOfnmg+53l2XSSGwq4kabJ4rjQDMb9a7H3rjw3QXXu9KvXClxdONFH2eTnyaL6r+
 BNSGgkf0pUviJ3lo08uZUfnC4lQPikx5ez26kee0fEK7BjLTNQwj2Ofbx6y1jlUwT7Zu
 kyYA==
X-Gm-Message-State: AAQBX9ecaXiGtpaRTCUoifCu9slxa8xzxEl2NrQf6J+vot7miMNP+/em
 ioYZl4UQRGnLtRSE5L/3OI4DxQ==
X-Google-Smtp-Source: AKy350a0GUu3C0dSw3paeLQHDiulOYdP58SAJNcFfM1Hzo2BSLl88mMtdmXrVa72+MbPIRw0DbxW1g==
X-Received: by 2002:a05:600c:1550:b0:3ed:d2ae:9adb with SMTP id
 f16-20020a05600c155000b003edd2ae9adbmr2505251wmg.0.1680195375828; 
 Thu, 30 Mar 2023 09:56:15 -0700 (PDT)
Received: from phenom.ffwll.local (212-51-149-33.fiber7.init7.net.
 [212.51.149.33]) by smtp.gmail.com with ESMTPSA id
 k4-20020a05600c1c8400b003ee610d1ce9sm7005666wms.34.2023.03.30.09.56.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 30 Mar 2023 09:56:15 -0700 (PDT)
Date: Thu, 30 Mar 2023 18:56:13 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Alex Deucher <alexander.deucher@amd.com>
Subject: Re: [pull] amdgpu drm-fixes-6.3
Message-ID: <ZCW/LWgWX7+uBUuc@phenom.ffwll.local>
References: <20230329220059.7622-1-alexander.deucher@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230329220059.7622-1-alexander.deucher@amd.com>
X-Operating-System: Linux phenom 6.1.0-6-amd64 
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
Cc: daniel.vetter@ffwll.ch, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Mar 29, 2023 at 06:00:59PM -0400, Alex Deucher wrote:
> Hi Dave, Daniel,
> 
> Fixes for 6.3.
> 
> The following changes since commit 197b6b60ae7bc51dd0814953c562833143b292aa:
> 
>   Linux 6.3-rc4 (2023-03-26 14:40:20 -0700)
> 
> are available in the Git repository at:
> 
>   https://gitlab.freedesktop.org/agd5f/linux.git tags/amd-drm-fixes-6.3-2023-03-29
> 
> for you to fetch changes up to 68dc1846c3a44d5e633be145c169ce2fd5420695:
> 
>   drm/amd/display: Take FEC Overhead into Timeslot Calculation (2023-03-29 17:21:06 -0400)

Pulled, thanks

> 
> ----------------------------------------------------------------
> amd-drm-fixes-6.3-2023-03-29:
> 
> amdgpu:
> - Two DP MST fixes
> 
> ----------------------------------------------------------------
> Fangzhi Zuo (2):
>       drm/amd/display: Add DSC Support for Synaptics Cascaded MST Hub
>       drm/amd/display: Take FEC Overhead into Timeslot Calculation
> 
>  .../amd/display/amdgpu_dm/amdgpu_dm_mst_types.c    | 51 ++++++++++++++++++----
>  .../amd/display/amdgpu_dm/amdgpu_dm_mst_types.h    | 15 +++++++
>  2 files changed, 58 insertions(+), 8 deletions(-)

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
