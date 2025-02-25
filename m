Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 698B9A43747
	for <lists+dri-devel@lfdr.de>; Tue, 25 Feb 2025 09:19:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8E5B210E5A4;
	Tue, 25 Feb 2025 08:19:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="KPBGqczx";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com
 [209.85.214.176])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1D8B110E5A4
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Feb 2025 08:19:43 +0000 (UTC)
Received: by mail-pl1-f176.google.com with SMTP id
 d9443c01a7336-22134a64d8cso12879325ad.3
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Feb 2025 00:19:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1740471582; x=1741076382; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=mx2QrLQuirMCQwy2aokgi/+k+IY05gOk7VQO5JEmOBQ=;
 b=KPBGqczxPz1VHTzQEfMn10gegkJj1/LQ1m1eGB15MKmoU2su7P+Hzyu2Q/oMNuanCF
 DlikooTB80KmKBMW1DcidIaCqhbhBisD5abeuSx+Yf9JkrGG/qlJeQAhTzj00PYG0riW
 jLcACTEc8PeK+4cwDq3T69ehtK5HH28KnPFpkfKNt4StvN2oJoWx6shYxnaWV6+TPaVT
 IMl8gzqBO5hPDVGyaIoeqzPcIyG7mxvHeX9d/13pWPsZ3TGYP4u44fRF9zFkRFdBCL26
 hHAKgWgFJlDxj8mnROmhsL4I66cSPEzNt8aY/FXLW/Izo032YGUyJOetXJZUmphCb15T
 i0ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740471582; x=1741076382;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=mx2QrLQuirMCQwy2aokgi/+k+IY05gOk7VQO5JEmOBQ=;
 b=cr/3UQNHdqR9jrT1MweZxMKjphWkfsB3193PuxdfTWfxE6fPX024/0UwObGj0C9YWp
 8C1FpEZTLFPD0iXs3kY3RyX2hGarw4iBKxhYBmvwr9u922uHw//8VoLDK5b5B89XbzB4
 JsE40imiqQLHvEhvC8yMRAGffudEw5Ovz7tHPgPtBLCl7aVbAgZs3/7AUSfjG5PkcHtF
 mcWgHOPydMSJ/sD5F0K3ZAp5GAcOZE/u90Vg7jJBBjxteheRayRUghWBgUzaDH4FKmJK
 1+qSwSo5HT31TlWdzJmzp8LNo1otw+FyKtG7GNRLbxvjV4/2iBDSkuypv7MAQmRmprY8
 1syg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUMeRrMmYCzUIAnDc65Sk+8tRvbuj1uOvNTpJqwZbAQ751jSFPfYZXnj2Pzl31sklhUzw0rMpHck6k=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxJOAE+EyisvrUPTWklkOyyXVeOyNmIMmHm+PG7fNucZ09o767A
 WBMpSOtANQpgEGxQWhxxNnkitJjXDHy33hBxqyzkv5UPJeqf6obJKISfLvWc92U=
X-Gm-Gg: ASbGncvWXlEyhb+qGknvKSEI/N/PAA9n0k4IeMO+JKAe2GBi0i7GJYv3xQV77WSAGgB
 PwmOra9JFHrr/xbDdtLcWIP7O45diau/B8TnP2sMJYdev9/57EcC2oeQYAoq8hsU9Y66rvub04+
 ybRTYrgt5fb9EvUWWdqU+10qy7SmT2UZr+Cy4aRk13zT29QklvFN1PdEd6eldmF/bwiP1tP1sFT
 Vp7a2+P0mKP8X/+gcArNDGtYBC0dcpfDdZMPtG6+J9/BQfU3QfxSEl78VGs39q1IrsZLoM8FeRg
 xufxA6ZOFivr8hVCVB0ZG1d4+xYMieFe8pitaDQWxA==
X-Google-Smtp-Source: AGHT+IFUZ921XcZ5J+TM3sPegqR9smZXw0NsQmGLu6WmXG02pXk6UoE/wAMIzm34jMd5imF3JFw22w==
X-Received: by 2002:a05:6a00:641a:b0:734:3d2e:18b1 with SMTP id
 d2e1a72fcca58-7343d2e19b4mr7936256b3a.2.1740471582432; 
 Tue, 25 Feb 2025 00:19:42 -0800 (PST)
Received: from localhost.localdomain ([182.148.13.61])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-7347a6ada9fsm943955b3a.17.2025.02.25.00.19.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Feb 2025 00:19:42 -0800 (PST)
From: Qianyi Liu <liuqianyi125@gmail.com>
To: matthew.brost@intel.com
Cc: airlied@gmail.com, ckoenig.leichtzumerken@gmail.com, dakr@kernel.org,
 daniel@ffwll.ch, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, liuqianyi125@gmail.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, phasta@kernel.org,
 tzimmermann@suse.de
Subject: Re: [PATCH] drm/scheduler: Fix mem leak when last_scheduled signaled
Date: Tue, 25 Feb 2025 16:19:32 +0800
Message-Id: <20250225081932.175586-1-liuqianyi125@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <Z71ZM9Cs1Wb4mhD3@lstrano-desk.jf.intel.com>
References: <Z71ZM9Cs1Wb4mhD3@lstrano-desk.jf.intel.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hello Matt,

>> 
>> But also be handy of could share the kmemleak trace.
>>

> Agree kmemleak trace would good, include in commit message, but the
> patch looks correct to me.

Unfortunately, as trace involves private code of our driver, our driver has not
yet officially entered the community yet, but it is already on the way. So I
cannot provide trace information at this time. But I will update the commit in
V2.

Best Regards.
QianYi.
