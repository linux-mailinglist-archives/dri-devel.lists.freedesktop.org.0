Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E7A641CFC
	for <lists+dri-devel@lfdr.de>; Wed, 12 Jun 2019 08:56:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EC2AE89336;
	Wed, 12 Jun 2019 06:55:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from imap1.codethink.co.uk (imap1.codethink.co.uk [176.9.8.82])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F2B4089165
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Jun 2019 14:24:19 +0000 (UTC)
Received: from [167.98.27.226] (helo=happy.office.codethink.co.uk)
 by imap1.codethink.co.uk with esmtpsa (Exim 4.84_2 #1 (Debian))
 id 1hahOQ-0003vU-Hc; Tue, 11 Jun 2019 15:04:54 +0100
From: Michael Drake <michael.drake@codethink.co.uk>
To: Andrzej Hajda <a.hajda@samsung.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Michael Drake <michael.drake@codethink.co.uk>
Subject: [PATCH v1 00/11] Add ti948 and ti949 display bridge drivers
Date: Tue, 11 Jun 2019 15:04:01 +0100
Message-Id: <20190611140412.32151-1-michael.drake@codethink.co.uk>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Mailman-Approved-At: Wed, 12 Jun 2019 06:53:41 +0000
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
Cc: Mark Rutland <mark.rutland@arm.com>, linux-kernel@lists.codethink.co.uk,
 David Airlie <airlied@linux.ie>, Nate Case <ncase@tesla.com>,
 Rob Herring <robh+dt@kernel.org>, Patrick Glaser <pglaser@tesla.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGhpcyBwYXRjaCBzZXJpZXMgYWRkcyBzdXBwb3J0IGZvciB0aGUgdGk5NDggYW5kIHRpOTQ5IGRp
c3BsYXkKYnJpZGdlIGRldmljZXMuICBUaGV5IGFyZSBib3RoIHJlZ21hcCBpMmMgZGV2aWNlIGRy
aXZlcnMuCgpUaGUgdGk5NDkgY29udmVydHMgSERNSSB2aWRlbyBzaWduYWxzIHRvIEZQRC1MaW5r
IElJSS4KVGhlIHRpOTQ4IGNvbnZlcnRzIEZQRC1MaW5rIElJSSB2aWRlbyBzaWduYWxzIHRvIE9w
ZW5MREkuCgpUaGUgZHJpdmVycyBzdXBwb3J0IFBNIHN1c3BlbmQvcmVzdW1lLCBhbmQgcmVseSBv
biBkZXZpY2UgdHJlZSAvCkFDUEkgbm9kZXMgdG8gc2V0IHVwIGFueSBkZXZpY2UgZGVwZW5kZW5j
eSBjaGFpbi4gIChBQ1BJIHJlcXVpcmluZwp0aGUgc3BlY2lhbCBEVCBuYW1lc3BhY2UgbGluayBk
ZXZpY2UgSUQsIFBSUDAwMDEuKSAgVGhlIHVuaWZpZWQKZGV2aWNlIHByb3BlcnRpZXMgQVBJIGlz
IHVzZWQgdG8gZ2V0IGJvYXJkLXNwZWNpZmljIGNvbmZpZyBmcm9tCmRldmljZSB0cmVlIC8gQUNQ
SS4KCkNjOiBQYXRyaWNrIEdsYXNlciA8cGdsYXNlckB0ZXNsYS5jb20+CkNjOiBOYXRlIENhc2Ug
PG5jYXNlQHRlc2xhLmNvbT4KCk1pY2hhZWwgRHJha2UgKDExKToKICBkdC1iaW5kaW5nczogZGlz
cGxheS9icmlkZ2U6IEFkZCBiaW5kaW5ncyBmb3IgdGk5NDgKICB0aTk0ODogaTJjIGRldmljZSBk
cml2ZXIgZm9yIFRJIERTOTBVQjk0OC1RMQogIGR0LWJpbmRpbmdzOiBkaXNwbGF5L2JyaWRnZTog
QWRkIGNvbmZpZyBwcm9wZXJ0eSBmb3IgdGk5NDgKICB0aTk0ODogQWRkIHN1cHBvcnQgZm9yIGNv
bmZpZ3VyYXRpb24gdmlhIGRldmljZSBwcm9wZXJ0aWVzCiAgdGk5NDg6IEFkZCBhbGl2ZSBjaGVj
ayBmdW5jdGlvbiB1c2luZyBzY2hlZHVsZV9kZWxheWVkX3dvcmsoKQogIHRpOTQ4OiBSZWNvbmZp
Z3VyZSBpbiB0aGUgYWxpdmUgY2hlY2sgd2hlbiBkZXZpY2UgcmV0dXJucwogIHRpOTQ4OiBBZGQg
c3lzZnMgbm9kZSBmb3IgYWxpdmUgYXR0cmlidXRlCiAgZHQtYmluZGluZ3M6IGRpc3BsYXkvYnJp
ZGdlOiBBZGQgYmluZGluZ3MgZm9yIHRpOTQ5CiAgdGk5NDk6IGkyYyBkZXZpY2UgZHJpdmVyIGZv
ciBUSSBEUzkwVUI5NDktUTEKICBkdC1iaW5kaW5nczogZGlzcGxheS9icmlkZ2U6IEFkZCBjb25m
aWcgcHJvcGVydHkgZm9yIHRpOTQ5CiAgdGk5NDk6IEFkZCBzdXBwb3J0IGZvciBjb25maWd1cmF0
aW9uIHZpYSBkZXZpY2UgcHJvcGVydGllcwoKIC4uLi9iaW5kaW5ncy9kaXNwbGF5L2JyaWRnZS90
aSxkczkwdWI5NDgudHh0ICB8ICA0NSArKwogLi4uL2JpbmRpbmdzL2Rpc3BsYXkvYnJpZGdlL3Rp
LGRzOTB1Yjk0OS50eHQgIHwgIDM3ICsKIGRyaXZlcnMvZ3B1L2RybS9icmlkZ2UvS2NvbmZpZyAg
ICAgICAgICAgICAgICB8ICAxNiArCiBkcml2ZXJzL2dwdS9kcm0vYnJpZGdlL01ha2VmaWxlICAg
ICAgICAgICAgICAgfCAgIDIgKwogZHJpdmVycy9ncHUvZHJtL2JyaWRnZS90aTk0OC5jICAgICAg
ICAgICAgICAgIHwgNjg5ICsrKysrKysrKysrKysrKysrKwogZHJpdmVycy9ncHUvZHJtL2JyaWRn
ZS90aTk0OS5jICAgICAgICAgICAgICAgIHwgNjMxICsrKysrKysrKysrKysrKysKIDYgZmlsZXMg
Y2hhbmdlZCwgMTQyMCBpbnNlcnRpb25zKCspCiBjcmVhdGUgbW9kZSAxMDA2NDQgRG9jdW1lbnRh
dGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkvYnJpZGdlL3RpLGRzOTB1Yjk0OC50eHQK
IGNyZWF0ZSBtb2RlIDEwMDY0NCBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZGlz
cGxheS9icmlkZ2UvdGksZHM5MHViOTQ5LnR4dAogY3JlYXRlIG1vZGUgMTAwNjQ0IGRyaXZlcnMv
Z3B1L2RybS9icmlkZ2UvdGk5NDguYwogY3JlYXRlIG1vZGUgMTAwNjQ0IGRyaXZlcnMvZ3B1L2Ry
bS9icmlkZ2UvdGk5NDkuYwoKLS0gCjIuMjAuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlz
dHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4v
bGlzdGluZm8vZHJpLWRldmVs
