Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EA0F1404FA
	for <lists+dri-devel@lfdr.de>; Fri, 17 Jan 2020 09:13:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 28D316F412;
	Fri, 17 Jan 2020 08:13:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 933996EDA8
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Jan 2020 15:52:35 +0000 (UTC)
Received: by mail-wr1-x441.google.com with SMTP id c14so19659620wrn.7
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Jan 2020 07:52:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=RYd215MGwbtyx8TO2Lq76zx4YR7/TZxm4/f4N/JxQ0c=;
 b=t394Fjd2kjuuvhpFMwqR/RgxFbTF9QreSaGqWiH78GT8QaNhs/vYSTyiWL7hccPs/I
 JPCeyA5ulRHXenEggdBK88v26VMPSQJBTnopJpaXswX0u78ddKYZW9cuAvlpNf9adWgs
 wu41MDJ5//G+azoEcNa5Xp8i2LreQzAaS6Sbui0VqHTUQWN61w3HRX4vFsjVsUIGhm+x
 3pbWjCbXhIdH4BJeHtXf2YPmte29UVLL1hpzqPeETyPSmh//fhsvpokiOsy/i2UF4x1m
 Lt4mW0JMWlIPIgGsGEwAXON8ebsHfGLF75qoXdbFwJfyVjK54NODO6QrxVwr0yGBsSmZ
 J7CA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=RYd215MGwbtyx8TO2Lq76zx4YR7/TZxm4/f4N/JxQ0c=;
 b=podTO25I9PaWCRKjOlofVhUuP4vep6YW6PzzeK8fXRr+c8oHwELVQX5Bf76tqduah8
 1WsQPPVxbVCJxFp5Hfl58JtHPSWPKP6x9xLAmOUcYVz3D4fcqR9KlPxOmojXgnRcGUaI
 CgBAFUSaMaPxZEZGrfXq+NuMRUZ4H/ub5GTuKCyUo34O8cbrv5HPvTDrr9lCwYKc5Vty
 iIgFUA/tobKpL7PoEFsnt/CPsDar8uoohGrMBUuazEs2U3k5S/lk2xco6ExLaEudlaU8
 3Gc2AMoyDrALFtsjfXlTGwcYPMfpR2k3tYDAbitxGHkwbQCXIoPAU6lWv3zqlocUyRsJ
 8uLA==
X-Gm-Message-State: APjAAAVsZ4GXeD/EG29CP0lrqVYiFWT2TRxhKZtimrT/P3TnSnrM1XHP
 O+jT86t531xpFW6b3Whpmka9y06rzx+CoHVf
X-Google-Smtp-Source: APXvYqzWQ593sHsHdJgiszLle3IFAS2je86ZzySyALnwB6MlyXZUWrbJezVZgOfNi/kOphvTR6RCVA==
X-Received: by 2002:adf:e58d:: with SMTP id l13mr3866253wrm.135.1579189953854; 
 Thu, 16 Jan 2020 07:52:33 -0800 (PST)
Received: from brihaspati.amd.com
 (p200300C58F2F9500BD0C32DA1D260485.dip0.t-ipconnect.de.
 [2003:c5:8f2f:9500:bd0c:32da:1d26:485])
 by smtp.gmail.com with ESMTPSA id m7sm4705477wma.39.2020.01.16.07.52.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Jan 2020 07:52:32 -0800 (PST)
From: Nirmoy Das <nirmoy.aiemd@gmail.com>
X-Google-Original-From: Nirmoy Das <nirmoy.das@amd.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH] drm/scheduler: fix documentation by replacing rq_list with
 sched_list
