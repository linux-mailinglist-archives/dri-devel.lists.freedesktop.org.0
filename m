Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 793A046172
	for <lists+dri-devel@lfdr.de>; Fri, 14 Jun 2019 16:47:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 16A4D899B0;
	Fri, 14 Jun 2019 14:47:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x541.google.com (mail-ed1-x541.google.com
 [IPv6:2a00:1450:4864:20::541])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 94A65899B0
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Jun 2019 14:47:42 +0000 (UTC)
Received: by mail-ed1-x541.google.com with SMTP id s49so3924673edb.1
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Jun 2019 07:47:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :in-reply-to:user-agent;
 bh=d8nVVuvnHsmvk1d0kUURiumam/C7DIvw1DDJ0lOcbU4=;
 b=cDJjOSPBC6YBppluBBKKV+m28o5DjqXtTZvanpMXOpXojkc8QI5gRT0451rADPD9JQ
 tbbRE5LsAKqKxNIO8QZb+UW3QzT3LL5Legd/JiZjBFsnDjYcmKeSdpuHjRzfLkGXsu1v
 WB6c0kv8GOHNB4JlYkxaNKJEla2tlndFjYPBNi65xLdw+tkkBGtw4JxkDIoS2cGdr0Ix
 /KJekoR2cBzOFd5DacDxUtz26M/0rtE4xXTGcoCWnFqQPIVWSG2Ksb6Y0Nq7n5u/t1dj
 XpE8PTthiSqGmx7TdqpQFV2gpPH3nYrlMG8YcAHM2Iq7CirFHcUVxUN3Oo4NT7Caa4k+
 W5cQ==
X-Gm-Message-State: APjAAAWdHWxwE+Ov9jkKg2dyb3Bk9nEJELkeqKq8j9I+tQDz/HaokoH8
 9mYxUpM4yUgkWNpA7wP8QQ4yVQ==
X-Google-Smtp-Source: APXvYqzdCp6F1hxUyRMSuiQvQJM1/dCmISnLrE6y1EtpbLtmiXPpE8t7ndRFrI6NCVDtrkae8rrfpg==
X-Received: by 2002:a50:8465:: with SMTP id 92mr25270539edp.151.1560523661264; 
 Fri, 14 Jun 2019 07:47:41 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:569e:0:3106:d637:d723:e855])
 by smtp.gmail.com with ESMTPSA id e33sm944489eda.83.2019.06.14.07.47.39
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Fri, 14 Jun 2019 07:47:40 -0700 (PDT)
Date: Fri, 14 Jun 2019 16:47:38 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Jacopo Mondi <jacopo@jmondi.org>
Subject: Re: [PATCH 19/20] drm: rcar-du: crtc: Register GAMMA_LUT properties
Message-ID: <20190614144738.GY23020@phenom.ffwll.local>
Mail-Followup-To: Jacopo Mondi <jacopo@jmondi.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Jacopo Mondi <jacopo+renesas@jmondi.org>,
 kieran.bingham+renesas@ideasonboard.com, airlied@linux.ie,
 koji.matsuoka.xm@renesas.com, muroya@ksk.co.jp,
 VenkataRajesh.Kalakodima@in.bosch.com,
 Harsha.ManjulaMallikarjun@in.bosch.com,
 linux-renesas-soc@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
References: <20190606142220.1392-1-jacopo+renesas@jmondi.org>
 <20190606142220.1392-20-jacopo+renesas@jmondi.org>
 <20190607120304.GH7593@pendragon.ideasonboard.com>
 <20190614081507.3ky4pcyijjxnr7mp@uno.localdomain>
 <20190614084251.GW23020@phenom.ffwll.local>
 <20190614092745.wznk3iv5dgehmjsb@uno.localdomain>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190614092745.wznk3iv5dgehmjsb@uno.localdomain>
X-Operating-System: Linux phenom 4.19.0-5-amd64 
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google;
 h=sender:date:from:to:cc:subject:message-id:mail-followup-to
 :references:mime-version:content-disposition:in-reply-to:user-agent;
 bh=d8nVVuvnHsmvk1d0kUURiumam/C7DIvw1DDJ0lOcbU4=;
 b=NAHpzhGXzxQ0niZ/4BWf6AG8C7DK+4x3UafTtP24z/KSVwDcHxZOJWMWPkDDh1X2FA
 5hBGxyhxPcZqYh0g78osiTDMLeAfmAj+ZnNGgOC77XwrBofd3Pq/fezXSSqgiiQqPuI2
 sOas2pYPCGTpSsc//e4MFq2Mga/+zOqOJpmYg=
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
Cc: muroya@ksk.co.jp, VenkataRajesh.Kalakodima@in.bosch.com, airlied@linux.ie,
 koji.matsuoka.xm@renesas.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 kieran.bingham+renesas@ideasonboard.com,
 Jacopo Mondi <jacopo+renesas@jmondi.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Harsha.ManjulaMallikarjun@in.bosch.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpLCBKdW4gMTQsIDIwMTkgYXQgMTE6Mjc6NDVBTSArMDIwMCwgSmFjb3BvIE1vbmRpIHdy
