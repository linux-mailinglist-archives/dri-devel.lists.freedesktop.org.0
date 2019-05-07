Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D42A31619E
	for <lists+dri-devel@lfdr.de>; Tue,  7 May 2019 12:02:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E141689FDE;
	Tue,  7 May 2019 10:02:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x542.google.com (mail-ed1-x542.google.com
 [IPv6:2a00:1450:4864:20::542])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 85DCA89FDE
 for <dri-devel@lists.freedesktop.org>; Tue,  7 May 2019 10:02:43 +0000 (UTC)
Received: by mail-ed1-x542.google.com with SMTP id w37so18139189edw.4
 for <dri-devel@lists.freedesktop.org>; Tue, 07 May 2019 03:02:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :references:mime-version:content-disposition:in-reply-to:user-agent;
 bh=JhAtY5w9q0AGmwz/2NUbL8jVN8m9GJOKVYYeMIamzw0=;
 b=riGMbjOrnKbRx7Q7V1azi+5ahbHMALU6m/0orlDahn5zMJA0J8UPpGWEHnduSx8gj8
 awXA4Gkit0n+MpXOG7XoPVz1c//iAVkBVGT3K6yK2GPzJL2auHO3ff6Jnb3dB1Ne6zCU
 8aWCbqzaPX7/LCchXiKkMwwtzBE2TakyJmr25t4K1Z9GW9rxum/ZOmwkhnOFcMRhKbtA
 J0+W76TnqGqSnQwMS2D35HtIzOgPwVfsYIgRvQnfVqPcXSF+yf0oQ6F9MHdkOOevaS5R
 mcFounqwSlEx3KeHZ1qY7WeWBtS/xKTZt7g0YxraekjEiXas21wTkJWgsFqV93aJpnjn
 TVWw==
X-Gm-Message-State: APjAAAXFsPKL6pUZO0KbUA9tKWPXaPMpUxpj4eiJBBBMfrlZY4a5ZC45
 hqaCDVnuOAphD6qHEu8dgx3Zmg==
X-Google-Smtp-Source: APXvYqw9cgB2dhz6TNLYYsyyAA6XCZ6hIxdH7bwozT+E60HJbnkmTGPxGbD7LVIHfJbFsihyP//XMg==
X-Received: by 2002:a50:95b0:: with SMTP id w45mr32041713eda.221.1557223362099; 
 Tue, 07 May 2019 03:02:42 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:569e:0:3106:d637:d723:e855])
 by smtp.gmail.com with ESMTPSA id d33sm932731ede.10.2019.05.07.03.02.40
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Tue, 07 May 2019 03:02:41 -0700 (PDT)
Date: Tue, 7 May 2019 12:02:39 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: Re: [PATCH] drm/doc: Improve docs for conn_state->best_encoder
Message-ID: <20190507100238.GO17751@phenom.ffwll.local>
References: <20190506144629.5976-1-daniel.vetter@ffwll.ch>
 <20190506145753.GA5021@pendragon.ideasonboard.com>
 <20190506152724.GK17751@phenom.ffwll.local>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190506152724.GK17751@phenom.ffwll.local>
