Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B5EC292E77
	for <lists+dri-devel@lfdr.de>; Mon, 19 Oct 2020 21:28:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 669E16EA4E;
	Mon, 19 Oct 2020 19:28:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x141.google.com (mail-lf1-x141.google.com
 [IPv6:2a00:1450:4864:20::141])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 606746E8F7
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Oct 2020 17:27:10 +0000 (UTC)
Received: by mail-lf1-x141.google.com with SMTP id r127so386335lff.12
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Oct 2020 10:27:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=QUbOMORup/wBr0FxbJpx7sQZqNNI1fgY9QgZgYIF3Ak=;
 b=iuHwrOeETUm3YA3tHGnV0uBTBYkCYjRjqMskaQovMGtcm+TNNcAl+1CfHDojEyxJba
 3+ef9vBK/d7DDNO+QzyMvhTaBzS9nFalndLgTzLxtNoC706XJRnigZDT6iuV6NRijH/r
 TypvdkWtr0STDSLO8BlhMAbULFKn+6Vu+r3ROznZbZyfCmyvGGI0NPdEbMSX8iijzGMq
 fx6k1vwmU9fz7pxQ3yZvfrIsKAv1sl8/RJcxW5w7R1QZK+3anTZ8FedpkJCZvXJbl5P/
 eUiTyyV+QDVflqSAGnFnlrOLSnAfDKFftR5BpeDBeAdhL5PxE4como8fXF6VgRcj4JfG
 8pGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=QUbOMORup/wBr0FxbJpx7sQZqNNI1fgY9QgZgYIF3Ak=;
 b=rw6s/22xLOJoH9jxuhnDCasO55shU6WrSPiTiAwm8Chg7NI6XjUl/LwtNo42bILMH5
 wTTyxKNe7sfhDVUnrIl20BIdIhyqPRyjL2IyrpzwsTuDU5088330ntesXps9tHm23FAU
 vEkM2cteRyPAIhBpfYsPyh8N8nZlwr0dPTrS8meVaVuHYmNW1sM9w3hjyBOYG/ZDwTLP
 akEPSTG2nvD4MNg5IlctLEZQnBQj/RpANV/YVXJU54PnIDiW08bznAtRvEdRNlVSIh68
 zqlWrmYOc7jMBjJxDtj7Fgo/11lTGSQixLVc8HNQLuI73R/C4VBKG0P7tfXhnqKW1Awn
 I9Xw==
X-Gm-Message-State: AOAM530vHjAJhGhVEZHkTiLXDBWPqeF2wlzLWuzV8H2Dcm8OjeQ+OnX2
 lvAdpw3q/JMvNNfoVD9etk0=
X-Google-Smtp-Source: ABdhPJwh0YAqS5b3rnibvxmXnvulaECI8zYGWV+21DlBeRwCeebnkrkxJ4YuFa0Dx6ju+fsyer40Yw==
X-Received: by 2002:a05:6512:3132:: with SMTP id
 p18mr226381lfd.218.1603128428559; 
 Mon, 19 Oct 2020 10:27:08 -0700 (PDT)
Received: from [192.168.2.145] (109-252-193-186.dynamic.spd-mgts.ru.
 [109.252.193.186])
 by smtp.googlemail.com with ESMTPSA id x7sm67113lfg.281.2020.10.19.10.27.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 19 Oct 2020 10:27:07 -0700 (PDT)
Subject: Re: [PATCH v3 19/20] drm/tegra: Implement new UAPI
To: Mikko Perttunen <cyndis@kapsi.fi>, Mikko Perttunen
 <mperttunen@nvidia.com>, thierry.reding@gmail.com, jonathanh@nvidia.com,
 airlied@linux.ie, daniel@ffwll.ch
References: <20201007171238.1795964-1-mperttunen@nvidia.com>
 <20201007171238.1795964-20-mperttunen@nvidia.com>
 <dd13ec2c-1e01-ca61-656c-b23b156b100f@gmail.com>
 <b33a5084-7dc3-a865-2f36-274ecebf2ee7@kapsi.fi>
