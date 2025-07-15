Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AFB17B06517
	for <lists+dri-devel@lfdr.de>; Tue, 15 Jul 2025 19:26:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 890B310E22B;
	Tue, 15 Jul 2025 17:26:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="hLLjrNPN";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f196.google.com (mail-pf1-f196.google.com
 [209.85.210.196])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A57DA10E22B
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Jul 2025 17:26:54 +0000 (UTC)
Received: by mail-pf1-f196.google.com with SMTP id
 d2e1a72fcca58-747c2cc3419so4677177b3a.2
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Jul 2025 10:26:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1752600414; x=1753205214;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=j6MhRN6ppxrCnCAXp4O8kzdMF4x4FAEbIn2zSZ0Cd/A=;
 b=hLLjrNPNGAC9CvdYE3FfwiVLYjhzktwCLZBY77RrfnoY8PfDUpnbWd7LpzjUNu2+15
 TZLTzkRBAyKeczK3fQMMmQMKSZfOiFMF2PJSbG7rJH7rsuwnLT0gZstUDQYNYN6fNajO
 YUasEfbfJnwv43YqXt4aYwcYnIv1sJFhqvWsk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752600414; x=1753205214;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=j6MhRN6ppxrCnCAXp4O8kzdMF4x4FAEbIn2zSZ0Cd/A=;
 b=LuHM11jXOJicglTZoIsea6hVMNppaHZ5N256UhET0OxLLPRVCvWrkH8FKsGGGzzwiI
 xiUKxanf3Rvf59iu4G1Q6/TMTk1QNZUslppNbe51Hq84TNtjD3bcdRkCK9rUIwgtn3Ur
 hm7KXW1GuU9IkPGG4kjyz8yameWgmHFcZUbQkzQ52zOU+MYEYzCJVRXHT0+5seXyts3E
 oQom3/SmEQNdtX301IgxfIny2ECXQz8Uaa0COK9B1zo4eLBo2N1uoyFyHkNPQX8Sm8oV
 qdGLgMeZm1/8d5n0wTZ+X0cb1IFeHtUIUxi5r9+RivWIeP72cyWdSOl4qiYBm3UcLeJN
 apEQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVAvdYjyb4Z8rnnFcsnEytnK7L1uan0ph7URst71mTBjSOv2SDnQSi2ht/UdVKO1wblr2HFkDc5c8k=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxtpiDxgC3dfZVOBicZkCh2U9zE1bPMpKb+jx2pd1Xca90b8uzQ
 Wm74OPGoUsdEUs7jCCU7DTJEIF3gpZtO0ChJjz4RBo/Pn3DymVbH5U+XdOTnuNC/zahP07eF3xX
 mls9uZg==
X-Gm-Gg: ASbGncvjrXNUWvI/E2mZ0woqdVno66xcX1LIPAwduh/mpLZ+GOdeNqaybspd1om4fOq
 1rIfp3FWYgVw2L59jq37omJGuhno6GMAX0B1zfDHCA+A5bfsuyjpvDHtdCreo4dCVxYpYf6LNdZ
 NXPf3uOpXbaAry/q4izx7/EEOQiEej/LFmA2DgZWUiw02dpCHh5LYJpd1LwEMKsZnQvwzSWPvAX
 1qYdyO2sb4r+3Ans7b1MJQg2il+G0Fzrm0PHmhUKzihwRRrU93kpIAKUbGmTtrsEZL1JnY/2ONG
 7IhD7K8Vk9rrnosoFvg4Z3hqo2uEsEC5mniSgonU2e5MDd+vibCS+f+WmZHofku1LP7gCeS/BJ3
 /pd6/NdkAaIaeXLTleieInbpBL1N2ONLFEZmd8gtzLtmQcFFH4txlNELwpeBlSP4gyQ==
