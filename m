Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D2D2435EF17
	for <lists+dri-devel@lfdr.de>; Wed, 14 Apr 2021 10:08:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C8BC36E8F0;
	Wed, 14 Apr 2021 08:08:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [IPv6:2a00:1450:4864:20::332])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 114736E8F0
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Apr 2021 08:08:49 +0000 (UTC)
Received: by mail-wm1-x332.google.com with SMTP id p19so10096923wmq.1
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Apr 2021 01:08:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=subject:to:cc:references:from:organization:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=DRB91qJ9A807fA6EgTPbj2BjYNiQSWg2GBkiUK5aiR8=;
 b=erR68VNgencnw1ay0BO9J47khMJtHxhpoHs+HRe5qPJed6lBCwtxPr4kvsJsJsbQKH
 mprD90Wo+J9FEZ2SjWPXtUWn6B43osZU/1x4zf1AmmNpHqVxD9CzpbyubINrw9mtd3Ab
 Je8BsLoWW92ihcO6a8PWlenQW+x9fpBd12vjMuS8gGTVvIYkL5DOs5nxnOrOLTv4TdX2
 uOcutKO18S89u7BbY+3MFNnPD2cdIDD6cQgTGV1bEbgAdK7tXsOJ3ND1FfJ9c459L1Ps
 ECfjG6n6JDigN/bkEd2hlA8JQKn2b4BVwCa5I4bW/TQIulVj9NZahtiJffPlLca+x6yO
 7a6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=DRB91qJ9A807fA6EgTPbj2BjYNiQSWg2GBkiUK5aiR8=;
 b=pbfanyWnwzLEC4sDXzFQbjxdkbSkMujcmYWzyYbMw6M6WwnTXhJU1r1kS8xs38CxPZ
 h1Z2awUHOY3uyUeR7/olsdb+AeXBf7Y53/BwsRCqU9makUEi7bf7fewG3sTtgJe0VTWN
 UNkyH+tAOUU4+w2nuwijLUpbEU8OG78ZjENx+k3C++bEtT4ZgpKNIaL6gU5GtCPx6pUV
 L2thwF7OFd3Y+9yjmDEWX8z/1TZR9P9MiUOafQQTTx7tuCTcwcZvolE85nLDcgUj9W8u
 NLhQMEMvmHjGl8gqrnPGTdO9cOI4hTXOSc0pzvu/OBVlxRjPXD4lrf+P1x6qIGFEAI1o
 YcPQ==
X-Gm-Message-State: AOAM531A+y7ycgIvUH4Bc+k4W+/S2y2RDdfnITCBPWXl2gU6lKmd48Od
 kdU8M8E5+vMDPbx50hBZVRz7ig==
X-Google-Smtp-Source: ABdhPJw2zS2TUO/5aptmzskdXk1UWgVzoiPgGA5zMLhLjK+qVAokMWQWCdUB90xaCO3ELneTIMUnAg==
X-Received: by 2002:a7b:c770:: with SMTP id x16mr1742582wmk.78.1618387727586; 
 Wed, 14 Apr 2021 01:08:47 -0700 (PDT)
Received: from ?IPv6:2a01:e0a:90c:e290:49d:95f:49d5:fff7?
 ([2a01:e0a:90c:e290:49d:95f:49d5:fff7])
 by smtp.gmail.com with ESMTPSA id w4sm19560836wrp.58.2021.04.14.01.08.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 14 Apr 2021 01:08:47 -0700 (PDT)
Subject: Re: [PATCH v3 2/3] drm: bridge: add it66121 driver
To: Robert Foss <robert.foss@linaro.org>
References: <20210412154648.3719153-1-narmstrong@baylibre.com>
 <20210412154648.3719153-3-narmstrong@baylibre.com>
 <CAG3jFysFb+y6ymXsBQatuwtPEYRTBnWTku0EpmNyR2gR5a=Y2w@mail.gmail.com>
 <3266977b-9d19-c81d-6fd7-b6fa0714b1ef@baylibre.com>
 <CAG3jFysp+3__TfEyvKSf47q3nYsdRSbkb9LxX2pcJr356yAgKw@mail.gmail.com>
From: Neil Armstrong <narmstrong@baylibre.com>
Organization: Baylibre
Message-ID: <911c73a8-47e8-0bae-2bdd-9eb217b25094@baylibre.com>
Date: Wed, 14 Apr 2021 10:08:46 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <CAG3jFysp+3__TfEyvKSf47q3nYsdRSbkb9LxX2pcJr356yAgKw@mail.gmail.com>
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
Cc: Phong LE <ple@baylibre.com>, Jernej Skrabec <jernej.skrabec@siol.net>,
 Jonas Karlman <jonas@kwiboo.se>, linux-kernel <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, paul@crapouillou.net,
 Andrzej Hajda <a.hajda@samsung.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMTQvMDQvMjAyMSAxMDowNiwgUm9iZXJ0IEZvc3Mgd3JvdGU6Cj4gT24gV2VkLCAxNCBBcHIg
