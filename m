Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EFDD0AFDD8C
	for <lists+dri-devel@lfdr.de>; Wed,  9 Jul 2025 04:39:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DA37510E204;
	Wed,  9 Jul 2025 02:39:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="l9g7tZU/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com
 [209.85.214.180])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C0A2910E204
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Jul 2025 02:39:10 +0000 (UTC)
Received: by mail-pl1-f180.google.com with SMTP id
 d9443c01a7336-235ea292956so44991025ad.1
 for <dri-devel@lists.freedesktop.org>; Tue, 08 Jul 2025 19:39:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1752028750; x=1752633550; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=2MFpJWPU8CWzunTAGDSW4LfrQNGdoBGczN7wNls5VGE=;
 b=l9g7tZU/pq2xOK3Mg2tsotvl6Y+cLRDlfgTu3h4a2QTbZTI9RKoWlgcuDgWq+0WvHs
 FBQ/VpNk59oZCqNEMNYKbmVB0se+M2+YQ7qwfdw619SYVl/sx4tuHuIzbOvpN1hSXeEw
 8IBG7OaFXE8BpEVBsy8V58Ze7UwhbkwlaBXXDZJWcYq7MTlrbkc8cGu6S10atMPq31hw
 zQUIBjTb6ZRrSRNhCo98WWaTlecwDtS5EcQE4EaY0nd0/SMYmib69o7jb63/lhETuuBi
 bBTQu8UA/xMde4n0QNEIrm8VF8q9VMNh7TwZLCMVepUC5g63kSI5Rn6G25+ouyHnHORK
 FuEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752028750; x=1752633550;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=2MFpJWPU8CWzunTAGDSW4LfrQNGdoBGczN7wNls5VGE=;
 b=WI6IU+lzhcgVMn0MJF7yzoqswxqpCxQwDR1eihVAyeGx9krccu+PA8s6DNmBUkAeiY
 eIU8nls1Flz9m/c04svuA2KZHOUk1Zdk6y7gIaxoD5K619pf/F1w7NyCirObLkkoK3KD
 mSmcWnqwP4YC5de8SVpFl+E8xr5rEfmmS+UQyTgGTXWC0sRTePVmnIjREJHLWsK8oGmW
 fqVbYooQ3UpSsTnPdUQgaaheMWHguKzC4tcUfCSbWhakDQ5lr301l3FoS5QKAbDWPTtr
 RJPbJ9boeCocWWiIZto4MddkZhVPjAkkAkQW3m4pJ8UdV2FJrcdr3D+YPlFoYtEUJ06h
 Nthw==
X-Gm-Message-State: AOJu0YwvYBuRw9oUYzAe9Zi2uLykyabSvtdlza110fxPV2ziONfglUKM
 iqAo8wwNHel5d/wfvvavnF92ewWL+xhyWzqnMh0Ss72gaLF56SJZHty+
X-Gm-Gg: ASbGncvghwu82epeLI8D3B8mjMzud01tHoyx/ThsRTZO2vy65liLt4a5T6LWUImIh1l
 AGnryeB31rrs6dFmimf062cqorI+x8tSYMJFZ9JPaTBMkrUbw8h9K2/BSR4eU4R2I4gyZ1jrPPG
 nHqLvHHsbkq+KUTSpvfstKf4YJv/6kSridBt0uu//dfGTUf40ewQDyyCt4BCmGC2drJOcrombaM
 +HAS+/Xg+zIFn/+5LxAogJ08GEai6jt6o0D24edSUmWB8K69eFGykZznylK1nLA+hYGFZDY4mk8
 MXT1H1gskzof+x5DD15qaock9t2rGRPfY9Y6m+YTnRkODDek++YLCO9gpDGs/Q==
X-Google-Smtp-Source: AGHT+IFV7ath41Z2eEX5xWp8myyzeoBzOnPw7Ec8aWL3qv3ukG4ik7ICren+k5mAPFXPougQ9dJ1lQ==
X-Received: by 2002:a17:902:f64c:b0:234:d10d:9f9f with SMTP id
 d9443c01a7336-23ddb30e308mr13855485ad.40.1752028750055; 
 Tue, 08 Jul 2025 19:39:10 -0700 (PDT)
Received: from archie.me ([103.124.138.155]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-23c8434f06fsm125798655ad.87.2025.07.08.19.39.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Jul 2025 19:39:09 -0700 (PDT)
Received: by archie.me (Postfix, from userid 1000)
 id 4C012410194B; Wed, 09 Jul 2025 09:39:07 +0700 (WIB)
Date: Wed, 9 Jul 2025 09:39:07 +0700
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: =?utf-8?B?QW5kcsOp?= Almeida <andrealmeid@igalia.com>,
 Stephen Rothwell <sfr@canb.auug.org.au>,
 Linux Next Mailing List <linux-next@vger.kernel.org>,
 airlied@gmail.com, simona@ffwll.ch, Raag Jadav <raag.jadav@intel.com>,
 Krzysztof Karas <krzysztof.karas@intel.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 kernel-dev@igalia.com
Subject: Re: [PATCH v4 3/3] drm/doc: Fix grammar for "Task information"
Message-ID: <aG3WS3pEsJsZVbOF@archie.me>
References: <20250704190724.1159416-1-andrealmeid@igalia.com>
 <20250704190724.1159416-3-andrealmeid@igalia.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="BP0hOY7hk3PGD1j7"
Content-Disposition: inline
In-Reply-To: <20250704190724.1159416-3-andrealmeid@igalia.com>
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


--BP0hOY7hk3PGD1j7
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jul 04, 2025 at 04:07:24PM -0300, Andr=C3=A9 Almeida wrote:
> Remove the repetitive wording at the end of "Task information" section.
>=20

Looks good, thanks!

Reviewed-by: Bagas Sanjaya <bagasdotme@gmail.com>
=20
--=20
An old man doll... just what I always wanted! - Clara

--BP0hOY7hk3PGD1j7
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQSSYQ6Cy7oyFNCHrUH2uYlJVVFOowUCaG3WSwAKCRD2uYlJVVFO
o9jIAP0d1DLbaozD7zuUrBvyw1KGHqGkDsCNoDIDdihdmWcChwD/dY1+06nHTlr2
5HGf/WRMm48Oz8YYzpiq9c8wFT7zpQE=
=qpdP
-----END PGP SIGNATURE-----

--BP0hOY7hk3PGD1j7--
