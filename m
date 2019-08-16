Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D0B791195
	for <lists+dri-devel@lfdr.de>; Sat, 17 Aug 2019 17:27:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0425C6EB55;
	Sat, 17 Aug 2019 15:24:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from inva021.nxp.com (inva021.nxp.com [92.121.34.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7B7CC6E2E1
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Aug 2019 10:14:22 +0000 (UTC)
Received: from inva021.nxp.com (localhost [127.0.0.1])
 by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id 276ED2000E6;
 Fri, 16 Aug 2019 12:14:21 +0200 (CEST)
Received: from invc005.ap-rdc01.nxp.com (invc005.ap-rdc01.nxp.com
 [165.114.16.14])
 by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id A63A920005F;
 Fri, 16 Aug 2019 12:14:15 +0200 (CEST)
Received: from titan.ap.freescale.net (TITAN.ap.freescale.net [10.192.208.233])
 by invc005.ap-rdc01.nxp.com (Postfix) with ESMTP id A222C40293;
 Fri, 16 Aug 2019 18:14:08 +0800 (SGT)
From: Wen He <wen.he_1@nxp.com>
To: linux-devel@linux.nxdi.nxp.com, Liviu Dudau <liviu.dudau@arm.com>,
 Brian Starkey <brian.starkey@arm.com>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, Rob Herring <robh+dt@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 leoyang.li@nxp.com
Subject: [v3 1/2] dt/bindings: display: Add optional property node for Mali
 DP500
Date: Fri, 16 Aug 2019 18:04:23 +0800
Message-Id: <20190816100424.5366-1-wen.he_1@nxp.com>
X-Mailer: git-send-email 2.9.5
X-Virus-Scanned: ClamAV using ClamSMTP
X-Mailman-Approved-At: Sat, 17 Aug 2019 15:24:21 +0000
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
Cc: Wen He <wen.he_1@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QWRkIG9wdGlvbmFsIHByb3BlcnR5IG5vZGUgJ2FybSxtYWxpZHAtYXJxb3MtdmFsdWUnIGZvciB0
aGUgTWFsaSBEUDUwMC4KVGhpcyBwcm9wZXJ0eSBkZXNjcmliZSB0aGUgQVJRb1MgbGV2ZWxzIG9m
IERQNTAwJ3MgUW9TIHNpZ25hbGluZy4KClNpZ25lZC1vZmYtYnk6IFdlbiBIZSA8d2VuLmhlXzFA
bnhwLmNvbT4KLS0tCmNoYW5nZSBpbiB2MzoKICAgICAgICAtIGNvcnJlY3Rpb24gdGhlIGRlc2Ny
aWJlIG9mIHRoZSBub2RlCgogRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3Bs
YXkvYXJtLG1hbGlkcC50eHQgfCAzICsrKwogMSBmaWxlIGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygr
KQoKZGlmZiAtLWdpdCBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5
L2FybSxtYWxpZHAudHh0IGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3Bs
YXkvYXJtLG1hbGlkcC50eHQKaW5kZXggMmY3ODcwOTgzZWYxLi4xZjcxMWQzMmYyMzUgMTAwNjQ0
Ci0tLSBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5L2FybSxtYWxp
ZHAudHh0CisrKyBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5L2Fy
bSxtYWxpZHAudHh0CkBAIC0zNyw2ICszNyw4IEBAIE9wdGlvbmFsIHByb3BlcnRpZXM6CiAgICAg
RG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3Jlc2VydmVkLW1lbW9yeS9yZXNlcnZl
ZC1tZW1vcnkudHh0KQogICAgIHRvIGJlIHVzZWQgZm9yIHRoZSBmcmFtZWJ1ZmZlcjsgaWYgbm90
IHByZXNlbnQsIHRoZSBmcmFtZWJ1ZmZlciBtYXkKICAgICBiZSBsb2NhdGVkIGFueXdoZXJlIGlu
IG1lbW9yeS4KKyAgLSBhcm0sbWFsaWRwLWFycW9zLWhpZ2gtbGV2ZWw6IHBoYW5kbGUgdG8gZGVz
Y3JpYmluZyB0aGUgQVJRb1MgbGV2ZWxzIG9mIERQNTAwJ3MKKyAgICBRb1Mgc2lnbmFsaW5nLgog
CiAKIEV4YW1wbGU6CkBAIC01NCw2ICs1Niw3IEBAIEV4YW1wbGU6CiAJCWNsb2NrcyA9IDwmb3Nj
Y2xrMj4sIDwmZnBnYW9zYzA+LCA8JmZwZ2Fvc2MxPiwgPCZmcGdhb3NjMT47CiAJCWNsb2NrLW5h
bWVzID0gInB4bGNsayIsICJtY2xrIiwgImFjbGsiLCAicGNsayI7CiAJCWFybSxtYWxpZHAtb3V0
cHV0LXBvcnQtbGluZXMgPSAvYml0cy8gOCA8OCA4IDg+OworCQlhcm0sbWFsaWRwLWFycW9zLWhp
Z2gtbGV2ZWwgPSA8JnJxb3N2YWx1ZT47CiAJCXBvcnQgewogCQkJZHAwX291dHB1dDogZW5kcG9p
bnQgewogCQkJCXJlbW90ZS1lbmRwb2ludCA9IDwmdGRhOTk4eF8yX2lucHV0PjsKLS0gCjIuMTcu
MQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRl
dmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8v
bGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
