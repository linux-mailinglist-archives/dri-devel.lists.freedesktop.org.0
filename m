Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D0C682CC54
	for <lists+dri-devel@lfdr.de>; Tue, 28 May 2019 18:42:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3B19288EE9;
	Tue, 28 May 2019 16:42:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk4.altibox.net (asavdk4.altibox.net [109.247.116.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CED5688EE9
 for <dri-devel@lists.freedesktop.org>; Tue, 28 May 2019 16:42:16 +0000 (UTC)
Received: from ravnborg.org (unknown [158.248.194.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk4.altibox.net (Postfix) with ESMTPS id 08749803BC;
 Tue, 28 May 2019 18:42:14 +0200 (CEST)
Date: Tue, 28 May 2019 18:42:13 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Subject: Re: [PATCH v3 07/10] drm: rcar-du: Skip LVDS1 output on Gen3 when
 using dual-link LVDS mode
Message-ID: <20190528164213.GB9610@ravnborg.org>
References: <20190528141234.15425-1-laurent.pinchart+renesas@ideasonboard.com>
 <20190528141234.15425-8-laurent.pinchart+renesas@ideasonboard.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190528141234.15425-8-laurent.pinchart+renesas@ideasonboard.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=VcLZwmh9 c=1 sm=1 tr=0
 a=UWs3HLbX/2nnQ3s7vZ42gw==:117 a=UWs3HLbX/2nnQ3s7vZ42gw==:17
 a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=kj9zAlcOel0A:10 a=P1BnusSwAAAA:8
 a=xIEnxEUKAAAA:8 a=Mt7EuyiCL5b_mNgCqacA:9 a=CjuIK1q_8ugA:10
 a=D0XLA9XvdZm18NrgonBM:22 a=JpDqF-G6Ufas406PgLIE:22
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
Cc: linux-renesas-soc@vger.kernel.org, Jacopo Mondi <jacopo+renesas@jmondi.org>,
 Kieran Bingham <kieran.bingham@ideasonboard.com>,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgTGF1cmVudC4KCk9uIFR1ZSwgTWF5IDI4LCAyMDE5IGF0IDA1OjEyOjMxUE0gKzAzMDAsIExh
dXJlbnQgUGluY2hhcnQgd3JvdGU6Cj4gSW4gZHVhbC1saW5rIExWRFMgbW9kZSwgdGhlIExWRFMx
IGVuY29kZXIgaXMgdXNlZCBhcyBhIGNvbXBhbmlvbiBmb3IKPiBMVkRTMCwgYW5kIGJvdGggZW5j
b2RlcnMgdHJhbnNtaXQgZGF0YSBmcm9tIERVMC4gVGhlIExWRFMxIG91dHB1dCBvZiBEVTEKPiBj
YW4ndCBiZSB1c2VkIGluIHRoYXQgY2FzZSwgZG9uJ3QgY3JlYXRlIGFuIGVuY29kZXIgYW5kIGNv
bm5lY3RvciBmb3IKPiBpdC4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBMYXVyZW50IFBpbmNoYXJ0IDxs
YXVyZW50LnBpbmNoYXJ0K3JlbmVzYXNAaWRlYXNvbmJvYXJkLmNvbT4KPiBSZXZpZXdlZC1ieTog
SmFjb3BvIE1vbmRpIDxqYWNvcG8rcmVuZXNhc0BqbW9uZGkub3JnPgo+IFRlc3RlZC1ieTogSmFj
b3BvIE1vbmRpIDxqYWNvcG8rcmVuZXNhc0BqbW9uZGkub3JnPgo+IC0tLQo+IENoYW5nZXNzIHNp
bmNlIHYyOgo+IAo+IC0gUmVtb3ZlIHVubmVlZGVkIGJyaWRnZSBOVUxMIGNoZWNrCj4gLS0tCj4g
IGRyaXZlcnMvZ3B1L2RybS9yY2FyLWR1L3JjYXJfZHVfZW5jb2Rlci5jIHwgMTIgKysrKysrKysr
KysrCj4gIGRyaXZlcnMvZ3B1L2RybS9yY2FyLWR1L3JjYXJfZHVfa21zLmMgICAgIHwgIDIgKy0K
PiAgMiBmaWxlcyBjaGFuZ2VkLCAxMyBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCj4gCj4g
ZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9yY2FyLWR1L3JjYXJfZHVfZW5jb2Rlci5jIGIv
ZHJpdmVycy9ncHUvZHJtL3JjYXItZHUvcmNhcl9kdV9lbmNvZGVyLmMKPiBpbmRleCA2YzkxNzUz
YWY3YmMuLjBmMDBiZGZlMjM2NiAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vcmNhci1k
dS9yY2FyX2R1X2VuY29kZXIuYwo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9yY2FyLWR1L3JjYXJf
ZHVfZW5jb2Rlci5jCj4gQEAgLTE2LDYgKzE2LDcgQEAKPiAgI2luY2x1ZGUgInJjYXJfZHVfZHJ2
LmgiCj4gICNpbmNsdWRlICJyY2FyX2R1X2VuY29kZXIuaCIKPiAgI2luY2x1ZGUgInJjYXJfZHVf
a21zLmgiCj4gKyNpbmNsdWRlICJyY2FyX2x2ZHMuaCIKPiAgCj4gIC8qIC0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tCj4gICAqIEVuY29kZXIKPiBAQCAtOTcsNiArOTgsMTcgQEAgaW50IHJjYXJfZHVfZW5j
b2Rlcl9pbml0KHN0cnVjdCByY2FyX2R1X2RldmljZSAqcmNkdSwKPiAgCQl9Cj4gIAl9Cj4gIAo+
ICsJLyoKPiArCSAqIE9uIEdlbjMgc2tpcCB0aGUgTFZEUzEgb3V0cHV0IGlmIHRoZSBMVkRTMSBl
bmNvZGVyIGlzIHVzZWQgYXMgYQo+ICsJICogY29tcGFuaW9uIGZvciBMVkRTMCBpbiBkdWFsLWxp
bmsgbW9kZS4KPiArCSAqLwo+ICsJaWYgKHJjZHUtPmluZm8tPmdlbiA+PSAzICYmIG91dHB1dCA9
PSBSQ0FSX0RVX09VVFBVVF9MVkRTMSkgewoKQm90aCBzdWJqZWN0IGFuZCBjb21tZW50IGFib3Zl
IHNheXMgIk9uIEdlbjMiLCBidXQgdGhlIGNvZGUgbG9va3MgbGlrZQppdCBpbXBsZW1lbnRzICJP
biBHZW4zIG9yIG5ld2VyIiAtIGR1ZSB0byB1c2Ugb2YgIj49Ii4KTG9va3Mgd3JvbmcgdG8gbWUu
CgoJU2FtCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRy
aS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRw
czovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
