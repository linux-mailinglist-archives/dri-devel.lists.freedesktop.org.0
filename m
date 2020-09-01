Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A70D7259928
	for <lists+dri-devel@lfdr.de>; Tue,  1 Sep 2020 18:37:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A4ADB6E88B;
	Tue,  1 Sep 2020 16:37:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from merlin.infradead.org (merlin.infradead.org
 [IPv6:2001:8b0:10b:1231::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0D0756E85E
 for <dri-devel@lists.freedesktop.org>; Tue,  1 Sep 2020 15:06:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=merlin.20170209; h=Content-Transfer-Encoding:Content-Type:
 In-Reply-To:MIME-Version:Date:Message-ID:From:References:To:Subject:Sender:
 Reply-To:Cc:Content-ID:Content-Description;
 bh=tss5M/CgWtNHrn8kN3neH2rNWYnxcMFrfLkwrH1qZaA=; b=yraft6TribLHwkrXJ7oKDtJRbK
 cOoSth/ZTysdAmjuNC9rchtYeF0z+4F1RM8ZSndjz2v5LMkusAM9mIEOSPtOBEwb0PrM+xXx7Ea7l
 /ikF7LoG7gYahgDVNW4fpo5YAAYo7+GSKX3Kj5LrIdLfBohdGxGfIZnJ7e4SMWbdBgoLHEIW8Tgf+
 njRXFLID+gofXGqnwhgAGdxbeaCAz+DaJh+I7tc9ACsUsCsauw+lX1T/rK1szN+XezzxnPVRwgJmj
 cElkLQkrY4Cp0YxyEUGpaWUKkF76V0isaghz3YuqDIfij7YJSYYX6sQuqof0yxOOvFOlXTjYKms7X
 VU1axofA==;
Received: from [2601:1c0:6280:3f0:897c:6038:c71d:ecac]
 by merlin.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kD7rf-0005MS-Oa; Tue, 01 Sep 2020 15:06:28 +0000
Subject: Re: [PATCH] dma-buf: fix kernel-doc warning in dma-fence.c
To: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 linux-kernel@vger.kernel.org, Gustavo Padovan <gustavo@padovan.org>,
 dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org
References: <20200831041713.12571-1-rdunlap@infradead.org>
 <81dc0a34-90f6-401a-f846-924fdff4aaff@amd.com>
 <20200901133200.GE2352366@phenom.ffwll.local>
 <d057988a-7ba4-7e3b-1c36-e40e9a5a8d9a@amd.com>
From: Randy Dunlap <rdunlap@infradead.org>
Message-ID: <e15d8d9b-3988-191d-f9c0-6e5c3efe7485@infradead.org>
Date: Tue, 1 Sep 2020 08:06:22 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <d057988a-7ba4-7e3b-1c36-e40e9a5a8d9a@amd.com>
Content-Language: en-US
X-Mailman-Approved-At: Tue, 01 Sep 2020 16:37:23 +0000
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gOS8xLzIwIDY6MzcgQU0sIENocmlzdGlhbiBLw7ZuaWcgd3JvdGU6Cj4gQW0gMDEuMDkuMjAg
dW0gMTU6MzIgc2NocmllYiBEYW5pZWwgVmV0dGVyOgo+PiBPbiBNb24sIEF1ZyAzMSwgMjAyMCBh
dCAxMjowMjowM1BNICswMjAwLCBDaHJpc3RpYW4gS8O2bmlnIHdyb3RlOgo+Pj4gQW0gMzEuMDgu
MjAgdW0gMDY6MTcgc2NocmllYiBSYW5keSBEdW5sYXA6Cj4+Pj4gQWRkIEBjb29raWUgdG8gZG1h
X2ZlbmNlX2VuZF9zaWduYWxsaW5nKCkgdG8gcHJldmVudCBrZXJuZWwtZG9jCj4+Pj4gd2Fybmlu
ZyBpbiBkcml2ZXJzL2RtYS1idWYvZG1hLWZlbmNlLmM6Cj4+Pj4KPj4+PiAuLi9kcml2ZXJzL2Rt
YS1idWYvZG1hLWZlbmNlLmM6MjkxOiB3YXJuaW5nOiBGdW5jdGlvbiBwYXJhbWV0ZXIgb3IgbWVt
YmVyICdjb29raWUnIG5vdCBkZXNjcmliZWQgaW4gJ2RtYV9mZW5jZV9lbmRfc2lnbmFsbGluZycK
Pj4+Pgo+Pj4+IFNpZ25lZC1vZmYtYnk6IFJhbmR5IER1bmxhcCA8cmR1bmxhcEBpbmZyYWRlYWQu
b3JnPgo+Pj4+IENjOiBTdW1pdCBTZW13YWwgPHN1bWl0LnNlbXdhbEBsaW5hcm8ub3JnPgo+Pj4+
IENjOiBHdXN0YXZvIFBhZG92YW4gPGd1c3Rhdm9AcGFkb3Zhbi5vcmc+Cj4+Pj4gQ2M6IENocmlz
dGlhbiBLw7ZuaWcgPGNocmlzdGlhbi5rb2VuaWdAYW1kLmNvbT4KPj4+PiBDYzogbGludXgtbWVk
aWFAdmdlci5rZXJuZWwub3JnCj4+Pj4gQ2M6IGRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5v
cmcKPj4+IEFja2VkLWJ5OiBDaHJpc3RpYW4gS8O2bmlnIDxjaHJpc3RpYW4ua29lbmlnQGFtZC5j
b20+Cj4+IFdpbGwgeW91IG1lcmdlIHRoZXNlIHR3byB0byBkcm0tbWlzYy1maXhlcyBvciBzaG91
bGQgc29tZW9uZSBlbHNlPwo+IAo+IEkgd2FzIHdvbmRlcmluZyB0aGUgc2FtZSB0aGluZyBhbmQg
anVzdCB3YWl0aW5nIGZvciBSYW5keSB0byByZXBseSB3aXRoIHBsZWFzZSBwaWNrIHRoZW0gdXAg
b3IgSSdtIGdvaW5nIHRvIHB1c2ggdGhlbSBiZWNhdXNlIEkgaGF2ZSBjb21taXQgYWNjZXNzLgoK
SSBkaWRuJ3QgcmVhbGl6ZSB0aGF0IHdhcyBuZWVkZWQsIGJ1dCBhbnl3YXksIENocmlzdGlhbiwg
cGxlYXNlIGFwcGx5IHRoZXNlIDIKZG1hLWJ1ZiBrZXJuZWwtZG9jIHBhdGNoZXMuCgp0aGFua3Mu
Cgo+IFJlZ2FyZHMsCj4gQ2hyaXN0aWFuLgo+IAo+Pgo+PiBBbHdheXMgYSBiaXQgY29uZnVzaW5n
IHdoZW4gbWFpbnRhaW5lcnMgcmVwbHkgd2l0aCBhY2tzL3ItYiBidXQgbm90IHdoYXQKPj4gdGhl
eSdsbCBkbyB3aXRoIHRoZSBwYXRjaCA6LSkKCkFncmVlZC4KCj4+IENoZWVycywgRGFuaWVsCj4+
Cj4+Pj4gLS0tCj4+Pj4gwqDCoCBkcml2ZXJzL2RtYS1idWYvZG1hLWZlbmNlLmMgfMKgwqDCoCAx
ICsKPj4+PiDCoMKgIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKQo+Pj4+Cj4+Pj4gLS0t
IGxueC01OS1yYzMub3JpZy9kcml2ZXJzL2RtYS1idWYvZG1hLWZlbmNlLmMKPj4+PiArKysgbG54
LTU5LXJjMy9kcml2ZXJzL2RtYS1idWYvZG1hLWZlbmNlLmMKPj4+PiBAQCAtMjgzLDYgKzI4Myw3
IEBAIEVYUE9SVF9TWU1CT0woZG1hX2ZlbmNlX2JlZ2luX3NpZ25hbGxpbmcKPj4+PiDCoMKgIC8q
Kgo+Pj4+IMKgwqDCoCAqIGRtYV9mZW5jZV9lbmRfc2lnbmFsbGluZyAtIGVuZCBhIGNyaXRpY2Fs
IERNQSBmZW5jZSBzaWduYWxsaW5nIHNlY3Rpb24KPj4+PiArICogQGNvb2tpZTogb3BhcXVlIGNv
b2tpZSBmcm9tIGRtYV9mZW5jZV9iZWdpbl9zaWduYWxsaW5nKCkKPj4+PiDCoMKgwqAgKgo+Pj4+
IMKgwqDCoCAqIENsb3NlcyBhIGNyaXRpY2FsIHNlY3Rpb24gYW5ub3RhdGlvbiBvcGVuZWQgYnkg
ZG1hX2ZlbmNlX2JlZ2luX3NpZ25hbGxpbmcoKS4KPj4+PiDCoMKgwqAgKi8KPj4+IF9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCj4+PiBkcmktZGV2ZWwgbWFp
bGluZyBsaXN0Cj4+PiBkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCgoKLS0gCn5SYW5k
eQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRl
dmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8v
bGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
