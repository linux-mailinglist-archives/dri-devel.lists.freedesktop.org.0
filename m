Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E500E690469
	for <lists+dri-devel@lfdr.de>; Thu,  9 Feb 2023 11:05:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C3B4510E98C;
	Thu,  9 Feb 2023 10:05:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com
 [IPv6:2a00:1450:4864:20::52d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 83F0910E989;
 Thu,  9 Feb 2023 10:05:45 +0000 (UTC)
Received: by mail-ed1-x52d.google.com with SMTP id h3so1665344eda.5;
 Thu, 09 Feb 2023 02:05:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:message-id:subject:cc:to:from
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=jDgXNaZlN6rKRsP9h/Pe4waqS4oiSpKx6hiiOwUHR+M=;
 b=dCQe5dwdkaedo2Mneb2fNKTg6nuUlcVweDWEHKBOBaBs2zlR9vp2sFBB6jKZuUQrFD
 fSLLv5GX+ehb29WkzVBHzOoJPfGFBA4Hl4OPSmttfuICiKUzExytplNLc7lTCKJCWkkE
 eXL7a/ZEC6dwtXEvwqPdsd73uz4bnxSUi1upE3ieWJXT05svaLrL7N1M7CDpTDvqHfCz
 Lmu5JEreya1l/AIxgxAjbwh7MkHRSPezKdKJstAgIvjKKArrEtrghLm8YbMouszDQ3nX
 e9/kHGosyDsSXBsyjOPGaEl7wJ2LxMJNhoV4usL35d5mM7vCBHVImn+oxZFznnKuUgjY
 bEiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=mime-version:references:in-reply-to:message-id:subject:cc:to:from
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=jDgXNaZlN6rKRsP9h/Pe4waqS4oiSpKx6hiiOwUHR+M=;
 b=nUNKUUHJSGxJxbpXxUoMvu+fywYxpIft695myV3nEePaNCz5ulDZ3pH2DNCExiGInI
 pRSj2m0ezVtv5hwXM5Y72d9Gl81yyCB+nAv3cOdXUlJJLPWhNoUaceR2OBTnMpHGMTH3
 2JkHzD8i0FswNOLEe4UUi4NSod59mFG4J6+e1R0iXKzqsRFnJ4KTpTe56VcATvoaLVSh
 eM/dGybmhYUxUNVJl2kTpBJGZpGGmQLf6q4OxVWYmtQVDxqnU+AoNhASs6qcNM9Rvtmz
 Z2v8cwEp8OANzcZY1qREyFZRak6uC8tKiYeauV2FjPpmH7PN6G829FvLJ07zYX28sZ2T
 zhtQ==
X-Gm-Message-State: AO0yUKW5F7aDpC8krwSu6mwGwCQTGEvgOfWcR0bgOJY3PeqHxACYWHYd
 ZMS3NX9MVqm1PByVhinAbqo=
X-Google-Smtp-Source: AK7set98VZTPDTMoef9e0posD0C5nPkiNDfjdL8Xd2oShFyeqZZ1RSN+meqw9DuQTSnuL0vZNpDNcA==
X-Received: by 2002:a50:f61b:0:b0:4a0:e237:2cef with SMTP id
 c27-20020a50f61b000000b004a0e2372cefmr11669212edn.4.1675937143918; 
 Thu, 09 Feb 2023 02:05:43 -0800 (PST)
Received: from eldfell ([194.136.85.206]) by smtp.gmail.com with ESMTPSA id
 c90-20020a509fe3000000b004ab16843035sm528115edf.80.2023.02.09.02.05.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Feb 2023 02:05:43 -0800 (PST)
Date: Thu, 9 Feb 2023 12:05:39 +0200
From: Pekka Paalanen <ppaalanen@gmail.com>
To: Ville =?UTF-8?B?U3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
Subject: Re: [PATCH 3/3] drm/connector: Deprecate split for BT.2020 in
 drm_colorspace enum
Message-ID: <20230209120539.088e499b@eldfell>
In-Reply-To: <Y+O2e8ZOp2EjAJI/@intel.com>
References: <20230203020744.30745-1-joshua@froggi.es>
 <20230203020744.30745-3-joshua@froggi.es>
 <Y9zkef5FjtZ7guVS@intel.com>
 <CA+hFU4ymiOg06MQeKLcn5MSrR=BZnOLODdZCFvGUdWqt_ha61A@mail.gmail.com>
 <Y90NkvVabh+ue9hF@intel.com>
 <CA+hFU4xR_8=w=z=Jqs3sujTvnXfEQJVHAMFW-X4-55POF=Bu9g@mail.gmail.com>
 <Y90UC43KouMRh8I2@intel.com> <20230208111842.4d7aacb2@eldfell>
 <Y+O2e8ZOp2EjAJI/@intel.com>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/xUr0Ay9+cRrmFLns1zr.v7Z";
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
Cc: Sebastian Wick <sebastian.wick@redhat.com>, amd-gfx@lists.freedesktop.org,
 Uma Shankar <uma.shankar@intel.com>, dri-devel@lists.freedesktop.org,
 Joshua Ashton <joshua@froggi.es>, Vitaly.Prosyak@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--Sig_/xUr0Ay9+cRrmFLns1zr.v7Z
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Wed, 8 Feb 2023 16:49:31 +0200
Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com> wrote:

> On Wed, Feb 08, 2023 at 11:18:42AM +0200, Pekka Paalanen wrote:
> > On Fri, 3 Feb 2023 16:02:51 +0200
> > Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com> wrote:
> >  =20
> > > On Fri, Feb 03, 2023 at 02:52:50PM +0100, Sebastian Wick wrote: =20
> > > > On Fri, Feb 3, 2023 at 2:35 PM Ville Syrj=C3=A4l=C3=A4
> > > > <ville.syrjala@linux.intel.com> wrote:   =20
> > > > >
> > > > > On Fri, Feb 03, 2023 at 01:59:07PM +0100, Sebastian Wick wrote:  =
 =20
> > > > > > On Fri, Feb 3, 2023 at 11:40 AM Ville Syrj=C3=A4l=C3=A4
> > > > > > <ville.syrjala@linux.intel.com> wrote:   =20
> > > > > > >
> > > > > > > On Fri, Feb 03, 2023 at 02:07:44AM +0000, Joshua Ashton wrote=
:   =20
> > > > > > > > Userspace has no way of controlling or knowing the pixel en=
coding
> > > > > > > > currently, so there is no way for it to ever get the right =
values here.   =20
> > > > > > >
> > > > > > > That applies to a lot of the other values as well (they are
> > > > > > > explicitly RGB or YCC). The idea was that this property sets =
the
> > > > > > > infoframe/MSA/SDP value exactly, and other properties should =
be
> > > > > > > added to for use userspace to control the pixel encoding/colo=
rspace
> > > > > > > conversion(if desired, or userspace just makes sure to
> > > > > > > directly feed in correct kind of data).   =20
> > > > > >
> > > > > > I'm all for getting userspace control over pixel encoding but e=
ven
> > > > > > then the kernel always knows which pixel encoding is selected a=
nd
> > > > > > which InfoFrame has to be sent. Is there a reason why userspace=
 would
> > > > > > want to control the variant explicitly to the wrong value?   =20
> > > > >
> > > > > What do you mean wrong value? Userspace sets it based on what
> > > > > kind of data it has generated (or asked the display hardware
> > > > > to generate if/when we get explicit control over that part).   =20
> > > >=20
> > > > Wrong in the sense of sending the YCC variant when the pixel encodi=
ng
> > > > is RGB for example.
> > > >=20
> > > > Maybe I'm missing something here but my assumption is that the kern=
el
> > > > always has to know the pixel encoding anyway. The color pipeline al=
so
> > > > assumes that the pixel values are RGB. User space might be able to
> > > > generate YCC content but for subsampling etc the pixel encoding sti=
ll
> > > > has to be explicitly set.   =20
> > >=20
> > > The kernel doesn't really know much atm. In theory you can just
> > > configure the thing to do a straight passthough and put anything you
> > > want into your pixels. =20
> >=20
> > But it's impossible to use a YCbCr framebuffer and have that *not*
> > converted to RGB for the KMS color pipeline even if userspace wanted it
> > to be strictly pass-through, only to be converted again to YCbCr for
> > the cable, is it not?
> >=20
> > Even more so with 4:2:0.
> >=20
> > How could it be possible to stop the driver from doing those two
> > YUV-to-RGB and RGB-to-YCbCr conversions at the beginning and at the end
> > of the KMS color pipeline? =20
>=20
> You can stop the conversion at the start of the pipeline by
> using a "RGB" framebuffer. At the end of the pipe it's not
> possible with the current props.

But there is no such thing as a 4:2:0 sub-sampled RGB framebuffer to be
abused for YUV content. It would be possible for some kind of xYUV
4:4:4 content though, but then the pipeline wouldn't work.

Joshua had the excellent point that disabling the conversion at the end
of the pipeline is not possible for a non-RGB output signal, period.
The KMS color pipeline is defined in terms of RGB channels, that's the
only(?) way alpha-blending could work, and the LUT-like elements cannot
handle negative values.

On one hand I very much agree that the definition of "Broadcast RGB"
property was a mistake by combining pixel operations with infoframe
settings. OTOH, since the pipeline end conversion is today chosen by
the driver, then the KMS color pipeline output must be known to the
driver so that the driver can pick the right conversion. That's what
"Broadcast RGB" did: it assumed the pipeline produces full range
values, so that it is able to insert the right conversion and the right
infoframe data. It rules out possible use cases, but the infoframe
matches.

As for the pipe-end RGB-to-YCbCr conversion, the situation is partly
similar. There is the assumption that the pipeline produces RGB model
values. However, this assumption is likely never going to change,
because the pipeline is inherently RGB, always.

A better question is, does it need other assumptions as well?

Quantization range?

RGB (electrical encoding) transfer function?

Most RGB-to-YCbCr conversions are just a matrix applied to the
electrical RGB values, but not all. Particularly the constant luminance
encoding requires optical, not electrical, RGB values, and it also
needs the transfer function since it emits electrical values. I haven't
looked if e.g. BT.2100 has more cases making the RGB-to-something
conversion complex.

Even having a doubt about that really does point towards userspace
needing to configure the pipe-end conversion by mathematical formula,
not by video standard colorspace. A consequence of that is that the
infoframe settings need to be an independent property separate from the
end-conversion property.

If so, it is not even possible for a driver to automatically set the
pipe-end conversion without telling it a lot more about what the KMS
color pipeline RGB output is.

I have been advocating that we should not tell the kernel about color
spaces, and instead we need to program the mathematical operations in
the color pipeline. Following that reasoning, we cannot make it
possible for drivers to choose the pipe-end conversion automatically.

Hmm...



Thanks,
pq

--Sig_/xUr0Ay9+cRrmFLns1zr.v7Z
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAmPkxXMACgkQI1/ltBGq
qqef9BAAnjAUk6oDC7TftABxFqjf1m+RpsBO4fp+DcrmQok5XVyb2VdKo7IlfPmb
bpGE6WlF4BBHvkWjTYHCIWrmWAs2PxqsqT2ii8QFwPvkEE2tu0uEqdh4PW0cYXuR
gJnTxWcst0HlkHxOugSGuUlUx7LlW26Jp8rMRyVOlz9J+rKiZYJI3pHECB6vU4Sx
9OwqJ3bv8MAhJ+My4VaN6wOT0zMYjzMJDbGvnwx2m+/JHxmhTGQs+8c61TG8ictR
2yZIiMdsNFkGSq1xcRWHGqI6L/RasF+WcQgPLLo+aDVm6mfUezrMgx4SEwXu/fbq
618e4EGHq94JiN0eGINEEosN56nY99ih0Hcq4/tfOB1/WNbCxTg1RG9DJTyQKwQl
jBQRrVKmthHeNsFDtoJUpPVBy+4Nwf/tmpRQP4s43Ku3KF4KEoo2v15mEh6xL0ee
YZQ3h74GrMuCl2l10bjl74vepc2R4ln6odNl4v8ZfD+dy+M8GYXW0bn9lAlNnRTm
hIsYNpbrrBWh89dnwgPOldI5iz7bmVZeZd+nsELLcAw+j6JJme0yd3gT7qW95rE2
72T8wVc9MbopjulTAmylc/m1cKnOceYrDLV2ImaelBR7ElUl/f7RpqjT52YuWWBq
93D3SGbcOy83n/P7ig2UWzjUiC68qG8PvKd06hELpeteDwpCYJ8=
=Bmg3
-----END PGP SIGNATURE-----

--Sig_/xUr0Ay9+cRrmFLns1zr.v7Z--
