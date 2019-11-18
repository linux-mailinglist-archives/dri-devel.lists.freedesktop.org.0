Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 50E52101AF9
	for <lists+dri-devel@lfdr.de>; Tue, 19 Nov 2019 09:05:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 029366EBDE;
	Tue, 19 Nov 2019 08:04:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from alexa-out-blr-01.qualcomm.com (alexa-out-blr-01.qualcomm.com
 [103.229.18.197])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D070089D4F;
 Mon, 18 Nov 2019 11:44:42 +0000 (UTC)
Received: from ironmsg02-blr.qualcomm.com ([10.86.208.131])
 by alexa-out-blr-01.qualcomm.com with ESMTP/TLS/AES256-SHA;
 18 Nov 2019 17:14:38 +0530
IronPort-SDR: /W+N4905p9RK0bzC8y4pDHSxWzvdq35sFqc8fNnmGpEeyx23W0RIi20MpIt+GMOI1VPVpwU0xm
 Y4Ljit1xnXOmWuaiBFB8uNGIv4L6TzLJMCfEIa195KrgNKFa1tprP5F8SiaHnEJECo+aHP4lMm
 +FzjlHBsv/W/aYd4D3hYIxJWto3mWi/yah44ObFeh+kyRswsWY/CHaHbS+Jy736snlWow5TYWl
 RLuO3LTFJ+wL/rEFvp6W7E/mqeG+hBUHk73WRts05semvYkg/J0Xf9SptMaQNKjYvsEgV3tb5d
 VK7Oumec49RRXdGvnlKG5gwT
Received: from kalyant-linux.qualcomm.com ([10.204.66.210])
 by ironmsg02-blr.qualcomm.com with ESMTP; 18 Nov 2019 17:14:09 +0530
Received: by kalyant-linux.qualcomm.com (Postfix, from userid 94428)
 id 521E1431A; Mon, 18 Nov 2019 17:14:08 +0530 (IST)
From: Kalyan Thota <kalyan_t@codeaurora.org>
To: dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org
Subject: [PATCH v1] msm:disp:dpu1: setup display datapath for SC7180 target
Date: Mon, 18 Nov 2019 17:14:03 +0530
Message-Id: <1574077444-24554-1-git-send-email-kalyan_t@codeaurora.org>
X-Mailer: git-send-email 1.9.1
X-Mailman-Approved-At: Tue, 19 Nov 2019 08:04:07 +0000
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
Cc: dhar@codeaurora.org, travitej@codeaurora.org, linux-kernel@vger.kernel.org,
 seanpaul@chromium.org, Kalyan Thota <kalyan_t@codeaurora.org>,
 hoegsberg@chromium.org, chandanu@codeaurora.org
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

ClNDNzE4MCBmb2xsb3dzIGEgbmV3ZXIgYXJjaGl0ZWN0dXJlIHdoZXJlIGluIHNvbWUgZmx1c2gg
Y29udHJvbHMgaGF2ZSBiZWVuIHJlLW9yZ2FuaXplZCB0byBzaW1wbGlmeSBwcm9ncmFtbWluZyBh
bmQgcHJvdmlkZSBmb3IgZnV0dXJlIGV4cGFuZGFiaWxpdHkuIApTcGVjaWZpY2FsbHk6CjEpIFRo
ZSBUSU1JTkdfPGo+IGJpdHMgdGhhdCBjb250cm9sIGZsdXNoIG9mIElOVEZfPGo+IGhhdmUgYmVl
biByZXBsYWNlZCB3aXRoIGEgY29tbW9uIElOVEYgZmx1c2ggYml0IHdoaWNoIGZsdXNoZXMgdGhl
IHByb2dyYW1taW5nIGluIHRoZSBNRFBfQ1RMXzxpZD5fSU5URl9BQ1RJVkUgcmVnaXN0ZXIKMikg
SW5kaXZpZHVhbCBmbHVzaCBiaXRzIGZvciBNRVJHRV8zRCwgRFNDIGFuZCBDRFdOIGhhdmUgYmVl
biBhZGRlZCB3aGljaCBmbHVzaCB0aGUgcHJvZ3JhbW1pbmcgaW4gdGhlIE1EUF9DVExfPGlkPl9N
RVJHRV8zRF9BQ1RJVkUsIC4uLiBldGMgcmVzcGVjdGl2ZWx5CjMpIFBFUklQSCBmbHVzaCBiaXQg
aGFzIGJlZW4gYWRkZWQgdG8gZmx1c2ggRFNQIHBhY2tldHMgZm9yIERpc3BsYXlQb3J0CgpUaGUg
Y29tcGxldGUgZGF0YXBhdGggaXMgZGVzY3JpYmVkIHVzaW5nIHRoZSBNRFBfQ1RMXzxpZD5fVE9Q
IGFuZCBuZXdseSBhZGRlZCBBQ1RJVkUgcmVnaXN0ZXJzIHRvIGhhbmRsZSBvdGhlciBzdWIgYmxv
Y2tzCnN1Y2ggYXMgaW50ZXJmYWNlIChJTlRGKSByZXNvdXJjZXMsIFBpbmdQb25nIGJ1ZmZlciAv
IExheWVyIE1peGVyLCBEaXNwbGF5IFN0cmVhbSBDb21wcmVzc2lvbiAoRFNDKSByZXNvdXJjZXMs
IHdyaXRlYmFjayAoV0IpIGFuZCAzRCBNZXJnZSAKc2VsZWN0aW9ucyB0aGF0IGFyZSBwYXJ0IG9m
IHRoZSBkYXRhcGF0aC4KCgoKS2FseWFuIFRob3RhICgxKToKICBtc206ZGlzcDpkcHUxOiBzZXR1
cCBkaXNwbGF5IGRhdGFwYXRoIGZvciBTQzcxODAgdGFyZ2V0CgogZHJpdmVycy9ncHUvZHJtL21z
bS9kaXNwL2RwdTEvZHB1X2VuY29kZXIuYyAgICAgICAgfCAgNCArLQogLi4uL2dwdS9kcm0vbXNt
L2Rpc3AvZHB1MS9kcHVfZW5jb2Rlcl9waHlzX3ZpZC5jICAgfCAyMSArKysrKy0KIGRyaXZlcnMv
Z3B1L2RybS9tc20vZGlzcC9kcHUxL2RwdV9od19jYXRhbG9nLmMgICAgIHwgIDEgKwogZHJpdmVy
cy9ncHUvZHJtL21zbS9kaXNwL2RwdTEvZHB1X2h3X2N0bC5jICAgICAgICAgfCA4NCArKysrKysr
KysrKysrKysrKysrKystCiBkcml2ZXJzL2dwdS9kcm0vbXNtL2Rpc3AvZHB1MS9kcHVfaHdfY3Rs
LmggICAgICAgICB8IDI0ICsrKysrKysKIGRyaXZlcnMvZ3B1L2RybS9tc20vZGlzcC9kcHUxL2Rw
dV9od19pbnRmLmMgICAgICAgIHwgMjggKysrKysrKysKIGRyaXZlcnMvZ3B1L2RybS9tc20vZGlz
cC9kcHUxL2RwdV9od19pbnRmLmggICAgICAgIHwgIDYgKysKIDcgZmlsZXMgY2hhbmdlZCwgMTYx
IGluc2VydGlvbnMoKyksIDcgZGVsZXRpb25zKC0pCgotLSAKMS45LjEKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QK
ZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9w
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
