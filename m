Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 35D66116A0E
	for <lists+dri-devel@lfdr.de>; Mon,  9 Dec 2019 10:47:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 43BB06E393;
	Mon,  9 Dec 2019 09:47:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x543.google.com (mail-ed1-x543.google.com
 [IPv6:2a00:1450:4864:20::543])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9A42B6E046
 for <dri-devel@lists.freedesktop.org>; Sun,  8 Dec 2019 10:53:47 +0000 (UTC)
Received: by mail-ed1-x543.google.com with SMTP id c93so9804235edf.7
 for <dri-devel@lists.freedesktop.org>; Sun, 08 Dec 2019 02:53:47 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=RP445oumAyApvuuzSY5LdqaN1csStiseBJ96Rg6gPzY=;
 b=EC799Tc0Y8hlcFWetxULglL40n9YHNZSbpmS6GLnQosBNdLcQuPMhsebD01iOtSnl3
 cFMNu6NnLSCj0M9i3WCkQXb/cQKqZm/BVNO/Ugxr7loaZC47Cv4fKcfaAdHHBkrQFa8N
 DVh/v/bB+soQlRwVazHLA3mZcgjifptlJwW7Giu70FwQGCsCZEH+EyZUwd+eWycAl4Vx
 PFff7x9ZBwSU6LY15X2DX6Fl3w4O4MnKZmZK+yGneqAv3B4/+G5zAQfHX7OZTnKcKjjC
 cQzpmrwsZf+CAKRi0T+NwO+IhnvGtLDPvMELsMfZsqtiobr0rrCS1tB5LGrSFWg8jBWf
 T+hw==
X-Gm-Message-State: APjAAAWzP+pd8VrO4Q793sMEqgLy/WFKKHbmcVisS7OLwcL9f7fmkkEG
 jogFOv5eZ+MPJWdVOLCY+hM=
X-Google-Smtp-Source: APXvYqzKoOx2EKgpyTltHK8dmjzErAfRzYlsPNKZioPwoWXHOiOXc5mrHf/bkUbH3tGhwIA1AuppsQ==
X-Received: by 2002:a17:906:489:: with SMTP id f9mr3125363eja.27.1575802426107; 
 Sun, 08 Dec 2019 02:53:46 -0800 (PST)
Received: from felia.fritz.box ([2001:16b8:2d4e:6900:458f:723c:bc3a:78f2])
 by smtp.gmail.com with ESMTPSA id y2sm23487eds.24.2019.12.08.02.53.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 08 Dec 2019 02:53:45 -0800 (PST)
From: Lukas Bulwahn <lukas.bulwahn@gmail.com>
To: Thomas Hellstrom <thellstrom@vmware.com>, dri-devel@lists.freedesktop.org
Subject: [PATCH] drm/vmwgfx: Replace deprecated PTR_RET
Date: Sun,  8 Dec 2019 11:53:28 +0100
Message-Id: <20191208105328.15335-1-lukas.bulwahn@gmail.com>
X-Mailer: git-send-email 2.17.1
X-Mailman-Approved-At: Mon, 09 Dec 2019 09:46:36 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=RP445oumAyApvuuzSY5LdqaN1csStiseBJ96Rg6gPzY=;
 b=FzcV8FNtYmwMpIO5ZRZ+YPRdcqZbrZEaM8iT05KkoBBtA4hwIvPRExCm6EQhLvf0/V
 6vxpkRmZfssCaMMnMEL3rXS6onfm4++nKYeJ7D1NOGhAWtQZpLkdKfKzjNE0A2uwkurO
 hSHGuxD863rSL6sAYLmEf1oUo6F1oVgBe5zrhuwVs6nncN/pbr0EFL/+K4f6I3mURkrd
 WkWhK68eEZXqMwS7yc/J0sPi9LDEjDX3zfTa7f6ckm6RAGLHXGxQlwvtPViYAiBeCSmI
 f8P3/JfazNb7BMSYxNG6oJUrjVWO4KOw7PWQvK0/FphAGft8QoNSCK0oR+dMLmBGaqav
 kV+Q==
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
Cc: Sinclair Yeh <syeh@vmware.com>, David Airlie <airlied@linux.ie>,
 kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-graphics-maintainer@vmware.com, Lukas Bulwahn <lukas.bulwahn@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Q29tbWl0IDUwODEwOGVhMjc0NyAoImRybS92bXdnZng6IERvbid0IHJlZmNvdW50IGNvbW1hbmQt
