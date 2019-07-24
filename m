Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F7677336E
	for <lists+dri-devel@lfdr.de>; Wed, 24 Jul 2019 18:13:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 513266E5E3;
	Wed, 24 Jul 2019 16:13:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 19D756E5E3
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Jul 2019 16:13:15 +0000 (UTC)
Received: by mail-wr1-x442.google.com with SMTP id x4so47582640wrt.6
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Jul 2019 09:13:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=tHSJO99z0PFeo09/1yisiBiCmy71HfpvqLaGWZDlm38=;
 b=pcWhGOmX+3xeOgFKLM6Fktjq0ycUcxz61/3CMRg+fJBKjJU5Y31taq2Jxhl5O0T6zX
 O5OBcYvdcDSQpAxlNNEVI7HoY0PNn3bBr+1xwZwqNiMiThqkU/fBDciY1essHv6+6tTf
 MILLGV8NE3pAAF+mtfDW/xHmLfWaQ/zLDZ2R92zLnUd2LvmY7dJei+Kc0K6ZIkf6Tn5a
 ORrg2hej4uarRxPMdHK+mycgBTad89gwUruGkZNbhvdUcJDsxrdw0qtrkfdSCQuIKt3O
 MJfLdj9U5oCp2gAO1dPmAn/lRX0FxvpE4WVFYAQeaBTk0Hxt4xVbEDzkSrXgcKS9p/r/
 PDLQ==
X-Gm-Message-State: APjAAAWHY+piKov3O6MNdnXN+gtiThW2TXpUgra88ARs/kWaxK5Sd6cC
 jnPAntIUMRFZ/OH+UG5e+RHJT5lx
X-Google-Smtp-Source: APXvYqz084EQnf82dRNSfM1ksKw5MtqnyGIOlRYyYnaaR5RfCyQdGcW0POZi/Q5SvjcATHnm89LCAA==
X-Received: by 2002:adf:ab51:: with SMTP id r17mr62224870wrc.95.1563984793416; 
 Wed, 24 Jul 2019 09:13:13 -0700 (PDT)
Received: from arch-x1c3 ([2a00:5f00:102:0:9665:9cff:feee:aa4d])
 by smtp.gmail.com with ESMTPSA id j9sm52718635wrn.81.2019.07.24.09.13.12
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Wed, 24 Jul 2019 09:13:12 -0700 (PDT)
Date: Wed, 24 Jul 2019 17:12:54 +0100
From: Emil Velikov <emil.l.velikov@gmail.com>
To: dri-devel@lists.freedesktop.org, Deepak Rawat <drawat@vmware.com>
Subject: Re: [PATCH 2/3] drm/vmwgfx: add local DRM_AUTH check for PRIME
 TO/FROM HANDLE
Message-ID: <20190724161254.GC24644@arch-x1c3>
References: <20190722174025.9830-1-emil.l.velikov@gmail.com>
 <20190722174025.9830-2-emil.l.velikov@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190722174025.9830-2-emil.l.velikov@gmail.com>
