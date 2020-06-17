Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B1E31FEC24
	for <lists+dri-devel@lfdr.de>; Thu, 18 Jun 2020 09:17:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 92E386EA9B;
	Thu, 18 Jun 2020 07:17:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x241.google.com (mail-lj1-x241.google.com
 [IPv6:2a00:1450:4864:20::241])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C135F891C2
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Jun 2020 18:50:45 +0000 (UTC)
Received: by mail-lj1-x241.google.com with SMTP id x18so4204946lji.1
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Jun 2020 11:50:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:from:to:cc:references:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=niGCVV02yGmCTRiNUXF586GuPtEiVqmlf9Dj30WKY8I=;
 b=M8QbXD3dhMgoC9HGZspqf7XvjFgGe8WazwwUzCVArg0/V4J/2jzwL8H4RGbmNBNkwD
 R8wGcFDnf2lOnU41m/g9QNA/9d+ub6zNKxZNXZWQ8tvxe8mZUd8MMFDtixbRyq/Pc/BF
 PIlXs0P58oAy4Q0Hx7D0IDtf6qGVRToB7UUTEKeWrh2FvdpOJVARsCgHhh3DM2YDYITG
 yv2i+lxcsBl69kQVaF0qbqTQ0Q5+tPfaYHxiZHxuDl7GF//mofzMEAyRhY5MUNk0ZEEC
 ecIvPUB2Ri/1v20pzwyv+rz8M4vudDHoEqRG2l6oEitpvq6n6iLOMI6v2o8SNoiAejZ8
 ZauQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:from:to:cc:references:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=niGCVV02yGmCTRiNUXF586GuPtEiVqmlf9Dj30WKY8I=;
 b=lcYqJ97iqO17U5JfrQFR3pZA5Z6+i93LE15aYnsGS8CjPWTUiRdInTJ6dx/PRY0RhA
 XvEnmlI2/pHk2vxgYk+wPYO/QXr5dfCWKK7iH6EWPAurD5nkQh5YBcMXBlB5nfMw+GFY
 ELVmPb7A8gnDyqPCVw3IjdWxaObsQyKoezSVmj8HhqUj3B4S5rPjeqdOknNpL1UkW3uJ
 ojrHqlQQanr1fX+hiDCUphiQpJuZe9oY8ig3Jw+nhABphdCe+/Z9NNPuWmwcmH2uxAkK
 Ul0yq13ICV+BMHbfJp2ddROcoOE/rd0jepf8TG5Bh1jb8VxOvyEDM5tXkmouSKCYLU6v
 KFUg==
X-Gm-Message-State: AOAM530KMXl8q2RPwJWlYXuv252ILd2KySztElErmpWvnRhVmqk/R374
 51ro8JTjccKv83enAvAD+5Gavo/0
X-Google-Smtp-Source: ABdhPJwHrFp7hl7apCuUIGY5sl9ZXw4ffQukc+KSdkIkDhhEWKTpuESWMBtJoDInAjZab47xZDYMIQ==
X-Received: by 2002:a05:651c:544:: with SMTP id
 q4mr348194ljp.310.1592419843008; 
 Wed, 17 Jun 2020 11:50:43 -0700 (PDT)
Received: from [192.168.2.145] (79-139-237-54.dynamic.spd-mgts.ru.
 [79.139.237.54])
 by smtp.googlemail.com with ESMTPSA id r15sm119829ljm.31.2020.06.17.11.50.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 17 Jun 2020 11:50:42 -0700 (PDT)
Subject: =?UTF-8?Q?Re=3a_=5bPATCH_v2_5/5=5d_drm/tegra=3a_plane=3a_Support_18?=
 =?UTF-8?Q?0=c2=b0_rotation?=
From: Dmitry Osipenko <digetx@gmail.com>
To: Emil Velikov <emil.l.velikov@gmail.com>
References: <20200614200121.14147-1-digetx@gmail.com>
 <20200614200121.14147-6-digetx@gmail.com>
 <CACvgo50P5i2jX6ZrMD=UuGr_bA=8MbFhYBWBNvkMcdCyJKS5xg@mail.gmail.com>
 <e21404bd-49c9-039e-4aef-c4912a9c0640@gmail.com>
Message-ID: <2a004826-a505-75e4-b922-c74618404166@gmail.com>
Date: Wed, 17 Jun 2020 21:50:41 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <e21404bd-49c9-039e-4aef-c4912a9c0640@gmail.com>
Content-Language: en-US
X-Mailman-Approved-At: Thu, 18 Jun 2020 07:17:31 +0000
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
Cc: Sam Ravnborg <sam@ravnborg.org>, Derek Basehore <dbasehore@chromium.org>,
 "Linux-Kernel@Vger. Kernel. Org" <linux-kernel@vger.kernel.org>,
 ML dri-devel <dri-devel@lists.freedesktop.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, linux-tegra@vger.kernel.org,
 Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

