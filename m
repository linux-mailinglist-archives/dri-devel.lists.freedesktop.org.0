Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A7423F8C26
	for <lists+dri-devel@lfdr.de>; Tue, 12 Nov 2019 10:47:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6D2E76EADC;
	Tue, 12 Nov 2019 09:47:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ED5756EADB
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Nov 2019 09:47:16 +0000 (UTC)
Received: by mail-wr1-x444.google.com with SMTP id w9so10936745wrr.0
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Nov 2019 01:47:16 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :references:mime-version:content-disposition:in-reply-to:user-agent;
 bh=Vh0RobQn8tEVTSjmFrLwxgHjwBAxt4OnvOgkYHzs0Yk=;
 b=jtLQOajWet/2b9Au69rDC2O5Coa5GMqiCV2cR19oWanl4YIvYufXFV1YaytOgOZ9It
 emeLnihRnKf3fpToTGn/fK6KhblrAKlgGDYFVlAlUKzSpeu1JifMfVhHl2w/56PIRuaS
 plDa4dLSwtrZAd+NaJitEnJcEfLacJsp5Hw0fIYDmIZeLByaO+j7aILO/oyyWe/z7G1l
 x0wexCYL7iupoed5Lqof7ic7xybkzJ+n/7CMsr6qxM0w9/uSBnaJHX6JQitUS27euNh2
 HCsAu1RPKDrJLd6+QT5wXjLf5prsQ/Ua/iaaykqpvtnj1Gkpf02gDXjhDIGFp1uXDcRw
 kFHg==
X-Gm-Message-State: APjAAAWi8WNIJKphL8+AnetEG2iW5Kxhp/QwybW1sB8oVedEQbUcWcUG
 X3kYUcZy3BuAqFMkEM93NosATw==
X-Google-Smtp-Source: APXvYqxZhL60Z9q1830cYJs53QcU8b9NQJpyQ5OpirD5KMM5lwxX3ML9GAPxvUwHKaWoBJqdROs5eQ==
X-Received: by 2002:adf:f50b:: with SMTP id q11mr17102044wro.343.1573552035503; 
 Tue, 12 Nov 2019 01:47:15 -0800 (PST)
Received: from phenom.ffwll.local (212-51-149-96.fiber7.init7.net.
 [212.51.149.96])
 by smtp.gmail.com with ESMTPSA id y16sm17531184wro.25.2019.11.12.01.47.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 Nov 2019 01:47:14 -0800 (PST)
Date: Tue, 12 Nov 2019 10:47:12 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Hans de Goede <hdegoede@redhat.com>
Subject: Re: [PATCH 12/12] drm/connector: Hookup the new drm_cmdline_mode
 panel_orientation member
Message-ID: <20191112094712.GH23790@phenom.ffwll.local>
References: <20191110154101.26486-1-hdegoede@redhat.com>
 <20191110154101.26486-13-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191110154101.26486-13-hdegoede@redhat.com>
X-Operating-System: Linux phenom 5.2.0-3-amd64 
User-Agent: Mutt/1.12.2 (2019-09-21)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google;
 h=sender:date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=Vh0RobQn8tEVTSjmFrLwxgHjwBAxt4OnvOgkYHzs0Yk=;
 b=d1lHj1iH+EpBn4JWOW9AGK26Q0pfNKYb2ugFehh43TIINloWRYYPe/7rBmZJqUWuWe
 z3T+HhY+cuLruMDt99quVDIpTYsExLNWfz4pgWZGWokYVparLc2IUNgbmKgQtb/lwC3+
 pfQXc6AEC9110nYNl59YBYb2aq+NI+uhtdDek=
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
Cc: Maxime Ripard <maxime.ripard@bootlin.com>, dri-devel@lists.freedesktop.org,
 David Airlie <airlied@linux.ie>, Sean Paul <seanpaul@chromium.org>,
 Daniel Vetter <daniel.vetter@intel.com>,
 Mathieu =?iso-8859-1?Q?Alexandre-T=E9treault?= <alexandretm@amotus.ca>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gU3VuLCBOb3YgMTAsIDIwMTkgYXQgMDQ6NDE6MDFQTSArMDEwMCwgSGFucyBkZSBHb2VkZSB3
