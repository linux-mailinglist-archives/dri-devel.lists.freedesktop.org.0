Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BEE1481598
	for <lists+dri-devel@lfdr.de>; Wed, 29 Dec 2021 18:04:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D77BD10E23E;
	Wed, 29 Dec 2021 17:04:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com
 [IPv6:2a00:1450:4864:20::533])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 12F9C10E22A
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Dec 2021 17:04:33 +0000 (UTC)
Received: by mail-ed1-x533.google.com with SMTP id b13so88503240edd.8
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Dec 2021 09:04:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fairphone.com; s=fair;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Zzzoaw9nwT/sLWjoXAxYNO4/5wEGpc2LGKlTzw2/Nmo=;
 b=rRDXfOV2riF8m3eENMG6TCo7kUtjkSO7KgaD6hrRGKOU1U0LATdWx2kSuO/omigerc
 HS3uReuDDRQlwThLronJmYerKaQqTjTMT2Dlx49JF02IhDDfWTuoXqBp0rsEfZdkXUQw
 zgI2tlBxkxMrogtxhUBTycLyyqLd/yiscHkf5sTBp6T/NNlmHrIYIUKT9q6qJk53hGqD
 TVN2RUQ11SELxcFA/QLI+6TJnZaekMVJgle0EsB4gEj7GInfpW5EvYfWZFuC7DGHiepA
 POf76H95BxcZhO/RA0QBORriwITuyRFcezZEVLti7aDrcFzbwN0vhI1XIzKULE8SMCeB
 qQ6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Zzzoaw9nwT/sLWjoXAxYNO4/5wEGpc2LGKlTzw2/Nmo=;
 b=fLTeNnH7GaRIMMAspee7K+BBpovLV+o6jlgZ+mQd6wZYziaiWB8piIFZEo1hN3rZ2h
 QYTrBJdWznCjekTIL39HIjfu0nD4gIKfGB4K3JjbibG+LMHbGmWeS8UZGg/qhcNjZ3WZ
 h7Fmer7bG2CvcZTLmCIbl0rOt8ENV6GoFwI3a7kiHfU8QwY26YMjf0MFx8BApvAoUIZl
 KBvshXMkm1dUyP0zciRMSQSy2YPmLAiEZI7osKhDMnEZzbL88BZ9wRes144xKyslJuht
 XrOhcEuEfl7Q/pilSZFqbZpQ6JqPPw6fnXmreh45MUG9MuZfr/vuiIFT/fp2EtZ1H5Ug
 XDHQ==
X-Gm-Message-State: AOAM533B45N25sA72pMt0UfD7JsQG2u7ZiM9rWJP0Lyxr15qOzhbdb/U
 I8stgEIQWMKGedRKylCzpbUlpg==
X-Google-Smtp-Source: ABdhPJyw3/QGNXRpt1eE5AdOGe9of2v2ZlyzW2iOuugasp3Ck/Ai66iFDEh5sqOB1BU76Lr5YkJe0Q==
X-Received: by 2002:aa7:c481:: with SMTP id m1mr26088776edq.204.1640797471615; 
 Wed, 29 Dec 2021 09:04:31 -0800 (PST)
Received: from localhost.localdomain
 ([2a02:a210:20c5:8c80:7d0a:cd68:c339:f426])
 by smtp.gmail.com with ESMTPSA id w11sm8546153edv.65.2021.12.29.09.04.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 29 Dec 2021 09:04:31 -0800 (PST)
From: Luca Weiss <luca.weiss@fairphone.com>
To: linux-arm-msm@vger.kernel.org
Subject: [PATCH 2/4] backlight: qcom-wled: Add PM6150L compatible
Date: Wed, 29 Dec 2021 18:03:56 +0100
Message-Id: <20211229170358.2457006-3-luca.weiss@fairphone.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20211229170358.2457006-1-luca.weiss@fairphone.com>
References: <20211229170358.2457006-1-luca.weiss@fairphone.com>
MIME-Version: 1.0
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
Cc: Daniel Thompson <daniel.thompson@linaro.org>,
 Jingoo Han <jingoohan1@gmail.com>, linux-fbdev@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Bjorn Andersson <bjorn.andersson@linaro.org>,
 Andy Gross <agross@kernel.org>, ~postmarketos/upstreaming@lists.sr.ht,
 Luca Weiss <luca.weiss@fairphone.com>, phone-devel@vger.kernel.org,
 Lee Jones <lee.jones@linaro.org>, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

PM6150L contains WLED of version 5. Add support ofr it to the driver.

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 drivers/video/backlight/qcom-wled.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/video/backlight/qcom-wled.c b/drivers/video/backlight/qcom-wled.c
index 306bcc6ccb92..527210e85795 100644
--- a/drivers/video/backlight/qcom-wled.c
+++ b/drivers/video/backlight/qcom-wled.c
@@ -1734,6 +1734,7 @@ static const struct of_device_id wled_match_table[] = {
 	{ .compatible = "qcom,pmi8994-wled", .data = (void *)4 },
 	{ .compatible = "qcom,pmi8998-wled", .data = (void *)4 },
 	{ .compatible = "qcom,pm660l-wled", .data = (void *)4 },
+	{ .compatible = "qcom,pm6150l-wled", .data = (void *)5 },
 	{ .compatible = "qcom,pm8150l-wled", .data = (void *)5 },
 	{}
 };
-- 
2.34.1

