Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 80A79261944
	for <lists+dri-devel@lfdr.de>; Tue,  8 Sep 2020 20:11:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C20CF6E895;
	Tue,  8 Sep 2020 18:11:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com
 [205.139.110.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BAFE26E886
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Sep 2020 18:11:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1599588698;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=d4I0enXMcd6wiP9Hxkijutl60TLTvxaaQ/7Ij7Q0jjA=;
 b=eTWukpbDikTEXQO7FDVDPshttETCb42pRJld9PbFlnScO1RAM1PoJKkDXqIXpuiBudSgOp
 vhKzVupB19DfICxfPoVH9gxoUa+wWAHzUM/p2AN+Ii971Ch8WTo1u8mOjTAlU9PU6taXeq
 FIDC98gyY34Epm97eJBSbpPOvu7ojOc=
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-52-UkZ-GgiONkGvbXt-SH2wag-1; Tue, 08 Sep 2020 14:11:37 -0400
X-MC-Unique: UkZ-GgiONkGvbXt-SH2wag-1
Received: by mail-qt1-f198.google.com with SMTP id j19so63132qtp.19
 for <dri-devel@lists.freedesktop.org>; Tue, 08 Sep 2020 11:11:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:organization:user-agent:mime-version
 :content-transfer-encoding;
 bh=d4I0enXMcd6wiP9Hxkijutl60TLTvxaaQ/7Ij7Q0jjA=;
 b=CYvhNSeOXQL5suNIE7ckKloBF+ocP5ZVV+y5/iVI3zZk+5hOHB878x73mQUtDXYbLu
 e0ad0ovwFzwPulEmQz0ClENxbakoYiecCAVB+1FfzZphM3S1PePr7H51L8SF+00GksV9
 QMru4djT5w8voYE2pllb4yxioEZR366/9C/b/sf9dHXIf7L5EjfS11s5rBls+MBjsQ91
 QNtgaOhF9yzqMcGHwUEQzUnGGHuqp0qEWo1X/Z0iyQtMHJk64TUx3nsDq6zcNRNRYVER
 kT3f0LqHom7iIdrDp8snhcSpxS1AhjThqDFvlKifZGvG3JCZ4tL8Q7xWvqfagOxheCFz
 PVfg==
X-Gm-Message-State: AOAM530vwDA9jaDs8fX2Y923dm+zB0jWXRViVFLNRBzXCqTna50IrEMH
 FIIf66IKjjJJe/eGYoV7/dS+1rraoRoaSHew95enBl4/7JRgRvaC42fI8Kpe3ozUEYJJ+llZL8g
 8/FIrAs8W5hoQDGc+IbRA16zKXYVN
X-Received: by 2002:ac8:501:: with SMTP id u1mr1355302qtg.261.1599588696628;
 Tue, 08 Sep 2020 11:11:36 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwzWeklYCRiRRJLyIFdFTqfABzvpe7K/WaXC+qZ7RsVaEoKCPBqCfy3GW6jcKixfwNMUz7Bkg==
X-Received: by 2002:ac8:501:: with SMTP id u1mr1355283qtg.261.1599588696389;
 Tue, 08 Sep 2020 11:11:36 -0700 (PDT)
Received: from Ruby.lyude.net (pool-108-49-102-102.bstnma.fios.verizon.net.
 [108.49.102.102])
 by smtp.gmail.com with ESMTPSA id w6sm200622qti.63.2020.09.08.11.11.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Sep 2020 11:11:35 -0700 (PDT)
Message-ID: <0563aa84f2bfaf95d16a34c539ab9d7c4b6a73b9.camel@redhat.com>
Subject: Re: [PATCH v2 12/18] drm/i915: Configure DP 1.3+ protocol converted
 HDMI mode
From: Lyude Paul <lyude@redhat.com>
To: Ville Syrjala <ville.syrjala@linux.intel.com>, 
 dri-devel@lists.freedesktop.org
Date: Tue, 08 Sep 2020 14:11:34 -0400
In-Reply-To: <20200904115354.25336-13-ville.syrjala@linux.intel.com>
References: <20200904115354.25336-1-ville.syrjala@linux.intel.com>
 <20200904115354.25336-13-ville.syrjala@linux.intel.com>
Organization: Red Hat
User-Agent: Evolution 3.36.5 (3.36.5-1.fc32)
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=lyude@redhat.com
X-Mimecast-Spam-Score: 0.003
X-Mimecast-Originator: redhat.com
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
Cc: intel-gfx@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpLCAyMDIwLTA5LTA0IGF0IDE0OjUzICswMzAwLCBWaWxsZSBTeXJqYWxhIHdyb3RlOgo+
IEZyb206IFZpbGxlIFN5cmrDpGzDpCA8dmlsbGUuc3lyamFsYUBsaW51eC5pbnRlbC5jb20+Cj4g
Cj4gRFAgMS4zIGFkZHMgc29tZSBleHRyYSBjb250cm9sIGtub2JzIGZvciBEUC0+SERNSSBwcm90
b2NvbCBjb252ZXJzaW9uLgo+IExldCdzIHVzZSB0aGF0IHRvIGNvbmZpZ3VyZSB0aGUgIkhETUkg
bW9kZSIgKGllLiBpbmZvZnJhbWVzIHZzLiBub3QpCj4gYmFzZWQgb24gdGhlIGNhcGFiaWxpdGll
cyBvZiB0aGUgc2luay4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBWaWxsZSBTeXJqw6Rsw6QgPHZpbGxl
LnN5cmphbGFAbGludXguaW50ZWwuY29tPgo+IC0tLQo+ICBkcml2ZXJzL2dwdS9kcm0vaTkxNS9k
aXNwbGF5L2ludGVsX2RkaS5jIHwgIDEgKwo+ICBkcml2ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5
L2ludGVsX2RwLmMgIHwgMjMgKysrKysrKysrKysrKysrKysrKysrKysKPiAgZHJpdmVycy9ncHUv
ZHJtL2k5MTUvZGlzcGxheS9pbnRlbF9kcC5oICB8ICAxICsKPiAgMyBmaWxlcyBjaGFuZ2VkLCAy
NSBpbnNlcnRpb25zKCspCj4gCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2Rp
c3BsYXkvaW50ZWxfZGRpLmMKPiBiL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxf
ZGRpLmMKPiBpbmRleCAyOGZmODU0OTNmMjUuLjlhZGJhMGQwYjRhYSAxMDA2NDQKPiAtLS0gYS9k
cml2ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5L2ludGVsX2RkaS5jCj4gKysrIGIvZHJpdmVycy9n
cHUvZHJtL2k5MTUvZGlzcGxheS9pbnRlbF9kZGkuYwo+IEBAIC0zNDcwLDYgKzM0NzAsNyBAQCBz
dGF0aWMgdm9pZCBoc3dfZGRpX3ByZV9lbmFibGVfZHAoc3RydWN0Cj4gaW50ZWxfYXRvbWljX3N0
YXRlICpzdGF0ZSwKPiAgCWludGVsX2RkaV9pbml0X2RwX2J1Zl9yZWcoZW5jb2Rlcik7Cj4gIAlp
ZiAoIWlzX21zdCkKPiAgCQlpbnRlbF9kcF9zaW5rX2RwbXMoaW50ZWxfZHAsIERSTV9NT0RFX0RQ
TVNfT04pOwo+ICsJaW50ZWxfZHBfY29uZmlndXJlX3Byb3RvY29sX2NvbnZlcnRlcihpbnRlbF9k
cCk7Cj4gIAlpbnRlbF9kcF9zaW5rX3NldF9kZWNvbXByZXNzaW9uX3N0YXRlKGludGVsX2RwLCBj
cnRjX3N0YXRlLAo+ICAJCQkJCSAgICAgIHRydWUpOwo+ICAJaW50ZWxfZHBfc2lua19zZXRfZmVj
X3JlYWR5KGludGVsX2RwLCBjcnRjX3N0YXRlKTsKPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUv
ZHJtL2k5MTUvZGlzcGxheS9pbnRlbF9kcC5jCj4gYi9kcml2ZXJzL2dwdS9kcm0vaTkxNS9kaXNw
bGF5L2ludGVsX2RwLmMKPiBpbmRleCBhNzAzZTQ2NTllNDcuLjA0NzQ0OTI1M2E1NCAxMDA2NDQK
PiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5L2ludGVsX2RwLmMKPiArKysgYi9k
cml2ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5L2ludGVsX2RwLmMKPiBAQCAtMzc5Miw2ICszNzky
LDI4IEBAIHN0YXRpYyB2b2lkIGludGVsX2RwX2VuYWJsZV9wb3J0KHN0cnVjdCBpbnRlbF9kcAo+
ICppbnRlbF9kcCwKPiAgCWludGVsX2RlX3Bvc3RpbmdfcmVhZChkZXZfcHJpdiwgaW50ZWxfZHAt
Pm91dHB1dF9yZWcpOwo+ICB9Cj4gIAo+ICt2b2lkIGludGVsX2RwX2NvbmZpZ3VyZV9wcm90b2Nv
bF9jb252ZXJ0ZXIoc3RydWN0IGludGVsX2RwICppbnRlbF9kcCkKPiArewo+ICsJc3RydWN0IGRy
bV9pOTE1X3ByaXZhdGUgKmk5MTUgPSBkcF90b19pOTE1KGludGVsX2RwKTsKPiArCXU4IHRtcDsK
PiArCj4gKwlpZiAoaW50ZWxfZHAtPmRwY2RbRFBfRFBDRF9SRVZdIDwgMHgxMykKPiArCQlyZXR1
cm47Cj4gKwo+ICsJaWYgKCFkcm1fZHBfaXNfYnJhbmNoKGludGVsX2RwLT5kcGNkKSkKPiArCQly
ZXR1cm47Cj4gKwo+ICsJdG1wID0gaW50ZWxfZHAtPmhhc19oZG1pX3NpbmsgPwo+ICsJCURQX0hE
TUlfRFZJX09VVFBVVF9DT05GSUcgOiAwOwo+ICsKPiArCWlmIChkcm1fZHBfZHBjZF93cml0ZWIo
JmludGVsX2RwLT5hdXgsCj4gKwkJCSAgICAgICBEUF9QUk9UT0NPTF9DT05WRVJURVJfQ09OVFJP
TF8wLCB0bXApIDw9IDApCj4gKwkJZHJtX2RiZ19rbXMoJmk5MTUtPmRybSwgIkZhaWxlZCB0byBz
ZXQgcHJvdG9jb2wgY29udmVydGVyIEhETUkKPiBtb2RlIHRvICVzXG4iLAo+ICsJCQkgICAgZW5h
YmxlZGRpc2FibGVkKGludGVsX2RwLT5oYXNfaGRtaV9zaW5rKSk7Cj4gKwo+ICsJLyogVE9ETzog
Y29uZmlndXJlIFlDYkNyIDQ6MjoyLzQ6MjowIGNvbnZlcnNpb24gKi8KPiArfQoKTWF5YmUgYWRk
IGEgRFAgaGVscGVyIGZvciB0aGlzIHdoaWxlIHdlJ3JlIGF0IGl0PyBVcCB0byB5b3UKCj4gKwo+
ICBzdGF0aWMgdm9pZCBpbnRlbF9lbmFibGVfZHAoc3RydWN0IGludGVsX2F0b21pY19zdGF0ZSAq
c3RhdGUsCj4gIAkJCSAgICBzdHJ1Y3QgaW50ZWxfZW5jb2RlciAqZW5jb2RlciwKPiAgCQkJICAg
IGNvbnN0IHN0cnVjdCBpbnRlbF9jcnRjX3N0YXRlICpwaXBlX2NvbmZpZywKPiBAQCAtMzgyOSw2
ICszODUxLDcgQEAgc3RhdGljIHZvaWQgaW50ZWxfZW5hYmxlX2RwKHN0cnVjdCBpbnRlbF9hdG9t
aWNfc3RhdGUKPiAqc3RhdGUsCj4gIAl9Cj4gIAo+ICAJaW50ZWxfZHBfc2lua19kcG1zKGludGVs
X2RwLCBEUk1fTU9ERV9EUE1TX09OKTsKPiArCWludGVsX2RwX2NvbmZpZ3VyZV9wcm90b2NvbF9j
b252ZXJ0ZXIoaW50ZWxfZHApOwo+ICAJaW50ZWxfZHBfc3RhcnRfbGlua190cmFpbihpbnRlbF9k
cCk7Cj4gIAlpbnRlbF9kcF9zdG9wX2xpbmtfdHJhaW4oaW50ZWxfZHApOwo+ICAKPiBkaWZmIC0t
Z2l0IGEvZHJpdmVycy9ncHUvZHJtL2k5MTUvZGlzcGxheS9pbnRlbF9kcC5oCj4gYi9kcml2ZXJz
L2dwdS9kcm0vaTkxNS9kaXNwbGF5L2ludGVsX2RwLmgKPiBpbmRleCBlYzU2ODhhMjFmNjYuLjA4
YTFjMGFhOGI5NCAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5L2lu
dGVsX2RwLmgKPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5L2ludGVsX2RwLmgK
PiBAQCAtNTEsNiArNTEsNyBAQCBpbnQgaW50ZWxfZHBfZ2V0X2xpbmtfdHJhaW5fZmFsbGJhY2tf
dmFsdWVzKHN0cnVjdAo+IGludGVsX2RwICppbnRlbF9kcCwKPiAgaW50IGludGVsX2RwX3JldHJh
aW5fbGluayhzdHJ1Y3QgaW50ZWxfZW5jb2RlciAqZW5jb2RlciwKPiAgCQkJICBzdHJ1Y3QgZHJt
X21vZGVzZXRfYWNxdWlyZV9jdHggKmN0eCk7Cj4gIHZvaWQgaW50ZWxfZHBfc2lua19kcG1zKHN0
cnVjdCBpbnRlbF9kcCAqaW50ZWxfZHAsIGludCBtb2RlKTsKPiArdm9pZCBpbnRlbF9kcF9jb25m
aWd1cmVfcHJvdG9jb2xfY29udmVydGVyKHN0cnVjdCBpbnRlbF9kcCAqaW50ZWxfZHApOwo+ICB2
b2lkIGludGVsX2RwX3Npbmtfc2V0X2RlY29tcHJlc3Npb25fc3RhdGUoc3RydWN0IGludGVsX2Rw
ICppbnRlbF9kcCwKPiAgCQkJCQkgICBjb25zdCBzdHJ1Y3QgaW50ZWxfY3J0Y19zdGF0ZQo+ICpj
cnRjX3N0YXRlLAo+ICAJCQkJCSAgIGJvb2wgZW5hYmxlKTsKLS0gCkNoZWVycywKCUx5dWRlIFBh
dWwgKHNoZS9oZXIpCglTb2Z0d2FyZSBFbmdpbmVlciBhdCBSZWQgSGF0CgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0
CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3Rv
cC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
