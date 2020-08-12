Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 38EAE242858
	for <lists+dri-devel@lfdr.de>; Wed, 12 Aug 2020 12:48:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 268FF6E8D2;
	Wed, 12 Aug 2020 10:48:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CB8F66E8D2
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Aug 2020 10:48:02 +0000 (UTC)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
 by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 07CAllRr030912;
 Wed, 12 Aug 2020 05:47:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1597229267;
 bh=evki6dI5ts5KOmGlF8qCX59wMWhwGQMc/ZNVJhMADKg=;
 h=Subject:To:CC:References:From:Date:In-Reply-To;
 b=FLCDAVbve+oTVJhXUk7KB9Nf1N8Y5hv2YdvDJfrw1FlDnAjzXHCfuyeJByBhGI5VC
 IRk6YOcrYOzn50dLMDMAAUNtsDpxbJe1ntKJBfo4mxBorMFfFWdsFwycdn86j+IJ8L
 ZGVk/Vu1l5zcx7oB8QZkFkIBnkfHCFzIrC1ZStKw=
Received: from DLEE114.ent.ti.com (dlee114.ent.ti.com [157.170.170.25])
 by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 07CAll8W063305
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Wed, 12 Aug 2020 05:47:47 -0500
Received: from DLEE101.ent.ti.com (157.170.170.31) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Wed, 12
 Aug 2020 05:47:47 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE101.ent.ti.com
 (157.170.170.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Wed, 12 Aug 2020 05:47:47 -0500
Received: from [192.168.2.6] (ileax41-snat.itg.ti.com [10.172.224.153])
 by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 07CAlhX8025723;
 Wed, 12 Aug 2020 05:47:43 -0500
Subject: Re: [PATCH v8 0/3] drm: Add support for Cadence MHDP DPI/DP bridge
 and J721E wrapper.
To: =?UTF-8?Q?Guido_G=c3=bcnther?= <agx@sigxcpu.org>, Swapnil Jakhade
 <sjakhade@cadence.com>
References: <1596713672-8146-1-git-send-email-sjakhade@cadence.com>
 <20200812083937.GA8816@bogon.m.sigxcpu.org>
From: Tomi Valkeinen <tomi.valkeinen@ti.com>
Message-ID: <3bcbbb0b-ee04-0f1e-6c54-97b01c552d82@ti.com>
Date: Wed, 12 Aug 2020 13:47:42 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200812083937.GA8816@bogon.m.sigxcpu.org>
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
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
Cc: devicetree@vger.kernel.org, jernej.skrabec@siol.net, praneeth@ti.com,
 yamonkar@cadence.com, narmstrong@baylibre.com, airlied@linux.ie,
 sandor.yu@nxp.com, jonas@kwiboo.se, nsekhar@ti.com,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 a.hajda@samsung.com, robh+dt@kernel.org, Laurent.pinchart@ideasonboard.com,
 jsarha@ti.com, mparab@cadence.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgR3VpZG8sCgpPbiAxMi8wOC8yMDIwIDExOjM5LCBHdWlkbyBHw7xudGhlciB3cm90ZToKPiBI
aSwKPiBPbiBUaHUsIEF1ZyAwNiwgMjAyMCBhdCAwMTozNDoyOVBNICswMjAwLCBTd2FwbmlsIEph
a2hhZGUgd3JvdGU6Cj4+IFRoaXMgcGF0Y2ggc2VyaWVzIGFkZHMgbmV3IERSTSBicmlkZ2UgZHJp
dmVyIGZvciBDYWRlbmNlIE1IRFAgRFBJL0RQCj4+IGJyaWRnZS4gVGhlIENhZGVuY2UgRGlzcGxh
eSBQb3J0IElQIGlzIGFsc28gcmVmZXJyZWQgYXMgTUhEUCAoTW9iaWxlIEhpZ2gKPj4gRGVmaW5p
dGlvbiBMaW5rLCBIaWdoLURlZmluaXRpb24gTXVsdGltZWRpYSBJbnRlcmZhY2UsIERpc3BsYXkg
UG9ydCkuCj4+IENhZGVuY2UgRGlzcGxheSBQb3J0IGNvbXBsaWVzIHdpdGggVkVTQSBEaXNwbGF5
UG9ydCAoRFApIGFuZCBlbWJlZGRlZAo+PiBEaXNwbGF5IFBvcnQgKGVEUCkgc3RhbmRhcmRzLgo+
IAo+IElzIHRoZXJlIGFueSByZWxhdGlvbiB0byB0aGUgY2FkZW5jZSBtaGRwIGlwIGNvcmUgdXNl
ZCBpbnRoZSBpbXg4bXE6Cj4gCj4gICAgIGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2RyaS1kZXZl
bC9jb3Zlci4xNTkwOTgyODgxLmdpdC5TYW5kb3IueXVAbnhwLmNvbS8KPiAKPiBJdCBsb29rcyB2
ZXJ5IHNpbWlsYXIgaW4gc2V2ZXJhbCBwbGFjZXMgc28gc2hvdWxkIHRoYXQgdXNlIHRoZSBzYW1l
IGRyaXZlcj8KPiBDaGVlcnMsCj4gIC0tIEd1aWRvCgpJbnRlcmVzdGluZy4KClNvIHRoZSBvcmln
aW5hbCBDYWRlbmNlIERQIHBhdGNoZXMgZm9yIFRJIFNvQ3MgZGlkIGNyZWF0ZSBhIGNvbW1vbiBk
cml2ZXIgd2l0aCBSb2NrY2hpcCdzIG9sZGVyIG1oZHAKZHJpdmVyLiBBbmQgbG9va3MgbGlrZSB0
aGUgSU1YIHNlcmllcyBwb2ludHMgdG8gYW4gZWFybHkgdmVyc2lvbiBvZiB0aGF0IHBhdGNoICgi
ZHJtL3JvY2tjaGlwOgpwcmVwYXJlIGNvbW1vbiBjb2RlIGZvciBjZG5zIGFuZCByayBkcGkvZHAg
ZHJpdmVyIikuCgpXZSBnYXZlIHVwIG9uIHRoYXQgYXMgdGhlIElQcyBkaWQgaGF2ZSBkaWZmZXJl
bmNlcyBhbmQgdGhlIGZpcm13YXJlcyB1c2VkIHdlcmUgYXBwYXJlbnRseSBxdWl0ZQpkaWZmZXJl
bnQuIFRoZSBlbmQgcmVzdWx0IHdhcyB2ZXJ5IGRpZmZpY3VsdCB0byBtYWludGFpbiwgZXNwZWNp
YWxseSBhcyAoYWZhaWspIG5vbmUgb2YgdGhlIHBlb3BsZQppbnZvbHZlZCBoYWQgcmVsZXZhbnQg
Um9ja2NoaXAgSFcuCgpUaGUgaWRlYSB3YXMgdG8gZ2V0IGEgc3RhYmxlIERQIGRyaXZlciBmb3Ig
VEkgU29DcyByZWFkeSBhbmQgdXBzdHJlYW0sIGFuZCB0aGVuIGNhcmVmdWxseSB0cnkgdG8KY3Jl
YXRlIGNvbW1vbiBwYXJ0cyB3aXRoIFJvY2tjaGlwJ3MgZHJpdmVyIGluIHNtYWxsIHBpZWNlcy4K
CklmIHRoZSBSb2NrY2hpcCBhbmQgSU1YIG1oZHAgaGF2ZSB0aGUgc2FtZSBJUCBhbmQgc2FtZSBm
aXJtd2FyZSwgdGhlbiB0aGV5IG9idmlvdXNseSBzaG91bGQgc2hhcmUKY29kZSBhcyBkb25lIGlu
IHRoZSBzZXJpZXMgeW91IHBvaW50IHRvLgoKUGVyaGFwcyBDYWRlbmNlIGNhbiBjbGFyaWZ5IHRo
ZSBkaWZmZXJlbmNlcyBiZXR3ZWVuIElNWCwgVEkgYW5kIFJvY2tjaGlwIElQcyBhbmQgRldzPwoK
SSdtIHdvcnJpZWQgdGhhdCBpZiB0aGVyZSBhcmUgSVAgZGlmZmVyZW5jZXMsIGV2ZW4gaWYgbm90
IGdyZWF0IG9uZXMsIGFuZCBpZiB0aGUgRldzIGFyZSBkaWZmZXJlbnQKYW5kIGRldmVsb3BlZCBz
ZXBhcmF0ZWx5LCBpdCdsbCBiZSBhIGNvbnN0YW50ICJmaXggWCBmb3IgU29DIEEsIGFuZCBhY2Np
ZGVudGFsbHkgYnJlYWsgWSBmb3IgU29DIEIKYW5kIEMiLCBlc3BlY2lhbGx5IGlmIHRvbyBtdWNo
IGNvZGUgaXMgc2hhcmVkLgoKSW4gdGhlIGxvbmcgcnVuIEknbSBhbGwgZm9yIGEgc2luZ2xlIGRy
aXZlciAob3IgbGFyZ2Ugc2hhcmVkIHBhcnRzKSwgYnV0IEknbSBub3Qgc3VyZSBpZiB3ZSBzaG91
bGQKc3RhcnQgd2l0aCB0aGF0IGFwcHJvYWNoLgoKIFRvbWkKCi0tIApUZXhhcyBJbnN0cnVtZW50
cyBGaW5sYW5kIE95LCBQb3Jra2FsYW5rYXR1IDIyLCAwMDE4MCBIZWxzaW5raS4KWS10dW5udXMv
QnVzaW5lc3MgSUQ6IDA2MTU1MjEtNC4gS290aXBhaWtrYS9Eb21pY2lsZTogSGVsc2lua2kKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1h
aWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
