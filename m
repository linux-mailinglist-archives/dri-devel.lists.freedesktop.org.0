Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AEAE9A42FC4
	for <lists+dri-devel@lfdr.de>; Mon, 24 Feb 2025 23:08:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3EEAA10E044;
	Mon, 24 Feb 2025 22:08:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="HXkGukSy";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com
 [209.85.208.170])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8B04C10E037
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Feb 2025 22:08:19 +0000 (UTC)
Received: by mail-lj1-f170.google.com with SMTP id
 38308e7fff4ca-30795988ebeso50969351fa.3
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Feb 2025 14:08:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1740434898; x=1741039698; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=4oaFYm3uznORB4542Rq36b3rymmLdKUYeu8YPMsf53M=;
 b=HXkGukSyadDwJR/b1ZuBmG+TxmZIpA0V0yc/BOPrMQlN3/x631hrKHB4tJkL8J9BA1
 BAbf1l4POI6GY6GZ/CRwNWQJpsbcVC40m1gpN7uEsmkOJUGdZUkJ6MOUNDby/Z1KoxUh
 lyi5huyj3s0hQze9NxJcvP6HVd7NoqnEHlMTkX3A9/4gPZIyyKc25X5AhlSXfrJ6IpfR
 c+GvbF86mcyyGqurRMTYyErt3+XZyfdKkcCxwBJ4QyetALNbjVxMhsn/oYmcXJRTbxnc
 i7T9rq7aqDljxfhdyfQbA3zlpPAcvd4W5YPkL1RVXd1V3QTVIUV1zeOWH3ldgz2e6zyw
 uyLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740434898; x=1741039698;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=4oaFYm3uznORB4542Rq36b3rymmLdKUYeu8YPMsf53M=;
 b=qKAmk+NW0mxcaq65YHBJrUc5OT5ftaunRLUlus/HiCu42Nq0cchYsV1NlaOu8fTaM+
 dk4TccB3pWyeV6yIJV0EV5Qm4aFB4I1+zkW7USPVaS3tnJQDksSataL0rCKN6B11njMo
 wAZpTYqqnCQWpwkvx8nbthsMoBJSW1n+9oBEJxj9WE5yo77/2+7pAJpqdO5/bLBrLaCY
 P7GpUoszDOcefCAyq9sRT3pooFwKwcv2BFuHsI/HoTpr/xyeRrLHMErrqf+XneNENlgN
 VjPQmDMtcL1thLqKzDNQu5TcBJogBxRolHZ5AFi+20vgPMeVvpabWDFsjtVO6ecDYIYQ
 mfZA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUwblAp59EAJxQCZ28p4bFKMK4tohVp/0hUOzNiI5Pa27lObYtOf6ngE639vtoiyQkHFCQ06IunOuA=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz7R5yF0kq/ij+4wC9LK0JjOEASvcsLqlhPSIBUnl/+cFy/0+8W
 BC0gGSxIWGN2wchA7iaIciaUe6+vuRLInxyDnIOK34jrj6JZitBTKoMNZTWam7ZMqATl+2hhrDu
 XG76tj3wNAYBiJL4ACq15yBdSz0A=
X-Gm-Gg: ASbGncskQLKcm7N+dMp7G0QX7UTnuQ2tZIFQe6tTtzapJDzk8WqK9g6ybi9Jq7axo3M
 AnFaAg/slFL7vZJZ3+xgyg2bU+ac0pOfiKzdKTqqUlBhTSKVmVANNpCh3XMGnX3vFsSwTwPDMnl
 U0wixYqu4=
X-Google-Smtp-Source: AGHT+IHVkIuUFpCDrTU0uvA7Fgx58+MbAWd4iAmh/s9u5Z4OX/tBnfLt5fF/OB0IUp1t1TAS/xkQrlAynJ4vLhos6iA=
X-Received: by 2002:a2e:8713:0:b0:300:1ea5:1655 with SMTP id
 38308e7fff4ca-30a80c2525dmr3121091fa.15.1740434897401; Mon, 24 Feb 2025
 14:08:17 -0800 (PST)
MIME-Version: 1.0
References: <20250223164217.2139331-1-visitorckw@gmail.com>
 <20250223164217.2139331-4-visitorckw@gmail.com>
 <d080a2d6-9ec7-1c86-4cf4-536400221f68@gmail.com>
 <e0b1c299-7f19-4453-a1ce-676068601213@zytor.com>
In-Reply-To: <e0b1c299-7f19-4453-a1ce-676068601213@zytor.com>
From: Uros Bizjak <ubizjak@gmail.com>
Date: Mon, 24 Feb 2025 23:08:05 +0100
X-Gm-Features: AWEUYZk0kdMcSa1NJ7f-FEs-56xLQUiW9T9ljXTGABrJPIypOLr5b30gUzs5pw0
Message-ID: <CAFULd4a_AnP4iqgQs7a6xAsnUFL8oZXxFcAWLmZFMm6MPF_zDQ@mail.gmail.com>
Subject: Re: [PATCH 03/17] x86: Replace open-coded parity calculation with
 parity8()
