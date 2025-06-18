Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 272C7ADEE21
	for <lists+dri-devel@lfdr.de>; Wed, 18 Jun 2025 15:42:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2CD4810E835;
	Wed, 18 Jun 2025 13:42:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="hfPkObP5";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com
 [209.85.214.176])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C55CD10E835
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Jun 2025 13:42:38 +0000 (UTC)
Received: by mail-pl1-f176.google.com with SMTP id
 d9443c01a7336-236377f00a1so62571075ad.3
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Jun 2025 06:42:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1750254158; x=1750858958;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=eEO+Aw2g4Ye3zeBEqfCg7cLkZgwkmnjuAHAb/18yzBw=;
 b=hfPkObP5EKRCp0VS1fGPmzxfEFQCooe0FlijyBiw9Gp244si4W+U05F+81KYd1WOVd
 uT5tADgA/hUza1IO1dIqjKig+B5EVQ+fiXg0eWafNKqRKWPfua3W4ruUB9ATWXI4T748
 bfxKC6SEHjj3eUwd+Z9t38Y4im5i/ZDfNjrO55/JDpV7xfOh79cuJD8Lo2rO1IDXkEYb
 7Sa/DQwuX2qn3CllUKu/3S+3xyl1huRTQmKL5r7ierGTi30AGDQ+NtvBoN2m3EvdXSuT
 9KK6eD/NSrHQC8sImf0yGahQevMpE9+n+LpELFVWUjyRANyq2xEIvchj60bus//jJmal
 8F8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1750254158; x=1750858958;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=eEO+Aw2g4Ye3zeBEqfCg7cLkZgwkmnjuAHAb/18yzBw=;
 b=Ig93hGDwUp2NTw3qpm16+Pvvxnut3A5dzv0HEzfNw8lCbMjLms28f1GZ7QeAQ42Pd9
 WDMvMe4reh5xL43tRHvmqQl3aA+Hugwf9Zc+RPyXRQMen0wmnU0FVTTsBuJVBk3WSMK0
 KUtTS1Me9VR5NtARKbw1M8AQzSey3vWroXs5kzFzdS57jcok0lvO7clbjH1uFN1bPuxi
 GNHWhRDezQkHGs4ghtymgjmGqJkH2O3xboE5N0ZF0LZZt1k8ORuvkWvVZoGcz3M1smcY
 CcbnIvXS7Zwcp8MxCD/VEvJy2+BlyP5L2Yx5CvE5AovFhucRb6jw0f7D5FqhohxBSLow
 Aj3g==
X-Forwarded-Encrypted: i=1;
 AJvYcCXb9y115KV7NPv+LkRfDJBvdcZUj3HpYe2A2Kl8BpT6ySfC6Fcgl3dH6XzsLxaAK3HWvDELK/m0jk4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yxa0BKjgMbKO6GHq/nVpqKyX3KiUnriXyFNbjEA50uakWfHzsla
 RiZerbnHCsMCIRxAA9lILVE7FdCFic4tYmpIWpxCPVKiWg3qQgq/C6sOFUbYhHeJx3KdX1dl/hK
 y7SOIzJk7Qia3R9D3bj1eNzMtPRR/oKgJF1zKtO6cNQ==
X-Gm-Gg: ASbGncv76lWaFVdKhB4WnzTaCoCIiRFu00MjTakOn5flngsIoBzbjzZX/dA+yqMRVN2
 duWRwdWgkWGhp463ir9F/wY+pvYmnDh61uhHJh/WhlXCMxrYtb+8IaYEdq8QUAvcu6RMBQ8R+XE
 y6EDcQ4mD8d82YyYjQ3mGBqXaEL8pMiUdheD5cGilG4Y0Iwh6iV9ZVq+bSXP13UH9eoXDNm+Cn9
 w==
X-Google-Smtp-Source: AGHT+IE9RRF0iBcbNFXcUb8SkJRKabvVWjmiE253LTqxfYGXwndQn6/QT3ohHBsxRY1SrMjuBvVMrN/uQK3qBsQXw3o=
X-Received: by 2002:a17:902:cf0e:b0:234:d7b2:2aa9 with SMTP id
 d9443c01a7336-2366b1221femr273087145ad.29.1750254158312; Wed, 18 Jun 2025
 06:42:38 -0700 (PDT)
MIME-Version: 1.0
References: <CGME20250618102229eucas1p2a5d38013ee52a8a4a10d43449073e79e@eucas1p2.samsung.com>
 <20250618-apr_14_for_sending-v5-0-27ed33ea5c6f@samsung.com>
 <20250618-apr_14_for_sending-v5-4-27ed33ea5c6f@samsung.com>
In-Reply-To: <20250618-apr_14_for_sending-v5-4-27ed33ea5c6f@samsung.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 18 Jun 2025 15:42:23 +0200
X-Gm-Features: AX0GCFtH0tHQpQVePKw4GRZe0_n4DXj2kfns9aQPVtqgBIhjJI4B39bCzPcceGU
Message-ID: <CAMRc=Mcv6KJOCypOHF-KtFk6N-Z=eoMCqH0KuuUND=8J1YvrEw@mail.gmail.com>
Subject: Re: [PATCH v5 4/8] drm/imagination: Use pwrseq for TH1520 GPU power
 management
To: Michal Wilczynski <m.wilczynski@samsung.com>
Cc: Drew Fustini <drew@pdp7.com>, Guo Ren <guoren@kernel.org>,
 Fu Wei <wefu@redhat.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, Frank Binns <frank.binns@imgtec.com>, 
 Matt Coster <matt.coster@imgtec.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, 
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
 Ulf Hansson <ulf.hansson@linaro.org>,
 Marek Szyprowski <m.szyprowski@samsung.com>, 
 linux-riscv@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org, 
 dri-devel@lists.freedesktop.org
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

On Wed, Jun 18, 2025 at 12:22=E2=80=AFPM Michal Wilczynski
<m.wilczynski@samsung.com> wrote:
>
> Update the Imagination PVR DRM driver to leverage the pwrseq framework
> for managing the power sequence of the GPU on the T-HEAD TH1520 SoC.
>
> To cleanly handle the TH1520's specific power requirements in the
> generic driver, this patch implements the "driver match data" pattern.
> The pvr_soc_data struct, associated with a compatible string in the
> of_device_id table, now holds pointers to platform-specific power_on and
> power_off functions.
>
> At probe time, the driver inspects the assigned power_on function
> pointer. If it points to the pwrseq variant, the driver calls
> devm_pwrseq_get("gpu-power"), requiring a valid sequencer and deferring
> probe on failure. Otherwise, it falls back to its standard manual reset
> initialization.
>
> The runtime PM callbacks, pvr_power_device_resume() and
> pvr_power_device_suspend(), call the power_on and power_off function
> pointers. Helper functions for both manual and pwrseq-based sequences
> are introduced to support this.
>
> Reviewed-by: Ulf Hansson <ulf.hansson@linaro.org>
> Signed-off-by: Michal Wilczynski <m.wilczynski@samsung.com>
> ---

IMO it's much better this way, thanks.

Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
