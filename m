Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 32B41800DB
	for <lists+dri-devel@lfdr.de>; Fri,  2 Aug 2019 21:26:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 57F466EF55;
	Fri,  2 Aug 2019 19:26:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb44.google.com (mail-yb1-xb44.google.com
 [IPv6:2607:f8b0:4864:20::b44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C88CF6EF55
 for <dri-devel@lists.freedesktop.org>; Fri,  2 Aug 2019 19:26:31 +0000 (UTC)
Received: by mail-yb1-xb44.google.com with SMTP id a14so27238837ybm.11
 for <dri-devel@lists.freedesktop.org>; Fri, 02 Aug 2019 12:26:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=oolSjnNy8o69qEXumrcNervgTiZ+0C/a0z2WrugF1/U=;
 b=mrJc0Ihbiyt2muoZUReP9JZt6O6ky/HdoAfPeJNBs5T7JoYZB8pQ22AYaNBv9IZb9j
 CJILTpAG7gBmrHfANUXB9kwE4Hi8UIkt4aGk0C75xYI1bHsQFIrYGZo/yQKdl0dPmA3S
 uvz4ZvhofuPo+0PZCS4ID96jKEM3GCg7qrd6ipeqqxkyjd9+suHWDefazktUdEMv+I4D
 6HWRKbZ09duDX0RASo6Ka4vkO6fHu06AIeO5dRA0Kw86oCMOGllowlILxqbThHBoVBhG
 mgJqM/RFLRK/fGvn6k35WBKlNRIzrs8TDz95owzKp4LC9tpPOGI7TrcZq/1EKzH2iNb7
 aq+w==
X-Gm-Message-State: APjAAAXsdbEutCPWduv0HXW4qM2iQ+yeUkOSh36CXJogAq6XvlhVNlTJ
 rAcQTozZ1baH7CJoPumCM/kLVg==
X-Google-Smtp-Source: APXvYqyzp76n9T+wWTNjzFV6D8CqVkpC4vTtN8rYlshUPMNLk6fs5ugiybl1QqkrOcbaUwfiGlN7aQ==
X-Received: by 2002:a25:9209:: with SMTP id b9mr74080808ybo.271.1564773990707; 
 Fri, 02 Aug 2019 12:26:30 -0700 (PDT)
Received: from localhost ([2620:0:1013:11:89c6:2139:5435:371d])
 by smtp.gmail.com with ESMTPSA id p141sm17544110ywg.78.2019.08.02.12.26.30
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Fri, 02 Aug 2019 12:26:30 -0700 (PDT)
Date: Fri, 2 Aug 2019 15:26:29 -0400
From: Sean Paul <sean@poorly.run>
To: Douglas Anderson <dianders@chromium.org>
Subject: Re: [PATCH] drm/rockchip: Suspend DP late
Message-ID: <20190802192629.GX104440@art_vandelay>
References: <20190802184616.44822-1-dianders@chromium.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190802184616.44822-1-dianders@chromium.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=poorly.run; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=oolSjnNy8o69qEXumrcNervgTiZ+0C/a0z2WrugF1/U=;
 b=aobcd8eDORReviFPdWXwJ+owjz07tUDlmFTI8N2UVHjRvHreP3t+H60+aVprbNizpN
 DVp9kUtL4tHn9qZ1XKPX2XWMn2+X7vva5tuYoKXNJIvUQE8qgVSBtEEc+9BLd77TgAle
 9ugd4NRMK+0DTYvGMi8PGMKCXL62gEqNiCxYBbvWVGEvd85Bk1yR58GuU2AK+YI3/j4T
 Ya7uA2+jqRuqLBOtDwGQj/oXyvmwAIsWbYU++bAVC7r1PUqCnQzZ+//dqKBBp/aGjoRN
 R7AJmQDz+uVBx9kBwjBALruxa0mpEMTTGWoxf63Z/Czq9klDBcDv9sA+JKzqtWnKyicb
 nJRw==
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
Cc: Tomeu Vizoso <tomeu.vizoso@collabora.com>, David Airlie <airlied@linux.ie>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-rockchip@lists.infradead.org, mka@chromium.org, seanpaul@chromium.org,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpLCBBdWcgMDIsIDIwMTkgYXQgMTE6NDY6MTZBTSAtMDcwMCwgRG91Z2xhcyBBbmRlcnNv
biB3cm90ZToKPiBJbiBjb21taXQgZmU2NGJhNWM2MzIzICgiZHJtL3JvY2tjaGlwOiBSZXN1bWUg
RFAgZWFybHkiKSB3ZSBtb3ZlZAo+IHJlc3VtZSB0byBiZSBlYXJseSBidXQgbGVmdCBzdXNwZW5k
IGF0IGl0cyBub3JtYWwgdGltZS4gIFRoaXMgc2VlbXMKPiBsaWtlIGl0IGNvdWxkIGJlIE9LLCBi
dXQgY2FzdWVzIHByb2JsZW1zIGlmIGEgc3VzcGVuZCBnZXRzIGludGVycnVwdGVkCj4gcGFydHdh
eSB0aHJvdWdoLiAgVGhlIE9TIG9ubHkgYmFsYW5jZXMgbWF0Y2hpbmcgc3VzcGVuZC9yZXN1bWUg
bGV2ZWxzLgo+IC4uLnNvIGlmIHN1c3BlbmQgd2FzIGNhbGxlZCB0aGVuIHJlc3VtZSB3aWxsIGJl
IGNhbGxlZC4gIElmIHN1c3BlbmQKPiBsYXRlIHdhcyBjYWxsZWQgdGhlbiByZXN1bWUgZWFybHkg
d2lsbCBiZSBjYWxsZWQuICAuLi5idXQgaWYgc3VzcGVuZAo+IHdhcyBjYWxsZWQgcmVzdW1lIGVh
cmx5IG1pZ2h0IG5vdCBnZXQgY2FsbGVkLiAgVGhpcyBsZWFkcyB0byBhbgo+IHVuYmFsYW5jZSBp
biB0aGUgY2xvY2sgZW5hYmxlcyAvIGRpc2FibGVzLgo+IAo+IExldHMgdGFrZSB0aGUgc2ltcGxl
IGZpeCBhbmQganVzdCBtb3ZlIHN1c3BlbmQgdG8gYmUgbGF0ZSB0byBtYXRjaC4KPiBUaGlzIG1h
a2VzIHRoZSBQTSBjb3JlIHRha2UgcHJvcGVyIGNhcmUgaW4ga2VlcGluZyB0aGluZ3MgYmFsYW5j
ZWQuCj4gCj4gRml4ZXM6IGZlNjRiYTVjNjMyMyAoImRybS9yb2NrY2hpcDogUmVzdW1lIERQIGVh
cmx5IikKPiBTaWduZWQtb2ZmLWJ5OiBEb3VnbGFzIEFuZGVyc29uIDxkaWFuZGVyc0BjaHJvbWl1
bS5vcmc+CgpSZXZpZXdlZC1ieTogU2VhbiBQYXVsIDxzZWFuQHBvb3JseS5ydW4+CgpUaGlzIHNo
b3VsZCBnbyBpbiAtbWlzYy1maXhlcyBhbmQgZHVlIHRvIHNvbWUuLi4gYWRtaW5pc3RyYXRpdmUg
cmVhc29ucy4uLiBJCndpbGwgbGVhdmUgaXQgb24gdGhlIGxpc3QgdW50aWwgTWFhcnRlbiBoYXMg
YSBjaGFuY2UgdG8gZmYgdG8gLXJjNCBvbiBNb25kYXkuCkknbGwgYXBwbHkgaXQgdGhlbiBzbyBh
cyB0byBub3QgcmVxdWlyZSBhIGJhY2ttZXJnZS4KClNlYW4KCj4gLS0tCj4gCj4gIGRyaXZlcnMv
Z3B1L2RybS9yb2NrY2hpcC9hbmFsb2dpeF9kcC1yb2NrY2hpcC5jIHwgMiArLQo+ICAxIGZpbGUg
Y2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKPiAKPiBkaWZmIC0tZ2l0IGEv
ZHJpdmVycy9ncHUvZHJtL3JvY2tjaGlwL2FuYWxvZ2l4X2RwLXJvY2tjaGlwLmMgYi9kcml2ZXJz
L2dwdS9kcm0vcm9ja2NoaXAvYW5hbG9naXhfZHAtcm9ja2NoaXAuYwo+IGluZGV4IDdkN2NiNTc0
MTBmYy4uZjM4ZjVlMTEzYzZiIDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9yb2NrY2hp
cC9hbmFsb2dpeF9kcC1yb2NrY2hpcC5jCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL3JvY2tjaGlw
L2FuYWxvZ2l4X2RwLXJvY2tjaGlwLmMKPiBAQCAtNDM2LDcgKzQzNiw3IEBAIHN0YXRpYyBpbnQg
cm9ja2NoaXBfZHBfcmVzdW1lKHN0cnVjdCBkZXZpY2UgKmRldikKPiAgCj4gIHN0YXRpYyBjb25z
dCBzdHJ1Y3QgZGV2X3BtX29wcyByb2NrY2hpcF9kcF9wbV9vcHMgPSB7Cj4gICNpZmRlZiBDT05G
SUdfUE1fU0xFRVAKPiAtCS5zdXNwZW5kID0gcm9ja2NoaXBfZHBfc3VzcGVuZCwKPiArCS5zdXNw
ZW5kX2xhdGUgPSByb2NrY2hpcF9kcF9zdXNwZW5kLAo+ICAJLnJlc3VtZV9lYXJseSA9IHJvY2tj
aGlwX2RwX3Jlc3VtZSwKPiAgI2VuZGlmCj4gIH07Cj4gLS0gCj4gMi4yMi4wLjc3MC5nMGYyYzRh
MzdmZC1nb29nCj4gCgotLSAKU2VhbiBQYXVsLCBTb2Z0d2FyZSBFbmdpbmVlciwgR29vZ2xlIC8g
Q2hyb21pdW0gT1MKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
Cmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