cm90ZToKPiBJZiB0aGUgbmV3IHZpZGVvPS4uLiBwYW5lbF9vcmllbnRhdGlvbiBvcHRpb24gaXMg
c2V0IGZvciBhIGNvbm5lY3RvciwgaG9ub3IKPiBpdCBhbmQgc2V0dXAgYSBtYXRjaGluZyAicGFu
ZWwgb3JpZW50YXRpb24iIHByb3BlcnR5IG9uIHRoZSBjb25uZWN0b3IuCj4gCj4gQnVnTGluazog
aHR0cHM6Ly9naXRsYWIuZnJlZWRlc2t0b3Aub3JnL3BseW1vdXRoL3BseW1vdXRoL21lcmdlX3Jl
cXVlc3RzLzgzCj4gU2lnbmVkLW9mZi1ieTogSGFucyBkZSBHb2VkZSA8aGRlZ29lZGVAcmVkaGF0
LmNvbT4KCkRvbid0IHdlIG5lZWQgb25lIG1vcmUgcGF0Y2ggaGVyZSB0byBjcmVhdGUgdGhlIHBh
bmVsIG9yaWVudGF0aW9uIHByb3BlcnR5CmlmIHRoZSBkcml2ZXIgZG9lc24ndCBkbyBpdD8gT3Ro
ZXJ3aXNlIHRoaXMgd29uJ3QgaGFwcGVuLCBhbmQgdXNlcnNwYWNlCmNhbid0IGxvb2sgYXQgaXQg
KG9ubHkgdGhlIGludGVybmFsIGZiZGV2IHN0dWZmLCB3aGljaCBoYXMgaXQncyBvd24KbGltaXRh
dGlvbnMgd3J0IHJvdGF0aW9uKS4KLURhbmllbAoKPiAtLS0KPiAgZHJpdmVycy9ncHUvZHJtL2Ry
bV9jb25uZWN0b3IuYyB8IDcgKysrKysrKwo+ICAxIGZpbGUgY2hhbmdlZCwgNyBpbnNlcnRpb25z
KCspCj4gCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9kcm1fY29ubmVjdG9yLmMgYi9k
cml2ZXJzL2dwdS9kcm0vZHJtX2Nvbm5lY3Rvci5jCj4gaW5kZXggNDBhOTg1YzQxMWE2Li41OTE5
MTRmMDFjZDQgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2RybV9jb25uZWN0b3IuYwo+
ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9kcm1fY29ubmVjdG9yLmMKPiBAQCAtMTQwLDYgKzE0MCwx
MyBAQCBzdGF0aWMgdm9pZCBkcm1fY29ubmVjdG9yX2dldF9jbWRsaW5lX21vZGUoc3RydWN0IGRy
bV9jb25uZWN0b3IgKmNvbm5lY3RvcikKPiAgCQljb25uZWN0b3ItPmZvcmNlID0gbW9kZS0+Zm9y
Y2U7Cj4gIAl9Cj4gIAo+ICsJaWYgKG1vZGUtPnBhbmVsX29yaWVudGF0aW9uICE9IERSTV9NT0RF
X1BBTkVMX09SSUVOVEFUSU9OX1VOS05PV04pIHsKPiArCQlEUk1fSU5GTygic2V0dGluZyBjb25u
ZWN0b3IgJXMgcGFuZWxfb3JpZW50YXRpb24gdG8gJWRcbiIsCj4gKwkJCSBjb25uZWN0b3ItPm5h
bWUsIG1vZGUtPnBhbmVsX29yaWVudGF0aW9uKTsKPiArCQlkcm1fY29ubmVjdG9yX3NldF9wYW5l
bF9vcmllbnRhdGlvbihjb25uZWN0b3IsCj4gKwkJCQkJCSAgICBtb2RlLT5wYW5lbF9vcmllbnRh
dGlvbik7Cj4gKwl9Cj4gKwo+ICAJRFJNX0RFQlVHX0tNUygiY21kbGluZSBtb2RlIGZvciBjb25u
ZWN0b3IgJXMgJXMgJWR4JWRAJWRIeiVzJXMlc1xuIiwKPiAgCQkgICAgICBjb25uZWN0b3ItPm5h
bWUsIG1vZGUtPm5hbWUsCj4gIAkJICAgICAgbW9kZS0+eHJlcywgbW9kZS0+eXJlcywKPiAtLSAK
PiAyLjIzLjAKPiAKPiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwo+IGRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKPiBkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0
b3Aub3JnCj4gaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9k
cmktZGV2ZWwKCi0tIApEYW5pZWwgVmV0dGVyClNvZnR3YXJlIEVuZ2luZWVyLCBJbnRlbCBDb3Jw
b3JhdGlvbgpodHRwOi8vYmxvZy5mZndsbC5jaApfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0
cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9kcmktZGV2ZWw=
