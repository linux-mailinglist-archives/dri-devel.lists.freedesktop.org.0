Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 96D44262A12
	for <lists+dri-devel@lfdr.de>; Wed,  9 Sep 2020 10:20:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E75476EAAB;
	Wed,  9 Sep 2020 08:20:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kapsi.fi (mail.kapsi.fi [IPv6:2001:67c:1be8::25])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 949576EAAB
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Sep 2020 08:20:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=kapsi.fi;
 s=20161220; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=ty/OmNW1kqQFrBsxIIO001Crp8XTtE42WcOCYQvJ3xc=; b=YAAEtacXdcDYmk9HWzZHQBLesn
 mZgqfpXtZmT0e7bVuE+Fhe2COdJnDRmbhSu41lEzx4AKCJFhcM94cNAERnSDuPNNeBFOIFUYHSIfb
 g8NEEzD1kZn/OSEmDycfJS6e/QPWig7O8nOC3zLqpZ7vhhvwFGUYYsvVE2ApMuHLNmayzilkO6Amj
 v8uoVetyK/noJFsn9ECLLH3XcNZQszH3yzSufcLNzNZqMxccuXMwTYrsrGMuOuSVi6/G8xSYe/iSj
 +vZBhQ9VaTpBReF6Eo6orulphFW47r2+4qAqIO4MD5WPdSDNJTvTd5GEH1Gt/uGdT1XtuIhPL36EQ
 F3Zz09Eg==;
Received: from dsl-hkibng22-54faab-65.dhcp.inet.fi ([84.250.171.65]
 helo=[192.168.1.10])
 by mail.kapsi.fi with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.89) (envelope-from <cyndis@kapsi.fi>)
 id 1kFvKl-0007GW-33; Wed, 09 Sep 2020 11:20:03 +0300
Subject: Re: [RFC PATCH v2 17/17] WIP: drm/tegra: Implement new UAPI
To: Dmitry Osipenko <digetx@gmail.com>,
 Mikko Perttunen <mperttunen@nvidia.com>, thierry.reding@gmail.com,
 jonathanh@nvidia.com, airlied@linux.ie, daniel@ffwll.ch
References: <20200905103420.3021852-1-mperttunen@nvidia.com>
 <20200905103420.3021852-18-mperttunen@nvidia.com>
 <a238707e-942b-2996-5644-71811d4cee72@gmail.com>
From: Mikko Perttunen <cyndis@kapsi.fi>
Message-ID: <80bfc415-a7b1-829f-3ce0-c81111ed1f19@kapsi.fi>
Date: Wed, 9 Sep 2020 11:19:53 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <a238707e-942b-2996-5644-71811d4cee72@gmail.com>
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
Cc: linux-tegra@vger.kernel.org, talho@nvidia.com, bhuntsman@nvidia.com,
 dri-devel@lists.freedesktop.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gOS85LzIwIDM6NDcgQU0sIERtaXRyeSBPc2lwZW5rbyB3cm90ZToKPiAwNS4wOS4yMDIwIDEz