b3RlOgo+IEhpIERhbmllbCwKPiAKPiBPbiBGcmksIEp1biAxNCwgMjAxOSBhdCAxMDo0Mjo1MUFN
ICswMjAwLCBEYW5pZWwgVmV0dGVyIHdyb3RlOgo+ID4gT24gRnJpLCBKdW4gMTQsIDIwMTkgYXQg
MTA6MTU6NTJBTSArMDIwMCwgSmFjb3BvIE1vbmRpIHdyb3RlOgo+ID4gPiBIaSBMYXVyZW50LAo+
ID4gPiAgICB0aGFua3MgZm9yIHJldmlldwo+ID4gPgo+ID4gPiBPbiBGcmksIEp1biAwNywgMjAx
OSBhdCAwMzowMzowNFBNICswMzAwLCBMYXVyZW50IFBpbmNoYXJ0IHdyb3RlOgo+ID4gPiA+IEhp
IEphY29wbywKPiA+ID4gPgo+ID4gPiA+IFRoYW5rIHlvdSBmb3IgdGhlIHBhdGNoLgo+ID4gPiA+
Cj4gPiA+ID4gT24gVGh1LCBKdW4gMDYsIDIwMTkgYXQgMDQ6MjI6MTlQTSArMDIwMCwgSmFjb3Bv
IE1vbmRpIHdyb3RlOgo+ID4gPiA+ID4gRW5hYmxlIHRoZSBHQU1NQV9MVVQgS01TIHByb3BlcnR5
IHVzaW5nIHRoZSBmcmFtZXdvcmsgaGVscGVycyB0bwo+ID4gPiA+ID4gcmVnaXN0ZXIgdGhlIHBy
b2VwcnR5IGFuZCB0aGUgYXNzb2NpYXRlZCBnYW1tYSB0YWJsZSBzaXplIG1heGltdW0gc2l6ZS4K
PiA+ID4gPiA+Cj4gPiA+ID4gPiBTaWduZWQtb2ZmLWJ5OiBKYWNvcG8gTW9uZGkgPGphY29wbyty
ZW5lc2FzQGptb25kaS5vcmc+Cj4gPiA+ID4gPiAtLS0KPiA+ID4gPiA+ICBkcml2ZXJzL2dwdS9k
cm0vcmNhci1kdS9yY2FyX2R1X2NydGMuYyB8IDMgKysrCj4gPiA+ID4gPiAgMSBmaWxlIGNoYW5n
ZWQsIDMgaW5zZXJ0aW9ucygrKQo+ID4gPiA+ID4KPiA+ID4gPiA+IGRpZmYgLS1naXQgYS9kcml2
ZXJzL2dwdS9kcm0vcmNhci1kdS9yY2FyX2R1X2NydGMuYyBiL2RyaXZlcnMvZ3B1L2RybS9yY2Fy
LWR1L3JjYXJfZHVfY3J0Yy5jCj4gPiA+ID4gPiBpbmRleCBlNmQzZGYzN2M4MjcuLmM5MjBmYjVk
YmE2NSAxMDA2NDQKPiA+ID4gPiA+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9yY2FyLWR1L3JjYXJf
ZHVfY3J0Yy5jCj4gPiA+ID4gPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vcmNhci1kdS9yY2FyX2R1
X2NydGMuYwo+ID4gPiA+ID4gQEAgLTEyMDcsNiArMTIwNyw5IEBAIGludCByY2FyX2R1X2NydGNf
Y3JlYXRlKHN0cnVjdCByY2FyX2R1X2dyb3VwICpyZ3JwLCB1bnNpZ25lZCBpbnQgc3dpbmRleCwK
PiA+ID4gPiA+ICAJICAgIHJjZHUtPmNtbXNbc3dpbmRleF0pIHsKPiA+ID4gPiA+ICAJCXJjcnRj
LT5jbW0gPSByY2R1LT5jbW1zW3N3aW5kZXhdOwo+ID4gPiA+ID4gIAkJcmdycC0+Y21tc19tYXNr
IHw9IEJJVChod2luZGV4ICUgMik7Cj4gPiA+ID4gPiArCj4gPiA+ID4gPiArCQlkcm1fbW9kZV9j
cnRjX3NldF9nYW1tYV9zaXplKGNydGMsIENNTV9HQU1NQV9MVVRfU0laRSk7Cj4gPiA+ID4gPiAr
CQlkcm1fY3J0Y19lbmFibGVfY29sb3JfbWdtdChjcnRjLCAwLCBmYWxzZSwgQ01NX0dBTU1BX0xV
VF9TSVpFKTsKPiA+ID4gPgo+ID4gPiA+IFRoaXMgY2hhbmdlIGxvb2tzIGdvb2QsIGJ1dCB5b3Ug
YWxzbyBuZWVkIHRvIGFkZCBzdXBwb3J0IGZvciBsZWdhY3kgQVBJLgo+ID4gPiA+IEFjY29yZGlu
ZyB0byB0aGUgZnVuY3Rpb24ncyBkb2N1bWVudGF0aW9uLAo+ID4gPiA+Cj4gPiA+ID4gICogRHJp
dmVycyBzaG91bGQgdXNlIGRybV9hdG9taWNfaGVscGVyX2xlZ2FjeV9nYW1tYV9zZXQoKSB0byBp
bXBsZW1lbnQgdGhlCj4gPiA+ID4gICogbGVnYWN5ICZkcm1fY3J0Y19mdW5jcy5nYW1tYV9zZXQg
Y2FsbGJhY2suCj4gPiA+ID4KPiA+ID4KPiA+ID4gRHJpdmVycyAnc2h1bGQnIG9yIGRyaXZlcnMg
J3NoYWxsJyA/Cj4gPiA+IElzbid0IHRoaXMgcmVxdWlyZWQgb25seSB0byBzdXBwb3J0IHRoZSAn
bGVnYWN5IEFQSXMnID8gRG8gd2Ugd2FudCB0aGF0Pwo+ID4KPiA+IFlvdSdyZSBjYWxsaW5nIGRy
bV9tb2RlX2NydGNfc2V0X2dhbW1hX3NpemUsIHdoaWNoIGlzIG9ubHkgdXNlZnVsIGZvciB0aGUK
PiA+IGxlZ2FjeSBpb2N0bHMuIHNob3VsZCBoZXJlID0gYXNzdW1pbmcgeW91ciBodyBzdXBwb3J0
cyBzb21ldGhpbmcgdGhhdAo+ID4gbGVnYWN5IGdhbW1hIGlvY3RsIGNhbiB1c2UuIEZlZWwgZnJl
ZSB0byBwYXRjaCB1cCB0aGUgZG9jcy4KPiAKPiBPaCwgSSBzZWUuIEkgc2hvdWxkIGVpdGhlciBs
ZWF2ZSB0aGUgb2xkIEFQSSBhbG9uZSB3aXRob3V0IGNhbGxpbmcKPiBkcm1fbW9kZV9jcnRjX3Nl
dF9nYW1tYV9zaXplKCksIG9yIHNldCB0aGUgLmdhbW1hX3NldCBjYWxsYmFjayB0bwo+IHBvaW50
IHRvIGRybV9hdG9taWNfaGVscGVyX2xlZ2FjeV9nYW1tYV9zZXQoKSwgd2hpY2ggdHJhbnNsYXRl
cyB0aGUKPiBvbGQgZ2FtbWEgdGFibGUgaW50ZXJmYWNlIHRvIGEgYmxvYiBwcm9wZXJ0eSBhbmQg
YXR0YWNoIGl0IHRvIGEgY3J0Ywo+IHN0YXRlIHdoaWNoIGlzIHRoZW4gY29tbWl0ZWQgYW5kIGFw
cGxpZWQgdGhyb3VnaCB0aGUgYXRvbWljIGhlbHBlcnMuCj4gCj4gU28gSSB3b3VsZCBjaGFuZ2Ug
dGhlIGRvYyB0byBwcmVzY3JpYmUgdGhhdCBpZiB0aGUgZHJpdmVyIGludGVuZHMgdG8KPiBzdXBw
b3J0IHRoZSBsZWdhY3kgU0VUR0FNTUEvR0VUR0FNTUEgSU9DVExzIGl0IHNob3VsZCBkZWNsYXJl
IHRoZQo+IGdhbW1hIHRhYmxlIHNpemUgd2l0aCBkcm1fbW9kZV9jcnRjX3NldF9nYW1tYV9zaXpl
KCkgZmlyc3QsIGFuZCBzZXQKPiB0aGUgLmdhbW1hX3NldCBjcnRjIGNhbGxiYWNrIHRvIGRybV9h
dG9taWNfaGVscGVyX2xlZ2FjeV9nYW1tYV9zZXQoKSwKPiB3aGljaCB0cmFuc2xhdGVzIHRoZSBs
ZWdhY3kgaW50ZXJmYWNlIHRvIGEgR0FNTUFfTFVUIHByb3BlcnR5IGJsb2IKPiBhbmQgY29tbWl0
IGl0Lgo+IAo+IElmIHRoYXQgd29ya3MsIEknbGwgbWFrZSBhIHNtYWxsIHBhdGNoIHRvIHRoZSBk
b2N1bWVudGF0aW9uIGluIHYyLgoKTm90IHF1aXRlIHdoYXQgSSBtZWFudDogWW91IHNob3VsZCBz
dXBwb3J0IHRoZSBsZWdhY3kgZ2FtbWEgaW9jdGwsIGlmIHlvdXIKZ2FtbWEgcmFtcCBjYW4gYmUg
c3F1YXJlZCBpbnRvIHN1cHBvcnQgdGhhdC4gV2hpY2ggZ2VuZXJhbGx5IG1lYW5zIHllcy4KV2Un
dmUgYmVlbiB0aGlua2luZyBhYm91dCBqdXN0IHdpcmluZyB0aGlzIGFsbCB1cCBieSBkZWZhdWx0
LCBidXQgdGhlcmUncwpzb21lIGRyaXZlcnMgd2hvIHVzZSBhIDI1NiBlbnRyeSBsZWdhY3kgZ2Ft
bWEgcmFtcCAoZm9yIGJhY2t3YXJkcyBjb21wYXQKd2l0aCBvbGQgWDExIHVzZXJzcGFjZSksIGJ1
dCBhZHZlcnRpc2UgbXVjaCBiaWdnZXIgdGFibGVzIHRocm91Z2ggdGhlIG5ldwppb2N0bC4gU28g
aXQncyBub3QgcXVpdGUgYXMgc2ltcGxlLgoKQnV0IGV4Y2VwdCBpZiB5b3UgaGF2ZSBzb21lIHJl
YWxseSBzdHJhbmdlIGh3IHRoZXJlJ3MganVzdCBubyBnb29kIHJlYXNvbgpub3QgdG8gc3VwcG9y
dCB0aGUgb2xkIGxlZ2FjeSBpb2N0bC4gV2UgYWxzbyBkb24ndCBqdXN0IHN1cHBvcnQgdGhlIG5l
dwphdG9taWMgaW9jdGwgb24gbmV3IGRyaXZlcnMsIHRoZXkgYWxsIHN0aWxsIHN1cHBvcnQgdGhl
IG9sZGVyIGludGVyZmFjZXMuClRoaXMgaXMgdGhlIHNhbWUuCgpUaGF0J3Mgd2hhdCBJIG1lYW50
IHNob3VsZCBiZSBjbGFyaWZpZWQgaWYgaXQncyBub3QgeWV0IGNsZWFyIGluIGRvY3MsCnBsdXMg
bWF5YmUgYSBuZXcgdG9kbyBlbnRyeSBpbiBEb2N1bWVudGF0aW9uL2dwdS90b2RvLnJzdC4KLURh
bmllbAoKPiAKPiBUaGFua3MKPiAgIGoKPiAKPiAKPiA+IC1EYW5pZWwKPiA+Cj4gPiA+Cj4gPiA+
IFRoYW5rcwo+ID4gPiAgICBqCj4gPiA+Cj4gPiA+ID4gPiAgCX0KPiA+ID4gPiA+Cj4gPiA+ID4g
PiAgCWRybV9jcnRjX2hlbHBlcl9hZGQoY3J0YywgJmNydGNfaGVscGVyX2Z1bmNzKTsKPiA+ID4g
PiA+Cj4gPiA+ID4KPiA+ID4gPiAtLQo+ID4gPiA+IFJlZ2FyZHMsCj4gPiA+ID4KPiA+ID4gPiBM
YXVyZW50IFBpbmNoYXJ0Cj4gPgo+ID4KPiA+Cj4gPiAtLQo+ID4gRGFuaWVsIFZldHRlcgo+ID4g
U29mdHdhcmUgRW5naW5lZXIsIEludGVsIENvcnBvcmF0aW9uCj4gPiBodHRwOi8vYmxvZy5mZnds
bC5jaAoKCgo+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
Cj4gZHJpLWRldmVsIG1haWxpbmcgbGlzdAo+IGRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5v
cmcKPiBodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1k
ZXZlbAoKCi0tIApEYW5pZWwgVmV0dGVyClNvZnR3YXJlIEVuZ2luZWVyLCBJbnRlbCBDb3Jwb3Jh
dGlvbgpodHRwOi8vYmxvZy5mZndsbC5jaApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5m
cmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0
aW5mby9kcmktZGV2ZWw=
