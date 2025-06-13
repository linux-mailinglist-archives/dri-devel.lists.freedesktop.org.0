Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 368D4AD8CE9
	for <lists+dri-devel@lfdr.de>; Fri, 13 Jun 2025 15:12:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A733010E9AB;
	Fri, 13 Jun 2025 13:12:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="BnIQSnUO";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com
 [209.85.221.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3AD2610E9AA
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Jun 2025 13:12:07 +0000 (UTC)
Received: by mail-wr1-f42.google.com with SMTP id
 ffacd0b85a97d-3a375e72473so1315915f8f.0
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Jun 2025 06:12:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1749820326; x=1750425126; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:from:to:cc:subject:date:message-id:reply-to;
 bh=Rig4csR40micHp8QYFZgEwHiIxTKMHujQJyJXhHgFxc=;
 b=BnIQSnUOJW9dZsVKMuL8EJ0aCEPPqCP7alsycqNOAMxaFJhw6toyjN7eKPZIgXweqn
 2MJ18eC+pDzYx6q8BWJ70OWFJvk76GNqyS63fV9fNvsdaOJUKCRJD5q+UxebT30p9IXG
 6aoKvrAuJGj+6N1TD7luRj/dNztN8QDR00eRuuR/g32eNjZzLgPXNWEQFHh0vYa5PB2+
 fZTc+pulUSFB5orut7cpsSVx+Zy9FLyM4gIv0b/H9UdBfQaBTJS8xkrcLTDNV7qBQOE0
 beUFEMjCoUEWgKVLdFPFrNT7VxQzT4+Zk2q8rUbJdgSPZZH9XOhT1OTL65f+KMql6C/s
 QXeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1749820326; x=1750425126;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Rig4csR40micHp8QYFZgEwHiIxTKMHujQJyJXhHgFxc=;
 b=g9R9nyGcOjMYibriBo98FQe38y0we5jW80B3gmIIsYTdozKD8mX+xiTv97iOWDRXjl
 /6JqV8GlNlXBtDemoIuOy9DzH9k+vzDTtA9nHfPzqptNYJu4m6buV/cdQSNeJZsKr4oP
 0Aoyz4aabaGaaVRw5eaHpKa0HHKlXmAmgnqxl0TFwmXoKGIRsWLgGrHMDlHuD1xD5kzI
 +F7QXXNtOznmDZrpUSCfa3UrIpsBayP5sRUViVpALLcKJow8DCnyyhH4iN1Rl52WV3F2
 Vnv1lQa0nCBaGqhee82rny6Anua0NlaNAm70bHOjiXJob/3CN5Yeuh8Yyf6Ly35M6LHr
 Bz8g==
X-Forwarded-Encrypted: i=1;
 AJvYcCX8IloJTLcqTu9exsjfhRyHhVLUKEb9R0l5AfUlQLeTJLdVcjKYawa+QezBINl9Qm/4ECR3EirAlkc=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Ywce1U/atl201SnvsUkeMdjkdmoOyuZESL3mPkw2js7VAaZLw0I
 mQO8SGzj9PRxlUrawKuCh/WVNDO0hmfDFE0+ZhZHfecenvOpaFLBMKW8
X-Gm-Gg: ASbGncs6jP148jTfIDUr0Hb6wOwS9uUnPQgDMWQrEqXO0J4OhqBqWFMYmL6YVU6Ju/d
 3EQ5wOhzAs8aJUsklQ7YWEHCi8yayNLXmsfh7gB/4No3N0N0hMCX5yqzp3QgKbBTxwwO/2nLaat
 X4qLBOFWC7i6ojpQlbyPrOAAAyCLkwFfhMrQsvwDxK8fA7tOc+1Prc3U220NawL5wmiLRTBp0lR
 DxEDnudrpE5TIXBNjmY89GkSrVHTSwM2WsspG+9K2yeahRyKaq+SPEBN9TFPm5bYNhorVNEybh9
 KgbhAbH6VPYYZvpWUZbL7ksUHwEKh0IwE1GjGJmzLTHs0lqqAKS5UY0GoSnEcpHV1lVHLEJKolT
 b
X-Google-Smtp-Source: AGHT+IGpz0N9NGlmIU1vBfxfQAE3YhHSaMIk1o5oE+7UzhlMxZXnPu1XnvbAmINHnxyPrVJ0zCIEQQ==
X-Received: by 2002:a5d:588d:0:b0:3a4:e4ee:4ca9 with SMTP id
 ffacd0b85a97d-3a5687163a9mr2800423f8f.23.1749820324738; 
 Fri, 13 Jun 2025 06:12:04 -0700 (PDT)
Received: from able.fritz.box ([2a00:e180:15f2:1000:ce0c:2fbe:2ade:3d45])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4531febf905sm92921905e9.0.2025.06.13.06.12.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Jun 2025 06:12:04 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: jani.saarinen@intel.com, jani.nikula@linux.intel.com, tursulin@ursulin.net,
 simona.vetter@ffwll.ch, tzimmermann@suse.de,
 dri-devel@lists.freedesktop.org
Subject: Trying to fix drm/prime: remove drm_prime_lookup_buf_by_handle
Date: Fri, 13 Jun 2025 15:12:00 +0200
Message-Id: <20250613131201.2141-1-christian.koenig@amd.com>
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

The problem with this patch is that we now don't check if the handle
already existed any more, but just blindly try to add it again.

This obviously breaks re-exporting DMA-bufs but also surfaces an issue
that we don't seem to take into account that multiple handles can point
to the same GEM object.

Try to fix this by just ignoring adding the same DMA-buf to the rb tree
multiple times. Not sure if that is the best approach, but it should fix
the issue at hand.

Regards,
Christian.


