Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DC9063FD89
	for <lists+dri-devel@lfdr.de>; Fri,  2 Dec 2022 02:15:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 360EF10E699;
	Fri,  2 Dec 2022 01:15:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-x1136.google.com (mail-yw1-x1136.google.com
 [IPv6:2607:f8b0:4864:20::1136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2340110E69E
 for <dri-devel@lists.freedesktop.org>; Fri,  2 Dec 2022 01:14:56 +0000 (UTC)
Received: by mail-yw1-x1136.google.com with SMTP id
 00721157ae682-3cbdd6c00adso34566757b3.11
 for <dri-devel@lists.freedesktop.org>; Thu, 01 Dec 2022 17:14:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=basnieuwenhuizen.nl; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=tlKbYru5UjdsLgU/7Cbp9qdS5lhekUH2mssFtSuOPgw=;
 b=bkRxCWns+JRelMjgGaAeyBkOU6qNxIhmViIrvK2h6iTAIJFaLR/dJ1kYuEjeUTEM/7
 akzY7s1gTZb+x2Q9h+dpeA7qjV2dB+DPqGAziJURWrrNrvObs0lJipxKJTalAwix+5m/
 1mDp8dDLf6xXFcd/sORKN5ZeaisLwV0JjbZccX2HHqjI4FXZC/nLNwq/oWS+O8QosfR+
 Rt2dx9NDnb1wjsrWttBPck9WSCSMgnwK+BKy6JI0luEF5JOwM+5L/IXUBEzJdz/rd2Ch
 o2nu6RDeJHtSkI3WouIPCujsujrLIwDN/apMTv22RbayEQnXtIHWT/s8jnGQixFrtJcW
 fAuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=tlKbYru5UjdsLgU/7Cbp9qdS5lhekUH2mssFtSuOPgw=;
 b=i5zoSDgpiAq9j0syFOx26Pe+ECA0KpnKoXrHBa58ZO20/NYZFDyANNavg7xuRKJ5yq
 2RX8mO9SYFC9S+tRwEg2kI2eONevTWPjDCpzVcOey4QX/Wpk54s7nviW74NfBqJFEztJ
 W/2++yl2yU4bdojzQvK8psi2M3Dgb2z9MHtkDKFFjQE626FQ6Is5btctTCWD9RYk0V8w
 7LkrC3cfzalzF+gu5UCx379NGmFxnQmsavV1e6WG8A5lZSGODXGURdSUerFjN9F2AH8y
 E05qdpzV2xZ0gJcpIKqN76x0gOukMkRWRoR7F9r/rAReLAYjvVC2JU+KdJgO59qbaKdu
 vLhQ==
X-Gm-Message-State: ANoB5pkEm+rNTAx0Ezviqdwzfq3UJTKHs6n3/JmSV3k2Tdb0w3DP+P48
 uJ0H5MfH63U7KuZYMMFjFjuaPAAFACqqzDa7csaM3A==
X-Google-Smtp-Source: AA0mqf558XwjI+QuwkdijU9jK6MT+xYe6mAFqIUjL0amjNFgd1eQ9y6GX4gYYPESbrvkbJv6jWEwhdLNeJgSXwYZJ2k=
X-Received: by 2002:a81:7851:0:b0:3b6:e1ed:4185 with SMTP id
 t78-20020a817851000000b003b6e1ed4185mr33393160ywc.330.1669943695158; Thu, 01
 Dec 2022 17:14:55 -0800 (PST)
MIME-Version: 1.0
References: <20221123192437.1065826-1-daniel.vetter@ffwll.ch>
 <Y4h85n6krZ3CVkQp@phenom.ffwll.local>
 <CAKMK7uErF0THyGHcke=AizGhJkaoQpN6PzjykbFFCX6eJ6DoJQ@mail.gmail.com>
 <CAOFGe96bgSSSrW-KXBBtmgB+4j9D55x1KMW3k-vrFxQ7P-to-g@mail.gmail.com>
In-Reply-To: <CAOFGe96bgSSSrW-KXBBtmgB+4j9D55x1KMW3k-vrFxQ7P-to-g@mail.gmail.com>
From: Bas Nieuwenhuizen <bas@basnieuwenhuizen.nl>
Date: Fri, 2 Dec 2022 02:14:03 +0100
Message-ID: <CAP+8YyHHB_NTMTeOWSxVTjncj1iWD-uJKiPWW=jtpXug4yp9tw@mail.gmail.com>
Subject: Re: [PATCH] drm/fourcc: Document open source user waiver
To: Jason Ekstrand <jason@jlekstrand.net>
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
Cc: Neil Trevett <ntrevett@nvidia.com>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 =?UTF-8?B?TWFyZWsgT2zFocOhaw==?= <marek.olsak@amd.com>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Daniel Vetter <daniel.vetter@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Acked-by: Bas Nieuwenhuizen <bas@basnieuwenhuizen.nl>

On Thu, Dec 1, 2022 at 8:47 PM Jason Ekstrand <jason@jlekstrand.net> wrote:
>
> Acked-by: Jason Ekstrand <jason.ekstrand@collabora.com>
>
> On Thu, Dec 1, 2022 at 4:22 AM Daniel Vetter <daniel.vetter@ffwll.ch> wrote:
>>
>> On Thu, 1 Dec 2022 at 11:07, Daniel Vetter <daniel@ffwll.ch> wrote:
>> >
>> > On Wed, Nov 23, 2022 at 08:24:37PM +0100, Daniel Vetter wrote:
>> > > It's a bit a FAQ, and we really can't claim to be the authoritative
>> > > source for allocating these numbers used in many standard extensions
>> > > if we tell closed source or vendor stacks in general to go away.
>> > >
>> > > Iirc this was already clarified in some vulkan discussions, but I
>> > > can't find that anywhere anymore. At least not in a public link.
>> > >
>> > > Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
>> > > Cc: Maxime Ripard <mripard@kernel.org>
>> > > Cc: Thomas Zimmermann <tzimmermann@suse.de>
>> > > Cc: David Airlie <airlied@gmail.com>
>> > > Cc: Daniel Vetter <daniel@ffwll.ch>
>> > > Cc: Alex Deucher <alexdeucher@gmail.com>
>> > > Cc: Daniel Stone <daniel@fooishbar.org>
>> > > Cc: Bas Nieuwenhuizen <bas@basnieuwenhuizen.nl>
>> > > Cc: Jason Ekstrand <jason@jlekstrand.net>
>> > > Cc: Neil Trevett <ntrevett@nvidia.com>
>> > > Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
>> >
>> > From irc:
>> >
>> > <airlied> danvet: ack from me
>>
>> Also from irc:
>>
>> <mareko> danvet: Acked
>>
>> -Daniel
>>
>> > > ---
>> > >  include/uapi/drm/drm_fourcc.h | 12 ++++++++++++
>> > >  1 file changed, 12 insertions(+)
>> > >
>> > > diff --git a/include/uapi/drm/drm_fourcc.h b/include/uapi/drm/drm_fourcc.h
>> > > index bc056f2d537d..de703c6be969 100644
>> > > --- a/include/uapi/drm/drm_fourcc.h
>> > > +++ b/include/uapi/drm/drm_fourcc.h
>> > > @@ -88,6 +88,18 @@ extern "C" {
>> > >   *
>> > >   * The authoritative list of format modifier codes is found in
>> > >   * `include/uapi/drm/drm_fourcc.h`
>> > > + *
>> > > + * Open Source User Waiver
>> > > + * -----------------------
>> > > + *
>> > > + * Because this is the authoritative source for pixel formats and modifiers
>> > > + * referenced by GL, Vulkan extensions and other standards and hence used both
>> > > + * by open source and closed source driver stacks, the usual requirement for an
>> > > + * upstream in-kernel or open source userspace user does not apply.
>> > > + *
>> > > + * To ensure, as much as feasible, compatibility across stacks and avoid
>> > > + * confusion with incompatible enumerations stakeholders for all relevant driver
>> > > + * stacks should approve additions.
>> > >   */
>> > >
>> > >  #define fourcc_code(a, b, c, d) ((__u32)(a) | ((__u32)(b) << 8) | \
>> > > --
>> > > 2.37.2
>> > >
>> >
>> > --
>> > Daniel Vetter
>> > Software Engineer, Intel Corporation
>> > http://blog.ffwll.ch
>>
>>
>>
>> --
>> Daniel Vetter
>> Software Engineer, Intel Corporation
>> http://blog.ffwll.ch
