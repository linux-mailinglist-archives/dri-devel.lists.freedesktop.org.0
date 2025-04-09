Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E429BA822F2
	for <lists+dri-devel@lfdr.de>; Wed,  9 Apr 2025 12:59:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 567AE10E0EE;
	Wed,  9 Apr 2025 10:59:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="NJ2C/e+F";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com
 [209.85.221.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2744410E830
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Apr 2025 10:59:45 +0000 (UTC)
Received: by mail-wr1-f51.google.com with SMTP id
 ffacd0b85a97d-399737f4fa4so3660258f8f.0
 for <dri-devel@lists.freedesktop.org>; Wed, 09 Apr 2025 03:59:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1744196383; x=1744801183; darn=lists.freedesktop.org;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :from:to:cc:subject:date:message-id:reply-to;
 bh=dRZG7DnkuX+qQGHQdFS7/UxSMqmBqp/Oqwir9fgS1nQ=;
 b=NJ2C/e+FuWqKXmhNxMJ+eP+rohoLFmYG8Kurqo1o+lE01YfpNUgaSbIxF1ya4QUTVF
 rKhVTVogGnnHZI9YUZXF7HGxcrzZUDusPo45IoHg5cAQ5Ftb8x9yAmT4+siKiULzcrgz
 af9P6okYsLdXCIinfk/fW5Fs6d9hDDtT4l+uq2/SZoKbkKzc9IZjDiagmXd/oRkYsbfE
 TT0vcrr/NxNIZa9qULFkTBgdU1Wq6RTnz0DH4VvcoH1qMX9WkkPynUUDb08hVtCCdQEe
 PLdIhNYgYlzSpeCWaV2uqv0CGAFDDwa0yerJYy6lIYXS9sY+5pdA+8DhM999Aktfm6Lg
 L0rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1744196383; x=1744801183;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=dRZG7DnkuX+qQGHQdFS7/UxSMqmBqp/Oqwir9fgS1nQ=;
 b=ty6nq3JIkNsj7dWJMSKxfq/mg0Ln2IH0/kEzxmJHffxy0vQ+3U5mNRlSDJWE1ZIeEy
 9be3DQm+wbDNfbn8i5OZkKbIMSUBVV0Fbl/eVuMGlskM0yQKI4gc709DZqrTz0V+czA/
 cy4aSKzr3jUrtje6xGfwyZcUFhUlNT8FAHZS3JuGGShE2xbsYyxDYxGrF94W/qUXJamW
 wizW8+wvogaaVP1f6j05moFr1KvJkS4v6GU0KNDYAwP0q0JdID83hvASSDQNwv1DBjcf
 Mp+oAJpRNbyOG27EA4AvV53uhpAh6qbOGQJ5mysxMJKdBBP+o4Q4ffr02dVnxWsrVMo6
 3DPg==
X-Gm-Message-State: AOJu0Yys+TCXI2CFuRoyIrtOaBi15nWK/q/zU3Py2eazdR08PCKz8gOS
 I+3+fvYDfBbfcsl/MG2J6CaJQRXSgZCBxnCqZp1W1JD0yzBKES9eqLIE8hXUaguXJM69zn6nZ9K
 Z
X-Gm-Gg: ASbGncuJD4c8UfM1EGLl8ZdvFIwJ0GrF8RyIS9F3uQYxXHib6Dn60Ug5fvn/Mb1B5WA
 aIwuP8YmxGlnq0JqgEY5xnhyQ52EXHV7OufgIbqNuplPpYw92IuDamhgRSfNWU0D1IYvRiwF+os
 YYGXfruYR/LTzXVwkxtJPK4KZflhMeDdItfVwiIX6e4G/UwEf2V6xO7B6FJqkY9hQds3WOG0IpN
 CadjOHqkf2uROegK4Sh9rKi3gOmaFve+DQPhBHp5tyQJfF9waUNBPBTYyMSuM7Ynqox7lP6nWGg
 fCkXj4epcIIsQWFUmNYBLaahsUdgdhks0zAON4M/3Ft82g==
X-Google-Smtp-Source: AGHT+IGLInkGZFdQ05NMXusNAI7DzXzsKW4UuUQgoP4EdXz7azohlZBLxy6G2ZldQR6gIo/HE+pe9Q==
X-Received: by 2002:a05:6000:400e:b0:39a:c9fe:f069 with SMTP id
 ffacd0b85a97d-39d87ab5dd9mr2088437f8f.30.1744196383593; 
 Wed, 09 Apr 2025 03:59:43 -0700 (PDT)
Received: from localhost ([196.207.164.177])
 by smtp.gmail.com with UTF8SMTPSA id
 ffacd0b85a97d-39d893fdfbesm1260926f8f.88.2025.04.09.03.59.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Apr 2025 03:59:43 -0700 (PDT)
Date: Wed, 9 Apr 2025 13:59:39 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Heiko Stuebner <heiko.stuebner@cherry.de>
Cc: dri-devel@lists.freedesktop.org
Subject: [bug report] HACK: drm/panel: ltk050h3146w: read panel-id
Message-ID: <66c0b8c9-4143-4564-bae3-6ecbd59752ac@stanley.mountain>
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

Hello Heiko Stuebner,

Commit e09be2a6ab1a ("HACK: drm/panel: ltk050h3146w: read panel-id")
from Mar 26, 2025 (linux-next), leads to the following Smatch static
checker warning:

	drivers/gpu/drm/panel/panel-leadtek-ltk050h3146w.c:490 ltk050h314x_read_id()
	warn: inconsistent indenting

drivers/gpu/drm/panel/panel-leadtek-ltk050h3146w.c
    477 static int ltk050h314x_read_id(struct mipi_dsi_multi_context *dsi_ctx) {
    478 //        struct mipi_dsi_device *dsi = to_mipi_dsi_device(ctx->dev);
    479         u8 id[3] = {0};
    480         int ret;
    481 
    482         /* ILI988D requires a page 1 select to return stable results for register 4
    483          * HX8394-F ignores this command */
    484         ltk050h3146w_a2_select_page(dsi_ctx, 1);
    485 
    486         ret = mipi_dsi_dcs_read(dsi_ctx->dsi, 0x04, id, ARRAY_SIZE(id));
    487         if (ret < 0)
    488                 return ret;
    489 
--> 490 printk("%s: %u %u %u\n", __func__, id[0], id[1], id[2]);

It looks like debug code escaped.  Although this might also have been
intentional based on the HACK in the summary.

    491         return (id[0] << 16) | (id[1] << 8) | (id[2] << 0);
    492 }
    493 
    494 static int ltk050h3146w_prepare(struct drm_panel *panel)
    495 {

regards,
dan carpenter
