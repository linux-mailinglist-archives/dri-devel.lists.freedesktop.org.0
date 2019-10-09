Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F33EAD13BB
	for <lists+dri-devel@lfdr.de>; Wed,  9 Oct 2019 18:10:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BEB076E12A;
	Wed,  9 Oct 2019 16:10:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x543.google.com (mail-ed1-x543.google.com
 [IPv6:2a00:1450:4864:20::543])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EF7ED6E12A
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Oct 2019 16:10:47 +0000 (UTC)
Received: by mail-ed1-x543.google.com with SMTP id l21so2550827edr.5
 for <dri-devel@lists.freedesktop.org>; Wed, 09 Oct 2019 09:10:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :references:mime-version:content-disposition
 :content-transfer-encoding:in-reply-to:user-agent;
 bh=uNOaBz+zhmYO2IBHn0Te5I0O/+A0dgQL1KcILNaBZ+s=;
 b=mLHWpmV27ftAsF3jicN4Zlz8DMJWz6kUn5AmRidbt2jmnxNCmOWefOibKf6GWi5lwv
 cwZRDrBcNfYQecrlewl8wecG+MB0MHqMpjwsERJNnIy9qfOCyjX0Qm+oKCenR8gnHGGJ
 HFG3aMQqdorXifalkbyfjVbgYY2M4CZhvoohed4x57xRGv6mHOCvjxP1Ko/MoshmU7MT
 hgPKnROdyD+ErRnxr/CvW/TsccmcUdeasleXGTVSZrT9RWqHqzKxDY2fNMQYAWINYihy
 O7+WLvYPTNOn3hiZwyVgcSOG5hK+dcuo2Gj5hKitlwkayN2LA+YK1XA+sVsAwlDBhssk
 kt1w==
X-Gm-Message-State: APjAAAW9OAt92lX0PtlV7OFhtk+ShVdNdVzgj5/FHIMFv2h447kqzh++
 yP26SPwHJjUXToE9/RVWG9Zliv5m0Dg=
X-Google-Smtp-Source: APXvYqwIGTNPHEIGxRS9wqF87frp1HA516WhqpRNrHfTgWQitTXVTHuF50fbjdsRpOoTI7GwObIJbg==
X-Received: by 2002:a50:d4d7:: with SMTP id e23mr3714869edj.135.1570637446564; 
 Wed, 09 Oct 2019 09:10:46 -0700 (PDT)
Received: from phenom.ffwll.local (212-51-149-96.fiber7.init7.net.
 [212.51.149.96])
 by smtp.gmail.com with ESMTPSA id b36sm416516edc.53.2019.10.09.09.10.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Oct 2019 09:10:45 -0700 (PDT)
Date: Wed, 9 Oct 2019 18:10:43 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Lionel Landwerlin <lionel.g.landwerlin@intel.com>
Subject: Re: [PATCH] drm/drm_syncobj: Dead code removal
Message-ID: <20191009161043.GP16989@phenom.ffwll.local>
References: <20191004121652.5940-1-zbigniew.kempczynski@intel.com>
 <a1b85bc1-46a8-9978-995f-f081c52594e5@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <a1b85bc1-46a8-9978-995f-f081c52594e5@intel.com>
X-Operating-System: Linux phenom 5.2.0-2-amd64 
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google;
 h=sender:date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to
 :user-agent;
 bh=uNOaBz+zhmYO2IBHn0Te5I0O/+A0dgQL1KcILNaBZ+s=;
 b=i2R41aD0dXZVcdGeHN3vwisA+iM+4iZRjNOnvMQ6a7ZXZUW+ObHCfmLWbQ1eeh3x44
 Yc1KJ8FOw4mtTFzZZc35sW3lj5epAnLdAwdYkjT4VgB7DL/AVsUdLY/kO33UQVh22WNR
 yOcSApMOJg2203fr4qcaP/OF3ROEgwxrhykxM=
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
Cc: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>,
 Jason Ekstrand <jason@jlekstrand.net>, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpLCBPY3QgMDQsIDIwMTkgYXQgMDM6MjU6MDBQTSArMDMwMCwgTGlvbmVsIExhbmR3ZXJs
