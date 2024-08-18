Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1032F955CC8
	for <lists+dri-devel@lfdr.de>; Sun, 18 Aug 2024 15:42:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7EB9B10E049;
	Sun, 18 Aug 2024 13:42:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-f181.google.com (mail-il1-f181.google.com
 [209.85.166.181])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3B9CD10E049
 for <dri-devel@lists.freedesktop.org>; Sun, 18 Aug 2024 13:42:03 +0000 (UTC)
Received: by mail-il1-f181.google.com with SMTP id
 e9e14a558f8ab-39d30f0f831so5740375ab.0
 for <dri-devel@lists.freedesktop.org>; Sun, 18 Aug 2024 06:42:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1723988522; x=1724593322;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :reply-to:in-reply-to:references:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=whPaRlGmH+NJXjZNAC8fa7shH0Iu+3/wkcGkkBavjHg=;
 b=jiG4Lb6rDPZMi57NllbudbOSra0a6/Tnbngw0RaUdjH/hslTmDrZCbWmkljnYFVlCQ
 9b8XcIPBiPBARwYp9ZXmTqFK2WOwl7mME/eS87qaXcY09kChgjF23n0xrsJJLJyhDHLI
 Qvv0kAiDvu0uq+GLSD+xGn9tb2u5Zwp3xVknW5/NurkjcDhC/di+6yxUN+Wi63VXTJDD
 pvgrbuT9W0hEkxUqr3bi3v62Z76+kNRAqrd2cWFEVVztMnVbEMBBva7h80BxsyXDKDw9
 CZndnSgnoyi7Urcl0qGarTlqdcczCFJpBOjn0I38ZaRB+p/cW4QK51a1C33+NU7rBmO0
 se2A==
X-Forwarded-Encrypted: i=1;
 AJvYcCWc7zOSVrcDVCe37a+Ka5rn6CrAKZEmbCfozP69s+Hh/rs0HCaDZWTeyRvtmjsRuEpsCivES5Qf/51fHyd48CfIggrM73h0BXMCqrByuVFE
X-Gm-Message-State: AOJu0YyhR8Y1QKt85FsGdT1PV35Xr+/QPkA6vc/ypcyavQel1L13xHsE
 Kn12hDGmg2VhCeNmLPYMfrO3lVxYCs/aykPj46tkEyMJvZt+my36r8uzgQibYy0=
X-Google-Smtp-Source: AGHT+IGxA3Kd2w9zlfMnbB8o2D+/PwVAnrN/zL5Nbsx1fnCYCE/VLyEHh6nlTT5YkCSTZ7kL9rfPbQ==
X-Received: by 2002:a05:6e02:1a4f:b0:381:40be:4ce6 with SMTP id
 e9e14a558f8ab-39d26cfbcb7mr92535855ab.11.1723988522231; 
 Sun, 18 Aug 2024 06:42:02 -0700 (PDT)
Received: from mail-io1-f45.google.com (mail-io1-f45.google.com.
 [209.85.166.45]) by smtp.gmail.com with ESMTPSA id
 e9e14a558f8ab-39d1ed5dc70sm26645935ab.54.2024.08.18.06.42.01
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 18 Aug 2024 06:42:02 -0700 (PDT)
Received: by mail-io1-f45.google.com with SMTP id
 ca18e2360f4ac-81f8f0198beso120231639f.1
 for <dri-devel@lists.freedesktop.org>; Sun, 18 Aug 2024 06:42:01 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCVQfBUTUeoH78hUBcbLhKmKMCZF4gKZe1SKccMqPG0aSb5eL2d+YSa+ZvrKLYWI/G5zRv4KzGPLj5rAadMpcAffE3p1UK580RiOyyJmKPgp
X-Received: by 2002:a05:6602:2d94:b0:824:d6ed:e479 with SMTP id
 ca18e2360f4ac-824f266b92emr827432839f.7.1723988521614; Sun, 18 Aug 2024
 06:42:01 -0700 (PDT)
MIME-Version: 1.0
References: <20240817230503.158889-1-ryan@testtoast.com>
 <20240817230503.158889-5-ryan@testtoast.com>
In-Reply-To: <20240817230503.158889-5-ryan@testtoast.com>
From: Chen-Yu Tsai <wens@csie.org>
Date: Sun, 18 Aug 2024 21:41:48 +0800
X-Gmail-Original-Message-ID: <CAGb2v67OCPz4O38Lgduu1pasjE56dCuGbzYNL_RtjqsnTJZqCA@mail.gmail.com>
Message-ID: <CAGb2v67OCPz4O38Lgduu1pasjE56dCuGbzYNL_RtjqsnTJZqCA@mail.gmail.com>
Subject: Re: [PATCH v3 04/26] drm: sun4i: de2: Initialize layer fields earlier
To: Ryan Walklin <ryan@testtoast.com>
Cc: Maxime Ripard <mripard@kernel.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
 Andre Przywara <andre.przywara@arm.com>, Chris Morgan <macroalpha82@gmail.com>,
 John Watts <contact@jookia.org>, dri-devel@lists.freedesktop.org, 
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
 devicetree@vger.kernel.org, linux-clk@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
Reply-To: wens@csie.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sun, Aug 18, 2024 at 7:06=E2=80=AFAM Ryan Walklin <ryan@testtoast.com> w=
rote:
>
> From: Jernej Skrabec <jernej.skrabec@gmail.com>
>
> drm_universal_plane_init() can already call some callbacks, like
> format_mod_supported, during initialization. Because of that, fields
> should be initialized beforehand.
>
> Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
> Co-developed-by: Ryan Walklin <ryan@testtoast.com>
> Signed-off-by: Ryan Walklin <ryan@testtoast.com>

Reviewed-by: Chen-Yu Tsai <wens@csie.org>
