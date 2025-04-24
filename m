Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4029CA9A5BF
	for <lists+dri-devel@lfdr.de>; Thu, 24 Apr 2025 10:22:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0D75810E45D;
	Thu, 24 Apr 2025 08:22:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="hSyyJ4Og";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com
 [209.85.128.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D757D10E45D
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Apr 2025 08:22:14 +0000 (UTC)
Received: by mail-wm1-f49.google.com with SMTP id
 5b1f17b1804b1-43cfebc343dso4294085e9.2
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Apr 2025 01:22:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1745482933; x=1746087733; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=m+cuvfdJp/+1KpKEzKZeai9pso6C//0kyG+w0txFSBk=;
 b=hSyyJ4OgahAPwqiEU2VOs4Crgw1T+PI8SJ153fFFUTo5Xzkxcimk48i5aOgMCwU0jS
 vgIAUc40Bnr4uLeumwf9RXzbDHpMmRBinZlMSseMsu9QU8sfuJDT/klGm5+/wkhSHqTR
 MLYtkzGygklStUyeYXhEFuzPg2D7YGPGL5PmUC+dSYUfULKQDqT9ybtzntV1d9zLvEat
 OvlhsCGchp06xekMBDb0KRueFWwxNWDngi3Tj5cP2EsB9ZBWyRY+rg2JcyPUTHlP0sV3
 zPjFpoD4PI44WFzSCobWyIY068eKyGEFppWXwitmPFXhMeSo7zJB892IVlhSAQjsrZ0l
 okGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1745482933; x=1746087733;
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=m+cuvfdJp/+1KpKEzKZeai9pso6C//0kyG+w0txFSBk=;
 b=pXHdAZF0Kh5eO23pkcun9O9y7mpB6Rk0N1379+Srb+itVLhvVoqXWiKfVwTVLmeH74
 vfb6qKZfaOB30NnBsPKwZ9AnhzEhIpQ9xCHct/GMPrR/KI4lTMoKXlYFRZKR3DHD2bkj
 TXueqXJODlr0tByyC/phQSWjoxQd4Jeziwnonw8iJ1fIhxXfvTl4T1jzUs8LsgNwBXIs
 lDOjWxEDOaa8lvrZc3fNugftnL+kyLmEamDKW326OrR1gFk/0nVVuFviDKpBF8WLURjy
 Lzi8WSVNQp4v+nOoeJoItD8Kg7HQHdCHKwjgzpXn0LstK7EdPJ/C6gD1AmYR/PMtYhRP
 ENyQ==
X-Gm-Message-State: AOJu0YxBWQfnHoQcXaIWx1+mX5RjZMESUOub/+al1TSCBDTO5HbIR7o3
 SFvEhHgKJWFYYaCnv4WYnvCx47d+3cVxLlEd26mOy27e/PdbyfhXHK50XRahY3E=
X-Gm-Gg: ASbGncu3caAXm81cFIYWWZKMk05OWQBM0aKywX33tHo5R6yF7WByhdv1wczDDWzIIUY
 AKpDg4ogJ2XbEx4hJQuyG8Gbu5n3S/XLJovK9Fy2p83sri2BarVIhgxpL2CLoDNEhHKGPMrzTse
 1d9bKsKkGItuBSwQDWYtfJlyPzIcWUZPAWTVp89LWrHXkl2AfIX2KyI3h8KUXUnciPk36tGfWio
 1erHgjf0Iflue6gHsDvAZCECIuayUqK0SMxX+Ugjyzkw99CHcHklEjokbT699nyKzCgtBa2HmSV
 dBsm/ZjqQDp/NFlNMcTDubkktG2u+xMBXPkCpvGW0ZBIAiJCruu9LAIpqHMHvg==
X-Google-Smtp-Source: AGHT+IE/n/QNG+unEMmqgOeMT8c3dzfdlrQ/11zpmArfHLURUE3tPXu6KBQ2iNPd7o+F0LLY26NslQ==
X-Received: by 2002:a05:600c:4f4f:b0:43d:2313:7b49 with SMTP id
 5b1f17b1804b1-4409bd18939mr13892255e9.12.1745482933297; 
 Thu, 24 Apr 2025 01:22:13 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:3d9:2080:52eb:f6ff:feb3:451a])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4409d29bfc4sm11229415e9.8.2025.04.24.01.22.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 24 Apr 2025 01:22:12 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: Jessica Zhang <quic_jesszhan@quicinc.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Sam Ravnborg <sam@ravnborg.org>, Casey Connolly <casey@connolly.tech>, 
 David Heidelberg <david@ixit.cz>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Casey Connolly <casey.connolly@linaro.org>
In-Reply-To: <20250419-drop-s6e3fc2x01-support-v1-1-05edfe0d27aa@ixit.cz>
References: <20250419-drop-s6e3fc2x01-support-v1-1-05edfe0d27aa@ixit.cz>
Subject: Re: [PATCH] drm/panel: samsung-sofef00: Drop s6e3fc2x01 support
Message-Id: <174548293255.3240462.18362886062864690614.b4-ty@linaro.org>
Date: Thu, 24 Apr 2025 10:22:12 +0200
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

On Sat, 19 Apr 2025 18:31:44 +0200, David Heidelberg wrote:
> We never properly supported this panel and always used the wrong init
> sequence. Drop support so we can move it to it's own proper driver.
> 
> 

Thanks, Applied to https://gitlab.freedesktop.org/drm/misc/kernel.git (drm-misc-next)

[1/1] drm/panel: samsung-sofef00: Drop s6e3fc2x01 support
      https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/e1eb7293ab4107e9e19fa609835e657fe30dfec7

-- 
Neil

