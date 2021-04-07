Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A106356886
	for <lists+dri-devel@lfdr.de>; Wed,  7 Apr 2021 11:56:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F3D2789F69;
	Wed,  7 Apr 2021 09:56:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-out.m-online.net (mail-out.m-online.net [212.18.0.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F2DD189F69
 for <dri-devel@lists.freedesktop.org>; Wed,  7 Apr 2021 09:56:03 +0000 (UTC)
Received: from frontend01.mail.m-online.net (unknown [192.168.8.182])
 by mail-out.m-online.net (Postfix) with ESMTP id 4FFfsq3khsz1qtPt;
 Wed,  7 Apr 2021 11:55:58 +0200 (CEST)
Received: from localhost (dynscan1.mnet-online.de [192.168.6.70])
 by mail.m-online.net (Postfix) with ESMTP id 4FFfsp5V4Mz1r1Ml;
 Wed,  7 Apr 2021 11:55:58 +0200 (CEST)
X-Virus-Scanned: amavisd-new at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.182])
 by localhost (dynscan1.mail.m-online.net [192.168.6.70]) (amavisd-new,
 port 10024)
 with ESMTP id nqZshmjpShtJ; Wed,  7 Apr 2021 11:55:56 +0200 (CEST)
X-Auth-Info: Och8Nif2NLXaKUtGnZ2RZQidzSWXk6tDEFseKM0edes=
Received: from [IPv6:::1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.mnet-online.de (Postfix) with ESMTPSA;
 Wed,  7 Apr 2021 11:55:56 +0200 (CEST)
Subject: Re: [PATCH V2] drm/bridge: lvds-codec: Add support for pixel data
 sampling edge select
From: Marek Vasut <marex@denx.de>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
References: <20201224061832.92010-1-marex@denx.de>
 <YFfvjyllBa/tqTqI@pendragon.ideasonboard.com>
 <4372d1cd-ffdb-e545-7262-d1ad1a649770@denx.de>
Message-ID: <3a25b8db-8968-0f07-21fe-69fa43f438f5@denx.de>
Date: Wed, 7 Apr 2021 11:55:56 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.0
MIME-Version: 1.0
In-Reply-To: <4372d1cd-ffdb-e545-7262-d1ad1a649770@denx.de>
Content-Language: en-US
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
Cc: Alexandre Torgue <alexandre.torgue@st.com>,
 Antonio Borneo <antonio.borneo@st.com>, Vincent Abriou <vincent.abriou@st.com>,
 Philippe Cornu <philippe.cornu@st.com>, dri-devel@lists.freedesktop.org,
 Yannick Fertre <yannick.fertre@st.com>, Andrzej Hajda <a.hajda@samsung.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Biju Das <biju.das.jz@bp.renesas.com>, Sam Ravnborg <sam@ravnborg.org>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 Benjamin Gaignard <benjamin.gaignard@st.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMy8yMi8yMSAxMToyOSBBTSwgTWFyZWsgVmFzdXQgd3JvdGU6Cj4gT24gMy8yMi8yMSAyOjE0
IEFNLCBMYXVyZW50IFBpbmNoYXJ0IHdyb3RlOgo+PiBIaSBNYXJlaywKPiAKPiBIaSwKPiAKPiBb
Li4uXQo+IAo+Pj4gZGlmZiAtLWdpdCAKPj4+IGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2Jp
bmRpbmdzL2Rpc3BsYXkvYnJpZGdlL2x2ZHMtY29kZWMueWFtbCAKPj4+IGIvRG9jdW1lbnRhdGlv
bi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkvYnJpZGdlL2x2ZHMtY29kZWMueWFtbAo+Pj4g
aW5kZXggZTVlM2M3MjYzMGNmLi4zOTlhNjUyODc4MGEgMTAwNjQ0Cj4+PiAtLS0gYS9Eb2N1bWVu
dGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS9icmlkZ2UvbHZkcy1jb2RlYy55YW1s
Cj4+PiArKysgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS9icmlk
Z2UvbHZkcy1jb2RlYy55YW1sCj4+PiBAQCAtNzQsNiArNzQsMTMgQEAgcHJvcGVydGllczoKPj4+
IMKgwqDCoMKgwqAgYWRkaXRpb25hbFByb3BlcnRpZXM6IGZhbHNlCj4+PiArwqAgcGl4ZWxjbGst
YWN0aXZlOgo+Pj4gK8KgwqDCoCBkZXNjcmlwdGlvbjogfAo+Pj4gK8KgwqDCoMKgwqAgRGF0YSBz
YW1wbGluZyBvbiByaXNpbmcgb3IgZmFsbGluZyBlZGdlLgo+Pj4gK8KgwqDCoMKgwqAgVXNlIDAg
dG8gc2FtcGxlIHBpeGVsIGRhdGEgb24gcmlzaW5nIGVkZ2UgYW5kCj4+PiArwqDCoMKgwqDCoCBV
c2UgMSB0byBzYW1wbGUgcGl4ZWwgZGF0YSBvbiBmYWxsaW5nIGVkZ2UgYW5kCj4+PiArwqDCoMKg
IGVudW06IFswLCAxXQo+Pgo+PiBUaGUgaWRlYSBpcyBnb29kLCBidXQgaW5zdGVhZCBvZiBhZGRp
bmcgYSBjdXN0b20gcHJvcGVydHksIGhvdyBhYm91dAo+PiByZXVzaW5nIHRoZSBwY2xrLXNhbXBs
ZSBwcm9wZXJ0eSBkZWZpbmVkIGluCj4+IC4uLy4uL21lZGlhL3ZpZGVvLWludGVyZmFjZXMueWFt
bCA/Cj4gCj4gUmVwZWF0aW5nIG15c2VsZiBmcm9tIFYxIGRpc2N1c3Npb24gLi4uIEVpdGhlciBp
cyBmaW5lIGJ5IG1lLCBidXQgSSAKPiB0aGluayBwaXhlbGNsay1hY3RpdmUsIHdoaWNoIGNvbWVz
IGZyb20gcGFuZWwtdGltaW5ncy55YW1sIGlzIGNsb3NlciB0byAKPiB0aGUgdmlkZW8gdGhhbiBt
dWx0aW1lZGlhIGJpbmRpbmdzLgoKV2FzIHRoZXJlIGV2ZXIgYW55IHJlcGx5IGZyb20gUm9iIG9u
IHRoaXMgPwpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpk
cmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0
cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
