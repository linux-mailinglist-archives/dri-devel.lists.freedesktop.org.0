Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B088A6A5469
	for <lists+dri-devel@lfdr.de>; Tue, 28 Feb 2023 09:34:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4CE8E10E5C3;
	Tue, 28 Feb 2023 08:34:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com
 [IPv6:2a00:1450:4864:20::52b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 184AE10E663;
 Tue, 28 Feb 2023 08:34:11 +0000 (UTC)
Received: by mail-ed1-x52b.google.com with SMTP id s26so36417153edw.11;
 Tue, 28 Feb 2023 00:34:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=lMx8IZAZ+uyGjiM65Q81ufkQr1Zsw0qyBQ2/2nQzHjY=;
 b=Hot59AaxEIP+dY9B5Gu1Y980jx7AErDksMW8rC45Wei+TVrO+Y2zAszm6TiNCU/Rr7
 2vrhvjxVeULsaWlU+lpGT1cDojnZ30HzDeQC93gvGGBDURLE2g2RMP5jMZbfffawZC49
 7QGBuQUmodP4Oh1e+YPnzAxct8f7leOdMbrig1t3oq1pQLiskJnr97bGWX4vu1HpO7d4
 2oydrdhLd3jlMHGDC19DEf/Qv4/WbKZa37SM8IBoNkTPgavhEvZFcar4PEkee+VSxc1l
 JcRnavAx+gPR9f0YzdYZkc9qED/oaMeNzB+eczY3oCGlphxtQU51B6GGal0WiXOoMvV/
 xxwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=lMx8IZAZ+uyGjiM65Q81ufkQr1Zsw0qyBQ2/2nQzHjY=;
 b=IKDhrw8yV14KuOapMUdiTVSj4jVRIxRN/9suagZ1qDMbwQga7SAjyGAT0c3HRcYGBt
 2WiFxosIFKG2IqIHByOO8wgndHyLSaOMZDRvlacNQ7UpeGcnBXRURBDGr4RCHdypiyt2
 Zeq7Xpoq6RprLyJSNVvpEB6pEYLmQoB9ZHKCkfCDkmk1TElfnOUtWzM7B4/RS5E3QDpv
 i3CHobAVTV8+E3JVusyUR711E386kGjBCmhOTBf7+BgiLh4Q9rxjJxX6j1Iphf+Yo1zB
 YJEYcvKEt0+io6z5wIqzNwj5EePyxCTUKNYPPIEChUurTR3HDShYX5eCFgg7AxwDhyo2
 QhoQ==
X-Gm-Message-State: AO0yUKWxpha4Cn0jocbSV/3sAB88bcGDagTdq02nJUsWvqjZW1Y6n/eK
 czeUQAzmVsLQTEwVyLPdRdu2IF7ebJE=
X-Google-Smtp-Source: AK7set/eq51ShZkFGVYeTISYzWFKY8ehYvrliJmPwYcbUxafNHp3pDrLKvGZ/TrKFL6QPXVNFkcIMw==
X-Received: by 2002:a17:907:6d86:b0:8e9:6f9f:7c2d with SMTP id
 sb6-20020a1709076d8600b008e96f9f7c2dmr2381456ejc.35.1677573249599; 
 Tue, 28 Feb 2023 00:34:09 -0800 (PST)
Received: from able.fritz.box (p5b0ea2e7.dip0.t-ipconnect.de. [91.14.162.231])
 by smtp.gmail.com with ESMTPSA id
 ss17-20020a170907039100b008cf6f8798e1sm4296969ejb.54.2023.02.28.00.34.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Feb 2023 00:34:08 -0800 (PST)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: amd-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: Common DRM execution context v3
Date: Tue, 28 Feb 2023 09:33:57 +0100
Message-Id: <20230228083406.1720795-1-christian.koenig@amd.com>
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
Cc: dakr@redhat.com, arunpravin.paneerselvam@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi guys,

thrid round for those patches. They have been in my queue for nearly a
year now because I couldn't find much time to push into this.

Danilo wants to use this for his GPU VAs tracker work and Arun needs it
for hist secure semaphore work, so we should probably get it reviewed
now.

Compared to the last version I've fixed one memory leak found by Danilo
and removed the support for duplicate tracking. Only radeon really needs
that and we can trivially handle it differently there.

Please review and/or comment,
Christian.


