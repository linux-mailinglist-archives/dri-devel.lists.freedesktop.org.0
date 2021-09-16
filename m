Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E95440D60A
	for <lists+dri-devel@lfdr.de>; Thu, 16 Sep 2021 11:24:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 61DDA6EB24;
	Thu, 16 Sep 2021 09:24:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com
 [IPv6:2a00:1450:4864:20::12a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3A4586EB24;
 Thu, 16 Sep 2021 09:24:18 +0000 (UTC)
Received: by mail-lf1-x12a.google.com with SMTP id i7so15760154lfr.13;
 Thu, 16 Sep 2021 02:24:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:message-id:in-reply-to:references
 :mime-version; bh=quKEGUskroMnOu7oGIk1sVTPT2DFxBdoMb1glSkwvKk=;
 b=DdQLuXNLstvEe8u7lBnJSUCrEFrVhP9ZTkNPdZXzkB0z8bZMJYjYTuvm6JuTF5aTJg
 y96QGvmOh47F16/RLbTdE9xp1iFKGIGi2zY1hnBO2vfpTXII8KqilUWFxUzkw4GOfIVl
 H9RwsIO8VP0+XaOFcK159kZqic9/RSwctibopJ0qSdxvR2nCdnYl5CettDYCGaQZ10XX
 44oPPG2/eI3r+72VPDQ8mMuMjC9i87fKbfRDB3fx1+4+aiN+vZzyNZpvj4KDWuEr25ek
 j7zswXTbnFaKnQq1MXjxJWlJ7XCJTe3iio0G5JPwz99UIfdJZ6t6UHtpK/K0M/2m32vh
 0oxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version;
 bh=quKEGUskroMnOu7oGIk1sVTPT2DFxBdoMb1glSkwvKk=;
 b=xnab7MR5+HXyVdUMu1LIT9kTdJ810ay5s+ohi4AJBu1te+O4peXZzav2uT8Nuo11kz
 WqfjfRgE1uLyodNhuri9f+4kZttlgPz6ICcz4djqfHTSmRCz9l+ejTGKCrab+tPLIwCz
 /9LrtE1RfR8ogGNl0HfpO6wW5T6UfP/uUaJE/5H5hqZp+snItYoCcv5/iLwguftFiqkd
 sGSLU6yvSZAWfPDIIhut5qUmmCtZzHB1HcPM5ASsgEFM5ejH5GX85ikOnnzG+xYW20n8
 Ii2lDRjBR4flRu+sjnynMyTvbM1msIG5Osawbhwyesl4ATFPZat/m564jKz0+p/VKN3D
 dJWw==
X-Gm-Message-State: AOAM532n0lDb9dbKqVFN24EOAeRwAafxJwTr2qgSDVSgtVcrGK0hWU9u
 Okyq+N5LPKa9DY4jVxQDofE=
X-Google-Smtp-Source: ABdhPJx7oiGjzyPB9hDEeGi4byj39x2w7a3HRBMjJSsUr6nbOhQ1AtS2VDobNE3lWLsxKi/MttEx6Q==
X-Received: by 2002:a05:6512:39d6:: with SMTP id
 k22mr3452313lfu.258.1631784256272; 
 Thu, 16 Sep 2021 02:24:16 -0700 (PDT)
Received: from eldfell ([194.136.85.206])
 by smtp.gmail.com with ESMTPSA id l11sm209652lfg.39.2021.09.16.02.24.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Sep 2021 02:24:15 -0700 (PDT)
Date: Thu, 16 Sep 2021 12:24:06 +0300
From: Pekka Paalanen <ppaalanen@gmail.com>
To: Werner Sembach <wse@tuxedocomputers.com>
Cc: "Deucher, Alexander" <alexander.deucher@amd.com>, amd-gfx list
 <amd-gfx@lists.freedesktop.org>, Ville =?UTF-8?B?U3lyasOkbMOk?=
 <ville.syrjala@linux.intel.com>, Intel Graphics Development
 <intel-gfx@lists.freedesktop.org>, Maling list - DRI developers
 <dri-devel@lists.freedesktop.org>, LKML <linux-kernel@vger.kernel.org>,
 sebastian@sebastianwick.net
Subject: Re: New uAPI for color management proposal and feedback request v2
Message-ID: <20210916122406.7c132525@eldfell>
In-Reply-To: <e452775c-5b95-bbfd-e818-f1480f556336@tuxedocomputers.com>
References: <e452775c-5b95-bbfd-e818-f1480f556336@tuxedocomputers.com>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/m2oIbyLut0gDnAcjrS61zLj";
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--Sig_/m2oIbyLut0gDnAcjrS61zLj
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Tue, 3 Aug 2021 11:38:19 +0200
Werner Sembach <wse@tuxedocomputers.com> wrote:

> Greetings,
>=20
> Original proposal: https://www.mail-archive.com/amd-gfx@lists.freedesktop=
.org/msg62387.html
>=20
> Abstract: Add "preferred color format", "active color format", "active bp=
c", and "active Broadcast RGB" drm properties,
> to control color information send to the monitor.
>=20
> It seems that the "preferred-" properties is not what is actually the mos=
t useful for the userspace devs.
>=20
> Preferable (Note: with only a sample size of 2 people) would be a "force =
color format" property. If the color format is
> not available for the current Monitor and GPU combo. the TEST_ONLY check =
should fail and the property should not be setable.
>=20
> This however opens another problem: When a Monitor is disconnected and a =
new one is connected, the drm properties do not
> get resetted. So if the old monitor did allow to set for example ycbcr420=
, but the new monitor does not support this
> color format at all, it will stay permanently black until the drm propert=
y is set to a correct value by hand. This is
> not an expected behavior imho.
>=20
> So a discussion questions: Does it make sense that connector properties a=
re keep for different Monitors?
>=20
> If no: On connecting a new Monitor all atomic drm properties should be re=
set to a default value.
>=20
> I have an idea how this could be implemented (correct me if i'm wrong): W=
hen an atomic property is attached it get
> assigned an inital value. But if I understood the docu correctly, this va=
lue is ignored because atomic properties use
> the getter and setter methods when their values are read or written. My i=
mplementation suggestion would be to iterate
> over all attached atomic properties once a new monitor is connected and r=
eset them to this initial value, which should
> be unchanged since initialization? This assumes that besides the initial =
value being unused it's still a sane default
> for all drivers.
>=20
> Kind Regards,
>=20
> Werner Sembach
>=20

Hi Werner,

I just wanted to say that I appreciate the effort and something like
these are things I would likely want to use some day in Weston, but
currently I can't spend time on this since it's still so far in the
future for me. I also feel that I've said what I can without spending a
significant amount of time thinking how it should actually work.

The same goes with the thing pointed out by Sebastian, the KMS property
reset idea. Since I can't really work on it now, I'll stop shouting
about it and wait for problems to arise in the wild and see where that
leads. (Probably just patching the KMS client of the day to set a
couple more KMS properties.)


Thanks,
pq

--Sig_/m2oIbyLut0gDnAcjrS61zLj
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAmFDDTYACgkQI1/ltBGq
qqfxZg//bxjNceiMruwsAHhjW56idiGLy07lSyp5IItUXdTQHZer4dERd/jmd5ee
4ln2oszEfUjJDOc+MgtyuarG/5XwD6riUu353cvGAO+Ugd66yRxuDT4sGe2ZcZOs
hhkH6AT/qKJioQ3CWPLpXX5oK9i/wrzSx55TIZyPvhDkaGIpEwFbJ843evdmURGZ
vclCG0f4y5Uk976QUttDRl+llhPK8vWbMwNWzchNWroyTuaYeLU7fWM9jrycO3wo
44hNJatGdW+gqZBM98VaL5p7OAw0VMo9S/hDAOnXCXp79U+fUWWI5bArcjEsbhA/
vD4oCte3YfQ51l3Ihv3NLUkiMKmwrpQ9xiQp+pNqj2lAu/AzpsC1HAyLBEZaxA6U
YzvW55ONMvVgVy1TMPp4BatC+WP/XyFZrKzsG4gNzyDpc64Az9HmXRoeF241Obmr
/LxbJ7f9uihfLlwguwliyAaoMaZNzMYpKXE153KDbRCv0JwYNG5i0rU5Bywx+CNW
r/1eMvelNkxvKzbEtpY5Wl0vjvZllq8HE1dZ5/+EOUV35lnh/XEq9j0lr8d/BHsw
3DPqCwrNVxqvgvv4yutr4QeCFjbfs+hx98/KI4pX0imxbGCG/lPhK4i8a7P1LVK5
dd2zzBPmB4evvh7DTEiq1V7M5VQgJHmHUXdv+BoTEcCBOJN+K/E=
=Ldod
-----END PGP SIGNATURE-----

--Sig_/m2oIbyLut0gDnAcjrS61zLj--