From: Dmitry Osipenko <digetx@gmail.com>
Message-ID: <1f3267a9-37b4-2cff-08a2-2ca7c905ce01@gmail.com>
Date: Mon, 19 Oct 2020 20:27:07 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <b33a5084-7dc3-a865-2f36-274ecebf2ee7@kapsi.fi>
Content-Language: en-US
X-Mailman-Approved-At: Mon, 19 Oct 2020 19:28:29 +0000
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
Cc: linux-tegra@vger.kernel.org, talho@nvidia.com, bhuntsman@nvidia.com,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

MTkuMTAuMjAyMCAxMToxMywgTWlra28gUGVydHR1bmVuINC/0LjRiNC10YI6Cj4gT24gMTAvMTkv
MjAgNToyMSBBTSwgRG1pdHJ5IE9zaXBlbmtvIHdyb3RlOgo+PiAwNy4xMC4yMDIwIDIwOjEyLCBN
aWtrbyBQZXJ0dHVuZW4g0L/QuNGI0LXRgjoKPj4+ICtpbnQgdGVncmFfZHJtX2lvY3RsX2NoYW5u
ZWxfbWFwKHN0cnVjdCBkcm1fZGV2aWNlICpkcm0sIHZvaWQgKmRhdGEsCj4+PiArwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgIHN0cnVjdCBkcm1fZmlsZSAqZmlsZSkKPj4+ICt7Cj4+Cj4+
IEhlbGxvLCBNaWtrbyEKPj4KPj4gQ291bGQgeW91IHBsZWFzZSB0ZWxsIHdoYXQgYXJlIHRoZSBo
b3N0MXggY2xpZW50cyB0aGF0IGFyZSBnb2luZyB0byBiZQo+PiB1cHN0cmVhbWVkIGFuZCB3aWxs
IG5lZWQgdGhpcyBJT0NUTD8KPj4KPiAKPiBIaSBEbWl0cnkhCj4gCj4gSXQgaXMgbmVlZGVkIGZv
ciBhbnkgZW5naW5lL2pvYiB0aGF0IHdhbnRzIHRvIGFjY2VzcyBtZW1vcnksIGFzIHRoaXMKPiBJ
T0NUTCBtdXN0IGJlIHVzZWQgdG8gbWFwIG1lbW9yeSBmb3IgdGhlIGVuZ2luZS4gU28gYWxsIG9m
IHRoZW0uCj4gCj4gRG93bnN0cmVhbSBkb2Vzbid0IGhhdmUgYW4gZXF1aXZhbGVudCBJT0NUTCBi
ZWNhdXNlIGl0IChjdXJyZW50bHkpIGRvZXMKPiBtYXBwaW5nIGF0IHN1Ym1pdCB0aW1lLCBidXQg
dGhhdCBpcyBzdWJvcHRpbWFsIGJlY2F1c2UKPiAKPiAtIGl0IHJlcXVpcmVzIGRvaW5nIHJlbG9j
YXRpb25zIGluIHRoZSBrZXJuZWwgd2hpY2ggaXNuJ3QgcmVxdWlyZWQgZm9yCj4gVDE4NisKPiAt
IGl0J3MgYSBiaWcgcGVyZm9ybWFuY2UgcGVuYWx0eSwgZHVlIHRvIHdoaWNoIHRoZSBkb3duc3Ry
ZWFtIGtlcm5lbCBoYXMKPiB0aGUgImRlZmVycmVkIGRtYS1idWYgdW5tYXBwaW5nIiBmZWF0dXJl
LCB3aGVyZSB1bm1hcHBpbmcgYSBkbWFfYnVmIG1heQo+IG5vdCBpbW1lZGlhdGVseSB1bm1hcCBp
dCBpbiBjYXNlIGl0J3MgdXNlZCBsYXRlciwgc28gdGhhdCB0aGUgIm1hcHBpbmciCj4gbGF0ZXIg
aXMgZmFzdGVyLiBBIGZlYXR1cmUgd2hpY2ggd2UnZCBwcmVmZXJhYmx5IGdldCByaWQgb2YuCj4g
LSBiZWNhdXNlIG9mIHRoZSBhYm92ZSBmZWF0dXJlIG5vdCBiZWluZyBjb250cm9sbGVkIGJ5IHRo
ZSB1c2VyLCBpdCBjYW4KPiBjYXVzZSB2YXJpYW5jZSBpbiBzdWJtaXQgdGltZXMuCj4gCj4gT24g
dGhlIG90aGVyIGhhbmQsIHdlIGNhbm5vdCAoYXQgbGVhc3QgYWx3YXlzKSBkbyB0aGUgbWFwcGlu
ZyBhdAo+IGFsbG9jYXRpb24vaW1wb3J0IHRpbWUsIGJlY2F1c2UKPiAKPiAtIEEgc2luZ2xlIEZE
IG1heSBoYXZlIG11bHRpcGxlIGNoYW5uZWxfY3R4J3MsIGFuZCBhbiBhbGxvY2F0aW9uL2ltcG9y
dAo+IG1heSBuZWVkIHRvIGJlIHVzZWQgaW4gYW55IHN1YnNldCBvZiB0aGVtCj4gLSBUaGUgaW1w
b3J0IElPQ1RMIGlzIGZpeGVkIGFuZCBkb2Vzbid0IGhhdmUgdGhlIHBhcmFtZXRlcnMgd2UnZCBu
ZWVkIHRvCj4gZG8gdGhpcyBhdCBpbXBvcnQgdGltZQo+IC0gT3ZlcmFsbCBpdCdzIG1vcmUgb3J0
aG9nb25hbCB0byBoYXZlIEdFTSBvYmplY3QgYWNxdWlyZW1lbnQgaW4gb25lCj4gc3RlcCBhbmQg
bWFwcGluZyBpbiBhbm90aGVyLgo+IAo+IE1heWJlIHRoYXQncyBub3QgcXVpdGUgd2hhdCB5b3Ug
YXNrZWQsIGJ1dCBpdCdzIHNvbWUgYmFja2dyb3VuZCBhbnl3YXkgOikKCkknbSBhc2tpbmcgdGhp
cyBxdWVzdGlvbiBiZWNhdXNlIHJpZ2h0IG5vdyB0aGVyZSBpcyBvbmx5IG9uZSBwb3RlbnRpYWwK
Y2xpZW50IGZvciB0aGlzIElPQ1RMLCB0aGUgVklDLiBJZiBvdGhlciBjbGllbnRzIGFyZW4ndCBz
dXBwb3NlZCB0byBiZSBhCnBhcnQgb2YgdGhlIERSTSBkcml2ZXIsIGxpa2UgZm9yIGV4YW1wbGUg
TlZERUMgd2hpY2ggcHJvYmFibHkgc2hvdWxkIGJlCmEgVjRMIGRyaXZlciwgdGhlbiBEUk0gZHJp
dmVyIHdpbGwgaGF2ZSBvbmx5IGEgc2luZ2xlIFZJQyBhbmQgaW4gdGhpcwpjYXNlIHdlIHNob3Vs
ZG4ndCBuZWVkIHRoaXMgSU9DVEwgYmVjYXVzZSBEUk0gYW5kIFY0TCBzaG91bGQgdXNlIGdlbmVy
aWMKZG1hYnVmIEFQSSBmb3IgaW1wb3J0aW5nIGFuZCBleHBvcnRpbmcgYnVmZmVycy4KCkknbSBh
bHNvIG5vdCBxdWl0ZSBzdXJlIGFib3V0IHdoZXRoZXIgdGhlIGN1cnJlbnQgbW9kZWwgb2YgdGhl
IHVuaWZpZWQKVGVncmEgRFJNIGRyaXZlciBpcyBzdWl0YWJsZSBmb3IgaGF2aW5nIHRoZSBzZXBh
cmF0ZWQgZW5naW5lcy4gUGVyaGFwcwplYWNoIHNlcGFyYXRlZCBlbmdpbmUgc2hvdWxkIGp1c3Qg
aGF2ZSBpdHMgb3duIHJlbmRlcmluZyBub2RlPwpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0
cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9kcmktZGV2ZWwK
