Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E7E4F209BC4
	for <lists+dri-devel@lfdr.de>; Thu, 25 Jun 2020 11:16:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 444A96E89E;
	Thu, 25 Jun 2020 09:16:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kapsi.fi (mail.kapsi.fi [IPv6:2001:67c:1be8::25])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 863CA6E89E
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Jun 2020 09:16:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=kapsi.fi;
 s=20161220; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=lDMMRXp6YNp6jZH+XEbgsI8Id4QUoHWsZlMjtrGN3Vg=; b=yk2rXj4OyZsZTh6iae+cMxeXLo
 QS+YJ54uxprQtTAkoGspUuYesdDjF/lJ/83y1R2tAPo2RlxclgC1lW3wnh8XWl0urgTleeyGKC2E2
 FqrlykxgRB/EEiAV0ZnpssnC6qG11bq1WVYoO6AFnSQoKZNHEIM6lYJOQfyr9M+HlCQtcGCnO3VWP
 6aE1wcK5jOqxjbc/ZZ8X5wTb6ebmLjdq5mLXX5wqNn/B5vJGON0/g1CdO1EwolRi0R3lwLq87aQ0c
 Amni3ihJ5AerTjz/FiD7BWz1HmAE+zCUYhTbAn0bkql1IZpqaD+q49PTQSPYwCUFan78+SvtvX/iT
 uqP09R+Q==;
Received: from dsl-hkibng22-54faab-65.dhcp.inet.fi ([84.250.171.65]
 helo=[192.168.1.10])
 by mail.kapsi.fi with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.89) (envelope-from <cyndis@kapsi.fi>)
 id 1joNzP-0000HN-It; Thu, 25 Jun 2020 12:16:11 +0300
Subject: Re: [RFC] Host1x/TegraDRM UAPI
To: Dmitry Osipenko <digetx@gmail.com>,
 Thierry Reding <thierry.reding@gmail.com>, Jon Hunter
 <jonathanh@nvidia.com>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, sumit.semwal@linaro.org, gustavo@padovan.org
References: <9b06b7ec-f952-2561-7afb-5653514cd5d3@kapsi.fi>
 <c6642ebd-c9f1-eab0-ff6d-109698af73e0@gmail.com>
From: Mikko Perttunen <cyndis@kapsi.fi>
Message-ID: <5c0aa939-d722-5034-6328-4df5be8ee3c6@kapsi.fi>
Date: Thu, 25 Jun 2020 12:16:10 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <c6642ebd-c9f1-eab0-ff6d-109698af73e0@gmail.com>
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

T24gNi8yNS8yMCAyOjExIEFNLCBEbWl0cnkgT3NpcGVua28gd3JvdGU6Cj4gMjMuMDYuMjAyMCAx
NTowOSwgTWlra28gUGVydHR1bmVuINC/0LjRiNC10YI6Cj4+IC8qIENvbW1hbmQgaXMgYW4gb3Bj
b2RlIGdhdGhlciBmcm9tIGEgR0VNIGhhbmRsZSAqLwo+PiAjZGVmaW5lIERSTV9URUdSQV9TVUJN
SVRfQ09NTUFORF9HQVRIRVLCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgMAo+PiAvKiBDb21tYW5k
IGlzIGFuIG9wY29kZSBnYXRoZXIgZnJvbSBhIHVzZXIgcG9pbnRlciAqLwo+PiAjZGVmaW5lIERS
TV9URUdSQV9TVUJNSVRfQ09NTUFORF9HQVRIRVJfVVBUUsKgwqDCoMKgwqDCoMKgIDEKPiAKPiBJ
J20gYSBiaXQgZHViaW91cyBhYm91dCB3aGV0aGVyIHdlIHJlYWxseSBuZWVkIHRvIHJldGFpbiB0
aGUgbm9uLVVQVFIKPiB2YXJpYW50LiBUaGUgbWVtb3J5LWNvcHlpbmcgb3ZlcmhlYWQgaXMgbmVn
bGlnaWJsZSBiZWNhdXNlIGNtZHN0cmVhbSdzCj4gZGF0YSB1c3VhbGx5IGlzIGhvdCBpbiBDUFUn
cyBjYWNoZQo+IAo+IElJUkMsIHRoZSBtb3N0IChpZiBub3QgYWxsKSBvZiB0aGUgbW9kZXJuIERS
TSBkcml2ZXJzIGRyaXZlcnMgdXNlIHRoZQo+IHVzcnB0ci1vbmx5IGZvciB0aGUgY21kc3RyZWFt
Lgo+IAo+IEF0IGxlYXN0IHRoZXJlIGlzIG5vIGFueSByZWFsLXdvcmxkIHVzZXJzcGFjZSBleGFt
cGxlIHRvZGF5IHRoYXQgY291bGQKPiBiZW5lZml0IGZyb20gYSBub24tVVBUUiB2YXJpYW50Lgo+
IAo+IEknbSBzdWdnZXN0aW5nIHRvIGxlYXZlIG91dCB0aGUgbm9uLVVQVFIgZ2F0aGVyIHZhcmlh
bnQgZm9yIG5vdywga2VlcGluZwo+IGl0IGluIG1pbmQgYXMgYSBwb3RlbnRpYWwgZnV0dXJlIGV4
dGVuc2lvbiBvZiB0aGUgc3VibWlzc2lvbiBVQVBJLiBBbnkKPiBvYmplY3Rpb25zPwo+IAoKU3Vy
ZSwgd2Ugc2hvdWxkIGJlIGFibGUgdG8gZHJvcCBpdC4gRG93bnN0cmVhbSB1c2Vyc3BhY2UgaXMg
dXNpbmcgaXQsIApidXQgd2Ugc2hvdWxkIGJlIGFibGUgdG8gZml4IHRoYXQuIEkgd2FzIHRoaW5r
aW5nIHRoYXQgd2UgY2FuIGRpcmVjdGx5IAptYXAgdGhlIHVzZXIgcGFnZXMgYW5kIHBvaW50IHRo
ZSBnYXRoZXIgdG8gdGhlbSB3aXRob3V0IGNvcHlpbmcgLSB0aGF0IAp3YXkgd2Ugd291bGRuJ3Qg
bmVlZCB0byBtYWtlIERNQSBhbGxvY2F0aW9ucyBpbnNpZGUgdGhlIGRyaXZlciBmb3IgZXZlcnkg
CnN1Ym1pdC4gKE9uIGVhcmx5IFRlZ3JhcyB3ZSBjb3VsZCBqdXN0IGNvcHkgaW50byB0aGUgcHVz
aGJ1ZmZlciBidXQgdGhhdCAKd29uJ3Qgd29yayBmb3IgbmV3ZXIgb25lcykuCgpNaWtrbwpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFp
bGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
