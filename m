Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EE06AB0A828
	for <lists+dri-devel@lfdr.de>; Fri, 18 Jul 2025 18:11:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CB03B10EA1B;
	Fri, 18 Jul 2025 16:11:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="FxArP+zx";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com
 [209.85.210.181])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7616C10EA0B
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Jul 2025 16:11:33 +0000 (UTC)
Received: by mail-pf1-f181.google.com with SMTP id
 d2e1a72fcca58-74b54af901bso1629681b3a.2
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Jul 2025 09:11:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1752855093; x=1753459893;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=w4sbOB8EUknRai1AuJ9cdNWA6bF4sUdUbr8Aph2l+CY=;
 b=FxArP+zxFjY39aZob5Uupo+plikNPIXGSRK8LCoTsToSLvwR8S5K79IpREwHoCwqBt
 tGHYcljfhAtyJZBcwkHjFZ3NMzmAcPeS00YK7ZW33HN9rExs9h+URh5QGjqRED4DpbCy
 fBlfvZwiDDW3Z637jKk0HzoKX9iQYLVjx4yUo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752855093; x=1753459893;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=w4sbOB8EUknRai1AuJ9cdNWA6bF4sUdUbr8Aph2l+CY=;
 b=TVTru/op04lBk+Gqm6VP6UOaUspv0kPmFMCLIyUbERWXL+YD/YWKZJTg0XxZc6NwnJ
 2ucGs2txn2KJukkpQtesLu17ex1zVvD+d7HC8eiK8LyjI2tx/GfXbLsOhmQmMMz7iGTU
 HGxQwtEwrb/UghUdWqjJDE7tSi8jeIUbWI/CN/JV2T8a4a1FonTeCTqBCVrjeKAy/iJ/
 D8by8pwtI/YxfG/dP3vPTRC/wkOrvpwSyLL7To6htuQSK5qK1Mvffyelneho7FE1mBFg
 CJsU0QmaH1jJ53IDKLHi7XceEjPkcNVxOcznX6NffT98qidy/8yVddb5BnhcoRw0khm6
 fvYw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXwTL3qdTGnb5DpAlEUDjZv4Hj+kkfIWUHAq1t16Epy/yR3ZUbM2VBqzvdzOA13ZsGnqAmWg98K7k8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxHXKhL7erePr/3Fh4Qc1iikRZOeVqk8gL8XXu8516OVDDUFdZZ
 fwdMyNaw4EfC3KAbJg/nHvLTDnmQElCklFL8dgp+RKUKz516IgwglLEyOujc+LthXRzVhMn8iXg
 cdmE=
X-Gm-Gg: ASbGncvZb42rjapacczyWi/QKnxCKKtynL818TXkFQQls1TZcbs8AWbvncVKDQjH/Ne
 91PZNTG0ve7R5whYO9ih7hPnTvjilfKMnMhxs7SljJuZvBKIZJp+eiRV6FfEMwf77mGMfRibBje
 zcbAiW4stONgKwquPyWqRrPeotdu/qu3/bRGFB4XvD+3CgQ3IWInV4kvJ6LD/EuxGwFHwQf7/Ph
 GEl9hJZFU0x8ldhGMU2JSDtZfYGViv2D4vf8py1PwGz34tgnXFq9cKR2KSeMphTsKXQi63gO701
 G6EDjWcU9sZbC1QNbB+tM3sNEZykH155FWdubD9nh1gPGn5zVURjaihqqGwb4NaK3nXV35oDj55
 6hcDWJ4MdoGhmRR6SBoh6OxLvEgrJJVBQTjGnF5IifIX5z9EuK9Mq+DBaAurNl1GQOw==
X-Google-Smtp-Source: AGHT+IGC2KE3t0dLTLjojT/DkPMGk6dOB7zArFPAntvU3wJOtOU92xo04sNf18JmkrNMFIQcvEl8wA==
X-Received: by 2002:a05:6a21:6494:b0:237:b321:1e0 with SMTP id
 adf61e73a8af0-237d661c82amr17233545637.17.1752855093014; 
 Fri, 18 Jul 2025 09:11:33 -0700 (PDT)
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com.
 [209.85.214.170]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-759cb1569e7sm1491156b3a.90.2025.07.18.09.11.32
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 18 Jul 2025 09:11:32 -0700 (PDT)
Received: by mail-pl1-f170.google.com with SMTP id
 d9443c01a7336-23694cec0feso22058325ad.2
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Jul 2025 09:11:32 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCVSk1KHfVz6i25bQd0stNNiCgL9GAbGM3yaBBFF4pSx5Q8TLBRGm2NL35U1uqtKmfmXoBsqN6THQFg=@lists.freedesktop.org
X-Received: by 2002:a17:903:2d1:b0:234:d2fb:2d28 with SMTP id
 d9443c01a7336-23e24ec73b2mr186837285ad.2.1752855091825; Fri, 18 Jul 2025
 09:11:31 -0700 (PDT)
MIME-Version: 1.0
References: <20250717164053.284969-1-me@brighamcampbell.com>
 <20250717164053.284969-3-me@brighamcampbell.com>
In-Reply-To: <20250717164053.284969-3-me@brighamcampbell.com>
From: Doug Anderson <dianders@chromium.org>
Date: Fri, 18 Jul 2025 09:11:20 -0700
X-Gmail-Original-Message-ID: <CAD=FV=Vrp9MM_5de10sV-TC_mp-D7en9gjU8DBoD6mBrRvF2eg@mail.gmail.com>
X-Gm-Features: Ac12FXz3KKf6EYjEda0vjUCQyFQVXEd84VY4Ny25pnbUOfssxeUq4v1dFeHX4UU
Message-ID: <CAD=FV=Vrp9MM_5de10sV-TC_mp-D7en9gjU8DBoD6mBrRvF2eg@mail.gmail.com>
Subject: Re: [PATCH v4 2/4] drm/panel: jdi-lpm102a188a: Fix bug and clean up
 driver
To: Brigham Campbell <me@brighamcampbell.com>
Cc: tejasvipin76@gmail.com, diogo.ivo@tecnico.ulisboa.pt, 
 skhan@linuxfoundation.org, linux-kernel-mentees@lists.linux.dev, 
 dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Thu, Jul 17, 2025 at 9:41=E2=80=AFAM Brigham Campbell <me@brighamcampbel=
l.com> wrote:
>
>  static int jdi_panel_prepare(struct drm_panel *panel)
>  {
>         struct jdi_panel *jdi =3D to_panel_jdi(panel);
> +       struct mipi_dsi_multi_context dsi_ctx =3D { .accum_err =3D 0 };

nit: can just be this:

struct mipi_dsi_multi_context dsi_ctx =3D {};

This looks so nice and clean now! :-) I'd bet that the compiled size
of the code is also quite a bit smaller as well...

Reviewed-by: Douglas Anderson <dianders@chromium.org>
