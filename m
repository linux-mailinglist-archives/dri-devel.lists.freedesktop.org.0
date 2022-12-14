Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DCB364D023
	for <lists+dri-devel@lfdr.de>; Wed, 14 Dec 2022 20:38:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B325710E460;
	Wed, 14 Dec 2022 19:38:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-x32.google.com (mail-oa1-x32.google.com
 [IPv6:2001:4860:4864:20::32])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0AA6610E45C;
 Wed, 14 Dec 2022 19:38:08 +0000 (UTC)
Received: by mail-oa1-x32.google.com with SMTP id
 586e51a60fabf-1433ef3b61fso17980302fac.10; 
 Wed, 14 Dec 2022 11:38:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=VsgpUu524THLa4pjgkZ1KxwG+fWN6a7YV9owx/i+9+s=;
 b=AlqSWOqYKJPZvFPYre8csHfLNt0SMEFSX7e+P0eg3OffNY/tqIGTKFjTewkkebrZCb
 Bm/eGBlRs+07IBTzPykTJ63RgHp54AIInV2Yl/+dqAni63iuQidRBhR9EmiFpKlqhZvD
 vdz2s/orTf2wljYAZZO6V9I2rieh/YDf5NVYNuEJTgPrOHcOuR95AWpLTGlyzt6pTO/K
 /jB6zkzEXnHkzp5QfPQ7McIJ5AE7xAlyyrn3ZN9I/XCPsiWnpX8A/5M89KzgSsSlwsZ/
 BwayPUT2p0g7H8jkipFt7zYqN+fweh7WVxtZWhjc937hQqDFJModpKqMIIdUpNwKnOsL
 Qtsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=VsgpUu524THLa4pjgkZ1KxwG+fWN6a7YV9owx/i+9+s=;
 b=mWnhy7bqm/S6UAF+yCPCm7UtDkz91MRwSVYXNX+QE/TJ5iddYSD1NXWptgf6/IerSF
 tWqkc6nKLLrtUBjL1gR6W/hQoPhw8e6nlpJoLvWf0p2ZC5LowKjwYvIdwkQ0QJgZI5qd
 XNZc+F66LRph61pytIjtjzO+Fq91TXv7AaslHEaf/amHJwkHm5+AwR36K1yQHiLVxPH4
 2h05yAe8/J4PXL4PPqL2Ihp9E1163jMtTa5GdfLNTGNEooLJzRGRa6SFZ3RH6L6nTiDF
 IGGHdL9TZPzsZsmbwABY2ZLUlWM526qCpUj9qCeUQAIARi6ac/j6MSSex4k/mB48md49
 lRpQ==
X-Gm-Message-State: AFqh2kqaQq1Lm0S7Jb7KmyBZf1PJaQ2vD1GjbledugnVVG3qmaLAkU8N
 6XbxSs2xo4jCYSKbldpxInJY8BJwTFeNvQYPhn6VL/wZ8aU=
X-Google-Smtp-Source: AA0mqf4MwA81CIhaLht+F3aNY4XUeXkh0xYSjWk1ugIXjfupxe+evY6LzblXWU/2eb7CsuZJJekpvOwMFwP8Z3Y643o=
X-Received: by 2002:a05:6870:41cd:b0:148:3c8f:15ab with SMTP id
 z13-20020a05687041cd00b001483c8f15abmr443340oac.46.1671046687186; Wed, 14 Dec
 2022 11:38:07 -0800 (PST)
MIME-Version: 1.0
References: <20221212182137.374625-1-harry.wentland@amd.com>
 <20221212182137.374625-7-harry.wentland@amd.com>
 <20221213122342.548631bf@eldfell>
 <25da5107-9bdf-abc9-adf8-98778d87dafc@amd.com>
 <20221214105556.63a9296e@eldfell>
In-Reply-To: <20221214105556.63a9296e@eldfell>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Wed, 14 Dec 2022 14:37:55 -0500
Message-ID: <CADnq5_MSnsq7TKO+A4wwnYZ6Lt8gu2gA+uu_DTK3ZRUAY249tg@mail.gmail.com>
Subject: Re: [PATCH 06/16] drm/connector: Allow drivers to pass list of
 supported colorspaces
To: Pekka Paalanen <ppaalanen@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
 Uma Shankar <uma.shankar@intel.com>, dri-devel@lists.freedesktop.org,
 Joshua Ashton <joshua@froggi.es>, Vitaly.Prosyak@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Dec 14, 2022 at 3:56 AM Pekka Paalanen <ppaalanen@gmail.com> wrote:
