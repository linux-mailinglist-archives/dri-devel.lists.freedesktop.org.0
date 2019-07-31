Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C29F07C7A0
	for <lists+dri-devel@lfdr.de>; Wed, 31 Jul 2019 17:53:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C707389FA7;
	Wed, 31 Jul 2019 15:53:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x843.google.com (mail-qt1-x843.google.com
 [IPv6:2607:f8b0:4864:20::843])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B494A89F55;
 Wed, 31 Jul 2019 15:53:00 +0000 (UTC)
Received: by mail-qt1-x843.google.com with SMTP id k10so67148157qtq.1;
 Wed, 31 Jul 2019 08:53:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=7qnZYKNjiUhAwGuuvpfbDJ1bk+viLzpxBeBvEog8Bpo=;
 b=YlIxc06Q0KdSUno7FzxKPJZBjJosP9UaM3kWTJ2rNBiqGvAH57nWparU0l6F7D/ieg
 /mtua+Yh/3MxKmJw7Oe7uqMO7gz2+EI5NhJsl8WahEdJcpFfHlsskHF4UcEn1l4nYVn3
 nvGDBa3iOogp0yMVLPzryiThv8WmqWhemv7RS8nRLZVCtiwOKbeTr0t/ONgMfMp+KNib
 dTzPBmt1iOWip4QE4LFT/f0O996bVwogjIuNuBAcdmE/hzK5/kmki7qzEd3J1CXkZsWD
 4JQU44FQ8nARaLtRPxqZMVS3EOBm7jQ2VrEUYR3bbWrRLRIWzIBeiIU22eLb/EkN+YNz
 I8+A==
X-Gm-Message-State: APjAAAUrgbuNqduvXtqDNEH8E4LOX+zBNRD7adcElM/Urq3cTkbk82XP
 Lc3KygTzqXJzl445BIOeRTJWk9dv
X-Google-Smtp-Source: APXvYqw3vHZ04iuFPp1elgRzMZD95yqmZZKx+HhEUWnQ0XI8+8EPVtgAZMI+EzhomQnmr4U/cLrLtg==
X-Received: by 2002:a0c:e5c6:: with SMTP id u6mr70338339qvm.102.1564588379564; 
 Wed, 31 Jul 2019 08:52:59 -0700 (PDT)
Received: from localhost.localdomain ([71.219.6.100])
 by smtp.gmail.com with ESMTPSA id v17sm38020296qtc.23.2019.07.31.08.52.58
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Wed, 31 Jul 2019 08:52:59 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 8/8] drm/amdgpu: drop drmP.h from vcn_v2_5.c
Date: Wed, 31 Jul 2019 10:52:46 -0500
Message-Id: <20190731155246.20603-8-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190731155246.20603-1-alexander.deucher@amd.com>
References: <20190731155246.20603-1-alexander.deucher@amd.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=7qnZYKNjiUhAwGuuvpfbDJ1bk+viLzpxBeBvEog8Bpo=;
 b=llYiqZ63eT80/4HXi7U3mXjRDJmVkILtGToKuGSuZ4nmbf8rcBuXp8ERsvSFAp0lrz
 mhrhbXgGw8Karg7NKYt77QSlOkX4itVSMTsgmm5cBtj9cVqsV7olGuVqqKkuh/uUU8P7
 8kwIafHDXmFmvyEojhtNYCBlt+5amxHEi1wRZCZUq1wYkdpAq9802Dl3UKakBFWghW5I
 gGNal5yGCDzdZ3naLqjp4kUGwKClcoaSHdkgepwM4SEydSp1e5KkC2/v0rD36nTmKWHb
 aoVtRz8ZiVE398xZmk8PicbX1F4zYXoOBlBRCDCzHiW8mUIC8IaGb8fhmrg7Rr71Y8uy
 akSw==
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.23
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
Cc: Alex Deucher <alexander.deucher@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VW51c2VkLgoKU2lnbmVkLW9mZi1ieTogQWxleCBEZXVjaGVyIDxhbGV4YW5kZXIuZGV1Y2hlckBh
bWQuY29tPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L3Zjbl92Ml81LmMgfCAyICst
CiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKCmRpZmYgLS1n
aXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS92Y25fdjJfNS5jIGIvZHJpdmVycy9ncHUv
ZHJtL2FtZC9hbWRncHUvdmNuX3YyXzUuYwppbmRleCAwYzg0ZGJjNmE2MmQuLjM5NWMyMjU5Zjk3
OSAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvdmNuX3YyXzUuYworKysg
Yi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS92Y25fdjJfNS5jCkBAIC0yMiw3ICsyMiw3IEBA
CiAgKi8KIAogI2luY2x1ZGUgPGxpbnV4L2Zpcm13YXJlLmg+Ci0jaW5jbHVkZSA8ZHJtL2RybVAu
aD4KKwogI2luY2x1ZGUgImFtZGdwdS5oIgogI2luY2x1ZGUgImFtZGdwdV92Y24uaCIKICNpbmNs
dWRlICJzb2MxNS5oIgotLSAKMi4yMC4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5m
cmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0
aW5mby9kcmktZGV2ZWw=
