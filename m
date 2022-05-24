Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BE1DB533332
	for <lists+dri-devel@lfdr.de>; Wed, 25 May 2022 00:04:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A3D7910E03F;
	Tue, 24 May 2022 22:04:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x333.google.com (mail-ot1-x333.google.com
 [IPv6:2607:f8b0:4864:20::333])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0BB9D10E03F
 for <dri-devel@lists.freedesktop.org>; Tue, 24 May 2022 22:04:08 +0000 (UTC)
Received: by mail-ot1-x333.google.com with SMTP id
 r3-20020a9d5cc3000000b0060ae1789875so10816480oti.13
 for <dri-devel@lists.freedesktop.org>; Tue, 24 May 2022 15:04:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=xBD/FUPxujeZxKiSq9FjpBJPKh5SZCUD93k1foiytMI=;
 b=SLJnGxIty4K+lHFJ9gGIOQZTATK4ImdEw2PAAyKjq6w0wKfR+h38aRAQ+3dSbrYlKT
 2jbdLndT7deku4wBoWJSKKGoybyHjb942y9GdtUDOd6N7YTdQm9kSFWilHKkeTHsG5e9
 mPF6hHuQdHX/pVWDlvupx0NszoZzkLo5RN3v0kEqhG7vVR1FTRtPMu65p8tRd8XMQZF7
 3Kvq2G8AQ+RB7dCVMz/Os9bbWl0CnNIDsEF4tDu5WmpyX3vjyKlom8+nRGM/7PBEEFMN
 hBCwGuairLGZBODLIlEPy0OCd9XV6kD1blxiEVoKs48x/Z0Ip8iO6Qez56xen5cuQ1qI
 RDLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=xBD/FUPxujeZxKiSq9FjpBJPKh5SZCUD93k1foiytMI=;
 b=Kwa9KnsxxhYgUhldGZmO9Q+c5vLzma65ZACtnG3rIeGu/D8aLAYSoUfHbj7CH9Oejf
 Fa1dlJoElfAhCCUWlmGDfF7IILVvYf3c6kj6hXhoRNo9iOPHR3lDZlmc97DBGAo8iyAx
 Q9geV//D05wJ5m9zIA9/8mWm581jbiY5KGko4VVsM39MAob07o8/OOl8OgI7l1L62hYu
 wvOjagFjInYJrSoni7HiT4cMAL9MHfTitbiP6OAbZ3jLYJg/qSbZmml8/uqgh8D02soZ
 7yaSpZtMa2tg48+U1z0pc/0QSG2f0P6a2r4TXM9VDOWQeHkvJxDJxFoZ6IGzQ71s/m1+
 AE9A==
X-Gm-Message-State: AOAM531ifj1LLit4fy7sCOXimZqWOElGS46iRd41EQFZhf5dV9rCd2dc
 /Ra1RX8NkKtu1Xr/DOle/T1wZlCLmd8WsFNzu9E=
X-Google-Smtp-Source: ABdhPJwIngXCEi6IcOhWJpT1i+P6Il/DVRSgDKRUFKDqP9FDLuxGuGhRYMNKQJIEnGZJXOpriLfSDFLpORkBMuW6Ft0=
X-Received: by 2002:a9d:6543:0:b0:605:e789:271e with SMTP id
 q3-20020a9d6543000000b00605e789271emr11552523otl.200.1653429847292; Tue, 24
 May 2022 15:04:07 -0700 (PDT)
MIME-Version: 1.0
References: <20220426113502.224d0a90@eldfell> <YmgyArRaJCh6JkQh@intel.com>
 <57d16ed5-8bfc-ce29-9250-14e2de18710a@redhat.com>
 <20220523112246.056ddc99@eldfell>
 <CA+hFU4wTHR9kLrFY3XkbeROZgxWamiZ6yGYL4jH+wpe8MzLvMw@mail.gmail.com>
 <d9c4b940-4a16-cd6f-2672-752a2678c32c@redhat.com> <Yoz9GisEO9M4KRPB@intel.com>
In-Reply-To: <Yoz9GisEO9M4KRPB@intel.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Tue, 24 May 2022 18:03:56 -0400
Message-ID: <CADnq5_N9gLzLnmPa4K9+40wTfgyC5TN4sZsuaK6+011DAgMPPA@mail.gmail.com>
Subject: Re: How should "max bpc" KMS property work?
To: =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
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
Cc: Sebastian Wick <sebastian.wick@redhat.com>,
 =?UTF-8?B?Sm9uYXMgw4VkYWhs?= <jadahl@redhat.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Hans de Goede <hdegoede@redhat.com>, Pekka Paalanen <ppaalanen@gmail.com>,
 Vitaly Prosyak <vitaly.prosyak@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, May 24, 2022 at 11:43 AM Ville Syrj=C3=A4l=C3=A4
