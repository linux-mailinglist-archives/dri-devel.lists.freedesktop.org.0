Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B19A6811048
	for <lists+dri-devel@lfdr.de>; Wed, 13 Dec 2023 12:38:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0823A10E100;
	Wed, 13 Dec 2023 11:38:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com
 [IPv6:2a00:1450:4864:20::22a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5633310E100
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Dec 2023 11:38:39 +0000 (UTC)
Received: by mail-lj1-x22a.google.com with SMTP id
 38308e7fff4ca-2cc3647bf06so7226751fa.2
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Dec 2023 03:38:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1702467517; x=1703072317; darn=lists.freedesktop.org;
 h=mime-version:references:in-reply-to:message-id:subject:cc:to:from
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=erM8V8RgO6KRLO/yh7jID1/baZLh+uPtPuh+atBa3V8=;
 b=JaWHWinfihWwIf1jDshbCpj4vuwpX0z2hQ3bF0dKPYTZ8gRJuuOFDhNf2JJEsNxgc+
 xHkFfh1qN9cUIm1RYUGOJvGfu+ghumHu4hfUttcGyFARr+p/CC80qecqRKBpXLOo5iVB
 46p7erI+PfgwRuFzu9dUVnp1i55aBU85HwODtHfbHPIJ0Uv4pMd0wbLZgkv5Nf3x1Ojf
 GBPV6yASw1qoXFefKRt+S0suZY/5r3GnVCNVwZETbZ52cVkr5eBsCOE/Mx93StguYXGi
 RFdEUjXIwDuc9JakXZz4PxhdeFQTlq5Yxy5YzQ7/41HEJausZHvojyWB4i9HOfTFOL+0
 kN+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1702467517; x=1703072317;
 h=mime-version:references:in-reply-to:message-id:subject:cc:to:from
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=erM8V8RgO6KRLO/yh7jID1/baZLh+uPtPuh+atBa3V8=;
 b=q/iYesSx9aTOaSNaghmaSaJF3IqvFbW5FFnFuoqyrErH9vSgLysJdzocTHHFvu+CG1
 1jHVb7UzM5Q/f1RO0L/Pd49Fef/Cxal4wAhANKn4vUifnoXbwoAJQ4uvTPZtx3veaGci
 S15kmp5KQEgUE+uNikWO//FG0N7EVMQh+asETJXLrBGXyKdM8+gYmI+EwM/pycDn6FqC
 w8AoM8Ybrlof46ufoYJEQmbNPnYBg5x7YpAJgUkfutL1ZnCX/RwHdtbKTClkoSeYXA6c
 qFaqiZ8CrouRVQwUwmwOUXUpVaUbPr3p6P0dUCAz51UYr/7mzpVgck0x0q8zahXOA+hn
 POqA==
X-Gm-Message-State: AOJu0Yz1Z3RlQBNxa8k/WT15h5Bz7ogL7duAUlsm3YhNmlrLAwe7Pt6l
 fTmqutPOZnP2unsKlb11Hq0=
X-Google-Smtp-Source: AGHT+IGrw7mppJSoNS7Dsgtj7c74Wvr4sERgMIvNl5Jx450IZ2/p127Sh3s8TK2qiUjKMuJrmp211w==
X-Received: by 2002:a2e:330e:0:b0:2ca:226:423b with SMTP id
 d14-20020a2e330e000000b002ca0226423bmr2342385ljc.48.1702467517050; 
 Wed, 13 Dec 2023 03:38:37 -0800 (PST)
Received: from eldfell ([194.136.85.206]) by smtp.gmail.com with ESMTPSA id
 q6-20020a2e2a06000000b002c9e9c29670sm1767204ljq.47.2023.12.13.03.38.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 13 Dec 2023 03:38:36 -0800 (PST)
Date: Wed, 13 Dec 2023 13:38:25 +0200
From: Pekka Paalanen <ppaalanen@gmail.com>
To: Joakim Bech <joakim.bech@linaro.org>
Subject: Re: [PATCH v3 0/7] dma-buf: heaps: Add secure heap
Message-ID: <20231213133825.0a329864@eldfell>
In-Reply-To: <20231213101549.lioqfzjxcvmqxqu3@pop-os.localdomain>
References: <20231212024607.3681-1-yong.wu@mediatek.com>
 <DPBmATfmfvSP8Cwjz99kj_JvCEiAqRfuMFJZEBF2aIgl8NZqWFR66eyPTX1E8bHyOlimBihEE3E80p9bfOJ-0SNu8pwoIzL9gD2Xae6r97g=@emersion.fr>
 <20231213110517.6ce36aca@eldfell>
 <20231213101549.lioqfzjxcvmqxqu3@pop-os.localdomain>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/xTcL2+m+K.KNDg_qGM9LG9u";
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

--Sig_/xTcL2+m+K.KNDg_qGM9LG9u
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Wed, 13 Dec 2023 11:15:49 +0100
Joakim Bech <joakim.bech@linaro.org> wrote:

> On Wed, Dec 13, 2023 at 11:05:17AM +0200, Pekka Paalanen wrote:
> > On Tue, 12 Dec 2023 16:36:35 +0000
> > Simon Ser <contact@emersion.fr> wrote:
> >  =20
> > > Is there a chance to pick a better name than "secure" here?
> > >=20
> > > "Secure" is super overloaded, it's not clear at all what it means from
> > > just the name. Something like "restricted" would be an improvement.
> > >  =20
> >=20
> > My thoughts exactly. Every time I see "secure" used for something that
> > either gives you garbage, refuses to work, or crashes your whole machine
> > *intentionally* when you try to do normal usual things to it in
> > userspace (like use it for GL texturing, or try to use KMS writeback), I
> > get an unscratchable itch.
> >=20
> > There is nothing "secure" from security perspective there for end users
> > and developers. It's just inaccessible buffers.
> >=20
> > I've been biting my lip until now, thinking it's too late.
> >  =20
> The characteristics we're looking for here is a buffer where the content
> is inaccessible to the normal OS and user space, i.e., Non-secure EL0 to
> EL2. I.e, the content of the buffer is meant to be used and accessible
> primarily by the secure side and other devices that has been granted

s/secure side/proprietary side/

I presume nothing of the other side can ever be in any way open?

Maybe the other side is even less secure than the FOSS side...

> access to it (for example decoders, display controllers if we're talking
> about video use cases). However, since the use cases for this exercises
> the whole stack, from non-secure user space (EL0) all the way to secure
> user space (S-EL0), with various devices needing access to the buffer at
> various times, it makes sense to let Linux manage the buffers, although
> it still cannot access the content. That's the overall context.

Yes, we know all this (except for the exact meaning of EL0 etc.).

> As for the name, it's always difficult to find a name suitable precisely
> describing what it is. "Secure" is perhaps vague, but it might still a
> good choice, if you carefully describe what secure means for this
> particular heap (in the source code and the documentation for it). For

Carefully describe, as in, re-define.

> example, the definition of "secure" for a secure heap as here could mean
> that buffer content is inaccessible to the host OS and user space
> running in normal world (using Arm nomenclature). I wouldn't have any
> problems with calling it secure if, as said it's defined what we mean by
> saying so. But I'm all ears for other suggestions as well.
>=20
> Safe, protected, shielded, unreachable, isolated, inaccessible,
> unaccessible, fortified, ... would any of these make more sense?

"Restricted" sounds like a good compromise to me. The buffers' usage is
severely restricted.

It is the opposite of "safe", because accessing the contents the wrong
way can return garbage or intentionally crash the whole system,
depending on the hardware implementation. One example is attempting to
put such a buffer on a KMS plane while the connector HDCP state is not
high enough, or a writeback connector is connected to the CRTC. It is
really fragile. (Do KMS drivers fail an atomic commit that would
violate the heap rules? Somehow I doubt that, who'd even know what the
rules are.)

It is protected/shielded/fortified from all the kernel and userspace,
but a more familiar word to describe that is inaccessible.
"Inaccessible buffer" per se OTOH sounds like a useless concept.

It is not secure, because it does not involve security in any way. In
fact, given it's so fragile, I'd classify it as mildly opposite of
secure, as e.g. clients of a Wayland compositor can potentially DoS the
compositor with it by simply sending such a dmabuf. Or DoS the whole
system.

"Poisonous heap" would be fitting but politically inappropriate I
guess. After all, "poison" is data that is not meant to be read by
anything normal.


Thanks,
pq

--Sig_/xTcL2+m+K.KNDg_qGM9LG9u
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAmV5l7EACgkQI1/ltBGq
qqd21w/7B5AOlcm0BJvZ+kXMgngEgshf4OR5HVOLoGtC3uQwgQJLmIotDzGjaXnM
YNpvxE7i3jgF/MvfUynt58CspSm4fcgJzP5fjqD5zTAQ7BH2PFxnyl8Ko1AemP1A
yauV0Fco65ZDgsZRGCxZeCI60vtceCYPECULnQSC67w2ToHsdQsgaSH2DnTmNPgZ
TSqV553NtqYEc4U1XcfN0kwwwG7l3B5k7Fv57eEcLbpYjHhVHDc2Lbr138SWn7fx
APC3vIZGlAKGPSDwHCApb/xA9SiCprT1nxKtqsPnYON3OWeivPqd8w3ehdaHGI93
d5F6GM6c7XyTxSpde5H9UueQROreZB1JOrF81Pw4u3dJ0NMYjludA64BBnbDx4u7
HDPQDMMtpq2Gvg+FosmzYa3Pf1laWztXyqcjhrvr9W7FPvzDOvnA8Jt05jgRYHBO
Fi+ghVDeIkuiv3Yk5Ien7FStcO6OKjSeRErZvR3Cqu1ZdTZOd7+Pg7eZe+bdNtsN
lEaSLNF8x9hRQjBE3hsP9El2dcOIZbvxElDhczpHy+mEfHyf4wp6slc8be+dFiwq
b/kHVXxALVcRSBoa7E26WS0zcXgE0CyHkFAoMI/E6S2Ijxxf1UIGwTQyVzaUQ/V4
5FZEBlGLow3ax7wAl+aXTOAubzc4cm+LI17q6TbeRqcL9y0EBcU=
=P1qu
-----END PGP SIGNATURE-----

--Sig_/xTcL2+m+K.KNDg_qGM9LG9u--
