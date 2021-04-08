Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BEC7357B57
	for <lists+dri-devel@lfdr.de>; Thu,  8 Apr 2021 06:26:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C02E66E140;
	Thu,  8 Apr 2021 04:26:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from rere.qmqm.pl (rere.qmqm.pl [91.227.64.183])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 99C586E140
 for <dri-devel@lists.freedesktop.org>; Thu,  8 Apr 2021 04:26:29 +0000 (UTC)
Received: from remote.user (localhost [127.0.0.1])
 by rere.qmqm.pl (Postfix) with ESMTPSA id 4FG7W803jgzCg;
 Thu,  8 Apr 2021 06:26:27 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=rere.qmqm.pl; s=1;
 t=1617855988; bh=qV2VpTLMpZWXRFCyeedYlxHbghdwLxGxZaqi0GEU1/4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=gTjlsVCAGkjaPoo/BbQcO77yNHYvuDMrpCkp/O6NBeZgBsq6ah90OKSkNjqJ1hCTH
 ZjnOizDiBu8ajTdySkdp8ZFxXAUBU5BiRLLsLYX4+mfU/A2Y21MPSYIuaUkWRbwkaf
 8HATHDnNusG77VQl20Gtk1A+9qu6MIexg0yHkP5aQdc8bIXAzsMfoAt0Mw+6ZYl5fp
 bIYLgFvuUXjgU7Z7cYBpOnZYz6hW0/eYpFkdFbwygs4GiUj0QxlaBJoiv4TTunDaZO
 niAb5JPbJNnPlu2ktgcwTWXb13RIVbV9d91XBklxSQ9fHdRa+m22ekvM3wUMdH2KOz
 F4KUvk0DviP0w==
X-Virus-Status: Clean
X-Virus-Scanned: clamav-milter 0.102.4 at mail
Date: Thu, 8 Apr 2021 06:25:31 +0200
From: =?iso-8859-2?Q?Micha=B3_Miros=B3aw?= <mirq-linux@rere.qmqm.pl>
To: Dmitry Osipenko <digetx@gmail.com>
Subject: Re: [PATCH v5 03/21] gpu: host1x: Show number of pending waiters in
 debugfs
Message-ID: <20210408042531.GC19244@qmqm.qmqm.pl>
References: <20210111130019.3515669-1-mperttunen@nvidia.com>
 <20210111130019.3515669-4-mperttunen@nvidia.com>
 <YFm/431gaaP6wY1A@orome.fritz.box>
 <1010683e-56c9-4b06-1540-d8c60a632c70@kapsi.fi>
 <20210401211949.GA25223@qmqm.qmqm.pl>
 <7636618d-72f7-ee0f-df23-1f2ec96973b4@gmail.com>
 <20210408041344.GB19244@qmqm.qmqm.pl>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210408041344.GB19244@qmqm.qmqm.pl>
User-Agent: Mutt/1.10.1 (2018-07-13)
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
 bhuntsman@nvidia.com, Thierry Reding <thierry.reding@gmail.com>,
 linux-tegra@vger.kernel.org, Mikko Perttunen <mperttunen@nvidia.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVGh1LCBBcHIgMDgsIDIwMjEgYXQgMDY6MTM6NDRBTSArMDIwMCwgTWljaGHFgiBNaXJvc8WC
