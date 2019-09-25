Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DC7ABE2DA
	for <lists+dri-devel@lfdr.de>; Wed, 25 Sep 2019 18:52:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2C0D16E084;
	Wed, 25 Sep 2019 16:52:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 063D86E084;
 Wed, 25 Sep 2019 16:52:46 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 37EA81570;
 Wed, 25 Sep 2019 09:52:46 -0700 (PDT)
Received: from [10.1.197.57] (e110467-lin.cambridge.arm.com [10.1.197.57])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 2F5133F67D;
 Wed, 25 Sep 2019 09:52:41 -0700 (PDT)
Subject: Re: [PATCH 00/11] of: Fix DMA configuration for non-DT masters
To: Rob Herring <robh+dt@kernel.org>,
 Nicolas Saenz Julienne <nsaenzjulienne@suse.de>
References: <20190924181244.7159-1-nsaenzjulienne@suse.de>
 <CAL_Jsq+v+svTyna7UzQdRVqfNc5Z_bgWzxNRXv7-Wqv3NwDu2g@mail.gmail.com>
 <d1a31a2ec8eb2f226b1fb41f6c24ffb47c3bf7c7.camel@suse.de>
 <e404c65b-5a66-6f91-5b38-8bf89a7697b2@arm.com>
 <43fb5fe1de317d65a4edf592f88ea150c6e3b8cc.camel@suse.de>
 <CAL_JsqLhx500cx3YLoC7HL1ux3bBpV+fEA2Qnk7D5RFGgiGzSw@mail.gmail.com>
From: Robin Murphy <robin.murphy@arm.com>
Message-ID: <aa4c8d62-7990-e385-2bb1-cec55148f0a8@arm.com>
Date: Wed, 25 Sep 2019 17:52:39 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <CAL_JsqLhx500cx3YLoC7HL1ux3bBpV+fEA2Qnk7D5RFGgiGzSw@mail.gmail.com>
Content-Language: en-GB
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
Cc: devicetree@vger.kernel.org, Matthias Brugger <mbrugger@suse.com>,
 Frank Rowand <frowand.list@gmail.com>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 linux-wireless <linux-wireless@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, etnaviv@lists.freedesktop.org,
 "open list:DMA GENERIC OFFLOAD ENGINE SUBSYSTEM" <dmaengine@vger.kernel.org>,
 Florian Fainelli <f.fainelli@gmail.com>, Stefan Wahren <wahrenst@gmx.net>,
 james.quinlan@broadcom.com, linux-pci@vger.kernel.org,
 linux-tegra@vger.kernel.org, xen-devel@lists.xenproject.org,
 Dan Williams <dan.j.williams@intel.com>,
 freedreno <freedreno@lists.freedesktop.org>,
 "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>,
 Linux Media Mailing List <linux-media@vger.kernel.org>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMjUvMDkvMjAxOSAxNzoxNiwgUm9iIEhlcnJpbmcgd3JvdGU6Cj4gT24gV2VkLCBTZXAgMjUs
