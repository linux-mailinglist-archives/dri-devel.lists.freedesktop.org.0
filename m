Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 69A00209BD4
	for <lists+dri-devel@lfdr.de>; Thu, 25 Jun 2020 11:23:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B509789CF4;
	Thu, 25 Jun 2020 09:23:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kapsi.fi (mail.kapsi.fi [IPv6:2001:67c:1be8::25])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ED1F089CF4
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Jun 2020 09:23:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=kapsi.fi;
 s=20161220; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=nPwZbg/W8hi1/Z36vPO9FW4pNGo6LVTFLK2wHXSfEEM=; b=OHrz23bhyr754Vc/VOq1V0UFMi
 srBUrtfjSMEtnr6TFhgEsa0d7GoD9Hmyk3E/0rvQarh7chhHGbcMYpeoYXIX+l4Fh/NFmzAH946P9
 ZRl44+aoxd0qhUlHqUrhslPHgWHvt05aq/3Ms0alQEu8iIy8j+vOSrG7hKsXkmjEwa5WglKDiagPX
 kYTD3gd5JrXtvE/xBUkbnl+ZSTjrITas7LG/OEhvqMJfYR7PDr1bRwtVSDtyIOZN0syjPRpg+Vmq3
 ZZ0SSrVIGok93IFmyKb7/5lW8wQ3tWyIst9b/0MaeRfkQLq4pTTOgdNMUhAPL2lP3AA7CfrZUMIFG
 nARzoqIA==;
Received: from dsl-hkibng22-54faab-65.dhcp.inet.fi ([84.250.171.65]
 helo=[192.168.1.10])
 by mail.kapsi.fi with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.89) (envelope-from <cyndis@kapsi.fi>)
 id 1joO6I-00036p-II; Thu, 25 Jun 2020 12:23:18 +0300
Subject: Re: [RFC] Host1x/TegraDRM UAPI
To: Dmitry Osipenko <digetx@gmail.com>,
 Thierry Reding <thierry.reding@gmail.com>, Jon Hunter
 <jonathanh@nvidia.com>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, sumit.semwal@linaro.org, gustavo@padovan.org
References: <9b06b7ec-f952-2561-7afb-5653514cd5d3@kapsi.fi>
 <10f9a8e5-9972-76bc-f60a-1bf1211e55e1@gmail.com>
From: Mikko Perttunen <cyndis@kapsi.fi>
Message-ID: <d635556c-6fdf-44a4-664b-e7d8449cd27a@kapsi.fi>
Date: Thu, 25 Jun 2020 12:23:17 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <10f9a8e5-9972-76bc-f60a-1bf1211e55e1@gmail.com>
Content-Language: en-US
X-SA-Exim-Connect-IP: 84.250.171.65
X-SA-Exim-Mail-From: cyndis@kapsi.fi
X-SA-Exim-Scanned: No (on mail.kapsi.fi); SAEximRunCond expanded to false
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
Cc: "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>,
 talho@nvidia.com, bhuntsman@nvidia.com,
 dri-devel <dri-devel@lists.freedesktop.org>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gNi8yNS8yMCAzOjQ3IEFNLCBEbWl0cnkgT3NpcGVua28gd3JvdGU6Cj4gMjMuMDYuMjAyMCAx
