Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B1D3F7D93C
	for <lists+dri-devel@lfdr.de>; Thu,  1 Aug 2019 12:20:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D67996E47C;
	Thu,  1 Aug 2019 10:20:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx01-fr.bfs.de (mx01-fr.bfs.de [193.174.231.67])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A674E6E47C;
 Thu,  1 Aug 2019 10:20:18 +0000 (UTC)
Received: from mail-fr.bfs.de (mail-fr.bfs.de [10.177.18.200])
 by mx01-fr.bfs.de (Postfix) with ESMTPS id 9D2E020361;
 Thu,  1 Aug 2019 12:20:11 +0200 (CEST)
Received: from [134.92.181.33] (unknown [134.92.181.33])
 by mail-fr.bfs.de (Postfix) with ESMTPS id E7E53BEEBD;
 Thu,  1 Aug 2019 12:20:09 +0200 (CEST)
Message-ID: <5D42BCD8.2050708@bfs.de>
Date: Thu, 01 Aug 2019 12:20:08 +0200
From: walter harms <wharms@bfs.de>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; de;
 rv:1.9.1.16) Gecko/20101125 SUSE/3.0.11 Thunderbird/3.0.11
MIME-Version: 1.0
To: kernel-janitors@vger.kernel.org
Subject: Re: [PATCH][drm-next] drm/amd/powerplay: fix a few spelling mistakes
References: <20190801083941.4230-1-colin.king@canonical.com>
In-Reply-To: <20190801083941.4230-1-colin.king@canonical.com>
X-Spam-Status: No, score=-3.10
X-Spamd-Result: default: False [-3.10 / 7.00];
 HAS_REPLYTO(0.00)[wharms@bfs.de]; TO_DN_SOME(0.00)[];
 REPLYTO_ADDR_EQ_FROM(0.00)[]; FROM_EQ_ENVFROM(0.00)[];
 MIME_TRACE(0.00)[0:+]; MID_RHS_MATCH_FROM(0.00)[];
 BAYES_HAM(-3.00)[100.00%]; ARC_NA(0.00)[]; FROM_HAS_DN(0.00)[];
 TO_MATCH_ENVRCPT_ALL(0.00)[]; MIME_GOOD(-0.10)[text/plain];
 DKIM_SIGNED(0.00)[]; RCPT_COUNT_TWELVE(0.00)[12];
 RCVD_COUNT_TWO(0.00)[2]; RCVD_TLS_ALL(0.00)[]
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bfs.de; s=dkim201901; 
 t=1564654811; h=from:from:sender:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Y2Sv8l3MwtDovEkgothzWo49YW1bV4SU10NaWrHnhr4=;
 b=oBFOXaeihhqLNN72BtKixNI7HSZheL/xsvrWl6NjVcuCqffp8bwz6cyl/gDwHo35vngRqw
 qRVpEHmFbqjY8qcMerui6gQ37jVB4dIjjDfjBSwCBotxBgxPM3iz/pjGDQx4J6NF6t6ut9
 sTMi6c49ByDwBXUTqDUcSE4QgZlz1GS9pmuFJCSgHGMrB1dDmjyQvZQLyZi3upxsgiKDUk
 ivxZtDKnDXwcSND2JeYfM1akSC4kD4jJN3ARaoDr+Fthn5wdum0Vf7rqaTy3+9P/wwmStt
 Hxzj2Gvl3YfgWzNG6NM/a/6n0BQA/Af4KiK/QA50Yql9Up5tjh3MylOyDKgFRA==
X-Mailman-Original-Authentication-Results: mx01-fr.bfs.de
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
Reply-To: wharms@bfs.de
Cc: David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Alex Deucher <alexander.deucher@amd.com>,
 Colin King <colin.king@canonical.com>, Evan Quan <evan.quan@amd.com>,
 Rex Zhu <rex.zhu@amd.com>,
 =?UTF-8?B?Q2hyaXN0aWFuIEvDtm5p?= =?UTF-8?B?Zw==?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

