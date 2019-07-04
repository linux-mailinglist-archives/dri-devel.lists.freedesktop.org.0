Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BB855FA51
	for <lists+dri-devel@lfdr.de>; Thu,  4 Jul 2019 16:51:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8FE746E35B;
	Thu,  4 Jul 2019 14:51:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x543.google.com (mail-ed1-x543.google.com
 [IPv6:2a00:1450:4864:20::543])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E06856E35B
 for <dri-devel@lists.freedesktop.org>; Thu,  4 Jul 2019 14:51:01 +0000 (UTC)
Received: by mail-ed1-x543.google.com with SMTP id i11so5678655edq.0
 for <dri-devel@lists.freedesktop.org>; Thu, 04 Jul 2019 07:51:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=y0xwVUQwdEb+LRMLRSyBWho/aMizf/qt1VL7C3LPVNE=;
 b=fwgg/GNFeipPn3onM7vo7xyvwL9g6jlpWJph8aPVFKbFxMR+qiY28c1EyRbkk/Ouhv
 RyFRlAdzbADDlgVy0kEGB4uIsF2QAIOKGuLBhuiiCXKF4aUtl7uqaugU0mB/PFmE20wR
 /y3oNS5qO8Pc15Wjzpbd9FxO6rsI/9Zpa2ehQ+MKajB6zb+5FfI+lqeHHmUWPXZaUYN0
 gJptm4U38B65SnzlMly6hWGKylNSQMBmbcKvJoF2I79TiNKZ8biYv+dUt/OlyDNRvujl
 tlkgME7iqojkHkvEDqKlo/cJyzXKL7HcSbJhFQRUhy5F73ye2r8op3Re2/zcQcAxdpPL
 F4zQ==
X-Gm-Message-State: APjAAAXFqIlso61N7heIMkRaNl9Onr43Lvm14lFSlVG+fE0sfVAbVIH5
 HFeQEQAE75OsnLryHqs9bLGYXpOAfKs=
X-Google-Smtp-Source: APXvYqxWnmjtJJrs+YPT2OwLdrg5/6+Ag02+ie0ifua6Sp2DMGUM/RROr/wGOYxRzvDI3L4M5pX9/A==
X-Received: by 2002:a05:6402:6cb:: with SMTP id
 n11mr49595971edy.101.1562251860249; 
 Thu, 04 Jul 2019 07:51:00 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:569e:0:3106:d637:d723:e855])
 by smtp.gmail.com with ESMTPSA id e10sm1123567ejx.89.2019.07.04.07.50.58
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Thu, 04 Jul 2019 07:50:59 -0700 (PDT)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: DRI Development <dri-devel@lists.freedesktop.org>
Subject: [PATCH] drm/doc: Document kapi doc expectations
Date: Thu,  4 Jul 2019 16:50:54 +0200
Message-Id: <20190704145054.5701-1-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190625203644.4423-1-daniel.vetter@ffwll.ch>
References: <20190625203644.4423-1-daniel.vetter@ffwll.ch>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=y0xwVUQwdEb+LRMLRSyBWho/aMizf/qt1VL7C3LPVNE=;
 b=cP6510ihpdslu9NGQ3J/Q3Di5SYS0sFDdYezt/pAc8jDe5CPI8v3zu1g0UIQikaT/M
 MCWbOCfE6wJSDGqSxu3VmH49UWhnHlBY3mypnIrGPYviYZDPhH4FibvmWwuu2PYx3ZXh
 cX1QjyMgLdgymeH/uxo08snmMX+JpdbaFmrHk=
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
Cc: Sam Ravnborg <sam@ravnborg.org>, Maxime Ripard <maxime.ripard@bootlin.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>, David Airlie <airlied@linux.ie>,
 Jani Nikula <jani.nikula@intel.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Daniel Vetter <daniel.vetter@intel.com>, Sean Paul <sean@poorly.run>,
 Emil Velikov <emil.velikov@collabora.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

