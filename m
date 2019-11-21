Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EB5E10688C
	for <lists+dri-devel@lfdr.de>; Fri, 22 Nov 2019 10:01:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 905C26F4FA;
	Fri, 22 Nov 2019 09:01:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x144.google.com (mail-lf1-x144.google.com
 [IPv6:2a00:1450:4864:20::144])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C7DB66F4B3
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Nov 2019 17:14:38 +0000 (UTC)
Received: by mail-lf1-x144.google.com with SMTP id v24so3245990lfi.7
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Nov 2019 09:14:38 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:from:to:cc:references:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=cAzhUxhbi0ipJJRlq7LEPrGywJG5HkdxE06SxVESVKU=;
 b=m5afUIeIRllN7u4MmddESPA7LjWwhezNiC0F5N5xpKsZztncg8gC57OoV0FI3cPju+
 Hs7pcCGSJJhkPbBqboggV1OTlz9XwpSBtoZPjwuyjy7cpUIlhSD0oY3RAnnQ9eYUVnnh
 xKNX3harR1zOUl0lX8Bn28B/iAYwTjCdLBQQwy7nr/RPuCGvP90BAB1PhVpCoAQ1U/gY
 oNTS8uE1+PiIAqiFKW66OG6FZwaKBCJD1sKKuMrL1XWklA40dFylXZisOKqgwJ8m/qpN
 uSYTMhOKDD28Ce/SGCoE+gTXX7YanIBgw1T+mRH/6Pps3UPfyHIWcvtoy8N5tsWqCJkZ
 BCTQ==
X-Gm-Message-State: APjAAAWbVtsh77Y0EDGnXEVCFFjD9OWusO208i54gYmMOM9i/CvGRPsF
 Nik6LB0Ft2kEIoQIjYEULV0=
X-Google-Smtp-Source: APXvYqwWYb4yZPpewD8z8jU6llJI5iWJWK6txjiQJN0ChqrVUrDu6k8kR6SO8R5t194m7diWfvyJjg==
X-Received: by 2002:ac2:4c3b:: with SMTP id u27mr8918560lfq.131.1574356477219; 
 Thu, 21 Nov 2019 09:14:37 -0800 (PST)
Received: from [192.168.2.145] (79-139-233-37.dynamic.spd-mgts.ru.
 [79.139.233.37])
 by smtp.googlemail.com with ESMTPSA id z19sm1583151ljk.66.2019.11.21.09.14.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 21 Nov 2019 09:14:36 -0800 (PST)
Subject: Re: [PATCH v1 08/29] dt-bindings: interconnect: tegra: Add initial IDs
From: Dmitry Osipenko <digetx@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>
References: <20191118200247.3567-1-digetx@gmail.com>
 <20191118200247.3567-9-digetx@gmail.com> <20191119062535.GC2462695@ulmo>
 <8cff3af3-42c7-3312-5f98-cd5eb98b7b7a@gmail.com>
Message-ID: <f0f36176-8070-08a6-a61f-77221d916f04@gmail.com>
Date: Thu, 21 Nov 2019 20:14:35 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.1
MIME-Version: 1.0
In-Reply-To: <8cff3af3-42c7-3312-5f98-cd5eb98b7b7a@gmail.com>
Content-Language: en-US
X-Mailman-Approved-At: Fri, 22 Nov 2019 09:00:44 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=subject:from:to:cc:references:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=cAzhUxhbi0ipJJRlq7LEPrGywJG5HkdxE06SxVESVKU=;
 b=PXTQz/+Hd1s0CfRFTJDfyk4lkxAwzEQmZwcZZUy9l91K9JI/XZfGPbFhBdnt5WVooS
 df2ySPhZBMZoQsNlxicqFixYOg9eiDRQcpBqB0rDmPCDWwflyXiLf3kOJs37sGuoADnl
 SxAF5+GVCBpludbWA/oTghn5Z0/D5IT+q5rEIraqu3CY7AIcUqkZFRkYHO096ViBly50
 Ru4c/1mhi5dsBboNqrLLr5LyBMkY3ZT8pK1B90JtQCOr+kgNrtxENg+n3RWLUMmIRfGr
 vFY9PwdyXdEqQ9agz0Rj7R0mQBfIGQ4wxznDrQKmvdqpSgLh+hT0FZKl/X5VfHHLdWZS
 WXzA==
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
Cc: devicetree@vger.kernel.org, linux-pm@vger.kernel.org,
 Peter De Schrijver <pdeschrijver@nvidia.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Mikko Perttunen <mperttunen@nvidia.com>,
 Rob Herring <robh+dt@kernel.org>, linux-tegra@vger.kernel.org,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Georgi Djakov <georgi.djakov@linaro.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