YXcgd3JvdGU6Cj4gT24gRnJpLCBBcHIgMDIsIDIwMjEgYXQgMDc6MDI6MzJQTSArMDMwMCwgRG1p
dHJ5IE9zaXBlbmtvIHdyb3RlOgo+ID4gMDIuMDQuMjAyMSAwMDoxOSwgTWljaGHFgiBNaXJvc8WC
YXcg0L/QuNGI0LXRgjoKPiA+ID4gT24gRnJpLCBNYXIgMjYsIDIwMjEgYXQgMDQ6MzQ6MTNQTSAr
MDIwMCwgTWlra28gUGVydHR1bmVuIHdyb3RlOgo+ID4gPj4gT24gMy8yMy8yMSAxMjoxNiBQTSwg
VGhpZXJyeSBSZWRpbmcgd3JvdGU6Cj4gPiA+Pj4gT24gTW9uLCBKYW4gMTEsIDIwMjEgYXQgMDM6
MDA6MDFQTSArMDIwMCwgTWlra28gUGVydHR1bmVuIHdyb3RlOgo+ID4gPj4+PiBTaG93IHRoZSBu
dW1iZXIgb2YgcGVuZGluZyB3YWl0ZXJzIGluIHRoZSBkZWJ1Z2ZzIHN0YXR1cyBmaWxlLgo+ID4g
Pj4+PiBUaGlzIGlzIHVzZWZ1bCBmb3IgdGVzdGluZyB0byB2ZXJpZnkgdGhhdCB3YWl0ZXJzIGRv
IG5vdCBsZWFrCj4gPiA+Pj4+IG9yIGFjY3VtdWxhdGUgaW5jb3JyZWN0bHkuCj4gPiA+Pj4+Cj4g
PiA+Pj4+IFNpZ25lZC1vZmYtYnk6IE1pa2tvIFBlcnR0dW5lbiA8bXBlcnR0dW5lbkBudmlkaWEu
Y29tPgo+ID4gPj4+PiAtLS0KPiA+ID4+Pj4gICBkcml2ZXJzL2dwdS9ob3N0MXgvZGVidWcuYyB8
IDE0ICsrKysrKysrKysrLS0tCj4gPiA+Pj4+ICAgMSBmaWxlIGNoYW5nZWQsIDExIGluc2VydGlv
bnMoKyksIDMgZGVsZXRpb25zKC0pCj4gPiA+Pj4+Cj4gPiA+Pj4+IGRpZmYgLS1naXQgYS9kcml2
ZXJzL2dwdS9ob3N0MXgvZGVidWcuYyBiL2RyaXZlcnMvZ3B1L2hvc3QxeC9kZWJ1Zy5jCj4gPiA+
Pj4+IGluZGV4IDFiNDk5N2JkYTFjNy4uOGExNDg4MGM2MWJiIDEwMDY0NAo+ID4gPj4+PiAtLS0g
YS9kcml2ZXJzL2dwdS9ob3N0MXgvZGVidWcuYwo+ID4gPj4+PiArKysgYi9kcml2ZXJzL2dwdS9o
b3N0MXgvZGVidWcuYwo+ID4gPj4+PiBAQCAtNjksNiArNjksNyBAQCBzdGF0aWMgaW50IHNob3df
Y2hhbm5lbChzdHJ1Y3QgaG9zdDF4X2NoYW5uZWwgKmNoLCB2b2lkICpkYXRhLCBib29sIHNob3df
ZmlmbykKPiA+ID4+Pj4gICBzdGF0aWMgdm9pZCBzaG93X3N5bmNwdHMoc3RydWN0IGhvc3QxeCAq
bSwgc3RydWN0IG91dHB1dCAqbykKPiA+ID4+Pj4gICB7Cj4gPiA+Pj4+ICsJc3RydWN0IGxpc3Rf
aGVhZCAqcG9zOwo+ID4gPj4+PiAgIAl1bnNpZ25lZCBpbnQgaTsKPiA+ID4+Pj4gICAJaG9zdDF4
X2RlYnVnX291dHB1dChvLCAiLS0tLSBzeW5jcHRzIC0tLS1cbiIpOwo+ID4gPj4+PiBAQCAtNzYs
MTIgKzc3LDE5IEBAIHN0YXRpYyB2b2lkIHNob3dfc3luY3B0cyhzdHJ1Y3QgaG9zdDF4ICptLCBz
dHJ1Y3Qgb3V0cHV0ICpvKQo+ID4gPj4+PiAgIAlmb3IgKGkgPSAwOyBpIDwgaG9zdDF4X3N5bmNw
dF9uYl9wdHMobSk7IGkrKykgewo+ID4gPj4+PiAgIAkJdTMyIG1heCA9IGhvc3QxeF9zeW5jcHRf
cmVhZF9tYXgobS0+c3luY3B0ICsgaSk7Cj4gPiA+Pj4+ICAgCQl1MzIgbWluID0gaG9zdDF4X3N5
bmNwdF9sb2FkKG0tPnN5bmNwdCArIGkpOwo+ID4gPj4+PiArCQl1bnNpZ25lZCBpbnQgd2FpdGVy
cyA9IDA7Cj4gPiA+Pj4+IC0JCWlmICghbWluICYmICFtYXgpCj4gPiA+Pj4+ICsJCXNwaW5fbG9j
aygmbS0+c3luY3B0W2ldLmludHIubG9jayk7Cj4gPiA+Pj4+ICsJCWxpc3RfZm9yX2VhY2gocG9z
LCAmbS0+c3luY3B0W2ldLmludHIud2FpdF9oZWFkKQo+ID4gPj4+PiArCQkJd2FpdGVycysrOwo+
ID4gPj4+PiArCQlzcGluX3VubG9jaygmbS0+c3luY3B0W2ldLmludHIubG9jayk7Cj4gPiA+Pj4K
PiA+ID4+PiBXb3VsZCBpdCBtYWtlIHNlbnNlIHRvIGtlZXAgYSBydW5uaW5nIGNvdW50IHNvIHRo
YXQgd2UgZG9uJ3QgaGF2ZSB0bwo+ID4gPj4+IGNvbXB1dGUgaXQgaGVyZT8KPiA+ID4+Cj4gPiA+
PiBDb25zaWRlcmluZyB0aGlzIGlzIGp1c3QgYSBkZWJ1ZyBmYWNpbGl0eSwgSSB0aGluayBJIHBy
ZWZlciBub3QgYWRkaW5nIGEgbmV3Cj4gPiA+PiBmaWVsZCBqdXN0IGZvciBpdC4KPiA+ID4gCj4g
PiA+IFRoaXMgbG9va3MgbGlrZSBJUlEtZGlzYWJsZWQgcmVnaW9uLCBzbyB1bmxlc3Mgb25seSBy
b290IGNhbiB0cmlnZ2VyCj4gPiA+IHRoaXMgY29kZSwgbWF5YmUgdGhlIGFkZGl0aW9uYWwgZmll
bGQgY291bGQgc2F2ZSBhIHBvdGVudGlhbCBoZWFkYWNoZT8KPiA+ID4gSG93IG1hbnkgd2FpdGVy
cyBjYW4gdGhlcmUgYmUgaW4gdGhlIHdvcnN0IGNhc2U/Cj4gPiAKPiA+IFRoZSBob3N0MXgncyBJ
UlEgaGFuZGxlciBydW5zIGluIGEgd29ya3F1ZXVlLCBzbyBpdCBzaG91bGQgYmUgb2theS4KPiAK
PiBXaHksIHRoZW4sIHRoaXMgdXNlcyBhIHNwaW5sb2NrIChhbmQgaXQgaGFzICdpbnRyJyBpbiBp
dHMgbmFtZSk/CgpUaGUgY3JpdGljYWwgc2VjdGlvbnMgYXJlIGFscmVhZHkgTyhuKSBpbiBudW1i
ZXIgb2Ygd2FpdGVycywgc28gdGhpcwpwYXRjaCBkb2Vzbid0IG1ha2UgdGhpbmdzIHdvcnNlIGFz
IEkgcHJldmlvdXNseSB0aG91Z2h0LiBUaGUgcXVlc3Rpb25zCnJlbWFpbjogV2hhdCBpcyB0aGUg
ZXhwZWN0ZWQgbnVtYmVyIGFuZCB1cHBlciBib3VuZCBvZiB3b3JrZXJzPwpTaG91bGRuJ3QgdGhp
cyBiZSBhIG11dGV4IGluc3RlYWQ/CgpCZXN0IFJlZ2FyZHMKTWljaGHFgiBNaXJvc8WCYXcKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1h
aWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
