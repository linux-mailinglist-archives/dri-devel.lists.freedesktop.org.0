Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 88CE41E21B0
	for <lists+dri-devel@lfdr.de>; Tue, 26 May 2020 14:14:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 55FCC6E110;
	Tue, 26 May 2020 12:14:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x344.google.com (mail-ot1-x344.google.com
 [IPv6:2607:f8b0:4864:20::344])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 71EFC6E110
 for <dri-devel@lists.freedesktop.org>; Tue, 26 May 2020 12:14:49 +0000 (UTC)
Received: by mail-ot1-x344.google.com with SMTP id z3so16033631otp.9
 for <dri-devel@lists.freedesktop.org>; Tue, 26 May 2020 05:14:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=l7AiaWm8LdMWzrhlkIXGVmGNJbITJWsCvDUaXyZfuOg=;
 b=Xuuvx9uL7EpvmHtjnFoQUJqCGPkPpgcg5OwnJDO/MgLH6Frcg2RkoLsg3dkt/brOdA
 cJudJPCGeAGvWCyQ5X7f/wyY7Q8Wc7TPDJVBlz0EBvHiesLhvpjxAziS0b/CV4wo4fFZ
 LLNpxOZbFMOgaLEtsS5pO1ZO92Vd+LbVebdT4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=l7AiaWm8LdMWzrhlkIXGVmGNJbITJWsCvDUaXyZfuOg=;
 b=Cx6XFRikpRmLsWx0lNDBMGsRk0MpiINVNYbFKB7ycWvl3XOy5tHOyWzcQE1BoGPiic
 vJER7+1JcQRSQT4RqV8ElRBg7O3ZqQHsmBUUtLM/qS8duPYzVelEKoxetAZv5mIuVToQ
 45iPOW8M9/KNH9o5+IygKf4cYV6fOly3BlGS5PXyA1xOULYhX0rjVz2+sb7DojrzBKnK
 anpIaFOUUwJSX52+nJmsw2zeEn85jFUTCVYuZsPyaX4mLlpNXwH0svvs+4k5ZIaMEGof
 RcPEFrMlAxrxddIOfnDknXQ8tQqfYqdxIfsqfWNxcHiiqn7FGSKZR2Ql0G84iwy+WhZy
 l/yw==
X-Gm-Message-State: AOAM5302uymZYulH6DylpLqz24OexJh/vip6zi1urljoLfrVd98opBTC
 PI2kLE6ZJhyN790aOtuZbcMyRN/JO9aVp/LUq25ljQ==
X-Google-Smtp-Source: ABdhPJw8beHLtUQNjeei+NKIHjWJ52Ijpe1VNS8iRn4C+zZahBRyVQpXCjG9bwHGq2w0TAw1Ehec+3kY7crtJkOpFXM=
X-Received: by 2002:a9d:1d1:: with SMTP id e75mr561780ote.303.1590495288692;
 Tue, 26 May 2020 05:14:48 -0700 (PDT)
MIME-Version: 1.0
References: <CAL3Fm-JJbjCby5_HojTf9dWKurw+CECN7LDqamtf53c9L-0jtw@mail.gmail.com>
 <20200526103921.0817ee0b@eldfell.localdomain>
In-Reply-To: <20200526103921.0817ee0b@eldfell.localdomain>
From: Daniel Vetter <daniel@ffwll.ch>
Date: Tue, 26 May 2020 14:14:37 +0200
Message-ID: <CAKMK7uHG1P9hwT1CBqWUfL6sBwZwyS7q0scXSUuXNiJMmRz-+g@mail.gmail.com>
Subject: Re: Dynamically change enumeration list of DRM enumeration property
To: Pekka Paalanen <ppaalanen@gmail.com>
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
Cc: dri-devel <dri-devel@lists.freedesktop.org>,
 Yogish Kulkarni <yogishkulkarni@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, May 26, 2020 at 9:39 AM Pekka Paalanen <ppaalanen@gmail.com> wrote:
>
> On Tue, 26 May 2020 10:01:23 +0530
> Yogish Kulkarni <yogishkulkarni@gmail.com> wrote:
>
> > Hi,
> >
> > Is it possible to dynamically change enumeration list of  DRM enumeration
> > property ? Motivation behind this question is to understand whether it is
> > possible to create connector enum property (e.g a property which will list
> > supported output encodings -  like yuv420, yuv422 etc) whose list of
> > supported enum values could be changed dynamically e.g. based on which sink
> > is connected.
> >
> > I think there is existing EDID connector property whose value changes based
> > on connected sink. EDID is a BLOB property, I am trying to understand if
> > this is also possible for ENUM type property. There is
> > "drm_property_replace_blob" to replace blob but I wasn't able to find any
> > API which could replace list of supported enums. Alternatively, would it be
> > good idea to destroy custom enum property created by a driver and create
> > new enum property with new list of supported enums e.g when there is a
> > HOTPLUG event.
>
> Hi,
>
> looking at Weston code, it *might* cope with it. A hotplug event does
> cause Weston to re-discover all properties of a connector. This is
> specific to connectors only.

Currently the kernel doesn't cope with that. Only objects which can be
added/removed are connectors, blobs and fbs (iow the refcounted ones).
Adding/removing properties isn't supported, nor is adding/removing
which properties are attached to which object while that object is
life.

Also I think the uapi risk for this is way too big, see my other reply
for what we've done in the past for stuff like this.
-Daniel

> The race exists though: userspace might be poking at KMS after you
> changed the property in the kernel but before userspace handles the
> hotplug event. You'd have to check that does not cause regressions. I
> guess for a completely new property, the risk seems low, as userspace
> does not know to poke at it (risk of using outdated property or value
> IDs causing unexpected atomic commit failure). Also I'm not aware of
> any KMS program that would yet attempt blind KMS state save & restore
> to sanitize the KMS state after dropping and re-gaining DRM master.
>
> You'd have to check all other KMS using programs too: every Wayland
> compositor, Xorg, DRM Vulkan WSI(?), ...
>
>
> Thanks,
> pq
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel



-- 
Daniel Vetter
Software Engineer, Intel Corporation
+41 (0) 79 365 57 48 - http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
