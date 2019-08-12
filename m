Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 85DEA8A048
	for <lists+dri-devel@lfdr.de>; Mon, 12 Aug 2019 16:01:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E956F6E526;
	Mon, 12 Aug 2019 14:01:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-xc43.google.com (mail-yw1-xc43.google.com
 [IPv6:2607:f8b0:4864:20::c43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 23A066E526
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Aug 2019 14:01:15 +0000 (UTC)
Received: by mail-yw1-xc43.google.com with SMTP id z63so38697547ywz.9
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Aug 2019 07:01:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Ai1Rl9oj0oMVkYrxaL5hytId3XTSGm7gfkH3PvP/dOg=;
 b=gqbQa/spaVjLBjZd8x7CkwtNm/+ZKEclNc4bWbSCe8T5C3nDiZtI71/jkxGmk6kTp3
 WVgtjcjGxD6ywUxFQFqa9a2oJaoHf/jblHKFYHUzB/dchYPqN+7E9JjHnwdZ3FrlpCEh
 ypT7ObGt4QC+QujBEpqpUpMA6Y2QnxAvXvTYwPyB7XtKBpjiudub2pmxAp/2l1bcBIIN
 9PjXK9sNX6tLC4LjWIT0twhni+Jf7rbhyMxkFIIGOJn5/+9sye/sKlZ7XWLXK+aymqKF
 WeI9cpP/zAAKqzAXfpnv7PKh/MqbRnbVdJzEA9gzvyxef5LzMxPt1SUocQ+SMb/SxKLu
 MnDw==
X-Gm-Message-State: APjAAAUNUdE/9MlDeTOtG6dJtV8ZKe7gsZR3w+EZGMHUbJcRZlndR0N6
 M1AHMHVVmzhyK5x5BXq+65ARhGKBg2o=
X-Google-Smtp-Source: APXvYqxQwW4TRzymSqHE6XhgjZnuQiXVGtJwytbe50smIpvxrA1s9xn1EMrE26bLCO02e547zRrX+A==
X-Received: by 2002:a0d:ff05:: with SMTP id p5mr20666700ywf.499.1565618474750; 
 Mon, 12 Aug 2019 07:01:14 -0700 (PDT)
Received: from rosewood.cam.corp.google.com
 ([2620:0:1013:11:89c6:2139:5435:371d])
 by smtp.gmail.com with ESMTPSA id n29sm259944ywh.77.2019.08.12.07.01.13
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Mon, 12 Aug 2019 07:01:13 -0700 (PDT)
From: Sean Paul <sean@poorly.run>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v2] drm: Fix kerneldoc warns in connector-related docs
Date: Mon, 12 Aug 2019 10:01:03 -0400
Message-Id: <20190812140112.6702-1-sean@poorly.run>
X-Mailer: git-send-email 2.23.0.rc1.153.gdeed80330f-goog
In-Reply-To: <20190809210607.GA852@ravnborg.org>
References: <20190809210607.GA852@ravnborg.org>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=poorly.run; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Ai1Rl9oj0oMVkYrxaL5hytId3XTSGm7gfkH3PvP/dOg=;
 b=GNddhMQlX8U+fiohCCz2u6ARd4F1LFMEFGBxxI+Cyo/7AQwxmcn11tCOn7uPZ5LAUK
 KhruCBLHqKrW9TbZ5CIQ54kbBREdYfxdbz/f/cTcI4okM/ppYrgdztlM86+3YwJAdwVg
 QrwMRfZdUxWhIOZ8giwL/8vuh+GYVciuEghiDgCWfaZs1ACyM6GqZcp5CYlq+l87yvQS
 73HhyUNlzn7/QMfDTs0SC1SpqxA5c6p9roFm2C2jFzx25OixYoXtqwlljl9iIOEP8nzg
 mEMUdHMJ3q355P53ra7n97UQ/nqORQvN1v7tnXCigNAEGnh6agbQVYAciENodDdV3HiW
 EByg==
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
Cc: Sean Paul <sean@poorly.run>, Pekka Paalanen <pekka.paalanen@collabora.com>,
 Jani Nikula <jani.nikula@intel.com>, David Airlie <airlied@linux.ie>,
 Maxime Ripard <maxime.ripard@bootlin.com>, Sean Paul <seanpaul@chromium.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Sam Ravnborg <sam@ravnborg.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogU2VhbiBQYXVsIDxzZWFucGF1bEBjaHJvbWl1bS5vcmc+CgpGaXhlcyB0aGUgZm9sbG93
aW5nIHdhcm5pbmdzOgouLi9kcml2ZXJzL2dwdS9kcm0vZHJtX2Nvbm5lY3Rvci5jOjk4OTogV0FS
TklORzogVW5leHBlY3RlZCBpbmRlbnRhdGlvbi4KLi4vZHJpdmVycy9ncHUvZHJtL2RybV9jb25u
ZWN0b3IuYzo5OTM6IFdBUk5JTkc6IFVuZXhwZWN0ZWQgaW5kZW50YXRpb24uCi4uL2luY2x1ZGUv
ZHJtL2RybV9jb25uZWN0b3IuaDo1NDQ6IFdBUk5JTkc6IElubGluZSBpbnRlcnByZXRlZCB0ZXh0
IG9yIHBocmFzZSByZWZlcmVuY2Ugc3RhcnQtc3RyaW5nIHdpdGhvdXQgZW5kLXN0cmluZy4KLi4v
aW5jbHVkZS9kcm0vZHJtX2Nvbm5lY3Rvci5oOjU0NDogV0FSTklORzogSW5saW5lIGludGVycHJl
dGVkIHRleHQgb3IgcGhyYXNlIHJlZmVyZW5jZSBzdGFydC1zdHJpbmcgd2l0aG91dCBlbmQtc3Ry
aW5nLgoKQ2hhbmdlcyBpbiB2MjoKLSBVc2UgKCkgaW5zdGVhZCBvZiAmIGZvciBmdW5jdGlvbnMg
KFNhbSkKCkZpeGVzOiAxYjI3ZmJkZGUxZGYgKCJkcm06IEFkZCBkcm1fYXRvbWljX2dldF8ob2xk
fG5ldylfY29ubmVjdG9yX2Zvcl9lbmNvZGVyKCkgaGVscGVycyIpCkZpeGVzOiBiYjVhNDVkNDBk
NTAgKCJkcm0vaGRjcDogdXBkYXRlIGNvbnRlbnQgcHJvdGVjdGlvbiBwcm9wZXJ0eSB3aXRoIHVl
dmVudCIpCkNjOiBSYW1hbGluZ2FtIEMgPHJhbWFsaW5nYW0uY0BpbnRlbC5jb20+CkNjOiBEYW5p
ZWwgVmV0dGVyIDxkYW5pZWxAZmZ3bGwuY2g+CkNjOiBQZWtrYSBQYWFsYW5lbiA8cGVra2EucGFh
bGFuZW5AY29sbGFib3JhLmNvbT4KQ2M6IFNhbSBSYXZuYm9yZyA8c2FtQHJhdm5ib3JnLm9yZz4K
Q2M6IExhdXJlbnQgUGluY2hhcnQgPGxhdXJlbnQucGluY2hhcnRAaWRlYXNvbmJvYXJkLmNvbT4K
Q2M6IEphbmkgTmlrdWxhIDxqYW5pLm5pa3VsYUBpbnRlbC5jb20+CkNjOiBTZWFuIFBhdWwgPHNl
YW5wYXVsQGNocm9taXVtLm9yZz4KQ2M6IE1hYXJ0ZW4gTGFua2hvcnN0IDxtYWFydGVuLmxhbmto
b3JzdEBsaW51eC5pbnRlbC5jb20+CkNjOiBNYXhpbWUgUmlwYXJkIDxtYXhpbWUucmlwYXJkQGJv
b3RsaW4uY29tPgpDYzogU2VhbiBQYXVsIDxzZWFuQHBvb3JseS5ydW4+CkNjOiBEYXZpZCBBaXJs
aWUgPGFpcmxpZWRAbGludXguaWU+CkNjOiBkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
ClJldmlld2VkLWJ5OiBTYW0gUmF2bmJvcmcgPHNhbUByYXZuYm9yZy5vcmc+ClNpZ25lZC1vZmYt
Ynk6IFNlYW4gUGF1bCA8c2VhbnBhdWxAY2hyb21pdW0ub3JnPgotLS0KClNlbmRpbmcgb3V0IGZv
ciBjb21wbGV0ZW5lc3MsIHdpbGwgYXBwbHkgdG8gZHJtLW1pc2MtbmV4dC4KCiBkcml2ZXJzL2dw
dS9kcm0vZHJtX2Nvbm5lY3Rvci5jIHwgMTAgKysrKysrLS0tLQogaW5jbHVkZS9kcm0vZHJtX2Nv
bm5lY3Rvci5oICAgICB8ICA0ICsrLS0KIDIgZmlsZXMgY2hhbmdlZCwgOCBpbnNlcnRpb25zKCsp
LCA2IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9kcm1fY29ubmVj
dG9yLmMgYi9kcml2ZXJzL2dwdS9kcm0vZHJtX2Nvbm5lY3Rvci5jCmluZGV4IDM1NDc5OGJhZDU3
Ni4uNGM3NjY2MjRiMjBkIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vZHJtX2Nvbm5lY3Rv
ci5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9kcm1fY29ubmVjdG9yLmMKQEAgLTk4NiwxMiArOTg2
LDE0IEBAIHN0YXRpYyBjb25zdCBzdHJ1Y3QgZHJtX3Byb3BfZW51bV9saXN0IGhkbWlfY29sb3Jz
cGFjZXNbXSA9IHsKICAqCS0gS2VybmVsIHNlbmRzIHVldmVudCB3aXRoIHRoZSBjb25uZWN0b3Ig
aWQgYW5kIHByb3BlcnR5IGlkIHRocm91Z2gKICAqCSAgQGRybV9oZGNwX3VwZGF0ZV9jb250ZW50
X3Byb3RlY3Rpb24sIHVwb24gYmVsb3cga2VybmVsIHRyaWdnZXJlZAogICoJICBzY2VuYXJpb3M6
Ci0gKgkJREVTSVJFRCAtPiBFTkFCTEVECShhdXRoZW50aWNhdGlvbiBzdWNjZXNzKQotICoJCUVO
QUJMRUQgLT4gREVTSVJFRAkodGVybWluYXRpb24gb2YgYXV0aGVudGljYXRpb24pCisgKgorICoJ
CS0gREVTSVJFRCAtPiBFTkFCTEVEIChhdXRoZW50aWNhdGlvbiBzdWNjZXNzKQorICoJCS0gRU5B
QkxFRCAtPiBERVNJUkVEICh0ZXJtaW5hdGlvbiBvZiBhdXRoZW50aWNhdGlvbikKICAqCS0gUGxl
YXNlIG5vdGUgbm8gdWV2ZW50cyBmb3IgdXNlcnNwYWNlIHRyaWdnZXJlZCBwcm9wZXJ0eSBzdGF0
ZSBjaGFuZ2VzLAogICoJICB3aGljaCBjYW4ndCBmYWlsIHN1Y2ggYXMKLSAqCQlERVNJUkVEL0VO
QUJMRUQgLT4gVU5ERVNJUkVECi0gKgkJVU5ERVNJUkVEIC0+IERFU0lSRUQKKyAqCisgKgkJLSBE
RVNJUkVEL0VOQUJMRUQgLT4gVU5ERVNJUkVECisgKgkJLSBVTkRFU0lSRUQgLT4gREVTSVJFRAog
ICoJLSBVc2Vyc3BhY2UgaXMgcmVzcG9uc2libGUgZm9yIHBvbGxpbmcgdGhlIHByb3BlcnR5IG9y
IGxpc3RlbiB0byB1ZXZlbnRzCiAgKgkgIHRvIGRldGVybWluZSB3aGVuIHRoZSB2YWx1ZSB0cmFu
c2l0aW9ucyBmcm9tIEVOQUJMRUQgdG8gREVTSVJFRC4KICAqCSAgVGhpcyBzaWduaWZpZXMgdGhl
IGxpbmsgaXMgbm8gbG9uZ2VyIHByb3RlY3RlZCBhbmQgdXNlcnNwYWNlIHNob3VsZApkaWZmIC0t
Z2l0IGEvaW5jbHVkZS9kcm0vZHJtX2Nvbm5lY3Rvci5oIGIvaW5jbHVkZS9kcm0vZHJtX2Nvbm5l
Y3Rvci5oCmluZGV4IDBiOTk5N2UyNzY4OS4uNjgxY2I1OTBmOTUyIDEwMDY0NAotLS0gYS9pbmNs
dWRlL2RybS9kcm1fY29ubmVjdG9yLmgKKysrIGIvaW5jbHVkZS9kcm0vZHJtX2Nvbm5lY3Rvci5o
CkBAIC01NDMsOCArNTQzLDggQEAgc3RydWN0IGRybV9jb25uZWN0b3Jfc3RhdGUgewogCSAqCiAJ
ICogVGhpcyBpcyBhbHNvIHVzZWQgaW4gdGhlIGF0b21pYyBoZWxwZXJzIHRvIG1hcCBlbmNvZGVy
cyB0byB0aGVpcgogCSAqIGN1cnJlbnQgYW5kIHByZXZpb3VzIGNvbm5lY3RvcnMsIHNlZQotCSAq
ICZkcm1fYXRvbWljX2dldF9vbGRfY29ubmVjdG9yX2Zvcl9lbmNvZGVyKCkgYW5kCi0JICogJmRy
bV9hdG9taWNfZ2V0X25ld19jb25uZWN0b3JfZm9yX2VuY29kZXIoKS4KKwkgKiBkcm1fYXRvbWlj
X2dldF9vbGRfY29ubmVjdG9yX2Zvcl9lbmNvZGVyKCkgYW5kCisJICogZHJtX2F0b21pY19nZXRf
bmV3X2Nvbm5lY3Rvcl9mb3JfZW5jb2RlcigpLgogCSAqCiAJICogTk9URTogQXRvbWljIGRyaXZl
cnMgbXVzdCBmaWxsIHRoaXMgb3V0IChlaXRoZXIgdGhlbXNlbHZlcyBvciB0aHJvdWdoCiAJICog
aGVscGVycyksIGZvciBvdGhlcndpc2UgdGhlIEdFVENPTk5FQ1RPUiBhbmQgR0VURU5DT0RFUiBJ
T0NUTHMgd2lsbAotLSAKU2VhbiBQYXVsLCBTb2Z0d2FyZSBFbmdpbmVlciwgR29vZ2xlIC8gQ2hy
b21pdW0gT1MKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpo
dHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
