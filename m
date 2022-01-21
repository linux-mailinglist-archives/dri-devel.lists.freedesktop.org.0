Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E1B86496BBA
	for <lists+dri-devel@lfdr.de>; Sat, 22 Jan 2022 11:44:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7839410EA8C;
	Sat, 22 Jan 2022 10:44:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x231.google.com (mail-oi1-x231.google.com
 [IPv6:2607:f8b0:4864:20::231])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 31C2210E48A
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Jan 2022 18:05:13 +0000 (UTC)
Received: by mail-oi1-x231.google.com with SMTP id q186so14635983oih.8
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Jan 2022 10:05:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=EdV9jeW0XS2fClTtRWmHZ/pfb6gc0JxRxLCJ6LOKoaE=;
 b=AzcR6VdjuelfiahI5TmX8ThHztIrVPqXF//q8UUC6Tv7E2zGdMVfUpJ0GktO5y8BIJ
 7yG0uKbtA1KWgXGQEI7vjNU81H0usY0gIvPlSG6sDjjNDBCU45iE3Jh3rENPbKwAt3Tp
 iXlTKr5AV6GB/01/GU//VCSJ4Sa/1YjYqHEGV2e6HW8tlhAeSW2OcYp0LhfSg7OYTZ14
 lHI42wUc1YprM7Z3Bbz2a2R32X8kmU/YWhJHhmDdO/i/S7gX9Dt0hZWGb7WT1aZ+yM/6
 Zk783zHkayfMP4LApQTQ9CtuEw5hIBaVThVgu3c0VYHTodiXsCGR7DLLok+fsGD66y6R
 GFLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=EdV9jeW0XS2fClTtRWmHZ/pfb6gc0JxRxLCJ6LOKoaE=;
 b=Vscs94ra2A0KpPTe22K4My5Tcx9OvBKTV8uf+X4j38rMKpll85Wheiyg76M6TBJc1q
 NEfcKv8iEwIjV+X/bbWPRoFD01YSslKIPrUuTA6AxreLKNKrC8jnI3LoHL2Hj7y4iLoD
 lgi2hNbGTwg/0gml79t54tGoYkbGQV35EFtjyGn8Yqf020OsTnsAIp6mId4v3Z3i5YkN
 YnyD4ZIhY4qMhipgzlH+DYh4XkJZeEKgnlTfcWLdATwO3ywOw6RZQ+CbEZeWXRbo7STv
 Wfdxzq1O3+Nr2niE1FKx82C2XUi2nRS+m8lN1QSqjvwf+HB8sAAHg+R/lYwN6D0UeqCo
 t9JA==
X-Gm-Message-State: AOAM5301LswLqRakbyahCioB8goPvjJBqNbV64eB70pEnEA8cWcFmi2b
 oRk+BP1L7SjLM/VlkTX55Jg=
X-Google-Smtp-Source: ABdhPJzkHQXgi/7aZ1YZqRdoznmU5C+u3toYkIIqlD+gV2rBPCTnvA000JYZYfw+t6wILooyTY+yJQ==
X-Received: by 2002:aca:545:: with SMTP id 66mr1541800oif.34.1642788312506;
 Fri, 21 Jan 2022 10:05:12 -0800 (PST)
Received: from thinkpad.localdomain ([2804:14d:5cd1:5d03:b8b6:7c7e:83cf:255])
 by smtp.gmail.com with ESMTPSA id
 k14sm1191144ood.15.2022.01.21.10.05.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 21 Jan 2022 10:05:12 -0800 (PST)
From: Luiz Sampaio <sampaio.ime@gmail.com>
To: daniel.thompson@linaro.org
Subject: Re: [PATCH 24/31] video: backlight: changing LED_* from enum
 led_brightness to actual value
Date: Fri, 21 Jan 2022 15:06:04 -0300
Message-Id: <20220121180604.2198-1-sampaio.ime@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220121170540.w6c4wqwrqzpde2lm@maple.lan>
References: <20220121170540.w6c4wqwrqzpde2lm@maple.lan>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Sat, 22 Jan 2022 10:44:23 +0000
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
Cc: linux-fbdev@vger.kernel.org, michael.hennerich@analog.com,
 jingoohan1@gmail.com, deller@gmx.de, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, lee.jones@linaro.org,
 Luiz Sampaio <sampaio.ime@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hello, Daniel

Thanks for your reply. This is one of my first patches, so I am still
learning. This series of patches affects others subsystems too (hid,
leds, sound etc). Should I create series for each subsystem
separately, instead of creating one series for everyone?
What do you mean by "this patch might wants to land in one tree"?

Thank you for your attention!
