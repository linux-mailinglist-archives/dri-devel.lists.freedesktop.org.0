Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AFFA0F063D
	for <lists+dri-devel@lfdr.de>; Tue,  5 Nov 2019 20:49:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D0B386EB6C;
	Tue,  5 Nov 2019 19:49:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0D6946EB6C
 for <dri-devel@lists.freedesktop.org>; Tue,  5 Nov 2019 19:49:15 +0000 (UTC)
Received: from pendragon.ideasonboard.com (81-175-216-236.bb.dnainternet.fi
 [81.175.216.236])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 56573559;
 Tue,  5 Nov 2019 20:49:11 +0100 (CET)
Date: Tue, 5 Nov 2019 21:49:02 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Dave Airlie <airlied@gmail.com>, dri-devel@lists.freedesktop.org
Subject: Re: [GIT PULL FOR v5.5 - 2nd try] R-Car DU CMM support
Message-ID: <20191105194902.GA8235@pendragon.ideasonboard.com>
References: <20191022103135.GC4756@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191022103135.GC4756@pendragon.ideasonboard.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=ideasonboard.com; s=mail; t=1572983352;
 bh=U47WDls+/jb+rTSaG22kwukQVv5D1tVqiYDo47Wvy8w=;
 h=Date:From:To:Subject:References:In-Reply-To:From;
 b=MqNEGiIaddMiD0tqeL6y1KxsSGm0VYjon6MXIRfRTlg0pz34xO3uo1Ix9r6+syjlz
 M7BmMDxH6aU9ubMxlzTYrIINNURFrwrGz5BnnFXPxP7Tz1g2kPTL1q/WV2yW8xuaaS
 8dGlpBBoNInFme7+F2a/Be+9QoHUmd8RG/dL3JAI=
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgRGF2ZSwKCkhhcyB0aGlzIHB1bGwgcmVxdWVzdCBmYWxsZW4gdGhyb3VnaCB0aGUgY3JhY2tz
ID8KCk9uIFR1ZSwgT2N0IDIyLCAyMDE5IGF0IDAxOjMxOjM1UE0gKzAzMDAsIExhdXJlbnQgUGlu
Y2hhcnQgd3JvdGU6Cj4gSGkgRGF2ZSwKPiAKPiBTZWNvbmQgYXR0ZW1wdC4KPiAKPiBUaGUgZm9s
bG93aW5nIGNoYW5nZXMgc2luY2UgY29tbWl0IGYxYjRhOTIxN2VmZDYxZDBiODRjNmRjNDA0NTk2
Yzg1MTlmZjZmNTk6Cj4gCj4gICBNZXJnZSB0YWcgJ2R1LW5leHQtMjAxOTEwMTYnIG9mIGdpdDov
L2xpbnV4dHYub3JnL3BpbmNoYXJ0bC9tZWRpYSBpbnRvIGRybS1uZXh0ICgyMDE5LTEwLTIyIDE1
OjA0OjA3ICsxMDAwKQo+IAo+IGFyZSBhdmFpbGFibGUgaW4gdGhlIEdpdCByZXBvc2l0b3J5IGF0
Ogo+IAo+ICAgZ2l0Oi8vbGludXh0di5vcmcvcGluY2hhcnRsL21lZGlhLmdpdCB0YWdzL2R1LW5l
eHQtMjAxOTEwMjIKPiAKPiBmb3IgeW91IHRvIGZldGNoIGNoYW5nZXMgdXAgdG8gYWFkMTU1MmYx
ZGVmZDNhNTMzNGNkNGIyNTczZmFlOTk2M2Q0ZGI1NzoKPiAKPiAgIGRybTogcmNhci1kdTogY3J0
YzogUmVnaXN0ZXIgR0FNTUFfTFVUIHByb3BlcnRpZXMgKDIwMTktMTAtMjIgMTM6MjE6MTggKzAz
MDApCj4gCj4gLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLQo+IC0gUi1DYXIgRFUgQ29sb3IgTWFuYWdlbWVudCBNb2R1bGUgc3Vw
cG9ydAo+IAo+IC0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0KPiBKYWNvcG8gTW9uZGkgKDYpOgo+ICAgICAgIGR0LWJpbmRpbmdz
OiBkaXNwbGF5OiByZW5lc2FzLGNtbTogQWRkIFItQ2FyIENNTSBkb2N1bWVudGF0aW9uCj4gICAg
ICAgZHQtYmluZGluZ3M6IGRpc3BsYXksIHJlbmVzYXMsZHU6IERvY3VtZW50IGNtbXMgcHJvcGVy
dHkKPiAgICAgICBkcm06IHJjYXItZHU6IEFkZCBzdXBwb3J0IGZvciBDTU0KPiAgICAgICBkcm06
IHJjYXItZHU6IGttczogSW5pdGlhbGl6ZSBDTU0gaW5zdGFuY2VzCj4gICAgICAgZHJtOiByY2Fy
LWR1OiBjcnRjOiBDb250cm9sIENNTSBvcGVyYXRpb25zCj4gICAgICAgZHJtOiByY2FyLWR1OiBj
cnRjOiBSZWdpc3RlciBHQU1NQV9MVVQgcHJvcGVydGllcwo+IAo+ICAuLi4vZGV2aWNldHJlZS9i
aW5kaW5ncy9kaXNwbGF5L3JlbmVzYXMsY21tLnlhbWwgICB8ICA2NyArKysrKysrCj4gIC4uLi9k
ZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkvcmVuZXNhcyxkdS50eHQgICAgIHwgICA1ICsKPiAg
ZHJpdmVycy9ncHUvZHJtL3JjYXItZHUvS2NvbmZpZyAgICAgICAgICAgICAgICAgICAgfCAgIDcg
Kwo+ICBkcml2ZXJzL2dwdS9kcm0vcmNhci1kdS9NYWtlZmlsZSAgICAgICAgICAgICAgICAgICB8
ICAgMSArCj4gIGRyaXZlcnMvZ3B1L2RybS9yY2FyLWR1L3JjYXJfY21tLmMgICAgICAgICAgICAg
ICAgIHwgMjE3ICsrKysrKysrKysrKysrKysrKysrKwo+ICBkcml2ZXJzL2dwdS9kcm0vcmNhci1k
dS9yY2FyX2NtbS5oICAgICAgICAgICAgICAgICB8ICA1OCArKysrKysKPiAgZHJpdmVycy9ncHUv
ZHJtL3JjYXItZHUvcmNhcl9kdV9jcnRjLmMgICAgICAgICAgICAgfCAgNzEgKysrKysrKwo+ICBk
cml2ZXJzL2dwdS9kcm0vcmNhci1kdS9yY2FyX2R1X2NydGMuaCAgICAgICAgICAgICB8ICAgMiAr
Cj4gIGRyaXZlcnMvZ3B1L2RybS9yY2FyLWR1L3JjYXJfZHVfZHJ2LmggICAgICAgICAgICAgIHwg
ICAyICsKPiAgZHJpdmVycy9ncHUvZHJtL3JjYXItZHUvcmNhcl9kdV9ncm91cC5jICAgICAgICAg
ICAgfCAgMTAgKwo+ICBkcml2ZXJzL2dwdS9kcm0vcmNhci1kdS9yY2FyX2R1X2dyb3VwLmggICAg
ICAgICAgICB8ICAgMiArCj4gIGRyaXZlcnMvZ3B1L2RybS9yY2FyLWR1L3JjYXJfZHVfa21zLmMg
ICAgICAgICAgICAgIHwgIDc2ICsrKysrKysrCj4gIGRyaXZlcnMvZ3B1L2RybS9yY2FyLWR1L3Jj
YXJfZHVfcmVncy5oICAgICAgICAgICAgIHwgICA1ICsKPiAgMTMgZmlsZXMgY2hhbmdlZCwgNTIz
IGluc2VydGlvbnMoKykKPiAgY3JlYXRlIG1vZGUgMTAwNjQ0IERvY3VtZW50YXRpb24vZGV2aWNl
dHJlZS9iaW5kaW5ncy9kaXNwbGF5L3JlbmVzYXMsY21tLnlhbWwKPiAgY3JlYXRlIG1vZGUgMTAw
NjQ0IGRyaXZlcnMvZ3B1L2RybS9yY2FyLWR1L3JjYXJfY21tLmMKPiAgY3JlYXRlIG1vZGUgMTAw
NjQ0IGRyaXZlcnMvZ3B1L2RybS9yY2FyLWR1L3JjYXJfY21tLmgKCi0tIApSZWdhcmRzLAoKTGF1
cmVudCBQaW5jaGFydApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5v
cmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2
ZWw=
