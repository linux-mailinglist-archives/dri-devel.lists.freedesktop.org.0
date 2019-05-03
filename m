Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 022B612C0B
	for <lists+dri-devel@lfdr.de>; Fri,  3 May 2019 13:10:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B9E9988E35;
	Fri,  3 May 2019 11:10:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from honk.sigxcpu.org (honk.sigxcpu.org [24.134.29.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5796F88DF6;
 Fri,  3 May 2019 11:10:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by honk.sigxcpu.org (Postfix) with ESMTP id CDA9EFB03;
 Fri,  3 May 2019 13:10:27 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at honk.sigxcpu.org
Received: from honk.sigxcpu.org ([127.0.0.1])
 by localhost (honk.sigxcpu.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id BQxzPPcJD1BK; Fri,  3 May 2019 13:10:26 +0200 (CEST)
Received: by bogon.sigxcpu.org (Postfix, from userid 1000)
 id 2C29E47CC6; Fri,  3 May 2019 13:10:26 +0200 (CEST)
Date: Fri, 3 May 2019 13:10:26 +0200
From: Guido =?iso-8859-1?Q?G=FCnther?= <agx@sigxcpu.org>
To: Lucas Stach <l.stach@pengutronix.de>
Subject: Re: [PATCH v2 0/8] per-process address spaces for MMUv2
Message-ID: <20190503111026.GA6943@bogon.m.sigxcpu.org>
References: <20190417135023.26977-1-l.stach@pengutronix.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190417135023.26977-1-l.stach@pengutronix.de>
User-Agent: Mutt/1.10.1 (2018-07-13)
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
Cc: etnaviv@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 patchwork-lst@pengutronix.de, kernel@pengutronix.de,
 Russell King <linux+etnaviv@armlinux.org.uk>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgTHVjYXMsCk9uIFdlZCwgQXByIDE3LCAyMDE5IGF0IDAzOjUwOjE1UE0gKzAyMDAsIEx1Y2Fz
IFN0YWNoIHdyb3RlOgo+IAo+IEhpIGFsbCwKPiAKPiB2MSBjb3ZlciBsZXR0ZXI6Cj4gCj4gdGhl
IGZvbGxvd2luZyBwYXRjaGVzIGZpbmFsbHkgaW1wbGVtZW50IG9uZSBvZiB0aGUgbG9uZ3N0YW5k
aW5nIFRPRE8KPiBpdGVtcyBpbiB0aGUgZXRuYXZpdiBkcml2ZXI6IHBlci1wcm9jZXNzIGFkZHJl
c3Mgc3BhY2VzLiBUaGV5IGFyZSBvbmx5Cj4gZW5hYmxlZCBmb3IgTU1VdjIsIGFzIHN3aXRjaGlu
ZyB0aGUgTU1VIGNvbnRleHQgb24gTU1VdjEgd291bGQgcmVxdWlyZQo+IGEgZnVsbCBzdG9wIG9m
IHRoZSBGRSwgd2hpY2ggSSBkZWVtZWQgdG9vIGV4cGVuc2l2ZSB0byBkbyBvbiBwb3RlbnRpYWxs
eQo+IGV2ZXJ5IHN1Ym1pdHRlZCBjb21tYW5kc3RyZWFtLgo+IAo+IEZvciBub3cgdGhpcyBvbmx5
IHByb3ZpZGVzIGJldHRlciBpc29sYXRpb24gYmV0d2VlbiBHUFUgY2xpZW50cywgYnV0IGl0Cj4g
aXMgYWxzbyBhIGJpZyBzdGVwIGluIHRoZSBkaXJlY3Rpb24gb2Ygc3VwcG9ydGluZyBzb2Z0cGlu
LiBTb2Z0cGluIHdpbGwKPiBsYXRlciBiZSB1c2VkIGJ5IEdDNzAwMCB1c2Vyc3BhY2UgZHJpdmVy
cyB0byBkZWFsIHdpdGggdGV4dHVyZSBkZXNjcmlwdG9ycwo+IHdpdGhvdXQgdGhlIG5lZWQgdG8g
YWRkIGV2ZW4gbW9yZSByZWxvY2F0aW9uIGludGVyZmFjZXMgdG8gdGhlIGV0bmF2aXYKPiBVQVBJ
Lgo+IAo+IFRoZSBjaGFuZ2VzIGFyZSBiaWcgYW5kIHByZXR0eSBkaXNydXB0aXZlLCBzbyBJIGFj
a25vd2xlZGdlIHRoYXQgdGhleQo+IGFyZW4ndCBwcmltZSB0YXJnZXRzIGZvciBhIHF1aWNrIHJl
dmlldywgYnV0IEkgd291bGQgYXBwcmVjaWF0ZSBhCj4gc2Vjb25kIHBhaXJzIG9mIGV5ZXMgb24g
dGhlbS4KPiAKPiBDaGFuZ2VzIHNpbmNlIHYxOgo+IC0gZml4ZWQgYW4gaXNzdWUgd2hlcmUgYSBk
ZWJ1Z3NmcyByZWFkIGNvdWxkIHJ1biBpbnRvIGEga2VybmVsIE5VTEwKPiAgIHB0ciBkZXJlZmVy
ZW5jZSBkdWUgdG8gbm8gY3VycmVudCBNTVUgY29udGV4dAo+IC0gZml4ZWQgYW4gaXNzdWUgd2hl
cmUgdGhlIGN1cnJlbnQgTU1VIGNvbnRleHQgY291bGQgYmUgZGVzdHJveWVkCj4gICBkdWUgdG8g
dGhlIERSTSBjbGllbnQgZ29pbmcgYXdheSwgd2hpbGUgaXQgaXMgc3RpbGwgaW4gdXNlIGJ5Cj4g
ICBhbiBhY3RpdmUgR1BVIGpvYgo+IC0gbW9yZSBleHRlbnNpdmUgdGVzdGluZyBvbiBHQzg4MCwg
R0MyMDAwLCBHQzMwMDAgYW5kIEdDNzAwMAoKSSBnYXZlIHRoaXMgc2VyaWVzIGEgdGVzdCBvbiBH
QzcwMDAgYW5kIGl0IGxvb2tzIGdvb2QuIEknbGwgZG8gc29tZSBtb3JlCnRlc3Rpbmcgb3ZlciB0
aGUgbmV4dCB3ZWVrLgpDaGVlcnMsCiAtLSBHdWlkbwpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBs
aXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1h
bi9saXN0aW5mby9kcmktZGV2ZWw=
