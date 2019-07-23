Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C8E072084
	for <lists+dri-devel@lfdr.de>; Tue, 23 Jul 2019 22:10:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7B3696E3B5;
	Tue, 23 Jul 2019 20:10:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x144.google.com (mail-lf1-x144.google.com
 [IPv6:2a00:1450:4864:20::144])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A4DE96E3B2;
 Tue, 23 Jul 2019 20:10:08 +0000 (UTC)
Received: by mail-lf1-x144.google.com with SMTP id b17so30262688lff.7;
 Tue, 23 Jul 2019 13:10:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=JNweqczQVMU6M8huGsuR1DzxhsNRUR8zVc1T1YMjBUA=;
 b=UE9RfvvLvlRMoCz2JfpPyislXcWclZXzZ1rY8nqIW/970huuJM4Gbnx99XQcRSzWwN
 sa2nQU06LkZ6rmGcjaOGhBwNIh3PXaJdAcMiMfmxbh7/23W8iWddSwG8ByYNZHhLcTUc
 c0Fuv+Jn4vJdZn2MeFvVaWsl1NooTywP9EAFOU+vXChhw68KxM3w9idiD5Pt0jH519bl
 W/W8HRXjL5QYVbrcz1uFroRMrcdYaxxdTF0JD2UBhvCQ7UD7c5rt0Q4Usv4juwmMk1jl
 3AwgkxBSN5JPHTgBcbILebOCpKfTwnJUq/aGoG5ZiDq3tHVj/SIyxQ+9hm4jjTfEARbM
 184A==
X-Gm-Message-State: APjAAAX99nQPBKIooKTf3zg5dJGLWbprGKpapa6IxVGRkbffkR/3elXi
 uSJsih0B5z2EmGMRt5ACWklV3UBCv38=
X-Google-Smtp-Source: APXvYqy6rD1KBMdI4xvKrY7WlPoNJOM8yWfvhjUsekjODOv1SEpLXRxz1MEj0687E4jlBQbdEbYyig==
X-Received: by 2002:ac2:42c7:: with SMTP id n7mr35653332lfl.65.1563912606792; 
 Tue, 23 Jul 2019 13:10:06 -0700 (PDT)
Received: from saturn.lan (18.158-248-194.customer.lyse.net. [158.248.194.18])
 by smtp.gmail.com with ESMTPSA id
 p21sm6708006lfc.41.2019.07.23.13.10.05
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Tue, 23 Jul 2019 13:10:06 -0700 (PDT)
From: Sam Ravnborg <sam@ravnborg.org>
To: dri-devel@lists.freedesktop.org,
	openchrome-devel@lists.freedesktop.org
Subject: [PATCH v4 0/4] drm/via: drop use of deprecated headers drmP.h +
 drm_os_linux.h
Date: Tue, 23 Jul 2019 22:09:40 +0200
Message-Id: <20190723200944.17285-1-sam@ravnborg.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=JNweqczQVMU6M8huGsuR1DzxhsNRUR8zVc1T1YMjBUA=;
 b=Wm722n/PS7OPTPpgesSwD3PPPhH4AOf5YRe/t0A3/JSygTBlm1TJyPv7FrQX2k3n0z
 U9br6eED3TpL1wlTR19+k96v2Kgxp5WZItVg+poMo7jAVjKMUAvAbIzVRQiTKnCG3VWo
 ye2YdYbix+X/sAe+pCLJmcbAoYDEVO08O6vIWen+iIwxA+3suMWWya6raQMvfa+AwEp8
 skf2ry7UHFproBpdH62P8Z5QqkvUOQpw8p5265IE2ojbzuI3rMChsOGj8tb2xHnqVTZR
 ebBNjvFP948t++3wFg8l8Jvb+wp+t+P1RII9g6mPjWfEK2Lf7JQkwuZWQg4dmls3wCPu
 EmAA==
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
Cc: Thomas Hellstrom <thellstrom@vmware.com>,
 "Gustavo A. R. Silva" <gustavo@embeddedor.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 =?UTF-8?q?Michel=20D=C3=A4nzer?= <michel@daenzer.net>,
 Kevin Brace <kevinbrace@gmx.com>, Mike Marshall <hubcap@omnibond.com>,
 Ira Weiny <ira.weiny@intel.com>, Emil Velikov <emil.velikov@collabora.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGhpcyBpcyBzb21lIGphbml0b3JpYWwgdXBkYXRlcyB0byB0aGUgdmlhIGRyaXZlcgp0aGF0IGlz
