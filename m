Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DA8C06A586F
	for <lists+dri-devel@lfdr.de>; Tue, 28 Feb 2023 12:37:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8320C10E21C;
	Tue, 28 Feb 2023 11:37:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ua1-x92b.google.com (mail-ua1-x92b.google.com
 [IPv6:2607:f8b0:4864:20::92b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B114D10E21C
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Feb 2023 11:37:55 +0000 (UTC)
Received: by mail-ua1-x92b.google.com with SMTP id s13so904115uac.8
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Feb 2023 03:37:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=raspberrypi.com; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=ZneDrVC+Q1mfJWiaClOnXtiGbPK/7OtXKbLhAqZkl8Q=;
 b=IaK6WmIVv0Ga2+ChDPzTBMdBK5Ftk0le5RT+Yv3d/n13m+FlDGUEE1u1g/s3Ig4Lqk
 +5vdPncOXtSoX8zKJZEylN7t7KHswbAYYSh3LU+/NyhBDEB24dcVDi3So08ax4xfZDGu
 FqWRemzYiRm0WynhW/IBSdY2GaQkwmqldapBsAQNNJY3aD89nGaLAUC1MNXGcr7FKtX0
 f4ddt16GawuhAWoCcT0/2bVbd8EBaewHHkqjE254OQ89pV2Ghbi72Y+VNNkuMFWKltNn
 31ZaXTmAX6grg3kturcvjHga/1yW4gvRaRfRiuN8X3un9iCxUyJG0xFwdoYkX4JcCZuG
 leFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ZneDrVC+Q1mfJWiaClOnXtiGbPK/7OtXKbLhAqZkl8Q=;
 b=md28UoyGpWnv67IrTFQMNidx6+BMvjTx/nBk8hEJWxmpYrUfnIpBWB0PSJP3KPabOy
 gV3H3/eDwc9+otqkLL5VEWo8cMZieQAiROLRC5toUH1F/1gFYAqepazvXP8jtAAgwH9H
 Zfd8tekOuGg1T4uMYqPP58DrKCnSmAWtfeijXuiX9Ui8+BBQTeaPNPteyjrKvT7ws6NP
 vGeD1TzzzZWAZzL3fRU0s4cx2IQqFK7WwW8NPPuNcJxMBMnt7vogGbR+RNV25+fqsUBj
 Cog+9bYy5LIj//0iDu/26kMRG04rIREt6mjkisFleYAq5/85bFsVe/vdcnIHmBU/h32J
 jk7w==
X-Gm-Message-State: AO0yUKUtmHteZjJu6JyJUVum5jPB6No/XEFZ/hCI9cyJJz3Pg1fKCxDQ
 OhgDIW9RaESKEXKUunGcuVfnep4Mn2M/wy4iuwN2iw==
X-Google-Smtp-Source: AK7set++ewsseFogjrbuQ1trmYroBY2NqKY45tQn6ULuf74qYSoNWWpz9De4vlNK6aaroekG1/0R7p5JTA1CYAgLcmo=
X-Received: by 2002:ab0:4a97:0:b0:68e:2ed3:92eb with SMTP id
 s23-20020ab04a97000000b0068e2ed392ebmr1476159uae.1.1677584274711; Tue, 28 Feb
 2023 03:37:54 -0800 (PST)
MIME-Version: 1.0
References: <20230227122108.117279-1-contact@emersion.fr>
 <20230228104642.21dae84c@eldfell>
 <UA_4dHbPqQvjG0TrP7OhP73PFlhdTNg9Mx9GW3MRGX_JskeQHTNaZyKTBj4AmJoSgutHZeQTa08RkRBuFS6xfTPpEm7MrVtJZEaq88ZYg1s=@emersion.fr>
 <20230228121222.4abf13cb@eldfell>
In-Reply-To: <20230228121222.4abf13cb@eldfell>
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Tue, 28 Feb 2023 11:37:38 +0000
Message-ID: <CAPY8ntD1ScfbT5C-L1i0D6ZikKn2VtLX8dCdhvKGzSjHvyn=ug@mail.gmail.com>
Subject: Re: [PATCH] drm: document TV margin properties
To: Pekka Paalanen <ppaalanen@gmail.com>
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
Cc: =?UTF-8?Q?Noralf_Tr=C3=B8nnes?= <noralf@tronnes.org>,
 Maxime Ripard <maxime@cerno.tech>, dri-devel@lists.freedesktop.org,
 Mateusz Kwiatkowski <kfyatek+publicgit@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Pekka

On Tue, 28 Feb 2023 at 10:12, Pekka Paalanen <ppaalanen@gmail.com> wrote:
>
> On Tue, 28 Feb 2023 09:53:47 +0000
> Simon Ser <contact@emersion.fr> wrote:
>
> > On Tuesday, February 28th, 2023 at 09:46, Pekka Paalanen <ppaalanen@gmail.com> wrote:
> >
> > > can these be negative as well, to achieve overscan and not just
> > > underscan? Did I get overscan and underscan right... these are related
> > > to under/overscan, aren't they?
> > >
> > > Hmm, no, I guess that doesn't make sense, there is no room in the
> > > signal to have negative margins, it would result in clipping the
> > > framebuffer while scaling up. So this can only be used to scale
> > > framebuffer down, add borders, and the TV then scales it back up
> > > again?
> >
> > Correct.
> >
> > > Looks like neither my Intel nor AMD cards support these, I don't see
> > > the properties. More things to the list of KMS properties Weston needs
> > > to explicitly control. Oh, it seems vc4 exclusive for now.

I've started a discussion with Simon with regard overscan handling [1].
There would be nothing stopping Weston ignoring the DRM properties if
Weston/userspace provides a way to reduce the destintation rectangle
on the display device. Using that would also be renderer agnostic.

[1] https://gitlab.freedesktop.org/wlroots/wlroots/-/issues/3597

> > i915 does support it but for TV connectors only (i915/display/intel_tv.c).
> > gud also supports it.
> >
> > > Where does this text appear in the HTML kernel docs? I tried to look at
> > > drm_connector.c but I cannot find the spot where this patch applies.
> >
> > Here:
> > https://dri.freedesktop.org/docs/drm/gpu/drm-kms.html#analog-tv-specific-connector-properties
>
> Analog TV properties? So this does not apply to e.g. HDMI?
>
> I believe HDMI TVs do have the problems that margins could mitigate.

Correct. Particularly on TVs instead of monitors, it's not uncommon to
find the HDMI output gets overscanned.

> > > Is this actually a connector property? How does that work, should this
> > > not be a CRTC property?
> >
> > Yeah, it's a connector property for some reason.
> >
> > > Is this instead not scaling anything but simply sending metadata
> > > through the connector?
> >
> > No metadata is sent. This is purely equivalent to setting up CRTC_*
> > properties to scale the planes.
>
> Oh! That would be really good to mention in the doc. Maybe even prefer
> plane props over this? Or is this for analog TV, and plane props for
> digital TV?
>
>
> The above are the important comments. All below is just musings you can
> ignore if you wish.
>
> > > Or are there underlying requirements that this connector property is
> > > actually affecting the CRTC, which means that it is fundamentally
> > > impossible to use multiple connectors with different values on the same
> > > CRTC? And drivers will reject any attempt, so there is no need to
> > > define what conflicting settings will do?
> >
> > I don't think any driver above supports cloning CRTCs for these
> > connector types. i915 sets clonable = false for these connectors.
> > vc4 picks the first connector's TV margins, always.
>
> Sounds like i915 does it right, and vc4 does not, assuming vc4 does not
> prevent cloning.

The cloneable flag is in struct intel_encoder, not core.

vc4 doesn't support cloning of a single CRTC to multiple connectors at
all, and I believe sets up the possible_crtc bitmasks correctly to
denote that.

  Dave

> >
> > > IOW, does simply the existence of these properties on a connector
> > > guarantee that the connector must be the only one on a CRTC?
> >
> > I suppose that there could exist some hardware capable of applying
> > margins post-CRTC? Such driver could support cloning CRTCs and still
> > applying the connector margins correctly.
>
> Yeah, theoretically. But in the KMS object model, is there the idea
> that connectors do not do image manipulation, they can only convert the
> signal type at most and send metadata?
>
>
> Thanks,
> pq
