Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CD9DF1FC750
	for <lists+dri-devel@lfdr.de>; Wed, 17 Jun 2020 09:27:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6F4066EA9E;
	Wed, 17 Jun 2020 07:26:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x241.google.com (mail-lj1-x241.google.com
 [IPv6:2a00:1450:4864:20::241])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 589236E900
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Jun 2020 15:54:38 +0000 (UTC)
Received: by mail-lj1-x241.google.com with SMTP id x18so24141091lji.1
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Jun 2020 08:54:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=BwPR5JNs/q9Egd57RYRsGFErs0pzw9dkx/+kfWRalPo=;
 b=gzzirRpTPCq5Ny76s3yb9d3m8QffquYAtuj5mbGMtdGp6LEw5TVXUhQ8kyJHFRuq7j
 +xtd94IEK7jV9DzUEz12b7pGxV+er0UIMBXrHj7LN2kNwX3TsEL1pWjDEms5IL3Ff8i8
 PpG0Wa4IFPkfQY8xU011oQQ0MO0wdT6kz1zpI0zPr4juMvY1WQ+suKyE899tuLrliwxT
 CC/JnJc1MbujFF6durjOfKQRiTS9DR6H61u5qGBcP0aOm1/kZt6ITT+/p67m/9bpfO7j
 OWr/sp12EjviRVtNj/n8m+B1d8S8RIOx/p2TL6091tdgXLsKXW+K0yR5ARMhtRo66Xx7
 bTMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=BwPR5JNs/q9Egd57RYRsGFErs0pzw9dkx/+kfWRalPo=;
 b=UpS8HYcuMt0E7R6SQAZMmgpBluxMQfStZhU88Wow7Xu949mOSycrLKf0Fyq5HVwhax
 HlbTtHU3ntUiGYm4hawmQSaHPuAnklJoFRCjbkzQO2jkt2HSY8tzrKki9lDJRh9NlL9G
 CSFUKFuQGdO1H7nsTymdvDUEFTSNOB+u2IN612Wl4LHFw+AOH3zzrNq5joX1guS/IsgR
 fXva8r8hRX9lrnO16wHKqZ2X7VsGcwo/b52W5iSzz36E0K4lrZbIk70NYauwmUtO2d9n
 h+IEkTxbyKbFIQIMCUzgKtE/HciMVNHDeVMTHcmT5IOWHLb1xInApG6GNSxBkfxpBQr7
 QIDQ==
X-Gm-Message-State: AOAM532sFTXjkFcNNYwnLp1jx6T7JH7EJFffCY2xdazlsEnu1fC7B6Zd
 UbGMqcQJtVZkXnodPhLVqnk=
X-Google-Smtp-Source: ABdhPJyWXA4jpmvQMSBu85gdPskFjHd8t0vKD51B0L0bmgUnzBtySLDikzSYzj76TgqKFV57cR55Vw==
X-Received: by 2002:a2e:b0fa:: with SMTP id h26mr1723066ljl.148.1592322876724; 
 Tue, 16 Jun 2020 08:54:36 -0700 (PDT)
Received: from [192.168.2.145] (79-139-237-54.dynamic.spd-mgts.ru.
 [79.139.237.54])
 by smtp.googlemail.com with ESMTPSA id w24sm4468518ljd.14.2020.06.16.08.54.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 16 Jun 2020 08:54:35 -0700 (PDT)
Subject: Re: [PATCH v2] drm/tegra: Add zpos property for cursor planes
To: Thierry Reding <thierry.reding@gmail.com>
References: <20200616121713.2983627-1-thierry.reding@gmail.com>
From: Dmitry Osipenko <digetx@gmail.com>
Message-ID: <c34c97ab-08de-341e-05e5-77e2651d956f@gmail.com>
Date: Tue, 16 Jun 2020 18:54:35 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200616121713.2983627-1-thierry.reding@gmail.com>
Content-Language: en-US
X-Mailman-Approved-At: Wed, 17 Jun 2020 07:26:02 +0000
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
Cc: linux-tegra@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Jon Hunter <jonathanh@nvidia.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

