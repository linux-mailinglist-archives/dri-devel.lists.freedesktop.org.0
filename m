Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 02FFEA377D2
	for <lists+dri-devel@lfdr.de>; Sun, 16 Feb 2025 22:36:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A8C4710E0A0;
	Sun, 16 Feb 2025 21:36:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="Ey60BixU";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com
 [209.85.218.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8446110E0A0
 for <dri-devel@lists.freedesktop.org>; Sun, 16 Feb 2025 21:36:52 +0000 (UTC)
Received: by mail-ej1-f50.google.com with SMTP id
 a640c23a62f3a-abb705e7662so259481666b.0
 for <dri-devel@lists.freedesktop.org>; Sun, 16 Feb 2025 13:36:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1739741811; x=1740346611; darn=lists.freedesktop.org;
 h=content-transfer-encoding:content-disposition:mime-version
 :message-id:subject:cc:to:from:date:from:to:cc:subject:date
 :message-id:reply-to;
 bh=EuanzaLe7/iKX6VhHEtwsF9WJOk9n9+krynkGT1kcoA=;
 b=Ey60BixUli2e4QdO6Q95aR+eCmxB7M85Vu8fYivF49DkZ2rR/4YbW03cOT8i7ZUNwP
 ZtlbnA9pl38E5FpYLOrtDFpZgL1EkmUKNofxN5NMS6BznNGfqD1/zC4eq21ESH94Zj/N
 E2M2ZDSJC8e7rJT9rzlMwLgkEzFqcACzRdKzteVZr28hjkrVRXEQFt6Z+PqChuEy9l8p
 DjFTDlqvdW6aFoGLJ04Rm/NsXhse3mraCBR/e+RT3yzeswcCfC+2XUC/CEAPTlLTC8AA
 VXoObsROtWDcul2nVGe1uNsKyVS84Sg3svb+acxIA2PYJPU4uFMdJe1sHWvGjIhRehIG
 Fedg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739741811; x=1740346611;
 h=content-transfer-encoding:content-disposition:mime-version
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=EuanzaLe7/iKX6VhHEtwsF9WJOk9n9+krynkGT1kcoA=;
 b=A12OnmPWyz6M9NtBEVbr31kELSNgxIiyDhZLM8jORurofUcwS+nOQ+hZGH/WRoRY5P
 rkF3hl+GuszfEaYwM1OOzTE9Lrz4acNX1La2GHnykL8TsgHN8lIrsewqfyRMqZvHOkBW
 fYQYj1Z8ejZGr94QceRgMFW5nkgNtqvyOEBf/LUqVPGqL7txKjZUT5fc/4+8L3wfQmsB
 ZxcYzY3CkOSfN39yFr0mp01kUxHn8pWXrsXoj/uJKXPQz1kw++BWRvrjYB0X9adm7TEX
 P12G9DN2b2AcutoPatFnAmRKOJI0tGcLiTbBw5/8kHkRKLd+YCVL9LHiHdXvaBwUsOL9
 izVQ==
X-Gm-Message-State: AOJu0YxZma4urvwPSxAiGpebLLNCoQrUI65LRAn+InkSlvLGSdg7u33a
 4bOoMzr5E7xfIU3sO2xdS2946ifLSaWVMYwrQN6Fy4+a7dIuqP7xxL9eYzOcXEo=
X-Gm-Gg: ASbGncufcmKqrX0jvmnBLDip31eJwsVAb/k8oSsgzDp3tREaLRCFw5NimotXhJHJHf0
 lhgnUZdGrldpljfWIoTbSqKf5lZUy7ynRCulnE04zavCCwTTWVHX3iQQx09TC53xT8Z/f1Xv5Rz
 I9tPRo9klzb0zpdi/V192ACZCPI5T043d6ouyhLC5o4zvw8EzPJNOy98Hl0wgxzAPaLNVBAy0r/
 od0UwW8nscS3cqlNmyMSzSgfQowTc1BGwcroKI1d35bpwqXEML5RzTNbLi5RDcT9+hX0Iks7PQZ
 teBTMOg+IMEzOIkUP8Wo
X-Google-Smtp-Source: AGHT+IEIIZmYTbDDUeTH8dlmbO4tFhADyrcmBJye9x4MCY7syyjZFMk52Nblm3hVhunISdBN3fmQgg==
X-Received: by 2002:a17:907:7d8b:b0:ab3:3b92:8ca5 with SMTP id
 a640c23a62f3a-aba50fa0db1mr1489211966b.12.1739741810988; 
 Sun, 16 Feb 2025 13:36:50 -0800 (PST)
Received: from localhost ([196.207.164.177])
 by smtp.gmail.com with UTF8SMTPSA id
 a640c23a62f3a-aba5339dcf3sm768707166b.156.2025.02.16.13.36.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 16 Feb 2025 13:36:50 -0800 (PST)
Date: Mon, 17 Feb 2025 00:36:46 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: =?iso-8859-1?Q?Adri=E1n?= Larumbe <adrian.larumbe@collabora.com>
Cc: dri-devel@lists.freedesktop.org
Subject: [bug report] drm/panthor: Expose size of driver internal BO's over
 fdinfo
Message-ID: <083ef44a-ea8a-4291-b345-c570cc1078f4@stanley.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hello Adrián Larumbe,

Commit 434e5ca5b5d7 ("drm/panthor: Expose size of driver internal
BO's over fdinfo") from Jan 30, 2025 (linux-next), leads to the
following Smatch static checker warning:

	drivers/gpu/drm/panthor/panthor_mmu.c:1968 panthor_vm_heaps_sizes()
	warn: sleeping in atomic context

drivers/gpu/drm/panthor/panthor_mmu.c
    1956 void panthor_vm_heaps_sizes(struct panthor_file *pfile, struct drm_memory_stats *stats)
    1957 {
    1958         struct panthor_vm *vm;
    1959         unsigned long i;
    1960 
    1961         if (!pfile->vms)
    1962                 return;
    1963 
    1964         xa_lock(&pfile->vms->xa);
                 ^^^^^^^
This is a spinlock.

    1965         xa_for_each(&pfile->vms->xa, i, vm) {
    1966                 size_t size = 0;
    1967 
--> 1968                 mutex_lock(&vm->heaps.lock);
                         ^^^^^^^^^^
So we can't take a mutex if we're holding a spinlock.

    1969                 if (vm->heaps.pool)
    1970                         size = panthor_heap_pool_size(vm->heaps.pool);
    1971                 mutex_unlock(&vm->heaps.lock);
    1972 
    1973                 stats->resident += size;
    1974                 if (vm->as.id >= 0)
    1975                         stats->active += size;
    1976         }
    1977         xa_unlock(&pfile->vms->xa);
    1978 }

regards,
dan carpenter
