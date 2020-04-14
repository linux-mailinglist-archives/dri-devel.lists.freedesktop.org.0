Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B47C1A7E2F
	for <lists+dri-devel@lfdr.de>; Tue, 14 Apr 2020 15:34:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1FE206E11B;
	Tue, 14 Apr 2020 13:34:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x330.google.com (mail-ot1-x330.google.com
 [IPv6:2607:f8b0:4864:20::330])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0B12A6E11B
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Apr 2020 13:34:10 +0000 (UTC)
Received: by mail-ot1-x330.google.com with SMTP id e20so796523otl.2
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Apr 2020 06:34:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=awnEJcjFLgtoFzsuSTC/khNWvXnkdjNoNV8n75401qg=;
 b=ize/UCa2DCDrf2j2tJiq1VfsGQ8rmrUM74l1LzvnHIECZKj5FotiClc7V4GwbvDtIo
 MZVsa7Du+XixvhPTH3lk5cLZ9079GyQN34LVcJ9VK3LQgjGGSRCrTeE6uVujZjeJzpCv
 2jm8n2ap2zRbQOx67ZtyJxvFIuF7oW3VQoJug=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=awnEJcjFLgtoFzsuSTC/khNWvXnkdjNoNV8n75401qg=;
 b=SHu3X00uu30w8mc9HQiBjlWo1x5iHqh70z1DqQNpfjyhLU7ajP3vVpukWd4EMBP/iJ
 t+/Qrg2XdvY8W4AKGVdQ90jJZy8HFm8UCDXwu8QjRXrreoHoNV+MicYKKZXV0BD27rVn
 1hiI017JFXL0MJAEJ+J4Leunvarp31Mvxj2hpM4kAj1+Jr+WOsx9gfGojtql50byWm1h
 G1dU9W4DUzZeY+gZ8FPuDjUBDif/3eaZJ2xszGRznyi358TzVUL9atotajA3d6rgwSiq
 v3edIK7cuJtMJfkCNifOej/wPZlwxfBWJNygJv+usCBMwMGPFnSP3BZT+ogMYHGnGaxw
 gJWA==
X-Gm-Message-State: AGi0PuYbbQ8qqH/kAc42xP5jnsD6aNgPMjvXqLLdrrApWXJr7a0BmrhR
 DyUeMfwzKbmN7xcp3Cry+61KTPJ/NuffyAOoJutGtQ==
X-Google-Smtp-Source: APiQypIPg1E71LDE+DG9+dmX+SgBRXQtlJRixgilEwfR9DE4dxASc8ahxmO2xeIP7ZugUKBPIQmXxhF1bqoq9EDVQ+8=
X-Received: by 2002:a9d:2056:: with SMTP id n80mr19451012ota.281.1586871249191; 
 Tue, 14 Apr 2020 06:34:09 -0700 (PDT)
MIME-Version: 1.0
References: <VmzN-pGfjaXAFb8aZXOnS2ibasRIsvB-EbfvxyvjLs07m-PBv4pTcX5hsB7yyrt78pxQQ6Bbu3I-hTtFSXEadxm8CkS60FLccIsZycguSfA=@emersion.fr>
 <u5X6K68v0waX25yZHLng0H_WDIFjNU-MgmnbLCoBZN7bqys3ofRm203wrYKdMnR1f4CStz3q5a12Y0ou8lCZWNMuhRmCCZ1dkTCSuDZjdy4=@emersion.fr>
 <20200414122402.GS3456981@phenom.ffwll.local>
 <gpwDGBjR8hMLhneuVUgofPTRR5r79EHlaSULKoTmIvavvl52qCQS7bXfqihSRC_ABzsDO1xmG0GSbU1d6DPanLEfW0IcsCBqbN0SFvd7gv4=@emersion.fr>
 <20200414123945.GU3456981@phenom.ffwll.local>
 <sxighAwzjE_uFWBRdafDj7J1HgLR_yV0SwWQKMpqZGgD1p0yaeeRvmw9rOUCLEMXoARE99aAm5YSGENfTsA3PK9qADKweKPeE6uGguhxpLU=@emersion.fr>
