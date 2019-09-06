Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E977CABF4F
	for <lists+dri-devel@lfdr.de>; Fri,  6 Sep 2019 20:23:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0EF628921C;
	Fri,  6 Sep 2019 18:23:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x542.google.com (mail-ed1-x542.google.com
 [IPv6:2a00:1450:4864:20::542])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 083C18921C
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Sep 2019 18:23:48 +0000 (UTC)
Received: by mail-ed1-x542.google.com with SMTP id f19so7072763eds.12
 for <dri-devel@lists.freedesktop.org>; Fri, 06 Sep 2019 11:23:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :references:mime-version:content-disposition:in-reply-to:user-agent;
 bh=ZNrRerapHlMF2YxNHUpVx3tGymbzfC4cyaQ2v6ugW28=;
 b=nzf98JLAXQLv+/uz4jKUsdOIcOhqGXQ713KARzwR0vx9ljICKK1FItb33yxZ5h8LmE
 /IOrw4j5SPIvzt0WxoL5BBPTSlUaUz78FJtcK2IDtZ3OtNtkkKRLDmbBL8GRe2lj4Zo3
 48yD/959yuX5FT8wDVt6hcwCrF2yBMsRBhdqgncdIKs1bW0TWViyS8hJpSl0ieMgzd1E
 Si/8E04+5wmOBb0BHeVLNW1PdyvlKbLwyhDoaAVl2hyzgKGzcCQTdCC7zsvQMj9X6vbX
 ws2WpI1iM+2lEJhTSFdxjRVZWJ007jbfP0Cjs99U9/zaROlnCd7AlqGLb/UZA6x5FIsT
 cKog==
X-Gm-Message-State: APjAAAVMcEM3592I3CezzRJH3iejCWaErjDgmWuph+0jz4sWq0SQ4o83
 anIbbtsgmJOKhAqR6gZkGvUU2g==
X-Google-Smtp-Source: APXvYqztJobCu/dK9gVXlt7ZavhFXphv3VBBCSr+AdFC5wA8aW4v+pO5N9bsKJO16WrkOdKxVQKI3w==
X-Received: by 2002:a17:906:2929:: with SMTP id
 v9mr8553653ejd.108.1567794226557; 
 Fri, 06 Sep 2019 11:23:46 -0700 (PDT)
Received: from phenom.ffwll.local (212-51-149-96.fiber7.init7.net.
 [212.51.149.96])
 by smtp.gmail.com with ESMTPSA id bt11sm1071105edb.65.2019.09.06.11.23.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 Sep 2019 11:23:45 -0700 (PDT)
Date: Fri, 6 Sep 2019 20:23:43 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Daniel Stone <daniel@fooishbar.org>
Subject: Re: [PATCH] drm/blend: Define the direction of Z position values
Message-ID: <20190906182343.GF3958@phenom.ffwll.local>
References: <20190906144459.16025-1-daniel.vetter@ffwll.ch>
 <CAKMK7uEFv+8Qx9+Gs8a=GmN+LEgaxF1zbvw_42-soM8z1AeK1Q@mail.gmail.com>
 <CAPj87rPYspgsxwxynM5Sc_O8t=o3Mag8UEHKAKRSFQWWUUEFHQ@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAPj87rPYspgsxwxynM5Sc_O8t=o3Mag8UEHKAKRSFQWWUUEFHQ@mail.gmail.com>
X-Operating-System: Linux phenom 5.2.0-2-amd64 
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google;
 h=sender:date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=ZNrRerapHlMF2YxNHUpVx3tGymbzfC4cyaQ2v6ugW28=;
 b=AwHX6i9j2QfAhbaeXJt9q2vSFxa81mq6r+PIOoNhKK0ueAkv1XAAo1Jq3FS76EPYQz
 ZMwsZdpg8bx4iNxgipGuNfaptep9iFXdGsq+/1sDLPYgVpNv9NCBTbiTpf/AGmXAEzrY
 X0qL0UOvTUJEFb2SavU84xKib1iFlZCwm1cbA=
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
 Pekka Paalanen <pekka.paalanen@collabora.com>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Daniel Vetter <daniel.vetter@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpLCBTZXAgMDYsIDIwMTkgYXQgMDQ6MjY6MTVQTSArMDEwMCwgRGFuaWVsIFN0b25lIHdy
b3RlOgo+IE9uIEZyaSwgNiBTZXAgMjAxOSBhdCAxNjoxOSwgRGFuaWVsIFZldHRlciA8ZGFuaWVs
LnZldHRlckBmZndsbC5jaD4gd3JvdGU6Cj4gPiBPbiBGcmksIFNlcCA2LCAyMDE5IGF0IDQ6NDUg
UE0gRGFuaWVsIFZldHRlciA8ZGFuaWVsLnZldHRlckBmZndsbC5jaD4gd3JvdGU6Cj4gPiA+IFdl
IGZvcmdvdCB0aGF0Lgo+ID4gPgo+ID4gPiBQcm9vZiBpcyB0aGUgb25lIGlndCB0ZXN0Y2FzZSB3
ZSBoYXZlOgo+ID4gPgo+ID4gPiBodHRwczovL2dpdGxhYi5mcmVlZGVza3RvcC5vcmcvZHJtL2ln
dC1ncHUtdG9vbHMvYmxvYi9tYXN0ZXIvdGVzdHMva21zX2F0b21pYy5jI0wyODAKPiA+ID4KPiA+
ID4gV2hpbGUgYXQgaXQgYWxzbyBkb2N1bWVudCB0aGF0IHdlIGhhdmUgaW1tdXRhYmxlIHpwb3Mg
cHJvcGVydGllcyBpbgo+ID4gPiBzb21lIGNhc2VzLgo+ID4gPgo+ID4gPiBSZXBvcnRlZC1ieTog
UGVra2EgUGFhbGFuZW4gPHBla2thLnBhYWxhbmVuQGNvbGxhYm9yYS5jb20+Cj4gPiA+IENjOiBQ
ZWtrYSBQYWFsYW5lbiA8cGVra2EucGFhbGFuZW5AY29sbGFib3JhLmNvbT4KPiA+ID4gUmV2aWV3
ZWQtYnk6IFBla2thIFBhYWxhbmVuIDxwZWtrYS5wYWFsYW5lbkBjb2xsYWJvcmEuY29tPgo+ID4g
PiBDYzogSWxpYSBNaXJraW4gPGltaXJraW5AYWx1bS5taXQuZWR1Pgo+ID4gPiBBY2tlZC1ieTog
SWxpYSBNaXJraW4gPGltaXJraW5AYWx1bS5taXQuZWR1Pgo+ID4gPiBTaWduZWQtb2ZmLWJ5OiBE
YW5pZWwgVmV0dGVyIDxkYW5pZWwudmV0dGVyQGludGVsLmNvbT4KPiA+Cj4gPiBGcm9tIGlyYzog
UmV2aWV3ZWQtYnk6IERhbmllbCBTdG9uZSA8ZGFuaWVsc0Bjb2xsYWJvcmEuY29tPgo+IAo+IEFu
ZCBmcm9tIG1haWwgYWxzby4KCkFuZCBhcHBsaWVkLgotRGFuaWVsCi0tIApEYW5pZWwgVmV0dGVy
ClNvZnR3YXJlIEVuZ2luZWVyLCBJbnRlbCBDb3Jwb3JhdGlvbgpodHRwOi8vYmxvZy5mZndsbC5j
aApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2
ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9s
aXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
