Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A447EEC5C6
	for <lists+dri-devel@lfdr.de>; Fri,  1 Nov 2019 16:43:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7DD8B6F82D;
	Fri,  1 Nov 2019 15:43:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x835.google.com (mail-qt1-x835.google.com
 [IPv6:2607:f8b0:4864:20::835])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 712D86F82D
 for <dri-devel@lists.freedesktop.org>; Fri,  1 Nov 2019 15:43:24 +0000 (UTC)
Received: by mail-qt1-x835.google.com with SMTP id x21so13361143qto.12
 for <dri-devel@lists.freedesktop.org>; Fri, 01 Nov 2019 08:43:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=wKb52YVkC3NELqTeZJC/gLeC/MBsFUU9iPpUF2C2Ctk=;
 b=lDgBB8GMHaCG+rSl7d1aC08bNgXT6F0GX1z0bNBMwKn40OtjbOKV8rn7vK1r2Tm5XJ
 uvRJ8U2Z1gO7Ond0nW01VXGKxzZGdIHawTbRPmVa87ER3sS4izkVxaAXWX/vfwS9RGq9
 /CQZv/2VfcOwLZ5UdRIW6xY8B8niicCYT8HnW9Vy0uYxnT5BvtRRRbX+VGVf/pr0izcN
 +hrOj1Q81bU5meGRsvl/UZWmBfqcHSHIKUpClN3si2n8GK2mfHM9h0QU+GlFqixXtWUx
 HTSmHhj9VK8Le5z+E/K6Mba7KbSIEn/XbVVwaW8N5Pg3CwHCMZbqtOgA1NoUzK8HWW2g
 9KoA==
X-Gm-Message-State: APjAAAUfycxVT3Y1hh0ly8OXswf6aX3giusFKTcJHNsdhJs30TJe2H9S
 MvK2/fP0Du7KVUVa8zHvhjE=
X-Google-Smtp-Source: APXvYqyFJAM4q5ecaSSq30Ntjp+yMEhkErlOeuccAqPYTwS2MUKCEWlFOLUtIJsL/9o67Wxd50pH6g==
X-Received: by 2002:ad4:58a9:: with SMTP id ea9mr10756512qvb.179.1572623003347; 
 Fri, 01 Nov 2019 08:43:23 -0700 (PDT)
Received: from GBdebian.ic.unicamp.br (wifi-177-220-84-14.wifi.ic.unicamp.br.
 [177.220.84.14])
 by smtp.gmail.com with ESMTPSA id x38sm4879243qtc.64.2019.11.01.08.43.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 01 Nov 2019 08:43:22 -0700 (PDT)
From: Gabriela Bittencourt <gabrielabittencourt00@gmail.com>
To: outreachy-kernel@googlegroups.com, manasi.d.navare@intel.com,
 rodrigosiqueiramelo@gmail.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, sean@poorly.run, airlied@linux.ie, daniel@ffwll.ch,
 corbet@lwn.net, dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, lkcamp@lists.libreplanetbr.org
Subject: [PATCH v2] drm/doc: Adding VKMS module description and use to
 "Testing and Validation"
