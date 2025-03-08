Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A32DA579C3
	for <lists+dri-devel@lfdr.de>; Sat,  8 Mar 2025 11:28:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 73F9C10E168;
	Sat,  8 Mar 2025 10:28:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="zNJTdXNY";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com
 [209.85.221.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A63F710E168
 for <dri-devel@lists.freedesktop.org>; Sat,  8 Mar 2025 10:28:23 +0000 (UTC)
Received: by mail-wr1-f52.google.com with SMTP id
 ffacd0b85a97d-390fdaf2897so2685746f8f.0
 for <dri-devel@lists.freedesktop.org>; Sat, 08 Mar 2025 02:28:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1741429702; x=1742034502; darn=lists.freedesktop.org;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :from:to:cc:subject:date:message-id:reply-to;
 bh=v+3Fyu9sDNhajk8b64PGk0i9eVZ//11lf/1KZPjBx9k=;
 b=zNJTdXNYhdpXNlT0zMz1zpaa4iQznN5AVZr6GwXIWAaejnNmmdfnKdmtTbJv0RSb+7
 wEjcty1T3VMOZg6CqmrENw9cvZZiByoyY1UxNTRQBkoFB1YW9f1QuW2/x61N4prn4Me+
 GSOTxEvxYrJdtYtALZ16B93R2tjiKvtmJEBrt1YAgflNKG4MXEap+hjHej7fgOQN/Rbc
 RXo/qgr/UgSmht83/kTu3nKJFUcmiMg1I17cV4ftXeG+044Nlu8H8y9JLUh4a9nWVHxF
 XPFMrDyVZ9deM0ZHMkFbg5mbWq3k/AfP3u2DR0UCUZsi4I8365DoI1sKANTrFQzu2P6l
 UAOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741429702; x=1742034502;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=v+3Fyu9sDNhajk8b64PGk0i9eVZ//11lf/1KZPjBx9k=;
 b=YH1KxJu9IBiKH7k8LGOOaaSYDr3cf2Y5yijE3YkpZ1gC4RpYZJyd3c0b/uTuqDMuFc
 ABW6nicnd3tgEPw0nUIfLYL+Ep5OsJv9yRElDwsNrJR1StyR+om3ba4Bbg46yAFkDWwE
 yhWTstgsB9TY0uIGSj8pQMlPppUqE8rLwhGhGrT2zUguXwcb7NhFYD4SIGjPcuzU33mt
 AIDUY40lDUEF+4ihu9Z+9edySGIxYoHbAm2nK0R/W1upVcJzkez20bCKYUMZvzlCL+Sq
 VKo0KSSGNkCOYAHTxwAT3M/EL9TcR9yX+gE/+PEFjro+QOWba6vdDCnMNZzgyUpTlXJM
 ARhw==
X-Gm-Message-State: AOJu0YzyTZwXC/2Mqs0NN4iCEKSgAYmK8fxvmhMLfArsydt5Ksxa1QZa
 vsBNbvPIgq6u6oO2GVYE+ez9OOlW4H/0zd3srnqFpCRuk7hS2FJ9hzbz+OF1zTk=
X-Gm-Gg: ASbGnctO451FWEhwQg0nMon0rzfbW9vTM81Ehhwbtal6BedzSOXyg+J+T5oN8eTBz/W
 XdqBPmLJ3HsbyJYjCeRrTxEOLafvSx5Vdm1DJpHGQOXgtc92V5XK5w+JHFVCQoQpmPqWbmelrcq
 aBc6gooKlnEuAzPLKCY8ayx8EPcOY5RRvtpV7EE8aVrO2xok62mp4g+TpqJdQ0fVOAnQRtLj1WK
 AGgfNStb3DdQ9nf8886wkzmzkaU11SK7cwTf1GzXEfCd08mXVexhs4kUOq2zC/bWeRjoEkfVPhU
 MD642tZa/tYw9RS4QpFJ1vdZPuU61UnxwXwxKe14S7GiwENhVQ==
X-Google-Smtp-Source: AGHT+IFekvo2S+akE5zww3JV4LzsnwvAQaGoF4ZP4tDmZ3mW/9aD9dsALlmzhrggSYs9/xte/hRdpw==
X-Received: by 2002:a5d:6d0c:0:b0:390:de33:b0ef with SMTP id
 ffacd0b85a97d-39132d7084emr5986328f8f.30.1741429701720; 
 Sat, 08 Mar 2025 02:28:21 -0800 (PST)
Received: from localhost ([196.207.164.177])
 by smtp.gmail.com with UTF8SMTPSA id
 ffacd0b85a97d-3912c0194f2sm8473409f8f.54.2025.03.08.02.28.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 08 Mar 2025 02:28:21 -0800 (PST)
Date: Sat, 8 Mar 2025 13:28:17 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Matthew Brost <matthew.brost@intel.com>
Cc: dri-devel@lists.freedesktop.org
Subject: [bug report] drm/gpusvm: Add support for GPU Shared Virtual Memory
Message-ID: <adaef4dd-5866-48ca-bc22-4a1ddef20381@stanley.mountain>
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

Hello Matthew Brost,

Commit 99624bdff867 ("drm/gpusvm: Add support for GPU Shared Virtual
Memory") from Mar 5, 2025 (linux-next), leads to the following Smatch
static checker warning:

	drivers/gpu/drm/drm_gpusvm.c:794 drm_gpusvm_range_alloc()
	error: 'range' dereferencing possible ERR_PTR()

drivers/gpu/drm/drm_gpusvm.c
    777 static struct drm_gpusvm_range *
    778 drm_gpusvm_range_alloc(struct drm_gpusvm *gpusvm,
    779                        struct drm_gpusvm_notifier *notifier,
    780                        unsigned long fault_addr, unsigned long chunk_size,
    781                        bool migrate_devmem)
    782 {
    783         struct drm_gpusvm_range *range;
    784 
    785         if (gpusvm->ops->range_alloc)
    786                 range = gpusvm->ops->range_alloc(gpusvm);

xe_svm_range_alloc() returns ERR_PTR(-ENOMEM).

    787         else
    788                 range = kzalloc(sizeof(*range), GFP_KERNEL);
    789 
    790         if (!range)
    791                 return ERR_PTR(-ENOMEM);
    792 
    793         kref_init(&range->refcount);
--> 794         range->gpusvm = gpusvm;
                ^^^^^^^^^^^^^

    795         range->notifier = notifier;
    796         range->itree.start = ALIGN_DOWN(fault_addr, chunk_size);
    797         range->itree.last = ALIGN(fault_addr + 1, chunk_size) - 1;
    798         INIT_LIST_HEAD(&range->entry);
    799         range->notifier_seq = LONG_MAX;
    800         range->flags.migrate_devmem = migrate_devmem ? 1 : 0;
    801 
    802         return range;
    803 }

regards,
dan carpenter
