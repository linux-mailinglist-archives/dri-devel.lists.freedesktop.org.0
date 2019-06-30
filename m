Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 77CB75AEDF
	for <lists+dri-devel@lfdr.de>; Sun, 30 Jun 2019 08:19:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 22F056E9CB;
	Sun, 30 Jun 2019 06:19:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x144.google.com (mail-lf1-x144.google.com
 [IPv6:2a00:1450:4864:20::144])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 775D36E9C2
 for <dri-devel@lists.freedesktop.org>; Sun, 30 Jun 2019 06:19:34 +0000 (UTC)
Received: by mail-lf1-x144.google.com with SMTP id q26so6609829lfc.3
 for <dri-devel@lists.freedesktop.org>; Sat, 29 Jun 2019 23:19:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=OsN2xVQbeGchL0DdFWamMTmemyq/War6glp/ODT4q80=;
 b=GReKYnDeOPgn6qgQmSGweZ8EfXhYC9ReyEvfexA6UqH/An9qjDxXaQSYBZ8MUyAxxt
 ShVaTKq9pnMI7E531Ld6MUI144Ta6+7uGhEn0F5ITmQYrsjmcZxl2ppON8sUbSTLrEv2
 /IKpZ46gZDneJ/UpXQxrJYlGutlyYN4jvQq3s/DbPUcrK2y+ejM/ORZoUkHjydVZgdj8
 Fc2HzXzi0qYhkK/Fs8K/tX9A/T04DacbWHLYa2HfVqLYM+q0aUmYIs3cRBdvA7bM9s7i
 yXqxcIYR8Fdutw/gIL5F9LaNduIg5AVcOqlDRTJFykDrrtaRoLweUCVBFFMsmtv9V/Q1
 LUTw==
X-Gm-Message-State: APjAAAWYuz93/wWBkmOowfVuVhUHxm7WEIfo6n+mM6OL6Yd4+hgOCFNt
 PvEkK+SE83O0BAx11+iH9HVbiqFzzIVHGA==
X-Google-Smtp-Source: APXvYqwSx3YKpsiSDTmr39vl/C2lo9bhvV5OKJzA3P1e5bbRhpPfibCzdL3lB1gbvz7q6Gz5+kxRzA==
X-Received: by 2002:a19:cc45:: with SMTP id c66mr8871303lfg.171.1561875572614; 
 Sat, 29 Jun 2019 23:19:32 -0700 (PDT)
