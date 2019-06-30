Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 807535AEF2
	for <lists+dri-devel@lfdr.de>; Sun, 30 Jun 2019 08:20:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B09986E9DE;
	Sun, 30 Jun 2019 06:19:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x144.google.com (mail-lf1-x144.google.com
 [IPv6:2a00:1450:4864:20::144])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1A43E6E9C9
 for <dri-devel@lists.freedesktop.org>; Sun, 30 Jun 2019 06:19:51 +0000 (UTC)
Received: by mail-lf1-x144.google.com with SMTP id z15so6556625lfh.13
 for <dri-devel@lists.freedesktop.org>; Sat, 29 Jun 2019 23:19:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=Fnr6k4Eow9LnwFZdkpCPXbx+QoVhat8bwujFvP5lr+A=;
 b=W5gXageWqTs7hHUZgw7mNnhB1zeSgO0uCcQordJS5lIM6oC+3ejn/Drdz6vqvz3GcH
 APptCXEGIp+QirZvXKOoZVdK+nsEV9Al9a46L6k2ZjUqGSgwHsCy85UvYSfVA4FSzO7g
 VJOVvlScywxwQu7LCPQVEFMrDX0Xkcwjo+yghaCCLX3DhlVZUhOD8q1wwKpLG861ncF5
 WSOSqPR4RBkdlAcMQW7Rl6KoXoy4OCraj7r6qY7wqfB8rxLXdGYi4w8cArcln1XSG5Bn
 FOoO94bwrvTun9D8mjToX2M0qYafZdqRVjOyiTsavv5SBZR82AxFV5+FzWN5v/FRy0d3
 NIAw==
X-Gm-Message-State: APjAAAXIEWxgCsQAofWE3iLwO/JmzQmN5wZGhC5OmsYgTq4+/+A/u1TP
 Biygb5/x7eb6rM3gdnTkbzHxIXdybcRKIg==
X-Google-Smtp-Source: APXvYqx7UWVTuIBgZsOLVPbGiZ6deTCoUg/rzfuOAxaSb/gJXW3o/NUU5seZOX4jf9I85qX0lmOn5g==
X-Received: by 2002:a19:5007:: with SMTP id e7mr9317662lfb.76.1561875589352;
 Sat, 29 Jun 2019 23:19:49 -0700 (PDT)
Received: from saturn.lan (18.158-248-194.customer.lyse.net. [158.248.194.18])
 by smtp.gmail.com with ESMTPSA id
 o74sm1794024lff.46.2019.06.29.23.19.48
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Sat, 29 Jun 2019 23:19:49 -0700 (PDT)
From: Sam Ravnborg <sam@ravnborg.org>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v1 21/33] drm/i810: drop use of drmP.h
Date: Sun, 30 Jun 2019 08:19:10 +0200
Message-Id: <20190630061922.7254-22-sam@ravnborg.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190630061922.7254-1-sam@ravnborg.org>
References: <20190630061922.7254-1-sam@ravnborg.org>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Fnr6k4Eow9LnwFZdkpCPXbx+QoVhat8bwujFvP5lr+A=;
 b=VPX7STZoz7qaN0kulYdsURROenFDq8tpD/dxNUyN19khzw/OihSMXFagCYetf928Ip
 w+y51iXNkQXYOwJMCEnzARglp3MFUZxQKHoLMK4y+r7QGI6WPGCzRyuriE7XYrR9afOv
 VUakML2Y0QwQDqKIxSHYwS3P/q6iEkgWIFAkfgjd2p9WjgPHuS8h9B1wSvL0JydoaudV
 k6pnx62kdYHPjOSrAQaKz9hcgnBjQ/TgyJZveVZQPus3ge2A8q18ks7hIHNiFdSUnjXs
 A3i8xsC6o49QqUYC/ENg/HUcQDLj08w2iwm7t3E36xP7yorq6NsHTlBUge6cjIs2R0GD
 MgDg==
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
 Dan Carpenter <dan.carpenter@oracle.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RHJvcCB1c2Ugb2YgdGhlIGRlcHJlY2F0ZWQgZHJtUC5oIGhlYWRlci4KUmVwbGFjZSB3aXRoIG5l
