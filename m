Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 081BD955CD3
	for <lists+dri-devel@lfdr.de>; Sun, 18 Aug 2024 15:48:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 793AC10E095;
	Sun, 18 Aug 2024 13:48:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com
 [209.85.167.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1A74910E095
 for <dri-devel@lists.freedesktop.org>; Sun, 18 Aug 2024 13:48:08 +0000 (UTC)
Received: by mail-lf1-f44.google.com with SMTP id
 2adb3069b0e04-52f01afa11cso4444515e87.0
 for <dri-devel@lists.freedesktop.org>; Sun, 18 Aug 2024 06:48:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1723988885; x=1724593685;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :reply-to:in-reply-to:references:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=086ANeHmrRDjdN2Mwc5Rp1d2iaH69nmzevA2WRPm9Xg=;
 b=bxh4VXW1+aJCca+0/mfMvAtOezaR9rsJPDMWQdpb+fUzHGWTi9/CmmrLdXB5RZQzOe
 2/HfgQ+hIJyYu1PRvGVTKdb+uL6Ql2DWMueoD5atY4h1ft2na85TGs7OOWct5/bemI3v
 mUcHSQ9iWctC73B/52mE88YUfMq02XQjBA/11FkZ+o6pQcuI9US3zbzal9lJ/FiwJV2x
 6CN3gFBp8VmdKOyTjdt+1h6MRLL9hZEVbTFyxuGNE6ftzP1RR0HvzS3xy8R5KxEa6Kks
 Pqp8CsyHiEFyxbiELJRRoJpblSjgyIBuVTh2tihKVDxxTnhDiriCWC3hd70qjeUxd7Il
 161g==
X-Forwarded-Encrypted: i=1;
 AJvYcCVf9SJq0edmEBm3RzbrDXKCsQ8+BtbzuB2ESfUdBoKIp7gDfUSnwC1Dq3XSnkIhSpIyGmDFTUfyhdqfYK/9ovIMCTSp4/LnHDaRKCXzy+Br
X-Gm-Message-State: AOJu0YyqWHs39oIU8cZ2ximKtS0+S/KqZoJG9EgB8XenUDvXCH6EJwAE
 tj47jzsfgrblNFJT96bYufyqkg3c85Rkbo0FNoXrP92WCj9O1e2nzieQVjpYKf0=
X-Google-Smtp-Source: AGHT+IGcvLNm33UI4eMnaNHWotcn1P6zGFuwC1pCSblILgYlwGS/b2O0T/kvmJewPRPYtmZRfwGHZw==
X-Received: by 2002:a05:6512:3b81:b0:52e:be84:225c with SMTP id
 2adb3069b0e04-5331c6ba239mr4868086e87.33.1723988884743; 
 Sun, 18 Aug 2024 06:48:04 -0700 (PDT)
Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com.
 [209.85.208.171]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5330d3ff293sm1210019e87.131.2024.08.18.06.48.04
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 18 Aug 2024 06:48:04 -0700 (PDT)
Received: by mail-lj1-f171.google.com with SMTP id
 38308e7fff4ca-2f0271b0ae9so44550751fa.1
 for <dri-devel@lists.freedesktop.org>; Sun, 18 Aug 2024 06:48:04 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCV1fjrsKu9sZ+ZHaE97FwJCZ8dyA+MEwKDyTWEGjQRNF7ZJn2Aku7xwSBsbJD/4e8yNDa6qF3dPy9Ap5pMqp7OoPLHUdI4FmiV2HpeSOEGz
X-Received: by 2002:a05:651c:2209:b0:2f3:bfcc:245f with SMTP id
 38308e7fff4ca-2f3bfcc27dfmr53848211fa.32.1723988884396; Sun, 18 Aug 2024
 06:48:04 -0700 (PDT)
MIME-Version: 1.0
References: <20240817230503.158889-1-ryan@testtoast.com>
 <20240817230503.158889-21-ryan@testtoast.com>
In-Reply-To: <20240817230503.158889-21-ryan@testtoast.com>
From: Chen-Yu Tsai <wens@csie.org>
Date: Sun, 18 Aug 2024 21:47:52 +0800
X-Gmail-Original-Message-ID: <CAGb2v66d18WWQTu4YGsL8=qsRELKx675f+s8S1ezLj3eLmSmUg@mail.gmail.com>
Message-ID: <CAGb2v66d18WWQTu4YGsL8=qsRELKx675f+s8S1ezLj3eLmSmUg@mail.gmail.com>
Subject: Re: [PATCH v3 20/26] dt-bindings: allwinner: add H616 DE33 clock
 binding
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
 devicetree@vger.kernel.org, linux-clk@vger.kernel.org, 
 Conor Dooley <conor.dooley@microchip.com>
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

On Sun, Aug 18, 2024 at 7:08=E2=80=AFAM Ryan Walklin <ryan@testtoast.com> w=
rote:
>
> The Allwinner H616 and variants have a new display engine revision
> (DE33).
>
> Add a clock binding for the DE33.
>
> Signed-off-by: Ryan Walklin <ryan@testtoast.com>

Reviewed-by: Chen-Yu Tsai <wens@csie.org>
