Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2789CABE737
	for <lists+dri-devel@lfdr.de>; Wed, 21 May 2025 00:34:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 39E7610E5B4;
	Tue, 20 May 2025 22:28:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Kh/8uHRU";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-f180.google.com (mail-qk1-f180.google.com
 [209.85.222.180])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7FDCA10E051;
 Tue, 20 May 2025 22:28:27 +0000 (UTC)
Received: by mail-qk1-f180.google.com with SMTP id
 af79cd13be357-7cd34b6ba10so74206585a.1; 
 Tue, 20 May 2025 15:28:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1747780106; x=1748384906; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=uiOeDgEk3yJVfdPMnzNz/YMsCVQJq+LJvHcBgXvlm8I=;
 b=Kh/8uHRUb+xCz9v7WDQdovgQXdt5AehBkqyj18FjJZgtACirGWM+L5/lh7HsGttqXQ
 jEXZvAKc/zO9ArQgETc9U+IB2wEivy93FNx6xxqzhHNEplxKQA8fJ6C9bdCR5tdDIwm5
 q5SGdlVc/3X1ATGukP4IzDIA7DSOc/aDG29ytfJktROW/poYDJZauayjUhVXhJKEduw3
 Cgs72vw2ZrIPTSlGshWjDquBQHQirBSWWcDksv+N0pEZ10zpwz/L+az+Bi7Wbu4eAxZW
 tZXgbCEcEqefiqyLy2DXbiWlSLiDbYSdLNrmA6UKXnXdN0MK8NV/37/C3kaTy3DYHVgU
 QfsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747780106; x=1748384906;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=uiOeDgEk3yJVfdPMnzNz/YMsCVQJq+LJvHcBgXvlm8I=;
 b=oEcvCKMsBEDhtsqLbQdSUVL9gAepd3RCsxuVdUKNXmP0Ll6SlSoXdLWNIxlY7wVzrV
 +9CxZkH7A7I9GjAQiYGVpY46635/vLQncDmBCABsvHlggXTczhgRbfHQUK9zPdBKe3OA
 aygQCjwYppW7rEx66SYstYUOER6rSFVvjmLzdsgfrjSMkSC2PQ7IXVTlBFJQHmHntJgV
 G7DI7dfkbmWxwl6lP9IdVpkUsOlwkzj2CHtTDzN+WdfDUQxHvbaIWg68kZjvxobvvFdC
 KjJ1gVyo8Ukxca25oLMm/ys2r+f9ThmkrjpYB+s4TsX6mdiwQsKhCcO42PwiyrTcuSyl
 stZQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCViAcUhyus7v/YTBP0o+mBsyLkBCWIjCu1NHB+6xqiHwa+7GoVFClh0UjmyqNL1g91viK2GshcEgCQ=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzDlAnriA5OzDZZN6IEB3GYWGvHanS/CfyiqiMes8Hl+J9pe6at
 KFGasxpdoNx682/x9oD7S7mq8H6PgaZPBmrnui7cI7pHHJFA/TcsE1d+OcOSGnxw
X-Gm-Gg: ASbGncujKq71FfpOfA5M3o3LdnsgrIfXrFrI4Y77lbDtRemTy/l2FfFS5MhabfBA610
 CDGZB5p0aX6Zfb5VEI7SgAQfu5f4WRAAqckgWI2+xNs95wxAyClFp9ZRjMqcfCjxevU9zin3BJS
 rr27DpckbcH3CCTNL9tjsfEmNMglcFbye8MQPUXzHZ3kQ09fYLcR/0aUYRFOXOyKGokJAeVrtYk
 40zK4r5EnWo4/mi1KNuu2ufL+0K7wvZM3SWtfUPchCuho8fpy3f8pUw/pOSVg8YhZJOoRmxTPDC
 6uQZegeF/HjOMrXS/R2lh14lCS96diIijihbO7CXZDFLcu8XaFjo/ZaR9k7BuVMTBOKI9e42v00
 8IFhRaZ9o0qFktpHnoxc=