Y2Vzc2FyeSBpbmNsdWRlcy4KClNpZ25lZC1vZmYtYnk6IFNhbSBSYXZuYm9yZyA8c2FtQHJhdm5i
b3JnLm9yZz4KQ2M6IERhdmlkIEFpcmxpZSA8YWlybGllZEBsaW51eC5pZT4KQ2M6IERhbmllbCBW
ZXR0ZXIgPGRhbmllbEBmZndsbC5jaD4KQ2M6IERhbiBDYXJwZW50ZXIgPGRhbi5jYXJwZW50ZXJA
b3JhY2xlLmNvbT4KQ2M6IFNhbSBSYXZuYm9yZyA8c2FtQHJhdm5ib3JnLm9yZz4KLS0tClRoZSBs
aXN0IG9mIGNjOiB3YXMgdG9vIGxhcmdlIHRvIGFkZCBhbGwgcmVjaXBpZW50cyB0byB0aGUgY292
ZXIgbGV0dGVyLgpQbGVhc2UgZmluZCBjb3ZlciBsZXR0ZXIgaGVyZToKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvYXJjaGl2ZXMvZHJpLWRldmVsLzIwMTktSnVuZS90aHJlYWQuaHRtbApT
ZWFyY2ggZm9yICJkcm06IGRyb3AgdXNlIG9mIGRybXAuaCBpbiBkcm0tbWlzYyIKCiAgICAgICAg
U2FtCgogZHJpdmVycy9ncHUvZHJtL2k4MTAvaTgxMF9kbWEuYyB8IDE3ICsrKysrKysrKysrKy0t
LS0tCiBkcml2ZXJzL2dwdS9kcm0vaTgxMC9pODEwX2Rydi5jIHwgIDggKysrKystLS0KIGRyaXZl
cnMvZ3B1L2RybS9pODEwL2k4MTBfZHJ2LmggfCAgMiArKwogMyBmaWxlcyBjaGFuZ2VkLCAxOSBp
bnNlcnRpb25zKCspLCA4IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2Ry
bS9pODEwL2k4MTBfZG1hLmMgYi9kcml2ZXJzL2dwdS9kcm0vaTgxMC9pODEwX2RtYS5jCmluZGV4
IDNiMzc4OTM2ZjU3NS4uMmE3NzgyM2I4ZTlhIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0v
aTgxMC9pODEwX2RtYS5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9pODEwL2k4MTBfZG1hLmMKQEAg
LTMwLDEzICszMCwyMCBAQAogICoKICAqLwogCi0jaW5jbHVkZSA8ZHJtL2RybVAuaD4KKyNpbmNs
dWRlIDxsaW51eC9kZWxheS5oPgorI2luY2x1ZGUgPGxpbnV4L21tYW4uaD4KKworI2luY2x1ZGUg
PGRybS9kcm1fYWdwc3VwcG9ydC5oPgorI2luY2x1ZGUgPGRybS9kcm1fZGV2aWNlLmg+CisjaW5j
bHVkZSA8ZHJtL2RybV9kcnYuaD4KKyNpbmNsdWRlIDxkcm0vZHJtX2ZpbGUuaD4KKyNpbmNsdWRl
IDxkcm0vZHJtX2lvY3RsLmg+CisjaW5jbHVkZSA8ZHJtL2RybV9pcnEuaD4KKyNpbmNsdWRlIDxk
cm0vZHJtX3BjaS5oPgorI2luY2x1ZGUgPGRybS9kcm1fcHJpbnQuaD4KICNpbmNsdWRlIDxkcm0v
aTgxMF9kcm0uaD4KKwogI2luY2x1ZGUgImk4MTBfZHJ2LmgiCi0jaW5jbHVkZSA8bGludXgvaW50
ZXJydXB0Lmg+CS8qIEZvciB0YXNrIHF1ZXVlIHN1cHBvcnQgKi8KLSNpbmNsdWRlIDxsaW51eC9k
ZWxheS5oPgotI2luY2x1ZGUgPGxpbnV4L3NsYWIuaD4KLSNpbmNsdWRlIDxsaW51eC9wYWdlbWFw
Lmg+CiAKICNkZWZpbmUgSTgxMF9CVUZfRlJFRQkJMgogI2RlZmluZSBJODEwX0JVRl9DTElFTlQJ
CTEKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9pODEwL2k4MTBfZHJ2LmMgYi9kcml2ZXJz
L2dwdS9kcm0vaTgxMC9pODEwX2Rydi5jCmluZGV4IGM2OWQ1YzQ4N2Y1MS4uNWRkMjZhMDZlZTBl
IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vaTgxMC9pODEwX2Rydi5jCisrKyBiL2RyaXZl
cnMvZ3B1L2RybS9pODEwL2k4MTBfZHJ2LmMKQEAgLTMwLDEzICszMCwxNSBAQAogICogICAgR2Fy
ZXRoIEh1Z2hlcyA8Z2FyZXRoQHZhbGludXguY29tPgogICovCiAKKyNpbmNsdWRlICJpODEwX2Ry
di5oIgogI2luY2x1ZGUgPGxpbnV4L21vZHVsZS5oPgogCi0jaW5jbHVkZSA8ZHJtL2RybVAuaD4K
KyNpbmNsdWRlIDxkcm0vZHJtX2Rydi5oPgorI2luY2x1ZGUgPGRybS9kcm1fZmlsZS5oPgorI2lu
Y2x1ZGUgPGRybS9kcm1fcGNpLmg+CisjaW5jbHVkZSA8ZHJtL2RybV9wY2lpZHMuaD4KICNpbmNs
dWRlIDxkcm0vaTgxMF9kcm0uaD4KLSNpbmNsdWRlICJpODEwX2Rydi5oIgogCi0jaW5jbHVkZSA8
ZHJtL2RybV9wY2lpZHMuaD4KIAogc3RhdGljIHN0cnVjdCBwY2lfZGV2aWNlX2lkIHBjaWlkbGlz
dFtdID0gewogCWk4MTBfUENJX0lEUwpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2k4MTAv
aTgxMF9kcnYuaCBiL2RyaXZlcnMvZ3B1L2RybS9pODEwL2k4MTBfZHJ2LmgKaW5kZXggYzczZDJm
MmRhNTdiLi45ZGYzOTgxZmZjNjYgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9pODEwL2k4
MTBfZHJ2LmgKKysrIGIvZHJpdmVycy9ncHUvZHJtL2k4MTAvaTgxMF9kcnYuaApAQCAtMzIsNyAr
MzIsOSBAQAogI2lmbmRlZiBfSTgxMF9EUlZfSF8KICNkZWZpbmUgX0k4MTBfRFJWX0hfCiAKKyNp
bmNsdWRlIDxkcm0vZHJtX2lvY3RsLmg+CiAjaW5jbHVkZSA8ZHJtL2RybV9sZWdhY3kuaD4KKyNp
bmNsdWRlIDxkcm0vaTgxMF9kcm0uaD4KIAogLyogR2VuZXJhbCBjdXN0b21pemF0aW9uOgogICov
Ci0tIAoyLjIwLjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9y
ZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZl
bA==