Date: Thu, 16 Jan 2020 16:53:46 +0100
Message-Id: <20200116155346.7659-1-nirmoy.das@amd.com>
X-Mailer: git-send-email 2.24.1
MIME-Version: 1.0
X-Mailman-Approved-At: Fri, 17 Jan 2020 08:13:08 +0000
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
Cc: nirmoy.das@amd.com, christian.koenig@amd.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGhpcyBhbHNvIHJlcGxhY2VzIG9sZCBhcnRpZmFjdHMgd2l0aCBhIGNvcnJlY3Qgb25lIGluIGRy
bV9zY2hlZF9lbnRpdHlfaW5pdCgpCmRlY2xhcmF0aW9uCgpTaWduZWQtb2ZmLWJ5OiBOaXJtb3kg
RGFzIDxuaXJtb3kuZGFzQGFtZC5jb20+ClJldmlld2VkLWJ5OiBDaHJpc3RpYW4gS8O2bmlnIDxj
aHJpc3RpYW4ua29lbmlnQGFtZC5jb20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL3NjaGVkdWxlci9z
Y2hlZF9lbnRpdHkuYyB8ICAyICstCiBpbmNsdWRlL2RybS9ncHVfc2NoZWR1bGVyLmggICAgICAg
ICAgICAgIHwgMTAgKysrKystLS0tLQogMiBmaWxlcyBjaGFuZ2VkLCA2IGluc2VydGlvbnMoKyks
IDYgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3NjaGVkdWxlci9z
Y2hlZF9lbnRpdHkuYyBiL2RyaXZlcnMvZ3B1L2RybS9zY2hlZHVsZXIvc2NoZWRfZW50aXR5LmMK
aW5kZXggMzNlMmNkMTA4OWEyLi5lYzc5ZThlNWFkM2MgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1
L2RybS9zY2hlZHVsZXIvc2NoZWRfZW50aXR5LmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL3NjaGVk
dWxlci9zY2hlZF9lbnRpdHkuYwpAQCAtNDUsNyArNDUsNyBAQAogICogQGd1aWx0eTogYXRvbWlj
X3Qgc2V0IHRvIDEgd2hlbiBhIGpvYiBvbiB0aGlzIHF1ZXVlCiAgKiAgICAgICAgICBpcyBmb3Vu
ZCB0byBiZSBndWlsdHkgY2F1c2luZyBhIHRpbWVvdXQKICAqCi0gKiBOb3RlOiB0aGUgcnFfbGlz
dCBzaG91bGQgaGF2ZSBhdGxlYXN0IG9uZSBlbGVtZW50IHRvIHNjaGVkdWxlCisgKiBOb3RlOiB0
aGUgc2NoZWRfbGlzdCBzaG91bGQgaGF2ZSBhdGxlYXN0IG9uZSBlbGVtZW50IHRvIHNjaGVkdWxl
CiAgKiAgICAgICB0aGUgZW50aXR5CiAgKgogICogUmV0dXJucyAwIG9uIHN1Y2Nlc3Mgb3IgYSBu
ZWdhdGl2ZSBlcnJvciBjb2RlIG9uIGZhaWx1cmUuCmRpZmYgLS1naXQgYS9pbmNsdWRlL2RybS9n
cHVfc2NoZWR1bGVyLmggYi9pbmNsdWRlL2RybS9ncHVfc2NoZWR1bGVyLmgKaW5kZXggNTM3Zjdh
NDY1NWE1Li45ZTcxYmUxMjljMzAgMTAwNjQ0Ci0tLSBhL2luY2x1ZGUvZHJtL2dwdV9zY2hlZHVs
ZXIuaAorKysgYi9pbmNsdWRlL2RybS9ncHVfc2NoZWR1bGVyLmgKQEAgLTUyLDkgKzUyLDkgQEAg
ZW51bSBkcm1fc2NoZWRfcHJpb3JpdHkgewogICogQGxpc3Q6IHVzZWQgdG8gYXBwZW5kIHRoaXMg
c3RydWN0IHRvIHRoZSBsaXN0IG9mIGVudGl0aWVzIGluIHRoZQogICogICAgICAgIHJ1bnF1ZXVl
LgogICogQHJxOiBydW5xdWV1ZSBvbiB3aGljaCB0aGlzIGVudGl0eSBpcyBjdXJyZW50bHkgc2No
ZWR1bGVkLgotICogQHJxX2xpc3Q6IGEgbGlzdCBvZiBydW4gcXVldWVzIG9uIHdoaWNoIGpvYnMg
ZnJvbSB0aGlzIGVudGl0eSBjYW4KLSAqICAgICAgICAgICBiZSBzY2hlZHVsZWQKLSAqIEBudW1f
cnFfbGlzdDogbnVtYmVyIG9mIHJ1biBxdWV1ZXMgaW4gdGhlIHJxX2xpc3QKKyAqIEBzY2hlZF9s
aXN0OiBhIGxpc3Qgb2YgZHJtX2dwdV9zY2hlZHVsZXJzIG9uIHdoaWNoIGpvYnMgZnJvbSB0aGlz
IGVudGl0eSBjYW4KKyAqICAgICAgICAgICAgICBiZSBzY2hlZHVsZWQKKyAqIEBudW1fc2NoZWRf
bGlzdDogbnVtYmVyIG9mIGRybV9ncHVfc2NoZWR1bGVycyBpbiB0aGUgc2NoZWRfbGlzdC4KICAq
IEBycV9sb2NrOiBsb2NrIHRvIG1vZGlmeSB0aGUgcnVucXVldWUgdG8gd2hpY2ggdGhpcyBlbnRp
dHkgYmVsb25ncy4KICAqIEBqb2JfcXVldWU6IHRoZSBsaXN0IG9mIGpvYnMgb2YgdGhpcyBlbnRp
dHkuCiAgKiBAZmVuY2Vfc2VxOiBhIGxpbmVhcmx5IGluY3JlYXNpbmcgc2Vxbm8gaW5jcmVtZW50
ZWQgd2l0aCBlYWNoCkBAIC04MSw4ICs4MSw4IEBAIGVudW0gZHJtX3NjaGVkX3ByaW9yaXR5IHsK
IHN0cnVjdCBkcm1fc2NoZWRfZW50aXR5IHsKIAlzdHJ1Y3QgbGlzdF9oZWFkCQlsaXN0OwogCXN0
cnVjdCBkcm1fc2NoZWRfcnEJCSpycTsKLQl1bnNpZ25lZCBpbnQgICAgICAgICAgICAgICAgICAg
IG51bV9zY2hlZF9saXN0OwogCXN0cnVjdCBkcm1fZ3B1X3NjaGVkdWxlciAgICAgICAgKipzY2hl
ZF9saXN0OworCXVuc2lnbmVkIGludCAgICAgICAgICAgICAgICAgICAgbnVtX3NjaGVkX2xpc3Q7
CiAJZW51bSBkcm1fc2NoZWRfcHJpb3JpdHkgICAgICAgICBwcmlvcml0eTsKIAlzcGlubG9ja190
CQkJcnFfbG9jazsKIApAQCAtMzE1LDcgKzMxNSw3IEBAIHZvaWQgZHJtX3NjaGVkX3JxX3JlbW92
ZV9lbnRpdHkoc3RydWN0IGRybV9zY2hlZF9ycSAqcnEsCiBpbnQgZHJtX3NjaGVkX2VudGl0eV9p
bml0KHN0cnVjdCBkcm1fc2NoZWRfZW50aXR5ICplbnRpdHksCiAJCQkgIGVudW0gZHJtX3NjaGVk
X3ByaW9yaXR5IHByaW9yaXR5LAogCQkJICBzdHJ1Y3QgZHJtX2dwdV9zY2hlZHVsZXIgKipzY2hl
ZF9saXN0LAotCQkJICB1bnNpZ25lZCBpbnQgbnVtX3JxX2xpc3QsCisJCQkgIHVuc2lnbmVkIGlu
dCBudW1fc2NoZWRfbGlzdCwKIAkJCSAgYXRvbWljX3QgKmd1aWx0eSk7CiBsb25nIGRybV9zY2hl
ZF9lbnRpdHlfZmx1c2goc3RydWN0IGRybV9zY2hlZF9lbnRpdHkgKmVudGl0eSwgbG9uZyB0aW1l
b3V0KTsKIHZvaWQgZHJtX3NjaGVkX2VudGl0eV9maW5pKHN0cnVjdCBkcm1fc2NoZWRfZW50aXR5
ICplbnRpdHkpOwotLSAKMi4yNC4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVl
ZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5m
by9kcmktZGV2ZWwK
