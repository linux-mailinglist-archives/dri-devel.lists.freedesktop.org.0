Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D7A710A4A2
	for <lists+dri-devel@lfdr.de>; Tue, 26 Nov 2019 20:37:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E0F09893A8;
	Tue, 26 Nov 2019 19:37:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk3.altibox.net (asavdk3.altibox.net [109.247.116.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 01193893A8
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Nov 2019 19:37:43 +0000 (UTC)
Received: from ravnborg.org (unknown [158.248.194.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk3.altibox.net (Postfix) with ESMTPS id A99EE20053;
 Tue, 26 Nov 2019 20:37:41 +0100 (CET)
Date: Tue, 26 Nov 2019 20:37:40 +0100
From: Sam Ravnborg <sam@ravnborg.org>
To: Mihail Atanassov <Mihail.Atanassov@arm.com>
Subject: Re: [PATCH 28/30] drm/sti: sti_vdo: Use drm_bridge_init()
Message-ID: <20191126193740.GC2044@ravnborg.org>
References: <20191126131541.47393-1-mihail.atanassov@arm.com>
 <20191126131541.47393-29-mihail.atanassov@arm.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191126131541.47393-29-mihail.atanassov@arm.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=eMA9ckh1 c=1 sm=1 tr=0
 a=UWs3HLbX/2nnQ3s7vZ42gw==:117 a=UWs3HLbX/2nnQ3s7vZ42gw==:17
 a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=kj9zAlcOel0A:10 a=7CQSdrXTAAAA:8
 a=6lCv3_9TmdkNs-__4ugA:9 a=CjuIK1q_8ugA:10 a=a-qgeE7W1pNrGK8U0ZQC:22
 a=pHzHmUro8NiASowvMSCR:22 a=Ew2E2A-JSTLzCXPT_086:22
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
Cc: David Airlie <airlied@linux.ie>, nd <nd@arm.com>,
 Vincent Abriou <vincent.abriou@st.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgTWloYWlsLgoKT24gVHVlLCBOb3YgMjYsIDIwMTkgYXQgMDE6MTY6MjZQTSArMDAwMCwgTWlo
YWlsIEF0YW5hc3NvdiB3cm90ZToKPiBObyBmdW5jdGlvbmFsIGNoYW5nZS4KPiAKPiBTaWduZWQt
b2ZmLWJ5OiBNaWhhaWwgQXRhbmFzc292IDxtaWhhaWwuYXRhbmFzc292QGFybS5jb20+Cj4gLS0t
Cj4gIGRyaXZlcnMvZ3B1L2RybS9zdGkvc3RpX2R2by5jIHwgNCArLS0tCj4gIDEgZmlsZSBjaGFu
Z2VkLCAxIGluc2VydGlvbigrKSwgMyBkZWxldGlvbnMoLSkKPiAKPiBkaWZmIC0tZ2l0IGEvZHJp
dmVycy9ncHUvZHJtL3N0aS9zdGlfZHZvLmMgYi9kcml2ZXJzL2dwdS9kcm0vc3RpL3N0aV9kdm8u
Ywo+IGluZGV4IDY4Mjg5YjBiMDYzYS4uMjBhMzk1NmIzM2JjIDEwMDY0NAo+IC0tLSBhL2RyaXZl
cnMvZ3B1L2RybS9zdGkvc3RpX2R2by5jCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL3N0aS9zdGlf
ZHZvLmMKPiBAQCAtNDYyLDkgKzQ2Miw3IEBAIHN0YXRpYyBpbnQgc3RpX2R2b19iaW5kKHN0cnVj
dCBkZXZpY2UgKmRldiwgc3RydWN0IGRldmljZSAqbWFzdGVyLCB2b2lkICpkYXRhKQo+ICAJaWYg
KCFicmlkZ2UpCj4gIAkJcmV0dXJuIC1FTk9NRU07Cj4gIAo+IC0JYnJpZGdlLT5kcml2ZXJfcHJp
dmF0ZSA9IGR2bzsKPiAtCWJyaWRnZS0+ZnVuY3MgPSAmc3RpX2R2b19icmlkZ2VfZnVuY3M7Cj4g
LQlicmlkZ2UtPm9mX25vZGUgPSBkdm8tPmRldi5vZl9ub2RlOwo+ICsJZHJtX2JyaWRnZV9pbml0
KGJyaWRnZSwgJmR2by0+ZGV2LCAmc3RpX2R2b19icmlkZ2VfZnVuY3MsIE5VTEwsIGR2byk7Cj4g
IAlkcm1fYnJpZGdlX2FkZChicmlkZ2UpOwo+ICAKPiAgCWVyciA9IGRybV9icmlkZ2VfYXR0YWNo
KGVuY29kZXIsIGJyaWRnZSwgTlVMTCk7CgpJIGNhbiBzZWUgZnJvbSBncmVwcGluZyB0aGF0IGJy
aWRnZS5kcml2ZXJfcHJpdmF0ZSBpcyB1c2VkCmluIGEgY291cGxlIG9mIG90aGVyIGZpbGVzIGlu
IHN0aS8KCkxpa2Ugc3RpX2hkbWkuYzoKICAgICAgICBicmlkZ2UtPmRyaXZlcl9wcml2YXRlID0g
aGRtaTsKICAgICAgICBicmlkZ2UtPmZ1bmNzID0gJnN0aV9oZG1pX2JyaWRnZV9mdW5jczsKICAg
ICAgICBkcm1fYnJpZGdlX2F0dGFjaChlbmNvZGVyLCBicmlkZ2UsIE5VTEwpOwoKCkkgd29uZGVy
IGlmIGEgZHJtX2JyaWRnZV9pbml0KCkgc2hvdWxkIGJlIGFkZGVkIHRoZXJlLgpJIGRpZCBub3Qg
bG9vayBjbG9zZWx5IC0gYnV0IGl0IGxvb2tlZCBzdXNwaXNpb3VzbHkuCgoJU2FtCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5n
IGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVk
ZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
