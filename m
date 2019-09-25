Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B59ABECBC
	for <lists+dri-devel@lfdr.de>; Thu, 26 Sep 2019 09:42:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A26426EE0A;
	Thu, 26 Sep 2019 07:42:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x442.google.com (mail-pf1-x442.google.com
 [IPv6:2607:f8b0:4864:20::442])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 41C416ED65
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Sep 2019 22:58:39 +0000 (UTC)
Received: by mail-pf1-x442.google.com with SMTP id x127so432910pfb.7
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Sep 2019 15:58:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=OBfAYVzrUaZx8A81lQKWZtaimNSs6Q4Prkr1zyCu8Sk=;
 b=l+KqK5558vSheHQuEIG3e/Md0Yn6WtSyrgGjq6sLyslXzdIhr2zmgIBVSjw5POiPGy
 Qt7EgwBpXlxf96mhudNbisMhAXmBfO+E/r8dhDaLQTOOzt+u9bATDSPgCuCWHg80rwJk
 ADRn87n99HUXRwAm2WfiC01N0j8pt3jgFVsldGRRQTInrJqQWTWVuXcN3CTgX+MBXE/p
 r/itJt7k5NccnwkEuz1uV76AzN8RkxQ8vKO+5Uea5ZQuc+z6h6TyInGunUMTmNrNbtWe
 S/9TM6EEFbjVCvrPxxof8R/C1djlO2gBRyBVuQCpvmjd1Ieq+noMptxjSUEaZ/aNbmJR
 WFDw==
X-Gm-Message-State: APjAAAViET99KYoMPvgjKM/QD/9VJcBbvdoFMbIorXEPaWCHjgaij9tS
 LPQj5TLtOg59uwwEZsB2uEgc2A==
X-Google-Smtp-Source: APXvYqyBkPb/ka6PSD+JEb9aEIXdZQPZKoux3UfNWddn261c/1mhYqrBDYlaAvmnqxOn2W4DIIYmEQ==
X-Received: by 2002:a65:420d:: with SMTP id c13mr260391pgq.293.1569452318669; 
 Wed, 25 Sep 2019 15:58:38 -0700 (PDT)
Received: from exogeni.mtv.corp.google.com
 ([2620:15c:202:1:5be8:f2a6:fd7b:7459])
 by smtp.gmail.com with ESMTPSA id j24sm76185pff.71.2019.09.25.15.58.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 25 Sep 2019 15:58:37 -0700 (PDT)
From: Derek Basehore <dbasehore@chromium.org>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v8 0/4] Panel rotation patches
Date: Wed, 25 Sep 2019 15:58:29 -0700
Message-Id: <20190925225833.7310-1-dbasehore@chromium.org>
X-Mailer: git-send-email 2.23.0.351.gc4317032e6-goog
MIME-Version: 1.0
X-Mailman-Approved-At: Thu, 26 Sep 2019 07:42:05 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=OBfAYVzrUaZx8A81lQKWZtaimNSs6Q4Prkr1zyCu8Sk=;
 b=lnwzlxaOGXON5kJ+mJtUQcGIZKlxrNequk5F3hmYazLKV6g7hVjA4zue24ICSCflnJ
 TKbxKfS27WL3LmgHu6tGZzEsOKLplx7ahSTC12La2RWxtT71Bg5QSABWFvbHMg+cKhUb
 Z23L/NT/IQHnf3aCqP6reQvCq6mvnOL9t8NLk=
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
Cc: Derek Basehore <dbasehore@chromium.org>,
 Maxime Ripard <maxime.ripard@bootlin.com>, Sam Ravnborg <sam@ravnborg.org>,
 intel-gfx@lists.freedesktop.org, David Airlie <airlied@linux.ie>,
 Thierry Reding <thierry.reding@gmail.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, dri-devel@lists.freedesktop.org,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, linux-mediatek@lists.infradead.org,
 Sean Paul <sean@poorly.run>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGhpcyBhZGRzIHRoZSBwbHVtYmluZyBmb3IgcmVhZGluZyBwYW5lbCByb3RhdGlvbiBmcm9tIHRo
