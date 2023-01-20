Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 635616754A1
	for <lists+dri-devel@lfdr.de>; Fri, 20 Jan 2023 13:35:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F1F6510E00B;
	Fri, 20 Jan 2023 12:35:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1036.google.com (mail-pj1-x1036.google.com
 [IPv6:2607:f8b0:4864:20::1036])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AF26E10EA49
 for <dri-devel@lists.freedesktop.org>; Fri, 20 Jan 2023 12:35:44 +0000 (UTC)
Received: by mail-pj1-x1036.google.com with SMTP id d8so5453708pjc.3
 for <dri-devel@lists.freedesktop.org>; Fri, 20 Jan 2023 04:35:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=yV2oWoct8jHvEDKh4g0zGEsKHmT9W9Ju3bzPj5+1tu8=;
 b=cLfNGiZ4VehBisHJ7fG9F9FZmP0dx1kunOo8soWbrbDm2xThbYLWvfj6sFinIgy83o
 vAen82QLHPpigagRHSrUSPweUMZzzHwKXJKHOsZgmIaSJIbv7Af9PYQRGGt/hZUh4Nio
 OE9m/HzJuFV7IFFhp7Y7Zf2SYEd98Hne8G2HbJ0wKUSWH4SeDYxvWG2MQTOVSpcuLYlJ
 f26FPB/X6LCjpfWaOSGAPFjbdyZqz0jwHJSJatZikoOtpUzM7uCeQ5TnPFG954bRtmYL
 LBtl2PbRWkdOcrwdms7kNukWpMPi4zCTWigSGjrDpecjYZQLJoWfnDepmMPvPnT2b8P6
 j/Rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=yV2oWoct8jHvEDKh4g0zGEsKHmT9W9Ju3bzPj5+1tu8=;
 b=tingStUoIFVLEPVBVY3BxaEpm2VZ2WRPFIIWBXWaP+b2ExLDVFDZc4uzgvo3izH0MX
 GJfYYQ/GErgBNfF8Z6cEDzsORocddRvdWbD4OsqXFJ61afJu41t4rDdljKfFMqXKoxCo
 MopsDxdX/lYu3CEsG0iQOcEUTzSJ93nKT4rmIqkyj4sEup2ryY+fzIF9TlMCCbuRMVWu
 0ObHbE9c8iQ9FyMpS3JHLOLVnCchddM4/m8tNO4CtnS4gmCMtMAapQGo2qlBRLS/Tfbf
 W5HoEA7rNNzRCYylUpFXHNxFHSxpBxDQoPIX66ZEBIObgLsu9u6MNex+YrpdvCM5kCnB
 wPjA==
X-Gm-Message-State: AFqh2krrsPlDwajinrFVF6k44DIjLvzxPzQD4k9f8ruY0LSZXpVK+OAC
 m7BYEeIoCoslnfE24SN/F5g=
X-Google-Smtp-Source: AMrXdXspLJ9QM5pigmWO1C3y1SzqRqvDgFvZVsrGZuQJqOCB8Eh6WcmAQdK+Zh1gdWOZoCdxKnXM7w==
X-Received: by 2002:a17:90b:4a91:b0:229:2a8e:90cf with SMTP id
 lp17-20020a17090b4a9100b002292a8e90cfmr15091662pjb.26.1674218144295; 
 Fri, 20 Jan 2023 04:35:44 -0800 (PST)
Received: from debian.me (subs02-180-214-232-6.three.co.id. [180.214.232.6])
 by smtp.gmail.com with ESMTPSA id
 t13-20020a170902b20d00b001926a76e8absm26910006plr.114.2023.01.20.04.35.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 20 Jan 2023 04:35:42 -0800 (PST)
Received: by debian.me (Postfix, from userid 1000)
 id E62DD104FAC; Fri, 20 Jan 2023 19:35:37 +0700 (WIB)
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: Freedesktop DRI List <dri-devel@lists.freedesktop.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Documentation <linux-doc@vger.kernel.org>,
 Linux KVM <kvm@vger.kernel.org>,
 Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: [PATCH linux-next 0/3] Documentation fixes for linux-next (Jan 20)
Date: Fri, 20 Jan 2023 19:35:31 +0700
Message-Id: <20230120123534.137413-1-bagasdotme@gmail.com>
X-Mailer: git-send-email 2.39.1
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=729; i=bagasdotme@gmail.com;
 h=from:subject; bh=xTrUPK9bQjBpPVPof0lzCkWtR4B7Q/FejCVqz3qmtzY=;
 b=owGbwMvMwCX2bWenZ2ig32LG02pJDMmnuvpvz+G5cJv7zF+ra5ZBBg0zN/d6/Fo1RfnFrNrO47IV
 M7VsOkpZGMS4GGTFFFkmJfI1nd5lJHKhfa0jzBxWJpAhDFycAjCRNxMZGabcdJbrOx188Of/0OdzOf
 avlBRYK+0174Lnfe8zK+LUeA4xMuzgOngz0IGp6ZS2u0x6nOisHdN5j7RoCD5k+7FjwRnHCQwA
X-Developer-Key: i=bagasdotme@gmail.com; a=openpgp;
 fpr=701B806FDCA5D3A58FFB8F7D7C276C64A5E44A1D
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
Cc: Jeffrey Hugo <quic_jhugo@quicinc.com>, Aaron Lewis <aaronlewis@google.com>,
 Jonathan Corbet <corbet@lwn.net>, Sean Christopherson <seanjc@google.com>,
 Oded Gabbay <ogabbay@kernel.org>, Bagas Sanjaya <bagasdotme@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Ofir Bitton <obitton@habana.ai>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Here are fixes for recent htmldocs warnings reported in linux-next. Each
patches can be picked up separately if ACKed.

Bagas Sanjaya (3):
  Documentation: accel: escape wildcard in special file path
  habanalabs: Fix list of /sys/class/habanalabs/hl<n>/status
  kvm: x86/pmu: Add blank line separator before
    KVM_CAP_PMU_EVENT_MASKED_EVENTS code path list

 .../ABI/testing/sysfs-driver-habanalabs       | 23 ++++++++++---------
 Documentation/accel/introduction.rst          |  6 ++---
 Documentation/virt/kvm/api.rst                |  1 +
 3 files changed, 16 insertions(+), 14 deletions(-)


base-commit: d514392f17fd4d386cfadde7f849d97db4ca1fb0
-- 
An old man doll... just what I always wanted! - Clara

