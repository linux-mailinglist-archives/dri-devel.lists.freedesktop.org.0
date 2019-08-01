Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C6927D8E7
	for <lists+dri-devel@lfdr.de>; Thu,  1 Aug 2019 11:58:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4D34C6E445;
	Thu,  1 Aug 2019 09:58:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id D78226E445
 for <dri-devel@lists.freedesktop.org>; Thu,  1 Aug 2019 09:58:40 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 70FD01570;
 Thu,  1 Aug 2019 02:58:40 -0700 (PDT)
Received: from e110455-lin.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com
 [10.121.207.14])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 2C2893F694;
 Thu,  1 Aug 2019 02:58:40 -0700 (PDT)
Received: by e110455-lin.cambridge.arm.com (Postfix, from userid 1000)
 id DF2E86802BE; Thu,  1 Aug 2019 10:58:38 +0100 (BST)
Date: Thu, 1 Aug 2019 10:58:38 +0100
From: Liviu Dudau <Liviu.Dudau@arm.com>
To: "Lowry Li (Arm Technology China)" <Lowry.Li@arm.com>
Subject: Re: [PATCH v1 2/2] drm: Clear the fence pointer when writeback job
 signaled
Message-ID: <20190801095838.2dy4nmipct3qmohc@e110455-lin.cambridge.arm.com>
References: <1564571048-15029-1-git-send-email-lowry.li@arm.com>
 <1564571048-15029-3-git-send-email-lowry.li@arm.com>
 <20190731131525.vjnkbnbatb5tbuzh@e110455-lin.cambridge.arm.com>
 <20190801063055.GA17887@lowry.li@arm.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190801063055.GA17887@lowry.li@arm.com>
User-Agent: NeoMutt/20180716
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
Cc: "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
 nd <nd@arm.com>, "airlied@linux.ie" <airlied@linux.ie>,
 "Jonathan Chai \(Arm Technology China\)" <Jonathan.Chai@arm.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "Julien Yin \(Arm Technology China\)" <Julien.Yin@arm.com>,
 "maxime.ripard@bootlin.com" <maxime.ripard@bootlin.com>,
 "kieran.bingham+renesas@ideasonboard.com"
 <kieran.bingham+renesas@ideasonboard.com>,
 "seanpaul@chromium.org" <seanpaul@chromium.org>,
 "laurent.pinchart@ideasonboard.com" <laurent.pinchart@ideasonboard.com>,
 "james qian wang \(Arm Technology China\)" <james.qian.wang@arm.com>,
 Ayan Halder <Ayan.Halder@arm.com>, "sean@poorly.run" <sean@poorly.run>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVGh1LCBBdWcgMDEsIDIwMTkgYXQgMDY6MzE6MTNBTSArMDAwMCwgTG93cnkgTGkgKEFybSBU
