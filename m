Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BE7BE5987F
	for <lists+dri-devel@lfdr.de>; Fri, 28 Jun 2019 12:34:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E3DF76E8D0;
	Fri, 28 Jun 2019 10:34:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0BD496E8D0
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Jun 2019 10:34:17 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 3CFBD3082E55;
 Fri, 28 Jun 2019 10:34:14 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-116-96.ams2.redhat.com
 [10.36.116.96])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D77B05C70C;
 Fri, 28 Jun 2019 10:34:13 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id D90AF16E05; Fri, 28 Jun 2019 12:34:12 +0200 (CEST)
Date: Fri, 28 Jun 2019 12:34:12 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
To: Chia-I Wu <olvaffe@gmail.com>
Subject: Re: [PATCH v4 08/12] drm/virtio: rework virtio_gpu_execbuffer_ioctl
 fencing
Message-ID: <20190628103412.f2n7ybp3qtxbhdk4@sirius.home.kraxel.org>
References: <20190620060726.926-1-kraxel@redhat.com>
 <20190620060726.926-9-kraxel@redhat.com>
 <CAPaKu7QjuKMJfhTVOzBsUb8cT9cGgesG_-skQeBO8hL8UqcAzw@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAPaKu7QjuKMJfhTVOzBsUb8cT9cGgesG_-skQeBO8hL8UqcAzw@mail.gmail.com>
User-Agent: NeoMutt/20180716
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.46]); Fri, 28 Jun 2019 10:34:16 +0000 (UTC)
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
Cc: David Airlie <airlied@linux.ie>, open list <linux-kernel@vger.kernel.org>,
 ML dri-devel <dri-devel@lists.freedesktop.org>,
 "open list:VIRTIO GPU DRIVER" <virtualization@lists.linux-foundation.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

