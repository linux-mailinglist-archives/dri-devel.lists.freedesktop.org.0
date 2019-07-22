Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E81F870AC1
	for <lists+dri-devel@lfdr.de>; Mon, 22 Jul 2019 22:36:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0E73289E38;
	Mon, 22 Jul 2019 20:36:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x143.google.com (mail-lf1-x143.google.com
 [IPv6:2a00:1450:4864:20::143])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5A43989E38;
 Mon, 22 Jul 2019 20:36:09 +0000 (UTC)
Received: by mail-lf1-x143.google.com with SMTP id 62so22764842lfa.8;
 Mon, 22 Jul 2019 13:36:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=GNPsZT0ahrYx368avDSQncmSdbwImuimE+zQw0d1Q34=;
 b=KkoXVafZ00A+VFnkDSdpkiTuJrX8UdLpPSnFTw//JIK9xwXCm6krx7vRASDRHsC1Gt
 pj6mSgeB1INIgFDqS3F0ki0CN7dGLcV6q/PcgrabMUNAsjuQQ7J/IbdxP7KnnUSH/WCG
 3u3OP+WHhai0ohoTijV18AajDJB0t5tLrAeW9qntus4V/newHdQECXNdUzEW3+Ieaux0
 fYVYv+BAM5iWKgRwTUowmE5EhfbICBAZaKYquOvHPAuybeqNlXnYs6ZEo65XMHEFw/pT
 gja5gcMWwdzasjqX1VUrLsUHK6wViLa2HBdvkjVRwVyJH+pw2WXwNLTWW4NRk/fh5toQ
 TrbQ==
X-Gm-Message-State: APjAAAWz+xq/ummIsTwpSnLp/jE6jOP9hT1oLbL1uHRnpPFRh7I3S7Dd
 Co406rQ+0zFXMUnBbinGchOjVpHShaA=
X-Google-Smtp-Source: APXvYqwAr7pqXCmb0aAWa1v5JyjZqGqfJrdcqyhgAM0LQrp7VZEblL0dHDaWMDj0Yz0uKXraAoUQwA==
X-Received: by 2002:a19:8c06:: with SMTP id o6mr32796329lfd.176.1563827767428; 
 Mon, 22 Jul 2019 13:36:07 -0700 (PDT)
Received: from saturn.lan (18.158-248-194.customer.lyse.net. [158.248.194.18])
 by smtp.gmail.com with ESMTPSA id
 u9sm6154398lfb.38.2019.07.22.13.36.05
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Mon, 22 Jul 2019 13:36:06 -0700 (PDT)
From: Sam Ravnborg <sam@ravnborg.org>
To: dri-devel@lists.freedesktop.org,
	openchrome-devel@lists.freedesktop.org
Subject: 
Date: Mon, 22 Jul 2019 22:35:41 +0200
Message-Id: <20190722203545.8612-1-sam@ravnborg.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=GNPsZT0ahrYx368avDSQncmSdbwImuimE+zQw0d1Q34=;
 b=ljdSmxCbth7Wl2TcCeXTg+WPcxwQmra1cucFjXPJirgy923v5csrRbmlGoVjCS1ten
 F5UZ9HZXUjDiez0w5aGH56zspdiMoeV4C1NY0VOlAc3KYIlz0KAj7Wxaf6jn2VZ0hGtl
 WyyK2BO4Pp0iq5y4RnZESVR37C3WDQpFV5y2nR62P/VvYGFI7AxtGPpwiNATOo3kxoa0
 Cz3qd+ixQwq4PuiTM6ySxxf5Xf4vJqlcAMiVVbHPN4t0Fo30C9npKJmIzJWTU32xNUsX
 byjmVGm0tQshAYrCo8i5//y5dMIbzFyVFv47mhNereNhsf/QcANijp0E8zxGmsrcS5+w
 2plg==
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

