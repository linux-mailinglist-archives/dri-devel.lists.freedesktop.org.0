Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A706F9BA2B3
	for <lists+dri-devel@lfdr.de>; Sat,  2 Nov 2024 23:14:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 75AE110E315;
	Sat,  2 Nov 2024 22:14:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="axN3Nqrr";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-f47.google.com (mail-ot1-f47.google.com
 [209.85.210.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4391310E03E
 for <dri-devel@lists.freedesktop.org>; Sat,  2 Nov 2024 09:20:12 +0000 (UTC)
Received: by mail-ot1-f47.google.com with SMTP id
 46e09a7af769-7180ab89c58so1259757a34.1
 for <dri-devel@lists.freedesktop.org>; Sat, 02 Nov 2024 02:20:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1730539211; x=1731144011; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=kpGFODYS8j6Lc9OgDllYcnBQdgtbbm75EKILrrrUJdM=;
 b=axN3NqrrNfmKWTDsShfJjh+JyYemqjnVnA44FAsuKkrve0OYp4OgCElYQiHBYPTpfX
 kI+fDD4pQrCeDRhEtwtti44MuRFjcenDsBw2mX+bSOjkIcMwVkyUO4FwhLEBN0aTom18
 a9522qtoawpvzrgcykfcnORPWGWAnVZvJ31LXIRzgUEjnbCdzMUwslvoVC0c6mVltK+T
 KSTSGy6J/0/Z363f8gZoP/2qf85f+YMUsv2JJwEstuEE2kJrXbDFvAjAlA+3mA8gRAW/
 uMaJJqituouRiHMLjcY0MWvTyext8b31Gq9zC0mIwrTsbLvFoP9QwTV6+ygu1+/qQ3Gq
 Appw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1730539211; x=1731144011;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=kpGFODYS8j6Lc9OgDllYcnBQdgtbbm75EKILrrrUJdM=;
 b=oyIYiRpnvBp6q6SPwYcEvQfY7n8C3Rw4mWSueBPDD7e4rW4MS3xaOwHywERT7xLpEz
 Wb4MvBTvogFhztoBARYZSYOjtCnYS/nNrtYnnHj7XIg2yAsS5FL698m/LikY+TYnsxVe
 ZNoe+QBjFcjzVqF1LZom8ub/6s8xeUIW0rJJ21IX5lpkFbDEJelEW/8gvRs8Qfn5993e
 09tp46/OXyYykQKpjM44FLK43KJWSBPleeUapyR5rznsiQ1yBuPFH14a3BC+R86v3MZL
 pgl3ZExLEfZK5mM0CTvvLBWz9ITQU2Tspe8sCXFNYAiz/x67g0bYU9ZzgaNNS9xmhVfa
 O/dQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVLmScQvzAsqzOzmIBIHi3Myfx191K+v0gOAj+t9W2fqfOZ9YhH9NyP3FWuxhPTVqOoFBjaVZ61qEY=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwFlh/dEeobiM3jlzyYER/mN0KfPPCJKxAUw5vdRcVz6lgPGwP5
 LbAEytcpLRnUCBWudrBbuKVDl0r3EPpExWJrngjv7RIkrrDVjqW5
X-Google-Smtp-Source: AGHT+IFLReBsrRpmxL4vu2o+HK8LR5rKgVTw5Pae/xERGUN3VNDuKb5mCI4fypHiqCUe37x/W4d24w==
X-Received: by 2002:a05:6830:6015:b0:717:fe2d:a4e4 with SMTP id
 46e09a7af769-7189b4f40e0mr8772997a34.19.1730539211247; 
 Sat, 02 Nov 2024 02:20:11 -0700 (PDT)
Received: from illithid ([2600:1700:957d:1d70::49])
 by smtp.gmail.com with ESMTPSA id
 46e09a7af769-7189cccf736sm1089795a34.69.2024.11.02.02.20.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 02 Nov 2024 02:20:10 -0700 (PDT)
Date: Sat, 2 Nov 2024 04:20:07 -0500
From: "G. Branden Robinson" <g.branden.robinson@gmail.com>
To: Ian Rogers <irogers@google.com>
Cc: Alejandro Colomar <alx@kernel.org>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Jonathan Corbet <corbet@lwn.net>, dri-devel@lists.freedesktop.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-man@vger.kernel.org
Subject: Re: [PATCH v4 3/4] proc_pid_fdinfo.5: Add subsection headers for
 different fd types
Message-ID: <20241102092007.ixxtdc6u4iutxmam@illithid>
References: <20241101211830.1298073-1-irogers@google.com>
 <20241101211830.1298073-3-irogers@google.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="4bjtnlpbcduyzdoo"
Content-Disposition: inline
In-Reply-To: <20241101211830.1298073-3-irogers@google.com>
X-Mailman-Approved-At: Sat, 02 Nov 2024 22:14:05 +0000
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


--4bjtnlpbcduyzdoo
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v4 3/4] proc_pid_fdinfo.5: Add subsection headers for
 different fd types
MIME-Version: 1.0

Hi Ian,

At 2024-11-01T14:18:29-0700, Ian Rogers wrote:
> Make the sections about eventfd, epoll, signalfd, inotify, fanotify,
> timerfd better separated with a clearer subsection header.
>=20
> Signed-off-by: Ian Rogers <irogers@google.com>
[...]
> +.SS eventfd
>  .P
[...]
> +.SS epoll
>  .P
[...]
> +.SS signalfd
>  .P
[...]
> +.SS inotify
>  .P
[etc.]

I suggest deleting the paragraphing macros when you add (sub)sectioning
macros immediately before them.  In these cases the `P` calls end up
doing nothing.

groff_man(7):
       .SS [subheading=E2=80=90text]
              Set subheading=E2=80=90text as a subsection heading indented
              between a section heading and an ordinary paragraph (.P).
              If no argument is given, a one=E2=80=90line input trap is pla=
nted;
              text on the next line becomes subheading=E2=80=90text.  The l=
eft
              margin is reset to the value of the SN register to set the
              heading text in bold (or the font specified by the string
              HF).  If the heading font \*[HF] is bold, use of an italic
              style in subheading=E2=80=90text is mapped to the bold=E2=80=
=90italic
              style if available in the font family.  The inset level is
              reset to 1, setting the left margin to the value of the IN
              register.  Text after subheading=E2=80=90text is set as an
              ordinary paragraph (.P).

Regards,
Branden

--4bjtnlpbcduyzdoo
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEh3PWHWjjDgcrENwa0Z6cfXEmbc4FAmcl7scACgkQ0Z6cfXEm
bc5BFg//Q9uaGXm0MGnz6aClftEXxT5cINEJIJq4ZOtnAqBKeSw5QBdlvDiPIMPr
Rv9yHC5rz5Ha6STdxQCX6feI2OImonRaWx8ZCl92h3U03Wxhw686lBGSfdHdwJqe
6sqMDyIVILx3oqnWkuqfs/SIKRkmbVBacBo0x6KSOglbHR/Swa9qEMtmyJzrnxzJ
PJctPqWtxv8Zd8+zNc1caOG3ckeLwnNtUeoVC4iOe3hFdSE3XBnm5hM0UbGFSYjG
AHcfRD3C8QsQYO+F9ikevajUwijcCXmyoQ6Pe85qqSL6Fcn1u7HHA705NEomDDD+
Bfn3S5txZANBc1IxGqc7CKnUy3MuoIYP5bmoF8VTje3crBCBaNqg610F8FfaLPYj
KR6mx29956y5GnfhAsYWx1nyNio+6KaBHXL9qE80Fwq4+s3V8UJT+Ii4jRd1cnI6
JXNMfdjf82P4gKeDLi31LsYUHxO/paq0gVLerw8YPtJUiozjM5QxbnvCCSx2zKr8
L7syuSsFt7VVQyJyY3REHT35LTxcNx7h/QRnXxlvM8lVLDzHcGegsk5lCCf2OMyg
YjCFZihestXdMtn74kSArBWGjjqW4Zu5gojc6dMXp5pC+JzeGxhzWFN6iFGPFgUH
LTQimXt367vOAdi9XpoaaG1FkZHiXXlMLcHbq315rctNKdsJAl8=
=14Tv
-----END PGP SIGNATURE-----

--4bjtnlpbcduyzdoo--
