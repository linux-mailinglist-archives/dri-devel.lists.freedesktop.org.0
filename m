Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 864AB57FE2
	for <lists+dri-devel@lfdr.de>; Thu, 27 Jun 2019 12:04:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 513306E0DE;
	Thu, 27 Jun 2019 10:04:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk
 [IPv6:2001:4d48:ad52:3201:214:fdff:fe10:1be6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 779FD6E0DE
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Jun 2019 10:04:25 +0000 (UTC)
Received: from shell.armlinux.org.uk
 ([2002:4e20:1eda:1:5054:ff:fe00:4ec]:59142)
 by pandora.armlinux.org.uk with esmtpsa
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <linux@armlinux.org.uk>)
 id 1hgRGO-0002Ex-6N; Thu, 27 Jun 2019 11:04:20 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.89)
 (envelope-from <linux@shell.armlinux.org.uk>)
 id 1hgRGL-0000Sf-Id; Thu, 27 Jun 2019 11:04:17 +0100
Date: Thu, 27 Jun 2019 11:04:17 +0100
From: Russell King - ARM Linux admin <linux@armlinux.org.uk>
To: Lucas Stach <l.stach@pengutronix.de>
Subject: Re: [REGRESSION] drm/etnaviv: command buffer outside valid memory
 window
Message-ID: <20190627100417.dtym5ojrxaik4kg5@shell.armlinux.org.uk>
References: <20190622161623.eiameq5dmcysbqor@shell.armlinux.org.uk>
 <1561627215.2587.38.camel@pengutronix.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1561627215.2587.38.camel@pengutronix.de>
