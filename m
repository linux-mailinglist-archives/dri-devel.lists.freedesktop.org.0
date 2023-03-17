Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 09B936BEA2D
	for <lists+dri-devel@lfdr.de>; Fri, 17 Mar 2023 14:36:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 265B710E384;
	Fri, 17 Mar 2023 13:36:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x242.google.com (mail-lj1-x242.google.com
 [IPv6:2a00:1450:4864:20::242])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D68BD10E122;
 Fri, 17 Mar 2023 13:36:06 +0000 (UTC)
Received: by mail-lj1-x242.google.com with SMTP id h9so5120665ljq.2;
 Fri, 17 Mar 2023 06:36:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1679060165;
 h=mime-version:references:in-reply-to:message-id:subject:cc:to:from
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=hgJBpEiXSjdYla5oEWymvQiF08d59BTe7SkLnnwf0TM=;
 b=ehqdv8WzX7zz2ZeeR5GCcOgjilqjQKMuFVfaEcRs4agZlwAcJUX8zRSAUbzIirhAoy
 zN6LxQ2sPLpesr55w2wPv7H5QTWgnaCHokMaAEwB4GFTQz8Gg++UnLIuUA4dp5mASS4M
 YiG4D3kbOMMBx7/X444FgQbao52jhP9ZHnolPC4Adx8JYpwVKxsKbLFykJUtVLrJBljH
 ZF61ahm+cJMWG2luMqCuk0SxbrJ/QGaFcLyW1t5FySjXBxB9hvsB2CaF0xtOIO3Nk3a3
 HOG4GkDD8c2N63UbhHlD6MF9Bl6kwJ1sZvxKxh7o2pj7GMY32+z69UD3Be3z0XHxMxEd
 chtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679060165;
 h=mime-version:references:in-reply-to:message-id:subject:cc:to:from
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=hgJBpEiXSjdYla5oEWymvQiF08d59BTe7SkLnnwf0TM=;
 b=aXpTRUKDTwcIxbt2IGOHJQJFvZKIOVZThoO+YwGwPW4lcM1aELQZRDCJXUbMmzfpW0
 4kS8ndRsQRkN0XT5oS3hpmInl7SY0L/bWl8eoM5Fs1B3HY5wUylvZU0Wke+tFJ6HcgXJ
 cxVLSXyv8lbvee0wkEvD1ws3LrOLIQ4dJS1jdD9347pp6LGD1HULnAlfHHeF4Kp/xEwB
 Yl8ts257nFFKKqjjI7BRPtZq1ZvA5PoamQVjXAiSEzXfEE12lFANOzBMOK7ed9Lg2FhP
 m7P2HSp0m739zTBSASKEZw8Bv8gpPjEzDFMUvgHlZnqj1kWj5bt/lr4H2XkW8oD32wRn
 7Ovw==
X-Gm-Message-State: AO0yUKVLezK/tfYcFTNguDCDEJA73QLbjn1/JfsUrk0ZBXZsz3/cgDrr
 2ZZVeLSc7Foe+mvf+riloPc=
X-Google-Smtp-Source: AK7set86tjMO/xlgaUzQy/ZGRAYHe+NXtpgstbJNz190yq/zva3I0j4tZ06raAm8zmgLbJf2LB4c6g==
X-Received: by 2002:a05:651c:b0a:b0:293:4ff4:c0ae with SMTP id
 b10-20020a05651c0b0a00b002934ff4c0aemr4437303ljr.16.1679060164715; 
 Fri, 17 Mar 2023 06:36:04 -0700 (PDT)
Received: from eldfell ([194.136.85.206]) by smtp.gmail.com with ESMTPSA id
 a23-20020a2e8317000000b0029588e503ebsm420339ljh.7.2023.03.17.06.36.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Mar 2023 06:36:04 -0700 (PDT)
Date: Fri, 17 Mar 2023 15:35:53 +0200
From: Pekka Paalanen <ppaalanen@gmail.com>
To: Ville =?UTF-8?B?U3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
Subject: Re: [PATCH v3 09/17] drm/amd/display: Register Colorspace property
 for DP and HDMI