<ville.syrjala@linux.intel.com> wrote:
>
> On Tue, May 24, 2022 at 11:36:22AM +0200, Hans de Goede wrote:
> > Hi,
> >
> > On 5/23/22 13:54, Sebastian Wick wrote:
> > > On Mon, May 23, 2022 at 10:23 AM Pekka Paalanen <ppaalanen@gmail.com>=
 wrote:
> > >>
> > >> On Fri, 20 May 2022 17:20:50 +0200
> > >> Hans de Goede <hdegoede@redhat.com> wrote:
> > >>
> > >>> I got pointed to this thread by Jonas =C3=85dahl while asking some =
questions
> > >>> the "max bpc" property related to:
> > >>>
> > >>> https://gitlab.freedesktop.org/plymouth/plymouth/-/issues/102#note_=
1382328
> > >>>
> > >>> The current i915 behavior which you describe here, which if I under=
stand
> > >>> things correctly is for "max bpc" to default to as high as possible=
 is
> > >>> causing problems with flickerfree boot in plymouth. Plymouth does a=
 modeset
> > >>> on the monitor's native resolution in case the BIOS/GOP setup the m=
onitor
> > >>> in a non native mode. Plymouth does not touch the "max bpc" propert=
y when
> > >>> doing this modeset. Normally this works fine and when the BIOS/GOP =
has
> > >>> already configured the monitor at the native resolution the i915 dr=
iver
> > >>> will do a fastset and all is well.
> > >>>
> > >>> Still the modeset is causing the screen to go black for multiple se=
conds,
> > >>> despite the resolution being unchanged. What is happening according=
 to
> > >>> the on screen mode info from the monitor is that on plymouth's mode=
set
> > >>> the link is being configured changes from 8 bpc to 10 bpc.
> > >>>
> > >>> Is there anyway to avoid this without hardcoding "max bpc" to 8 in
> > >>> plymouth (which would cause the same problem in the other direction
> > >>> if the firmware sets up the link for 10bpc I believe) ?
> > >>
> > >> Hi Hans,
> > >>
> > >> there was an attempt to get much of the current link state informati=
on
> > >> delivered to userspace, but I've forgot most about it.
> > >> I did find https://lkml.org/lkml/2021/6/18/294 linked from
> > >> https://gitlab.freedesktop.org/drm/amd/-/issues/476#note_963469 .
> > >> I said the same in the Plymouth Gitlab issue you linked to.
> > >>
> > >> Personally, I would need to know all current link details for
> > >> (professional) color management: am I still driving the monitor with
> > >> the same signal as I did when I measured the monitor one reboot ago?
> > >> If not, I cannot trust the color output and need to measure again.
> > >
> > > I would go further and say that not being in control of all the link
> > > details is an issue for user space.
> > >
> > > Max bpc doesn't give us a minimum guarantee.
> > > Bpc doesn't really make sense for YUV.
> > > We don't know if the link is using RGB or YUV.
> > > The Colorspace property requires user space to know if the link is RG=
B
> > > or YUV (or does the link change depending on the Colorspace property?
> > > What about the default Colorspace?).
> > > Link compression can mess up colors.
> > >
> > > There simply is no way to write a proper user space with the current =
KMS API.
> > >
> > >>
> > >> Nice to see there would be other uses for knowing which might be hig=
her
> > >> priority to the larger community.
> > >>
> > >> Would it be proper to initialize 'max bpc' to the link depth used by
> > >> boot-up firmware? I guess it could make things more reliable and sol=
ve
> > >> the Plymouth blanking issue, but not the professional color manageme=
nt
> > >> use cases.
> > >
> > > I was always under the impression that if you do an atomic commit
> > > without changing any properties that it won't result in a mode set
> > > which would clearly make the current behavior a bug.
> >
> > I agree, IMHO the i915 driver currently setting max-bpc to 12 by defaul=
t,
> > causing an unrequested link re-negotation on the first modeset is
> > a bug in the i195 driver and is also the root cause of this
> > plymouth bug-report:
> >
> > https://gitlab.freedesktop.org/plymouth/plymouth/-/issues/102
>
> Why would anyone want to run at 8bpc when they have a panel with
> higher color depth? So I think someone is going to be doing that
> modeset eventually anyway.

We used to do something similar, but then got piles of bug reports
about the displays running at 30Hz rather than 60 so we changed it to
8.  It's hard to say what a user will prefer.

Alex
