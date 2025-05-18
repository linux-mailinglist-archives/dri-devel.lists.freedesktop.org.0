Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C988BABB0DB
	for <lists+dri-devel@lfdr.de>; Sun, 18 May 2025 18:40:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AB44310E0A8;
	Sun, 18 May 2025 16:40:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com
 [209.85.208.176])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BC44310E0A8
 for <dri-devel@lists.freedesktop.org>; Sun, 18 May 2025 16:40:52 +0000 (UTC)
Received: by mail-lj1-f176.google.com with SMTP id
 38308e7fff4ca-328b943ae7bso11537671fa.3
 for <dri-devel@lists.freedesktop.org>; Sun, 18 May 2025 09:40:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747586450; x=1748191250;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :reply-to:in-reply-to:references:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=/hg4XOiM8dzAP+sj3OctfJb8nVC7grXLEYczEbyGvks=;
 b=AqvKnTLilgXTiQUfXhdiGxiQnR7wOODX8zFatNS6n7a2WslHqV+hRQYrOxznQrOheu
 Dr2HkVq4Jp+UtoHPa6DA8GNFTrN5lIDAdNc+FBvACWxxUo4QsxqqaNuu1N7wRpyflyYs
 kCw2vKXc/lQp7wN5FCb7WnuLDNYJqM+0QbCIc9qccHtVoBYLV9lUT1cv+pTTkyxKaA6j
 kVLodbZrNra6v11SWsvDwJs+Ecpnt+nQlmoomUcK/yf/Bb6nnxgDv7+Z/sNs+VqzddVK
 ADCTnLuFS2GQHZyjR/r0qi8sYWGwwPiONeKx/uHnICDQO/wS5TLjXaPopedo4hca2Aha
 KRFg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUjxVdMEs8reckX9l02In6Ii2QHf9otXsgfL855Sil8H2dYthOSPM+YZVKqJ6AuNA1weua9aUZ5YhA=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwoJw8knSVXZEBQYfsdghidGjyMc5EqzeLAMLZv+4XAKHMnRUP9
 1n7v7TPQOU4GzrVFSm4nAg2T5bH7lalvuZpplxtrZHvduMFDrgsz6eVjBN77eY7n9F0=
X-Gm-Gg: ASbGncssBu0N2pT7S3bzaqncFJSJXvhIfc+SzZKE15wz91Z8DSFplokh7tIn4sedOlf
 hd+m3WGlTc/hbHBJkOa8Mx+YirnnIe8wfgpoYA3PulbXPBnYOGquFG0OhrYg4rlj8/YHRMumYiV
 R+uaO10LAl6p32N0JdYIFhqhy7KaQA7NSqHAkgWDr5lqEpNVuXGvcv/GwSqFvxEkr3JAYIUCqGK
 a/v2RTqquVbUJkh/okQqA5TOmnlJ7jHjyLr9+2aP5k/IidcdnkV7r3VfU/zAQI4cj6+k7CFX5dt
 /GmCDpyn1y0tE6/JjxVkznGjSXcZ5SJcF3q+XrqbbgZQNu+OZCHZ/85lBbyevNh04mC4jxnFNCw
 kAzJftjZ+
X-Google-Smtp-Source: AGHT+IHWcfFyjqk2EsxscqCQfGY7vms+XwXeFeXg3RiUQJvm8pup3JptyFF4SLe2Tz7pLgHMFlHNHw==
X-Received: by 2002:a2e:a001:0:b0:328:1365:87e1 with SMTP id
 38308e7fff4ca-328136588e7mr10724001fa.23.1747586449902; 
 Sun, 18 May 2025 09:40:49 -0700 (PDT)
Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com.
 [209.85.208.169]) by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-328085cdf48sm15188331fa.90.2025.05.18.09.40.49
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 18 May 2025 09:40:49 -0700 (PDT)
Received: by mail-lj1-f169.google.com with SMTP id
 38308e7fff4ca-328b943ae7bso11537501fa.3
 for <dri-devel@lists.freedesktop.org>; Sun, 18 May 2025 09:40:49 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCVosqPAxmoI1C+iu5MQ7hAUEetKqtt+cDDCkcjtiPgCuhNcIJKczN5sHmaep6TaUQvC82tcIp025zs=@lists.freedesktop.org
X-Received: by 2002:a2e:b8d2:0:b0:307:e368:6bd6 with SMTP id
 38308e7fff4ca-328077cc6eemr39628791fa.32.1747586449458; Sun, 18 May 2025
 09:40:49 -0700 (PDT)
MIME-Version: 1.0
References: <20250516105101.11650-1-ryan@testtoast.com>
 <20250516105101.11650-3-ryan@testtoast.com>
In-Reply-To: <20250516105101.11650-3-ryan@testtoast.com>
From: Chen-Yu Tsai <wens@csie.org>
Date: Mon, 19 May 2025 00:40:36 +0800
X-Gmail-Original-Message-ID: <CAGb2v67jfZx4gxhBh9cc5SRknzwc0jX_148v2p0HAV5+adL9aQ@mail.gmail.com>
X-Gm-Features: AX0GCFtGZP94oDImPioaa5-NKNR-5OiIQ3Lm0O3X3TZCX6x7PwMx49wsoQ0m4fQ
Message-ID: <CAGb2v67jfZx4gxhBh9cc5SRknzwc0jX_148v2p0HAV5+adL9aQ@mail.gmail.com>
Subject: Re: [PATCH v11 2/8] drm: sun4i: de2/de3: refactor mixer initialisation
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

On Fri, May 16, 2025 at 6:51=E2=80=AFPM Ryan Walklin <ryan@testtoast.com> w=
rote:
>
> From: Jernej Skrabec <jernej.skrabec@gmail.com>
>
> Now that the DE variant can be selected by enum, take the oppportunity
> to factor out some common initialisation code to a separate function.
>
> Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
> Signed-off-by: Ryan Walklin <ryan@testtoast.com>
> Reviewed-by: Andre Przywara <andre.przywara@arm.com>
> Acked-by: Maxime Ripard <mripard@kernel.org>

Reviewed-by: Chen-Yu Tsai <wens@csie.org>
