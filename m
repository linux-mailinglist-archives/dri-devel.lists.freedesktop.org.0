Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 53B98244ED1
	for <lists+dri-devel@lfdr.de>; Fri, 14 Aug 2020 21:24:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8EEBD6EC07;
	Fri, 14 Aug 2020 19:24:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com
 [IPv6:2a00:1450:4864:20::342])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 33E866EC07;
 Fri, 14 Aug 2020 19:24:30 +0000 (UTC)
Received: by mail-wm1-x342.google.com with SMTP id 9so8336146wmj.5;
 Fri, 14 Aug 2020 12:24:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ga1a0kShRoix0dicyeqJTAZ5Vstr5usAbbMWnSlMtEg=;
 b=b2hiuBKZBvX7i8eE6QS0W5kcNje0Qw5NbPws3k9bVo59jD2PfyK/5ngyy+ZDQg83C+
 aR498jIC+3ynQzgngx4AwY9ql6RQsE0B0gc0c+VXiv0D7fMp5qv8qcHODwqrvvg5dYPU
 EifC4v1DeGfgUGoes2sCLHXrBsSXlnb3Lr6dOLuy8GVny97SYal/XsT7GLe9KRSlrq+a
 0zTK/xnPinpbYqqjf55KicuN7m2Vy9AbwboxT1ifOxM75K9spQbTxr8Hkpax80UEsGKz
 qG61Bb7wm0u+ebkWzBMprgq+NaFSMhOUSH0qs6sIGR2PT/UqzZjPpDxvv5FbgeaJCArN
 68sA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ga1a0kShRoix0dicyeqJTAZ5Vstr5usAbbMWnSlMtEg=;
 b=olvNbQuXDC9mBa+VPDG73GushmcUeSFMayi8qnAsTT+flpgiueIgBM3IOA9w4ZyKWt
 rOBlFXcHEo8uAFtVRkQpp00z9tlB+hpo5VI1PRBa/vMH4lfd+RAVCRcz1GhbuNEuyXMe
 SMjs7jq7aYtcJxJymcn0DwmKWRcR+pnhe9I8TOkuTtq3WVHZLJ59oCfXUKl6vqtzAsXg
 Xz8mJk6iCqLEsTHMHQCRuJBbSxUaj9UsuKCOCcG3XjIqXZiOvXd8dNG74XgQd+7aOogV
 MA2bVAUpdCgX2BWo4d5nxT5cadYaCnWvjTeDKbqQb8A6PAajYHdW0mmjfhe+8O34hnIs
 7kCg==
X-Gm-Message-State: AOAM53180FCcApcIIc3Ri+/IaGo7p54LZahJFv9i6a39k1lzGA2nFibs
 NNeeoRkzcHfIXXrbSpchZkl0kVX+1sbmpUdpnck=
X-Google-Smtp-Source: ABdhPJwoRvaG3uEeO1yrZ+rlKki8OzCeRCJsEIeiYTom+JY8S+OtR7FiTACN53WAoB0dNtWn+6je3wKxBxWYpxbsseQ=
X-Received: by 2002:a1c:f70a:: with SMTP id v10mr3744589wmh.39.1597433068805; 
 Fri, 14 Aug 2020 12:24:28 -0700 (PDT)
MIME-Version: 1.0
References: <20200814191401.25606-1-luben.tuikov@amd.com>
In-Reply-To: <20200814191401.25606-1-luben.tuikov@amd.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Fri, 14 Aug 2020 15:24:17 -0400
Message-ID: <CADnq5_N5V4L8tmAgsVM1NPuH4huCK+sh+S3NP2Z8QYg4NDy_0w@mail.gmail.com>
Subject: Re: [PATCH 0/2] Fixes to drm_sched_priority
To: Luben Tuikov <luben.tuikov@amd.com>, 
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>
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
Cc: amd-gfx list <amd-gfx@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

+ dri-devel

On Fri, Aug 14, 2020 at 3:14 PM Luben Tuikov <luben.tuikov@amd.com> wrote:
>
> Some fixes to enum drm_sched_priority which I'd wanted to do
> since last year.
>
> For instance, renaming MAX to COUNT, as usually a maximum value
> is a value which is part of the set of values, (e.g. a maxima of
> a function), and thus assignable, whereby a count is the size of
> a set (the enumeration in this case). It also makes it clearer
> when used to define size of arrays.
>
> Removing some redundant naming and perhaps better naming could be
> had for PRIORITY_SW and PRIORITY_HW, maybe "moderate" and
> "temperate" respectively. However, I've left them as "sw" and
> "hw".
>
> Also remove a macro which was used in only a single place.
>
> In the second patch, remove priority INVALID, since it is not a
> priority, e.g. a scheduler cannot be assigned and run at priority
> "invalid". It seems to be more of a directive, a status, of user
> input, and as such has no place in the enumeration of priority
> levels.
>
> Something else I'd like to do, is to eliminate priority
> enumeration "UNSET", since it is not really a priority level,
> but  a directive, instructing the code to "reset the priority
> of a context to the initial priority".
>
> At the moment, this functionality is overloaded to this priority
> value, and it should be an IOCTL op, as opposed to a priority value.
>
> Tested on my desktop system, which is running a kernel with
> this patch applied.
>
> Luben Tuikov (2):
>   drm/scheduler: Scheduler priority fixes
>   drm/scheduler: Remove priority macro INVALID
>
>  drivers/gpu/drm/amd/amdgpu/amdgpu_ctx.c   | 27 +++++-----
>  drivers/gpu/drm/amd/amdgpu/amdgpu_job.c   |  2 +-
>  drivers/gpu/drm/amd/amdgpu/amdgpu_ring.c  |  2 +-
>  drivers/gpu/drm/amd/amdgpu/amdgpu_ring.h  |  2 +-
>  drivers/gpu/drm/amd/amdgpu/amdgpu_sched.c | 62 +++++++++++++++--------
>  drivers/gpu/drm/amd/amdgpu/amdgpu_sched.h |  3 +-
>  drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c   |  2 +-
>  drivers/gpu/drm/scheduler/sched_main.c    |  8 +--
>  include/drm/gpu_scheduler.h               | 16 +++---
>  9 files changed, 73 insertions(+), 51 deletions(-)
>
> --
> 2.28.0.215.g878e727637
>
> _______________________________________________
> amd-gfx mailing list
> amd-gfx@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/amd-gfx
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
