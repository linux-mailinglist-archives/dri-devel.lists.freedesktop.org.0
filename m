Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BC9FBBD4BC
	for <lists+dri-devel@lfdr.de>; Tue, 24 Sep 2019 23:59:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9B16B89B57;
	Tue, 24 Sep 2019 21:59:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 02A8F89B57;
 Tue, 24 Sep 2019 21:59:32 +0000 (UTC)
Received: from mail-qt1-f173.google.com (mail-qt1-f173.google.com
 [209.85.160.173])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 62ECD217D9;
 Tue, 24 Sep 2019 21:59:32 +0000 (UTC)
Received: by mail-qt1-f173.google.com with SMTP id j31so4108485qta.5;
 Tue, 24 Sep 2019 14:59:32 -0700 (PDT)
X-Gm-Message-State: APjAAAWP0WSd6PwlPD0zPuJAsm9jMqCkkrCZ1sXX21JiOMktsUyHy+iN
 lA+EuS5LP2URoZOdGmcqsEJIF5pO9gHjc4jTFA==
X-Google-Smtp-Source: APXvYqxu7lx2ORNXYuD01RyoAdK8YY//zQYn3oJnMVZaPVMMDgXcioCqkbUXveNdRfpBkQzN/4OY/SjTncH5t1k8eUk=
X-Received: by 2002:ac8:6982:: with SMTP id o2mr5274643qtq.143.1569362371529; 
 Tue, 24 Sep 2019 14:59:31 -0700 (PDT)
MIME-Version: 1.0
References: <20190924181244.7159-1-nsaenzjulienne@suse.de>
In-Reply-To: <20190924181244.7159-1-nsaenzjulienne@suse.de>
From: Rob Herring <robh+dt@kernel.org>
Date: Tue, 24 Sep 2019 16:59:20 -0500
X-Gmail-Original-Message-ID: <CAL_Jsq+v+svTyna7UzQdRVqfNc5Z_bgWzxNRXv7-Wqv3NwDu2g@mail.gmail.com>
Message-ID: <CAL_Jsq+v+svTyna7UzQdRVqfNc5Z_bgWzxNRXv7-Wqv3NwDu2g@mail.gmail.com>
Subject: Re: [PATCH 00/11] of: Fix DMA configuration for non-DT masters
To: Nicolas Saenz Julienne <nsaenzjulienne@suse.de>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=kernel.org; s=default; t=1569362372;
 bh=7EnBQLGJXbJ0krx6sf9eAXMt0SpVcFYHvJ4Ffxc+GEI=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=ZUjBfJ5y+ysHUqZVHvVQV6vmXEF5m5l7X/D3o8MMo6T+fnXCBe1Len91UdIVSmNm8
 1+IgmCK2yWkyLXKdLfON0wTF2uVY6/Zj+z4CbqBQ8S1mTFhTzxJ4K+kIhlIbeitlp5
 qXtcO6SJzhSJ74/8s14mN0YBxYms1LJJP0SwTimA=
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
Cc: freedreno <freedreno@lists.freedesktop.org>, devicetree@vger.kernel.org,
 Matthias Brugger <mbrugger@suse.com>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 linux-wireless <linux-wireless@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, etnaviv@lists.freedesktop.org,
 linux-tegra@vger.kernel.org, Florian Fainelli <f.fainelli@gmail.com>,
 Stefan Wahren <wahrenst@gmx.net>, james.quinlan@broadcom.com,
 linux-pci@vger.kernel.org,
 "open list:DMA GENERIC OFFLOAD ENGINE SUBSYSTEM" <dmaengine@vger.kernel.org>,
 xen-devel@lists.xenproject.org, Dan Williams <dan.j.williams@intel.com>,
 Robin Murphy <robin.murphy@arm.com>, Frank Rowand <frowand.list@gmail.com>,
 "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>,
 Linux Media Mailing List <linux-media@vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCBTZXAgMjQsIDIwMTkgYXQgMToxMiBQTSBOaWNvbGFzIFNhZW56IEp1bGllbm5lCjxu
