Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 81875BF36E
	for <lists+dri-devel@lfdr.de>; Thu, 26 Sep 2019 14:54:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 70F2E89E0D;
	Thu, 26 Sep 2019 12:54:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E047B89704
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Sep 2019 12:54:51 +0000 (UTC)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
 by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id x8QCsk8b047005;
 Thu, 26 Sep 2019 07:54:46 -0500
Received: from DFLE111.ent.ti.com (dfle111.ent.ti.com [10.64.6.32])
 by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x8QCskRE003644
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Thu, 26 Sep 2019 07:54:46 -0500
Received: from DFLE107.ent.ti.com (10.64.6.28) by DFLE111.ent.ti.com
 (10.64.6.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Thu, 26
 Sep 2019 07:54:38 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE107.ent.ti.com
 (10.64.6.28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Thu, 26 Sep 2019 07:54:38 -0500
Received: from [192.168.2.6] (ileax41-snat.itg.ti.com [10.172.224.153])
 by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id x8QCsik0094283;
 Thu, 26 Sep 2019 07:54:44 -0500
Subject: Re: [PATCH 2/7] drm/omap: tweak HDMI DDC timings
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Alejandro Hernandez
 <ajhernandez@ti.com>
References: <20190902125359.18001-1-tomi.valkeinen@ti.com>
 <20190902125359.18001-3-tomi.valkeinen@ti.com>
 <20190903142353.GE4812@pendragon.ideasonboard.com>
From: Tomi Valkeinen <tomi.valkeinen@ti.com>
Message-ID: <f103e3ac-3d50-c255-b036-d5638bc291dd@ti.com>
Date: Thu, 26 Sep 2019 15:54:43 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190903142353.GE4812@pendragon.ideasonboard.com>
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ti.com; s=ti-com-17Q1; t=1569502486;
 bh=YDTq4gT/jj/YkSUMxg2QsjSs6D/4sRUf7NgSUlMVwVg=;
 h=Subject:To:CC:References:From:Date:In-Reply-To;
 b=OvBN88ISFhJ+14TXm787oLBT+8yMp0rdvEUtKhuTVsIHhp7kOHA7vJNDpl2vhgYIg
 ZBE3Bo51FcHSYXRWQsn+MAksRRSWX5pmkxcAlFTSiddSSt6S0/B/ntkAJCmuDlFSHK
 dfQM8KahICsIDsn8wugLELlhIs+tESH13hTs5G9Y=
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
Cc: Jyri Sarha <jsarha@ti.com>, dri-devel@lists.freedesktop.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMDMvMDkvMjAxOSAxNzoyMywgTGF1cmVudCBQaW5jaGFydCB3cm90ZToKPiBIaSBUb21pLAo+
IAo+IFRoYW5rIHlvdSBmb3IgdGhlIHBhdGguCj4gCj4gT24gTW9uLCBTZXAgMDIsIDIwMTkgYXQg
MDM6NTM6NTRQTSArMDMwMCwgVG9taSBWYWxrZWluZW4gd3JvdGU6Cj4+IEZyb206IEFsZWphbmRy
byBIZXJuYW5kZXogPGFqaGVybmFuZGV6QHRpLmNvbT4KPj4KPj4gQSAiSERNSSBJMkMgTWFzdGVy
IEVycm9yIiBpcyBzb21ldGltZXMgcmVwb3J0ZWQgd2l0aCB0aGUgY3VycmVudCBEREMgU0NMCj4+
IHRpbWluZ3MuIFRoZSBjdXJyZW50IHNldHRpbmdzIGZvciBhIDEwdXMgU0NMIHBlcmlvZCAoMTAw
IEtIeikgY2F1c2VzIHRoZQo+PiBlcnJvciB3aXRoIHNvbWUgZGlzcGxheXMuICBUaGlzIHBhdGNo
IGluY3JlYXNlcyB0aGUgU0NMIHNpZ25hbCBwZXJpb2QKPj4gZnJvbSAxMHVzIHRvIDEwLjJ1cywg
d2l0aCB0aGUgbmV3IHNldHRpbmdzIHRoZSBlcnJvciBpcyBub3Qgb2JzZXJ2ZWQKPj4KPiAKPiBJ
dCB3b3VsZCBiZSB1c2VmdWwgdG8gZG9jdW1lbnQgd2hhdCB0aG9zZSAic29tZSBkaXNwbGF5cyIg
YXJlIGlmIHlvdQo+IGNhbi4KClVuZm9ydHVuYXRlbHkgSSBoYXZlIG5vIGlkZWEuIFRoaXMgd2Fz
IHF1aXRlIGEgd2hpbGUgYWdvLgoKQWxlamFuZHJvLCBkbyB5b3UgcmVjYWxsPwoKICBUb21pCgot
LSAKVGV4YXMgSW5zdHJ1bWVudHMgRmlubGFuZCBPeSwgUG9ya2thbGFua2F0dSAyMiwgMDAxODAg
SGVsc2lua2kuClktdHVubnVzL0J1c2luZXNzIElEOiAwNjE1NTIxLTQuIEtvdGlwYWlra2EvRG9t
aWNpbGU6IEhlbHNpbmtpCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9w
Lm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1k
ZXZlbA==
