Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A47AA4FAEB
	for <lists+dri-devel@lfdr.de>; Wed,  5 Mar 2025 10:59:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 93DF110E714;
	Wed,  5 Mar 2025 09:59:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="diwc8HVH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com
 [209.85.221.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C06D510E725
 for <dri-devel@lists.freedesktop.org>; Wed,  5 Mar 2025 09:59:07 +0000 (UTC)
Received: by mail-wr1-f45.google.com with SMTP id
 ffacd0b85a97d-391211ea598so280091f8f.1
 for <dri-devel@lists.freedesktop.org>; Wed, 05 Mar 2025 01:59:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1741168746; x=1741773546; darn=lists.freedesktop.org;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :from:to:cc:subject:date:message-id:reply-to;
 bh=So2bHlhBNccmjwH4YRh5RzOUsWgSLwkdhOqymnKDe5s=;
 b=diwc8HVHbNlmNarBko0EGicYFoL9jw3o/Cu+VewC8sInD/lqy1L1jGm9EfUbKLRKRl
 1R3cauuzulWY884xzvDXb1t88UuqEjXEW1dwzLNlHcICNzMx8kgxm+JlJgl2nPi5qzjR
 mzZ9LSpNrWjBtfe+EYME6bF9Suq/kf7+G4o4IcEYW3bT9mpgDrK5UxvYoDAjGE8uEwe8
 FN9bXtoHkDjmjLpUX+5YnbDcjD9GiCFJW/6W/lX6Goffl4yTRTK44ntgBtvvc01nS3dT
 4s1HB2Otn22e/xihQyQa33Zfuc/0hFx512Ih4/UHoWRHWV+6zSM6NukNDDy86nhgsVHC
 HOQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741168746; x=1741773546;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=So2bHlhBNccmjwH4YRh5RzOUsWgSLwkdhOqymnKDe5s=;
 b=CV80W2wmdUHF4M6SPIDWb8tt1oPmR1ybZSSNKEGqBndCPA0J/prrCc9nANjJ7rClTC
 q/PQ8gzSBcA2lVS3pRVfBDrzqh/gKxhg2z2J578Vno5dQXCyrj5/ecH0xsZyBs9kwzfH
 aOLZlYVJ23aJOlv4NNwwjWjTgy+LTuoKfB+LtSxwRech5d/qjI5Xjb7YbwktXnK1VtcC
 PWRIBmYXPwFxK6L7QDIpoTuI2nVzC+Peb3YnfwOp/evqVtHMJiwl+uK2aFdUVxt3hd7M
 u4v6Ph2+xvX7SdXN4twBOKaGC44LEkvUYEJ5EraaMcH/jknrN3cxkaykVXU+upcG/4GA
 p82A==
X-Gm-Message-State: AOJu0Ywa/7CRibK1sOBs80wL+/b2o8IZcgMBMOKWmqcK2sFJrOzkUnWX
 NcPLsDUCKgwrKyX0tbg1Dx+Ad4c7hWfL+1PTf10V8iOuM1WmR2A4qrObS2veBw0=
X-Gm-Gg: ASbGncv/vpsHJoreMDcVCr1QAXlx2hKWoNep2uh+tACEIHAsNAGIfsx9yU32pDSsh+n
 QJqnOjZHap9IURTuEUTBS3rMG0pQu+dJkka7DVc4jBcdr4npsHIUDT7i1YSXbDipAjAda3eenHv
 OyAoce7FwrWxRKPCoWiD8U9YXxSODUdjBB0K7QjR5ngzEGRQY4aQJNz9bLtXQHfzIIRj9RfKM3L
 wMjAYVfwfxL+mJW4KWRiFtoYBzFOG7UcCCYw0q6vDZQTCrV6KOBCc7pyOAN9yzz6tsTJdRNPihw
 PIqkWgR9yRULBmuqk8f8ArBrHCoBZh1UrPefPSkvB7raDNF5Pw==
X-Google-Smtp-Source: AGHT+IE/R5YbUEmd3SpHPQrj+KBGF4P0tHL3OxBgdi1r/u3D+1ktmlN96ZC3HMA7tdUf9yU9EaXOxg==
X-Received: by 2002:a5d:5f96:0:b0:390:fceb:72f1 with SMTP id
 ffacd0b85a97d-3911f76d6e3mr1868226f8f.26.1741168745816; 
 Wed, 05 Mar 2025 01:59:05 -0800 (PST)
Received: from localhost ([196.207.164.177])
 by smtp.gmail.com with UTF8SMTPSA id
 ffacd0b85a97d-390e47b6ceesm20228185f8f.45.2025.03.05.01.59.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 05 Mar 2025 01:59:05 -0800 (PST)
Date: Wed, 5 Mar 2025 12:59:00 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Yuri Nudelman <ynudelman@habana.ai>
Cc: dri-devel@lists.freedesktop.org
Subject: [bug report] habanalabs/gaudi: fix a race condition causing DMAR error
Message-ID: <1673bf7c-7fee-43be-b1d8-720f93745d2b@stanley.mountain>
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

Hello Yuri Nudelman,

Commit 17ab47d2d6d4 ("habanalabs/gaudi: fix a race condition causing
DMAR error") from Jun 22, 2022 (linux-next), leads to the following
Smatch static checker warning:

	drivers/accel/habanalabs/gaudi/gaudi.c:1422 gaudi_get_patched_cb_extra_size()
	warn: potential user controlled sizeof overflow 'user_cb_size + additional_commands' '0-u32max + 32'

drivers/accel/habanalabs/gaudi/gaudi.c
    1415 static u32 gaudi_get_patched_cb_extra_size(u32 user_cb_size)
    1416 {
    1417         u32 cacheline_end, additional_commands;
    1418 
    1419         cacheline_end = round_up(user_cb_size, DEVICE_CACHE_LINE_SIZE);
    1420         additional_commands = sizeof(struct packet_msg_prot) * 2;
    1421 
--> 1422         if (user_cb_size + additional_commands > cacheline_end)
                     ^^^^^^^^^^^^
The user_cb_size is a user controlled variable that comes from
cs_ioctl_default().  This addition operation could result in an interger
wrapping bug.

    1423                 return cacheline_end - user_cb_size + additional_commands;
    1424         else
    1425                 return additional_commands;
    1426 }

regards,
dan carpenter