Received: from saturn.lan (18.158-248-194.customer.lyse.net. [158.248.194.18])
 by smtp.gmail.com with ESMTPSA id
 o74sm1794024lff.46.2019.06.29.23.19.31
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Sat, 29 Jun 2019 23:19:32 -0700 (PDT)
From: Sam Ravnborg <sam@ravnborg.org>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v1 04/33] drm/tve200: drop use of drmP.h
Date: Sun, 30 Jun 2019 08:18:53 +0200
Message-Id: <20190630061922.7254-5-sam@ravnborg.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190630061922.7254-1-sam@ravnborg.org>
References: <20190630061922.7254-1-sam@ravnborg.org>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=OsN2xVQbeGchL0DdFWamMTmemyq/War6glp/ODT4q80=;
 b=Nv6B80faiEQh1sPQMUg5du82IHrTCU6oZVcMxbORLm3MZFMXokURFOnJ3rYIpoWEeI
 hEQI413C/QOmi+yknhj/oYpn3vKPlJGmihgMXzRk68q2DjDVmys1XhtYZnYHlIfmt4u0
 U+jBWHFu+wZ8MSukJeA7BfiYWtfYG/uA3LqCmT0obMQpGITL9IYFQjA3orQCvakBC2q0
 gDfI2I6khOPFen/8+ry5yyQlWPwiTIQp9bJibvrl2KnPhU9o2xfLUcsCQ4vXlvnXoWxe
 w3L3c2k9DPbNJ7/4DHJ9gY8exUkQ4UIdLLEPBmdp+G2kGxZeOTRo6W4sHiLUGRRUQSTh
 H/rg==
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
Cc: David Airlie <airlied@linux.ie>, Sam Ravnborg <sam@ravnborg.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RHJvcCB1c2Ugb2YgdGhlIGRlcHJlY2F0ZWQgaGVhZGVyIGRybVAuaC4KCkZpeCBzbyBoZWFkZXIg
ZmlsZSBiZWNhbWUgc2VsZi1jb250YWluZWQsCmFuZCB0aGVuIGZpeGVkIGZhbGxvdXQgaW4gdGhl
IG90aGVyIGZpbGVzLgoKU2lnbmVkLW9mZi1ieTogU2FtIFJhdm5ib3JnIDxzYW1AcmF2bmJvcmcu
b3JnPgpDYzogTGludXMgV2FsbGVpaiA8bGludXMud2FsbGVpakBsaW5hcm8ub3JnPgpDYzogRGF2
aWQgQWlybGllIDxhaXJsaWVkQGxpbnV4LmllPgpDYzogRGFuaWVsIFZldHRlciA8ZGFuaWVsQGZm
d2xsLmNoPgotLS0KVGhlIGxpc3Qgb2YgY2M6IHdhcyB0b28gbGFyZ2UgdG8gYWRkIGFsbCByZWNp
cGllbnRzIHRvIHRoZSBjb3ZlciBsZXR0ZXIuClBsZWFzZSBmaW5kIGNvdmVyIGxldHRlciBoZXJl
OgpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9hcmNoaXZlcy9kcmktZGV2ZWwvMjAxOS1K
dW5lL3RocmVhZC5odG1sClNlYXJjaCBmb3IgImRybTogZHJvcCB1c2Ugb2YgZHJtcC5oIGluIGRy
bS1taXNjIgoKICAgICAgICBTYW0KCiBkcml2ZXJzL2dwdS9kcm0vdHZlMjAwL3R2ZTIwMF9kaXNw
bGF5LmMgfCAgOCArKysrKy0tLQogZHJpdmVycy9ncHUvZHJtL3R2ZTIwMC90dmUyMDBfZHJtLmgg
ICAgIHwgMTUgKysrKysrKysrKysrLS0tCiBkcml2ZXJzL2dwdS9kcm0vdHZlMjAwL3R2ZTIwMF9k
cnYuYyAgICAgfCAgMyArKy0KIDMgZmlsZXMgY2hhbmdlZCwgMTkgaW5zZXJ0aW9ucygrKSwgNyBk
ZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vdHZlMjAwL3R2ZTIwMF9k
aXNwbGF5LmMgYi9kcml2ZXJzL2dwdS9kcm0vdHZlMjAwL3R2ZTIwMF9kaXNwbGF5LmMKaW5kZXgg
NThmZDMxMDMwODM0Li5kNzMzYmJjNGFjMGUgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS90
dmUyMDAvdHZlMjAwX2Rpc3BsYXkuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vdHZlMjAwL3R2ZTIw
MF9kaXNwbGF5LmMKQEAgLTksMTYgKzksMTggQEAKICAqIENvcHlyaWdodCAoQykgMjAxMSBUZXhh
cyBJbnN0cnVtZW50cwogICogQ29weXJpZ2h0IChDKSAyMDE3IEVyaWMgQW5ob2x0CiAgKi8KKwog
I2luY2x1ZGUgPGxpbnV4L2Nsay5oPgogI2luY2x1ZGUgPGxpbnV4L3ZlcnNpb24uaD4KICNpbmNs
dWRlIDxsaW51eC9kbWEtYnVmLmg+CiAjaW5jbHVkZSA8bGludXgvb2ZfZ3JhcGguaD4KIAotI2lu
Y2x1ZGUgPGRybS9kcm1QLmg+Ci0jaW5jbHVkZSA8ZHJtL2RybV9wYW5lbC5oPgorI2luY2x1ZGUg
PGRybS9kcm1fZmJfY21hX2hlbHBlci5oPgorI2luY2x1ZGUgPGRybS9kcm1fZm91cmNjLmg+CiAj
aW5jbHVkZSA8ZHJtL2RybV9nZW1fY21hX2hlbHBlci5oPgogI2luY2x1ZGUgPGRybS9kcm1fZ2Vt
X2ZyYW1lYnVmZmVyX2hlbHBlci5oPgotI2luY2x1ZGUgPGRybS9kcm1fZmJfY21hX2hlbHBlci5o
PgorI2luY2x1ZGUgPGRybS9kcm1fcGFuZWwuaD4KKyNpbmNsdWRlIDxkcm0vZHJtX3ZibGFuay5o
PgogCiAjaW5jbHVkZSAidHZlMjAwX2RybS5oIgogCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9k
cm0vdHZlMjAwL3R2ZTIwMF9kcm0uaCBiL2RyaXZlcnMvZ3B1L2RybS90dmUyMDAvdHZlMjAwX2Ry
bS5oCmluZGV4IDYyMDYxYjUxODM5Ny4uNTQyMGI1MmVhMTZiIDEwMDY0NAotLS0gYS9kcml2ZXJz
L2dwdS9kcm0vdHZlMjAwL3R2ZTIwMF9kcm0uaAorKysgYi9kcml2ZXJzL2dwdS9kcm0vdHZlMjAw
L3R2ZTIwMF9kcm0uaApAQCAtMTMsNiArMTMsMTggQEAKICNpZm5kZWYgX1RWRTIwMF9EUk1fSF8K
ICNkZWZpbmUgX1RWRTIwMF9EUk1fSF8KIAorI2luY2x1ZGUgPGxpbnV4L2lycXJldHVybi5oPgor
CisjaW5jbHVkZSA8ZHJtL2RybV9zaW1wbGVfa21zX2hlbHBlci5oPgorCitzdHJ1Y3QgY2xrOwor
c3RydWN0IGRybV9icmlkZ2U7CitzdHJ1Y3QgZHJtX2Nvbm5lY3RvcjsKK3N0cnVjdCBkcm1fZGV2
aWNlOworc3RydWN0IGRybV9maWxlOworc3RydWN0IGRybV9tb2RlX2NyZWF0ZV9kdW1iOworc3Ry
dWN0IGRybV9wYW5lbDsKKwogLyogQml0cyAyLTMxIGFyZSB2YWxpZCBwaHlzaWNhbCBiYXNlIGFk
ZHJlc3NlcyAqLwogI2RlZmluZSBUVkUyMDBfWV9GUkFNRV9CQVNFX0FERFIJMHgwMAogI2RlZmlu
ZSBUVkUyMDBfVV9GUkFNRV9CQVNFX0FERFIJMHgwNApAQCAtODksOSArMTAxLDYgQEAKICNkZWZp
bmUgVFZFMjAwX0NUUkxfNAkJCTB4MjQKICNkZWZpbmUgVFZFMjAwX0NUUkxfNF9SRVNFVAkJQklU
KDApIC8qIHRyaWdnZXJzIHJlc2V0IG9mIFRWRTIwMCAqLwogCi0jaW5jbHVkZSA8ZHJtL2RybV9n
ZW0uaD4KLSNpbmNsdWRlIDxkcm0vZHJtX3NpbXBsZV9rbXNfaGVscGVyLmg+Ci0KIHN0cnVjdCB0
dmUyMDBfZHJtX2Rldl9wcml2YXRlIHsKIAlzdHJ1Y3QgZHJtX2RldmljZSAqZHJtOwogCmRpZmYg
LS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vdHZlMjAwL3R2ZTIwMF9kcnYuYyBiL2RyaXZlcnMvZ3B1
L2RybS90dmUyMDAvdHZlMjAwX2Rydi5jCmluZGV4IDgzMGE1YWYyNWFjNC4uNDE2ZjI0ODIzYzBh
IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vdHZlMjAwL3R2ZTIwMF9kcnYuYworKysgYi9k
cml2ZXJzL2dwdS9kcm0vdHZlMjAwL3R2ZTIwMF9kcnYuYwpAQCAtMzcsOSArMzcsOSBAQAogI2lu
Y2x1ZGUgPGxpbnV4L3NsYWIuaD4KICNpbmNsdWRlIDxsaW51eC92ZXJzaW9uLmg+CiAKLSNpbmNs
dWRlIDxkcm0vZHJtUC5oPgogI2luY2x1ZGUgPGRybS9kcm1fYXRvbWljX2hlbHBlci5oPgogI2lu
Y2x1ZGUgPGRybS9kcm1fYnJpZGdlLmg+CisjaW5jbHVkZSA8ZHJtL2RybV9kcnYuaD4KICNpbmNs
dWRlIDxkcm0vZHJtX2ZiX2NtYV9oZWxwZXIuaD4KICNpbmNsdWRlIDxkcm0vZHJtX2ZiX2hlbHBl
ci5oPgogI2luY2x1ZGUgPGRybS9kcm1fZ2VtX2NtYV9oZWxwZXIuaD4KQEAgLTQ3LDYgKzQ3LDcg
QEAKICNpbmNsdWRlIDxkcm0vZHJtX29mLmg+CiAjaW5jbHVkZSA8ZHJtL2RybV9wYW5lbC5oPgog
I2luY2x1ZGUgPGRybS9kcm1fcHJvYmVfaGVscGVyLmg+CisjaW5jbHVkZSA8ZHJtL2RybV92Ymxh
bmsuaD4KIAogI2luY2x1ZGUgInR2ZTIwMF9kcm0uaCIKIAotLSAKMi4yMC4xCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBs
aXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVz
a3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
