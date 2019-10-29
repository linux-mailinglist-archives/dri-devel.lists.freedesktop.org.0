Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C5000E8A3F
	for <lists+dri-devel@lfdr.de>; Tue, 29 Oct 2019 15:07:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E69A06EB73;
	Tue, 29 Oct 2019 14:07:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com
 [IPv6:2a00:1450:4864:20::344])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AC1466E40D;
 Tue, 29 Oct 2019 14:07:28 +0000 (UTC)
Received: by mail-wm1-x344.google.com with SMTP id 11so2752702wmk.0;
 Tue, 29 Oct 2019 07:07:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=Y7nv/ppOM9bsFhaC6a8JLN6nERQvOeC3b6LYkBHa3uM=;
 b=qrN/HFgtBvALwnpfv3/t0wjPCyj+mCAgDhXW4jSFgXLUTDUzorGRWPG9EWeBX1v4XB
 /tP0S3V3xKSDbLyq10/V2bqLLRSW8CkMR2jqdEYKA1dGNy/ur4mr6R/hCIcpbCbTl3yr
 mIUIow9pT+GYY4UpdwDIq7F9k2zQZ6BADteKDasp9i0hmC3j8BDhk0YYNDd1JNa3iANU
 R6KGK2bfyPesv3mUC0w+BWnzcJFy/ShuAAuwFWofjgcWW/gDQ0vZHcdd/XP7KUoMH3PQ
 d9uBIPmsX2hECFvB0RSU+y8PH+GQRX21imtqS+Un6clDyCK/vYiz+WHjAn9p4RNmgSYr
 0QSQ==
X-Gm-Message-State: APjAAAWykxn8kYY67jEupX2G7mr+n5eEkdtvrt2pkyQJkBTM8a5ONRdE
 zhE4M+9Rc4oYvhrr/U8XXuUCL1Zb
X-Google-Smtp-Source: APXvYqyywS17aHGnRF0fq8p6OK8qfFXTLs9zYPTRjuwt60pDQvPg2jfMj8P22JyrG5h5f4iO/4zu7Q==
X-Received: by 2002:a1c:740b:: with SMTP id p11mr4104702wmc.133.1572358047141; 
 Tue, 29 Oct 2019 07:07:27 -0700 (PDT)
Received: from localhost (p2E5BE2CE.dip0.t-ipconnect.de. [46.91.226.206])
 by smtp.gmail.com with ESMTPSA id b186sm2714808wmb.21.2019.10.29.07.07.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 29 Oct 2019 07:07:26 -0700 (PDT)
Date: Tue, 29 Oct 2019 15:07:25 +0100
From: Thierry Reding <thierry.reding@gmail.com>
To: Jani Nikula <jani.nikula@linux.intel.com>
Subject: Re: [PATCH] drm/dp: Increase link status size
Message-ID: <20191029140725.GK508460@ulmo>
References: <20191029111006.358963-1-thierry.reding@gmail.com>
 <875zk7ad8m.fsf@intel.com>
MIME-Version: 1.0
In-Reply-To: <875zk7ad8m.fsf@intel.com>
User-Agent: Mutt/1.12.2 (2019-09-21)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=Y7nv/ppOM9bsFhaC6a8JLN6nERQvOeC3b6LYkBHa3uM=;
 b=W9HX51hJ4av1Mralgva8gjjafw3U3u481zdDXAdbgCGNGMLyyNyXw05FHa/4wq1rq7
 P0m79vpW64YZPG6giDgRam1sCUd+hP35oUPSFYe8ELSktYn2PrQw1dXbqMwrpz+XXcrQ
 7S79v1wj3mx41LsVOan66RaqlGAeK2AJ4cfKayM2ZTbfhWuLPIcTZgP1WZBYcHbSeCKn
 7Q5i0zFFxNP+uG1aIH1CsmCWdx24dWZQiigKtM5E0iQQz815Wy8gNDb3a+yJttCP1hpN
 fJsr0IXpuqx2PoSgttWO+ItJo6HuMhyHYNoRqWxRy2REYXdooLVwOpRBy3sji+JocOMZ
 UE+Q==
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.23
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
Cc: intel-gfx@lists.freedesktop.org,
 coverity-bot <keescook+coverity-bot@chromium.org>,
 dri-devel@lists.freedesktop.org
Content-Type: multipart/mixed; boundary="===============1580026437=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1580026437==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="LHvWgpbS7VDUdu2f"
Content-Disposition: inline


--LHvWgpbS7VDUdu2f
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 29, 2019 at 03:32:41PM +0200, Jani Nikula wrote:
> On Tue, 29 Oct 2019, Thierry Reding <thierry.reding@gmail.com> wrote:
> > From: Thierry Reding <treding@nvidia.com>
> >
> > The current link status contains bytes 0x202 through 0x207, but we also
> > want to make sure to include the DP_ADJUST_REQUEST_POST_CURSOR2 (0x20c)
> > so that the post-cursor adjustment can be queried during link training.
>=20
> We don't currently use this in i915 (we probably should), so the impact
> here is that we'll just read more DPCD than before. I quickly perused
> i915, and this does not appear to directly break anything. I think the
> change is probably fine, but at the same time it freaks me out a bit...
>=20
> If you don't mind, please resend this with Cc:
> intel-gfx@lists.freedesktop.org to have our CI crunch through it across
> a number of platforms. Would give me a warm fuzzy feeling. :)
>=20
> With the caveat that I didn't look at any other drivers besides i915,
>=20
> Reviewed-by: Jani Nikula <jani.nikula@intel.com>

Done, thanks.

Thierry

--LHvWgpbS7VDUdu2f
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl24R5cACgkQ3SOs138+
s6FsUQ//WJ3B8xJ9F/Lvivai6kCMzgL6wCp4TE6h/XtRLLM9mSa0vm0a9RMNaV97
jkIfAMyKtOsCC21MYPrGrVBrBxM6Qab4cuZ0n9wmckEznMV/CsXZzonXk/NR4ikB
9CKrs3FcVCRfzH3o0ji1skL09X4+OfHl5/ZCch/q0YEtiztASluKo6RS4+0QfKCD
hKYzHXqy3d1CVX2NE4Oncg/G6nQLXEHpoJDs9FYZx+PGY1S6YpvBC4+BrkZ+3eQ5
rwws2hPZnrX548yZkpXW7CnN/unQyYsygBOJvt0eZgOlHwPaW3F8xUN0tiNQko0p
Qvx80IIUTtudrSdJbmOnWNCeQWi7cSVbyDa3ZaPd0wjDgyuFGU1x/0y2jLZV2XYW
EV8O63VrkHw+XXzZYLuOu4IEuHpsx5t87G8p4TgBfM6C3G/ttqKgXooBV2gYBAWl
fiMSBptBzeth/aqC6V9SrLLQ6+kKxMUUIdxaTqlf3kuJIyq+G+QcoAPtWBpIT03o
n9bjBO9Lwd6ELSvWmkp2sRqteg8qf+kYG5dLbvA0/BI2+k1l4FIdx2KSzt6Ys+AL
InHlhNgeteRNMC+8R+MRvrV4YPx5JzTXoNvbZqybVZufKj07Ox24tcHtJHUR9gMq
8gv+1JFXUsk/yVFFRb8SmhMVoUU3weLbqna/Dh5HKuhLRygEumQ=
=HLxj
-----END PGP SIGNATURE-----

--LHvWgpbS7VDUdu2f--

--===============1580026437==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1580026437==--