MTYuMDYuMjAyMCAxNToxNywgVGhpZXJyeSBSZWRpbmcg0L/QuNGI0LXRgjoKPiBGcm9tOiBUaGll
cnJ5IFJlZGluZyA8dHJlZGluZ0BudmlkaWEuY29tPgo+IAo+IEFzIG9mIGNvbW1pdCA0ZGM1NTUy
NWIwOTUgKCJkcm06IHBsYW5lOiBWZXJpZnkgdGhhdCBubyBvciBhbGwgcGxhbmVzCj4gaGF2ZSBh
IHpwb3MgcHJvcGVydHkiKSBhIHdhcm5pbmcgaXMgZW1pdHRlZCBpZiB0aGVyZSdzIGEgbWl4IG9m
IHBsYW5lcwo+IHdpdGggYW5kIHdpdGhvdXQgYSB6cG9zIHByb3BlcnR5Lgo+IAo+IE9uIFRlZ3Jh
LCBjdXJzb3IgcGxhbmVzIGFyZSBhbHdheXMgY29tcG9zaXRlZCBvbiB0b3Agb2YgYWxsIG90aGVy
Cj4gcGxhbmVzLCB3aGljaCBpcyB3aHkgdGhleSBuZXZlciBoYWQgYSB6cG9zIHByb3BlcnR5IGF0
dGFjaGVkIHRvIHRoZW0uCj4gSG93ZXZlciwgc2luY2UgdGhlIGNvbXBvc2l0aW9uIG9yZGVyIGlz
IGZpeGVkLCB0aGlzIGlzIHRyaXZpYWwgdG8KPiByZW1lZHkgYnkgc2ltcGx5IGF0dGFjaGluZyBh
biBpbW11dGFibGUgenBvcyBwcm9wZXJ0eSB0byB0aGVtLgo+IAo+IENoYW5nZXMgaW4gdjI6Cj4g
LSBoYXJkY29kZSBjdXJzb3IgcGxhbmUgenBvcyB0byAyNTUgaW5zdGVhZCBvZiAwIChWaWxsZSkK
PiAKPiBSZXBvcnRlZC1ieTogSm9uYXRoYW4gSHVudGVyIDxqb25hdGhhbmhAbnZpZGlhLmNvbT4K
PiBTaWduZWQtb2ZmLWJ5OiBUaGllcnJ5IFJlZGluZyA8dHJlZGluZ0BudmlkaWEuY29tPgo+IC0t
LQo+ICBkcml2ZXJzL2dwdS9kcm0vdGVncmEvZGMuYyAgfCA5ICsrKysrKystLQo+ICBkcml2ZXJz
L2dwdS9kcm0vdGVncmEvaHViLmMgfCAyICstCj4gIDIgZmlsZXMgY2hhbmdlZCwgOCBpbnNlcnRp
b25zKCspLCAzIGRlbGV0aW9ucygtKQo+IAo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0v
dGVncmEvZGMuYyBiL2RyaXZlcnMvZ3B1L2RybS90ZWdyYS9kYy5jCj4gaW5kZXggODNmMzFjNmU4
OTFjLi44NTQwOGVlZDQ2ODUgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL3RlZ3JhL2Rj
LmMKPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vdGVncmEvZGMuYwo+IEBAIC03ODcsNyArNzg3LDcg
QEAgc3RhdGljIHN0cnVjdCBkcm1fcGxhbmUgKnRlZ3JhX3ByaW1hcnlfcGxhbmVfY3JlYXRlKHN0
cnVjdCBkcm1fZGV2aWNlICpkcm0sCj4gIAl9Cj4gIAo+ICAJZHJtX3BsYW5lX2hlbHBlcl9hZGQo
JnBsYW5lLT5iYXNlLCAmdGVncmFfcGxhbmVfaGVscGVyX2Z1bmNzKTsKPiAtCWRybV9wbGFuZV9j
cmVhdGVfenBvc19wcm9wZXJ0eSgmcGxhbmUtPmJhc2UsIHBsYW5lLT5pbmRleCwgMCwgMjU1KTsK
PiArCWRybV9wbGFuZV9jcmVhdGVfenBvc19wcm9wZXJ0eSgmcGxhbmUtPmJhc2UsIHBsYW5lLT5p
bmRleCwgMCwgMjU0KTsKPiAgCj4gIAllcnIgPSBkcm1fcGxhbmVfY3JlYXRlX3JvdGF0aW9uX3By
b3BlcnR5KCZwbGFuZS0+YmFzZSwKPiAgCQkJCQkJIERSTV9NT0RFX1JPVEFURV8wLAo+IEBAIC05
NTcsNiArOTU3LDcgQEAgc3RhdGljIHN0cnVjdCBkcm1fcGxhbmUgKnRlZ3JhX2RjX2N1cnNvcl9w
bGFuZV9jcmVhdGUoc3RydWN0IGRybV9kZXZpY2UgKmRybSwKPiAgCX0KPiAgCj4gIAlkcm1fcGxh
bmVfaGVscGVyX2FkZCgmcGxhbmUtPmJhc2UsICZ0ZWdyYV9jdXJzb3JfcGxhbmVfaGVscGVyX2Z1
bmNzKTsKPiArCWRybV9wbGFuZV9jcmVhdGVfenBvc19pbW11dGFibGVfcHJvcGVydHkoJnBsYW5l
LT5iYXNlLCAyNTUpOwo+ICAKPiAgCXJldHVybiAmcGxhbmUtPmJhc2U7Cj4gIH0KPiBAQCAtMTA3
NCw3ICsxMDc1LDExIEBAIHN0YXRpYyBzdHJ1Y3QgZHJtX3BsYW5lICp0ZWdyYV9kY19vdmVybGF5
X3BsYW5lX2NyZWF0ZShzdHJ1Y3QgZHJtX2RldmljZSAqZHJtLAo+ICAJfQo+ICAKPiAgCWRybV9w
bGFuZV9oZWxwZXJfYWRkKCZwbGFuZS0+YmFzZSwgJnRlZ3JhX3BsYW5lX2hlbHBlcl9mdW5jcyk7
Cj4gLQlkcm1fcGxhbmVfY3JlYXRlX3pwb3NfcHJvcGVydHkoJnBsYW5lLT5iYXNlLCBwbGFuZS0+
aW5kZXgsIDAsIDI1NSk7Cj4gKwo+ICsJaWYgKCFjdXJzb3IpCj4gKwkJZHJtX3BsYW5lX2NyZWF0
ZV96cG9zX3Byb3BlcnR5KCZwbGFuZS0+YmFzZSwgcGxhbmUtPmluZGV4LCAwLCAyNTQpOwo+ICsJ
ZWxzZQo+ICsJCWRybV9wbGFuZV9jcmVhdGVfenBvc19pbW11dGFibGVfcHJvcGVydHkoJnBsYW5l
LT5iYXNlLCAyNTUpOwoKT24gVDIwLzMwIHdlJ3JlIGFyZSBzZXR0aW5nIHRoZSBwbGFuZSdzIHR5
cGUgdG8gQ1VSU09SIGJlY2F1c2Ugd2Ugd2FudAp0byB1c2Ugb25lIG92ZXJsYXkgcGxhbmUgZm9y
IHRoZSBtb3VzZSBjdXJzb3IuIE5ldmVydGhlbGVzcywgaXQncyBzdGlsbAphIGdlbmVyaWMgb3Zl
cmxheSBwbGFuZSB0aGF0IGNhbiBjaGFuZ2UgaXRzIHotcG9zaXRpb24sIGFuZCB0aHVzLCBpdCdz
Cndyb25nIHRvIG1ha2UgenBvcyBpbW11dGFibGUgaGVyZS4KX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2
ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21h
aWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
