Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AB5737A165
	for <lists+dri-devel@lfdr.de>; Tue, 11 May 2021 10:08:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B36106E9F4;
	Tue, 11 May 2021 08:08:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x244.google.com (mail-lj1-x244.google.com
 [IPv6:2a00:1450:4864:20::244])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3B78E6E9F3;
 Tue, 11 May 2021 08:08:08 +0000 (UTC)
Received: by mail-lj1-x244.google.com with SMTP id p12so24061477ljg.1;
 Tue, 11 May 2021 01:08:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:in-reply-to:references
 :mime-version; bh=l8LjKeF7xUB1WD7WveY1VqJ0QLlpA02sBHv/Zc54oog=;
 b=tniuYKg1HguI2MQd2UejJnQwUTpyr6q2szB1Am0I2gAhT8o4BHN5w5Ep9j5jQoOyNZ
 EkOJ8Th2JRnkwjcnM9DvPlkN02rU1XhGwSQMps6iL0w3cmesRBqMsf94YGIogboDnEZ4
 PvLwc8+Zs7+Rm9wBHq6l9hJL+5V+GpJMedpsPx2tDlDlsNrQrhcOQyXE6N++uc8vubQH
 FOo/SPFujQBja9AWehzvgwsBqDaCEQEKe3vBWWhGS1HpqkJCY/e0ywrqdWUsNaku2nlx
 S4/Gg565z/fP4+Ryl4a1s7qHvAik+gAzoYIzBoXnCfSg8LjVZ9f/dZVVjovnrgYCrttP
 ukDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version;
 bh=l8LjKeF7xUB1WD7WveY1VqJ0QLlpA02sBHv/Zc54oog=;
 b=tICKXDQ7GQ1YHM34o5QR1cAEYNdPgiEDzOFc/lHe5+zfYoKjtpuJ51hI+/UmRYxze1
 VC9Wc22uA0Nd9G/qi1mGSsK4r2nE8URHnU+3LTPSK6fG9iOOuQYxjhSKSO7qnLjzLsTw
 1gU3EkvG3rVgV86UgCUp/JWrV3XppsA18RoBlmdiYnBU3QYQw/BPN6St4JKM7n9R71Lv
 B8lTMy1ZzorQ46pjGVpyYbVvXgLkeDLbU66SwrBX1KKQUXrut+AJ4PiTEoqOMGnceudj
 mYhzuXkvJDguk/tKRCcxXf1BngrJNDpNlBoZo3Es+cF48Kp2Ou9F13gACp791jPX/FL3
 vT5g==
X-Gm-Message-State: AOAM533srmDkCK2O7YPPcwCddOmIfV1F6De9brtdeH+aGmamQoG2w3YZ
 u5+9OLhaqPzMYEVMH3h4Ixw=
X-Google-Smtp-Source: ABdhPJzeOPZqYc68hKuZ2UZOFB2jpA3vwamDRKb0FMMAw+jCccrZtCHDimFakgxryNrYBJafo+GyHQ==
X-Received: by 2002:a2e:8011:: with SMTP id j17mr20083882ljg.106.1620720486597; 
 Tue, 11 May 2021 01:08:06 -0700 (PDT)
Received: from eldfell ([194.136.85.206])
 by smtp.gmail.com with ESMTPSA id c2sm2875304ljj.110.2021.05.11.01.08.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 11 May 2021 01:08:06 -0700 (PDT)
Date: Tue, 11 May 2021 11:07:56 +0300
From: Pekka Paalanen <ppaalanen@gmail.com>
To: Alex Deucher <alexdeucher@gmail.com>, Werner Sembach
 <wse@tuxedocomputers.com>
Subject: Re: [PATCH] drm/amd/display: Expose active display color
 configurations to userspace
Message-ID: <20210511110756.7e754c30@eldfell>
In-Reply-To: <CADnq5_O7uuSj-nmKXRvGVTb9n1e+Bb-SU3Psi7BVhN4AOYhHsQ@mail.gmail.com>
References: <20210507192718.35314-1-wse@tuxedocomputers.com>
 <CADnq5_O7uuSj-nmKXRvGVTb9n1e+Bb-SU3Psi7BVhN4AOYhHsQ@mail.gmail.com>
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/HEwpQv.ZV+VGiXcatNUIIMr"; protocol="application/pgp-signature"
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
Cc: Dave Airlie <airlied@linux.ie>, LKML <linux-kernel@vger.kernel.org>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 "Leo \(Sunpeng\) Li" <sunpeng.li@amd.com>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>, "Deucher,
 Alexander" <alexander.deucher@amd.com>,
 Christian Koenig <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--Sig_/HEwpQv.ZV+VGiXcatNUIIMr
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Mon, 10 May 2021 17:47:01 -0400
Alex Deucher <alexdeucher@gmail.com> wrote:

> On Fri, May 7, 2021 at 3:27 PM Werner Sembach <wse@tuxedocomputers.com> w=
rote:
> >
> > xrandr --prop and other userspace info tools have currently no way of
> > telling which color configuration is used on HDMI and DP ports.
> >
> > The ongoing transsition from HDMI 1.4 to 2.0 and the different bandwidth
> > requirements of YCbCr 4:2:0 and RGB color format raise different
> > incompatibilities. Having these configuration information readily
> > available is a useful tool in debuging washed out colors, color artefac=
ts
> > on small fonts and missing refreshrate options. =20
>=20
> I think we would ideally want these as generic connector properties
> rather than AMD specific ones since they are not really AMD specific.
> I believe there is already a generic drm property (max_bpc) for the
> color depth.  At this point, I think having a generic RGB vs YCbCr
> property would make sense.  I'm not sure about the color space.

Hi,

I believe that userspace will definitely want to know what exactly is
going on on the monitor cable, so I think exposing more information is
good, but I agree that it needs to be done with generic KMS properties
as much as possible. Userspace is not going to bother having explicit
code for driver-specific properties.

I think a major use case will be Wayland color management, where a
Wayland compositor will want to make sure that the video signal
parameters have not changed since the monitor was last measured
(profiled). If the signal configuration is different, the measured
color profile may be invalid and therefore the end user needs to be
warned. See some ideas in
https://gitlab.freedesktop.org/wayland/weston/-/issues/467
under the heading "Color calibration auditing system".

About the color space: is that something a kernel driver will decide
on its own? I mean in the same sense as the driver will negotiate
HDMI/DP link parameters, perhaps falling back to smaller requirements
if higher requirements signal does not seem to work.

We only need readback properties for things that generic userspace
won't or cannot control explicitly, e.g. because the kernel driver has
room to make a choice rather than fail.


Thanks,
pq

--Sig_/HEwpQv.ZV+VGiXcatNUIIMr
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAmCaO1wACgkQI1/ltBGq
qqeF0A/7B6wXH1lcVQjMdfy0O2DC2PdZFUqoKmKJ44jPH2BH8MTFrvc/Bp1XPkcc
Kj6HZL6VrmMnPxniVgqLZ7kH5xK8cw3SvAWBadcbJ5T6r27i+Q6BvefLCIFz9B06
GXKAFIQ6aCqaSqIRSSRqK8KYJ5Jz+fguAhfmCxK+Scd3arW8bwX/uLQnLvRmLr3K
+8WhLFMzXRCNDOHCCSEqrT231uQyWzr1dBgXJ4BMl7Pz6MRF4U+VlJD2DoVez54c
lOpPRBcpQ6Omt68JofVoQ/oxjzlIZpo5N3WSMYWKoikM8E3Tm/sd+acnsnXdFlKJ
vofGNg6GaOUU4gCi1LZh9Bt9BwVRD8/qpcnJaOk2sX1+hLRcrPdl5zXXFTXkg0lY
nwBRcAyBgooJOci/tFj0UugD7/EwHw9TxCZYLtw7d3CZfEtY90lJSO/ADNis3sFw
X3EgLbTH591llu73BwFYUuQ7X1f/15OyBFrWOH/mpjeIZMSem8Q5nifiOxaXFw+J
j3oTH8WCXLRm1LYOm+ushVQl57FUxVD/sSAdvgo4jwX6uO/s29Lp3h5TO5jKPneV
siY2ycHLXPszJHxjT0dUKTgwgxD9AmLWW7SrYwnswSQZpqW07d2waK08SKjj+a1s
7HBBWQQeV71V/5f1HIws7SRNOddVqpbYgHyfKvJZA/y0fhQf8EY=
=24IE
-----END PGP SIGNATURE-----

--Sig_/HEwpQv.ZV+VGiXcatNUIIMr--
