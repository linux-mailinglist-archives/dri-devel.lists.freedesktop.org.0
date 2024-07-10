Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BC5D92D1D2
	for <lists+dri-devel@lfdr.de>; Wed, 10 Jul 2024 14:43:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 867A810E785;
	Wed, 10 Jul 2024 12:43:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="JKtsF7fI";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com
 [209.85.208.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 296C810E782
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Jul 2024 12:43:06 +0000 (UTC)
Received: by mail-ed1-f52.google.com with SMTP id
 4fb4d7f45d1cf-58be2b8b6b2so7950655a12.3
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Jul 2024 05:43:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1720615384; x=1721220184; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:from:to:cc:subject:date:message-id:reply-to;
 bh=1ckZ0Jk5xDKqct+xyDn31zyHsKLpFdTFuRDOxc/iWGs=;
 b=JKtsF7fISE6gT2aLfPU9d3PXTiMBD9jCPS/eXlp0URaMbenFpK5Zis85ankzt2PJhj
 i1MIjksYPAFUBLWU88IjchsTKX6xPTgQfq/HFIUpo4PZjMogrbbcm3CJbSSii2vGQisD
 e6aAhJB6eNLxG4hsqwtYRQ/zqwE0ntm7WyLVfso8Qn3tL11VSVTTJfed6JjrHmXbAP4w
 k72PCQmhVVBoVVDipTXSev1Nr4Bj85EFd+qJHQD7ZepEf3sZgpToTmHxkPy+XTaSSM+0
 9mJ1sGsVqICnGXTzTP/1hjxShhWoYzS+qtCk+2dEzNxmkhFDo0Z/omgu5XO7jFqBYG89
 +DNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1720615384; x=1721220184;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=1ckZ0Jk5xDKqct+xyDn31zyHsKLpFdTFuRDOxc/iWGs=;
 b=XRONFteA7KAGNRZNc42yonTjFv7ReAFtgIPbmMT/7pWydr89bx11bjtKN5Yt4XWFao
 qMvkgdJCxKDGw9SoSoKHYfGcDRGTLjsYbAHfMq9n4WZiSj1fzHbBrgap/q+29UQ/buMC
 PBgPfL62OsklBJwtkeL7uT0uH/OkRykZ1nO8Ok7LoS4AQrALeH3u+hUbJg09uDF0vH80
 /Jnxv7Vwhq0cqyRKre6uemlaE5CppA660cHs/w5xbvacEaB96JvnjpyUZwaNw5CBD8MI
 cHRo6220HsxzG8Be2n5JZsjIOc6D8By49yNL/w9jymttzaWii9k7ovpS4RiAgPQ5l69H
 FHgA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVEZdrFmchpLvmbWf2IpjUIYlm2yn1eyOhdG2tdPOg82BYjImlGymwHs8p4VXxhzppbgokLwtxGzLiEhbkBVhp9wPUDsbJEKxPmXr4ngor3
X-Gm-Message-State: AOJu0Yw3u3VIQy7NdpdnfhQSKaKMhGw8bSVKXuFDxbl0W0Q6C81TL/Re
 pr+vslM0Q/DeLcUBX4U5qTOtGtwroSFzfoYIA+a6fdfcKNIfRIbd
X-Google-Smtp-Source: AGHT+IEFcqeLDuySjVQ6NSqkaNx0xkgQrPQKr0xiu80wyAf9sISQKQ5VTzTxg43JHurwqM1U2nlRBg==
X-Received: by 2002:a05:6402:35d0:b0:58c:6edf:d5d1 with SMTP id
 4fb4d7f45d1cf-594ba98f24fmr4028687a12.5.1720615384062; 
 Wed, 10 Jul 2024 05:43:04 -0700 (PDT)
Received: from able.fritz.box ([2a00:e180:1504:6f00:b310:1e44:6e5e:7646])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-594bb9604f7sm2171868a12.15.2024.07.10.05.43.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 Jul 2024 05:43:03 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: thomas.hellstrom@linux.intel.com, matthew.brost@intel.com,
 dri-devel@lists.freedesktop.org
Subject: Using drm_exec in TTM
Date: Wed, 10 Jul 2024 14:42:54 +0200
Message-Id: <20240710124301.1628-1-christian.koenig@amd.com>
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

while this works in an initial test I just realized that we need to
merge the GEM and TTM reference count first for it to be 100% reliable.

Otherwise it can be that we try to evict BOs which are in the process of
being torn down. And this in turn will result in a whole bunch of
problems.

So going to work on that first, just sending out the patch set once more
so that it won't get lost.

Regards,
Christian.


