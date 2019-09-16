Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C4437B3C63
	for <lists+dri-devel@lfdr.de>; Mon, 16 Sep 2019 16:19:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 07FE86E98C;
	Mon, 16 Sep 2019 14:19:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E831E6E98C;
 Mon, 16 Sep 2019 14:19:29 +0000 (UTC)
Received: by mail-wr1-x442.google.com with SMTP id y19so39100682wrd.3;
 Mon, 16 Sep 2019 07:19:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ilVdu72i07DHZI9ukWSKXB2K5vtZKUJjVZKfFY7e8gE=;
 b=D4ccsRnZYUkou7K5Ht+F51UCTsWsXtxAN5qGotGB9ARk9JG0cR9UAqwvHdCkgsHaTC
 EuACSeFfQ5/yu86Gx0L/krKEabzClcfm/BAhPx2QhKfNUHlkXDnt+JSR87gEuLzTiUzT
 l9daeFDhNetRuEcKp6IO3sdM/4sHU8LKwDXu0JpimqtlV/2WJSi4FHMxcEQFCFmVWDV3
 VrQWHA5TusZbBoftlkzhcDT0mb+fdeE5Y3YagncPRkZMslUaklSb/JiUtGM5pyjUdeKp
 dybsSlCQ/GAN6Jd4hEmizhd91NEB8/oGIavMAjJNF+u5fdPj3Bwo4jE0n4pvvx0Ckc97
 NA1A==
X-Gm-Message-State: APjAAAU7QsAEkIfcQYFYl7S2CPn28y5OpSXelyTDAjDvagJNDuqk7OEL
 Ac32pvunOvYPAEVQaALSQd0=
X-Google-Smtp-Source: APXvYqxnXokAwImSpNxCmJHnP6dNbZvIHXDxUG1kZ3Oflodlt68cj5zSGE9AQYS++rT4joTF/YwA1g==
X-Received: by 2002:adf:828d:: with SMTP id 13mr11630wrc.115.1568643568436;
 Mon, 16 Sep 2019 07:19:28 -0700 (PDT)
Received: from localhost (p2E5BE2CE.dip0.t-ipconnect.de. [46.91.226.206])
 by smtp.gmail.com with ESMTPSA id c74sm13390909wme.46.2019.09.16.07.19.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Sep 2019 07:19:27 -0700 (PDT)
