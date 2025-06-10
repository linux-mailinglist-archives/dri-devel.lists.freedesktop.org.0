Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E6079AD312D
	for <lists+dri-devel@lfdr.de>; Tue, 10 Jun 2025 11:05:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D13F810E4A1;
	Tue, 10 Jun 2025 09:05:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Ty/jLyKx";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com
 [209.85.128.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A5DCF10E4A1
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Jun 2025 09:05:35 +0000 (UTC)
Received: by mail-wm1-f42.google.com with SMTP id
 5b1f17b1804b1-450dd065828so34952335e9.2
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Jun 2025 02:05:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1749546334; x=1750151134; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=KL/uDixEO0uqaMR1zfvj+/xR4Xa0bhl0UH5rBFHnnxg=;
 b=Ty/jLyKxVEfohqU/Jn1VKwAXwUEsQofsTJiwqprFD77jwP9dsYJrg9Or8MTVmxOJZb
 nhSALQVyKuTNyiN69ldeZet89f7516rGId+oMufecsPdBb6/FOlEgdfCPXg0RnCYXJyV
 lCigEsUWGep4K6tvW5k9A5c6GFzUC98C89GTF8WswjzWmIGmMxp39cB6z5MemyxZiNWV
 an/KvWgP5chah1ysRNdpP7CagAI6vEYyyWAo9segrRfNsaUKl4M5H65zi0JWhScG+ak5
 eqw4DzsU4pY4XzQDGPPVYbn2u/8+Z0IqbyNhPH6xPqQrbp7pcaiRGA5Kn2RGyOhNmwMK
 yY1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1749546334; x=1750151134;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=KL/uDixEO0uqaMR1zfvj+/xR4Xa0bhl0UH5rBFHnnxg=;
 b=tIGByeiyr7uDZeUO/r5yKelowzIgvYOUEpqJR7ixeSZtEwOC6U+ZjCOZw/QeNtOAfC
 jAJfpdAPgQB8MvPlLcebwxAfhq4qpXRxj++YyN9WPvhe3p4p/DZCMZCQozTc9aTOjpVE
 ToZg3GcGi3oTeqxtLM2KvF7G2AXxzB0LzDXmZEth2C7KXQDPlRzM/Zfu637TNslM2NaE
 W4+DjKAMQLyUlNPuJlkZo9rAAKXDo2R5yATgtnpwpJqPeAyXL5GqDZlAXP4pUIsZlRrD
 Wps+r2mzKTgS33KTZKeP3RViwwGNShj8LGKq2IS2YzcwQY3xpYrZARJCoXKm07BcjaOJ
 WNWw==
X-Forwarded-Encrypted: i=1;
 AJvYcCV5uT1afT/vCU8g2X8xYAcplUAL2ZDqJyZskSVnmhwZwIoDquQwqkbGnJmBGhJGd1cKg8XJ6YzssKQ=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxvOSpBX9W0rrM9t2EgznRNWymkB6xeiGBG1v7sbNxJmr1Zweaf
 hUgyxPqML+0EBVSugKdtzZ7spduMgtsDakEhU//PsRy/saztZ3IdwRPK
X-Gm-Gg: ASbGnctPanlZBNkmx2QytuNT1QUiAlPmDiBtoE32c63Xjns7IffX4VS1hXkm7hMwmXf
 g+e/EJ0rummm00k6k0/QwNjilnkR2VB11UMoG6De7eEcWD0xmErd7KLhWkcq3zwu89hW6ZPgPAp
 9fS2unMlyw2Ri+vq81DjP9JijffUHBXuK5ViyUyhwktrZsRuYhIp6H5LpMm2lTFDuz3yunJIbB0
 tvWhG2C8CzftR2c6WWLzqKR3r4FF8qHd8Jo8r3s/5xp4+0rRirWcqlaxY7Ubag7XqRpI+DW8E7A
 yKahzxylOj3RlkbUIkVSJTMaYzeOxACbKpOsm9ynuihElJJagi5fF8jCYzhpsOnVMfIF5M+Ap41
 lFLHndJsagPXuioE4DVU+u5vmeQis6RBRjcb10IelCsIvEDq8
X-Google-Smtp-Source: AGHT+IEgPNecmjzb+Ctnp0wqP7s4JFIXLpI2LAR/XRW3fHpThmYO53BTNRvoSuaQcH3XtZR/LG9fTA==
X-Received: by 2002:a05:600c:1c99:b0:44a:b793:9e4f with SMTP id
 5b1f17b1804b1-4520143724fmr122630355e9.19.1749546333563; 
 Tue, 10 Jun 2025 02:05:33 -0700 (PDT)
Received: from orome (p200300e41f281b00f22f74fffe1f3a53.dip0.t-ipconnect.de.
 [2003:e4:1f28:1b00:f22f:74ff:fe1f:3a53])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-45209bc6c6csm135308205e9.2.2025.06.10.02.05.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Jun 2025 02:05:32 -0700 (PDT)
Date: Tue, 10 Jun 2025 11:05:30 +0200
From: Thierry Reding <thierry.reding@gmail.com>
To: Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>
Cc: Mikko Perttunen <mperttunen@nvidia.com>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Jonathan Hunter <jonathanh@nvidia.com>, Philipp Zabel <p.zabel@pengutronix.de>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, 
 linux-tegra@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH 0/3] NVIDIA Tegra210 NVJPG support
