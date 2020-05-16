Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C0931D64A1
	for <lists+dri-devel@lfdr.de>; Sun, 17 May 2020 01:08:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E054F6E060;
	Sat, 16 May 2020 23:08:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1160A6E060;
 Sat, 16 May 2020 23:08:13 +0000 (UTC)
Received: from localhost (c-73-47-72-35.hsd1.nh.comcast.net [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id A20AE206F9;
 Sat, 16 May 2020 23:08:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1589670491;
 bh=aSDJYt65gfHwTP2ldHRow9dEQtOjPVrtphZuiHCOv+o=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Lp2MEMtfg1F7hSlTTWsT0/U06cieH89hqYRyiJX6PSkA2VCB92yBtD+eKPWMMxYuU
 fO+rHmXGcbez1FqhKZS9cSfijfPSp/W7CEyA6MC7e1i9xgf7E/glxoiLQp24ft7SOP
 B9FiTVUu+5i0kfjksRcPG62OaosFduiLT1l2ga9g=
Date: Sat, 16 May 2020 19:08:10 -0400
From: Sasha Levin <sashal@kernel.org>
To: Michel =?iso-8859-1?Q?D=E4nzer?= <michel@daenzer.net>
Subject: Re: [PATCH AUTOSEL 5.6 33/50] drm/amdgpu: bump version for
 invalidate L2 before SDMA IBs
Message-ID: <20200516230810.GH29995@sasha-vm>
References: <20200507142726.25751-1-sashal@kernel.org>
 <20200507142726.25751-33-sashal@kernel.org>
 <349b2cb9-71f9-a0cd-aceb-308512d7501a@daenzer.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <349b2cb9-71f9-a0cd-aceb-308512d7501a@daenzer.net>
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
Cc: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>,
 Marek =?utf-8?B?T2zFocOhaw==?= <marek.olsak@amd.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, Alex Deucher <alexander.deucher@amd.com>,
 stable@vger.kernel.org,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVGh1LCBNYXkgMDcsIDIwMjAgYXQgMDY6MTE6MTdQTSArMDIwMCwgTWljaGVsIETDpG56ZXIg
d3JvdGU6Cj5PbiAyMDIwLTA1LTA3IDQ6MjcgcC5tLiwgU2FzaGEgTGV2aW4gd3JvdGU6Cj4+IEZy
b206IE1hcmVrIE9sxaHDoWsgPG1hcmVrLm9sc2FrQGFtZC5jb20+Cj4+Cj4+IFsgVXBzdHJlYW0g
Y29tbWl0IDkwMTdhNDg5N2EyMDY1OGYwMTBiZWJlYTgyNTI2Mjk2M2MxMGFmYTYgXQo+Pgo+PiBU
aGlzIGZpeGVzIEdQVSBoYW5ncyBkdWUgdG8gY2FjaGUgY29oZXJlbmN5IGlzc3Vlcy4KPj4gQnVt
cCB0aGUgZHJpdmVyIHZlcnNpb24uIFNwbGl0IG91dCBmcm9tIHRoZSBvcmlnaW5hbCBwYXRjaC4K
Pj4KPj4gU2lnbmVkLW9mZi1ieTogTWFyZWsgT2zFocOhayA8bWFyZWsub2xzYWtAYW1kLmNvbT4K
Pj4gUmV2aWV3ZWQtYnk6IENocmlzdGlhbiBLw7ZuaWcgPGNocmlzdGlhbi5rb2VuaWdAYW1kLmNv
bT4KPj4gVGVzdGVkLWJ5OiBQaWVycmUtRXJpYyBQZWxsb3V4LVByYXllciA8cGllcnJlLWVyaWMu
cGVsbG91eC1wcmF5ZXJAYW1kLmNvbT4KPj4gU2lnbmVkLW9mZi1ieTogQWxleCBEZXVjaGVyIDxh
bGV4YW5kZXIuZGV1Y2hlckBhbWQuY29tPgo+PiBTaWduZWQtb2ZmLWJ5OiBTYXNoYSBMZXZpbiA8
c2FzaGFsQGtlcm5lbC5vcmc+Cj4+IC0tLQo+PiAgZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUv
YW1kZ3B1X2Rydi5jIHwgMyArKy0KPj4gIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyks
IDEgZGVsZXRpb24oLSkKPj4KPj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1k
Z3B1L2FtZGdwdV9kcnYuYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9kcnYu
Ywo+PiBpbmRleCA0MmY0ZmViZTI0YzZkLi44ZDQ1YTJiNjYyYWViIDEwMDY0NAo+PiAtLS0gYS9k
cml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfZHJ2LmMKPj4gKysrIGIvZHJpdmVycy9n
cHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2Rydi5jCj4+IEBAIC04NSw5ICs4NSwxMCBAQAo+PiAg
ICogLSAzLjM0LjAgLSBOb24tREMgY2FuIGZsaXAgY29ycmVjdGx5IGJldHdlZW4gYnVmZmVycyB3
aXRoIGRpZmZlcmVudCBwaXRjaGVzCj4+ICAgKiAtIDMuMzUuMCAtIEFkZCBkcm1fYW1kZ3B1X2lu
Zm9fZGV2aWNlOjp0Y2NfZGlzYWJsZWRfbWFzawo+PiAgICogLSAzLjM2LjAgLSBBbGxvdyByZWFk
aW5nIG1vcmUgc3RhdHVzIHJlZ2lzdGVycyBvbiBzaS9jaWsKPj4gKyAqIC0gMy4zNy4wIC0gTDIg
aXMgaW52YWxpZGF0ZWQgYmVmb3JlIFNETUEgSUJzLCBuZWVkZWQgZm9yIGNvcnJlY3RuZXNzCj4+
ICAgKi8KPj4gICNkZWZpbmUgS01TX0RSSVZFUl9NQUpPUgkzCj4+IC0jZGVmaW5lIEtNU19EUklW
RVJfTUlOT1IJMzYKPj4gKyNkZWZpbmUgS01TX0RSSVZFUl9NSU5PUgkzNwo+PiAgI2RlZmluZSBL
TVNfRFJJVkVSX1BBVENITEVWRUwJMAo+Pgo+PiAgaW50IGFtZGdwdV92cmFtX2xpbWl0ID0gMDsK
Pj4KPgo+VGhpcyByZXF1aXJlcyB0aGUgcGFyZW50IGNvbW1pdCBmZGY4MzY0NmMwNTQyZWNmYjlh
ZGM0ZGI4Zjc0MWExZjQzZGNhMDU4Cj4iZHJtL2FtZGdwdTogaW52YWxpZGF0ZSBMMiBiZWZvcmUg
U0RNQSBJQnMgKHYyKSIuIEtNU19EUklWRVJfTUlOT1IgaXMKPmJ1bXBlZCB0byBzaWduYWwgdG8g
dXNlcnNwYWNlIHRoZSBmaXggaW4gdGhhdCBjb21taXQgaXMgcHJlc2VudC4KCkkndmUgZ3JhYmJl
ZCB0aGUgY29tbWl0IHlvdSd2ZSBwb2ludGVkIG91dCBhcyB3ZWxsIGFzIGNlNzM1MTZkNDJjOQoo
ImRybS9hbWRncHU6IHNpbXBsaWZ5IHBhZGRpbmcgY2FsY3VsYXRpb25zICh2MikiKSB0byBtYWtl
IHRoZSBiYWNrcG9ydAphcHBseSBjbGVhbmx5LCB0aGFuayB5b3UhCgotLSAKVGhhbmtzLApTYXNo
YQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2
ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9s
aXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