ZWNobm9sb2d5IENoaW5hKSB3cm90ZToKPiBIaSBMaXZpdSwKPiAKPiBPbiBXZWQsIEp1bCAzMSwg
MjAxOSBhdCAwMToxNToyNVBNICswMDAwLCBMaXZpdSBEdWRhdSB3cm90ZToKPiA+IEhpIExvd3J5
LAo+ID4gCj4gPiBPbiBXZWQsIEp1bCAzMSwgMjAxOSBhdCAxMTowNDo0NUFNICswMDAwLCBMb3dy
eSBMaSAoQXJtIFRlY2hub2xvZ3kgQ2hpbmEpIHdyb3RlOgo+ID4gPiBEdXJpbmcgaXQgc2lnbmFs
cyB0aGUgY29tcGxldGlvbiBvZiBhIHdyaXRlYmFjayBqb2IsIGFmdGVyIHJlbGVhc2luZwo+ID4g
PiB0aGUgb3V0X2ZlbmNlLCB3ZSdkIGNsZWFyIHRoZSBwb2ludGVyLgo+ID4gPiAKPiA+ID4gQ2hl
Y2sgaWYgZmVuY2UgbGVmdCBvdmVyIGluIGRybV93cml0ZWJhY2tfY2xlYW51cF9qb2IoKSwgcmVs
ZWFzZSBpdC4KPiA+ID4gCj4gPiA+IFNpZ25lZC1vZmYtYnk6IExvd3J5IExpIChBcm0gVGVjaG5v
bG9neSBDaGluYSkgPGxvd3J5LmxpQGFybS5jb20+Cj4gPiA+IC0tLQo+ID4gPiAgZHJpdmVycy9n
cHUvZHJtL2RybV93cml0ZWJhY2suYyB8IDIzICsrKysrKysrKysrKysrKy0tLS0tLS0tCj4gPiA+
ICAxIGZpbGUgY2hhbmdlZCwgMTUgaW5zZXJ0aW9ucygrKSwgOCBkZWxldGlvbnMoLSkKPiA+ID4g
Cj4gPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vZHJtX3dyaXRlYmFjay5jIGIvZHJp
dmVycy9ncHUvZHJtL2RybV93cml0ZWJhY2suYwo+ID4gPiBpbmRleCBmZjEzOGI2Li40M2Q5ZTNi
IDEwMDY0NAo+ID4gPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vZHJtX3dyaXRlYmFjay5jCj4gPiA+
ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9kcm1fd3JpdGViYWNrLmMKPiA+ID4gQEAgLTMyNCw2ICsz
MjQsOSBAQCB2b2lkIGRybV93cml0ZWJhY2tfY2xlYW51cF9qb2Ioc3RydWN0IGRybV93cml0ZWJh
Y2tfam9iICpqb2IpCj4gPiA+ICAJaWYgKGpvYi0+ZmIpCj4gPiA+ICAJCWRybV9mcmFtZWJ1ZmZl
cl9wdXQoam9iLT5mYik7Cj4gPiA+ICAKPiA+ID4gKwlpZiAoam9iLT5vdXRfZmVuY2UpCj4gPiA+
ICsJCWRtYV9mZW5jZV9wdXQoam9iLT5vdXRfZmVuY2UpOwo+ID4gPiArCj4gPiA+ICAJa2ZyZWUo
am9iKTsKPiA+ID4gIH0KPiA+IAo+ID4gVGhpcyBjaGFuZ2UgbG9va3MgZ29vZC4KPiA+IAo+ID4g
PiAgRVhQT1JUX1NZTUJPTChkcm1fd3JpdGViYWNrX2NsZWFudXBfam9iKTsKPiA+ID4gQEAgLTM2
NiwyNSArMzY5LDI5IEBAIHN0YXRpYyB2b2lkIGNsZWFudXBfd29yayhzdHJ1Y3Qgd29ya19zdHJ1
Y3QgKndvcmspCj4gPiA+ICB7Cj4gPiA+ICAJdW5zaWduZWQgbG9uZyBmbGFnczsKPiA+ID4gIAlz
dHJ1Y3QgZHJtX3dyaXRlYmFja19qb2IgKmpvYjsKPiA+ID4gKwlzdHJ1Y3QgZG1hX2ZlbmNlICpv
dXRfZmVuY2U7Cj4gPiA+ICAKPiA+ID4gIAlzcGluX2xvY2tfaXJxc2F2ZSgmd2JfY29ubmVjdG9y
LT5qb2JfbG9jaywgZmxhZ3MpOwo+ID4gPiAgCWpvYiA9IGxpc3RfZmlyc3RfZW50cnlfb3JfbnVs
bCgmd2JfY29ubmVjdG9yLT5qb2JfcXVldWUsCj4gPiA+ICAJCQkJICAgICAgIHN0cnVjdCBkcm1f
d3JpdGViYWNrX2pvYiwKPiA+ID4gIAkJCQkgICAgICAgbGlzdF9lbnRyeSk7Cj4gPiA+IC0JaWYg
KGpvYikgewo+ID4gPiArCWlmIChqb2IpCj4gPiA+ICAJCWxpc3RfZGVsKCZqb2ItPmxpc3RfZW50
cnkpOwo+ID4gPiAtCQlpZiAoam9iLT5vdXRfZmVuY2UpIHsKPiA+ID4gLQkJCWlmIChzdGF0dXMp
Cj4gPiA+IC0JCQkJZG1hX2ZlbmNlX3NldF9lcnJvcihqb2ItPm91dF9mZW5jZSwgc3RhdHVzKTsK
PiA+ID4gLQkJCWRtYV9mZW5jZV9zaWduYWwoam9iLT5vdXRfZmVuY2UpOwo+ID4gPiAtCQkJZG1h
X2ZlbmNlX3B1dChqb2ItPm91dF9mZW5jZSk7Cj4gPiAKPiA+ICpIZXJlKgo+ID4gCj4gPiA+IC0J
CX0KPiA+ID4gLQl9Cj4gPiA+ICsKPiA+ID4gIAlzcGluX3VubG9ja19pcnFyZXN0b3JlKCZ3Yl9j
b25uZWN0b3ItPmpvYl9sb2NrLCBmbGFncyk7Cj4gPiA+ICAKPiA+ID4gIAlpZiAoV0FSTl9PTigh
am9iKSkKPiA+ID4gIAkJcmV0dXJuOwo+ID4gPiAgCj4gPiA+ICsJb3V0X2ZlbmNlID0gam9iLT5v
dXRfZmVuY2U7Cj4gPiA+ICsJaWYgKG91dF9mZW5jZSkgewo+ID4gPiArCQlpZiAoc3RhdHVzKQo+
ID4gPiArCQkJZG1hX2ZlbmNlX3NldF9lcnJvcihvdXRfZmVuY2UsIHN0YXR1cyk7Cj4gPiA+ICsJ
CWRtYV9mZW5jZV9zaWduYWwob3V0X2ZlbmNlKTsKPiA+ID4gKwkJZG1hX2ZlbmNlX3B1dChvdXRf
ZmVuY2UpOwo+ID4gPiArCQlqb2ItPm91dF9mZW5jZSA9IE5VTEw7Cj4gPiA+ICsJfQo+ID4gPiAr
Cj4gPiAKPiA+IEkgZG9uJ3QgZ2V0IHRoZSBwb2ludCBvZiB0aGlzIGNoYW5nZS4gV2h5IG5vdCBq
dXN0IGFkZCBqb2ItPm91dF9mZW5jZSA9IE5VTEwKPiA+IHdoZXJlICpIZXJlKiBpcz8KPiA+Cj4g
PiBCZXN0IHJlZ2FyZHMsCj4gPiBMaXZpdSAKPiBCZXNpZGVzIHNldHRpbmcgTlVMTCwgYWxzbyBk
aWQgYSByZWZpbmUgYnkgbW92aW5nIHRoZSBmZW5jZSBvcGVyYXRpb24KPiBvdXQgb2YgdGhlIGxv
Y2sgYmxvY2suCgpPSywgbm93IGl0IG1ha2VzIHNlbnNlLiBNYXkgSSBzdWdnZXN0IHlvdSBhZGQg
dGhhdCB0byB0aGUgY29tbWl0IG1lc3NhZ2U/CgpPdGhlcndpc2UsIEFja2VkLWJ5OiBMaXZpdSBE
dWRhdSA8bGl2aXUuZHVkYXVAYXJtLmNvbT4KCkJlc3QgcmVnYXJkcywKTGl2aXUKCj4gCj4gQmVz
dCByZWdhcmRzLAo+IExvd3J5IAo+ID4gPiAgCUlOSVRfV09SSygmam9iLT5jbGVhbnVwX3dvcmss
IGNsZWFudXBfd29yayk7Cj4gPiA+ICAJcXVldWVfd29yayhzeXN0ZW1fbG9uZ193cSwgJmpvYi0+
Y2xlYW51cF93b3JrKTsKPiA+ID4gIH0KPiA+ID4gLS0gCj4gPiA+IDEuOS4xCj4gPiA+IAo+ID4g
Cj4gPiAtLSAKPiA+ID09PT09PT09PT09PT09PT09PT09Cj4gPiB8IEkgd291bGQgbGlrZSB0byB8
Cj4gPiB8IGZpeCB0aGUgd29ybGQsICB8Cj4gPiB8IGJ1dCB0aGV5J3JlIG5vdCB8Cj4gPiB8IGdp
dmluZyBtZSB0aGUgICB8Cj4gPiAgXCBzb3VyY2UgY29kZSEgIC8KPiA+ICAgLS0tLS0tLS0tLS0t
LS0tCj4gPiAgICAgwq9cXyjjg4QpXy/Crwo+IAo+IC0tIAo+IFJlZ2FyZHMsCj4gTG93cnkKCi0t
IAo9PT09PT09PT09PT09PT09PT09PQp8IEkgd291bGQgbGlrZSB0byB8CnwgZml4IHRoZSB3b3Js
ZCwgIHwKfCBidXQgdGhleSdyZSBub3QgfAp8IGdpdmluZyBtZSB0aGUgICB8CiBcIHNvdXJjZSBj
b2RlISAgLwogIC0tLS0tLS0tLS0tLS0tLQogICAgwq9cXyjjg4QpXy/CrwpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0
CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3Rv
cC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
