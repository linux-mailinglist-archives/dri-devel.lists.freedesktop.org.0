Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 18A5956419
	for <lists+dri-devel@lfdr.de>; Wed, 26 Jun 2019 10:12:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 584606E2DD;
	Wed, 26 Jun 2019 08:12:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from lb3-smtp-cloud9.xs4all.net (lb3-smtp-cloud9.xs4all.net
 [194.109.24.30])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3A95F6E151
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Jun 2019 15:28:00 +0000 (UTC)
Received: from [IPv6:2001:420:44c1:2579:b032:593c:25fc:ff9b]
 ([IPv6:2001:420:44c1:2579:b032:593c:25fc:ff9b])
 by smtp-cloud9.xs4all.net with ESMTPA
 id fnMPhRB6WSfvXfnMThHxET; Tue, 25 Jun 2019 17:27:58 +0200
Subject: Re: [PATCHv9 04/13] cec: expose the new connector info API
To: Dariusz Marcinkiewicz <darekm@google.com>
References: <20190625144510.122214-1-hverkuil-cisco@xs4all.nl>
 <20190625144510.122214-5-hverkuil-cisco@xs4all.nl>
 <CALFZZQFH4Hr4NW6U9D9RhPSAnDGDkd_C83yXyn2A1CgPOTJqkw@mail.gmail.com>
From: Hans Verkuil <hverkuil-cisco@xs4all.nl>
Message-ID: <157b6cee-b0a6-3ca4-edd2-629374ecf508@xs4all.nl>
Date: Tue, 25 Jun 2019 17:27:52 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.5.1
MIME-Version: 1.0
In-Reply-To: <CALFZZQFH4Hr4NW6U9D9RhPSAnDGDkd_C83yXyn2A1CgPOTJqkw@mail.gmail.com>
Content-Language: en-US
X-CMAE-Envelope: MS4wfGX8u4thUeIZOm25MGNaUjluiYenQw0xgQw2eSkNgP0Ph2wd/YrmllBBP44/3+Mz/6FxGRT3EV1+Km0/BK5Y3Foh1x3uliNhHrX4KtDKDfIuCij2FL5q
 Musw+t3VDzpmhTgW8kmfRuibD5tAHZ/6lLZkE82yi9TYpheTx/n8Dz3xSMRHKt1EneT1xo8En/LVX+SPL/lS1R/J2uz8U7RgaecBaMW9m4XSb1/xdQ7tHOY6
 JKbs6SAGsYOySvsu5NSXY9OJz4He7y1ByqJSyci1wK4OxOCKuOVjmiP7cIbxPipIjBFAnuq2qVth3VPlVh9xOLj/sHkZhQkMFQV40EsjSmpSLTXMZBSuSYth
 61jPy3Mu3cZuKwYE71mcP1PE32zUENcPHnm536Ms68PlVqyv23Y=
X-Mailman-Approved-At: Wed, 26 Jun 2019 08:12:13 +0000
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
Cc: Cheng-yi Chiang <cychiang@chromium.org>, dri-devel@lists.freedesktop.org,
 linux-media@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gNi8yNS8xOSA0OjU4IFBNLCBEYXJpdXN6IE1hcmNpbmtpZXdpY3ogd3JvdGU6Cj4gSGkgYWdh
aW4uCj4gT24gVHVlLCBKdW4gMjUsIDIwMTkgYXQgNDo0NSBQTSBIYW5zIFZlcmt1aWwgPGh2ZXJr
dWlsLWNpc2NvQHhzNGFsbC5ubD4gd3JvdGU6Cj4+Cj4+ICsgICAgICAgbXV0ZXhfbG9jaygmYWRh
cC0+bG9jayk7Cj4+ICsgICAgICAgaWYgKGNvcHlfdG9fdXNlcihwYXJnLCAmYWRhcC0+Y29ubl9p
bmZvLCBzaXplb2YoYWRhcC0+Y29ubl9pbmZvKSkpCj4+ICsgICAgICAgICAgICAgICByZXQgPSAt
RUZBVUxUOwo+PiArICAgICAgIG11dGV4X3VubG9jaygmYWRhcC0+bG9jayk7Cj4+ICsgICAgICAg
cmV0dXJuIHJldDsKPj4gK30KPiBTaG91bGRuJ3QgdGhlIGxvY2sgYmUgcmVsZWFzZWQgYmVmb3Jl
IGNhbGxpbmcgY29weV90b191c2VyPyBJIGd1ZXNzCj4geW91IG5lZWQgdG8gbWFrZSBhbiBleHRy
YSBjb3B5IG9mIHRoZSBjb25uX2luZm8sIGxpa2UgaXQgaXMgZG9uZSBmb3IKPiBvdGhlciBpb2N0
bHMuCgpUaGVyZSBpcyBubyByZWFzb24gZm9yIGRvaW5nIHRoYXQsIGl0IHdvdWxkIGp1c3QgdXNl
IGFkZGl0aW9uYWwgc3RhY2sKc3BhY2UuCgpSZWdhcmRzLAoKCUhhbnMKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApk
cmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Au
b3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
