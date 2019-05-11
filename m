Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 033611A945
	for <lists+dri-devel@lfdr.de>; Sat, 11 May 2019 21:32:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5363289AB5;
	Sat, 11 May 2019 19:32:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6356D89AB5
 for <dri-devel@lists.freedesktop.org>; Sat, 11 May 2019 19:32:44 +0000 (UTC)
Received: from pendragon.ideasonboard.com (81-175-216-236.bb.dnainternet.fi
 [81.175.216.236])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 9466F2B6;
 Sat, 11 May 2019 21:32:42 +0200 (CEST)
Date: Sat, 11 May 2019 22:32:26 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Matt Redfearn <matt.redfearn@thinci.com>
Subject: Re: [PATCH] drm/bridge: adv7511: Fix low refresh rate selection
Message-ID: <20190511193226.GO13043@pendragon.ideasonboard.com>
References: <20190424132210.26338-1-matt.redfearn@thinci.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190424132210.26338-1-matt.redfearn@thinci.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=ideasonboard.com; s=mail; t=1557603162;
 bh=4GxJMWPvsoT7sFOH6pc36YVXHmeGHUgyYVxKO5tdj9o=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=qPeEvNAymM9eKh3Qwo99SifRNGsfBkUKuBbkdHyqQXDjM26T+QWENZN1wP9bZJPSK
 AsJ9RTRH3yLdizwG/v/lZmC9iub8mKO1ri/rapjQZP2GJjxWvR7+NKDuMg1M5tE4OO
 0BQJtf7fldzjxQ4FLShSoM8HWsmqOAVSv3y3981I=
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
Cc: Archit Taneja <architt@codeaurora.org>, David Airlie <airlied@linux.ie>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Matthew Redfearn <matthew.redfearn@thinci.com>,
 Jia-Ju Bai <baijiaju1990@gmail.com>, Sean Paul <seanpaul@chromium.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgTWF0dCwKClRoYW5rIHlvdSBmb3IgdGhlIHBhdGNoLgoKT24gV2VkLCBBcHIgMjQsIDIwMTkg
