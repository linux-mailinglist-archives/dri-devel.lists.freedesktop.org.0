Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 292EA811466
	for <lists+dri-devel@lfdr.de>; Wed, 13 Dec 2023 15:16:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5BA8210E2BF;
	Wed, 13 Dec 2023 14:16:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x236.google.com (mail-lj1-x236.google.com
 [IPv6:2a00:1450:4864:20::236])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5B7BF10E07D
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Dec 2023 14:16:29 +0000 (UTC)
Received: by mail-lj1-x236.google.com with SMTP id
 38308e7fff4ca-2c9f7fe6623so88060531fa.3
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Dec 2023 06:16:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1702476987; x=1703081787; darn=lists.freedesktop.org;
 h=mime-version:references:in-reply-to:message-id:subject:cc:to:from
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=HnmrUE6uA1UjU0DGZJd+ywoyYgk2RFZ2Qv8HjSJNWug=;
 b=cLAcxmTM2wic1lTVaspz/NxaFFUStJmAj7Ax18sCgt8xrfpAfgU9uKiVT7FEref8tM
 KIMiJD0qlA5WXgu5hCnlmkCPkJT2RUZeEX1Qw4/u2a0a7yEJ9eKPGkVSD3MVCLGuR66p
 qK7sDKqRZdB8Qgtpi4N60bJm0VdaloADhcnlhLFCGLZmrc/xnovS9ld8suPiSMhJqkr9
 sINXxvnMu09Ljzqw/WN0zv6UEKypfIZRg54TnokT93y8bj2qF0TemxfY2vQ1RFxdaThT
 2ajLAkfImY3x5mypTCk+G7Hax7tXbEVTi5YrHH9ul1CTbsg4gTeJONdnBUw/nmQtkHrB
 JPKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1702476987; x=1703081787;
 h=mime-version:references:in-reply-to:message-id:subject:cc:to:from
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=HnmrUE6uA1UjU0DGZJd+ywoyYgk2RFZ2Qv8HjSJNWug=;
 b=nF3uupRjmq+0K5ewyXTly3nDzjE1Oxv5Bo9l9iACxck1AEPlg6tGOu63RevzX2vL1S
 +/CR24WHWD+t/7V5XYc00s5BbiQ1E/9jijWfHSNZ5JnPV2u71aoRL1C+x1By0F2RIckQ
 6lEojFrr66dHGbTuVzFZDUWJfGGn6z6xYHwDvnJThVu6i24R3N4bCEAsWuse6ZzfPGoj
 hmyQZQZNpdUYhZxauGFSCkS7M+XEuYmpVrsEFHfpHsugb5rzdXmD33PTIWksBDluI0fW
 tUPSGM09jBBBagT5+pLjPoeJHKg/hHhI8gNzQ/7ScDoEH4uZa8/Ub99FcGkmVcL1dcPd
 gBEA==
X-Gm-Message-State: AOJu0YyHdu1MnCUP3VYgL6fjNlMzRRGKUC9JUclDb+aw2jr+j7nPyb3v
 njBYC/P5Uw/QyTJURUp8pyk=
X-Google-Smtp-Source: AGHT+IHMEFbwY2jxx7Eqytsu4ONvN/Lw6aO1DvwW9XsiwGhW/Welyye/FmxGvgN+8ji2wLeKZxibCA==
X-Received: by 2002:a2e:9b03:0:b0:2ca:34cd:77ea with SMTP id
 u3-20020a2e9b03000000b002ca34cd77eamr2472316lji.44.1702476987175; 
 Wed, 13 Dec 2023 06:16:27 -0800 (PST)
Received: from eldfell ([194.136.85.206]) by smtp.gmail.com with ESMTPSA id
 20-20020a2eb954000000b002c9f62145f8sm1868126ljs.82.2023.12.13.06.16.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 13 Dec 2023 06:16:26 -0800 (PST)