X-Operating-System: Linux phenom 4.14.0-3-amd64 
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google;
 h=sender:date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=JhAtY5w9q0AGmwz/2NUbL8jVN8m9GJOKVYYeMIamzw0=;
 b=jU2gmPb+n0ZX0loHfVkvHxFcvdbixtPpDSh61xiJLEHndJAbGARNw828u0RReiJRaA
 3mYa9gySN5GZNf5zywAOTp54G2uzxXmkOMHn0Pl/Iq0c43guuPbezgy5opsK21ol+Gub
 7t15dsBnBcFI7kQo4a5vg8z55De4rI24VV7MQ=
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>, Sean Paul <sean@poorly.run>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Daniel Vetter <daniel.vetter@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gTW9uLCBNYXkgMDYsIDIwMTkgYXQgMDU6Mjc6MjRQTSArMDIwMCwgRGFuaWVsIFZldHRlciB3
cm90ZToKPiBPbiBNb24sIE1heSAwNiwgMjAxOSBhdCAwNTo1Nzo1M1BNICswMzAwLCBMYXVyZW50
IFBpbmNoYXJ0IHdyb3RlOgo+ID4gSGkgRGFuaWVsLAo+ID4gCj4gPiBUaGFuayB5b3UgZm9yIHRo
ZSBwYXRjaC4KPiA+IAo+ID4gT24gTW9uLCBNYXkgMDYsIDIwMTkgYXQgMDQ6NDY6MjlQTSArMDIw
MCwgRGFuaWVsIFZldHRlciB3cm90ZToKPiA+ID4gSXQncyBtYW5kYXRvcnkgYW5kIGNvbnNpZGVy
ZWQgY29yZSBzdGF0ZSBzaW5jZSBpb2N0bHMgcmVseSBvbiB0aGlzCj4gPiA+IHdvcmtpbmcuCj4g
PiA+IAo+ID4gPiBUaGFua3MgdG8gTGF1cmVudCBmb3IgcG9pbnRpbmcgb3V0IHRoaXMgZ2FwLgo+
ID4gPiAKPiA+ID4gdjI6IENsYXJpZnkgdG8gImF0b21pYyBkcml2ZXJzIiBvbmx5Lgo+ID4gPiAK
PiA+ID4gQ2M6IExhdXJlbnQgUGluY2hhcnQgPGxhdXJlbnQucGluY2hhcnRAaWRlYXNvbmJvYXJk
LmNvbT4KPiA+ID4gQ2M6IFNlYW4gUGF1bCA8c2VhbkBwb29ybHkucnVuPgo+ID4gPiBTaWduZWQt
b2ZmLWJ5OiBEYW5pZWwgVmV0dGVyIDxkYW5pZWwudmV0dGVyQGludGVsLmNvbT4KPiA+ID4gLS0t
Cj4gPiA+ICBpbmNsdWRlL2RybS9kcm1fY29ubmVjdG9yLmggfCA0ICsrKysKPiA+ID4gIDEgZmls
ZSBjaGFuZ2VkLCA0IGluc2VydGlvbnMoKykKPiA+ID4gCj4gPiA+IGRpZmYgLS1naXQgYS9pbmNs
dWRlL2RybS9kcm1fY29ubmVjdG9yLmggYi9pbmNsdWRlL2RybS9kcm1fY29ubmVjdG9yLmgKPiA+
ID4gaW5kZXggMDJhMTMxMjAyYWRkLi5mNDNmNDBkNTg4OGEgMTAwNjQ0Cj4gPiA+IC0tLSBhL2lu
Y2x1ZGUvZHJtL2RybV9jb25uZWN0b3IuaAo+ID4gPiArKysgYi9pbmNsdWRlL2RybS9kcm1fY29u
bmVjdG9yLmgKPiA+ID4gQEAgLTUxNyw2ICs1MTcsMTAgQEAgc3RydWN0IGRybV9jb25uZWN0b3Jf
c3RhdGUgewo+ID4gPiAgCSAqIFVzZWQgYnkgdGhlIGF0b21pYyBoZWxwZXJzIHRvIHNlbGVjdCB0
aGUgZW5jb2RlciwgdGhyb3VnaCB0aGUKPiA+ID4gIAkgKiAmZHJtX2Nvbm5lY3Rvcl9oZWxwZXJf
ZnVuY3MuYXRvbWljX2Jlc3RfZW5jb2RlciBvcgo+ID4gPiAgCSAqICZkcm1fY29ubmVjdG9yX2hl
bHBlcl9mdW5jcy5iZXN0X2VuY29kZXIgY2FsbGJhY2tzLgo+ID4gCj4gPiBIb3cgYWJvdXQgdXBk
YXRpbmcgdGhpcyBwYXJ0IGFzIHdlbGwgPwo+ID4gCj4gPiAiVXNlZCBieSBib3RoIHRoZSBEUk0g
Y29yZSBhbmQgdGhlIGF0b21pYyBoZWxwZXJzIHRvIHNlbGVjdCB0aGUgZW5jb2Rlcgo+ID4gKHRo
cm91Z2ggdGhlICZkcm1fY29ubmVjdG9yX2hlbHBlcl9mdW5jcy5hdG9taWNfYmVzdF9lbmNvZGVy
KSwgYWNjZXNzIGl0Cj4gPiBhbmQgcmVwb3J0IGl0IHRvIHVzZXJzcGFjZSAodGhyb3VnaCB0aGUg
R0VUQ09OTkVDVE9SIGFuZCBHRVRFTkNPREVSCj4gPiBpb2N0bHMpLiBUaGlzIGZpZWxkIHNoYWxs
IGJlIHNldCBieSBhbGwgYXRvbWljIGRyaXZlcnMsIGVpdGhlciBkaXJlY3RseQo+ID4gb3IgdGhy
b3VnaCBhdG9taWMgaGVscGVycy4iCj4gCj4gSXQncyBraW5kYSB0d28gdGhpbmdzLCBJIHRoaW5r
IGJlc3QgdG8gZGVzY3JpYmUgaW4gdHdvIHBhcmFncmFwaHMuIEJ1dCBJCj4gY2FuIG1vdmUgdGhl
IGNvcmUgdXNhZ2UgdXAsIHNpbmNlIGFyZ3VhYmxlIG1vcmUgaW1wb3J0YW50LiBPdG9oIG1vc3QK
PiBkcml2ZXJzIHdvbid0IGNhcmUgc2luY2UgaGVscGVycyBoYW5kbGUgdGhpcywgYW5kIHRoZXkg
Y2FyZSBtb3JlIGFib3V0IGhvdwo+IEBiZXN0X2VuY29kZXIgaXMgdXNlZC4KPiAKPiBFLmcuIGNv
cmUgbmV2ZXIgY2FsbHMgdGhlIGhlbHBlciBjYWxsYmFja3MKPiBAYXRvbWljX2Jlc3RfZW5kb2Vy
L2Jlc3RfZW5jb2Rlciwgd2hpY2ggaXNuJ3QgY2xlYXIgYW55bW9yZSB3aXRoIHlvdXIKPiB3b3Jk
aW5nLiBBbmQgSSBoYXZlIGEgc3RpY2tlciBmb3IgY29yZS9oZWxwZXIgc3BsaXRzIDotKQoKV2Vu
dCBhaGVhZCB3aXRoIFNlYW4ncyBpcmMgYWNrIGFuZCBtZXJnZWQgdGhpcy4gV2UgY2FuIGJpa2Vz
aGVkIG1vcmUgbGF0ZXIKb24gSSBndWVzcyB3aXRoIG1vcmUgcGF0Y2hlcy4gSSB0aGluayBzcHJp
bmtsaW5nIGEgcGlsZSBvZiBjcm9zcwpyZWZlcmVuY2VzIG9uY2UgU2VhbidzIGFuZCB5b3VycyBw
YXRjaGVzIGFsbCBsYW5kIHdvdWxkIGJlIGdvb2QuCi1EYW5pZWwKCj4gLURhbmllbAo+ID4gCj4g
PiA+ICsJICoKPiA+ID4gKwkgKiBOT1RFOiBBdG9taWMgZHJpdmVycyBtdXN0IGZpbGwgdGhpcyBv
dXQgKGVpdGhlciB0aGVtc2VsdmVzIG9yIHRocm91Z2gKPiA+ID4gKwkgKiBoZWxwZXJzKSwgZm9y
IG90aGVyd2lzZSB0aGUgR0VUQ09OTkVDVE9SIGFuZCBHRVRFTkNPREVSIElPQ1RMcyB3aWxsCj4g
PiA+ICsJICogbm90IHJldHVybiBjb3JyZWN0IGRhdGEgdG8gdXNlcnNwYWNlLgo+ID4gPiAgCSAq
Lwo+ID4gPiAgCXN0cnVjdCBkcm1fZW5jb2RlciAqYmVzdF9lbmNvZGVyOwo+ID4gPiAgCj4gPiAK
PiA+IC0tIAo+ID4gUmVnYXJkcywKPiA+IAo+ID4gTGF1cmVudCBQaW5jaGFydAo+IAo+IC0tIAo+
IERhbmllbCBWZXR0ZXIKPiBTb2Z0d2FyZSBFbmdpbmVlciwgSW50ZWwgQ29ycG9yYXRpb24KPiBo
dHRwOi8vYmxvZy5mZndsbC5jaAoKLS0gCkRhbmllbCBWZXR0ZXIKU29mdHdhcmUgRW5naW5lZXIs
IEludGVsIENvcnBvcmF0aW9uCmh0dHA6Ly9ibG9nLmZmd2xsLmNoCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJp
LWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
