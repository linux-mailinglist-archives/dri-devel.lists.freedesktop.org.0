Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A00EA4341A
	for <lists+dri-devel@lfdr.de>; Thu, 13 Jun 2019 10:27:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3B518897D4;
	Thu, 13 Jun 2019 08:27:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x544.google.com (mail-ed1-x544.google.com
 [IPv6:2a00:1450:4864:20::544])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 70DD1897D4
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Jun 2019 08:27:08 +0000 (UTC)
Received: by mail-ed1-x544.google.com with SMTP id i11so1983937edq.0
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Jun 2019 01:27:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :references:mime-version:content-disposition:in-reply-to:user-agent;
 bh=JpfCW44p+7Uv6TDM0Ox2JVfUSTMPnSQJH7O6CJtAHBg=;
 b=nAxf4AVWj5w+UrALBV09fYU01C3AhBbL/n0k3Q4OJvFWgbjPCqHj/QVSezRcssTbsb
 84cNhLYj+R4JNRWNrE2TezdPfYkvCVlkOTGR1SH1i5ALcbQzgdL/vl2JV5fXnzzUfdzO
 VTwM/2KNd/mh3vhLoQMELPcRhbV1bTBU4/AE2bmPrlhFCYvmNfcVybzjTNfSwseSPSGc
 qlvuQ9p1BOjR6E0ReZ3e0yStA8JinnUWj17yGzfwhtN3Z+Fm3LwceooEJ+EMVWFmTeL2
 2uM7QBqHepGlAPFccdTL+wYDn/i5zgDIXyya+WtrezGlk21LnDTewAtcYtObWn4hhYt+
 FeLA==
X-Gm-Message-State: APjAAAVSSYiRianvAOmBPWwKv+Ee3CtRfffL6/fgvjvv4eS5RopSTkC6
 9cEfV9FDA4KKH2hVnpQR/1TAGA==
X-Google-Smtp-Source: APXvYqxCwLi8HVNLbbKPTVQDlfkRXd8FrOrwPs8A7BimRJIdjubuXus64EOpuJHNMfJ+L/V4tnVzzw==
X-Received: by 2002:aa7:dad6:: with SMTP id x22mr17910899eds.122.1560414427079; 
 Thu, 13 Jun 2019 01:27:07 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:569e:0:3106:d637:d723:e855])
 by smtp.gmail.com with ESMTPSA id d1sm421989ejn.11.2019.06.13.01.27.06
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Thu, 13 Jun 2019 01:27:06 -0700 (PDT)
Date: Thu, 13 Jun 2019 10:27:04 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: CK Hu <ck.hu@mediatek.com>
Subject: Re: [GIT,PULL] mediatek drm fixes for 5.2
Message-ID: <20190613082704.GI23020@phenom.ffwll.local>
References: <1560325868.3259.6.camel@mtksdaap41>
 <20190612162538.GA8035@phenom.ffwll.local>
 <1560407478.7597.5.camel@mtksdaap41>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1560407478.7597.5.camel@mtksdaap41>
X-Operating-System: Linux phenom 4.19.0-5-amd64 
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google;
 h=sender:date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=JpfCW44p+7Uv6TDM0Ox2JVfUSTMPnSQJH7O6CJtAHBg=;
 b=Lp+mKwxNDLP9fXRhdND3OKWiXBC4ikL3meHfgqN5VwW0GwrUAkL6YX4RIrZimCshmv
 g7BQkPhDzScCMB8FqKa8HXhMJ+gP8CNN7HhqqcT1nKxp0ZIPE0WePWEI2N/dB8VyOANC
 koNjB1se8WuXWqrDlCUKVE9GYVAq+8symrah0=
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
Cc: Yongqiang Niu <yongqiang.niu@mediatek.com>, dri-devel@lists.freedesktop.org,
 linux-mediatek@lists.infradead.org, Hsin-Yi Wang <hsinyi@chromium.org>,
 Daniel Vetter <daniel.vetter@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVGh1LCBKdW4gMTMsIDIwMTkgYXQgMDI6MzE6MThQTSArMDgwMCwgQ0sgSHUgd3JvdGU6Cj4g
