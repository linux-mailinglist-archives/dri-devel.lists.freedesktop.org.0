Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D0B4808590
	for <lists+dri-devel@lfdr.de>; Thu,  7 Dec 2023 11:33:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F124110E855;
	Thu,  7 Dec 2023 10:33:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com
 [IPv6:2a00:1450:4864:20::135])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8E5EA10E1F7
 for <dri-devel@lists.freedesktop.org>; Thu,  7 Dec 2023 10:33:21 +0000 (UTC)
Received: by mail-lf1-x135.google.com with SMTP id
 2adb3069b0e04-50bf4f97752so605409e87.1
 for <dri-devel@lists.freedesktop.org>; Thu, 07 Dec 2023 02:33:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1701945200; x=1702550000; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=wtvnOGwWaVIVLZJl01FFTM/jnDNkRfH72/dI2rop8EA=;
 b=C6KOYlIiJOTg/sEuKw0ErMLIMEEeSHY+yanQnerSoQ9Zabae0QfEBFGUjHBA/EbcO/
 5KJkaIzO5h5zvT2zlJUIjI3bIKrIC0WFXNziB5SPwpfmBJzCTqzNNU31cmerN9gcHVnB
 ijKce3AuClv795Uxift7nrV6Y7QDriK+JiPqi3/llv7GGdh14fTGLEj7BCF4K8Q222Fw
 XuEWPcZfSZtjiMiGrhCUYTd6XB3m2XWSQbP8mrMK0TPO24qeZX2RMnnv4sgeMF+c8zVx
 80FaAjDT3Sx2M9eEJjbUMKskKStunPRZYca265D9hi26nGFdaH+qgZZk4CrWxIQxbaXg
 sPzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701945200; x=1702550000;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=wtvnOGwWaVIVLZJl01FFTM/jnDNkRfH72/dI2rop8EA=;
 b=OFe8SNCqgQk5YIVgHSZTbYvr4ILD8E/YKMMa4HG/tRRbNRjHiOTWpeIJrZAz32bPf4
 PMeRv6XJJyDeqL1fRZ4GY3ojmv4o+fAAxPysV4TbUdnnIqrE0X6x739afvO08fNWB4dD
 mBiRzzYKhu3DjkJBy1i74ECogxnfZxLDKrhSWhtQFHrXS5HEEEPdaVJfgz+ybbackzjY
 AP0Da2YCyWFSzfLWRWEwQKtuJCqw1fG6IJW58O2H83pIONsxZ/yE6lsZfeYA08FLCsp8
 56GpCJ4XAeCo+KkmRCqou/pwCIVKYduz3J2vdh/v1w/zpP0Hdwm2qLVgqPPDjxmzydVp
 DoIg==
X-Gm-Message-State: AOJu0YzbXCSMXQD356DHi8ZHl4+PDIiUlh2+8UoFX2RyYe1d/9s4NwWo
 upg02KUDILEkns9grm7VEzJXqg==
X-Google-Smtp-Source: AGHT+IGSMWWakZ98zfiQ4cPt4yvm/RbUov0IOgNHxy9Y4PELxlYrrQBKHwhxpK9eEMyi4LcWGo/Fhw==
X-Received: by 2002:ac2:495d:0:b0:50b:f4f9:75cf with SMTP id
 o29-20020ac2495d000000b0050bf4f975cfmr1424840lfi.9.1701945199891; 
 Thu, 07 Dec 2023 02:33:19 -0800 (PST)
Received: from eriador.lan (dzdqv0yyyyyyyyyyyykxt-3.rev.dnainternet.fi.
 [2001:14ba:a0db:1f00::227]) by smtp.gmail.com with ESMTPSA id
 o17-20020ac24bd1000000b0050c19506428sm138326lfq.170.2023.12.07.02.33.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Dec 2023 02:33:19 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Nathan Chancellor <nathan@kernel.org>
Subject: Re: [PATCH 0/3] A few fixes for transparent bridge support
Date: Thu,  7 Dec 2023 12:33:16 +0200
Message-ID: <170194519137.470483.63867654987574718.b4-ty@linaro.org>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231205-drm_aux_bridge-fixes-v1-0-d242a0ae9df4@kernel.org>
References: <20231205-drm_aux_bridge-fixes-v1-0-d242a0ae9df4@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
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
Cc: neil.armstrong@linaro.org, heikki.krogerus@linux.intel.com,
 kernel test robot <lkp@intel.com>, gregkh@linuxfoundation.org,
 linux-usb@vger.kernel.org, patches@lists.linux.dev,
 dri-devel@lists.freedesktop.org, bryan.odonoghue@linaro.org,
 linux@roeck-us.net
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 05 Dec 2023 13:13:33 -0700, Nathan Chancellor wrote:
> This series fixes two Kconfig issues that I noticed with the selection
> of CONFIG_DRM_AUX{,_HPD}_BRIDGE along with a fix for a sparse report
> that I noticed while seeing if these had already been resolved.
> 

Applied to drm-misc-next, thanks!

[1/3] usb: typec: nb7vpq904m: Only select DRM_AUX_BRIDGE with OF
      commit: 5908cbe82ef77f6019349c450d7f1c8b3c29bb0e
[2/3] usb: typec: qcom-pmic-typec: Only select DRM_AUX_HPD_BRIDGE with OF
      commit: 03c0343bdf8d43fee6dfe92a7b66308b60e9e77c
[3/3] drm/bridge: Return NULL instead of plain 0 in drm_dp_hpd_bridge_register() stub
      commit: 812cc1da7ffd9e178ef66b8a22113be10fba466c

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