CgpBbSAwMS4wOC4yMDE5IDEwOjM5LCBzY2hyaWViIENvbGluIEtpbmc6Cj4gRnJvbTogQ29saW4g
SWFuIEtpbmcgPGNvbGluLmtpbmdAY2Fub25pY2FsLmNvbT4KPiAKPiBUaGVyZSBhcmUgYSBmZXcg
c3BlbGxpbmcgbWlzdGFrZXMgInVua25vdyIgLT4gInVua25vd24iIGFuZAo+ICJlbmFiZWxkIiAt
PiAiZW5hYmxlZCIuIEZpeCB0aGVzZS4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBDb2xpbiBJYW4gS2lu
ZyA8Y29saW4ua2luZ0BjYW5vbmljYWwuY29tPgo+IC0tLQo+ICBkcml2ZXJzL2dwdS9kcm0vYW1k
L3Bvd2VycGxheS9hbWRncHVfc211LmMgfCA2ICsrKy0tLQo+ICAxIGZpbGUgY2hhbmdlZCwgMyBp
bnNlcnRpb25zKCspLCAzIGRlbGV0aW9ucygtKQo+IAo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dw
dS9kcm0vYW1kL3Bvd2VycGxheS9hbWRncHVfc211LmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL3Bv
d2VycGxheS9hbWRncHVfc211LmMKPiBpbmRleCAxM2IyYzhhNjAyMzIuLmQwMjlhOTllNjAwZSAx
MDA2NDQKPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2VycGxheS9hbWRncHVfc211LmMK
PiArKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2VycGxheS9hbWRncHVfc211LmMKPiBAQCAt
MzksNyArMzksNyBAQCBzdGF0aWMgY29uc3QgY2hhciogX19zbXVfbWVzc2FnZV9uYW1lc1tdID0g
ewo+ICBjb25zdCBjaGFyICpzbXVfZ2V0X21lc3NhZ2VfbmFtZShzdHJ1Y3Qgc211X2NvbnRleHQg
KnNtdSwgZW51bSBzbXVfbWVzc2FnZV90eXBlIHR5cGUpCj4gIHsKPiAgCWlmICh0eXBlIDwgMCB8
fCB0eXBlID4gU01VX01TR19NQVhfQ09VTlQpCj4gLQkJcmV0dXJuICJ1bmtub3cgc211IG1lc3Nh
Z2UiOwo+ICsJCXJldHVybiAidW5rbm93biBzbXUgbWVzc2FnZSI7Cj4gIAlyZXR1cm4gX19zbXVf
bWVzc2FnZV9uYW1lc1t0eXBlXTsKPiAgfQo+ICAKPiBAQCAtNTIsNyArNTIsNyBAQCBzdGF0aWMg
Y29uc3QgY2hhciogX19zbXVfZmVhdHVyZV9uYW1lc1tdID0gewo+ICBjb25zdCBjaGFyICpzbXVf
Z2V0X2ZlYXR1cmVfbmFtZShzdHJ1Y3Qgc211X2NvbnRleHQgKnNtdSwgZW51bSBzbXVfZmVhdHVy
ZV9tYXNrIGZlYXR1cmUpCj4gIHsKPiAgCWlmIChmZWF0dXJlIDwgMCB8fCBmZWF0dXJlID4gU01V
X0ZFQVRVUkVfQ09VTlQpCj4gLQkJcmV0dXJuICJ1bmtub3cgc211IGZlYXR1cmUiOwo+ICsJCXJl
dHVybiAidW5rbm93biBzbXUgZmVhdHVyZSI7Cj4gIAlyZXR1cm4gX19zbXVfZmVhdHVyZV9uYW1l
c1tmZWF0dXJlXTsKPiAgfQo+ICAKPiBAQCAtNzksNyArNzksNyBAQCBzaXplX3Qgc211X3N5c19n
ZXRfcHBfZmVhdHVyZV9tYXNrKHN0cnVjdCBzbXVfY29udGV4dCAqc211LCBjaGFyICpidWYpCj4g
IAkJCSAgICAgICBjb3VudCsrLAo+ICAJCQkgICAgICAgc211X2dldF9mZWF0dXJlX25hbWUoc211
LCBpKSwKPiAgCQkJICAgICAgIGZlYXR1cmVfaW5kZXgsCj4gLQkJCSAgICAgICAhIXNtdV9mZWF0
dXJlX2lzX2VuYWJsZWQoc211LCBpKSA/ICJlbmFiZWxkIiA6ICJkaXNhYmxlZCIpOwo+ICsJCQkg
ICAgICAgISFzbXVfZmVhdHVyZV9pc19lbmFibGVkKHNtdSwgaSkgPyAiZW5hYmxlZCIgOiAiZGlz
YWJsZWQiKTsKCmkgYW0gd29uZGVyaW5nLAppcyB0aGF0ICEhIHJlYWxseSBuZWVkZWQgaW4gZnJv
bnQgb2Ygc211X2ZlYXR1cmVfaXNfZW5hYmxlZCA/CgpyZSwKIHdoCgo+ICAJfQo+ICAKPiAgZmFp
bGVkOgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmkt
ZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6
Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
