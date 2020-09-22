Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C20432748B5
	for <lists+dri-devel@lfdr.de>; Tue, 22 Sep 2020 21:02:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7EF806E2DF;
	Tue, 22 Sep 2020 19:02:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A64626E2DF
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Sep 2020 19:02:48 +0000 (UTC)
Received: by mail-wr1-x442.google.com with SMTP id e16so18315850wrm.2
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Sep 2020 12:02:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fooishbar-org.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=rm/MUGiqEj6w9zoNKJAAAmLZqiJ10V/BIIAqAEoPPYo=;
 b=nHx+oCJ4c6Paf+lALa+5KspNBYN+hXRQkk9hBttFTN+rje5X8/9FAUvaCBwnGOPWQ1
 F4R0U65sfyBNDYw+IPkqYN/j3Q/YMan4JXmbRcOW/ASi5k1hxBIiRxiCHJJqQK1aycZl
 VBAJ78k7zPaOieZI67vbAaNfJPc8l78oZiXdnreDjhWtR6rsN9vfcznLyR49mkwjUtFs
 E2jco4SRrE6jQD2v3CBXzKCrByqErFTzls6gcpddlM0Nz8pB508/uQX3YGIbykHJImTo
 tHnjh25yK6E3gcJ8UoyNvbJRSMpiFSGPo2YN4QrEg7DYjbZBzI0cK7+uQtTUwkZrNa73
 1akA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=rm/MUGiqEj6w9zoNKJAAAmLZqiJ10V/BIIAqAEoPPYo=;
 b=nJUp1g8dUtOpcboYldeOF9X/TKbbRmYdcArHLxD8Sw8u6BjZSQHSFvDa180Hq4gzI8
 V24F4U3mEsea8G4cfLcZwiYZR//rvw8dtNsdw9Hck07PPUjo4Cls/REpT8bcgs+p5Bf+
 hmmNLLztquFs2SSNQC4PU55YK5uAzCAZzBdNuVEypLgwlnhvL9w9DFgzJDjLi1RgGY+5
 KG0DlHBHCOxOZygv5FLrA58Yx1j71XQ95vA/L4RxRUUQVlIBR2fNVDke8UkxjaxZ8yql
 nYl/95jE4xc3Q+tlQSbLRjN2PESVpRNc4r6VkbnJyX+5PcSFMf6CFa8CfZtIADScw/BD
 /sUg==
X-Gm-Message-State: AOAM533B10MvjFHsHQ0AdfCBGtSiC/kZ8HD4FUhcd7KqKS+Pj+aXlX8a
 IxDNdAO98mztoPFj8iqAlQ5qHmzKNOAZXoE5o0p/yA==
X-Google-Smtp-Source: ABdhPJwvwQBt4Q6HDn51fnSs2PQD3j8FLapI/mLE772a0J4HTg0bK9kCG9427Njb47eon1VCQkDPa5MIGFa14BvVrEY=
X-Received: by 2002:adf:e292:: with SMTP id v18mr6915557wri.256.1600801367216; 
 Tue, 22 Sep 2020 12:02:47 -0700 (PDT)
MIME-Version: 1.0
References: <20180705101043.4883-1-daniel.vetter@ffwll.ch>
 <20180705102121.5091-1-daniel.vetter@ffwll.ch>
 <CAPj87rN48S8+pLd0ksOX4pdCTqtO=bDgjhkPxpWr_AnpVvgaSQ@mail.gmail.com>
 <20200922133636.GA2369@xpredator>
 <CAKMK7uHCeFan4+agMn0sr-z9UDyZwEJv0_dL-K-gA1n0=m+A2w@mail.gmail.com>
 <CAPj87rNLzFjn7xyePmEBEY8teL7TnL-HrQHXbp7C1tXDdWgeUA@mail.gmail.com>
 <CAKMK7uEyt0d0LidUCQL4oHZRYZdDEFhy=DnRF7WwD1S1+ackFQ@mail.gmail.com>
In-Reply-To: <CAKMK7uEyt0d0LidUCQL4oHZRYZdDEFhy=DnRF7WwD1S1+ackFQ@mail.gmail.com>
From: Daniel Stone <daniel@fooishbar.org>
Date: Tue, 22 Sep 2020 20:02:35 +0100
Message-ID: <CAPj87rNO+_2dBSJtaNi5PemvS3oG2uuoCwP_AmtOw3qbjUQ-ZA@mail.gmail.com>
Subject: Re: [PATCH] drm: avoid spurious EBUSY due to nonblocking atomic
 modesets
To: Daniel Vetter <daniel.vetter@ffwll.ch>
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
Cc: Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 stable <stable@vger.kernel.org>, Daniel Vetter <daniel.vetter@intel.com>,
 Pekka Paalanen <pekka.paalanen@collabora.co.uk>,
 Marius Vlad <marius.vlad@collabora.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Tue, 22 Sep 2020 at 17:02, Daniel Vetter <daniel.vetter@ffwll.ch> wrote:
> On Tue, Sep 22, 2020 at 4:14 PM Daniel Stone <daniel@fooishbar.org> wrote:
> > I think we need a guarantee that this never happens if ALLOW_MODESET
> > is always used in blocking mode, plus in future a cap we can use to
> > detect that we won't be getting spurious EBUSY events.
> >
> > I really don't want to ever paper over this, because it's one of the
> > clearest indications that userspace has its timing/signalling wrong.
>
> Ok so the hang-up last time around iirc was that I broke igt by making
> a few things more synchronous. Let's hope I'm not also breaking stuff
> with the WARN_ON ...
>
> New plan:
> - make this patch here only document existing behaviour and enforce it
> with the WARN_ON
> - new uapi would be behind a flag or something, with userspace and
> everything hanging off it.
>
> Thoughts?

What do you mean by 'new uapi'? The proposal that the kernel
communicates back which object IDs have been added to the state behind
your back? That it's been made automatically blocking? Something else?

Cheers,
Daniel (the other one)
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
