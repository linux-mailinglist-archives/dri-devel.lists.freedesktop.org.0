Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 53FF28565C8
	for <lists+dri-devel@lfdr.de>; Thu, 15 Feb 2024 15:21:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0E3FC10E8B1;
	Thu, 15 Feb 2024 14:21:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="MZqFWn/q";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com
 [209.85.216.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5E2C810E8A1;
 Thu, 15 Feb 2024 14:20:58 +0000 (UTC)
Received: by mail-pj1-f53.google.com with SMTP id
 98e67ed59e1d1-296b2e44a3cso704044a91.2; 
 Thu, 15 Feb 2024 06:20:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1708006855; x=1708611655; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=8saq9D0aDE2k6BKx1vz1+kPI1dWkpRnC38SDFbo2hVs=;
 b=MZqFWn/qb2okgIYUN9uwSDcHRtzqGBzhTgdaswQjv91MhaZlltb+Hym9gniQ87AkZz
 MZzYQDxvonnsORUebzZNmZhFyGY3UT66e8ywhEGhCsSXqADxekYahjfGFuji98TiS+9e
 Zv9LA6iZPiIfLUGT9mzV0RiIHZqynUHj2ghgoaUEYr8EPwZ4420gix8MwPp1InjqvkMx
 XBmKlS/aHao81VNUnHA/n4Ig56CKDjb1zjsjj/67iRp6SeS8cqCxlLFMcAmQMfMS86ad
 RFPXmc62IRN/uqy1HdO+E8fMd7rGoPwZqBGWWe0eVON6y7kSNskYta1pT8/iaKCD2JGH
 LZXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708006855; x=1708611655;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=8saq9D0aDE2k6BKx1vz1+kPI1dWkpRnC38SDFbo2hVs=;
 b=bi8IriRQo3e7PJfwN9lu3Q/kOaufiQ8Hg0xG56I/6Abboyu/c41ryf94N1NWcuO0aw
 c1Byr+cNHMALzpkPg/jo2f7+Rpql9hI9+//PUHp+gqPDtU77jDIPQ1lvzrFdUJv316nP
 Lo0DZSKuQ2oRYl70wO43e2+Q2w9Ml/lqUmUv6eDFJi3ckqaA8F1Wrd/ez1szczMG0hdY
 l4NBYjmG+yEy+J4SciCgntqFYnn0TPd6LVCZHLxjwUdXPWRqfDzzLEpWj3Ai97Q5xnHN
 EpUDj2lR2u4EZcXmA4sW1/3i+dIZqdEpUCJsSa7EtHVMZx27dXW7Cr9MH7Bdc3wjOOug
 kX8w==
X-Forwarded-Encrypted: i=1;
 AJvYcCUkkRm8GvdzoPrCAl72293KFd9BNtFGWrSbrBdA9vAFFOY/XKDAVJx3SgkGU/+CGw2iOeLosNF8dmcLx8vKcGceg1AigYSpT9YTiK6eTWusEwidBiiWUJ5dW6IAa5z4+8TN9WQ4yobAX9SFF8uePnkcHmhwi0N2y+7qFXa1JW645+Rf8DwCQXWQzdobTAPVU7r5c0vb5rZ1dIDgLCD2TJDxrCRLeDyTOmpRJpuuryEE
X-Gm-Message-State: AOJu0YyEB1AtSMP8dbaAWa3eJ60Ei6aLVTTwkvtTHxM0B1iyjaIbzJ7T
 mkyrZHCoii6wpkSmSm9k3btM4cfHB9omjsFVIyK7ui1P/k93tcSjlsvS0yeisVclIGOA63x1KlC
 gNqqgv5LCKgbllqgYYE0KCQyM+nZQK5nV
X-Google-Smtp-Source: AGHT+IGi9SFoRSDX1BukAHEbyw99sybx8/9zS92dvONLojpkxJqo0+b3ukoj8BSj8P5amuT5fEUeZhGQaLjIrdqUazQ=
X-Received: by 2002:a17:90a:34c5:b0:28c:fb86:23ce with SMTP id
 m5-20020a17090a34c500b0028cfb8623cemr1703811pjf.44.1708006854542; Thu, 15 Feb
 2024 06:20:54 -0800 (PST)
MIME-Version: 1.0
References: <20240212210428.851952-1-alexander.deucher@amd.com>
 <b883e82e-9042-4656-b152-065ed31a81de@gmail.com>
In-Reply-To: <b883e82e-9042-4656-b152-065ed31a81de@gmail.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Thu, 15 Feb 2024 09:20:42 -0500
Message-ID: <CADnq5_MwEB_=2uySBmiOu3mBcA=uRDvsoA_jT9umHNnwLELWZQ@mail.gmail.com>
Subject: Re: [PATCH 0/6 V4] fdinfo shared stats
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>
Cc: Alex Deucher <alexander.deucher@amd.com>, amd-gfx@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org, 
 intel-xe@lists.freedesktop.org, tvrtko.ursulin@linux.intel.com, 
 daniel@ffwll.ch
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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

On Thu, Feb 15, 2024 at 9:18=E2=80=AFAM Christian K=C3=B6nig
<ckoenig.leichtzumerken@gmail.com> wrote:
>
> Am 12.02.24 um 22:04 schrieb Alex Deucher:
> > We had a request to add shared buffer stats to fdinfo for amdgpu and
> > while implementing that, Christian mentioned that just looking at
> > the GEM handle count doesn't take into account buffers shared with othe=
r
> > subsystems like V4L or RDMA.  Those subsystems don't use GEM, so it
> > doesn't really matter from a GPU top perspective, but it's more
> > correct if you actually want to see shared buffers.
> >
> > After further discussions, add a helper and update all fdinfo
> > implementations to use that helper for consistency.
> >
> > v4: switch drm_gem_object_is_shared_for_memory_stats() to an inline fun=
ction
>
> I'm still not sure if looking at the actual handle count is the right
> approach, but it's certainly better than before.

Well, it's consistent across drivers.

>
> So Reviewed-by: Christian K=C3=B6nig <christian.koenig@amd.com> for the
> entire series.
>
> Should I take this through drm-misc-next?

Yes, please.

Thanks,

Alex

>
> Regards,
> Christian.
>
> >
> > Alex Deucher (6):
> >    Documentation/gpu: Update documentation on drm-shared-*
> >    drm: add drm_gem_object_is_shared_for_memory_stats() helper
> >    drm: update drm_show_memory_stats() for dma-bufs
> >    drm/amdgpu: add shared fdinfo stats
> >    drm/i915: Update shared stats to use the new gem helper
> >    drm/xe: Update shared stats to use the new gem helper
> >
> >   Documentation/gpu/drm-usage-stats.rst      |  2 +-
> >   drivers/gpu/drm/amd/amdgpu/amdgpu_fdinfo.c |  4 ++++
> >   drivers/gpu/drm/amd/amdgpu/amdgpu_object.c | 11 +++++++++++
> >   drivers/gpu/drm/amd/amdgpu/amdgpu_object.h |  6 ++++++
> >   drivers/gpu/drm/drm_file.c                 |  2 +-
> >   drivers/gpu/drm/i915/i915_drm_client.c     |  2 +-
> >   drivers/gpu/drm/xe/xe_drm_client.c         |  2 +-
> >   include/drm/drm_gem.h                      | 13 +++++++++++++
> >   8 files changed, 38 insertions(+), 4 deletions(-)
> >
>
