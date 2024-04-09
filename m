Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ACEDD89E1D0
	for <lists+dri-devel@lfdr.de>; Tue,  9 Apr 2024 19:46:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 806E9112E89;
	Tue,  9 Apr 2024 17:46:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Tn5889eA";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-f46.google.com (mail-ot1-f46.google.com
 [209.85.210.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1C63B10E8E8
 for <dri-devel@lists.freedesktop.org>; Tue,  9 Apr 2024 16:39:16 +0000 (UTC)
Received: by mail-ot1-f46.google.com with SMTP id
 46e09a7af769-6ea243406f0so414526a34.2
 for <dri-devel@lists.freedesktop.org>; Tue, 09 Apr 2024 09:39:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1712680756; x=1713285556; darn=lists.freedesktop.org;
 h=to:cc:date:message-id:subject:mime-version
 :content-transfer-encoding:from:from:to:cc:subject:date:message-id
 :reply-to; bh=47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU=;
 b=Tn5889eARUishZJJpmOdavmB3kkmYMho/GX31OAb9NbckhPB9LpMpr47zqZuPO0T8j
 hG6oEcPln+Kuc/FDCa0tvQBvUTK59iUDb8mfUdp8zOsQqTL+doyc0jF3+WpW58+WcyFQ
 5JfjwzhgufT4LfRY2K4fB+gxr+m01bbbaB91h2/eJ9WILO+EIuSjdApv23orvXE488UM
 YzPgYl+fwmlJ/FwPoHWUN2s5Jg135/LBWiHPsVW2QZGULBzihr9lJr+V75as4lMACMbh
 60CELbpr965K3GAZwq4PmMd3/ZvRteebVo5FG5CMEd5+1Gdu4+BaAdJxxLHwu3uYoMex
 O8tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1712680756; x=1713285556;
 h=to:cc:date:message-id:subject:mime-version
 :content-transfer-encoding:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU=;
 b=kAcuHOvyTXCng46jyJgb1+Np7HkBeKMQpA8Lc2LE96wKSbfkRBRFlIVtqWMCHwNSDC
 eNv12w13u3zvjLPOIksVF/It/ovE7ynxVhpch8/JLZVrC1hC8PWk0f4BbY67rVe+FZ3r
 CQZffMm7ju7/OlUQrDbNY1iLFkSym6CGCf+FnsWCW9z47r2qo448wsvjfvb85fT+uBkI
 jggacNpq4Mf3gkG7u6WlvHAnKOX0a15TVUMiAQ8BnH7ZVNV/iJJ4YpI4+X2oXvfotRmG
 2SaIJx2/8IGmbIu7+X92BY/vSHC4TJtAtRBiEvPMAFryB/li6P8RkKAZpzzsXHllrI7R
 WCCw==
X-Gm-Message-State: AOJu0Yy6JpKWKrtK4tC8QIWXSVGuBUSwGtZnfB/1r57LexC52u1KrCae
 D3j4Qwwr2CaaGmWoDildYVgwCttOE49q0Dmj1z8sZwvFa4N42UGU
X-Google-Smtp-Source: AGHT+IGJ5lNrHVrSwjpXPTtHBITp8Ar+HPnfk7p7X7Bx+D51y+T47ROSf82PBpkVELv/QS3b8b7J4w==
X-Received: by 2002:a9d:734c:0:b0:6ea:1e87:4389 with SMTP id
 l12-20020a9d734c000000b006ea1e874389mr363607otk.8.1712680755955; 
 Tue, 09 Apr 2024 09:39:15 -0700 (PDT)
Received: from smtpclient.apple ([172.93.220.120])
 by smtp.gmail.com with ESMTPSA id
 g4-20020a633744000000b005f05b06229dsm8481034pgn.41.2024.04.09.09.39.13
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 09 Apr 2024 09:39:15 -0700 (PDT)
From: purofle <purofle@gmail.com>
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3774.500.171.1.1\))
Subject: Re: [PATCH] staging: fbtft: fb_st7789v: support setting offset
Message-Id: <6012A476-14B0-4910-8DDB-98BE0BFC9074@gmail.com>
Date: Wed, 10 Apr 2024 00:39:10 +0800
Cc: dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
 linux-staging@lists.linux.dev, purofle@gmail.com
To: gregkh@linuxfoundation.org
X-Mailer: Apple Mail (2.3774.500.171.1.1)
X-Mailman-Approved-At: Tue, 09 Apr 2024 17:46:12 +0000
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

