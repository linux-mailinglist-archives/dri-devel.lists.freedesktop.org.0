Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D7F252B5B07
	for <lists+dri-devel@lfdr.de>; Tue, 17 Nov 2020 09:33:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 746946E12D;
	Tue, 17 Nov 2020 08:33:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com
 [IPv6:2a00:1450:4864:20::342])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 266886E12D
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Nov 2020 08:33:50 +0000 (UTC)
Received: by mail-wm1-x342.google.com with SMTP id a65so2409235wme.1
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Nov 2020 00:33:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=jXS3JRBqPu/ouJmDg/xmae2SThRp3NsRXzX2BYUctrU=;
 b=NmDzOe3LdbzfAZUeAM5vuY/Mc3PzHlr9l4joMVf2ePlGLMAfdlwlLXItkNSZVXdlUH
 61q4xOhCxXR9dwUy0CYZVCeVZ3tBJD4FwoWLPX9vgGoamWYYvdM3NdLk9myeQ7+5CLsJ
 jPEhnoyVbbHGBWsbGjK8+3LQs6QjCFRVSu8kbBkzvEUyID6y+hEub7ZZUMcwmR869kbt
 hxYppdO+bCfFgMoc19/HDXKbRrRIEDwYs6FxoYIzX9skfHDfu19ZkP7kAsmdAcDqygcQ
 3JmmDXy6cTZtXdd6zYr2niLwvElDY3Fq5uU8r1zridlAev+wPMEngwj5WplY8JmjpsXH
 y5Vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=jXS3JRBqPu/ouJmDg/xmae2SThRp3NsRXzX2BYUctrU=;
 b=OPMrvSTc2bxWNiUlDQtyG7aFjgRdifutIwkTLdF8YdFT5BDJD9Uot8SMgD5sU1tiSf
 RNjlQXP5BsKngmMqWd/KqAK80xik0f5hjxxwZfdJcZvOPtHG/AIy/xF2wNxOFfGN88UX
 TCupBeTAwJ8Ui6cLbVaCbUxWMbzBkEE5Y77jdYJu1lVfifrlNbkvv2n00oIMuic8sKq9
 m4VE1DN/EEf6zGLD09I839sEppZCXLXgZ+wivKJ/YUgM29WJWwqHvy7YZFIB1OqrlgzJ
 VwpIYIqbvuGVPeq/f5fo7r2kmLdcO5cFvKgTOP8Oe3DX+DSi9K0CIw6XAXv6nxROg5r4
 9E2g==
X-Gm-Message-State: AOAM532sxk2fDdhXYQFhYakdN94qPGO+6Rczog4mFmD7QmtFkktM0gt5
 90leaqH91YQvgjJAdXtGy+LAJg==
X-Google-Smtp-Source: ABdhPJzxWk6XuiGhBXFExyZ0JfUqN1RS3xrB52XjjVNRYWA6fBykStdQeer94ktHR6GxDDziqP+i2Q==
X-Received: by 2002:a7b:cb13:: with SMTP id u19mr3050107wmj.89.1605602028789; 
 Tue, 17 Nov 2020 00:33:48 -0800 (PST)
Received: from dell ([91.110.221.159])
 by smtp.gmail.com with ESMTPSA id u14sm23640010wrq.93.2020.11.17.00.33.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Nov 2020 00:33:47 -0800 (PST)
Date: Tue, 17 Nov 2020 08:33:46 +0000
From: Lee Jones <lee.jones@linaro.org>
To: Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Subject: Re: [PATCH 32/42] drm/ttm/ttm_tt: Demote kernel-doc header format
 abuses
Message-ID: <20201117083346.GB1869941@dell>
References: <20201116174112.1833368-1-lee.jones@linaro.org>
 <20201116174112.1833368-33-lee.jones@linaro.org>
 <bcb40255-312f-8cdb-28a8-7ee2e6596f90@amd.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <bcb40255-312f-8cdb-28a8-7ee2e6596f90@amd.com>
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
Cc: David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org,
 Huang Rui <ray.huang@amd.com>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gTW9uLCAxNiBOb3YgMjAyMCwgQ2hyaXN0aWFuIEvDtm5pZyB3cm90ZToKCj4gQW0gMTYuMTEu
