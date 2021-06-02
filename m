Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CB8603984BB
	for <lists+dri-devel@lfdr.de>; Wed,  2 Jun 2021 10:57:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F18C36EBD0;
	Wed,  2 Jun 2021 08:57:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [IPv6:2a00:1450:4864:20::32d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EED026EBED
 for <dri-devel@lists.freedesktop.org>; Wed,  2 Jun 2021 08:57:34 +0000 (UTC)
Received: by mail-wm1-x32d.google.com with SMTP id
 t4-20020a1c77040000b029019d22d84ebdso3251082wmi.3
 for <dri-devel@lists.freedesktop.org>; Wed, 02 Jun 2021 01:57:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fooishbar-org.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=brL3Kj/KAhdw9wVkWElMJ2rpOminFezvYvb4e68I3Js=;
 b=YOiDzlaBMHYzYUgpD0IJx/Brn7VUqdB/J8V0sJ0P1WuyfDp/vEGdOfyFTuj3gFNWY2
 iYs1WwMv6L5OjvWwL18waXErpPIqEKudm5lhn43a4PMTB0eKy04d89VCbpHy4jaIxAxX
 Rxczfm0dmQGKslfyNLYrbaGkB6EptI+QjR8Q+PYq7phNwG0EPvbpuCNVPfmeNwdDXgLc
 GQ0p9Fe5NM9e5V9Yk01zeOag0ewJr55y/Ua0+UUWog3A7PjbS7EQy9JiwQoFV6PDxCgN
 WZq5JbRGGypN5Z57wbfvDkXOLXLTQucGo99l/kyahfWpGHCPQ7tCvv7ypmoy/lyzgSZ8
 e8VQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=brL3Kj/KAhdw9wVkWElMJ2rpOminFezvYvb4e68I3Js=;
 b=FCjyeIGamRP4hR9CBNsikxitE8BJ4Juz0jHkM1vDriuyeNJ3MW7XNBwdXwFJnyKNRe
 Y7oHojk0g/JNnEdmt9iJ+Rw9GJ9KYlmpYH9BS37h0FBDdkipJK9zU2CYbze57+56v5Ex
 cba45BSCqdK8pn7nc1iJ9BlbJDniVXWL7hXGyAtz2LvTnq5OonYLybdFPz4sRaGEBJk1
 jtzrp9CVNztmVtR3kPFxYw2x590Zi58W3GV366aDsNnCmWp6VoEaYDvtNSKip0MGujhP
 kZZyTAoBR585l/2IIJJ4EHULTZ0PsizJYa3tZhhe5DP6rFUQebTfwV4D2Mldl4zKHr77
 NVSA==
X-Gm-Message-State: AOAM531wTH+q/S8Tlm4GLIunJGJKwcRdocLlQHdsP/W02bQ9rV5qvfqg
 uzf33A2cef+DBjq+bfZHASe4sbEQIfppvaMFYLinSA==
X-Google-Smtp-Source: ABdhPJynluux7Xl+9azDQKlQ78oxfF0/t1vC7CBZ6vCduB8o3ZQ8UPHn5jNVkGdQCW6vs+q6TByLV7p503BEfiAjXNI=
X-Received: by 2002:a7b:cd04:: with SMTP id f4mr31715058wmj.84.1622624252692; 
 Wed, 02 Jun 2021 01:57:32 -0700 (PDT)
MIME-Version: 1.0
References: <CAAxE2A4XS2mCXOdvxm1ZAhG2OY9w1P0X2E1ac1TXNFKDekog5g@mail.gmail.com>
 <e7cb9833-1044-0426-5ce4-5b5fc32a3603@daenzer.net>
 <327e4008-b29f-f5b7-bb30-532fa52c797f@gmail.com>
 <7f19e3c7-b6b2-5200-95eb-3fed8d22a6b3@daenzer.net>
 <b0d65f94-cc56-a4db-3158-7b1de3952792@gmail.com>
 <CAKMK7uGaD_LuX-SZDALuDuEOMZNX=Q3FAq0xYf_pTVtNe6VUaw@mail.gmail.com>
 <c7190219-c185-3b7e-42a6-691934f79fb3@gmail.com>
In-Reply-To: <c7190219-c185-3b7e-42a6-691934f79fb3@gmail.com>
From: Daniel Stone <daniel@fooishbar.org>
Date: Wed, 2 Jun 2021 09:57:20 +0100
Message-ID: <CAPj87rPbiFf3qDo35gmirAoTOOJ5fEE6UxQdJKtfjX_VTqc6pg@mail.gmail.com>
Subject: Re: [Mesa-dev] Linux Graphics Next: Userspace submission update
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>
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
Cc: =?UTF-8?B?TWFyZWsgT2zFocOhaw==?= <maraeo@gmail.com>,
 =?UTF-8?Q?Michel_D=C3=A4nzer?= <michel@daenzer.net>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Jason Ekstrand <jason@jlekstrand.net>,
 ML Mesa-dev <mesa-dev@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Christian,

On Tue, 1 Jun 2021 at 13:51, Christian K=C3=B6nig
<ckoenig.leichtzumerken@gmail.com> wrote:
> Am 01.06.21 um 14:30 schrieb Daniel Vetter:
> > If you want to enable this use-case with driver magic and without the
> > compositor being aware of what's going on, the solution is EGLStreams.
> > Not sure we want to go there, but it's definitely a lot more feasible
> > than trying to stuff eglstreams semantics into dma-buf implicit
> > fencing support in a desperate attempt to not change compositors.
>
> Well not changing compositors is certainly not something I would try
> with this use case.
>
> Not changing compositors is more like ok we have Ubuntu 20.04 and need
> to support that we the newest hardware generation.

Serious question, have you talked to Canonical?

I mean there's a hell of a lot of effort being expended here, but it
seems to all be predicated on the assumption that Ubuntu's LTS
HWE/backport policy is totally immutable, and that we might need to
make the kernel do backflips to work around that. But ... is it? Has
anyone actually asked them how they feel about this?

I mean, my answer to the first email is 'no, absolutely not' from the
technical perspective (the initial proposal totally breaks current and
future userspace), from a design perspective (it breaks a lot of
usecases which aren't single-vendor GPU+display+codec, or aren't just
a simple desktop), and from a sustainability perspective (cutting
Android adrift again isn't acceptable collateral damage to make it
easier to backport things to last year's Ubuntu release).

But then again, I don't even know what I'm NAKing here ... ? The
original email just lists a proposal to break a ton of things, with
proposed replacements which aren't technically viable, and it's not
clear why? Can we please have some more details and some reasoning
behind them?

I don't mind that userspace (compositor, protocols, clients like Mesa
as well as codec APIs) need to do a lot of work to support the new
model. I do really care though that the hard-binary-switch model works
fine enough for AMD but totally breaks heterogeneous systems and makes
it impossible for userspace to do the right thing.

Cheers,
Daniel