User-Agent: NeoMutt/20170113 (1.7.2)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; 
 d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:
 Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
 Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=b9ATQF8PkoUYfytLzifWj8IPSx38SgU8tI+SRRbMYo4=; b=gMq1TlN5121Xt0zUOId15wuVk
 CB0/BfmRmnyo/Buly9NzK93ABv844Yq61k1zPHrwzomm9xHpKMVUtLiZD4GSiGo5SnC7bBGOFQEfS
 jX2CVbbwpQX+6jpSaJZhMdHiFPHixDrDxi+ll/uZKuHxKZWODbKwAZaEabJ8Nxc5kWyRTCqc0kbRd
 FZOjqY9gRL5w/znbOC3OCKARETOIcCNZjeVYfQNDYJ9+7oRLvfIyQImsoQQXe0mr5CQkcY49rsimF
 gRJI4cHDK9GJwxlU/T3lgwf5xy3EJJkXsWZPnZT7mjYZiqHbn5zcIAaU5HJiEmmsKc8MR7MKi0QQ/
 Snf2Xx8fg==;
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
Cc: etnaviv@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVGh1LCBKdW4gMjcsIDIwMTkgYXQgMTE6MjA6MTVBTSArMDIwMCwgTHVjYXMgU3RhY2ggd3Jv
dGU6Cj4gQW0gU2Ftc3RhZywgZGVuIDIyLjA2LjIwMTksIDE3OjE2ICswMTAwIHNjaHJpZWIgUnVz
c2VsbCBLaW5nIC0gQVJNIExpbnV4IGFkbWluOgo+ID4gV2hpbGUgdXBkYXRpbmcgbXkgdmFyaW91
cyBzeXN0ZW1zIGZvciB0aGUgVENQIFNBQ0sgaXNzdWUsIEkgbm90aWNlCj4gPiB0aGF0IHdoaWxl
IG1vc3QgcGxhdGZvcm1zIGFyZSBoYXBweSwgdGhlIEN1Ym94LWk0IGlzIG5vdC7CoMKgRHVyaW5n
Cj4gPiBib290LCB3ZSBnZXQ6Cj4gPiAKPiA+IFvCoMKgwqDCoDAuMDAwMDAwXSBjbWE6IFJlc2Vy
dmVkIDI1NiBNaUIgYXQgMHgzMDAwMDAwMAo+ID4gLi4uCj4gPiBbwqDCoMKgwqAwLjAwMDAwMF0g
S2VybmVsIGNvbW1hbmQgbGluZTogY29uc29sZT10dHlteGMwLDExNTIwMG44IGNvbnNvbGU9dHR5
MSB2aWRlbz1teGNmYjA6ZGV2PWhkbWkgcm9vdD0vZGV2L25mcyBydyBjbWE9MjU2TSBhaGNpX2lt
eC5ob3RwbHVnPTEgc3BsYXNoIHJlc3VtZT0vZGV2L3NkYTEKPiA+IFvCoMKgwqDCoDAuMDAwMDAw
XSBEZW50cnkgY2FjaGUgaGFzaCB0YWJsZSBlbnRyaWVzOiAxMzEwNzIgKG9yZGVyOiA3LCA1MjQy
ODggYnl0ZXMpCj4gPiBbwqDCoMKgwqAwLjAwMDAwMF0gSW5vZGUtY2FjaGUgaGFzaCB0YWJsZSBl
bnRyaWVzOiA2NTUzNiAob3JkZXI6IDYsIDI2MjE0NCBieXRlcykKPiA+IFvCoMKgwqDCoDAuMDAw
MDAwXSBNZW1vcnk6IDE3OTA5NzJLLzIwOTcxNTJLIGF2YWlsYWJsZSAoODQ3MUsga2VybmVsIGNv
ZGUsIDY5M0sgcndkYXRhLCAyODQ0SyByb2RhdGEsIDUwMEsgaW5pdCwgODA2MksgYnNzLCA0NDAz
NksgcmVzZXJ2ZWQsIDI2MjE0NEsgY21hLXJlc2VydmVkLCAxMzEwNzIwSyBoaWdobWVtKQo+ID4g
Li4uCj4gPiBbwqDCoMKgMTMuMTAxMDk4XSBldG5hdml2LWdwdSAxMzAwMDAuZ3B1OiBjb21tYW5k
IGJ1ZmZlciBvdXRzaWRlIHZhbGlkIG1lbW9yeSB3aW5kb3cKPiA+IFvCoMKgwqAxMy4xNzE5NjNd
IGV0bmF2aXYtZ3B1IDEzNDAwMC5ncHU6IGNvbW1hbmQgYnVmZmVyIG91dHNpZGUgdmFsaWQgbWVt
b3J5IHdpbmRvdwo+IAo+IFllcywgdGhhdCdzIGEgcmVncmVzc2lvbiBkdWUgdG8gZGlmZmVyZW50
IGRlZmF1bHQgQ01BIGFyZWEgcGxhY2VtZW50Cj4gYW5kIGV0bmF2aXYgbm90IGJlaW5nIHNtYXJ0
IGVub3VnaCB0byBtb3ZlIHRoZSBsaW5lYXIgd2luZG93IHRvIHRoZQo+IHJpZ2h0IG9mZnNldC4K
CkFzIGl0J3MgYSB1c2VyIHZpc2libGUgcmVncmVzc2lvbiwgaXQgbmVlZHMgZml4aW5nLCBlaXRo
ZXIgYnkgcmV2ZXJ0aW5nCnRoZSBjaGFuZ2VzIHRoYXQgY2F1c2VkIGl0IG9yIGJ5IHNvbWUgb3Ro
ZXIgaXNzdWUuICBJbiB0aGUga2VybmVsLCB0aGUKcG9saWN5IGlzICJpZiBhIGJ1ZyBmaXggY2F1
c2VzIGEgcmVncmVzc2lvbiwgdGhlIGJ1ZyBmaXggd2FzIGl0c2VsZgp3cm9uZyIuICBXZSBkb24n
dCBmaXggb25lIHBlcnNvbidzIGJ1ZyBpZiBpdCBjYXVzZXMgYSByZWdyZXNzaW9uIGZvcgpzb21l
b25lIGVsc2UuCgpQbGVhc2UgcmVzb2x2ZSB0aGUgYWNrbm93bGVkZ2VkIHJlZ3Jlc3Npb24uCgo+
ID4gYW5kIHNob3J0bHkgYWZ0ZXIgdGhlIGxvZ2luIHByb21wdCBhcHBlYXJzLCB0aGUgZW50aXJl
IFNvQyBhcHBlYXJzIHRvCj4gPiBsb2NrIHVwIC0gaXQgYmVjb21lcyB1bnJlc3BvbnNpdmUgb24g
dGhlIG5ldHdvcmssIG9yIHZpYSBzZXJpYWwgY29uc29sZQo+ID4gdG8gc3lzcnEgcmVxdWVzdHMu
Cj4gPiAKPiA+IEkgc3VzcGVjdCB0aGUgR1BVIGVuZHMgdXAgc2NyaWJibGluZyBvdmVyIHRoZSBD
UFUncyB2ZWN0b3IgcGFnZS9rZXJuZWwKPiA+IGFzIGEgcmVzdWx0IG9mIHRoZSBhYm92ZSB0d28g
ZXRuYXZpdiBlcnJvcnMgd2hlbiBYb3JnIGF0dGVtcHRzIHRvIHN0YXJ0Cj4gPiB1c2luZyB0aGUg
R1BVLgo+IAo+IFRoaXMgc2hvdWxkIG5vdCBiZSBwb3NzaWJsZS4gVGhlIGRyaXZlciBub3RpY2Vz
IHRoYXQgdGhlIGNvbW1hbmQgYnVmZmVyCj4gaXNuJ3QgYWNjZXNzaWJsZSB0byB0aGUgR1BVLCB3
aGljaCBhYm9ydHMgdGhlIEdQVSBpbml0LiBXaGlsZSB0aGUKPiBldG5hdml2IERSTSBkZXZpY2Ug
aXMgc3RpbGwgYWNjZXNzaWJsZSwgaXQgd2lsbCBub3QgZXhwb3NlIGFueQo+IGVudW1lcmFibGUg
R1BVIGNvcmVzIHRvIHVzZXJzcGFjZS4gU28gdGhlcmUgaXMgbm8gd2F5IGZvciB1c2Vyc3BhY2Ug
dG8KPiBhY3R1YWxseSBzdWJtaXQgR1BVIGNvbW1hbmRzLgoKWWVwLCBJIGNhbWUgdG8gdGhhdCBj
b25jbHVzaW9uLiAgTmV2ZXJ0aGVsZXNzLCBpZiBJIGFsbG93IFhvcmcgdG8gc3RhcnQKd2l0aCA1
LjEsIHRoZSBzeXN0ZW0gdG90YWxseSBoYW5ncyBzaG9ydGx5IHRoZXJlYWZ0ZXIuICBJIG5lZWQg
dG8gdHJ5CndpdGhvdXQgZXRuYXZpdiBsb2FkZWQgYXQgYWxsLgoKLS0gClJNSydzIFBhdGNoIHN5
c3RlbTogaHR0cHM6Ly93d3cuYXJtbGludXgub3JnLnVrL2RldmVsb3Blci9wYXRjaGVzLwpGVFRD
IGJyb2FkYmFuZCBmb3IgMC44bWlsZSBsaW5lIGluIHN1YnVyYmlhOiBzeW5jIGF0IDEyLjFNYnBz
IGRvd24gNjIya2JwcyB1cApBY2NvcmRpbmcgdG8gc3BlZWR0ZXN0Lm5ldDogMTEuOU1icHMgZG93
biA1MDBrYnBzIHVwCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9y
ZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZl
bA==