VGhlIGZpcnN0IHRocmVlIHBhdGNoZXMgcHJlcGFyZSBmb3IgdGhlIHJlbW92YWwgb2YgZHJtUC5o
LgpUaGUgbGFzdCBwYXRjaCByZW1vdmUgdXNlIG9mIGRybVAuaCBhbmQgcmVwbGFjZSB3aXRoIG5l
Y2Vzc2FyeQppbmNsdWRlIGZpbGVzIHRvIGZpeCBidWlsZC4KCkJ1aWxkIHRlc3RlZCB3aXRoIHZh
cmlvdXMgY29uZmlncyBhbmQgdmFyaW91cyBhcmNoaXRlY3R1cmVzLgoKSSBoYWQgcHJlZmVycmVk
IHRoYXQgdGhlIHZpYSBkcml2ZXIgd2FzIHJlcGxhY2VkIGJ5IHRoZQpvcGVuY2hyb21lIGRyaXZl
ciwgYnV0IHVudGlsIHdlIGhhdmUgaXQgdGhlbiB3ZSBuZWVkCnRvIGRlYWwgd2l0aCB0aGUgbGVn
YWN5IHZpYSBkcml2ZXIgd2hlbiByZW1vdmluZyBvbGQgY3J1ZnQKaW4gdGhlIGRybSBzdWJzeXN0
ZW0uCgp2MzoKLSBVc2Ugc3RhdGljIGlubGluZSBmdW5jdGlvbnMgZm9yIHRoZSByZWFkL3dyaXRl
IG9wZXJhdGlvbnMgKEVtaWwpCi0gVXNlIGRlZGljYXRlZCAqX21hc2tfb3IoKSBhbmQgKl9tYXNr
X2FuZCgpIChFbWlsKQotIFJlcGxhY2UgRFJNX1dBSVRfT04gaW4gc2FtZSBwYXRoIHRoYXQgaW50
cm9kdWNlcyBWSUFfV0FJVF9PTiAoRW1pbCkKLSBDb2xsZWN0ZWQgci1iJ3MKLSBDaGFuZ2Vsb2cg
YWRqdXN0bWVudHMKLSBSZWJhc2VkIG9uIHRvcCBvZiBkcm0tbWlzYy1uZXh0Cgp2MjoKLSBBZGQg
YSBjb3B5IG9mIERSTV9XQUlUX09OIHRvIHRoZSB2aWEgZHJpdmVyLCBrZWVwaW5nCiAgdGhlIGNo
YW5nZXMgdG8gdGhpcyBsZWdhY3kgZHJpdmVyIHRvIGEgbWluaW11bS4KICBUaGlzIGFsc28gZ2l2
ZXMgbXVjaCBtb3JlIGNvbmZpZGVuY2UgdGhhdCB0aGUKICBkcml2ZXIgY29udGludWVzIHRvIHdv
cmsgYXMgdGhlcmUgaXMgbm8gY2hhbmdlcwogIGluIGxvZ2ljLiBUaGVyZWZvcmUgZHJvcHBlZCAi
UkZUIi4KLSBBZGRlZCBDYzogTWljaGVsIETDpG56ZXIgPG1pY2hlbEBkYWVuemVyLm5ldD4gdG8g
YWxsCiAgcGF0Y2hlcywgYXMgTWljaGFlbCBoYXZlIGNvbW1lbnRlZCBvbiB0aGUgc2VyaWVzLgoK
ICAgICAgICBTYW0KClNhbSBSYXZuYm9yZyAoNCk6CiAgICAgIGRybS92aWE6IGRyb3AgdXNlIG9m
IERSTShSRUFEfFdSSVRFKSBtYWNyb3MKICAgICAgZHJtL3ZpYTogY29weSBEUk1fV0FJVF9PTiBh
cyBWSUFfV0FJVF9PTiBhbmQgdXNlIGl0CiAgICAgIGRybS92aWE6IG1ha2UgdmlhX2Rydi5oIHNl
bGYtY29udGFpbmVkCiAgICAgIGRybS92aWE6IGRyb3AgdXNlIG9mIGRybVAuaAoKIGRyaXZlcnMv
Z3B1L2RybS92aWEvdmlhX2RtYS5jICAgICAgfCA0MyArKysrKysrKysrKy0tLS0tLS0tLQogZHJp
dmVycy9ncHUvZHJtL3ZpYS92aWFfZG1hYmxpdC5jICB8IDQxICsrKysrKysrKystLS0tLS0tLS0K
IGRyaXZlcnMvZ3B1L2RybS92aWEvdmlhX2Rydi5jICAgICAgfCAgNyArKystCiBkcml2ZXJzL2dw
dS9kcm0vdmlhL3ZpYV9kcnYuaCAgICAgIHwgODMgKysrKysrKysrKysrKysrKysrKysrKysrKysr
KysrKysrKystLS0KIGRyaXZlcnMvZ3B1L2RybS92aWEvdmlhX2lycS5jICAgICAgfCA1NCArKysr
KysrKysrKysrLS0tLS0tLS0tLS0tCiBkcml2ZXJzL2dwdS9kcm0vdmlhL3ZpYV9tYXAuYyAgICAg
IHwgIDYgKystCiBkcml2ZXJzL2dwdS9kcm0vdmlhL3ZpYV9tbS5jICAgICAgIHwgIDcgKysrLQog
ZHJpdmVycy9ncHUvZHJtL3ZpYS92aWFfdmVyaWZpZXIuYyB8IDIyICsrKysrLS0tLS0KIGRyaXZl
cnMvZ3B1L2RybS92aWEvdmlhX3ZpZGVvLmMgICAgfCAgNSArKy0KIDkgZmlsZXMgY2hhbmdlZCwg
MTgyIGluc2VydGlvbnMoKyksIDg2IGRlbGV0aW9ucygtKQoKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRl
dmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
