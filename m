Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DD131C40E
	for <lists+dri-devel@lfdr.de>; Tue, 14 May 2019 09:41:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 64D39892AA;
	Tue, 14 May 2019 07:40:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from onstation.org (onstation.org [52.200.56.107])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9F4988914C;
 Mon, 13 May 2019 22:25:49 +0000 (UTC)
Received: from localhost (c-98-239-145-235.hsd1.wv.comcast.net
 [98.239.145.235])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested) (Authenticated sender: masneyb)
 by onstation.org (Postfix) with ESMTPSA id 8BB1F44970;
 Mon, 13 May 2019 22:25:47 +0000 (UTC)
Date: Mon, 13 May 2019 18:25:47 -0400
From: Brian Masney <masneyb@onstation.org>
To: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: Re: [PATCH v2 1/6] drm: msm: remove resv fields from msm_gem_object
 struct
Message-ID: <20190513222547.GA6435@basecamp>
References: <20190509020352.14282-1-masneyb@onstation.org>
 <20190509020352.14282-2-masneyb@onstation.org>
 <20190513203239.GA9527@builder>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190513203239.GA9527@builder>
X-Mailman-Approved-At: Tue, 14 May 2019 07:40:44 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=onstation.org; s=default; t=1557786348;
 bh=WG9zRTna5JnQXnaHyxtn3T7a3OqxN5oqCrPNGTOLtWY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=aTccKlPYNf2/bHvNairklSh5B+qdpDj4RYT3xreYv2BBMSjDZ5pboplX6bkZkuXY2
 a+pCqRXfvDyUyKIHDWZpQdtJ0LkZDmr/vSkVgUDaxrw2P3Fx4nY3uoehCebnatKLoN
 ya9WVpjTN/v01gaBqpOl+0ma+Vv2PY3fauaAMTUU=
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
Cc: sean@poorly.run, jonathan@marek.ca, airlied@linux.ie,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gTW9uLCBNYXkgMTMsIDIwMTkgYXQgMDE6MzI6MzlQTSAtMDcwMCwgQmpvcm4gQW5kZXJzc29u
IHdyb3RlOgo+IE9uIFdlZCAwOCBNYXkgMTk6MDMgUERUIDIwMTksIEJyaWFuIE1hc25leSB3cm90
ZToKPiAKPiA+IFRoZSBtc21fZ2VtX29iamVjdCBzdHJ1Y3R1cmUgY29udGFpbnMgcmVzdiBhbmQg
X3Jlc3YgZmllbGRzIHRoYXQgYXJlCj4gPiBubyBsb25nZXIgbmVlZGVkIHNpbmNlIHRoZSByZXNl
cnZhdGlvbiBvYmplY3QgaXMgbm93IHN0b3JlZCBvbgo+ID4gZHJtX2dlbV9vYmplY3QuIG1zbV9h
dG9taWNfcHJlcGFyZV9mYigpIGFuZCBtc21fYXRvbWljX3ByZXBhcmVfZmIoKQo+ID4gYm90aCBy
ZWZlcmVuY2VkIHRoZSB3cm9uZyByZXNlcnZhdGlvbiBvYmplY3QsIGFuZCB3b3VsZCBsZWFkIHRv
IGFuCj4gPiBhdHRlbXB0IHRvIGRlcmVmZXJlbmNlIGEgTlVMTCBwb2ludGVyLiBDb3JyZWN0IHRo
b3NlIHR3byBjYXNlcyB0bwo+ID4gcG9pbnQgdG8gdGhlIGNvcnJlY3QgcmVzZXJ2YXRpb24gb2Jq
ZWN0Lgo+ID4gCj4gPiBTaWduZWQtb2ZmLWJ5OiBCcmlhbiBNYXNuZXkgPG1hc25leWJAb25zdGF0
aW9uLm9yZz4KPiA+IEZpeGVzOiBkZDU1Y2Y2OTI5ZTYgKCJkcm06IG1zbTogU3dpdGNoIHRvIHVz
ZSBkcm1fZ2VtX29iamVjdCByZXNlcnZhdGlvbl9vYmplY3QiKQo+IAo+IFJldmlld2VkLWJ5OiBC
am9ybiBBbmRlcnNzb24gPGJqb3JuLmFuZGVyc3NvbkBsaW5hcm8ub3JnPgo+IFRlc3RlZC1ieTog
Qmpvcm4gQW5kZXJzc29uIDxiam9ybi5hbmRlcnNzb25AbGluYXJvLm9yZz4KPiAKPiBUaGlzIHJl
c29sdmVzIGEgTlVMTC1wb2ludGVyIGRlcmVmZXJlbmNlIGFib3V0IHRvIHNob3cgdXAgaW4gdjUu
Mi1yYzEsCj4gc28gcGxlYXNlIHBpY2sgdGhpcyB1cCBmb3IgLXJjLgoKTGV0IG1lIHNlbmQgb3V0
IGFub3RoZXIgdmVyc2lvbiBvZiBqdXN0IHRoaXMgcGF0Y2guIFRoaXMgc25pcHBldCBiZWxvdwp0
aGF0IEkgcmVtb3ZlZCBuZWVkcyB0byBzdGF5LiBJIGdvdCBhIGxpdHRsZSB0b28gb3ZlciBlYWdl
ciByZW1vdmluZwpjb2RlLgoKPiA+IEBAIC05NzMsOSArOTczLDYgQEAgc3RhdGljIGludCBtc21f
Z2VtX25ld19pbXBsKHN0cnVjdCBkcm1fZGV2aWNlICpkZXYsCj4gPiAgCW1zbV9vYmotPmZsYWdz
ID0gZmxhZ3M7Cj4gPiAgCW1zbV9vYmotPm1hZHYgPSBNU01fTUFEVl9XSUxMTkVFRDsKPiA+ICAK
PiA+IC0JaWYgKHJlc3YpCj4gPiAtCQltc21fb2JqLT5iYXNlLnJlc3YgPSByZXN2Owo+ID4gLQo+
ID4gIAlJTklUX0xJU1RfSEVBRCgmbXNtX29iai0+c3VibWl0X2VudHJ5KTsKPiA+ICAJSU5JVF9M
SVNUX0hFQUQoJm1zbV9vYmotPnZtYXMpOwo+ID4gIAoKQnJpYW4KX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmkt
ZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
L21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