NTowOSwgTWlra28gUGVydHR1bmVuINC/0LjRiNC10YI6Cj4+ICNkZWZpbmUgRFJNX1RFR1JBX1NV
Qk1JVF9DUkVBVEVfUE9TVF9TWU5DX0ZJTEXCoMKgwqDCoMKgICgxPDwwKQo+PiAjZGVmaW5lIERS
TV9URUdSQV9TVUJNSVRfQ1JFQVRFX1BPU1RfU1lOQ09CSsKgwqDCoMKgwqDCoMKgICgxPDwxKQo+
IAo+IFRoZSBzeW5jIG9iamVjdCBzaG91bGRuJ3QgYmUgY3JlYXRlZCBieSB0aGUga2VybmVsIGRy
aXZlciBhbmQgd2UKPiBzaG91bGRuJ3QgbmVlZCB0aGUgc3luYy1maWxlIEZELgo+IAo+IFBsZWFz
ZSBjb25zaWRlciB0aGlzIGV4YW1wbGUgb2YgaG93IHN5bmNvYmogbWF5IGJlIHVzZWQ6Cj4gCj4g
ICAgMS4gU3luY29iaiBpcyBjcmVhdGVkIGJ5IHVzZXJzcGFjZS4KPiAKPiAgICAyLiBTeW5jb2Jq
J3MgaGFuZGxlIChwb3N0X2ZlbmNlKSBpcyBwYXNzZWQgd2l0aCB0aGUgam9iIHRvIHRoZSBrZXJu
ZWwKPiBkcml2ZXIuCj4gCj4gICAgMy4gVXNlcnNwYWNlIHdhaXRzIG9uIHN5bmNvYmogZm9yIHRo
ZSBqb2IncyBzdWJtaXNzaW9uLgo+IAo+ICAgIDQuIEtlcm5lbCBkcml2ZXIgYXR0YWNoZXMgam9i
LWNvbXBsZXRpb24gZG1hLWZlbmNlKHMpIHRvIHRoZSBzeW5jb2JqCj4gYWZ0ZXIgc3RhcnRpbmcg
dG8gZXhlY3V0ZSB0aGUgam9iLgo+IAo+ICAgIDUuIFVzZXJzcGFjZSB3YWl0cyBvbiBzeW5jb2Jq
IGZvciB0aGUgam9iJ3MgY29tcGxldGlvbi4KPiAKPiBTeW5jb2JqIGlzIGEgc3VwZXJzZXQgb2Yg
dGhlIHN5bmMtZmlsZSBmZW5jZToKPiAKPiAgICBhKSBTeW5jb2JqIGRvZXNuJ3QgaGF2ZSBhIGJh
Y2tpbmcgZmlsZSBkZXNjcmlwdG9yIHdoZW4gaXQncyBjcmVhdGVkLgo+IEZvciBleGFtcGxlLCB3
aHkgd291bGQgeW91IG5lZWQgYW4gRkQgaWYgeW91J3JlIG5vdCBnb2luZyB0byBzaGFyZSBmZW5j
ZQo+IHdpdGggb3RoZXIgcHJvY2Vzc2VzLiBJdCdzIHBvc3NpYmxlIHRvIGdldCBGRCBvdXQgb2Yg
c3luY29iaiBsYXRlciBvbiwKPiBwbGVhc2Ugc2VlIFsxXVsyXS4KPiAKPiAgICBiKSBTeW5jb2Jq
IGlzIGRlc2lnbmVkIHRvIGJlIHVzZWQgd2l0aCBhIEdQVSBqb2JzLiBGb3IgZXhhbXBsZSwKPiB1
c2Vyc3BhY2UgcGFzc2VzIGpvYiB0byB0aGUgR1BVIGRyaXZlcidzIHNjaGVkdWxlciBhbmQgdGhl
biB3YWl0cyB1bnRpbAo+IGpvYiBoYXMgYmVlbiBzdGFydGVkIHRvIGV4ZWN1dGUgb24gaGFyZHdh
cmUsIHRoaXMgaXMgYWxyZWFkeSBzdXBwb3J0ZWQKPiBieSBzeW5jb2JqLgo+IAo+ICAgIGMpIEl0
IGlzIHBvc3NpYmxlIHRvIGF0dGFjaCBzeW5jLWZpbGUncyBmZW5jZSB0byBhIHN5bmNvYmogWzFd
WzJdWzNdCj4gYW5kIG5vdzoKPiAKPiAgICAtIFVzZXJzcGFjZSBtYXkgYXR0YWNoIHN5bmMtZmls
ZSdzIGZlbmNlIHRvIGEgc3luY29iai4KPiAKPiAgICAtIFVzZXJzcGFjZSBtYXkgdXNlIHRoaXMg
c3luY29iaiBmb3IgdGhlIGpvYidzIHByZS1mZW5jZS4KPiAKPiAgICAtIEtlcm5lbCBkcml2ZXIg
d2lsbCB0YWtlIG91dCB0aGUgcHJlLWZlbmNlIGZyb20gdGhlIHN5bmNvYmogZHVyaW5nIG9mCj4g
dGhlIGpvYidzIHN1Ym1pc3Npb24gYW5kIHJlc2V0IHRoZSBzeW5jb2JqJ3MgZmVuY2UgdG8gTlVM
TC4KPiAKPiAgICAtIEpvYidzIHNjaGVkdWxlciB3aWxsIHdhaXQgb24gdGhpcyBwcmUtZmVuY2Ug
YmVmb3JlIHN0YXJ0aW5nIHRvCj4gZXhlY3V0ZSBqb2IuCj4gCj4gICAgLSBPbmNlIHRoZSBqb2Ig
aXMgc3RhcnRlZCB0byBleGVjdXRlLCB0aGUgam9iJ3Mgc2NoZWR1bGVyIHdpbGwgYXR0YWNoCj4g
dGhlIGpvYidzIGNvbXBsZXRpb24tZmVuY2UgdG8gdGhlIHN5bmNvYmouIE5vdyBzeW5jb2JqIGhh
cyBhIHBvc3QtZmVuY2UhCj4gCj4gICAgZCkgSXQgaXMgcG9zc2libGUgdG8gZ2V0IHN5bmMtZmls
ZSBGRCBvdXQgb2Ygc3luY29iaiBbMV1bMl1bNF0uCj4gCj4gWzFdCj4gaHR0cHM6Ly9lbGl4aXIu
Ym9vdGxpbi5jb20vbGludXgvdjUuNy4yL3NvdXJjZS9pbmNsdWRlL3VhcGkvZHJtL2RybS5oI0w3
MzAKPiBbMl0KPiBodHRwczovL2VsaXhpci5ib290bGluLmNvbS9saW51eC92NS43LjIvc291cmNl
L2luY2x1ZGUvdWFwaS9kcm0vZHJtLmgjTDkzMwo+IFszXQo+IGh0dHBzOi8vZWxpeGlyLmJvb3Rs
aW4uY29tL2xpbnV4L3Y1LjcuMi9zb3VyY2UvZHJpdmVycy9ncHUvZHJtL2RybV9zeW5jb2JqLmMj
TDY1Mwo+IFs0XQo+IGh0dHBzOi8vZWxpeGlyLmJvb3RsaW4uY29tL2xpbnV4L3Y1LjcuMi9zb3Vy
Y2UvZHJpdmVycy9ncHUvZHJtL2RybV9zeW5jb2JqLmMjTDY3NAo+IAo+ID09PQo+IAo+IFNvLCBz
eW5jIG9iamVjdCBjYW4gY2FycnkgYm90aCBwcmUtZmVuY2UgYW5kIHBvc3QtZmVuY2UsIGFuZCB0
aGV5IGNvdWxkCj4gYmUgc3luYy1maWxlIEZEcyEKPiAKPiBUaGUgY29yb2xsYXJ5IGlzIHRoYXQg
d2UgY2FuIGdldCBhd2F5IGJ5IHVzaW5nIGEgc2luZ2xlIHN5bmNvYmogaGFuZGxlCj4gZm9yIHRo
ZSBqb2IncyBzdWJtaXNzaW9uIElPQ1RMLgo+IAoKQWgsIGNsZWFybHkgSSBoYWRuJ3QgdW5kZXJz
dG9vZCBzeW5jb2JqcyBwcm9wZXJseSA6KSBMYXN0IHRpbWUgSSBzcGVudCAKc2lnbmlmaWNhbnQg
dGltZSB3aXRoIHRoaXMgdGhleSBkaWRuJ3QgZXhpc3QgeWV0Li4gSSdsbCBjaGVjayB0aGlzIG91
dC4KCk1pa2tvCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpo
dHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
