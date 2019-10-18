Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B136CDC66C
	for <lists+dri-devel@lfdr.de>; Fri, 18 Oct 2019 15:46:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B363F6EB4B;
	Fri, 18 Oct 2019 13:46:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 297556E108;
 Fri, 18 Oct 2019 13:46:00 +0000 (UTC)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
 by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id x9IDjW3Z111761;
 Fri, 18 Oct 2019 08:45:32 -0500
Received: from DFLE102.ent.ti.com (dfle102.ent.ti.com [10.64.6.23])
 by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x9IDjWFw051106
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Fri, 18 Oct 2019 08:45:32 -0500
Received: from DFLE115.ent.ti.com (10.64.6.36) by DFLE102.ent.ti.com
 (10.64.6.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Fri, 18
 Oct 2019 08:45:32 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Fri, 18 Oct 2019 08:45:24 -0500
Received: from [192.168.2.6] (ileax41-snat.itg.ti.com [10.172.224.153])
 by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id x9IDjRDf084396;
 Fri, 18 Oct 2019 08:45:27 -0500
Subject: Re: [PULL] drm-misc-next
To: Sean Paul <sean@poorly.run>, Dave Airlie <airlied@gmail.com>, Daniel
 Vetter <daniel.vetter@ffwll.ch>
References: <20191017192601.GA215957@art_vandelay>
From: Tomi Valkeinen <tomi.valkeinen@ti.com>
Message-ID: <febda9e7-d62b-128c-819a-71c57d9c001d@ti.com>
Date: Fri, 18 Oct 2019 16:45:27 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191017192601.GA215957@art_vandelay>
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ti.com; s=ti-com-17Q1; t=1571406332;
 bh=vNjGvaHKIu9xyVFufIZtVy1cSXyeLPH0JxUibqcs3Fg=;
 h=Subject:To:CC:References:From:Date:In-Reply-To;
 b=iH/qvrBQbbn+7MqoI+LKZ4YHuzJ2C92l0Y45MdqgERzz5J0ILXKQesvbiN9CJbEqY
 e21EdU440n9bN8DBaxKW1KBvJ+hMh5wX10Ld+iH5ljD9y378P1+z4rmDSFcj8GWHTh
 qSdbSjweCimOUW5e4Ql37YQWGovTJYzWiTXFSGbU=
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
Cc: dri-devel@lists.freedesktop.org, Gerd Hoffmann <kraxel@redhat.com>,
 Sam Ravnborg <sam@ravnborg.org>, dim-tools@lists.freedesktop.org,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>,
 Steven Price <steven.price@arm.com>, Robert Chiras <robert.chiras@nxp.com>,
 Jean-Jacques Hiblot <jjhiblot@ti.com>, Lowry Li <Lowry.Li@arm.com>,
 Jonas Karlman <jonas@kwiboo.se>, intel-gfx@lists.freedesktop.org,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Ezequiel Garcia <ezequiel@collabora.com>, Wen He <wen.he_1@nxp.com>,
 Oleg Vasilev <omrigann@gmail.com>, Qiang Yu <yuq825@gmail.com>,
 Thomas Zimmermann <tzimmermann@suse.de>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgU2VhbiwKCk9uIDE3LzEwLzIwMTkgMjI6MjYsIFNlYW4gUGF1bCB3cm90ZToKCj4gY29uY2Vy
biBmb3IgdGhvc2UuIFRoZSBvbWFwIE9NQVBfQk9fTUVNXyogY2hhbmdlcyB0aG91Z2ggSSBkb24n
dCB0aGluayBoYXZlCj4gcmVhbGx5IHJlYWNoZWQgbm9uLVRJIGV5ZXMuIFRoZXJlJ3Mgbm8gbGlu
ayBpbiB0aGUgY29tbWl0IG1lc3NhZ2UgdG8gYSBVQVBJCj4gaW1wbGVtZW50YXRpb24gYW5kIHRo
ZSBvbmx5IHJlZmVyZW5jZSBJIGNvdWxkIGZpbmQgaXMgbGlia21zeHggd2hpY2ggY2FuIHNldAo+
IHRoZW0gdGhyb3VnaCB0aGUgcHl0aG9uIGJpbmRpbmdzLiBTaW5jZSB0aGlzIGlzIFRJLXNwZWNp
ZmljIGd1bmsgaW4gVEktc3BlY2lmaWMKPiBoZWFkZXJzIEknbSBpbmNsaW5lZCB0byBsZXQgaXQg
cGFzcywgYnV0IEkgd291bGQgaGF2ZSBsaWtlZCB0byBoYXZlIHRoaXMKPiBjb252ZXJzYXRpb24g
dXBmcm9udC4gSSBmaWd1cmVkIEknZCBjYWxsIHRoaXMgb3V0IHNvIHlvdSBoYXZlIGZpbmFsIHNh
eS4KClRoZXJlIHdhcyBzb21lIGRpc2N1c3Npb24gYWJvdXQgdGhhdCBhIGZldyB5ZWFycyBiYWNr
IHdoZW4gSSBpbml0aWFsbHkgCnNlbnQgdGhlIHBhdGNoZXMsIGJ1dCBub3cgdGhhdCBJIGxvb2ss
IHRoZSBkaXNjdXNzaW9uIGRpZWQgYmVmb3JlIHJlYWxseSAKZXZlbiBzdGFydGluZy4KClRoaXMg
aXMgd2hhdCBJIHNhaWQgYWJvdXQgdXNlcnNwYWNlIGltcGxlbWVudGF0aW9uOgoKPiBZZXMsIHVu
Zm9ydHVuYXRlbHkgdGhhdCBpcyBub3QgZ29pbmcgdG8gaGFwcGVuLiBJIGRvbid0IHNlZSBob3cg
dGhpcwo+IGNvdWxkIGJlIHVzZWQgaW4gYSBnZW5lcmljIHN5c3RlbSBsaWtlIFdlc3RvbiBvciBY
LiBJdCdzIG1lYW50IGZvciB2ZXJ5Cj4gc3BlY2lmaWMgdXNlIGNhc2VzLCB3aGVyZSB5b3Uga25v
dyBleGFjdGx5IHRoZSByZXF1aXJlbWVudHMgb2YgeW91cgo+IGFwcGxpY2F0aW9uIGFuZCB0aGUg
Y2FwYWJpbGl0aWVzIG9mIHRoZSB3aG9sZSBzeXN0ZW0sIGFuZCBvcHRpbWl6ZSBiYXNlZAo+IG9u
IHRoYXQuCkkga25vdyB0aGlzIGZlYXR1cmUgaXMgdXNlZCBieSBjdXN0b21lcnMsIGJ1dCBJIGRv
bid0IGhhdmUgYWNjZXNzIHRvIAp0aGVpciBhcHBsaWNhdGlvbnMuCgogIFRvbWkKCi0tIApUZXhh
cyBJbnN0cnVtZW50cyBGaW5sYW5kIE95LCBQb3Jra2FsYW5rYXR1IDIyLCAwMDE4MCBIZWxzaW5r
aS4KWS10dW5udXMvQnVzaW5lc3MgSUQ6IDA2MTU1MjEtNC4gS290aXBhaWtrYS9Eb21pY2lsZTog
SGVsc2lua2kKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
ZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0
dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
