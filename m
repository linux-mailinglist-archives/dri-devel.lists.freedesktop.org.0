Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E706F1D4A0F
	for <lists+dri-devel@lfdr.de>; Fri, 15 May 2020 11:54:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 31FCD6EC4D;
	Fri, 15 May 2020 09:54:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com
 [IPv6:2a00:1450:4864:20::344])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 395816EC42
 for <dri-devel@lists.freedesktop.org>; Fri, 15 May 2020 09:54:38 +0000 (UTC)
Received: by mail-wm1-x344.google.com with SMTP id w64so1948885wmg.4
 for <dri-devel@lists.freedesktop.org>; Fri, 15 May 2020 02:54:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=pNLF3OezzIDx+6Z3gzM02gmKo66FU8kqpI8uLC6WUCE=;
 b=K5no6ytI+zaq7ed6Ziz2Zp/Tn/2PiZFYGy7KOG3EHrDLYWx8r0ExgW8Vg6rZ0fcEsQ
 eKPdU/eW7ZA2AJUuIw6SYICzAh1+H84B6+Aa9lldM9xRQK9LnGBpCT54F1WY0+ImbQ2k
 muWhZEKwltqL91T771UtGHFhrBXWj21Qva7vUjcCi0GHCduzBANLd9cUGS3PQZpHjyjF
 y7+VGaU1eOHbEuNjWSDRonSM/43A4pvUXqeN1m2bqYR/ASw1yUDjWqJHj/CEs6UWSrZH
 alRmOwlGB7Wp5tu5YIa5K2cfxhkuESrqS7YOpUTcO38uElVfOUpXXxSjvre4/Or2AMd7
 TcTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=pNLF3OezzIDx+6Z3gzM02gmKo66FU8kqpI8uLC6WUCE=;
 b=iEwdRGYUtqzGUb0u5fztYiY5YdUutG431IaIRpz579JiexvPjdovga0GUlig/lKjp8
 uSTOkwFGI4Ob0oTe2yzL8Two5NfL+fZ3KT35rpbTzhxfbtRZ0JaEaa+khjSp0e3WVxGC
 nyVyDOAN9htle8K7R/UWbsGnWi9Jdh/MMzocyXQbtXdq6isCZqNLlbXRolotDd1GigDq
 X/8+VbTcZFCIr5E+r0D+34+mwrVWNw5BgAlXV4Fae1qtBKptpxmqqlNwBALs7EITSZHJ
 4fK5bV62b4OtIuXU6ZjArkwcKpRllUpxGdrTgBIGHBSvIm3PU4vMU7ME6c7dr5AG/CJQ
 /7Eg==
X-Gm-Message-State: AOAM5304bPh6ztV2g9tjagNyPlDAXBvn2vpQEcB9tJZl8R8rpYF/9TaR
 xnc0iSzXeHhnZocxlwNBJNkU1YPR
X-Google-Smtp-Source: ABdhPJzeqijflI2tVTENtHMws/xjTVmY8yaUzbMFBT0wI74jlCYCx9MUFNaoqaaySXb7K6ib9jR6Ew==
X-Received: by 2002:a7b:c7d5:: with SMTP id z21mr3024101wmk.112.1589536476602; 
 Fri, 15 May 2020 02:54:36 -0700 (PDT)
Received: from localhost.localdomain
 (cpc91192-cmbg18-2-0-cust374.5-4.cable.virginm.net. [80.6.113.119])
 by smtp.gmail.com with ESMTPSA id s12sm2705817wmc.7.2020.05.15.02.54.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 May 2020 02:54:36 -0700 (PDT)
From: Emil Velikov <emil.l.velikov@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v2 30/38] drm/rockchip: remove _unlocked suffix in
 drm_object_put_unlocked
Date: Fri, 15 May 2020 10:51:10 +0100
Message-Id: <20200515095118.2743122-31-emil.l.velikov@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200515095118.2743122-1-emil.l.velikov@gmail.com>
References: <20200515095118.2743122-1-emil.l.velikov@gmail.com>
MIME-Version: 1.0
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
Cc: David Airlie <airlied@linux.ie>, emil.l.velikov@gmail.com,
 Sandy Huang <hjc@rock-chips.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogRW1pbCBWZWxpa292IDxlbWlsLnZlbGlrb3ZAY29sbGFib3JhLmNvbT4KClNwZWxsaW5n
