Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B7603307EC6
	for <lists+dri-devel@lfdr.de>; Thu, 28 Jan 2021 20:44:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 37E006E9F6;
	Thu, 28 Jan 2021 19:44:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id C94136E0F5;
 Thu, 28 Jan 2021 10:01:52 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A6BA11042;
 Thu, 28 Jan 2021 02:01:51 -0800 (PST)
Received: from [10.57.11.243] (unknown [10.57.11.243])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id E779B3F766;
 Thu, 28 Jan 2021 02:01:49 -0800 (PST)
Subject: Re: [PATCH] drm/lima: add governor data with pre-defined thresholds
To: Christian Hewitt <christianshewitt@gmail.com>
References: <20210125081804.13016-1-christianshewitt@gmail.com>
 <9e30a8e1-ef69-5929-17f1-cdb603686495@arm.com>
 <88ae6467-07fc-2c4e-9db9-a02a00d01347@arm.com>
 <08B992A3-6A8C-4585-8B0D-EE0DA6C5F4E2@gmail.com>
From: Lukasz Luba <lukasz.luba@arm.com>
Message-ID: <3b38b9ce-e93e-5850-5321-e2208927c36c@arm.com>
Date: Thu, 28 Jan 2021 10:01:47 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <08B992A3-6A8C-4585-8B0D-EE0DA6C5F4E2@gmail.com>
Content-Language: en-US
X-Mailman-Approved-At: Thu, 28 Jan 2021 19:44:35 +0000
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
Cc: lima@lists.freedesktop.org, David Airlie <airlied@linux.ie>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Steven Price <steven.price@arm.com>, Qiang Yu <yuq825@gmail.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

