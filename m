Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 06DC08096AB
	for <lists+dri-devel@lfdr.de>; Fri,  8 Dec 2023 00:40:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F003410E029;
	Thu,  7 Dec 2023 23:40:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C635C10E029
 for <dri-devel@lists.freedesktop.org>; Thu,  7 Dec 2023 23:40:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1701992404;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=DWvFwyPmX10Mx9keFc1dZ6HP3h53UWMZDwhxOWQveBU=;
 b=akqu19QKCJZSe/wgGaGVciNzHlFv5++xBXKh5VAhfvdeK7pQz22AmoddqcrlCShA/SFlp9
 J2d/Gz/6i51GouDmHSYz4KAndD7qBQcr/XT+NUgTVPXhCm4CV40NxwFrjAONZxS37wcAzn
 HG3lpEfaDgLCQQRzEd6Qp+xLGY6DRk8=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-18-VTveI-zCOEyw1qEkjT09wQ-1; Thu, 07 Dec 2023 18:40:03 -0500
X-MC-Unique: VTveI-zCOEyw1qEkjT09wQ-1
Received: by mail-ed1-f70.google.com with SMTP id
 4fb4d7f45d1cf-54cfdd60557so783871a12.0
 for <dri-devel@lists.freedesktop.org>; Thu, 07 Dec 2023 15:40:00 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701992399; x=1702597199;
 h=content-transfer-encoding:mime-version:message-id:date:references
 :in-reply-to:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=xg11osurhuZW+ExEnJSQ2VKUNQ2I4+/joQa17Mg9pp4=;
 b=iET2bR56cItPyWqgutbLz6bhO6s79p13vsuPU3UiqZfQ8a70pOdUIKR/tOIR9+QBFF
 7KJkU9zpi5HvH2B1VcFaVP6vrNAZj00F2c4VGL+HH1JJrzk01TIU3RVtdqgUjR5oUq7P
 UZ1F9EMxZz+aQx6IgJCg++GbHJQMV3ACywycNJxaeh+HyXhoXDapeRPNlSGe9SFp3RJn
 hp2c2qHk1lKc90r8aiCpvbkbcMaMuJPPYEDp5r7DOUuLOWzAXpWMVr72yRMUmMdmcbUB
 MAPGTD/GSXKbuaHjiBLuH4JYb1S23qdghitIHbnIMCPXg8t8USHJMEzApY5j4FsMPNxX
 Duhg==
X-Gm-Message-State: AOJu0YxTx1V04Q4p0LRHmDirR0yJc0sUUI56sLFL24NLCYVu9OlB1XI4
 qAAEyG9wI+Av6eiDj35cWUU2BlVAMrZDiJIWTtQJU5o54EMhhPTPSDF+YFziK416tt+DZaD2C7M
 xOFdF9XvRMqCEESLmNp5674FqJ14k
X-Received: by 2002:a50:8d0f:0:b0:54c:7833:c111 with SMTP id
 s15-20020a508d0f000000b0054c7833c111mr2654159eds.36.1701992399575; 
 Thu, 07 Dec 2023 15:39:59 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHONLQX5QD7kpaVJvn8DPKveQlpsowHFBYDxpIMAEK33ea6TyJJupLCP9XwWuJZegmCPjXkaQ==
X-Received: by 2002:a50:8d0f:0:b0:54c:7833:c111 with SMTP id
 s15-20020a508d0f000000b0054c7833c111mr2654157eds.36.1701992399265; 
 Thu, 07 Dec 2023 15:39:59 -0800 (PST)
Received: from localhost ([84.236.194.198]) by smtp.gmail.com with ESMTPSA id
 dn20-20020a05640222f400b0054cc22af09esm299697edb.46.2023.12.07.15.39.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Dec 2023 15:39:58 -0800 (PST)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Rob Herring <robh@kernel.org>
