Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 85A0B964A8C
	for <lists+dri-devel@lfdr.de>; Thu, 29 Aug 2024 17:50:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 00DBF10E70E;
	Thu, 29 Aug 2024 15:50:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="h9b17IuI";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com
 [209.85.221.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 73CB710E70B
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Aug 2024 15:50:23 +0000 (UTC)
Received: by mail-wr1-f44.google.com with SMTP id
 ffacd0b85a97d-371a9bea8d4so511528f8f.2
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Aug 2024 08:50:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1724946622; x=1725551422; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=rJ1E1FSn9EnVE2v1a7jxMaJli1rgUUJqDUz/uJFASzk=;
 b=h9b17IuItrSHAYIR8v1m/KhA8FGN3kv1/7renL20lPMaRSyf2xpCSrKAUeTgmUGlkX
 RyZy7xDpAEJOazVQK+bIahPF1RFVvaGsC5laW1ofN4eo4zeOQzAQ9/NDE5FdAMQRJOoa
 lmJP0csDSrhucPNQasGl0C8+acNwWbjyIHH767i1ITDuo2Jt66Hg2bYFAOqnjixUDb8Z
 /ZNsww9OH8kflVpij0j9Y72UlviUPWwwfyozAPzSJZCO5oPnikd6BkXEF75ziZzBmSeA
 oMeiQRxN1XuUdHBRTUpZfUbkgCRY9Khq2XJk5+xoGIxphqCwfiGFqPB25oV9N8FwhsoJ
 vSFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1724946622; x=1725551422;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=rJ1E1FSn9EnVE2v1a7jxMaJli1rgUUJqDUz/uJFASzk=;
 b=aUVuPMwcGshwkFm8tAgYvMbUoLK6z0IDGU1QnMtAHfyf24hyubg12l3WEBLCvXAV12
 LeJoUQNgb+VIhKOd7NcJuP7ncCF/vavozWqbQqTKIcOs0CCWCQmtqmA80/wvhWQrODPa
 LfYwu13rCb5T3cWGBUgduoYUwUBGvoMVeRddN7gKxNZhJc+juR6b57rsgSNzJ8jeK4LQ
 OGfFpd7IYSubCo3KnVfopra0+IyZgyOqmQ0jYyMjnj/x8IliRy2g42NyDVRCwtg4vBrq
 jM5WBFqpsMLpKHvb/FZk3Ou8pq2R1UmI1i+crCkQDsAmNDJcP2tKsrn7pVWGmb8xyuUr
 RZig==
X-Forwarded-Encrypted: i=1;
 AJvYcCUqEii8UNob/Aj/SDJwpCzva+bk8IjFgUfo9cCwEQ9eeIQe3JbvSVoArRYNQBmZMDlz6u8gdfaEHqE=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy4Rz0KLz+smakZYPFXNWjGu6Qtn9sHKyjSZWvSLHVxMOpMDdYZ
 SEMhUMZYovaiWsPgH8RPYCA/i9IUiAwR9bbBL51V0bMu8+CV2JJo
X-Google-Smtp-Source: AGHT+IHgyWOmnBMDml/2WKTJlzLj30pI0kYETJ0C99Zz7zJftAy4vldU6h2q941Ku1gU8wLUpksIgQ==
X-Received: by 2002:adf:e005:0:b0:367:9088:fecd with SMTP id
 ffacd0b85a97d-3749b52e4b2mr2618324f8f.7.1724946621184; 
 Thu, 29 Aug 2024 08:50:21 -0700 (PDT)
Received: from orome (p200300e41f29d300f22f74fffe1f3a53.dip0.t-ipconnect.de.
 [2003:e4:1f29:d300:f22f:74ff:fe1f:3a53])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3749ee4abbesm1737641f8f.23.2024.08.29.08.50.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Aug 2024 08:50:20 -0700 (PDT)
Date: Thu, 29 Aug 2024 17:50:19 +0200
From: Thierry Reding <thierry.reding@gmail.com>
To: Colin Ian King <colin.i.king@gmail.com>
Cc: Mikko Perttunen <mperttunen@nvidia.com>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Jonathan Hunter <jonathanh@nvidia.com>, dri-devel@lists.freedesktop.org,
 linux-tegra@vger.kernel.org, 
 kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH][next] drm/tegra: hdmi: make read-only const array
 possible_nvram_sizes static
Message-ID: <a3itbzv4hhkbpa3lhe7w42qtyxwiuwdsdntemtzn25uj27skci@trg63xzeh3dp>
References: <20240822205047.642845-1-colin.i.king@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="ql3tpfeuhs46rjeh"
Content-Disposition: inline
In-Reply-To: <20240822205047.642845-1-colin.i.king@gmail.com>
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


--ql3tpfeuhs46rjeh
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Aug 22, 2024 at 09:50:47PM GMT, Colin Ian King wrote:
> Don't populate the const read-only array possible_nvram_sizes on the

I've changed this (and the occurrence in the subject) to reflect the
actual array name ("freqs") that's being changed here.

Applied, thanks.

Thierry

--ql3tpfeuhs46rjeh
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmbQmLsACgkQ3SOs138+
s6HAGRAAmGbYekDkE+fSbWHiAQEEEopvqtwfi9pf3qQhWrAvTkWHJ+f84L0f97+X
ZDp2Xvbycz6a5d5XP7OQr8yVRFXw7IQ54dG4tHSi3GkOF4aJt1PxXFAQG9tmxNKf
b4Vog6rC5eqi6v2S5GvmBhoXVaiUNIhSlIf5g9S+WfY/JnbdIvDQuOfH391oiQVz
3+ZfpT5Z8BFaiPxJSNv6OeVt98mudHfonN0WrhIWT25gchR5P0+EQjeXfd07f3a5
LGxa21LsVoObmD8s614dVO5zGcWdrszWisAmT+uJplHBMYjxXPEX2U6cfyLHFoR3
Z3RSky6J3IHfoygAsFjR6BI5yujN65oMx/DydwoNUpO0Uh5zqEi4IrBANYWMtiJw
wV4d6ExLkLlPMYCxcENGsStaxy7MkPYFv23desCq97RGiqn5gsS05bU4VmDxpvnF
WRCwmX7vqBrJB9cIotcywXvXS8Wouc6WMLh/qQ7J8nonPO3QNLRypt85oMpzEOLZ
kSjxidNri97ooAcQDOL1BKpcsf9C+X0EESQ7HU1cDOM3Q26pe4fsqLlRK6lAeozD
Ex+g1S499nkWtVAqK+Ace2MqqcJWeQPaAmJ+gXVL9OebQSyPihRQyR7qR6+BCBQq
k6p7S4BIqDgxRcmuWzCq52UtYgRYW6ZIC4NQOzr+DaZWoD2QhRk=
=Ba83
-----END PGP SIGNATURE-----

--ql3tpfeuhs46rjeh--
