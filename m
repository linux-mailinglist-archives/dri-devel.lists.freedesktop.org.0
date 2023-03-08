Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 74B316B030F
	for <lists+dri-devel@lfdr.de>; Wed,  8 Mar 2023 10:38:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A96CC10E619;
	Wed,  8 Mar 2023 09:38:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x243.google.com (mail-lj1-x243.google.com
 [IPv6:2a00:1450:4864:20::243])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B654A10E608;
 Wed,  8 Mar 2023 09:38:53 +0000 (UTC)
Received: by mail-lj1-x243.google.com with SMTP id y14so15949708ljq.4;
 Wed, 08 Mar 2023 01:38:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1678268332;
 h=mime-version:references:in-reply-to:message-id:subject:cc:to:from
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=MlaPxfe8sYofmBwNyTWUDfenNrHhQfhqwLCiI7+KPBo=;
 b=ja29tVShlvdNj0YZlXDFIw2lkmbdfQRNR8rlz1b4eAjmLr1zC5SxhPzfwDHoVll44r
 I+eNHDU4345xeKy1fljpCKrwFO3bmhvYc9NFDW+8VLMRyx0qf+CZ2FqzggSEFsB3xmTv
 +hZMO9iJ390f2b8uvWdortDaZQ7Oxtgzxm7vJhFPgsOmzQcCIQKrzB8KXQoNmQoUXRdA
 c+rFFfsO2IVDqFjJw662BcQaUjwO0dKgoh/A0y6t7cISVioFrrNfQfJlx88UEp8wnnZF
 leQ930CexR9fTTz7r43WvzoVKd2BeBZHVNyEhVQj5FGuH5DHNFMh4ANk38oUNIRl9b6Y
 /2+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678268332;
 h=mime-version:references:in-reply-to:message-id:subject:cc:to:from
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=MlaPxfe8sYofmBwNyTWUDfenNrHhQfhqwLCiI7+KPBo=;
 b=K0QVhyekQgBdxMe1lWPE5DdAAxaZdvQKtP1BgUG29Y513yqZHX1SEL3Fpg3CeBGCWc
 j9u9KGJHYNIKvJAJ3J2ujHXZGxjB99ww0moAAuoxvkYap+oRlX7U1bJ/OUZZyL+qphuP
 dPPixhrvhERu8k9R8H9eEneVXSovxnI0wCraWZvFy6pl6IfkXoEKcnGEnoq5YQNWASd8
 6am0hLZKkzXhER8fQlR6urWw1GhElYeFAPJcRWJI1Zz+oxtzd9/T3uW5TiIAd1ZKdOD5
 lKXDd0GyHQ+Oiq5f+ZJajkhI1bmMhXXGwUbjbFv3bUv5IGp+hXvjZpWNrjMmkLmxlnkW
 F8Hg==
X-Gm-Message-State: AO0yUKXBYf7R4yGgufftd7HM2CmKYSGbe97NE1wo88yY+3rdD849ALvd
 RO80CT1Pq05T52WPCZsX3Xc=
X-Google-Smtp-Source: AK7set/N6bO5cJN92Z0s4pM7jH8hCFnBNfZ6/bw/xBBLhzysO/TftXZfKclbFrS9LqgPiL+CTwdQbA==
X-Received: by 2002:a2e:8250:0:b0:295:a3aa:e7c2 with SMTP id
 j16-20020a2e8250000000b00295a3aae7c2mr5116114ljh.36.1678268331815; 
 Wed, 08 Mar 2023 01:38:51 -0800 (PST)
Received: from eldfell ([194.136.85.206]) by smtp.gmail.com with ESMTPSA id
 v17-20020a2e9911000000b00298704f1324sm129870lji.33.2023.03.08.01.38.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Mar 2023 01:38:51 -0800 (PST)
Date: Wed, 8 Mar 2023 11:38:48 +0200
From: Pekka Paalanen <ppaalanen@gmail.com>
To: Harry Wentland <harry.wentland@amd.com>
Subject: Re: [PATCH v3 00/17] Enable Colorspace connector property in amdgpu
Message-ID: <20230308113848.1289d5a0@eldfell>
In-Reply-To: <20230307151107.49649-1-harry.wentland@amd.com>
References: <20230307151107.49649-1-harry.wentland@amd.com>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/3_IMJto9qDiIGLj4UTwmx4O";
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
Cc: Sebastian Wick <sebastian.wick@redhat.com>,
 Michel =?UTF-8?B?RMOkbnplcg==?= <michel.daenzer@mailbox.org>,
 dri-devel@lists.freedesktop.org, Uma Shankar <uma.shankar@intel.com>,
 amd-gfx@lists.freedesktop.org, Joshua Ashton <joshua@froggi.es>,
 Vitaly.Prosyak@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--Sig_/3_IMJto9qDiIGLj4UTwmx4O
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Tue, 7 Mar 2023 10:10:50 -0500
Harry Wentland <harry.wentland@amd.com> wrote:

