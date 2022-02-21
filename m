Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 137784BDA27
	for <lists+dri-devel@lfdr.de>; Mon, 21 Feb 2022 15:16:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B7E3C10E546;
	Mon, 21 Feb 2022 14:16:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oo1-xc2b.google.com (mail-oo1-xc2b.google.com
 [IPv6:2607:f8b0:4864:20::c2b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3741C10E73C;
 Mon, 21 Feb 2022 14:16:54 +0000 (UTC)
Received: by mail-oo1-xc2b.google.com with SMTP id
 189-20020a4a03c6000000b003179d7b30d8so13362409ooi.2; 
 Mon, 21 Feb 2022 06:16:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=pB155swSBk49PDT+eCV95gPkeDDn9OZawdG0rhDIJRE=;
 b=pTEm/Q5ZcaImrNLul2uOOW3JIgCy8oOGT2jyBGg61wUnKrLHJQTr05kDrMDQgV695N
 1te6tuy7pP04E4lnDUN9mOiIFJsZcHM4yPrnagdJJyeWQ3w9iYRLb9QiPeBjGcenXbhr
 lQgeSWXKjMHcGBBdrupKXsEi1ihBo0LY1BTVIWnM/bumbva0Poc/3R8uP8e1KmUPX2aZ
 Ztj6Tr4JjzBiycTk7ncfqLhVq6MM1XdPoQe0PMQ0Z5IoAFBRw2kN8FLLksCzy1OabSdM
 H4f4vw+p3WEOFEjUG3LaZaruVUYe78BU3dIWogDIMp5ISBHKnTXi0lrZuY66Pp7Cxphk
 THMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=pB155swSBk49PDT+eCV95gPkeDDn9OZawdG0rhDIJRE=;
 b=5kI7j19JoALnuuUHj7g+UiiaJIucXcsSmnG6ggRl9qg1fz9O3XFMfZzctYHU5HTPcD
 KN7qV5j7zbD6R0l/CNvnBInSaCSXesu4XZs5U2m3ael0jEeL7tLfJstS1thcwK8UKMBH
 ZTeCaevtxlglr+WkiWo6TSPPZvwfHstcd8OW+oor7YSfAFwA+gHikWk0KzMHpJ1QqVXO
 cQ3R9UOEQ4qn84RJ6hu+EwOgd0Ek1/7ZZJh7HfImkKyP+LwhsUBDPWiD5xITrn3if3+S
 tpb+KUmvCttN0BxPl7BqXgxwsGT1s+ubjuiSWFhtWYUNSFX5EmaOKsD8XifC+redTDYG
 w0mA==
X-Gm-Message-State: AOAM531JCs5DPInFOlKMdOJ1E5pvTedsivJPNe6mBzikly0uPtekLV5S
 bZCBbpN6lWtlckbuyScmhJyzNLYucYrpDjeoKho=
X-Google-Smtp-Source: ABdhPJypp4tgFBhtPOEyXtKE+mSjCfOtfvyT3B8a+mk8Lpv2kJcJdY6EchpMEPfdODZ6aUglmLiR483wlIqkrDv6GFw=
X-Received: by 2002:a05:6870:3e0d:b0:d3:fe6d:57c3 with SMTP id
 lk13-20020a0568703e0d00b000d3fe6d57c3mr4707614oab.225.1645453013462; Mon, 21
 Feb 2022 06:16:53 -0800 (PST)
MIME-Version: 1.0
References: <Ygf7KuWyc0d4HIFu@eldamar.lan>
 <CADnq5_MfR99OhjumQESCO7Oq+JVOHOVgyVQHX4FpGFDnPu6CyQ@mail.gmail.com>
 <5164225.DI6hChFYCN@ylum> <c62d4ba9-2214-ca7d-ee78-ee19a9bf51e6@free.fr>
In-Reply-To: <c62d4ba9-2214-ca7d-ee78-ee19a9bf51e6@free.fr>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Mon, 21 Feb 2022 09:16:42 -0500
Message-ID: <CADnq5_MWqz7-XhOS4zfuzi3=_nKa72iYaO0BcKNcVDwEvZ+YHw@mail.gmail.com>
Subject: Re: Regression from 3c196f056666 ("drm/amdgpu: always reset the asic
 in suspend (v2)") on suspend?
To: Eric Valette <eric.valette@free.fr>
Content-Type: text/plain; charset="UTF-8"
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
Cc: Sasha Levin <sashal@kernel.org>, David Airlie <airlied@linux.ie>, "Pan,
 Xinhui" <Xinhui.Pan@amd.com>, LKML <linux-kernel@vger.kernel.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 Luben Tuikov <luben.tuikov@amd.com>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 Alex Deucher <alexander.deucher@amd.com>, 1005005@bugs.debian.org,
 Evan Quan <evan.quan@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Dominique Dumont <dod@debian.org>, Salvatore Bonaccorso <carnil@debian.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Feb 21, 2022 at 3:29 AM Eric Valette <eric.valette@free.fr> wrote:
>
> On 20/02/2022 16:48, Dominique Dumont wrote:
> > On Monday, 14 February 2022 22:52:27 CET Alex Deucher wrote:
> >> Does the system actually suspend?
> >
> > Not really. The screens looks like it's going to suspend, but it does come
> > back after 10s or so. The light mounted in the middle of the power button does
> > not switch off.
>
>
> As I have a very similar problem and also commented on the original
> debian bug report
> (https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=1005005), I will add
> some information here on another amd only laptop (renoir AMD Ryzen 7
> 4800H with Radeon Graphics + Radeon RX 5500/5500M / Pro 5500M).
>
> For me the suspend works once, but after the first resume (I do know
> know if it is in the suspend path or the resume path I see a RIP in the
> dmesg (see aditional info in debian bug))  and later suspend do not
> work: It only go to the kde login screen.
>
> I was unable due to network connectivity to do a full bisect but tested
> with the patch I had on my laptop:
>
> 5.10.101 works, 5.10 from debian works
> 5.11 works
> 5.12 works
> 5.13 suspend works but when resuming the PC is dead I have to reboot
> 5.14 seems to work but looking at dmesg it is full of RIP messages at
> various places.
> 5.15.24 is a described 5.15 from debian is behaving identically
> 5.16 from debian is behaving identically.
>
> >> Is this system S0i3 or regular S3?
>
> For me it is real S3.
>
> The proposed patch is intended for INTEl + intel gpu + amdgpu but I have
> dual amd GPU.

It doesn't really matter what the platform is, it could still
potentially help on your system, it depends on the bios implementation
for your platform and how it handles suspend. You can try the patch,
but I don't think you are hitting the same issue.  I bisect would be
helpful in your case.

Alex
