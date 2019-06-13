Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3452C43748
	for <lists+dri-devel@lfdr.de>; Thu, 13 Jun 2019 16:39:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B233989ABA;
	Thu, 13 Jun 2019 14:39:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x742.google.com (mail-qk1-x742.google.com
 [IPv6:2607:f8b0:4864:20::742])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 15D2189AB7
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Jun 2019 14:39:49 +0000 (UTC)
Received: by mail-qk1-x742.google.com with SMTP id a27so12890482qkk.5
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Jun 2019 07:39:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
 :content-disposition:user-agent;
 bh=eeggBv1YfvUT3ArHHA9PsjFeEZBhCSFSSzgQimtYRXc=;
 b=Vq7d+Gg2CGSzl7f6r2QPWmw2calxl+fusI05t47nPqhlicMu1JiYvyR5fiQBNYI5sA
 9EPWzyUVsWgJv68+2pe+lxugwPGN2PNwMMOAogMTYtGq0omrEZj4rXaRMBlz5oPX3Ckr
 CwPS5K6Jrjeq/E7cgr5sNEdpPh1OfAnM1N0y5ZLTOsBubFWEs8Q8wi5LaQpjfhXhtrAZ
 v1MB5NPjKdYKfyFPSnfK91wTgxEwyAEMvyMqpJefDsdR8V4zVIv6E/f9raPogLOod28Y
 B+lfPZOVvKB4yiCCUK3l27W9k76O5NKvRthNui+Wakfy2/qkjA8ZyTPXxAHiiQG7q+eK
 XqCQ==
X-Gm-Message-State: APjAAAUaoAjoNdztyIS/MDlNL1RStFZVPVXDsUvOFswi+y2hu1kpGrJf
 tAA5xKSTSBPGIyZfi0ALAabOcw==
X-Google-Smtp-Source: APXvYqyu1+/pOr85VSsvQjjCOn6sw9455mPGr48Mj8CefOxTps5FUmzim8aBVOCJhIOWxSww8S92cA==
X-Received: by 2002:a05:620a:522:: with SMTP id
 h2mr43913748qkh.329.1560436788101; 
 Thu, 13 Jun 2019 07:39:48 -0700 (PDT)
Received: from localhost ([2620:0:1013:11:89c6:2139:5435:371d])
 by smtp.gmail.com with ESMTPSA id t67sm1639137qkf.34.2019.06.13.07.39.47
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Thu, 13 Jun 2019 07:39:47 -0700 (PDT)
Date: Thu, 13 Jun 2019 10:39:46 -0400
From: Sean Paul <sean@poorly.run>
To: Dave Airlie <airlied@gmail.com>, Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: [PULL] drm-misc-fixes
Message-ID: <20190613143946.GA24233@art_vandelay>
MIME-Version: 1.0
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=poorly.run; s=google;
 h=date:from:to:cc:subject:message-id:mime-version:content-disposition
 :user-agent;
 bh=eeggBv1YfvUT3ArHHA9PsjFeEZBhCSFSSzgQimtYRXc=;
 b=Ndt1nZfan9vNtYvhkSe+8XSeySKKsPAG/Ugpb2s2fk9ME40DxbIxLgz5PN5X/iFmmR
 udsWFmBeEm0Vcjiw1ofAaqTpM7kKV7i6GdQ6ID3IA8lFhOOi9FyhMMa/MVdhmwOwvhMy
 Pi5HzL9jhrEHasYY6v4G2FvV38iqVK7Ljow1l/FmYrqdO9MxNiF8dTPAB6mLACSyN4Sq
 j2a+9Vd9VaLaDceHTFS0Xe5B1kHw0oMTgusXTUrv3TL+J7LZFl9RmV8m8LRPEBpyeHpR
 rWFNevlW8PmWTdreCnq+gLW6D89VEs06VEl69zyaIqhreSb11dSIaOpwWVq+NgpY+nmC
 SDhg==
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
Cc: Jani Nikula <jani.nikula@intel.com>, dim-tools@lists.freedesktop.org,
 Neil Armstrong <narmstrong@baylibre.com>,
 Maxime Ripard <maxime.ripard@bootlin.com>,
 Ezequiel Garcia <ezequiel@collabora.com>, intel-gfx@lists.freedesktop.org,
 Hans de Goede <hdegoede@redhat.com>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 dri-devel@lists.freedesktop.org, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

