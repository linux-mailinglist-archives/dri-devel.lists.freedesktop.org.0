Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0ECE0697B0A
	for <lists+dri-devel@lfdr.de>; Wed, 15 Feb 2023 12:46:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1B38B10E115;
	Wed, 15 Feb 2023 11:46:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x831.google.com (mail-qt1-x831.google.com
 [IPv6:2607:f8b0:4864:20::831])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8228410E1E8
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Feb 2023 11:46:51 +0000 (UTC)
Received: by mail-qt1-x831.google.com with SMTP id c2so21386891qtw.5
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Feb 2023 03:46:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fooishbar-org.20210112.gappssmtp.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=hViB0MKP1vfMl/LEpFk2hq1vBGh/G3kgc7krlo/nwlc=;
 b=FPDydcBBqOHwhnzPaAy+lNUtokCPRSIgDfOeX2lVceoOhF6C1++h0KuG2t0xNJnI5i
 B+6a9hzNen8VFxg7QROtM36J6c5NsQek3SuJJ/7JtVmTk3SP13nXx9awHPdeTlyLJvot
 2LDyeexzU7NxvlVbG0YDsU6DRRnHiUzEX5df975JzMQp5KL/fU6VwStfAvnGpXUtuYOK
 Z5Lc/OYRluCwvwNjbm4Pjxuuu5iVNqtl0oLf8eCRHCGYHkHSvG1NZskAzSkGGGK1BvIZ
 w1DM/CjnYZsbA58r6ap6je/AUbuVxAaSNZPKfMQA6BlQUiK5yWNNyfmWZuSD6G9+JeOu
 wSSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=hViB0MKP1vfMl/LEpFk2hq1vBGh/G3kgc7krlo/nwlc=;
 b=UM48pmTWVmsOwA36S/Z4glc79SCTeWDy6j40Pnv4vSpi0ByIbJbU3P2XFKiryrOFVf
 +RYccoR2DZS0G0op0DBK8SeemW8c8k4vT2Ta8ZN71Gm2x5cgGau9xsI0//6uw4Q1wLpI
 yuRmr9PRzO9Pz4Ht6NeFDJ4ROk5NtDz7iIIa6G+YcYfRV/8WWayu9qA58oxeDaQ8dr/Z
 nERC/+Mvz6U9aCsxoZXZU68kh1hfsz+XARzcDLkI2KHV0lEbbyKJ4p0rzVgc57x80UXS
 dQ7IET2711lZIM5YziSCXwIhOCdZwOGiQeAUSAPJO6AsndRoe8MXCrxkIalBiYCufB9K
 Kn9w==
X-Gm-Message-State: AO0yUKU9qKRvbsgAxGVKwbNnu2AFk9UIZZxRwqMpGOhbNs05hhJzQD7H
 PPRXwg1EH93t0sxNd6C+KvBn3gVJg9vbgyYoAuUCKA==
X-Google-Smtp-Source: AK7set8fQ/ejAY5fIptsiJOLZh+HpV+mXCEqmG36uCqpYGSmoV0Vsx0u1l0EzFr+wq4qMDDYzB4hPQN81Oq/7nTKVIk=
X-Received: by 2002:ac8:7d03:0:b0:3ba:2848:ea6f with SMTP id
 g3-20020ac87d03000000b003ba2848ea6fmr222069qtb.338.1676461610429; Wed, 15 Feb
 2023 03:46:50 -0800 (PST)
