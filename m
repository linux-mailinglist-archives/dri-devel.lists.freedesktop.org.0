Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BAC401B2A07
	for <lists+dri-devel@lfdr.de>; Tue, 21 Apr 2020 16:34:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C964F6E997;
	Tue, 21 Apr 2020 14:34:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BD6E16E997;
 Tue, 21 Apr 2020 14:34:50 +0000 (UTC)
Received: by mail-wr1-x443.google.com with SMTP id j1so11298580wrt.1;
 Tue, 21 Apr 2020 07:34:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=reply-to:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=HrrABaXLUK+bPy0fdwRQoQPuSqEEAVVuKzEQC2jICSE=;
 b=k5VkunYZ2gHKXuUIFKCNiaPGcorcXMRyAuASbEdeLkf7HEejLaClQxXbntAwRgbmXJ
 cmmQ+e4rZLchRMU+RQ9P90Hs3ql64dCo1817gdyxTPRyTXy82ZxW978LmAn07qKecpsK
 nxkE/hUaMeDyWXR/luGgxPr6kgsTqDGfWLzG6landsoIUEGaB+sJhE6/znXF/8mZMgRZ
 bu8kEpujAm3YJv1JtHYqmt/wZrq4gXoOiVt3N/2sPluPqgDAv1QEv+kDb/aqx9IGDdmM
 HcGm+yHwcesxsTkM5xMlA7gaWgbbnuJSbNTYD+uYMtB3D8Tv7RH1y5nWSiYHi4xhdkp3
 sukw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:reply-to:subject:to:cc:references:from
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-transfer-encoding:content-language;
 bh=HrrABaXLUK+bPy0fdwRQoQPuSqEEAVVuKzEQC2jICSE=;
 b=S2JF1P7SHrAQrA72bv5QGLrmEcMUkMjJ4UgMs1qkduHSVe1x6mgIQGEEDWClDc5Lxi
 falAYTsJX45GFwrsSUfW0+ogQmQdsA3smVRmndJ6SNbauPRqBUVi5fgOUONVpVlUC/GR
 ZuXJfjH1eYNTzyeWdm+YQDFGZpaaKRViEdepY7hk9lrZcWv0znfCFRzSiAC+YVzATooD
 WNbwb05o/fv4WjYTku4Ecom45dacELyN6VhHvEiSI3Ly0PP44qT3eUumthcnRAXJFiol
 AK7E8bxlxUHo2L8lo/3b2F+AQWKuTuPWbw2nq/xIixbvMFzdG8vfgR+DzYF1w5imf704
 DAJA==
X-Gm-Message-State: AGi0PuYl8sj9WqB1rfVb2eZgDACjYfOQSLzKqh5N3ZnsBoT5mE/GCHRb
 9ZXrnlLGhl0++cuFTrvgL+A2KWc5
X-Google-Smtp-Source: APiQypIoIT0nXge83R7lR7jhW0o6bPi87Cu3A9O7tHw1bGbnk5nKAz1MQIh50fkzI1YJfbCVnhV88Q==
X-Received: by 2002:a5d:49c7:: with SMTP id t7mr23253623wrs.22.1587479689432; 
 Tue, 21 Apr 2020 07:34:49 -0700 (PDT)
Received: from ?IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7?
 ([2a02:908:1252:fb60:be8a:bd56:1f94:86e7])
 by smtp.gmail.com with ESMTPSA id e5sm3994977wru.92.2020.04.21.07.34.45
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 21 Apr 2020 07:34:49 -0700 (PDT)
Subject: Re: [PATCH] drm: amdgpu: fix kernel-doc struct warning
To: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 Randy Dunlap <rdunlap@infradead.org>, dri-devel@lists.freedesktop.org
References: <20200420015015.27991-1-rdunlap@infradead.org>
 <20200420015015.27991-2-rdunlap@infradead.org>
 <128ebc30-e62b-b928-cf92-9ca331bfb6b5@amd.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
Message-ID: <aeecb841-c5a4-36c7-e511-eb7250e9ece1@gmail.com>
Date: Tue, 21 Apr 2020 16:34:44 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <128ebc30-e62b-b928-cf92-9ca331bfb6b5@amd.com>
Content-Language: en-US
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
Reply-To: christian.koenig@amd.com
Cc: "Signed-off-by : Alex Sierra" <alex.sierra@amd.com>,
 Leo Li <sunpeng.li@amd.com>, Felix Kuehling <Felix.Kuehling@amd.com>,
 amd-gfx@lists.freedesktop.org, Alex Deucher <alexander.deucher@amd.com>,
 Bhawanpreet Lakha <Bhawanpreet.Lakha@amd.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QW0gMjEuMDQuMjAgdW0gMTY6MzMgc2NocmllYiBDaHJpc3RpYW4gS8O2bmlnOgo+IEFtIDIwLjA0
