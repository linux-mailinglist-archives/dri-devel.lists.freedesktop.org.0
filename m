Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 277A8A47836
	for <lists+dri-devel@lfdr.de>; Thu, 27 Feb 2025 09:50:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 92BA110EA68;
	Thu, 27 Feb 2025 08:50:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="Z2duegJ6";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com
 [209.85.221.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 16F8010EA60
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Feb 2025 08:50:18 +0000 (UTC)
Received: by mail-wr1-f48.google.com with SMTP id
 ffacd0b85a97d-38dcac27bcbso1210249f8f.0
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Feb 2025 00:50:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1740646216; x=1741251016; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ks/IBwEcAklNTaxJVZ+LwL3mjgTmoZqvlq/i0v1O5/Q=;
 b=Z2duegJ6gmu/qhNwFqkmyHx75bTd6Bow50zebjN4gdMm1vs8vihQ9LGn6yD5pRJ18U
 KOK3Gb3KlDJ2YIIPU6BZN8/z1n9bWHlxBMOHwD3I3kLd98tzQ4SDZA+bz2w+01qDMSo3
 k0qbaVATirVuWn61ri4303+QG5ieKh80msNjyAV2UEWHo+fAAIEd1tarVyji/mkfWFKK
 n1uvpJwOypg5nUe5ZJ9UAPLEaudzRY3svpz3ej9G2Q9qN5T7tAXXVfQ0anJSAwJeA53C
 cUoJECGfvJKql1XHT+XJwoQne6y+RUTwVVrRxhA+GxglDzIE8806NtsSBg9cFGdW/lUE
 5+Kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740646216; x=1741251016;
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ks/IBwEcAklNTaxJVZ+LwL3mjgTmoZqvlq/i0v1O5/Q=;
 b=kvHe6a0Yez//M9AnrCXur00+dWb06OdZJbY4bXMfpEl7B2CJ1kSkNxx+OJLzssp3ED
 HpcxLIrBMvUN5T2ROnEumtqHVAOesKhldoA3yLWs0txIRxlELlwLb1l0g9dPxQmu6CFX
 6DNBqz0c6eIkjQ0n72OqCXy25MrmWPAHh/os/DjKEiSJdeRIcl6pSzEYJ/OpPTn0jMim
 MWPp/iH0hIfxrGrJMhRk1u+YsCmxHmDF47ouK63GtWLsdREcj6VJMW7v0bmVGVelgcDS
 EnsGHQcACWZsvnZjGIIb4l8ElZnS3rZFaU/ZjXvg3K1236A3qllrLrAk5akmFLu+dZyi
 6cww==
X-Gm-Message-State: AOJu0YzMU2MxarwnZ4BAOu8JJ4dSSFkJUSZ2JNQDGX+qVUelCunyPrrZ
 3BMpz7sV2Vs2GRv4nHw+Qx+AQRedTVVVviVFIY8PCRFHHcJTuf2UhplpGN6bBtA=
X-Gm-Gg: ASbGncsKVyhPnyeAJ2ZZMGYdQmN8wJjRd2zxVvMKU6mPYJsBg3go83r7FAs24801cOY
 s9PaGBqT3IXjX0GunEpFInbQf/64cbWd0i+1hMkeRJ/L1I8sm/G8vy0jNjjZ8hJgWJj8nXLj+GI
 fhV4J3xEwzmvTul4kKGH8ZBAsm3iL9RxiTToLh4Nf14Vd8LhPbV8hPzjbBzQkrhylMFfzmWm+Qf
 WNWwIkw1BY3eonW3y0JojyPK9py5cGwC32n7klySEIxjQ8lnA2cSMw8B62rfywncbkpnnZ8FHeu
 j13t2/cGtf1E51LjStyjQw5atm2A8gtjbhcCjcWzuYVcZoE=
X-Google-Smtp-Source: AGHT+IFoYeXJ4I6jLF2jC03Em3Oo6roBaewn/6DI8FuDdaLJ1uKLliib4X2jgX4JOOl4swbvnoBEew==
X-Received: by 2002:a05:6000:1a86:b0:390:dfe9:1881 with SMTP id
 ffacd0b85a97d-390e18d23bcmr1917682f8f.27.1740646216574; 
 Thu, 27 Feb 2025 00:50:16 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:8261:5fff:fe11:bdda])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43aba57145esm46894535e9.30.2025.02.27.00.50.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Feb 2025 00:50:16 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: quic_jesszhan@quicinc.com, maarten.lankhorst@linux.intel.com, 
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch, 
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
 andersson@kernel.org, konradybcio@kernel.org, robdclark@gmail.com, 
 quic_abhinavk@quicinc.com, dmitry.baryshkov@linaro.org, sean@poorly.run, 
 marijn.suijten@somainline.org, jonathan@marek.ca, fekz115@gmail.com, 
 Danila Tikhonov <danila@jiaxyga.com>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 freedreno@lists.freedesktop.org, linux@mainlining.org, 
 ~postmarketos/upstreaming@lists.sr.ht
In-Reply-To: <20250217222431.82522-1-danila@jiaxyga.com>
References: <20250217222431.82522-1-danila@jiaxyga.com>
Subject: Re: (subset) [PATCH v2 0/4] Add and enable the panel
Message-Id: <174064621558.3904283.15224037666170321960.b4-ty@linaro.org>
Date: Thu, 27 Feb 2025 09:50:15 +0100
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

On Tue, 18 Feb 2025 01:24:27 +0300, Danila Tikhonov wrote:
> This patch series adds support for the Visionox RM692E5 panel, which is
> used on the Nothing Phone (1) and then adds it to the DTS.
> 
> Before integrating the panel into the DTS, we update the DSI code to
> allow bits-per-component (bpc) values of 10 and 12, since the Visionox
> RM692E5 panel operates at 10 bpc.
> 
> [...]

Thanks, Applied to https://gitlab.freedesktop.org/drm/misc/kernel.git (drm-misc-next)

[1/4] dt-bindings: display: panel: Add Visionox RM692E5
      https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/383c772f23869df7a31dea333ec92c9e442431d8
[2/4] drm/panel: Add Visionox RM692E5 panel driver
      https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/7cb3274341bfa5977f3c90503b632986a82705fa

-- 
Neil

