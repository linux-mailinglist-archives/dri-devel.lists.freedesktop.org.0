Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E48F2629B1
	for <lists+dri-devel@lfdr.de>; Wed,  9 Sep 2020 10:11:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C54BC6EA95;
	Wed,  9 Sep 2020 08:11:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kapsi.fi (mail.kapsi.fi [IPv6:2001:67c:1be8::25])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 943D36EA97
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Sep 2020 08:11:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=kapsi.fi;
 s=20161220; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=vUmzQQRqobyqrwRy6tA9315+Sg0mrSxJ+NZ1ELHv0yw=; b=bApV+Th1hY1NtsLvxwyxdqL/6P
 ynSUl0SGVwP0UMbQjlZCs6BOzPSWH7BxKjynlDJZZ/qqrLIsOs0autVqBzwco5JeBWN2/W2lVeu15
 5OiDTK14y5KuBp+vD1O7dJNcUTj3AqHvbndOAPQhstn8Deu3R4A+KlgaPeFDU8v80/3DuwJP5S9+Y
 zGjWCplxS1fGUPFLh+dhC9/450rOv/azlVZDI2IEQHeYRJV+y98RoDQR3qZzWLFIVOJ25Ec1NdyHx
 56EcSLOHpaakBmAOI1juGBNElt3rmvszpX/GpdbBZ1StMANTFZpV0vAsB9OIzGXlM1I3sSp1LD6nh
 K873YhyA==;
Received: from dsl-hkibng22-54faab-65.dhcp.inet.fi ([84.250.171.65]
 helo=[192.168.1.10])
 by mail.kapsi.fi with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.89) (envelope-from <cyndis@kapsi.fi>)
 id 1kFvCW-0002rO-3c; Wed, 09 Sep 2020 11:11:32 +0300
Subject: Re: [RFC PATCH v2 15/17] drm/tegra: Add power_on/power_off engine
 callbacks
To: Dmitry Osipenko <digetx@gmail.com>,
 Mikko Perttunen <mperttunen@nvidia.com>, thierry.reding@gmail.com,
 jonathanh@nvidia.com, airlied@linux.ie, daniel@ffwll.ch
References: <20200905103420.3021852-1-mperttunen@nvidia.com>
 <20200905103420.3021852-16-mperttunen@nvidia.com>
 <2ddaf2ef-e232-7d44-0b08-e190f20297b2@gmail.com>
From: Mikko Perttunen <cyndis@kapsi.fi>
Message-ID: <1b6676a2-0de9-e2ef-61ce-ce8e5ad83e1a@kapsi.fi>
Date: Wed, 9 Sep 2020 11:11:22 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <2ddaf2ef-e232-7d44-0b08-e190f20297b2@gmail.com>
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

T24gOS85LzIwIDM6MTYgQU0sIERtaXRyeSBPc2lwZW5rbyB3cm90ZToKPiAwNS4wOS4yMDIwIDEz
OjM0LCBNaWtrbyBQZXJ0dHVuZW4g0L/QuNGI0LXRgjoKPiAuLi4KPj4gK3N0YXRpYyBpbnQgdmlj
X3Bvd2VyX29uKHN0cnVjdCB0ZWdyYV9kcm1fY2xpZW50ICpjbGllbnQpCj4+ICt7Cj4+ICsJc3Ry
dWN0IHZpYyAqdmljID0gdG9fdmljKGNsaWVudCk7Cj4+ICsKPj4gKwlyZXR1cm4gcG1fcnVudGlt
ZV9nZXRfc3luYyh2aWMtPmRldik7Cj4gCj4gUGxlYXNlIGtlZXAgaW4gbWluZCB0aGF0IFJQTSBu
ZWVkcyB0byBiZSBwdXQgaW4gYSBjYXNlIG9mIGVycm9yLgo+IAo+IE1heWJlIGl0IHdvdWxkIGJl
IGJldHRlciBpZiBkcml2ZXItY29yZSBjb3VsZCB0YWtlIGNhcmUgb2YKPiByZXN1bWluZy9zdXNw
ZW5kaW5nIGNsaWVudCdzIFJQTSBpbnN0ZWFkIG9mIHB1dHRpbmcgdGhhdCBidXJkZW4gb24gZWFj
aAo+IGNsaWVudCBpbmRpdmlkdWFsbHk/Cj4gCgpHb29kIHBvaW50LCB3ZSBzaG91bGQgYmUgYWJs
ZSB0byBqdXN0IG1ha2UgUlBNIGNhbGxzIGZyb20gdGhlIGNvcmUgY29kZS4gCkknbGwgY2hhbmdl
IGl0IHNvIChhbmQgZml4IHRoZSByZWZjb3VudGluZykuCgpNaWtrbwpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRy
aS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5v
cmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
