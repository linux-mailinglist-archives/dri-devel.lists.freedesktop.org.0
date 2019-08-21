Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A397A97F3F
	for <lists+dri-devel@lfdr.de>; Wed, 21 Aug 2019 17:44:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5498889D61;
	Wed, 21 Aug 2019 15:44:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x541.google.com (mail-ed1-x541.google.com
 [IPv6:2a00:1450:4864:20::541])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4952289D61
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Aug 2019 15:44:19 +0000 (UTC)
Received: by mail-ed1-x541.google.com with SMTP id h13so3442509edq.10
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Aug 2019 08:44:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :references:mime-version:content-disposition
 :content-transfer-encoding:in-reply-to:user-agent;
 bh=gZEik5NxMiAvDnvrlwnW3/V/xyNimdgxpCyuusfjVdk=;
 b=MiuESzNNM5379bIhRwG91H+ylvnXgMcbd3e1YVW8v+JmhoZCLTB0R7XwEujQbejSKr
 XO5di7qSgdd3165/zOPnGTN5YvQBrTAb54/vuIgqabbxw+FaAdD1LEXZYTYltA02t7xD
 f79Qn0dQVz8RsI7/DN5X/njUlY4HOWg5btyhBlUar4px9+N9T3kDHxbDHxEgH30hEn18
 PwCc57c9ext/GRUMTFQ80DsOTWFT2c0iQghIC0Z+evHx/1hCN0NuVwuZzU6vFUvm5eoD
 L123hQB6TGj8pSIj2oEvJJNmPUn9Hr7fmA8r2EwSQtbnq1ISQrVYCxR/0HBPMmKwqPzZ
 FjyQ==
X-Gm-Message-State: APjAAAWkPOgA4/TEe5KHxP3/X500Mn88FOu9BEvjbFpiBluhvEe1rwde
 jDVujiJE3AJ3uHO/MDWj5QUlKA==
X-Google-Smtp-Source: APXvYqzuxWAe0b9gjKQLihvYtv8UwVGpsfE4OgBt3fmOfz4vKSdgX4yprHK+wbOpvZJMej41RbgSJw==
X-Received: by 2002:a17:906:254f:: with SMTP id
 j15mr31462354ejb.69.1566402257805; 
 Wed, 21 Aug 2019 08:44:17 -0700 (PDT)
Received: from phenom.ffwll.local (212-51-149-96.fiber7.init7.net.
 [212.51.149.96])
 by smtp.gmail.com with ESMTPSA id m26sm4221138edd.19.2019.08.21.08.44.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 21 Aug 2019 08:44:16 -0700 (PDT)
Date: Wed, 21 Aug 2019 17:44:14 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: "Koenig, Christian" <Christian.Koenig@amd.com>
Subject: Re: [PATCH 1/3] dma_resv: prime lockdep annotations
Message-ID: <20190821154414.GL11147@phenom.ffwll.local>
References: <20190820145336.15649-1-daniel.vetter@ffwll.ch>
 <20190820145336.15649-2-daniel.vetter@ffwll.ch>
 <e1e8702b-a849-c8cb-3f41-16ce21a823b7@amd.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <e1e8702b-a849-c8cb-3f41-16ce21a823b7@amd.com>
X-Operating-System: Linux phenom 5.2.0-2-amd64 
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google;
 h=sender:date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to
 :user-agent;
 bh=gZEik5NxMiAvDnvrlwnW3/V/xyNimdgxpCyuusfjVdk=;
 b=HRHHPTOOo8A7/FlKeaoTU1DegT0yz+4QxuGXkmlHRSfaKSaO/VL/d+aow4DrM2wJxY
 gatoLYPbjE8FwxNvxnTCsI5YNkDuei9juUDf+4Kec4vsNTa7vcW00x30+i2wp4u11wZw
 6E5r0rk61MdRHsfxj3DoKkpWGGIFN6wUG+sQI=
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
Cc: Thomas Hellstrom <thellstrom@vmware.com>,
 Tomeu Vizoso <tomeu.vizoso@collabora.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 VMware Graphics <linux-graphics-maintainer@vmware.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Thomas Zimmermann <tzimmermann@suse.de>,
 Daniel Vetter <daniel.vetter@intel.com>, "Deucher,
 Alexander" <Alexander.Deucher@amd.com>, Dave Airlie <airlied@redhat.com>,
 Ben Skeggs <bskeggs@redhat.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCBBdWcgMjAsIDIwMTkgYXQgMDI6NTY6MzZQTSArMDAwMCwgS29lbmlnLCBDaHJpc3Rp
