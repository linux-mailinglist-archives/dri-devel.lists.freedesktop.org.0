Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D1F736D35E
	for <lists+dri-devel@lfdr.de>; Wed, 28 Apr 2021 09:44:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A57B06EAB3;
	Wed, 28 Apr 2021 07:44:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com
 [IPv6:2a00:1450:4864:20::133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9C3046EAB3
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Apr 2021 07:44:18 +0000 (UTC)
Received: by mail-lf1-x133.google.com with SMTP id y4so57438378lfl.10
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Apr 2021 00:44:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:in-reply-to:references
 :mime-version; bh=thW82rDcTuGkAEYEUu/1zvwdP/zSQxEf4cpdPKEN9Fw=;
 b=GREod1Sa3NlLfFrsd1ubTt63nql3bYY6ucUgryjpEMAD/gSEYedsK5CC2ngH7EnbfI
 jVKuqXK2WenEqp8UdVGSlTCM1jodb+FT840hgrjoyXjDpAiKGyT7ZD3NVuZn2B8fC6kD
 jl50oEFwWWdVPx6tevTGkjQRSFX+MLNv6O/SfvFHbP8TiDPudnxAzX1W3Kn5I/SbbPbn
 wCD2M8nxWZDZ7w9FuAGvj77QNSGvgCQ5fpgH1ZC3CFFfKr+OWYrveZtcM8zb9BLrZb2/
 PsaygHGmiQ59PxLZCmg+IC+a1lwYB+EGVuryzJnuxSSyaQwP1HmmrEya11cxvwqwY8g0
 gkfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version;
 bh=thW82rDcTuGkAEYEUu/1zvwdP/zSQxEf4cpdPKEN9Fw=;
 b=NdJ+IupDsB673Lr3yFBSt9do4I3+sbhN4sLumwyUAmGVl5VMsTdKrkc8LhAUFJODtY
 oQvxlwPaTDWzdBpu8NrZTPWBja7mHrqZMjuNXNyHmUTbrT2R5jOb+niItuLDMODDnmG8
 NfvoDOyl1LdiSvvydWgCTH6DbLwAz4nUfwMCgityJTRADwGb4L/lcJuEC2JswWWovqHI
 SY7fxtOHlp/CXWI63yTCpKHXvTok1MRf5mApxIsN5KzGpOGsaJVresGwgEgNnjlskX//
 NCO9LhuG9CspoyaKqGXSG3MvHbs651TdlHAnWxaImDipyg8rxjNZQHwP2FWpp5XtTXMe
 haug==
X-Gm-Message-State: AOAM533BJPLUae9gq1UNVFs3nw2VP8JI83+hOBAtc4fmjZQoWB+2Pbfc
 D3IWXWZDt6H+JRhX3Yd4Vwc=
X-Google-Smtp-Source: ABdhPJwtLnpnb24GBbAJvfZjBEEyNGV/Ue+oWCuGy08cK6xpUH3BxpyQBz1Pz+UxthRkMnMzvh/CYA==
X-Received: by 2002:a19:550b:: with SMTP id n11mr19199757lfe.213.1619595856928; 
 Wed, 28 Apr 2021 00:44:16 -0700 (PDT)
Received: from eldfell ([194.136.85.206])
 by smtp.gmail.com with ESMTPSA id d20sm528137lfn.41.2021.04.28.00.44.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 28 Apr 2021 00:44:16 -0700 (PDT)
Date: Wed, 28 Apr 2021 10:44:03 +0300
From: Pekka Paalanen <ppaalanen@gmail.com>
To: Simon Ser <contact@emersion.fr>
Subject: Re: Display notch support
Message-ID: <20210428104403.1e49f270@eldfell>
In-Reply-To: <ck2MR5NpcE5l0NZuJnX7O7DLXBGxiFr_1LCqlDlsC0GNC3PEtTEcx1-vfIp8ZLyMhfxmv4_MyGaYBjZBawdTaWzButF0qkbdc-9EYhVFZYk=@emersion.fr>
References: <f8747f99-0695-5be0-841f-4f72ba5d5da3@connolly.tech>
 <ck2MR5NpcE5l0NZuJnX7O7DLXBGxiFr_1LCqlDlsC0GNC3PEtTEcx1-vfIp8ZLyMhfxmv4_MyGaYBjZBawdTaWzButF0qkbdc-9EYhVFZYk=@emersion.fr>
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
Cc: martijn@brixit.nl, Caleb Connolly <caleb@connolly.tech>,
 dri-devel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 ~postmarketos/upstreaming@lists.sr.ht
Content-Type: multipart/mixed; boundary="===============1750622642=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============1750622642==
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/rDquM437Q7YXjm92tPTEso."; protocol="application/pgp-signature"

--Sig_/rDquM437Q7YXjm92tPTEso.
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Wed, 28 Apr 2021 07:21:28 +0000
Simon Ser <contact@emersion.fr> wrote:

> > A solution to make this configuration generic and exposed by the kernel
> > would standardise this across Linux =20
>=20
> Having a KMS property for this makes sense to me.
>=20
> Chatting with Jani on IRC, it doesn't seem like there's any EDID or
> DisplayID block for this.
>=20
> Note, Android exposes a data structure [1] with:
>=20
> - Margin of the cut-out for each edge of the screen
> - One rectangle per edge describing the cut-out region
> - Size of the curved area for each edge of a waterfall display
>=20
> I haven't found anything describing the rounded corners of the display.
>=20
> [1]: https://developer.android.com/reference/android/view/DisplayCutout

Hi,

I'm kind of worried whether you can design a description structure that
would be good for a long time. That list already looks quite
complicated. Add also watch-like devices with circular displays.

Would the kernel itself use this information at all?

If not, is there not a policy that DT is not a userspace configuration
store?

You mentioned the panel orientation property, but that is used by the
kernel for fbcon or something, is it not? Maybe as the default value
for the CRTC rotation property which actually turns the image?

Assuming that you succeed in describing these non-usable, funny
(waterfall edge), funny2 (e.g. behind a shade or filter so visible but
not normal), funny3 (e.g. phone button area with maybe tactile
markings), and normal areas, how would userspace handle this
information?

Funny2 and funny3 are hypothetical but maybe not too far-fetched.

Is there any provision for generic userspace to handle this generically?

This seems more like a job for the hypothetical liboutput, just like
recognising HMDs (yes, I know, kernel does that already, but there is a
point that kernel may not want to put fbcon on a HMD).


Thanks,
pq

--Sig_/rDquM437Q7YXjm92tPTEso.
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAmCJEkMACgkQI1/ltBGq
qqdcyg/7Bqx0jukraVQF/vrHaegzka1iUCS1jFkLSq47iftYgDWxlUiHEFftwKwf
XDe5sZVEDY0ARzC6Tw/Jfsl7x9yFW1R+UZRpH5gssbhW0Pod+ZKXG+k1IdKCQjJ7
aSR3redgLEGtkjTSvpWvSr/IR/0K3YQF7N/qkFvIccloc1jGtKGcmyWdbMimyyZk
KLWymdQ6gM7bRZ42wkfvitPnTaynK+u2ZGuyq59QteZt0zpWiyPVCnzQU0buYqR+
NeTePmIfWvUDi7tfv/79JbGvMnGDnv27Qv3+zY0Kiea2gri0wdwT2pmLKUWnTA1P
xodLPk/3bVAboT7R5sDl5bGSCOb63UBG4qK7H1WOY5Bet4iJ5MyFdfmPlL8NK3UA
U8PaNqn/XPc/MSjygqZx6iC5ACuyeE7+ej8kfMLzOa5b+CXJJVXPL/oJ6Ka06vd0
LIVEJ5mayB2lmFoHe+OYqfjpuNNFkq7+u5rpZ8G3JH0crbtVhNh3CKFwxDU9bJ8w
ouCPqz24825pCnHYT6sHlBRy3OOPcbJ/av7beli6HRdaczEBmtpA4wxiLW4wkIqb
sYdIY6EYJiVM7DerO+MrKGYy2pN5AUDGqD2DtR2HHbFA/Vp0Sx29vgZEfHnVSrBZ
85r7OJ/PMCb5CywFSKAbq8eDSuz4IwhIGzDCRUYDYZqXPWYd7uo=
=g0fV
-----END PGP SIGNATURE-----

--Sig_/rDquM437Q7YXjm92tPTEso.--

--===============1750622642==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1750622642==--
