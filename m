Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B2210DBE2F
	for <lists+dri-devel@lfdr.de>; Fri, 18 Oct 2019 09:18:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E557C6E048;
	Fri, 18 Oct 2019 07:18:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 792A96E048
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Oct 2019 07:18:41 +0000 (UTC)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
 by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id x9I7IVJt118924;
 Fri, 18 Oct 2019 02:18:31 -0500
Received: from DFLE109.ent.ti.com (dfle109.ent.ti.com [10.64.6.30])
 by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTP id x9I7IVZl044520;
 Fri, 18 Oct 2019 02:18:31 -0500
Received: from DFLE113.ent.ti.com (10.64.6.34) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Fri, 18
 Oct 2019 02:18:22 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Fri, 18 Oct 2019 02:18:22 -0500
Received: from [192.168.2.6] (ileax41-snat.itg.ti.com [10.172.224.153])
 by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id x9I7ITTV080168;
 Fri, 18 Oct 2019 02:18:29 -0500
Subject: Re: [PATCH] drm/omap: fix max fclk divider for omap36xx
To: Adam Ford <aford173@gmail.com>
References: <20191002122542.8449-1-tomi.valkeinen@ti.com>
 <CAHCN7xLjGkLHMWejEk-3vJ-OwzjB+BXtnPWoonh4mAVxbkzMWQ@mail.gmail.com>
 <CAHCN7xKN7CePgajQLH61dBaoLWZ4VMxo39_xJOWHyvM3x_0i=A@mail.gmail.com>
From: Tomi Valkeinen <tomi.valkeinen@ti.com>
Message-ID: <406842b9-18f0-ddf7-5317-4ace265d0ac2@ti.com>
Date: Fri, 18 Oct 2019 10:18:28 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <CAHCN7xKN7CePgajQLH61dBaoLWZ4VMxo39_xJOWHyvM3x_0i=A@mail.gmail.com>
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ti.com; s=ti-com-17Q1; t=1571383111;
 bh=OilUv+GFguDJ3YR661ZCA0FSuZHVAgyHf27fIiSPtBQ=;
 h=Subject:To:CC:References:From:Date:In-Reply-To;
 b=VFA9s4S3oEa6/V0fDs4K7SMjpWK/KswAWW8GBkMBbvZv1jBytBIFi93E2cQNu3kXC
 A8S1vzbTVkmVP6IKcZXBT1/XH/ZTOMwUqeBAyP+Wcoyyq/ZQwnzdI+pAGEgLxzbwyt
 87fEZ/tztleAif7MSNLX9JL2VC3rfhdo/D7JOp8E=
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
Cc: "H . Nikolaus Schaller" <hns@goldelico.com>,
 Linux-OMAP <linux-omap@vger.kernel.org>, stable <stable@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMTcvMTAvMjAxOSAyMTowNSwgQWRhbSBGb3JkIHdyb3RlOgoKPj4gSXMgdGhlcmUgYW55IHdh
eSB5b3UgY2FuIGRvIGEgcGF0Y2ggZm9yIHRoZSBGQiB2ZXJzaW9uIGZvciB0aGUgb2xkZXIKPj4g
NC45IGFuZCA0LjE0IGtlcm5lbHM/ICBJIHRoaW5rIHRoZXkgYXJlIHN0aWxsIGRlZmF1bHRpbmcg
dG8gdGhlIG9tYXBmYgo+PiBpbnN0ZWFkIG9mIERSTSwgc28gdGhlIHVuZGVyZmxvdyBpc3N1ZSBz
dGlsbCBhcHBlYXJzIGJ5IGRlZmF1bHQgYW5kCj4+IHRoZSBwYXRjaCBvbmx5IGltcGFjdHMgdGhl
IERSTSB2ZXJzaW9uIG9mIHRoZSBkcml2ZXIuICBJZiBub3QsIGRvIHlvdQo+PiBoYXZlIGFueSBv
YmplY3Rpb25zIGlmIEkgc3VibWl0IGEgcGF0Y2ggdG8gc3RhYmxlIGZvciB0aG9zZSB0d28gTFRT
Cj4+IGJyYW5jaGVzPwo+IAo+IEdlbnRsZSBudWRnZSBvbiB0aGlzIHF1ZXN0aW9uLiAgSSBjYW4g
ZG8gdGhlIHdvcmssIGJ1dCBJIGp1c3QKPiBwZXJtaXNzaW9uIHNvIGRvbid0IG92ZXJzdGVwLgoK
U3VyZSwgZ28gYWhlYWQuCgogIFRvbWkKCi0tIApUZXhhcyBJbnN0cnVtZW50cyBGaW5sYW5kIE95
LCBQb3Jra2FsYW5rYXR1IDIyLCAwMDE4MCBIZWxzaW5raS4KWS10dW5udXMvQnVzaW5lc3MgSUQ6
IDA2MTU1MjEtNC4gS290aXBhaWtrYS9Eb21pY2lsZTogSGVsc2lua2kKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApk
cmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Au
b3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
