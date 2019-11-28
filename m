Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CE19C10DDAE
	for <lists+dri-devel@lfdr.de>; Sat, 30 Nov 2019 14:24:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 517E16E0FA;
	Sat, 30 Nov 2019 13:24:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 66F5A6E6A5;
 Thu, 28 Nov 2019 08:31:08 +0000 (UTC)
Received: by mail-wr1-x442.google.com with SMTP id b6so339623wrq.0;
 Thu, 28 Nov 2019 00:31:08 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:mime-version:subject:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=41iFNzsZShp3cTI5whXr8wJxyzr91hsxklxwLQF/D5A=;
 b=CLtXSiCdWL7kVAPUdj29UWHDhUSdVxh+DbpugS2bXx+pjLYMuAq0wJyIp2kJzpxxaU
 MIoFVtGRuV2yxe2tU74piICUl9P0yYL7S3lYBchS/CKKlL0FayL4nVR6n2B7MD4FwYFi
 d/EPI043iOFQjJZBpDwqc1DdlXLxn8EJofW1LBP9mbap/eqd4YuXcPrWgjYDMIlNYBtr
 LsLMDQIEXcoJcoQANGoaWVUClbcagDKYc/B1zV377NYkwSmGiHZZxNCtkBLe3HD7h+wc
 xlTEtt2Y1Kcttr68IKgJcE7WYKUUOqNYafgyVd8zTPrFLRmo/9ya9pKnAm9tpiuPpDqH
 95sw==
X-Gm-Message-State: APjAAAXSjVvIm6qFWwuOc6wPo7R+/RDazucrHSeoc1ija4NkdzX/UNgO
 ONNuaERrgcqZV05Yl+b1e5s=
X-Google-Smtp-Source: APXvYqxXk8FwSRUAiGCAnDZ0aIrVLk/2gHjGzrhjZnH1HsSMGh7kpX1+8dGo4cWeqmbSasTT77Pl0w==
X-Received: by 2002:a5d:5050:: with SMTP id h16mr50519725wrt.380.1574929866906; 
 Thu, 28 Nov 2019 00:31:06 -0800 (PST)
Received: from ?IPv6:2a01:e0a:466:71c0:d4fe:9901:8a9f:19cf?
 ([2a01:e0a:466:71c0:d4fe:9901:8a9f:19cf])
 by smtp.gmail.com with ESMTPSA id 91sm23455974wrm.42.2019.11.28.00.31.04
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 28 Nov 2019 00:31:05 -0800 (PST)
From: Christophe de Dinechin <christophe.de.dinechin@gmail.com>
X-Google-Original-From: Christophe de Dinechin <christophe@dinechin.org>
Mime-Version: 1.0 (Mac OS X Mail 12.4 \(3445.104.11\))
Subject: Re: [PATCH 13/13] samples: vfio-mdev: constify fb ops
In-Reply-To: <fc8342eef9fcd2f55c86fcd78f7df52f7c76fa87.1574871797.git.jani.nikula@intel.com>
Date: Thu, 28 Nov 2019 09:31:03 +0100
Message-Id: <39B62C70-3E60-48AB-8F11-534EF5B8EFBD@dinechin.org>
References: <cover.1574871797.git.jani.nikula@intel.com>
 <fc8342eef9fcd2f55c86fcd78f7df52f7c76fa87.1574871797.git.jani.nikula@intel.com>
To: Jani Nikula <jani.nikula@intel.com>
X-Mailer: Apple Mail (2.3445.104.11)
X-Mailman-Approved-At: Sat, 30 Nov 2019 13:23:59 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:mime-version:subject:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=41iFNzsZShp3cTI5whXr8wJxyzr91hsxklxwLQF/D5A=;
 b=TK91N00lx4mZdugbyv2Ejmsi3NeRlCtaW7zEma2yjbWiRGE7/1cDbjaXwzSE57ROBG
 n+zhGhgmB/dw5P0ZlYepLDRTMVHYagELsLWNPyzZ+FQKY5sGSNt6EiDSG+a/TIuIkbsZ
 ggEOtJYK86VyXwhyGF251InPCJlLeTnzcsP5Rqo4TnemjWtt02lax45HMDYJfJuJrCt3
 +9Jxq6esNeQ6pJeggH5+YwvwsujhJLxacEQaWJxIbdx/2S7rsHkB/LnXK33adX51IjYg
 8bTMqv3cJp8zgxggGW7GJmDTW6I9Dj6+/TXUTa5+cgZ6cqEHdsEQb0R3X22zAqGGxjkL
 AGbA==
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
Cc: linux-fbdev@vger.kernel.org, kvm@vger.kernel.org,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Kirti Wankhede <kwankhede@nvidia.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Cgo+IE9uIDI3IE5vdiAyMDE5LCBhdCAxNzozMiwgSmFuaSBOaWt1bGEgPGphbmkubmlrdWxhQGlu
dGVsLmNvbT4gd3JvdGU6Cj4gCj4gTm93IHRoYXQgdGhlIGZib3BzIG1lbWJlciBvZiBzdHJ1Y3Qg
ZmJfaW5mbyBpcyBjb25zdCwgd2UgY2FuIHN0YXIgbWFraW5nCnMvc3Rhci9zdGFydC8KCj4gdGhl
IG9wcyBjb25zdCBhcyB3ZWxsLgo+IAo+IENjOiBLaXJ0aSBXYW5raGVkZSA8a3dhbmtoZWRlQG52
aWRpYS5jb20+Cj4gQ2M6IGt2bUB2Z2VyLmtlcm5lbC5vcmcKPiBTaWduZWQtb2ZmLWJ5OiBKYW5p
IE5pa3VsYSA8amFuaS5uaWt1bGFAaW50ZWwuY29tPgo+IC0tLQo+IHNhbXBsZXMvdmZpby1tZGV2
L21kcHktZmIuYyB8IDIgKy0KPiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVs
ZXRpb24oLSkKPiAKPiBkaWZmIC0tZ2l0IGEvc2FtcGxlcy92ZmlvLW1kZXYvbWRweS1mYi5jIGIv
c2FtcGxlcy92ZmlvLW1kZXYvbWRweS1mYi5jCj4gaW5kZXggMjcxOWJiMjU5NjUzLi4yMWRiZjYz
ZDZlNDEgMTAwNjQ0Cj4gLS0tIGEvc2FtcGxlcy92ZmlvLW1kZXYvbWRweS1mYi5jCj4gKysrIGIv
c2FtcGxlcy92ZmlvLW1kZXYvbWRweS1mYi5jCj4gQEAgLTg2LDcgKzg2LDcgQEAgc3RhdGljIHZv
aWQgbWRweV9mYl9kZXN0cm95KHN0cnVjdCBmYl9pbmZvICppbmZvKQo+IAkJaW91bm1hcChpbmZv
LT5zY3JlZW5fYmFzZSk7Cj4gfQo+IAo+IC1zdGF0aWMgc3RydWN0IGZiX29wcyBtZHB5X2ZiX29w
cyA9IHsKPiArc3RhdGljIGNvbnN0IHN0cnVjdCBmYl9vcHMgbWRweV9mYl9vcHMgPSB7Cj4gCS5v
d25lcgkJPSBUSElTX01PRFVMRSwKPiAJLmZiX2Rlc3Ryb3kJPSBtZHB5X2ZiX2Rlc3Ryb3ksCj4g
CS5mYl9zZXRjb2xyZWcJPSBtZHB5X2ZiX3NldGNvbHJlZywKPiAtLSAKPiAyLjIwLjEKPiAKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBt
YWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3Rz
LmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
