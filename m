Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 525A8B2739F
	for <lists+dri-devel@lfdr.de>; Fri, 15 Aug 2025 02:19:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6308D10E238;
	Fri, 15 Aug 2025 00:19:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="B7LMkQXu";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com
 [209.85.216.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4C9E510E238
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Aug 2025 00:19:47 +0000 (UTC)
Received: by mail-pj1-f54.google.com with SMTP id
 98e67ed59e1d1-32326e202e0so1385137a91.2
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Aug 2025 17:19:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1755217184; x=1755821984;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=VleEWglR379JUi2VRPyVygfWGFpaMa+WQLnA/qDO5J4=;
 b=B7LMkQXuoswckPpTKV9pj9UOIGTyhOK1PVDY7Z+6WYS7BzxCtIw9h65OZac7ZG/RDO
 EGJMnTrb7loZw0LanozoAd/R2TTZg1/8J+UjiJbD28oRIV8BTV2Xp3k6Oxp03wOZqupM
 IBlZ95kW0QjGRetT8d3C/D3KUOpsf5xxi7/Wc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755217184; x=1755821984;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=VleEWglR379JUi2VRPyVygfWGFpaMa+WQLnA/qDO5J4=;
 b=KyMhiw0No/wG0bzUszXjO0fBtKJGyAEHim1t7fAMcvN/4RXGlPNHW5C1zVnDNyn+nB
 92DR1/jkVkY7Hi2ToeRAE4ZCYi2rLXxM471HXM6mL+F8zUNa6sS7d8nqnpGbCUnEL1+Y
 IFKheM8N/r6yuxh50CfiB1N5Qgf2DobyzKd/8TdTJ6Q2r+PzqPud/rxOh/RXEowuGxlz
 gLGpvC2UQDriRAZHXTSfbRFeGDgl7pvYBJMP4W9Xqr0wuxAGTTbthT1NHv1qtyDWX4oE
 KJhKV9O8Jr4XZFpJufFzxqTm3Uv/fQMzIjSGP/hmR60lduKdwbLIkqfspUhZCcqs6cBS
 xcDg==
X-Forwarded-Encrypted: i=1;
 AJvYcCX6NDKK6Uor9pkLhPur2nDiWbWcZT2EDJGyOfLX73s6c5lfx3KliT9f8ofmEG93z3eAwJ3ck8sNCwg=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yxwq4HEoSmDmQTJEAx/DKEG55zaSRMJWR6VFpkt6F44KZ8Fik5O
 2KlDo2jJTp8IvTQff1UVT2VkTz2AnIqMt+UOH/D+LCH8TGOAL7DqU9datXm1gd90mClZaRL7TxJ
 lY58=
X-Gm-Gg: ASbGnctBDILHG10f1vbedk3xEUynnNsDtmKDBJmfgC4Vp/HEB0EHWb6P33XmOqIWxTN
 uxWdMzFeL9QwnRIQuZcU49tryHKxhAppAtCJNBxxVCq/1Nop2xrzq3bnvlNmR6adfIvOfP62Ene
 FPBk3IbI9GnNFjy3aQz44DYYY3hXpOSmVC4f3U8dlQDXIxFgWvfuFHTAfwZWVLqPJ/J06WP/xDm
 sOJEbHl2/hYdKIQ+QrDECkNGF8jrSs8zVJnkyrNknBNKisLcvYU1yE2X094IIiHct5mQpOVQz7P
 Bq3koCBdGRN5gZKTT8mlKgjcOKQEHyLOwkkl5OJYst93ELmn97n8Pbu0Ixz9TbmJMIeS/sUHMvB
 97XglwMM5/U01wHTzV5ZJZdOt+mL0t7AjQaz/rw/BAg7y7raHRh9562o7KwbXmJjooQ==
X-Google-Smtp-Source: AGHT+IGB+tf28Mv8WxFhRonxhBVnBREPk9rTy42uz+EH1cBAtQNrdJQw+ojKmtgWpGF4qPrbWUaWNA==
X-Received: by 2002:a17:90b:314c:b0:312:26d9:d5a7 with SMTP id
 98e67ed59e1d1-32341ec55eemr313362a91.20.1755217183772; 
 Thu, 14 Aug 2025 17:19:43 -0700 (PDT)
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com.
 [209.85.214.180]) by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-b46e5074e87sm9297009a12.54.2025.08.14.17.19.38
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 14 Aug 2025 17:19:43 -0700 (PDT)
Received: by mail-pl1-f180.google.com with SMTP id
 d9443c01a7336-24457f43981so10448725ad.0
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Aug 2025 17:19:38 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCWIaF86MSe3dG5+ch6oG3rUslyfOgUA7hdjzYykVwHT0E4CboLXZZYPk+6Y6kSQoJAPeA2JqTFe8/A=@lists.freedesktop.org
X-Received: by 2002:a17:903:1a90:b0:23d:fa9a:80ac with SMTP id
 d9443c01a7336-2446d6f0ed3mr1600235ad.16.1755217177677; Thu, 14 Aug 2025
 17:19:37 -0700 (PDT)
