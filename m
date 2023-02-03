Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E6D068B84C
	for <lists+dri-devel@lfdr.de>; Mon,  6 Feb 2023 10:11:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 12A7110E16F;
	Mon,  6 Feb 2023 09:11:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x431.google.com (mail-pf1-x431.google.com
 [IPv6:2607:f8b0:4864:20::431])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E18F910E862
 for <dri-devel@lists.freedesktop.org>; Fri,  3 Feb 2023 18:32:22 +0000 (UTC)
Received: by mail-pf1-x431.google.com with SMTP id g9so4340106pfo.5
 for <dri-devel@lists.freedesktop.org>; Fri, 03 Feb 2023 10:32:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
 :date:message-id:reply-to;
 bh=t/r/tdNtEio5pHrqHpsU4GhzJOAAFbwX4UQBhIfUYzI=;
 b=BPc+jTuImdUl6i7YWuZHIWyt8a1HiIwHNYvH4DnNyaxF/2b0RbjXhV4qvfa0UZvnA+
 W52SQBnapfjReD3T6jWA8Oz1cULeRoBAbXxXgiu2HGpNI/5EbQHkyWC12vYw3tGK5eaL
 b3Nd+CqbI4BQYp6yfakXYnAVoI4qHzHwz0NQJKP8dlIlFZNv+148qm+UQuKJu2ZAm6qQ
 /w7bIELzUPIvmSf7/tp0OIladc8tq34OHXSe+mxN3nEZatp8U8NbBShnxL4UdajzDWnl
 o5XhxblUPlKOZJqyaozGKvcKDsliLd5lrEfzzgDZmbiKTyAaEqe27VgPiJpI9942OXun
 5Jqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=to:subject:message-id:date:from:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=t/r/tdNtEio5pHrqHpsU4GhzJOAAFbwX4UQBhIfUYzI=;
 b=oCKus0gl6hBe5XHh54ulqvfyAl/F6lCJWn+njQIlK2mSZa6v0axilaTXNKeX7Ur3hm
 cbFmS0bGrfS/nyAgxCQdfsGNdIw5+PWTw2lV/+H4Pj5+6fdhIGH1k5mgrXsyATTwazdL
 v9Obx33pFubcAk0nBiC1eGtLbB4hnynQKRishHNmqD9G1ERD9naitVYH32dosPIafg2B
 6np9zx1b/zrBTsLRyL1gOLqZNMAZQjlpdnVYj8WPXrV60J6A7LBfiWEKM44N1JZtZgG+
 jzXUSvgp0EGft/rMe3Bbs7Xt7Ius3nHFF3GkimJ7eyF2k876NKrEktMCYDyh1nwfppXd
 kfeg==
X-Gm-Message-State: AO0yUKWfm9d2srLKAHHdRY400ZD3hHO0J/zXB8/l9clB/OKPIpbL0uZf
 DTNsFgwNHeI2cG7nUad3n+NLthAsC4iqOpwtqnQ=
X-Google-Smtp-Source: AK7set9EGu94D5bmmCGWT1d/a1xhQEgVm5Yu24YKiu9vf54MDu0QbmrepOdLl7Ewfc2TeoxBL5s8hn2kI4Kd5Or3Xkw=
X-Received: by 2002:a05:6a00:1254:b0:593:9627:d117 with SMTP id
 u20-20020a056a00125400b005939627d117mr2585879pfi.6.1675449142390; Fri, 03 Feb
 2023 10:32:22 -0800 (PST)
MIME-Version: 1.0
From: Darrell Kavanagh <darrell.kavanagh@gmail.com>
Date: Fri, 3 Feb 2023 18:32:11 +0000
Message-ID: <CAMxBKG1RwbRJMG0cKcnbyKgznXeZLL+Zp1zXeOnxpYU0NkOO8A@mail.gmail.com>
Subject: drm: panel-orientation-quirks: Add quirk for Lenovo IdeaPad Duet 3
 10IGL5
To: maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, daniel@ffwll.ch, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, Hans de Goede <hdegoede@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Mon, 06 Feb 2023 09:10:58 +0000
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

This is another Lenovo with detachable keyboard and 1200x1920 screen
mounted sideways.

The following has been tested with 6.2.0-rc6.

Thanks,
Darrell

index 3659f04..590bb7b 100644
--- a/kernel/drm_panel_orientation
_quirks.c
+++ b/kernel/linux-6.2-rc6/drivers/gpu/drm/drm_panel_orientation_quirks.c
@@ -304,6 +304,12 @@ static const struct dmi_system_id orientation_data[] = {
                  DMI_EXACT_MATCH(DMI_PRODUCT_VERSION, "Lenovo ideapad
D330-10IGM"),
                },
                .driver_data = (void *)&lcd1200x1920_rightside_up,
+       }, {    /* Lenovo IdeaPad Duet 3 10IGL5 */
+               .matches = {
+                 DMI_EXACT_MATCH(DMI_SYS_VENDOR, "LENOVO"),
+                 DMI_EXACT_MATCH(DMI_PRODUCT_VERSION, "IdeaPad Duet 3 10IGL5"),
+               },
+               .driver_data = (void *)&lcd1200x1920_rightside_up,
        }, {    /* Lenovo Ideapad D330-10IGL (HD) */
                .matches = {
                  DMI_EXACT_MATCH(DMI_SYS_VENDOR, "LENOVO"),