In-Reply-To: <sxighAwzjE_uFWBRdafDj7J1HgLR_yV0SwWQKMpqZGgD1p0yaeeRvmw9rOUCLEMXoARE99aAm5YSGENfTsA3PK9qADKweKPeE6uGguhxpLU=@emersion.fr>
From: Daniel Vetter <daniel@ffwll.ch>
Date: Tue, 14 Apr 2020 15:33:58 +0200
Message-ID: <CAKMK7uH+xY4DroWyB6J4+M8rZrNACDde8sbFAO1dFFWvR146kA@mail.gmail.com>
Subject: Re: KMS enums and bitfields UAPI
To: Simon Ser <contact@emersion.fr>
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
Cc: DRI Development <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Apr 14, 2020 at 3:25 PM Simon Ser <contact@emersion.fr> wrote:
>
> On Tuesday, April 14, 2020 2:39 PM, Daniel Vetter <daniel@ffwll.ch> wrote:
>
> > On Tue, Apr 14, 2020 at 12:34:17PM +0000, Simon Ser wrote:
> >
> > > On Tuesday, April 14, 2020 2:24 PM, Daniel Vetter daniel@ffwll.ch wrote:
> > >
> > > > On Mon, Apr 13, 2020 at 10:38:37PM +0000, Simon Ser wrote:
> > > >
> > > > > Daniel Vetter, Ville, any thoughts about this?
> > > >
> > > > Magic 8ball says "unclear", and I feel like I keep flip-flopping around on
> > > > this.
> > > > I think best-case outcome here is that we're a) consistent across
> > > > compositors and b) document that consensus in the kernel's uapi section
> > > > (for lack of better places).
> > >
> > > Agreed.
> > >
> > > > I'm not hung up on what exactly that consensus should be, as long as it's
> > > > a consistent across projects. If you folks can't figure this out I'll do a
> > > > live youtube sessions and throw a dice :-P
> > >
> > > It seems like everyone's fine with whatever decision we make as long as
> > > we make one. :P
> > > I guess I'll summarize again my main point here: requiring user-space
> > > to use the KMS API to get enum values just makes it more difficult for
> > > user-space to use KMS. I can't think of any reason why the kernel would
> > > want to use different enum values for a standard property.
> > > Does anybody remember if there was such a use-case when this UAPI was
> > > introduced?
> >
> > I just rang across one, and boy does it suck.
> >
> > So we're trying to standardize across drivers as much as possible. Within
> > the kernel we do that by decoding standardized properties directly into
> > state structures (including any backwards compat hacks), and outside of
> > the kernel by requiring igts so compliance across drivers can be tested.
> >
> > But we still have a pile of legacy properties, and there's pure wild west
> > out there. Some have mispelled version of the same stuff, some have same
> > naming but different values. If userspace hardcodes values then we're more
> > screwed than if we have some indirection here to remap to standardized
> > properties. And legacy userspace did do that full remapping dance, because
> > that's how the first X property decoder for connectors was coded.
> >
> > So given that I think everyone should do the symbolic decoding, so that we
> > can more seamlessly upgrade when we standardize props.
> >
> > Like I said, I'm flip-flopping on this all the time, but since I just ran
> > over an example of trying to standardize another one of the old horrors,
> > maybe better to make that slightly easier going forward. Userspace should
> > be able to just stuff this all into a library and be done.
>
> What I'm suggesting isn't to make all enum values UAPI. I'm suggesting
> to add standard enum values as #defines in the UAPI headers to make
> these values UAPI. Non-standard properties wouldn't be in the UAPI
> headers, so user-space would need to query values from KMS just like
> they do now.

Hm that sounds like the half-way that wont work. Because then some
compositors will only use the hard-coded versions, and if they don't
have them, nag us to add them. And then be really disappointed if we
don't (or we screw up and add them where we shouldn't). That's the
status quo "let's have it both ways" that I think is the worst of all
options we have. So I guess from that pov the "userspace needs to
decode from symbolic values, always" as the only consistent one.
-Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
+41 (0) 79 365 57 48 - http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
