Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DEC6F116D3D
	for <lists+dri-devel@lfdr.de>; Mon,  9 Dec 2019 13:41:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 99AED6E444;
	Mon,  9 Dec 2019 12:41:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ACEA16E0F2
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Dec 2019 12:41:13 +0000 (UTC)
Received: from [192.168.0.20]
 (cpc89242-aztw30-2-0-cust488.18-1.cable.virginm.net [86.31.129.233])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id AC9A999A;
 Mon,  9 Dec 2019 13:41:11 +0100 (CET)
Subject: Re: [PATCH] drm: rcar-du: Add r8a77980 support
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Simon Horman <horms@verge.net.au>
References: <20190911192502.16609-1-kieran.bingham+renesas@ideasonboard.com>
 <70b94265-69f3-d18f-1b67-b5b814723b1b@cogentembedded.com>
 <20190913082129.lvusbp6pbcayqh5r@verge.net.au>
 <20190913090359.GC29992@pendragon.ideasonboard.com>
From: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Organization: Ideas on Board
Message-ID: <2eeacacc-f190-4ba8-32bc-b4103b41db46@ideasonboard.com>
Date: Mon, 9 Dec 2019 12:41:07 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20190913090359.GC29992@pendragon.ideasonboard.com>
Content-Language: en-GB
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=ideasonboard.com; s=mail; t=1575895272;
 bh=SAO/vEIF0AkAocfwMFfJweTH8L4Mt/spRBvCuhoZkcw=;
 h=Reply-To:Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=fC8xVlvLbCZxuee1qs5HEhUvtOZqwMZClk9VfGR9d9fnEQc8c0dj99DbJ/ldauPFz
 mSmxLr8APOk9hIamWgqTbF0WRGodNuPmKGtRpYHKHe1BzkLQKhxsbEHPCMNXsQhaeF
 k320u2eXvnAWkMOzrLIqW9kly1S8TnzgheelBVgo=
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
Reply-To: kieran.bingham+renesas@ideasonboard.com
Cc: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>,
 David Airlie <airlied@linux.ie>, open list <linux-kernel@vger.kernel.org>,
 "open list:DRM DRIVERS FOR RENESAS" <dri-devel@lists.freedesktop.org>,
 linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgTGF1cmVudCwKCk9uIDEzLzA5LzIwMTkgMTA6MDMsIExhdXJlbnQgUGluY2hhcnQgd3JvdGU6