Subject: Re: [RFC PATCH] of/platform: Disable sysfb if a simple-framebuffer
 node is found
In-Reply-To: <20231207173037.GA2944721-robh@kernel.org>
References: <87jzqi59bt.fsf@minerva.mail-host-address-is-not-set>
 <CAL_JsqJM9+cbNviwuKGB5+3YbyAP3UH+TxCxsU5nUtX-iRGP2w@mail.gmail.com>
 <CAMj1kXG7Xyk0ys9j-XRo7Rr8gYz1qJE8fFSixBOwVbm-pjeX+A@mail.gmail.com>
 <874jhj1fm3.fsf@minerva.mail-host-address-is-not-set>
 <58672ab8-99bf-4a2a-af79-031d1e8fcba0@suse.de>
 <87fs0mxlyp.fsf@minerva.mail-host-address-is-not-set>
 <CAL_JsqJbZ736iV+bRbSNNaimkbJLpB9MbeKLSct16Yi67ttFcw@mail.gmail.com>
 <87a5qqxq56.fsf@minerva.mail-host-address-is-not-set>
 <CAL_Jsq+7AwuLt9pfX0zr8g=65zSVLUFzFds82ENaspEFQNK=gg@mail.gmail.com>
 <87zfyqvtpx.fsf@minerva.mail-host-address-is-not-set>
 <20231207173037.GA2944721-robh@kernel.org>
Date: Fri, 08 Dec 2023 00:39:57 +0100
Message-ID: <87cyvhh99u.fsf@minerva.mail-host-address-is-not-set>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
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
Cc: devicetree@vger.kernel.org, Sergio Lopez <slp@redhat.com>,
 Sima Vetter <daniel.vetter@ffwll.ch>, Hector Martin <marcan@marcan.st>,
 Andrew Worsley <amworsley@gmail.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Thomas Zimmermann <tzimmermann@suse.de>,
 Frank Rowand <frowand.list@gmail.com>, Ard Biesheuvel <ardb@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Rob Herring <robh@kernel.org> writes:

> On Mon, Dec 04, 2023 at 05:05:30PM +0100, Javier Martinez Canillas wrote:
>> Rob Herring <robh@kernel.org> writes:
>>=20
>> > On Mon, Dec 4, 2023 at 3:39=E2=80=AFAM Javier Martinez Canillas
>> > <javierm@redhat.com> wrote:
>> >> Rob Herring <robh@kernel.org> writes:
>> >> > On Fri, Dec 1, 2023 at 4:21=E2=80=AFAM Javier Martinez Canillas
>>=20
>> [...]
>>=20
>> >>
>> >> > However, there might be one other issue with that and this fix. The=
 DT
>> >> > simplefb can have resources such as clocks and regulators. With
>> >> > fw_devlink, the driver won't probe until those dependencies are met=
.
>> >> > So if you want the framebuffer console up early, then you may want =
to
>> >> > register the EFI framebuffer first and then handoff to the DT simpl=
efb
>> >> > when it probes (rather than registering the device).
>> >> >
>> >> > But I agree, probably better to take this patch now and have those
>> >> > quirks instead of flat out not working.
>> >> >
>> >>
>> >> If we do that what's the plan? Are you thinking about merging this pa=
tch
>> >> through your OF tree or do you want to go through drm-misc with your =
ack?
>> >
>> > I can take it. Do we need this in 6.7 and stable?
>> >
>>=20
>> IMO this can wait for v6.8 since is not a fix for a change introduced in
>> the v6.7 merge window and something that only happens on a very specific
>> setup (DT systems booting with u-boot EFI and providing an EFI-GOP table=
).
>>=20
>> Also the -rc cycle is already in -rc5, so it seems risky to push a chang=
e
>> at this point. And distros can pick the patch if want to have it earlier=
.
>
> Okay, I've applied it for 6.8.
>

Great, thanks a lot.

> Rob
>

--=20
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

