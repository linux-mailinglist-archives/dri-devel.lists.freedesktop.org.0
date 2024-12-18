Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B1ED59F62CA
	for <lists+dri-devel@lfdr.de>; Wed, 18 Dec 2024 11:25:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B43EB10EB4D;
	Wed, 18 Dec 2024 10:25:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="e+MWcV8I";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [IPv6:2a00:1450:4864:20::42b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B2BA510EB4A
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Dec 2024 10:25:07 +0000 (UTC)
Received: by mail-wr1-x42b.google.com with SMTP id
 ffacd0b85a97d-3862df95f92so3193164f8f.2
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Dec 2024 02:25:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1734517506; x=1735122306; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=lmYDCy+XC+w9ohLw9fXC9Uy6BO2my8eh4Tt7Ki7APA0=;
 b=e+MWcV8IsjZBPhKBtigeSeliFZcn/KuHYrny6IfWwHn0gCeUwHTHcshfyS66C3v1a/
 hSJ4Ax/3Ox4fv4y/GXO1XtWPCy25GQeg9l7ZNL0jrnMuqxOHBwMslyr6FB8Z0tSCPzMX
 k9ykKNj2o0mEF30N47CPpWJHsGgAEon12n8FCXoqhUm5gB0uPurMMwSmavEO6foLtiS5
 q31uF8QHOKTlVQa2QGPqm3TxNQZFMCdK1ltXDWiJgS57hOTUu9B5aRpVm6ym8tDFB22Z
 I6bnZ+QyFwpvxXRi07ad1q6G6alzEICA9QZvLllbmn+CMEIjmLE+aK8RPWsYOdTid9lB
 nwmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1734517506; x=1735122306;
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=lmYDCy+XC+w9ohLw9fXC9Uy6BO2my8eh4Tt7Ki7APA0=;
 b=uocICE2kk2DWt5v5ulidqR3BVdbLP9QMJLeXtWpzF/SxU/IhIjXOV7+RzGfBjkHEqL
 DL9X2MMro9ZuX6Hbvl+pJw3vtGNSGfap3Bj8C3zy22cqOyNsepxjJXHaQp/L9Z7VqoER
 IXqn+i33TzYfIPkUa305JcVFcevU5k4HsPek61/6Qn/CbwDRhb3Ay7RdYuB5iJ8qFT0G
 w4i1y5LPV2HaqzUYB2EScmh57Hv19jBaElmc8yscfjfVffcaXyznnuDtr3gpCiO55Erp
 LScmgrByYJi2NulETYcMQx/4ZZDkmx+vXi0oRqyYYzafOY4ui4tO3nL+3GNE06xLoUbA
 Ogqw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXnMVf/ZdZsSiqBTHMDxSq8bGWeso+Jr1wi/TRRA0ExeWc295bwsHIpjwGzEFLY4G0YMZmAHPhO0MU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwhmUoCrazCco/6k4+OytjwGvR/zlbdjkbtb3saiLQmrHjkDjEH
 8AHQKybrrXdX0FWXir+bY+cyg51z/Bw5VaGewUfzD57z6eUKBQdGFMxMxWZ+h6I=
X-Gm-Gg: ASbGncsKny08oxb/zr/rEPLWu1Qp3rCQ813k46nMwTRInXvjSHo8vFN6gTf1ce0QTIv
 gwP02EzkGgA2h4Zv51vfxVy6Intb/cYy6xkF8nlwbw8C5nodSK64EPn2CUluT0IsRy3Lh5T/uYi
 NJT7PNEhoZBUel7VBS6ekSKj1UfyednMW3E/tFjrRJFDOMsYLwMdo/7lWF05kmnfLKdVtFCR1F6
 obXyV/6FS5hHpFO65v5Kk+nHh0WXKawji205weqROvqRrJYm9yf8IdvSN2q0sFN9nmkFGklSg6T
 +A==
X-Google-Smtp-Source: AGHT+IEJYIVaDHwfsZ87A9DtFBxqslt9Ar0NBezmUB6Tjpxfov6W1RYIU3gAGNxJktp4lUawP+Y+HQ==
X-Received: by 2002:a05:6000:4b08:b0:385:f631:612 with SMTP id
 ffacd0b85a97d-388e4d5e7f6mr2096176f8f.17.1734517506264; 
 Wed, 18 Dec 2024 02:25:06 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:8261:5fff:fe11:bdda])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-388c80613a9sm13561558f8f.101.2024.12.18.02.25.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Dec 2024 02:25:05 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: Jessica Zhang <quic_jesszhan@quicinc.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20241216-tianma_tm070jdhg34-v2-0-0b319a0bac39@bootlin.com>
References: <20241216-tianma_tm070jdhg34-v2-0-0b319a0bac39@bootlin.com>
Subject: Re: [PATCH v2 0/2] drm/panel: simple: Add Tianma TM070JDHG34-00 DT
 bindings and driver support
Message-Id: <173451750534.2945394.16807167795981338794.b4-ty@linaro.org>
Date: Wed, 18 Dec 2024 11:25:05 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2
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

On Mon, 16 Dec 2024 17:21:33 +0100, Luca Ceresoli wrote:
> This small series adds DT bindings and panel-simple implementation for the
> Tianma TM070JDHG34-00 7" panel. Due to how the datasheet computes the
> blanking time, a quirk is needed in the timing implementation. A comment
> documents that in patch 2.
> 
> 

Thanks, Applied to https://gitlab.freedesktop.org/drm/misc/kernel.git (drm-misc-next)

[1/2] dt-bindings: display: simple: Add Tianma TM070JDHG34-00 panel
      https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/0c8d3b4a0342c5feb6887d18efd1273d80530674
[2/2] drm/panel: simple: Add Tianma TM070JDHG34-00 panel support
      https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/bf6daaa281f7d11fcd91a68935142916afc51c53

-- 
Neil