Cj4gSGVsbG8sCj4gCj4gT24gRnJpLCBTZXAgMTMsIDIwMTkgYXQgMTA6MjE6MjlBTSArMDIwMCwg
U2ltb24gSG9ybWFuIHdyb3RlOgo+PiBPbiBUaHUsIFNlcCAxMiwgMjAxOSBhdCAwMTowMDo0MVBN
ICswMzAwLCBTZXJnZWkgU2h0eWx5b3Ygd3JvdGU6Cj4+PiBPbiAxMS4wOS4yMDE5IDIyOjI1LCBL
aWVyYW4gQmluZ2hhbSB3cm90ZToKPj4+Cj4+Pj4gQWRkIGRpcmVjdCBzdXBwb3J0IGZvciB0aGUg
cjhhNzc5ODAgKFYzSCkuCj4+Pj4KPj4+PiBUaGUgVjNIIHNoYXJlcyBhIGNvbW1vbiwgY29tcGF0
aWJsZSBjb25maWd1cmF0aW9uIHdpdGggdGhlIHI4YTc3OTcwCj4+Pj4gKFYzTSkgc28gdGhhdCBk
ZXZpY2UgaW5mbyBzdHJ1Y3R1cmUgaXMgcmV1c2VkLgo+Pj4KPj4+ICAgIERvIHdlIHJlYWxseSBu
ZWVkIHRvIGFkZCB5ZXQgYW5vdGhlciBjb21wYXRpYmxlIGluIHRoaXMgY2FzZT8KPj4+IEkganVz
dCBhZGRlZCByOGE3Nzk3MCB0byB0aGUgY29tcGF0aWJsZSBwcm9wIGluIHRoZSByOGE3Nzk4MCBE
VC4gVGhhdCdzIHdoeQo+Pj4gYSBwYXRjaCBsaWtlIHRoaXMgb25lIGRpZG4ndCBnZXQgcG9zdGVk
IGJ5IG1lLgo+Pgo+PiBUaGUgcmVhc29uIGZvciBoYXZpbmcgcGVyLVNvQyBjb21wYXQgc3RyaW5n
cyBpcyB0aGF0IHRoZSBJUCBibG9ja3MKPj4gYXJlIG5vdCB2ZXJzaW9uZWQgYW5kIHdoaWxlIHdl
IGNhbiBvYnNlcnZlIHRoYXQgdGhlcmUgYXJlIHNpbWlsYXJpdGllcwo+PiBiZXR3ZWVuLCBmLmUu
IHRoZSBEVSBvbiB0aGUgcjhhNzc5NzAgYW5kIHI4YTc3OTgwLCB3ZSBjYW4ndCBiZSBjZXJ0YWlu
IHRoYXQKPj4gZGlmZmVyZW5jZXMgbWF5IG5vdCBlbWVyZ2UgYXQgc29tZSBwb2ludC4gQnkgaGF2
aW5nIHBlci1Tb0MgY29tcGF0IHN0cmluZ3MKPj4gd2UgaGF2ZSB0aGUgZmxleGliaWxpdHkgZm9y
IHRoZSBkcml2ZXIgdG8gYWRkcmVzcyBhbnkgc3VjaCBkaWZmZXJlbmNlcyBhcwo+PiB0aGUgbmVl
ZCBhcmlzZXMuCj4+Cj4+IE15IHJlY29sbGVjdGlvbiBpcyB0aGF0IHRoaXMgc2NoZW1lIGhhcyBi
ZWVuIGFkb3B0ZWQgZm9yIG5vbi12ZXJzaW9uZWQKPj4gUmVuZXNhcyBJUCBibG9ja3Mgc2luY2Ug
SnVuZSAyMDE1IGFuZCB1c2VzIG9mIHRoaXMgc2NoZW1lIHdlbGwgYmVmb3JlIHRoYXQuCj4gCj4g
U3VyZSwgYnV0IHdlIGNvdWxkIHVzZQo+IAo+IAljb21wYXRpYmxlID0gInJlbmVzYXMsZHUtcjhh
Nzc5ODAiLCAicmVuZXNhcyxkdS1yOGE3Nzk3MCI7Cj4gCj4gaW4gRFQgd2l0aG91dCB1cGRhdGlu
ZyB0aGUgZHJpdmVyLiBJZiB0aGUgcjhhNzc5ODAgdHVybnMgb3V0IHRvIGJlCj4gZGlmZmVyZW50
LCB3ZSdsbCB0aGVuIHVwZGF0ZSB0aGUgZHJpdmVyIHdpdGhvdXQgYSBuZWVkIHRvIG1vZGlmeSBE
VC4gSSdtCj4gZmluZSBlaXRoZXIgd2F5LCBzbwo+IAo+IFJldmlld2VkLWJ5OiBMYXVyZW50IFBp
bmNoYXJ0IDxsYXVyZW50LnBpbmNoYXJ0QGlkZWFzb25ib2FyZC5jb20+CgoKVGhhbmtzLAoKVGhp
cyBwYXRjaCBoYXMgYW4gUkIgdGFnIGZyb20geW91LCBhbmQgU2ltb24sIGJ1dCBhbGFzIEkgZG9u
J3QgYmVsaWV2ZQppdCBoYXMgYmVlbiBwaWNrZWQgdXAgaW4geW91ciBkcm0vZHUvbmV4dCBicmFu
Y2guCgpJcyB0aGlzIHBhdGNoIGFjY2VwdGFibGU/IE9yIGRvIEkgbmVlZCB0byByZXBvc3Q/Cgot
LQpLaWVyYW4KCgo+IAo+Pj4+IFNpZ25lZC1vZmYtYnk6IEtpZXJhbiBCaW5naGFtIDxraWVyYW4u
YmluZ2hhbStyZW5lc2FzQGlkZWFzb25ib2FyZC5jb20+Cj4+Cj4+IFJldmlld2VkLWJ5OiBTaW1v
biBIb3JtYW4gPGhvcm1zK3JlbmVzYXNAdmVyZ2UubmV0LmF1Pgo+IAoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApk
cmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Au
b3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
