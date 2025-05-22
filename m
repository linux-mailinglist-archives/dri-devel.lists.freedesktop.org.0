Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 11153AC0D03
	for <lists+dri-devel@lfdr.de>; Thu, 22 May 2025 15:41:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2817010EDFE;
	Thu, 22 May 2025 13:41:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="iGVV+Vk0";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com
 [209.85.218.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6B63310EE1F;
 Thu, 22 May 2025 13:41:23 +0000 (UTC)
Received: by mail-ej1-f45.google.com with SMTP id
 a640c23a62f3a-ad545e74f60so978726166b.2; 
 Thu, 22 May 2025 06:41:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1747921282; x=1748526082; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:from:to:cc:subject:date:message-id:reply-to;
 bh=ZC8b4RfxWvJ5pOKKWO7QXyFdtWaMuJHQPQ50D18Sksw=;
 b=iGVV+Vk08SiYNv8i/GyiBgpIv1TPc4Iw6E7Hx5JtfWovTT7Wo8K+DBHKet+BFhP0PJ
 QduHwmCfP5JcUlLAlRbS8e8uBJj3j9yxiRrI2jclUi3L86LFOR8wsoXi9OH4acbN/mpw
 1AmV8JPKP2MVRvmeIL/TSxh92/3PfIDWN7n3P+wSAXZDH5gKzx4g+9z8PxdOelbZndPa
 vLFScrzDN7ZuPQ8/lzVC8ySH8hFaK3cbQ+WwB/UQ8cgdSLlY3ibWcQOx8BozgGm43XeC
 f9FsOnQgBPodVkOVJU6WTh2sU0qtqWfrJ/8jOHn2etWdrJIv7rW5n5vQxYHLYhVp3WvQ
 Y0Tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747921282; x=1748526082;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ZC8b4RfxWvJ5pOKKWO7QXyFdtWaMuJHQPQ50D18Sksw=;
 b=qCFQUJ0XI96YLhPVEVcGOCx89JcMRjYAK/aCaXrBXh+lcmAn4CFWQYexSLNfiz5vUc
 sDaLShaqY+DY/NJ1JBhQ87rHvoaEI+p1QQ5eY9ywxTgMimn6TaTu1yrKrZfqpaghKiSA
 coJYcHrRBa64gIGD1uTSUhuv58peSzpRZL6Ecjl4IMXiwgMLdCZu1wv+Z9oJK9BLT33/
 YkwxqJZQudcDJqew+6AEBa/KiZfzKg0P3W8e9w0m9jCLPIaB63UpnTzlECFx9R5DqKbr
 71eUYOdAjgnT4iEANhhadCpPKInxW16gz0hPxa54UCQRjWygBV3ECM03oR2dTwT6ykK3
 Rvew==
X-Forwarded-Encrypted: i=1;
 AJvYcCW4rAEI3Wolb9wj00+ouu5Q586Dv1aZwS9ZPSeUNj66zFDUEtxBpCmXt2wq5Oga7WQ+6+yJFBD3@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw0nLmVQ9SOeXa1y/gz70tsDHDzTmuwmjaLwucJg0hhBtiTxhiu
 V2dF6mkq7uhFcnWtmta/9C/ZIAZ/Q3GSWu/kiOK01I82v0ekp0vOJRqclCKwAg==
X-Gm-Gg: ASbGncsSYfPjym2I14PB7M8ft5NY55cOPsU6z623GfrEBAp4MQjuunuKmLJ5eVdXsTn
 kjth2KVQvcHYWKwDDwyGpuaDEa+qu7j8Oe37R953eq5+1GlJsSa3d5xJ2C2CkwINyQukx3LAtPo
 fjd7xCEhD8CFHVt7tSsqoIzlwTgfGPFHAwElPgo/WH4K6l58Q233S+61SBXsvrS3EMupeJlwNjW
 raz+AfSYryHnLBUYJno4THm0PLDMjNYQZPmWSyzfB+RpSUSyAN98ZXWIRJq+wnlIvabfCheNso9
 ZfjxyicCoQ1mjqNN4O8OVMXCQQPVU/S8sFkkCA9h9fqZZVCLMkXhggpusVC77Ww=
X-Google-Smtp-Source: AGHT+IFtJnPAKRP6v1x79FyEV1EC240XHbLzt5zhoqUoETXxLpaNfm8JLfN/WfJNgAZaOBOEcbG5iA==
X-Received: by 2002:a17:907:1b0c:b0:aca:c49a:aec5 with SMTP id
 a640c23a62f3a-ad52d4302d5mr2210181866b.8.1747921281599; 
 Thu, 22 May 2025 06:41:21 -0700 (PDT)
Received: from able.fritz.box ([2a00:e180:1533:800:9db1:9b52:19ec:8c5a])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ad52d04af40sm1082487566b.34.2025.05.22.06.41.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 22 May 2025 06:41:21 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: dri-devel@lists.freedesktop.org, phasta@mailbox.org, dakr@kernel.org,
 amd-gfx@lists.freedesktop.org
Subject: Fixing AMDGPUs gang submit error handling
Date: Thu, 22 May 2025 15:41:13 +0200
Message-Id: <20250522134117.7561-1-christian.koenig@amd.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

Hi guys,

fourth revision of those patches.

Tvrtko got me on another idea how to avoid returning the index of the
reserved slot to the caller. That simplfies the handling quite a bit and
makes the code more resilent to errors.

Please take another look,
Christian.


