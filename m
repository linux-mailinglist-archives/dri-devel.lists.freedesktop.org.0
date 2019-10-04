Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 67F3ECCB3C
	for <lists+dri-devel@lfdr.de>; Sat,  5 Oct 2019 18:38:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C35746E3B7;
	Sat,  5 Oct 2019 16:37:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from lb3-smtp-cloud7.xs4all.net (lb3-smtp-cloud7.xs4all.net
 [194.109.24.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1BC4C6E0DE
 for <dri-devel@lists.freedesktop.org>; Fri,  4 Oct 2019 08:48:49 +0000 (UTC)
Received: from [192.168.2.10] ([46.9.232.237])
 by smtp-cloud7.xs4all.net with ESMTPA
 id GJGWivNPfjZ8vGJGZisjho; Fri, 04 Oct 2019 10:48:48 +0200
Subject: Re: [PATCH v7 7/9] drm: tegra: use cec_notifier_conn_(un)register
To: Thierry Reding <thierry.reding@gmail.com>
References: <20190814104520.6001-1-darekm@google.com>
 <20190814104520.6001-8-darekm@google.com>
 <f0e99db8-3329-f272-e139-a7c713f200ea@xs4all.nl> <20190828093820.GE2917@ulmo>
 <2eed5ed3-85f3-4c19-4dd2-3d8432829c2a@xs4all.nl>
 <20190828115400.GA30919@ulmo>
From: Hans Verkuil <hverkuil-cisco@xs4all.nl>
Message-ID: <3f7fe51a-8958-a425-f5fd-01df5301d6b2@xs4all.nl>
Date: Fri, 4 Oct 2019 10:48:43 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20190828115400.GA30919@ulmo>
Content-Language: en-US
X-CMAE-Envelope: MS4wfIxtuyQfDELsyaEhapLOQeAHB7QAyJDRd8x05tHFxVJYMlGGvg5VX//j//cdR+KvdtarwKYhD4NRQrssc7yvwEN+yiyuBiFa1CRULA1iQjqwTHvN9hvg
 I3h+Lc4e/ODHchCGAjVhlQiBPgmXfPjyrxWPVPkSccYG25LXhbEas0Absg1gU4QIMKA1fToOk/oIBRS9HNPQEZGQdVoCO8h4pm2Xlz46TM5lW+FGDYiz/gtD
 Ik86LXISf6CXkM3zrizPiGxwMptBjrwicNmd0Z3bMYwDMA/En4sAM5C9qrf8xlPOgYyql4jDscGeIEd7tm4xZZmeoe2wOd8UOod3rpaxRP7/Z0ijvbz7a9zL
 07DbcgRhu0f2J2Kt07CcgmLOZsCoErFmfK8UiqUCD9mVagvcegJYrdC8Xq4mhjrff1Gi+yt/brLuGMC54uNBvPLP55UHVBLM4NT2BmxTy6356tuWvPM=
X-Mailman-Approved-At: Sat, 05 Oct 2019 16:37:30 +0000
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
Cc: David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Jonathan Hunter <jonathanh@nvidia.com>,
 linux-tegra@vger.kernel.org, Dariusz Marcinkiewicz <darekm@google.com>,
 linux-media@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgVGhpZXJyeSwKCkp1c3QgYSByZW1pbmRlcjogdGhpcyBwYXRjaCBoYXNuJ3QgYmVlbiBtZXJn
ZWQgeWV0IGZvciB2NS41LgoKVGhhbmtzIQoKCUhhbnMKCk9uIDgvMjgvMTkgMTo1NCBQTSwgVGhp
ZXJyeSBSZWRpbmcgd3JvdGU6Cj4gT24gV2VkLCBBdWcgMjgsIDIwMTkgYXQgMTI6MDY6MzRQTSAr
MDIwMCwgSGFucyBWZXJrdWlsIHdyb3RlOgo+PiBPbiA4LzI4LzE5IDExOjM4IEFNLCBUaGllcnJ5
IFJlZGluZyB3cm90ZToKPj4+IE9uIFdlZCwgQXVnIDI4LCAyMDE5IGF0IDEwOjA5OjMwQU0gKzAy
MDAsIEhhbnMgVmVya3VpbCB3cm90ZToKPj4+PiBUaGllcnJ5LAo+Pj4+Cj4+Pj4gQ2FuIHlvdSBy
ZXZpZXcgdGhpcyBwYXRjaD8KPj4+Pgo+Pj4+IFRoYW5rcyEKPj4+Pgo+Pj4+IAlIYW5zCj4+Pgo+
Pj4gRGlkIHlvdSB3YW50IG1lIHRvIHBpY2sgdGhpcyB1cCBpbnRvIHRoZSBkcm0vdGVncmEgdHJl
ZT8gT3IgZG8geW91IHdhbnQKPj4+IHRvIHBpY2sgaXQgdXAgaW50byB5b3VyIHRyZWU/Cj4+Cj4+
IENhbiB5b3UgcGljayBpdCB1cCBmb3IgdGhlIG5leHQgY3ljbGU/IEFzIHlvdSBtZW50aW9uZWQs
IHdlIG1pc3NlZCB0aGUKPj4gZGVhZGxpbmUgZm9yIDUuNCwgc28gdGhpcyBmZWF0dXJlIHdvbid0
IGJlIGVuYWJsZWQgaW4gdGhlIHB1YmxpYyBDRUMgQVBJCj4+IHVudGlsIDUuNS4KPj4KPj4gVGhh
bmtzIQo+IAo+IFN1cmUsIHdpbGwgZG8uCj4gCj4gVGhpZXJyeQo+IAoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApk
cmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Au
b3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
