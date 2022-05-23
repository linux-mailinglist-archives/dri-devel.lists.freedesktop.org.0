Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B7C87530E99
	for <lists+dri-devel@lfdr.de>; Mon, 23 May 2022 13:56:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A11E810F01D;
	Mon, 23 May 2022 11:56:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A881F10E5B3
 for <dri-devel@lists.freedesktop.org>; Mon, 23 May 2022 11:55:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1653306905;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ej9Zs6EFiB+YEbaX93Flskh+k2YvWLrmTAGuKsjQTaI=;
 b=Xhnsa0dPu36B0gDjmJE0eOCxo7yl5Uzfuc2GEH6Apd/JMf9IGQmoe52nnzAI6+rPxc+tfg
 /9YFrP0kxoWZ1v6x5qkQ2G0NU26BwCM+NSx+O4g5S9IsQWWIU5XzZZeWHl7cTPfJTRmZnJ
 WmYPLgi1rEvt/5m1ccLAAFvoVRszBYI=
Received: from mail-oa1-f69.google.com (mail-oa1-f69.google.com
 [209.85.160.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-619-N4OJ4z-PPfatel97qfj_Yw-1; Mon, 23 May 2022 07:55:02 -0400
X-MC-Unique: N4OJ4z-PPfatel97qfj_Yw-1
Received: by mail-oa1-f69.google.com with SMTP id
 586e51a60fabf-f11c3a4d85so7574633fac.23
 for <dri-devel@lists.freedesktop.org>; Mon, 23 May 2022 04:55:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=ej9Zs6EFiB+YEbaX93Flskh+k2YvWLrmTAGuKsjQTaI=;
 b=ySGdjPFw7unrn1f3yQFSPk9kxRII51apWyxZY0q45tI90u6io5sQ+afwHWqgzUHrSm
 jYSCDiZx/MAPMCOo+Ra6Dr4gh32PxOkZKutBKxVb6BaM9i8Ga8jPAsvFrD9GyY6P+l27
 w9FmhTX7Zw4s3q7SriG7B9L4XMWTebO3yepNO6nnnbwC5HkeJulxobgIeAbRi5zxgwNT
 UI4cLZG0oV07iM8Qe4Lkf3rbohwmy+SkhYL62F+L70r2ULItLH/ZosoO8cQO0mrjzvGR
 pu0WzCJyVzzHDsY/qnheW6u07avzMI0uTLhUFOWH0RcvAXk4PpcXMslJUo8OG+6NsKiv
 /VQA==
X-Gm-Message-State: AOAM533zT7mHH9oYM7RN8WPp4zajQBi5WGuxH4hMxIv69k3q3asUVcI8
 WOEJW/Ig/L/DOewCWt8Pe20ldnU0IG/BsHdAOUZa0RquXTGhF8kmf24l5A7rGGFYi1f6vQ3X+6o
 tMduBoYDaP0mNjyhdVsSwJf1rAI4dCK19Hf2beab/DoDT
X-Received: by 2002:a05:6830:1c74:b0:60b:18a2:cf9b with SMTP id
 s20-20020a0568301c7400b0060b18a2cf9bmr1098470otg.231.1653306901888; 
 Mon, 23 May 2022 04:55:01 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxWla1J9quXzSP05nPTpVkasnRIgQARMybBnw3rmgXvRtjrNpYXG2vyefgiK7XGFjn+P5dzxMTxzvswjvMAT9E=
X-Received: by 2002:a05:6830:1c74:b0:60b:18a2:cf9b with SMTP id
 s20-20020a0568301c7400b0060b18a2cf9bmr1098457otg.231.1653306901632; Mon, 23
 May 2022 04:55:01 -0700 (PDT)
MIME-Version: 1.0
References: <20220426113502.224d0a90@eldfell> <YmgyArRaJCh6JkQh@intel.com>
 <57d16ed5-8bfc-ce29-9250-14e2de18710a@redhat.com>
 <20220523112246.056ddc99@eldfell>
In-Reply-To: <20220523112246.056ddc99@eldfell>
From: Sebastian Wick <sebastian.wick@redhat.com>
Date: Mon, 23 May 2022 13:54:50 +0200
Message-ID: <CA+hFU4wTHR9kLrFY3XkbeROZgxWamiZ6yGYL4jH+wpe8MzLvMw@mail.gmail.com>
Subject: Re: How should "max bpc" KMS property work?
To: Pekka Paalanen <ppaalanen@gmail.com>
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
Cc: Hans de Goede <hdegoede@redhat.com>,
 =?UTF-8?B?Sm9uYXMgw4VkYWhs?= <jadahl@redhat.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Vitaly Prosyak <vitaly.prosyak@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, May 23, 2022 at 10:23 AM Pekka Paalanen <ppaalanen@gmail.com> wrote=
:
>
> On Fri, 20 May 2022 17:20:50 +0200
> Hans de Goede <hdegoede@redhat.com> wrote:
>
> > I got pointed to this thread by Jonas =C3=85dahl while asking some ques=
tions
> > the "max bpc" property related to:
> >
> > https://gitlab.freedesktop.org/plymouth/plymouth/-/issues/102#note_1382=
328
> >
> > The current i915 behavior which you describe here, which if I understan=
d
> > things correctly is for "max bpc" to default to as high as possible is
> > causing problems with flickerfree boot in plymouth. Plymouth does a mod=
eset
> > on the monitor's native resolution in case the BIOS/GOP setup the monit=
or
> > in a non native mode. Plymouth does not touch the "max bpc" property wh=
en
> > doing this modeset. Normally this works fine and when the BIOS/GOP has
> > already configured the monitor at the native resolution the i915 driver
> > will do a fastset and all is well.
> >
> > Still the modeset is causing the screen to go black for multiple second=
s,
> > despite the resolution being unchanged. What is happening according to
> > the on screen mode info from the monitor is that on plymouth's modeset
> > the link is being configured changes from 8 bpc to 10 bpc.
> >
> > Is there anyway to avoid this without hardcoding "max bpc" to 8 in
> > plymouth (which would cause the same problem in the other direction
> > if the firmware sets up the link for 10bpc I believe) ?
>
> Hi Hans,
>
> there was an attempt to get much of the current link state information
> delivered to userspace, but I've forgot most about it.
> I did find https://lkml.org/lkml/2021/6/18/294 linked from
> https://gitlab.freedesktop.org/drm/amd/-/issues/476#note_963469 .
> I said the same in the Plymouth Gitlab issue you linked to.
>
> Personally, I would need to know all current link details for
> (professional) color management: am I still driving the monitor with
> the same signal as I did when I measured the monitor one reboot ago?
> If not, I cannot trust the color output and need to measure again.

I would go further and say that not being in control of all the link
details is an issue for user space.

Max bpc doesn't give us a minimum guarantee.
Bpc doesn't really make sense for YUV.
We don't know if the link is using RGB or YUV.
The Colorspace property requires user space to know if the link is RGB
or YUV (or does the link change depending on the Colorspace property?
What about the default Colorspace?).
Link compression can mess up colors.

There simply is no way to write a proper user space with the current KMS AP=
I.

>
> Nice to see there would be other uses for knowing which might be higher
> priority to the larger community.
>
> Would it be proper to initialize 'max bpc' to the link depth used by
> boot-up firmware? I guess it could make things more reliable and solve
> the Plymouth blanking issue, but not the professional color management
> use cases.

I was always under the impression that if you do an atomic commit
without changing any properties that it won't result in a mode set
which would clearly make the current behavior a bug.

>
>
> Thanks,
> pq

