Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D248046B0B
	for <lists+dri-devel@lfdr.de>; Fri, 14 Jun 2019 22:39:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C66DE897DC;
	Fri, 14 Jun 2019 20:37:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x544.google.com (mail-ed1-x544.google.com
 [IPv6:2a00:1450:4864:20::544])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DDB1289870
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Jun 2019 20:37:28 +0000 (UTC)
Received: by mail-ed1-x544.google.com with SMTP id p26so5271146edr.2
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Jun 2019 13:37:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=yvL73GVoINdhNnVubpUzKj2ETKHlC4lNPOPbS+G8PA4=;
 b=sw9VoMNEctTuhnVJHZ0B3CqtqL41Uv/JcaTsBe4jSKShmQT1xExiSNxJrLKYqqKaJo
 0DzLhe6AkVaCneOq2oxdJQIa0aK1AM/j5jq/8bZxmsfNRpaSGIDU6RjCAvWf033k/8+n
 XhDGKESB+w7X7Ss70Qca1ckUNDoM0yy8heZq5JCe1RamlKhRP9hIEWFrosiXU01F5xUl
 0WpBMX7UrkPBayzauNeOwvdzWWFEb+AfAEJsZFIhlPIqmKQ+SuALBW1Ka355HnPn4Iau
 1xw8j2QgOdfx3Y8x0QCylGdqM+ntfD2CLp3aOwDuvXavFvqgrrPdc01Q4qNzp28zCWil
 8q8w==
X-Gm-Message-State: APjAAAWGqRyxXjBD+T/DLI6M7QVzIsRbmcBkr7+mZi3ttJRI5ffVWQTu
 VLyE18x+rozr5j4ECMoONi+LXV4OQmo=
