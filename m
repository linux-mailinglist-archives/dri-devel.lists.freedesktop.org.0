Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B06EB12972
	for <lists+dri-devel@lfdr.de>; Fri,  3 May 2019 10:04:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DAA9289831;
	Fri,  3 May 2019 08:04:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [IPv6:2a00:1450:4864:20::431])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4D67A89831
 for <dri-devel@lists.freedesktop.org>; Fri,  3 May 2019 08:04:20 +0000 (UTC)
Received: by mail-wr1-x431.google.com with SMTP id k16so6619394wrn.5
 for <dri-devel@lists.freedesktop.org>; Fri, 03 May 2019 01:04:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=O/iAlI3Ze14WDJbZlxuX552+CJPTn3xAfoMMH3JVjBM=;
 b=I0ajaA26ZQxAZ84eo7PUNE1gHnxXsUsAmRqfprWrMrhV8LLtQI2iGirEWqODyJzNxR
 e2mS1ObO6wpzFkDcrA9096UAI+YuXGrGTf1BkndILi7aRwftkvkqNeSMewlH5bCqp0gv
 6AK7DYyC2cA31S+TKfPCOrPnpQAr0CuEEP8POyi+NjjJpOtxdyt1qqKD7jcG0VRQDzcs
 HZCiqAuTuYKJakZSZeJfbTO5WjTf3qhS/GEOAMtc+lopCq/7VnvpuWeJeaFO0TBKg9Je
 wPWuS/gNc46EEYP8rClzZMJiurllLddJ8WmboypW+3epPj+h+ng+QCobm8Zo6WozqLSw
 e9HA==
X-Gm-Message-State: APjAAAXsSbc/n91jevsrjjFmBAmagCGj7yHXFhL1AoFcbyO/3RuLN6+b
 gPGST5To7JEdZhuyyoClKTI=
X-Google-Smtp-Source: APXvYqxu3evdeSoKSp8z6uWFLbgOLn2jFN/PfsOIYmGwL80yKGtqtujNz3uaSz6ydEO38WXKrTOOhg==
X-Received: by 2002:a5d:4b43:: with SMTP id w3mr6299237wrs.140.1556870658789; 
 Fri, 03 May 2019 01:04:18 -0700 (PDT)
Received: from ogabbay-VM.habana-labs.com ([31.154.190.6])
 by smtp.gmail.com with ESMTPSA id y6sm2690113wra.24.2019.05.03.01.04.17
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 03 May 2019 01:04:18 -0700 (PDT)
From: Oded Gabbay <oded.gabbay@gmail.com>
To: alexdeucher@gmail.com,
	airlied@gmail.com
Subject: [PATCH 0/1] Officialy leaving role as amdkfd maintainer
Date: Fri,  3 May 2019 11:04:07 +0300
Message-Id: <20190503080408.7799-1-oded.gabbay@gmail.com>
X-Mailer: git-send-email 2.17.1
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=O/iAlI3Ze14WDJbZlxuX552+CJPTn3xAfoMMH3JVjBM=;
 b=UmyTXqCjkcMGmfn0/CZtTeeeD/LLiUa8j+ltgpBx23NDughApkNM4hk43qpegv3XSP
 uipLwLYmVTO9wJt8OLb5+go5CHmQ9BuZYYAWoYWkNsYl8Upkkq4EF71cWdqtONMFjQAQ
 9DA8hNgOCKcPzQ0xiVAiVZ2hWCG6FqKxn6EkkDmcxzG0IHfuVywK5GU3J6uhpOvx2tOs
 gxxImNP772wBgW+V8N/z4gEs85X8rnoCUWEF8apweMBlOrZizNZ5rRfmGUQbUc5IfIVP
 1dggIorbaB2hgENc68ZJJq7DqY9xX3A8vqqqYuqGCNqmMgnDC8q3OTNKkqT6aqw9ZliP
 /cAw==
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
Cc: dri-devel@lists.freedesktop.org
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgRGF2ZSwgQWxleC4KCkknbSBzZW5kaW5nIHRoaXMgdG8gbGV0IHlvdSBrbm93IEknbSBvZmZp
Y2lhbHkgbGVhdmluZyB0aGUgcm9sZSBvZiBhbWRrZmQKbWFpbnRhaW5lci4gVGhlIGRyaXZlciBp
cyBub3cgYmVpbmcgdXBzdHJlYW1lZCBieSBBbGV4IGFuZCBpcyBhbgppbnRlZ3JhbCBwYXJ0IG9m
IGFtZGdwdSBzbyBJIGZlZWwgaXQgaXMgbW9yZSBjb3JyZWN0IHRvIHNwZWNpZnkgQWxleCBhcwp0
aGUgbWFpbnRhaW5lciwgZXNwZWNpYWxseSBmb3IgcGVvcGxlIHdobyB3YW50IHRvIGFzayBxdWVz
dGlvbnMgb3Igc2VuZAp0aGUgb2RkIHBhdGNoIG5vdyBhbmQgdGhlbiBhbmQgbG9vayBhdCB0aGUg
TUFJTlRBSU5FUlMgZmlsZSB0byBrbm93IHdobyB0bwpzZW5kIHRoZW0gdG8uCgpJbiBhZGRpdGlv
biwgZm9yIHRoZSBwYXN0IHllYXIgSSBoYXZlIGJlZW4gc3VwZXIgYnVzeSB3aXRoIG15IG5ldwpo
YWJhbmFsYWJzIGRyaXZlciBzbyBJIGRpZG4ndCBoYXZlIHRpbWUgdG8gcHJvcGVybHkgcmV2aWV3
IGFtZGtmZApwYXRjaGVzLCBhbmQgSSBkb24ndCBzZWUgdGhpcyBzdGF0ZSBjaGFuZ2luZyBhbnl0
aW1lIHNvb24uCgpJdCdzIGJlZW4gYSBncmVhdCB0aW1lIHRvIHdvcmsgd2l0aCB5b3UgZ3V5cyBh
bmQgSSBsZWFybmVkIGEgbG90IGZyb20geW91CmFuZCBmcm9tIG90aGVyIHBlb3BsZSBpbiB0aGUg
ZHJtIGNvbW11bml0eS4gSSdtIHN1cmUgd2Ugd2lsbCB3b3JrIGFnYWluIGluCnRoZSBmdXR1cmUg
OikKClRoYW5rcywKT2RlZAoKT2RlZCBHYWJiYXkgKDEpOgogIE1BSU5UQUlORVJTOiB1cGRhdGUg
YW1ka2ZkIG1haW50YWluZXIKCiBNQUlOVEFJTkVSUyB8IDQgKystLQogMSBmaWxlIGNoYW5nZWQs
IDIgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKCi0tIAoyLjE3LjEKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxp
c3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNr
dG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
