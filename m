Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 04F79C1D534
	for <lists+dri-devel@lfdr.de>; Wed, 29 Oct 2025 21:59:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6461A10E84C;
	Wed, 29 Oct 2025 20:59:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="bLhZSjAS";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com
 [209.85.221.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4D09310E858
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Oct 2025 20:58:57 +0000 (UTC)
Received: by mail-wr1-f45.google.com with SMTP id
 ffacd0b85a97d-3ee130237a8so220505f8f.0
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Oct 2025 13:58:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1761771536; x=1762376336; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=kdSLLw0p3z7nGivp6vT1oG25P9JcVKw4nemoD8BNgY4=;
 b=bLhZSjAS+mwgB1qXdbBEfTKs1Yv7nMtSVW1OmgbKF7LF/TrKlgd+uUokHNLJzYX4+4
 YymXhD3z/adDsyYU8cZlKWKzxT8LdJpxkFTuvsYtEaMTBYPuVVrA267sdY98aUmZ7a2M
 Q28Zn78jQrYR1elRAOvomVXBisio8U31arPk/UCp5eaWndfWbqUyyJFMoIm7BiPfbPnq
 tbNGUqAfFB8Twm7KnrovU4tull+QuI6e1abaM2iJGavoFkgksSTVeH2LH3I3rpBW8qyx
 sR/Rhs56xdaWJhOzKSMXmks6oHLhA3M8axtukPshJf+KBcB54PYLk6MyTCziaRPqmdjl
 5WLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761771536; x=1762376336;
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=kdSLLw0p3z7nGivp6vT1oG25P9JcVKw4nemoD8BNgY4=;
 b=kwJc3/b6kZhJXWaVpRFaAI/HqrlJmYyMjsmRaaEOH7/6SOHCwioSv/Pqn7lvKiqLt0
 zgJsYv0FNsFBkUg4su6RSeddyjEpOfrdaAquLtDsSxgD8mAusa21yMSxlZ9YSAltssjN
 hw5rkeRFqSEhfCHcT+2RJLPFVPm4vRiIdmj88I+ytu/Uz++O91DDfxJVQQjmoProa+dY
 wNJmP1slc+OUb8A/8nMQLILdnyeffs2o09EgEMQotn5ycRQ/u3dCCCcmkj87n4OYD6Ra
 rIgXUFJ+Utl17yz3UEqdpyvgvfEi32TGRnfaRM1Js/icQtbeooRMs2AP+04CcxIdmE67
 90kw==
X-Gm-Message-State: AOJu0YwVy4HdnYVYn8zmqOB9tY8s8mZ1oH+WngMuLHMSD8TdydhrU2wi
 GHZoGtzsgAv1hj6bjIXRS0cL4SE/62e2Mf87EczYOYh5aLGfaOmFkmZgpg5ZOwJRBZk=
X-Gm-Gg: ASbGncsObZnffiB/17vONUP4QRmVPLT3I+E9ihVx3cZS6MsyzCLhc6ifrbWbVJuHQmU
 WDqRUqGU40e4Ef8smFMvnkgMqtMK/iB9Wh5wjw7Cdbf8wEn0y8bJyBYmOQ8YRn8pnG4xMWGJJqY
 Cn8+mf+18JRUsnXIxa9I0slf/PRceViPT2qLSNdVqak177bTZZECA3hVM8uAcWUXtj8eZQcNpnY
 bICCk74+aec+k2PTGzI0e3iUkz9KBSqAfiS8R6BIKnZSPSvq7VIxm6sKx2yamaTJMSMmujSugJI
 jehF1q8Jy7lf2RHT1YBUYTB0F59KsDIeNIU+A3lOZc4J7YV/Oy+1RIuvJS+hsCJP3kniwNp4FFZ
 z2Xywt7+6COU0iT0BIeLdEryxcDJzVtghitjjWBSN7oT44Cn4U2sqQ2/CaF6zlTl67rMCJOwtez
 aPqRYRueRqTRTR7qhWr1eb
X-Google-Smtp-Source: AGHT+IFVMHyp562BYRGWCjnik15BnXNlOH4y5IHiux9OZ9GHHrHGAoYYJnD441NGHvz13Cvns71ZAg==
X-Received: by 2002:a05:6000:2481:b0:426:d5a0:bac8 with SMTP id
 ffacd0b85a97d-429aefda6a6mr3692849f8f.56.1761771535660; 
 Wed, 29 Oct 2025 13:58:55 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:3d9:2080:52eb:f6ff:feb3:451a])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-429952ca569sm27596082f8f.12.2025.10.29.13.58.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 29 Oct 2025 13:58:55 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Sebastian Fleer <dev@dwurp.de>
Cc: Christoph Fritz <chf.fritz@googlemail.com>, 
 Jessica Zhang <jesszhan0024@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Jens Reidel <adrian@postmarketos.org>
In-Reply-To: <20251029124007.232333-1-dev@dwurp.de>
References: <20251029124007.232333-1-dev@dwurp.de>
Subject: Re: [PATCH v2] drm/panel: kingdisplay-kd097d04: Disable EoTp
Message-Id: <176177153507.2036161.11759341734941100816.b4-ty@linaro.org>
Date: Wed, 29 Oct 2025 21:58:55 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3
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

On Wed, 29 Oct 2025 13:35:28 +0100, Sebastian Fleer wrote:
> Since commit d97e71e44937 ("drm/bridge: synopsys: dw-mipi-dsi: enable EoTp by
> default") panel output on an Acer Chromebook Tab 10 (google-dru) is corrupted.
> The tablet I use is equipped with a kingdisplay-kd097d04 panel, disabling EoTp
> restores the correct functionality.
> 
> 

Thanks, Applied to https://gitlab.freedesktop.org/drm/misc/kernel.git (drm-misc-fixes)

[1/1] drm/panel: kingdisplay-kd097d04: Disable EoTp
      https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/d8eb00bbc628c8916ab0da2bb80059d48aa4512e

-- 
Neil