User-Agent: Mutt/1.11.4 (2019-03-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=tHSJO99z0PFeo09/1yisiBiCmy71HfpvqLaGWZDlm38=;
 b=FV+q81Z8OPeWMZ/Dbq+8IQW77RKsD1SISGw1yFnd71374G0LYvlsj4vH/oaICr8q+v
 D3jIETLPlUDKoJ3Rmf1x8Y4v6qR/8OQO/zmTNWOBSM68NT6iEitwCIBC/ODUWCaFV1BU
 IJZGsis1TGcKMkflZOrA7fa/DpEI3YTeMueDYL4bUYicrhFCrk9Lax+rNr5uZyLJxDZd
 MDzQphc2OVFSUVMHu0sXtPYfGOktFmri+4orRMfEDM75hkzq/Xtt8Q/jwhTHxPJkumhU
 yFUQ+x3DWDTg1YLtzvOsRNXCwXY6BwTQ+b4QFqgPIyshEdmU3bypcw1sDSoDIOCRQ61+
 WrnA==
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
 VMware Graphics <linux-graphics-maintainer@vmware.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMjAxOS8wNy8yMiwgRW1pbCBWZWxpa292IHdyb3RlOgo+IEZyb206IEVtaWwgVmVsaWtvdiA8
ZW1pbC52ZWxpa292QGNvbGxhYm9yYS5jb20+Cj4gCj4gUmVhbGlzdGljYWxseSBubyBkcml2ZXJz
LCBidXQgdm13Z2Z4IGNhcmUgYWJvdXQgdGhlIERSTV9BVVRIIGZsYWcgaGVyZS4KPiAKPiBGb2xs
b3ctdXAgd29yayBpbiB0aGlzIGRyaXZlciB3aWxsIHByb3Blcmx5IGlzb2xhdGUgcHJpbWFyeSBj
bGllbnRzIGZyb20KPiBkaWZmZXJlbnQgbWFzdGVyIHJlYWxtcywgdGh1cyB3ZSdsbCBubyBsb25n
ZXIgbmVlZCB0byBwYXJzZSBfYW55XyBpb2N0bAo+IGZsYWdzLgo+IAo+IFVudGlsIHRoYXQgd29y
ayBsYW5kcywgYWRkIGEgbG9jYWwgd29ya2Fyb3VuZC4KPiAKPiBDYzogVk13YXJlIEdyYXBoaWNz
IDxsaW51eC1ncmFwaGljcy1tYWludGFpbmVyQHZtd2FyZS5jb20+Cj4gQ2M6IFRob21hcyBIZWxs
c3Ryb20gPHRoZWxsc3Ryb21Adm13YXJlLmNvbT4KPiBTaWduZWQtb2ZmLWJ5OiBFbWlsIFZlbGlr
b3YgPGVtaWwudmVsaWtvdkBjb2xsYWJvcmEuY29tPgo+IC0tLQo+IEknZCBsaWtlIHRvIG1lcmdl
IHRoaXMgdGhyb3VnaCB0aGUgZHJtLW1pc2MgdHJlZS4gQWNrIGFuZCByYiBhcmUKPiBhcHByZWNp
YXRlZC4KPiAKPiBUaGFua3MKPiBFbWlsCj4gLS0tCj4gIGRyaXZlcnMvZ3B1L2RybS92bXdnZngv
dm13Z2Z4X2Rydi5jIHwgOSArKysrKysrKysKPiAgMSBmaWxlIGNoYW5nZWQsIDkgaW5zZXJ0aW9u
cygrKQo+IAo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vdm13Z2Z4L3Ztd2dmeF9kcnYu
YyBiL2RyaXZlcnMvZ3B1L2RybS92bXdnZngvdm13Z2Z4X2Rydi5jCj4gaW5kZXggMjc1ZDkwZmUy
YTI1Li4zMmMxOGJiNDgyYTYgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL3Ztd2dmeC92
bXdnZnhfZHJ2LmMKPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vdm13Z2Z4L3Ztd2dmeF9kcnYuYwo+
IEBAIC0xMTMxLDYgKzExMzEsMTUgQEAgc3RhdGljIGxvbmcgdm13X2dlbmVyaWNfaW9jdGwoc3Ry
dWN0IGZpbGUgKmZpbHAsIHVuc2lnbmVkIGludCBjbWQsCj4gIAl9IGVsc2UgaWYgKCFkcm1faW9j
dGxfZmxhZ3MobnIsICZmbGFncykpCj4gIAkJcmV0dXJuIC1FSU5WQUw7Cj4gIAo+ICsJLyoKPiAr
CSAqIExpdHRsZSB3b3JrYXJvdW5kIHVudGlsIHRoZSB2bXdnZnggcGF0Y2hlcyBwcm92aWRpbmcg
aXNvbGF0aW9uIG9mCj4gKwkgKiBwcmltYXJ5IGNsaWVudHMgZnJvbSBkaWZmZXJlbnQgbWFzdGVy
IHJlYWxtcyBsYW5kcy4KPiArCSAqIFdpdGggdGhhdCB3b3JrLCB3ZSdsbCBubyBsb25nZXIgbmVl
ZCB0byBwYXJzZSBfYW55XyBpb2N0bCBmbGFncy4KPiArCSAqLwo+ICsJaWYgKG5yID09IDB4MmQg
LyogRFJNX0lPQ1RMX1BSSU1FX0hBTkRMRV9UT19GRCAqLyB8fAo+ICsJICAgIG5yID09IDB4MmUg
LyogRFJNX0lPQ1RMX1BSSU1FX0ZEX1RPX0hBTkRMRSAqLykKPiArCQlmbGFncyAhPSBEUk1fQVVU
SDsKPiArCj4gIAl2bWFzdGVyID0gdm13X21hc3Rlcl9jaGVjayhkZXYsIGZpbGVfcHJpdiwgZmxh
Z3MpOwo+ICAJaWYgKElTX0VSUih2bWFzdGVyKSkgewo+ICAJCXJldCA9IFBUUl9FUlIodm1hc3Rl
cik7Cj4gLS0gCgpIaSBEZWVwYWssCgpBcyBmYXIgYXMgSSBjYW4gdGVsbCBUaG9tYXMgaXMgb24g
aG9saWRheXMgZm9yIGFub3RoZXIgMisgd2Vla3MuCgpJcyB0aGVyZSBhbnlvbmUgZWxzZSBpbiB0
aGUgdGVhbSB3aG8gY2FuIHJldmlldyB0aGUgVk1XYXJlIHBhdGNoZXMgb2YKdGhpcyBzZXJpZXM/
IEkgdGVzdGVkIHRoZSBsb3QgcXVpY2tseSwgYnV0IGFkZGl0aW9uYWwgY29uZmlybWF0aW9uIHdv
dWxkCmJlIGFwcHJlY2lhdGVkLgoKWW91IGNhbiBmaW5kIHRoZSBzZXJpZXMgdmlhIHRoZSAiVk13
YXJlIEdyYXBoaWNzIiBhbGlhcywgb3IgaW4gdGhlCnBhdGNod29yayBsaW5rIGJlbG93LgoKaHR0
cHM6Ly9wYXRjaHdvcmsuZnJlZWRlc2t0b3Aub3JnL3Nlcmllcy82NDAyNC8KClRoYW5rcwpFbWls
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZl
bCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xp
c3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