>
> On Tue, 13 Dec 2022 11:32:01 -0500
> Harry Wentland <harry.wentland@amd.com> wrote:
>
> > On 12/13/22 05:23, Pekka Paalanen wrote:
> > > On Mon, 12 Dec 2022 13:21:27 -0500
> > > Harry Wentland <harry.wentland@amd.com> wrote:
> > >
> > >> Drivers might not support all colorspaces defined in
> > >> dp_colorspaces and hdmi_colorspaces. This results in
> > >> undefined behavior when userspace is setting an
> > >> unsupported colorspace.
> > >>
> > >> Allow drivers to pass the list of supported colorspaces
> > >> when creating the colorspace property.
> > >
> > > Hi Harry,
> > >
> > > what is there for drivers to support? Isn't this just infoframe data
> > > that shall be sent down to the sink as-is with no other effect?
> > >
> >
> > You have a good point.
> >
> > Right now the supported colorspaces de-facto depend on driver implement=
ations
> > as you can see in [1] for i915 and [2] for amdgpu. The amdgpu driver wi=
ll
> > also program the MSA [3] for DP connections, and a bunch of other thing=
s which
> > are deeper in the driver.
> >
> > [1] https://gitlab.freedesktop.org/hwentland/linux/-/blob/hdr-colorimet=
ry/drivers/gpu/drm/i915/display/intel_dp.c#L1741
> > [2] https://gitlab.freedesktop.org/hwentland/linux/-/blob/hdr-colorimet=
ry/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c#L5155
> > [3] https://gitlab.freedesktop.org/hwentland/linux/-/blob/hdr-colorimet=
ry/drivers/gpu/drm/amd/display/dc/dcn10/dcn10_stream_encoder.c#L368
> >
> > I don't know why the DP VSC stuff needs to be in drivers. It should be
> > common. The MSA packing would likely have to be driver specific since t=
he
> > mechanism of packing it is HW specific.
>
> What's MSA?

I think it's Main Stream Attribute data.  Part of DP.  See slide 31 of
this document:
https://www.vesa.org/wp-content/uploads/2011/01/ICCE-Presentation-on-VESA-D=
isplayPort.pdf

Alex

>
> I don't see it in
> https://www.kernel.org/doc/html/latest/gpu/amdgpu/display/dc-glossary.htm=
l
> or anywhere under Documentation/gpu or in CTA-861-H.
>
> > I'll have a closer look and see if we can eliminate the "driver support=
ed"
> > bit. If we can't we'll probably need to describe the reasoning better.
>
> That would be nice, thanks!
>
> > Will it be a problem if the list of supported colorspaces differs betwe=
en
> > drivers?
>
> I do not think so. It's just normal KMS UAPI that one must always
> inspect an enumeration to see what values are possible. Userspace
> cannot use a header with pre-defined numerical values, they always need
> to be introspected first like everything else about KMS properties.
>
> I know there were some opinions about hard-coding enum numerical values
> in headers, but I think in the end everyone agreed to the introspection
> even if it didn't seem useful at the time.
>
> Besides, if a driver never supported a given value but misbehaved or
> refused, I don't think that counts as a kernel regression?
>
>
> Thanks,
> pq
>
> >
> > Harry
> >
> > > Is the driver confusing colorimetry with color-representation (the
> > > RGB-YCbCr conversion)? Or is this property defining both?
> > >
> > > I feel that the documentation of "Colorspace" KMS connector property
> > > needs clarification, and a list of potentially available values with
> > > explanations, more than just a reference to CTA-816-H which it does n=
ot
> > > even do yet.
> > >
> > > Perhaps a table, where for each enum drm_colorspace entry has a row e=
xplaining:
> > >
> > >
> > > Thanks,
> > > pq
> > >
> > >
> > >> Signed-off-by: Harry Wentland <harry.wentland@amd.com>
> > >> Cc: Pekka Paalanen <ppaalanen@gmail.com>
> > >> Cc: Sebastian Wick <sebastian.wick@redhat.com>
> > >> Cc: Vitaly.Prosyak@amd.com
> > >> Cc: Uma Shankar <uma.shankar@intel.com>
> > >> Cc: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>
> > >> Cc: Joshua Ashton <joshua@froggi.es>
> > >> Cc: dri-devel@lists.freedesktop.org
> > >> Cc: amd-gfx@lists.freedesktop.org
> > >> ---
> > >>  drivers/gpu/drm/drm_connector.c               | 140 +++++++++------=
---
> > >>  .../gpu/drm/i915/display/intel_connector.c    |   4 +-
> > >>  drivers/gpu/drm/vc4/vc4_hdmi.c                |   2 +-
> > >>  include/drm/drm_connector.h                   |   8 +-
> > >>  4 files changed, 83 insertions(+), 71 deletions(-)
> > >>