MTkuMTEuMjAxOSAxOTo1NiwgRG1pdHJ5IE9zaXBlbmtvINC/0LjRiNC10YI6Cj4gMTkuMTEuMjAx
OSAwOToyNSwgVGhpZXJyeSBSZWRpbmcg0L/QuNGI0LXRgjoKPj4gT24gTW9uLCBOb3YgMTgsIDIw
MTkgYXQgMTE6MDI6MjZQTSArMDMwMCwgRG1pdHJ5IE9zaXBlbmtvIHdyb3RlOgo+Pj4gRGVmaW5l
IGludGVyY29ubmVjdCBJRHMgZm9yIG1lbW9yeSBjb250cm9sbGVyIChNQyksIGV4dGVybmFsIG1l
bW9yeQo+Pj4gY29udHJvbGxlciAoRU1DKSwgZXh0ZXJuYWwgbWVtb3J5IChFTUVNKSBhbmQgbWVt
b3J5IGNsaWVudHMgb2YgZGlzcGxheQo+Pj4gY29udHJvbGxlcnMgKERDKS4KPj4+Cj4+PiBTaWdu
ZWQtb2ZmLWJ5OiBEbWl0cnkgT3NpcGVua28gPGRpZ2V0eEBnbWFpbC5jb20+Cj4+PiAtLS0KPj4+
ICBpbmNsdWRlL2R0LWJpbmRpbmdzL2ludGVyY29ubmVjdC90ZWdyYS1pY2MuaCB8IDExICsrKysr
KysrKysrCj4+PiAgMSBmaWxlIGNoYW5nZWQsIDExIGluc2VydGlvbnMoKykKPj4+ICBjcmVhdGUg
bW9kZSAxMDA2NDQgaW5jbHVkZS9kdC1iaW5kaW5ncy9pbnRlcmNvbm5lY3QvdGVncmEtaWNjLmgK
PiAKPiAKPiBIZWxsbyBUaGllcnJ5LAo+IAo+PiBUaGVyZSB3YXMgYSBiaXQgb2YgZGlzY3Vzc2lv
biByZWdhcmRpbmcgdGhpcyBmb3IgYSByZWNlbnQgcGF0Y2ggdGhhdCBJCj4+IHdhcyB3b3JraW5n
IG9uLCBzZWU6Cj4+Cj4+IAlodHRwOi8vcGF0Y2h3b3JrLm96bGFicy5vcmcvcHJvamVjdC9saW51
eC10ZWdyYS9saXN0Lz9zZXJpZXM9MTQwMzE4Cj4gCj4gVGhhbmsgeW91IHZlcnkgbXVjaCBmb3Ig
dGhlIGxpbmsuCj4gCj4+IEknZCByYXRoZXIgbm90IHVzZSBhbiBhZGRpdGlvbmFsIHNldCBvZiBk
ZWZpbml0aW9ucyBmb3IgdGhpcy4gVGhlIG1lbW9yeQo+PiBjb250cm9sbGVyIGFscmVhZHkgaGFz
IGEgc2V0IG9mIG5hdGl2ZSBJRHMgZm9yIG1lbW9yeSBjbGllbnRzIHRoYXQgSQo+PiB0aGluayB3
ZSBjYW4gcmV1c2UgZm9yIHRoaXMuCj4gCj4gSSBtaXNzZWQgdGhhdCBpdCdzIGZpbmUgdG8gaGF2
ZSBtdWx0aXBsZSBJQ0MgY29ubmVjdGlvbnMgZGVmaW5lZAo+IHBlci1wYXRoLCBhdCBxdWljayBn
bGFuY2UgbG9va3MgbGlrZSBpbmRlZWQgaXQgc2hvdWxkIGJlIGZpbmUgdG8gcmUtdXNlCj4gTUMg
SURzLgoKV2VsbCwgaXQgaXMgbm90IHF1aXRlIGNvcnJlY3QgdG8gaGF2ZSBtdWx0aXBsZSBjb25u
ZWN0aW9ucyBwZXItcGF0aC4KClBsZWFzZSB0YWtlIGxvb2sgYXQgaW50ZXJjb25uZWN0J3MgYmlu
ZGluZyBhbmQgY29yZS5jOgoKICAxLiB0aGVyZSBzaG91bGQgYmUgb25lIHNyYy0+ZHN0IGNvbm5l
Y3Rpb24gcGVyLXBhdGgKICAyLiBlYWNoIGNvbm5lY3Rpb24gc2hvdWxkIGNvbXByaXNlIG9mIG9u
ZSBzb3VyY2UgYW5kIG9uZSBkZXN0aW5hdGlvbiBub2RlcwoKPj4gSSd2ZSBvbmx5IGFkZGVkIHRo
ZXNlIGNsaWVudCBJRHMgZm9yIFRlZ3JhMTk0IGJlY2F1c2UgdGhhdCdzIHdoZXJlIHdlCj4+IG5l
ZWQgaXQgdG8gYWN0dWFsbHkgZGVzY3JpYmUgYSBzcGVjaWZpYyBoYXJkd2FyZSBxdWlyaywgYnV0
IEkgY2FuIGNvbWUKPj4gdXAgd2l0aCB0aGUgZXF1aXZhbGVudCBmb3Igb2xkZXIgY2hpcHMgYXMg
d2VsbC4KPiAKPiBPbGRlciBUZWdyYSBTb0NzIGhhdmUgaGFyZHdhcmUgdW5pdHMgY29ubmVjdGVk
IHRvIE1DIHRocm91Z2ggQUhCIGJ1cywKPiBsaWtlIFVTQiBmb3IgZXhhbXBsZS4gVGhlc2UgdW5p
dHMgZG8gbm90IGhhdmUgTUMgY2xpZW50IElEcyBhbmQgdGhlcmUgaXMKPiBubyBNQyBJRCBkZWZp
bmVkIGZvciB0aGUgQUhCIGJ1cyBlaXRoZXIsIGJ1dCBwcm9iYWJseSBpdCB3b24ndCBiZSBhCj4g
cHJvYmxlbSB0byBkZWZpbmUgSURzIGZvciB0aGVtIGlmIHdpbGwgYmUgbmVjZXNzYXJ5Lgo+IAoK
U2luY2UgaW50ZXJjb25uZWN0IGJpbmRpbmcgcmVxdWlyZXMgdG8gZGVmaW5lIGJvdGggc291cmNl
IGFuZApkZXN0aW5hdGlvbiBub2RlcyBmb3IgdGhlIHBhdGgsIHRoZW4gTUMgSURzIGFyZSBub3Qg
ZW5vdWdoIGluIG9yZGVyIHRvCmRlZmluZSBpbnRlcmNvbm5lY3QgcGF0aCBiZWNhdXNlIHRoZXNl
IElEcyByZXByZXNlbnQgb25seSB0aGUgc291cmNlCm5vZGVzLiBEZXN0aW5hdGlvbiBub2RlIHNo
b3VsZCBiZSBlaXRoZXIgRU1DIG9yIEVNRU0uCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3Rz
LmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2RyaS1kZXZlbA==