aW4gd3JvdGU6Cj4gT24gMDQvMTAvMjAxOSAxNToxNiwgWmJpZ25pZXcgS2VtcGN6ecWEc2tpIHdy
b3RlOgo+ID4gUmVtb3ZlIGRlYWQgY29kZSwgbGlrZWx5IG92ZXJzZWVuZWQgZHVyaW5nIHJldmll
dyBwcm9jZXNzLgo+ID4gCj4gPiBTaWduZWQtb2ZmLWJ5OiBaYmlnbmlldyBLZW1wY3p5xYRza2kg
PHpiaWduaWV3LmtlbXBjenluc2tpQGludGVsLmNvbT4KPiA+IENjOiBDaHVubWluZyBaaG91IDxk
YXZpZDEuemhvdUBhbWQuY29tPgo+ID4gQ2M6IERhbmllbCBWZXR0ZXIgPGRhbmllbEBmZndsbC5j
aD4KPiA+IENjOiBKYXNvbiBFa3N0cmFuZCA8amFzb25Aamxla3N0cmFuZC5uZXQ+Cj4gPiAtLS0K
PiA+ICAgZHJpdmVycy9ncHUvZHJtL2RybV9zeW5jb2JqLmMgfCA0IC0tLS0KPiA+ICAgMSBmaWxl
IGNoYW5nZWQsIDQgZGVsZXRpb25zKC0pCj4gPiAKPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dw
dS9kcm0vZHJtX3N5bmNvYmouYyBiL2RyaXZlcnMvZ3B1L2RybS9kcm1fc3luY29iai5jCj4gPiBp
bmRleCA0YjVjN2IwZWQ3MTQuLjIxYTIyZTM5YzlmYSAxMDA2NDQKPiA+IC0tLSBhL2RyaXZlcnMv
Z3B1L2RybS9kcm1fc3luY29iai5jCj4gPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vZHJtX3N5bmNv
YmouYwo+ID4gQEAgLTE5Miw4ICsxOTIsNiBAQCBzdGF0aWMgdm9pZCBkcm1fc3luY29ial9mZW5j
ZV9hZGRfd2FpdChzdHJ1Y3QgZHJtX3N5bmNvYmogKnN5bmNvYmosCj4gPiAgIAlpZiAoIWZlbmNl
IHx8IGRtYV9mZW5jZV9jaGFpbl9maW5kX3NlcW5vKCZmZW5jZSwgd2FpdC0+cG9pbnQpKSB7Cj4g
PiAgIAkJZG1hX2ZlbmNlX3B1dChmZW5jZSk7Cj4gPiAgIAkJbGlzdF9hZGRfdGFpbCgmd2FpdC0+
bm9kZSwgJnN5bmNvYmotPmNiX2xpc3QpOwo+ID4gLQl9IGVsc2UgaWYgKCFmZW5jZSkgewo+ID4g
LQkJd2FpdC0+ZmVuY2UgPSBkbWFfZmVuY2VfZ2V0X3N0dWIoKTsKPiA+ICAgCX0gZWxzZSB7Cj4g
PiAgIAkJd2FpdC0+ZmVuY2UgPSBmZW5jZTsKPiA+ICAgCX0KPiA+IEBAIC04NTYsOCArODU0LDYg
QEAgc3RhdGljIHZvaWQgc3luY29ial93YWl0X3N5bmNvYmpfZnVuYyhzdHJ1Y3QgZHJtX3N5bmNv
YmogKnN5bmNvYmosCj4gPiAgIAlpZiAoIWZlbmNlIHx8IGRtYV9mZW5jZV9jaGFpbl9maW5kX3Nl
cW5vKCZmZW5jZSwgd2FpdC0+cG9pbnQpKSB7Cj4gPiAgIAkJZG1hX2ZlbmNlX3B1dChmZW5jZSk7
Cj4gPiAgIAkJcmV0dXJuOwo+ID4gLQl9IGVsc2UgaWYgKCFmZW5jZSkgewo+ID4gLQkJd2FpdC0+
ZmVuY2UgPSBkbWFfZmVuY2VfZ2V0X3N0dWIoKTsKPiA+ICAgCX0gZWxzZSB7Cj4gPiAgIAkJd2Fp
dC0+ZmVuY2UgPSBmZW5jZTsKPiA+ICAgCX0KPiAKPiBMaWtlIENocmlzIHNhaWQsIGRtYV9mZW5j
ZV9jaGFpbl9maW5kX3NlcW5vKCkgd2lsbCB1cGRhdGUgdGhlIGZlbmNlIHBvaW50ZXIsCj4gc28g
YSBzdWJzZXF1ZW50IGNoZWNrIG1pZ2h0IG5vdCBiZSBkZWFsaW5nIHdpdGggdGhlIHNhbWUgdmFs
dWUuCj4gCj4gQSBiaXQgY2hlZWt5LCBidXQuLi4KCkZlZWxzIGxpa2Ugd2FycmFudHMgYSBjb21t
ZW50LCBJIG1pc3NlZCB0aGlzIG9uZSB0b28uIE1heWJlIGV2ZW4gZXh0cmFjdAppdCBpbnRvIG9u
ZSBjb21tb24gZnVuY3Rpb24gc2luY2UgaXQncyB0aGUgc2FtZSBjb2RlIGluIGJvdGggcGxhY2Vz
PwotRGFuaWVsCi0tIApEYW5pZWwgVmV0dGVyClNvZnR3YXJlIEVuZ2luZWVyLCBJbnRlbCBDb3Jw
b3JhdGlvbgpodHRwOi8vYmxvZy5mZndsbC5jaApfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0
cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9kcmktZGV2ZWw=