Date: Fri,  1 Nov 2019 12:43:14 -0300
Message-Id: <20191101154314.25435-1-gabrielabittencourt00@gmail.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=wKb52YVkC3NELqTeZJC/gLeC/MBsFUU9iPpUF2C2Ctk=;
 b=qlT/KZarrFEp/Vnhmhph+guCGCHV7SshaXo3+RJO9shLG9iR94hGhXTWTGw7+42HGo
 je3+Jxw/mgd7h1ChfIIKu8tgIcUZT3dgUf5Fyy66Z8LBQLP0/x6YskKOfYZRbNLIh9oA
 EfLKI+YZHWcL7UAugyujZmjZSFaTWH3bzDSJM5cqgDwFnju7LTd3nRUdptKcd9Teti3G
 uv67e9d1dRoVYjkAA9wCmyVW2toDPAZBajo0fbX1drYJkbuTqYePZEpZhCRGsmj+LDlo
 7H49tQUuxFpcOX4Uo+YG/En9fD1rhSceVpQ1IdxIhbpid+4aKYs5MOEmySkTKYB73mNh
 FCGw==
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
Cc: Gabriela Bittencourt <gabrielabittencourt00@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QWRkIGEgZGVzY3JpcHRpb24gb24gVktNUyBtb2R1bGUgYW5kIHRoZSBjYXNlcyBpbiB3aGljaCBp
dCBzaG91bGQgYmUgdXNlZC4KVGhlcmUncyBhIGJyaWVmIGV4cGxhbmF0aW9uIG9uIGhvdyB0byBz
ZXQgaXQgYW5kIHVzZSBpdCBpbiBhIFZNLCBhbG9uZyB3aXRoCmFuIGV4YW1wbGUgb2YgcnVubmlu
ZyBhbiBpZ3QtdGVzdC4KClNpZ25lZC1vZmYtYnk6IEdhYnJpZWxhIEJpdHRlbmNvdXJ0IDxnYWJy
aWVsYWJpdHRlbmNvdXJ0MDBAZ21haWwuY29tPgoKLS0tCgpDaGFuZ2VzIGluIHYyOgotIEF2b2lk
IHJlcGV0aXRpb24gb2Ygd29yZHMgaW4gdGhlIHNhbWUgc2VudGVuY2U7Ci0gTWFrZSB0aGUgZXhw
bGFuYXRpb24gb24gJ3NldHRpbmcgdGhlIGtlcm5lbCcgc2hvcnRlciwgZWxpbWluYXRlIHRoZQon
bWFrZSBtZW51Y29uZmlnJyBjb21tYW5kOwotIEFkZCB0YWIgb24gZW51bWVyYXRpb24gdG8gaGF2
ZSBvbmUgbGluZSBwZXIgaXRlbTsKLSBDbGFyaWZ5IGZyb20gZWFjaCBtYWNoaW5lIGlndC10ZXN0
cyBjb21tYW5kcyBzaG91bGQgYmUgcmFuIG9uLgoKVGVzdGVkIHRoZSBwYXRjaCB1c2luZyAnbWFr
ZSBodG1sZG9jcycgdG8gbWFrZSBzdXJlIHRoZSBvdXRwdXQgLmh0bWwgaXMKY29ycmVjdC4KCkhp
IERSTS1jb21tdW5pdHksCnRoaXMgaXMgbXkgZmlyc3QgKG9mIG1hbnksIEkgaG9wZSkgIHBhdGNo
IGluIHRoaXMgc3Vic3lzdGVtLiBJIGhvcGUgdG8gaGF2ZQphIGxvdCBvZiBsZWFybmluZyAoYW5k
IGZ1biA6KSkgd29ya2luZyB3aXRoIHlvdSBndXlzLgpJJ20gc3RhcnRpbmcgYnkgZG9jdW1lbnRp
bmcgdGhlIFZLTVMgZHJpdmVyIGluICJVc2VybGFuZCBpbnRlcmZhY2VzIiwgaWYgSQpoYXZlIGJl
ZW4gaW5hY2N1cmF0ZSBpbiBteSBkZXNjcmlwdGlvbiBvciBpZiBJIG1pc3VuZGVyc3Rvb2Qgc29t
ZSBjb25jZXB0LApwbGVhc2UgbGV0IG1lIGtub3cuCi0tLQogRG9jdW1lbnRhdGlvbi9ncHUvZHJt
LXVhcGkucnN0IHwgMzYgKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKwogMSBmaWxl
IGNoYW5nZWQsIDM2IGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS9Eb2N1bWVudGF0aW9uL2dw
dS9kcm0tdWFwaS5yc3QgYi9Eb2N1bWVudGF0aW9uL2dwdS9kcm0tdWFwaS5yc3QKaW5kZXggOTRm
OTA1MjFmNThjLi4xNTg2Y2JiYTA1ZDAgMTAwNjQ0Ci0tLSBhL0RvY3VtZW50YXRpb24vZ3B1L2Ry
bS11YXBpLnJzdAorKysgYi9Eb2N1bWVudGF0aW9uL2dwdS9kcm0tdWFwaS5yc3QKQEAgLTI4NSw2
ICsyODUsNDIgQEAgcnVuLXRlc3RzLnNoIGlzIGEgd3JhcHBlciBhcm91bmQgcGlnbGl0IHRoYXQg
d2lsbCBleGVjdXRlIHRoZSB0ZXN0cyBtYXRjaGluZwogdGhlIC10IG9wdGlvbnMuIEEgcmVwb3J0
IGluIEhUTUwgZm9ybWF0IHdpbGwgYmUgYXZhaWxhYmxlIGluCiAuL3Jlc3VsdHMvaHRtbC9pbmRl
eC5odG1sLiBSZXN1bHRzIGNhbiBiZSBjb21wYXJlZCB3aXRoIHBpZ2xpdC4KIAorVXNpbmcgVktN
UyB0byB0ZXN0IERSTSBBUEkKKy0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tCisKK1ZLTVMgaXMg
YSBzb2Z0d2FyZS1vbmx5IG1vZGVsIG9mIGEgS01TIGRyaXZlciB0aGF0IGlzIHVzZWZ1bCBmb3Ig
dGVzdGluZworYW5kIGZvciBydW5uaW5nIGNvbXBvc2l0b3JzLiBWS01TIGFpbXMgdG8gZW5hYmxl
IGEgdmlydHVhbCBkaXNwbGF5IHdpdGhvdXQKK3RoZSBuZWVkIGZvciBhIGhhcmR3YXJlIGRpc3Bs
YXkgY2FwYWJpbGl0eS4gVGhlc2UgY2hhcmFjdGVyaXN0aWNzIG1hZGUgVktNUworYSBwZXJmZWN0
IHRvb2wgZm9yIHZhbGlkYXRpbmcgdGhlIERSTSBjb3JlIGJlaGF2aW9yIGFuZCBhbHNvIHN1cHBv
cnQgdGhlCitjb21wb3NpdG9yIGRldmVsb3Blci4gVktNUyBtYWtlcyBpdCBwb3NzaWJsZSB0byB0
ZXN0IERSTSBmdW5jdGlvbnMgaW4gYQordmlydHVhbCBtYWNoaW5lIHdpdGhvdXQgZGlzcGxheSwg
c2ltcGxpZmluZyB0aGUgdmFsaWRhdGlvbiBvZiBzb21lIG9mIHRoZQorY29yZSBjaGFuZ2VzLgor
CitUbyBWYWxpZGF0ZSBjaGFuZ2VzIGluIERSTSBBUEkgd2l0aCBWS01TLCBzdGFydCBzZXR0aW5n
IHRoZSBrZXJuZWw6IG1ha2UKK3N1cmUgdG8gZW5hYmxlIFZLTVMgbW9kdWxlOyBjb21waWxlIHRo
ZSBrZXJuZWwgd2l0aCB0aGUgVktNUyBlbmFibGVkIGFuZAoraW5zdGFsbCBpdCBpbiB0aGUgdGFy
Z2V0IG1hY2hpbmUuIFZLTVMgY2FuIGJlIHJ1biBpbiBhIFZpcnR1YWwgTWFjaGluZQorKFFFTVUs
IHZpcnRtZSBvciBzaW1pbGFyKS4gSXQncyByZWNvbW1lbmRlZCB0aGUgdXNlIG9mIEtWTSB3aXRo
IHRoZSBtaW5pbXVtCitvZiAxR0Igb2YgUkFNIGFuZCBmb3VyIGNvcmVzLgorCitJdCdzIHBvc3Np
YmxlIHRvIHJ1biB0aGUgSUdULXRlc3RzIGluIGEgVk0gaW4gdHdvIHdheXM6CisJMS4gVXNlIElH
VCBpbnNpZGUgYSBWTQorCTIuIFVzZSBJR1QgZnJvbSB0aGUgaG9zdCBtYWNoaW5lIGFuZCB3cml0
ZSB0aGUgcmVzdWx0cyBpbiBhIHNoYXJlZCBkaXJlY3RvcnkuCisKK0FzIGZvbGxvdywgdGhlcmUg
aXMgYW4gZXhhbXBsZSBvZiB1c2luZyBhIFZNIHdpdGggYSBzaGFyZWQgZGlyZWN0b3J5IHdpdGgK
K3RoZSBob3N0IG1hY2hpbmUgdG8gcnVuIGlndC10ZXN0cy4gQXMgZXhhbXBsZSBpdCdzIHVzZWQg
dmlydG1lOjoKKworCSQgdmlydG1lLXJ1biAtLXJ3ZGlyIC9wYXRoL2Zvci9zaGFyZWRfZGlyIC0t
a2Rpcj1wYXRoL2Zvci9rZXJuZWwvZGlyZWN0b3J5IC0tbW9kcz1hdXRvCisKK1J1biB0aGUgaWd0
LXRlc3RzIGluIHRoZSBndWVzdCBtYWNoaW5lLCBhcyBleGFtcGxlIGl0J3MgcmFuIHRoZSAna21z
X2ZsaXAnCit0ZXN0czo6CisKKwkkIC9wYXRoL2Zvci9pZ3QtZ3B1LXRvb2xzL3NjcmlwdHMvcnVu
LXRlc3RzLnNoIC1wIC1zIC10ICJrbXNfZmxpcC4qIiAtdgorCitJbiB0aGlzIGV4YW1wbGUsIGlu
c3RlYWQgb2YgYnVpbGQgdGhlIGlndF9ydW5uZXIsIFBpZ2xpdCBpcyB1c2VkCisoLXAgb3B0aW9u
KTsgaXQncyBjcmVhdGVkIGh0bWwgc3VtbWFyeSBvZiB0aGUgdGVzdHMgcmVzdWx0cyBhbmQgaXQn
cyBzYXZlZAoraW4gdGhlIGZvbGRlciAiaWd0LWdwdS10b29scy9yZXN1bHRzIjsgaXQncyBleGVj
dXRlZCBvbmx5IHRoZSBpZ3QtdGVzdHMKK21hdGNoaW5nIHRoZSAtdCBvcHRpb24uCisKIERpc3Bs
YXkgQ1JDIFN1cHBvcnQKIC0tLS0tLS0tLS0tLS0tLS0tLS0KIAotLSAKMi4yMC4xCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGlu
ZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVl
ZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