MjAgdW0gMTg6NDEgc2NocmllYiBMZWUgSm9uZXM6Cj4gPiBGaXhlcyB0aGUgZm9sbG93aW5nIFc9
MSBrZXJuZWwgYnVpbGQgd2FybmluZyhzKToKPiA+IAo+ID4gICBkcml2ZXJzL2dwdS9kcm0vdHRt
L3R0bV90dC5jOjQ1OiB3YXJuaW5nOiBGdW5jdGlvbiBwYXJhbWV0ZXIgb3IgbWVtYmVyICdibycg
bm90IGRlc2NyaWJlZCBpbiAndHRtX3R0X2NyZWF0ZScKPiA+ICAgZHJpdmVycy9ncHUvZHJtL3R0
bS90dG1fdHQuYzo0NTogd2FybmluZzogRnVuY3Rpb24gcGFyYW1ldGVyIG9yIG1lbWJlciAnemVy
b19hbGxvYycgbm90IGRlc2NyaWJlZCBpbiAndHRtX3R0X2NyZWF0ZScKPiA+ICAgZHJpdmVycy9n
cHUvZHJtL3R0bS90dG1fdHQuYzo4Mzogd2FybmluZzogRnVuY3Rpb24gcGFyYW1ldGVyIG9yIG1l
bWJlciAndHRtJyBub3QgZGVzY3JpYmVkIGluICd0dG1fdHRfYWxsb2NfcGFnZV9kaXJlY3Rvcnkn
Cj4gCj4gQ291bGRuJ3Qgd2UgcmF0aGVyIGRlc2NyaWJlIHRoZSBtaXNzaW5nIHBhcmFtZXRlcnM/
IFNob3VsZG4ndCBiZSBtdWNoIHdvcmsuCgpNeSBydWxlIGlzOyBpZiBhIHN1YnN0YW50aWFsIGF0
dGVtcHQgaGFzIGJlZW4gbWFkZSB0byBkb2N1bWVudApzb21ldGhpbmcsIEknbGwgcGF0Y2ggaXQg
dXAuICBJZiBsaXR0bGUgb3Igbm8gYXR0ZW1wdCBoYXMgYmVlbiBtYWRlLAp0aGVuIGl0IGdldHMg
ZGVtb3RlZC4KClBsZWFzZSBmZWVsIGZyZWUgdG8gZG9jdW1lbnQgYW5kIHVwZ3JhZGUgdGhlbSBv
bmNlIG1vcmUuCgpCZWFyIGluIG1pbmQgaG93ZXZlciwgdGhlcmUgaXMgYSBzY3JpcHQgdGhhdCBy
ZXBvcnRzIG9uIGFsbCBmaWxlcwp3aGljaCB1dGlsaXNlIGtlcm5lbC1kb2Mgbm90YXRpb24gYnV0
IGRvIG5vdCBoYXZlIG1hdGNoaW5nIHJlZmVyZW5jZXMKZnJvbSB0aGUgRG9jdW1lbnRhdGlvbiBh
cmVhLgoKU2VlOiBzY3JpcHRzL2ZpbmQtdW51c2VkLWRvY3Muc2gKCj4gPiBDYzogQ2hyaXN0aWFu
IEtvZW5pZyA8Y2hyaXN0aWFuLmtvZW5pZ0BhbWQuY29tPgo+ID4gQ2M6IEh1YW5nIFJ1aSA8cmF5
Lmh1YW5nQGFtZC5jb20+Cj4gPiBDYzogRGF2aWQgQWlybGllIDxhaXJsaWVkQGxpbnV4LmllPgo+
ID4gQ2M6IERhbmllbCBWZXR0ZXIgPGRhbmllbEBmZndsbC5jaD4KPiA+IENjOiBkcmktZGV2ZWxA
bGlzdHMuZnJlZWRlc2t0b3Aub3JnCj4gPiBTaWduZWQtb2ZmLWJ5OiBMZWUgSm9uZXMgPGxlZS5q
b25lc0BsaW5hcm8ub3JnPgo+ID4gLS0tCj4gPiAgIGRyaXZlcnMvZ3B1L2RybS90dG0vdHRtX3R0
LmMgfCA0ICsrLS0KPiA+ICAgMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMiBkZWxl
dGlvbnMoLSkKPiA+IAo+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS90dG0vdHRtX3R0
LmMgYi9kcml2ZXJzL2dwdS9kcm0vdHRtL3R0bV90dC5jCj4gPiBpbmRleCBjZmQ2MzNjN2U3NjQz
Li5kYTllZWZmZTBjNmQ3IDEwMDY0NAo+ID4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL3R0bS90dG1f
dHQuYwo+ID4gKysrIGIvZHJpdmVycy9ncHUvZHJtL3R0bS90dG1fdHQuYwo+ID4gQEAgLTM4LDcg
KzM4LDcgQEAKPiA+ICAgI2luY2x1ZGUgPGRybS9kcm1fY2FjaGUuaD4KPiA+ICAgI2luY2x1ZGUg
PGRybS90dG0vdHRtX2JvX2RyaXZlci5oPgo+ID4gLS8qKgo+ID4gKy8qCj4gPiAgICAqIEFsbG9j
YXRlcyBhIHR0bSBzdHJ1Y3R1cmUgZm9yIHRoZSBnaXZlbiBCTy4KPiA+ICAgICovCj4gPiAgIGlu
dCB0dG1fdHRfY3JlYXRlKHN0cnVjdCB0dG1fYnVmZmVyX29iamVjdCAqYm8sIGJvb2wgemVyb19h
bGxvYykKPiA+IEBAIC03Myw3ICs3Myw3IEBAIGludCB0dG1fdHRfY3JlYXRlKHN0cnVjdCB0dG1f
YnVmZmVyX29iamVjdCAqYm8sIGJvb2wgemVyb19hbGxvYykKPiA+ICAgCXJldHVybiAwOwo+ID4g
ICB9Cj4gPiAtLyoqCj4gPiArLyoKPiA+ICAgICogQWxsb2NhdGVzIHN0b3JhZ2UgZm9yIHBvaW50
ZXJzIHRvIHRoZSBwYWdlcyB0aGF0IGJhY2sgdGhlIHR0bS4KPiA+ICAgICovCj4gPiAgIHN0YXRp
YyBpbnQgdHRtX3R0X2FsbG9jX3BhZ2VfZGlyZWN0b3J5KHN0cnVjdCB0dG1fdHQgKnR0bSkKPiAK
Ci0tIApMZWUgSm9uZXMgW+adjueQvOaWr10KU2VuaW9yIFRlY2huaWNhbCBMZWFkIC0gRGV2ZWxv
cGVyIFNlcnZpY2VzCkxpbmFyby5vcmcg4pSCIE9wZW4gc291cmNlIHNvZnR3YXJlIGZvciBBcm0g
U29DcwpGb2xsb3cgTGluYXJvOiBGYWNlYm9vayB8IFR3aXR0ZXIgfCBCbG9nCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxp
c3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNr
dG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
