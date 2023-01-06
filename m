Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 52348661027
	for <lists+dri-devel@lfdr.de>; Sat,  7 Jan 2023 16:59:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 084CE10E2FA;
	Sat,  7 Jan 2023 15:59:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-x31.google.com (mail-oa1-x31.google.com
 [IPv6:2001:4860:4864:20::31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9370310E179
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Jan 2023 23:19:59 +0000 (UTC)
Received: by mail-oa1-x31.google.com with SMTP id
 586e51a60fabf-14455716674so3242922fac.7
 for <dri-devel@lists.freedesktop.org>; Fri, 06 Jan 2023 15:19:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=xrkX5xkEIRPtCscm6csPTufu9CiZDK4zYthOrxMdi9s=;
 b=IzKCcfOm5QxzTMADdbbxl8ayD9YBk2GZVUm8qQthuVSfBUuLDERrkPUAc3G7/5B5pf
 6s97IhewUNsaMx6D+l2U42aZ3Ob5zb6eZf15FrV1p2cRZXalO1Nmx6Wrw3IbZl/N6Yp1
 9RtxJNBYm6ONbrWIYTitsYd5DycKUVijDr8k/VGOMV/fOR7pbFFRuz5H9uQ/H55IJdbb
 ninmemoxebDxWJKadUuYAG1Z4cf9Ht/v2q6kAfX6oRao8tNZr9BNLnZtL1UffU+VphfT
 pUHEecfDrXvo1qYVJb98uOFzM8TlIuL7YPpFoldTBfOGDxSOWZ200BT8piIrnXPVcivx
 KKpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=xrkX5xkEIRPtCscm6csPTufu9CiZDK4zYthOrxMdi9s=;
 b=GryX+qNbSGXNDG4WwDRvz+WceWb164vyey3cKuGnXyA4WnYUHigKf1Dx5sGQtUS1LY
 GLEjj6y0MixpZc2e8Uh4TTuONQR8YhmdCcbYj7DF9GiYFgfyRyGMSOQWlfLtpZWbojqr
 KcmDSUYU8zTXtVgccwiWqNuuIJ6qBDkshYICQbPwv+wFIhskCZ6SbiVKc2b42INdFdpb
 sHmfnxk5Y4OHm63Jodq5GR5ZaCYO8SqcESutDLLOqy89FLmKg90aZgUeGj1qTKJHTyJN
 B4B64GYZ/8pZEOIPFZiUywoEX35d4Zj5uDxdqR12HY6bVD6Dm/pbkObQBXcZzc8a9Q35
 yCPA==
X-Gm-Message-State: AFqh2kqA2mUzVgQkDF5inId9Oh+faJm9t0lfJ7a1ILfckC7sSXLMFoCT
 OB9WDDr/JmfJLSF7Cqqyp6q8jB+HL/bHi4A8h7M=
X-Google-Smtp-Source: AMrXdXs2YfOVRGfvirBoBH2dILSBsh8py8ufVw8s7A2EukCt7u3cQI/2MK45GFXF4VvUSMq3w5jrtYaepa7teCmjX7Y=
X-Received: by 2002:a05:6870:1706:b0:144:dffd:8302 with SMTP id
 h6-20020a056870170600b00144dffd8302mr4600339oae.146.1673047198723; Fri, 06
 Jan 2023 15:19:58 -0800 (PST)
MIME-Version: 1.0
References: <2711de96-fcbe-5611-657a-ab29becd2ff6@gmx.de>
 <CAKMK7uEOX5n64cjzMt9GRQaS13HFPFyOeqdrkmzc035U5_T8tg@mail.gmail.com>
 <CAKMK7uE7CAXO50JPQ6ziQGGehqfDK2UanBQbfLdUH2RwrwXUvw@mail.gmail.com>
 <CAO2zrtYDcOfvxpG6wPghPnWZVks+NL6N9VaynsBVoX7nHBcxuw@mail.gmail.com>
 <Y7hvhtHeivfsnBtE@phenom.ffwll.local>
 <CAO2zrtb9H=OWPbrgmqTxQnHqETt-P4K6AxiwdtN7guxUYL2NCw@mail.gmail.com>
 <Y7h++5sU/hGJ/yTS@phenom.ffwll.local>
 <CAO2zrtaB3GZRSzgWu2kV_jTojwuhtL_kFz0gpzPPVGe9D8kVbQ@mail.gmail.com>
 <Y7iQckF/6EMYVpQt@phenom.ffwll.local>
 <CAO2zrtY+mMBTLimW6aZhOGFqqw53EVdP0CT8ieW6iVUXevZ7ag@mail.gmail.com>
 <Y7ik3ONV5ba7UXQB@phenom.ffwll.local>
In-Reply-To: <Y7ik3ONV5ba7UXQB@phenom.ffwll.local>
From: Hang Zhang <zh.nvgt@gmail.com>
Date: Fri, 6 Jan 2023 18:19:47 -0500
Message-ID: <CAO2zrtYeJg6Zn1SicfBNKBjioO7i07D3ir86+w5v_wVHZYUAWw@mail.gmail.com>
Subject: Re: [PATCH] fbmem: prevent potential use-after-free issues with
 console_lock()
To: Hang Zhang <zh.nvgt@gmail.com>, Helge Deller <deller@gmx.de>, 
 Javier Martinez Canillas <javierm@redhat.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, 
 Sam Ravnborg <sam@ravnborg.org>, Alex Deucher <alexander.deucher@amd.com>, 
 linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Sat, 07 Jan 2023 15:59:14 +0000
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

On Fri, Jan 6, 2023 at 5:46 PM Daniel Vetter <daniel@ffwll.ch> wrote:
>
> On Fri, Jan 06, 2023 at 05:12:57PM -0500, Hang Zhang wrote:
> > On Fri, Jan 6, 2023 at 4:19 PM Daniel Vetter <daniel@ffwll.ch> wrote:
> > > On Fri, Jan 06, 2023 at 03:25:14PM -0500, Hang Zhang wrote:
> > > > On Fri, Jan 6, 2023 at 3:05 PM Daniel Vetter <daniel@ffwll.ch> wrote:
> > > > > On Fri, Jan 06, 2023 at 02:58:27PM -0500, Hang Zhang wrote:
> > > > > > On Fri, Jan 6, 2023 at 1:59 PM Daniel Vetter <daniel@ffwll.ch> wrote:
> > > > > > BTW, if this is worthed a fix and the performance of console_lock() is a
> > > > > > major concern, then I think there may be alternative solutions like adding
> > > > > > a lock_fb_info() to the free call chain - if that's better in performance,
> > > > > > or maybe selectively protect the matroxfb ioctl but not vblank ioctl as you
> > > > > > mentioned.
> > > > >
> > > > > Please start out with explaining what kind of bug your checker is seeing,
> > > > > and why. Not how you're trying to fix it. Because I'm pretty sure there
> > > > > isn't a bug, but since I've already spent a pile of time looking at this,
> > > > > I want to make sure.
> > > >
> > > > We are sorry for the inconvenience caused, we'll follow these practices and
> > > > guidelines in the future. Thank you!
> > >
> > > Once more: Please explain what you're static checker is seeing. I want to
> > > understanding this, and I'm hoping at least someone involved in this
> > > static checker can explain what it thinks is going on.
> > >
> > > Thanks, Daniel
> > > --
> > > Daniel Vetter
> > > Software Engineer, Intel Corporation
> > > http://blog.ffwll.ch
> >
> > Thank you for your interest, Daniel. The checker tries first to find
> > the free and
> > use sites of a certain object (in this case "fb_info"), then reason
> > about whether
> > the use can actually happen after the free (e.g., taking into account
> > factors like
> > state set/check, locks, etc.), if so, it will flag a potential
> > use-after-free. As a static
> > checker, is doesn't execute a program or generate a PoC. We then manually
> > review each flagged issue by inspecting all related code. In this
> > case, the checker
> > (and us) are unaware of the lifetime management logic, which may cause
> > problems.
>
> Lifetime management is and absolute basic part in the linux kernel. So if
> your checker flags every free which isn't protected by a lock, then you'll
> creating endless amounts of false positives. Is this really what you're
> doing?
>
> I'm still very confused ...
> -Daniel
> --
> Daniel Vetter
> Software Engineer, Intel Corporation
> http://blog.ffwll.ch

Hi, Daniel. Lock is only one of many factors we consider in the checker, so the
actual workflow is certainly more complicated than "mark every free w/o lock".
E.g., we also need to consider the data flow between use and free, the state
check, etc. But as you know, it is very challenging for a static checker to
automatically and accurately reason about everything in the code (automatic
lifetime management analysis can also be tricky for a static analyzer), that's
why we perform a manual review afterward. We will continue working on the
checker to reduce its false alarms and submit higher-quality reports to the
community following your guidelines. Thank you so much for your time!

Best,
Hang
