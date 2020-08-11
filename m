Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D637241A3C
	for <lists+dri-devel@lfdr.de>; Tue, 11 Aug 2020 13:19:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2D20C6E50B;
	Tue, 11 Aug 2020 11:18:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com
 [IPv6:2a00:1450:4864:20::341])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7F6AA6E50B
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Aug 2020 11:18:55 +0000 (UTC)
Received: by mail-wm1-x341.google.com with SMTP id g75so2000091wme.4
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Aug 2020 04:18:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=WhMlMR0rWuSfJKIPPo9mAojnhHNWUY4zWDVzFeeHjaY=;
 b=Jz+aoNkIcFDY6nGZZsPqisGocV5D1HD4hNhlDzRzcadvtZ56+uD7mYRpbzlO1RgNuD
 UVvnCfwAGTtGwlnAE3kl2NJbWOoBS/+F9gGWz26ruptiARES3F6KsanO7nMWQ1iwT/jB
 TQkZIYgtxn3zms7KAb1qOqESycn3YzMQLHOQpeBtgnK/ynLY5wdtwTGMywNCsE/LL6GH
 QN9R2XV80pwRjRJ2RA2WP7mgP9ZJhq4CmrOxfyf7EZYZKIDlURJYWhsXcRv9cYqwcZ0Q
 PboD5Kf8J5hrbCxANqp/ZnV0lVcLRK0LPo5WcPcV2ISTe9JHfFQ/HTQHWVumtrw+s4HP
 aN1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=WhMlMR0rWuSfJKIPPo9mAojnhHNWUY4zWDVzFeeHjaY=;
 b=NfJQS2VWer/WElbhMRzXiKZHf3/PJQQi1VWM3sJ2MF5iJce8X1c2YJfa3e5iXbS+Yu
 gC79iYV/n2SJXwh1DiLD8BcNyARhYoatpMMtzV8MYEoS/CHHxuKWsWca5t5bP9nQnclg
 ZcUua3uzDlJh+LdMrMFAdbcA7JmnbiMDQFdTmwkGPQWEdjl6VYIrBGtS11julhETp81/
 mMaTKwhbQpCec1RQVhLqZ2KrXcFa1oaG25LqdOz9rYFZ6Ytc64+Lf8e70yqnt5zCPZZA
 MIEbWJ6+T1hoVmAVyyUn1oTyD3776BKAxMuOp+M32Yvqm4avkx/8X8nZuIkY5cDhhrHZ
 3nkg==
X-Gm-Message-State: AOAM531QAxiVTqQEVB/YVp+Ynczhg9dHcVsx8EzAK7wioeituP3BsdF0
 94c9/Z2TAAZDD6+4SI+MMWI=
X-Google-Smtp-Source: ABdhPJwBz0QXOIsjFl8fTDXDwU6V3q5VDdVsjTjA4lHmld5TpMebvTdgNMLcWqtfmJW6sn22ji8TbA==
X-Received: by 2002:a1c:750f:: with SMTP id o15mr3737321wmc.182.1597144734158; 
 Tue, 11 Aug 2020 04:18:54 -0700 (PDT)
Received: from laptop.fritz.box ([2a02:908:1252:fb60:be8a:bd56:1f94:86e7])
 by smtp.gmail.com with ESMTPSA id t14sm29172064wrg.38.2020.08.11.04.18.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 11 Aug 2020 04:18:53 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: peterz@infradead.org, mingo@redhat.com, will@kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Subject: [PATCH] locking/rwsem: remove redundant semicolon of
 down_write_nest_lock
Date: Tue, 11 Aug 2020 13:18:52 +0200
Message-Id: <20200811111852.190209-1-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogR3VjaHVuIENoZW4gPGd1Y2h1bi5jaGVuQGFtZC5jb20+CgpPdGhlcndpc2UsIGJyYWNl
cyBhcmUgbmVlZGVkIHdoZW4gdXNpbmcgaXQuCgpTaWduZWQtb2ZmLWJ5OiBHdWNodW4gQ2hlbiA8
Z3VjaHVuLmNoZW5AYW1kLmNvbT4KUmV2aWV3ZWQtYnk6IENocmlzdGlhbiBLw7ZuaWcgPGNocmlz
dGlhbi5rb2VuaWdAYW1kLmNvbT4KLS0tCiBpbmNsdWRlL2xpbnV4L3J3c2VtLmggfCAyICstCiAx
IGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKCmRpZmYgLS1naXQg
YS9pbmNsdWRlL2xpbnV4L3J3c2VtLmggYi9pbmNsdWRlL2xpbnV4L3J3c2VtLmgKaW5kZXggN2U1
YjJhNGViNTYwLi43YTViZjVkNTA0ODkgMTAwNjQ0Ci0tLSBhL2luY2x1ZGUvbGludXgvcndzZW0u
aAorKysgYi9pbmNsdWRlL2xpbnV4L3J3c2VtLmgKQEAgLTE3OSw3ICsxNzksNyBAQCBleHRlcm4g
dm9pZCBfZG93bl93cml0ZV9uZXN0X2xvY2soc3RydWN0IHJ3X3NlbWFwaG9yZSAqc2VtLCBzdHJ1
Y3QgbG9ja2RlcF9tYXAgKgogZG8gewkJCQkJCQkJXAogCXR5cGVjaGVjayhzdHJ1Y3QgbG9ja2Rl
cF9tYXAgKiwgJihuZXN0X2xvY2spLT5kZXBfbWFwKTsJXAogCV9kb3duX3dyaXRlX25lc3RfbG9j
ayhzZW0sICYobmVzdF9sb2NrKS0+ZGVwX21hcCk7CVwKLX0gd2hpbGUgKDApOworfSB3aGlsZSAo
MCkKIAogLyoKICAqIFRha2UvcmVsZWFzZSBhIGxvY2sgd2hlbiBub3QgdGhlIG93bmVyIHdpbGwg
cmVsZWFzZSBpdC4KLS0gCjIuMjUuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGlu
Zm8vZHJpLWRldmVsCg==
