Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A6FD46A25A
	for <lists+dri-devel@lfdr.de>; Tue, 16 Jul 2019 08:45:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9127F6E0AF;
	Tue, 16 Jul 2019 06:45:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x241.google.com (mail-lj1-x241.google.com
 [IPv6:2a00:1450:4864:20::241])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8BD616E0A5
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Jul 2019 06:44:58 +0000 (UTC)
Received: by mail-lj1-x241.google.com with SMTP id z28so18808085ljn.4
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Jul 2019 23:44:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=4oYeGeiP2/hnuu7eaHpykfuMyoXhxfAP5O+atBvkcb4=;
 b=Ke8x+Yv6gWE6FQB352n1N7y5MQSMi0WJSGR0kTH4Bgmdtg7IfgGKnbm6XMut0luU49
 LXNdanOOJehgwzTqCsQs5bp2LvJ618EBp3aIVvW9j28eMiSlsu88r/D8wNTfXNEV4Q/S
 HJuriT+WtRJaBxzeMvlFrVHqDCpPHjBsLq+7EBXWixbohVfz8uASjsOho+lUKQXWpT4o
 CMiaRQ5KX7oGARNclrAoiKZat5MMk7ofr0smj7R4vM3jqT8O3BPP4sxT7SXkVacMZRLD
 6umv46hoE5+1M1MuUJr1gGc2Jq1qdfHLzpJDNjl6scaKOGueKl/ooJhAgM9xESBIvYmz
 58tQ==
X-Gm-Message-State: APjAAAXhiBOiQdqGn0xeb8ofifILoZAQ6ubMQjdxGqLLJixu4mkvvFX2
 //TDZxq3teFRuFdhxdncbFd1UUBfPJ3gWg==
X-Google-Smtp-Source: APXvYqyKuOVg7PdPVWyrzzfvp6rlERWgQqrWmCarkADXaG7kf7W8galv3Jl7Kw+vqaRqBmpDWaox1A==
X-Received: by 2002:a2e:9dd7:: with SMTP id x23mr17044864ljj.160.1563259496305; 
 Mon, 15 Jul 2019 23:44:56 -0700 (PDT)
Received: from saturn.lan (18.158-248-194.customer.lyse.net. [158.248.194.18])
 by smtp.gmail.com with ESMTPSA id
 27sm3529993ljw.97.2019.07.15.23.44.55
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Mon, 15 Jul 2019 23:44:55 -0700 (PDT)
From: Sam Ravnborg <sam@ravnborg.org>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v2 11/19] drm/tdfx: drop use of drmP.h
Date: Tue, 16 Jul 2019 08:42:12 +0200
Message-Id: <20190716064220.18157-12-sam@ravnborg.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190716064220.18157-1-sam@ravnborg.org>
References: <20190716064220.18157-1-sam@ravnborg.org>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=4oYeGeiP2/hnuu7eaHpykfuMyoXhxfAP5O+atBvkcb4=;
 b=UK09eXr4ucYcJuJvwhQvS0iB6E58KpUzH66Oz4giUI90wD1qDdrhEAitXJTNdDxzfz
 uuUnzwsUMND88JGYvH6CfKmSMsSDJjaVMJu/AhQ5oirlhnBMRAbwiDrazr+dzRJaIIz/
 Ldg1mj3QnSMA5BHSLUfCKfKWb3xBsT1H4HE8P/aDKswwTBM4tPnYZX/0NMlU95csOshb
 OhkmnClsTWLGROCK+t+4J8++FO9oiYCi+oZnoqvafhXx0iDec6Tibo57NUycS9YbsUFV
 IP83b4Yd3xjnO8AveNS7dNkqYoYzSyMd1tiyKxvYc8yXKJioOaHvi9zxKWtwFzVIQWPE
 Wfaw==
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
Cc: David Airlie <airlied@linux.ie>, Sam Ravnborg <sam@ravnborg.org>,
 Emil Velikov <emil.velikov@collabora.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

UmVwbGFjZSBkcm1QLmggaW5jbHVkZSB3aXRoIG5lY2Vzc2FyeSBpbmNsdWRlIGZpbGVzLgoKU2ln
bmVkLW9mZi1ieTogU2FtIFJhdm5ib3JnIDxzYW1AcmF2bmJvcmcub3JnPgpBY2tlZC1ieTogRW1p
bCBWZWxpa292IDxlbWlsLnZlbGlrb3ZAY29sbGFib3JhLmNvbT4KQ2M6IERhdmlkIEFpcmxpZSA8
YWlybGllZEBsaW51eC5pZT4KQ2M6IERhbmllbCBWZXR0ZXIgPGRhbmllbEBmZndsbC5jaD4KLS0t
CiBkcml2ZXJzL2dwdS9kcm0vdGRmeC90ZGZ4X2Rydi5jIHwgMTEgKysrKysrKy0tLS0KIDEgZmls
ZSBjaGFuZ2VkLCA3IGluc2VydGlvbnMoKyksIDQgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEv
ZHJpdmVycy9ncHUvZHJtL3RkZngvdGRmeF9kcnYuYyBiL2RyaXZlcnMvZ3B1L2RybS90ZGZ4L3Rk
ZnhfZHJ2LmMKaW5kZXggM2ExNDc2ODE4YzY1Li5jMjQzYWYxNTZlZTcgMTAwNjQ0Ci0tLSBhL2Ry
aXZlcnMvZ3B1L2RybS90ZGZ4L3RkZnhfZHJ2LmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL3RkZngv
dGRmeF9kcnYuYwpAQCAtMzIsMTEgKzMyLDE0IEBACiAKICNpbmNsdWRlIDxsaW51eC9tb2R1bGUu
aD4KIAotI2luY2x1ZGUgPGRybS9kcm1QLmg+Ci0jaW5jbHVkZSAidGRmeF9kcnYuaCIKLQotI2lu
Y2x1ZGUgPGRybS9kcm1fcGNpaWRzLmg+CisjaW5jbHVkZSA8ZHJtL2RybV9kcnYuaD4KKyNpbmNs
dWRlIDxkcm0vZHJtX2ZpbGUuaD4KKyNpbmNsdWRlIDxkcm0vZHJtX2lvY3RsLmg+CiAjaW5jbHVk
ZSA8ZHJtL2RybV9sZWdhY3kuaD4KKyNpbmNsdWRlIDxkcm0vZHJtX3BjaS5oPgorI2luY2x1ZGUg
PGRybS9kcm1fcGNpaWRzLmg+CisKKyNpbmNsdWRlICJ0ZGZ4X2Rydi5oIgogCiBzdGF0aWMgc3Ry
dWN0IHBjaV9kZXZpY2VfaWQgcGNpaWRsaXN0W10gPSB7CiAJdGRmeF9QQ0lfSURTCi0tIAoyLjIw
LjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1k
ZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczov
L2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
