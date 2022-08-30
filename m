Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D9C345A5ED0
	for <lists+dri-devel@lfdr.de>; Tue, 30 Aug 2022 11:01:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A5C7389B33;
	Tue, 30 Aug 2022 09:01:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x142.google.com (mail-lf1-x142.google.com
 [IPv6:2a00:1450:4864:20::142])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EAE0E10E324
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Aug 2022 09:00:56 +0000 (UTC)
Received: by mail-lf1-x142.google.com with SMTP id v26so4360800lfd.10
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Aug 2022 02:00:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:message-id:subject:cc:to:from
 :date:from:to:cc;
 bh=b0ZumS/YLQNCHLAsr86H4b/bAgEp1WOghgZrXkTetmo=;
 b=lKQB64vh9bHwWDFKPY63j9DpjL6HnUQcUMDx+GZBTcw9xBEqkHP2Yhm+/2sxUuhHyp
 7HcO4l6N1Ch/1y/F3Wxljgx4UMPvJLcK9MnhG7Pde/Z4zb40eUfwmsIRIiWN2Uzztx0+
 3R5QTlyUhc4Yzi7Gx3i1OpTiu6OTRIXUMKBM1CfzrYicb/fv1RN+34yYL53f6VqtA2yp
 /FhpAso6GQPX0zDIeX+r/maM2aGQBxDLh50JLbGX46XAIJJ/ZfJiRbaQ3s/E9T5MvG7U
 udO8MDlQXv5Z9k/5K9qBdAsFUE0K/6o5NOzPkyDtmeAQS2/t7X+Xl68Fa2E2j2G+PvXI
 UI/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=mime-version:references:in-reply-to:message-id:subject:cc:to:from
 :date:x-gm-message-state:from:to:cc;
 bh=b0ZumS/YLQNCHLAsr86H4b/bAgEp1WOghgZrXkTetmo=;
 b=xXzsm3wjLpKDcxGijANkgnJ7enKZ+/QCQ4xoy+spFapjQgc3tPvczt65urO08QZ5by
 3LLU9HXkpXu5FTz75ov5wFSE7V14QyBFOT//bVTCh9qa4/acabIr0DT6Y3VMdEAyJ1EN
 /mSVRgChWwvCO4wAjswiPtVW+0pjCyTyvOxL38NCXLlegcVzHzTw+EMkTXDSU/b62acX
 ri1PvM92+eaYXy4TdJ0KUusYNOw6KMRUWpY0AulEE5ntTl2meE7l74EaoSAsntnHvtA9
 4ELXTuksOK0f62j62u41/W/+/xdDqqMn+RBoCIGkea7BlOWX88g9MjJaBGdzNevzmqzq
 NKbw==
X-Gm-Message-State: ACgBeo3oltbrycE2w3jbT6OGzuro+LUhwMh7p05jwq7I2x9A8ra8Mnog
 03hTXTNqfEMbe1s9tNx7vVI=
X-Google-Smtp-Source: AA6agR6QF38FPsQeJSYnppw2FmVPQc7r4YXgeXgyKcX0cRIXkmRsOUKrbZUrdmCFmiHqSzuluweyig==
X-Received: by 2002:a05:6512:15aa:b0:494:7a2a:cc1f with SMTP id
 bp42-20020a05651215aa00b004947a2acc1fmr592670lfb.36.1661850055024; 
 Tue, 30 Aug 2022 02:00:55 -0700 (PDT)
Received: from eldfell ([194.136.85.206]) by smtp.gmail.com with ESMTPSA id
 x8-20020ac25dc8000000b0048a8c907fe9sm1542632lfq.167.2022.08.30.02.00.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 30 Aug 2022 02:00:54 -0700 (PDT)
Date: Tue, 30 Aug 2022 12:00:50 +0300
From: Pekka Paalanen <ppaalanen@gmail.com>
To: Ville =?UTF-8?B?U3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
Subject: Re: drm: document uAPI page-flip flags
Message-ID: <20220830120050.1699a8da@eldfell>
In-Reply-To: <Yw3NQ2MmhJbsxV3h@intel.com>
References: <20220824174459.441976-1-contact@emersion.fr>
 <20220826115355.668e13ca@eldfell>
 <ASSNOUe9wtsXskZjVlf1X4pl53T7pVE0MfEzkQ_h4cX0tjnF7e3cxpwGpRNPudmIHoRuW4kz_v1AeTpXgouLpTYcI8q-lPTzc1YMLR8JiJM=@emersion.fr>
 <20220830111626.77307042@eldfell> <Yw3NQ2MmhJbsxV3h@intel.com>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/RP=nBm5sazytbDYlQoi1Y6.";
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
Cc: Sebastian Wick <sebastian.wick@redhat.com>, dri-devel@lists.freedesktop.org,
 Daniel Vetter <daniel.vetter@ffwll.ch>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--Sig_/RP=nBm5sazytbDYlQoi1Y6.
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Tue, 30 Aug 2022 11:41:39 +0300
Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com> wrote:

