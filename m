Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A29BFABA9EA
	for <lists+dri-devel@lfdr.de>; Sat, 17 May 2025 13:51:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E6E7010E07E;
	Sat, 17 May 2025 11:51:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="YjFfYbE7";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com
 [209.85.218.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D489910E07E;
 Sat, 17 May 2025 11:51:27 +0000 (UTC)
Received: by mail-ej1-f48.google.com with SMTP id
 a640c23a62f3a-acb5ec407b1so483902266b.1; 
 Sat, 17 May 2025 04:51:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1747482686; x=1748087486; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=MCG7UsgmOfTrLfJG+2ZE0hq0MEHcnjnuqiq7V6Le5YE=;
 b=YjFfYbE7XRtUst6ksOwyFz9+9OIkIpheWc6NIedPaILmSqPn0SwRdVTvT7W1xOGUxF
 PA99h1zFbO9no1XkhXIG2+h3zWI+yfJOPEmWSsdPPYn6RVz2OxGUzTsRJHJAYBgeH/7L
 mWeopGgRDvtLxwp8rWSyhR3Rulnjl2ujHJrH21hZD0qm99M8GRpOwa7/TD+0bjtMh+Ae
 hchwRDjDqGxIh9S5B3EtgXGLKs5ANZKo3EYUbh6VXdYniWhTONfaiML1HjKU+TN4wC22
 hJPUmDWcumqAiW5O+rE6t/8yHAYy7azVOi3ZuaVgRUFKxT7k2Rq1XBzwLdzs4sOfit8v
 KSNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747482686; x=1748087486;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=MCG7UsgmOfTrLfJG+2ZE0hq0MEHcnjnuqiq7V6Le5YE=;
 b=OxbiAiu2Vd943Z//ThEcJfIgSS2gmC3mRZCcZ2hjbySp7n84H1xKfpzu3203C03hl+
 T99GMArcWEjBUGQNzPQhw3hMHhYXx3zZ3mXlTXElDSPluRzXZ78vFVwVoyJM5uU9uk6m
 JrQN/yuuPQ+QgOE4JeqRI5evSLgH217A3SVphv9hndh6NVVvfyv2j2ZuJK8QB3kSN1/M
 jXkTm+RjmXaU8bxtORtCmcr2RgjzTkg1mvOl7lBc7TLi4aXfR6V3cWTL3YUZOIMwTFZt
 ZlzMqmwYjDMWaEqwediQD8D7vYggMaRbCO2ybotqJUwKukUA6NN4V/sQvdZeHkPJc2eA
 NwwA==
X-Forwarded-Encrypted: i=1;
 AJvYcCU1yxMvkqrzWLl337DoCgDj51+3EZE4xgi7yLRmXpaNiw5SEftMoJvgwWjWyHu8ab3NI65iThCP@lists.freedesktop.org,
 AJvYcCUpDOqy9p0L7L/c7QbIxQJdWJBrwZ+3HC/h4G5ER+/2jmbp6VEUt8ncob4UJdJQB9sz0NiCelJb/5h0@lists.freedesktop.org,
 AJvYcCVSEKodkSUNqbjMZ/3SBfCmnWBjaXzkPjgecLuC9uE3tQCr44DyZwbNWggTtNi062UgIo0XAeNIm8DHLEVoKQ==@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwZLY/vSVWs+YI6IA9mbpKnHsE3oVsXec7vc+2vlCkZNmDfdySU
 GlHMCB1JWz2S8SKleYHeyY2y603DveTeWRjcWhIg7rmIrW6T8KWOLHyf8lUnRyXDMVNKt4nxz4L
 LdzSxrXCJhy+vfym02QcTjez1JtJx/9U=
X-Gm-Gg: ASbGncsleYdo0fZ+Z5YvcR9EBBDo0SG80LnL8k9qiV0dzIm87tsZsuqUMnKOZ5d8iU7
 0RuICDMqCLVTfvoPTI+rPNkRf1dIGX/LLJ76aiZt1uUWK4SGF8rFF0kvsguKTSjy32SC38HO8lC
 23YQiQSCkAM00fBtj0jSpnCB75SUdJTtLP92sVjKxXugHu6K+/luhstYW8J1tMcQEjVPoasvSM5
 8Mu
X-Google-Smtp-Source: AGHT+IFp0bS9J5A+F88R+FnWorgbxFFe6hmX2LBxvbwajivcYeUO3tISkaiUFqp/6TQFSKcyU/+VL1VRjq7PN9sdryI=
X-Received: by 2002:a17:907:80b:b0:ad2:2fa8:c0a7 with SMTP id
 a640c23a62f3a-ad536b7c43fmr551592066b.21.1747482685976; Sat, 17 May 2025
 04:51:25 -0700 (PDT)
MIME-Version: 1.0
References: <20250430011115.223996-1-alex.hung@amd.com>
 <o4MtjqyDUjuFR4Y9Q1IEZlvVQ7Nkggq0v-KtBcH0aM3pTvEq8UcSoUDxefSBVdTmLj_1_a6GmbjU_mRSFinOb44B4bu1u3mMIckuQhhZWCc=@emersion.fr>
 <3bbd4bd7-7217-4a14-b7bb-383226f44f55@amd.com>
 <CAPj87rNUDdDEopPH+iAF-a=Or6eXH4cMRU8eOj81g_40cq8gdA@mail.gmail.com>
 <f7e9cd32-3e2b-4f06-aa13-049c8b7ba29b@amd.com>
 <CAPj87rMbcZKy2ARe_tp_-+-tMu3FpS0C9R1BHVzjsUpOsU9M4g@mail.gmail.com>
 <5921076d-0150-4e0f-a3ef-1b8dec021630@collabora.com>
In-Reply-To: <5921076d-0150-4e0f-a3ef-1b8dec021630@collabora.com>
From: Xaver Hugl <xaver.hugl@gmail.com>
Date: Sat, 17 May 2025 13:51:14 +0200
X-Gm-Features: AX0GCFsRuvAiaNtf2Rr2dvEsOdgNQYtUCZXulXk4PGtG-IFz9IIXobYQS1Dhpgk
Message-ID: <CAFZQkGymi1XY7m0Ghs8R2HaNRQptE_0NO-5J5Z2c61gDJRho3Q@mail.gmail.com>
Subject: Re: [PATCH V9 00/43] Color Pipeline API w/ VKMS
To: Leandro Ribeiro <leandro.ribeiro@collabora.com>
Cc: Daniel Stone <daniel@fooishbar.org>,
 Harry Wentland <harry.wentland@amd.com>, 
 Simon Ser <contact@emersion.fr>, Alex Hung <alex.hung@amd.com>,
 Misyl Toad <misyl@froggi.es>, 
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org, 
 wayland-devel@lists.freedesktop.org, leo.liu@amd.com, 
 ville.syrjala@linux.intel.com, pekka.paalanen@collabora.com, mwen@igalia.com, 
 jadahl@redhat.com, sebastian.wick@redhat.com, shashank.sharma@amd.com, 
 agoins@nvidia.com, joshua@froggi.es, mdaenzer@redhat.com, aleixpol@kde.org, 
 victoria@system76.com, daniel@ffwll.ch, uma.shankar@intel.com, 
 quic_naseer@quicinc.com, quic_cbraga@quicinc.com, quic_abhinavk@quicinc.com, 
 marcan@marcan.st, Liviu.Dudau@arm.com, sashamcintosh@google.com, 
 chaitanya.kumar.borah@intel.com, louis.chauvet@bootlin.com, 
 Arthur Grillo <arthurgrillo@riseup.net>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am Do., 15. Mai 2025 um 22:00 Uhr schrieb Leandro Ribeiro
<leandro.ribeiro@collabora.com>:
>
>
>
> On 5/15/25 15:39, Daniel Stone wrote:
> > Hi,
> >
> > On Thu, 15 May 2025 at 19:02, Harry Wentland <harry.wentland@amd.com> wrote:
> >> On 2025-05-15 13:19, Daniel Stone wrote:
> >>> Yeah, the Weston patches are marching on. We've still been doing a
> >>> little bit of cleanup and prep work in the background to land them,
> >>> but we also can't land them until the kernel lands. None of that work
> >>> is material to the uAPI though: as said previously, the uAPI looks
> >>> completely solid and it's something we can definitely beneficially use
> >>> in Weston. (Even if we do need the obvious follow-ons for
> >>> post-blending as well ...)
> >>
> >> We can't merge kernel uAPI without canonical userspace that uses it.
> >> To move forward we'll need a userspace to at least publish a branch
> >> that shows the use of this new uAPI.
> >>
> >> Do you have a public branch for the Weston work for this?
> >
> > Yeah, https://gitlab.freedesktop.org/wayland/weston/-/merge_requests/1702
> > has been around for a little while now. There are some driver bugs
> > that Leandro commented on, but they don't seem material to the uAPI as
> > such?
>
> Hello,
>
> Yes, there's nothing related to the API that is blocking us. It seemed
> very flexible and easy to use. The bugs that I've spotted are probably
> internal to AMD driver.
>
> I'd say that the Weston patches are converging nicely, we just need time
> to get them fully reviewed. We had a few preparation MR's to land
> before !1702, and now there's only one left (!1617).

I also updated the KWin MR
(https://invent.kde.org/plasma/kwin/-/merge_requests/6600), it can now
use all the available properties and I think it's ready. I found two
issues with the kernel patches though:
- while attempting to set COLOR_ENCODING and COLOR_RANGE results in
the atomic commit being rejected, the existing values still get
applied if you use YCbCr-type buffers. I would've expected the color
pipeline to operate on the YUV values in that case - and leave
conversion to RGB up to the compositor adding the relevant matrix to
the pipeline
- the interpolation mode drm properties for 1D and 3D LUTs are
immutable, I think they shouldn't be - to make it less annoying if in
the future we decide to add modes that userspace can set

Other than that, I agree that it's ready to go.

> Thanks,
> Leandro
> >
> > Cheers,
> > Daniel
>