LjIwIHVtIDAzOjUwIHNjaHJpZWIgUmFuZHkgRHVubGFwOgo+PiBGaXggYSBrZXJuZWwtZG9jIHdh
cm5pbmcgb2YgbWlzc2luZyBzdHJ1Y3QgZmllbGQgZGVzcmlwdGlvbjoKPj4KPj4gLi4vZHJpdmVy
cy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3ZtLmM6OTI6IHdhcm5pbmc6IEZ1bmN0aW9uIAo+
PiBwYXJhbWV0ZXIgb3IgbWVtYmVyICd2bScgbm90IGRlc2NyaWJlZCBpbiAnYW1kZ3B1X3ZtX2V2
aWN0aW9uX2xvY2snCj4KPiBDYW4ndCB3ZSBqdXN0IGRvY3VtZW50IHRoZSBmdW5jdGlvbiBwYXJh
bWV0ZXIgaW5zdGVhZD8gU2hvdWxkIG9ubHkgYmUgCj4gb25lIElJUkMuCgpPbiB0aGUgb3RoZXIg
aGFuZCBmb3JnZXQgdGhhdCwgdGhlIGZvcm1hdCBkb2Vzbid0IG1hdGNoIGEgcHJvcGVyIAprZXJu
ZWwtZG9jIGZvciBhIGZ1bmN0aW9uIGFueXdheS4KClJldmlld2VkLWJ5OiBDaHJpc3RpYW4gS8O2
bmlnIDxjaHJpc3RpYW4ua29lbmlnQGFtZC5jb20+Cgo+Cj4gVGhhbmtzLAo+IENocmlzdGlhbi4K
Pgo+Pgo+PiBGaXhlczogYTI2OWU0NDk4OWYzICgiZHJtL2FtZGdwdTogQXZvaWQgcmVjbGFpbSBm
cyB3aGlsZSBldmljdGlvbiBsb2NrIikKPj4gU2lnbmVkLW9mZi1ieTogUmFuZHkgRHVubGFwIDxy
ZHVubGFwQGluZnJhZGVhZC5vcmc+Cj4+IENjOiBTaWduZWQtb2ZmLWJ5OiBBbGV4IFNpZXJyYSA8
YWxleC5zaWVycmFAYW1kLmNvbT4KPj4gQ2M6IEZlbGl4IEt1ZWhsaW5nIDxGZWxpeC5LdWVobGlu
Z0BhbWQuY29tPgo+PiBDYzogQ2hyaXN0aWFuIEvDtm5pZyA8Y2hyaXN0aWFuLmtvZW5pZ0BhbWQu
Y29tPgo+PiBDYzogQWxleCBEZXVjaGVyIDxhbGV4YW5kZXIuZGV1Y2hlckBhbWQuY29tPgo+PiBD
YzogRGF2aWQgKENodW5NaW5nKSBaaG91IDxEYXZpZDEuWmhvdUBhbWQuY29tPgo+PiBDYzogYW1k
LWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKPj4gLS0tCj4+IMKgIGRyaXZlcnMvZ3B1L2RybS9h
bWQvYW1kZ3B1L2FtZGdwdV92bS5jIHzCoMKgwqAgMiArLQo+PiDCoCAxIGZpbGUgY2hhbmdlZCwg
MSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKPj4KPj4gLS0tIGxueC01Ny1yYzIub3JpZy9k
cml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfdm0uYwo+PiArKysgbG54LTU3LXJjMi9k
cml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfdm0uYwo+PiBAQCAtODIsNyArODIsNyBA
QCBzdHJ1Y3QgYW1kZ3B1X3BydF9jYiB7Cj4+IMKgwqDCoMKgwqAgc3RydWN0IGRtYV9mZW5jZV9j
YiBjYjsKPj4gwqAgfTsKPj4gwqAgLS8qKgo+PiArLyoKPj4gwqDCoCAqIHZtIGV2aWN0aW9uX2xv
Y2sgY2FuIGJlIHRha2VuIGluIE1NVSBub3RpZmllcnMuIE1ha2Ugc3VyZSBubyAKPj4gcmVjbGFp
bS1GUwo+PiDCoMKgICogaGFwcGVucyB3aGlsZSBob2xkaW5nIHRoaXMgbG9jayBhbnl3aGVyZSB0
byBwcmV2ZW50IGRlYWRsb2NrcyB3aGVuCj4+IMKgwqAgKiBhbiBNTVUgbm90aWZpZXIgcnVucyBp
biByZWNsYWltLUZTIGNvbnRleHQuCj4KPiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwo+IGFtZC1nZnggbWFpbGluZyBsaXN0Cj4gYW1kLWdmeEBsaXN0cy5m
cmVlZGVza3RvcC5vcmcKPiBodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2FtZC1nZngKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9w
Lm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1k
ZXZlbAo=