YW4gd3JvdGU6Cj4gQW0gMjAuMDguMTkgdW0gMTY6NTMgc2NocmllYiBEYW5pZWwgVmV0dGVyOgo+
ID4gRnVsbCBhdWRpdCBvZiBldmVyeW9uZToKPiA+Cj4gPiAtIGk5MTUsIHJhZGVvbiwgYW1kZ3B1
IHNob3VsZCBiZSBjbGVhbiBwZXIgdGhlaXIgbWFpbnRhaW5lcnMuCj4gPgo+ID4gLSB2cmFtIGhl
bHBlcnMgc2hvdWxkIGJlIGZpbmUsIHRoZXkgZG9uJ3QgZG8gY29tbWFuZCBzdWJtaXNzaW9uLCBz
bwo+ID4gICAgcmVhbGx5IG5vIGJ1c2luZXNzIGhvbGRpbmcgc3RydWN0X211dGV4IHdoaWxlIGRv
aW5nIGNvcHlfKl91c2VyLiBCdXQKPiA+ICAgIEkgaGF2ZW4ndCBjaGVja2VkIHRoZW0gYWxsLgo+
ID4KPiA+IC0gcGFuZnJvc3Qgc2VlbXMgdG8gZG1hX3Jlc3ZfbG9jayBvbmx5IGluIHBhbmZyb3N0
X2pvYl9wdXNoLCB3aGljaAo+ID4gICAgbG9va3MgY2xlYW4uCj4gPgo+ID4gLSB2M2QgaG9sZHMg
ZG1hX3Jlc3YgbG9ja3MgaW4gdGhlIHRhaWwgb2YgaXRzIHYzZF9zdWJtaXRfY2xfaW9jdGwoKSwK
PiA+ICAgIGNvcHlpbmcgZnJvbS90byB1c2Vyc3BhY2UgaGFwcGVucyBhbGwgaW4gdjNkX2xvb2t1
cF9ib3Mgd2hpY2ggaXMKPiA+ICAgIG91dHNpZGUgb2YgdGhlIGNyaXRpY2FsIHNlY3Rpb24uCj4g
Pgo+ID4gLSB2bXdnZnggaGFzIGEgYnVuY2ggb2YgaW9jdGxzIHRoYXQgZG8gdGhlaXIgb3duIGNv
cHlfKl91c2VyOgo+ID4gICAgLSB2bXdfZXhlY2J1Zl9wcm9jZXNzOiBGaXJzdCB0aGlzIGRvZXMg
c29tZSBjb3BpZXMgaW4KPiA+ICAgICAgdm13X2V4ZWNidWZfY21kYnVmKCkgYW5kIGFsc28gaW4g
dGhlIHZtd19leGVjYnVmX3Byb2Nlc3MoKSBpdHNlbGYuCj4gPiAgICAgIFRoZW4gY29tZXMgdGhl
IHVzdWFsIHR0bSByZXNlcnZlL3ZhbGlkYXRlIHNlcXVlbmNlLCB0aGVuIGFjdHVhbAo+ID4gICAg
ICBzdWJtaXNzaW9uL2ZlbmNpbmcsIHRoZW4gdW5yZXNlcnZpbmcsIGFuZCBmaW5hbGx5IHNvbWUg
bW9yZQo+ID4gICAgICBjb3B5X3RvX3VzZXIgaW4gdm13X2V4ZWNidWZfY29weV9mZW5jZV91c2Vy
LiBHbG9zc2luZyBvdmVyIHRvbnMgb2YKPiA+ICAgICAgZGV0YWlscywgYnV0IGxvb2tzIGFsbCBz
YWZlLgo+ID4gICAgLSB2bXdfZmVuY2VfZXZlbnRfaW9jdGw6IE5vIHR0bV9yZXNlcnZlL2RtYV9y
ZXN2X2xvY2sgYW55d2hlcmUgdG8gYmUKPiA+ICAgICAgc2Vlbiwgc2VlbXMgdG8gb25seSBjcmVh
dGUgYSBmZW5jZSBhbmQgY29weSBpdCBvdXQuCj4gPiAgICAtIGEgcGlsZSBvZiBzbWFsbGVyIGlv
Y3RsIGluIHZtd2dmeF9pb2N0bC5jLCBubyByZXNlcnZhdGlvbnMgdG8gYmUKPiA+ICAgICAgZm91
bmQgdGhlcmUuCj4gPiAgICBTdW1tYXJ5OiB2bXdnZnggc2VlbXMgdG8gYmUgZmluZSB0b28uCj4g
Pgo+ID4gLSB2aXJ0aW86IFRoZXJlJ3MgdmlydGlvX2dwdV9leGVjYnVmZmVyX2lvY3RsLCB3aGlj
aCBkb2VzIGFsbCB0aGUKPiA+ICAgIGNvcHlpbmcgZnJvbSB1c2Vyc3BhY2UgYmVmb3JlIGV2ZW4g
bG9va2luZyB1cCBvYmplY3RzIHRocm91Z2ggdGhlaXIKPiA+ICAgIGhhbmRsZXMsIHNvIHNhZmUu
IFBsdXMgdGhlIGdldHBhcmFtL2dldGNhcHMgaW9jdGwsIGFsc28gYm90aCBzYWZlLgo+ID4KPiA+
IC0gcXhsIG9ubHkgaGFzIHF4bF9leGVjYnVmZmVyX2lvY3RsLCB3aGljaCBjYWxscyBpbnRvCj4g
PiAgICBxeGxfcHJvY2Vzc19zaW5nbGVfY29tbWFuZC4gVGhlcmUncyBhIGxvdmVseSBjb21tZW50
IGJlZm9yZSB0aGUKPiA+ICAgIF9fY29weV9mcm9tX3VzZXJfaW5hdG9taWMgdGhhdCB0aGUgc2xv
d3BhdGggc2hvdWxkIGJlIGNvcGllZCBmcm9tCj4gPiAgICBpOTE1LCBidXQgSSBndWVzcyB0aGF0
IG5ldmVyIGhhcHBlbmVkLiBUcnkgbm90IHRvIGJlIHVubHVja3kgYW5kIGdldAo+ID4gICAgeW91
ciBDUyBkYXRhIGV2aWN0ZWQgYmV0d2VlbiB3aGVuIGl0J3Mgd3JpdHRlbiBhbmQgdGhlIGtlcm5l
bCB0cmllcwo+ID4gICAgdG8gcmVhZCBpdC4gVGhlIG9ubHkgb3RoZXIgY29weV9mcm9tX3VzZXIg
aXMgZm9yIHJlbG9jcywgYnV0IHRob3NlCj4gPiAgICBhcmUgZG9uZSBiZWZvcmUgcXhsX3JlbGVh
c2VfcmVzZXJ2ZV9saXN0KCksIHdoaWNoIHNlZW1zIHRvIGJlIHRoZQo+ID4gICAgb25seSB0aGlu
ZyByZXNlcnZpbmcgYnVmZmVycyAoaW4gdGhlIHR0bS9kbWFfcmVzdiBzZW5zZSkgaW4gdGhhdAo+
ID4gICAgY29kZS4gU28gbG9va3Mgc2FmZS4KPiA+Cj4gPiAtIEEgZGVidWdmcyBmaWxlIGluIG5v
dXZlYXVfZGVidWdmc19wc3RhdGVfc2V0KCkgYW5kIHRoZSB1c2lmIGlvY3RsIGluCj4gPiAgICB1
c2lmX2lvY3RsKCkgbG9vayBzYWZlLiBub3V2ZWF1X2dlbV9pb2N0bF9wdXNoYnVmKCkgb3RvaCBi
cmVha3MgdGhpcwo+ID4gICAgZXZlcnl3aGVyZSBhbmQgbmVlZHMgdG8gYmUgZml4ZWQgdXAuCj4g
Pgo+ID4gQ2M6IEFsZXggRGV1Y2hlciA8YWxleGFuZGVyLmRldWNoZXJAYW1kLmNvbT4KPiA+IENj
OiBDaHJpc3RpYW4gS8O2bmlnIDxjaHJpc3RpYW4ua29lbmlnQGFtZC5jb20+Cj4gPiBDYzogQ2hy
aXMgV2lsc29uIDxjaHJpc0BjaHJpcy13aWxzb24uY28udWs+Cj4gPiBDYzogVGhvbWFzIFppbW1l
cm1hbm4gPHR6aW1tZXJtYW5uQHN1c2UuZGU+Cj4gPiBDYzogUm9iIEhlcnJpbmcgPHJvYmhAa2Vy
bmVsLm9yZz4KPiA+IENjOiBUb21ldSBWaXpvc28gPHRvbWV1LnZpem9zb0Bjb2xsYWJvcmEuY29t
Pgo+ID4gQ2M6IEVyaWMgQW5ob2x0IDxlcmljQGFuaG9sdC5uZXQ+Cj4gPiBDYzogRGF2ZSBBaXJs
aWUgPGFpcmxpZWRAcmVkaGF0LmNvbT4KPiA+IENjOiBHZXJkIEhvZmZtYW5uIDxrcmF4ZWxAcmVk
aGF0LmNvbT4KPiA+IENjOiBCZW4gU2tlZ2dzIDxic2tlZ2dzQHJlZGhhdC5jb20+Cj4gPiBDYzog
IlZNd2FyZSBHcmFwaGljcyIgPGxpbnV4LWdyYXBoaWNzLW1haW50YWluZXJAdm13YXJlLmNvbT4K
PiA+IENjOiBUaG9tYXMgSGVsbHN0cm9tIDx0aGVsbHN0cm9tQHZtd2FyZS5jb20+Cj4gPiBTaWdu
ZWQtb2ZmLWJ5OiBEYW5pZWwgVmV0dGVyIDxkYW5pZWwudmV0dGVyQGludGVsLmNvbT4KPiAKPiBS
ZXZpZXdlZC1ieTogQ2hyaXN0aWFuIEvDtm5pZyA8Y2hyaXN0aWFuLmtvZW5pZ0BhbWQuY29tPgoK
RG9lcyB0aGlzIHItYiBqdXN0IGFwcGx5IHRvIHJhZGVvbi9hbWRncHUgb3IgZm9yIHRoZSBmdWxs
IGF1ZGl0PwotRGFuaWVsCgo+IAo+ID4gLS0tCj4gPiAgIGRyaXZlcnMvZG1hLWJ1Zi9kbWEtcmVz
di5jIHwgMTIgKysrKysrKysrKysrCj4gPiAgIDEgZmlsZSBjaGFuZ2VkLCAxMiBpbnNlcnRpb25z
KCspCj4gPgo+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZG1hLWJ1Zi9kbWEtcmVzdi5jIGIvZHJp
dmVycy9kbWEtYnVmL2RtYS1yZXN2LmMKPiA+IGluZGV4IDQyYThmM2YxMTY4MS4uM2VkY2ExMGQz
ZmFmIDEwMDY0NAo+ID4gLS0tIGEvZHJpdmVycy9kbWEtYnVmL2RtYS1yZXN2LmMKPiA+ICsrKyBi
L2RyaXZlcnMvZG1hLWJ1Zi9kbWEtcmVzdi5jCj4gPiBAQCAtMzQsNiArMzQsNyBAQAo+ID4gICAK
PiA+ICAgI2luY2x1ZGUgPGxpbnV4L2RtYS1yZXN2Lmg+Cj4gPiAgICNpbmNsdWRlIDxsaW51eC9l
eHBvcnQuaD4KPiA+ICsjaW5jbHVkZSA8bGludXgvc2NoZWQvbW0uaD4KPiA+ICAgCj4gPiAgIC8q
Kgo+ID4gICAgKiBET0M6IFJlc2VydmF0aW9uIE9iamVjdCBPdmVydmlldwo+ID4gQEAgLTEwNyw2
ICsxMDgsMTcgQEAgdm9pZCBkbWFfcmVzdl9pbml0KHN0cnVjdCBkbWFfcmVzdiAqb2JqKQo+ID4g
ICAJCQkmcmVzZXJ2YXRpb25fc2VxY291bnRfY2xhc3MpOwo+ID4gICAJUkNVX0lOSVRfUE9JTlRF
UihvYmotPmZlbmNlLCBOVUxMKTsKPiA+ICAgCVJDVV9JTklUX1BPSU5URVIob2JqLT5mZW5jZV9l
eGNsLCBOVUxMKTsKPiA+ICsKPiA+ICsJaWYgKElTX0VOQUJMRUQoQ09ORklHX0xPQ0tERVApKSB7
Cj4gPiArCQlpZiAoY3VycmVudC0+bW0pCj4gPiArCQkJZG93bl9yZWFkKCZjdXJyZW50LT5tbS0+
bW1hcF9zZW0pOwo+ID4gKwkJd3dfbXV0ZXhfbG9jaygmb2JqLT5sb2NrLCBOVUxMKTsKPiA+ICsJ
CWZzX3JlY2xhaW1fYWNxdWlyZShHRlBfS0VSTkVMKTsKPiA+ICsJCWZzX3JlY2xhaW1fcmVsZWFz
ZShHRlBfS0VSTkVMKTsKPiA+ICsJCXd3X211dGV4X3VubG9jaygmb2JqLT5sb2NrKTsKPiA+ICsJ
CWlmIChjdXJyZW50LT5tbSkKPiA+ICsJCQl1cF9yZWFkKCZjdXJyZW50LT5tbS0+bW1hcF9zZW0p
Owo+ID4gKwl9Cj4gPiAgIH0KPiA+ICAgRVhQT1JUX1NZTUJPTChkbWFfcmVzdl9pbml0KTsKPiA+
ICAgCj4gCgotLSAKRGFuaWVsIFZldHRlcgpTb2Z0d2FyZSBFbmdpbmVlciwgSW50ZWwgQ29ycG9y
YXRpb24KaHR0cDovL2Jsb2cuZmZ3bGwuY2gKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlz
dGluZm8vZHJpLWRldmVs
