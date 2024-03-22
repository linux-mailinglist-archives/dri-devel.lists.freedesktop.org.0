Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1351E8869CA
	for <lists+dri-devel@lfdr.de>; Fri, 22 Mar 2024 10:55:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8046F10F0AE;
	Fri, 22 Mar 2024 09:55:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="An/EFXdM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 232D910F0AE
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Mar 2024 09:55:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1711101340;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=vo/L3PCMtanLu2TJZTNwXbvQfetWwP+AkuBpjYG20CY=;
 b=An/EFXdM+ZbTom+06eQ7/3ntOeJyycGVCHBCl8XL/uFmNiedSJj5wbrKSdrc4KKIxzE5Od
 6F4yYrvwFG8+n8+XNdFTKQ4SXH/picStDcBFD0Cc0fCMmpwP5QPzYM+ntSXqu+Hw3gSqhm
 pnmDn8CgfRai61eGWZBBRkIHphaEr8Q=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-601-efWhmEFiOoaLse0XzTdVdA-1; Fri, 22 Mar 2024 05:55:36 -0400
X-MC-Unique: efWhmEFiOoaLse0XzTdVdA-1
Received: by mail-wm1-f71.google.com with SMTP id
 5b1f17b1804b1-4140f58ac00so11842155e9.3
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Mar 2024 02:55:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1711101335; x=1711706135;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=vo/L3PCMtanLu2TJZTNwXbvQfetWwP+AkuBpjYG20CY=;
 b=rmQYyQprmvs1X1Sk+d3DqTDtuM7mUS2W+XTMRKV+pByakTRitUN9V80cG1/Y/jaEzL
 YAZcuLE9KBym7va1GUIOelrjbEeMONDQvY6TQRMYm5rlHCaYAZd0kk6MKeqIEC2Sm/NA
 ncVmavtHMyJvq49xKw6ln1K4WvTcDutbcNFdA/e3yREf7UkUk72tNoh8CfaLQqbxAwSD
 96uJ7BPWbJHtiOVtOvxsbtdq3wBzqaKEWHkNwcXkiLgijvnq/NjPS393/6mWqQ9TAQki
 O6m8MGSRXt8SgjR/ajG4qFnIQjIfL9NWggrQENFf7B8gFCusbQ+dSdSc22hSmC6y5Z3E
 E0yg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVHF2HYyocRvRE0eVngiWcVomPKamakTpX6THqjogRurzlFMQqcaBPcbYUFr9r9ARUwTBJWlmepciERtNcd1/9Ryx5Cnuxzh58TH+K7Keb+
X-Gm-Message-State: AOJu0Yw+m+qSL/VKpnG+hvx6wny7m2YNCF0sL7jNQkFJ3akFvS2vhbHl
 gcd4eBUxP/XJpTj7CN4fBaySKMMe4EfYxlk6clLenZ+qJgGNl7OyNAKsyebbZSnlMzhFRwFr4xE
 0HdH7rRLMK5gjRi9spTNarZNKsGYv6Lubtzrt7FUA7Aw2PSOJXbCwMCs32MEPzroLjQ==
X-Received: by 2002:a05:600c:524f:b0:414:113b:36a6 with SMTP id
 fc15-20020a05600c524f00b00414113b36a6mr1186559wmb.25.1711101334845; 
 Fri, 22 Mar 2024 02:55:34 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGg/h7b5xnDKSo4gtbJWuasREGSAYbEF2+V9h+/dUOcDuMToHsBM1B7l/0LDXtt7umgouxxoA==
X-Received: by 2002:a05:600c:524f:b0:414:113b:36a6 with SMTP id
 fc15-20020a05600c524f00b00414113b36a6mr1186532wmb.25.1711101334272; 
 Fri, 22 Mar 2024 02:55:34 -0700 (PDT)
Received: from localhost ([2a01:e0a:b25:f902::ff])
 by smtp.gmail.com with ESMTPSA id
 fc18-20020a05600c525200b00414105c4cd9sm8362519wmb.21.2024.03.22.02.55.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 22 Mar 2024 02:55:33 -0700 (PDT)
Date: Fri, 22 Mar 2024 10:55:33 +0100
From: Maxime Ripard <mripard@redhat.com>
To: Sean Nyekjaer <sean@geanix.com>
Cc: yannick.fertre@foss.st.com, raphael.gallais-pou@foss.st.com, 
 philippe.cornu@foss.st.com, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 dri-devel@lists.freedesktop.org, linux-stm32@st-md-mailman.stormreply.com,
 Martin =?utf-8?Q?Hundeb=C3=B8ll?= <martin@geanix.com>
Subject: Re: STM32 DSI controller driver: mode_valid clock tolerance
Message-ID: <20240322-brass-magpie-of-teaching-9cbff7@houat>
References: <4A53A669-C3AF-4D29-B5A5-0F7FEBA79045@geanix.com>
 <20240320-berserk-soft-crab-70d22c@houat>
 <2A220F57-5DD2-4F28-9328-547A04185D3F@geanix.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="rp7u3xpfvn5q7kb4"
Content-Disposition: inline
In-Reply-To: <2A220F57-5DD2-4F28-9328-547A04185D3F@geanix.com>
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


--rp7u3xpfvn5q7kb4
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 21, 2024 at 09:47:18AM +0100, Sean Nyekjaer wrote:
> >> If HDMI is requiring a tolerance of 50 Hz, would it be better to do
> >> the check in the HDMI bridge driver?
> >=20
> > Judging from the code, it would be hard to do because the clock that
> > generates the pixel clock isn't exposed to the HDMI bridge.
>=20
> What do you think about Raphael=E2=80=99s proposal to add the tolerance a=
s a
> device tree option?

I don't think it's the right solution, for multiple reasons:

  - There's no way for OEM to come up with a decent value;

  - That value isn't platform specific in the first place;

  - Allowing any value will create troubles somewhere else in the stack,
    for example for applications that rely on accurate vblank;

  - We could come up with something that would make this entirely
    irrelevant, like being able to come up with proper drm_display_mode
    based on display_timings and a given clock rate.

So it's a software problem, it needs to be solved at the software layer,
not in the platform description layer, no matter how convenient it is.

Like I said, VESA DMT and CVT specs use a .5% tolerance and it works
quite well for panels too for other platforms. Just use that and see if
it's still an issue.

Maxime

--rp7u3xpfvn5q7kb4
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCZf1VlAAKCRDj7w1vZxhR
xaFOAQDKiKkMqulyFswAi+droFD84pxIoT6ueIzkm7W7ZLCtKwEAvw5ciGv/GTA/
wM7izR039t7Wi6kVqWxiDb/R8gQHWAI=
=MX70
-----END PGP SIGNATURE-----

--rp7u3xpfvn5q7kb4--

