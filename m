Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 266AFA7F44D
	for <lists+dri-devel@lfdr.de>; Tue,  8 Apr 2025 07:42:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9084810E00E;
	Tue,  8 Apr 2025 05:42:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="gustUHa3";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com
 [209.85.128.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3616610E0B1
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Apr 2025 05:42:44 +0000 (UTC)
Received: by mail-wm1-f51.google.com with SMTP id
 5b1f17b1804b1-43ede096d73so20469525e9.2
 for <dri-devel@lists.freedesktop.org>; Mon, 07 Apr 2025 22:42:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1744090962; x=1744695762; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=hNlU9IW0/3w2Hi0+ap/18NdS+AKkCCQ6NPlM5h3+t2Q=;
 b=gustUHa3PF6lu6q0ZDIXd578zctnQz8sLDFADdi5+5Qx/qQd+DadV9CG3RZ6465jTp
 pOvXqWa+pZURETMs6iLWcr+wsJOukM8g0LMB24aI4CWmfA0HsqDMxlcvN0jA7rNHAkc1
 kzz8HsIjluI7HEVruOAjQpjcN24vxTUVMTABYlROGFK0p774grKCBe5pyPtf7kxg9wRw
 WkZ0BMl2tg/AOdoz1K/EOY0Cv1jAhjVgHGUb738zyAp7VAekzOt3xgQYi62M7w6NT5Gc
 ROW6nnLObhwNg0/yKiTc/DsYVdWXtAuofkLPll/pNx+zFBwVt9GHBKERMJC1cv58D3An
 RC1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1744090962; x=1744695762;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=hNlU9IW0/3w2Hi0+ap/18NdS+AKkCCQ6NPlM5h3+t2Q=;
 b=kB1+e/T7OKtCUqSUKMSPmfCcy89vJsqKC2uYcMJXYh26StKbWVe1r+oNZYitTp2CIg
 I2YtfhkZntYnod24sBw+1KfHi5oFqyRus4S/3Z7OxoQpQuy7o1i4Kg+2lGSIHVFcPxnF
 f11EohfinPxtWKTNRxM8GBeaQD/qVuCDlplMVNM+3r17hPLM2qlgctScgmDiiCwLpRc8
 alYGJ4ycxmYJ9AkYzm+iYvrkVzHarx2drQLihLABo5+dB/HQA4bIrTf/dWhlAbG4v4lR
 zBwkWxdVbF9faDSVOlBob5OqYVBBG9P2BKRaLfD0mQCynuoflmNj0rRsvwaTwfCrxglo
 2a7Q==
X-Gm-Message-State: AOJu0Yzb3MjN9zvxSGUBcEeFU+vknV86Lr+JPvrwcpgx27hy1Nvt3LvJ
 9xhsnEawaA9UELEquozTc4W04NUs5wyN0wsSDusNGWKVi55TM04fp6b9Rr0lpYtrWoD4qVq/V8l
 Zt42Y7N6dipnx+37NSyhkkOAaBkk=
X-Gm-Gg: ASbGncu//IgRdWtxiazvqFgAJmvZjdnNMPOFUfXTLxuZRlcsXKGpFwCwjhl+CM+SU/i
 Z+MWb65lp5ukZsYMvvO/6VN4m+v0+tiQp/dV8UINIjd0rSR5ODVJUjwHndmoaJbEK4jEkwPOG42
 cjc5apGbHLeWi+N92ynfxbAyMvqy4=
X-Google-Smtp-Source: AGHT+IHmnqwp7fYLD9r0VzUZ9uVobcEtY3ANbSUHe5IqHvpSb08zJTe5lq7GR0A2HHq8TuJDFRWbEUa4D0HngXEzQro=
X-Received: by 2002:a05:6000:420f:b0:39c:30fb:fd97 with SMTP id
 ffacd0b85a97d-39d07ad8accmr11712104f8f.1.1744090962383; Mon, 07 Apr 2025
 22:42:42 -0700 (PDT)
MIME-Version: 1.0
References: <20250223153244.149102-1-clamor95@gmail.com>
 <20250223153244.149102-3-clamor95@gmail.com>
In-Reply-To: <20250223153244.149102-3-clamor95@gmail.com>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Tue, 8 Apr 2025 08:42:31 +0300
X-Gm-Features: ATxdqUFll3jD8BcEvaAkgpR3n64WmaGGcMsqo5zGxP_xFPaWja_GHAYRiR6wr5A
Message-ID: <CAPVz0n21dv1faVeWaRRtA=06D4Ve65cwP_nYF=f=orv_d67oWw@mail.gmail.com>
Subject: Re: [PATCH v3 2/2] drm: bridge: Add support for Solomon SSD2825
 RGB/DSI bridge
To: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Svyatoslav Ryhel <clamor95@gmail.com>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org
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

=D0=BD=D0=B4, 23 =D0=BB=D1=8E=D1=82. 2025=E2=80=AF=D1=80. =D0=BE 17:33 Svya=
toslav Ryhel <clamor95@gmail.com> =D0=BF=D0=B8=D1=88=D0=B5:
>
> SSD2825 is a cost-effective MIPI Bridge Chip solution targeting mainly
> smartphones. It can convert 24bit RGB interface into 4-lane MIPI-DSI
> interface to drive display modules of up to 800 x 1366, while supporting
> AMOLED, a-si LCD or LTPS panel technologies for smartphone applications.
>
> Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> ---
>  drivers/gpu/drm/bridge/Kconfig   |  13 +
>  drivers/gpu/drm/bridge/Makefile  |   1 +
>  drivers/gpu/drm/bridge/ssd2825.c | 821 +++++++++++++++++++++++++++++++
>  3 files changed, 835 insertions(+)
>  create mode 100644 drivers/gpu/drm/bridge/ssd2825.c

These patches had no activity/feedback from maintainers for a while,
so, in case they got lost in the depths of email box, this is a
friendly reminder that they are still relevant and I would like them
to move on.

Best regards,
Svyatoslav R.
