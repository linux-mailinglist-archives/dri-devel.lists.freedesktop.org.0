Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D55A558F2
	for <lists+dri-devel@lfdr.de>; Tue, 25 Jun 2019 22:36:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 830FB6E21B;
	Tue, 25 Jun 2019 20:36:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com
 [IPv6:2a00:1450:4864:20::529])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EC0BE6E21B
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Jun 2019 20:36:51 +0000 (UTC)
Received: by mail-ed1-x529.google.com with SMTP id k8so29096273eds.7
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Jun 2019 13:36:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=pMHQ+TZrfDndG6QbjiyPnZBt+ORF/C2d3e2WSt7CNIo=;
 b=hYxpSxtFUhz3hW+4GYZqtbo9eu97xZPSz01DOl1AFwttbcw0q/fdR7YbexrH04bl0M
 0uwu0OYYZUxqzUtnZsg3w4X9vyr6xrqWWHHPgaxyxhtgRbOQtf5UCpiHalZL2IAuV6Yl
 m06VIJmPfJbhAoXCZVJ235AzYzVN0buiD0iP+0DCPCyubtpsEBhrjfLKb0NWy/72xPdN
 WPvirOwdPAIyfeYoUnAyBzZ/JVulWWbsdVK9ERujVVuvexVmtDxuX6tqNt6EgqU9faXv
 m51Iq1p51KlzxNT3JuHljPgvAkmDBNGR2GNzeXipJKxAD4WZwTmEhJ5WuDWoobCpo48c
 ceTg==
X-Gm-Message-State: APjAAAWh7k8SY7V2cdQrfXXMr3OHSPZJ3xjc0kzqAmdT5u84da0HbTf0
 0/pVYn4Z9F0DZH2Gv7PMAODFqvs9aZ4=
X-Google-Smtp-Source: APXvYqwgrUQ+eIIAw8p4XwzdrtlsNL1yJ9tgxVYOS6THZcB5RJfy13SvDC15ma+SVh5qy3JXVMTMUA==
X-Received: by 2002:a17:906:553:: with SMTP id k19mr437879eja.73.1561495010328; 
 Tue, 25 Jun 2019 13:36:50 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:569e:0:3106:d637:d723:e855])
 by smtp.gmail.com with ESMTPSA id m39sm3557282edm.96.2019.06.25.13.36.48
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Tue, 25 Jun 2019 13:36:49 -0700 (PDT)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: DRI Development <dri-devel@lists.freedesktop.org>
Subject: [PATCH] drm/doc: Document kapi doc expectations
Date: Tue, 25 Jun 2019 22:36:44 +0200
Message-Id: <20190625203644.4423-1-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=pMHQ+TZrfDndG6QbjiyPnZBt+ORF/C2d3e2WSt7CNIo=;
 b=TEGKjH/FcCV5hCCZc4FaJfW6gWmhemLMo+Sm2ChRm84G6ONQnPuEfQnkN5EhkQLPUb
 tydh0ftblxkwJPtX90uH90T9ffxSxyG5z4tql2TNMPceo7rN27uc2hVdReglJCCSKwhy
 rtUgF6NJDE0Y0rAokxGkA83ArtKstDZhOZ2s4=
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
Cc: Maxime Ripard <maxime.ripard@bootlin.com>,
 Jani Nikula <jani.nikula@intel.com>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 David Airlie <airlied@linux.ie>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Daniel Vetter <daniel.vetter@intel.com>, Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

