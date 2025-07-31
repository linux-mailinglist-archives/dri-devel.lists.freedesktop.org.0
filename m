Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A81E8B1750D
	for <lists+dri-devel@lfdr.de>; Thu, 31 Jul 2025 18:38:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 009EF10E290;
	Thu, 31 Jul 2025 16:38:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="kwKbUrHi";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com
 [209.85.214.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4843A10E290
 for <dri-devel@lists.freedesktop.org>; Thu, 31 Jul 2025 16:38:34 +0000 (UTC)
Received: by mail-pl1-f172.google.com with SMTP id
 d9443c01a7336-24022261323so25046695ad.1
 for <dri-devel@lists.freedesktop.org>; Thu, 31 Jul 2025 09:38:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1753979914; x=1754584714;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=CKgF0jnSG2wdzjoAm/Qe0GY3kcVd0498MqwU1W2jtDI=;
 b=kwKbUrHi1DbYRq3YTuLu+n1E3u3R20lYmRpZHFLJ5bdoOmlHP0Y3d0m5L/tNYz0hLw
 z3+iRSEr0Ad9Qj+Ye2hwMmzEP/5kg8DntWamjzqVHjkx4o2MQ7y3+mex9knQrPDhVg35
 Rza4FWk7RYHUhmCsinA6Y7KkgiLQt29b03CyE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753979914; x=1754584714;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=CKgF0jnSG2wdzjoAm/Qe0GY3kcVd0498MqwU1W2jtDI=;
 b=U5/5z6aohXP1Ob9YZczWuSapINF2UnED/g5k026uYoMksrtqpmIA4G5DCIdaLg3baw
 bl50mxbsg8YlcOSZMsGpdSEBfcKfMMPAA1trNFyroimTfrV4APJp/I3XU/1mnM2KJUTs
 oxcZ43eNRGHr7YDq3zgrID55Ye3hf1VQtWc2Fs55fcI7IhNGk4WQP3LYYTV6yZFpDcOZ
 hWGJEQN+f1ADnhh7o6YK4eX1wDEecrKmNQodCim3Fknwlndj7nsCNOn5RbXdYr21wW3Q
 3dknFErl4hd/0DHiFGziHOXrtvbWk5GVU/iVU7sfXihg9HZyjChaFxHNDzQv233IJHTg
 j5og==
X-Forwarded-Encrypted: i=1;
 AJvYcCXwzY2houc7ocM+TcKtc03E0BrOxiH8dxpdKhqo6EHKTyUoUR2gV32CFYDrVI/hgiZHhaoe58C+c/M=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzBM7JQkNdaXqGtZF28JFbrxzJDIrWnECP7k+1rPAJaKN9NeNy/
 R82XuWx7kJs99lKwcDF7rwOh+/mLBC46qHwJPH434JjBjMrxFTWvMHRDGZswoELGn74Q2MaR4qH
 CmI0=
X-Gm-Gg: ASbGncvwKhD5fJ0Y9YxaDJ31ZP3bQ0/ztOsj9GgN/xQuoqyE8qrApcckRwdVkD93PBg
 a83mTstRGeM5owtclbprG00HxpDHG4XANk2X2kLr1p0j5XYhWiu4M0S2ExbKGm+w/F7fMkQboGT
 snYkD2nZ1oK4KYVJM4cSmkYrFpGXfN+r+bWjnVe74EwHDszZrzFOfMNvuSmqS5Lqwmm542Qy2tJ
 WLTJHyha2SB2JGRmF9M2X39IoHII4PSE45gQHd6VeEuO71hRim5muR09KevJj7ERqu1G3mPNk3J
 qVUVqepPVwnoTwpWM7tuNQdIl6athKnHqEgHq5M8nX9B2V9Tws9oxU108y4nSm5mmZ85tATYjNl
 kyNxICLVaWMTuTdtjVcF9EYkmJcEr5kYshMpE65vrm1+TrSt54lnQRWpVCFzvk9ygr0Yo2i/P1Y
 85
X-Google-Smtp-Source: AGHT+IHxVo/RiR9oM1YgajBloONVRLX8rshRze17S+LDbw9w8HSxbSdd0DQjaM02yDYI/KXJ90nOEA==
X-Received: by 2002:a17:903:18c:b0:235:efbb:9537 with SMTP id
 d9443c01a7336-24200a161d7mr40768705ad.3.1753979913725; 
 Thu, 31 Jul 2025 09:38:33 -0700 (PDT)
Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com.
 [209.85.215.172]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-241d1ef59b2sm22558445ad.7.2025.07.31.09.38.33
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 31 Jul 2025 09:38:33 -0700 (PDT)
Received: by mail-pg1-f172.google.com with SMTP id
 41be03b00d2f7-b31d578e774so1547458a12.1
 for <dri-devel@lists.freedesktop.org>; Thu, 31 Jul 2025 09:38:33 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCXPoJaSJwQwTDe9TcvLXofPWdDOZv534nxw34N1yBaktyYCtwqJhuGSfuMMKmfX0E6w+HFjyqM9OH8=@lists.freedesktop.org
X-Received: by 2002:a17:90b:3ec7:b0:31e:a8c4:c188 with SMTP id
 98e67ed59e1d1-320da5e8dc3mr3455804a91.14.1753979912440; Thu, 31 Jul 2025
 09:38:32 -0700 (PDT)
MIME-Version: 1.0
References: <20250731101344.2761757-1-treapking@google.com>
 <1519a7c3872a59b7b5f12e99529237035499bc26@intel.com>
In-Reply-To: <1519a7c3872a59b7b5f12e99529237035499bc26@intel.com>
From: Doug Anderson <dianders@chromium.org>
Date: Thu, 31 Jul 2025 09:38:20 -0700
X-Gmail-Original-Message-ID: <CAD=FV=VBhamkffZhVuMEoiwfAoeHRzSORo+=eqMLYVsSBMO-bQ@mail.gmail.com>
X-Gm-Features: Ac12FXxw9dAen_QOos16fn3qCdR3ov_wvt_j4mVYuHYXkV0ba_8K0aSL6du24TY
Message-ID: <CAD=FV=VBhamkffZhVuMEoiwfAoeHRzSORo+=eqMLYVsSBMO-bQ@mail.gmail.com>
Subject: Re: [PATCH 1/2] drm/panel: Allow powering on panel follower after
 panel is enabled
To: Jani Nikula <jani.nikula@linux.intel.com>
Cc: Pin-Yen Lin <treapking@chromium.org>,
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <quic_jesszhan@quicinc.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, 
 Jiri Kosina <jikos@kernel.org>, Benjamin Tissoires <bentiss@kernel.org>,
 linux-kernel@vger.kernel.org, 
 linux-input@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 Chen-Yu Tsai <wenst@chromium.org>, Pin-Yen Lin <treapking@google.com>
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

On Thu, Jul 31, 2025 at 3:31=E2=80=AFAM Jani Nikula <jani.nikula@linux.inte=
l.com> wrote:
>
> On Thu, 31 Jul 2025, Pin-Yen Lin <treapking@chromium.org> wrote:
> > Some touch controllers have to be powered on after the panel's backligh=
t
> > is enabled. To support these controllers, introduce after_panel_enabled
> > flag to the panel follower and power on the device after the panel and
> > its backlight are enabled.
>
> I think it's *very* confusing and error prone to call follower hooks at
> different places depending on a flag. The hook names and documentation
> say *when* they get called, and that should not change.
>
> I think the right approach would be to add .panel_enabled and
> .panel_disabling hooks to struct drm_panel_follower_funcs, and have them
> called after panel (and backlight) have been enabled and before panel
> (and backlight) are disabled, respectively.
>
> In i2c-hid-core.c, you'd then have two copies of struct
> drm_panel_follower_funcs, and use one or the other depending on the
> quirk. You can even reuse the functions.
>
> I think overall it'll be be more consistent, more flexible, and probably
> fewer lines of code too.

Yes, exactly what Jani said. We've wanted to do this before, but I
just never got around to it. There's even a (public) bug for it in the
Google bug tracker and I've just assigned it to you. :-P

https://issuetracker.google.com/305780363

-Doug