To: "H. Peter Anvin" <hpa@zytor.com>
Cc: Kuan-Wei Chiu <visitorckw@gmail.com>, tglx@linutronix.de, 
 Ingo Molnar <mingo@redhat.com>, bp@alien8.de, dave.hansen@linux.intel.com, 
 x86@kernel.org, jk@ozlabs.org, joel@jms.id.au, eajames@linux.ibm.com, 
 andrzej.hajda@intel.com, neil.armstrong@linaro.org, rfoss@kernel.org, 
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de, 
 airlied@gmail.com, simona@ffwll.ch, dmitry.torokhov@gmail.com, 
 mchehab@kernel.org, awalls@md.metrocast.net, hverkuil@xs4all.nl, 
 miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com, 
 louis.peens@corigine.com, andrew+netdev@lunn.ch, davem@davemloft.net, 
 edumazet@google.com, pabeni@redhat.com, parthiban.veerasooran@microchip.com, 
 arend.vanspriel@broadcom.com, johannes@sipsolutions.net, 
 gregkh@linuxfoundation.org, jirislaby@kernel.org, yury.norov@gmail.com, 
 akpm@linux-foundation.org, mingo@kernel.org, alistair@popple.id.au, 
 linux@rasmusvillemoes.dk, Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se, 
 jernej.skrabec@gmail.com, kuba@kernel.org, linux-kernel@vger.kernel.org, 
 linux-fsi@lists.ozlabs.org, dri-devel@lists.freedesktop.org, 
 linux-input@vger.kernel.org, linux-media@vger.kernel.org, 
 linux-mtd@lists.infradead.org, oss-drivers@corigine.com, 
 netdev@vger.kernel.org, linux-wireless@vger.kernel.org, 
 brcm80211@lists.linux.dev, brcm80211-dev-list.pdl@broadcom.com, 
 linux-serial@vger.kernel.org, bpf@vger.kernel.org, jserv@ccns.ncku.edu.tw, 
 Yu-Chun Lin <eleanor15x@gmail.com>
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

On Mon, Feb 24, 2025 at 10:56=E2=80=AFPM H. Peter Anvin <hpa@zytor.com> wro=
te:
>
> On 2/24/25 07:24, Uros Bizjak wrote:
> >
> >
> > On 23. 02. 25 17:42, Kuan-Wei Chiu wrote:
> >> Refactor parity calculations to use the standard parity8() helper. Thi=
s
> >> change eliminates redundant implementations and improves code
> >> efficiency.
> >
> > The patch improves parity assembly code in bootflag.o from:
> >
> >    58:    89 de                    mov    %ebx,%esi
> >    5a:    b9 08 00 00 00           mov    $0x8,%ecx
> >    5f:    31 d2                    xor    %edx,%edx
> >    61:    89 f0                    mov    %esi,%eax
> >    63:    89 d7                    mov    %edx,%edi
> >    65:    40 d0 ee                 shr    %sil
> >    68:    83 e0 01                 and    $0x1,%eax
> >    6b:    31 c2                    xor    %eax,%edx
> >    6d:    83 e9 01                 sub    $0x1,%ecx
> >    70:    75 ef                    jne    61 <sbf_init+0x51>
> >    72:    39 c7                    cmp    %eax,%edi
> >    74:    74 7f                    je     f5 <sbf_init+0xe5>
> >    76:
> >
> > to:
> >
> >    54:    89 d8                    mov    %ebx,%eax
> >    56:    ba 96 69 00 00           mov    $0x6996,%edx
> >    5b:    c0 e8 04                 shr    $0x4,%al
> >    5e:    31 d8                    xor    %ebx,%eax
> >    60:    83 e0 0f                 and    $0xf,%eax
> >    63:    0f a3 c2                 bt     %eax,%edx
> >    66:    73 64                    jae    cc <sbf_init+0xbc>
> >    68:
> >
> > which is faster and smaller (-10 bytes) code.
> >
>
> Of course, on x86, parity8() and parity16() can be implemented very simpl=
y:
>
> (Also, the parity functions really ought to return bool, and be flagged
> __attribute_const__.)
>
> static inline __attribute_const__ bool _arch_parity8(u8 val)
> {
>         bool parity;
>         asm("and %0,%0" : "=3D@ccnp" (parity) : "q" (val));

asm("test %0,%0" : "=3D@ccnp" (parity) : "q" (val));

because we are interested only in flags.

Uros.