CkhpIERhLiosCkEgYml0IG1vcmUgbWVhdCBvbiB0aGlzIFBSLCB3aGljaCBzaG91bGQgcHJvYmFi
bHkgYmUgZXhwZWN0ZWQgZ2l2ZW4gaG93IGxpZ2h0IHdlCmhhdmUgYmVlbiBvbiB0aGUgbGFzdCA0
LgoKCmRybS1taXNjLWZpeGVzLTIwMTktMDYtMTM6Cm1lc29uOiBBIGZldyBHMTJBIGZpeGVzIGFj
cm9zcyB0aGUgZHJpdmVyIChOZWlsKQpxdWlya3M6IEEgY291cGxlIHF1aXJrcyBmb3IgR1BEIGRl
dmljZXMgKEhhbnMpCmdlbV9zaG1lbTogVXNlIHdyaXRlY29tYmluZSB3aGVuIHZtYXBwaW5nIG5v
bi1kbWFidWYgQk9zIChCb3JpcykKcGFuZnJvc3Q6IEEgY291cGxlIHR3ZWFrcyB0byByZXF1aXJp
bmcgZGV2ZnJlcSAoTmVpbCAmIEV6ZXF1aWVsKQplZGlkOiBFbnN1cmUgd2UgcmV0dXJuIHRoZSBv
dmVycmlkZSBtb2RlIHdoZW4gZGRjIHByb2JlIGZhaWxzIChKYW5pKQoKQ2M6IEhhbnMgZGUgR29l
ZGUgPGhkZWdvZWRlQHJlZGhhdC5jb20+CkNjOiBOZWlsIEFybXN0cm9uZyA8bmFybXN0cm9uZ0Bi
YXlsaWJyZS5jb20+CkNjOiBCb3JpcyBCcmV6aWxsb24gPGJvcmlzLmJyZXppbGxvbkBjb2xsYWJv
cmEuY29tPgpDYzogRXplcXVpZWwgR2FyY2lhIDxlemVxdWllbEBjb2xsYWJvcmEuY29tPgpDYzog
SmFuaSBOaWt1bGEgPGphbmkubmlrdWxhQGludGVsLmNvbT4KCkNoZWVycywgU2VhbgoKClRoZSBm
b2xsb3dpbmcgY2hhbmdlcyBzaW5jZSBjb21taXQgMjgzZjFlMzgzZTkxZDk2ZmU2NTJmYWQ1NDk1
MzdhZTE1Y2YzMWQ2MDoKCiAgdWRtYWJ1ZjogYWN0dWFsbHkgdW5tYXAgdGhlIHNjYXR0ZXJsaXN0
ICgyMDE5LTA2LTA1IDEwOjQxOjE3ICswMjAwKQoKYXJlIGF2YWlsYWJsZSBpbiB0aGUgR2l0IHJl
cG9zaXRvcnkgYXQ6CgogIGdpdDovL2Fub25naXQuZnJlZWRlc2t0b3Aub3JnL2RybS9kcm0tbWlz
YyB0YWdzL2RybS1taXNjLWZpeGVzLTIwMTktMDYtMTMKCmZvciB5b3UgdG8gZmV0Y2ggY2hhbmdl
cyB1cCB0byA0OGVhZWI3NjY0Yzc2MTM5NDM4NzI0ZDUyMGExZWE0YTg0YTNlZDkyOgoKICBkcm06
IGFkZCBmYWxsYmFjayBvdmVycmlkZS9maXJtd2FyZSBFRElEIG1vZGVzIHdvcmthcm91bmQgKDIw
MTktMDYtMTIgMTM6MjY6MjUgKzAzMDApCgotLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tCm1lc29uOiBBIGZldyBHMTJBIGZpeGVz
IGFjcm9zcyB0aGUgZHJpdmVyIChOZWlsKQpxdWlya3M6IEEgY291cGxlIHF1aXJrcyBmb3IgR1BE
IGRldmljZXMgKEhhbnMpCmdlbV9zaG1lbTogVXNlIHdyaXRlY29tYmluZSB3aGVuIHZtYXBwaW5n
IG5vbi1kbWFidWYgQk9zIChCb3JpcykKcGFuZnJvc3Q6IEEgY291cGxlIHR3ZWFrcyB0byByZXF1
aXJpbmcgZGV2ZnJlcSAoTmVpbCAmIEV6ZXF1aWVsKQplZGlkOiBFbnN1cmUgd2UgcmV0dXJuIHRo
ZSBvdmVycmlkZSBtb2RlIHdoZW4gZGRjIHByb2JlIGZhaWxzIChKYW5pKQoKQ2M6IEhhbnMgZGUg
R29lZGUgPGhkZWdvZWRlQHJlZGhhdC5jb20+CkNjOiBOZWlsIEFybXN0cm9uZyA8bmFybXN0cm9u
Z0BiYXlsaWJyZS5jb20+CkNjOiBCb3JpcyBCcmV6aWxsb24gPGJvcmlzLmJyZXppbGxvbkBjb2xs
YWJvcmEuY29tPgpDYzogRXplcXVpZWwgR2FyY2lhIDxlemVxdWllbEBjb2xsYWJvcmEuY29tPgpD
YzogSmFuaSBOaWt1bGEgPGphbmkubmlrdWxhQGludGVsLmNvbT4KCi0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0KQm9yaXMgQnJl
emlsbG9uICgxKToKICAgICAgZHJtL2dlbV9zaG1lbTogVXNlIGEgd3JpdGVjb21iaW5lIG1hcHBp
bmcgZm9yIC0+dmFkZHIKCkV6ZXF1aWVsIEdhcmNpYSAoMSk6CiAgICAgIGRybS9wYW5mcm9zdDog
UmVxdWlyZSB0aGUgc2ltcGxlX29uZGVtYW5kIGdvdmVybm9yCgpIYW5zIGRlIEdvZWRlICgyKToK
ICAgICAgZHJtOiBwYW5lbC1vcmllbnRhdGlvbi1xdWlya3M6IEFkZCBxdWlyayBmb3IgR1BEIHBv
Y2tldDIKICAgICAgZHJtOiBwYW5lbC1vcmllbnRhdGlvbi1xdWlya3M6IEFkZCBxdWlyayBmb3Ig
R1BEIE1pY3JvUEMKCkphbmkgTmlrdWxhICgyKToKICAgICAgZHJtL2VkaWQ6IGFic3RyYWN0IG92
ZXJyaWRlL2Zpcm13YXJlIEVESUQgcmV0cmlldmFsCiAgICAgIGRybTogYWRkIGZhbGxiYWNrIG92
ZXJyaWRlL2Zpcm13YXJlIEVESUQgbW9kZXMgd29ya2Fyb3VuZAoKTmVpbCBBcm1zdHJvbmcgKDQp
OgogICAgICBkcm0vbWVzb246IGZpeCBHMTJBIEhETUkgUExMIHNldHRpbmdzIGZvciA0SzYwIDEw
MDAvMTAwMSB2YXJpYXRpb25zCiAgICAgIGRybS9tZXNvbjogZml4IHByaW1hcnkgcGxhbmUgZGlz
YWJsaW5nCiAgICAgIGRybS9tZXNvbjogZml4IEcxMkEgcHJpbWFyeSBwbGFuZSBkaXNhYmxpbmcK
ICAgICAgZHJtL3BhbmZyb3N0OiBtYWtlIGRldmZyZXEgb3B0aW9uYWwgYWdhaW4KCiBkcml2ZXJz
L2dwdS9kcm0vZHJtX2VkaWQuYyAgICAgICAgICAgICAgICAgICAgIHwgNTUgKysrKysrKysrKysr
KysrKysrKysrKy0tLS0KIGRyaXZlcnMvZ3B1L2RybS9kcm1fZ2VtX3NobWVtX2hlbHBlci5jICAg
ICAgICAgfCAgMyArLQogZHJpdmVycy9ncHUvZHJtL2RybV9wYW5lbF9vcmllbnRhdGlvbl9xdWly
a3MuYyB8IDMyICsrKysrKysrKysrKysrKwogZHJpdmVycy9ncHUvZHJtL2RybV9wcm9iZV9oZWxw
ZXIuYyAgICAgICAgICAgICB8ICA3ICsrKysKIGRyaXZlcnMvZ3B1L2RybS9tZXNvbi9tZXNvbl9j
cnRjLmMgICAgICAgICAgICAgfCAgNiArLS0KIGRyaXZlcnMvZ3B1L2RybS9tZXNvbi9tZXNvbl9w
bGFuZS5jICAgICAgICAgICAgfCAgOCArKy0tCiBkcml2ZXJzL2dwdS9kcm0vbWVzb24vbWVzb25f
dmNsay5jICAgICAgICAgICAgIHwgMTMgKysrKystCiBkcml2ZXJzL2dwdS9kcm0vbWVzb24vbWVz
b25fdml1LmMgICAgICAgICAgICAgIHwgIDMgKy0KIGRyaXZlcnMvZ3B1L2RybS9wYW5mcm9zdC9L
Y29uZmlnICAgICAgICAgICAgICAgfCAgMSArCiBkcml2ZXJzL2dwdS9kcm0vcGFuZnJvc3QvcGFu
ZnJvc3RfZGV2ZnJlcS5jICAgIHwgMTMgKysrKystCiBpbmNsdWRlL2RybS9kcm1fZWRpZC5oICAg
ICAgICAgICAgICAgICAgICAgICAgIHwgIDEgKwogMTEgZmlsZXMgY2hhbmdlZCwgMTIxIGluc2Vy
dGlvbnMoKyksIDIxIGRlbGV0aW9ucygtKQoKLS0gClNlYW4gUGF1bCwgU29mdHdhcmUgRW5naW5l
ZXIsIEdvb2dsZSAvIENocm9taXVtIE9TCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZy
ZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2RyaS1kZXZlbA==