Message-ID: <20230317153553.5b8eb460@eldfell>
In-Reply-To: <ZBRiIG+TEft19Kum@intel.com>
References: <20230307151107.49649-10-harry.wentland@amd.com>
 <CA+hFU4yiniJdxWOxDKnD7bTGw3QA8uSLyG5sbeiQ5oWqitTZcQ@mail.gmail.com>
 <ZBLmYzVcnBgU6uo5@intel.com> <20230316120701.523bcb37@eldfell>
 <ZBLz17f8YFmNEJlY@intel.com> <20230316133449.26b62760@eldfell>
 <ZBMNEdYWsyfVq46p@intel.com>
 <CA+hFU4zWvm3-SSjtF17zjRnshEDw27gkQDLGZRk2AbnWN8+1Vg@mail.gmail.com>
 <ZBOf0m6W3ZWPy7nc@intel.com> <20230317105335.45d6a629@eldfell>
 <ZBRiIG+TEft19Kum@intel.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.24; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/PixJmYjYZOCLhh_RYIYoy72";
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
 dri-devel@lists.freedesktop.org, Joshua Ashton <joshua@froggi.es>,
 Vitaly.Prosyak@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--Sig_/PixJmYjYZOCLhh_RYIYoy72
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Fri, 17 Mar 2023 14:50:40 +0200
Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com> wrote:

> On Fri, Mar 17, 2023 at 10:53:35AM +0200, Pekka Paalanen wrote:
> > On Fri, 17 Mar 2023 01:01:38 +0200
> > Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com> wrote:
> >  =20
> > > On Thu, Mar 16, 2023 at 10:13:54PM +0100, Sebastian Wick wrote: =20
> > > > On Thu, Mar 16, 2023 at 1:35=E2=80=AFPM Ville Syrj=C3=A4l=C3=A4
> > > > <ville.syrjala@linux.intel.com> wrote:   =20
> > > > >
> > > > > On Thu, Mar 16, 2023 at 01:34:49PM +0200, Pekka Paalanen wrote:  =
 =20
> > > > > > On Thu, 16 Mar 2023 12:47:51 +0200
> > > > > > Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com> wrote:
> > > > > >   =20
> > > > > > > On Thu, Mar 16, 2023 at 12:07:01PM +0200, Pekka Paalanen wrot=
e:   =20
> > > > > > > > On Thu, 16 Mar 2023 11:50:27 +0200
> > > > > > > > Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com> wro=
te:
> > > > > > > >   =20
> > > > > > > > > On Thu, Mar 16, 2023 at 01:37:24AM +0100, Sebastian Wick =
wrote:   =20
> > > > > > > > > > On Tue, Mar 7, 2023 at 4:12=E2=80=AFPM Harry Wentland <=
harry.wentland@amd.com> wrote:   =20
> > > > > > > > > > >
> > > > > > > > > > > We want compositors to be able to set the output
> > > > > > > > > > > colorspace on DP and HDMI outputs, based on the
> > > > > > > > > > > caps reported from the receiver via EDID.   =20
> > > > > > > > > >
> > > > > > > > > > About that... The documentation says that user space ha=
s to check the
> > > > > > > > > > EDID for what the sink actually supports. So whatever i=
s in
> > > > > > > > > > supported_colorspaces is just what the driver/hardware =
is able to set
> > > > > > > > > > but doesn't actually indicate that the sink supports it.
> > > > > > > > > >
> > > > > > > > > > So the only way to enable bt2020 is by checking if the =
sink supports
> > > > > > > > > > both RGB and YUV variants because both could be used by=
 the driver.
> > > > > > > > > > Not great at all. Something to remember for the new pro=
perty.   =20
> > > > > > > > >
> > > > > > > > > Hmm. I wonder if that's even legal... Looks like maybe it
> > > > > > > > > is since I can't immediately spot anything in CTA-861 to
> > > > > > > > > forbid it :/   =20
> > > > > > > >
> > > > > > > > Wouldn't the driver do the same EDID check before choosing =
whether it
> > > > > > > > uses RGB or YCbCr signalling?   =20
> > > > > > >
> > > > > > > I suppose it could. The modeset would then fail, which is per=
haps   =20
> > > > > >
> > > > > > Could? What are they missing?   =20
> > > > >
> > > > > The fact that the new property that also affects the rgb->ycbcr m=
atrix
> > > > > doesn't even exist?   =20
> > > >=20
> > > > I think the question was about the current Colorspace property. =20
> >=20
> > Yes.
> >=20
> > We need to be able to set ColourPrimaries infoframe field for the sink.
> > Only userspace knows what ColourPrimaries it uses, and the driver has
> > no need to care at all, other than tell the sink what we have.
> >=20
> > When a driver chooses to use YCbCr, it needs to use the
> > MatrixCoefficients the sink expects.
> >=20
> > If we send the infoframe to the sink telling the signal uses BT.2020
> > ColourPrimaries, does that same bit pattern also tell the sink we are
> > using the BT.2020 NCL MatrixCoefficients if the driver chooses YCbCr?
> >=20
> > Do drivers actually use BT.2020 NCL MatrixCoefficients in that case? =20
>=20
> No. I think I've repeated this same line a thousand times already:
> The current colorspace property *only* affects the infoframe/msa/sdp,
> nothing else.