Date: Wed, 13 Dec 2023 16:16:14 +0200
From: Pekka Paalanen <ppaalanen@gmail.com>
To: Joakim Bech <joakim.bech@linaro.org>
Subject: Re: [PATCH v3 0/7] dma-buf: heaps: Add secure heap
Message-ID: <20231213161614.43e5bca8@eldfell>
In-Reply-To: <20231213132229.q3uxdhtdsxuzw3w6@pop-os.localdomain>
References: <20231212024607.3681-1-yong.wu@mediatek.com>
 <DPBmATfmfvSP8Cwjz99kj_JvCEiAqRfuMFJZEBF2aIgl8NZqWFR66eyPTX1E8bHyOlimBihEE3E80p9bfOJ-0SNu8pwoIzL9gD2Xae6r97g=@emersion.fr>
 <20231213110517.6ce36aca@eldfell>
 <20231213101549.lioqfzjxcvmqxqu3@pop-os.localdomain>
 <20231213133825.0a329864@eldfell>
 <20231213132229.q3uxdhtdsxuzw3w6@pop-os.localdomain>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/m_y9/L720k3.YUUEknjTd2h";
 protocol="application/pgp-signature"; micalg=pgp-sha256
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
Cc: dri-devel@lists.freedesktop.org, John Stultz <jstultz@google.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 Jeffrey Kardatzke <jkardatzke@google.com>,
 Benjamin Gaignard <benjamin.gaignard@collabora.com>,
 Vijayanand Jitta <quic_vjitta@quicinc.com>,
 Nicolas Dufresne <nicolas@ndufresne.ca>, Yong Wu <yong.wu@mediatek.com>,
 jianjiao.zeng@mediatek.com, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 ckoenig.leichtzumerken@gmail.com, linaro-mm-sig@lists.linaro.org,
 Rob Herring <robh+dt@kernel.org>, linux-mediatek@lists.infradead.org,
 Matthias Brugger <matthias.bgg@gmail.com>, tjmercier@google.com,
 linux-arm-kernel@lists.infradead.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 kuohong.wang@mediatek.com, linux-kernel@vger.kernel.org,
 christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--Sig_/m_y9/L720k3.YUUEknjTd2h
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Wed, 13 Dec 2023 14:22:29 +0100
Joakim Bech <joakim.bech@linaro.org> wrote:

> On Wed, Dec 13, 2023 at 01:38:25PM +0200, Pekka Paalanen wrote:
> > On Wed, 13 Dec 2023 11:15:49 +0100
> > Joakim Bech <joakim.bech@linaro.org> wrote:
> >  =20
> > > On Wed, Dec 13, 2023 at 11:05:17AM +0200, Pekka Paalanen wrote: =20
> > > > On Tue, 12 Dec 2023 16:36:35 +0000
> > > > Simon Ser <contact@emersion.fr> wrote:
> > > >    =20
> > > > > Is there a chance to pick a better name than "secure" here?
> > > > >=20
> > > > > "Secure" is super overloaded, it's not clear at all what it means=
 from
> > > > > just the name. Something like "restricted" would be an improvemen=
t.
> > > > >    =20
> > > >=20
> > > > My thoughts exactly. Every time I see "secure" used for something t=
hat
> > > > either gives you garbage, refuses to work, or crashes your whole ma=
chine
> > > > *intentionally* when you try to do normal usual things to it in
> > > > userspace (like use it for GL texturing, or try to use KMS writebac=
k), I
> > > > get an unscratchable itch.
> > > >=20
> > > > There is nothing "secure" from security perspective there for end u=
sers
> > > > and developers. It's just inaccessible buffers.
> > > >=20
> > > > I've been biting my lip until now, thinking it's too late.
> > > >    =20
> > > The characteristics we're looking for here is a buffer where the cont=
ent
> > > is inaccessible to the normal OS and user space, i.e., Non-secure EL0=
 to
> > > EL2. I.e, the content of the buffer is meant to be used and accessible
> > > primarily by the secure side and other devices that has been granted =
=20
> >=20
> > s/secure side/proprietary side/
> >  =20
> I'm using the nomenclature as written by Arm (other architectures have
> other names for their secure execution states).
>=20
> > I presume nothing of the other side can ever be in any way open?
> >  =20
> I'm sure there are lots of examples of things running on the secure side
> that are open. The OP-TEE project where I'm a maintainer has been fully
> open source since 2014, to give one example that I'm familiar with
> myself.

Oh, I didn't realise there were FOSS implementations of the other side
that tie in with this secure/restricted heap here. Sorry.

I think the patch series cover letter should point to those to give a
view of the other side to the reviewers, just like DRM requires
userspace to be open for new UAPI.

> > Maybe the other side is even less secure than the FOSS side...
> >  =20
> > > access to it (for example decoders, display controllers if we're talk=
ing
> > > about video use cases). However, since the use cases for this exercis=
es
> > > the whole stack, from non-secure user space (EL0) all the way to secu=
re
> > > user space (S-EL0), with various devices needing access to the buffer=
 at
> > > various times, it makes sense to let Linux manage the buffers, althou=
gh
> > > it still cannot access the content. That's the overall context. =20
> >=20
> > Yes, we know all this (except for the exact meaning of EL0 etc.).
> >  =20
> Great!
>=20
> > > As for the name, it's always difficult to find a name suitable precis=
ely
> > > describing what it is. "Secure" is perhaps vague, but it might still a
> > > good choice, if you carefully describe what secure means for this
> > > particular heap (in the source code and the documentation for it). Fo=
r =20
> >=20
> > Carefully describe, as in, re-define.
> >  =20
> > > example, the definition of "secure" for a secure heap as here could m=
ean
> > > that buffer content is inaccessible to the host OS and user space
> > > running in normal world (using Arm nomenclature). I wouldn't have any
> > > problems with calling it secure if, as said it's defined what we mean=
 by
