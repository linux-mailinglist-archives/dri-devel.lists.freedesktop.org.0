Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 48E092A5C4
	for <lists+dri-devel@lfdr.de>; Sat, 25 May 2019 19:19:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A49848982A;
	Sat, 25 May 2019 17:19:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk4.altibox.net (asavdk4.altibox.net [109.247.116.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6CA538982A;
 Sat, 25 May 2019 17:19:32 +0000 (UTC)
Received: from ravnborg.org (unknown [158.248.194.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk4.altibox.net (Postfix) with ESMTPS id 3EF86803C0;
 Sat, 25 May 2019 19:19:30 +0200 (CEST)
Date: Sat, 25 May 2019 19:19:28 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: Re: [PATCH 00/33] fbcon notifier begone!
Message-ID: <20190525171928.GA13526@ravnborg.org>
References: <20190524085354.27411-1-daniel.vetter@ffwll.ch>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190524085354.27411-1-daniel.vetter@ffwll.ch>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=VcLZwmh9 c=1 sm=1 tr=0
 a=UWs3HLbX/2nnQ3s7vZ42gw==:117 a=UWs3HLbX/2nnQ3s7vZ42gw==:17
 a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=kj9zAlcOel0A:10 a=7gkXJVJtAAAA:8
 a=ZE5gt9_PBDywe7APGxUA:9 a=FsULZnL4HXkDZy8N:21 a=dmQ2iDlEpyUWv4jE:21
 a=CjuIK1q_8ugA:10 a=E9Po1WZjFZOl8hwRPBS3:22
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
Cc: Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 LKML <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgRGFuaWVsLgoKR29vZCB3b3JrLCBuaWNlIGNsZWFudXAgYWxsIG92ZXIuCgpBIGZldyBjb21t
ZW50cyB0byBhIGZldyBwYXRjaGVzIC0gbm90IHNvbWV0aGluZyB0aGF0IHdhcnJhbnQgYQpuZXcg
c2VyaWVzIHRvIGJlIHBvc3RlZCBhcyBsb25nIGFzIGl0IGlzIGZpeGVkIGJlZm9yZSB0aGUgcGF0
Y2hlcyBhcmUKYXBwbGllZC4KCgo+IGJ0dyBmb3IgZnV0dXJlIHBsYW5zOiBJIHRoaW5rIHRoaXMg
aXMgdHJpY2t5IGVub3VnaCAoaXQncyBvbGQgY29kZSBhbmQgYWxsCj4gdGhhdCkgdGhhdCB3ZSBz
aG91bGQgbGV0IHRoaXMgc29hayBmb3IgMi0zIGtlcm5lbCByZWxlYXNlcy4gSSB0aGluayB0aGUK
PiBmb2xsb3dpbmcgd291bGQgYmUgbmljZSBzdWJzZXF1ZW50IGNsZWFudXAvZml4ZXM6Cj4gCj4g
LSBwdXNoIHRoZSBjb25zb2xlIGxvY2sgY29tcGxldGVseSBmcm9tIGZibWVtLmMgdG8gZmJjb24u
Yy4gSSB0aGluayB3ZSdyZQo+ICAgbW9zdGx5IHRoZXJlIHdpdGggcHJlcCwgYnV0IG5lZWRzIHRv
IHBvbmRlcmluZyBvZiBjb3JuZXIgY2FzZXMuCkkgd29uZGVyIC0gc2hvdWxkIHRoaXMgY29kZSBj
b25zaXN0ZW50bHkgdXNlIF9fYWNxdWlyZSgpIGV0YyBzbyB3ZSBjb3VsZApnZXQgYSBsaXR0bGUg
c3RhdGljIGFuYWx5c2lzIGhlbHAgZm9yIHRoZSBsb2NraW5nPwoKSSBoYXZlIG5vdCBwbGF5ZWQg
d2l0aCB0aGlzIGZvciBzZXZlcmFsIHllYXJzIGFuZCBJIGRvIG5vdCBrbm93IHRoZQptYXR1cml0
eSBvZiB0aGlzIHRvZGF5LgoKPiAtIG1vdmUgZmJjb24uYyBmcm9tIHVzaW5nIGluZGljZXMgZm9y
IHRyYWNraW5nIGZiX2luZm8gKGFuZCBhY2Nlc3NpbmcKPiAgIHJlZ2lzdGVyZWRfZmJzIHdpdGhv
dXQgcHJvcGVyIGxvY2tpbmcgYWxsIHRoZSB0aW1lKSB0byByZWFsIGZiX2luZm8KPiAgIHBvaW50
ZXJzIHdpdGggdGhlIHJpZ2h0IGFtb3VudCBvZiByZWZjb3VudGluZy4gTW9zdGx5IG1vdGl2YXRl
ZCBieSB0aGUKPiAgIGZ1biBJIGhhZCB0cnlpbmcgdG8gc2ltcGxpZnkgZmJjb25fZXhpdCgpLgo+
IAo+IC0gbWFrZSBzdXJlIHRoYXQgZmJjb24gY2FsbCBsb2NrL3VubG9ja19mYiB3aGVuIGl0IGNh
bGxzIGZibWVtLmMKPiAgIGZ1bmN0aW9ucywgYW5kIHNwcmlua2xlIGFzc2VydF9sb2NrZGVwX2hl
bGQgYXJvdW5kIGluIGZibWVtLmMuIFRoaXMKPiAgIG5lZWRzIHRoZSBjb25zb2xlX2xvY2sgY2xl
YW51cHMgZmlyc3QuCj4gCj4gQnV0IEkgdGhpbmsgdGhhdCdzIG1hdGVyaWFsIGZvciBtYXliZSBu
ZXh0IHllYXIgb3Igc28uCk9yIG1heWJlIGFmdGVyIG5leHQga2VybmVsIHJlbGVhc2UuCkNvdWxk
IHdlIHB1dCB0aGlzIG5pY2UgcGxhbiBpbnRvIHRvZG8ucnN0IG9yIHNpbWlsYXIgc28gd2UgZG8g
bm90IGhhdmUKdG8gaHVudCBpdCBkb3duIGJ5IGFza2luZyBnb29nbGU/CgpGb3IgdGhlIHdob2xl
IHNlcmllcyB5b3UgY2FuIGFkZCBteToKUmV2aWV3ZWQtYnk6IFNhbSBSYXZuYm9yZyA8c2FtQHJh
dm5ib3JnLm9yZz4KClNvbWUgcGFydHMgYXJlIHJldmlld2VkIGFzICJ0aGlzIGxvb2tzIGVudGly
ZWx5IGNvcnJlY3QiLCBvdGhlciBwYXJ0cwpJIHdvdWxkIGNsYWltIHRoYXQgSSBhY3R1YWxseSB1
bmRlcnN0b29kLgpBbmQgYWZ0ZXIgaGF2aW5nIHNwZW5kIHNvbWUgaG91cnMgb24gdGhpcyBhIHIt
YiBzZWVtcyBpbiBvcmRlci4KCglTYW0KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGlu
Zm8vZHJpLWRldmVs
