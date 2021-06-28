Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 564173B61B4
	for <lists+dri-devel@lfdr.de>; Mon, 28 Jun 2021 16:37:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0708789CA1;
	Mon, 28 Jun 2021 14:37:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oo1-xc32.google.com (mail-oo1-xc32.google.com
 [IPv6:2607:f8b0:4864:20::c32])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B57CF89CA1
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Jun 2021 14:37:18 +0000 (UTC)
Received: by mail-oo1-xc32.google.com with SMTP id
 v3-20020a4ac9030000b029024c9d0bff49so886016ooq.0
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Jun 2021 07:37:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=V/saHbRlyOy5ddJuZOY9EHpBakgA7dAfHWaeEThMt6A=;
 b=h/EzmTXiakdw18lflKTMGoyTqhb7BbYy5aWheTjljmzLSCxfZeuhFORgkFlXmrfyKR
 D1HKSOQlOMi37w1J44+TDVqChS827up+ez7wvwE2C09swqywP5eEdrGbvjGwfTbJAsup
 aZQNGpmiVVKbIFp4ZkgvfxqK0uO1904Mqqdl4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=V/saHbRlyOy5ddJuZOY9EHpBakgA7dAfHWaeEThMt6A=;
 b=GQ+5k95yDZNeL8s0iMvhnXhMCEjxmMeSp/cqAxwB5LY5dTpMNrwuE3H+6eOhnxzuzO
 pXzKFAFcS4U26ldrOUnJRe/ihi9W4DBBOA/VKgxTjI/NtLZJo5MTDrAXO82MiqFVCq9l
 BtESuw6yRWLiiAIH7tGNv69MpxkNMUtBdr47yUmwW3HUzxE8YB9HsOGd7HlsGv2jtO5r
 qwazmD9mW5TDWVij1ohsQMvMWJBJyWhO9kFDFkLUxncNFw4L11eOQUlYVNP9roT5l26o
 zAuOPbx8aeToMWzbvDgpEJ6pmUwiUAwsi+79TJf4YV3h45lKV6cftuoFbapo5qhlZKCT
 4xPQ==
X-Gm-Message-State: AOAM530EgQzXCkJdU2R9gU2P5Wy7uBrljD1udl95nguEMnRTMZUag9P4
 rMK1B6ExVwTKfCIkdYqvYaISOXrHJDuSESC03zFVqw==
X-Google-Smtp-Source: ABdhPJwkjv7kqc9F9YfPK4DKsl3yXpQr+eWXfMKOw7gKDof92VntbnCTRW1jJRcCVsDIX2fPprSKarbGArGf9wR/7bc=
X-Received: by 2002:a4a:9b99:: with SMTP id x25mr19638473ooj.85.1624891038030; 
 Mon, 28 Jun 2021 07:37:18 -0700 (PDT)
MIME-Version: 1.0
References: <20210513110002.3641705-1-tvrtko.ursulin@linux.intel.com>
 <CADnq5_NEg4s2AWBTkjW7NXoBe+WB=qQUHCMPP6DcpGSLbBF-rg@mail.gmail.com>
 <c6c61179-5b4b-4e0b-6e57-ec4839ca3268@linux.intel.com>
 <CADnq5_N03pz6GmptzhRnCRQH=qkd4eWuAbuUysHp-A9NZHQMHg@mail.gmail.com>
 <BYAPR12MB2840AA68BCAEBD9279C6184FF4509@BYAPR12MB2840.namprd12.prod.outlook.com>
 <39ccc2ef-05d1-d9f0-0639-ea86bef58b80@amd.com>
 <7d6d09fe-ec85-6aaf-9834-37a49ec7d6c5@linux.intel.com>
 <9144f63b-953d-2019-742d-6553e09f5b40@amd.com>
 <22e7d6ea-f2dd-26da-f264-b17aad25af95@linux.intel.com>
 <b2203d34-2de3-7c58-de2f-bf6fafc3f67c@amd.com>
 <6cf2f14a-6a16-5ea3-d307-004faad4cc79@linux.intel.com>
 <a2b03603-eb3e-7bef-a799-c15cfb1a8e0b@amd.com>
 <52dc8610-de57-a5a8-9a1d-0efebb29b881@linux.intel.com>
In-Reply-To: <52dc8610-de57-a5a8-9a1d-0efebb29b881@linux.intel.com>
From: Daniel Vetter <daniel@ffwll.ch>
Date: Mon, 28 Jun 2021 16:37:06 +0200
Message-ID: <CAKMK7uEiYdfQUo3gEyQ575fXVT9VhBhEB_i5y4O9HVaDW+60ww@mail.gmail.com>
Subject: Re: [PATCH 0/7] Per client engine busyness
To: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
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
Cc: Intel Graphics Development <Intel-gfx@lists.freedesktop.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>, "Nieto,
 David M" <David.Nieto@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Jun 28, 2021 at 12:18 PM Tvrtko Ursulin
<tvrtko.ursulin@linux.intel.com> wrote:
>
>
>
> On 14/05/2021 16:10, Christian K=C3=B6nig wrote:
> > Am 14.05.21 um 17:03 schrieb Tvrtko Ursulin:
> >>
> >> On 14/05/2021 15:56, Christian K=C3=B6nig wrote:
> >>> Am 14.05.21 um 16:47 schrieb Tvrtko Ursulin:
> >>>>
> >>>> On 14/05/2021 14:53, Christian K=C3=B6nig wrote:
> >>>>>>
> >>>>>> David also said that you considered sysfs but were wary of
> >>>>>> exposing process info in there. To clarify, my patch is not
> >>>>>> exposing sysfs entry per process, but one per open drm fd.
> >>>>>>
> >>>>>
> >>>>> Yes, we discussed this as well, but then rejected the approach.
> >>>>>
> >>>>> To have useful information related to the open drm fd you need to
> >>>>> related that to process(es) which have that file descriptor open.
> >>>>> Just tracking who opened it first like DRM does is pretty useless
> >>>>> on modern systems.
> >>>>
> >>>> We do update the pid/name for fds passed over unix sockets.
> >>>
> >>> Well I just double checked and that is not correct.
> >>>
> >>> Could be that i915 has some special code for that, but on my laptop I
> >>> only see the X server under the "clients" debugfs file.
> >>
> >> Yes we have special code in i915 for this. Part of this series we are
> >> discussing here.
> >
> > Ah, yeah you should mention that. Could we please separate that into
> > common code instead? Cause I really see that as a bug in the current
> > handling independent of the discussion here.
>
> What we do in i915 is update the pid and name when a task different to
> the one which opened the fd does a GEM context create ioctl.
>
> Moving that to DRM core would be along the lines of doing the same check
> and update on every ioctl. Maybe allow the update to be one time only if
> that would work. Would this be desirable and acceptable? If so I can
> definitely sketch it out.

If we go with fdinfo for these it becomes clear who all owns the file,
since it's then a per-process thing. Not sure how much smarts we
should have for internal debugfs output. Maybe one-shot update on
first driver ioctl (since if you're on render nodes then X does the
drm auth dance, so "first ioctl" is wrong).
-Daniel
--=20
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