X-Google-Smtp-Source: AGHT+IGxlDQ3bK+gfMe8+o8hZa6AOe4h/ptfY6GEvDK9Yn2OxWnzq7wO60X9NuoE0qAlSxifY+vTOQ==
X-Received: by 2002:a05:620a:4395:b0:7c3:d266:3342 with SMTP id
 af79cd13be357-7cd4673be14mr1263550985a.5.1747780106573; 
 Tue, 20 May 2025 15:28:26 -0700 (PDT)
Received: from [192.168.124.1] (syn-067-243-142-039.res.spectrum.com.
 [67.243.142.39]) by smtp.gmail.com with ESMTPSA id
 af79cd13be357-7cd467d7eddsm789957885a.34.2025.05.20.15.28.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 May 2025 15:28:26 -0700 (PDT)
From: Connor Abbott <cwabbott0@gmail.com>
Date: Tue, 20 May 2025 18:28:05 -0400
Subject: [PATCH 1/2] drm/msm: Fix CP_RESET_CONTEXT_STATE bitfield names
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250520-msm-reset-context-state-v1-1-b738c8b7d0b8@gmail.com>
References: <20250520-msm-reset-context-state-v1-0-b738c8b7d0b8@gmail.com>
In-Reply-To: <20250520-msm-reset-context-state-v1-0-b738c8b7d0b8@gmail.com>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <lumag@kernel.org>, 
 Marijn Suijten <marijn.suijten@somainline.org>
Cc: dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
 Connor Abbott <cwabbott0@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1747780104; l=1055;
 i=cwabbott0@gmail.com; s=20240426; h=from:subject:message-id;
 bh=hV9zA6BCDbdTs6axrAm3OqQVSH2M4h/cUKGfxYxOKaE=;
 b=43vGKOCzReZsNdGzltmHkEXePK+XfgNTTn83BQKro6ewQB3CCt84zK4pmTMAqfZ7GCFnHa6Gx
 BBNt9UET7qVA4KlTjJ136TIxMAxSbtiYMZtZgkZE9h4zOZHRTwR/Cv2
X-Developer-Key: i=cwabbott0@gmail.com; a=ed25519;
 pk=dkpOeRSXLzVgqhy0Idr3nsBr4ranyERLMnoAgR4cHmY=
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

Based on kgsl.

Fixes: af66706accdf ("drm/msm/a6xx: Add skeleton A7xx support")
Signed-off-by: Connor Abbott <cwabbott0@gmail.com>
---
 drivers/gpu/drm/msm/registers/adreno/adreno_pm4.xml | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/registers/adreno/adreno_pm4.xml b/drivers/gpu/drm/msm/registers/adreno/adreno_pm4.xml
index 55a35182858ccac3292849faaf12727257e053c7..2134731a86ba819215476d89c1e054328f901dd1 100644
--- a/drivers/gpu/drm/msm/registers/adreno/adreno_pm4.xml
+++ b/drivers/gpu/drm/msm/registers/adreno/adreno_pm4.xml
@@ -2255,7 +2255,8 @@ opcode: CP_LOAD_STATE4 (30) (4 dwords)
 	<reg32 offset="0" name="0">
 		<bitfield name="CLEAR_ON_CHIP_TS" pos="0" type="boolean"/>
 		<bitfield name="CLEAR_RESOURCE_TABLE" pos="1" type="boolean"/>
-		<bitfield name="CLEAR_GLOBAL_LOCAL_TS" pos="2" type="boolean"/>
+		<bitfield name="CLEAR_BV_BR_COUNTER" pos="2" type="boolean"/>
+		<bitfield name="RESET_GLOBAL_LOCAL_TS" pos="3" type="boolean"/>
 	</reg32>
 </domain>
 

-- 
2.47.1

