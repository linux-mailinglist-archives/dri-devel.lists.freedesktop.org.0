Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D03BBA97F30
	for <lists+dri-devel@lfdr.de>; Wed, 23 Apr 2025 08:29:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5977010E403;
	Wed, 23 Apr 2025 06:29:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="S5jXqvAD";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com
 [209.85.128.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6E41E10E643
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Apr 2025 06:29:26 +0000 (UTC)
Received: by mail-wm1-f54.google.com with SMTP id
 5b1f17b1804b1-43ed8d32a95so52057545e9.3
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Apr 2025 23:29:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1745389765; x=1745994565; darn=lists.freedesktop.org;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :from:to:cc:subject:date:message-id:reply-to;
 bh=NXM/ApZvMDsKIqYTXu3kXYyN/bDpq38CStrHVpSd/eU=;
 b=S5jXqvADlkRCmJqp8MByVeeqNPLmgg/W2P1iCGhQP1MtqGj0rZUg8tovECj1RSD1gh
 xywFB8eP/0CPGnvpSQMQ/5zxXtU/rFdkUsH3blM9q7WnNtNOneEPUMOzsMq7tZK7ess7
 h6nUNrJaOGuazpv/fsCWpHlZNG8nrtE2HS3mYoxPl1bQ9nZ5udbbashHOsCLsYKBnncc
 X77qHOsMfjWbpKyYi919b5vSZA2U12OEdbRzvKQlTk4ly9hCtTrFdXY0cKX02LnM1bGi
 tcJul7PXJ/qKwSm+j0tV+vjorxttYjE2KZ0F+CWYeKEdK8BIBgRTOhWWeaLPkbuNPG45
 JymQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1745389765; x=1745994565;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=NXM/ApZvMDsKIqYTXu3kXYyN/bDpq38CStrHVpSd/eU=;
 b=qc6+lhDXFx1T/WCDDK0eKuqXQcjUZhKXw5asoXwb/uQzUu2jhfdvJBgXvQzjCXvoJD
 Z+J50JDQXcIBgc/2FfuOtdNwCusIEEKxzkozx7DEF+8/GgnMyxyboNaIX9qYlhUP1e/1
 lwhLuAFOzQSFtZGjBIYy0jqY7NF2a133DlKNtaQyPTkaQGgnuBuRLtzqbmm1PLtIEmg+
 xZzqN7CJ0bsr/9vI9pltGn3EIQt3RFAi5ef9YXzzoTzfya1119djnLdiQLgLvzUVI61/
 sqDnS/sypgICMu5ZBQQJgyYB5fGovMsiTsbEzQRgGsx4GXK9S7GuyJuWwxrOy1WqOP9H
 7qdQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXIBOBJgSvnn4jrMJ7B0AyDvSaWk2ZiYohpT12L6Zi4/MX9+kCvw2acDdjvs93ySdZdi+PBLxjs2Tw=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxHlpk8svY1qoIWQ9Qkqbd+by21PsQsUw/ewS78NC3ghU7f4v4x
 4uFQMr/FZEVIkvyQImqRGpLxflu8P2YiHE5avwfviZ69HMu5ewPjj740UOOtmej2XNcPSHec3ug
 z
X-Gm-Gg: ASbGncs9u2ph6eUC+32MTmFcZ+8uR6AGzvbqwiXhkMhxi8EJYLjzyUBCSeze1X6HmwC
 GG68yse+q9k1vHKEHTWunULh7EpQWywRuBnYdvHkOJwgMFmMctdTYDDrID7BcNwDL4HjwCa/DFb
 RYwWE1EXL5fjxW6Psr8d9Q6K/CKzBHLIMnMqP2/gt7IY5U8G7blFewuYLA0sfoTQiDRsQtzLU7Y
 PgWeMQAGt5mBEjlS+xTDIm3V8o4uHmWi92q6thXSmrUJZRM5kKNDn4p8UWHXqRm4StZBX0OJVti
 +0JgIdPXTLJybtwIf1qM0lNVu7bGUUSD4z2S2lDcN7300Q==
X-Google-Smtp-Source: AGHT+IGELdbCizoy0W/020bE/eTAWU0h9+2dk0PG/CjaQraQ4oXvx0bvKD+fIUeXhUmV1/y/srARpw==
X-Received: by 2002:a05:6000:2911:b0:390:fdba:ac7 with SMTP id
 ffacd0b85a97d-39efbb058a3mr14276334f8f.51.1745389764906; 
 Tue, 22 Apr 2025 23:29:24 -0700 (PDT)
Received: from localhost ([196.207.164.177])
 by smtp.gmail.com with UTF8SMTPSA id
 ffacd0b85a97d-39efa4a4be2sm17297858f8f.83.2025.04.22.23.29.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 22 Apr 2025 23:29:24 -0700 (PDT)
Date: Wed, 23 Apr 2025 09:29:21 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Jessica Zhang <quic_jesszhan@quicinc.com>, dri-devel@lists.freedesktop.org
Subject: [bug report] drm: panel: Add driver for Himax HX8279 DDIC panels
Message-ID: <aAiIwdPkFT_hEexA@stanley.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
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

Hello AngeloGioacchino Del Regno,

Commit 38d42c261389 ("drm: panel: Add driver for Himax HX8279 DDIC
panels") from Apr 14, 2025 (linux-next), leads to the following
Smatch static checker warning:

	drivers/gpu/drm/panel/panel-himax-hx8279.c:593 hx8279_set_digital_gamma()
	warn: reusing outside iterator: 'i'

drivers/gpu/drm/panel/panel-himax-hx8279.c
    573 static void hx8279_set_digital_gamma(struct hx8279 *hx,
    574                                      struct mipi_dsi_multi_context *dsi_ctx)
    575 {
    576         const struct hx8279_digital_gamma *dgamma = hx->desc->dgamma;
    577         u8 cmd_set_dig_gamma[2];
    578         int i;
    579 
    580         if (!dgamma)
    581                 return;
    582 
    583         /*
    584          * Pages 7..9 are for RGB Positive, 10..12 are for RGB Negative:
    585          * The first iteration sets all positive component registers,
    586          * the second one sets all negatives.
    587          */
    588         for (i = 0; i < 2; i++) {
                     ^^^^^^^^^^^^^^^^^
This looks like a loop but it only iterates once

    589                 u8 pg_neg = i * 3;
    590 
    591                 hx8279_set_page(hx, dsi_ctx, 7 + pg_neg);
    592 
--> 593                 for (i = 0; i < ARRAY_SIZE(dgamma->r); i++) {

because we re-use i here

    594                         cmd_set_dig_gamma[0] = HX8279_PG_DIGITAL_GAMMA + i;
    595                         cmd_set_dig_gamma[1] = dgamma->r[i];
    596                         mipi_dsi_generic_write_multi(dsi_ctx, cmd_set_dig_gamma,
    597                                                      ARRAY_SIZE(cmd_set_dig_gamma));
    598                 }
    599 
    600                 hx8279_set_page(hx, dsi_ctx, 8 + pg_neg);
    601 
    602                 for (i = 0; i < ARRAY_SIZE(dgamma->g); i++) {

and here

    603                         cmd_set_dig_gamma[0] = HX8279_PG_DIGITAL_GAMMA + i;
    604                         cmd_set_dig_gamma[1] = dgamma->g[i];
    605                         mipi_dsi_generic_write_multi(dsi_ctx, cmd_set_dig_gamma,
    606                                                      ARRAY_SIZE(cmd_set_dig_gamma));
    607                 }
    608 
    609                 hx8279_set_page(hx, dsi_ctx, 9 + pg_neg);
    610 
    611                 for (i = 0; i < ARRAY_SIZE(dgamma->b); i++) {

and here

    612                         cmd_set_dig_gamma[0] = HX8279_PG_DIGITAL_GAMMA + i;
    613                         cmd_set_dig_gamma[1] = dgamma->b[i];
    614                         mipi_dsi_generic_write_multi(dsi_ctx, cmd_set_dig_gamma,
    615                                                      ARRAY_SIZE(cmd_set_dig_gamma));
    616                 }
    617         }
    618 }

regards,
dan carpenter