That's the problem. I don't know what that means.

Does it mean that the sink expects BT.2020 NCL MatrixCoefficients to
have been used?

And the driver will never use BT.2020 NCL MatrixCoefficients in any
circumstances?

See the conflict? The sink will be decoding the signal incorrectly,
because we are encoding it with the wrong MatrixCoefficients if the
driver happens to silently choose YCbCr and userspace wants to send
BT2020 ColourPrimaries indicated in the infoframe.

>=20
> >=20
> > If they don't, then YCbCr BT.2020 has never worked, which is another
> > nail in the coffin for "Colorspace" property. =20
>=20
> That is the same nail we've been talking about all along I thought.
>=20
> > But it still means that
> > RGB BT.2020 may have worked correctly, and then drivers would regress
> > if they started picking YCbCr for any reason where they previously used
> > RGB. =20
>=20
> The policy has been to use RGB if at all possible. Only falling back
> to YCbCr 4:2:0 if absolutely necessary (eg. EDID says 4:2:0 must
> be used, or there's not enough bandwidth for 4:4:4, etc.). If the
> behaviour suddenly changes then it probably means the driver was
> doing something illegal before by using RGB 4:4:4.

Ok.

> > > > > >
> > > > > > I mean, drivers are already automatically choosing between RGB =
and YCbCr
> > > > > > signalling based on e.g. available bandwidth. Surely they alrea=
dy will
> > > > > > not attempt to send a signal format to a monitor that does not =
say it
> > > > > > supports that?   =20
> > > >=20
> > > > That's exactly what they do. The drivers don't check the EDID for t=
he
> > > > colorimetry the sink supports and the responsibility is punted off =
to
> > > > user space. =20
> >=20
> > I suspect there are two different things:
> >=20
> > - which of RGB, YCbCr 4:4:4, YCbCr 4:2:0 can the sink take
> > - the supported MatrixCoefficients for each of the YCbCr
> >=20
> > Surely drivers are already checking the former point? =20
>=20
> Yes.
>=20
> >=20
> > I'm not surprised if they are not checking the latter point, but they
> > do need to, because it is the driver making the choice between RGB and
> > some YCbCr. =20
>=20
> This point has been irrelevant since we always select BT.709
> and there is no optional feature bit in EDID to check for that.
> Presumaly it is mandatory for sinks to support both BT.601 and
> BT.709 whenever they support YCbCr in general.

Ok, so BT.601 and BT.709 MatrixCoefficients are cool. How do you tell
the sink which one you used, btw?

What about BT.2020 MatrixCoefficients?


Thanks,
pq

--Sig_/PixJmYjYZOCLhh_RYIYoy72
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAmQUbLkACgkQI1/ltBGq
qqedQA//ZYkWiRMo/Wx5gPUZKD77LKFJtxOmO58+9mw4X5dho3QhZOn47d3Ehfrf
SN5vDaBJoHR2U451N+iqrOet7FQ88jxUXFSICb7F72JkLC4y9gRbboeke6K19ySe
u07oRA+UNaFEPs9SCBQ/Kl6qQPUX0/RFhDrCnt7cq+rcQ5IMBlihqOLyx74gkweD
JtahLr6h7tzM1/r0nQ/hRsO3xeTnEpcu1ZVjskY003CmgMzgUMxNiuO/jAxpXT96
y7yF1xorO5MUFNRLkHwV7vh8zbwvEp9LUgkbwCP5GabnZH39SwtKzUF4cWQwGOhn
VNfr+4BxALgXGLJbcN4YfVqIYEbzcvIYcdYzp4cdtpQrSJkw/YCJzf6q4dw1AwUq
VsBDex4l8g1+bB/cc8zW/+431lsMQLHgNMlg7j5vLMdLVGMgwexm/9AKaFbMMigU
Y30Pgy5TVTmw64rReN7PSR2XIceE1XF0+gXpb4dAG05dl+MTGP/KX08PAoNcrF81
M+sQWw4aeTYkI1LNiNNx909CYI3IlGt7XDWSIQ+Drya9osUy3knWbskJooxfCT2T
8K/gd2Ox7kotz2nohmp8kWc2LAS+B41jHOIAxHNrgzm0SmjhffRYHk38aw2GoPdW
1M/ed0wvRhwi9nKR3t/lDyvrltfG+gzxg6PFK6jb67IhMO9MbVs=
=ZG4e
-----END PGP SIGNATURE-----

--Sig_/PixJmYjYZOCLhh_RYIYoy72--
