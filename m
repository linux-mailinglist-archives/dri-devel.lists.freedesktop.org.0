Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CDA352B435
	for <lists+dri-devel@lfdr.de>; Mon, 27 May 2019 14:05:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2F3AD89CBE;
	Mon, 27 May 2019 12:04:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 2125 seconds by postgrey-1.36 at gabe;
 Sun, 26 May 2019 23:03:11 UTC
Received: from imap1.codethink.co.uk (imap1.codethink.co.uk [176.9.8.82])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C0D84897F9
 for <dri-devel@lists.freedesktop.org>; Sun, 26 May 2019 23:03:11 +0000 (UTC)
Received: from x4db76deb.dyn.telefonica.de ([77.183.109.235] helo=[10.0.95.2])
 by imap1.codethink.co.uk with esmtpsa (Exim 4.84_2 #1 (Debian))
 id 1hV1cF-0004F7-V8; Sun, 26 May 2019 23:27:44 +0100
Subject: Re: [PATCH] drm/tegra: fix warning PTR_ERR_OR_ZERO can be used
To: Hariprasad Kelam <hariprasad.kelam@gmail.com>,
 Thierry Reding <thierry.reding@gmail.com>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, Jonathan Hunter <jonathanh@nvidia.com>,
 dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20190525070353.GA6727@hari-Inspiron-1545>
From: Ben Dooks <ben.dooks@codethink.co.uk>
Organization: Codethink Limited.
Message-ID: <7446cd38-71c5-284d-8a9a-b5ac6865bf35@codethink.co.uk>
Date: Sun, 26 May 2019 23:27:43 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190525070353.GA6727@hari-Inspiron-1545>
Content-Language: en-GB
X-Mailman-Approved-At: Mon, 27 May 2019 12:03:54 +0000
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMjUvMDUvMjAxOSAwODowMywgSGFyaXByYXNhZCBLZWxhbSB3cm90ZToKPiBmaXggYmVsb3cg
d2FybmluZ3MgcmVwb3J0ZWQgYnkgY29jY2ljaGVjawo+IAo+IC9kcml2ZXJzL2dwdS9kcm0vdGVn
cmEvZHJtLmM6NTA5OjEtMzogV0FSTklORzogUFRSX0VSUl9PUl9aRVJPIGNhbiBiZQo+IHVzZWQK
PiAuL2RyaXZlcnMvZ3B1L2RybS90ZWdyYS9nZW0uYzo0MTk6MS0zOiBXQVJOSU5HOiBQVFJfRVJS
X09SX1pFUk8gY2FuIGJlCj4gdXNlZAoKSSdkIHNheSB0aGUgY29jY2ljaGVjayBzaG91bGQgc2F5
ICJJbXByb3ZlbWVudDoiIGhlcmUsIGl0J3Mgbm90CnNvbWV0aGluZyB3cm9uZywganVzdCBjb2Rl
IHRoYXQgaGFzIGEgYmV0dGVyIGNhbGwgYXZhaWxhYmxlLgoKLS0gCkJlbiBEb29rcwkJCQlodHRw
Oi8vd3d3LmNvZGV0aGluay5jby51ay8KU2VuaW9yIEVuZ2luZWVyCQkJCUNvZGV0aGluayAtIFBy
b3ZpZGluZyBHZW5pdXMKCmh0dHBzOi8vd3d3LmNvZGV0aGluay5jby51ay9wcml2YWN5Lmh0bWwK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
