Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EAF6DAE9D
	for <lists+dri-devel@lfdr.de>; Thu, 17 Oct 2019 15:40:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E3EE86EAA0;
	Thu, 17 Oct 2019 13:40:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F15FC6EAA0
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Oct 2019 13:39:58 +0000 (UTC)
Received: by mail-wr1-x441.google.com with SMTP id r5so2384101wrm.12
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Oct 2019 06:39:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=nGdIYkBoWouhui5JZwa5SxA1USJYrGRfLAGOfC1qQUE=;
 b=ui5loldggbEiH6D8EtGtUhH+ppBHIQ/5/e+QiwXIBevDhUrt9GhzZey+FnnxR7F2zf
 C8Kxl5/VxdbN+wqc/23qc6thpKMRRfNnbXTAPrpsaPeBDMR/pPs8Fk186Vg8wz7cLZgs
 Wu6jMFsccXfO05E+qMlLbCxEb7i0DKL3MTvqcBXNb8JBV0BfscqFtknl2Bg2AYXQdBfx
 EOb+5fIZjO5IZBnmcMsn8V4PUTl6+vK1+DOiTGNQ/mlUJzVs59RpITKdZEfFNrzceBAP
 Iy+X9fZ5/D0pPLxVLp+ViWF2PNb7J1Tqwq67AWsNhM0vPzDKmoUAlYHnvnZJwWShLnZh
 Wagg==
X-Gm-Message-State: APjAAAW69ebxzbGz5EUA78Iz/vlvBwzRVXZiK8R2Hyo4u14wqNdkP9ay
 W8qi31YRmFHXbI8Zyudj7Njr6Q==
X-Google-Smtp-Source: APXvYqy4Lrrg4pMfTd+atu6SWJQ7WAc2FDA1OuzXE16c+jlAXvx7iaUxxV+K+zpm0rWL0ddLU3HqQg==
X-Received: by 2002:a5d:4644:: with SMTP id j4mr2365010wrs.355.1571319597038; 
 Thu, 17 Oct 2019 06:39:57 -0700 (PDT)
Received: from holly.lan (cpc141214-aztw34-2-0-cust773.18-1.cable.virginm.net.
 [86.9.19.6])
 by smtp.gmail.com with ESMTPSA id k8sm777915wrg.15.2019.10.17.06.39.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Oct 2019 06:39:55 -0700 (PDT)
Date: Thu, 17 Oct 2019 14:39:54 +0100
From: Daniel Thompson <daniel.thompson@linaro.org>
To: kgunda@codeaurora.org
Subject: Re: [PATCH V7 6/6] backlight: qcom-wled: Add auto string detection
 logic
Message-ID: <20191017133954.7vgqjgwxojmjw446@holly.lan>
References: <1571220826-7740-1-git-send-email-kgunda@codeaurora.org>
 <1571220826-7740-7-git-send-email-kgunda@codeaurora.org>
 <20191017112941.qqvgboyambzw63i3@holly.lan>
 <fa32f7ec727cb2626ad877a6cef32a1b@codeaurora.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <fa32f7ec727cb2626ad877a6cef32a1b@codeaurora.org>
User-Agent: NeoMutt/20180716
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=nGdIYkBoWouhui5JZwa5SxA1USJYrGRfLAGOfC1qQUE=;
 b=EeC7H7ue3oN1wyNo5+y+h/f3QtZwbPbLcR8bvVPiUDCnvQ1Wzzk22Y9y+SWAeu3llf
 RurKgJ3iIuYu/Et+Jldq3rRCJK+O1oCBGPuIoQNEb/bzD4U2PZFn/hwgLd+zF9vXA3Ij
 NYkpxgZCWqu4QiJ5veb+lqQbk0AsCybJARVL08fZusOFmSiHSGhiOnk4yOHRhqDmY3tn
 ZZyKt5J3y+I2fnGBXO+Yca1TaceT4qVU+oy+/27lbS4BQs/tZs2GQzAxgD7jodqHN953
 qu1oLELMNkcdB2ndjb9exvZknfturibZR8zRbaNgoN/iNeuKYk5KavYeyrGElH8K4Ux9
 9B0A==
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
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org,
 linux-fbdev@vger.kernel.org, b.zolnierkie@samsung.com, jingoohan1@gmail.com,
 Andy Gross <agross@kernel.org>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, bjorn.andersson@linaro.org,
 robh+dt@kernel.org, jacek.anaszewski@gmail.com, pavel@ucw.cz,
 linux-arm-msm@vger.kernel.org, lee.jones@linaro.org,
 linux-leds@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVGh1LCBPY3QgMTcsIDIwMTkgYXQgMDU6NDc6NDdQTSArMDUzMCwga2d1bmRhQGNvZGVhdXJv
