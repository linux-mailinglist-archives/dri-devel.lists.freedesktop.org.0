Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DD30E2675B5
	for <lists+dri-devel@lfdr.de>; Sat, 12 Sep 2020 00:11:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 50D9D6E0EF;
	Fri, 11 Sep 2020 22:11:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kapsi.fi (mail.kapsi.fi [IPv6:2001:67c:1be8::25])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B30526E0EF
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Sep 2020 22:11:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=kapsi.fi;
 s=20161220; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=ogTQed4AB3YTOxiNumxOSIUQDui4rXqp7ldPSCSbBJ8=; b=gPdH7Mi+qbv0+WK4jFhsY6nd0d
 RdTASNJFBBYgMPRnW5CatCY/463DWXIHv4oUhiME+OqvpTgWNJvH0y58fz1FsmK6W6TTxJSLT9KuO
 QTnEFYY421E1mcEH/2gu6DYBvompjnxYcIpVj6MnI6NJZ90k/wvHoakyQeh1mA4lQKVdVTkCJ95Zs
 ez/Y0BxUpRV/SfyZ+6AfXaWxw8y4x6sc1nJgPyIt5TtdTJGqmtjGZef8sTncgtZxW3d5v+xr8pA1N
 oL7N8A49ZDqLFKlv2zqBegCPWLSS2Xjbwjbmi6X8iBHLjJgAJzOPsBG3TnUCRyFREZnC+APfp0d+W
 citAHyKA==;
Received: from dsl-hkibng22-54faab-65.dhcp.inet.fi ([84.250.171.65]
 helo=[192.168.1.10])
 by mail.kapsi.fi with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.89) (envelope-from <cyndis@kapsi.fi>)
 id 1kGrGG-0005lL-Gn; Sat, 12 Sep 2020 01:11:16 +0300
Subject: Re: [RFC PATCH v2 10/17] WIP: gpu: host1x: Add no-recovery mode
To: Dmitry Osipenko <digetx@gmail.com>,
 Mikko Perttunen <mperttunen@nvidia.com>, thierry.reding@gmail.com,
 jonathanh@nvidia.com, airlied@linux.ie, daniel@ffwll.ch
References: <20200905103420.3021852-1-mperttunen@nvidia.com>
 <20200905103420.3021852-11-mperttunen@nvidia.com>
 <7d7a29e8-3151-12ea-da66-d8a479edda84@gmail.com>
From: Mikko Perttunen <cyndis@kapsi.fi>
Message-ID: <c2498218-e107-4df4-41ce-c60da65ceaf7@kapsi.fi>
Date: Sat, 12 Sep 2020 01:11:05 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <7d7a29e8-3151-12ea-da66-d8a479edda84@gmail.com>
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

