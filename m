Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 77726B36D1
	for <lists+dri-devel@lfdr.de>; Mon, 16 Sep 2019 11:06:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E89EF6E181;
	Mon, 16 Sep 2019 09:06:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 713866E181
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Sep 2019 09:06:24 +0000 (UTC)
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 16 Sep 2019 02:06:23 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,512,1559545200"; d="scan'208";a="361466380"
Received: from shbuild999.sh.intel.com (HELO localhost) ([10.239.147.113])
 by orsmga005.jf.intel.com with ESMTP; 16 Sep 2019 02:06:21 -0700
Date: Mon, 16 Sep 2019 17:06:52 +0800
From: Feng Tang <feng.tang@intel.com>
To: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [LKP] [drm/mgag200] 90f479ae51: vm-scalability.median -18.8%
 regression
Message-ID: <20190916090652.GK5541@shbuild999.sh.intel.com>
References: <20190813093616.GA65475@shbuild999.sh.intel.com>
 <64d41701-55a4-e526-17ae-8936de4bc1ef@suse.de>
 <20190824051605.GA63850@shbuild999.sh.intel.com>
 <1b897bfe-fd40-3ae3-d867-424d1fc08c44@suse.de>
 <d114b0b6-6b64-406e-6c3f-a8b8d5502413@intel.com>
 <44029e80-ba00-8246-dec0-fda122d53f5e@suse.de>
 <90e78ce8-d46a-5154-c324-a05aa1743c98@intel.com>
 <2e1b4d65-d477-f571-845d-fa0a670859af@suse.de>
 <20190904062716.GC5541@shbuild999.sh.intel.com>
 <6806e973-4cf7-bcac-54b4-4fac21698ece@suse.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <6806e973-4cf7-bcac-54b4-4fac21698ece@suse.de>
User-Agent: Mutt/1.5.24 (2015-08-30)
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
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Rong Chen <rong.a.chen@intel.com>,
 michel@daenzer.net, linux-kernel@vger.kernel.org,
 dri-devel <dri-devel@lists.freedesktop.org>, lkp@01.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgVGhvbWFzLAoKT24gTW9uLCBTZXAgMDksIDIwMTkgYXQgMDQ6MTI6MzdQTSArMDIwMCwgVGhv
