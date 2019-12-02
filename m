Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A295710F974
	for <lists+dri-devel@lfdr.de>; Tue,  3 Dec 2019 09:05:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 51FE06E400;
	Tue,  3 Dec 2019 08:05:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x241.google.com (mail-oi1-x241.google.com
 [IPv6:2607:f8b0:4864:20::241])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8682589C9A
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Dec 2019 13:36:55 +0000 (UTC)
Received: by mail-oi1-x241.google.com with SMTP id b8so3173652oiy.5
 for <dri-devel@lists.freedesktop.org>; Mon, 02 Dec 2019 05:36:55 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id;
 bh=FnsSvzvpi8rvXngynEnIF5568olLzHSROrVg8551Pdg=;
 b=N8GRUYVqBY6H9183C5dak6Vd38D5+I3oocA4h/tbtI4lY+Yk9ZjoMWTBPP3CwAHOt0
 qyh/k/jttPdY6WaNk2+nfsetk5ifr+/DUczImneMY7oiQECluZ6gv3gXhfgVkwBf5hIj
 myexBKDZ1UnXzjwCfUBt7RYuWePhGKjvc3/jaaye6drQNeWv4B4OuUNkedO3yO5+TipK
 Esfkm9S370z7BSdqfxq593ZPc2ZKLjbNNfdfGmgswyvvBSF/pP3CMPEPbpq3ZI6DzMRd
 Vrv0k8esHAv1SttL6SbMW+0z61B9Y2M3Ydj8mlXL8ZGXxVzxZBaIDq/t+ODei9nfSDrO
 HcUA==
X-Gm-Message-State: APjAAAWPmC0ERpqAyQLRcLFw6/NdghiZ3p7E15+vSDnVJAPTfX9TqP/o
 2639ufTtfKN/kI4RIdKgWm8=
X-Google-Smtp-Source: APXvYqx/AuYwJFFyGAocMdeJL8EwVFo4CUFiifY6rbcl8jS1D87O2ftjdbHeXTr71+6vZ58rn6UC9Q==
X-Received: by 2002:aca:d6c4:: with SMTP id n187mr10999803oig.29.1575293814707; 
 Mon, 02 Dec 2019 05:36:54 -0800 (PST)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
 by smtp.gmail.com with ESMTPSA id w2sm7666720otp.55.2019.12.02.05.36.53
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Mon, 02 Dec 2019 05:36:53 -0800 (PST)
From: Guenter Roeck <linux@roeck-us.net>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Subject: [PATCH] drm/dp_mst: Fix build on systems with STACKTRACE_SUPPORT=n
Date: Mon,  2 Dec 2019 05:36:50 -0800
Message-Id: <20191202133650.11964-1-linux@roeck-us.net>
X-Mailer: git-send-email 2.17.1
X-Mailman-Approved-At: Tue, 03 Dec 2019 08:05:18 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id;
 bh=FnsSvzvpi8rvXngynEnIF5568olLzHSROrVg8551Pdg=;
 b=s4WsHbuEIV/IT4VcFl3ordMxhLT1jgk5Hd8GZEhmqL9YAU57tg6T+afCLLolAuMvp2
 ga29NPZZNHQfPv0IOXQQkkStrvBUEaPZOjbnpfvh9d/krzIwQfrS14wQk7HQLEJX7PbL
 N/t98w7lMGw+rrqJhXKF4SCeVQwOYK5pZZvD1Z5hmIa11RjIfw4DqYfaymVpUeRqnxm7
 ddiSgW6zEuy2zQpUGAAHdcPlYkv18rttoH3UHB0+Gud1/JfUzgQKjguh6r8L87rZhWv5
 Qj80069/uUJD6pf9N8Cuf4t5u9sIik36fVctICHLCgH1JinJd4zKySjH9NaGFVUBRM19
 hdEw==
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
Cc: David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Sean Paul <sean@poorly.run>,
 Guenter Roeck <linux@roeck-us.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gc3lzdGVtcyB3aXRoIFNUQUNLVFJBQ0VfU1VQUE9SVD1uLCB3ZSBnZXQ6CgpXQVJOSU5HOiB1
bm1ldCBkaXJlY3QgZGVwZW5kZW5jaWVzIGRldGVjdGVkIGZvciBTVEFDS1RSQUNFCiAgRGVwZW5k
cyBvbiBbbl06IFNUQUNLVFJBQ0VfU1VQUE9SVAogIFNlbGVjdGVkIGJ5IFt5XToKICAtIFNUQUNL
REVQT1QgWz15XQoKYW5kIGJ1aWxkIGVycm9ycyBzdWNoIGFzOgoKbTY4ay1saW51eC1sZDoga2Vy
bmVsL3N0YWNrdHJhY2UubzogaW4gZnVuY3Rpb24gYHN0YWNrX3RyYWNlX3NhdmUnOgooLnRleHQr
MHgxMWMpOiB1bmRlZmluZWQgcmVmZXJlbmNlIHRvIGBzYXZlX3N0YWNrX3RyYWNlJwoKQWRkIHRo
ZSBtaXNzaW5nIGRlZW5kZW5jeSBvbiBTVEFDS1RSQUNFX1NVUFBPUlQuCgpGaXhlczogMTJhMjgw
YzcyODY4ICgiZHJtL2RwX21zdDogQWRkIHRvcG9sb2d5IHJlZiBoaXN0b3J5IHRyYWNraW5nIGZv
ciBkZWJ1Z2dpbmciKQpDYzogTHl1ZGUgUGF1bCA8bHl1ZGVAcmVkaGF0LmNvbT4KQ2M6IFNlYW4g
UGF1bCA8c2VhbkBwb29ybHkucnVuPgpTaWduZWQtb2ZmLWJ5OiBHdWVudGVyIFJvZWNrIDxsaW51
eEByb2Vjay11cy5uZXQ+Ci0tLQogZHJpdmVycy9ncHUvZHJtL0tjb25maWcgfCAxICsKIDEgZmls
ZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9L
Y29uZmlnIGIvZHJpdmVycy9ncHUvZHJtL0tjb25maWcKaW5kZXggMTE2ODM1MTI2N2ZkLi5iZmRh
ZGMzNjY3ZTAgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9LY29uZmlnCisrKyBiL2RyaXZl
cnMvZ3B1L2RybS9LY29uZmlnCkBAIC05NSw2ICs5NSw3IEBAIGNvbmZpZyBEUk1fS01TX0ZCX0hF
TFBFUgogCiBjb25maWcgRFJNX0RFQlVHX0RQX01TVF9UT1BPTE9HWV9SRUZTCiAgICAgICAgIGJv
b2wgIkVuYWJsZSByZWZjb3VudCBiYWNrdHJhY2UgaGlzdG9yeSBpbiB0aGUgRFAgTVNUIGhlbHBl
cnMiCisJZGVwZW5kcyBvbiBTVEFDS1RSQUNFX1NVUFBPUlQKICAgICAgICAgc2VsZWN0IFNUQUNL
REVQT1QKICAgICAgICAgZGVwZW5kcyBvbiBEUk1fS01TX0hFTFBFUgogICAgICAgICBkZXBlbmRz
IG9uIERFQlVHX0tFUk5FTAotLSAKMi4xNy4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0
cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9kcmktZGV2ZWw=