c2FlbnpqdWxpZW5uZUBzdXNlLmRlPiB3cm90ZToKPgo+IEhpIEFsbCwKPiB0aGlzIHNlcmllcyB0
cmllcyB0byBhZGRyZXNzIG9uZSBvZiB0aGUgaXNzdWVzIGJsb2NraW5nIHVzIGZyb20KPiB1cHN0
cmVhbWluZyBCcm9hZGNvbSdzIFNUQiBQQ0llIGNvbnRyb2xsZXJbMV0uIE5hbWVseSwgdGhlIGZh
Y3QgdGhhdAo+IGRldmljZXMgbm90IHJlcHJlc2VudGVkIGluIERUIHdoaWNoIHNpdCBiZWhpbmQg
YSBQQ0kgYnVzIGZhaWwgdG8gZ2V0IHRoZQo+IGJ1cycgRE1BIGFkZHJlc3NpbmcgY29uc3RyYWlu
dHMuCj4KPiBUaGlzIGlzIGR1ZSB0byB0aGUgZmFjdCB0aGF0IG9mX2RtYV9jb25maWd1cmUoKSBh
c3N1bWVzIGl0J3MgcmVjZWl2aW5nIGEKPiBEVCBub2RlIHJlcHJlc2VudGluZyB0aGUgZGV2aWNl
IGJlaW5nIGNvbmZpZ3VyZWQsIGFzIG9wcG9zZWQgdG8gdGhlIFBDSWUKPiBicmlkZ2Ugbm9kZSB3
ZSBjdXJyZW50bHkgcGFzcy4gVGhpcyBjYXVzZXMgdGhlIGNvZGUgdG8gZGlyZWN0bHkganVtcAo+
IGludG8gUENJJ3MgcGFyZW50IG5vZGUgd2hlbiBjaGVja2luZyBmb3IgJ2RtYS1yYW5nZXMnIGFu
ZCBtaXNzZXMKPiB3aGF0ZXZlciB3YXMgc2V0IHRoZXJlLgo+Cj4gVG8gYWRkcmVzcyB0aGlzIEkg
Y3JlYXRlIGEgbmV3IEFQSSBpbiBPRiAtIGluc3BpcmVkIGZyb20gUm9iaW4gTXVycGh5cwo+IG9y
aWdpbmFsIHByb3Bvc2FsWzJdIC0gd2hpY2ggYWNjZXB0cyBhIGJ1cyBEVCBub2RlIGFzIGl0J3Mg
aW5wdXQgaW4KPiBvcmRlciB0byBjb25maWd1cmUgYSBkZXZpY2UncyBETUEgY29uc3RyYWludHMu
IFRoZSBjaGFuZ2VzIGdvIGRlZXAgaW50bwo+IG9mL2FkZHJlc3MuYydzIGltcGxlbWVudGF0aW9u
LCBhcyBhIGRldmljZSBiZWluZyBoYXZpbmcgYSBEVCBub2RlCj4gYXNzdW1wdGlvbiB3YXMgcHJl
dHR5IHN0cm9uZy4KPgo+IE9uIHRvcCBvZiB0aGlzIHdvcmssIEkgYWxzbyBjbGVhbmVkIHVwIG9m
X2RtYV9jb25maWd1cmUoKSByZW1vdmluZyBpdHMKPiByZWR1bmRhbnQgYXJndW1lbnRzIGFuZCBj
cmVhdGluZyBhbiBhbHRlcm5hdGl2ZSBmdW5jdGlvbiBmb3IgdGhlIHNwZWNpYWwgY2FzZXMKPiBu
b3QgYXBwbGljYWJsZSB0byBlaXRoZXIgdGhlIGFib3ZlIGNhc2Ugb3IgdGhlIGRlZmF1bHQgdXNh
Z2UuCj4KPiBJTU8gdGhlIHJlc3VsdGluZyBmdW5jdGlvbnMgYXJlIG1vcmUgZXhwbGljaXQuIFRo
ZXkgd2lsbCBwcm9iYWJseQo+IHN1cmZhY2Ugc29tZSBoYWNreSB1c2FnZXMgdGhhdCBjYW4gYmUg
cHJvcGVybHkgZml4ZWQgYXMgSSBzaG93IHdpdGggdGhlCj4gRFQgZml4ZXMgb24gdGhlIExheWVy
c2NhcGUgcGxhdGZvcm0uCj4KPiBUaGlzIHdhcyBhbHNvIHRlc3RlZCBvbiBhIFJhc3BiZXJyeSBQ
aSA0IHdpdGggYSBjdXN0b20gUENJZSBkcml2ZXIgYW5kCj4gb24gYSBTZWF0dGxlIEFNRCBib2Fy
ZC4KCkh1bW0sIEkndmUgYmVlbiB3b3JraW5nIG9uIHRoaXMgaXNzdWUgdG9vLiBMb29rcyBzaW1p
bGFyIHRob3VnaCB5b3VycwpoYXMgYSBsb3QgbW9yZSBjaHVybiBhbmQgdGhlcmUncyBzb21lIG90
aGVyIGJ1Z3MgSSd2ZSBmb3VuZC4KCkNhbiB5b3UgdGVzdCBvdXQgdGhpcyBicmFuY2hbMV0uIEkg
ZG9uJ3QgaGF2ZSBhbnkgaC93IG5lZWRpbmcgdGhpcywKYnV0IHdyb3RlIGEgdW5pdHRlc3QgYW5k
IHRlc3RlZCB3aXRoIG1vZGlmaWVkIFFFTVUuCgpSb2IKClsxXSBnaXQ6Ly9naXQua2VybmVsLm9y
Zy9wdWIvc2NtL2xpbnV4L2tlcm5lbC9naXQvcm9iaC9saW51eC5naXQgZG1hLW1hc2tzCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWls
aW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