> > > saying so. But I'm all ears for other suggestions as well.
> > >=20
> > > Safe, protected, shielded, unreachable, isolated, inaccessible,
> > > unaccessible, fortified, ... would any of these make more sense? =20
> >=20
> > "Restricted" sounds like a good compromise to me. The buffers' usage is
> > severely restricted.
> >  =20
> Yes, restricted isn't a bad choice. We would still need to describe what
> we mean by saying it's restricted, i.e., what is it restricted from,
> since I'd guess that "restricted" by itself also could be a bit open
> ended for a lot of people.

Yes, but "restricted" also does not give out an immediate wrong
impression. Label something as "secure", and it immediately raises the
questions of what kind of attacks it prevents and how can I make use of
it.

Is there any use of restricted buffers outside of Digital Rights
Management though? Could a private person somehow make use of it to
protect their own contents? Like a photographer sending drafts to a
customer while not wanting give out any digital copies?

If not, then restricted buffers are something people would generally
like to avoid, not embrace. "Secure" gives a positive impression,
"restricted" a negative impression.

> > It is the opposite of "safe", because accessing the contents the wrong
> > way can return garbage or intentionally crash the whole system,
> > depending on the hardware implementation. One example is attempting to
> > put such a buffer on a KMS plane while the connector HDCP state is not
> > high enough, or a writeback connector is connected to the CRTC. It is
> > really fragile. (Do KMS drivers fail an atomic commit that would
> > violate the heap rules? Somehow I doubt that, who'd even know what the
> > rules are.)
> >  =20
> I believe one of the goals with reviewing the patches is to highlight
> issues like this and try to figure out how to avoid ending up in
> situations like what you described by suggesting alternative solutions
> and ideas.
>=20
> > It is protected/shielded/fortified from all the kernel and userspace,
> > but a more familiar word to describe that is inaccessible.
> > "Inaccessible buffer" per se OTOH sounds like a useless concept.
> >=20
> > It is not secure, because it does not involve security in any way. In
> > fact, given it's so fragile, I'd classify it as mildly opposite of
> > secure, as e.g. clients of a Wayland compositor can potentially DoS the
> > compositor with it by simply sending such a dmabuf. Or DoS the whole
> > system.
> >  =20
> I hear what you are saying and DoS is a known problem and attack vector,
> but regardless, we have use cases where we don't want to expose
> information in the clear and where we also would like to have some
> guarantees about correctness. That is where various secure elements and
> more generally security is needed.
>=20
> So, it sounds like we have two things here, the first is the naming and
> the meaning behind it. I'm pretty sure the people following and
> contributing to this thread can agree on a name that makes sense. Would
> you personally be OK with "restricted" as the name? It sounds like that.

I would. I'm also just a by-stander, not a maintainer of kernel
anything. I have no power to accept nor reject anything here.

> The other thing is the feature and functionality itself offered by this
> patch series. My impression from reading your replies is that you think
> this is the wrong approach. If my impression is correct, what would you
> suggest as an alternative approach?

I just generally dislike locking people out of what their systems hold,
but I also understand why extremely big companies want this Digital
Rights Management technology for their business model. If Linux does
not support that business model, they and the whole broadcast industry
might use something else. At least it pays for kernel developers who
can hopefully do some genuinely useful work on the side as well,
benefiting the community.

Let's just be honest about what is what.


Thanks,
pq

--Sig_/m_y9/L720k3.YUUEknjTd2h
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAmV5vK4ACgkQI1/ltBGq
qqeSrxAAsVMu1uwUAEiHOmIbdZ3IMpYONvvX9PjrsowXIzc4xZ+sohcdjwWsN9LM
ZwyXBLhxVmbSKy55b8fNI2UR51yIDO8E6lZLQieSxAulEzya2aMjmJEHoXdBo/sS
A3aGLk4Wu7hh4kSbyeOSoLf2Xf+Fg85puarR12WrxHwXn2JvFteRe1NX2v5+QJSn
lzGOqYb4bFIIC7oL7qBVH3VBT/st+RdqvUGnsJlvngSO/YEZz8Q2AZTt8sE1R/mT
6eZ9cidJoUdKqF9vKAxiKpTJyiVLpYqvhm9cvGQinbsYz3QKoUICKcSIGCGZlQti
2GShGtnPL1qpZfo95xzcu+fw/9g9DC3BRbG/+dV84txlxzn8y1pD6kGka9HjPhi1
ZuPC1MVNFvSOpv7tIvRRI/lD4ZRKdRJnvW4DDFntEhVfjGq0I5ezVjqBBHcic4QE
tWWjkepYco492avLdzrJFuVbzj9VwzCRt+M/mlIyons/QfvX/SoRGDya2pk1DNvF
NBK3Rf4qvOsooioZRNe8PnR/aBXw0MRFMN8htEKcuUHZnOCeIih+PV7VJwGMLMC2
vjYC7/yXalMFutcYjBJeMyqQylgXUsoJY2WB4d4alazZvlMFrQ/v6+t9y2aOHdpZ
+XGDbbjlVimKW1utrZlaHsi8w8Dbk9OH3I3tOZZQYfBgAFj6Nco=
=IiKA
-----END PGP SIGNATURE-----

--Sig_/m_y9/L720k3.YUUEknjTd2h--
