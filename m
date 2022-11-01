Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BB787615477
	for <lists+dri-devel@lfdr.de>; Tue,  1 Nov 2022 22:54:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7C62F10E41F;
	Tue,  1 Nov 2022 21:54:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x636.google.com (mail-pl1-x636.google.com
 [IPv6:2607:f8b0:4864:20::636])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 84A0F10E41F
 for <dri-devel@lists.freedesktop.org>; Tue,  1 Nov 2022 21:54:17 +0000 (UTC)
Received: by mail-pl1-x636.google.com with SMTP id c24so14806592pls.9
 for <dri-devel@lists.freedesktop.org>; Tue, 01 Nov 2022 14:54:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=GA8q7YVJ2PrEh80a5RzqM/oJzGj5JG0NgG09XRsMdqg=;
 b=JkZ+NC3LNfYR65ttedUVvXPCnV5s6itLxeP+NXZl9F+Hf2bi7IyxEl7/jUySG1Xjhe
 JqrcWbR3x+hL6Zr6k+XJrs31lcGRbWs9g5gNYujB0mhay/HUyNl68ZnjyhG6g1xE/v67
 ReYOIHvuBeyDa/kXn0GjMwwiX+LBbz10PDs/Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=GA8q7YVJ2PrEh80a5RzqM/oJzGj5JG0NgG09XRsMdqg=;
 b=kGEJRWbsTTWQLAel4nz9aRrv2wbFMtcRKVOneXuTfk8gO+wOBx4nTVaPQxXpSwiIHO
 pUaUfVLKj0+gK8cEHSuDq7rC9cn7cQG6xjkFQ9bgPbEMITvqFJ58vcA4iV/pC1rIzy9f
 dqtamhRjg281Hh6UDD6m0kmzNWfrPsmqwq8cDOEAQryQQaRnHpEOdLgoSBS68d880hdd
 VeZ2Egb8JGJeBfKAIcA0txqZLrdVylpfm+Pi4wiPz8tcu8oEJKuePkNdLgsjZymukeIE
 5Z7XjAxsVnRTDQ9Fmifsw3bOHN+daa0iDYmNMgusrQm3CukcNevE/BFSGQmNoN1neLjx
 4UXA==
X-Gm-Message-State: ACrzQf3hm4KUA98L9/KkQzcN1wuAxTh/WbOMbprjXkh14i3eWZiHHE+2
 opyldtd7p9ZvOhEFOfAbhCtsF8iyqgr99Q==
X-Google-Smtp-Source: AMsMyM5OvRjW3oHM3Bghe5cW2+FRx8fyhjBnToJnwrbr0Jg8a5Y/wWRZYIgidp7GwXYqel1nldMV0g==
X-Received: by 2002:a17:903:200b:b0:186:892f:9f0b with SMTP id
 s11-20020a170903200b00b00186892f9f0bmr21292591pla.56.1667339657068; 
 Tue, 01 Nov 2022 14:54:17 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
 by smtp.gmail.com with ESMTPSA id
 w18-20020a170902e89200b0017f92246e4dsm6817494plg.181.2022.11.01.14.54.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Nov 2022 14:54:16 -0700 (PDT)
Date: Tue, 1 Nov 2022 14:54:15 -0700
From: Kees Cook <keescook@chromium.org>
To: Alex Deucher <alexdeucher@gmail.com>
Subject: Re: [PATCH v2] [next] drm/radeon: Replace one-element array with
 flexible-array member
Message-ID: <202211011443.7BDB243D8D@keescook>
References: <Y1trhRE3nK5iAY6q@mail.google.com>
 <Y1yetX1CHsr+fibp@mail.google.com>
 <CADnq5_Mod90O=tN26+Yi74WPYxpVtss+LG_+_HZyFv2EtzR+MA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CADnq5_Mod90O=tN26+Yi74WPYxpVtss+LG_+_HZyFv2EtzR+MA@mail.gmail.com>
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
Cc: Paulo Miguel Almeida <paulo.miguel.almeida.rodenas@gmail.com>, "Pan,
 Xinhui" <Xinhui.Pan@amd.com>, linux-kernel@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Alex Deucher <alexander.deucher@amd.com>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 linux-hardening@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Nov 01, 2022 at 10:42:14AM -0400, Alex Deucher wrote:
> On Fri, Oct 28, 2022 at 11:32 PM Paulo Miguel Almeida
> <paulo.miguel.almeida.rodenas@gmail.com> wrote:
> >
> > One-element arrays are deprecated, and we are replacing them with
> > flexible array members instead. So, replace one-element array with
> > flexible-array member in struct _ATOM_FAKE_EDID_PATCH_RECORD and
> > refactor the rest of the code accordingly.
> >
> > It's worth mentioning that doing a build before/after this patch results
> > in no binary output differences.
> >
> > This helps with the ongoing efforts to tighten the FORTIFY_SOURCE
> > routines on memcpy() and help us make progress towards globally
> > enabling -fstrict-flex-arrays=3 [1].
> 
> This seems like a worthy goal, and I'm not opposed to the patch per
> se, but it seems a bit at odds with what this header represents.
> atombios.h represents the memory layout of the data stored in the ROM
> on the GPU.  This changes the memory layout of that ROM.  We can work

It doesn't though. Or maybe I'm misunderstanding what you mean.

> around that in the driver code, but if someone were to take this
> header to try and write some standalone tool or use it for something
> else in the kernel, it would not reflect reality.

Does the ROM always only have a single byte there? This seems unlikely
given the member "ucFakeEDIDLength" (and the code below).

The problem on the kernel side is that the code just before the patch
context in drivers/gpu/drm/amd/amdgpu/atombios_encoders.c will become
a problem soon:

        if (fake_edid_record->ucFakeEDIDLength) {
                struct edid *edid;
                int edid_size =
                        max((int)EDID_LENGTH, (int)fake_edid_record->ucFakeEDIDLength);
                edid = kmalloc(edid_size, GFP_KERNEL);
                if (edid) {
                        memcpy((u8 *)edid, (u8 *)&fake_edid_record->ucFakeEDIDString[0],
                               fake_edid_record->ucFakeEDIDLength);

                        if (drm_edid_is_valid(edid)) {
	...

the memcpy() from "fake_edid_record->ucFakeEDIDString" will eventually
start to WARN, since the size of that field will be seen as a single byte
under -fstrict-flex-arrays. At this moment, no, there's neither source
bounds checking nor -fstrict-flex-arrays, but we're trying to clean up
everything we can find now so that we don't have to do this all again
later. :)

-Kees

P.S. Also this could be shorter with fewer casts:

                struct edid *edid;
                u8 edid_size =
                        max_t(u8, EDID_LENGTH, fake_edid_record->ucFakeEDIDLength);
                edid = kmemdup(fake_edid_record->ucFakeEDIDString, edid_size, GFP_KERNEL);
                if (edid) {
                        if (drm_edid_is_valid(edid)) {
                                adev->mode_info.bios_hardcoded_edid = edid;
	...

-- 
Kees Cook
