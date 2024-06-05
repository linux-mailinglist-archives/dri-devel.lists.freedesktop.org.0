Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 327038FC6C7
	for <lists+dri-devel@lfdr.de>; Wed,  5 Jun 2024 10:41:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B242C10E70D;
	Wed,  5 Jun 2024 08:41:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="C7/Qo0/R";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0ADE310E70D
 for <dri-devel@lists.freedesktop.org>; Wed,  5 Jun 2024 08:41:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1717576909;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=MolOpd+X/Tdlm36OdJDp9C/sjI+byqObbpPA7PI2Lwc=;
 b=C7/Qo0/RNg8/z1z8zda3Uwp1nAIe67TYMrpN3sTs2XTV2S7uk0uoWTIhjup3NUcoB8Tolo
 1rDvol4YuPDaajgolEnd7JEPcbWPAk4FdPklHShjtxjviTcLGGW7cCxdr6zoU1kBVYTN7S
 mbuJ69rvsawyOVq514y7PFd/278BxDs=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-180-MAYGy_9lMzWQQ9ZFldzx_g-1; Wed, 05 Jun 2024 04:41:40 -0400
X-MC-Unique: MAYGy_9lMzWQQ9ZFldzx_g-1
Received: by mail-wm1-f70.google.com with SMTP id
 5b1f17b1804b1-421388f1deaso15986175e9.3
 for <dri-devel@lists.freedesktop.org>; Wed, 05 Jun 2024 01:41:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1717576899; x=1718181699;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=MolOpd+X/Tdlm36OdJDp9C/sjI+byqObbpPA7PI2Lwc=;
 b=AVJ/bLyHGmDGKIRmYAKLjcvxTjqbAcmZeLikHnBJQt95SH1ITMjxUK36HAUUnOaD1I
 XxASn2qnQFx0w5QLMZenTe2qPUAbbx9DGiP6pWZBXzYM7E+LSMp1LjxNsUw8/gYnjKKY
 UFxdLSm2cMDRIm6Viywsh08PefWxY1Vg4XYm4nh3ZCi4PRZktvaZ8YY74oq8sxAFZvCX
 JKUX9A6vwGu3HWvllQFYOS09xRhCjQMDkzvCfFxuf4dKRMCqgtzF71AuEzT526II4Hx4
 53LxtOoHKuEKkgGAPrb6bAGUI5Zu2qhDghdmr06ndr1IDDpY7E2fyDvtTKzv37KgHgpE
 ln2w==
X-Forwarded-Encrypted: i=1;
 AJvYcCWy8mzw+O4/N/yDrNWihe4sO5quAQuorUSs8z6XtFy+atSva1GH2qWNnwceRHeswf1F2+YKC6Tcmy++EnpuYBtqKpI9DIj3u5nRo5g3BeS+
X-Gm-Message-State: AOJu0Ywob24Mn+psddSi4EiEJDnWeKsthvhjVn9QU63KVfCFbm8WOiQD
 TtWgU49/G3ESIBtdEwjCDFUxpVyydLA4boeLpSMnEIeJwyTepNmj4C5tP4L87+naIPkHW06ZToB
 lTnKw9aEFoq8tSdbSZN/t5wq89uJ5PXuf6dDa5RbroP5IGlQwzGDrIFyfGd5bRYi3Lw==
X-Received: by 2002:a05:600c:a01:b0:421:5927:e8cb with SMTP id
 5b1f17b1804b1-4215927eb54mr4881565e9.18.1717576899090; 
 Wed, 05 Jun 2024 01:41:39 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEDlRMyH6mlD+F6NF8A1N0ojDNsJLYbksbiQqJ37WWiEk6wmC1re6EpP8oNW1UbdkX047q2Aw==
X-Received: by 2002:a05:600c:a01:b0:421:5927:e8cb with SMTP id
 5b1f17b1804b1-4215927eb54mr4881315e9.18.1717576898550; 
 Wed, 05 Jun 2024 01:41:38 -0700 (PDT)
Received: from localhost ([2a01:e0a:b25:f902::ff])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-42158110cb7sm12426145e9.15.2024.06.05.01.41.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 05 Jun 2024 01:41:38 -0700 (PDT)
Date: Wed, 5 Jun 2024 10:41:37 +0200
From: Maxime Ripard <mripard@redhat.com>
To: Iago Toral <itoral@igalia.com>
Cc: Tvrtko Ursulin <tursulin@igalia.com>, dri-devel@lists.freedesktop.org, 
 Tvrtko Ursulin <tvrtko.ursulin@igalia.com>, kernel test robot <lkp@intel.com>, 
 Jani Nikula <jani.nikula@linux.intel.com>,
 Ashutosh Dixit <ashutosh.dixit@intel.com>
Subject: Re: [PATCH] drm/v3d: Fix perfmon build error/warning
Message-ID: <20240605-prehistoric-elegant-kingfisher-6dde6a@houat>
References: <20240604160210.24073-1-tursulin@igalia.com>
 <c8068a859b5c126cf7300143abe243361a0bae67.camel@igalia.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
 protocol="application/pgp-signature"; boundary="vh7nqyqqoth6xdga"
Content-Disposition: inline
In-Reply-To: <c8068a859b5c126cf7300143abe243361a0bae67.camel@igalia.com>
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


--vh7nqyqqoth6xdga
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Wed, Jun 05, 2024 at 08:19:34AM GMT, Iago Toral wrote:
> Thanks for looking at ixing this Tvrtko.
>=20
> El mar, 04-06-2024 a las 17:02 +0100, Tvrtko Ursulin escribi=F3:
> > From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
> >=20
> > Move static const array into the source file to fix the "defined but
> > not
> > used" errors.
> >=20
> > The fix is perhaps not the prettiest due hand crafting the array
> > sizes
> > in v3d_performance_counters.h, but I did add some build time asserts
> > to
> > validate the counts look sensible, so hopefully it is good enough for
> > a
> > quick fix.
> >=20
>=20
> If we need this to go in ASAP I am fine with this patch as-is, so:
>=20
> Reviewed-by: Iago Toral Quiroga <itoral@igalia.com>
>=20
> With that said, if we are still in time for a bit of iteration may I
> suggest that instead of hard-coding the counters we instead add helper
> functions in drivers/gpu/drm/v3d/v3d_perfmon.c that call ARRAY_SIZE on
> the corresponding array based on v3d->ver? It is fine if we prefer to
> merge this as-is and do this change later as a follow-up patch.

This is blocking the merge from drm-misc-next into drm/next at the
moment, so I'm going to merge this patch as is so I can send the PR
tomorrow.

Your comment looks fine to me too, so feel free to send a follow-up
patch to refine what's done here :)

Thanks!
Maxime

--vh7nqyqqoth6xdga
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCZmAkvQAKCRAnX84Zoj2+
dgZZAXsFYDjc/flwiNHRplEReJFg6Obgbiajpl5Emgspb48b4Bi5UurukJ4DY8sg
xrkaTGMBewZ0UzUGagb+DcH4VS/xaJsowgU/afbxv96Zp9nPlsFo9suTbLbBYlqF
6WDrx8QC4A==
=pkDS
-----END PGP SIGNATURE-----

--vh7nqyqqoth6xdga--

