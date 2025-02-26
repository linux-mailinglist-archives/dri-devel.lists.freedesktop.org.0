Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 45679A46EDD
	for <lists+dri-devel@lfdr.de>; Wed, 26 Feb 2025 23:57:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5349310E00E;
	Wed, 26 Feb 2025 22:57:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="R/pxPw6c";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-f49.google.com (mail-io1-f49.google.com
 [209.85.166.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AE1E110E00E
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Feb 2025 22:57:51 +0000 (UTC)
Received: by mail-io1-f49.google.com with SMTP id
 ca18e2360f4ac-855a5aa9604so9281539f.2
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Feb 2025 14:57:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1740610671; x=1741215471; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=uAoX5elrHn2Yn0oC9ZZpKM2JWaqoMJBoXRL/yNmjZwc=;
 b=R/pxPw6c8E5Y35ZkNVCMXZ8t6Vri8L8/UdOQvThLLf0Jb2paj5o82yBEnMpkR7t3zY
 OFyE2P6hUF4FEh0q42Ndbdeuekz0mv72fsn1gHbpxKraSWc+NNddDcP8CQMwNNr/WULe
 owIcrENwNXWkMkq0at83bXa+EWtwEqer6ZI0W4LDm6Tw/pD2S5Ede5yWUO7ux4qFCV+4
 4YYfs78vDnc1xoRlpwp25UqLaNiI8XDWiscmZVlzGX6GMnIwvpi8zQWPDnmSELMmpx5n
 7tvdp5PbUyOLCfVgSsLReIV2ZZgnw+ufvxof1sLwG0Y8U5sc62fPTf/x5mNUzpW32kMc
 ns4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740610671; x=1741215471;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=uAoX5elrHn2Yn0oC9ZZpKM2JWaqoMJBoXRL/yNmjZwc=;
 b=sQN6TBpyZeHN9k2JFZiGSofIkCqrHrq5RxxWwbY2JvvJCLgluPLVrQJPL9khCtlpEp
 gO1fJuyEIm7AFKKt72GH9hPhpu4oxeZKTTm1OrBT1sc2LoyFWK105IJI3Q0/MmyaAduk
 nkjky2ByFPgu9LpLT70Y0+BHfO9Tk4WzOm6LFNDmJ/pyVeVVAtQR43oNQKvtM3/YJkr1
 L8enh67jsnmp773LRnJsnR2E9PpjMOcP9oEUMHFRBN7cegHpRqZ9sxECZLMYTY08MOu4
 T1Fs7XpJkN6ToQ8PFnUS6adcvcbSCAG80BcydS5kox2fvC5sDpFtvearCGmYKlCmiv30
 tdXQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUKDMldyR7fnN2gYfA1zB4MwvFBsjZI9m4KMJWM2uyiLwUhST951NTyhWF1tDN/dGGRgYOtlKeRFXQ=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyLOrPg8Kl1E7bxnNe0EJUGy8jkiw/KkrzkiuFH9K5gyMmh4VPq
 umU18qmBbum5uS52X4C21AgHlFIvSNvYiMdlzuVgHqr/ZLpdJXjb0gZWpXbL2zp8B75L7g+8eyC
 GPoqajFj19UbgGYgLjFjmRYqT5VQ=
X-Gm-Gg: ASbGnctBbH53w6shl99dCfYL3lipy47OZiUf4V7AjETJF3RgV6ZteYhjGQlxBeFVmr6
 BnawlnYm6rK7Nb/eu19Fx/72YK5p0+lrTIveGSHQftMYuzPcXQGJCJoWAHO+OG7gcX68HQWgIDz
 uM9uk=
X-Google-Smtp-Source: AGHT+IHhI54PJwJM0GoUBX9sVGIWPBRJiNQNO3wmQx9px7UP2uJJd3uGpfx7FMUkqB+zLq674BG+POFOOqZVQZ+UqK4=
X-Received: by 2002:a05:6602:2cc9:b0:858:7057:2203 with SMTP id
 ca18e2360f4ac-858705722fcmr185814339f.4.1740610670754; Wed, 26 Feb 2025
 14:57:50 -0800 (PST)
MIME-Version: 1.0
References: <20220621104617.8817-1-tzimmermann@suse.de>
 <CAEXMXLR55DziAMbv_+2hmLeH-jP96pmit6nhs6siB22cpQFr9w@mail.gmail.com>
 <d2562174-eebe-4462-9a9a-03936b3bcf89@leemhuis.info>
 <b4d28b98-a85c-4095-9c1b-8ebdfa13861c@suse.de>
 <CAEXMXLQEJPVPyqLpH6C7R6iqhhKBpdNS9QeESbEdcmxB70goSA@mail.gmail.com>
 <da4288a6-96cc-4095-bd73-d66b68e9ed01@suse.de>
 <CAEXMXLQw1yqUGbWcrKZdOuGvA4eZMG0utiyQ2PVRvTeuFedGbA@mail.gmail.com>
 <9c902ac0-a94d-4465-98ff-840132e482b1@suse.de>
 <CAEXMXLSLau0sEy8WSZ3=ofK97xP8aPcDQEnT=JFkkt7K=Rzivw@mail.gmail.com>
 <900b873f-6eba-4dba-b155-dc5f7594becf@suse.de>
 <CAEXMXLTT5m0Po_wz0ywRHFetV6e080AJwy8f99Zb9R_afzafRw@mail.gmail.com>
 <844f1fa4-6f47-4386-878f-739d2819605e@suse.de>
In-Reply-To: <844f1fa4-6f47-4386-878f-739d2819605e@suse.de>
From: =?UTF-8?Q?Nuno_Gon=C3=A7alves?= <nunojpg@gmail.com>
Date: Wed, 26 Feb 2025 22:57:38 +0000
X-Gm-Features: AQ5f1Jpobisr-w9TMwMuIrlUF7jBzuaRQR1sUN7eX0a5b9SfNPQBMIHwVGEKmfc
Message-ID: <CAEXMXLQyOY=dXcYoSc9=LVVWb1BjXLd3_Lo3LRNor_STT+H+WQ@mail.gmail.com>
Subject: Re: drm/fbdev-dma: regression
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: Thorsten Leemhuis <regressions@leemhuis.info>, 
 Linux kernel regressions list <regressions@lists.linux.dev>,
 dri-devel@lists.freedesktop.org, LKML <linux-kernel@vger.kernel.org>, 
 Linux Framebuffer <linux-fbdev@vger.kernel.org>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Dear Thomas,

Could you check if the patch got lost in review?

I can confirm that mainline is still broken since this 2024/May regression.

Thanks,
Nuno

On Wed, Dec 11, 2024 at 9:07=E2=80=AFAM Thomas Zimmermann <tzimmermann@suse=
.de> wrote:
>
> Hi
>
>
> Am 09.12.24 um 14:56 schrieb Nuno Gon=C3=A7alves:
> > On Mon, Dec 9, 2024 at 1:43=E2=80=AFPM Thomas Zimmermann <tzimmermann@s=
use.de> wrote:
> >> Thanks you so much for testing. I'll prepare a real patch. Can I add
> >> your Reported-by and Tested-by tags?
> > Reported-by: Nuno Gon=C3=A7alves <nunojpg@gmail.com>
> > Tested-by: Nuno Gon=C3=A7alves <nunojpg@gmail.com>
>
> Thanks a lot. I've sent out the patch for review. Apologies if this took
> a bit longer than expected.
>
> Best regards
> Thomas
>
> >
> > Thanks,
> > Nuno
>
> --
> --
> Thomas Zimmermann
> Graphics Driver Developer
> SUSE Software Solutions Germany GmbH
> Frankenstrasse 146, 90461 Nuernberg, Germany
> GF: Ivo Totev, Andrew Myers, Andrew McDonald, Boudien Moerman
> HRB 36809 (AG Nuernberg)
>
