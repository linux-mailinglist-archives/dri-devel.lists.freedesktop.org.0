Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 45CBB79C6C
	for <lists+dri-devel@lfdr.de>; Tue, 30 Jul 2019 00:27:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7C57589F03;
	Mon, 29 Jul 2019 22:27:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from gateway31.websitewelcome.com (gateway31.websitewelcome.com
 [192.185.143.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3CFBF89F03
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Jul 2019 22:27:55 +0000 (UTC)
Received: from cm10.websitewelcome.com (cm10.websitewelcome.com [100.42.49.4])
 by gateway31.websitewelcome.com (Postfix) with ESMTP id 755561722B5
 for <dri-devel@lists.freedesktop.org>;
 Mon, 29 Jul 2019 17:27:54 -0500 (CDT)
Received: from gator4166.hostgator.com ([108.167.133.22]) by cmsmtp with SMTP
 id sE7WhiPBe2PzOsE7WhoGX2; Mon, 29 Jul 2019 17:27:54 -0500
X-Authority-Reason: nr=8
Received: from [187.192.11.120] (port=60868 helo=embeddedor)
 by gator4166.hostgator.com with esmtpa (Exim 4.92)
 (envelope-from <gustavo@embeddedor.com>)
 id 1hsE7V-0025GC-2q; Mon, 29 Jul 2019 17:27:53 -0500
Date: Mon, 29 Jul 2019 17:27:52 -0500
From: "Gustavo A. R. Silva" <gustavo@embeddedor.com>
To: Benjamin Gaignard <benjamin.gaignard@linaro.org>,
 Vincent Abriou <vincent.abriou@st.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH] drm: sti: Mark expected switch fall-throughs
Message-ID: <20190729222752.GA20277@embeddedor>
MIME-Version: 1.0
Content-Disposition: inline
User-Agent: Mutt/1.9.4 (2018-02-28)
X-AntiAbuse: This header was added to track abuse,
 please include it with any abuse report
X-AntiAbuse: Primary Hostname - gator4166.hostgator.com
X-AntiAbuse: Original Domain - lists.freedesktop.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - embeddedor.com
X-BWhitelist: no
X-Source-IP: 187.192.11.120
X-Source-L: No
X-Exim-ID: 1hsE7V-0025GC-2q
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: (embeddedor) [187.192.11.120]:60868
X-Source-Auth: gustavo@embeddedor.com
X-Email-Count: 24
X-Source-Cap: Z3V6aWRpbmU7Z3V6aWRpbmU7Z2F0b3I0MTY2Lmhvc3RnYXRvci5jb20=
X-Local-Domain: yes
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; 
 d=embeddedor.com; s=default; h=Content-Transfer-Encoding:Content-Type:
 MIME-Version:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=jilYGKdJFUI07LgQEXiOG/Wx5IwotOgB3vmpT+7jOis=; b=TDlUM0e1F+7nTBHCJv4IHNaNTR
 vP2N3srXJTCTFRzhdCAXt5DbWsXElv57PG7gfXAA7OZEOngLZAcbO//tBgVofJ6sid1y94squEaLK
 Ytg5+5G2lCXpDinW5Hdi6KscCuOVlSAsiEK9winQLRxL7oEXglqSvybdOgMcRA/EZzSHPm4QZmI4R
 LQbqeScDgBKtLvf1PWmjl1ZjifjQYcLrLMylJ63pL1DAIOCyq/UzzHZ/EdDIDlBuCF1MLf/sxAWam
 hE4o8u0Ak8BSfQryMq3rSCMtYsApxmu0TSvJIkILNE23gmqc4DoRjugGmMV8e8/s0QSyCSOeOhTIZ
 HL7HQp7A==;
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
Cc: Kees Cook <keescook@chromium.org>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 "Gustavo A. R. Silva" <gustavo@embeddedor.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

TWFyayBzd2l0Y2ggY2FzZXMgd2hlcmUgd2UgYXJlIGV4cGVjdGluZyB0byBmYWxsIHRocm91Z2gu
CgpUaGlzIHBhdGNoIGZpeGVzIHRoZSBmb2xsb3dpbmcgd2FybmluZyAoQnVpbGRpbmc6IGFybSk6
Cgpkcml2ZXJzL2dwdS9kcm0vc3RpL3N0aV9oZG1pLmM6IEluIGZ1bmN0aW9uIOKAmGhkbWlfYXVk
aW9fY29uZmlndXJl4oCZOgpkcml2ZXJzL2dwdS9kcm0vc3RpL3N0aV9oZG1pLmM6ODUxOjEzOiB3
YXJuaW5nOiB0aGlzIHN0YXRlbWVudCBtYXkgZmFsbCB0aHJvdWdoIFstV2ltcGxpY2l0LWZhbGx0
aHJvdWdoPV0KICAgYXVkaW9fY2ZnIHw9IEhETUlfQVVEX0NGR19DSDc4X1ZBTElEOwpkcml2ZXJz
L2dwdS9kcm0vc3RpL3N0aV9oZG1pLmM6ODUyOjI6IG5vdGU6IGhlcmUKICBjYXNlIDY6CiAgXn5+
fgpkcml2ZXJzL2dwdS9kcm0vc3RpL3N0aV9oZG1pLmM6ODUzOjEzOiB3YXJuaW5nOiB0aGlzIHN0
YXRlbWVudCBtYXkgZmFsbCB0aHJvdWdoIFstV2ltcGxpY2l0LWZhbGx0aHJvdWdoPV0KICAgYXVk
aW9fY2ZnIHw9IEhETUlfQVVEX0NGR19DSDU2X1ZBTElEOwpkcml2ZXJzL2dwdS9kcm0vc3RpL3N0
aV9oZG1pLmM6ODU0OjI6IG5vdGU6IGhlcmUKICBjYXNlIDQ6CiAgXn5+fgpkcml2ZXJzL2dwdS9k
cm0vc3RpL3N0aV9oZG1pLmM6ODU1OjEzOiB3YXJuaW5nOiB0aGlzIHN0YXRlbWVudCBtYXkgZmFs
bCB0aHJvdWdoIFstV2ltcGxpY2l0LWZhbGx0aHJvdWdoPV0KICAgYXVkaW9fY2ZnIHw9IEhETUlf
QVVEX0NGR19DSDM0X1ZBTElEIHwgSERNSV9BVURfQ0ZHXzhDSDsKZHJpdmVycy9ncHUvZHJtL3N0
aS9zdGlfaGRtaS5jOjg1NjoyOiBub3RlOiBoZXJlCiAgY2FzZSAyOgogIF5+fn4KClNpZ25lZC1v
ZmYtYnk6IEd1c3Rhdm8gQS4gUi4gU2lsdmEgPGd1c3Rhdm9AZW1iZWRkZWRvci5jb20+Ci0tLQog
ZHJpdmVycy9ncHUvZHJtL3N0aS9zdGlfaGRtaS5jIHwgMyArKysKIDEgZmlsZSBjaGFuZ2VkLCAz
IGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vc3RpL3N0aV9oZG1p
LmMgYi9kcml2ZXJzL2dwdS9kcm0vc3RpL3N0aV9oZG1pLmMKaW5kZXggZjAzZDYxN2VkYzRjLi4x
NjE3YzUwOThhNTAgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9zdGkvc3RpX2hkbWkuYwor
KysgYi9kcml2ZXJzL2dwdS9kcm0vc3RpL3N0aV9oZG1pLmMKQEAgLTg0OSwxMCArODQ5LDEzIEBA
IHN0YXRpYyBpbnQgaGRtaV9hdWRpb19jb25maWd1cmUoc3RydWN0IHN0aV9oZG1pICpoZG1pKQog
CXN3aXRjaCAoaW5mby0+Y2hhbm5lbHMpIHsKIAljYXNlIDg6CiAJCWF1ZGlvX2NmZyB8PSBIRE1J
X0FVRF9DRkdfQ0g3OF9WQUxJRDsKKwkJLyogZmFsbCB0aHJvdWdoICovCiAJY2FzZSA2OgogCQlh
dWRpb19jZmcgfD0gSERNSV9BVURfQ0ZHX0NINTZfVkFMSUQ7CisJCS8qIGZhbGwgdGhyb3VnaCAq
LwogCWNhc2UgNDoKIAkJYXVkaW9fY2ZnIHw9IEhETUlfQVVEX0NGR19DSDM0X1ZBTElEIHwgSERN
SV9BVURfQ0ZHXzhDSDsKKwkJLyogZmFsbCB0aHJvdWdoICovCiAJY2FzZSAyOgogCQlhdWRpb19j
ZmcgfD0gSERNSV9BVURfQ0ZHX0NIMTJfVkFMSUQ7CiAJCWJyZWFrOwotLSAKMi4yMi4wCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFp
bGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