> On Tue, Aug 30, 2022 at 11:16:26AM +0300, Pekka Paalanen wrote:

> > Hence, "has been displayed" is not it because the flip-done event is
> > emitted before the new FB contents have been scanned out. That scanout
> > cycle is only starting when the flip is done. The flip timestamp should
> > correspond to the time when the first real pixel of the new FB hits the
> > monitor cable.
> >=20
> > A flip is done, when it is guaranteed that the next (or on-going, in
> > case of tearing) scanout cycle will use the new FB, IOW the hardware
> > programming has been done I believe.
> >=20
> > If the flip is sync'd to vblank, the timestamp is as above, but the
> > actual event might be emitted somewhat before or after the instant of
> > the timestamp. Some drivers can predict the timestamp so can send the
> > event early, others don't.
> >=20
> > If the flip is tearing, then I'm not sure what the timestamp is or when
> > the event is emitted. =20
>=20
> For i915 we emit the event when the hardware has indicated the
> flip has completed (ie. it has really started scanout from the
> new fb). After that you can safely reuse the old fb without
> accidentally doing frontbuffer rendering. It takes a bit of
> time (some smallish number of scanlines) for the hardware to
> flush the FIFOs/TLBs/whatever.
>=20
> And IIRC we just send the last sampled vblank timestamp for
> the event. That is, the timestamp should look the same as
> for a sync flip submitted during the previous frame. I was
> thinking of making it more or less show the current time
> of the flip done indication as that's when the scanout
> from the new fb starts, but pretty much everyone else was
> of the opinion that there is no point in doing that.

Ugh. So we have two different meanings for the completion timestamp:

sync flip: when the first pixel from the new FB is emitted into the
	video signal

async flip: something irrelevant

*sigh*

To me it would make sense for both to use the same definition, if
that's technically possible. The point is to know roughly where the
tear line is which could then answer the question "did it actually
tear" which is related to the silent falling back to sync flips.


Thanks,
pq

--Sig_/RP=nBm5sazytbDYlQoi1Y6.
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAmMN0cMACgkQI1/ltBGq
qqevWQ//Xn3DaC/1WRc+xroHGg6ylCRqlZ00Z8OtKq12mglMLHsM9uUx1edBgQ1j
1SrYC6zqDbCMw5usdPhPV+WEZqKyAFpxaQuO29dh0NQUel+EkLGW4YFIPyeqr+0u
5H52y4VatpnfgyGRU3cRqyZbNZt3RxyyD4gN0DzlhfoAeugqONP1ftXFKnjXByi9
FHtPthpNmkubRExlQNUHwv9RFxSZg/UB3bVGRrHJHko8yI1WAbDLPopybFZCqId0
oUN+9DSHsHywXTbpI+6g9t6XijUv/jACJK2VCvMCz/Hu5qpcFFwHgg7OH7S0CToX
p9CWusfJCAF8tNKus6Jl08Xjt/WwEtbkSmHxhtVnBcE9nscQw6yWsjAYWTManFAa
TFZfBC7FF6R3q1hEO5TDg0wRyJfsrTqtBR5LMt5tWrGqkprpCnvU3UNSkcb0FhqY
ZY4w7pu7oLwRuFHcfsFlxl3aXUAOJ+eUa0xoK6KHkb7Wv+5aycHKZZzVn7977aJk
LjYOy+y8GiCUt6pOLhHCVY0hnfLkZUSaPdiv32H7ak/eFLrKMxEHsAJnR0EosM3k
WVIwvBt+F2nrMPP/7KpSSr67r5CVhofS6IvZ1+05XurGG927rDyrqfWkzx/wJ+MI
FKLxw9lzJOKtHfybpZ5TqBiTqNmmUA3ZfxgMCuRUMnftosBq79A=
=Bevf
-----END PGP SIGNATURE-----

--Sig_/RP=nBm5sazytbDYlQoi1Y6.--