X-Google-Smtp-Source: APXvYqwSY79Sms9DZAgKAJOgx/nmLKjgpZQTSZB/8wAoym31pj4WLJyiXKSRlom4fGdypB6cDmeQuQ==
X-Received: by 2002:a50:9590:: with SMTP id w16mr82163394eda.0.1560544646005; 
 Fri, 14 Jun 2019 13:37:26 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:569e:0:3106:d637:d723:e855])
 by smtp.gmail.com with ESMTPSA id n15sm1166672edd.49.2019.06.14.13.37.25
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Fri, 14 Jun 2019 13:37:25 -0700 (PDT)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: DRI Development <dri-devel@lists.freedesktop.org>
Subject: [PATCH 56/59] drm/todo: Update backlight todo
Date: Fri, 14 Jun 2019 22:36:12 +0200
Message-Id: <20190614203615.12639-57-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190614203615.12639-1-daniel.vetter@ffwll.ch>
References: <20190614203615.12639-1-daniel.vetter@ffwll.ch>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=yvL73GVoINdhNnVubpUzKj2ETKHlC4lNPOPbS+G8PA4=;
 b=c68BIYb/kJ1Fo6CXnbHp0PIOLUtEi7PtlwBUIDG5mvas37o9bExx14AGL3oNxu1Dmo
 voZQOH3fzYQ4IeUgZnVZVTFuSwV3zC5qZIlXtSYvXsIStFyog9Z6SkuhyuJgmhv0lpH1
 L/X2DCDrhLYPNSZrAfE/42ay/loNfCq32/6ho=
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 Daniel Vetter <daniel.vetter@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QmFzaWMgaGVscGVycyBoYXZlIGJlZW4gZXh0cmFjdGVkLCBub3cgdGhlcmUncyBhIHBpbGUgbW9y
ZSB0b2RvIHN0aWxsCmFjcm9zcyB0aGUgZW50aXJlIHRyZWUuCgpTaWduZWQtb2ZmLWJ5OiBEYW5p
ZWwgVmV0dGVyIDxkYW5pZWwudmV0dGVyQGludGVsLmNvbT4KLS0tCiBEb2N1bWVudGF0aW9uL2dw
dS90b2RvLnJzdCB8IDI3ICsrKysrKysrKysrKystLS0tLS0tLS0tLS0tLQogMSBmaWxlIGNoYW5n
ZWQsIDEzIGluc2VydGlvbnMoKyksIDE0IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL0RvY3Vt
ZW50YXRpb24vZ3B1L3RvZG8ucnN0IGIvRG9jdW1lbnRhdGlvbi9ncHUvdG9kby5yc3QKaW5kZXgg
MjFhN2I3ODAwZDNlLi5jNGU3YzA2NzJhMTQgMTAwNjQ0Ci0tLSBhL0RvY3VtZW50YXRpb24vZ3B1
L3RvZG8ucnN0CisrKyBiL0RvY3VtZW50YXRpb24vZ3B1L3RvZG8ucnN0CkBAIC00MjIsNiArNDIy
LDE5IEBAIGZpdCB0aGUgYXZhaWxhYmxlIHRpbWUuCiAKIENvbnRhY3Q6IERhbmllbCBWZXR0ZXIK
IAorQmFja2xpZ2h0IFJlZmFjdG9yaW5nCistLS0tLS0tLS0tLS0tLS0tLS0tLS0KKworQmFja2xp
Z2h0IGRyaXZlcnMgaGF2ZSBhIHRyaXBsZSBlbmFibGUvZGlzYWJsZSBzdGF0ZSwgd2hpY2ggaXMg
YSBiaXQgb3ZlcmtpbGwuCitQbGFuIHRvIGZpeCB0aGlzOgorCisxLiBSb2xsIG91dCBiYWNrbGln
aHRfZW5hYmxlKCkgYW5kIGJhY2tsaWdodF9kaXNhYmxlKCkgaGVscGVycyBldmVyeXdoZXJlLiBU
aGlzCisgICBoYXMgc3RhcnRlZCBhbHJlYWR5LgorMi4gSW4gYWxsLCBvbmx5IGxvb2sgYXQgb25l
IG9mIHRoZSB0aHJlZSBzdGF0dXMgYml0cyBzZXQgYnkgdGhlIGFib3ZlIGhlbHBlcnMuCiszLiBS
ZW1vdmUgdGhlIG90aGVyIHR3byBzdGF0dXMgYml0cy4KKworQ29udGFjdDogRGFuaWVsIFZldHRl
cgorCiBEcml2ZXIgU3BlY2lmaWMKID09PT09PT09PT09PT09PQogCkBAIC00MzEsMjAgKzQ0NCw2
IEBAIHRpbnlkcm0KIFRpbnlkcm0gaXMgdGhlIGhlbHBlciBkcml2ZXIgZm9yIHJlYWxseSBzaW1w
bGUgZmIgZHJpdmVycy4gVGhlIGdvYWwgaXMgdG8gbWFrZQogdGhvc2UgZHJpdmVycyBhcyBzaW1w
bGUgYXMgcG9zc2libGUsIHNvIGxvdHMgb2Ygcm9vbSBmb3IgcmVmYWN0b3Jpbmc6CiAKLS0gYmFj
a2xpZ2h0IGhlbHBlcnMsIHByb2JhYmx5IGJlc3QgdG8gcHV0IHRoZW0gaW50byBhIG5ldyBkcm1f
YmFja2xpZ2h0LmMuCi0gIFRoaXMgaXMgYmVjYXVzZSBkcml2ZXJzL3ZpZGVvIGlzIGRlLWZhY3Rv
IHVubWFpbnRhaW5lZC4gV2UgY291bGQgYWxzbwotICBtb3ZlIGRyaXZlcnMvdmlkZW8vYmFja2xp
Z2h0IHRvIGRyaXZlcnMvZ3B1L2JhY2tsaWdodCBhbmQgdGFrZSBpdCBhbGwKLSAgb3ZlciB3aXRo
aW4gZHJtLW1pc2MsIGJ1dCB0aGF0J3MgbW9yZSB3b3JrLiBCYWNrbGlnaHQgaGVscGVycyByZXF1
aXJlIGEgZmFpcgotICBiaXQgb2YgcmV3b3JraW5nIGFuZCByZWZhY3RvcmluZy4gQSBzaW1wbGUg
ZXhhbXBsZSBpcyB0aGUgZW5hYmxpbmcgb2YgYSBiYWNrbGlnaHQuCi0gIFRpbnlkcm0gaGFzIGhl
bHBlcnMgZm9yIHRoaXMuIEl0IHdvdWxkIGJlIGdvb2QgaWYgb3RoZXIgZHJpdmVycyBjYW4gYWxz
byB1c2UgdGhlCi0gIGhlbHBlci4gSG93ZXZlciwgdGhlcmUgYXJlIHZhcmlvdXMgY2FzZXMgd2Ug
bmVlZCB0byBjb25zaWRlciBpLmUgZGlmZmVyZW50Ci0gIGRyaXZlcnMgc2VlbSB0byBoYXZlIGRp
ZmZlcmVudCB3YXlzIG9mIGVuYWJsaW5nL2Rpc2FibGluZyBhIGJhY2tsaWdodC4KLSAgV2UgYWxz
byBuZWVkIHRvIGNvbnNpZGVyIHRoZSBiYWNrbGlnaHQgZHJpdmVycyAobGlrZSBncGlvX2JhY2ts
aWdodCkuIFRoZSBzaXR1YXRpb24KLSAgaXMgZnVydGhlciBjb21wbGljYXRlZCBieSB0aGUgZmFj
dCB0aGF0IHRoZSBiYWNrbGlnaHQgaXMgdGllZCB0byBmYmRldgotICB2aWEgZmJfbm90aWZpZXJf
Y2FsbGJhY2soKSB3aGljaCBoYXMgY29tcGxpY2F0ZWQgbG9naWMuIEZvciBmdXJ0aGVyIGRldGFp
bHMsIHJlZmVyCi0gIHRvIHRoZSBmb2xsb3dpbmcgZGlzY3Vzc2lvbiB0aHJlYWQ6Ci0gIGh0dHBz
Oi8vZ3JvdXBzLmdvb2dsZS5jb20vZm9ydW0vIyF0b3BpYy9vdXRyZWFjaHkta2VybmVsLzhyQmUz
MGx3dGRBCi0KIC0gc3BpIGhlbHBlcnMsIHByb2JhYmx5IGJlc3QgcHV0IGludG8gc3BpIGNvcmUv
aGVscGVyIGNvZGUuIFRoaWVycnkgc2FpZAogICB0aGUgc3BpIG1haW50YWluZXIgaXMgZmFzdCZy
ZWFjdGl2ZSwgc28gc2hvdWxkbid0IGJlIGEgYmlnIGlzc3VlLgogCi0tIAoyLjIwLjEKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWls
aW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
