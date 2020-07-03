Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E3912135EC
	for <lists+dri-devel@lfdr.de>; Fri,  3 Jul 2020 10:12:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 06EBC6EABE;
	Fri,  3 Jul 2020 08:12:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out30-131.freemail.mail.aliyun.com
 (out30-131.freemail.mail.aliyun.com [115.124.30.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C74546E8B7;
 Fri,  3 Jul 2020 04:19:58 +0000 (UTC)
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R851e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=e01e01422;
 MF=tianjia.zhang@linux.alibaba.com; NM=1; PH=DS; RN=14; SR=0;
 TI=SMTPD_---0U1XckQJ_1593749988; 
Received: from 30.25.178.169(mailfrom:tianjia.zhang@linux.alibaba.com
 fp:SMTPD_---0U1XckQJ_1593749988) by smtp.aliyun-inc.com(127.0.0.1);
 Fri, 03 Jul 2020 12:19:51 +0800
Subject: Re: [PATCH] drm/msm/dpu: fix wrong return value in dpu_encoder_init()
To: Markus Elfring <Markus.Elfring@web.de>, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org
References: <1c338c4c-c185-0b37-eabb-1072a6502ec0@web.de>
From: Tianjia Zhang <tianjia.zhang@linux.alibaba.com>
Message-ID: <87c184ee-dfe7-03dc-e3c9-27996c57d6cd@linux.alibaba.com>
Date: Fri, 3 Jul 2020 12:19:48 +0800
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <1c338c4c-c185-0b37-eabb-1072a6502ec0@web.de>
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

CgpPbiAyMDIwLzcvMiAyMjowNCwgTWFya3VzIEVsZnJpbmcgd3JvdGU6Cj4+IEEgcG9zaXRpdmUg
dmFsdWUgRU5PTUVNIGlzIHJldHVybmVkIGhlcmUuIEkgdGhpbnIgdGhpcyBpcyBhIHR5cG8gZXJy
b3IuCj4+IEl0IGlzIG5lY2Vzc2FyeSB0byByZXR1cm4gYSBuZWdhdGl2ZSBlcnJvciB2YWx1ZS4K
PiAKPiBJIGltYWdpbmUgdGhhdCBhIHNtYWxsIGFkanVzdG1lbnQgY291bGQgYmUgbmljZSBmb3Ig
dGhpcyBjaGFuZ2UgZGVzY3JpcHRpb24uCj4gCj4gSG93IGRvIHlvdSB0aGluayBhYm91dCB0byBm
b2xsb3cgcHJvZ3Jlc3MgZm9yIHRoZSBpbnRlZ3JhdGlvbiBvZgo+IGEgcHJldmlvdXMgcGF0Y2gg
bGlrZSDigJxbUkVTRU5EXSBkcm0vbXNtL2RwdTogZml4IGVycm9yIHJldHVybiBjb2RlIGluIGRw
dV9lbmNvZGVyX2luaXTigJ0/Cj4gaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvZHJpLWRldmVsLzIw
MjAwNjE4MDYyODAzLjE1MjA5Ny0xLWNoZW50YW8xMDdAaHVhd2VpLmNvbS8KPiBodHRwczovL2xv
cmUua2VybmVsLm9yZy9wYXRjaHdvcmsvcGF0Y2gvMTI1Nzk1Ny8KPiBodHRwczovL2xrbWwub3Jn
L2xrbWwvMjAyMC82LzE4LzQ2Cj4gCj4gUmVnYXJkcywKPiBNYXJrdXMKPiAKClRoaXMgaXMgdGhl
IHNhbWUgZml4LCBwbGVhc2UgaWdub3JlIHRoaXMgcGF0Y2guCgpUaGFua3MsClRpYW5qaWEKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1h
aWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
