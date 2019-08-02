Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F2FF47FD01
	for <lists+dri-devel@lfdr.de>; Fri,  2 Aug 2019 17:07:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AA5056EE9E;
	Fri,  2 Aug 2019 15:07:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com
 [IPv6:2a00:1450:4864:20::531])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BDF656EEA2
 for <dri-devel@lists.freedesktop.org>; Fri,  2 Aug 2019 15:07:52 +0000 (UTC)
Received: by mail-ed1-x531.google.com with SMTP id v15so72693623eds.9
 for <dri-devel@lists.freedesktop.org>; Fri, 02 Aug 2019 08:07:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :references:mime-version:content-disposition:in-reply-to:user-agent;
 bh=I7opunzVajomkZJg4ddhWXLEt8fmw+DKjczOcgy7yqo=;
 b=frm/k3lSgYGrhHRviK3yiDJlR6Q9YXItqgD2yMf1yWde71HHjw0B5YNRdTTSzT0f1Y
 V2xjkQb++N0X83aIJUmt+hnTCLqSMBNZRG0FbW9YfQemFGpQO/ShBU0CP0yAMhCOZrnJ
 +tBlOuCCBX0EKjWcB4IDq0Oh8bC3JWBpI5evAxkALSSZjxqJ+htcxgrdUoaDp94JIEN4
 ilbPgH3m6gpHtOf+hMPMIhTKORt4wHfbie/OAoONcl5+kBRgBjeB7+G4mdu1i6Az2h2p
 +dHKF4UhSJ/2Qt5xTQY72Ug6WporB50e2UrooBEWrwKhyWathJrdIRGExi684ZmHBva4
 G0EA==
X-Gm-Message-State: APjAAAU8fl3S6i9NIK1P2hALcFImKvogW1RqVNZZsLV4vJBzlwYm9cmy
 buaf7lNhtWny5UwGNAzOU2Y=
