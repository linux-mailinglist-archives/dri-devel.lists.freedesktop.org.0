Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 488497EEE1
	for <lists+dri-devel@lfdr.de>; Fri,  2 Aug 2019 10:20:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F08D46ED1C;
	Fri,  2 Aug 2019 08:19:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 610 seconds by postgrey-1.36 at gabe;
 Thu, 01 Aug 2019 10:36:50 UTC
Received: from mail.daemonic.se (mail.daemonic.se [176.58.89.161])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A88F56E48C
 for <dri-devel@lists.freedesktop.org>; Thu,  1 Aug 2019 10:36:50 +0000 (UTC)
Received: from cid.daemonic.se (localhost [IPv6:::1])
 by mail.daemonic.se (Postfix) with ESMTP id 45zmg16gLqz3klc;
 Thu,  1 Aug 2019 10:26:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at daemonic.se
Received: from mail.daemonic.se ([IPv6:::1]) (using TLS with cipher
 ECDHE-RSA-AES128-GCM-SHA256)
 by cid.daemonic.se (mailscanner.daemonic.se [IPv6:::1]) (amavisd-new,
 port 10587)
 with ESMTPS id ya5OYVbhe0QY; Thu,  1 Aug 2019 10:26:36 +0000 (UTC)
Received: from garnet.daemonic.se (host-95-192-196-123.mobileonline.telia.com
 [95.192.196.123])
 by mail.daemonic.se (Postfix) with ESMTPSA id 45zmg00JH8z3c7W;
 Thu,  1 Aug 2019 10:26:35 +0000 (UTC)
Subject: Re: [PATCH libdrm v2 4/4] meson.build: Fix meson script on FreeBSD
To: Eric Engestrom <eric.engestrom@intel.com>
References: <20190616132343.26370-1-emil.l.velikov@gmail.com>
 <20190616132343.26370-4-emil.l.velikov@gmail.com>
 <20190617091435.35ftj5twdxpspxnr@intel.com>
 <ca1171ab-ebbe-23f2-15c7-552bbf6aaf38@daemonic.se>
 <20190617134441.nxzbjxozlfe6v46s@intel.com>
