Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A38929316D3
	for <lists+dri-devel@lfdr.de>; Mon, 15 Jul 2024 16:32:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E619910E3E2;
	Mon, 15 Jul 2024 14:32:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="Lj1lbBWp";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-f173.google.com (mail-qt1-f173.google.com
 [209.85.160.173])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AE48E10E3E2
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Jul 2024 14:32:36 +0000 (UTC)
Received: by mail-qt1-f173.google.com with SMTP id
 d75a77b69052e-447f8aa87bfso603421cf.0
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Jul 2024 07:32:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1721053956; x=1721658756;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Fc1Fj81x1LnOz6qLHDXAd34zTeKOj68tGBAgaJsMlyE=;
 b=Lj1lbBWpRbS8Hg4m3NpRti6nQ9Y6WVwG9ZKN1yHNbuPZpPBKmEZIAj/by8dWVk1OpE
 BWq6Voh6ZkiQZumx+PPuNQdA8OfQYHoq5SRZ1W+2nZMbvL1MEiaNzv1473jAy/PYYG3G
 Tro5FGNk5ADC0RjpKrwEI1MDL4dXqM62IS7Tb3u8PhKR42vbtTbUylABoGmPOcaYpSKi
 u39KoTQ1EbuygE0wc1S+kh8qrHR/J8EOchT1dzQXnEAj5p7U6fLXb6XsGiLB6rEUbDqU
 wS1f3U7x1VjuSNsY5tu/sD/y6TU1EvQeVENOaVhlBFM17G9lUbXrwjkkJJ6CiUhD2BE1
 ELvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721053956; x=1721658756;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Fc1Fj81x1LnOz6qLHDXAd34zTeKOj68tGBAgaJsMlyE=;
 b=Cm894lFEO/gUIlvk/q0XCtuOugVA0pseZF9lt8PaQ/rbbDhYEDk1yV9/1MNWK8pr2I
 7Oy6sZuEFGLQwDgtom0MDtmXGFCAyWxZuBSVx1s/UkWuKRtTpAFCfD+NJdv1Xp1+EvYx
 olsZeDjeqlF7DmFle3FAl5RDYe0A1Of4WGABSuvi1ICeSFQu8IG9T4R+GE6oYCNJEHX/
 gY3nrqECjSunhYcCdB3fiq3x7joEBeRPKKZUbHugbJwaDerEXQWXykTK3mDM/3zucFGD
 Dnf2aQ1U912Hd01LWGMTeLKIzkJBNcIDcr5uoNKb1h39ioBUatBH3Wj3aCZgyyNzb3k+
 mF1Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCXoq8icbMEgwFPouk5xzrgCCMOJE4vjaqUNUB5qWmbJ6BgwfQlwn3vB7cc3CDwF++/IiFucDuULqJQmstvFfU8KzPbpVhccihN4IUKA+Pvk
X-Gm-Message-State: AOJu0Yy2L1n+KhTLk3yDTf47v3/bAaKjOm5HHpbJbZ6muRe7fXbmnIAZ
 ZYJWMLRp+m6v6+aYYEAgEOhYNFDFqczl3pUi6I+JAVvJdD1D8kZ97OVp0wyrP72NMHfG5b8nRyx
 kZ273yBLjEyGt3gpQwM8k6mPf+23hJhjSmx6L
X-Google-Smtp-Source: AGHT+IEdAV3zlBSromK7kgwqxRwwFx8kbs+vC0rwqlISqNmCiF0y0Gbsp63IltCUJUrV6HyA2qxarg6CDSl8HaBAXE8=
X-Received: by 2002:a05:622a:298e:b0:444:fd8a:f1a0 with SMTP id
 d75a77b69052e-44f5acc840amr5659871cf.25.1721053955348; Mon, 15 Jul 2024
 07:32:35 -0700 (PDT)
MIME-Version: 1.0
References: <20240715073159.25064-1-lvzhaoxiong@huaqin.corp-partner.google.com>
 <20240715073159.25064-2-lvzhaoxiong@huaqin.corp-partner.google.com>
 <CAD=FV=VHDksKiZXrauiipa3HjtK4sE5+dbmXmVfhFoM-RKQP6A@mail.gmail.com>
In-Reply-To: <CAD=FV=VHDksKiZXrauiipa3HjtK4sE5+dbmXmVfhFoM-RKQP6A@mail.gmail.com>
From: Doug Anderson <dianders@google.com>
Date: Mon, 15 Jul 2024 07:32:24 -0700
Message-ID: <CAD=FV=X3rQC0URNWGxPrvCF=RNsTFiFPfotBrC7v76Cam4kbxg@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] dt-bindings: HID: i2c-hid: elan: Introduce Elan
 ekth6a12nay
To: Zhaoxiong Lv <lvzhaoxiong@huaqin.corp-partner.google.com>
Cc: dmitry.torokhov@gmail.com, robh@kernel.org, 
 krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org, jikos@kernel.org, 
 linus.walleij@linaro.org, hsinyi@google.com, dri-devel@lists.freedesktop.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Benjamin Tissoires <bentiss@kernel.org>
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

Hi,

On Mon, Jul 15, 2024 at 7:22=E2=80=AFAM Doug Anderson <dianders@google.com>=
 wrote:
>
> Hi,
>
> On Mon, Jul 15, 2024 at 12:32=E2=80=AFAM Zhaoxiong Lv
> <lvzhaoxiong@huaqin.corp-partner.google.com> wrote:
> >
> > The Elan ekth6a12nay touch screen chip same as Elan eKTH6915 controller
> > has a reset gpio. The difference is that they have different
> > post_power_delay_ms.
> >
> > Signed-off-by: Zhaoxiong Lv <lvzhaoxiong@huaqin.corp-partner.google.com=
>
> > Acked-by: Conor Dooley <conor.dooley@microchip.com>
>
> FWIW things have changed enough between V1 and V2 that you probably
> should have removed Conor's "Acked-by" tag here and waited for him to
> re-add it.
>
> I'd also note that when posting a patch your Signed-off-by should
> always be at the bottom of any collected tags. For reference [1].
>
> [1] https://lore.kernel.org/tools/20221031165842.vxr4kp6h7qnkc53l@meerkat=
.local/
>
> That being said, the new binding seems OK to me.
>
> Reviewed-by: Douglas Anderson <dianders@chromium.org>

...also, all of your patches seem to have the wrong address for
Benjamin Tissoires. Can you fix that? I keep getting:

Message not delivered
Your message couldn't be delivered to benjamin.tissoires@redhat.co
because the remote server is misconfigured. See technical details
below for more information.

...because you have ".co" instead of ".com".

Having the wrong email address for the maintainer is a good way for
your patch not to get picked up. :-P

I would further note that Benjamin seems to have moved from using his
"redhat.com" address to his "kernel.org" address. See commit
139b4c37e9cb ("MAINTAINERS: update Benjamin's email address").

One last note is that get_maintainers should have suggested you email
my @chromium.org address rather than my @google.com address. It's not
a huge deal since they both come to the same place, but some
maintainer tools will refuse to accept the "Reviewed-by" that I post
with my @chromium.org address because my mail program will notice you
sent to my @google.com address and send my reply from there.

Probably you should be using a tool like "b4" or "patman" to help you
send your patches out [1].

[1] https://youtu.be/7B3nKmBoFoQ

-Doug
