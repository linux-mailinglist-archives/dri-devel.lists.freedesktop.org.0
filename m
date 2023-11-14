Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C3EE7EA837
	for <lists+dri-devel@lfdr.de>; Tue, 14 Nov 2023 02:32:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BB76210E065;
	Tue, 14 Nov 2023 01:32:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-x112a.google.com (mail-yw1-x112a.google.com
 [IPv6:2607:f8b0:4864:20::112a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8EAD810E065;
 Tue, 14 Nov 2023 01:32:51 +0000 (UTC)
Received: by mail-yw1-x112a.google.com with SMTP id
 00721157ae682-5afabb23900so60362897b3.2; 
 Mon, 13 Nov 2023 17:32:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1699925570; x=1700530370; darn=lists.freedesktop.org;
 h=in-reply-to:autocrypt:references:cc:to:from:content-language
 :subject:user-agent:mime-version:date:message-id:from:to:cc:subject
 :date:message-id:reply-to;
 bh=tukRLBW3zmQ0oPuYgOr/iYwnmqrUDyVTNwWEcMedHgc=;
 b=HP53NJbfEYSFDi3gXdJY6/Ihz0O0lwaXJnSyGKUILhPsO2xWXs76xGnHJlu1bNP6Wc
 ViVqk3BMNTd6KMsyMJ7w3hqxSbGFIEVUvE6ye3H+dt+4P73j4VKlbpHZn5XnpFAqstCK
 oeD5keRnp/6xJ3EDV2Em78pvoR4uEKj/Mw2GpMb7KJ2KfW0OcBFDbRJlRYRhdwwM7IA0
 OXUkQ0+ERQyoOz6WwSkd1WmdHIkyWWW0WFldwtdY3hXo0kZw/Br1R3IdoMPKvdT+VbiR
 Sd9F+Jy91LmzJ2Bzlr2DUPjin0jmPutSZfs45jhIAEtkyvt96/ncG3/t5RlIHzcZ/y0F
 pgVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699925570; x=1700530370;
 h=in-reply-to:autocrypt:references:cc:to:from:content-language
 :subject:user-agent:mime-version:date:message-id:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=tukRLBW3zmQ0oPuYgOr/iYwnmqrUDyVTNwWEcMedHgc=;
 b=Ld7MoQyXKqPO9Z4pmHKtH6+yAim7oI6fWAEXkwl2Vop6fxoxfSxKjaCXx5DCCIjG3Y
 Da6qv7mDeniyg8/t5IBb2ZmwqA34RcfAehCjgryCc2X+zmCaLWgYqwAZ3bV8sLxobOpP
 Gkd2p+EjcnxJTXpCP0eOnzYUKgxVuuIIdqZGmE4rZwB3psouYeTi3M1CFMCbV0NAp1s0
 iGYXPfVZPJ0YbxPTsd1HtFF4n+2qRzZLcFhzP5LhyAaDMu9AXfag2/H9bzVjPIjcVAKX
 I9Tiq1An56bw2hMZc9l1QFzB4UlJ5BeqfnSh5P/I0jsTtuXgv5lp9j8gtGcg603zo1ng
 6ogw==
X-Gm-Message-State: AOJu0YxxVj4RfB7kzpnSfvBwjUyCM6/zacOncZj9Oo/S/wsRMFkTijnm
 N6plgayWcuKd3uT9qh/20dY=
X-Google-Smtp-Source: AGHT+IEOS4PSTo4e307r2xljjuv01x1t5vILWdqwLL6Kcb+v09Mst0VP/nhA2JZpeNAKvQUHGM31oQ==
X-Received: by 2002:a0d:dd51:0:b0:5a7:b53f:c304 with SMTP id
 g78-20020a0ddd51000000b005a7b53fc304mr9146485ywe.37.1699925570631; 
 Mon, 13 Nov 2023 17:32:50 -0800 (PST)
Received: from [192.168.2.14] ([76.65.20.140])
 by smtp.gmail.com with ESMTPSA id
 s8-20020ad45008000000b0067095b0c473sm2508194qvo.11.2023.11.13.17.32.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 13 Nov 2023 17:32:49 -0800 (PST)
Message-ID: <3c306310-04b3-4658-a197-4b2d22a88274@gmail.com>
Date: Mon, 13 Nov 2023 20:32:40 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:115.0) Gecko/20100101
 Thunderbird/115.4.2
Subject: Re: linux-next: Signed-off-by missing for commit in the drm-misc tree
Content-Language: en-CA, en-US
From: Luben Tuikov <ltuikov89@gmail.com>
To: Stephen Rothwell <sfr@canb.auug.org.au>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 Intel Graphics <intel-gfx@lists.freedesktop.org>,
 DRI <dri-devel@lists.freedesktop.org>
References: <20231114075501.61321c29@canb.auug.org.au>
 <19740d41-dd5a-47e4-b3e8-539b45bbd3e5@gmail.com>
Autocrypt: addr=ltuikov89@gmail.com; keydata=
 xjMEZTohOhYJKwYBBAHaRw8BAQdAWSq76k+GsENjDTMVCy9Vr4fAO9Rb57/bPT1APnbnnRHN
 Ikx1YmVuIFR1aWtvdiA8bHR1aWtvdjg5QGdtYWlsLmNvbT7CmQQTFgoAQRYhBJkj7+VmFO9b
 eaAl10wVR5QxozSvBQJlOiE6AhsDBQkJZgGABQsJCAcCAiICBhUKCQgLAgQWAgMBAh4HAheA
 AAoJEEwVR5QxozSvSm4BAOwCpX53DTQhE20FBGlTMqKCOQyJqlMcIQ9SO1qPWX1iAQCv3vfy
 JwktF7REl1yt7IU2Sye1qmQMfJxdt9JMbMNNBs44BGU6IToSCisGAQQBl1UBBQEBB0BT9wSP
 cCE8uGe7FWo8C+nTSyWPXKTx9F0gpEnlqReRBwMBCAfCfgQYFgoAJhYhBJkj7+VmFO9beaAl
 10wVR5QxozSvBQJlOiE6AhsMBQkJZgGAAAoJEEwVR5QxozSvSsYA/2LIFjbxQ2ikbU5S0pKo
 aMDzO9eGz69uNhNWJcvIKJK6AQC9228Mqc1JeZMIyjYWr2HKYHi8S2q2/zHrSZwAWYYwDA==
In-Reply-To: <19740d41-dd5a-47e4-b3e8-539b45bbd3e5@gmail.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------Ag1iPz8wDKzQj3npkMVsgJvf"
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
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------Ag1iPz8wDKzQj3npkMVsgJvf
Content-Type: multipart/mixed; boundary="------------lDsnbz37qjLh8AAZsz0OX8aD";
 protected-headers="v1"
From: Luben Tuikov <ltuikov89@gmail.com>
To: Stephen Rothwell <sfr@canb.auug.org.au>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 Intel Graphics <intel-gfx@lists.freedesktop.org>,
 DRI <dri-devel@lists.freedesktop.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Next Mailing List <linux-next@vger.kernel.org>
Message-ID: <3c306310-04b3-4658-a197-4b2d22a88274@gmail.com>
Subject: Re: linux-next: Signed-off-by missing for commit in the drm-misc tree
References: <20231114075501.61321c29@canb.auug.org.au>
 <19740d41-dd5a-47e4-b3e8-539b45bbd3e5@gmail.com>
In-Reply-To: <19740d41-dd5a-47e4-b3e8-539b45bbd3e5@gmail.com>

--------------lDsnbz37qjLh8AAZsz0OX8aD
Content-Type: multipart/mixed; boundary="------------aiAdaoPN5W8gHNYSkvHCD3VM"

--------------aiAdaoPN5W8gHNYSkvHCD3VM
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On 2023-11-13 20:08, Luben Tuikov wrote:
> On 2023-11-13 15:55, Stephen Rothwell wrote:
>> Hi all,
>>
>> Commit
>>
>>   0da611a87021 ("dma-buf: add dma_fence_timestamp helper")
>>
>> is missing a Signed-off-by from its committer.
>>
>=20
> In order to merge the scheduler changes necessary for the Xe driver, th=
ose changes
> were based on drm-tip, which included this change from drm-misc-fixes, =
but which
> wasn't present in drm-misc-next.
>=20
> I didn't want to create a merge conflict between drm-misc-next and drm-=
misc-fixes,
> when pulling that change from drm-misc-next to drm-misc-fixes, so that =
I can apply

=2E.. when pulling that change from from drm-misc-fixes into drm-misc-nex=
t, so that I can apply...

> the Xe scheduler changes on top of drm-misc-next.

The change in drm-misc-fixes is b83ce9cb4a465b. The latter is contained
in linus-master, and in drm-misc-fixes, while the former is in drm-misc-n=
ext.
When we merge linus-master/drm-misc-fixes into drm-misc-next, or whicheve=
r way
it happens, I'd like to avoid a merge conflict, but wanted to expedite th=
e changes
for Xe.
--=20
Regards,
Luben

--------------aiAdaoPN5W8gHNYSkvHCD3VM
Content-Type: application/pgp-keys; name="OpenPGP_0x4C15479431A334AF.asc"
Content-Disposition: attachment; filename="OpenPGP_0x4C15479431A334AF.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

xjMEZTohOhYJKwYBBAHaRw8BAQdAWSq76k+GsENjDTMVCy9Vr4fAO9Rb57/bPT1A
PnbnnRHNIkx1YmVuIFR1aWtvdiA8bHR1aWtvdjg5QGdtYWlsLmNvbT7CmQQTFgoA
QRYhBJkj7+VmFO9beaAl10wVR5QxozSvBQJlOiE6AhsDBQkJZgGABQsJCAcCAiIC
BhUKCQgLAgQWAgMBAh4HAheAAAoJEEwVR5QxozSvSm4BAOwCpX53DTQhE20FBGlT
MqKCOQyJqlMcIQ9SO1qPWX1iAQCv3vfyJwktF7REl1yt7IU2Sye1qmQMfJxdt9JM
bMNNBs44BGU6IToSCisGAQQBl1UBBQEBB0BT9wSPcCE8uGe7FWo8C+nTSyWPXKTx
9F0gpEnlqReRBwMBCAfCfgQYFgoAJhYhBJkj7+VmFO9beaAl10wVR5QxozSvBQJl
OiE6AhsMBQkJZgGAAAoJEEwVR5QxozSvSsYA/2LIFjbxQ2ikbU5S0pKoaMDzO9eG
z69uNhNWJcvIKJK6AQC9228Mqc1JeZMIyjYWr2HKYHi8S2q2/zHrSZwAWYYwDA=3D=3D
=3DqCaZ
-----END PGP PUBLIC KEY BLOCK-----

--------------aiAdaoPN5W8gHNYSkvHCD3VM--

--------------lDsnbz37qjLh8AAZsz0OX8aD--

--------------Ag1iPz8wDKzQj3npkMVsgJvf
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wnsEABYIACMWIQSZI+/lZhTvW3mgJddMFUeUMaM0rwUCZVLOOAUDAAAAAAAKCRBMFUeUMaM0rxlT
AQDYqVENncFQLkoIbYcqzcZcH1iZ+GrTbEhVhHu1+zUOdwEA0/VOJ+AIKj/1t82GYpzUgk6uhtGh
4Yo3BWnlJ2jC5Q4=
=5Tam
-----END PGP SIGNATURE-----

--------------Ag1iPz8wDKzQj3npkMVsgJvf--