Message-ID: <mz5sytol6aw7ouwiimmrd7lqhtvq6nj7pqpxq4ie6em6nwvvkh@2cux3no33gre>
References: <20250606-diogo-nvjpg-v1-0-5f2c36feeb39@tecnico.ulisboa.pt>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="qrycf46pmvsbxq6v"
Content-Disposition: inline
In-Reply-To: <20250606-diogo-nvjpg-v1-0-5f2c36feeb39@tecnico.ulisboa.pt>
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


--qrycf46pmvsbxq6v
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH 0/3] NVIDIA Tegra210 NVJPG support
MIME-Version: 1.0

On Fri, Jun 06, 2025 at 11:45:33AM +0100, Diogo Ivo wrote:
> Hello,
>=20
> This series adds support for the NVJPG hardware accelerator found in the
> Tegra210 SoC.
>=20
> The kernel driver is essentially a copy of the NVDEC driver as both
> engines are Falcon-based.
>=20
> For the userspace part I have written a Mesa Gallium backend [1] that,
> while still very much experimental, works in decoding images with VA-API.
>=20
> I have been using ffmpeg to call VA-API with the following command:
>=20
> ffmpeg -v verbose -hwaccel vaapi -hwaccel_device /dev/dri/renderD129 -i <=
input.jpg> -pix_fmt bgra -f fbdev /dev/fb0
>=20
> which decodes <input.jpg> and shows the result in the framebuffer.
>=20
> The firmware for the engine can be obtained from a Linux for Tegra
> distribution.

By the way, have you tried running this on anything newer than Tegra210?
Given your progress on this, we can probably start thinking about
submitting the binaries to linux-firmware.

> Due to the way the Gallium implementation works for Tegra
> the GPU also needs to be enabled.

I wonder if maybe we can get rid of this requirement. While it's
certainly nice to have the GPU enabled, there may be cases where using
only the other engines may be advantageous. Originally when I had worked
on VIC, I was looking at how it could be used for compositing without
getting the GPU involved. That's something that Android devices tend(ed)
to do because of the power savings that come with it.

Anyway, not a big deal, depending on the GPU for now is fine.

Thierry

--qrycf46pmvsbxq6v
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmhH9VoACgkQ3SOs138+
s6GCFA/9Gql524NDm3mA8nM/2jhyFLLx/IoLsmG28ioRNfL5u0WW4uB1jK5czjpa
tUJTMDIDovZi97kH/afurMgNdd9QYZCe1Zk50Jpx+wIMegsAhd1yW3/PLneWGRpw
nZU6D/Grk6sac7JLqC0M/WMf8lNjtL23uxeMzCbghOB9oNaM90cp8ueMJlJOBpWN
PNbZdCwnTxs9ov1zGqFyFZ+jjNDbOYE1b0Ltquglf4eUI+u8PXa3Xbc32z/Tx8T+
MP4fXcH+MFem2XcW+RDmoMD4FAkocbGPIYiv1755zwrzkuy8HwYr7bQsX9CB1mf/
ywoKbfac2tUej1uYT2ETVydHv7MQ8HX9Vb+ITOj/cJBY0qa5inVMN/6eEtT6Yig4
3nIbkCPW1alBcPYt1SIfIuixYIApDgexDMQlvhJBo3wNTeDcI/10hoAdD2E2A7np
i3bl9Vj+t2vCRhMwZt5dofNsgcQDc55prb59gLcHYdDO6AldIYtVpFRsT7YH+QW4
Bpy6+lWOCEvPLdbDM249AFTCzc7V+nzHALp9gjL0lDq6Jn6aqMFrUUubwIOHVmNP
MxlKFzv5aVqVwA9kPUCv80QGKksrb2DB7yEBTvL0H1V2V0QOMiO+2k5f/FFNpAVj
2LazjJB/ivKVWAkD/5TK8tLUpsGLSpNu3kf40T7PZ0CkWG5uMJc=
=0cjH
-----END PGP SIGNATURE-----

--qrycf46pmvsbxq6v--
