Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7001CF7A34
	for <lists+dri-devel@lfdr.de>; Mon, 11 Nov 2019 18:49:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3C3AA6E9A4;
	Mon, 11 Nov 2019 17:49:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 1436 seconds by postgrey-1.36 at gabe;
 Mon, 11 Nov 2019 17:49:32 UTC
Received: from gateway32.websitewelcome.com (gateway32.websitewelcome.com
 [192.185.145.171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1A7C06E9A4
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Nov 2019 17:49:32 +0000 (UTC)
Received: from cm17.websitewelcome.com (cm17.websitewelcome.com [100.42.49.20])
 by gateway32.websitewelcome.com (Postfix) with ESMTP id 9BCDFB7FCB
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Nov 2019 11:25:35 -0600 (CST)
Received: from gator4166.hostgator.com ([108.167.133.22]) by cmsmtp with SMTP
 id UDRXi4xTVqNtvUDRXiu2TH; Mon, 11 Nov 2019 11:25:35 -0600
X-Authority-Reason: nr=8
Received: from [187.192.2.30] (port=45762 helo=embeddedor)
 by gator4166.hostgator.com with esmtpa (Exim 4.92)
 (envelope-from <gustavo@embeddedor.com>)
 id 1iUDRU-001CZi-Un; Mon, 11 Nov 2019 11:25:33 -0600
Date: Mon, 11 Nov 2019 11:25:43 -0600
From: "Gustavo A. R. Silva" <gustavo@embeddedor.com>
To: Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 "David (ChunMing) Zhou" <David1.Zhou@amd.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Mikita Lipski <mikita.lipski@amd.com>, Lyude Paul <lyude@redhat.com>,
 Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>
Subject: [PATCH] drm/amd/display: Fix unsigned variable compared to less than
 zero
Message-ID: <20191111172543.GA31748@embeddedor>
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
X-Source-IP: 187.192.2.30
X-Source-L: No
X-Exim-ID: 1iUDRU-001CZi-Un
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: (embeddedor) [187.192.2.30]:45762
X-Source-Auth: gustavo@embeddedor.com
X-Email-Count: 12
X-Source-Cap: Z3V6aWRpbmU7Z3V6aWRpbmU7Z2F0b3I0MTY2Lmhvc3RnYXRvci5jb20=
X-Local-Domain: yes
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; 
 d=embeddedor.com; s=default; h=Content-Type:MIME-Version:Message-ID:Subject:
 Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=obJGNctpNomw0ORl8GMTnOXHVQTOW6QwMfGlRbchZDQ=; b=viQc/KpkyqpjaooaNayckCTFw5
 jPT+0IfyxeHPWb8eVLnXjU0UNzYGM+p0EvVAX8Ex1+EUwP1W+zbACBcdlQaS8+bCFJnU7q1PjsXXu
 bC0NPhCyZxaLPIp76IzUT8B2V/swRFzeHxsKtalaVs43Pc8DQ+vNNE1B+cJA78YL3wZ6fl9fZegLg
 n4/aIk6NZOtbzzNEKxJad2pCp/locExG7MJulTuSwcfXn/84kPBCbUQGwylAdhgCNHGmU9h4XCBqs
 Br+CFXHcgMvh2BTDHzYfbkhfWPE8MP1uDDjm0hnx5Tltn0FYqZ7SvKEb7Peel/MPrZ9EbCzSs3rHL
 giAKWVQg==;
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
Cc: "Gustavo A. R. Silva" <gustavo@embeddedor.com>,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Q3VycmVubHksIHRoZSBlcnJvciBjaGVjayBiZWxvdyBvbiB2YXJpYWJsZSAqdmNwaV9zbG90cyog
aXMgYWx3YXlzCmZhbHNlIGJlY2F1c2UgaXQgaXMgYSB1aW50NjRfdCB0eXBlIHZhcmlhYmxlLCBo
ZW5jZSwgdGhlIHZhbHVlcwp0aGlzIHZhcmlhYmxlIGNhbiBob2xkIGFyZSBuZXZlciBsZXNzIHRo
YW4gemVybzoKCmRyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9hbWRncHVfZG0vYW1kZ3B1X2Rt
LmM6CjQ4NzAgICAgICAgICBpZiAoZG1fbmV3X2Nvbm5lY3Rvcl9zdGF0ZS0+dmNwaV9zbG90cyA8
IDApIHsKNDg3MSAgICAgICAgICAgICAgICAgRFJNX0RFQlVHX0FUT01JQygiZmFpbGVkIGZpbmRp
bmcgdmNwaSBzbG90czogJWRcbiIsIChpbnQpZG1fbmV3X2Nvbm5lY3Rvcl9zdGF0ICAgICBlLT52
Y3BpX3Nsb3RzKTsKNDg3MiAgICAgICAgICAgICAgICAgcmV0dXJuIGRtX25ld19jb25uZWN0b3Jf
c3RhdGUtPnZjcGlfc2xvdHM7CjQ4NzMgICAgICAgICB9CgpGaXggdGhpcyBieSBtYWtpbmcgKnZj
cGlfc2xvdHMqIG9mIGludCB0eXBlLgoKQWRkcmVzc2VzLUNvdmVyaXR5OiAxNDg3ODM4ICgiVW5z
aWduZWQgY29tcGFyZWQgYWdhaW5zdCAwIikKRml4ZXM6IGI0YzU3OGYwODM3OCAoImRybS9hbWQv
ZGlzcGxheTogQWRkIE1TVCBhdG9taWMgcm91dGluZXMiKQpTaWduZWQtb2ZmLWJ5OiBHdXN0YXZv
IEEuIFIuIFNpbHZhIDxndXN0YXZvQGVtYmVkZGVkb3IuY29tPgotLS0KIGRyaXZlcnMvZ3B1L2Ry
bS9hbWQvZGlzcGxheS9hbWRncHVfZG0vYW1kZ3B1X2RtLmggfCAyICstCiAxIGZpbGUgY2hhbmdl
ZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dw
dS9kcm0vYW1kL2Rpc3BsYXkvYW1kZ3B1X2RtL2FtZGdwdV9kbS5oIGIvZHJpdmVycy9ncHUvZHJt
L2FtZC9kaXNwbGF5L2FtZGdwdV9kbS9hbWRncHVfZG0uaAppbmRleCA2ZGIwN2U5ZTMzYWIuLmE4
ZmM5MGE5MjdkNiAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2FtZGdw
dV9kbS9hbWRncHVfZG0uaAorKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvYW1kZ3B1
X2RtL2FtZGdwdV9kbS5oCkBAIC00MDMsNyArNDAzLDcgQEAgc3RydWN0IGRtX2Nvbm5lY3Rvcl9z
dGF0ZSB7CiAJYm9vbCB1bmRlcnNjYW5fZW5hYmxlOwogCWJvb2wgZnJlZXN5bmNfY2FwYWJsZTsK
IAl1aW50OF90IGFibV9sZXZlbDsKLQl1aW50NjRfdCB2Y3BpX3Nsb3RzOworCWludCB2Y3BpX3Ns
b3RzOwogCXVpbnQ2NF90IHBibjsKIH07CiAKLS0gCjIuMjMuMAoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmkt
ZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
L21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