MjAyMSBhdCAwODoxMywgTmVpbCBBcm1zdHJvbmcgPG5hcm1zdHJvbmdAYmF5bGlicmUuY29tPiB3
cm90ZToKPj4KPj4gSGkgUm9iLAo+Pgo+PiBMZSAxMy8wNC8yMDIxIMOgIDIyOjIxLCBSb2JlcnQg
Rm9zcyBhIMOpY3JpdCA6Cj4+PiBIZXkgTmVpbCAmIFBob25nLAo+Pj4KPj4+IFRoYW5rcyBmb3Ig
c3VibWl0dGluZyB0aGlzIHNlcmllcyEKPj4+Cj4+Pj4gKwo+Pj4+ICtzdGF0aWMgY29uc3Qgc3Ry
dWN0IGRybV9icmlkZ2VfZnVuY3MgaXQ2NjEyMV9icmlkZ2VfZnVuY3MgPSB7Cj4+Pj4gKyAgICAg
ICAuYXR0YWNoID0gaXQ2NjEyMV9icmlkZ2VfYXR0YWNoLAo+Pj4+ICsgICAgICAgLmVuYWJsZSA9
IGl0NjYxMjFfYnJpZGdlX2VuYWJsZSwKPj4+PiArICAgICAgIC5kaXNhYmxlID0gaXQ2NjEyMV9i
cmlkZ2VfZGlzYWJsZSwKPj4+PiArICAgICAgIC5tb2RlX3NldCA9IGl0NjYxMjFfYnJpZGdlX21v
ZGVfc2V0LAo+Pj4+ICsgICAgICAgLm1vZGVfdmFsaWQgPSBpdDY2MTIxX2JyaWRnZV9tb2RlX3Zh
bGlkLAo+Pj4+ICsgICAgICAgLmRldGVjdCA9IGl0NjYxMjFfYnJpZGdlX2RldGVjdCwKPj4+PiAr
ICAgICAgIC5nZXRfZWRpZCA9IGl0NjYxMjFfYnJpZGdlX2dldF9lZGlkLAo+Pj4+ICsgICAgICAg
LmF0b21pY19nZXRfb3V0cHV0X2J1c19mbXRzID0gaXQ2NjEyMV9icmlkZ2VfYXRvbWljX2dldF9v
dXRwdXRfYnVzX2ZtdHMsCj4+Pj4gKyAgICAgICAuYXRvbWljX2dldF9pbnB1dF9idXNfZm10cyA9
IGl0NjYxMjFfYnJpZGdlX2F0b21pY19nZXRfaW5wdXRfYnVzX2ZtdHMsCj4+Pj4gK307Cj4+Pgo+
Pj4gSSB3b3VsZCBsaWtlIHRvIHNlZSBhbiBpbXBsZW1lbnRhdGlvbiBvZiBIUEQsIHNpbmNlIGl0
IGlzIHN1cHBvcnRlZCBieQo+Pj4gdGhlIGhhcmR3YXJlWzFdIChhbmQgcmVxdWlyZWQgYnkgdGhl
IGRvY3VtZW50YXRpb24pLiBJUlEgc3RhdHVzIGJpdCAwCj4+PiBzZWVtcyB0byBiZSB0aGUgcmVz
cG9uc2libGUgZm9yIG5vdGlmeWluZyB1cyBhYm91dCBob3QgcGx1ZyBkZXRlY3Rpb24KPj4+IGV2
ZW50cy4KPj4KPj4gSXQncyBpbXBsZW1lbnRlZCBpbiB0aGUgSVJRIGhhbmRsZXIgd2l0aCB0aGUg
SVQ2NjEyMV9JTlRfU1RBVFVTMV9IUERfU1RBVFVTIGV2ZW50Lgo+Pgo+IAo+IEkgZGlkbid0IGV2
ZW4gZ2V0IHRoYXQgZmFyIDopCj4gCj4gRWl0aGVyIHdheSwgdGhlIEhQRCBzdXBwb3J0IHNob3Vs
ZCBiZSBleHBvc2VkIGluIGRybV9icmlkZ2VfZnVuY3MKPiAoLmhwZF9lbmFibGUsIC5ocGRfZGlz
YWJsZSAoYW5kIHBvc3NpYmx5IC5ocGRfbm90aWZ5KSkgYW5kCj4gZHJtX2JyaWRnZS5vcHMgKERS
TV9CUklER0VfT1BfSFBEKS4KPiAKCkluZGVlZCBJIGZvcmdvdCB0aGVzZSBjYWxscyBpbiB0aGUg
Tk9fQ09OTkVDVE9SIGltcGxlbWVudGF0aW9uLi4uCgpOZWlsCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRl
dmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
