Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1701051248B
	for <lists+dri-devel@lfdr.de>; Wed, 27 Apr 2022 23:29:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0847410E954;
	Wed, 27 Apr 2022 21:29:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B29F610E954
 for <dri-devel@lists.freedesktop.org>; Wed, 27 Apr 2022 21:29:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1651094955;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=9HA7FUCHnw0xEWepUG8uPd06mwoQNZfoA8yhHiwhJBg=;
 b=ebsBzH73zHHLw1uCz7pyYNe5lOkxrjmNSQk7gQvJohOePvMS3+fTG7sbRpjCq5LhrJXSQH
 dq3VpnBe8Ep9pt9Zro/EdB8LsLEwI4+siYr2mti9GBaD2vuKrMfDwPdrJnthXHhLDKb0Cq
 SjCTHTclalJ8s2vPLArmZaX11s2kb8Q=
Received: from mail-oa1-f70.google.com (mail-oa1-f70.google.com
 [209.85.160.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-474-3Ep28EY0OLih7rclfH67Qg-1; Wed, 27 Apr 2022 17:29:14 -0400
X-MC-Unique: 3Ep28EY0OLih7rclfH67Qg-1
Received: by mail-oa1-f70.google.com with SMTP id
 586e51a60fabf-e67951fe25so1709031fac.5
 for <dri-devel@lists.freedesktop.org>; Wed, 27 Apr 2022 14:29:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=9HA7FUCHnw0xEWepUG8uPd06mwoQNZfoA8yhHiwhJBg=;
 b=lpQvkDtXIdTn7KT8Dd9QFAap2FPIehlr9mi7wKk1G64wjO6bkCp4X4zFyPeJzv6E3P
 up7BxeIjOTo9IoqH/3sIHhT2xbeolJeHj7J4LZCdDrhNyrb9xrTEPyQcy0+FXeT2i9v+
 6ftfwCJq3MUfBTcD36OYywkj0vDI2E2wT+KakpcAMS93hjTYvSFrRckGmTZG95F2L8/0
 RK3uwd5i9dTTzZJTT/YRZv9o053bzNUo7fsOPxoztNZLLy+6I68V0Y52TC38M5WWKI2X
 47pIQHMGE45T7KphnVhZYzExC5rbMSOAg53FK9+pIu1rXcljixX8pAxdEaHfAeJ32aiP
 WrFA==
X-Gm-Message-State: AOAM532SczGz5z1prM4xXNT91nbrWRDibo3fNuMi2v3tqFfDWkDBze1j
 oqQgGtwYwif1U/Y6LSEcnMJNY+W1apBPmG06HgTlI1kIprleYhFFsNfF1sjB2a5zcDs2nekya/s
 RmfgTPGTH+Sjr0/dIXlaI4m5XegarBp/g4hkoAR1etfcZ
X-Received: by 2002:aca:430b:0:b0:322:f961:5fa with SMTP id
 q11-20020aca430b000000b00322f96105famr17117233oia.78.1651094953797; 
 Wed, 27 Apr 2022 14:29:13 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJznbuK9Y+nTjGSYj4UxRICY+CO11ssDCco1wxFutdodpjlh4/FCGukITZAGsMdYFqL4LqjP2eM8vIKMEP3DoXw=
X-Received: by 2002:aca:430b:0:b0:322:f961:5fa with SMTP id
 q11-20020aca430b000000b00322f96105famr17117209oia.78.1651094953136; Wed, 27
 Apr 2022 14:29:13 -0700 (PDT)
MIME-Version: 1.0
References: <20220426113502.224d0a90@eldfell> <YmgyArRaJCh6JkQh@intel.com>
 <20220427135259.5e615945@eldfell>
 <4ceca4d9-c58c-9e33-36a6-dbf0c4bb82a7@amd.com>
In-Reply-To: <4ceca4d9-c58c-9e33-36a6-dbf0c4bb82a7@amd.com>
From: Sebastian Wick <sebastian.wick@redhat.com>
Date: Wed, 27 Apr 2022 23:29:02 +0200
Message-ID: <CA+hFU4ykm-8difozGJ5QtAYc=5RGQTUDiagBNmNccf06sGYGZQ@mail.gmail.com>
Subject: Re: How should "max bpc" KMS property work?
To: Harry Wentland <harry.wentland@amd.com>
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
Cc: =?UTF-8?B?Sm9uYXMgw4VkYWhs?= <jadahl@redhat.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Pekka Paalanen <ppaalanen@gmail.com>, Vitaly Prosyak <vitaly.prosyak@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Apr 27, 2022 at 5:41 PM Harry Wentland <harry.wentland@amd.com> wro=
te:
>
>
>
> On 2022-04-27 06:52, Pekka Paalanen wrote:
> > Hi Ville and Alex,
> >
> > thanks for the replies. More below.
> >
> > TL;DR:
> >
> > My take-away from this is that I should slam 'max bpc' to the max by
> > default, and offer a knob for the user in case they want to lower it.
> >
> >
> > On Tue, 26 Apr 2022 20:55:14 +0300
> > Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com> wrote:
> >
> >> On Tue, Apr 26, 2022 at 11:35:02AM +0300, Pekka Paalanen wrote:
> >>> Hi all,
> >>>
> >>> I'm working on setting HDR & WCG video modes in Weston, and I thought
> >>> setting "max bpc" KMS property on the connector would be a good idea.
> >>> I'm confused about how it works though.
> >>>
> >>> I did some digging in https://gitlab.freedesktop.org/wayland/weston/-=
/issues/612
> >>>
> >>> Summary:
> >>>
> >>> - Apparently the property was originally added as a manual workaround
> >>>   for sink hardware behaving badly with high depth. A simple end user
> >>>   setting for "max bpc" would suffice for this use.
> >>>
> >>> - Drivers will sometimes automatically choose a lower bpc than the "m=
ax
> >>>   bpc" value, but never bigger.
> >>>
> >>> - amdgpu seems to (did?) default "max bpc" to 8, meaning that I
> >>>   definitely want to raise it.
> >>
>
> I've wanted to remove the 8 bpc limitations for a while now but it
> looks like we never did for anything other than eDP.
>
> The original problem we solved was that some monitors default timing
> couldn't be driven at a high bpc. Therefore users were faced with black
> displays. On some displays you also can't drive high refresh rate modes
> with a higher bpc.
>
> >> I've occasionally pondered about doing the same for i915, just to have
> >> the safest default possible. But I'd hate to lose the deep color testi=
ng
> >> coverage knowing very few people would in practice raise the limit.
> >> Also the number of systems where deep color doesn't work reliably
> >> (or can't be made to work by not using a crap cable) seems to be quite
> >> low.
> >
> > I think when HDR and WCG get into display servers, setting 'max bpc'
> > will become a standard action.
> >
> > It's bit moot to e.g. render everything in electrical 10 bit RGB, if
> > the link is just going to squash that into electrical 8 bit RGB, right?
> >
> > So even 10 bit color would require setting 'max bpc' to at least 10 to
> > be able to actually see it, source-side dithering aside.
> >
> >>>
> >>> If I always slam "max bpc" to the highest supported value for that
> >>> property, do I lose more than workarounds for bad sink hardware?
> >>
> >> We don't have any workarounds implemented like this in the kernel.
> >> Or should not have at least. "max bpc" exists purely for the user
> >> to have a say in the matter in addition to whatever the EDID/quirks
> >> say. Ie. if the kernel knows for sure that deep color won't work on
> >> a particular setup then it should just not allow deep color at all
> >> despite what the prop value says.
> >>
> >> So the only danger is fighting with the user's wishes which I guess
> >> you can overcome with some kind of user visible knob.
> >
> > Right, good.
> >
> > Furthermore, as a KMS client cannot make much assumptions about the KMS
> > state it inherits from some other KMS client, it should know and
> > program all possible KMS properties according to its own desires
> > anyway. That, and the DRM master concept make sure that there cannot be
> > any "third party" KMS configuration programs, like V4L2 has.
> >
> >>> Do I lose the ability to set video modes that take too much bandwidth
> >>> at uncapped driver-selected bpc while capping the bpc lower would all=
ow
> >>> me to use those video modes?
> >>>
> >>> Or, are drivers required to choose a lower-than-usual but highest
> >>> usable bpc to make the requested video mode squeeze through the
> >>> connector and link?
> >>
> >> IMO drivers should implement the "reduce bpc until it fits"
> >> fallback. We have that in i915, except for MST where we'd need
> >> to potentially involve multiple streams in the fallback. That
> >> is something we intend to remedy eventually but it's not an
> >> entirely trivial thing to implement so will take some actual
> >> work. ATM we just cap MST to <=3D8bpc to avoid users getting into
> >> this situation so often.
> >
> > Excellent, but judging from what Alex said, this is also not what
> > amdgpu does. We have two drivers doing different things then?
> > > So with Weston I probably have to document, that if you can't get the
> > video mode you want working, try turning the 'max bpc' knob down and
> > try again.
> >
> > Or, I could cap 'max bpc' based on my framebuffer depth. If I have an
> > electrical 8 bit FB (default in Weston), then there is not much use for
> > having 'max bpc' > 8. This ignores the KMS color pipeline a bit. Does
> > that make sense?
> >
>
> I think both of those options make sense. I'll need to think about the
> automatic fallback if we don't have enough bandwidth for max_bpc.
>
> If a KMS driver falls back automatically we probably want some way
> for a (color managed) compositor to know if the output bpc is reduced.
>
> > Does KMS use dithering automatically, btw?
> >
>
> amdgpu's display driver does.
>
> > The only mention of dithering in KMS docs is some nouveau-specific KMS
> > properties and another for radeon.
> >
> >>>
> >>> Do I need to implement a fallback strategy in a display server,
> >>> starting from the highest possible "max bpc" value, and if my modeset
> >>> is rejected, repeatedly try with lower "max bpc" setting until it wor=
ks
> >>> or I'm out of bpc options?
> >>
> >> IMO the bpc part should be handled by the kernel since we already
> >> had this behaviour even before the "max bpc" prop was introduced
> >> and we didn't add an explicit "use this bpc or fail" prop. But of
> >> course you should have some kind of sensible fallback strategy for
> >> things that just fail for other reasons.
> >
> > Right, but this means that I don't have to add 'max bpc' as yet another
> > dimension in the combinatorial explosion of KMS parameters I would need
> > to search to find a working setup. That's really good.
> >
> > The one thing missing is seeing what format and bpc we actually got on
> > the link.
> >
> >> The one problem we have in the kernel is that we have no way to
> >> ask the user if the display we tried to light up is actually
> >> working. So our policy decisions can't really involve user input.
> >> Userspace should not generally have that problem.
> >
> > Indeed.
> >
> > Also like Alex said, the kernel does not know if the user prefers high
> > color depth or high refresh rate either. One way to solve that is to
> > light up the requested video mode any way the kernel can, and then
> > report what the resulting color depth is. Another way is to have
> > explicit "use this bpc or fail" KMS property, maybe in the form of 'min
> > bpc' as I recall being discussed in the past, and let userspace guess
> > what might work. The former is easier to light up, but probing requires
> > actually setting the modes. The latter may require a lot of
> > trial-and-error from userspace to find anything that works, but it
> > takes only time and not blinking - as far as things can be detected
> > with TEST_ONLY commits. Then one still has to ask the user if it
> > actually worked.
> >
>
> min_bpc sounds like something we might want for HDR use-cases, unless
> the compositor has a way to confirm the output box (and format). min_bpc
> would allow the KMS driver to pick the lowest required bpc so the
> compositor always has a guarantee of quality.

IMO that would be ideal. The driver should try to reduce bandwidth by lower=
ing
the bpc down to the min_bpc if the hardware can't drive the selected mode a=
t a
higher bpc. User space usually knows which bpc is sufficient for the use ca=
se
but will never complain about too much bpc. Drivers which don't support
lowering the bpc dynamically can then still go with the min_bpc and user sp=
ace
still gets all the modes which work with the minimum required bpc.

>
> Harry
>
> >
> > Thanks,
> > pq
>

