Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F68C6987A2
	for <lists+dri-devel@lfdr.de>; Wed, 15 Feb 2023 23:07:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 283F710EC60;
	Wed, 15 Feb 2023 22:07:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x833.google.com (mail-qt1-x833.google.com
 [IPv6:2607:f8b0:4864:20::833])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C3D2B10EC6B
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Feb 2023 22:07:46 +0000 (UTC)
Received: by mail-qt1-x833.google.com with SMTP id q13so253982qtx.2
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Feb 2023 14:07:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fooishbar-org.20210112.gappssmtp.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=tEDwLa0nzqfWeWBY3WezxbextkU33J6bq+CoUoE9s3o=;
 b=Hvq/EKdYeFvjgSd8wYuxIPXkzcCDNyA0chEl7RG37xF2no/+26zz3WSG2i1AAPpbkR
 Gy3YZmBSiwYU9QdnpBGLjQ5rhF45jk9lyaQ237VmMm0ODjRDo4zgWvxjLXWESHG25vy+
 0dRj4FUlKW3/YldLDzYYD1dINTKVXIKQcx3XDMNO81M61Ubp1k9rBPX0D9Zpwk4VHMiC
 CbYwMxzqX7xl4rrasyh79Y/hHf0iCN2SeZrdLtMmgwJ5zivxZAVWkIb7xUIwusxxDrrX
 2BompUNgpb1b0mV1lkm1WJ42nNzKJRldwqs+CmPuYp3zIEUE5ZgTQc7u1LTfn2s58p1s
 +1hQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=tEDwLa0nzqfWeWBY3WezxbextkU33J6bq+CoUoE9s3o=;
 b=YehufheGVGdGiv5qgK5z2s5Xjvcru29oyFyllqVMC0k6FHYI37Ad6ITv4f8xFFxKHW
 P0VLigOEMCIVQ1OiWqJqfC+nOaOpaxi0kEPoVmOkumcIzESKlSol9E4eaeksvHecPG0R
 OZdxKZ+PAJ6VBYANQ9meR/8tqygPxDBuF6KI43q/XlddvuNmh2TGxbkRrCy9y3nUQQtM
 ezuIvNxxABUoOne3NO/9iQ1m3ARKqbgpNQiQmb939AK8APBqUKlvUEI9ZH6Uigbmcftp
 a660PxudGGHlFhTk1ZaFdS5zPEVNx5LZBSgXZMjZTptZDxvbYNZBdYswZwqDA2rkkw2l
 VlrA==
X-Gm-Message-State: AO0yUKXCk5iwGctmRgbtXaEQ74TqkXXq2eEZE2FuuJf+p+IDiuFKQHH6
 MuZtUIBauhYlb+Ybd3y0gXhKUBm8BWSgvNh2e8oEIg==
X-Google-Smtp-Source: AK7set+RIG4SAYf/qvh73MnYCF/0A7xCb253KhfwHZ9w/wcIDgSyMOHjmS3G++IkFPp+4eGHj7+WISicB+xvkBQ4dJk=
X-Received: by 2002:ac8:7d03:0:b0:3ba:2848:ea6f with SMTP id
 g3-20020ac87d03000000b003ba2848ea6fmr354736qtb.338.1676498865675; Wed, 15 Feb
 2023 14:07:45 -0800 (PST)
MIME-Version: 1.0
References: <20230203020744.30745-1-joshua@froggi.es>
 <20230203020744.30745-3-joshua@froggi.es>
 <Y9zkef5FjtZ7guVS@intel.com>
 <CA+hFU4ymiOg06MQeKLcn5MSrR=BZnOLODdZCFvGUdWqt_ha61A@mail.gmail.com>
 <0fc18aec-0703-55f4-f635-d09d345e8dc0@amd.com> <Y90l+DY0rSaMvN1U@intel.com>
 <758e5cf6-53e0-567c-c760-5b773bc7a11c@amd.com> <Y90vrEa3/1RbaGOV@intel.com>
 <CA+hFU4wuM_xHniFyRT+jouQ3k_S3UJsRpAtd1Lgx9UVLtrqZrQ@mail.gmail.com>
 <98d1d22a-1c29-5271-1eaf-89c962eb9678@amd.com>
 <CAPj87rP0E17Z8beoDi_c+RdcpyZnCXTrxFkQSJUi0qN2GNoq+w@mail.gmail.com>
 <5288b9ef-ed1f-842f-4fa3-0cc00a1b1188@amd.com>
In-Reply-To: <5288b9ef-ed1f-842f-4fa3-0cc00a1b1188@amd.com>
From: Daniel Stone <daniel@fooishbar.org>
Date: Wed, 15 Feb 2023 22:07:34 +0000
Message-ID: <CAPj87rOfMOchED+CHEaKr=8EXgdbpshmLGz48QnOGSQfK3uzvw@mail.gmail.com>
Subject: Re: [PATCH 3/3] drm/connector: Deprecate split for BT.2020 in
 drm_colorspace enum
