Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 23636608EA
	for <lists+dri-devel@lfdr.de>; Fri,  5 Jul 2019 17:14:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1B1246E4E6;
	Fri,  5 Jul 2019 15:14:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com
 [IPv6:2a00:1450:4864:20::343])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 042D56E4E6
 for <dri-devel@lists.freedesktop.org>; Fri,  5 Jul 2019 15:14:54 +0000 (UTC)
Received: by mail-wm1-x343.google.com with SMTP id g67so3693508wme.1
 for <dri-devel@lists.freedesktop.org>; Fri, 05 Jul 2019 08:14:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :references:mime-version:content-disposition:in-reply-to:user-agent;
 bh=Y+id+HLBtT0DXbDeU+I/vX4a9Ut4T76TnmwDD0FS5vU=;
 b=RBDB8fJiOMtfib6peMDPXbMCBNXwK3E3ndY498uWLSSVwfiD/gKGKvlWzDvGO3qVex
 DvgaBCLfKUc1AlrXIuwGVWlW+mjLVVmJwlZ+zsscdnURVUdygii46D5U/D7BUSdm50al
 K8+cfvadCn0Zs6HWyneQGVfYVt6LcB584g+UhS+XWiIQVqdgxAQkSHtegixbGnPqs6k9
 JIZVr1CAl5ZM3eD8eutcaplLAJQbsnpdaQ/6Z5I55D/+oRiDs5Y9VIUkTyHIfr+47XWx
 ymV+bUDz+eqwZrh9ixoit9VnHteVcYjuUisenoGY5vKA/wGBRVB9A187EJ3niajgAP0p
 NJxQ==
X-Gm-Message-State: APjAAAWSTKQNV62Md1gR42+Iv2fhNDWIhN89f8Z9AfEbhsillcbn7ag1
 hXA/IuHH7BN4vLvru3iPfoAlJdOZlcQ=
X-Google-Smtp-Source: APXvYqxd+9pY2RrniS+xLExBYBKcMHm/+LT8BsqvLQBDrPRoseHJFaAZSmKWqlk2RpBmxjVOITlaqQ==
X-Received: by 2002:a50:ba09:: with SMTP id g9mr5240567edc.172.1562339692373; 
 Fri, 05 Jul 2019 08:14:52 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:569e:0:3106:d637:d723:e855])
 by smtp.gmail.com with ESMTPSA id h10sm2781849ede.93.2019.07.05.08.14.49
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Fri, 05 Jul 2019 08:14:50 -0700 (PDT)
Date: Fri, 5 Jul 2019 17:14:47 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: DRI Development <dri-devel@lists.freedesktop.org>
Subject: Re: [PATCH] drm/doc: Document kapi doc expectations
Message-ID: <20190705151447.GP15868@phenom.ffwll.local>
References: <20190625203644.4423-1-daniel.vetter@ffwll.ch>
 <20190704145054.5701-1-daniel.vetter@ffwll.ch>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190704145054.5701-1-daniel.vetter@ffwll.ch>
X-Operating-System: Linux phenom 4.19.0-5-amd64 
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google;
 h=sender:date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=Y+id+HLBtT0DXbDeU+I/vX4a9Ut4T76TnmwDD0FS5vU=;
 b=QQYmXv+PTo5hsCiJJEqZeOclmT3posSL5yypaumlJ3yRQ41TYk0KWwHz5qqiPfMSRq
 j029uTiJ56/vPP0iTDIPVfRcLE/NwWZPX47RBjU0uz8UBo4oz7fr/SZVKdxSoWFAh1eQ
 +hVJ7pP06gP4EIftOt/X9HGq8LjJ+hv/H+vVg=
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

