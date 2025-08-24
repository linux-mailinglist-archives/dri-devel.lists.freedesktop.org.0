Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B85E6B3321D
	for <lists+dri-devel@lfdr.de>; Sun, 24 Aug 2025 20:54:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 206A910E1FD;
	Sun, 24 Aug 2025 18:54:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=brighamcampbell.com header.i=@brighamcampbell.com header.b="isRM3Je8";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com
 [209.85.210.176])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8381710E1FD
 for <dri-devel@lists.freedesktop.org>; Sun, 24 Aug 2025 18:54:44 +0000 (UTC)
Received: by mail-pf1-f176.google.com with SMTP id
 d2e1a72fcca58-76e34c4ce54so3010080b3a.0
 for <dri-devel@lists.freedesktop.org>; Sun, 24 Aug 2025 11:54:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brighamcampbell.com; s=google; t=1756061684; x=1756666484;
 darn=lists.freedesktop.org; 
 h=in-reply-to:references:to:from:subject:cc:message-id:date
 :content-transfer-encoding:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=R4RBQN7ZcwLGgu6eJi1GMF63RINzrO56jY30XvA+HQE=;
 b=isRM3Je8ADG3fus4w8mpnbw9XK7rz1nNpqQj+pANYI6/y1li1ENsOMe850SyMheRS0
 PEVC5ughumRYjqpigH1QuHJGw562VpQleHrhKnEtob96tn1QynRnzJJtXCOFAl6Y3MDD
 W2ZIL5vx7MfF+6Og252dFXfqwjI38PzjkSzFhE46Ya1ldrAyhV5zY8BnlFLItIz5f04X
 JcYZOhkmx9W2AY1PAjPq9JRRu9E80wof8kBIA5s+sLRtcghPfVdM5nt+//Ic8++/aFt/
 WVuatEkWdyvMMkqsIovSxvp1DPouL4dxpMJ8yUXl2VUeiQ4e2j6Ntc4OEBj8fXetptpi
 vFtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756061684; x=1756666484;
 h=in-reply-to:references:to:from:subject:cc:message-id:date
 :content-transfer-encoding:mime-version:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=R4RBQN7ZcwLGgu6eJi1GMF63RINzrO56jY30XvA+HQE=;
 b=sWh/HbGKymMSGMb0WdyFtgeozOvmHmo8gPxdZ1hEQ1InL8pIkpe+gWqu1o5TY4ho8t
 0WDyVM4BHTWacY6tQXFYCPgLbhdLqfed7ZZF2cWR5DhUWcXzGdpgO1PyqnT/vxR7al/t
 mLPyAzofZ0X61xJiLMLIO8sAzcV7XGhpfd/haoYPWxkvMTJC90ugdKTMUTnUxV2DNSL+
 lc+Bzcwb4byzjUicuTeTtXUVLOlWtcfTN+dk5O5z9Whg+pH+pt6sLVi5tcibi1rhsHsT
 AHKM+4L+YC6sEoPjlp/Cl1RIvIdfvsk2v0uK38m1NMwYoTdbYAr7sBWczG3s7Kxgv6j0
 G/Hw==
X-Forwarded-Encrypted: i=1;
 AJvYcCURqX0i18bJYd4rrYW647Y4ciCIcuCvMYUMdZoeRFvJF6+ghX69637+ea0jDkwy7rO//gLD+ILtz/s=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yza2gitK7aOA718bqE9hwZ5jWC8AOKs5fZEsaTTqm1KV/ecmNhO
 tOyXdrI/Z1Io570CE8k/M9pFhq85dXgCJtqP+uGRb97RBznR9Ye7Tkn78bNqpaiki/4=
X-Gm-Gg: ASbGncvxo9oSHlWUe2h+RygCfmH40NSL6+Fqo1qOixwnjO276VJAiOtuwrhLK3ZCqJ0
 xaCwUlXxr8BLHZ1XAFSqUyrKM8KMCPPH/bjAouC9P3yQK13wk6NIW9QFKtc5uCvIjvyz/KwTtLp
 OlhmOkSDyoGrih8DGI2C0kvNCwg5Psza2SXq18ZrA9aWRoTbbIgEE3nz2WTaQfQj3LO9cVtv/WH
 Qloc4cYxt9s52bj8nz6jvvd86mYYCIyrbwgR54JZlS6/RQAOPz9Uv9K/5hhXMm2rxGxj35lyhaq
 gpcisRrB4HjQUlms9VlxH/Xmyj0sFzSBqyKiKUIvTnAURJxA+UtyA1LVJtEk3eOjigm8nALqvqw
 lwtPL+A5y33d6MeQgHSU=
X-Google-Smtp-Source: AGHT+IEDk7at3Bpgbpj+v0Eh4vjn2DF3yviRYYO1YRDu0NiWwlKlGxDy4FGz5GLe85FB4ML7qbBaOA==
X-Received: by 2002:a05:6a20:430f:b0:220:898b:2ca1 with SMTP id
 adf61e73a8af0-24340ddec04mr12861606637.21.1756061683987; 
 Sun, 24 Aug 2025 11:54:43 -0700 (PDT)
Received: from localhost ([64.71.154.6]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-770401afde8sm5257723b3a.61.2025.08.24.11.54.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 24 Aug 2025 11:54:43 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sun, 24 Aug 2025 12:54:41 -0600
Message-Id: <DCAVWVJ990VS.255346CDNF1GK@brighamcampbell.com>
Cc: "Neil Armstrong" <neil.armstrong@linaro.org>, "Jessica Zhang"
 <jessica.zhang@oss.qualcomm.com>, "Maarten Lankhorst"
 <maarten.lankhorst@linux.intel.com>, "Maxime Ripard" <mripard@kernel.org>,
 "Thomas Zimmermann" <tzimmermann@suse.de>, "David Airlie"
 <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>, "Douglas Anderson"
 <dianders@chromium.org>, "Diogo Ivo" <diogo.ivo@tecnico.ulisboa.pt>,
 <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>,
 <kernel-janitors@vger.kernel.org>, "dri-devel"
 <dri-devel-bounces@lists.freedesktop.org>
Subject: Re: [PATCH next] drm/panel: jdi-lpm102a188a: Fix error code in
 jdi_panel_prepare()
From: "Brigham Campbell" <me@brighamcampbell.com>
To: "Dan Carpenter" <dan.carpenter@linaro.org>
X-Mailer: aerc 0.20.1-0-g2ecb8770224a-dirty
References: <aKcRfq8xBrFmhqmO@stanley.mountain>
In-Reply-To: <aKcRfq8xBrFmhqmO@stanley.mountain>
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

On Thu Aug 21, 2025 at 6:30 AM MDT, Dan Carpenter wrote:
> If the mipi_dsi_dual() macro fails, the error code is stored in
> dsi_ctx.accum_err.  Propagate that error back to the caller instead
> of returning success as the current code does.
>
> Fixes: a6adf47d30cc ("drm/panel: jdi-lpm102a188a: Fix bug and clean up dr=
iver")
> Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
> ---
>  drivers/gpu/drm/panel/panel-jdi-lpm102a188a.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)

Good catch, Dan! Thank you for the patch. I'll try to be mindful of this
kind of logic error in the future. Please let me know if you have other
suggestions.

Reviewed-by: Brigham Campbell <me@brighamcampbell.com>

Regards,
Brigham
