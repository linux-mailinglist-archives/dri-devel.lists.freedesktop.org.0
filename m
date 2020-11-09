Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 23CAF2AC095
	for <lists+dri-devel@lfdr.de>; Mon,  9 Nov 2020 17:13:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4EBBC89AB6;
	Mon,  9 Nov 2020 16:13:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4ECF389AB3
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Nov 2020 16:13:48 +0000 (UTC)
Received: by mail-wr1-x441.google.com with SMTP id l1so4878091wrb.9
 for <dri-devel@lists.freedesktop.org>; Mon, 09 Nov 2020 08:13:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=PAQxzNvuqtCZjWn4XGCR7pwV/vojuqMxwGF9fuE2BTE=;
 b=HZkrn5bF9w6Z5TD3p+k1YpNDcXlvukLRKhdwRqMP/+xoZb0teMrCQc+SLlEN+Fv08s
 AWjb7oR5/OsCmu8g7CIuGEdoTv7ahaCSR2VPqIQjwVPahtEF6279h4og1KtCzEz+x35s
 nhNk3kInxjd/T9sePgn3rQ+fvWJAhOpfyz+ef37xFeQ3M9evDupplT51B37Eg1dLqKhM
 Yp2T3iPGEGrtpKY8GiC1oxqSqtz8LL/KKxb7RPB+rao1o1S23NvGZ1r/nLp8WFpGt/JW
 BougQLu8YUMnoOi9C0miCoH1whg4D/9+kiemQ9yasW7VuL9QdPQt1/o9m6NRVoii2A2r
 f+cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=PAQxzNvuqtCZjWn4XGCR7pwV/vojuqMxwGF9fuE2BTE=;
 b=sKzao8nFKTNVfBMJg1qF3Bid/5GxQ/hauI/Iz4iUqEBdZWYhrUXjMiCsdM9r9E9VW2
 j2CHj0Tq11km2wtxmkvIleFODUmqGuBA6XMAolk9ghJdEjQUP7XTxZ3i7kAqNgnklr8o
 +6USoBGTf44X79+87MrYKPG5cdCGr+M/syk6hnQZSmQ0wMVJxcx017z1hNx/1kfK1qkb
 CIeoVBDeE1nJAoMoVDRQW3ocupDIpvIFDj6JSekelc8P1BeFS9y5KfbqHcgOXaxTVVOU
 2X2ag9hp230vje/+n62ncWchi4n6TALUtzX6TCh2ovfeJ5fZqzStS54ZLNPZz/WMvXXQ
 AzjQ==
X-Gm-Message-State: AOAM532p/VX9e0FiIuO/QI82wKTyszQ3mTsABOiC/zWl/SLNFb4Lhl8n
 0nSxrPUGTMk4nLTpBxjz4Wc/9Q==
X-Google-Smtp-Source: ABdhPJzrTBdOQZWQKKC4cWvmWMBZZiowJs0Fb5tDz96/JoW9fF+o8i8iZiROszQGLFpp91znLB3R1g==
X-Received: by 2002:adf:8bce:: with SMTP id w14mr18342271wra.242.1604938426974; 
 Mon, 09 Nov 2020 08:13:46 -0800 (PST)
Received: from dell ([91.110.221.180])
 by smtp.gmail.com with ESMTPSA id g17sm13965748wrw.37.2020.11.09.08.13.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Nov 2020 08:13:46 -0800 (PST)
Date: Mon, 9 Nov 2020 16:13:44 +0000
From: Lee Jones <lee.jones@linaro.org>
To: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
Subject: Re: [PATCH 14/19] gpu: drm: selftests: test-drm_dp_mst_helper: Place
 'struct drm_dp_sideband_msg_req_body' onto the heap
