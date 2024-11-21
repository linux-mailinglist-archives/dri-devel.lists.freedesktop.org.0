Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 695409D4ADC
	for <lists+dri-devel@lfdr.de>; Thu, 21 Nov 2024 11:27:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4792210E3EE;
	Thu, 21 Nov 2024 10:27:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="HP4q+o7L";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com
 [209.85.128.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5A02A10E1CB
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Nov 2024 10:27:30 +0000 (UTC)
Received: by mail-wm1-f50.google.com with SMTP id
 5b1f17b1804b1-431ac30d379so6254155e9.1
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Nov 2024 02:27:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1732184848; x=1732789648; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=uVPbCx41/i33Lifm4uk9YuOJpXE9AMy4CBxtpjk4LA4=;
 b=HP4q+o7L0L21JbVvG6SyzG2OHcndE+aU9Lj/ljfY43HH5ueJAQupsInD4IjmTd0bJ2
 dpQlOKHi6/BuIJi/f4Vw5AF22T4R/exIYOKQUCMoHHkcCDi518DrIdrZdgl60VB3piGZ
 lZSde1pjzb8NVh51pyYWkrzjtDSrZGZ2YmwpVdzP1xHYYomSKBFUEWL5XGdEpACHrdS7
 I4INMMtaO6zhOk1c5aAra0rDpBFV8C68BxW5llNuRzYXRmbIbWBCdzY1X+SF/3WWie5U
 Fn0XXtPzhJjmv9n8IuX3Jd3cLNpg7yXnCrgfpbcw5b6yreu7AtKloN9mpqjrxvCNbAWB
 0Svg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1732184848; x=1732789648;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=uVPbCx41/i33Lifm4uk9YuOJpXE9AMy4CBxtpjk4LA4=;
 b=ERk6OwvSt9ROJi2m0CYV4Ios+M+XfgQ3ML9T2dvupbfUSmakn7le7ofJ0D85rzvFNG
 VcHEd4LX5epEGdIeIX2JFKnjI4OtrbaGIyrzZVKHAbeLUsTwB5RPgzNODK2e4FApdP7L
 P0pfsFJ1Rx9eZtc2SSXYX1woA6ejBhTmurkQ5eyuyUkbCMGI0IUdO60ouObHqqBaSv9K
 IYWlUGHH1jqX3Vzyn/BqUZru2Pdn2CcQn4dWwnLYy+v5a7evAkcq5kfsmE3l2wmxA49O
 JYRo5mHxYfOgeiIA0T1x7Hy5blG6u1pFiygRpbU46tWV79GeqtneOUWWXQlIgdMEMGC3
 RA4Q==
X-Gm-Message-State: AOJu0Yx1pr5rGJaaxPJah5aMceAliRcU7/KfdB6rXhX3bd5uEb5rbkGh
 YIKI6UfeIhPEp/0wOW6xatzp160Wqy2CvL5PQxlLoNtHes3j9iAW
X-Gm-Gg: ASbGncv0z0Z0Efji8zXU/+24gLVyIHox684H+gbzdqOKlfPURaYTCKyF62nGAzM0ice
 zkcYGq74tbBL5rnJi28WnM9/Uu3z/X2UqfmXBLEffKdIaXbwAksnYXytWq6nCUJAdqDn+3DbLCd
 hKRoGskfdtdhTHoh1dRUuqseJxtqXGwkGy0zpkI+Wc2YxVSq5UTUJF7ra0muNghn8TQiOGwpY32
 lqJGd53xoW6asPfIiOGbGjGqGaTC+XyQhUblp9nLQeWdDiaNxXDgGD376dRpg==
X-Google-Smtp-Source: AGHT+IHbs4GSsdP3oh0FHATpm11Uu4IdDXPkp8CH6n5055/tHiyE/DKge6dFMz/TVp859qRXG71ziQ==
X-Received: by 2002:a05:600c:4586:b0:42e:d4a2:ce67 with SMTP id
 5b1f17b1804b1-433489d47fcmr60512025e9.17.1732184848347; 
 Thu, 21 Nov 2024 02:27:28 -0800 (PST)
Received: from able.fritz.box ([2a00:e180:1564:d000:2ed:2997:a6e4:61cb])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-433b45d17ccsm52533165e9.6.2024.11.21.02.27.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Nov 2024 02:27:27 -0800 (PST)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: zack.rusin@broadcom.com
Cc: dri-devel@lists.freedesktop.org
Subject: Phase out ttm_exec
Date: Thu, 21 Nov 2024 11:27:21 +0100
Message-Id: <20241121102725.4195-1-christian.koenig@amd.com>
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

Hey Zack,

vmwgfx is the only driver left using this component.

So I though I go ahead and complete switching over to drm_exec.
The patches are only compile tested, but relatively staright forward.

Thanks,
Christian.