X-Google-Smtp-Source: APXvYqwadN5Fb3zaShqHcTpT+olhXhUv4vlG4KIJRGInMBsYVl/91iD87fGOwYnpWyL7mMqppliaPg==
X-Received: by 2002:a17:906:1594:: with SMTP id
 k20mr1344213ejd.49.1564758471355; 
 Fri, 02 Aug 2019 08:07:51 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:569e:0:3106:d637:d723:e855])
 by smtp.gmail.com with ESMTPSA id pv18sm13168646ejb.14.2019.08.02.08.07.50
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Fri, 02 Aug 2019 08:07:50 -0700 (PDT)
Date: Fri, 2 Aug 2019 17:07:48 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Subject: Re: [PULL] drm-misc-fixes
Message-ID: <20190802150748.GQ7444@phenom.ffwll.local>
References: <af0dc371-16e0-cee8-0d71-4824d44aa973@linux.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <af0dc371-16e0-cee8-0d71-4824d44aa973@linux.intel.com>
X-Operating-System: Linux phenom 4.19.0-5-amd64 
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google;
 h=sender:date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=I7opunzVajomkZJg4ddhWXLEt8fmw+DKjczOcgy7yqo=;
 b=ap9+hdXFyitBj8PA51vBOMjr83ZicC7ZvV02JiI6GnJ3emvN8Xbo2XI1Gs0qhCQcQq
 OjEypq4ac6rlixKOMF29N9Od2lO/fWfeuX4GeLm7oO1RVsu1q6PrdI/d6zf8AZuimSzp
 PhXdMt46RnNQ/sRh1PkO55YQLWEarlrRrnSYs=
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
Cc: dim-tools@lists.freedesktop.org, Maxime Ripard <maxime.ripard@bootlin.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpLCBBdWcgMDIsIDIwMTkgYXQgMDM6NDM6NDhQTSArMDIwMCwgTWFhcnRlbiBMYW5raG9y
c3Qgd3JvdGU6Cj4gSGV5LAo+IAo+IEJpdCBsYXRlLCBidXQgZml4ZXMgZm9yIHY1LjMtcmMzLiA6
KQoKWWVzLCBwbGVhc2UgdHJ5IHRvIHByZXAgYW5kIHNlbmQgb3V0IC1maXhlcyBwdWxsIG9uIFRo
dSBsYXRlc3QuIE90aGVyd2lzZQp0aGVyZSdzIG5vIHRpbWUgdG8gZml4IHRoaW5ncyB1cCBhbmQg
aXQgZWF0cyBpbnRvIHcvZSAuLi4KCj4gCj4gZHJtLW1pc2MtZml4ZXMtMjAxOS0wOC0wMjoKPiBk
cm0tbWlzYy1maXhlcyBmb3IgdjUuMy1yYzM6Cj4gLSBGaXggc29tZSBidWlsZCBlcnJvcnMgaW4g
ZHJtL2JyaWRnZS4KPiAtIERvIG5vdCBidWlsZCBpODEwIG9uIENPTkZJR19QUkVFTVBUSU9OLgo+
IC0gRml4IGNhY2hlIHN5bmMgb24gYXJtIGluIHZnZW0uCj4gLSBBbGxvdyBtYXBwaW5nIGZiIGlu
IGRybV9jbGllbnQgb25seSB3aGVuIHJlcXVpcmVkLCBhbmQgdXNlIGl0IHRvIGZpeCBib2NocyBm
YmRldi4KPiBUaGUgZm9sbG93aW5nIGNoYW5nZXMgc2luY2UgY29tbWl0IDYwOTQ4OGJjOTc5Zjk5
ZjgwNWYzNGU5YTMyYzFlM2I3MTE3OWQxMGI6Cj4gCj4gICBMaW51eCA1LjMtcmMyICgyMDE5LTA3
LTI4IDEyOjQ3OjAyIC0wNzAwKQo+IAo+IGFyZSBhdmFpbGFibGUgaW4gdGhlIEdpdCByZXBvc2l0
b3J5IGF0Ogo+IAo+ICAgZ2l0Oi8vYW5vbmdpdC5mcmVlZGVza3RvcC5vcmcvZHJtL2RybS1taXNj
IHRhZ3MvZHJtLW1pc2MtZml4ZXMtMjAxOS0wOC0wMgoKUHVsbGVkLCB0aGFua3MuCi1EYW5pZWwK
Cj4gCj4gZm9yIHlvdSB0byBmZXRjaCBjaGFuZ2VzIHVwIHRvIDU4NTQwNTk0NTcwNzc4ZmQxNDlj
ZDhjOWIyYmZmNjFmMmNlZmE4Yzk6Cj4gCj4gICBkcm0vYm9jaHM6IFVzZSBzaGFkb3cgYnVmZmVy
IGZvciBib2NocyBmcmFtZWJ1ZmZlciBjb25zb2xlICgyMDE5LTA4LTAxIDE1OjAxOjQyICswMjAw
KQo+IAo+IC0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0KPiBkcm0tbWlzYy1maXhlcyBmb3IgdjUuMy1yYzM6Cj4gLSBGaXggc29t
ZSBidWlsZCBlcnJvcnMgaW4gZHJtL2JyaWRnZS4KPiAtIERvIG5vdCBidWlsZCBpODEwIG9uIENP
TkZJR19QUkVFTVBUSU9OLgo+IC0gRml4IGNhY2hlIHN5bmMgb24gYXJtIGluIHZnZW0uCj4gLSBB
bGxvdyBtYXBwaW5nIGZiIGluIGRybV9jbGllbnQgb25seSB3aGVuIHJlcXVpcmVkLCBhbmQgdXNl
IGl0IHRvIGZpeCBib2NocyBmYmRldi4KPiAKPiAtLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tCj4gTWFhcnRlbiBMYW5raG9yc3Qg
KDEpOgo+ICAgICAgIE1lcmdlIHRhZyAndjUuMy1yYzInIGludG8gZHJtLW1pc2MtZml4ZXMKPiAK
PiBSb2IgQ2xhcmsgKDEpOgo+ICAgICAgIGRybS92Z2VtOiBmaXggY2FjaGUgc3luY2hyb25pemF0
aW9uIG9uIGFybS9hcm02NAo+IAo+IFRob21hcyBHbGVpeG5lciAoMSk6Cj4gICAgICAgZHJtL2k4
MTA6IFVzZSBDT05GSUdfUFJFRU1QVElPTgo+IAo+IFRob21hcyBaaW1tZXJtYW5uICg0KToKPiAg
ICAgICBkcm0vY2xpZW50OiBTdXBwb3J0IHVubWFwcGluZyBvZiBEUk0gY2xpZW50IGJ1ZmZlcnMK
PiAgICAgICBkcm0vZmItaGVscGVyOiBNYXAgRFJNIGNsaWVudCBidWZmZXIgb25seSB3aGVuIHJl
cXVpcmVkCj4gICAgICAgZHJtL2ZiLWhlbHBlcjogSW5zdGFuY2lhdGUgc2hhZG93IEZCIGlmIGNv
bmZpZ3VyZWQgaW4gZGV2aWNlJ3MgbW9kZV9jb25maWcKPiAgICAgICBkcm0vYm9jaHM6IFVzZSBz
aGFkb3cgYnVmZmVyIGZvciBib2NocyBmcmFtZWJ1ZmZlciBjb25zb2xlCj4gCj4gWXVlSGFpYmlu
ZyAoMik6Cj4gICAgICAgZHJtL2JyaWRnZTogbHZkcy1lbmNvZGVyOiBGaXggYnVpbGQgZXJyb3Ig
d2hpbGUgQ09ORklHX0RSTV9LTVNfSEVMUEVSPW0KPiAgICAgICBkcm0vYnJpZGdlOiB0YzM1ODc2
NDogRml4IGJ1aWxkIGVycm9yCj4gCj4gIGRyaXZlcnMvZ3B1L2RybS9LY29uZmlnICAgICAgICAg
ICB8ICAgMiArLQo+ICBkcml2ZXJzL2dwdS9kcm0vYm9jaHMvYm9jaHNfa21zLmMgfCAgIDEgKwo+
ICBkcml2ZXJzL2dwdS9kcm0vYnJpZGdlL0tjb25maWcgICAgfCAgIDQgKy0KPiAgZHJpdmVycy9n
cHUvZHJtL2RybV9jbGllbnQuYyAgICAgIHwgIDYwICsrKysrKysrKysrKysrLS0tLQo+ICBkcml2
ZXJzL2dwdS9kcm0vZHJtX2ZiX2hlbHBlci5jICAgfCAgNTEgKysrKysrKysrKystLS0tCj4gIGRy
aXZlcnMvZ3B1L2RybS92Z2VtL3ZnZW1fZHJ2LmMgICB8IDEzMCArKysrKysrKysrKysrKysrKysr
KysrKystLS0tLS0tLS0tLS0tLQo+ICBpbmNsdWRlL2RybS9kcm1fY2xpZW50LmggICAgICAgICAg
fCAgIDIgKwo+ICBpbmNsdWRlL2RybS9kcm1fbW9kZV9jb25maWcuaCAgICAgfCAgIDcgKysKPiAg
OCBmaWxlcyBjaGFuZ2VkLCAxODYgaW5zZXJ0aW9ucygrKSwgNzEgZGVsZXRpb25zKC0pCgotLSAK
RGFuaWVsIFZldHRlcgpTb2Z0d2FyZSBFbmdpbmVlciwgSW50ZWwgQ29ycG9yYXRpb24KaHR0cDov
L2Jsb2cuZmZ3bGwuY2gKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Au
b3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRl
dmVs
