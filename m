Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D04868B9595
	for <lists+dri-devel@lfdr.de>; Thu,  2 May 2024 09:49:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 33B0110EEB9;
	Thu,  2 May 2024 07:49:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="rdlFS7Yy";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com
 [209.85.221.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5B24310EB16
 for <dri-devel@lists.freedesktop.org>; Thu,  2 May 2024 07:49:07 +0000 (UTC)
Received: by mail-wr1-f46.google.com with SMTP id
 ffacd0b85a97d-34c8592b8dbso4692221f8f.3
 for <dri-devel@lists.freedesktop.org>; Thu, 02 May 2024 00:49:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1714636145; x=1715240945; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=T/L1u1HCFXTpH+7xWuSoYn2EdHiMZmIi7anLXfgHnFc=;
 b=rdlFS7Yy0jFWQ8de+KEM0tDbZwQ69pyIDg7HboSaDo/Y78Kg4fLvFuGZXEB5deGBU0
 Q4rnl+BzF4IGuzw4367E4ueCveOL1W9wfRkfh2sueNaI6FXfb1qfWI9UtoOhCMMC+ODf
 9cpLGhZym21FCwKIf+rHXpcize6A6Rg/lLzRRaX7+gIfDOS7hizeLAXcBxFSni0HJ0CL
 OJlsXt6H0Jei7KWWp5wholsjE1kVbxEAJv4EyjaHDV0kw2uU9WlWnO8wok/13sgtHy4k
 RsyJJwH7TBxeJT23A0siMiyGmWKGnE1UaEfiwniM0XoyGPA7YcD5SU7LM0Qw8//tko0A
 I92Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1714636145; x=1715240945;
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=T/L1u1HCFXTpH+7xWuSoYn2EdHiMZmIi7anLXfgHnFc=;
 b=aaKemXNU0HTHKMHAMzJyKpjVPkUeVTbhjQSp832M9htQySGkjd4cC+bTvjlqBUbEJx
 vnjuc1Dq2aCXrTbkywOkVZH7arBULnph6UfS5W/JsA981mGjSq+0HHejx0Rp/yxghlvD
 kkJPb0MYmQ9ACYoIatxPVNln1yX4BbxuSOVhvS24uhNU9UAsOrnbFhUT69U61wAql1M6
 +64XpX/4VyyLlLOzbsUcmjAEccJh5Zt5R2VCiGpq1dHjUbAjQasEdCrGNpnQloPJnLCq
 GlHKsSEynUgOnsxTYemUyU8tK/aT6qwATXLibDIJM4u95UDinvJbZrZHVZmEd2Kz0Hck
 y8pg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXN7QMi+21kVRcEvpQ2qwA3xp5nG1z7lYFGRLEsrz/thldeE8KYaM5jAf7TbR6GijW88StNR9QFh0vClBx2Qdb3kFzGhqcshJqfGKLXOTGZ
X-Gm-Message-State: AOJu0YxsbT8cKWUvA74ehEi0ucRrt6GyC5fu/mrD1kACZ4z4S+PINFYM
 Pf/aFzidplou2ZzVpyGyDwnqmXRg+QJBmaGM82i/3wIKeTzh3dj/N+eRsJNMGzDJi8NHoneEjdm
 z6Xk=
X-Google-Smtp-Source: AGHT+IHa19D/EzuHCiy5xNLJZqU0x22ckGpuvDaNYuQXOsSvZlKDUAvluaUzlaCZBoMWPT95a/ZuKg==
X-Received: by 2002:adf:ff8e:0:b0:34d:369a:5add with SMTP id
 j14-20020adfff8e000000b0034d369a5addmr760296wrr.71.1714636145096; 
 Thu, 02 May 2024 00:49:05 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:52eb:f6ff:feb3:451a])
 by smtp.gmail.com with ESMTPSA id
 dd22-20020a0560001e9600b0034d829982c5sm584827wrb.5.2024.05.02.00.49.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 May 2024 00:49:04 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: Sui Jingfeng <sui.jingfeng@linux.dev>
Cc: Jessica Zhang <quic_jesszhan@quicinc.com>, 
 Sam Ravnborg <sam@ravnborg.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
In-Reply-To: <20240501052402.806006-1-sui.jingfeng@linux.dev>
References: <20240501052402.806006-1-sui.jingfeng@linux.dev>
Subject: Re: [PATCH v2] drm/panel: ili9341: Remove a superfluous else after
 return
Message-Id: <171463614435.3089805.14133558638178506676.b4-ty@linaro.org>
Date: Thu, 02 May 2024 09:49:04 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13.0
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

On Wed, 01 May 2024 13:24:02 +0800, Sui Jingfeng wrote:
> Because the else clause after the return clause is not useful, remove it
> to get a better look.
> 
> 

Thanks, Applied to https://gitlab.freedesktop.org/drm/misc/kernel.git (drm-misc-next)

[1/1] drm/panel: ili9341: Remove a superfluous else after return
      https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/e91a36b472862a1d199ea8d1b1ca192a347bf33e

-- 
Neil