IHJlcXVpcmVkIHRvIGdldCByaWQgb2YgZGVwcmVjYXRlZCBoZWFkZXJzCmluIHRoZSBkcm0gc3Vi
c3lzdGVtLgoKVGhlIGZpcnN0IHRocmVlIHBhdGNoZXMgcHJlcGFyZSBmb3IgdGhlIHJlbW92YWwg
b2YgZHJtUC5oLgpUaGUgbGFzdCBwYXRjaCByZW1vdmUgdXNlIG9mIGRybVAuaCBhbmQgcmVwbGFj
ZSB3aXRoIG5lY2Vzc2FyeQppbmNsdWRlIGZpbGVzIHRvIGZpeCBidWlsZC4KCkJ1aWxkIHRlc3Rl
ZCB3aXRoIHZhcmlvdXMgY29uZmlncyBhbmQgdmFyaW91cyBhcmNoaXRlY3R1cmVzLgoKSSBoYWQg
cHJlZmVycmVkIHRoYXQgdGhlIHZpYSBkcml2ZXIgd2FzIHJlcGxhY2VkIGJ5IHRoZQpvcGVuY2hy
b21lIGRyaXZlciwgYnV0IHVudGlsIHdlIGhhdmUgaXQgdGhlbiB3ZSBuZWVkCnRvIGRlYWwgd2l0
aCB0aGUgbGVnYWN5IHZpYSBkcml2ZXIgd2hlbiByZW1vdmluZyBvbGQgY3J1ZnQKaW4gdGhlIGRy
bSBzdWJzeXN0ZW0uCgp2NDoKLSBVc2UgYSBtb3JlIHN0YW5kYXJkIHZhcmlhbnQgZm9yIHZpYV93
cml0ZThfbWFzaygpIChFbWlsKQoKdjM6Ci0gVXNlIHN0YXRpYyBpbmxpbmUgZnVuY3Rpb25zIGZv
ciB0aGUgcmVhZC93cml0ZSBvcGVyYXRpb25zIChFbWlsKQotIFVzZSBkZWRpY2F0ZWQgKl9tYXNr
X29yKCkgYW5kICpfbWFza19hbmQoKSAoRW1pbCkKLSBSZXBsYWNlIERSTV9XQUlUX09OIGluIHNh
bWUgcGF0aCB0aGF0IGludHJvZHVjZXMgVklBX1dBSVRfT04gKEVtaWwpCi0gQ29sbGVjdGVkIHIt
YidzCi0gQ2hhbmdlbG9nIGFkanVzdG1lbnRzCi0gUmViYXNlZCBvbiB0b3Agb2YgZHJtLW1pc2Mt
bmV4dAoKdjI6Ci0gQWRkIGEgY29weSBvZiBEUk1fV0FJVF9PTiB0byB0aGUgdmlhIGRyaXZlciwg
a2VlcGluZwogIHRoZSBjaGFuZ2VzIHRvIHRoaXMgbGVnYWN5IGRyaXZlciB0byBhIG1pbmltdW0u
CiAgVGhpcyBhbHNvIGdpdmVzIG11Y2ggbW9yZSBjb25maWRlbmNlIHRoYXQgdGhlCiAgZHJpdmVy
IGNvbnRpbnVlcyB0byB3b3JrIGFzIHRoZXJlIGlzIG5vIGNoYW5nZXMKICBpbiBsb2dpYy4gVGhl
cmVmb3JlIGRyb3BwZWQgIlJGVCIuCi0gQWRkZWQgQ2M6IE1pY2hlbCBEw6RuemVyIDxtaWNoZWxA
ZGFlbnplci5uZXQ+IHRvIGFsbAogIHBhdGNoZXMsIGFzIE1pY2hhZWwgaGF2ZSBjb21tZW50ZWQg
b24gdGhlIHNlcmllcy4KCiAgICAgICAgU2FtCgoKU2FtIFJhdm5ib3JnICg0KToKICAgICAgZHJt
L3ZpYTogZHJvcCB1c2Ugb2YgRFJNKFJFQUR8V1JJVEUpIG1hY3JvcwogICAgICBkcm0vdmlhOiBj
b3B5IERSTV9XQUlUX09OIGFzIFZJQV9XQUlUX09OIGFuZCB1c2UgaXQKICAgICAgZHJtL3ZpYTog
bWFrZSB2aWFfZHJ2Lmggc2VsZi1jb250YWluZWQKICAgICAgZHJtL3ZpYTogZHJvcCB1c2Ugb2Yg
ZHJtUC5oCgogZHJpdmVycy9ncHUvZHJtL3ZpYS92aWFfZG1hLmMgICAgICB8IDQzICsrKysrKysr
KysrKystLS0tLS0tLS0KIGRyaXZlcnMvZ3B1L2RybS92aWEvdmlhX2RtYWJsaXQuYyAgfCA0MSAr
KysrKysrKysrKy0tLS0tLS0tLS0KIGRyaXZlcnMvZ3B1L2RybS92aWEvdmlhX2Rydi5jICAgICAg
fCAgNyArKystCiBkcml2ZXJzL2dwdS9kcm0vdmlhL3ZpYV9kcnYuaCAgICAgIHwgNzUgKysrKysr
KysrKysrKysrKysrKysrKysrKysrKysrKysrKystLS0KIGRyaXZlcnMvZ3B1L2RybS92aWEvdmlh
X2lycS5jICAgICAgfCA1NCArKysrKysrKysrKysrKy0tLS0tLS0tLS0tLS0KIGRyaXZlcnMvZ3B1
L2RybS92aWEvdmlhX21hcC5jICAgICAgfCAgNiArKy0KIGRyaXZlcnMvZ3B1L2RybS92aWEvdmlh
X21tLmMgICAgICAgfCAgNyArKystCiBkcml2ZXJzL2dwdS9kcm0vdmlhL3ZpYV92ZXJpZmllci5j
IHwgMjIgKysrKystLS0tLS0KIGRyaXZlcnMvZ3B1L2RybS92aWEvdmlhX3ZpZGVvLmMgICAgfCAg
NSArKy0KIDkgZmlsZXMgY2hhbmdlZCwgMTc0IGluc2VydGlvbnMoKyksIDg2IGRlbGV0aW9ucygt
KQoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1k
ZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczov
L2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
