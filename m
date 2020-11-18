Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 49C442B7988
	for <lists+dri-devel@lfdr.de>; Wed, 18 Nov 2020 09:54:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 07DFD6E2DE;
	Wed, 18 Nov 2020 08:54:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x341.google.com (mail-ot1-x341.google.com
 [IPv6:2607:f8b0:4864:20::341])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 46D816E2DE
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Nov 2020 08:54:02 +0000 (UTC)
Received: by mail-ot1-x341.google.com with SMTP id a15so1029388otf.5
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Nov 2020 00:54:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=xI4rzFNVWzCVO6dWWBJ1reqGhiQZzWH3gwWIzfflIOQ=;
 b=MVSx37w1oYn1ODJAmPADmRFt9p6hqVs6l0yAfBhZ9TKFKq4lzHI/tynFB2QNQTdF1H
 +wwvPXIqZD0WiCqYIfttj594WWk4pKjDXjNoUtDMX+uxjuuwa/jPFVyl8nRDqMp/NBJd
 T3tEVpTxgzoV7mXuVjyUlznj54bCYRonpsdBc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=xI4rzFNVWzCVO6dWWBJ1reqGhiQZzWH3gwWIzfflIOQ=;
 b=uOYSg7N3OrXquJeh2vQtTxnDtleUvx7L3nChjNeoqOk4iMX/idOYnbm3q6H3hp8K5U
 oS9BVqTYUvdDU8bVmBEcUz3vaUHW2chMKx9ntpJo4rD0EpQA9uM6Vt8U+1Y2BjZ+UBNr
 ye5srbkSg3kUkNM1ixHHUEmCL0k+bOKdiV/pFtAiiSS2kJmP482YZ6d1T+x6RJeVsL0F
 nj5m/UFl512Dl/vYP8dfIO3VxorzpVpzcgkTHe93YGXUZblT3bNafd6UjwyDh2VLXkkm
 T7oxxdg0YtinuRDcP6RYsupJd/TiqfHBU3fixLwMZjnzZsFUkGR3CkV2DM4sPeq/bfYs
 MdJg==
X-Gm-Message-State: AOAM530MppNcdB4skywMoiXUyAUzad7CJ6m+HgYo0fAlVO2uLYutBK9E
 T4Wcu8UFeKfBAtq9AQTWP4ioGpDyhY/jDH3R9FP/Lw==
X-Google-Smtp-Source: ABdhPJw0SCeP21No3mbvPJuqE8wyzZABwWiFfE02iQzR1HfuWMzf80yjEo8dmS1eMNeMEwIZPLlb2+MDTloQML06UEQ=
X-Received: by 2002:a9d:27a5:: with SMTP id c34mr5687334otb.303.1605689641573; 
 Wed, 18 Nov 2020 00:54:01 -0800 (PST)
MIME-Version: 1.0
References: <20201117214029.591896-1-daniel.vetter@ffwll.ch>
 <f2fa78c0-047e-de26-579e-7c75110005a3@suse.de>
 <8526d6c3-5d35-d605-0bb6-44ce323740f7@amd.com>
In-Reply-To: <8526d6c3-5d35-d605-0bb6-44ce323740f7@amd.com>
From: Daniel Vetter <daniel.vetter@ffwll.ch>
Date: Wed, 18 Nov 2020 09:53:50 +0100
Message-ID: <CAKMK7uGk4JMGiXTuPDAvAMnRm-oiUhqQ9+4BKz0FEHBDJyXn-w@mail.gmail.com>
Subject: Re: [PATCH] char/agp: Disable frontend without CONFIG_DRM_LEGACY
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.29
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
Cc: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel.vetter@intel.com>,
 Alexander Deucher <alexander.deucher@amd.com>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Thomas Zimmermann <tzimmermann@suse.de>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCBOb3YgMTgsIDIwMjAgYXQgOToyNCBBTSBDaHJpc3RpYW4gS8O2bmlnCjxjaHJpc3Rp
