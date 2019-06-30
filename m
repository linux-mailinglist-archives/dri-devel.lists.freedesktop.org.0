Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 189B75AF02
	for <lists+dri-devel@lfdr.de>; Sun, 30 Jun 2019 08:20:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3FCF86E9F1;
	Sun, 30 Jun 2019 06:20:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x243.google.com (mail-lj1-x243.google.com
 [IPv6:2a00:1450:4864:20::243])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C1CE76E9DB
 for <dri-devel@lists.freedesktop.org>; Sun, 30 Jun 2019 06:20:01 +0000 (UTC)
Received: by mail-lj1-x243.google.com with SMTP id k18so9781196ljc.11
 for <dri-devel@lists.freedesktop.org>; Sat, 29 Jun 2019 23:20:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=df6TXdUtR3ipnR42vURYQLM0/q5zcegSVg+0dPj2rTk=;
 b=hQGPU0ElFdNpuTFwIhrRKs523oXAozU1ssLhbTRb5BeXadgsJorp8ykJa9udiGD6b/
 69rF7h9RueOmQFJPpH7IxOp4Eu/xQj0WAmj5XQ5HL6Jd2eLfHUJAPuhToblxgKOlSNVq
 fq+s5cpWvHLQK01u93tsdEyes5Znz7SQgq0ZdYUoYmRObbwMcWDl3T7eos8QcznJnt0e
 hQTIW+BhYu4iIuhUwWtu9LbEmTDmHW/OmMsapGHlmOvqjhF+t9lrpqBsXYxvJ93hhhL0
 I/soC9SWYFSDCD77cR7saoFB4e4N5kYZyC8RZFRWuMZFZDD3wUnRKPvE8k+obg20SeVv
 SalQ==
X-Gm-Message-State: APjAAAXs4hwXQIAo4Y2BbfCmTbc2aOfERqPuNeoB8EmkRtxqsLrmyxxv
 6iJDn+g3JUr9Rcvo8WgDXrnI+70C/Bd0lw==
X-Google-Smtp-Source: APXvYqz7BY5amROXb4IBpNCR74H17q+t2hi8wBITZpz4k0UCQc0JKbOZyW+qFL46FJmvs4ud2d4e3A==
X-Received: by 2002:a2e:5d46:: with SMTP id r67mr10150572ljb.187.1561875599222; 
 Sat, 29 Jun 2019 23:19:59 -0700 (PDT)
Received: from saturn.lan (18.158-248-194.customer.lyse.net. [158.248.194.18])
 by smtp.gmail.com with ESMTPSA id
 o74sm1794024lff.46.2019.06.29.23.19.58
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Sat, 29 Jun 2019 23:19:58 -0700 (PDT)
From: Sam Ravnborg <sam@ravnborg.org>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v1 31/33] drm/bochs: drop use of drmP.h
Date: Sun, 30 Jun 2019 08:19:20 +0200
Message-Id: <20190630061922.7254-32-sam@ravnborg.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190630061922.7254-1-sam@ravnborg.org>
References: <20190630061922.7254-1-sam@ravnborg.org>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=df6TXdUtR3ipnR42vURYQLM0/q5zcegSVg+0dPj2rTk=;
 b=VxOqeheLipwOZcxiXmZbL22VoOiadV1YESISqo4ht0/sHTS6LF4Jcz0QJt8pFYnlIw
 cVPHFT8d/0gFFXze2mExDFWw5L1Pe/fic7FNbBpHtERORDR5jVB6svkBqv/9imXcRpTf
 VqOJZIRMPeuGFjhW/XF2nvFoEI6yjYn/5xPu9W8Qu9bPHkSafXUgADMja0mcN1RLBexU
 maQ0MQObNEoHB8eX0/5Ki009dpoBJTKNpB7hCswMzKACRD22k4fHNdO7u5g9zwln/eYc
 RnXYuKy6qiosAIywb/DzrTXhLok6X4Y9z/T5aUhI+nX8FmuPLNHCvrr5pCwBnbzZfsa4
 dgJg==
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
 Gerd Hoffmann <kraxel@redhat.com>, virtualization@lists.linux-foundation.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RHJvcCB1c2Ugb2YgdGhlIGRlcHJlY2F0ZWQgZHJtUC5oIGhlYWRlciBmaWxlLgpNYWRlIGJvY2hz