> This patchset is based on Joshua's previous patchset [1], as well
> as my previous patchset [2].
>=20
> It is
> - enabling support for the colorspace property in amdgpu, as well as
> - allowing drivers to specify the supported set of colorspaces, and
> - deprecating the BT2020_YCC and BT2020_RGB properties in favor of
>   a common BT2020 property. We leave the BT2020_CYCC property untouched
>   for now, same as the other _YVV properties. If they'll see use later
>   we might need to do something similar there, or allow userspace to
>   decide on the output encoding (RGB vs YUV).
>=20
> Colorspace, Infoframes, and YCbCr matrix
> ---------------------------------------
>=20
> Even though the initial intent of the colorspace property was to set the
> colorspace field in the respective HDMI AVI and DP SDP infoframes that
> is not sufficient in all scenarios. For DP the colorspace information
> also affects the MSA (main stream attribute) packet. For YUV output the
> colorspace affects the RGB-to-YCbCr conversion matrix. The colorspace
> field of the infopackets also depends on the encoding used, which is
> something that is decided by the driver and not known to userspace.
>=20
> For these reasons a driver will need to be able to select the supported
> colorspaces at property creation.
>=20
> Note: There seems to be an understanding that the colorspace property
> should ONLY modify the infoframe. While this is current behavior and
> sufficient in some cases it is nowhere specified that this should be the
> only use of this property. As outlined above this limitation is not
> going to work in all cases.
>=20
> This patchset does not affect current behavior for the drivers that
> implement this property: i915 and vc4.
>=20
> In the future we might want to give userspace control over the encoding
> format on the wire, in particular to avoid use of YUV420 when image
> fidelity is important. This work would likely go hand in hand with a
> min_bpc property and wouldn't conflict with the work done in this
> patchset.
>=20
> Colorspace on crtc or connector?
> --------------------------------
>=20
> There have been suggestions of programming 'colorspace' on the drm_crtc
> but I don't think the crtc is the right place for this property. The
> drm_plane and drm_crtc will be used to offload color processing that
> would normally be done via the GFX or other pipelines. The drm_connector
> controls the signalling with the display and ensures the wire format is
> appropriate for the encoding by programming the RGB-to-YCbCr matrix.
>=20
> [1] https://patchwork.freedesktop.org/series/113632/
> [2] https://patchwork.freedesktop.org/series/111865/

Hi Harry,

this is a really good cover letter.

I've given all the comments I have on this iteration.


Thanks,
pq

--Sig_/3_IMJto9qDiIGLj4UTwmx4O
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAmQIV6gACgkQI1/ltBGq
qqd1lA//cNJMNq0/O82pHPI2fZVxRmMlGCJMr5Y0Zf/37UcSNglZ1X9A4dEXqxkX
Z76kBiJXT18M+AYicKsqz1W8Gzc2fwyKnBIiH6nj4vLVOQI6oH8lPDJfn0q7bXAq
rJN1k+PT5G1fSefXL6b8fND9BptxU7ilFkX/XBr1TjSadjOMx0gMi5X/KDROhLe7
LIZ4LFxf5VUWkMIOBQmqS0clvR5r80z+uF76GEAncfPmcd3nc6x3y8HxQHOp4tDE
cV6kSwDzxeTqLYvwQKpt57rWOs0IRaTxZctBQQd9R5eQVpeGAgx4zu8onoO6AK0C
y/X6Z0tIMRu4NT53u3iGVBzPFnVZjUa6udoGCsSwFhHq477S6LQtBJjFaPsclxBE
we6Ouh6rtajf3TwGiuVd+DMPXGcXsvoxt3hBPsEbVQvzLT0L1EzLHZ4izy5vf2lb
B1TGpTnVirXAxhJ6gJLQwXvdkA1AkaJIUUwlQGPWUYcQCMU66ESGRaVO1Pq4BTRm
C3XWjn+JZdNEtxW/HXL92i9BDMBQ1UbJPCZwNpmAQ41sjiWoVPC+LvJMIKLvYyMz
7sOuu6cx+1Rne7juADJVB0pDDx3S9fDe4Kxk2Ei/uIMvHqPrjl14dr3Db1KIRGNm
xM97xAZXe2Xoi/t4BStorrDumLidMxr4/KZSSkLV1Q0wrHq8eCk=
=ZGgn
-----END PGP SIGNATURE-----

--Sig_/3_IMJto9qDiIGLj4UTwmx4O--