YW4ua29lbmlnQGFtZC5jb20+IHdyb3RlOgo+Cj4gQW0gMTguMTEuMjAgdW0gMDk6MDIgc2Nocmll
YiBUaG9tYXMgWmltbWVybWFubjoKPiA+IEhpCj4gPgo+ID4gQW0gMTcuMTEuMjAgdW0gMjI6NDAg
c2NocmllYiBEYW5pZWwgVmV0dGVyOgo+ID4+IEl0J3MgcHJvYmFibHkgZnVsbCBvZiBidWdzIHJl
YWR5IGZvciBleHBsb2l0aW5nIGJ5IHVzZXJzcGFjZS4gQW5kCj4gPj4gdGhlcmUncyBub3QgZ29p
bmcgdG8gYmUgYW55IHVzZXJzcGFjZSBmb3IgdGhpcyB3aXRob3V0IGFueSBvZiB0aGUgZHJtCj4g
Pj4gbGVnYWN5IGRyaXZlcnMgZW5hYmxlZCB0b28uIFNvIGp1c3QgY291cGxlIGl0IHRvZ2V0aGVy
Lgo+ID4+Cj4gPj4gU2lnbmVkLW9mZi1ieTogRGFuaWVsIFZldHRlciA8ZGFuaWVsLnZldHRlckBp
bnRlbC5jb20+Cj4gPj4gQ2M6IERhdmlkIEFpcmxpZSA8YWlybGllZEBsaW51eC5pZT4KPiA+PiBD
YzogQWRhbSBKYWNrc29uIDxhamF4QHJlZGhhdC5jb20+Cj4gPj4gLS0tCj4gPj4gICBkcml2ZXJz
L2NoYXIvYWdwL01ha2VmaWxlIHwgNiArKysrKy0KPiA+PiAgIGRyaXZlcnMvY2hhci9hZ3AvYWdw
LmggICAgfCA1ICsrKysrCj4gPj4gICAyIGZpbGVzIGNoYW5nZWQsIDEwIGluc2VydGlvbnMoKyks
IDEgZGVsZXRpb24oLSkKPiA+Pgo+ID4+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2NoYXIvYWdwL01h
a2VmaWxlIGIvZHJpdmVycy9jaGFyL2FncC9NYWtlZmlsZQo+ID4+IGluZGV4IGNiMjQ5N2QxNTdm
Ni4uOTBlZDhjNzg5ZTQ4IDEwMDY0NAo+ID4+IC0tLSBhL2RyaXZlcnMvY2hhci9hZ3AvTWFrZWZp
bGUKPiA+PiArKysgYi9kcml2ZXJzL2NoYXIvYWdwL01ha2VmaWxlCj4gPj4gQEAgLTEsNyArMSwx
MSBAQAo+ID4+ICAgIyBTUERYLUxpY2Vuc2UtSWRlbnRpZmllcjogR1BMLTIuMAo+ID4+IC1hZ3Bn
YXJ0LXkgOj0gYmFja2VuZC5vIGZyb250ZW5kLm8gZ2VuZXJpYy5vIGlzb2NoLm8KPiA+PiArYWdw
Z2FydC15IDo9IGJhY2tlbmQubyBnZW5lcmljLm8gaXNvY2gubwo+ID4+Cj4gPj4gK2lmZXEgKCQo
Q09ORklHX0RSTV9MRUdBQ1kpLHkpCj4gPj4gICBhZ3BnYXJ0LSQoQ09ORklHX0NPTVBBVCkgICAr
PSBjb21wYXRfaW9jdGwubwo+ID4+ICthZ3BnYXJ0LXkgICAgICAgICAgICAgICAgICAgKz0gZnJv
bnRlbmQubwo+ID4+ICtlbmRpZgo+ID4+ICsKPiA+Pgo+ID4+ICAgb2JqLSQoQ09ORklHX0FHUCkg
ICAgICAgICAgKz0gYWdwZ2FydC5vCj4gPj4gICBvYmotJChDT05GSUdfQUdQX0FMSSkgICAgICAg
ICAgICAgICs9IGFsaS1hZ3Aubwo+ID4+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2NoYXIvYWdwL2Fn
cC5oIGIvZHJpdmVycy9jaGFyL2FncC9hZ3AuaAo+ID4+IGluZGV4IDRlYjFjNzcyZGVkNy4uYmIw
OWQ2NGNkNTFlIDEwMDY0NAo+ID4+IC0tLSBhL2RyaXZlcnMvY2hhci9hZ3AvYWdwLmgKPiA+PiAr
KysgYi9kcml2ZXJzL2NoYXIvYWdwL2FncC5oCj4gPj4gQEAgLTE4Niw4ICsxODYsMTMgQEAgaW50
IGFncF9hZGRfYnJpZGdlKHN0cnVjdCBhZ3BfYnJpZGdlX2RhdGEgKmJyaWRnZSk7Cj4gPj4gICB2
b2lkIGFncF9yZW1vdmVfYnJpZGdlKHN0cnVjdCBhZ3BfYnJpZGdlX2RhdGEgKmJyaWRnZSk7Cj4g
Pj4KPiA+PiAgIC8qIEZyb250ZW5kIHJvdXRpbmVzLiAqLwo+ID4+ICsjaWYgSVNfRU5BQkxFRChD
T05GSUdfRFJNX0xFR0FDWSkKPiA+PiAgIGludCBhZ3BfZnJvbnRlbmRfaW5pdGlhbGl6ZSh2b2lk
KTsKPiA+PiAgIHZvaWQgYWdwX2Zyb250ZW5kX2NsZWFudXAodm9pZCk7Cj4gPj4gKyNlbHNlCj4g
Pj4gK3N0YXRpYyBpbmxpbmUgaW50IGFncF9mcm9udGVuZF9pbml0aWFsaXplKHZvaWQpIHsgcmV0
dXJuIDA7IH0KPiA+PiArc3RhdGljIGlubGluZSB2b2lkIGFncF9mcm9udGVuZF9jbGVhbnVwKHZv
aWQpIHt9Cj4gPj4gKyNlbmRpZgo+ID4gVGhlcmUncyBvbmUgbm9uLWxlZ2FjeSBkcml2ZXIgdGhh
dCB1c2VzIHRoZXNlIGFncCBzdHJ1Y3R1cmVzLCB3aGljaCBpcwo+ID4gcmFkZW9uLiBEb2VzIHRo
aXMgY2hhbmdlIGFmZmVjdCByYWRlb24/Cj4KPiBOb3V2ZWF1IHVzZXMgQUdQIGFzIHdlbGwsIGJ1
dCBJJ20gbm90IHN1cmUgaWYgYm90aCBkcml2ZXJzIHVzZSBhbnkgb2YKPiB0aGlzIHN0dWZmLgoK
ZnJvbnRlbmQgPSAvZGV2L2FncCBjaGFyZGV2IGludGVyZmFjZSBmb3IgdXNlcnNwYWNlIGRyaXZl
cnMuIElmIHlvdSdyZQpsb29raW5nIGF0IGtlcm5lbCBkcml2ZXJzLCB5b3UncmUgbG9va2luZyBh
dCB0aGUgd3JvbmcgdGhpbmcsIHRoZQprZXJuZWwtaW50ZXJuYWwgaW50ZXJmYWNlIGlzIGluIGNo
YXIvYWdwL2JhY2tlbmQuYyBhbmQgc3RpbGwgZW5hYmxlZC4KU28gbm8gaW1wYWN0IGF0IGFsbCBv
biBhbnkga2VybmVsIGNvZGUuCgpOb3cgdGhlIGltcGFjdCB0aGlzIGRvZXMgaGF2ZSBvbiBrbXMg
ZHJpdmVycyB1c2luZyBhZ3AgaXMgdGhhdCB0aGVyZSdzCm5vIGxvbmdlciBhIHVzZXJzcGFjZSBp
b2N0bCBpbnRlcmZhY2UgdG8gY2hhbmdlIHRoZSBhZ3Agc2V0dXAgYW5kCm1hcHBpbmdzIGFuZCBm
aWdodCB0aGUga21zIGRyaXZlciAod2hpY2ggYXNzdW1lcyBpdCdzIGZ1bGx5IGluIGNvbnRyb2wK
b2YgYWdwIGNvbmZpZ3VyYXRpb24pLgotRGFuaWVsCgo+Cj4gUmVnYXJkcywKPiBDaHJpc3RpYW4u
Cj4KPiA+Cj4gPiBCZXN0IHJlZ2FyZHMKPiA+IFRob21hcwo+ID4KPiA+Pgo+ID4+ICAgLyogR2Vu
ZXJpYyByb3V0aW5lcy4gKi8KPiA+PiAgIHZvaWQgYWdwX2dlbmVyaWNfZW5hYmxlKHN0cnVjdCBh
Z3BfYnJpZGdlX2RhdGEgKmJyaWRnZSwgdTMyIG1vZGUpOwo+ID4+Cj4KCgotLSAKRGFuaWVsIFZl
dHRlcgpTb2Z0d2FyZSBFbmdpbmVlciwgSW50ZWwgQ29ycG9yYXRpb24KaHR0cDovL2Jsb2cuZmZ3
bGwuY2gKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJp
LWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBz
Oi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