ZSBkZXZpY2V0cmVlCmFuZCBzZXRzIHVwIGFkZGluZyBhIHBhbmVsIHByb3BlcnR5IGZvciB0aGUg
cGFuZWwgb3JpZW50YXRpb24gb24KTWVkaWF0ZWsgU29DcyB3aGVuIGEgcm90YXRpb24gaXMgcHJl
c2VudC4KCnY4IGNoYW5nZXM6Ci1hZGRlZCByZXZpZXdlZC1ieSB0YWdzCi1maXhlZCBjb25mbGlj
dCB3aXRoIGk5MTUgcGF0Y2ggdGhhdCByZWNlbnRseSBsYW5kZWQKLUFkZGVkIGFkZGl0aW9uYWwg
ZG9jdW1lbnRhdGlvbgoKdjcgY2hhbmdlczoKLWZvcmdvdCB0byBhZGQgc3RhdGljIGlubGluZQoK
djYgY2hhbmdlczoKLWFkZGVkIGVudW0gZGVjbGFyYXRpb24gdG8gZHJtX3BhbmVsLmggaGVhZGVy
Cgp2NSBjaGFuZ2VzOgotcmViYXNlZAoKdjQgY2hhbmdlczoKLWZpeGVkIHNvbWUgY2hhbmdlcyBt
YWRlIHRvIHRoZSBpOTE1IGRyaXZlcgotY2xhcmlmaWVkIGNvbW1lbnRzIG9uIG9mIG9yaWVudGF0
aW9uIGhlbHBlcgoKdjMgY2hhbmdlczoKLWNoYW5nZWQgZnJvbSBhdHRhY2gvZGV0YWNoIGNhbGxi
YWNrcyB0byBkaXJlY3RseSBzZXR0aW5nIGZpeGVkIHBhbmVsCiB2YWx1ZXMgaW4gZHJtX3BhbmVs
X2F0dGFjaAotcmVtb3ZlZCB1cGRhdGUgdG8gRG9jdW1lbnRhdGlvbgotYWRkZWQgc2VwYXJhdGUg
ZnVuY3Rpb24gZm9yIHF1aXJrZWQgcGFuZWwgb3JpZW50YXRpb24gcHJvcGVydHkgaW5pdAoKdjIg
Y2hhbmdlczoKZml4ZWQgYnVpbGQgZXJyb3JzIGluIGk5MTUKCkRlcmVrIEJhc2Vob3JlICg0KToK
ICBkcm0vcGFuZWw6IEFkZCBoZWxwZXIgZm9yIHJlYWRpbmcgRFQgcm90YXRpb24KICBkcm0vcGFu
ZWw6IHNldCBkaXNwbGF5IGluZm8gaW4gcGFuZWwgYXR0YWNoCiAgZHJtL2Nvbm5lY3RvcjogU3Bs
aXQgb3V0IG9yaWVudGF0aW9uIHF1aXJrIGRldGVjdGlvbgogIGRybS9tdGs6IGFkZCBwYW5lbCBv
cmllbnRhdGlvbiBwcm9wZXJ0eQoKIGRyaXZlcnMvZ3B1L2RybS9kcm1fY29ubmVjdG9yLmMgICAg
fCA0NSArKysrKysrKysrKysrKy0tLS0tCiBkcml2ZXJzL2dwdS9kcm0vZHJtX3BhbmVsLmMgICAg
ICAgIHwgNzAgKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrCiBkcml2ZXJzL2dwdS9kcm0v
aTkxNS9pbnRlbF9kcC5jICAgIHwgIDQgKy0KIGRyaXZlcnMvZ3B1L2RybS9pOTE1L3Zsdl9kc2ku
YyAgICAgfCAgNSArLS0KIGRyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZHNpLmMgfCAgOCAr
KysrCiBpbmNsdWRlL2RybS9kcm1fY29ubmVjdG9yLmggICAgICAgIHwgIDIgKwogaW5jbHVkZS9k
cm0vZHJtX3BhbmVsLmggICAgICAgICAgICB8IDIxICsrKysrKysrKwogNyBmaWxlcyBjaGFuZ2Vk
LCAxMzggaW5zZXJ0aW9ucygrKSwgMTcgZGVsZXRpb25zKC0pCgotLSAKMi4yMi4wLjQxMC5nZDhm
ZGJlMjFiNS1nb29nCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5v
cmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2
ZWw=