From: Niclas Zeising <zeising@daemonic.se>
Message-ID: <4026d9a2-3ca7-f347-d76f-b4f3af4cce45@daemonic.se>
Date: Thu, 1 Aug 2019 12:26:28 +0200
User-Agent: Mozilla/5.0 (X11; FreeBSD amd64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190617134441.nxzbjxozlfe6v46s@intel.com>
Content-Language: en-US
X-Mailman-Approved-At: Fri, 02 Aug 2019 08:19:03 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=daemonic.se; h=
 content-transfer-encoding:content-language:content-type
 :content-type:in-reply-to:mime-version:user-agent:date:date
 :message-id:from:from:references:subject:subject:received
 :received; s=20151023; t=1564655196; bh=Zk4XFAnkp95qYBRcZuIdepNE
 c1/GnqHkVxBwfIXJL3M=; b=gEw0xJCGdVVspGXMlThLkVKfVW72Gal2OHQ5DGor
 Vj00j3WiqVt8EWqzW6fnXa7RdHvLY/b1oPDamhK85QgbKGYWJTmjrFldGT4fYZYi
 v52eQzRnovHpiCVg6SOZDWv2m4T1esD9cv0Qjx74okelP5SsVFl33RMzEMaL90Ss
 QZg=
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
Cc: Emil Velikov <emil.l.velikov@gmail.com>, dri-devel@lists.freedesktop.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMjAxOS0wNi0xNyAxNTo0NCwgRXJpYyBFbmdlc3Ryb20gd3JvdGU6Cj4gT24gTW9uZGF5LCAy
MDE5LTA2LTE3IDExOjIwOjQzICswMjAwLCBOaWNsYXMgWmVpc2luZyB3cm90ZToKPj4gT24gMjAx
OS0wNi0xNyAxMToxNCwgRXJpYyBFbmdlc3Ryb20gd3JvdGU6Cj4+PiBPbiBTdW5kYXksIDIwMTkt
MDYtMTYgMTQ6MjM6NDMgKzAxMDAsIEVtaWwgVmVsaWtvdiB3cm90ZToKPj4+PiBGcm9tOiBOaWNs
YXMgWmVpc2luZyA8emVpc2luZ0BkYWVtb25pYy5zZT4KPj4+Pgo+Pj4+IEZyZWVCU0QgcmVxdWly
ZXMgc3lzL3R5cGVzLmggZm9yIHN5cy9zeXNjdGwuaCwgYWRkIGl0IGFzIHBhcnQgb2YgdGhlCj4+
Pj4gaW5jbHVkZXMgd2hlbiBjaGVja2luZyBmb3IgaGVhZGVycy4KPj4+PiBJbnN0ZWFkIG9mIHNw
bGl0dGluZyBvdXQgdGhlIGNoZWNrIGZvciBzeXMvc3lzY3RsLmggZnJvbSB0aGUgb3RoZXIKPj4+
PiBoZWFkZXIgY2hlY2tzLCBqdXN0IGFkZCBzeXMvdHlwZXMuaCB0byBhbGwgaGVhZGVyIGNoZWNr
cy4KPj4+Pgo+Pj4+IHYyIFtFbWlsXQo+Pj4+ICAgIC0gYWRkIGlubGluZSBjb21tZW50Cj4+Pj4g
ICAgLSBkcm9wIGJhc2gvc2ggaHVuawo+Pj4+Cj4+Pj4gU2lnbmVkLW9mZi1ieTogRW1pbCBWZWxp
a292IDxlbWlsLmwudmVsaWtvdkBnbWFpbC5jb20+Cj4+Pgo+Pj4gU2VyaWVzIGlzOgo+Pj4gUmV2
aWV3ZWQtYnk6IEVyaWMgRW5nZXN0cm9tIDxlcmljLmVuZ2VzdHJvbUBpbnRlbC5jb20+Cj4+Pgo+
Pj4gQnV0IEkgYWdyZWUgd2l0aCBFbWlsLCBpdCdzIGEgRnJlZUJTRCBidWcgZm9yIGl0IHRvIG5v
dCBpbmNsdWRlCj4+PiBhIHJlcXVpcmVkIGhlYWRlciwgdGhpcyBzaG91bGQgYWxzbyBiZSBmaXhl
ZCB1cHN0cmVhbS4KPj4KPj4gSSdtIG5vdCBzdXJlIGlmIG15IGUtbWFpbHMgYXJlIGdldHRpbmcg
dG8gdGhlIG1haWxpbmcgbGlzdC4KPiAKPiBUaGV5IGFyZSA6KQo+IAo+IFlvdSBjYW4gY2hlY2sg
dGhlIGFyY2hpdmUgaWYgeW91J3JlIG5vdCBzdXJlOgo+IGh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0
b3Aub3JnL2FyY2hpdmVzL2RyaS1kZXZlbC8yMDE5LUp1bmUvdGhyZWFkLmh0bWwKPiAKPj4gVGhp
cyBpcyB0aGUgd2F5Cj4+IGl0J3MgZG9jdW1lbnRlZCBpbiBGcmVlQlNELCBhbmQgdGhlcmUgaXMg
YSBsb3Qgb2YgbGVnYWN5IHJlYXNvbnMgaXQgaXMgdGhpcwo+PiB3YXkuICBJIGRvdWJ0IGl0IHdp
bGwgY2hhbmdlLCBhbmQgZXZlbiBpZiBpdCBkb2VzLCB0aGVyZSB3aWxsIGJlIGFib3V0IDUKPj4g
eWVhcnMgb2YgdHJhbnNpdGlvbiBwZXJpb2QgYmVmb3JlIGFsbCBzdXBwb3J0ZWQgcmVsZWFzZXMg
aGFzIHRoZSBjaGFuZ2UsCj4+IG1vc3QgbGlrZWx5Lgo+Pgo+PiBUaGlzIGlzIHRoZSBmaXJzdCB0
aW1lLCB0byBteSBrbm93bGVkZ2UsIHRoaXMgaXNzdWUgaGFzIGNvbWUgdXAuCj4+Cj4+IChJJ20g
bm90IHNheWluZyBJIGRpc2FncmVlIHdpdGggeW91LCBqdXN0IHNheWluZyBpdCdzIHByb2JhYmx5
IGVhc2llciB0bwo+PiBwYXRjaCBoZXJlIHJhdGhlciB0aGFuIHRyeSB0byBjaGFuZ2UgdXBzdHJl
YW0uKQo+Pgo+PiBSZWdhcmRzCj4+IC0tIAo+PiBOaWNsYXMKPiAKPiBJZiB0aGluayB3ZSBib3Ro
IGFncmVlIHRoZW4gOykKPiBJIGRlZmluaXRlbHkgYWdyZWUgd2l0aCBzaG91bGQgaGF2ZSB0aGUg
d29ya2Fyb3VuZCBkb3duc3RyZWFtLCBhbGwKPiBJIG1lYW50IGlzIHRoYXQgaXQncyB3b3J0aCBw
dXNoaW5nIHVwc3RyZWFtIHRvIGZpeCB0aGUgYnVnIHNvIHRoYXQKPiAqZXZlbnR1YWxseSogbm90
IGFsbCBkb3duc3RyZWFtIHVzZXJzIG5lZWRzIHRvIGhhdmUgdGhlIHdvcmthcm91bmQgKGJ1dAo+
IHllYWgsIHRoYXQgd2lsbCB0YWtlIHllYXJzIHRvIHJlYWNoKS4KPiAKCkp1c3Qgbm90aWNlZCB0
aGF0IHRoZXNlIHBhdGNoZXMgc3RpbGwgaGF2ZW4ndCBiZWVuIG1lcmdlZC4gIFdoYXQncyB0aGUg
CmhvbGQgdXA/ClRoYW5rcyEKUmVnYXJkcwotLSAKTmljbGFzIFplaXNpbmcKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlz
dApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0
b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