Message-ID: <20201109161344.GY2063125@dell>
References: <20201105144517.1826692-1-lee.jones@linaro.org>
 <20201105144517.1826692-15-lee.jones@linaro.org>
 <20201109151937.GF6112@intel.com> <20201109161258.GX2063125@dell>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201109161258.GX2063125@dell>
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
Cc: David Airlie <airlied@linux.ie>, David Francis <David.Francis@amd.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gTW9uLCAwOSBOb3YgMjAyMCwgTGVlIEpvbmVzIHdyb3RlOgoKPiBPbiBNb24sIDA5IE5vdiAy
MDIwLCBWaWxsZSBTeXJqw6Rsw6Qgd3JvdGU6Cj4gCj4gPiBPbiBUaHUsIE5vdiAwNSwgMjAyMCBh
dCAwMjo0NToxMlBNICswMDAwLCBMZWUgSm9uZXMgd3JvdGU6Cj4gPiA+IFRoZSBzdGFjayBpcyB0
b28gZnVsbC4KPiA+ID4gCj4gPiA+IEZpeGVzIHRoZSBmb2xsb3dpbmcgVz0xIGtlcm5lbCBidWls
ZCB3YXJuaW5nKHMpOgo+ID4gPiAKPiA+ID4gIGRyaXZlcnMvZ3B1L2RybS9zZWxmdGVzdHMvdGVz
dC1kcm1fZHBfbXN0X2hlbHBlci5jOiBJbiBmdW5jdGlvbiDigJhzaWRlYmFuZF9tc2dfcmVxX2Vu
Y29kZV9kZWNvZGXigJk6Cj4gPiA+ICBkcml2ZXJzL2dwdS9kcm0vc2VsZnRlc3RzL3Rlc3QtZHJt
X2RwX21zdF9oZWxwZXIuYzoxNjE6MTogd2FybmluZzogdGhlIGZyYW1lIHNpemUgb2YgMTE3NiBi
eXRlcyBpcyBsYXJnZXIgdGhhbiAxMDI0IGJ5dGVzIFstV2ZyYW1lLWxhcmdlci10aGFuPV0KPiA+
ID4gCj4gPiA+IENjOiBEYXZpZCBBaXJsaWUgPGFpcmxpZWRAbGludXguaWU+Cj4gPiA+IENjOiBE
YW5pZWwgVmV0dGVyIDxkYW5pZWxAZmZ3bGwuY2g+Cj4gPiA+IENjOiBMeXVkZSBQYXVsIDxseXVk
ZUByZWRoYXQuY29tPgo+ID4gPiBDYzogRGF2aWQgRnJhbmNpcyA8RGF2aWQuRnJhbmNpc0BhbWQu
Y29tPgo+ID4gPiBDYzogZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwo+ID4gPiBTaWdu
ZWQtb2ZmLWJ5OiBMZWUgSm9uZXMgPGxlZS5qb25lc0BsaW5hcm8ub3JnPgo+ID4gPiAtLS0KPiA+
ID4gIC4uLi9kcm0vc2VsZnRlc3RzL3Rlc3QtZHJtX2RwX21zdF9oZWxwZXIuYyAgICB8IDI5ICsr
KysrKysrKysrKy0tLS0tLS0KPiA+ID4gIDEgZmlsZSBjaGFuZ2VkLCAxOCBpbnNlcnRpb25zKCsp
LCAxMSBkZWxldGlvbnMoLSkKPiA+ID4gCj4gPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9k
cm0vc2VsZnRlc3RzL3Rlc3QtZHJtX2RwX21zdF9oZWxwZXIuYyBiL2RyaXZlcnMvZ3B1L2RybS9z
ZWxmdGVzdHMvdGVzdC1kcm1fZHBfbXN0X2hlbHBlci5jCj4gPiA+IGluZGV4IDFkNjk2ZWMwMDFj
ZmYuLjBhNTM5NDU2ZjY4NjQgMTAwNjQ0Cj4gPiA+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9zZWxm
dGVzdHMvdGVzdC1kcm1fZHBfbXN0X2hlbHBlci5jCj4gPiA+ICsrKyBiL2RyaXZlcnMvZ3B1L2Ry
bS9zZWxmdGVzdHMvdGVzdC1kcm1fZHBfbXN0X2hlbHBlci5jCj4gPiA+IEBAIC0xMjAsNDQgKzEy
MCw1MSBAQCBzaWRlYmFuZF9tc2dfcmVxX2VxdWFsKGNvbnN0IHN0cnVjdCBkcm1fZHBfc2lkZWJh
bmRfbXNnX3JlcV9ib2R5ICppbiwKPiA+ID4gIHN0YXRpYyBib29sCj4gPiA+ICBzaWRlYmFuZF9t
c2dfcmVxX2VuY29kZV9kZWNvZGUoc3RydWN0IGRybV9kcF9zaWRlYmFuZF9tc2dfcmVxX2JvZHkg
KmluKQo+ID4gPiAgewo+ID4gPiAtCXN0cnVjdCBkcm1fZHBfc2lkZWJhbmRfbXNnX3JlcV9ib2R5
IG91dCA9IHswfTsKPiA+ID4gKwlzdHJ1Y3QgZHJtX2RwX3NpZGViYW5kX21zZ19yZXFfYm9keSAq
b3V0Owo+ID4gCj4gPiBIb3cgYmlnIGlzIGl0PyBBbmQgd2h5IGlzIGl0IHRoYXQgYmlnPwo+IAo+
IEl0J3MgYSBzdHJ1Y3Qgb2YgYSB1bmlvbiBvZiBzdHJ1Y3RzLgo+IAo+IEFuZCBpdCdzIGFsbCBh
bGxvY2F0ZWQgb24gdGhlIHN0YWNrLiAgQmFkIG5ld3MhCgpGWUksIEkgaGF2ZSBhIHYyIG9mIHRo
aXMgcGF0Y2guICBKdXN0IHdhaXRpbmcgdG8gc2VuZCBpdC4KCi0tIApMZWUgSm9uZXMgW+adjueQ
vOaWr10KU2VuaW9yIFRlY2huaWNhbCBMZWFkIC0gRGV2ZWxvcGVyIFNlcnZpY2VzCkxpbmFyby5v
cmcg4pSCIE9wZW4gc291cmNlIHNvZnR3YXJlIGZvciBBcm0gU29DcwpGb2xsb3cgTGluYXJvOiBG
YWNlYm9vayB8IFR3aXR0ZXIgfCBCbG9nCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZy
ZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2RyaS1kZXZlbAo=
