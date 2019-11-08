Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C0B6F41D8
	for <lists+dri-devel@lfdr.de>; Fri,  8 Nov 2019 09:14:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 087696F87E;
	Fri,  8 Nov 2019 08:12:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 19A456F813
 for <dri-devel@lists.freedesktop.org>; Fri,  8 Nov 2019 00:03:09 +0000 (UTC)
Received: from ip5f5a6266.dynamic.kabel-deutschland.de ([95.90.98.102]
 helo=phil.fritz.box)
 by gloria.sntech.de with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.89) (envelope-from <heiko.stuebner@theobroma-systems.com>)
 id 1iSrk0-00065H-TQ; Fri, 08 Nov 2019 01:03:04 +0100
From: Heiko Stuebner <heiko.stuebner@theobroma-systems.com>
To: dri-devel@lists.freedesktop.org,
	a.hajda@samsung.com
Subject: [PATCH v2 2/5] dt-bindings: display: rockchip-dsi: document external
 phys
Date: Fri,  8 Nov 2019 01:02:50 +0100
Message-Id: <20191108000253.8560-3-heiko.stuebner@theobroma-systems.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191108000253.8560-1-heiko.stuebner@theobroma-systems.com>
References: <20191108000253.8560-1-heiko.stuebner@theobroma-systems.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Fri, 08 Nov 2019 08:12:31 +0000
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
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, jernej.skrabec@siol.net,
 jonas@kwiboo.se, linux-kernel@vger.kernel.org, narmstrong@baylibre.com,
 philippe.cornu@st.com, yannick.fertre@st.com,
 linux-rockchip@lists.infradead.org, robh+dt@kernel.org,
 Laurent.pinchart@ideasonboard.com,
 Heiko Stuebner <heiko.stuebner@theobroma-systems.com>,
 linux-arm-kernel@lists.infradead.org, christoph.muellner@theobroma-systems.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

U29tZSBkdy1taXBpLWRzaSBpbnN0YW5jZXMgaW4gUm9ja2NoaXAgU29DcyB1c2UgZXh0ZXJuYWwg
ZHBoeXMuCkluIHRoZXNlIGNhc2VzIHRoZSBuZWVkcyBjbG9jayB3aWxsIGFsc28gYmUgZ2VuZXJh
dGVkIGV4dGVybmFsbHkKc28gdGhlc2UgZG9uJ3QgbmVlZCB0aGUgcmVmLWNsb2NrIGFzIHdlbGwu
CgpTaWduZWQtb2ZmLWJ5OiBIZWlrbyBTdHVlYm5lciA8aGVpa28uc3R1ZWJuZXJAdGhlb2Jyb21h
LXN5c3RlbXMuY29tPgotLS0KIC4uLi9iaW5kaW5ncy9kaXNwbGF5L3JvY2tjaGlwL2R3X21pcGlf
ZHNpX3JvY2tjaGlwLnR4dCAgICAgfCA3ICsrKysrLS0KIDEgZmlsZSBjaGFuZ2VkLCA1IGluc2Vy
dGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvRG9jdW1lbnRhdGlvbi9kZXZp
Y2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkvcm9ja2NoaXAvZHdfbWlwaV9kc2lfcm9ja2NoaXAudHh0
IGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkvcm9ja2NoaXAvZHdf
bWlwaV9kc2lfcm9ja2NoaXAudHh0CmluZGV4IGNlNGMxZmM5MTE2Yy4uMWJhOTIzN2QwYWMwIDEw
MDY0NAotLS0gYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS9yb2Nr
Y2hpcC9kd19taXBpX2RzaV9yb2NrY2hpcC50eHQKKysrIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0
cmVlL2JpbmRpbmdzL2Rpc3BsYXkvcm9ja2NoaXAvZHdfbWlwaV9kc2lfcm9ja2NoaXAudHh0CkBA
IC05LDggKzksOSBAQCBSZXF1aXJlZCBwcm9wZXJ0aWVzOgogLSByZWc6IFJlcHJlc2VudCB0aGUg
cGh5c2ljYWwgYWRkcmVzcyByYW5nZSBvZiB0aGUgY29udHJvbGxlci4KIC0gaW50ZXJydXB0czog
UmVwcmVzZW50IHRoZSBjb250cm9sbGVyJ3MgaW50ZXJydXB0IHRvIHRoZSBDUFUocykuCiAtIGNs
b2NrcywgY2xvY2stbmFtZXM6IFBoYW5kbGVzIHRvIHRoZSBjb250cm9sbGVyJ3MgcGxsIHJlZmVy
ZW5jZQotICBjbG9jayhyZWYpIGFuZCBBUEIgY2xvY2socGNsaykuIEZvciBSSzMzOTksIGEgcGh5
IGNvbmZpZyBjbG9jawotICAocGh5X2NmZykgYW5kIGEgZ3JmIGNsb2NrKGdyZikgYXJlIHJlcXVp
cmVkLiBBcyBkZXNjcmliZWQgaW4gWzFdLgorICBjbG9jayhyZWYpIHdoZW4gdXNpbmcgYW4gaW50
ZXJuYWwgZHBoeSBhbmQgQVBCIGNsb2NrKHBjbGspLgorICBGb3IgUkszMzk5LCBhIHBoeSBjb25m
aWcgY2xvY2sgKHBoeV9jZmcpIGFuZCBhIGdyZiBjbG9jayhncmYpCisgIGFyZSByZXF1aXJlZC4g
QXMgZGVzY3JpYmVkIGluIFsxXS4KIC0gcm9ja2NoaXAsZ3JmOiB0aGlzIHNvYyBzaG91bGQgc2V0
IEdSRiByZWdzIHRvIG11eCB2b3BsL3ZvcGIuCiAtIHBvcnRzOiBjb250YWluIGEgcG9ydCBub2Rl
IHdpdGggZW5kcG9pbnQgZGVmaW5pdGlvbnMgYXMgZGVmaW5lZCBpbiBbMl0uCiAgIEZvciB2b3Bi
LHNldCB0aGUgcmVnID0gPDA+IGFuZCBzZXQgdGhlIHJlZyA9IDwxPiBmb3Igdm9wbC4KQEAgLTE4
LDYgKzE5LDggQEAgUmVxdWlyZWQgcHJvcGVydGllczoKIC0gdmlkZW8gcG9ydCAxIGZvciBlaXRo
ZXIgYSBwYW5lbCBvciBzdWJzZXF1ZW50IGVuY29kZXIKIAogT3B0aW9uYWwgcHJvcGVydGllczoK
Ky0gcGh5czogZnJvbSBnZW5lcmFsIFBIWSBiaW5kaW5nOiB0aGUgcGhhbmRsZSBmb3IgdGhlIFBI
WSBkZXZpY2UuCistIHBoeS1uYW1lczogU2hvdWxkIGJlICJkcGh5IiBpZiBwaHlzIHJlZmVyZW5j
ZXMgYW4gZXh0ZXJuYWwgcGh5LgogLSBwb3dlci1kb21haW5zOiBhIHBoYW5kbGUgdG8gbWlwaSBk
c2kgcG93ZXIgZG9tYWluIG5vZGUuCiAtIHJlc2V0czogbGlzdCBvZiBwaGFuZGxlICsgcmVzZXQg
c3BlY2lmaWVyIHBhaXJzLCBhcyBkZXNjcmliZWQgaW4gWzNdLgogLSByZXNldC1uYW1lczogc3Ry
aW5nIHJlc2V0IG5hbWUsIG11c3QgYmUgImFwYiIuCi0tIAoyLjIzLjAKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QK
ZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9w
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
