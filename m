Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 100761D3269
	for <lists+dri-devel@lfdr.de>; Thu, 14 May 2020 16:15:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CFD656EB56;
	Thu, 14 May 2020 14:15:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2AE346E353
 for <dri-devel@lists.freedesktop.org>; Thu, 14 May 2020 14:15:03 +0000 (UTC)
Received: by mail-wr1-x443.google.com with SMTP id h17so4307826wrc.8
 for <dri-devel@lists.freedesktop.org>; Thu, 14 May 2020 07:15:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fooishbar-org.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ciZrHvFbJ27aDLpOY4lC0r22i/PxbYLL9mMcUxziujg=;
 b=DaPy2p6f6M/1RrmpPUn/FT917YXpjS4oTh1cBnsLF/e8F2u8Of05tZLwSNizFZtAiJ
 0G05lnhCr5unMbchdaPbjsI4x8cPUqkM915vvrItWVLbAerfb4yYsE5tEmWLQZJ7Phrw
 89xYBlqf+2tHIOjJAHTKk7UVuRKHa1Ju9dTPX5WYmadwAIf8DFZF8e/LM+34/TD7sbpf
 nXykT/4Z6sws2c7UEiGlx4QQgmDs61Qht09OLn/xzkmEe6bZ+9y2Ezqh4coXia24Jlm0
 8VkazAyV/RF8GAF/YtSe4wozND/EXfXYNT5M0mrFTIWefWXpuEY1CraZONgSdVC27vOY
 nPvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ciZrHvFbJ27aDLpOY4lC0r22i/PxbYLL9mMcUxziujg=;
 b=Y5bL1V3DtZQDHZ3i0Acxgji8NXQymihs8PybmlGp1nv4yctkBvxkfK+5MSTWHuKeBI
 fKTZT0npP0mSy4b3DUfGECQnMd2YJtjzUJYbOKp4Q4exwpsM2j+MR9C6PQo99Jr2otr1
 q9XE+OEBe52vNuDRTa04Ax4mKcALFeHYhJv/g3XC9kPd1hjb1WcZKUyXfIN94Zpsiqvb
 K/75IWn95gsjrFMB4c3hewbOUvSQCZK1MIfXZT5P1RTBCPnpPy2bdJn9aaDHdGn06rEA
 F3yYI3HjEqBGP4vMIv6FO6i0Dp6rr88CV4vr7/xJ6/3KJ2+LSxFU4eSog7CAMu3YeR8r
 M7jw==
X-Gm-Message-State: AOAM532iF6woeFshZ6YSb16ayD77/y/iHNSHk083oxPg3LpvDkvL2RU4
 B/7m1KBzG31L4sMnZ+nuQubTM3EoI2bpXyRidC+/WQ==
X-Google-Smtp-Source: ABdhPJy7T0e95z6kUohvTFRitvd2uwEtFinZQ127SCRbZNUsANHzvptwlUKz6X0J1I85yB7Roce7W1VAPTBxbpddf3Q=
X-Received: by 2002:a5d:56c7:: with SMTP id m7mr5669393wrw.256.1589465701461; 
 Thu, 14 May 2020 07:15:01 -0700 (PDT)
MIME-Version: 1.0
References: <20200430212951.3902-1-alexander.deucher@amd.com>
 <CAPj87rM6nvr-pspfz9PaPiV9kkSM+=rh_YMaPXqaBZv37Yc-Yw@mail.gmail.com>
 <CADnq5_O-jgxFf4RArnf_fxeW5MxyDX3aMn=jViAZyx1-PAtHzw@mail.gmail.com>
In-Reply-To: <CADnq5_O-jgxFf4RArnf_fxeW5MxyDX3aMn=jViAZyx1-PAtHzw@mail.gmail.com>
From: Daniel Stone <daniel@fooishbar.org>
Date: Thu, 14 May 2020 15:13:22 +0100
Message-ID: <CAPj87rPwd0TpnBy1g3BDBbQb3e0RjEn2Sy+yP01ALNGts+NhLA@mail.gmail.com>
Subject: Re: [pull] amdgpu, amdkfd drm-next-5.8
To: Alex Deucher <alexdeucher@gmail.com>
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
Cc: Alex Deucher <alexander.deucher@amd.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 amd-gfx mailing list <amd-gfx@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Thu, 14 May 2020 at 14:36, Alex Deucher <alexdeucher@gmail.com> wrote:
> On Thu, May 14, 2020 at 5:42 AM Daniel Stone <daniel@fooishbar.org> wrote:
> > Did this ever go through uAPI review? It's been pushed to the kernel
> > before Mesa review was complete. Even then, Mesa only uses it when
> > behind a magic environment variable, rather than through the EGL
> > extensions which have been specifically designed for protected content
> > (EGL_EXT_protected_content, protected_surface, etc). The winsys
> > usecase was based on a Wayland system which seems like it will only
> > work when composition bypass is available - not using any of the
> > Wayland protected-content extensions, and it's completely unclear what
> > will happen if composition bypass can't actually be achieved.
> >
> > I don't think this should be landing before all those open questions
> > have been answered. We're trying to come up with a good and coherent
> > story for handling protected content, and I'd rather not see AMD
> > landing its own uAPI which might completely contradict that.
>
> Well, the patches have been public for months and we have a UAPI and
> mesa userspace which works for our use cases and the mesa side has
> been merged and the recent comments on the MR didn't seem like show
> stoppers.

As a generic compositor author, it's pretty important for me to
understand what happens when trying to access protected content. Does
the import simply fail? Does it sample rubbish? Does my context
killed? etc.

> I don't disagree with your point, but I feel like agreeing
> on a what we want to do for EGL protected content could drag out for
> months or years.

I don't really see what the problem is, but it would've been nice if
it was at least attempted, rather than just parachuted in ... I know
I'm going to end up getting bug reports about it for Wayland/Weston,
and then all of a sudden it's become my problem that this was just
dropped in as a vendor-specific feature in a vendor-specific island.

Cheers,
Daniel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