T24gOS8xMS8yMCA3OjQwIFBNLCBEbWl0cnkgT3NpcGVua28gd3JvdGU6Cj4gMDUuMDkuMjAyMCAx
MzozNCwgTWlra28gUGVydHR1bmVuINC/0LjRiNC10YI6Cj4+ICsJfSBlbHNlIHsKPj4gKwkJc3Ry
dWN0IGhvc3QxeF9qb2IgKmZhaWxlZF9qb2IgPSBqb2I7Cj4+ICsKPj4gKwkJaG9zdDF4X2pvYl9k
dW1wKGRldiwgam9iKTsKPj4gKwo+PiArCQlob3N0MXhfc3luY3B0X3NldF9sb2NrZWQoam9iLT5z
eW5jcHQpOwo+PiArCQlmYWlsZWRfam9iLT5jYW5jZWxsZWQgPSB0cnVlOwo+PiArCj4+ICsJCWxp
c3RfZm9yX2VhY2hfZW50cnlfY29udGludWUoam9iLCAmY2RtYS0+c3luY19xdWV1ZSwgbGlzdCkg
ewo+PiArCQkJdW5zaWduZWQgaW50IGk7Cj4+ICsKPj4gKwkJCWlmIChqb2ItPnN5bmNwdCAhPSBm
YWlsZWRfam9iLT5zeW5jcHQpCj4+ICsJCQkJY29udGludWU7Cj4+ICsKPj4gKwkJCWZvciAoaSA9
IDA7IGkgPCBqb2ItPm51bV9zbG90czsgaSsrKSB7Cj4+ICsJCQkJdW5zaWduZWQgaW50IHNsb3Qg
PSAoam9iLT5maXJzdF9nZXQvOCArIGkpICUKPj4gKwkJCQkJCSAgICBIT1NUMVhfUFVTSEJVRkZF
Ul9TTE9UUzsKPj4gKwkJCQl1MzIgKm1hcHBlZCA9IGNkbWEtPnB1c2hfYnVmZmVyLm1hcHBlZDsK
Pj4gKwo+PiArCQkJCW1hcHBlZFsyKnNsb3QrMF0gPSAweDFiYWQwMDAwOwo+PiArCQkJCW1hcHBl
ZFsyKnNsb3QrMV0gPSAweDFiYWQwMDAwOwo+IAo+IFRoZSAweDFiYWQwMDAwIGlzIGEgdmFsaWQg
bWVtb3J5IGFkZHJlc3Mgb24gVGVncmEyMC4KPiAKPiBUaGUgMHg2MDAwMDAwMCBpcyBpbnZhbGlk
IHBoeXMgYWRkcmVzcyBmb3IgYWxsIGhhcmR3YXJlIGdlbmVyYXRpb25zLgo+IEl0J3MgdXNlZCBi
eSBncmF0ZS1rZXJuZWwgWzFdIGFuZCBWREUgZHJpdmVyIFsyXS4gTm90ZSB0aGF0IHRoZSAweDYg
PDwKPiAyOCBpcyBhbHNvIGludmFsaWQgSG9zdDF4IG9wY29kZSwgd2hpbGUgMHgxIHNob3VsZCBi
cmVhayBDRE1BIHBhcnNlcgo+IGR1cmluZyBvZiBQQiBkZWJ1Zy1kdW1waW5nLgo+IAo+IFsxXQo+
IGh0dHBzOi8vZ2l0aHViLmNvbS9ncmF0ZS1kcml2ZXIvbGludXgvYmxvYi9tYXN0ZXIvZHJpdmVy
cy9ncHUvZHJtL3RlZ3JhL2dlbS5oI0wxNgo+IAo+IFsyXQo+IGh0dHBzOi8vZWxpeGlyLmJvb3Rs
aW4uY29tL2xpbnV4L3Y1LjktcmM0L3NvdXJjZS9kcml2ZXJzL3N0YWdpbmcvbWVkaWEvdGVncmEt
dmRlL2lvbW11LmMjTDk5Cj4gCj4gVGhlIFZERSBkcml2ZXIgcmVzZXJ2ZXMgdGhlIHRyYXBwaW5n
IElPVkEgYWRkcmVzc2VzLCBJIGFzc3VtZSB0aGUgSG9zdDF4Cj4gZHJpdmVyIHNob3VsZCBkbyB0
aGUgc2FtZS4KPiAKClRoZSAweDFiYWQwMDAwJ3MgYXJlIG5vdCBpbnRlbmRlZCB0byBiZSBtZW1v
cnkgYWRkcmVzc2VzLCB0aGV5IGFyZSBOT09QIApvcGNvZGVzIChJTkNSIG9mIDAgd29yZHMgdG8g
b2Zmc2V0IDB4YmFkKS4gSSdsbCBmaXggdGhpcyB0byB1c2UgcHJvcGVyIApmdW5jdGlvbnMgdG8g
Y29uc3RydWN0IHRoZSBvcGNvZGVzIGFuZCBhZGQgc29tZSBjb21tZW50cy4gVGhlc2UgbmVlZCB0
byAKYmUgTk9PUCBvcGNvZGVzIHNvIHRoZSBjb21tYW5kIHBhcnNlciBza2lwcyBvdmVyIHRoZXNl
ICJjYW5jZWxsZWQiIGpvYnMgCndoZW4gdGhlIGNoYW5uZWwgaXMgcmVzdW1lZC4KCkJUVywgMHg2
MDAwMDAwMCBpcyB2YWxpZCBvbiBUZWdyYTE5NCBhbmQgbGF0ZXIuCgpNaWtrbwpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBs
aXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVz
a3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
