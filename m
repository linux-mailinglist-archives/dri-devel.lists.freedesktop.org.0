Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B6F35AB8A1A
	for <lists+dri-devel@lfdr.de>; Thu, 15 May 2025 17:00:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C667110E8E4;
	Thu, 15 May 2025 15:00:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="b1Zx7/JO";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com
 [209.85.128.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 066C510E8D8;
 Thu, 15 May 2025 15:00:42 +0000 (UTC)
Received: by mail-wm1-f53.google.com with SMTP id
 5b1f17b1804b1-442d146a1aaso9573795e9.1; 
 Thu, 15 May 2025 08:00:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1747321240; x=1747926040; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:from:to:cc:subject:date:message-id:reply-to;
 bh=os8YzaW8rhj7KTtMBjFn9qGxLXMLeXw5aXcBqy1PAzA=;
 b=b1Zx7/JOPb+qiCXe6+IK7tXk5rKUU0O52NkFPcHFd+eOkvlvrnqCkz/1vbg+4DX4aH
 iN2vfecKgC5C0jtwBUDkSYmtIHMX8TdxsJ15K3xb0mPRLxhnjbbw8m4OgZqYa5iHvMQl
 ddRr6JKcyjS7jZDH3jg336mZFG5zTnHJYn7F8UY2AKHSdYDTnhjaGvLI04PsiaSOANhi
 7AfLd6Ys9LETnHPfmvWt9agD239wzwpCAtBGxnc9eSzdDsGzIqM1+sKldtVO7mIgdqF0
 r/zQRzApEheFvdgJ485/UikXu8di0YIp+jeYUqH1GZBcqr5qaKzcb5DKpRmS6a2oJlkd
 LvxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747321240; x=1747926040;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=os8YzaW8rhj7KTtMBjFn9qGxLXMLeXw5aXcBqy1PAzA=;
 b=s3P4P8pbVrSFQ/9dTfQLKTA1yRT5jLjBeQ/ABoPperT0r9Wki/D27HwWWGsrDh9/Cr
 Xeg9lmzdYfTnd2zNHh57mN4djq8NZF9gottg5JcOXQAt9LvYd8a8r6TMSGfDBBE/nPxn
 h/gO+M3WBmHNX39w6fBoPIz+pX1HEWKBo4zc23G5K4qdzT1BvEqBK/oaTzqPJohwppQ0
 R+raA4gPzYh30xqxvb7sXmDZIDoCMCziK4krvjawyVAP7aNivwg2NwqU48sA2Pt+e2Yb
 g6OANSbZCL8Qqz3qglXagy2Dq0BijOjhk7s2R3XaIUq3/NNM/f4dmz7shCj4o2Emdf8b
 OyEQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWp3FFfDqrfpJtVDMUcox1AaFihrwJFKMQMSQKc0V/5VuTvPuGPQhMn/13/nPVBfyip2YMsQW1I@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy9OE4PY2w87WbFsd/i/3B03MePPiDiNfrXDZq08dpcIIn1be7l
 fMpcqky5+MrWRuoXzmS6nVHc3lRyxV/2LBGUU5nl4U9LfBVwENEvRx8SAw==
X-Gm-Gg: ASbGncsoml8MlJaAkj/cfecO9sN27ylpwi0J84pd3PljH6DQ8Zo7AUGkffDvzokRnaM
 niO2APZwsAQMi1sBfduIQdvJb8YxP/+CmVxBIKrcrkmcToG2NPg5gOROdyHjKSSH6Td4pQhNTcC
 Mi3Mx8XmYVND/kkA4KXDVcmA7OhcAqABXnb4DTwHSEEy9uTQSFz+M8UkwHPyb4ahSl9HhvHbli2
 STV7RNseYe4b5BEZSfccFZTr1eh9J/bVsHQLgf7lOrKUwC9Q4NN46q7sxUbV807EJnr0oFAYgKr
 es6v81ox2qs1oiJvyDYmtwb+l89xlrZBOXudss8bUrlPMMA8Y3qoxkzGkdoUIdMb
X-Google-Smtp-Source: AGHT+IGNHayjSEhTjWrLyJG55cAYxV9qUFCNZ8nRb7BP2EMHigXyOXBQPE+5q6hDV152+mKKEXpl/w==
X-Received: by 2002:a05:600c:3554:b0:442:e109:3032 with SMTP id
 5b1f17b1804b1-442f970a9bfmr32101365e9.24.1747321240177; 
 Thu, 15 May 2025 08:00:40 -0700 (PDT)
Received: from able.fritz.box ([2a00:e180:15b1:d600:9d43:bc40:55da:2532])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-442f39e8578sm75808185e9.29.2025.05.15.08.00.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 15 May 2025 08:00:39 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: dri-devel@lists.freedesktop.org, phasta@mailbox.org, dakr@kernel.org,
 amd-gfx@lists.freedesktop.org
Subject: Fixing AMDGPUs gang submit error handling
Date: Thu, 15 May 2025 17:00:35 +0200
Message-Id: <20250515150038.4615-1-christian.koenig@amd.com>
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

third revision of this patch set. I've re-worked the interface
completely this time since my previous assumptions on how the
reservation function of the xarray work weren't correct at all.

I also added a test case to make sure I've got it right this time.

Please review and comment,
Christian.