IG91dCBfdW5sb2NrZWQgZm9yIGVhY2ggYW5kIGV2ZXJ5IGRyaXZlciBpcyBhIGFubm95aW5nLgpF
c3BlY2lhbGx5IGlmIHdlIGNvbnNpZGVyIGhvdyBtYW55IGRyaXZlcnMsIGRvIG5vdCBrbm93IChv
ciBuZWVkIHRvKQphYm91dCB0aGUgaG9ycm9yIHN0b3JpZXMgaW52b2x2aW5nIHN0cnVjdF9tdXRl
eC4KCkp1c3QgZHJvcCB0aGUgc3VmZml4LiBJdCBtYWtlcyB0aGUgQVBJIGNsZWFuZXIuCgpEb25l
IHZpYSB0aGUgZm9sbG93aW5nIHNjcmlwdDoKCl9fZnJvbT1kcm1fZ2VtX29iamVjdF9wdXRfdW5s
b2NrZWQKX190bz1kcm1fZ2VtX29iamVjdF9wdXQKZm9yIF9fZmlsZSBpbiAkKGdpdCBncmVwIC0t
bmFtZS1vbmx5ICRfX2Zyb20pOyBkbwogIHNlZCAtaSAgInMvJF9fZnJvbS8kX190by9nIiAkX19m
aWxlOwpkb25lCgpDYzogU2FuZHkgSHVhbmcgPGhqY0Byb2NrLWNoaXBzLmNvbT4KQ2M6ICJIZWlr
byBTdMO8Ym5lciIgPGhlaWtvQHNudGVjaC5kZT4KQ2M6IERhdmlkIEFpcmxpZSA8YWlybGllZEBs
aW51eC5pZT4KU2lnbmVkLW9mZi1ieTogRW1pbCBWZWxpa292IDxlbWlsLnZlbGlrb3ZAY29sbGFi
b3JhLmNvbT4KQWNrZWQtYnk6IFNhbSBSYXZuYm9yZyA8c2FtQHJhdm5ib3JnLm9yZz4KLS0tCiBk
cml2ZXJzL2dwdS9kcm0vcm9ja2NoaXAvcm9ja2NoaXBfZHJtX2ZiLmMgIHwgMiArLQogZHJpdmVy
cy9ncHUvZHJtL3JvY2tjaGlwL3JvY2tjaGlwX2RybV9nZW0uYyB8IDIgKy0KIDIgZmlsZXMgY2hh
bmdlZCwgMiBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZl
cnMvZ3B1L2RybS9yb2NrY2hpcC9yb2NrY2hpcF9kcm1fZmIuYyBiL2RyaXZlcnMvZ3B1L2RybS9y
b2NrY2hpcC9yb2NrY2hpcF9kcm1fZmIuYwppbmRleCA5YjEzYzc4NGIzNDcuLjNhYTM3ZTE3NzY2
NyAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL3JvY2tjaGlwL3JvY2tjaGlwX2RybV9mYi5j
CisrKyBiL2RyaXZlcnMvZ3B1L2RybS9yb2NrY2hpcC9yb2NrY2hpcF9kcm1fZmIuYwpAQCAtODgs
NyArODgsNyBAQCByb2NrY2hpcF9mYl9jcmVhdGUoc3RydWN0IGRybV9kZXZpY2UgKmRldiwgc3Ry
dWN0IGRybV9maWxlICpmaWxlLAogCQkJc3RydWN0IGRybV9nZW1fb2JqZWN0ICoqb2JqID0gYWZi
Y19mYi0+YmFzZS5vYmo7CiAKIAkJCWZvciAoaSA9IDA7IGkgPCBpbmZvLT5udW1fcGxhbmVzOyAr
K2kpCi0JCQkJZHJtX2dlbV9vYmplY3RfcHV0X3VubG9ja2VkKG9ialtpXSk7CisJCQkJZHJtX2dl
bV9vYmplY3RfcHV0KG9ialtpXSk7CiAKIAkJCWtmcmVlKGFmYmNfZmIpOwogCQkJcmV0dXJuIEVS
Ul9QVFIocmV0KTsKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9yb2NrY2hpcC9yb2NrY2hp
cF9kcm1fZ2VtLmMgYi9kcml2ZXJzL2dwdS9kcm0vcm9ja2NoaXAvcm9ja2NoaXBfZHJtX2dlbS5j
CmluZGV4IDBkMTg4NDY4NGRjYi4uYjkyNzViYTdjNWE1IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dw
dS9kcm0vcm9ja2NoaXAvcm9ja2NoaXBfZHJtX2dlbS5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9y
b2NrY2hpcC9yb2NrY2hpcF9kcm1fZ2VtLmMKQEAgLTM5Miw3ICszOTIsNyBAQCByb2NrY2hpcF9n
ZW1fY3JlYXRlX3dpdGhfaGFuZGxlKHN0cnVjdCBkcm1fZmlsZSAqZmlsZV9wcml2LAogCQlnb3Rv
IGVycl9oYW5kbGVfY3JlYXRlOwogCiAJLyogZHJvcCByZWZlcmVuY2UgZnJvbSBhbGxvY2F0ZSAt
IGhhbmRsZSBob2xkcyBpdCBub3cuICovCi0JZHJtX2dlbV9vYmplY3RfcHV0X3VubG9ja2VkKG9i
aik7CisJZHJtX2dlbV9vYmplY3RfcHV0KG9iaik7CiAKIAlyZXR1cm4gcmtfb2JqOwogCi0tIAoy
LjI1LjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRy
aS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRw
czovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