X-Google-Smtp-Source: AGHT+IHwnPHAG822v09Bo9DYbE8RpCCMhaQ0RWiaK7a8FZnx6fjMxicDxQF13H3S4z2x1QtDLFkGow==
X-Received: by 2002:a05:6a00:1907:b0:748:fb2c:6b95 with SMTP id
 d2e1a72fcca58-756ea3ca223mr227212b3a.18.1752600414157; 
 Tue, 15 Jul 2025 10:26:54 -0700 (PDT)
Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com.
 [209.85.215.173]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-74eb9dd5e9asm12626944b3a.25.2025.07.15.10.26.53
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 15 Jul 2025 10:26:53 -0700 (PDT)
Received: by mail-pg1-f173.google.com with SMTP id
 41be03b00d2f7-b3508961d43so5156688a12.3
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Jul 2025 10:26:53 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCWd3nMEnmnAldqnZEsuaV+poEVF+SbYgaZ7/rt04msKHi11ee2/kyNQWSltlRXLqYWDcu73laXCLBA=@lists.freedesktop.org
X-Received: by 2002:a17:90b:5587:b0:313:28e7:af14 with SMTP id
 98e67ed59e1d1-31c9e75a6demr6694a91.19.1752600412930; Tue, 15 Jul 2025
 10:26:52 -0700 (PDT)
MIME-Version: 1.0
References: <20250714173554.14223-1-daleyo@gmail.com>
 <20250714173554.14223-3-daleyo@gmail.com>
 <175255192501.20738.16784196888105498389.robh@kernel.org>
In-Reply-To: <175255192501.20738.16784196888105498389.robh@kernel.org>
From: Doug Anderson <dianders@chromium.org>
Date: Tue, 15 Jul 2025 10:26:41 -0700
X-Gmail-Original-Message-ID: <CAD=FV=XvHu_NnahFOcfLV4XQm_mQkO5cG3YP+acRgC9AE2m6Jw@mail.gmail.com>
X-Gm-Features: Ac12FXym5rkm10vzDYnC_hB8fozQpKkEtx52Jg_soFGip83valaWRitivphZL1M
Message-ID: <CAD=FV=XvHu_NnahFOcfLV4XQm_mQkO5cG3YP+acRgC9AE2m6Jw@mail.gmail.com>
Subject: Re: [PATCH 2/9] dt-bindings: display: panel: samsung,atna30dw01:
 document ATNA30DW01
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Dale Whinham <daleyo@gmail.com>, Conor Dooley <conor+dt@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Simona Vetter <simona@ffwll.ch>, 
 Thomas Zimmermann <tzimmermann@suse.de>,
 Jessica Zhang <quic_jesszhan@quicinc.com>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 =?UTF-8?B?SsOpcsO0bWUgZGUgQnJldGFnbmU=?= <jerome.debretagne@gmail.com>, 
 dri-devel@lists.freedesktop.org, Maxime Ripard <mripard@kernel.org>, 
 linux-kernel@vger.kernel.org, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 devicetree@vger.kernel.org, David Airlie <airlied@gmail.com>
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

On Mon, Jul 14, 2025 at 8:58=E2=80=AFPM Rob Herring (Arm) <robh@kernel.org>=
 wrote:
>
>
> On Mon, 14 Jul 2025 18:35:38 +0100, Dale Whinham wrote:
> > The Samsung ATNA30DW01 panel is a 13" AMOLED eDP panel. It is similar t=
o
> > the ATNA33XC20 except that it is smaller and has a higher resolution.
> >
> > Tested-by: J=C3=A9r=C3=B4me de Bretagne <jerome.debretagne@gmail.com>
> > Signed-off-by: Dale Whinham <daleyo@gmail.com>
> > ---
> >  .../devicetree/bindings/display/panel/samsung,atna33xc20.yaml   | 2 ++
> >  1 file changed, 2 insertions(+)
> >
>
> Acked-by: Rob Herring (Arm) <robh@kernel.org>

Pushed to drm-misc-next:

[2/9] dt-bindings: display: panel: samsung,atna30dw01: document ATNA30DW01
      commit: 0bcc0f5e98bebd05e44261df3c33d274084eab60

Given how many of these we're up to now, I'm starting to wonder if we
should come up with a generic compatible like we did with "edp-panel"
and then we can stop having to merge CLs like this. All of these
Samsung OLED eDP panels have the same power up sequence and once we do
that then we can read them via EDID or via DP AUX bus to identify
which specific panel we have and if they need additional tweaking,
just like we do with "edp-panel". Do DT folks have any opinion about
that? Coming up with a name would be a pain since I wouldn't want to
assert that all future Samsung OLED eDP panels will have the same
powerup sequence. Maybe "samsung,amoled-edp-panel-v1" even though that
sounds terrible and there's no known need for a "-v2"?

-Doug