IDIwMTkgYXQgMTA6MzAgQU0gTmljb2xhcyBTYWVueiBKdWxpZW5uZQo+IDxuc2FlbnpqdWxpZW5u
ZUBzdXNlLmRlPiB3cm90ZToKPj4KPj4gT24gV2VkLCAyMDE5LTA5LTI1IGF0IDE2OjA5ICswMTAw
LCBSb2JpbiBNdXJwaHkgd3JvdGU6Cj4+PiBPbiAyNS8wOS8yMDE5IDE1OjUyLCBOaWNvbGFzIFNh
ZW56IEp1bGllbm5lIHdyb3RlOgo+Pj4+IE9uIFR1ZSwgMjAxOS0wOS0yNCBhdCAxNjo1OSAtMDUw
MCwgUm9iIEhlcnJpbmcgd3JvdGU6Cj4+Pj4+IE9uIFR1ZSwgU2VwIDI0LCAyMDE5IGF0IDE6MTIg
UE0gTmljb2xhcyBTYWVueiBKdWxpZW5uZQo+Pj4+PiA8bnNhZW56anVsaWVubmVAc3VzZS5kZT4g
d3JvdGU6Cj4+Pj4+PiBIaSBBbGwsCj4+Pj4+PiB0aGlzIHNlcmllcyB0cmllcyB0byBhZGRyZXNz
IG9uZSBvZiB0aGUgaXNzdWVzIGJsb2NraW5nIHVzIGZyb20KPj4+Pj4+IHVwc3RyZWFtaW5nIEJy
b2FkY29tJ3MgU1RCIFBDSWUgY29udHJvbGxlclsxXS4gTmFtZWx5LCB0aGUgZmFjdCB0aGF0Cj4+
Pj4+PiBkZXZpY2VzIG5vdCByZXByZXNlbnRlZCBpbiBEVCB3aGljaCBzaXQgYmVoaW5kIGEgUENJ
IGJ1cyBmYWlsIHRvIGdldCB0aGUKPj4+Pj4+IGJ1cycgRE1BIGFkZHJlc3NpbmcgY29uc3RyYWlu
dHMuCj4+Pj4+Pgo+Pj4+Pj4gVGhpcyBpcyBkdWUgdG8gdGhlIGZhY3QgdGhhdCBvZl9kbWFfY29u
ZmlndXJlKCkgYXNzdW1lcyBpdCdzIHJlY2VpdmluZyBhCj4+Pj4+PiBEVCBub2RlIHJlcHJlc2Vu
dGluZyB0aGUgZGV2aWNlIGJlaW5nIGNvbmZpZ3VyZWQsIGFzIG9wcG9zZWQgdG8gdGhlIFBDSWUK
Pj4+Pj4+IGJyaWRnZSBub2RlIHdlIGN1cnJlbnRseSBwYXNzLiBUaGlzIGNhdXNlcyB0aGUgY29k
ZSB0byBkaXJlY3RseSBqdW1wCj4+Pj4+PiBpbnRvIFBDSSdzIHBhcmVudCBub2RlIHdoZW4gY2hl
Y2tpbmcgZm9yICdkbWEtcmFuZ2VzJyBhbmQgbWlzc2VzCj4+Pj4+PiB3aGF0ZXZlciB3YXMgc2V0
IHRoZXJlLgo+Pj4+Pj4KPj4+Pj4+IFRvIGFkZHJlc3MgdGhpcyBJIGNyZWF0ZSBhIG5ldyBBUEkg
aW4gT0YgLSBpbnNwaXJlZCBmcm9tIFJvYmluIE11cnBoeXMKPj4+Pj4+IG9yaWdpbmFsIHByb3Bv
c2FsWzJdIC0gd2hpY2ggYWNjZXB0cyBhIGJ1cyBEVCBub2RlIGFzIGl0J3MgaW5wdXQgaW4KPj4+
Pj4+IG9yZGVyIHRvIGNvbmZpZ3VyZSBhIGRldmljZSdzIERNQSBjb25zdHJhaW50cy4gVGhlIGNo
YW5nZXMgZ28gZGVlcCBpbnRvCj4+Pj4+PiBvZi9hZGRyZXNzLmMncyBpbXBsZW1lbnRhdGlvbiwg
YXMgYSBkZXZpY2UgYmVpbmcgaGF2aW5nIGEgRFQgbm9kZQo+Pj4+Pj4gYXNzdW1wdGlvbiB3YXMg
cHJldHR5IHN0cm9uZy4KPj4+Pj4+Cj4+Pj4+PiBPbiB0b3Agb2YgdGhpcyB3b3JrLCBJIGFsc28g
Y2xlYW5lZCB1cCBvZl9kbWFfY29uZmlndXJlKCkgcmVtb3ZpbmcgaXRzCj4+Pj4+PiByZWR1bmRh
bnQgYXJndW1lbnRzIGFuZCBjcmVhdGluZyBhbiBhbHRlcm5hdGl2ZSBmdW5jdGlvbiBmb3IgdGhl
IHNwZWNpYWwKPj4+Pj4+IGNhc2VzCj4+Pj4+PiBub3QgYXBwbGljYWJsZSB0byBlaXRoZXIgdGhl
IGFib3ZlIGNhc2Ugb3IgdGhlIGRlZmF1bHQgdXNhZ2UuCj4+Pj4+Pgo+Pj4+Pj4gSU1PIHRoZSBy
ZXN1bHRpbmcgZnVuY3Rpb25zIGFyZSBtb3JlIGV4cGxpY2l0LiBUaGV5IHdpbGwgcHJvYmFibHkK
Pj4+Pj4+IHN1cmZhY2Ugc29tZSBoYWNreSB1c2FnZXMgdGhhdCBjYW4gYmUgcHJvcGVybHkgZml4
ZWQgYXMgSSBzaG93IHdpdGggdGhlCj4+Pj4+PiBEVCBmaXhlcyBvbiB0aGUgTGF5ZXJzY2FwZSBw
bGF0Zm9ybS4KPj4+Pj4+Cj4+Pj4+PiBUaGlzIHdhcyBhbHNvIHRlc3RlZCBvbiBhIFJhc3BiZXJy
eSBQaSA0IHdpdGggYSBjdXN0b20gUENJZSBkcml2ZXIgYW5kCj4+Pj4+PiBvbiBhIFNlYXR0bGUg
QU1EIGJvYXJkLgo+Pj4+Pgo+Pj4+PiBIdW1tLCBJJ3ZlIGJlZW4gd29ya2luZyBvbiB0aGlzIGlz
c3VlIHRvby4gTG9va3Mgc2ltaWxhciB0aG91Z2ggeW91cnMKPj4+Pj4gaGFzIGEgbG90IG1vcmUg
Y2h1cm4gYW5kIHRoZXJlJ3Mgc29tZSBvdGhlciBidWdzIEkndmUgZm91bmQuCj4+Pj4KPj4+PiBU
aGF0J3MgZ29vZCBuZXdzLCBhbmQgeWVzIG5vdyB0aGF0IEkgc2VlIGl0LCBzb21lIHN0dWZmIG9u
IG15IHNlcmllcyBpcwo+Pj4+IG92ZXJseQo+Pj4+IGNvbXBsaWNhdGVkLiBTcGVjaWFsbHkgYXJv
dW5kIG9mX3RyYW5zbGF0ZV8qKCkuCj4+Pj4KPj4+PiBPbiB0b3Agb2YgdGhhdCwgeW91IHJlbW92
ZWQgaW4gb2ZfZG1hX2dldF9yYW5nZSgpOgo+Pj4+Cj4+Pj4gLSAgIC8qCj4+Pj4gLSAgICAqIEF0
IGxlYXN0IGVtcHR5IHJhbmdlcyBoYXMgdG8gYmUgZGVmaW5lZCBmb3IgcGFyZW50IG5vZGUgaWYK
Pj4+PiAtICAgICogRE1BIGlzIHN1cHBvcnRlZAo+Pj4+IC0gICAgKi8KPj4+PiAtICAgaWYgKCFy
YW5nZXMpCj4+Pj4gLSAgICAgICAgICAgYnJlYWs7Cj4+Pj4KPj4+PiBXaGljaCBJIGFzc3VtZWQg
d2FzIGJvdW5kIHRvIHRoZSBzdGFuZGFyZCBhbmQgbWFrZXMgdGhpbmdzIGVhc2llci4KPj4+Pgo+
Pj4+PiBDYW4geW91IHRlc3Qgb3V0IHRoaXMgYnJhbmNoWzFdLiBJIGRvbid0IGhhdmUgYW55IGgv
dyBuZWVkaW5nIHRoaXMsCj4+Pj4+IGJ1dCB3cm90ZSBhIHVuaXR0ZXN0IGFuZCB0ZXN0ZWQgd2l0
aCBtb2RpZmllZCBRRU1VLgo+Pj4+Cj4+Pj4gSSByZXZpZXdlZCBldmVyeXRoaW5nLCBJIGRpZCBm
aW5kIGEgbWlub3IgaXNzdWUsIHNlZSB0aGUgcGF0Y2ggYXR0YWNoZWQuCj4+Pgo+Pj4gV1JUIHRo
YXQgcGF0Y2gsIHRoZSBvcmlnaW5hbCBpbnRlbnQgb2YgImZvcmNlX2RtYSIgd2FzIHB1cmVseSB0
bwo+Pj4gY29uc2lkZXIgYSBkZXZpY2UgRE1BLWNhcGFibGUgcmVnYXJkbGVzcyBvZiB0aGUgcHJl
c2VuY2Ugb2YKPj4+ICJkbWEtcmFuZ2VzIi4gRXhwZWN0aW5nIG9mX2RtYV9jb25maWd1cmUoKSB0
byBkbyBhbnl0aGluZyBmb3IgYSBub24tT0YKPj4+IGRldmljZSBoYXMgYWx3YXlzIGJlZW4gYm9n
dXMgLSBtYWdpYyBwYXJhdmlydCBkZXZpY2VzIHdoaWNoIGFwcGVhciBvdXQKPj4+IG9mIG5vd2hl
cmUgYW5kIGV4cGVjdCB0byBiZSB0cmVhdGVkIGFzIGdlbnVpbmUgRE1BIG1hc3RlcnMgYXJlIGEK
Pj4+IHNlcGFyYXRlIHByb2JsZW0gdGhhdCB3ZSBoYXZlbid0IHJlYWxseSBhcHByb2FjaGVkIHll
dC4KPj4KPj4gSSBhZ3JlZSBpdCdzIGNsZWFybHkgYWJ1c2luZyB0aGUgZnVuY3Rpb24uIEkgaGF2
ZSBubyBwcm9ibGVtIHdpdGggdGhlIGJlaGF2aW91cgo+PiBjaGFuZ2UgaWYgaXQncyBPSyB3aXRo
IHlvdS4KClRoaW5raW5nIGFib3V0IGl0LCB5b3UgY291bGQgcHJvYmFibHkganVzdCByZW1vdmUg
dGhhdCBjYWxsIGZyb20gdGhlIFhlbiAKRFJNIGRyaXZlciBub3cgYW55d2F5IC0gc2luY2UgdGhl
IGRtYS1kaXJlY3QgcmV3b3JrLCB3ZSBsb3N0IHRoZSBhYmlsaXR5IAp0byBzZXQgZG1hX2R1bW15
X29wcyBieSBkZWZhdWx0LCBhbmQgTlVMTCBvcHMgbm93IHJlcHJlc2VudCB3aGF0IGl0IAoocHJl
c3VtYWJseSkgd2FudHMuCgo+PiBSb2JpbiwgaGF2ZSB5b3UgbG9va2VkIGludG8gc3VwcG9ydGlu
ZyBtdWx0aXBsZSBkbWEtcmFuZ2VzPyBJdCdzIHRoZSBuZXh0IHRoaW5nCj4+IHdlIG5lZWQgZm9y
IEJDTSBTVEIncyBQQ0llLiBJJ2xsIGhhdmUgYSBnbyBhdCBpdCBteXNlbGYgaWYgbm90aGluZyBp
cyBpbiB0aGUKPj4gd29ya3MgYWxyZWFkeS4KPiAKPiBNdWx0aXBsZSBkbWEtcmFuZ2VzIGFzIGZh
ciBhcyBjb25maWd1cmluZyBpbmJvdW5kIHdpbmRvd3Mgc2hvdWxkIHdvcmsKPiBhbHJlYWR5IG90
aGVyIHRoYW4gdGhlIGJ1ZyB3aGVuIHRoZXJlJ3MgYW55IHBhcmVudCB0cmFuc2xhdGlvbi4gQnV0
IGlmCj4geW91IG1lYW4gc3VwcG9ydGluZyBtdWx0aXBsZSBETUEgb2Zmc2V0cyBhbmQgbWFza3Mg
cGVyIGRldmljZSBpbiB0aGUKPiBETUEgQVBJLCB0aGVyZSdzIG5vdGhpbmcgaW4gdGhlIHdvcmtz
IHlldC4KClRoZXJlJ3MgYWxzbyB0aGUgaW4tYmV0d2VlbiBzdGVwIG9mIG1ha2luZyBvZl9kbWFf
Z2V0X3JhbmdlKCkgcmV0dXJuIGEgCnNpemUgYmFzZWQgb24gYWxsIHRoZSBkbWEtcmFuZ2VzIGVu
dHJpZXMgcmF0aGVyIHRoYW4gb25seSB0aGUgZmlyc3Qgb25lIAotIG90aGVyd2lzZSwgc29tZXRo
aW5nIGxpa2UgWzFdIGNhbiBsZWFkIHRvIHByZXR0eSB1bndvcmthYmxlIGRlZmF1bHQgCm1hc2tz
LiBXZSBpbXBsZW1lbnRlZCB0aGF0IHdoZW4gZG9pbmcgYWNwaV9kbWFfZ2V0X3JhbmdlKCksIGl0
J3MganVzdCAKdGhhdCB0aGUgT0YgY291bnRlcnBhcnQgbmV2ZXIgY2F1Z2h0IHVwLgoKUm9iaW4u
CgpbMV0gCmh0dHA6Ly9saW51eC1hcm0ub3JnL2dpdD9wPWxpbnV4LXJtLmdpdDthPWNvbW1pdGRp
ZmY7aD1hMjgxNGFmNTZiMzQ4NmMyOTg1YTk1NTQwYTg4ZDhmOWZhM2E2OTlmCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxp
c3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNr
dG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