From: Thierry Reding <thierry.reding@gmail.com>
To: Ben Skeggs <bskeggs@redhat.com>
Subject: [PATCH 0/4] drm/nouveau: Miscellaneous fixes
Date: Mon, 16 Sep 2019 16:19:22 +0200
Message-Id: <20190916141926.8594-1-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ilVdu72i07DHZI9ukWSKXB2K5vtZKUJjVZKfFY7e8gE=;
 b=o8ZKdrAwGygqZyqlWCZ7W9JrDpVahhzjxjdMh4dO33DYSASVdgNTrlr9l7y1OYRsbg
 A9ejZ//PXEf0PLhdY8VoejUNyffJ6F82qshc1Ts3CivExMv2QUMYqCnSeJ5vwmQSn3af
 JfnDH98Kfp57O4cINi61nrGtUZr+9D7EzL7nyPdlCb2YJHS56ADdbvlH+QRwKIFtuJbj
 7o3HpHH+AXOg+kbarSPOR1tkbAEqdRrC7+YBvmCmzDIATVIsVGZ+hrhAu4RlljeeEdxQ
 GdoQSTAljWt+RDp3OSXR9d1fDSh/VEPrYlROgyCfqg7bAfvsW+xNcwz6UgxjuM5wBU+N
 T+vA==
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
Cc: nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogVGhpZXJyeSBSZWRpbmcgPHRyZWRpbmdAbnZpZGlhLmNvbT4KCkhpIEJlbiwKCnRoZXNl
IGFyZSBmaXhlcyBmb3IgYSBjb3VwbGUgb2YgaXNzdWVzIHRoYXQgSSd2ZSBiZWVuIHJ1bm5pbmcg
aW50byB3aGVuCnRlc3Rpbmcgb24gdmFyaW91cyBUZWdyYSBib2FyZHMuIFRoZSBmaXJzdCB0d28g
cGF0Y2hlcyBmaXggdXAgaXNzdWVzIGluCnRoZSBmaXggdGhhdCBJIGhhZCBzZW50IG91dCBlYXJs
aWVyIHRvIGZpeCB0aGUgcmVncmVzc2lvbiBpbnRyb2R1Y2VkIGluCmRybS1taXNjLW5leHQuIFRo
ZSBmaXJzdCBvbmUgaXMgY3JpdGljYWwgYmVjYXVzZSBpdCBhdm9pZHMgYSBCVUdfT04gYXMKcmVw
b3J0ZWQgYnkgSWxpYSwgd2hpbGUgdGhlIHNlY29uZCBpcyBsZXNzIGNyaXRpY2FsLCBidXQgcmVz
dG9yZXMgdGhlCmxvY2tpbmcgY29ycmVjdG5lc3MgKGF0IGxlYXN0IHRvIHRoZSBiZXN0IG9mIG15
IGtub3dsZWRnZSkuCgpQYXRjaCAzIGlzIHNvbWV0aGluZyB0aGF0IEkgdGhpbmsgd2FzIGFsc28g
Y2F1c2VkIGJ5IHRoZSByZXNlcnZhdGlvbgpvYmplY3QgcmV3b3JrIGFuZCBpcyBraW5kIG9mIGEg
Y29udGludWF0aW9uIG9mIG15IGVhcmxpZXIgYXR0ZW1wdCB0byBmaXgKdGhlIFZNQSBub2RlIHNo
YXJpbmcgYnJlYWthZ2UuIFRoZSBjdXJyZW50IG9yZGVyaW5nIGJldHdlZW4gVFRNIGFuZCBHRU0K
dGVhcmRvd24gaXMgY2F1c2luZyBhIERFQlVHX0xPQ0tTX1dBUk5fT04oKSBiZWNhdXNlIEdFTSBj
bGVhbnVwIGFscmVhZHkKZnJlZWQgYSBtdXRleCB0aGF0IFRUTSB0ZWFyZG93biB3aWxsIHN0aWxs
IHdhbnQgdG8gdXNlLgoKTGFzdGx5LCBwYXRjaCA0IGlzIHF1aXRlIHVuY3JpdGljYWwsIGJ1dCBp
dCdzIGEgb25lLWxpbmUgY2hhbmdlIHRoYXQgaXMKY2F1c2luZyBhbiB1Z2x5IChidXQgaGFybWxl
c3MpIGV4dGVybmFsIG1lbW9yeSBhZGRyZXNzIGRlY29kZSBlcnJvciBvbgpUZWdyYTIxMCBhbmQg
bGF0ZXIuIEl0IHNlZW1zIHRoYXQgZm9yIHNvbWUgcmVhc29uIGNsZWFyaW5nIHRoaXMgcmVnaXN0
ZXIKd2lsbCBjYXVzZSBhIERNQSBvcGVyYXRpb24gdG8gYmUgc3RhcnRlZCBieSB0aGUgR1BVLiBJ
J3ZlIHZlcmlmaWVkIHRoYXQKaXQncyB0aWVkIHRvIGV4YWN0bHkgdGhhdCByZWdpc3RlciB3cml0
ZSBieSBtb2RpZnlpbmcgdGhlIHZhbHVlIHdyaXR0ZW4KdG8gdGhlIHJlZ2lzdGVyLCBhbmQgc3Rh
bGxpbmcgZm9yIGEgY291cGxlIG9mIHNlY29uZHMgYWZ0ZXIgdGhlIHJlZ2lzdGVyCndyaXRlLiBU
aGUgYWRkcmVzcyBkZWNvZGUgZXJyb3IgcmVmbGVjdHMgdGhlIHZhbHVlIHdyaXR0ZW4gaW50byB0
aGlzCnJlZ2lzdGVyIGV4YWN0bHkgYW5kIGl0IGFsd2F5cyBoYXBwZW5zIGEgY291cGxlIG9mIG1p
bGxpc2Vjb25kcyBhZnRlcgp0aGlzIHdyaXRlLgoKVGhpZXJyeQoKVGhpZXJyeSBSZWRpbmcgKDQp
OgogIGRybS9ub3V2ZWF1OiBGaXggZmFsbG91dCBmcm9tIHJlc2VydmF0aW9uIG9iamVjdCByZXdv
cmsKICBkcm0vbm91dmVhdTogcHJpbWU6IEV4dGVuZCBETUEgcmVzZXJ2YXRpb24gb2JqZWN0IGxv
Y2sKICBkcm0vbm91dmVhdTogRml4IG9yZGVyaW5nIGJldHdlZW4gVFRNIGFuZCBHRU0gcmVsZWFz
ZQogIGRybS9ub3V2ZWF1OiBnbTIwYjogQXZvaWQgQkFSMSB0ZWFyZG93biBkdXJpbmcgaW5pdAoK
IGRyaXZlcnMvZ3B1L2RybS9ub3V2ZWF1L25vdXZlYXVfYm8uYyAgICAgICAgICB8IDI2ICsrKysr
KysrKysrLS0tLS0tLQogZHJpdmVycy9ncHUvZHJtL25vdXZlYXUvbm91dmVhdV9iby5oICAgICAg
ICAgIHwgIDQgKy0tCiBkcml2ZXJzL2dwdS9kcm0vbm91dmVhdS9ub3V2ZWF1X2dlbS5jICAgICAg
ICAgfCAgNyArKy0tLQogZHJpdmVycy9ncHUvZHJtL25vdXZlYXUvbm91dmVhdV9wcmltZS5jICAg
ICAgIHwgMjcgKysrKysrKysrKysrLS0tLS0tLQogLi4uL2dwdS9kcm0vbm91dmVhdS9udmttL3N1
YmRldi9iYXIvZ20yMGIuYyAgIHwgIDEgLQogNSBmaWxlcyBjaGFuZ2VkLCAzOSBpbnNlcnRpb25z
KCspLCAyNiBkZWxldGlvbnMoLSkKCi0tIAoyLjIzLjAKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVs
QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
