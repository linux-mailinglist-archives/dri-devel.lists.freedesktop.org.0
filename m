Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BF15ABB0F6
	for <lists+dri-devel@lfdr.de>; Sun, 18 May 2025 18:54:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A224110E08B;
	Sun, 18 May 2025 16:54:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com
 [209.85.167.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E882410E004
 for <dri-devel@lists.freedesktop.org>; Sun, 18 May 2025 16:54:09 +0000 (UTC)
Received: by mail-lf1-f51.google.com with SMTP id
 2adb3069b0e04-54ea69e9352so4830438e87.2
 for <dri-devel@lists.freedesktop.org>; Sun, 18 May 2025 09:54:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747587247; x=1748192047;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :reply-to:in-reply-to:references:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=STMuo8/qd05GfAY8QU0fDaRLs2uLrskCqPaVJINbTME=;
 b=v6ZJnaZrycqUeQB7yfbnDNOXuHRXeDHNoQc+lZF/cYQ+qwDIChtRsmrXxVVnEhvfLI
 b/BoNAFHOeOBEYBCrLoluHFeYFLH2Efa7y0UJ1ne+42qB6wh+qlu+2MrHrSXKHsOXk9s
 tKVBYPyd3rVqDVhYALiVM9hw5Avx6HsEb/eFLLIw+RbmCYUlxBvexarkQCLE4x1b8yMf
 pd/8hLegOaTBFohZ0UUEvLSJLJLuXDTXtqyPo+Nbd2uvD0lNp6anWdOgmzWhR1GP8Gb8
 4Otjy2E9CH9Ok2r4HNyi8NzC6/uHMmhjlShH9uNJEpOaNnuFbax4nB637kga0dP06Fw9
 JbGw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUC8SLJFW2GvpwDYaNtq6Ob+npIH+mW52Qhoblm/Cfn754I5w1MOuIheUmD+NnNvEIZq9OwBQ8TWGI=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz5cCjP1kjhNdhC8IpFYu7W/NcjbV+xE95t/LpWr8ypbpx+MaX1
 eLzUyCRcgz3U7bMJVlz6ALe6g1ImtVmGZ8l8boVD8QBPoFNrJwWdK1ZzOQ6vkaGswNw=
X-Gm-Gg: ASbGncsdSz92XcutZaarXTSGYscPN3oc422mAcLb6MtJjBA/y8T5zi8e/ozPDXUTFVh
 dNIMaGfWBR30lRj/l+LBbQ/wmC8p9fq8NF+O1dm8wYijjO2LcRUrofCHEIJHg+NIQTRgVftw29p
 Kob8MPJRMl622yBjuL/9ZJ0mU/nl7UMQT19ZCVjnlW2u7dH3ZCDYCwyzKnSs/xtkkYmaivp9CTI
 cZvHBD0VFdYLLceNfesEPoHb7Mdd+X3yqoJp3tADOa3YBYFSoL3sR01NSMvMDw3PCt7/pC2A7To
 3J9Ru/jYXZJEn093gwQs1knT4AN0LWzdPsHV9enog/sQMnUk3Q8LrpcAepcAFqKE1z47Ik2X5v7
 Su7QLOTtcJsXqbhlbPZc=
X-Google-Smtp-Source: AGHT+IE7hEqk7pAXJJ9FBnmw8aj6rv7STN2EKetvwcliCyaGeX5Eq6uif82Lz/bqyV6HOcVUUjhSgg==
X-Received: by 2002:a05:6512:3d91:b0:550:e589:6c2e with SMTP id
 2adb3069b0e04-550e971b49fmr3101226e87.3.1747587246520; 
 Sun, 18 May 2025 09:54:06 -0700 (PDT)
Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com.
 [209.85.208.169]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-550e7017e6esm1481727e87.136.2025.05.18.09.54.06
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 18 May 2025 09:54:06 -0700 (PDT)
Received: by mail-lj1-f169.google.com with SMTP id
 38308e7fff4ca-329107e3f90so4766961fa.3
 for <dri-devel@lists.freedesktop.org>; Sun, 18 May 2025 09:54:06 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCUybFilZyR3HM3mtrtflu4dnv4v7nn/viMcMaYjb1p78Drg1waI9SLUZgRaU0o0Dbhlm9wcBqEBkh4=@lists.freedesktop.org
X-Received: by 2002:a2e:a546:0:b0:30b:fe19:b07a with SMTP id
 38308e7fff4ca-3280974cd4bmr28754701fa.25.1747587246119; Sun, 18 May 2025
 09:54:06 -0700 (PDT)
MIME-Version: 1.0
References: <20250516105101.11650-1-ryan@testtoast.com>
 <20250516105101.11650-9-ryan@testtoast.com>
In-Reply-To: <20250516105101.11650-9-ryan@testtoast.com>
From: Chen-Yu Tsai <wens@csie.org>
Date: Mon, 19 May 2025 00:53:53 +0800
X-Gmail-Original-Message-ID: <CAGb2v64v_uDKVs0QZkC43fH9aiBbyBnVwJVYNWAHPe2GMtwo6Q@mail.gmail.com>
X-Gm-Features: AX0GCFvgY9QrpGrKT96c6LVa08NAsANlz2uVfwNxjbxYFVM6-idz9sCykjNFd2E
Message-ID: <CAGb2v64v_uDKVs0QZkC43fH9aiBbyBnVwJVYNWAHPe2GMtwo6Q@mail.gmail.com>
Subject: Re: [PATCH v11 8/8] drm: sun4i: de33: mixer: add mixer configuration
 for the H616
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
 Hironori KIKUCHI <kikuchan98@gmail.com>,
 Philippe Simons <simons.philippe@gmail.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, dri-devel@lists.freedesktop.org,
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

On Fri, May 16, 2025 at 6:52=E2=80=AFPM Ryan Walklin <ryan@testtoast.com> w=
rote:
>
> From: Jernej Skrabec <jernej.skrabec@gmail.com>
>
> The H616 (and related SoC packages sharing the same die) carry the new
> DE33 display engine.
>
> Add the mixer configuration and a compatible string for the H616 to the
> mixer.
>
> Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
> Signed-off-by: Ryan Walklin <ryan@testtoast.com>
> Acked-by: Maxime Ripard <mripard@kernel.org>

Reviewed-by: Chen-Yu Tsai <wens@csie.org>
