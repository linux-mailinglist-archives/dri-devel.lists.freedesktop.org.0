Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 25A18AC2329
	for <lists+dri-devel@lfdr.de>; Fri, 23 May 2025 14:56:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6F1F610E2AC;
	Fri, 23 May 2025 12:56:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="J79M/eDo";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com
 [209.85.208.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 989F710E2AC;
 Fri, 23 May 2025 12:56:47 +0000 (UTC)
Received: by mail-ed1-f41.google.com with SMTP id
 4fb4d7f45d1cf-602039559d8so9494525a12.1; 
 Fri, 23 May 2025 05:56:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1748005006; x=1748609806; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:from:to:cc:subject:date:message-id:reply-to;
 bh=EGqPnRPAP0iozomfZFAIIFIGHDr4oD4PF4PnQrA9VFE=;
 b=J79M/eDohHaxG7PCAbg7R1Zb4eA8xXovp8x3UA2JmEmvtEJiCI7v0koYVffq9nWmKr
 1d2I7wPs6ZZTZIUWAUzo5hSuKZP/SuDNBvNb2uUzyY18QTiuTEJolPbCyAkpB5fgd6+6
 NhIA8MBa1o+Qlzadn1MJ5pAvOFVNmul35jRJMkZen3Uh6rPON2/Nxfm1yZeggyrR80vM
 L6pWZA8ve2unnDAGvH+2Vm6ylkk2NEPxGmIdaIpjQsPWDsoUOFAPyn3Qjpu07fjlHEP7
 tkPB68wfhJKHwj00hEDfCdN9vCTsyKYVLx6eezeafIxReFbUUjubVvX53rae9OV4NYfL
 vQDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1748005006; x=1748609806;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=EGqPnRPAP0iozomfZFAIIFIGHDr4oD4PF4PnQrA9VFE=;
 b=MtFVzYgJwkSdTxYC0XojHfA5Kt7+ART4XCF4IvpXI9gCIiPlTgPc3TL7Rn2J0NIjEN
 TNsv1R7+Cz85fTQbvWdXLJpQFiCLGkA54LuCA0JfX4Wv9sANhNeWjo8jKL+KzDMZP4w+
 HOLo5HQ3nm5K88NVS4RwX0J37ZCr9uBGbqEpqBhQ+NMKGIWUWt5TzDpBR35Z7vhGjeNY
 q6PzRvRLdofbS/F2lMYVpKD3WJ6riBn28oZXPsWujiYU9t/Mr0HtOInczP8OoqxSkY51
 l/BvFxAjFdxWSO7wmdo62J4gtjME19dgOjAzxomAq2I5gtpJq0bAQs+BdA77m6y2JGOP
 E7dQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUSocuE2xflqAcYjiLDrB5rWeG2r4XghP7fhq3s5RCpcUbDBsfdApnVhZedtTfJZ7+DBMvDVMA9W6MV@lists.freedesktop.org,
 AJvYcCXr1vxWKT4oHWM1LKJLP3OSsLAFMT6cacVlDD842Yowc6fIidCmLElfEhG6RIpOx2/zqr3Z/f3b@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwnFhYK57h2ibmbMbnReIppgsEoiOhrExytS+7W8spV6ax/yQoj
 K+Ho4sl2JSvnWIDip4RQSwohn/Rd48Iz2u58oYqPGcRwpMJ7/dsOO6J9LX90lL1u
X-Gm-Gg: ASbGncv60Chc3jlMRScD6L018COUuuNXkQTfRUQPXqDNziW24XtiYrI4I9w3ivA+XSc
 pl3oFu4IiCMn0ZGIhe4BEDN01GYZLMXTZxPjk1k4vhEFcRsQPUS86P3BHgaoUeNU3zrZwPNIa2t
 psQfogkbH++04AULegARzvAqpCSfRbRc2TCkGabV92C4NLJi9uTOhCxU7UJ5vLmEFC60ikRm4V0
 Pc0C2xkfshEH6P1wvJqm3seFp8tWiIkL7eS/pWl5iUth9/QxXOVY2hkxJqx1S/BA3DG1h24DgKN
 R8oG7fwIlFXeG2zZIFXAeYoH/urijCi0Wbxj15Jt8wYckegwEDaQPOTdxxzgYbG0
X-Google-Smtp-Source: AGHT+IEYu65acXaLUF9HpEGOHxlmjd8OXPyYssh56BGZUyUcARGJtJzjZbzw0HO6Lfy3aVdml0wn7g==
X-Received: by 2002:a05:6402:35c7:b0:602:1d01:2883 with SMTP id
 4fb4d7f45d1cf-6021d012d55mr11197752a12.1.1748005005826; 
 Fri, 23 May 2025 05:56:45 -0700 (PDT)
Received: from able.fritz.box ([2a00:e180:1544:9c00:c200:979c:6701:1954])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-6020e441c84sm5863302a12.38.2025.05.23.05.56.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 23 May 2025 05:56:45 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: tursulin@ursulin.net, phasta@mailbox.org, dakr@kernel.org,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Subject: Fixing AMDGPUs gang submit error handling
Date: Fri, 23 May 2025 14:56:39 +0200
Message-Id: <20250523125643.7540-1-christian.koenig@amd.com>
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

fives try to those patches. I think I finally manage to understand
how xarray works.

There are the high level and lower level API and we can actually save
tons of CPU cycles when we switch to the lower level API for adding
the fences to the xarray.

Looks like this is working now, but I won't mind some additional
testing or ideas for more test cases.

Regards,
Christian.


