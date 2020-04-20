Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D8821B093F
	for <lists+dri-devel@lfdr.de>; Mon, 20 Apr 2020 14:22:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A19446E1BD;
	Mon, 20 Apr 2020 12:22:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com
 [IPv6:2a00:1450:4864:20::12b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 494EF6E1BD
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Apr 2020 12:22:41 +0000 (UTC)
Received: by mail-lf1-x12b.google.com with SMTP id x23so7747333lfq.1
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Apr 2020 05:22:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:in-reply-to:references
 :mime-version; bh=ywahJUlPIvAuvMNQ5b8O/KtZrJ5+36G7/0LF8ECxV2A=;
 b=bdEPODPHNsRB7Nwhun/ySM5X7AB04ckp86EYYZ1Wpdv9sz4aw7/0vxOzyDKnr7CWdf
 KUaJ0bJzwjWGSyt7pN9spxeb385shkihunf1ym1SNxiQDjR+/vZDPHC2ALJOGO6qlb1p
 lAIX1Uid432XGBvgZjdbnfJeWMOK2yMjNtnIU0Z2r29alG68vWmQvoe0z2+siQ8VT93H
 dTMTkiamiD6VQLbtc8kOQ/fNcv7EKnYEPhGjRUwUPyFxLeSxARC2WSnhyqrhSJTYQfdW
 4JlPXCxEIdCUKhs44IFy/aVxqHCWh8ox8DDN+TN51LjDXAhCmFI0xNGiv9ng53w8LPtw
 qfqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version;
 bh=ywahJUlPIvAuvMNQ5b8O/KtZrJ5+36G7/0LF8ECxV2A=;
 b=l1KZ5BLv83hujDTkclcb2Q01cPXmLsRNBVr+QYXIquimI/WpmlrJ072UrD3Xmm43/w
 IukSw5TI951OzvhqfWEFq9+hf4eE3CPbjtVRZW9KjlrHK03+6ael0UlLEl3E5lYX+bk1
 QkSB9eDaV+9Iylef5w+eTbkM1GzILSqU4J3teL94gDa+kI6tDIC+kwVqgyCwGTS+JGB+
 yx8PpMaaIUas+YhvBvaOQ216Qup5kwmji4eKVpTwrYVu/eHKlLXj8vXP1pksaMXZLT2e
 DB5uz2nwjNVlnkSE5f1/Y4dP6eXERlgJh6bhKoMjd5Tnv8ujVvOcA8xZ3OBl3SEtGF42
 jkLw==
X-Gm-Message-State: AGi0Puakv6TDdDbZmk0yu6EDGReARoS+ORtFTFC2GHwCr7nj7yLN7gFH
 9goRdD+jYLrFxq65ahcMfu0=
X-Google-Smtp-Source: APiQypLvvCo8A4Ud5n7ImYu+E9h45Xpi3sEVhRXWYGrLym5k7DeWzh5kwLfxcKA7ZwA9iPvuLZQwSQ==
X-Received: by 2002:ac2:4c89:: with SMTP id d9mr10567791lfl.165.1587385359618; 
 Mon, 20 Apr 2020 05:22:39 -0700 (PDT)
Received: from eldfell.localdomain ([194.136.85.206])
 by smtp.gmail.com with ESMTPSA id l12sm724966lfp.35.2020.04.20.05.22.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Apr 2020 05:22:39 -0700 (PDT)
Date: Mon, 20 Apr 2020 15:22:35 +0300
From: Pekka Paalanen <ppaalanen@gmail.com>
To: Simon Ser <contact@emersion.fr>
Subject: Re: Operating KMS UAPI (Re: RFC: Drm-connector properties managed
 by another driver / privacy screen support)
Message-ID: <20200420152235.3473851f@eldfell.localdomain>
In-Reply-To: <eT7Xq1DV3kIBOemufORRm39_VF3D9VD08jWCOHvl2IcqmNXqpgtgDGtPcpT_CnQjhIzqth_VdU_A8U1dCFj02JzayLcYCdUlz_5Y-i2tNXk=@emersion.fr>
References: <783240e9-e8d1-fc28-6c11-14c8f8e35cfa@redhat.com>
 <87tv1k4vl6.fsf@intel.com>
 <d47ba6ef-efd0-9f28-1ae4-b971b95a8f8b@redhat.com>
 <20200417120226.0cd6bc21@eldfell.localdomain>
 <CAKMK7uEv_khNFC=JUyuQgDZp1p5eudDCrH0we+UdEdTV3H=Tsg@mail.gmail.com>
 <20200420112704.68d02472@eldfell.localdomain>
 <eT7Xq1DV3kIBOemufORRm39_VF3D9VD08jWCOHvl2IcqmNXqpgtgDGtPcpT_CnQjhIzqth_VdU_A8U1dCFj02JzayLcYCdUlz_5Y-i2tNXk=@emersion.fr>
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
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
Cc: Benjamin Berg <bberg@redhat.com>, David Airlie <airlied@linux.ie>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Christian Kellner <ckellner@redhat.com>,
 Javier Martinez Canillas <javierm@redhat.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Hans de Goede <hdegoede@redhat.com>, Mark Pearson <mpearson@lenovo.com>,
 Rajat Jain <rajatja@google.com>, Nitin Joshi1 <njoshi1@lenovo.com>
Content-Type: multipart/mixed; boundary="===============1238478564=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============1238478564==
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/G7=48=5iszT/sBsfntkB+mH"; protocol="application/pgp-signature"

--Sig_/G7=48=5iszT/sBsfntkB+mH
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Mon, 20 Apr 2020 10:15:39 +0000
Simon Ser <contact@emersion.fr> wrote:

> On Monday, April 20, 2020 10:27 AM, Pekka Paalanen <ppaalanen@gmail.com> =
wrote:
>=20
> > The only "random" KMS state is the properties the userspace KMS
> > program does not know that are set on start-up. I have been assuming
> > that as long as you had fbdev active before the KMS program started,
> > the unknown properties have "harmless" default values. And maybe even at
> > driver device init if fbdev does not exist? =20

I meant fbcon, not fbdev above.

> Note, this is not the case when using e.g. a display manager. In the
> past there have been cases of a display manager setting a hw cursor
> and launching a compositor not supporting hw cursors. This results in
> a stuck hw cursor.

Indeed. So the display manager might get sensible defaults, but the
session compositor might not. Or maybe boot splash uses KMS already, so
even display manager doesn't get all-defaults state.

It seems we really do need "sane defaults" from the kernel explicitly.
Writing a userspace tool to save it at boot time before any KMS program
runs would be awkward.

> > Btw. I searched for all occurrences of link_status in
> > https://dri.freedesktop.org/docs/drm/gpu/drm-kms.html and it seems it
> > only has two possible values, good and bad, and no mention whether it
> > is writable. Looks like it's writable. There does not seem to be a) an
> > explanation how exactly it needs to the handled (writing it does
> > something? what can you write?) or b) any way discern between kernel
> > and userspace set values like HDCP "Content Protection" has. =20
>=20
> User-space needs to reset the value to GOOD when recovering from a BAD
> value.

