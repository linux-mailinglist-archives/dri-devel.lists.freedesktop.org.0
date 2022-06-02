Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7416653BCFF
	for <lists+dri-devel@lfdr.de>; Thu,  2 Jun 2022 19:08:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8C08910E8DE;
	Thu,  2 Jun 2022 17:08:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A650910E8DE
 for <dri-devel@lists.freedesktop.org>; Thu,  2 Jun 2022 17:08:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1654189727;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=GFVcib0u2x7yv8PlEJoHrTpyqi0p2UpsTVrSHd8asU0=;
 b=Xp7MTi/PaF1kPTeVsc3B/jgJpwM5cOllvlr4yAt5myK8e45BI5r5pe9zBsg0RArWkkXWFJ
 nwf8oK2K5Lc+pxIUxz8jnxLY5dNl6OI01JDcIc30m42WHEHdJKPhUBxi65hjMKfa3+4Wr6
 crIAqBv0lkCDBRIWoDQsqkQWWVpg738=
Received: from mail-oo1-f69.google.com (mail-oo1-f69.google.com
 [209.85.161.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-574-CkszZjTmM0aOKhqIetztow-1; Thu, 02 Jun 2022 13:08:46 -0400
X-MC-Unique: CkszZjTmM0aOKhqIetztow-1
Received: by mail-oo1-f69.google.com with SMTP id
 d128-20020a4a5286000000b0040e851b3e26so2714060oob.9
 for <dri-devel@lists.freedesktop.org>; Thu, 02 Jun 2022 10:08:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=GFVcib0u2x7yv8PlEJoHrTpyqi0p2UpsTVrSHd8asU0=;
 b=kYp50AA0VQp+xH8BnTLwnISoc1PEjwA5eG8zkGBwmXKaTQ+50VyD1fGPQr4FmMmuS/
 MaPiuoLvpR3dbVuEo+emDI42yYrZRMNPDF/aRn5EkmsapTPFyh0NAD0xx6W96a3rFc73
 81wIIoqDk9vjFVqMatEnp2P49GVgUXbRsnCJ5RN2gSBXXJ+xpByU4SuBaqqtweNcBxQY
 VQI2J/1GI3CqRVM4hpnMKr0B90d2WMFpHCKr1NVNdDMQsVTRXa1PkV3e9TWX7cUh1wrJ
 2V7/lqTmx332GX0bGWhscoc+TGpxJ5BcQHIEepJDK43Rorn8CK1/VU1gisbxvHN8sK8p
 KIDQ==
X-Gm-Message-State: AOAM5336bJm5xvCGC0VZ0vH2AJDj3xvGpZUun+By2DmKwDXxLqjwXgXr
 MlWQkxXqAKg3nP/9xxx3GVVoD1gW6InudaKZLKuWInP0FLALH0nS4/ducEHtLGJ+vEHX0Lq6T6b
 G+m2rEAUS+0u+IVN+ssmlILfGfJ4pUuh0LQMAUg3cFwpX
X-Received: by 2002:a05:6870:4188:b0:d9:eed0:5a41 with SMTP id
 y8-20020a056870418800b000d9eed05a41mr3472584oac.161.1654189725413; 
 Thu, 02 Jun 2022 10:08:45 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw+YkhHb+2Sg0ukRFywEpFsbxoZ0DybOxA1bQkwwp6uESG/9ELHencTYdqgj9tDHrJWIAMb/Wl6fWT6Zmuh+FE=
X-Received: by 2002:a05:6870:4188:b0:d9:eed0:5a41 with SMTP id
 y8-20020a056870418800b000d9eed05a41mr3472573oac.161.1654189725062; Thu, 02
 Jun 2022 10:08:45 -0700 (PDT)
MIME-Version: 1.0
References: <20220523112246.056ddc99@eldfell>
 <CA+hFU4wTHR9kLrFY3XkbeROZgxWamiZ6yGYL4jH+wpe8MzLvMw@mail.gmail.com>
 <20220525102850.5a70e58f@eldfell>
 <80798931-dbe7-54d7-8e1a-aaebfc39780c@mailbox.org>
 <U2A3FifHdFH9yDVrigaioxCTNx60MgkND7jcyIeKP2S4Ghu-BmmRaODqBDp6K0Q-aPBjPcqa2zUGuJNkGmRWZyQx2FjRJe9dVtJhQG9ZNCk=@emersion.fr>
 <20220525133647.052d09da@eldfell> <YpZSWwVkhJOalM4M@intel.com>
 <20220601102126.4f3602fd@eldfell> <YpdyYbRZP2fdG9Fz@intel.com>
 <20220602104759.60f5a68f@eldfell> <Ypjn4YZWUY5Vi0Xj@intel.com>
In-Reply-To: <Ypjn4YZWUY5Vi0Xj@intel.com>
From: Sebastian Wick <sebastian.wick@redhat.com>
Date: Thu, 2 Jun 2022 19:08:33 +0200
Message-ID: <CA+hFU4zbHabsffqV7-3D+N820SzZnHR5C14pupmW7uKSewU_UQ@mail.gmail.com>
Subject: Re: How should "max bpc" and "Colorspace" KMS property work?
To: =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=sewick@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
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
Cc: =?UTF-8?Q?Michel_D=C3=A4nzer?= <michel.daenzer@mailbox.org>,
 =?UTF-8?B?Sm9uYXMgw4VkYWhs?= <jadahl@redhat.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Hans de Goede <hdegoede@redhat.com>, Pekka Paalanen <ppaalanen@gmail.com>,
 Vitaly Prosyak <vitaly.prosyak@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Jun 2, 2022 at 6:40 PM Ville Syrj=C3=A4l=C3=A4
<ville.syrjala@linux.intel.com> wrote:
>
> On Thu, Jun 02, 2022 at 10:47:59AM +0300, Pekka Paalanen wrote:
> > On Wed, 1 Jun 2022 17:06:25 +0300
> > Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com> wrote:
> >
> > > On Wed, Jun 01, 2022 at 10:21:26AM +0300, Pekka Paalanen wrote:
> > > > On Tue, 31 May 2022 20:37:31 +0300
> > > > Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com> wrote:
> > > >
> > > > > On Wed, May 25, 2022 at 01:36:47PM +0300, Pekka Paalanen wrote:
> > > > > > On Wed, 25 May 2022 09:23:51 +0000
> > > > > > Simon Ser <contact@emersion.fr> wrote:
> > > > > >
> > > > > > > On Wednesday, May 25th, 2022 at 10:35, Michel D=C3=A4nzer <mi=
chel.daenzer@mailbox.org> wrote:
> > > > > > >
> > > > > > > > > Mind that "max bpc" is always in auto. It's only an upper=
 limit, with
> > > > > > > > > the assumption that the driver can choose less.
> > > > > > > >
> > > > > > > > It seems to me like the "max bpc" property is just kind of =
bad API,
> > > > > > > > and trying to tweak it to cater to more use cases as we dis=
cover them
> > > > > > > > will take us down a rabbit hole. It seems better to replace=
 it with
> > > > > > > > new properties which allow user space to determine the curr=
ent
> > > > > > > > effective bpc and to explicitly control it.
> > > > > > >
> > > > > > > +1, this sounds much more robust, and allows better control b=
y user-space.
> > > > > > > User-space needs to have fallback logic for other state as we=
ll anyways.
> > > > > > > If the combinatorial explosion is too much, we should think a=
bout optimizing
> > > > > > > the KMS implementation, or improve the uAPI.
> > > > > >
> > > > > > +1 as well, with some recommendations added and the running off=
 to the
> > > > > > sunset:
> > > > > >
> > > > > > Use two separate KMS properties for reporting current vs.
> > > > > > programming desired. The KMS property reporting the current val=
ue
> > > > > > must be read-only (immutable). This preserves the difference be=
tween
> > > > > > what userspace wanted and what it got, making it possible to re=
ad
> > > > > > back both without confusing them. It also allows preserving dri=
ver behaviour
> > > > >
> > > > > I don't see much real point in a property to report the current b=
pc.
> > > > > That can't be used to do anything atomically. So I suppose plymou=
th
> > > > > would be the only user.
> > > >
> > > > Hi Ville,
> > > >
> > > > I think also professional color managed display servers would need =
it.
> > > >
> > > > If they detect that the link bpc is no longer the same as it was wh=
en
> > > > the monitor was profiled, the profile will need to be re-verified b=
y
> > > > measuring the monitor again.
> > > >
> > > > See "Color calibration auditing system" notes in
> > > > https://gitlab.freedesktop.org/wayland/weston/-/issues/467 descript=
ion.
> > > >
> > > > > So IMO if someone really need explicit control over this then we
> > > > > should just expose properties to set things explicitly. So we'd
> > > > > need at least props for the actual bpc and some kind of color
> > > > > encoding property (RGB/YCbCr 4:4:4/4:2:2:/4:2:0, etc.). And someo=
ne
> > > > > would really need to figure out how DSC would interact with those=
.
> > > >
> > > > I believe there still must be "auto" setting for bpc, and a separat=
e
> > > > feedback property, so that userspace can use "auto" to see what it =
can
> > > > get without doing thousands of TEST_ONLY commits plus a few "link
> > > > status" failure handlings in order to find a working configuration =
(I'm
> > > > assuming we have many more properties than just "max bpc" to figure
> > > > out). After "auto" has told userspace what actually works without b=
lind
> > > > trial and error, then userspace can program than value explicitly t=
o
> > > > make sure it doesn't change accidentally in the future.
> > >
> > > Yeah we need "auto", but IMO mainly just to keep the current userspac=
e
> > > working. Using that to probe what's possible doesn't sound particular=
ly
> > > workable since you can't use it with TEST_ONLY commits. Also change t=
o
> > > some other property could still cause the whole thing to fail after t=
he
> > > max bpc has been probed so not sure it really buys you anything.
> >
> > Hi Ville,
> >
> > earlier in this thread I drafted how the property-pair with "auto"
> > could be made useful also with TEST_ONLY commits:
> >
> > > Thinking even further, about the problem of TEST_ONLY commits not
> > > telling you what "auto" settings would actually give you; there could
> > > be a new/extended KMS ioctl that would be the same as commit now, but
> > > allow the kernel to return another set of KMS state back with
> > > TEST_ONLY. Like reading back all KMS state after commit was done for
> > > real. The "current" KMS properties would be part of that set, and tel=
l
> > > userspace what would happen in a real commit.
> >
> > I do believe the combinatorial explosion of the KMS state search space
> > to find a working configuration is going to be a very real problem
> > sooner or later.
>
> That's seems like an orthogonal issue that would need some kind of
> new uapi approach that let's you get some state back out from
> TEST_ONLY commits.
>
> > > > Now that you mentioned some kind of color encoding property (I assu=
me
> > > > you referred mostly to the sub-sampling aspect), how does the conne=
ctor
> > > > property "Colorspace" factor in?
> > >
> > > The "Colorspace" property just changes what we report to the display
> > > via infoframes/MSA/SDP. It does not cause the display hardware to do
> > > any colorspace conversion/etc.
> >
> > Good.
> >
> > > To actually force the display hardware to do the desired conversion
> > > we need some new properties. ATM the only automagic conversion that
> > > can happen (at least with i915) is the RGB 4:4:4->YCbCr 4:2:0 fallbac=
k,
> > > which is needed on some displays to get 4k+ modes to work at all.
> >
> > When "Colorspace" says RGB, and the automatic fallback would kick in to
> > create a conflict, what happens?
>
> I would put that in the "Doctor, it hurts when I..." category.

So what are we supposed to do with the Colorspace property other than
setting it to default?

>
> >
> > > >
> > > > The enum values (which are not documented in KMS docs, btw.) are tu=
ples
> > > > of color space + color model, e.g. on Intel:
> > > >
> > > > "Colorspace": enum {Default, SMPTE_170M_YCC, BT709_YCC, XVYCC_601,
> > > > XVYCC_709, SYCC_601, opYCC_601, opRGB, BT2020_CYCC, BT2020_RGB,
> > > > BT2020_YCC, DCI-P3_RGB_D65, DCI-P3_RGB_Theater}
> > >
> > > The accepted values are just what the CTA-861/DP specs
> > > allow us to transmit in he infoframe/SDP/MSA.
> >
> > Sure, but I mean the KMS doc a) does not refer to any standard, and b)
> > does not even list what the possible values could be.
>
> Seems like something that can be remedied with a patch.
>
> >
> >
> > > >
> > > > Reading the KMS docs from
> > > > https://www.kernel.org/doc/html/latest/gpu/drm-kms.html#standard-co=
nnector-properties
> > > > they say:
> > > >
> > > > > Basically the expectation from userspace is:
> > > > >
> > > > >         Set up CRTC DEGAMMA/CTM/GAMMA to convert to some sink
> > > > > colorspace
> > > > >
> > > > >         Set this new property to let the sink know what it conver=
ted
> > > > > the CRTC output to.
> > > > >
> > > > >         This property is just to inform sink what colorspace sour=
ce
> > > > > is trying to drive.
> > > >
> > > > However, where does userspace program the actual conversion from RG=
B to
> > > > NNN? Is it expected to be embedded in CTM?
> > > >
> > > > Or does setting "Colorspace" imply some additional automatic
> > > > conversion? If so, where does it happen and how is it chosen?
> > > >
> > > > > For just the plymouth case I guess the easiest thing would be to
> > > > > just clamp "max bpc" to the current value. The problem with that
> > > > > is that we'd potentially break existing userspace. Eg. I don't th=
ink
> > > > > the modesetting ddx or perhaps even most of the wayland composito=
rs
> > > > > set "max bpc" at all. So we'd need to roll out a bunch of userspa=
ce
> > > > > updates first. And the "current bpc" prop idea would also have th=
is
> > > > > same problem since plymouth would just clamp "max bpc" based on t=
he
> > > > > current bpc before the real userspace starts.
> > > >
> > > > True, but I believe once color management spreads through Wayland, =
so
> > > > will KMS clients also learn to set it.
> > >
> > > Sure. But my point is that if we want to change how the "max bpc"
> > > works I think we need to roll out the userspace stuff first so that
> > > we at least can tell the user "please update you userspace to release=
 x"
> > > when they hit the regression.
> >
> > Sorry, I lost track on who is suggesting to change what.
> >
> > I thought we agreed that "max bpc" means limiting link bpc to at most
> > that value, but the driver will automatically pick a lower value if
> > that makes the requested video mode work (and in lack of new KMS
> > properties).
> >
> > I have no desire that change that. I also think the Plymouth issue is
> > not fully fixable without some new KMS property, and until then the
> > only thing Plymouth could do is to smash "max bpc" always to 8 - which
> > mostly stops being a problem once display servers learn to handle "max
> > bpc".
>
> There's no real differene between the kernel automagically clamping
> "max bpc" to the current BIOS programmed value vs. plymouth doing it.
> Either approach will break deep color support for current userspace
> which doesn't reset "max bpc" back to the max.
>
> >
> > However, when new KMS properties are introduced, I very much like to
> > promote the two property setup for anything that could be a) set to
> > "auto", or b) be changed by the kernel *and* userspace.
> >
> >
> > Thanks,
> > pq
>
>
>
> --
> Ville Syrj=C3=A4l=C3=A4
> Intel
>

