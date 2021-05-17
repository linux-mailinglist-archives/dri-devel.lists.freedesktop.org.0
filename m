Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E17C6382726
	for <lists+dri-devel@lfdr.de>; Mon, 17 May 2021 10:34:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4FEA56E8F3;
	Mon, 17 May 2021 08:34:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x234.google.com (mail-lj1-x234.google.com
 [IPv6:2a00:1450:4864:20::234])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E66656E8F2;
 Mon, 17 May 2021 08:34:45 +0000 (UTC)
Received: by mail-lj1-x234.google.com with SMTP id e11so6138502ljn.13;
 Mon, 17 May 2021 01:34:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:in-reply-to:references
 :mime-version; bh=4/35G1MI5crtjOtKd8XUhfr3P+Qgrojx1gL97EhL83o=;
 b=MTxJ7TyiTG5LxkCEo/BaN6dgkKa3wEp9+Ffjp7s+mZD8MQ2P6+M2PGBLOVNqIw7pTw
 Lr2sS+C2b7TRc/HwLagOkqeMRFS1ZdpQdHTsZNL9raCRn0JeQOJcgj99yCffZ21DeXOK
 UYv1+zy43jPFa+tkj5dL0JSpM17rVzPcPf+wiy6ANaF3fruoas+XYe4eWLoJXUoiIdZ2
 cxE0ipD8dN7LlcFfChbCQpWYsP8XYCZEX/odw5mFZNIzufUdBxmZ/hr57J6fzSytdTgx
 83ej0ixcj3Ar5aVVN3tgYxJZpzgNFBmGYyGJ/Kmbi+wEf3IHKZuUddkvloN9/m9R3NG0
 Kc+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version;
 bh=4/35G1MI5crtjOtKd8XUhfr3P+Qgrojx1gL97EhL83o=;
 b=gfHzE11j+A86h5l7j9PiSFMOjXPEjCazd1bXLyDw7YSnY0oSKQF4r66nQHuSjkrZhG
 kcNKQ+s3YRAKFeLEy4c9bqDUGmNqAZYCsa42pLblcDJkuY9PIOLOVKwfxo8kpV2XNjs3
 PUU8EIgdhy8Mxci/Skvx66iJ306efR+JlPnO83K9ZywTXxyIbCl6hj8t0La+7k7ZtpLh
 xX3EabFsW96ox5xF1A2A/RCqV+SmVXjx2C4PPtPLFS8MQnJo2F8dU+Snc2nWvxwBcCl5
 kcAoveNglFDkiNpyetb8ep8wzv0rm+KewcQ93296dWC1wy7DHgzQg4NLbszuxQOTwpdo
 JTpg==
X-Gm-Message-State: AOAM532ooyzQEHK1vi6WMRZWdK+y9t5mzX3iY5mEXgQFIXnsQ0foSBEp
 TwRG4h9VQl1sWre9hq/RWsc=
X-Google-Smtp-Source: ABdhPJzd5gc0ggRQY3tg6nHRBZAu7JjigCB5uEVxApt9kHbQ4lPV/NhaLthesrp3VCpVbVbE3RocSw==
X-Received: by 2002:a2e:898c:: with SMTP id c12mr47007566lji.431.1621240484271; 
 Mon, 17 May 2021 01:34:44 -0700 (PDT)
Received: from eldfell ([194.136.85.206])
 by smtp.gmail.com with ESMTPSA id s23sm2814394ljh.16.2021.05.17.01.34.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 May 2021 01:34:43 -0700 (PDT)