cmEub3JnIHdyb3RlOgo+IE9uIDIwMTktMTAtMTcgMTY6NTksIERhbmllbCBUaG9tcHNvbiB3cm90
ZToKPiA+IE9uIFdlZCwgT2N0IDE2LCAyMDE5IGF0IDAzOjQzOjQ2UE0gKzA1MzAsIEtpcmFuIEd1
bmRhIHdyb3RlOgo+ID4gPiBUaGUgYXV0byBzdHJpbmcgZGV0ZWN0aW9uIGFsZ29yaXRobSBjaGVj
a3MgaWYgdGhlIGN1cnJlbnQgV0xFRAo+ID4gPiBzaW5rIGNvbmZpZ3VyYXRpb24gaXMgdmFsaWQu
IEl0IHRyaWVzIGVuYWJsaW5nIGV2ZXJ5IHNpbmsgYW5kCj4gPiA+IGNoZWNrcyBpZiB0aGUgT1ZQ
IGZhdWx0IGlzIG9ic2VydmVkLiBCYXNlZCBvbiB0aGlzIGluZm9ybWF0aW9uCj4gPiA+IGl0IGRl
dGVjdHMgYW5kIGVuYWJsZXMgdGhlIHZhbGlkIHNpbmsgY29uZmlndXJhdGlvbi4KPiA+ID4gQXV0
byBjYWxpYnJhdGlvbiB3aWxsIGJlIHRyaWdnZXJlZCB3aGVuIHRoZSBPVlAgZmF1bHQgaW50ZXJy
dXB0cwo+ID4gPiBhcmUgc2VlbiBmcmVxdWVudGx5IHRoZXJlYnkgaXQgdHJpZXMgdG8gZml4IHRo
ZSBzaW5rIGNvbmZpZ3VyYXRpb24uCj4gPiA+IAo+ID4gPiBUaGUgYXV0by1kZXRlY3Rpb24gYWxz
byBraWNrcyBpbiB3aGVuIHRoZSBjb25uZWN0ZWQgTEVEIHN0cmluZwo+ID4gPiBvZiB0aGUgZGlz
cGxheS1iYWNrbGlnaHQgbWFsZnVuY3Rpb25zIChiZWNhdXNlIG9mIGRhbWFnZSkgYW5kCj4gPiA+
IHJlcXVpcmVzIHRoZSBkYW1hZ2VkIHN0cmluZyB0byBiZSB0dXJuZWQgb2ZmIHRvIHByZXZlbnQg
dGhlCj4gPiA+IGNvbXBsZXRlIHBhbmVsIGFuZC9vciBib2FyZCBmcm9tIGJlaW5nIGRhbWFnZWQu
Cj4gPiA+IAo+ID4gPiBTaWduZWQtb2ZmLWJ5OiBLaXJhbiBHdW5kYSA8a2d1bmRhQGNvZGVhdXJv
cmEub3JnPgo+ID4gCj4gPiBJdCdzIGEgY29tcGxleCBiaXQgb2YgY29kZSBidXQgSSdtIE9LIHdp
dGggaXQgaW4gcHJpbmNpcGxlLiBFdmVyeXRoaW5nCj4gPiBiZWxvdyBpcyBhYm91dCBzbWFsbCBk
ZXRhaWxzIGFuZC9vciBuaXRwaWNraW5nLgo+ID4gCj4gPiAKPiA+ID4gK3N0YXRpYyB2b2lkIHds
ZWRfb3ZwX3dvcmsoc3RydWN0IHdvcmtfc3RydWN0ICp3b3JrKQo+ID4gPiArewo+ID4gPiArCXN0
cnVjdCB3bGVkICp3bGVkID0gY29udGFpbmVyX29mKHdvcmssCj4gPiA+ICsJCQkJCSBzdHJ1Y3Qg
d2xlZCwgb3ZwX3dvcmsud29yayk7Cj4gPiA+ICsJZW5hYmxlX2lycSh3bGVkLT5vdnBfaXJxKTsK
PiA+ID4gK30KPiA+ID4gKwo+ID4gCj4gPiBBIGJpdCBvZiBjb21tZW50aW5nIGFib3V0IHdoeSB3
ZSBoYXZlIHRvIHdhaXQgMTBtcyBiZWZvcmUgZW5hYmxpbmcgdGhlCj4gPiBPVlAgaW50ZXJydXB0
IHdvdWxkIGJlIGFwcHJlY2lhdGVkLgo+ID4gCj4gPiAKPiBTdXJlLiBXaWxsIGFkZCB0aGUgY29t
bWVudCBpbiB0aGUgbmV4dCBzZXJpZXMuCj4gPiA+ICtzdGF0aWMgaXJxcmV0dXJuX3Qgd2xlZF9v
dnBfaXJxX2hhbmRsZXIoaW50IGlycSwgdm9pZCAqX3dsZWQpCj4gPiA+ICt7Cj4gPiA+ICsJc3Ry
dWN0IHdsZWQgKndsZWQgPSBfd2xlZDsKPiA+ID4gKwlpbnQgcmM7Cj4gPiA+ICsJdTMyIGludF9z
dHMsIGZhdWx0X3N0czsKPiA+ID4gKwo+ID4gPiArCXJjID0gcmVnbWFwX3JlYWQod2xlZC0+cmVn
bWFwLAo+ID4gPiArCQkJIHdsZWQtPmN0cmxfYWRkciArIFdMRUQzX0NUUkxfUkVHX0lOVF9SVF9T
VFMsICZpbnRfc3RzKTsKPiA+ID4gKwlpZiAocmMgPCAwKSB7Cj4gPiA+ICsJCWRldl9lcnIod2xl
ZC0+ZGV2LCAiRXJyb3IgaW4gcmVhZGluZyBXTEVEM19JTlRfUlRfU1RTIHJjPSVkXG4iLAo+ID4g
PiArCQkJcmMpOwo+ID4gPiArCQlyZXR1cm4gSVJRX0hBTkRMRUQ7Cj4gPiA+ICsJfQo+ID4gPiAr
Cj4gPiA+ICsJcmMgPSByZWdtYXBfcmVhZCh3bGVkLT5yZWdtYXAsIHdsZWQtPmN0cmxfYWRkciAr
Cj4gPiA+ICsJCQkgV0xFRDNfQ1RSTF9SRUdfRkFVTFRfU1RBVFVTLCAmZmF1bHRfc3RzKTsKPiA+
ID4gKwlpZiAocmMgPCAwKSB7Cj4gPiA+ICsJCWRldl9lcnIod2xlZC0+ZGV2LCAiRXJyb3IgaW4g
cmVhZGluZyBXTEVEX0ZBVUxUX1NUQVRVUyByYz0lZFxuIiwKPiA+ID4gKwkJCXJjKTsKPiA+ID4g
KwkJcmV0dXJuIElSUV9IQU5ETEVEOwo+ID4gPiArCX0KPiA+ID4gKwo+ID4gPiArCWlmIChmYXVs
dF9zdHMgJgo+ID4gPiArCQkoV0xFRDNfQ1RSTF9SRUdfT1ZQX0ZBVUxUX0JJVCB8IFdMRUQzX0NU
UkxfUkVHX0lMSU1fRkFVTFRfQklUKSkKPiA+ID4gKwkJZGV2X2RiZyh3bGVkLT5kZXYsICJXTEVE
IE9WUCBmYXVsdCBkZXRlY3RlZCwgaW50X3N0cz0leAo+ID4gPiBmYXVsdF9zdHM9ICV4XG4iLAo+
ID4gPiArCQkJaW50X3N0cywgZmF1bHRfc3RzKTsKPiA+ID4gKwo+ID4gPiArCWlmIChmYXVsdF9z
dHMgJiBXTEVEM19DVFJMX1JFR19PVlBfRkFVTFRfQklUKSB7Cj4gPiA+ICsJCW11dGV4X2xvY2so
JndsZWQtPmxvY2spOwo+ID4gPiArCQlkaXNhYmxlX2lycV9ub3N5bmMod2xlZC0+b3ZwX2lycSk7
Cj4gPiAKPiA+IFdlJ3JlIGN1cnJlbnRseSBydW5uaW5nIHRoZSB0aHJlYWRlZCBJU1IgZm9yIHRo
aXMgaXJxLiBEbyB3ZSByZWFsbHkgbmVlZAo+ID4gdG8gZGlzYWJsZSBpdD8KPiA+IAo+IFdlIG5l
ZWQgdG8gZGlzYWJsZSB0aGlzIElSUSwgZHVyaW5nIHRoZSBhdXRvIHN0cmluZyBkZXRlY3Rpb24g
bG9naWMuIEJlY2F1c2UKPiBpbiB0aGUgYXV0byBzdHJpbmcgZGV0ZWN0aW9uIHdlIGNvbmZpZ3Vy
ZSB0aGUgY3VycmVudCBzaW5rcyBvbmUgYnkgb25lIGFuZAo+IGNoZWNrIHRoZQo+IHN0YXR1cyBy
ZWdpc3RlciBmb3IgdGhlIE9WUHMgYW5kIHNldCB0aGUgcmlnaHQgc3RyaW5nIGNvbmZpZ3VyYXRp
b24uIFdlCj4gZW5hYmxlIGl0IGxhdGVyIGFmdGVyCj4gdGhlIGF1dG8gc3RyaW5nIGRldGVjdGlv
biBpcyBjb21wbGV0ZWQuCgpUaGlzIGlzIGEgdGhyZWFkZWQgb25lc2hvdCBpbnRlcnJ1cHQgaGFu
ZGxlci4gV2h5IGlzbid0IHRoZSBmcmFtZXdvcmsKbWFza2luZyBzdWZmaWNpZW50IGZvciB5b3Ug
aGVyZT8KCgpEYW5pZWwuCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9w
Lm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1k
ZXZlbA==