Lmggc2VsZi1jb250YWluZWQgYW5kIHRoZW4gZml4ZWQKZmFsbG91dCBpbiByZW1haW5pbmcgZmls
ZXMuClNldmVyYWwgdW51c2VkIGluY2x1ZGVzIHdhcyBkcm9wcGVkIGluIHRoZSBwcm9jZXNzLgoK
U2lnbmVkLW9mZi1ieTogU2FtIFJhdm5ib3JnIDxzYW1AcmF2bmJvcmcub3JnPgpDYzogR2VyZCBI
b2ZmbWFubiA8a3JheGVsQHJlZGhhdC5jb20+CkNjOiBEYXZpZCBBaXJsaWUgPGFpcmxpZWRAbGlu
dXguaWU+CkNjOiBEYW5pZWwgVmV0dGVyIDxkYW5pZWxAZmZ3bGwuY2g+CkNjOiB2aXJ0dWFsaXph
dGlvbkBsaXN0cy5saW51eC1mb3VuZGF0aW9uLm9yZwotLS0KVGhlIGxpc3Qgb2YgY2M6IHdhcyB0
b28gbGFyZ2UgdG8gYWRkIGFsbCByZWNpcGllbnRzIHRvIHRoZSBjb3ZlciBsZXR0ZXIuClBsZWFz
ZSBmaW5kIGNvdmVyIGxldHRlciBoZXJlOgpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9h
cmNoaXZlcy9kcmktZGV2ZWwvMjAxOS1KdW5lL3RocmVhZC5odG1sClNlYXJjaCBmb3IgImRybTog
ZHJvcCB1c2Ugb2YgZHJtcC5oIGluIGRybS1taXNjIgoKICAgICAgICBTYW0KCiBkcml2ZXJzL2dw
dS9kcm0vYm9jaHMvYm9jaHMuaCAgICAgfCA2ICsrLS0tLQogZHJpdmVycy9ncHUvZHJtL2JvY2hz
L2JvY2hzX2Rydi5jIHwgNyArKystLS0tCiBkcml2ZXJzL2dwdS9kcm0vYm9jaHMvYm9jaHNfaHcu
YyAgfCA0ICsrKysKIGRyaXZlcnMvZ3B1L2RybS9ib2Nocy9ib2Noc19rbXMuYyB8IDggKysrKyst
LS0KIDQgZmlsZXMgY2hhbmdlZCwgMTQgaW5zZXJ0aW9ucygrKSwgMTEgZGVsZXRpb25zKC0pCgpk
aWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2JvY2hzL2JvY2hzLmggYi9kcml2ZXJzL2dwdS9k
cm0vYm9jaHMvYm9jaHMuaAppbmRleCBjYzM1ZDQ5MjE0MmMuLjQ5OGU5NmZiNjFiNiAxMDA2NDQK
LS0tIGEvZHJpdmVycy9ncHUvZHJtL2JvY2hzL2JvY2hzLmgKKysrIGIvZHJpdmVycy9ncHUvZHJt
L2JvY2hzL2JvY2hzLmgKQEAgLTEsMTcgKzEsMTUgQEAKIC8qIFNQRFgtTGljZW5zZS1JZGVudGlm
aWVyOiBHUEwtMi4wICovCisKICNpbmNsdWRlIDxsaW51eC9pby5oPgogI2luY2x1ZGUgPGxpbnV4
L2NvbnNvbGUuaD4KIAotI2luY2x1ZGUgPGRybS9kcm1QLmg+CiAjaW5jbHVkZSA8ZHJtL2RybV9j
cnRjLmg+CiAjaW5jbHVkZSA8ZHJtL2RybV9jcnRjX2hlbHBlci5oPgogI2luY2x1ZGUgPGRybS9k
cm1fZW5jb2Rlci5oPgogI2luY2x1ZGUgPGRybS9kcm1fZmJfaGVscGVyLmg+Ci0jaW5jbHVkZSA8
ZHJtL2RybV9zaW1wbGVfa21zX2hlbHBlci5oPgotCiAjaW5jbHVkZSA8ZHJtL2RybV9nZW0uaD4K
ICNpbmNsdWRlIDxkcm0vZHJtX2dlbV92cmFtX2hlbHBlci5oPgotCisjaW5jbHVkZSA8ZHJtL2Ry
bV9zaW1wbGVfa21zX2hlbHBlci5oPgogI2luY2x1ZGUgPGRybS9kcm1fdnJhbV9tbV9oZWxwZXIu
aD4KIAogLyogLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLSAqLwpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2Jv
Y2hzL2JvY2hzX2Rydi5jIGIvZHJpdmVycy9ncHUvZHJtL2JvY2hzL2JvY2hzX2Rydi5jCmluZGV4
IDc4YWQ2Yzk4ODYxZC4uNWQwYTAwNjBjMjJiIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0v
Ym9jaHMvYm9jaHNfZHJ2LmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2JvY2hzL2JvY2hzX2Rydi5j
CkBAIC0yLDExICsyLDEwIEBACiAvKgogICovCiAKLSNpbmNsdWRlIDxsaW51eC9tbS5oPgogI2lu
Y2x1ZGUgPGxpbnV4L21vZHVsZS5oPgotI2luY2x1ZGUgPGxpbnV4L3NsYWIuaD4KLSNpbmNsdWRl
IDxkcm0vZHJtX2ZiX2hlbHBlci5oPgotI2luY2x1ZGUgPGRybS9kcm1fcHJvYmVfaGVscGVyLmg+
CisjaW5jbHVkZSA8bGludXgvcGNpLmg+CisKKyNpbmNsdWRlIDxkcm0vZHJtX2Rydi5oPgogI2lu
Y2x1ZGUgPGRybS9kcm1fYXRvbWljX2hlbHBlci5oPgogCiAjaW5jbHVkZSAiYm9jaHMuaCIKZGlm
ZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9ib2Nocy9ib2Noc19ody5jIGIvZHJpdmVycy9ncHUv
ZHJtL2JvY2hzL2JvY2hzX2h3LmMKaW5kZXggNzkxYWIyZjc5OTQ3Li4yOTIxN2U2OTY1NDkgMTAw
NjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9ib2Nocy9ib2Noc19ody5jCisrKyBiL2RyaXZlcnMv
Z3B1L2RybS9ib2Nocy9ib2Noc19ody5jCkBAIC0yLDYgKzIsMTAgQEAKIC8qCiAgKi8KIAorI2lu
Y2x1ZGUgPGxpbnV4L3BjaS5oPgorCisjaW5jbHVkZSA8ZHJtL2RybV9mb3VyY2MuaD4KKwogI2lu
Y2x1ZGUgImJvY2hzLmgiCiAKIC8qIC0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0gKi8KZGlmZiAtLWdpdCBhL2RyaXZl
cnMvZ3B1L2RybS9ib2Nocy9ib2Noc19rbXMuYyBiL2RyaXZlcnMvZ3B1L2RybS9ib2Nocy9ib2No
c19rbXMuYwppbmRleCA1OTA0ZWRkYzgzYTUuLmY2YWUzNGJiMjIwOSAxMDA2NDQKLS0tIGEvZHJp
dmVycy9ncHUvZHJtL2JvY2hzL2JvY2hzX2ttcy5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9ib2No
cy9ib2Noc19rbXMuYwpAQCAtMiwxMiArMiwxNCBAQAogLyoKICAqLwogCi0jaW5jbHVkZSAiYm9j
aHMuaCIKKyNpbmNsdWRlIDxsaW51eC9tb2R1bGVwYXJhbS5oPgorCiAjaW5jbHVkZSA8ZHJtL2Ry
bV9hdG9taWNfaGVscGVyLmg+Ci0jaW5jbHVkZSA8ZHJtL2RybV9wbGFuZV9oZWxwZXIuaD4KLSNp
bmNsdWRlIDxkcm0vZHJtX2F0b21pY191YXBpLmg+CiAjaW5jbHVkZSA8ZHJtL2RybV9nZW1fZnJh
bWVidWZmZXJfaGVscGVyLmg+CiAjaW5jbHVkZSA8ZHJtL2RybV9wcm9iZV9oZWxwZXIuaD4KKyNp
bmNsdWRlIDxkcm0vZHJtX3ZibGFuay5oPgorCisjaW5jbHVkZSAiYm9jaHMuaCIKIAogc3RhdGlj
IGludCBkZWZ4ID0gMTAyNDsKIHN0YXRpYyBpbnQgZGVmeSA9IDc2ODsKLS0gCjIuMjAuMQoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1h
aWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