MTYuMDYuMjAyMCAxNDoyNSwgRG1pdHJ5IE9zaXBlbmtvINC/0LjRiNC10YI6Cj4gMTYuMDYuMjAy
MCAwMDo0NywgRW1pbCBWZWxpa292INC/0LjRiNC10YI6Cj4+IEhpIGFsbCwKPj4KPj4gUGVyaGFw
cyBhIHNpbGx5IHF1ZXN0aW9uOgo+Pgo+PiBPbiBNb24sIDE1IEp1biAyMDIwIGF0IDA4OjI4LCBE
bWl0cnkgT3NpcGVua28gPGRpZ2V0eEBnbWFpbC5jb20+IHdyb3RlOgo+Pj4KPj4+IENvbWJpbmlu
ZyBob3Jpem9udGFsIGFuZCB2ZXJ0aWNhbCByZWZsZWN0aW9ucyBnaXZlcyB1cyAxODAgZGVncmVl
cyBvZgo+Pj4gcm90YXRpb24uCj4+Pgo+Pj4gU2lnbmVkLW9mZi1ieTogRG1pdHJ5IE9zaXBlbmtv
IDxkaWdldHhAZ21haWwuY29tPgo+Pj4gLS0tCj4+PiAgZHJpdmVycy9ncHUvZHJtL3RlZ3JhL2Rj
LmMgfCAxMyArKysrKysrKysrKystCj4+PiAgMSBmaWxlIGNoYW5nZWQsIDEyIGluc2VydGlvbnMo
KyksIDEgZGVsZXRpb24oLSkKPj4+Cj4+PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3Rl
Z3JhL2RjLmMgYi9kcml2ZXJzL2dwdS9kcm0vdGVncmEvZGMuYwo+Pj4gaW5kZXggZjMxYmNhMjdj
ZGU0Li5kZGQ5Yjg4ZjhmY2UgMTAwNjQ0Cj4+PiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vdGVncmEv
ZGMuYwo+Pj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL3RlZ3JhL2RjLmMKPj4KPj4+ICsgICAgICAg
aWYgKHJvdGF0aW9uICYgRFJNX01PREVfUk9UQVRFXzE4MCkgewo+Pj4gKyAgICAgICAgICAgICAg
IHBsYW5lX3N0YXRlLT5yZWZsZWN0X3ggPSAhcGxhbmVfc3RhdGUtPnJlZmxlY3RfeDsKPj4+ICsg
ICAgICAgICAgICAgICBwbGFuZV9zdGF0ZS0+cmVmbGVjdF95ID0gIXBsYW5lX3N0YXRlLT5yZWZs
ZWN0X3k7Cj4+PiArICAgICAgIH0KPj4+ICsKPj4gQXMgbWVudGlvbmVkIGJ5IFZpbGxlIHRoZSBh
Ym92ZSBpcyBhbHJlYWR5IGhhbmRsZWQgYnkKPj4gZHJtX3JvdGF0aW9uX3NpbXBsaWZ5KCkgLi4u
IGFsdGhvdWdoIGl0IG1ha2VzIG1lIHdvbmRlcjoKPj4KPj4KPj4+ICAgICAgICAgZXJyID0gZHJt
X3BsYW5lX2NyZWF0ZV9yb3RhdGlvbl9wcm9wZXJ0eSgmcGxhbmUtPmJhc2UsCj4+PiAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgRFJNX01PREVfUk9UQVRF
XzAsCj4+PiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
RFJNX01PREVfUk9UQVRFXzAgfAo+Pj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgIERSTV9NT0RFX1JPVEFURV8xODAgfAo+Pj4gICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIERSTV9NT0RFX1JFRkxFQ1RfWCB8Cj4+
PiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgRFJNX01P
REVfUkVGTEVDVF9ZKTsKPj4KPj4gV291bGQgaXQgbWFrZSBzZW5zZSBmb3IgZHJtX3BsYW5lX2Ny
ZWF0ZV9yb3RhdGlvbl9wcm9wZXJ0eSgpIGl0c2VsZiwKPj4gdG8gYWRkIERSTV9NT0RFX1JPVEFU
RV8xODAsIHdoZW4gYm90aCByZWZsZWN0aW9ucyBhcmUgc3VwcG9ydGVkPwo+IAo+IEhlbGxvIEVt
aWwsCj4gCj4gVGhhdCdzIGEgZ29vZCBwb2ludCEgQWxsIERSTV9NT0RFX1JPVEFURV8xODAgc2hv
dWxkIGJlIHJlbW92ZWQgYmVjYXVzZQo+IFRlZ3JhIGNhbid0IGRvIDE4MMKwICsgcmVmbGVjdGVk
LXguIFRoZSBEUk0gY29yZSB0YWtlcyBjYXJlIG9mIDE4MMKwCj4gcm90YXRpb24gd2hlbiBib3Ro
IHgveSByZWZsZWN0aW9ucyBhcmUgc3VwcG9ydGVkLgo+IAoKSSBqdXN0IGZvdW5kIG91dCB0aGF0
IEkgZm9yZ290IHRvIGRyb3AgdGhlIFdJUCBwYXRjaGVzIHdoaWNoIGFkZGVkCnRyYW5zcGFyZW50
IHJvdGF0aW9uIHN1cHBvcnQgd2hpbGUgd2FzIGNoZWNraW5nIHdoZXRoZXIgdGhlc2UgcGxhbmUK
RFJNX01PREVfUk9UQVRFXzE4MCBjb3VsZCBiZSBkcm9wcGVkIGFuZCBpdCdzIGFjdHVhbGx5IG5l
ZWQgdG8gYmUgc2V0CmZvciB0aGUgcGxhbmVzLCBvdGhlcndpc2UgMTgwIHJvdGF0aW9uIHN1cHBv
cnQgaXMgZmlsdGVyZWQgb3V0IGJ5IHRoZQphdG9taWMgY2hlY2suCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJp
LWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
