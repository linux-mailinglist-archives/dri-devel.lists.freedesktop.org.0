Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ED915A81DE
	for <lists+dri-devel@lfdr.de>; Wed,  4 Sep 2019 14:08:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 789B58945A;
	Wed,  4 Sep 2019 12:08:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 57F57893AB;
 Wed,  4 Sep 2019 12:08:25 +0000 (UTC)
Received: from localhost (c-73-47-72-35.hsd1.nh.comcast.net [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id E189922CED;
 Wed,  4 Sep 2019 12:08:24 +0000 (UTC)
Date: Wed, 4 Sep 2019 08:08:23 -0400
From: Sasha Levin <sashal@kernel.org>
To: Michel =?iso-8859-1?Q?D=E4nzer?= <michel@daenzer.net>
Subject: Re: [PATCH AUTOSEL 4.19 044/167] drm/amdgpu: validate user pitch
 alignment
Message-ID: <20190904120823.GW5281@sasha-vm>
References: <20190903162519.7136-1-sashal@kernel.org>
 <20190903162519.7136-44-sashal@kernel.org>
 <7957107d-634f-4771-327e-99fdd5e6474e@daenzer.net>
 <20190903170347.GA24357@kroah.com> <20190903200139.GJ5281@sasha-vm>
 <CAKMK7uFpBnkF4xABdkDMZ8TYhL4jg6ZuGyHGyVeBxc9rkyUtXQ@mail.gmail.com>
 <829c5912-cf80-81d0-7400-d01d286861fc@daenzer.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <829c5912-cf80-81d0-7400-d01d286861fc@daenzer.net>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=kernel.org; s=default; t=1567598905;
 bh=QbYO5xJQGT1Uu94hWScBCp6qWdp8GydhSptk7yOPeHE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=HLOwcXn29+BdSWFL3qKDpEDbLdF51Ww2YAF6klsvOok5k1oQ1Lee8fRjgoP40Z3hD
 XXrM2fR7PuHQwR72a2MJS+DqWYtl7VMLoDnalEiQgicy4dE8KYwGP7ehYl2uyJ/Dva
 xKoaEHfjepJkgmsXpJhskZPwPDGL0hrKIhAaKrZY=
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
Cc: Yu Zhao <yuzhao@google.com>, Dave Airlie <airlied@linux.ie>,
 Greg KH <gregkh@linuxfoundation.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Alex Deucher <alexander.deucher@amd.com>, stable <stable@vger.kernel.org>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCBTZXAgMDQsIDIwMTkgYXQgMTA6NTU6MTBBTSArMDIwMCwgTWljaGVsIETDpG56ZXIg
d3JvdGU6Cj5PbiAyMDE5LTA5LTAzIDEwOjE2IHAubS4sIERhbmllbCBWZXR0ZXIgd3JvdGU6Cj4+
IE9uIFR1ZSwgU2VwIDMsIDIwMTkgYXQgMTA6MDEgUE0gU2FzaGEgTGV2aW4gPHNhc2hhbEBrZXJu
ZWwub3JnPiB3cm90ZToKPj4+IE9uIFR1ZSwgU2VwIDAzLCAyMDE5IGF0IDA3OjAzOjQ3UE0gKzAy
MDAsIEdyZWcgS0ggd3JvdGU6Cj4+Pj4gT24gVHVlLCBTZXAgMDMsIDIwMTkgYXQgMDY6NDA6NDNQ
TSArMDIwMCwgTWljaGVsIETDpG56ZXIgd3JvdGU6Cj4+Pj4+IE9uIDIwMTktMDktMDMgNjoyMyBw
Lm0uLCBTYXNoYSBMZXZpbiB3cm90ZToKPj4+Pj4+IEZyb206IFl1IFpoYW8gPHl1emhhb0Bnb29n
bGUuY29tPgo+Pj4+Pj4KPj4+Pj4+IFsgVXBzdHJlYW0gY29tbWl0IDg5ZjIzYjZlZmVmNTU0NzY2
MTc3YmY1MWFhNzU0YmNlMTRjM2U3ZGEgXQo+Pj4+Pgo+Pj4+PiBIb2xkIHlvdXIgaG9yc2VzIQo+
Pj4+Pgo+Pj4+PiBUaGlzIGNvbW1pdCBhbmQgYzRhMzJiMjY2ZGE3YmI3MDJlNjAzODFjYTBjMzVl
YWRkYmM4OWE2YyBoYWQgdG8gYmUKPj4+Pj4gcmV2ZXJ0ZWQsIGFzIHRoZXkgY2F1c2VkIHJlZ3Jl
c3Npb25zLiBTZWUgY29tbWl0cwo+Pj4+PiAyNWVjNDI5ZTg2YmI3OTBlNDAzODdhNTUwZjA1MDFk
MGFjNTVhNDdjICYKPj4+Pj4gOTJiMDczMGVhZjJkNTQ5ZmRmYjEwZWNjOGI3MWYzNGI5ZjQ3MmMx
MiAuCj4+Pj4+Cj4+Pj4+Cj4+Pj4+IFRoaXMgaXNuJ3QgYm9sc3RlcmluZyBjb25maWRlbmNlIGlu
IGhvdyB0aGVzZSBwYXRjaGVzIGFyZSBzZWxlY3RlZC4uLgo+Pj4+Cj4+Pj4gVGhlIHBhdGNoIF9p
dHNlbGZfIHNhaWQgdG8gYmUgYmFja3BvcnRlZCB0byB0aGUgc3RhYmxlIHRyZWVzIGZyb20gNC4y
Cj4+Pj4gYW5kIG5ld2VyLiAgV2h5IHdvdWxkbid0IHdlIGJlIGNvbmZpZGVudCBpbiBkb2luZyB0
aGlzPwo+Pj4+Cj4+Pj4gSWYgdGhlIHBhdGNoIGRvZXNuJ3Qgd2FudCB0byBiZSBiYWNrcG9ydGVk
LCB0aGVuIGRvIG5vdCBhZGQgdGhlIGNjOgo+Pj4+IHN0YWJsZSBsaW5lIHRvIGl0Li4uCj4+Pgo+
Pj4gVGhpcyBwYXRjaCB3YXMgcGlja2VkIGJlY2F1c2UgaXQgaGFzIGEgc3RhYmxlIHRhZywgd2hp
Y2ggeW91IHByZXN1bWFibHkKPj4+IHNhdyBhcyB5b3VyIFJldmlld2VkLWJ5IHRhZyBpcyBpbiB0
aGUgcGF0Y2guIFRoaXMgaXMgd2h5IGl0IHdhcwo+Pj4gYmFja3BvcnRlZDsgaXQgZG9lc24ndCB0
YWtlIEFJIHRvIGJhY2twb3J0IHBhdGNoZXMgdGFnZ2VkIGZvciBzdGFibGUuLi4KPgo+VGhlIHBh
dGNoZXMgZGlkIHBvaW50IHRvIGdhcHMgaW4gdmFsaWRhdGlvbiBvZiBpb2N0bCBwYXJhbWV0ZXJz
IHBhc3NlZAo+aW4gYnkgdXNlcnNwYWNlLiBVbmZvcnR1bmF0ZWx5LCB0aGV5IHR1cm5lZCBvdXQg
dG8gYmUgdG9vIHN0cmljdCwKPmNhdXNpbmcgdmFsaWQgcGFyYW1ldGVycyB0byBzcHVyaW91c2x5
IGZhaWwuIElmIHRoYXQgd2Fzbid0IHRoZSBjYXNlLAo+YW5kIHRoZSBwYXRjaGVzIGRpZG4ndCBo
YXZlIHN0YWJsZSB0YWdzLCBtYXliZSB3ZSdkIGJlIGhhdmluZyBhCj5kaXNjdXNzaW9uIGFib3V0
IHdoeSB0aGV5IGRpZG4ndCBoYXZlIHRoZSB0YWdzIG5vdy4uLgoKVGhhdCdzIGZhaXIsIGFuZCB3
ZSdyZSBkZWZpbml0ZWx5IG5vdCBjb21wbGFpbmluZyB0aGF0IHRoZXNlIHBhdGNoZXMgaGFkCmEg
c3RhYmxlIHRhZywgbXkgY29tbWVudCB3YXMgZGlyZWN0ZWQgbW9yZSB0b3dhcmRzIHRoZSAiVGhp
cyBpc24ndApib2xzdGVyaW5nIGNvbmZpZGVuY2UgaW4gaG93IHRoZXNlIHBhdGNoZXMgYXJlIHNl
bGVjdGVkIiBjb21tZW50IHlvdSd2ZQptYWRlIC0gd2UgYmFzaWNhbGx5IGRpZCB3aGF0IHdlIHdl
cmUgdG9sZCB0byBkbyBhbmQgZm9yIHNvbWUgcmVhc29uIHlvdQpnb3QgdXBzZXQgOikKCj4+PiBU
aGUgcmV2ZXJ0IG9mIHRoaXMgcGF0Y2gsIGhvd2V2ZXI6Cj4+Pgo+Pj4gIDEuIERpZG4ndCBoYXZl
IGEgc3RhYmxlIHRhZy4KPgo+SSBndWVzcyBpdCBkaWRuJ3Qgb2NjdXIgdG8gbWUgdGhhdCB3YXMg
bmVjZXNzYXJ5LCBhcyB0aGUgcGF0Y2hlcyBnb3QKPnJldmVydGVkIHdpdGhpbiBkYXlzLgoKU2lu
Y2UgdGhlIG9yaWdpbmFsIHN0YWJsZSB0YWdnZWQgcGF0Y2ggbWFkZSBpdCB1cHN0cmVhbSwgd2Un
cmUgYm91bmQgdG8KdHJ5IGFuZCBzZWxlY3QgaXQgZm9yIHN0YWJsZSBicmFuY2hlcyBldmVuIGlm
IHRoZXJlIGFyZSBtb3JlIGNoYW5nZXMgb3IKcmV2ZXJ0cyBsYXRlciBvbi4gV2UnbGwgdHJ5IHRv
IGRldGVjdCBmdXJ0aGVyIGZpeGVzIGFuZCByZXZlcnRzLCBidXQKd2UncmUgbGltaXRlZCBieSB0
aGUgbWV0YWRhdGEgaW4gdGhlIGNvbW1pdCBtZXNzYWdlLgoKPj4+ICAyLiBEaWRuJ3QgaGF2ZSBh
ICJGaXhlczoiIHRhZy4KPj4+ICAzLiBEaWRuJ3QgaGF2ZSB0aGUgdXN1YWwgInRoZSByZXZlcnRz
IGNvbW1pdCAuLi4iIHN0cmluZyBhZGRlZCBieSBnaXQKPj4+ICB3aGVuIG9uZSBkb2VzIGEgcmV2
ZXJ0Lgo+Cj5JIHN1c3BlY3QgdGhhdCdzIGJlY2F1c2UgdGhlcmUgd2VyZSBubyBzdGFibGUgY29t
bWl0IGhhc2hlcyB0bwo+cmVmZXJlbmNlLCBzZWUgYmVsb3cuCj4KPgo+Pj4gV2hpY2ggaXMgd2h5
IHdlIHN0aWxsIGtpY2sgcGF0Y2hlcyBmb3IgcmV2aWV3LCBldmVuIHRob3VnaCB0aGV5IGhhZCBh
Cj4+PiBzdGFibGUgdGFnLCBqdXN0IHNvIHBlb3BsZSBjb3VsZCB0YWtlIGEgbG9vayBhbmQgY29u
ZmlybSB3ZSdyZSBub3QKPj4+IG1pc3NpbmcgYW55dGhpbmcgLSBsaWtlIHdlIGRpZCBoZXJlLgo+
Pj4KPj4+IEknbSBub3Qgc3VyZSB3aGF0IHlvdSBleHBlY3RlZCBtZSB0byBkbyBkaWZmZXJlbnRs
eSBoZXJlLgo+Cj5ZZWFoLCBzb3JyeSwgSSBkaWRuJ3QgcmVhbGl6ZSBpdCdzIHRyaWNreSBmb3Ig
c2NyaXB0cyB0byByZWNvZ25pemUgdGhhdAo+dGhlIHBhdGNoZXMgaGF2ZSBiZWVuIHJldmVydGVk
IGluIHRoaXMgY2FzZS4KCkZXSVcsIEkndmUgYWRkZWQgYW5vdGhlciB0ZXN0IHRvIG15IHNjcmlw
dHMgdG8gdHJ5IGFuZCBjYXRjaCB0aGVzZSBjYXNlcwooUmV2ZXJ0ICIlcyIpLiBJdCdsbCBzbG93
IGRvd24gdGhlIHNjcmlwdHMgYSBiaXQgYnV0IGl0J3MgYmV0dGVyIHRvIGdldAppdCByaWdodCBy
YXRoZXIgdGhhbiB0byBiZSBkb25lIHF1aWNrbHkgOikKCi0tClRoYW5rcywKU2FzaGEKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxp
bmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