ICBIaSwKCj4gPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vdmlydGlvL3ZpcnRncHVfZHJ2LmgKPiA+
ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS92aXJ0aW8vdmlydGdwdV9kcnYuaAo+ID4gQEAgLTEyMCw5
ICsxMjAsOSBAQCBzdHJ1Y3QgdmlydGlvX2dwdV92YnVmZmVyIHsKPiA+Cj4gPiAgICAgICAgIGNo
YXIgKnJlc3BfYnVmOwo+ID4gICAgICAgICBpbnQgcmVzcF9zaXplOwo+ID4gLQo+ID4gICAgICAg
ICB2aXJ0aW9fZ3B1X3Jlc3BfY2IgcmVzcF9jYjsKPiA+Cj4gPiArICAgICAgIHN0cnVjdCB2aXJ0
aW9fZ3B1X29iamVjdF9hcnJheSAqb2JqczsKPiBUaGlzIGNhbiB1c2UgYSBjb21tZW50IChlLmcu
LCBvYmplY3RzIHJlZmVyZW5jZWQgYnkgdGhlIHZidWZmZXIpCgpJTUhPIHRoaXMgaXMgb2J2aW91
cyAuLi4KCj4gPiAgdm9pZCB2aXJ0aW9fZ3B1X2NtZF9zdWJtaXQoc3RydWN0IHZpcnRpb19ncHVf
ZGV2aWNlICp2Z2RldiwKPiA+ICAgICAgICAgICAgICAgICAgICAgICAgICAgIHZvaWQgKmRhdGEs
IHVpbnQzMl90IGRhdGFfc2l6ZSwKPiA+IC0gICAgICAgICAgICAgICAgICAgICAgICAgIHVpbnQz
Ml90IGN0eF9pZCwgc3RydWN0IHZpcnRpb19ncHVfZmVuY2UgKmZlbmNlKTsKPiA+ICsgICAgICAg
ICAgICAgICAgICAgICAgICAgIHVpbnQzMl90IGN0eF9pZCwgc3RydWN0IHZpcnRpb19ncHVfZmVu
Y2UgKmZlbmNlLAo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgc3RydWN0IHZpcnRpb19n
cHVfb2JqZWN0X2FycmF5ICpvYmpzKTsKPiBDYW4gd2Uga2VlcCBmZW5jZSwgd2hpY2ggaXMgdXBk
YXRlZCwgYXMgdGhlIGxhc3QgcGFyYW1ldGVyPwoKRml4ZWQuCgo+ID4gKyAgICAgICBpZiAoYnVm
bGlzdCkgewo+ID4gKyAgICAgICAgICAgICAgIGZvciAoaSA9IDA7IGkgPCBleGJ1Zi0+bnVtX2Jv
X2hhbmRsZXM7IGkrKykKPiA+ICsgICAgICAgICAgICAgICAgICAgICAgIHJlc2VydmF0aW9uX29i
amVjdF9hZGRfZXhjbF9mZW5jZShidWZsaXN0LT5vYmpzW2ldLT5yZXN2LAo+ID4gKyAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICZvdXRfZmVu
Y2UtPmYpOwo+ID4gKyAgICAgICAgICAgICAgIGRybV9nZW1fdW5sb2NrX3Jlc2VydmF0aW9ucyhi
dWZsaXN0LT5vYmpzLCBidWZsaXN0LT5uZW50cywKPiA+ICsgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgJnRpY2tldCk7Cj4gPiArICAgICAgIH0KPiBXZSB1c2VkIHRv
IHVubG9jayBhZnRlciB2aXJ0aW9fZ3B1X2NtZF9zdWJtaXQuCj4gCj4gSSBndWVzcywgdGhlIGZl
bmNlIGlzIGNvbnNpZGVyZWQgc2lnbmFsZWQgKGJlY2F1c2UgaXRzIHNlcW5vIGlzIHN0aWxsCj4g
MCkgdW50aWwgYWZ0ZXIgdmlydGlvX2dwdV9jbWRfc3VibWl0LiAgV2UgcHJvYmFibHkgZG9uJ3Qg
d2FudCBvdGhlcgo+IHByb2Nlc3NlcyB0byBzZWUgdGhlIHNlbWktaW5pdGlhbGl6ZWQgZmVuY2Uu
CgpHb29kIHBvaW50LiAgRml4ZWQuCgo+ID4gIG91dF9tZW1kdXA6Cj4gPiAgICAgICAgIGtmcmVl
KGJ1Zik7Cj4gPiAgb3V0X3VucmVzdjoKPiA+IC0gICAgICAgdHRtX2V1X2JhY2tvZmZfcmVzZXJ2
YXRpb24oJnRpY2tldCwgJnZhbGlkYXRlX2xpc3QpOwo+ID4gLW91dF9mcmVlOgo+ID4gLSAgICAg
ICB2aXJ0aW9fZ3B1X3VucmVmX2xpc3QoJnZhbGlkYXRlX2xpc3QpOwo+IEtlZXBpbmcgb3V0X2Zy
ZWUgdG8gZnJlZSBidWZsaXN0IHNlZW1zIGp1c3QgZmluZS4KCldlIGRvbid0IG5lZWQgdGhlIHNl
cGFyYXRlIGxhYmVsIHRob3VnaCAuLi4KCj4gPiArICAgICAgIGRybV9nZW1fdW5sb2NrX3Jlc2Vy
dmF0aW9ucyhidWZsaXN0LT5vYmpzLCBidWZsaXN0LT5uZW50cywgJnRpY2tldCk7Cj4gPiAgb3V0
X3VudXNlZF9mZDoKPiA+ICAgICAgICAga3ZmcmVlKGJvX2hhbmRsZXMpOwo+ID4gLSAgICAgICBr
dmZyZWUoYnVmbGlzdCk7Cj4gPiArICAgICAgIGlmIChidWZsaXN0KQo+ID4gKyAgICAgICAgICAg
ICAgIHZpcnRpb19ncHVfYXJyYXlfcHV0X2ZyZWUoYnVmbGlzdCk7CgouLi4gYW5kIHRoZSBidWZs
aXN0IGlzIHJlbGVhc2VkIGhlcmUgaWYgbmVlZGVkLgoKQnV0IHdlIG5lZWQgaWYgKGJ1Zmxpc3Qp
IGZvciBkcm1fZ2VtX3VubG9ja19yZXNlcnZhdGlvbnMgdG9vLiAgRml4ZWQuCgo+ID4gLQo+ID4g
LSAgICAgICAgICAgICAgIGxpc3RfZGVsKCZlbnRyeS0+bGlzdCk7Cj4gPiAtICAgICAgICAgICAg
ICAgZnJlZV92YnVmKHZnZGV2LCBlbnRyeSk7Cj4gPiAgICAgICAgIH0KPiA+ICAgICAgICAgd2Fr
ZV91cCgmdmdkZXYtPmN0cmxxLmFja19xdWV1ZSk7Cj4gPgo+ID4gICAgICAgICBpZiAoZmVuY2Vf
aWQpCj4gPiAgICAgICAgICAgICAgICAgdmlydGlvX2dwdV9mZW5jZV9ldmVudF9wcm9jZXNzKHZn
ZGV2LCBmZW5jZV9pZCk7Cj4gPiArCj4gPiArICAgICAgIGxpc3RfZm9yX2VhY2hfZW50cnlfc2Fm
ZShlbnRyeSwgdG1wLCAmcmVjbGFpbV9saXN0LCBsaXN0KSB7Cj4gPiArICAgICAgICAgICAgICAg
aWYgKGVudHJ5LT5vYmpzKQo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgdmlydGlvX2dwdV9h
cnJheV9wdXRfZnJlZShlbnRyeS0+b2Jqcyk7Cj4gPiArICAgICAgICAgICAgICAgbGlzdF9kZWwo
JmVudHJ5LT5saXN0KTsKPiBXZSBhcmUgY2xlYXJpbmcgdGhlIGxpc3QuICBJIGd1ZXNzIGxpc3Rf
ZGVsIGlzIG5vdCBuZWVkZWQuCj4gPiArICAgICAgICAgICAgICAgZnJlZV92YnVmKHZnZGV2LCBl
bnRyeSk7CgpUaGlzIGp1c3Qgc2h1ZmZsZXMgYXJvdW5kIHRoZSBjb2RlLiAgRHJvcHBpbmcgbGlz
dF9kZWwoKSBpcyB1bnJlbGF0ZWQKYW5kIHNob3VsZCBiZSBhIHNlcGFyYXRlIHBhdGNoLgoKQmVz
aWRlIHRoYXQgSSdtIG5vdCBzdXJlIGl0IGFjdHVhbGx5IGNhbiBiZSBkcm9wcGVkLiAgZnJlZV92
YnVmKCkgd2lsbApub3Qga2ZyZWUoKSB0aGUgdmJ1ZiBidXQga2VlcCBpdCBjYWNoZWQgaW4gYSBm
cmVlbGlzdCBpbnN0ZWFkLgoKY2hlZXJzLAogIEdlcmQKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVs
QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