What if userspace writes BAD?

BAD cannot be default state, so getting default state from somewhere
would solve this property's restoring as well. Reading back the true
current value could accidentally return BAD.


Just to reiterate for everyone, the important thing here is to figure
out how userspace is supposed to reset unknown properties to sensible
defaults. Once we know how that should work, we can review whether new
properties support or break that.


Thanks,
pq

--Sig_/G7=48=5iszT/sBsfntkB+mH
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAl6dlAsACgkQI1/ltBGq
qqeegA/+MH07hUeCM7TqwBBDpmym3CSKKtFF5BpXRgJTUIznzeG6KujF+z0YTaMq
dreVkXYW/LwZXsfAhHkCw5muPzQ9EJNb378Z3NZi0l2y2eQEqLo2laec9wLeo22e
iqJpRlzTGQApDJTJmMNBpppdL0RD3bFMIwGxomAGdmxcOn/S1lSu117WvWmUIu++
fkzXJKXDFzrHHC8JyPaHU2hURBkTZPBnD2gkbTOCCat1o9eaROUY2RkScMkhHrpc
HO7eBVH887qWJ886zPlO1OwMHzLWuK6fOJ4OB8+MKRwLYnfac1MLHnInAsvDsCqW
ags2nl4mNv1jfZGs7L19h5dDvNdrJ4mejl/CawHEZ9zhWMtDZ8BT5WAuzCcxptug
zD/zr1eXW/y5Yq8tUeBUvvNgBtY3y3Gs7so5rrXZf+TZrqhc8j1qLsBAWaYj1+9s
pYQNNFOjAolYU/xTX+MqL1C1d/k57LMIGqT0MlfGiAfrzRyExLXvbf11YoJ1oq83
gefSjhxcFfz5V2fDgJ9HFiSpuWHZaGEQ2/bBD9+/BBBzgfMjhOm7YZ2yKx2hUwbP
76tAXY223f2JMJub7vD0gwd0LYM40ZQWFhy9srqeySHqQH0Yyq7JbapcZeGapoau
l8VGG9qPfGO0v5gaGZvOsNLSyLmJj5VvnEnw1ALjE6V8y3nraak=
=lvX4
-----END PGP SIGNATURE-----

--Sig_/G7=48=5iszT/sBsfntkB+mH--

--===============1238478564==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1238478564==--
