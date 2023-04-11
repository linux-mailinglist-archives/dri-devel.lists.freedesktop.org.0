Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 92E756DE166
	for <lists+dri-devel@lfdr.de>; Tue, 11 Apr 2023 18:47:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DC36D10E5C1;
	Tue, 11 Apr 2023 16:47:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x32c.google.com (mail-ot1-x32c.google.com
 [IPv6:2607:f8b0:4864:20::32c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 97A3B10E5C1;
 Tue, 11 Apr 2023 16:47:46 +0000 (UTC)
Received: by mail-ot1-x32c.google.com with SMTP id
 c2-20020a056830348200b006a3ab0ba8a2so8520448otu.1; 
 Tue, 11 Apr 2023 09:47:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1681231665;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=OV/uuQZ41eH3AQ7KVpUu+AQP65VPVOJDNUkIUJlBcW8=;
 b=ALQTVoEl7wQY9jAJxk0yqxFfjaxMFaPOmj6cSreJmDXg/u1zQR8Rc3xaHDUE5ad62Z
 1DZYDLrcYgg+vGsbWtCR9YnkL1shWqQlphCoEndFk0WqgHzB5KHhM5NMJi6ybli25XLH
 /PqGEq9YSe2ZHUdh9itXmvtkMFUIbJQOAWYnMghcQOHuj9eFTo9v7AznbmToeSj0RA3Y
 6PsxHTQ2B72r58m0Diz6P0JkhRFGVJ1LSu3ZnhIfllMQwM3ra3rZxIoThOD7I1Qpb7TD
 iIOCe2QB9toNJUAns/FAFQarLo9QSqnCsYkpXfG0+nqaiTHI5WdH2It0a/OWGyFPJGtG
 xH5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1681231665;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=OV/uuQZ41eH3AQ7KVpUu+AQP65VPVOJDNUkIUJlBcW8=;
 b=Ik+2eHgMFCZLrqJbR8gfJo7JXkzZdOK+MHiQPWMZW52X4Lyiso14LhCSrBeQ5E5Ri1
 s38YEwg30txM0/J1vr7pWUgll0a/pB8yly0KEGkzYMxJhn437tkn3YN/ztSr/sBPt8E1
 JuNr0hmtDZnPksGPGqX8WLxFxuphVwmbkLbCiGwXWg15/qtvh47niag1Gs1hP12R4eHn
 J7GZ8LIPV3AThLlja+L4SsDynlxsUnoJkcWQWOJEAAlADX/T/sD/KdAxuCJz6CCCW2nR
 EdZkyTUpYxn3He+UygkwQk+uExRxb8PZVN4vq9uvUuKLj3gEOAcAh5HXOtzFqfVXMiBx
 VUYg==
X-Gm-Message-State: AAQBX9d3ANLxHUn8YIW9Bq7+j3LXrSuY9vmWKGsh1fmVQ5bJ69EQIPJo
 oWFHsR1O3rZXBQds4ASlqKogCX37/VHBZVip9Kialq/R
X-Google-Smtp-Source: AKy350Zp/HByftvsIEBW+tEKszX5mY603bGDJCqGixLoxpUthI8l72LdtmsEHqerAO8/qJT918CEfStcjHdTFsPjnUU=
X-Received: by 2002:a05:6830:1b62:b0:6a4:17b6:8767 with SMTP id
 d2-20020a0568301b6200b006a417b68767mr12354ote.7.1681231663656; Tue, 11 Apr
 2023 09:47:43 -0700 (PDT)
MIME-Version: 1.0
References: <20230410210608.1873968-1-robdclark@gmail.com>
In-Reply-To: <20230410210608.1873968-1-robdclark@gmail.com>
From: Rob Clark <robdclark@gmail.com>
Date: Tue, 11 Apr 2023 09:47:32 -0700
Message-ID: <CAF6AEGvs4XMggPMthiJ89SiaUj3k+nY95OhxLZ5cD-01XPco4Q@mail.gmail.com>
Subject: Re: [PATCH v2 0/2] drm: fdinfo memory stats
To: dri-devel@lists.freedesktop.org
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
Cc: Rob Clark <robdclark@chromium.org>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
 linux-arm-msm@vger.kernel.org, Emil Velikov <emil.l.velikov@gmail.com>,
 Christopher Healy <healych@amazon.com>,
 open list <linux-kernel@vger.kernel.org>, Sean Paul <sean@poorly.run>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Apr 10, 2023 at 2:06=E2=80=AFPM Rob Clark <robdclark@gmail.com> wro=
te:
>
> From: Rob Clark <robdclark@chromium.org>
>
> Similar motivation to other similar recent attempt[1].  But with an
> attempt to have some shared code for this.  As well as documentation.
>
> It is probably a bit UMA-centric, I guess devices with VRAM might want
> some placement stats as well.  But this seems like a reasonable start.
>
> Basic gputop support: https://patchwork.freedesktop.org/series/116236/
> And already nvtop support: https://github.com/Syllo/nvtop/pull/204

On a related topic, I'm wondering if it would make sense to report
some more global things (temp, freq, etc) via fdinfo?  Some of this,
tools like nvtop could get by trawling sysfs or other driver specific
ways.  But maybe it makes sense to have these sort of things reported
in a standardized way (even though they aren't really per-drm_file)

BR,
-R


> [1] https://patchwork.freedesktop.org/series/112397/
>
> Rob Clark (2):
>   drm: Add fdinfo memory stats
>   drm/msm: Add memory stats to fdinfo
>
>  Documentation/gpu/drm-usage-stats.rst | 21 +++++++
>  drivers/gpu/drm/drm_file.c            | 79 +++++++++++++++++++++++++++
>  drivers/gpu/drm/msm/msm_drv.c         | 25 ++++++++-
>  drivers/gpu/drm/msm/msm_gpu.c         |  2 -
>  include/drm/drm_file.h                | 10 ++++
>  5 files changed, 134 insertions(+), 3 deletions(-)
>
> --
> 2.39.2
>