T24gVGh1LCBKdWwgMDQsIDIwMTkgYXQgMDQ6NTA6NTRQTSArMDIwMCwgRGFuaWVsIFZldHRlciB3
cm90ZToKPiBXZSd2ZSBoYWQgdGhpcyBhbHJlYWR5IGZvciBhbnl0aGluZyBuZXcuIFdpdGggbXkg
ZHJtX3ByaW1lLmMgY2xlYW51cCBJCj4gYWxzbyB0aGluayBkb2N1bWVudGF0aW9uIGZvciBldmVy
eXRoaW5nIGFscmVhZHkgZXhpc3RpbmcgaXMgY29tcGxldGUsCj4gYW5kIHdlIGNhbiBiYWtlIHRo
aXMgaW4gYXMgYSByZXF1aXJlbWVudHMgc3Vic3lzdGVtIHdpZGUuCj4gCj4gdjI6IEltcHJvdmUg
d29yZGluZyBhIGJpdCAoTGF1cmVudCksIGZpeCB0eXBvIGluIGNvbW1pdCBtZXNzYWdlIChTYW0p
Lgo+IAo+IEFja2VkLWJ5OiBFbWlsIFZlbGlrb3YgPGVtaWwudmVsaWtvdkBjb2xsYWJvcmEuY29t
Pgo+IEFja2VkLWJ5OiBTZWFuIFBhdWwgPHNlYW5AcG9vcmx5LnJ1bj4KPiBBY2tlZC1ieTogTGF1
cmVudCBQaW5jaGFydCA8bGF1cmVudC5waW5jaGFydEBpZGVhc29uYm9hcmQuY29tPgo+IEFja2Vk
LWJ5OiBNYXhpbWUgUmlwYXJkIDxtYXhpbWUucmlwYXJkQGJvb3RsaW4uY29tPgo+IEFja2VkLWJ5
OiBTYW0gUmF2bmJvcmcgPHNhbUByYXZuYm9yZy5vcmc+Cj4gQWNrZWQtYnk6IEphbmkgTmlrdWxh
IDxqYW5pLm5pa3VsYUBpbnRlbC5jb20+Cj4gU2lnbmVkLW9mZi1ieTogRGFuaWVsIFZldHRlciA8
ZGFuaWVsLnZldHRlckBpbnRlbC5jb20+CgpGcm9tIGlyYzoKCkFja2VkLWJ5OiBBbGV4IERldWNo
ZXIgPGFsZXhkZXVjaGVyQGdtYWlsLmNvbT4KCj4gQ2M6IExhdXJlbnQgUGluY2hhcnQgPGxhdXJl
bnQucGluY2hhcnRAaWRlYXNvbmJvYXJkLmNvbT4KPiBDYzogSmFuaSBOaWt1bGEgPGphbmkubmlr
dWxhQGxpbnV4LmludGVsLmNvbT4KPiBDYzogRGF2aWQgQWlybGllIDxhaXJsaWVkQGxpbnV4Lmll
Pgo+IENjOiBEYW5pZWwgVmV0dGVyIDxkYW5pZWxAZmZ3bGwuY2g+Cj4gQ2M6IE1hYXJ0ZW4gTGFu
a2hvcnN0IDxtYWFydGVuLmxhbmtob3JzdEBsaW51eC5pbnRlbC5jb20+Cj4gQ2M6IE1heGltZSBS
aXBhcmQgPG1heGltZS5yaXBhcmRAYm9vdGxpbi5jb20+Cj4gQ2M6IFNlYW4gUGF1bCA8c2VhbkBw
b29ybHkucnVuPgo+IC0tLQo+ICBEb2N1bWVudGF0aW9uL2dwdS9pbnRyb2R1Y3Rpb24ucnN0IHwg
MTYgKysrKysrKysrKysrKysrKwo+ICBEb2N1bWVudGF0aW9uL2dwdS90b2RvLnJzdCAgICAgICAg
IHwgMTMgLS0tLS0tLS0tLS0tLQo+ICAyIGZpbGVzIGNoYW5nZWQsIDE2IGluc2VydGlvbnMoKyks
IDEzIGRlbGV0aW9ucygtKQo+IAo+IGRpZmYgLS1naXQgYS9Eb2N1bWVudGF0aW9uL2dwdS9pbnRy
b2R1Y3Rpb24ucnN0IGIvRG9jdW1lbnRhdGlvbi9ncHUvaW50cm9kdWN0aW9uLnJzdAo+IGluZGV4
IGZjY2JlMzc1MjQ0ZC4uMjVhNTZlOWMwY2ZkIDEwMDY0NAo+IC0tLSBhL0RvY3VtZW50YXRpb24v
Z3B1L2ludHJvZHVjdGlvbi5yc3QKPiArKysgYi9Eb2N1bWVudGF0aW9uL2dwdS9pbnRyb2R1Y3Rp
b24ucnN0Cj4gQEAgLTUxLDYgKzUxLDIyIEBAIGFuZCAiRklYTUUiIHdoZXJlIHRoZSBpbnRlcmZh
Y2UgY291bGQgYmUgY2xlYW5lZCB1cC4KPiAgCj4gIEFsc28gcmVhZCB0aGUgOnJlZjpgZ3VpZGVs
aW5lcyBmb3IgdGhlIGtlcm5lbCBkb2N1bWVudGF0aW9uIGF0IGxhcmdlIDxkb2NfZ3VpZGU+YC4K
PiAgCj4gK0RvY3VtZW50YXRpb24gUmVxdWlyZW1lbnRzIGZvciBrQVBJCj4gKy0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tCj4gKwo+ICtBbGwga2VybmVsIEFQSXMgZXhwb3J0ZWQg
dG8gb3RoZXIgbW9kdWxlcyBtdXN0IGJlIGRvY3VtZW50ZWQsIGluY2x1ZGluZyB0aGVpcgo+ICtk
YXRhc3RydWN0dXJlcyBhbmQgYXQgbGVhc3QgYSBzaG9ydCBpbnRyb2R1Y3Rvcnkgc2VjdGlvbiBl
eHBsYWluaW5nIHRoZSBvdmVyYWxsCj4gK2NvbmNlcHRzLiBEb2N1bWVudGF0aW9uIHNob3VsZCBi
ZSBwdXQgaW50byB0aGUgY29kZSBpdHNlbGYgYXMga2VybmVsZG9jIGNvbW1lbnRzCj4gK2FzIG11
Y2ggYXMgcmVhc29uYWJsZS4KPiArCj4gK0RvIG5vdCBibGluZGx5IGRvY3VtZW50IGV2ZXJ5dGhp
bmcsIGJ1dCBkb2N1bWVudCBvbmx5IHdoYXQncyByZWxldmFudCBmb3IgZHJpdmVyCj4gK2F1dGhv
cnM6IEludGVybmFsIGZ1bmN0aW9ucyBvZiBkcm0ua28gYW5kIGRlZmluaXRlbHkgc3RhdGljIGZ1
bmN0aW9ucyBzaG91bGQgbm90Cj4gK2hhdmUgZm9ybWFsIGtlcm5lbGRvYyBjb21tZW50cy4gVXNl
IG5vcm1hbCBDIGNvbW1lbnRzIGlmIHlvdSBmZWVsIGxpa2UgYSBjb21tZW50Cj4gK2lzIHdhcnJh
bnRlZC4gWW91IG1heSB1c2Uga2VybmVsZG9jIHN5bnRheCBpbiB0aGUgY29tbWVudCwgYnV0IGl0
IHNoYWxsIG5vdAo+ICtzdGFydCB3aXRoIGEgLyoqIGtlcm5lbGRvYyBtYXJrZXIuIFNpbWlsYXIg
Zm9yIGRhdGEgc3RydWN0dXJlcywgYW5ub3RhdGUKPiArYW55dGhpbmcgZW50aXJlbHkgcHJpdmF0
ZSB3aXRoIGBgLyogcHJpdmF0ZTogKi9gYCBjb21tZW50cyBhcyBwZXIgdGhlCj4gK2RvY3VtZW50
YXRpb24gZ3VpZGUuCj4gKwo+ICBHZXR0aW5nIFN0YXJ0ZWQKPiAgPT09PT09PT09PT09PT09Cj4g
IAo+IGRpZmYgLS1naXQgYS9Eb2N1bWVudGF0aW9uL2dwdS90b2RvLnJzdCBiL0RvY3VtZW50YXRp
b24vZ3B1L3RvZG8ucnN0Cj4gaW5kZXggZTcxN2YyODBmOWFlLi5kYjg4OTY5YTU2ZWUgMTAwNjQ0
Cj4gLS0tIGEvRG9jdW1lbnRhdGlvbi9ncHUvdG9kby5yc3QKPiArKysgYi9Eb2N1bWVudGF0aW9u
L2dwdS90b2RvLnJzdAo+IEBAIC0zMDEsMTkgKzMwMSw2IEBAIEluIHRoZSBlbmQgbm8gLmMgZmls
ZSBzaG91bGQgbmVlZCB0byBpbmNsdWRlIGBgZHJtUC5oYGAgYW55bW9yZS4KPiAgCj4gIENvbnRh
Y3Q6IERhbmllbCBWZXR0ZXIKPiAgCj4gLUFkZCBtaXNzaW5nIGtlcm5lbGRvYyBmb3IgZXhwb3J0
ZWQgZnVuY3Rpb25zCj4gLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tCj4gLQo+IC1UaGUgRFJNIHJlZmVyZW5jZSBkb2N1bWVudGF0aW9uIGlzIHN0aWxsIGxhY2tp
bmcga2VybmVsZG9jIGluIGEgZmV3IGFyZWFzLiBUaGUKPiAtdGFzayB3b3VsZCBiZSB0byBjbGVh
biB1cCBpbnRlcmZhY2VzIGxpa2UgbW92aW5nIGZ1bmN0aW9ucyBhcm91bmQgYmV0d2Vlbgo+IC1m
aWxlcyB0byBiZXR0ZXIgZ3JvdXAgdGhlbSBhbmQgaW1wcm92aW5nIHRoZSBpbnRlcmZhY2VzIGxp
a2UgZHJvcHBpbmcgcmV0dXJuCj4gLXZhbHVlcyBmb3IgZnVuY3Rpb25zIHRoYXQgbmV2ZXIgZmFp
bC4gVGhlbiB3cml0ZSBrZXJuZWxkb2MgZm9yIGFsbCBleHBvcnRlZAo+IC1mdW5jdGlvbnMgYW5k
IGFuIG92ZXJ2aWV3IHNlY3Rpb24gYW5kIGludGVncmF0ZSBpdCBhbGwgaW50byB0aGUgZHJtIGJv
b2suCj4gLQo+IC1TZWUgaHR0cHM6Ly9kcmkuZnJlZWRlc2t0b3Aub3JnL2RvY3MvZHJtLyBmb3Ig
d2hhdCdzIHRoZXJlIGFscmVhZHkuCj4gLQo+IC1Db250YWN0OiBEYW5pZWwgVmV0dGVyCj4gLQo+
ICBNYWtlIHBhbmljIGhhbmRsaW5nIHdvcmsKPiAgLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tCj4g
IAo+IC0tIAo+IDIuMjAuMQo+IAoKLS0gCkRhbmllbCBWZXR0ZXIKU29mdHdhcmUgRW5naW5lZXIs
IEludGVsIENvcnBvcmF0aW9uCmh0dHA6Ly9ibG9nLmZmd2xsLmNoCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJp
LWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