MIME-Version: 1.0
References: <20250813125132.1319482-1-treapking@chromium.org>
 <20250813125132.1319482-2-treapking@chromium.org>
In-Reply-To: <20250813125132.1319482-2-treapking@chromium.org>
From: Doug Anderson <dianders@chromium.org>
Date: Thu, 14 Aug 2025 17:19:25 -0700
X-Gmail-Original-Message-ID: <CAD=FV=XmMwocA_oZVi2OS2Z4+5LBT4BXZE2C1mx1U-Tcs+5SOg@mail.gmail.com>
X-Gm-Features: Ac12FXzAXTp-VomUKh_3L3spBMWh_fGYcK1SRCaMDzVm6bQCCPWcJLsctftV8BI
Message-ID: <CAD=FV=XmMwocA_oZVi2OS2Z4+5LBT4BXZE2C1mx1U-Tcs+5SOg@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] HID: Make elan touch controllers power on after
 panel is enabled
To: Pin-yen Lin <treapking@chromium.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, 
 Jiri Kosina <jikos@kernel.org>, Benjamin Tissoires <bentiss@kernel.org>,
 dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, linux-input@vger.kernel.org, 
 Chen-Yu Tsai <wenst@chromium.org>
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

On Wed, Aug 13, 2025 at 5:51=E2=80=AFAM Pin-yen Lin <treapking@chromium.org=
> wrote:
>
> Introduce a new HID quirk to indicate that this device has to be enabled
> after the panel's backlight is enabled, and update the driver data for
> the elan devices to enable this quirk. This cannot be a I2C HID quirk
> because the kernel needs to acknowledge this before powering up the
> device and read the VID/PID. When this quirk is enabled, register
> .panel_enabled()/.panel_disabling() instead for the panel follower.
>
> Also rename the *panel_prepare* functions into *panel_follower* because
> they could be called in other situations now.
>
> Signed-off-by: Pin-yen Lin <treapking@chromium.org>
>
> ---
>
> Changes in v2:
> - Rename *panel_prepare* functions to *panel_follower*
> - Replace after_panel_enabled flag with enabled/disabling callbacks
>
>  drivers/hid/i2c-hid/i2c-hid-core.c    | 46 ++++++++++++++++-----------
>  drivers/hid/i2c-hid/i2c-hid-of-elan.c | 11 ++++++-
>  include/linux/hid.h                   |  2 ++
>  3 files changed, 40 insertions(+), 19 deletions(-)

This seems reasonable to me.

Reviewed-by: Douglas Anderson <dianders@chromium.org>

Given that this affects devices that we already had support for
(you're changing the behavior of two touchscreens), should it have a
Fixes tag?

We'll also need to figure out a process for landing the two patches. I
can easily land the first one in drm-misc-next, but then it'll be a
while before the i2c-hid one can land. Is it OK to wait?


-Doug