CgpPbiAxLzI3LzIxIDc6MzUgUE0sIENocmlzdGlhbiBIZXdpdHQgd3JvdGU6Cj4gCj4+IE9uIDI3
IEphbiAyMDIxLCBhdCAzOjExIHBtLCBMdWthc3ogTHViYSA8bHVrYXN6Lmx1YmFAYXJtLmNvbT4g
d3JvdGU6Cj4+Cj4+IE9uIDEvMjcvMjEgMTA6MjQgQU0sIEx1a2FzeiBMdWJhIHdyb3RlOgo+Pj4g
SGkgQ2hyaXN0aWFuLAo+Pj4gT24gMS8yNS8yMSA4OjE4IEFNLCBDaHJpc3RpYW4gSGV3aXR0IHdy
b3RlOgo+Pj4+IFRoaXMgcGF0Y2ggYWRhcHRzIHRoZSBwYW5mcm9zdCBwcmUtZGVmaW5lZCB0aHJl
c2hvbGRzIGNoYW5nZSBbMF0gdG8gdGhlCj4+Pj4gbGltYSBkcml2ZXIgdG8gaW1wcm92ZSByZWFs
LXdvcmxkIHBlcmZvcm1hbmNlLiBUaGUgdXB0aHJlc2hvbGQgdmFsdWUgaGFzCj4+Pj4gYmVlbiBz
ZXQgdG8gcmFtcCBHUFUgZnJlcXVlbmN5IHRvIG1heCBmcmVxIGZhc3RlciAoY29tcGFyZWQgdG8g
cGFuZnJvc3QpCj4+Pj4gdG8gY29tcGVuc2F0ZSBmb3IgdGhlIGxvd2VyIG92ZXJhbGwgcGVyZm9y
bWFuY2Ugb2YgdXRnYXJkIGRldmljZXMuCj4+Pj4KPj4+PiBbMF0gaHR0cHM6Ly9wYXRjaHdvcmsu
a2VybmVsLm9yZy9wcm9qZWN0L2RyaS1kZXZlbC9wYXRjaC8yMDIxMDEyMTE3MDQ0NS4xOTc2MS0x
LWx1a2Fzei5sdWJhQGFybS5jb20vCj4+Pj4KPj4+PiBTaWduZWQtb2ZmLWJ5OiBDaHJpc3RpYW4g
SGV3aXR0IDxjaHJpc3RpYW5zaGV3aXR0QGdtYWlsLmNvbT4KPj4+PiAtLS0KPj4+PiBJIGhhdmUg
YmVlbiB1c2luZyBLb2RpIGFzIG15IHRlc3QgYXBwbGljYXRpb24uIElmIHlvdSBzY3JvbGwgaW4g
bGlicmFyeQo+Pj4+IHZpZXdzIHdpdGggaHVuZHJlZHMgb2YgbGlzdCBpdGVtcyBhbmQgdGhlIHBh
bmZyb3N0IHZhbHVlcyB0aGUgc2xvdyBHUFUKPj4+PiByYW1wIHVwIGlzIHF1aXRlIG5vdGljZWFi
bGUgYW5kIHRoZSBHVUkgZmVlbHMgc2x1Z2dpc2guIEFzIGV2ZXJ5dGhpbmcKPj4+PiBsaW1hIHJ1
bnMgb24gaXMgaW5oZXJlbnRseSBzbG93ZXIgdGhhbiBwYW5mcm9zdCB1c2luZyBkZXZpY2VzIEkg
YmVsaWV2ZQo+Pj4+IGl0J3MgYmV0dGVyIHRvIHJhbXAgdXAgdG8gbWF4IGZyZXEgcXVpY2tlci4K
Pj4+IEl0J3MgcXVpdGUgbG93IHZhbHVlIGZvciB0aGUgdXB0aHJlc2hvbGQsIGJ1dCBJIGJlbGll
dmUgeW91IGhhdmUKPj4+IGV4cGVyaW1lbnRlZCBhbmQgb2JzZXJ2ZWQgdGhhdCBhIGJpdCBoaWdo
ZXIgKDMwLCA0MD8pIGRvbid0IHdvcmsgd2VsbC4KPj4+IEkgZG9uJ3Qga25vdyB0aGUgS29kaSBz
eXN0ZW0sIHRob3VnaC4KPj4+IFlvdSBjYW4gY2hlY2sgaWYgdGhlIG90aGVyIGZyZXF1ZW5jaWVz
IGFyZSBhbHNvIHVzZWQgaW4gc3RhdGlzdGljcyBmb3IKPj4+IGRldmZyZXEgZGV2aWNlOgo+Pj4g
Y2F0IC9zeXMvY2xhc3MvZGV2ZnJlcS88eW91cl9ncHU+L3RyYW5zX3N0YXRzCj4+PiBJZiB0aGV5
IGFyZSBhbHNvIHVzZWQsIHRoZW4gaXQgT0sgKGJldHRlciB0aGFuIHN0dWNrIGF0IG1pbiBmcmVx
KS4KPj4KPj4gSSd2ZSBqdXN0IHJlYWxpemVkIHRoYXQgeW91ciBib2FyZCBtaWdodCBzdWZmZXIg
YSBhbm90aGVyIGlzc3VlLgo+PiBQbGVhc2UgYXBwbHkgdGhpcyBwYXRjaCBbMV0gYW5kIHJ1biB5
b3VyIGV4cGVyaW1lbnRzIHdpdGggdXB0aHJlc2hvbGRzLgo+Pgo+PiBbMV0gaHR0cHM6Ly9sb3Jl
Lmtlcm5lbC5vcmcvbGttbC8yMDIxMDEyNzEwNTEyMS4yMDM0NS0xLWx1a2Fzei5sdWJhQGFybS5j
b20vCj4gCj4gSeKAmXZlIGluY2x1ZGVkIHRoZSBwYXRjaCBhbmQgd2l0aCB1bnNjaWVudGlmaWMg
dGVzdGluZyBpdCBmZWVscyBzbmFwcGllciB3aXRoIGEgbGFyZ2VyIHZhbHVlIHRoYW4KPiBiZWZv
cmUuIEkgZGlkIHJldmVydCBiYWNrIHRvIDQ1IGZpcnN0LCBidXQgYWdhaW4gdGhpcyBmZWVscyBz
bHVnZ2lzaCB3aGVuIG5hdmlnYXRpbmcgYXJvdW5kIHRoZQo+IEtvZGkgR1VJLiBNeSBtYWluIHRl
c3QgaXMgdG8gZW50ZXIg4oCYTW92aWVz4oCZIGluIEtvZGkgdGhlbiBzdGFydCBzY3JvbGxpbmcg
aW4gYSBsb25nIGxpc3QuIFdoZW4KPiB0aGUgR1BVIHJhbXBzIHVwIHF1aWNrbHkgdGhlIGV4cGVy
aWVuY2UgaXMgc25hcHB5LCBidXQgd2hlbiBpdCByYW1wcyBtb3JlIGNvbnNlcnZhdGl2ZWx5Cj4g
c2Nyb2xsaW5nIGZlZWxzIGxpa2UgaXQgc3R1dHRlcnMsIHRoZW4gKG9uY2UgeW91IGhpdCBtYXgg
ZnJlcSkgaXQgYmVjb21lcyBmbHVpZC4KPiAKPiBXUDI6fiAjIGNhdCAvc3lzL2NsYXNzL2RldmZy
ZXEvZDAwYzAwMDAuZ3B1L3RyYW5zX3N0YXQKPiAgICAgICBGcm9tICA6ICAgVG8KPiAgICAgICAg
ICAgICA6IDEyNTAwMDAwMCAyNTAwMDAwMDAgMjg1NzE0Mjg1IDQwMDAwMDAwMCA1MDAwMDAwMDAg
NjY2NjY2NjY2IDc0NDAwMDAwMCAgIHRpbWUobXMpCj4gKiAxMjUwMDAwMDA6ICAgICAgICAgMCAg
ICAgICAgIDAgICAgICAgICAwICAgICAgICAgMCAgICAgICAgIDAgICAgICAgICAwICAgICAgIDI2
NCAgICAgNTI3MjAKPiAgICAyNTAwMDAwMDA6ICAgICAgICAgOSAgICAgICAgIDAgICAgICAgICAw
ICAgICAgICAgMCAgICAgICAgIDAgICAgICAgICAwICAgICAgICAzNiAgICAgIDM0MDQKPiAgICAy
ODU3MTQyODU6ICAgICAgICAgOSAgICAgICAgIDMgICAgICAgICAwICAgICAgICAgMCAgICAgICAg
IDAgICAgICAgICAwICAgICAgICAzMiAgICAgIDI2MjgKPiAgICA0MDAwMDAwMDA6ICAgICAgICAx
OCAgICAgICAgMjAgICAgICAgIDEzICAgICAgICAgMCAgICAgICAgIDAgICAgICAgICAwICAgICAg
IDE5MSAgICAgMjExNDAKPiAgICA1MDAwMDAwMDA6ICAgICAgICAxMiAgICAgICAgMTIgICAgICAg
ICA4ICAgICAgICA2MyAgICAgICAgIDAgICAgICAgICAwICAgICAgICAzMSAgICAgMTAwNjgKPiAg
ICA2NjY2NjY2NjY6ICAgICAgIDE3OSAgICAgICAgIDUgICAgICAgIDE2ICAgICAgIDEzMyAgICAg
ICAgNjYgICAgICAgICAwICAgICAgICAyNCAgICAgMjkzNjAKPiAgICA3NDQwMDAwMDA6ICAgICAg
ICAzNyAgICAgICAgIDUgICAgICAgICA3ICAgICAgICA0NiAgICAgICAgNjAgICAgICAgNDIzICAg
ICAgICAgMCAgICAgNDYwMTYKPiAKPiBJ4oCZbGwgc2VuZCB2MiB3aXRoIHRoZSB2YWx1ZSBzZXQg
dG8gMzAuCgpUaGFuayB5b3UgQ2hyaXN0aWFuIGZvciByZS10ZXN0aW5nIGl0IGFuZCBhdHRhY2hp
bmcgdGhlIHN0YXRzLiBJdCBsb29rcwpnb29kLiBJJ2xsIGFkZCBteSByZXZpZXdlZC1ieSBmb3Ig
djIgcGF0Y2guCgpSZWdhcmRzLApMdWthc3oKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlz
dGluZm8vZHJpLWRldmVsCg==