V2UndmUgaGFkIHRoaXMgYWxyZWFkeSBmb3IgYW55dGhpbmcgbmV3LiBXaXRoIG15IGRybV9wcmlt
ZS5jIGNsZWFudXAgSQphbHNvIHRoaW5rIGRvY3VtZW50YXRpb24gZm9yIGV2ZXJ5dGhpbmcgYWxy
ZWFkeSBleGlzdGluZyBpcyBjb21wbGV0ZSwKYW5kIHdlIGNhbiBiYWtlIHRoaXMgaW4gYXMgYSBy
ZXF1aXJlbWVudHMgc3Vic3lzdGVtIHdpZGUuCgp2MjogSW1wcm92ZSB3b3JkaW5nIGEgYml0IChM
YXVyZW50KSwgZml4IHR5cG8gaW4gY29tbWl0IG1lc3NhZ2UgKFNhbSkuCgpBY2tlZC1ieTogRW1p
bCBWZWxpa292IDxlbWlsLnZlbGlrb3ZAY29sbGFib3JhLmNvbT4KQWNrZWQtYnk6IFNlYW4gUGF1
bCA8c2VhbkBwb29ybHkucnVuPgpBY2tlZC1ieTogTGF1cmVudCBQaW5jaGFydCA8bGF1cmVudC5w
aW5jaGFydEBpZGVhc29uYm9hcmQuY29tPgpBY2tlZC1ieTogTWF4aW1lIFJpcGFyZCA8bWF4aW1l
LnJpcGFyZEBib290bGluLmNvbT4KQWNrZWQtYnk6IFNhbSBSYXZuYm9yZyA8c2FtQHJhdm5ib3Jn
Lm9yZz4KQWNrZWQtYnk6IEphbmkgTmlrdWxhIDxqYW5pLm5pa3VsYUBpbnRlbC5jb20+ClNpZ25l
ZC1vZmYtYnk6IERhbmllbCBWZXR0ZXIgPGRhbmllbC52ZXR0ZXJAaW50ZWwuY29tPgpDYzogTGF1
cmVudCBQaW5jaGFydCA8bGF1cmVudC5waW5jaGFydEBpZGVhc29uYm9hcmQuY29tPgpDYzogSmFu
aSBOaWt1bGEgPGphbmkubmlrdWxhQGxpbnV4LmludGVsLmNvbT4KQ2M6IERhdmlkIEFpcmxpZSA8
YWlybGllZEBsaW51eC5pZT4KQ2M6IERhbmllbCBWZXR0ZXIgPGRhbmllbEBmZndsbC5jaD4KQ2M6
IE1hYXJ0ZW4gTGFua2hvcnN0IDxtYWFydGVuLmxhbmtob3JzdEBsaW51eC5pbnRlbC5jb20+CkNj
OiBNYXhpbWUgUmlwYXJkIDxtYXhpbWUucmlwYXJkQGJvb3RsaW4uY29tPgpDYzogU2VhbiBQYXVs
IDxzZWFuQHBvb3JseS5ydW4+Ci0tLQogRG9jdW1lbnRhdGlvbi9ncHUvaW50cm9kdWN0aW9uLnJz
dCB8IDE2ICsrKysrKysrKysrKysrKysKIERvY3VtZW50YXRpb24vZ3B1L3RvZG8ucnN0ICAgICAg
ICAgfCAxMyAtLS0tLS0tLS0tLS0tCiAyIGZpbGVzIGNoYW5nZWQsIDE2IGluc2VydGlvbnMoKyks
IDEzIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL0RvY3VtZW50YXRpb24vZ3B1L2ludHJvZHVj
dGlvbi5yc3QgYi9Eb2N1bWVudGF0aW9uL2dwdS9pbnRyb2R1Y3Rpb24ucnN0CmluZGV4IGZjY2Jl
Mzc1MjQ0ZC4uMjVhNTZlOWMwY2ZkIDEwMDY0NAotLS0gYS9Eb2N1bWVudGF0aW9uL2dwdS9pbnRy
b2R1Y3Rpb24ucnN0CisrKyBiL0RvY3VtZW50YXRpb24vZ3B1L2ludHJvZHVjdGlvbi5yc3QKQEAg
LTUxLDYgKzUxLDIyIEBAIGFuZCAiRklYTUUiIHdoZXJlIHRoZSBpbnRlcmZhY2UgY291bGQgYmUg
Y2xlYW5lZCB1cC4KIAogQWxzbyByZWFkIHRoZSA6cmVmOmBndWlkZWxpbmVzIGZvciB0aGUga2Vy
bmVsIGRvY3VtZW50YXRpb24gYXQgbGFyZ2UgPGRvY19ndWlkZT5gLgogCitEb2N1bWVudGF0aW9u
IFJlcXVpcmVtZW50cyBmb3Iga0FQSQorLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0KKworQWxsIGtlcm5lbCBBUElzIGV4cG9ydGVkIHRvIG90aGVyIG1vZHVsZXMgbXVzdCBiZSBk
b2N1bWVudGVkLCBpbmNsdWRpbmcgdGhlaXIKK2RhdGFzdHJ1Y3R1cmVzIGFuZCBhdCBsZWFzdCBh
IHNob3J0IGludHJvZHVjdG9yeSBzZWN0aW9uIGV4cGxhaW5pbmcgdGhlIG92ZXJhbGwKK2NvbmNl
cHRzLiBEb2N1bWVudGF0aW9uIHNob3VsZCBiZSBwdXQgaW50byB0aGUgY29kZSBpdHNlbGYgYXMg
a2VybmVsZG9jIGNvbW1lbnRzCithcyBtdWNoIGFzIHJlYXNvbmFibGUuCisKK0RvIG5vdCBibGlu
ZGx5IGRvY3VtZW50IGV2ZXJ5dGhpbmcsIGJ1dCBkb2N1bWVudCBvbmx5IHdoYXQncyByZWxldmFu
dCBmb3IgZHJpdmVyCithdXRob3JzOiBJbnRlcm5hbCBmdW5jdGlvbnMgb2YgZHJtLmtvIGFuZCBk
ZWZpbml0ZWx5IHN0YXRpYyBmdW5jdGlvbnMgc2hvdWxkIG5vdAoraGF2ZSBmb3JtYWwga2VybmVs
ZG9jIGNvbW1lbnRzLiBVc2Ugbm9ybWFsIEMgY29tbWVudHMgaWYgeW91IGZlZWwgbGlrZSBhIGNv
bW1lbnQKK2lzIHdhcnJhbnRlZC4gWW91IG1heSB1c2Uga2VybmVsZG9jIHN5bnRheCBpbiB0aGUg
Y29tbWVudCwgYnV0IGl0IHNoYWxsIG5vdAorc3RhcnQgd2l0aCBhIC8qKiBrZXJuZWxkb2MgbWFy
a2VyLiBTaW1pbGFyIGZvciBkYXRhIHN0cnVjdHVyZXMsIGFubm90YXRlCithbnl0aGluZyBlbnRp
cmVseSBwcml2YXRlIHdpdGggYGAvKiBwcml2YXRlOiAqL2BgIGNvbW1lbnRzIGFzIHBlciB0aGUK
K2RvY3VtZW50YXRpb24gZ3VpZGUuCisKIEdldHRpbmcgU3RhcnRlZAogPT09PT09PT09PT09PT09
CiAKZGlmZiAtLWdpdCBhL0RvY3VtZW50YXRpb24vZ3B1L3RvZG8ucnN0IGIvRG9jdW1lbnRhdGlv
bi9ncHUvdG9kby5yc3QKaW5kZXggZTcxN2YyODBmOWFlLi5kYjg4OTY5YTU2ZWUgMTAwNjQ0Ci0t
LSBhL0RvY3VtZW50YXRpb24vZ3B1L3RvZG8ucnN0CisrKyBiL0RvY3VtZW50YXRpb24vZ3B1L3Rv
ZG8ucnN0CkBAIC0zMDEsMTkgKzMwMSw2IEBAIEluIHRoZSBlbmQgbm8gLmMgZmlsZSBzaG91bGQg
bmVlZCB0byBpbmNsdWRlIGBgZHJtUC5oYGAgYW55bW9yZS4KIAogQ29udGFjdDogRGFuaWVsIFZl
dHRlcgogCi1BZGQgbWlzc2luZyBrZXJuZWxkb2MgZm9yIGV4cG9ydGVkIGZ1bmN0aW9ucwotLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0KLQotVGhlIERSTSByZWZl
cmVuY2UgZG9jdW1lbnRhdGlvbiBpcyBzdGlsbCBsYWNraW5nIGtlcm5lbGRvYyBpbiBhIGZldyBh
cmVhcy4gVGhlCi10YXNrIHdvdWxkIGJlIHRvIGNsZWFuIHVwIGludGVyZmFjZXMgbGlrZSBtb3Zp
bmcgZnVuY3Rpb25zIGFyb3VuZCBiZXR3ZWVuCi1maWxlcyB0byBiZXR0ZXIgZ3JvdXAgdGhlbSBh
bmQgaW1wcm92aW5nIHRoZSBpbnRlcmZhY2VzIGxpa2UgZHJvcHBpbmcgcmV0dXJuCi12YWx1ZXMg
Zm9yIGZ1bmN0aW9ucyB0aGF0IG5ldmVyIGZhaWwuIFRoZW4gd3JpdGUga2VybmVsZG9jIGZvciBh
bGwgZXhwb3J0ZWQKLWZ1bmN0aW9ucyBhbmQgYW4gb3ZlcnZpZXcgc2VjdGlvbiBhbmQgaW50ZWdy
YXRlIGl0IGFsbCBpbnRvIHRoZSBkcm0gYm9vay4KLQotU2VlIGh0dHBzOi8vZHJpLmZyZWVkZXNr
dG9wLm9yZy9kb2NzL2RybS8gZm9yIHdoYXQncyB0aGVyZSBhbHJlYWR5LgotCi1Db250YWN0OiBE
YW5pZWwgVmV0dGVyCi0KIE1ha2UgcGFuaWMgaGFuZGxpbmcgd29yawogLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tCiAKLS0gCjIuMjAuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGlu
Zm8vZHJpLWRldmVs