Date: Mon, 17 May 2021 11:34:32 +0300
From: Pekka Paalanen <ppaalanen@gmail.com>
To: Harry Wentland <harry.wentland@amd.com>
Subject: Re: [RFC PATCH 1/3] drm/color: Add RGB Color encodings
Message-ID: <20210517113432.11f95361@eldfell>
In-Reply-To: <cac44e69-85cb-661b-4a5e-33fafee8ea3d@amd.com>
References: <20210426173852.484368-1-harry.wentland@amd.com>
 <20210426173852.484368-2-harry.wentland@amd.com>
 <YIcBUl+94sHJsT8B@intel.com>
 <0090ce07-6102-59e7-bc8c-3528297aa5ae@amd.com>
 <a49e967a0082727757143828770bd671@sebastianwick.net>
 <cac44e69-85cb-661b-4a5e-33fafee8ea3d@amd.com>
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/.U1C=esMDUGghuFV02zT09K"; protocol="application/pgp-signature"
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
Cc: Deepak.Sharma@amd.com, Krunoslav.Kovac@amd.com, mcasas@google.com,
 Shashank.Sharma@amd.com, dri-devel@lists.freedesktop.org, Shirish.S@amd.com,
 Sebastian Wick <sebastian@sebastianwick.net>,
 Uma Shankar <uma.shankar@intel.com>, hersenxs.wu@amd.com,
 amd-gfx@lists.freedesktop.org, laurentiu.palcu@oss.nxp.com,
 Bhawanpreet.Lakha@amd.com, Nicholas.Kazlauskas@amd.com, Vitaly.Prosyak@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--Sig_/.U1C=esMDUGghuFV02zT09K
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Fri, 14 May 2021 17:04:51 -0400
Harry Wentland <harry.wentland@amd.com> wrote:

> On 2021-04-30 8:53 p.m., Sebastian Wick wrote:
> > On 2021-04-26 20:56, Harry Wentland wrote: =20

...

> >> Another reason I'm proposing to define the color space (and gamma) of
> >> a plane is to make this explicit. Up until the color space and gamma
> >> of a plane or framebuffer are not well defined, which leads to drivers
> >> assuming the color space and gamma of a buffer (for blending and other
> >> purposes) and might lead to sub-optimal outcomes. =20
> >=20
> > Blending only is "correct" with linear light so that property of the
> > color space is important. However, why does the kernel have to be
> > involved here? As long as user space knows that for correct blending the
> > data must represent linear light and knows when in the pipeline blending
> > happens it can make sure that the data at that point in the pipeline
> > contains linear light.
> >  =20
>=20
> The only reason the kernel needs to be involved is to take full advantage
> of the available HW without requiring KMS clients to be aware of
> the difference in display HW.

Can you explain in more tangible examples, why you think so, please?

Is it because hardware does not fit the KMS UAPI model of the abstract
pixel pipeline?

Or is it because you have fixed-function hardware elements that you can
only make use of when userspace uses an enum-based UAPI?

I would totally agree that the driver does not want to be analysing LUT
entries to decipher if it could use a fixed-function element or not. It
would introduce uncertainty in the UAPI. So fixed-function elements
would need their own properties, but I don't know if that is feasible
as generic UAPI or if it should be driver-specific (and so left unused
by generic userspace).


Thanks,
pq

--Sig_/.U1C=esMDUGghuFV02zT09K
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAmCiKpgACgkQI1/ltBGq
qqcOOQ/+NzUjGFSG0VlVqpv5JsY8U4LKOJoG/2PZKYVNLQrvPAgabT2ZuJ8JG3Hu
cfcdnzyqj72nm+/jG1ZVNJcCIkKs4sjSQdsgcgJzxFYyPaJfHIvnC8YNS8mlNXdK
b77FKIk7ipzIF9LO4tWxS36g9v/lEcDDZEVFxfSKaZKNdYqhYlCaORmWorgs5zqS
WJAGWfaAJjx2bk/RxhkFwJSG5RppAgnufDxg68FZv7uyyqi+k+0ZeEKgPKK0+Oy2
iVPzNCmqMGpiClWw2QDeB7tqIyOzBjozgg+lkPPV44mMZ3q+wDpZ8+ADSgZD40Bf
PQD0rKodHiYNvWuWBGn3bmeBJc/lA+NRKjXMgaokUcKZlFkRAYy3CSnNR1CCTw4+
TxCtP7O19+43liguPDkC7ENJ4rlI+3rUG88aSJ+miyhauLJen8rcNdkLA3n5UIiw
BjEZ85nK5N7Hujq1eVKe9p2LYQ8fKzJN0omr+33711tnP1ccAQkwDq9lEL/CgokL
FC1xj9xOPxn+6wHW0zTfQieA4iD+c/fXDSSz6fgFgsL69cNCdpErokFtK6Yofund
BhsPcMYRTKHgTpEUieecg661TaUrwM4N0a5jWcC4gwbJoSpAJaENlPhYkaJpErSA
JnJnWTlEweXGjP0Ne2TW0e9d6M9SwfoqQSLbM2VLz8MlVOL989Q=
=RiSq
-----END PGP SIGNATURE-----

--Sig_/.U1C=esMDUGghuFV02zT09K--