YnVmZmVyIG1hbmFnZWQKcmVzb3VyY2UgbG9va3VwcyBkdXJpbmcgY29tbWFuZCBidWZmZXIgdmFs
aWRhdGlvbiIpIHNsaXBzIGluIHVzZSBvZgpkZXByZWNhdGVkIFBUUl9SRVQuIFVzZSBQVFJfRVJS
X09SX1pFUk8gaW5zdGVhZC4KCkFzIHRoZSBQVFJfRVJSX09SX1pFUk8gaXMgYSBiaXQgbG9uZ2Vy
IHRoYW4gUFRSX1JFVCwgd2UgaW50cm9kdWNlCmxvY2FsIHZhcmlhYmxlIHJldCBmb3IgcHJvcGVy
IGluZGVudGF0aW9uIGFuZCBsaW5lLWxlbmd0aCBsaW1pdHMuCgpTaWduZWQtb2ZmLWJ5OiBMdWth
cyBCdWx3YWhuIDxsdWthcy5idWx3YWhuQGdtYWlsLmNvbT4KLS0tCmFwcGxpZXMgY2xlYW5seSBv
biBjdXJyZW50IG1hc3RlciAoOTQ1NWQyNWY0ZTNiKSBhbmQgbmV4dC0yMDE5MTIwNwpjb21waWxl
LXRlc3RlZCBvbiB4ODZfNjRfZGVmY29uZmlnICsgRFJNX1ZNV0dGWD15CgogZHJpdmVycy9ncHUv
ZHJtL3Ztd2dmeC92bXdnZnhfZXhlY2J1Zi5jIHwgMjEgKysrKysrKysrKysrKysrLS0tLS0tCiAx
IGZpbGUgY2hhbmdlZCwgMTUgaW5zZXJ0aW9ucygrKSwgNiBkZWxldGlvbnMoLSkKCmRpZmYgLS1n
aXQgYS9kcml2ZXJzL2dwdS9kcm0vdm13Z2Z4L3Ztd2dmeF9leGVjYnVmLmMgYi9kcml2ZXJzL2dw
dS9kcm0vdm13Z2Z4L3Ztd2dmeF9leGVjYnVmLmMKaW5kZXggOTM0YWQ3YzBjMzQyLi43MzQ4OWE0
NWRlY2IgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS92bXdnZngvdm13Z2Z4X2V4ZWNidWYu
YworKysgYi9kcml2ZXJzL2dwdS9kcm0vdm13Z2Z4L3Ztd2dmeF9leGVjYnVmLmMKQEAgLTIzNzcs
OSArMjM3NywxMiBAQCBzdGF0aWMgaW50IHZtd19jbWRfZHhfY2xlYXJfcmVuZGVydGFyZ2V0X3Zp
ZXcoc3RydWN0IHZtd19wcml2YXRlICpkZXZfcHJpdiwKIHsKIAlWTVdfREVDTEFSRV9DTURfVkFS
KCpjbWQsIFNWR0EzZENtZERYQ2xlYXJSZW5kZXJUYXJnZXRWaWV3KSA9CiAJCWNvbnRhaW5lcl9v
ZihoZWFkZXIsIHR5cGVvZigqY21kKSwgaGVhZGVyKTsKKwlzdHJ1Y3Qgdm13X3Jlc291cmNlICpy
ZXQ7CiAKLQlyZXR1cm4gUFRSX1JFVCh2bXdfdmlld19pZF92YWxfYWRkKHN3X2NvbnRleHQsIHZt
d192aWV3X3J0LAotCQkJCQkgICBjbWQtPmJvZHkucmVuZGVyVGFyZ2V0Vmlld0lkKSk7CisJcmV0
ID0gdm13X3ZpZXdfaWRfdmFsX2FkZChzd19jb250ZXh0LCB2bXdfdmlld19ydCwKKwkJCQkgIGNt
ZC0+Ym9keS5yZW5kZXJUYXJnZXRWaWV3SWQpOworCisJcmV0dXJuIFBUUl9FUlJfT1JfWkVSTyhy
ZXQpOwogfQogCiAvKioKQEAgLTIzOTYsOSArMjM5OSwxMiBAQCBzdGF0aWMgaW50IHZtd19jbWRf
ZHhfY2xlYXJfZGVwdGhzdGVuY2lsX3ZpZXcoc3RydWN0IHZtd19wcml2YXRlICpkZXZfcHJpdiwK
IHsKIAlWTVdfREVDTEFSRV9DTURfVkFSKCpjbWQsIFNWR0EzZENtZERYQ2xlYXJEZXB0aFN0ZW5j
aWxWaWV3KSA9CiAJCWNvbnRhaW5lcl9vZihoZWFkZXIsIHR5cGVvZigqY21kKSwgaGVhZGVyKTsK
KwlzdHJ1Y3Qgdm13X3Jlc291cmNlICpyZXQ7CisKKwlyZXQgPSB2bXdfdmlld19pZF92YWxfYWRk
KHN3X2NvbnRleHQsIHZtd192aWV3X2RzLAorCQkJCSAgY21kLT5ib2R5LmRlcHRoU3RlbmNpbFZp
ZXdJZCk7CiAKLQlyZXR1cm4gUFRSX1JFVCh2bXdfdmlld19pZF92YWxfYWRkKHN3X2NvbnRleHQs
IHZtd192aWV3X2RzLAotCQkJCQkgICBjbWQtPmJvZHkuZGVwdGhTdGVuY2lsVmlld0lkKSk7CisJ
cmV0dXJuIFBUUl9FUlJfT1JfWkVSTyhyZXQpOwogfQogCiBzdGF0aWMgaW50IHZtd19jbWRfZHhf
dmlld19kZWZpbmUoc3RydWN0IHZtd19wcml2YXRlICpkZXZfcHJpdiwKQEAgLTI3NDEsOSArMjc0
NywxMiBAQCBzdGF0aWMgaW50IHZtd19jbWRfZHhfZ2VubWlwcyhzdHJ1Y3Qgdm13X3ByaXZhdGUg
KmRldl9wcml2LAogewogCVZNV19ERUNMQVJFX0NNRF9WQVIoKmNtZCwgU1ZHQTNkQ21kRFhHZW5N
aXBzKSA9CiAJCWNvbnRhaW5lcl9vZihoZWFkZXIsIHR5cGVvZigqY21kKSwgaGVhZGVyKTsKKwlz
dHJ1Y3Qgdm13X3Jlc291cmNlICpyZXQ7CisKKwlyZXQgPSB2bXdfdmlld19pZF92YWxfYWRkKHN3
X2NvbnRleHQsIHZtd192aWV3X3NyLAorCQkJCSAgY21kLT5ib2R5LnNoYWRlclJlc291cmNlVmll
d0lkKTsKIAotCXJldHVybiBQVFJfUkVUKHZtd192aWV3X2lkX3ZhbF9hZGQoc3dfY29udGV4dCwg
dm13X3ZpZXdfc3IsCi0JCQkJCSAgIGNtZC0+Ym9keS5zaGFkZXJSZXNvdXJjZVZpZXdJZCkpOwor
CXJldHVybiBQVFJfRVJSX09SX1pFUk8ocmV0KTsKIH0KIAogLyoqCi0tIAoyLjE3LjEKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWls
aW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
