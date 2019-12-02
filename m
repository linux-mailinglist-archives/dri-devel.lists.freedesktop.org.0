Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 61C8210E6E8
	for <lists+dri-devel@lfdr.de>; Mon,  2 Dec 2019 09:27:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 69EAF6E054;
	Mon,  2 Dec 2019 08:27:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from protonic.nl (protonic.xs4all.nl [83.163.252.89])
 by gabe.freedesktop.org (Postfix) with ESMTP id 88B3789FD3;
 Mon,  2 Dec 2019 08:08:09 +0000 (UTC)
Received: from webmail.promanet.nl (edge2.prtnl [192.168.1.170])
 by sparta (Postfix) with ESMTP id 62BD244A0022;
 Mon,  2 Dec 2019 09:08:08 +0100 (CET)
MIME-Version: 1.0
Date: Mon, 02 Dec 2019 09:08:08 +0100
From: robin <robin@protonic.nl>
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Subject: Re: [PATCH v2 14/14] auxdisplay: constify fb ops
In-Reply-To: <CANiq72mEseWduUkJ069E8m8XKuyctsxOsTEZAfGm9d81WzpGEQ@mail.gmail.com>
References: <cover.1575022735.git.jani.nikula@intel.com>
 <94a33cf0a587e803bcadcf80e8152eac9b196f34.1575022735.git.jani.nikula@intel.com>
 <20191129152424.GG624164@phenom.ffwll.local>
 <CANiq72kRGg1AZHC-pR_uKykMxmcMPM2+qbXVPVQhHrZRzu723Q@mail.gmail.com>
 <20191129203007.GV624164@phenom.ffwll.local>
 <CANiq72mEseWduUkJ069E8m8XKuyctsxOsTEZAfGm9d81WzpGEQ@mail.gmail.com>
Message-ID: <db5f3f940317323543fe8b5adbbefff6@protonic.nl>
X-Sender: robin@protonic.nl
User-Agent: Roundcube Webmail/1.3.6
X-Mailman-Approved-At: Mon, 02 Dec 2019 08:27:09 +0000
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
Cc: Jani Nikula <jani.nikula@intel.com>, linux-fbdev@vger.kernel.org,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMjAxOS0xMS0yOSAyMTo1OSwgTWlndWVsIE9qZWRhIHdyb3RlOgo+IE9uIEZyaSwgTm92IDI5
LCAyMDE5IGF0IDk6MzAgUE0gRGFuaWVsIFZldHRlciA8ZGFuaWVsQGZmd2xsLmNoPiB3cm90ZToK
Pj4gCj4+IFdlbGwgd2UgZG8gaGF2ZSB2ZXJ5IHNtYWxsIGxjZCBkaXNwbGF5IGRyaXZlcnMgaW4g
ZHJtLCBhbmQgYmVmb3JlIHRoYXQgCj4+IGluCj4+IGZiZGV2LiBBbmQgeW91IGhhdmUgYSBmYmRl
diBmcmFtZWJ1ZmZlciBkcml2ZXIgaW4gdGhlcmUsIHdoaWNoIGxvb2tzIGEgCj4+IGJpdAo+PiBt
aXNwbGFjZWQgLi4uCj4+IAo+PiBBZmFpdWkgeW91IGFsc28gaGF2ZSBzb21lIGV2ZW4gdGluaWVy
IGxjZCBkcml2ZXJzIHdoZXJlIHlvdSBkb24ndCAKPj4gYWRkcmVzcwo+PiBwaXhlbHMsIGJ1dCBq
dXN0IGRpcmVjdGx5IHVwbG9hZCB0ZXh0LCBhbmQgdGhvc2Ugb2J2aW91c2x5IGRvbid0IGZpdCAK
Pj4gaW50bwo+PiBkcm0vZmJkZXYgd29ybGQuIEJ1dCBhbnl0aGluZyB3aGVyZSB5b3UgY2FuIGFk
ZHJlc3MgcGl4ZWxzIHZlcnkgbXVjaCAKPj4gZG9lcy4KPj4gLURhbmllbAo+IAo+IFRoZSBmaXJz
dCBkcml2ZXIgaW4gdGhlIGNhdGVnb3J5IHVzZWQgZmIuaC4gQXQgdGhlIHRpbWUgKH4xMyB5ZWFy
cwo+IGFnbykgaXQgd2FzIGRlY2lkZWQgdGhhdCB0aGUgZHJpdmVycyBzaG91bGQgZ28gaW50byBh
IGRpZmZlcmVudAo+IGNhdGVnb3J5L2ZvbGRlciBpbnN0ZWFkIGFuZCB0aGVuIHRoZSBvdGhlciB3
ZXJlIGFkZGVkLgo+IAo+IEluIGFueSBjYXNlLCBJIGFtIHJlbW92aW5nIHRoZSBvcmlnaW5hbCBv
bmVzIHNpbmNlIEkgY2Fubm90IHRlc3QgdGhlbQo+IGFueW1vcmUgYW5kIHRoZXJlIGFyZSBsaWtl
bHkgbm8gdXNlci4gVGhlIG9ubHkgb3RoZXIgZmIgdXNlciBjb3VsZCBiZQo+IHJlbG9jYXRlZCBp
ZiBSb2JpbiBhZ3JlZXMuCgpUaGUgaHQxNmszMyBkcml2ZXIgcmVnaXN0ZXJzIGEgZnJhbWVidWZm
ZXIsIGJhY2tsaWdodCBhbmQgaW5wdXQgZGV2aWNlLgpOb3Qgc3VyZSBpZiBpdCdzIE9LIHRvIGxl
dCBhIGRyaXZlciB1bmRlciBmYmRldiByZWdpc3RlciBhbGwgb2YgdGhvc2UsCmJ1dCByZWxvY2F0
aW5nIGl0IGlzIGZpbmUgYnkgbWUuCgpSb2JpbgoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlz
dHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4v
bGlzdGluZm8vZHJpLWRldmVs
