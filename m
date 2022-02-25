Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E6A14C4171
	for <lists+dri-devel@lfdr.de>; Fri, 25 Feb 2022 10:30:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A333789BB2;
	Fri, 25 Feb 2022 09:30:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com
 [IPv6:2a00:1450:4864:20::135])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 213D589AAD
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Feb 2022 09:30:26 +0000 (UTC)
Received: by mail-lf1-x135.google.com with SMTP id u20so8385799lff.2
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Feb 2022 01:30:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=5AzSht2nyeyY1UVfwN1DSU/s7HgEVJ2AdBOgPEuvAS4=;
 b=W7dBn+KZvH/dwbC5M82ju8KQZO9rpK6NjiO2mKISrctDmuhwUxmuFO+/h4DS12WgWf
 I9a5z/5L/kiozkUxjDZPY//qN5cCge8x6u/GrHeXx/ORDpCIGc3Iaqrf+EYo6xQKVFi5
 6HoJt0B5h00do6rhuI3cj9ZcnuqSzG6QP6zbSGGjcemGz+oAs7eRqRa/8FHK5PhTu0+g
 /wzIBDv+s3ESTHOVsKCyjmrmgqU4Iyv8G0mE/7TRMM5xNS8LmIQTOmh7AwiFYILrVzFA
 ioFVEqpZkPTOT55mLZYJHm3VV+mOiSQA4wAOH3zP9FUeJxgo4i/3JuvKN8KCdHFk31Iw
 eCwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=5AzSht2nyeyY1UVfwN1DSU/s7HgEVJ2AdBOgPEuvAS4=;
 b=p7iFUPnGzmK1FfpijtnCc/RYGpR16QglIyEcFVzMEcNluFJibxq/RVv3uHkHmBMxuK
 PwvLlFaHg/DAlphqmeJssFC3Lr3NNelK2KkDKKBGJTpoKHF8xtXyUSB8e5GTMraxGcZG
 sMkr/2PzAI5YhBlJ6okXG39otwmhaXTQNmMtDwgIV3xn0TaMxg3401cU4OP/gZ6JNcwW
 RyBAJfW0fUnoudPpzaUd2eb7VT4fx1vThnZAmu8n8cKI7IBDIaP75NKkmNn2Itf4yDoe
 yziYsUXR5xBWXZYGnQqMuKV6iONH2tR0Xand/dMnXXd6blbNdr0MIExFM04sNTttw3ea
 KRmQ==
X-Gm-Message-State: AOAM531L2ax4q3UN1gWb9bdepcRXBau+TtEBG+k/teGT0kdkEhP7kFtv
 /DoKtDihtCVItppVslkPNOU=
X-Google-Smtp-Source: ABdhPJzqjAQkDVhMqvwqNRM/3Gi5fq3FONQyGaq9x87//cjXPx8Pce+JQEZ8Gw8XTdlydFrpW1TTCQ==
X-Received: by 2002:a05:6512:3a95:b0:443:1624:3be1 with SMTP id
 q21-20020a0565123a9500b0044316243be1mr4304250lfu.355.1645781424140; 
 Fri, 25 Feb 2022 01:30:24 -0800 (PST)
Received: from orome ([62.96.65.119]) by smtp.gmail.com with ESMTPSA id
 l9-20020a2ea809000000b002466c11ee8asm212995ljq.77.2022.02.25.01.30.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 25 Feb 2022 01:30:23 -0800 (PST)
Date: Fri, 25 Feb 2022 10:30:19 +0100
From: Thierry Reding <thierry.reding@gmail.com>
To: Kees Cook <keescook@chromium.org>
Subject: Re: [PATCH v3 0/2] drm/dp: Fix out-of-bounds reads
Message-ID: <YhihqzqPW7qbYnB9@orome>
References: <20220225035610.2552144-1-keescook@chromium.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="akPJIWxgBZHniLnc"
Content-Disposition: inline
In-Reply-To: <20220225035610.2552144-1-keescook@chromium.org>
User-Agent: Mutt/2.2.1 (c8109e14) (2022-02-19)
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
Cc: Douglas Anderson <dianders@chromium.org>, David Airlie <airlied@linux.ie>,
 linux-kernel@vger.kernel.org, "Gustavo A. R. Silva" <gustavoars@kernel.org>,
 Jonathan Hunter <jonathanh@nvidia.com>, Jani Nikula <jani.nikula@intel.com>,
 Uma Shankar <uma.shankar@intel.com>, dri-devel@lists.freedesktop.org,
 Thomas Zimmermann <tzimmermann@suse.de>, linux-tegra@vger.kernel.org,
 Dave Airlie <airlied@redhat.com>, Ankit Nautiyal <ankit.k.nautiyal@intel.com>,
 linux-hardening@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--akPJIWxgBZHniLnc
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 24, 2022 at 07:56:08PM -0800, Kees Cook wrote:
> Hi,
>=20
> I'm sending these again, as they still need fixing. They have been
> rebased due to the drm_dp_helper code being moved into a subdirectory.

Yeah, I noticed the other day that this had been partially reverted by
the DP code move. I've applied this now, though it didn't apply cleanly,
so I'll do a couple of test builds to make sure my resolution is correct
and will push this out later on.

Thanks,
Thierry

--akPJIWxgBZHniLnc
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmIYoakACgkQ3SOs138+
s6G6ZhAAwXanqGZpI3dY+3mEMff9651PrD8RgficbLnWLnZXd1JsRFE0vDHqaKUL
WzxwaH+ctqQHXe+f7VTcypE+IV3iZ5cwe7AzEco8kg0wz4i3PesAc7XstmM3FTJA
FjGbOrUh2XO3epk/lmDyOQz35rNu9nU2ptJiavk+E+zO+KhRV7u7s4WyGYFlIi0M
y4dQl1IAgF9JaLU57yQ00EuyCShPdyUaTDE0Ow1AVMADWXZ81t+0enV+vO16Z0Gj
Nm7+gBKg+o6m390BYZYRq8cAxuTW2Hqlu4SEvTQGI899o8AtXe9oqE8lVGAIQQ5+
LAIV2IgyIGXA9S84CMkP6CLIZDDl24ppVGHtgrUD2GDiMdPYkjo4CuD/bviRzrNV
3+IbBOjusGycgXp4GJ735h+eq9HMBSqoaQLeMY6BPj9jbzwAfV3IyPbHSRAHE/ii
VzGG0iBPkWJ0P7+y1iuZAzZPv1Cd/k8+dXzxnsap9D3JvfKCvI/uUrQV5FCtJ7Fl
txdz7QeDI/TFEcov63wLVZoVJMTNkmdujKkagmrwtokdDMBGwb8gQX+RJI7GIFje
Mpc+ZjLNzs5NpsVfRRH9h6lks5Sk8u2cNv9lzf0UnnPYYKXie0gtIwspniQi/naR
TYTZh/Hy91tS88lH16DKwgodoSc9EnrU2d9xT0ykcccQg9GyNRo=
=tyf3
-----END PGP SIGNATURE-----

--akPJIWxgBZHniLnc--
