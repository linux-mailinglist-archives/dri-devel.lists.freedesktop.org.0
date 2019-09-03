Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FA98A7425
	for <lists+dri-devel@lfdr.de>; Tue,  3 Sep 2019 22:01:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5573789321;
	Tue,  3 Sep 2019 20:01:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E61C38931D;
 Tue,  3 Sep 2019 20:01:41 +0000 (UTC)
Received: from localhost (c-73-47-72-35.hsd1.nh.comcast.net [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 9A84821881;
 Tue,  3 Sep 2019 20:01:40 +0000 (UTC)
Date: Tue, 3 Sep 2019 16:01:39 -0400
From: Sasha Levin <sashal@kernel.org>
To: Greg KH <gregkh@linuxfoundation.org>
Subject: Re: [PATCH AUTOSEL 4.19 044/167] drm/amdgpu: validate user pitch
 alignment
Message-ID: <20190903200139.GJ5281@sasha-vm>
References: <20190903162519.7136-1-sashal@kernel.org>
 <20190903162519.7136-44-sashal@kernel.org>
 <7957107d-634f-4771-327e-99fdd5e6474e@daenzer.net>
 <20190903170347.GA24357@kroah.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190903170347.GA24357@kroah.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=kernel.org; s=default; t=1567540900;
 bh=8IoII2n9C/TCOkc678nbcBwVHhhtTdLM2AVpeiA6uaI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=l5SKO1WB6Tt9zijJa1tqc7RReLLGhR8WvGG0eq5XOUZ52tbbmNzgLVyNe5svU9CQd
 091vLYWKFeESf2N+GDEXSWANWJJBTfatlbv+/8w7AV+JOMZnTdCw3hSGWfQijUBY4y
 E30ECyBZYkC6HiikEzSXx34mtJs05AUj05QyNFmk=
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
Cc: Yu Zhao <yuzhao@google.com>,
 Michel =?iso-8859-1?Q?D=E4nzer?= <michel@daenzer.net>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, Alex Deucher <alexander.deucher@amd.com>,
 stable@vger.kernel.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCBTZXAgMDMsIDIwMTkgYXQgMDc6MDM6NDdQTSArMDIwMCwgR3JlZyBLSCB3cm90ZToK
Pk9uIFR1ZSwgU2VwIDAzLCAyMDE5IGF0IDA2OjQwOjQzUE0gKzAyMDAsIE1pY2hlbCBEw6RuemVy
IHdyb3RlOgo+PiBPbiAyMDE5LTA5LTAzIDY6MjMgcC5tLiwgU2FzaGEgTGV2aW4gd3JvdGU6Cj4+
ID4gRnJvbTogWXUgWmhhbyA8eXV6aGFvQGdvb2dsZS5jb20+Cj4+ID4KPj4gPiBbIFVwc3RyZWFt
IGNvbW1pdCA4OWYyM2I2ZWZlZjU1NDc2NjE3N2JmNTFhYTc1NGJjZTE0YzNlN2RhIF0KPj4KPj4g
SG9sZCB5b3VyIGhvcnNlcyEKPj4KPj4gVGhpcyBjb21taXQgYW5kIGM0YTMyYjI2NmRhN2JiNzAy
ZTYwMzgxY2EwYzM1ZWFkZGJjODlhNmMgaGFkIHRvIGJlCj4+IHJldmVydGVkLCBhcyB0aGV5IGNh
dXNlZCByZWdyZXNzaW9ucy4gU2VlIGNvbW1pdHMKPj4gMjVlYzQyOWU4NmJiNzkwZTQwMzg3YTU1
MGYwNTAxZDBhYzU1YTQ3YyAmCj4+IDkyYjA3MzBlYWYyZDU0OWZkZmIxMGVjYzhiNzFmMzRiOWY0
NzJjMTIgLgo+Pgo+Pgo+PiBUaGlzIGlzbid0IGJvbHN0ZXJpbmcgY29uZmlkZW5jZSBpbiBob3cg
dGhlc2UgcGF0Y2hlcyBhcmUgc2VsZWN0ZWQuLi4KPgo+VGhlIHBhdGNoIF9pdHNlbGZfIHNhaWQg
dG8gYmUgYmFja3BvcnRlZCB0byB0aGUgc3RhYmxlIHRyZWVzIGZyb20gNC4yCj5hbmQgbmV3ZXIu
ICBXaHkgd291bGRuJ3Qgd2UgYmUgY29uZmlkZW50IGluIGRvaW5nIHRoaXM/Cj4KPklmIHRoZSBw
YXRjaCBkb2Vzbid0IHdhbnQgdG8gYmUgYmFja3BvcnRlZCwgdGhlbiBkbyBub3QgYWRkIHRoZSBj
YzoKPnN0YWJsZSBsaW5lIHRvIGl0Li4uCgpUaGlzIHBhdGNoIHdhcyBwaWNrZWQgYmVjYXVzZSBp
dCBoYXMgYSBzdGFibGUgdGFnLCB3aGljaCB5b3UgcHJlc3VtYWJseQpzYXcgYXMgeW91ciBSZXZp
ZXdlZC1ieSB0YWcgaXMgaW4gdGhlIHBhdGNoLiBUaGlzIGlzIHdoeSBpdCB3YXMKYmFja3BvcnRl
ZDsgaXQgZG9lc24ndCB0YWtlIEFJIHRvIGJhY2twb3J0IHBhdGNoZXMgdGFnZ2VkIGZvciBzdGFi
bGUuLi4KClRoZSByZXZlcnQgb2YgdGhpcyBwYXRjaCwgaG93ZXZlcjoKCiAxLiBEaWRuJ3QgaGF2
ZSBhIHN0YWJsZSB0YWcuCiAyLiBEaWRuJ3QgaGF2ZSBhICJGaXhlczoiIHRhZy4KIDMuIERpZG4n
dCBoYXZlIHRoZSB1c3VhbCAidGhlIHJldmVydHMgY29tbWl0IC4uLiIgc3RyaW5nIGFkZGVkIGJ5
IGdpdAogd2hlbiBvbmUgZG9lcyBhIHJldmVydC4KCldoaWNoIGlzIHdoeSB3ZSBzdGlsbCBraWNr
IHBhdGNoZXMgZm9yIHJldmlldywgZXZlbiB0aG91Z2ggdGhleSBoYWQgYQpzdGFibGUgdGFnLCBq
dXN0IHNvIHBlb3BsZSBjb3VsZCB0YWtlIGEgbG9vayBhbmQgY29uZmlybSB3ZSdyZSBub3QKbWlz
c2luZyBhbnl0aGluZyAtIGxpa2Ugd2UgZGlkIGhlcmUuCgpJJ20gbm90IHN1cmUgd2hhdCB5b3Ug
ZXhwZWN0ZWQgbWUgdG8gZG8gZGlmZmVyZW50bHkgaGVyZS4KCi0tClRoYW5rcywKU2FzaGEKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1h
aWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
