Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F0672B0F7
	for <lists+dri-devel@lfdr.de>; Mon, 27 May 2019 11:07:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7FE58897F3;
	Mon, 27 May 2019 09:07:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2E784897F3
 for <dri-devel@lists.freedesktop.org>; Mon, 27 May 2019 09:07:07 +0000 (UTC)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
 by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id x4R96u0w109353;
 Mon, 27 May 2019 04:06:56 -0500
Received: from DLEE100.ent.ti.com (dlee100.ent.ti.com [157.170.170.30])
 by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x4R96uEc018108
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Mon, 27 May 2019 04:06:56 -0500
Received: from DLEE105.ent.ti.com (157.170.170.35) by DLEE100.ent.ti.com
 (157.170.170.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Mon, 27
 May 2019 04:06:55 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE105.ent.ti.com
 (157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Mon, 27 May 2019 04:06:55 -0500
Received: from [192.168.2.6] (ileax41-snat.itg.ti.com [10.172.224.153])
 by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id x4R96rV0066362;
 Mon, 27 May 2019 04:06:54 -0500
Subject: Re: [PATCH] drm/omapdrm: fix warning PTR_ERR_OR_ZERO can be used
To: Matteo Croce <mcroce@redhat.com>, Hariprasad Kelam
 <hariprasad.kelam@gmail.com>
References: <20190525073026.GA7114@hari-Inspiron-1545>
 <CAGnkfhzauQGgGdvPtkNcdGkjvo1BsORxZ6f3SzGzQYuYCDetUg@mail.gmail.com>
From: Tomi Valkeinen <tomi.valkeinen@ti.com>
Message-ID: <9f72e575-82b6-0dc0-ec36-1e21d355c9f0@ti.com>
Date: Mon, 27 May 2019 12:06:53 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <CAGnkfhzauQGgGdvPtkNcdGkjvo1BsORxZ6f3SzGzQYuYCDetUg@mail.gmail.com>
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ti.com; s=ti-com-17Q1; t=1558948016;
 bh=6S54ESIYMmpxy+kompIXto4pV+JNxqetVk/JuZrY26k=;
 h=Subject:To:CC:References:From:Date:In-Reply-To;
 b=cUTjl+r4BCYvMRqp88aG3GR29rQn0tlI6WBN0noSL9+vc7MKiZn4unA4HF1n+zvsa
 +rocwno3NetwGkFDLvyxeYEEFUPxgCxSlhZkEBPoCi1ahsaO7a9VCwYwhjUxEPpnAK
 po3guNyCI1SBx+wy7rXVhHLvU8eCtjc/YWZv8k5E=
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
Cc: David Airlie <airlied@linux.ie>, LKML <linux-kernel@vger.kernel.org>,
 dri-devel@lists.freedesktop.org,
 Sebastian Reichel <sebastian.reichel@collabora.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGksCgpPbiAyNS8wNS8yMDE5IDE3OjU2LCBNYXR0ZW8gQ3JvY2Ugd3JvdGU6Cj4gT24gU2F0LCBN
YXkgMjUsIDIwMTkgYXQgOTozMCBBTSBIYXJpcHJhc2FkIEtlbGFtCj4gPGhhcmlwcmFzYWQua2Vs
YW1AZ21haWwuY29tPiB3cm90ZToKPj4KPj4gZml4IGJlbG93IHdhcm5pbmdzIHJlcG9ydGVkIGJ5
IGNvY2NpY2hlY2sKPj4KPiAKPiBIaSwKPiAKPiBhIHNpbWlsYXIgcGF0Y2ggd2FzIG5hY2tlZCBi
ZWNhdXNlIGl0IG1ha2VzIGJhY2twb3J0cyBtb3JlIGRpZmZpY3VsdDoKPiAKPiBodHRwczovL2xv
cmUua2VybmVsLm9yZy9sa21sLzNkZWM0MDkzLTgyNGUtYjEzZC1kNzEyLTJkZWRkNDQ1YTdiN0B0
aS5jb20vCj4gCj4gVG9taSwgd2hhdCdzIHlvdXIgdGhvdWdodD8KPiAKCkkgZG9uJ3QgcGFydGlj
dWxhcmx5IGxpa2UgdGhlIFBUUl9FUlJfT1JfWkVSTywgYW5kIGNoYW5naW5nIG9sZCBjb2RlIHRv
IAp1c2UgaXQgc2VlbSBwb2ludGxlc3MuCgogIFRvbWkKCi0tIApUZXhhcyBJbnN0cnVtZW50cyBG
aW5sYW5kIE95LCBQb3Jra2FsYW5rYXR1IDIyLCAwMDE4MCBIZWxzaW5raS4KWS10dW5udXMvQnVz
aW5lc3MgSUQ6IDA2MTU1MjEtNC4gS290aXBhaWtrYS9Eb21pY2lsZTogSGVsc2lua2kKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxp
bmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
