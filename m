Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B549113BAD8
	for <lists+dri-devel@lfdr.de>; Wed, 15 Jan 2020 09:28:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3CB0F6E87B;
	Wed, 15 Jan 2020 08:27:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ua1-x943.google.com (mail-ua1-x943.google.com
 [IPv6:2607:f8b0:4864:20::943])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2908B89D60
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Jan 2020 17:30:13 +0000 (UTC)
Received: by mail-ua1-x943.google.com with SMTP id z24so5119366uam.7
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Jan 2020 09:30:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
 bh=08Szw5rYnIOLShLCG3gwbLPH4sjtaB7lisEPfvsjIZY=;
 b=LnbKflAscr1aUly+5WmN1eTnDSd4zt+Zd8UQCGHbkHm+nM2N5IIqWO4+/Een5M7jPM
 DyV2DCDIffyeoT6z3Txamx03jePku6m6flVc/UGCYaN2ZMpIPOGS6xQjmA1Wg+ep/KjC
 mJtufklgX42r0nEj5CCyYom8QmILBecLtonzgHa5DjXNTtWtk4McRaKE9QtElWd1LIc2
 mWb67uny0umZAbK4iGqhCLy+rFcZfCMpNENzoxKTWFNXQo5sy9lEhW48XfdY3NdS6GTF
 1Ia7vyt5yOIUkZgxal/imNBERl7A8o1njV2/Y51Bs3caiyftIfojJGdBgkTAuSdHFH/h
 LrEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to;
 bh=08Szw5rYnIOLShLCG3gwbLPH4sjtaB7lisEPfvsjIZY=;
 b=uOfB+dmZkV9tKK+/fAiKaKJyoY7p19sdYpMbXaZ7UVUONrf7tcUTzDC+IcNjH+JWn5
 55m87aeCCEtvEK1ncw7ukKoH7CKQjCQvTMFM+1VmarHAqVnRENlg1WxnDAxy59bA7Uz+
 /mxiq9fqflwpyXGAJoMEqRSKR5XcRoZIdQ6h9wItxDatshUStXP/apZmlxrSYh8stCuS
 XGBZBrvVPFaHNEtnaevR9EhYoWT6Ptz+1zVAS2EPIVPh2E+z3KxfEM3eln9Kouu9Yd1d
 38+JFcs2zO8n+Sxy/xY51LVb77DtIj4zGM8jiexuYcoVqfPmr+u0PpiCuk1qE0DFT85I
 N0sg==
X-Gm-Message-State: APjAAAWXTblF4MPlTRM4owAApvyh8mbFZoaoZlKay2/qh3Gh8VoU/eoF
 HuVwwGXw+FZHI3ANneGU3U41DoJIyHun1Y3vf5UgBA==
X-Google-Smtp-Source: APXvYqzgZX1el1nJ4YE3skMK6r5CjnHOZNOcFgoe3GQU2ULdnQrysHQjwdF5QM0DTkgZ8ylTIIdO9xuKbZduccGuIIE=
X-Received: by 2002:ab0:2a0c:: with SMTP id o12mr11322534uar.72.1579023011862; 
 Tue, 14 Jan 2020 09:30:11 -0800 (PST)
MIME-Version: 1.0
References: <20200113153605.52350-1-brian@brkho.com>
 <20200113153605.52350-3-brian@brkho.com>
 <20200113175148.GC26711@jcrouse1-lnx.qualcomm.com>
 <CAJs_Fx6AVwA73eN+Rs=GAvBPD1Leq=WKG9w_2hohpzmecK_C_A@mail.gmail.com>
 <20200114172319.GA2371@jcrouse1-lnx.qualcomm.com>
In-Reply-To: <20200114172319.GA2371@jcrouse1-lnx.qualcomm.com>
From: Kristian Kristensen <hoegsberg@google.com>
Date: Tue, 14 Jan 2020 09:30:00 -0800
Message-ID: <CAOPc6TnEZY9zxz-JPzh-7awWOtLrP_tiv+Sa0b3gh5HFp09QaA@mail.gmail.com>
Subject: Re: [Freedreno] [PATCH 2/2] drm/msm: Add MSM_WAIT_IOVA ioctl
To: Rob Clark <robdclark@chromium.org>, Brian Ho <brian@brkho.com>, 
 freedreno <freedreno@lists.freedesktop.org>, David Airlie <airlied@linux.ie>, 
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <linux-arm-msm@vger.kernel.org>,
 open list <linux-kernel@vger.kernel.org>, 
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <dri-devel@lists.freedesktop.org>,
 Rob Clark <robdclark@gmail.com>, 
 Daniel Vetter <daniel@ffwll.ch>, Kristian Kristensen <hoegsberg@chromium.org>,
 Sean Paul <sean@poorly.run>
X-Mailman-Approved-At: Wed, 15 Jan 2020 08:27:50 +0000
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Jan 14, 2020 at 9:23 AM Jordan Crouse <jcrouse@codeaurora.org> wrote:
>
> On Tue, Jan 14, 2020 at 08:52:43AM -0800, Rob Clark wrote:
> > On Mon, Jan 13, 2020 at 9:51 AM Jordan Crouse <jcrouse@codeaurora.org> wrote:
> > >
> > > On Mon, Jan 13, 2020 at 10:36:05AM -0500, Brian Ho wrote:
> > > > +
> > > > +     vaddr = base_vaddr + args->offset;
> > > > +
> > > > +     /* Assumes WC mapping */
> > > > +     ret = wait_event_interruptible_timeout(
> > > > +                     gpu->event, *vaddr >= args->value, remaining_jiffies);
> > >
> > > I feel like a barrier might be needed before checking *vaddr just in case you
> > > get the interrupt and wake up the queue before the write posts from the
> > > hardware.
> > >
> >
> > if the gpu is doing posted (or cached) writes, I don't think there is
> > even a CPU side barrier primitive that could wait for that?  I think
> > we rely on the GPU not interrupting the CPU until the write is posted
>
> Once the GPU puts the write on the bus then it is up to the whims of the CPU
> architecture. If the writes are being done out of order you run a chance of
> firing the interrupt and making it all the way to your handler before the writes
> catch up.
>
> Since you are scheduling and doing a bunch of things in between you probably
> don't need to worry but if you start missing events and you don't know why then
> this could be why. A rmb() would give you piece of mind at the cost of being
> Yet Another Barrier (TM).

Doesn't the fence case do the same thing without a barrier?

> Jordan
>
> > BR,
> > -R
> > _______________________________________________
> > Freedreno mailing list
> > Freedreno@lists.freedesktop.org
> > https://lists.freedesktop.org/mailman/listinfo/freedreno
>
> --
> The Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
> a Linux Foundation Collaborative Project
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
