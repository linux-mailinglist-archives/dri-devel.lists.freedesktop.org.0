Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E79472135F5
	for <lists+dri-devel@lfdr.de>; Fri,  3 Jul 2020 10:12:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EFE216EB3E;
	Fri,  3 Jul 2020 08:12:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.web.de (mout.web.de [212.227.15.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 46D706E044
 for <dri-devel@lists.freedesktop.org>; Thu,  2 Jul 2020 14:04:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de;
 s=dbaedf251592; t=1593698649;
 bh=DCK/WFqgBdaHR38QF2ta4hvKwO2tQSln1KlsJxiIhkM=;
 h=X-UI-Sender-Class:To:Cc:Subject:From:Date;
 b=EQIm1+Id5YKsEHlinZjakj9hsaYatJc/rsEQaAyEgnhwgCxWZR/f95F4CGkhGDR/k
 +hknJzmw/9n0Jq14TaO/+JWA/OT50eO3cra+u0YYBGgEsI4uUqdB7ycfxfuvJjz1UQ
 j4GBPNiXWmqiFLxHUv6ecVm3lp5tO7hCeOI8+APk=
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from [192.168.1.2] ([93.132.138.52]) by smtp.web.de (mrweb005
 [213.165.67.108]) with ESMTPSA (Nemesis) id 1MBSB9-1jf8OU1otT-00Cw9R; Thu, 02
 Jul 2020 16:04:09 +0200
To: Tianjia Zhang <tianjia.zhang@linux.alibaba.com>,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH] drm/msm/dpu: fix wrong return value in dpu_encoder_init()
From: Markus Elfring <Markus.Elfring@web.de>
Autocrypt: addr=Markus.Elfring@web.de; prefer-encrypt=mutual; keydata=
 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 FEE=
Message-ID: <0681b179-6bdd-6014-b363-adaff3d831ca@web.de>
Date: Thu, 2 Jul 2020 16:04:07 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
Content-Language: en-GB
X-Provags-ID: V03:K1:8TU6yp4N67OXeWdbbjjufaIGXayy6Bhv26ZUZkg37c2VfTLTMqs
 B8lUPD2Hw8SiZrOkHQSRctGfUmVGUszdOaTPElWQWZ4pCHa7p4gP8v94iNwigrZ0BRF/5Si
 vTh+hJsdQTdb1LQ66p4f4kSdPchGyS2DLa5fICt9yjj+cTMS/dy8vG/KEQPr/19XDlyHCDr
 vKc8p26Uidj39pR5dw0jQ==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:1qIV3s4rnak=:mjWjkZ/cLz+3YsaTpn5vXm
 u6P23PF3xyyOg9NAOImG4bFsuRMR313b5jLUX9AXcTUGyhfhXAmr36AyWHicbt1kO0eLBfhhR
 ffXakw6n71kXpvaRMw84fKsPw+qSIntgOqm1q8w4AEwqcL/mOrQRrHcVaBfBpJ45xYkbJB3Y6
 RrEvuIdrZ7ybAHrcESjvTRnX1/Mik9yEOwRZNdGSAqhxT07mkwKOuVxvQi61terd4V63AGPTr
 LbLi5S0BZpIHoWMgujMAovif7rDEOAvhiWw5BIRnKKK8/FbNg0u21kTKEybD+LQJh8FfBwfaV
 LFQBB96455xLHG/4XpMpRrtKeEBXBKGBF/5P7q2JOlSMeRyDHZ5k9DbTtIvJjM6x0VLQUKp4S
 a4IdFLqUeJgNnn/FwCIlW7YVOnvS1XcBcDQ/Ln1iQ/rRTZCHbw89sr7t6VK4my+FMJq3QjkY2
 6tXV/+2+kziKWLeEmB7W7Xv/FciMU8Zmp/6B5Hm9gRkzneV7xdzWkZgm3XErLX+nv40zIXLnC
 oCZvDXekqyDBGkkwhex6RbAfdyp/y9ONE+N3C7qKfivxyfN2w39P1PxToX4AdjMQ3ZFXUbxcv
 /+LvgGwVfwALENcTJAzVseOgMpz171JPwk2EUS5qR815rCRxTZFsU8adIaMqSGCa021pS2tvt
 Cq5rXLnn8DMX422d9IrGN9EFhMefMWpGgq3CSF/C9j4BnzErO6/85AZUtiLhgazf8NDel52dg
 Ai7kqXKpvItYSZ7BaWdayu4ZFpECD6RyZdY4qlxmePCBz63/fjYnQyowNKavurOUJgrtXhU7T
 lspIKL646IycxwoNsDfNe3qoBFVwjrUyuqbxXAWzWJXM1HQRqqH2KJL3TgBXlm6c+JujueYQq
 OYxWf7JIfz3wATvI7dIY7YMo5383Y1EZLXxBbjSafEVZWPv+16W7nfrDpffo9pDcg+w16dxzJ
 3ClTnuLJjtkj0OSLYn/O6+YDqVPZfar+ED34gMqm89KQkZ11v5RVumAWmaUGeDfq18+XcuVXS
 +XY3tfX4FRM2299ArpnOuloVLoWD6yAnEgJtC57SfjU3jYojxoIpj+WombOBUjRsVUjAVSHyC
 eLaH2KXpmu6AWzZ8GzkiLKsRnW7kICOP7xy4jU88Xia2xTCPQqyiJanZHFmqscqjNJm9qyApV
 fK0C1Cf4qb8MBeehnoPIlAmugJrRM88WEOQjYsKQqTr5SwDRNQLu4WDxas0e04j95m4Onm4q7
 XYRDBv9FdG86AXlYG
X-Mailman-Approved-At: Fri, 03 Jul 2020 08:12:01 +0000
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.29
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
Cc: David Airlie <airlied@linux.ie>, Sean Paul <sean@poorly.run>,
 linux-kernel@vger.kernel.org, zhengbin <zhengbin13@huawei.com>,
 Chen Tao <chentao107@huawei.com>, Kalyan Thota <kalyan_t@codeaurora.org>,
 Drew Davenport <ddavenport@chromium.org>, Sam Ravnborg <sam@ravnborg.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

PiBBIHBvc2l0aXZlIHZhbHVlIEVOT01FTSBpcyByZXR1cm5lZCBoZXJlLiBJIHRoaW5yIHRoaXMg
aXMgYSB0eXBvIGVycm9yLgo+IEl0IGlzIG5lY2Vzc2FyeSB0byByZXR1cm4gYSBuZWdhdGl2ZSBl
cnJvciB2YWx1ZS4KCkkgaW1hZ2luZSB0aGF0IGEgc21hbGwgYWRqdXN0bWVudCBjb3VsZCBiZSBu
aWNlIGZvciB0aGlzIGNoYW5nZSBkZXNjcmlwdGlvbi4KCkhvdyBkbyB5b3UgdGhpbmsgYWJvdXQg
dG8gZm9sbG93IHByb2dyZXNzIGZvciB0aGUgaW50ZWdyYXRpb24gb2YKYSBwcmV2aW91cyBwYXRj
aCBsaWtlIOKAnFtSRVNFTkRdIGRybS9tc20vZHB1OiBmaXggZXJyb3IgcmV0dXJuIGNvZGUgaW4g
ZHB1X2VuY29kZXJfaW5pdOKAnT8KaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvZHJpLWRldmVsLzIw
MjAwNjE4MDYyODAzLjE1MjA5Ny0xLWNoZW50YW8xMDdAaHVhd2VpLmNvbS8KaHR0cHM6Ly9sb3Jl
Lmtlcm5lbC5vcmcvcGF0Y2h3b3JrL3BhdGNoLzEyNTc5NTcvCmh0dHBzOi8vbGttbC5vcmcvbGtt
bC8yMDIwLzYvMTgvNDYKClJlZ2FyZHMsCk1hcmt1cwpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBs
aXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1h
bi9saXN0aW5mby9kcmktZGV2ZWwK