MIME-Version: 1.0
References: <20230203020744.30745-1-joshua@froggi.es>
 <20230203020744.30745-3-joshua@froggi.es>
 <Y9zkef5FjtZ7guVS@intel.com>
 <CA+hFU4ymiOg06MQeKLcn5MSrR=BZnOLODdZCFvGUdWqt_ha61A@mail.gmail.com>
 <0fc18aec-0703-55f4-f635-d09d345e8dc0@amd.com> <Y90l+DY0rSaMvN1U@intel.com>
 <758e5cf6-53e0-567c-c760-5b773bc7a11c@amd.com> <Y90vrEa3/1RbaGOV@intel.com>
 <CA+hFU4wuM_xHniFyRT+jouQ3k_S3UJsRpAtd1Lgx9UVLtrqZrQ@mail.gmail.com>
 <98d1d22a-1c29-5271-1eaf-89c962eb9678@amd.com>
In-Reply-To: <98d1d22a-1c29-5271-1eaf-89c962eb9678@amd.com>
From: Daniel Stone <daniel@fooishbar.org>
Date: Wed, 15 Feb 2023 11:46:39 +0000
Message-ID: <CAPj87rP0E17Z8beoDi_c+RdcpyZnCXTrxFkQSJUi0qN2GNoq+w@mail.gmail.com>
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

Hi,

On Tue, 14 Feb 2023 at 16:57, Harry Wentland <harry.wentland@amd.com> wrote:
> On 2/14/23 10:49, Sebastian Wick wrote:
> From what I've seen recently I am inclined to favor an incremental
> approach more. The reason is that any API, or portion thereof, is
> useless unless it's enabled full stack. When it isn't it becomes
> dead code quickly, or never really works because we overlooked
> one thing. The colorspace debacle shows how even something as
> simple as extra enum values in KMS APIs shouldn't be added unless
> someone in a canonical upstream project actually uses them. I
> would argue that such a canonical upstream project actually has
> to be a production environment and not something like Weston.

Just to chime in as well that it is a real production environment;
it's probably actually shipped the most of any compositor by a long
way. It doesn't have much place on the desktop, but it does live in
planes, trains, automobiles, digital signage, kiosks, STBs/TVs, and
about a billion other places you might not have expected.

Probably the main factor that joins all these together - apart from
not having much desktop-style click-and-drag reconfigurable UI - is
that we need to use the hardware pipeline as efficiently as possible,
because either we don't have the memory bandwidth to burn like
desktops, or we need to minimise it for power/thermal reasons.

Given that, we don't really want to paint ourselves into a corner with
incremental solutions that mean we can't do fully efficient things
later. We're also somewhat undermanned, and we've been using our
effort to try to make sure that the full solution - including full
colour-managed pathways for things like movie and TV post-prod
composition, design, etc - is possible at some point through the full
Wayland ecosystem at some point. The X11 experience was so horribly
botched that it wasn't really possible without a complete professional
setup, and that's something I personally don't want to see. However
...

> I could see us getting to a fully new color pipeline API but
> the only way to do that is with a development model that supports
> it. While upstream needs to be our ultimate goal, a good way
> to bring in new APIs and ensure a full-stack implementation is
> to develop them in a downstream production kernel, alongside
> userspace that makes use of it. Once the implementation is
> proven in the downstream repos it can then go upstream. This
> brings new challenges, though, as things don't get wide
> testing and get out of sync with upstream quickly. The
> alternative is the incremental approach.
>
> We should look at this from a use-case angle, similar to what
> the gamescope guys are doing. Small steps, like:
> 1) Add HDR10 output (PQ, BT.2020) to the display
> 2) Add ability to do sRGB linear blending
> 3) Add ability to do sRGB and PQ linear blending
> 4) Post-blending 3D LUT
> 5) Pre-blending 3D LUT
>
> At each stage the whole stack needs to work together in production.

Personally, I do think at this stage we probably have enough of an
understanding to be able to work with an intermediate solution. We
just need to think hard about what that intermediate solution is -
making sure that we don't end up in the same tangle of impossible
semantics like the old 'broadcast RGB' / colorspace / HDR properties
which were never thought through - so that it is something we can
build on rather than something we have to work around. But it would be
really good to make HDR10/HDR10+ media and HDR games work on HDR
displays, yeah.

Cheers,
Daniel