OjM0LCBNaWtrbyBQZXJ0dHVuZW4g0L/QuNGI0LXRgjoKPj4gK3N0YXRpYyBpbnQgc3VibWl0X3By
b2Nlc3NfYnVmcyhzdHJ1Y3QgZHJtX2RldmljZSAqZHJtLCBzdHJ1Y3QgZ2F0aGVyX2JvICpibywK
Pj4gKwkJCSAgICAgICBzdHJ1Y3QgdGVncmFfZHJtX2pvYl9kYXRhICpqb2JfZGF0YSwKPj4gKwkJ
CSAgICAgICBzdHJ1Y3QgdGVncmFfZHJtX2NoYW5uZWxfY3R4ICpjdHgsCj4+ICsJCQkgICAgICAg
c3RydWN0IGRybV90ZWdyYV9jaGFubmVsX3N1Ym1pdCAqYXJncywKPj4gKwkJCSAgICAgICBzdHJ1
Y3Qgd3dfYWNxdWlyZV9jdHggKmFjcXVpcmVfY3R4KQo+PiArewo+PiArCXN0cnVjdCBkcm1fdGVn
cmFfc3VibWl0X2J1ZiBfX3VzZXIgKnVzZXJfYnVmc19wdHIgPQo+PiArCQl1NjRfdG9fdXNlcl9w
dHIoYXJncy0+YnVmc19wdHIpOwo+IAo+IElmIGFzc2lnbm1lbnQgbWFrZXMgbGluZSB0b28gbG9u
ZywgdGhlbiBmYWN0b3IgaXQgb3V0Lgo+IAo+ICAgIHN0cnVjdCBkcm1fdGVncmFfc3VibWl0X2J1
ZiBfX3VzZXIgKnVzZXJfYnVmc19wdHI7Cj4gCj4gICAgdXNlcl9idWZzX3B0ciA9IHU2NF90b191
c2VyX3B0cihhcmdzLT5idWZzX3B0cik7Cj4gCj4+ICsJc3RydWN0IHRlZ3JhX2RybV9tYXBwaW5n
ICptYXBwaW5nOwo+PiArCXN0cnVjdCBkcm1fdGVncmFfc3VibWl0X2J1ZiBidWY7Cj4+ICsJdW5z
aWduZWQgbG9uZyBjb3B5X2VycjsKPj4gKwlpbnQgZXJyOwo+PiArCXUzMiBpOwo+PiArCj4+ICsJ
am9iX2RhdGEtPnVzZWRfbWFwcGluZ3MgPQo+PiArCQlrY2FsbG9jKGFyZ3MtPm51bV9idWZzLCBz
aXplb2YoKmpvYl9kYXRhLT51c2VkX21hcHBpbmdzKSwgR0ZQX0tFUk5FTCk7Cj4gCj4gVGhlIGNo
ZWNrcGF0Y2ggc2hvdWxkIGRpc2FsbG93IHRoaXMgY29kaW5nIHN0eWxlLiBJJ2Qgd3JpdGUgaXQg
YXM6Cj4gCj4gc2l6ZV90IHNpemU7Cj4gCj4gc2l6ZSA9IHNpemVvZigqam9iX2RhdGEtPnVzZWRf
bWFwcGluZ3MpOwo+IGpvYl9kYXRhLT51c2VkX21hcHBpbmdzID0ga2NhbGxvYyhhcmdzLT5udW1f
YnVmcywgc2l6ZS4uKTsKCkknbGwgbWFrZSB0aGVzZSBjbGVhbmVyIGZvciBuZXh0IHZlcnNpb24u
Cgo+IAo+PiArCWlmICgham9iX2RhdGEtPnVzZWRfbWFwcGluZ3MpCj4+ICsJCXJldHVybiAtRU5P
TUVNOwo+PiArCj4+ICsJZm9yIChpID0gMDsgaSA8IGFyZ3MtPm51bV9idWZzOyBpKyspIHsKPj4g
KwkJY29weV9lcnIgPSBjb3B5X2Zyb21fdXNlcigmYnVmLCB1c2VyX2J1ZnNfcHRyK2ksIHNpemVv
ZihidWYpKTsKPiAKPiBXaG9sZSBhcnJheSBhbHdheXMgc2hvdWxkIGJlIGNvcGllZCBhdCBvbmNl
LiBQbGVhc2Uga2VlcCBpbiBtaW5kIHRoYXQKPiBlYWNoIGNvcHlfZnJvbV91c2VyKCkgaGFzIGEg
Y3B1LXRpbWUgY29zdCwgdGhlcmUgc2hvdWxkIG1heGltdW0gdXAgdG8gMgo+IGNvcHlpbmdzIHBl
ciBqb2IuCj4gCgpPSy4gQlRXLCBkbyB5b3UgaGF2ZSBzb21lIHJlZmVyZW5jZS9udW1iZXJzIGZv
ciB0aGlzIG9yIGlzIGl0IGJhc2VkIG9uIApncmF0ZS1kcml2ZXIgZXhwZXJpZW5jZT8KCk1pa2tv
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZl
bCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xp
c3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