bWFzIFppbW1lcm1hbm4gd3JvdGU6Cj4gSGkKPiAKPiBBbSAwNC4wOS4xOSB1bSAwODoyNyBzY2hy
aWViIEZlbmcgVGFuZzoKPiA+IEhpIFRob21hcywKPiA+IAo+ID4gT24gV2VkLCBBdWcgMjgsIDIw
MTkgYXQgMTI6NTE6NDBQTSArMDIwMCwgVGhvbWFzIFppbW1lcm1hbm4gd3JvdGU6Cj4gPj4gSGkK
PiA+Pgo+ID4+IEFtIDI4LjA4LjE5IHVtIDExOjM3IHNjaHJpZWIgUm9uZyBDaGVuOgo+ID4+PiBI
aSBUaG9tYXMsCj4gPj4+Cj4gPj4+IE9uIDgvMjgvMTkgMToxNiBBTSwgVGhvbWFzIFppbW1lcm1h
bm4gd3JvdGU6Cj4gPj4+PiBIaQo+ID4+Pj4KPiA+Pj4+IEFtIDI3LjA4LjE5IHVtIDE0OjMzIHNj
aHJpZWIgQ2hlbiwgUm9uZyBBOgo+ID4+Pj4+IEJvdGggcGF0Y2hlcyBoYXZlIGxpdHRsZSBpbXBh
Y3Qgb24gdGhlIHBlcmZvcm1hbmNlIGZyb20gb3VyIHNpZGUuCj4gPj4+PiBUaGFua3MgZm9yIHRl
c3RpbmcuIFRvbyBiYWQgdGhleSBkb2Vzbid0IHNvbHZlIHRoZSBpc3N1ZS4KPiA+Pj4+Cj4gPj4+
PiBUaGVyZSdzIGFub3RoZXIgcGF0Y2ggYXR0YWNoZWQuIENvdWxkIHlvdSBwbGVhc2UgdGVzdHMg
dGhpcyBhcyB3ZWxsPwo+ID4+Pj4gVGhhbmtzIGEgbG90IQo+ID4+Pj4KPiA+Pj4+IFRoZSBwYXRj
aCBjb21lcyBmcm9tIERhbmllbCBWZXR0ZXIgYWZ0ZXIgZGlzY3Vzc2luZyB0aGUgcHJvYmxlbSBv
biBJUkMuCj4gPj4+PiBUaGUgaWRlYSBvZiB0aGUgcGF0Y2ggaXMgdGhhdCB0aGUgb2xkIG1nYWcy
MDAgY29kZSBtaWdodCBkaXNwbGF5IG11Y2gKPiA+Pj4+IGxlc3MgZnJhbWVzIHRoYXQgdGhlIGdl
bmVyaWMgY29kZSwgYmVjYXVzZSBtZ2FnMjAwIG9ubHkgcHJpbnRzIGZyb20KPiA+Pj4+IG5vbi1h
dG9taWMgY29udGV4dC4gSWYgd2Ugc2ltdWxhdGUgdGhpcyB3aXRoIHRoZSBnZW5lcmljIGNvZGUs
IHdlIHNob3VsZAo+ID4+Pj4gc2VlIHJvdWdobHkgdGhlIG9yaWdpbmFsIHBlcmZvcm1hbmNlLgo+
ID4+Pj4KPiA+Pj4+Cj4gPj4+Cj4gPj4+IEl0J3MgY29vbCwgdGhlIHBhdGNoICJ1c2VjYW5zbGVl
cC5wYXRjaCIgY2FuIGZpeCB0aGUgaXNzdWUuCj4gPj4KPiA+PiBUaGFuayB5b3UgZm9yIHRlc3Rp
bmcuIEJ1dCBkb24ndCBnZXQgdG9vIGV4Y2l0ZWQsIGJlY2F1c2UgdGhlIHBhdGNoCj4gPj4gc2lt
dWxhdGVzIGEgYnVnIHRoYXQgd2FzIHByZXNlbnQgaW4gdGhlIG9yaWdpbmFsIG1nYWcyMDAgY29k
ZS4gQQo+ID4+IHNpZ25pZmljYW50IG51bWJlciBvZiBmcmFtZXMgYXJlIHNpbXBseSBza2lwcGVk
LiBUaGF0IGlzIGFwcGFyZW50bHkgdGhlCj4gPj4gcmVhc29uIHdoeSBpdCdzIGZhc3Rlci4KPiA+
IAo+ID4gVGhhbmtzIGZvciB0aGUgZGV0YWlsZWQgaW5mbywgc28gdGhlIG9yaWdpbmFsIGNvZGUg
c2tpcHMgdGltZS1jb25zdW1pbmcKPiA+IHdvcmsgaW5zaWRlIGF0b21pYyBjb250ZXh0IG9uIHB1
cnBvc2UuIElzIHRoZXJlIGFueSBzcGFjZSB0byBvcHRtaXNlIGl0Pwo+ID4gSWYgMiBzY2hlZHVs
ZWQgdXBkYXRlIHdvcmtlciBhcmUgaGFuZGxlZCBhdCBhbG1vc3Qgc2FtZSB0aW1lLCBjYW4gb25l
IGJlCj4gPiBza2lwcGVkPwo+IAo+IFdlIGRpc2N1c3NlZCBpZGVhcyBvbiBJUkMgYW5kIGRlY2lk
ZWQgdGhhdCBzY3JlZW4gdXBkYXRlcyBjb3VsZCBiZQo+IHN5bmNocm9uaXplZCB3aXRoIHZibGFu
ayBpbnRlcnZhbHMuIFRoaXMgbWF5IGdpdmUgc29tZSByYXRlIGxpbWl0aW5nIHRvCj4gdGhlIG91
dHB1dC4KPiAKPiBJZiB5b3UgbGlrZSwgeW91IGNvdWxkIHRyeSB0aGUgcGF0Y2ggc2V0IGF0IFsx
XS4gSXQgYWRkcyB0aGUgcmVzcGVjdGl2ZQo+IGNvZGUgdG8gY29uc29sZSBhbmQgbWdhZzIwMC4K
CkkganVzdCB0cmllZCB0aGUgMiBwYXRjaGVzLCBubyBvYnZpb3VzIGNoYW5nZSAoY29tcGFyaW5n
IHRvIHRoZQoxOC44JSByZWdyZXNzaW9uKSwgYm90aCBpbiBvdmVyYWxsIGJlbmNobWFyayBhbmQg
bWljcm8tcHJvZmlsaW5nLgoKOTBmNDc5YWU1MWFmYTQ1ZSAwNGEwOTgzMDk1ZmVhZWUwMjJjZGQ2
NWUzZTQgCi0tLS0tLS0tLS0tLS0tLS0gLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tIAogICAg
IDM3MjM2IMKxICAzJSAgICAgICsyLjUlICAgICAgMzgxNjcgwrEgIDMlICB2bS1zY2FsYWJpbGl0
eS5tZWRpYW4KICAgICAgMC4xNSDCsSAyNCUgICAgIC0yNS4xJSAgICAgICAwLjExIMKxIDIzJSAg
dm0tc2NhbGFiaWxpdHkubWVkaWFuX3N0ZGRldgogICAgICAwLjE1IMKxIDIzJSAgICAgLTI1LjEl
ICAgICAgIDAuMTEgwrEgMjIlICB2bS1zY2FsYWJpbGl0eS5zdGRkZXYKICAxMjc2NzMxOCDCsSAg
NCUgICAgICArMi41JSAgIDEzMDg5MTc3IMKxICAzJSAgdm0tc2NhbGFiaWxpdHkudGhyb3VnaHB1
dAogClRoYW5rcywKRmVuZwoKPiAKPiBCZXN0IHJlZ2FyZHMKPiBUaG9tYXMKPiAKPiBbMV0KPiBo
dHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9hcmNoaXZlcy9kcmktZGV2ZWwvMjAxOS1TZXB0
ZW1iZXIvMjM0ODUwLmh0bWwKPiAKPiA+IAo+ID4gVGhhbmtzLAo+ID4gRmVuZwo+ID4gCj4gPj4K
PiA+PiBCZXN0IHJlZ2FyZHMKPiA+PiBUaG9tYXMKPiAKPiAtLSAKPiBUaG9tYXMgWmltbWVybWFu
bgo+IEdyYXBoaWNzIERyaXZlciBEZXZlbG9wZXIKPiBTVVNFIExpbnV4IEdtYkgsIE1heGZlbGRz
dHJhc3NlIDUsIDkwNDA5IE51ZXJuYmVyZywgR2VybWFueQo+IEdGOiBGZWxpeCBJbWVuZMO2cmZm
ZXIsIE1hcnkgSGlnZ2lucywgU3JpIFJhc2lhaAo+IEhSQiAyMTI4NCAoQUcgTsO8cm5iZXJnKQo+
IAoKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmkt
ZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6
Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