V2UndmUgaGFkIHRoaXMgYWxyZWFkeSBmb3IgYW55dGhpbmcgbmV3LiBXaXRoIG15IGRybV9wcmlt
ZS5jIGNsZWFudXAgSQphbHNvIHRoaW5rIGRvY3VtZW50YXRpb25zIGZvciBldmVyeXRoaW5nIGFs
cmVhZHkgZXhpc3RpbmcgaXMgY29tcGxldGUsCmFuZCB3ZSBjYW4gYmFrZSB0aGlzIGluIGFzIGEg
cmVxdWlyZW1lbnRzIHN1YnN5c3RlbSB3aWRlLgoKQWNrZWQtYnk6IEphbmkgTmlrdWxhIDxqYW5p
Lm5pa3VsYUBpbnRlbC5jb20+ClNpZ25lZC1vZmYtYnk6IERhbmllbCBWZXR0ZXIgPGRhbmllbC52
ZXR0ZXJAaW50ZWwuY29tPgpDYzogTGF1cmVudCBQaW5jaGFydCA8bGF1cmVudC5waW5jaGFydEBp
ZGVhc29uYm9hcmQuY29tPgpDYzogSmFuaSBOaWt1bGEgPGphbmkubmlrdWxhQGxpbnV4LmludGVs
LmNvbT4KQ2M6IERhdmlkIEFpcmxpZSA8YWlybGllZEBsaW51eC5pZT4KQ2M6IERhbmllbCBWZXR0
ZXIgPGRhbmllbEBmZndsbC5jaD4KQ2M6IE1hYXJ0ZW4gTGFua2hvcnN0IDxtYWFydGVuLmxhbmto
b3JzdEBsaW51eC5pbnRlbC5jb20+CkNjOiBNYXhpbWUgUmlwYXJkIDxtYXhpbWUucmlwYXJkQGJv
b3RsaW4uY29tPgpDYzogU2VhbiBQYXVsIDxzZWFuQHBvb3JseS5ydW4+Ci0tLQpyZXNlbmRpbmcg
c3RhbmQtYWxvbmUgZm9yIG1vcmUgdmlzaWJpbGl0eSBhbmQgYS1iIGdhdGhlcmluZy4KLURhbmll
bAotLS0KIERvY3VtZW50YXRpb24vZ3B1L2ludHJvZHVjdGlvbi5yc3QgfCAxMyArKysrKysrKysr
KysrCiBEb2N1bWVudGF0aW9uL2dwdS90b2RvLnJzdCAgICAgICAgIHwgMTMgLS0tLS0tLS0tLS0t
LQogMiBmaWxlcyBjaGFuZ2VkLCAxMyBpbnNlcnRpb25zKCspLCAxMyBkZWxldGlvbnMoLSkKCmRp
ZmYgLS1naXQgYS9Eb2N1bWVudGF0aW9uL2dwdS9pbnRyb2R1Y3Rpb24ucnN0IGIvRG9jdW1lbnRh
dGlvbi9ncHUvaW50cm9kdWN0aW9uLnJzdAppbmRleCBmY2NiZTM3NTI0NGQuLmE5NGFkNmFkMWY1
NCAxMDA2NDQKLS0tIGEvRG9jdW1lbnRhdGlvbi9ncHUvaW50cm9kdWN0aW9uLnJzdAorKysgYi9E
b2N1bWVudGF0aW9uL2dwdS9pbnRyb2R1Y3Rpb24ucnN0CkBAIC01MSw2ICs1MSwxOSBAQCBhbmQg
IkZJWE1FIiB3aGVyZSB0aGUgaW50ZXJmYWNlIGNvdWxkIGJlIGNsZWFuZWQgdXAuCiAKIEFsc28g
cmVhZCB0aGUgOnJlZjpgZ3VpZGVsaW5lcyBmb3IgdGhlIGtlcm5lbCBkb2N1bWVudGF0aW9uIGF0
IGxhcmdlIDxkb2NfZ3VpZGU+YC4KIAorRG9jdW1lbnRhdGlvbiBSZXF1aXJlbWVudHMgZm9yIGtB
UEkKKy0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tCisKK0FsbCBrZXJuZWwgQVBJ
cyBleHBvcnRlZCB0byBvdGhlciBtb2R1bGVzIG11c3QgYmUgZG9jdW1lbnRlZCwgaW5jbHVkaW5n
IHRoZWlyCitkYXRhc3RydWN0dXJlcyBhbmQgYXQgbGVhc3QgYSBzaG9ydCBpbnRyb2R1Y3Rvcnkg
c2VjdGlvbiBleHBsYWluaW5nIHRoZSBvdmVyYWxsCitjb25jZXB0cy4gRG9jdW1lbnRhdGlvbiBz
aG91bGQgYmUgcHV0IGludG8gdGhlIGNvZGUgaXRzZWxmIGFzIGtlcm5lbGRvYyBjb21tZW50cwor
YXMgbXVjaCBhcyByZWFzb25hYmxlLiBEbyBub3QgYmxpbmRseSBkb2N1bWVudCBldmVyeXRoaW5n
LCBidXQgZG9jdW1lbnQgb25seQord2hhdCdzIHJlbGV2YW50IGZvciBkcml2ZXIgYXV0aG9yczog
SW50ZXJuYWwgZnVuY3Rpb25zIG9mIGRybS5rbyBhbmQgZGVmaW5pdGVseQorc3RhdGljIGZ1bmN0
aW9ucyBzaG91bGQgbm90IGhhdmUgZm9ybWFsIGtlcm5lbGRvYyBjb21tZW50cy4gVXNlIG5vcm1h
bCBDCitjb21tZW50cyBpZiB5b3UgZmVlbCBsaWtlIGEgY29tbWVudCBpcyB3YXJyYW50ZWQuIFNp
bWlsYXIgZm9yIGRhdGEgc3RydWN0dXJlcywKK2Fubm90YXRlIGFueXRoaW5nIGVudGlyZWx5IHBy
aXZhdGUgd2l0aCBgYC8qIHByaXZhdGU6ICovYGAgY29tbWVudHMgYXMgcGVyIHRoZQorZG9jdW1l
bnRhdGlvbiBndWlkZS4KKwogR2V0dGluZyBTdGFydGVkCiA9PT09PT09PT09PT09PT0KIApkaWZm
IC0tZ2l0IGEvRG9jdW1lbnRhdGlvbi9ncHUvdG9kby5yc3QgYi9Eb2N1bWVudGF0aW9uL2dwdS90
b2RvLnJzdAppbmRleCBlNzE3ZjI4MGY5YWUuLmRiODg5NjlhNTZlZSAxMDA2NDQKLS0tIGEvRG9j
dW1lbnRhdGlvbi9ncHUvdG9kby5yc3QKKysrIGIvRG9jdW1lbnRhdGlvbi9ncHUvdG9kby5yc3QK
QEAgLTMwMSwxOSArMzAxLDYgQEAgSW4gdGhlIGVuZCBubyAuYyBmaWxlIHNob3VsZCBuZWVkIHRv
IGluY2x1ZGUgYGBkcm1QLmhgYCBhbnltb3JlLgogCiBDb250YWN0OiBEYW5pZWwgVmV0dGVyCiAK
LUFkZCBtaXNzaW5nIGtlcm5lbGRvYyBmb3IgZXhwb3J0ZWQgZnVuY3Rpb25zCi0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQotCi1UaGUgRFJNIHJlZmVyZW5jZSBk
b2N1bWVudGF0aW9uIGlzIHN0aWxsIGxhY2tpbmcga2VybmVsZG9jIGluIGEgZmV3IGFyZWFzLiBU
aGUKLXRhc2sgd291bGQgYmUgdG8gY2xlYW4gdXAgaW50ZXJmYWNlcyBsaWtlIG1vdmluZyBmdW5j
dGlvbnMgYXJvdW5kIGJldHdlZW4KLWZpbGVzIHRvIGJldHRlciBncm91cCB0aGVtIGFuZCBpbXBy
b3ZpbmcgdGhlIGludGVyZmFjZXMgbGlrZSBkcm9wcGluZyByZXR1cm4KLXZhbHVlcyBmb3IgZnVu
Y3Rpb25zIHRoYXQgbmV2ZXIgZmFpbC4gVGhlbiB3cml0ZSBrZXJuZWxkb2MgZm9yIGFsbCBleHBv
cnRlZAotZnVuY3Rpb25zIGFuZCBhbiBvdmVydmlldyBzZWN0aW9uIGFuZCBpbnRlZ3JhdGUgaXQg
YWxsIGludG8gdGhlIGRybSBib29rLgotCi1TZWUgaHR0cHM6Ly9kcmkuZnJlZWRlc2t0b3Aub3Jn
L2RvY3MvZHJtLyBmb3Igd2hhdCdzIHRoZXJlIGFscmVhZHkuCi0KLUNvbnRhY3Q6IERhbmllbCBW
ZXR0ZXIKLQogTWFrZSBwYW5pYyBoYW5kbGluZyB3b3JrCiAtLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0KIAotLSAKMi4yMC4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3Rv
cC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmkt
ZGV2ZWw=