YXQgMDE6MjI6MjdQTSArMDAwMCwgTWF0dCBSZWRmZWFybiB3cm90ZToKPiBUaGUgZHJpdmVyIGN1
cnJlbnRseSBzZXRzIHJlZ2lzdGVyIDB4ZmIgKExvdyBSZWZyZXNoIFJhdGUpIGJhc2VkIG9uIHRo
ZQo+IHZhbHVlIG9mIG1vZGUtPnZyZWZyZXNoLiBGaXJzdGx5LCB0aGlzIGZpZWxkIGlzIHNwZWNp
ZmllZCB0byBiZSBpbiBIeiwKPiBidXQgdGhlIG1hZ2ljIG51bWJlcnMgdXNlZCBieSB0aGUgY29k
ZSBhcmUgSHogKiAxMDAwLiBUaGlzIGVzc2VudGlhbGx5Cj4gbGVhZHMgdG8gdGhlIGxvdyByZWZy
ZXNoIHJhdGUgYWx3YXlzIGJlaW5nIHNldCB0byAweDAxLCBzaW5jZSB0aGUKPiB2cmVmcmVzaCB2
YWx1ZSB3aWxsIGFsd2F5cyBiZSBsZXNzIHRoYW4gMjQwMDAuIEZpeCB0aGUgbWFnaWMgbnVtYmVy
cyB0bwo+IGJlIGluIEh6Lgo+IFNlY29uZGx5LCBhY2NvcmRpbmcgdG8gdGhlIGNvbW1lbnQgaW4g
ZHJtX21vZGVzLmgsIHRoZSBmaWVsZCBpcyBub3QKPiBzdXBwb3NlZCB0byBiZSB1c2VkIGluIGEg
ZnVuY3Rpb25hbCB3YXkgYW55d2F5LiBJbnN0ZWFkLCB1c2UgdGhlIGhlbHBlcgo+IGZ1bmN0aW9u
IGRybV9tb2RlX3ZyZWZyZXNoKCkuCj4gCj4gRml4ZXM6IDljOGFmODgyYmYxMiAoImRybTogQWRk
IGFkdjc1MTEgZW5jb2RlciBkcml2ZXIiKQo+IFNpZ25lZC1vZmYtYnk6IE1hdHQgUmVkZmVhcm4g
PG1hdHQucmVkZmVhcm5AdGhpbmNpLmNvbT4KCldvdywgYSA0LjUgeWVhciBvbGQgYnVnIGZpeCwg
bmljZSA6LSkKClJldmlld2VkLWJ5OiBMYXVyZW50IFBpbmNoYXJ0IDxsYXVyZW50LnBpbmNoYXJ0
QGlkZWFzb25ib2FyZC5jb20+Cgo+IC0tLQo+IAo+ICBkcml2ZXJzL2dwdS9kcm0vYnJpZGdlL2Fk
djc1MTEvYWR2NzUxMV9kcnYuYyB8IDYgKysrLS0tCj4gIDEgZmlsZSBjaGFuZ2VkLCAzIGluc2Vy
dGlvbnMoKyksIDMgZGVsZXRpb25zKC0pCj4gCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2Ry
bS9icmlkZ2UvYWR2NzUxMS9hZHY3NTExX2Rydi5jIGIvZHJpdmVycy9ncHUvZHJtL2JyaWRnZS9h
ZHY3NTExL2Fkdjc1MTFfZHJ2LmMKPiBpbmRleCA4NWMyZDQwN2E1Mi4uZTdkZGQzZTNkYjkgMTAw
NjQ0Cj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2JyaWRnZS9hZHY3NTExL2Fkdjc1MTFfZHJ2LmMK
PiArKysgYi9kcml2ZXJzL2dwdS9kcm0vYnJpZGdlL2Fkdjc1MTEvYWR2NzUxMV9kcnYuYwo+IEBA
IC03NDcsMTEgKzc0NywxMSBAQCBzdGF0aWMgdm9pZCBhZHY3NTExX21vZGVfc2V0KHN0cnVjdCBh
ZHY3NTExICphZHY3NTExLAo+ICAJCQl2c3luY19wb2xhcml0eSA9IDE7Cj4gIAl9Cj4gIAo+IC0J
aWYgKG1vZGUtPnZyZWZyZXNoIDw9IDI0MDAwKQo+ICsJaWYgKGRybV9tb2RlX3ZyZWZyZXNoKG1v
ZGUpIDw9IDI0KQo+ICAJCWxvd19yZWZyZXNoX3JhdGUgPSBBRFY3NTExX0xPV19SRUZSRVNIX1JB
VEVfMjRIWjsKPiAtCWVsc2UgaWYgKG1vZGUtPnZyZWZyZXNoIDw9IDI1MDAwKQo+ICsJZWxzZSBp
ZiAoZHJtX21vZGVfdnJlZnJlc2gobW9kZSkgPD0gMjUpCj4gIAkJbG93X3JlZnJlc2hfcmF0ZSA9
IEFEVjc1MTFfTE9XX1JFRlJFU0hfUkFURV8yNUhaOwo+IC0JZWxzZSBpZiAobW9kZS0+dnJlZnJl
c2ggPD0gMzAwMDApCj4gKwllbHNlIGlmIChkcm1fbW9kZV92cmVmcmVzaChtb2RlKSA8PSAzMCkK
PiAgCQlsb3dfcmVmcmVzaF9yYXRlID0gQURWNzUxMV9MT1dfUkVGUkVTSF9SQVRFXzMwSFo7Cj4g
IAllbHNlCj4gIAkJbG93X3JlZnJlc2hfcmF0ZSA9IEFEVjc1MTFfTE9XX1JFRlJFU0hfUkFURV9O
T05FOwoKLS0gClJlZ2FyZHMsCgpMYXVyZW50IFBpbmNoYXJ0Cl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRl
dmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
