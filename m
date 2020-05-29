Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2551B1E8060
	for <lists+dri-devel@lfdr.de>; Fri, 29 May 2020 16:37:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EDB176E91C;
	Fri, 29 May 2020 14:37:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 883526E91C
 for <dri-devel@lists.freedesktop.org>; Fri, 29 May 2020 14:36:55 +0000 (UTC)
Received: by mail-wr1-x443.google.com with SMTP id l10so3861282wrr.10
 for <dri-devel@lists.freedesktop.org>; Fri, 29 May 2020 07:36:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=q8AQh+bHNHDN02Lu5+NOb1fReKkbS5/mk4VqlOlJKug=;
 b=lHbrB21Iy3ujZDn8UO2s46KmO1kKxiKRqinBQjSGwi1IuXSiGFK9Emba1mFjp+k9AA
 SHfcrgSPpDPYKl+BMFvCpp1H0CpAd9eoPDM2shdj3CCJulQTXQpzbm1eD9F8rdAykwU1
 lkjppe55uyObju1cd8roNNYrEprUuRBwkDK9Bt8+HUvIJTkdTWhIqeeNu9QgE5rvTahM
 nsrzLpdvq/8RyB7aW1jn1ZvBkR57p+tCoy9d5e8RnWJ86BJxtMM7BYURbtqXOVs+aMkK
 wYSQ/uRPQxtMGkBDs+EiOlyMNWHv3NP3O+C63n2tH9G3boImLJkBeJa6wTzDhyKYxX9j
 keEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=q8AQh+bHNHDN02Lu5+NOb1fReKkbS5/mk4VqlOlJKug=;
 b=bglqEwUp05C9OEnH7HL9hx2oatXdkH1h/beOKW53fLucrNHHQzMRJaTP3stdqjQ5i0
 fu9+3M9GAQYxUDeUun7KN7jydHHqE+jLmrIhr+sRJd6e4sQc4CpKAViEK1ne2bdRzZ/y
 fJ4QhG/CDONYfegk63/sXWOf0wTT28Sqs9V6EKnBXkuvkEvpRPZFw5ie5uqYKTDQm2O8
 805toR4u+iv7MuEXW46Zfk8Kz5kbJIhhTFF2cPafhynQ42fLDy0t5LpBqhoclY64sJk4
 Bo1BzEnXIQnJRVnDOHO+/trdCIAaFmDjvNI95FA/6hmmGcFq90DPjJX2m/IQp9w+dfkk
 MZow==
X-Gm-Message-State: AOAM532QMFxKC8Zyrg0qJeSuEoQbGT8HgrHlD0EWroYnbgU0/bW2x9R+
 83d/68cZd/7pP59juE2mMuR64roxXUPsCUB1dWQ=
X-Google-Smtp-Source: ABdhPJzGMmVsW/zMnZxrbwOsdZrxz0faVAE8ptwc/5ZwYMmXxn4PuvNUkF/L4d00A/QAnXClgqdJRbMgQQC4Shjt7gM=
X-Received: by 2002:a5d:6789:: with SMTP id v9mr9590459wru.124.1590763014265; 
 Fri, 29 May 2020 07:36:54 -0700 (PDT)
MIME-Version: 1.0
References: <WOsdNGp0dhyp8Modsrt7DYpd0fVk7Yk264FISQ1Yls30bhlSXbxzgKTpmOCJ9H2WV1XHyUjCXu7nwBOWQ6n1NCbIcVl1-1IZ4rMMGN1dN-U=@emersion.fr>
 <CAAxE2A4NCo_KMkemUOHKbZ7P=GR4p-zwhpmP7Get18x4Ydb-Gg@mail.gmail.com>
 <bbZABMxDckHUj5JW5DW0pSewqQ-rAIW0gvNnTlI4np7o1A2bDrpPGIeyk5tXGMDr_cAI1l_R9qw6ykJ8OEhQlbKruJ8IG579jqADaPAnUbA=@emersion.fr>
 <CADnq5_MEFM_2k_uboU6E9d3_j18K+tz=Axtie-80PSSwJ2vkYw@mail.gmail.com>
 <CAPj87rMrJLNNbFJVvf081=eRqPqAe1H7=+PM21N22Jdsg7FzVQ@mail.gmail.com>
 <CADnq5_OX9o5_Gc4SjU5M4B=fthT9++J-FjX3UqTS7x_u6cJHOQ@mail.gmail.com>
 <CAPj87rP+Hxhohb4dEjRwtZzy34fYk+hAdgVfCkLF1u4JufJ=CQ@mail.gmail.com>
In-Reply-To: <CAPj87rP+Hxhohb4dEjRwtZzy34fYk+hAdgVfCkLF1u4JufJ=CQ@mail.gmail.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Fri, 29 May 2020 10:36:43 -0400
Message-ID: <CADnq5_Pzj+AWQZWOcwvf8WQDVJrpc2DyG6Z1ZYqgfHA-8AXpMA@mail.gmail.com>
Subject: Re: [PATCH v3] drm/fourcc: document modifier uniqueness requirements
To: Daniel Stone <daniel@fooishbar.org>
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
Cc: =?UTF-8?B?TWFyZWsgT2zFocOhaw==?= <maraeo@gmail.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Daniel Vetter <daniel.vetter@ffwll.ch>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, May 29, 2020 at 10:32 AM Daniel Stone <daniel@fooishbar.org> wrote:
>
> On Fri, 29 May 2020 at 15:29, Alex Deucher <alexdeucher@gmail.com> wrote:
> > Maybe I'm over thinking this.  I just don't want to get into a
> > situation where we go through a lot of effort to add modifier support
> > and then performance ends up being worse than it is today in a lot of
> > cases.
>
> I'm genuinely curious: what do you imagine could cause a worse result?

As an example, in some cases, it's actually better to use linear for
system memory because it better aligns with pcie access patterns than
some tiling formats (which are better aligned for the memory
controller topology on the dGPU).  That said, I haven't been in the
loop as much with the tiling formats on newer GPUs, so that may not be
as much of an issue anymore.

Alex
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