To: Harry Wentland <harry.wentland@amd.com>
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
Cc: Sebastian Wick <sebastian.wick@redhat.com>, amd-gfx@lists.freedesktop.org,
 Pekka Paalanen <ppaalanen@gmail.com>, Uma Shankar <uma.shankar@intel.com>,
 dri-devel@lists.freedesktop.org, Joshua Ashton <joshua@froggi.es>,
 Vitaly.Prosyak@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 15 Feb 2023 at 20:54, Harry Wentland <harry.wentland@amd.com> wrote:
> On 2/15/23 06:46, Daniel Stone wrote:
> > On Tue, 14 Feb 2023 at 16:57, Harry Wentland <harry.wentland@amd.com> wrote:
> >> On 2/14/23 10:49, Sebastian Wick wrote:
> >> From what I've seen recently I am inclined to favor an incremental
> >> approach more. The reason is that any API, or portion thereof, is
> >> useless unless it's enabled full stack. When it isn't it becomes
> >> dead code quickly, or never really works because we overlooked
> >> one thing. The colorspace debacle shows how even something as
> >> simple as extra enum values in KMS APIs shouldn't be added unless
> >> someone in a canonical upstream project actually uses them. I
> >> would argue that such a canonical upstream project actually has
> >> to be a production environment and not something like Weston.
> >
> > Just to chime in as well that it is a real production environment;
> > it's probably actually shipped the most of any compositor by a long
> > way. It doesn't have much place on the desktop, but it does live in
> > planes, trains, automobiles, digital signage, kiosks, STBs/TVs, and
> > about a billion other places you might not have expected.
> >
>
> Understood.
>
> Curious if there's a list of some concrete examples.

If I was allowed to name them, I'd definitely be doing a much better
job of promoting it ... but if you've bought a car in the last 7-8
years, it's much more likely than not that its console display is
using Weston. Probably about 50% odds that you've flown on a plane
whose IFE is driven by Weston. You've definitely walked past a lot of
digital signage advertisements and display walls which are driven by
Weston. There are a huge number of consumer products (and other modes
of transport, would you believe?) that are too, but I can't name them
because it gets too specific.

The cars are probably using a 10+ year old (and frankly awful) SoC.
The display walls are probably using a 6ish-year-old SoC with
notoriously poor memory bandwidth. Or TVs trying to make 4K UIs fly on
an ancient (pre-unified-shader) GPU. The hits go on. We do ship things
on nice and capable new hardware as well, but keeping old hardware
working with new software stacks is non-negotiable for us, and we have
to bend over backwards to make that happen.

> >> We should look at this from a use-case angle, similar to what
> >> the gamescope guys are doing. Small steps, like:
> >> 1) Add HDR10 output (PQ, BT.2020) to the display
> >> 2) Add ability to do sRGB linear blending
> >> 3) Add ability to do sRGB and PQ linear blending
> >> 4) Post-blending 3D LUT
> >> 5) Pre-blending 3D LUT
> >>
> >> At each stage the whole stack needs to work together in production.
> >
> > Personally, I do think at this stage we probably have enough of an
> > understanding to be able to work with an intermediate solution. We
> > just need to think hard about what that intermediate solution is -
> > making sure that we don't end up in the same tangle of impossible
> > semantics like the old 'broadcast RGB' / colorspace / HDR properties
> > which were never thought through - so that it is something we can
> > build on rather than something we have to work around. But it would be
> > really good to make HDR10/HDR10+ media and HDR games work on HDR
> > displays, yeah.
>
> I have a feeling we'll make some progress here this year. I definitely
> think the whole HDR/Colour work is on the right track in Weston and
> Wayland which will hopefully give us a good base to work with over
> many years.

Yep!

Coming to the point you were making in the other mail - Weston was
traditionally used as _the_ enablement vehicle for KMS, because we
cared about using the depth of hardware much more than anyone else
(e.g. being years ahead on planes), and the vendor who wanted to
enable it either wanted to enable Weston specifically or just didn't
have an open userspace stack for it. The other compositors couldn't be
that vehicle, either because they were more focused on desktop UI, or
they could just afford to throw the GPU at it and suck up the
occasional frame hitch / thermal burn / etc. I like to think we had a
reputation for being pretty thoughtful and careful with our review as
well, and didn't give it lightly to misguided ideas which caused
long-term problems.

But we've got a greater diversity in userspace these days, and that's
no bad thing. If the best vehicle to demonstrate HDR GPU rendering is
gamescope, then use gamescope as that vehicle. We'll be there if we
can, and if it makes sense for us, but it's not a requirement.

Cheers,
Daniel
