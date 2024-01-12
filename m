Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 299EF82BCDD
	for <lists+dri-devel@lfdr.de>; Fri, 12 Jan 2024 10:21:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A522910E0BE;
	Fri, 12 Jan 2024 09:21:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [IPv6:2a00:1450:4864:20::336])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AED5410E0BE
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Jan 2024 09:21:20 +0000 (UTC)
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-40e5f3b390fso14270005e9.2
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Jan 2024 01:21:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1705051279; x=1705656079; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ohEQNypPE08kiw2att6VCcKTiVWEo1JhfVJo2YCJUyM=;
 b=lYD3aIqqDhs9YzJLKrEybz0qYKYUHX3C6ns8JR5AIkwcZKYsy2MzhT5k8Cbwob0boN
 g9zfP4gdENjera27sQ4frYdnHFK6MYvaRXW9320kOnI0D4oipOYoC8B0y25igtu+dI4D
 YUbkQBg9ZgwNe8ScCjr2QpUq+KhmArqAIXp0258Q6NLwsoi6X92CbnFK9cqjFOoT+RT7
 6JAPph/dhn1SmTUUVJTJ71CMHSdF9EfUt+YaiOekq8h4JE4FT9JoyTaK32Mfh31ykA0j
 KpvEseshPOFysnuieHaedDH5ywA1coZcLvMva6ADyyjMwmJMSyEMxGJeTGcROoyrrUAy
 uNLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1705051279; x=1705656079;
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ohEQNypPE08kiw2att6VCcKTiVWEo1JhfVJo2YCJUyM=;
 b=Y0dL66VMBDKWPYIrhpSsB3lJPHJB8qA7hkUKRCNHrXdNEcic2HOHHMIqIn7pmFNGfY
 12/m0F0lkAWsXP+Prm7IlG//OgsJ9zbDiyP7hqi4Ko5m04yGssunB7Q/oAU/QZjYWhe7
 3Fa/pfbIi6xSSew04tmgD2BlBxgiuEy0Cez30FX+CuTRu7UlZY30+lOk2u0v2lMIznrz
 i9F93Csrsja7ojsoFGmWzFT8y1tFi3ouDHJ4tOVCdC016pQEIx6lYF8jFLqRXYztR1lB
 OetDU2OHZVTFnMunnO10dpvO12Pe0tm0pKXUBsRwZVJjPYGvuqa4ojjkpQhFkABmw7kk
 3/OA==
X-Gm-Message-State: AOJu0YyqNxd0qEtvuai3CUdKbLFSckhfgJuE63DMV0OvCk25IRN9gYHr
 ZHqhlfu8dqIaMIsm5vcNMHINHm7VnjDpvw==
X-Google-Smtp-Source: AGHT+IEmZ8qgB6DASyoe2Ra6PBqnoUOJg8QPtOsnpW7+LFzCGQRM7Xw6w6i7pabT8no0MtXOwxXsEg==
X-Received: by 2002:a05:600c:6548:b0:40e:52a7:ac58 with SMTP id
 dn8-20020a05600c654800b0040e52a7ac58mr741796wmb.65.1705051279078; 
 Fri, 12 Jan 2024 01:21:19 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:8261:5fff:fe11:bdda])
 by smtp.gmail.com with ESMTPSA id
 k6-20020adfb346000000b0033671314440sm3324909wrd.3.2024.01.12.01.21.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 12 Jan 2024 01:21:18 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: Thierry Reding <thierry.reding@gmail.com>, 
 Sam Ravnborg <sam@ravnborg.org>, David Airlie <airlied@gmail.com>, 
 Daniel Vetter <daniel@ffwll.ch>, Jessica Zhang <quic_jesszhan@quicinc.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Alexander Stein <alexander.stein@ew.tq-group.com>
In-Reply-To: <20231012084208.2731650-1-alexander.stein@ew.tq-group.com>
References: <20231012084208.2731650-1-alexander.stein@ew.tq-group.com>
Subject: Re: [PATCH v2 1/1] drm: panel-simple: add missing bus flags for
 Tianma tm070jvhg[30/33]
Message-Id: <170505127809.891379.10280315370464408426.b4-ty@linaro.org>
Date: Fri, 12 Jan 2024 10:21:18 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.4
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
Cc: Markus Niebel <Markus.Niebel@ew.tq-group.com>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Thu, 12 Oct 2023 10:42:08 +0200, Alexander Stein wrote:
> The DE signal is active high on this display, fill in the missing
> bus_flags. This aligns panel_desc with its display_timing.
> 
> Fixes: 9a2654c0f62a ("drm/panel: Add and fill drm_panel type field")
> Fixes: b3bfcdf8a3b6 ("drm/panel: simple: add Tianma TM070JVHG33")
> 
> 
> [...]

Thanks, Applied to https://anongit.freedesktop.org/git/drm/drm-misc.git (drm-misc-fixes)

[1/1] drm: panel-simple: add missing bus flags for Tianma tm070jvhg[30/33]
      https://cgit.freedesktop.org/drm/drm-misc/commit/?id=45dd7df26cee741b31c25ffdd44fb8794eb45ccd

-- 
Neil