SGksIERhbmllbDoKPiAKPiBPbiBXZWQsIDIwMTktMDYtMTIgYXQgMTg6MjUgKzAyMDAsIERhbmll
bCBWZXR0ZXIgd3JvdGU6Cj4gPiBPbiBXZWQsIEp1biAxMiwgMjAxOSBhdCAwMzo1MTowOFBNICsw
ODAwLCBDSyBIdSB3cm90ZToKPiA+ID4gSGkgRGF2ZSwgRGFuaWVsOgo+ID4gPiAKPiA+ID4gVGhp
cyBpbmNsdWRlIHVuYmluZCBlcnJvciBmaXgsIGNsb2NrIGNvbnRyb2wgZmxvdyByZWZpbmVtZW50
LCBhbmQgUFJJTUUKPiA+ID4gbW1hcCB3aXRoIHBhZ2Ugb2Zmc2V0Lgo+ID4gPiAKPiA+ID4gUmVn
YXJkcywKPiA+ID4gQ0sKPiA+ID4gCj4gPiA+IFRoZSBmb2xsb3dpbmcgY2hhbmdlcyBzaW5jZSBj
b21taXQKPiA+ID4gYTE4ODMzOWNhNWEzOTZhY2M1ODhlNTg1MWVkN2UxOWY2NmIwZWJkOToKPiA+
ID4gCj4gPiA+ICAgTGludXggNS4yLXJjMSAoMjAxOS0wNS0xOSAxNTo0NzowOSAtMDcwMCkKPiA+
ID4gCj4gPiA+IGFyZSBhdmFpbGFibGUgaW4gdGhlIEdpdCByZXBvc2l0b3J5IGF0Ogo+ID4gPiAK
PiA+ID4gICBodHRwczovL2dpdGh1Yi5jb20vY2todS1tZWRpYXRlay9saW51eC5naXQtdGFncy5n
aXQKPiA+ID4gbWVkaWF0ZWstZHJtLWZpeGVzLTUuMgo+ID4gCj4gPiBGb3IgbmV4dCB0aW1lIGFy
b3VuZCwgcGxlYXNlIG1ha2UgdGhpcyBhIHNpZ25lZCBhbm5vdGF0ZWQgdGFnLiBhbm5vdGF0ZWQK
PiA+IGJlY2F1c2UgdGhlbiBpdCdzIGxlc3MgdHlwaW5nIGZvciBtZSwgYW5kIHNpZ25lZCBiZWNh
dXNlIGl0J3Mgb24gYSBzZXJ2ZXIKPiA+IHdlIGRvbid0IG5lY2Vzc2FyaWx5IHRydXN0Lgo+IAo+
IE9LLCBJJ2QgbWFrZSBhIHNpZ25lZCBhbm5vdGF0ZWQgdGFnIGluIG5leHQgdGltZS4KPiAKPiA+
IAo+ID4gPiAKPiA+ID4gZm9yIHlvdSB0byBmZXRjaCBjaGFuZ2VzIHVwIHRvIDI0NThkOWQ2ZDk0
YmU5ODJiOTE3ZTkzYzYxYTg5YjQ0MjZmMzJlMzE6Cj4gPiA+IAo+ID4gPiAgIGRybS9tZWRpYXRl
azogY2FsbCBtdGtfZHNpX3N0b3AoKSBhZnRlciBtdGtfZHJtX2NydGNfYXRvbWljX2Rpc2FibGUo
KQo+ID4gPiAoMjAxOS0wNi0wNCAwOTo1NDo0MiArMDgwMCkKPiA+ID4gCj4gPiA+IC0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0K
PiA+ID4gSHNpbi1ZaSBXYW5nICg1KToKPiA+ID4gICAgICAgZHJtL21lZGlhdGVrOiBmaXggdW5i
aW5kIGZ1bmN0aW9ucwo+ID4gPiAgICAgICBkcm0vbWVkaWF0ZWs6IHVuYmluZCBjb21wb25lbnRz
IGluIG10a19kcm1fdW5iaW5kKCkKPiA+ID4gICAgICAgZHJtL21lZGlhdGVrOiBjYWxsIGRybV9h
dG9taWNfaGVscGVyX3NodXRkb3duKCkgd2hlbiB1bmJpbmRpbmcKPiA+ID4gZHJpdmVyCj4gPiA+
ICAgICAgIGRybS9tZWRpYXRlazogY2xlYXIgbnVtX3BpcGVzIHdoZW4gdW5iaW5kIGRyaXZlcgo+
ID4gPiAgICAgICBkcm0vbWVkaWF0ZWs6IGNhbGwgbXRrX2RzaV9zdG9wKCkgYWZ0ZXIKPiA+ID4g
bXRrX2RybV9jcnRjX2F0b21pY19kaXNhYmxlKCkKPiA+ID4gCj4gPiA+IFlvbmdxaWFuZyBOaXUg
KDIpOgo+ID4gPiAgICAgICBkcm0vbWVkaWF0ZWs6IGFkanVzdCBkZHAgY2xvY2sgY29udHJvbCBm
bG93Cj4gPiA+ICAgICAgIGRybS9tZWRpYXRlazogcmVzcGVjdCBwYWdlIG9mZnNldCBmb3IgUFJJ
TUUgbW1hcCBjYWxscwo+ID4gCj4gPiBZb3UgbWlnaHQgd2FudCB0byBsb29rIGludG8gYWxsIHRo
ZSByZWNlbnRseSBhZGRlZCBoZWxwZXJzIGZvciBtbWFwLCBJCj4gPiBkb24ndCB0aGluayBtdGsg
ZG9lcyBhbnl0aGluZyBzcGVjaWFsIGhlcmUuCj4gCj4gSWYgeW91IG1lYW4gdXNpbmcgZHJtX2dl
bV9wcmltZV9tbWFwIGFzIHRoZSBpbXBsZW1lbnRhdGlvbiBvZgo+IGRybV9kcml2ZXItPmdlbV9w
cmltZV9tbWFwLCBJIHRoaW5rIHdlIGhhdmUgZGlzY3Vzc2VkIGluIFsxXSB0aGF0Cj4gbWVkaWF0
ZWsgZHJtIHN0aWxsIG5lZWQgaXRzIG93biBpbXBsZW1lbnRhdGlvbi4KPiAKPiBbMV0gaHR0cHM6
Ly9wYXRjaHdvcmsua2VybmVsLm9yZy9wYXRjaC8xMDY1NzAwNy8KClllYWggZm9yIHJldXNpbmcg
dGhlIG92ZXJhbGwgaGVscGVycyB0aGF0J3MgY2xlYXIsIGJ1dApkcm1fZ2VtX3ByaW1lX2dlbV9t
bWFwIHNob3VsZCB3b3JrIGZvciBhbnkgZ2VtIGJhc2VkIGRyaXZlci4gSXQgZG9lc24ndApyZXF1
aXJlIHlvdSB0byB1c2Ugc3BlY2lmaWMgaGVscGVycyBhdCBhbGwuCgpJJ20gd29uZGVyaW5nIGFi
b3V0IHRoaXMgc2luY2UgSSdtIGxvb2tpbmcgcmlnaHQgbm93IGludG8gdGhpcyBhcmVhLCBhbmQK
aXQgbG9va3MgbGlrZSB3ZSBjb3VsZCBqdXN0IG1ha2UgZHJtX2dlbV9wcmltZV9tbWFwIHRoZSBk
ZWZhdWx0IGFuZCByaXAKb3V0IGFsbCB0aGUgY3VzdG9tIGRyaXZlciBpbXBsZW1lbnRhdGlvbnMu
Ci1EYW5pZWwKCj4gCj4gUmVnYXJkcywKPiBDSwo+IAo+ID4gCj4gPiAKPiA+ID4gCj4gPiA+ICBk
cml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2RybV9jcnRjLmMgfCAzMAo+ID4gPiArKysrKyst
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0KPiA+ID4gIGRyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9t
dGtfZHJtX2Rydi5jICB8ICA4ICsrKy0tLS0tCj4gPiA+ICBkcml2ZXJzL2dwdS9kcm0vbWVkaWF0
ZWsvbXRrX2RybV9nZW0uYyAgfCAgNyArKysrKystCj4gPiA+ICBkcml2ZXJzL2dwdS9kcm0vbWVk
aWF0ZWsvbXRrX2RzaS5jICAgICAgfCAxMiArKysrKysrKysrKy0KPiA+ID4gIDQgZmlsZXMgY2hh
bmdlZCwgMjYgaW5zZXJ0aW9ucygrKSwgMzEgZGVsZXRpb25zKC0pCj4gPiAKPiA+IFB1bGxlZCwg
dGhhbmtzLgo+ID4gLURhbmllbAo+ID4gCj4gPiA+IAo+ID4gPiBfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwo+ID4gPiBkcmktZGV2ZWwgbWFpbGluZyBsaXN0
Cj4gPiA+IGRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKPiA+ID4gaHR0cHM6Ly9saXN0
cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwKPiA+IAo+IAo+IAoK
LS0gCkRhbmllbCBWZXR0ZXIKU29mdHdhcmUgRW5naW5lZXIsIEludGVsIENvcnBvcmF0aW9uCmh0
dHA6Ly9ibG9nLmZmd2xsLmNoCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNr
dG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2Ry
aS1kZXZlbA==
