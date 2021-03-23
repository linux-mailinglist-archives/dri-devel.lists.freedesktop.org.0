Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A3BDE346670
	for <lists+dri-devel@lfdr.de>; Tue, 23 Mar 2021 18:32:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9DCAB6E90D;
	Tue, 23 Mar 2021 17:32:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com
 [IPv6:2a00:1450:4864:20::136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F10826E90D
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Mar 2021 17:32:53 +0000 (UTC)
Received: by mail-lf1-x136.google.com with SMTP id o10so27852209lfb.9
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Mar 2021 10:32:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=fQt6xCmMqTbZa/RTqpTUck38Lk7jAmjj8bDIroCl9cY=;
 b=iKDKEABbhNUa0T1Pv7XQXNOm5HZy9Pwyhj5F3vHzHGTzl75hhZL8Df/7H1qyg3jaeB
 6LxKIXxa4+CKk4uVIObaNimrGISoiG8KAWOMmmoWROirht+FHkRbpmOs4mGn1GV4h5t2
 4v6HW0dCzJfL6PFe1amo1oul7Z9q+s++KyaEmuoiXBzbZEmSKk6mHlLzXqDDEj65p2Ae
 sZIshdo5hj+B6kV30U1e0JO2MYFQrdda0jiuZvnAuX45jA5GTBYu12K7t3CbxCh8w7pR
 UzxyCqRtrwo4EIJJP2Lg/zU9sc3PpHWBmTEQwlxajt4KZ5uhP3Bt0Ypxme+C4HEJmE7+
 yf5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=fQt6xCmMqTbZa/RTqpTUck38Lk7jAmjj8bDIroCl9cY=;
 b=ROD3zwgZWrHVUcRXMlrfgu40TWmF6RgBuOsnEINhWnflFgfF7jkHv9vOFHAvW1KFjp
 rgMeGPGXEoCAOUN/ZEx9xs9HEEr/2IKvofSefbl6rq+/YaUWdpjIvIKNd/ygcJd/vo9l
 +L4FFHlOCA/CIPuf7/QP4MGUYytRnsGRuz6CgIvZc+fS2xzNWI671YDihFqmkt4SYL7w
 bMfjqOkp87krlcpn0FfMpitPvEPM43gqdbJQ2EVfL/UJg3WzLP6agOZBec5P80kh8wh4
 Xi0PFGizOzDIH3tVvTl+2EPSxV8S1s83huabkSyn3vZIqHhFPKyOJy5CTiACEVcC1LqW
 x3kg==
X-Gm-Message-State: AOAM532IoOmtN+gnEF5qucC87w8gaGCZY9T5ZR8jfIZMqrpsyJ91M7A6
 OZ9LTOY98y25e3LbFikw7n5pIQX8pGU=
X-Google-Smtp-Source: ABdhPJwH6K3S4OE4JZag5tWk0lBSLFj34jgsxu40rASVwxlzsESceA1Rbwo6zW8Vb+GfbzbbZn9DQQ==
X-Received: by 2002:a19:ee13:: with SMTP id g19mr3168533lfb.657.1616520771923; 
 Tue, 23 Mar 2021 10:32:51 -0700 (PDT)
Received: from [192.168.2.145] (109-252-193-60.dynamic.spd-mgts.ru.
 [109.252.193.60])
 by smtp.googlemail.com with ESMTPSA id f23sm1914441lfc.283.2021.03.23.10.32.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 23 Mar 2021 10:32:51 -0700 (PDT)
Subject: Re: [PATCH v5 15/21] drm/tegra: Add new UAPI to header
To: Thierry Reding <thierry.reding@gmail.com>
References: <20210111130019.3515669-1-mperttunen@nvidia.com>
 <20210111130019.3515669-16-mperttunen@nvidia.com>
 <a0fdac0d-88cf-6eda-6611-fca951253060@gmail.com>
 <cc746d91-e6b2-53d8-17ff-59cbc8bb522f@kapsi.fi>
 <a51f7552-cec6-efe1-25dd-76422ef7a3e4@gmail.com>
 <d76c465a-7f07-88c4-0dc3-4be3cb212fcf@kapsi.fi>
 <YFnfYsfYaKfSGhon@orome.fritz.box>
 <0cc2ec5c-f8aa-ed45-92b6-32f9eadbdc5a@gmail.com>
 <YFoa57HBFpDu119Y@orome.fritz.box>
From: Dmitry Osipenko <digetx@gmail.com>
Message-ID: <c0c21556-1f98-4137-b9a0-568ef3a8c8ac@gmail.com>
Date: Tue, 23 Mar 2021 20:32:50 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <YFoa57HBFpDu119Y@orome.fritz.box>
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
Cc: Mikko Perttunen <cyndis@kapsi.fi>, airlied@linux.ie,
 dri-devel@lists.freedesktop.org, jonathanh@nvidia.com, talho@nvidia.com,
 bhuntsman@nvidia.com, linux-tegra@vger.kernel.org,
 Mikko Perttunen <mperttunen@nvidia.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

MjMuMDMuMjAyMSAxOTo0NCwgVGhpZXJyeSBSZWRpbmcg0L/QuNGI0LXRgjoKPiBPbiBUdWUsIE1h
ciAyMywgMjAyMSBhdCAwNTowMDozMFBNICswMzAwLCBEbWl0cnkgT3NpcGVua28gd3JvdGU6Cj4+
IDIzLjAzLjIwMjEgMTU6MzAsIFRoaWVycnkgUmVkaW5nINC/0LjRiNC10YI6Cj4+PiBPbiBUaHUs
IEphbiAxNCwgMjAyMSBhdCAxMjozNDoyMlBNICswMjAwLCBNaWtrbyBQZXJ0dHVuZW4gd3JvdGU6
Cj4+Pj4gT24gMS8xNC8yMSAxMDozNiBBTSwgRG1pdHJ5IE9zaXBlbmtvIHdyb3RlOgo+Pj4+PiAx
My4wMS4yMDIxIDIxOjU2LCBNaWtrbyBQZXJ0dHVuZW4g0L/QuNGI0LXRgjoKPj4+Pj4+IE9uIDEv
MTMvMjEgODoxNCBQTSwgRG1pdHJ5IE9zaXBlbmtvIHdyb3RlOgo+Pj4+Pj4+IDExLjAxLjIwMjEg
MTY6MDAsIE1pa2tvIFBlcnR0dW5lbiDQv9C40YjQtdGCOgo+Pj4+Pj4+PiArc3RydWN0IGRybV90
ZWdyYV9zdWJtaXRfYnVmIHsKPj4+Pj4+Pj4gK8KgwqDCoCAvKioKPj4+Pj4+Pj4gK8KgwqDCoMKg
ICogQG1hcHBpbmdfaWQ6IFtpbl0KPj4+Pj4+Pj4gK8KgwqDCoMKgICoKPj4+Pj4+Pj4gK8KgwqDC
oMKgICogSWRlbnRpZmllciBvZiB0aGUgbWFwcGluZyB0byB1c2UgaW4gdGhlIHN1Ym1pc3Npb24u
Cj4+Pj4+Pj4+ICvCoMKgwqDCoCAqLwo+Pj4+Pj4+PiArwqDCoMKgIF9fdTMyIG1hcHBpbmdfaWQ7
Cj4+Pj4+Pj4KPj4+Pj4+PiBJJ20gbm93IGluIHByb2Nlc3Mgb2YgdHJ5aW5nIG91dCB0aGUgVUFQ
SSB1c2luZyBncmF0ZSBkcml2ZXJzIGFuZCB0aGlzCj4+Pj4+Pj4gYmVjb21lcyB0aGUgZmlyc3Qg
b2JzdGFjbGUuCj4+Pj4+Pj4KPj4+Pj4+PiBMb29rcyBsaWtlIHRoaXMgaXMgbm90IGdvaW5nIHRv
IHdvcmsgd2VsbCBmb3Igb2xkZXIgVGVncmEgU29DcywgaW4KPj4+Pj4+PiBwYXJ0aWN1bGFyIGZv
ciBUMjAsIHdoaWNoIGhhcyBhIHNtYWxsIEdBUlQuCj4+Pj4+Pj4KPj4+Pj4+PiBHaXZlbiB0aGF0
IHRoZSB1c2VmdWxuZXNzIG9mIHRoZSBwYXJ0aWFsIG1hcHBpbmcgZmVhdHVyZSBpcyB2ZXJ5Cj4+
Pj4+Pj4gcXVlc3Rpb25hYmxlIHVudGlsIGl0IHdpbGwgYmUgcHJvdmVuIHdpdGggYSByZWFsIHVz
ZXJzcGFjZSwgd2Ugc2hvdWxkCj4+Pj4+Pj4gc3RhcnQgd2l0aCBhIGR5bmFtaWMgbWFwcGluZ3Mg
dGhhdCBhcmUgZG9uZSBhdCBhIHRpbWUgb2Ygam9iIHN1Ym1pc3Npb24uCj4+Pj4+Pj4KPj4+Pj4+
PiBEUk0gYWxyZWFkeSBzaG91bGQgaGF2ZSBldmVyeXRoaW5nIG5lY2Vzc2FyeSBmb3IgY3JlYXRp
bmcgYW5kIG1hbmFnaW5nCj4+Pj4+Pj4gY2FjaGVzIG9mIG1hcHBpbmdzLCBncmF0ZSBrZXJuZWwg
ZHJpdmVyIGhhcyBiZWVuIHVzaW5nIGRybV9tbV9zY2FuIGZvciBhCj4+Pj4+Pj4gbG9uZyB0aW1l
IG5vdyBmb3IgdGhhdC4KPj4+Pj4+Pgo+Pj4+Pj4+IEl0IHNob3VsZCBiZSBmaW5lIHRvIHN1cHBv
cnQgdGhlIHN0YXRpYyBtYXBwaW5nIGZlYXR1cmUsIGJ1dCBpdCBzaG91bGQKPj4+Pj4+PiBiZSBk
b25lIHNlcGFyYXRlbHkgd2l0aCB0aGUgZHJtX21tIGludGVncmF0aW9uLCBJTU8uCj4+Pj4+Pj4K
Pj4+Pj4+PiBXaGF0IGRvIHRoaW5rPwo+Pj4+Pj4+Cj4+Pj4+Pgo+Pj4+Pj4gQ2FuIHlvdSBlbGFi
b3JhdGUgb24gdGhlIHJlcXVpcmVtZW50cyB0byBiZSBhYmxlIHRvIHVzZSBHQVJUPyBBcmUgdGhl
cmUKPj4+Pj4+IGFueSBvdGhlciByZWFzb25zIHRoaXMgd291bGQgbm90IHdvcmsgb24gb2xkZXIg
Y2hpcHM/Cj4+Pj4+Cj4+Pj4+IFdlIGhhdmUgYWxsIERSTSBkZXZpY2VzIGluIGEgc2luZ2xlIGFk
ZHJlc3Mgc3BhY2Ugb24gVDMwKywgaGVuY2UgaGF2aW5nCj4+Pj4+IGR1cGxpY2F0ZWQgbWFwcGlu
Z3MgZm9yIGVhY2ggZGV2aWNlIHNob3VsZCBiZSBhIGJpdCB3YXN0ZWZ1bC4KPj4+Pgo+Pj4+IEkg
Z3Vlc3MgdGhpcyBzaG91bGQgYmUgcHJldHR5IGVhc3kgdG8gY2hhbmdlIHRvIG9ubHkga2VlcCBv
bmUgbWFwcGluZyBwZXIKPj4+PiBHRU0gb2JqZWN0Lgo+Pj4KPj4+IFRoZSBpbXBvcnRhbnQgcG9p
bnQgaGVyZSBpcyB0aGUgc2VtYW50aWNzOiB0aGlzIElPQ1RMIGVzdGFibGlzaGVzIGEKPj4+IG1h
cHBpbmcgZm9yIGEgZ2l2ZW4gR0VNIG9iamVjdCBvbiBhIGdpdmVuIGNoYW5uZWwuIElmIHRoZSB1
bmRlcmx5aW5nCj4+PiBpbXBsZW1lbnRhdGlvbiBpcyBzdWNoIHRoYXQgdGhlIG1hcHBpbmcgZG9l
c24ndCBmaXQgaW50byB0aGUgR0FSVCwgdGhlbgo+Pj4gdGhhdCdzIGFuIGltcGxlbWVudGF0aW9u
IGRldGFpbCB0aGF0IHRoZSBkcml2ZXIgbmVlZHMgdG8gdGFrZSBjYXJlIG9mLgo+Pj4gU2ltaWxh
cmx5LCBpZiBtdWx0aXBsZSBkZXZpY2VzIHNoYXJlIGEgc2luZ2xlIGFkZHJlc3Mgc3BhY2UsIHRo
YXQncwo+Pj4gc29tZXRoaW5nIHRoZSBkcml2ZXIgYWxyZWFkeSBrbm93cyBhbmQgY2FuIHRha2Ug
YWR2YW50YWdlIG9mIGJ5IHNpbXBseQo+Pj4gcmV1c2luZyBhbiBleGlzdGluZyBtYXBwaW5nIGlm
IG9uZSBhbHJlYWR5IGV4aXN0cy4gSW4gYm90aCBjYXNlcyB0aGUKPj4+IHNlbWFudGljcyB3b3Vs
ZCBiZSBjb3JyZWN0bHkgaW1wbGVtZW50ZWQgYW5kIHRoYXQncyByZWFsbHkgYWxsIHRoYXQKPj4+
IG1hdHRlcnMuCj4+Pgo+Pj4gT3ZlcmFsbCB0aGlzIGludGVyZmFjZSBzZWVtcyBzb3VuZCBmcm9t
IGEgaGlnaC1sZXZlbCBwb2ludCBvZiB2aWV3IGFuZAo+Pj4gYWxsb3dzIHRoZXNlIG1hcHBpbmdz
IHRvIGJlIHByb3Blcmx5IGNyZWF0ZWQgZXZlbiBmb3IgdGhlIGNhc2VzIHdlIGhhdmUKPj4+IHdo
ZXJlIGVhY2ggY2hhbm5lbCBtYXkgaGF2ZSBhIHNlcGFyYXRlIGFkZHJlc3Mgc3BhY2UuIEl0IG1h
eSBub3QgYmUgdGhlCj4+PiBvcHRpbWFsIGludGVyZmFjZSBmb3IgYWxsIHVzZS1jYXNlcyBvciBh
bnkgb25lIGluZGl2aWR1YWwgY2FzZSwgYnV0IHRoZQo+Pj4gdmVyeSBuYXR1cmUgb2YgdGhlc2Ug
aW50ZXJmYWNlcyBpcyB0byBhYnN0cmFjdCBhd2F5IGNlcnRhaW4gZGlmZmVyZW5jZXMKPj4+IGlu
IG9yZGVyIHRvIHByb3ZpZGUgYSB1bmlmaWVkIGludGVyZmFjZSB0byBhIGNvbW1vbiBwcm9ncmFt
bWluZyBtb2RlbC4KPj4+IFNvIHRoZXJlIHdpbGwgYWx3YXlzIGJlIGNlcnRhaW4gdHJhZGVvZmZz
Lgo+Pgo+PiBGb3Igbm93IHRoaXMgSU9DVEwgaXNuJ3QgdXNlZnVsIGZyb20gYSB1c2Vyc3BhY2Ug
cGVyc3BlY3RpdmUgb2Ygb2xkZXIKPj4gU29DcyBhbmQgSSdsbCBuZWVkIHRvIGFkZCBhIGxvdCBv
ZiBjb2RlIHRoYXQgd29uJ3QgZG8gYW55dGhpbmcgdXNlZnVsCj4+IGp1c3QgdG8gY29uZm9ybSB0
byB0aGUgc3BlY2lmaWMgbmVlZHMgb2YgdGhlIG5ld2VyIFNvQ3MuIFRyeWluZyB0byB1bmlmeQo+
PiBldmVyeXRoaW5nIGludG8gYSBzaW5nbGUgQVBJIGRvZXNuJ3Qgc291bmQgbGlrZSBhIGdvb2Qg
aWRlYSBhdCB0aGlzCj4+IHBvaW50IGFuZCBJIGFscmVhZHkgc3VnZ2VzdGVkIHRvIE1pa2tvIHRv
IHRyeSBvdXQgdmFyaWFudCB3aXRoIGEKPj4gc2VwYXJhdGVkIHBlci1Tb0MgY29kZSBwYXRocyBp
biB0aGUgbmV4dCB2ZXJzaW9uLCB0aGVuIHRoZSBtYXBwaW5ncwo+PiBjb3VsZCBiZSBoYW5kbGVk
IHNlcGFyYXRlbHkgYnkgdGhlIFQxODYrIHBhdGhzLgo+IAo+IEknbSBub3Qgc3VyZSBJIHVuZGVy
c3RhbmQgd2hhdCB5b3UncmUgc2F5aW5nLiBPYnZpb3VzbHkgdGhlIHVuZGVybHlpbmcKPiBpbXBs
ZW1lbnRhdGlvbiBvZiB0aGlzIG1pZ2h0IGhhdmUgdG8gZGlmZmVyIGRlcGVuZGluZyBvbiBTb0Mg
Z2VuZXJhdGlvbi4KPiBCdXQgaXQgc291bmRzIGxpa2UgeW91J3JlIHN1Z2dlc3RpbmcgaGF2aW5n
IGRpZmZlcmVudCBVQVBJcyBkZXBlbmRpbmcgb24KPiBTb0MgZ2VuZXJhdGlvbi4KCkkgc3VnZ2Vz
dGVkIHRoYXQgdGhpcyBJT0NUTCBzaG91bGRuJ3QgYmUgbWFuZGF0b3J5IGZvciBvbGRlciBTb0Nz
LCB3aGljaAp3ZSBzaG91bGQgdG8gaGF2ZSBhbnl3YXlzIGZvciBwcmVzZXJ2aW5nIHRoZSBvbGRl
ciBVQVBJLiBZZXMsIHRoaXMgbWFrZXMKVUFQSSBkaWZmZXJlbnQgYW5kIEkgd2FudCB0byBzZWUg
aG93IGl0IHdpbGwgbG9vayBsaWtlIGluIHRoZSBuZXh0CnZlcnNpb24gc2luY2UgdGhlIGN1cnJl
bnQgdmFyaWFudCB3YXMgc3ViLW9wdGltYWwuCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3Rz
LmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2RyaS1kZXZlbAo=
