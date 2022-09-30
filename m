Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2039E5F0FB9
	for <lists+dri-devel@lfdr.de>; Fri, 30 Sep 2022 18:18:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1874910ED73;
	Fri, 30 Sep 2022 16:17:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D190010ED73
 for <dri-devel@lists.freedesktop.org>; Fri, 30 Sep 2022 16:17:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1664554673;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=AeBo9Qtt20vw/yk/3tmtqoX7FByVEMPDC0NXoa/CAqE=;
 b=fqGJsLq0KFOWT02YiLwMNI4x7CcKzDWv+VlK6CJg4O0WvQYwsKGoaFMcYKCSBYzq0xrYCi
 3MgjSDtT9MqRdBzbSmnxunFgOuZyfpxhFWAylF00k9svLH+kd9dfVP+vEdq9ed3YKFITbH
 kFDN9yvPU0iuvPGPa3DY8lpaaps8GLo=
Received: from mail-lj1-f197.google.com (mail-lj1-f197.google.com
 [209.85.208.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-336-ZyGiISNhMK-YYkJdrkYlug-1; Fri, 30 Sep 2022 12:17:52 -0400
X-MC-Unique: ZyGiISNhMK-YYkJdrkYlug-1
Received: by mail-lj1-f197.google.com with SMTP id
 c9-20020a2e9d89000000b0026bde11179dso1455457ljj.22
 for <dri-devel@lists.freedesktop.org>; Fri, 30 Sep 2022 09:17:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date;
 bh=AeBo9Qtt20vw/yk/3tmtqoX7FByVEMPDC0NXoa/CAqE=;
 b=Ec/nDTpKNVUhgbo21b19m+17mfi80lJ6GYMgjOX81Hf3WokGfRrmRaaQnJsvgEO34w
 srwnqNN/6ZGTiHY8ztoqbDixcuJIYdDmJVMQKQVPWr0/sqr0eWqnU1daB3sexKB9iAlh
 jsBVZW5zOI+QO5Fdt5V+F95Q804bGMUVfbdxsqWLTaeM9TqahrOkMb6mYLTQiv725gVl
 SKKqvYuVQt44/QlfHPdHkdlfr3AwHRlGz3dLNnoX8l9YH2lc9lFlfv7C8q46X+zTYlxp
 Q20QKvjTKSl17I4MOH4KG4kByHA/+/8CDIi6CoISDqE0rP3Pjxtabr/nETs3RFsqXIFm
 HJ3Q==
X-Gm-Message-State: ACrzQf3ltal7JfDgeh+K3+AVwj4nBUG1UDYKGCycVR+ZccQG2aUE5MCt
 TdUzrPmvU9i5Tzn0EZZf1jCVqm5/PWQJCFVVn9el1sDYWv8WTJzfZ+i8W0mvu1wcoxRNmSHV3iM
 8unG+DjUWSbRVJKzhJ49AVmcxKOQk1NYikHUUj2IyRH3X
X-Received: by 2002:a2e:b0ca:0:b0:26d:b66d:c6bb with SMTP id
 g10-20020a2eb0ca000000b0026db66dc6bbmr3221845ljl.81.1664554670965; 
 Fri, 30 Sep 2022 09:17:50 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM4tZkKci4HUBbySeq7tLi4YPj7ebvUhs/FGZEm63ivzMffdJei9RimV0409hZdQ81wXf9uzMayJK0jc1pvshW0=
X-Received: by 2002:a2e:b0ca:0:b0:26d:b66d:c6bb with SMTP id
 g10-20020a2eb0ca000000b0026db66dc6bbmr3221830ljl.81.1664554670693; Fri, 30
 Sep 2022 09:17:50 -0700 (PDT)
MIME-Version: 1.0
References: <b61d3eeb-6213-afac-2e70-7b9791c86d2e@redhat.com>
 <878rm3zuge.fsf@intel.com> <YzQojrDOGNhm4D8l@intel.com>
 <YzQseBFa5EvDUDSw@intel.com>
 <CA+hFU4xRV74r3Wbs-TTWmtAkEwdJaEb+1QXUZSh52LVRwfddeA@mail.gmail.com>
 <20220930103956.1c3df79e@eldfell>
 <CA+hFU4yR542C3Qo_8ggkXKF+OZs=Pt9awsQ7Q4bXGoiv+7-VyQ@mail.gmail.com>
 <YzcAwVC8tm1imNOL@intel.com> <20220930182652.4ea10013@eldfell>
In-Reply-To: <20220930182652.4ea10013@eldfell>
From: Sebastian Wick <sebastian.wick@redhat.com>
Date: Fri, 30 Sep 2022 18:17:39 +0200
Message-ID: <CA+hFU4zat+-0eW_6BaY0pbHzKxBjPtnyV5M=X=9Y0Rn8JJe8Wg@mail.gmail.com>
Subject: Re: [RFC v2] drm/kms: control display brightness through
 drm_connector properties
To: Pekka Paalanen <ppaalanen@gmail.com>
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
Cc: Christoph Grenz <christophg+lkml@grenz-bonn.de>,
 Martin Roukala <martin.roukala@mupuf.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 wayland <wayland-devel@lists.freedesktop.org>,
 Hans de Goede <hdegoede@redhat.com>, Yusuf Khan <yusisamerican@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Sep 30, 2022 at 5:27 PM Pekka Paalanen <ppaalanen@gmail.com> wrote:
>
> On Fri, 30 Sep 2022 17:44:17 +0300
> Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com> wrote:
>
> > On Fri, Sep 30, 2022 at 04:20:29PM +0200, Sebastian Wick wrote:
> > > On Fri, Sep 30, 2022 at 9:40 AM Pekka Paalanen <ppaalanen@gmail.com> =
wrote:
> > > >
> > > > On Thu, 29 Sep 2022 20:06:50 +0200
> > > > Sebastian Wick <sebastian.wick@redhat.com> wrote:
> > > >
> > > > > If it is supposed to be a non-linear luminance curve, which one i=
s it?
> > > > > It would be much clearer if user space can control linear luminan=
ce
> > > > > and use whatever definition of perceived brightness it wants. The
> > > > > obvious downside of it is that it requires bits to encode changes=
 that
> > > > > users can't perceive. What about backlights which only have a few
> > > > > predefined luminance levels? How would user space differentiate
> > > > > between the continuous and discrete backlight? What about
> > > > > self-emitting displays? They usually increase the dynamic range w=
hen
> > > > > they increase in brightness because the black level doesn't rise.=
 They
> > > > > also probably employ some tonemapping to adjust for that. What ab=
out
> > > > > the range of the backlight? What about the absolute luminance of =
the
> > > > > backlight? I want to know about that all in user space.
> > > > >
> > > > > I understand that most of the time the kernel doesn't have answer=
s to
> > > > > those questions right now but the API should account for all of t=
hat.
> > > >
> > > > Hi,
> > > >
> > > > if the API accounts for all that, and the kernel doesn't know, then=
 how
> > > > can the API not lie? If the API sometimes lies, how could we ever t=
rust
> > > > it at all?
> > >
> > > Make it possible for the API to say "I don't know". I'd much rather
> > > have an API tell me explicitly what it does and doesn't know instead
> > > of having to guess what data I can actually rely on.
> > >
> > > For example if the kernel knows the luminance is linear on one displa=
y
> > > and doesn't know anything about the other display and it exposes them
> > > both in the same way I can not possibly write any code which relies o=
n
> > > exact control over the luminance for either display.
> > >
> > > >
> > > > Personally I have the feeling that if we can even get to the level =
of
> > > > "each step in the value is a more or less perceivable change", that
> > > > would be good enough. Think of UI, e.g. hotkeys to change brightnes=
s.
> > > > You'd expect almost every press to change it a bit.
> > >
> > > The nice thing is that you can have that even if you have no further
> > > information about the brightness control and it might be good enough
> > > for some use cases but it isn't for others.
> > >
> > > > If an end user wants defined and controlled luminance, I'd suggest =
they
> > > > need to profile (physically measure) the response of the display at
> > > > hand. This is no different from color profiling displays, but you n=
eed
> > > > a measurement device that produces absolute measurements if absolut=
e
> > > > control is what they want.
> > >
> > > If that's the kind of user experience you're after, good for you. I
> > > certainly want things to work out of the box which makes this just a
> > > big no-go.
> >
> > I think if we have the information to make the default behaviour
> > better then we should do that. Ie. if the firmaware gives us a
> > table to remap the values for a more linear response we should
> > make use of that by default.
>
> But that's only like 20% of what Sebastian is asking for.
>
> What's "linear"? Radiometric or perceptual?
>
> Radiometric linear control would make a terrible UX, so if the control
> is radiometric, userspace needs to remap it. That might be a good
> thing, but it's also complicated, because the relationship between
> brightness and luminance is somewhere between a power curve and
> exponential curve. You need to make sure that the userspace remapping
> works for different backlights with different luminance ranges. That's
> not obvious to me.
>
> > We can of course provide a way for the user to plug in their own
> > actually measured data later. But IMO that doesn't even have to
> > happen in the initial implementation. Just need to avoid painting
> > ourselves totally in the corner in a way that would prevent later
> > additions like that.
>
> For userspace delivering its own curve, you need to define the units.
> Absolute or relative? Radiometric or perceptual? Otherwise the
> resulting control is not portable between window systems.
>
> > I just hate the current limbo where we're somehow too afraid to
> > change the current behaviour to do the remapping by default.
> > I see no upsides in the current behaviour of just blindly
> > exposing the raw hardware register values more or less. They
> > mean absolutely nothing to any user.
>
> I never argued like that.
>
> I'm saying that what looks realistic to me is somewhere *between*
> status quo and what Sebastian is asking for. Whatever you mean by "linear
> remapping" is probably a realistic goal, because you know you have some
> hardware/firmware delivering that information already.
>
> OTOH, designing UAPI for information that exists only in our dreams
> is... well.

I also didn't say that we should design an UAPI for what doesn't
exist, just that we should design the UAPI we actually need in a way
that when we get more information we can properly expose that. So if
the UAPI exposes anything other than the luminance (e.g. "each step is
a perceptual step in brightness", "linear brightness", ..) we have to
put some human perception model into the kernel which is ridiculous
and it makes it impossible to expose luminance to user space if the
kernel has that information.

It's really easy to paint yourself into a corner here.

>
>
> Thanks,
> pq

