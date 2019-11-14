Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 396ECFC2C9
	for <lists+dri-devel@lfdr.de>; Thu, 14 Nov 2019 10:40:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B1C926E155;
	Thu, 14 Nov 2019 09:40:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 577576E153
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Nov 2019 09:40:06 +0000 (UTC)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
 by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id xAE9dwct060060;
 Thu, 14 Nov 2019 03:39:58 -0600
Received: from DFLE114.ent.ti.com (dfle114.ent.ti.com [10.64.6.35])
 by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id xAE9dwMV035445
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Thu, 14 Nov 2019 03:39:58 -0600
Received: from DFLE112.ent.ti.com (10.64.6.33) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Thu, 14
 Nov 2019 03:39:58 -0600
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Thu, 14 Nov 2019 03:39:58 -0600
Received: from deskari.lan (ileax41-snat.itg.ti.com [10.172.224.153])
 by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id xAE9dtjn085959;
 Thu, 14 Nov 2019 03:39:56 -0600
From: Tomi Valkeinen <tomi.valkeinen@ti.com>
To: <dri-devel@lists.freedesktop.org>, <devicetree@vger.kernel.org>, Thierry
 Reding <thierry.reding@gmail.com>, Tony Lindgren <tony@atomide.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: [PATCH 0/3] drm/omap: fix am4 evm lcd
Date: Thu, 14 Nov 2019 11:39:47 +0200
Message-ID: <20191114093950.4101-1-tomi.valkeinen@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ti.com; s=ti-com-17Q1; t=1573724398;
 bh=eR1yIrg2X8EeWm9KCPcT2Lr4/cMCf/WphmqdpoQ3zsE=;
 h=From:To:CC:Subject:Date;
 b=Y6MS4nhFWAgNDGvua5dmwrshnfV3YvzMpOHfCxccYAIPWvYXkp360vVqRbbDMUib4
 6z2SzubaeypK/V5OGTTvC1yHvN1UlXvO4VWO0nWMnABCfVT4Na0s+KpSxgvXrVp4m3
 edVYNvymCgV7kN9hyjrXBK7Ax3650U2X7o2H5wnk=
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
Cc: Peter Ujfalusi <peter.ujfalusi@ti.com>,
 Tomi Valkeinen <tomi.valkeinen@ti.com>, Jyri Sarha <jsarha@ti.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgVG9ueSwgVGhpZXJyeSwgTGF1cmVudCwKCkFmdGVyIHRoZSByZWNlbnQgY2hhbmdlIG9mIG1v
dmluZyBmcm9tIG9tYXBkcm0gc3BlY2lmaWMgcGFuZWwtZHBpIGRyaXZlcgp0byB0aGUgRFJNIHNp
bXBsZSBwYW5lbCwgQU00IEVWTS9lUE9TJ3MgcGFuZWwgaXMgbm90IHdvcmtpbmcgcXVpdGUKcmln
aHQuIFRoaXMgc2VyaWVzIGhhcyBmaXhlcyBmb3IgaXQsIGJ1dCBJJ20gbm90IHN1cmUgaWYgdGhl
c2UgYXJlIHRoZQpyaWdodCB3YXlzIHRvIGZpeCB0aGUgaXNzdWVzLCBzbyBjb21tZW50cyB3ZWxj
b21lLgoKMSkgUGFuZWwgZHJpdmVyIGlzIG5vdCBwcm9iZWQuIFdpdGggb21hcGRybSdzIHBhbmVs
LWRwaSwgdGhlIG1hdGNoCmhhcHBlbmVkIHdpdGggInBhbmVsLWRwaSIgY29tcGF0aWJsZSBzdHJp
bmcuIE5vdyB3aXRoIHBhbmVsLXNpbXBsZSwgdGhlCm1hdGNoIHNob3VsZCBoYXBwZW4gd2l0aCB0
aGUgcGFuZWwgbW9kZWwgY29tcGF0aWJsZSBzdHJpbmcsIHdoaWNoIGlzCiJvc2RkaXNwbGF5cyxv
c2QwNTdUMDU1OS0zNHRzIiBpbiB0aGUgRFQgZmlsZS4gSG93ZXZlciwgbm8gc3VjaApjb21wYXRp
YmxlIGV4aXN0cyBpbiBwYW5lbC1zaW1wbGUuCgpJbnRlcmVzdGluZ2x5LCB0aGUgYWN0dWFsIHBh
bmVsIGF0IGxlYXN0IG9uIG15IEVWTXMgYW5kIGVQT1NlcyBpcyBub3QKb3NkMDU3VDA1NTktMzR0
cywgYnV0IG9zZDA3MHQxNzE4LTE5dHMuIEFsc28sIEkgd2FzIHVuYWJsZSB0byBmaW5kIGFueQpp
bmZvcm1hdGlvbiBhYm91dCBvc2QwNTdUMDU1OS0zNHRzLiBJIGRvbid0IGtub3cgdGhlIGhpc3Rv
cnkgd2l0aCB0aGlzLApzbyBpdCBpcyBwb3NzaWJsZSB0aGF0IHRoZSBlYXJseSB2ZXJzaW9ucyBv
ZiB0aGUgYm9hcmRzIGRpZCBoYXZlCm9zZDA1N1QwNTU5LTM0dHMsIGJ1dCB3YXMgbGF0ZXIgY2hh
bmdlZCB0byBvc2QwNzB0MTcxOC0xOXRzLgoKQXMgb3NkMDcwdDE3MTgtMTl0cyBpcyBzdXBwb3J0
ZWQgYnkgcGFuZWwtc2ltcGxlLCBjaGFuZ2luZyB0aGUKY29tcGF0aWJsZSBzdHJpbmcgdG8gb3Nk
MDcwdDE3MTgtMTl0cyBpbiB0aGUgRFQgZmlsZSBzb2x2ZXMgdGhpcyBvbmUuCgoyKSBUaW1pbmdz
IGluIERUIGZpbGUgY2F1c2UgYSBrZXJuZWwgd2FybmluZy4gT21hcGRybSdzIHBhbmVsLWRwaSB1
c2VkCnZpZGVvIHRpbWluZ3MgZnJvbSB0aGUgRFQgZmlsZSwgc28gdGhleSBhcmUgcHJlc2VudCBp
biBhbGwgdGhlIERUIGZpbGVzLgpwYW5lbC1zaW1wbGUgdXNlcyB0aW1pbmdzIGZyb20gYSB0YWJs
ZSBpbiB0aGUgcGFuZWwtc2ltcGxlIGRyaXZlciwgYnV0CmdpdmVzIGEga2VybmVsIHdhcm5pbmcg
aWYgdGhlIERUIGZpbGUgY29udGFpbnMgdGltaW5ncy4KClRoaXMgY2FuIGJlIHNvbHZlZCBieSBy
ZW1vdmluZyB0aGUgdGltaW5ncyBmcm9tIHRoZSBEVCBmaWxlLgoKMykgU3luYyBkcml2ZSBlZGdl
IGlzIG5vdCByaWdodC4gVGhpcyBvbmUgbWlnaHQgaGF2ZSBiZWVuIHByZXNlbnQgYWxzbwp3aXRo
IHBhbmVsLWRwaSwgSSBkaWRuJ3QgdmVyaWZ5LiBUaGUgcHJvYmxlbSBpcyB0aGF0IHRoZSBwYW5l
bC1zaW1wbGUKZGF0YSBmb3Igb3NkZGlzcGxheXNfb3NkMDcwdDE3MThfMTl0cyBkZWZpbmVzIGJ1
c19mbGFncyBmb3IgREUgcG9sYXJpdHkKYW5kIHBpeGRhdGEgZWRnZSwgYnV0IG5vdCBmb3Igc3lu
YyBlZGdlLgoKVGhlIGRhdGFzaGVldCBmb3IgdGhlIHBhbmVsIGRvZXMgbm90IGdpdmUgYW55IGhp
bnQgb24gd2hhdCB0aGUgZWRnZQpzaG91bGQgYmUuICBPbWFwZHJtIGRlZmF1bHRzIHRvIGRyaXZp
bmcgc3luY3Mgb24gZmFsbGluZyBlZGdlLCB3aGljaApjYXVzZWQgdGhlIGltYWdlIHRvIGJlIHNo
aWZ0ZWQgb25lIHBpeGVsIHRvIHRoZSByaWdodC4KCkFkZGluZyBEUk1fQlVTX0ZMQUdfU1lOQ19E
UklWRV9QT1NFREdFIGJ1c19mbGFnIHNvbHZlcyB0aGUgcHJvYmxlbS4gQU01CkVWTSBhbHNvIGhh
cyB0aGUgc2FtZSBwYW5lbCB3aXRoIHRoZSBzYW1lIGJlaGF2aW9yLgoKPT09PQoKVGhlIHJlYXNv
biBJJ20gbm90IHN1cmUgaWYgdGhlIDEpIGFuZCAyKSBmaXhlcyBhcmUgY29ycmVjdCBpcyB0aGF0
CnRoZXkncmUgYnJlYWtpbmcgRFQgY29tcGF0aWJpbGl0eS4gU2hvdWxkIHdlIGluc3RlYWQgbWFr
ZSBjaGFuZ2VzIHRvCnBhbmVsLXNpbXBsZSB0byBrZWVwIHRoZSBzYW1lIERUIGZpbGVzIHdvcmtp
bmc/CgpUaGlzIHdvdWxkIG1lYW4gYWRkaW5nIGEgbmV3IGVudHJ5IGZvciB0aGUgb3NkMDU3VDA1
NTktMzR0cyBwYW5lbCwgYnV0CmFzIHdlIGRvbid0IGhhdmUgZGF0YXNoZWV0IGZvciBpdCwgSSB0
aGluayB3ZSBjb3VsZCBqdXN0IGFwcGVuZCB0aGUKY29tcGF0aWJsZSBzdHJpbmcgdG8gb3NkMDcw
dDE3MTgtMTl0J3MgZGF0YS4KCkl0IHdvdWxkIGFsc28gbWVhbiBkb2luZyBzb21lIGNoYW5nZSB0
byB0aGUgcGFuZWwtc2ltcGxlIGNvZGUgdGhhdCBnaXZlcwp0aGUgd2FybmluZyBhYm91dCB0aW1p
bmdzIGluIERUIGRhdGEuIFRoaXMgbWlnaHQgbWFrZSBzZW5zZSwgYXMgSSB0aGluawp3ZSBoYXZl
IG90aGVyIERUIGZpbGVzIHdpdGggdmlkZW8gdGltaW5ncyB0b28uCgpGb3IgMyksIEkgdGhpbmsg
dGhlIHBhdGNoIGlzIGZpbmUsIGJ1dCBJJ20gbm90IHN1cmUgaWYgdGhlIGRpc3BsYXkKY29udHJv
bGxlciBkcml2ZXIgc2hvdWxkIGJlIGFibGUgdG8gZGVkdWNlIHRoZSBzeW5jIGRyaXZlIGVkZ2Ug
ZnJvbSB0aGUKcGl4ZGF0YSBkcml2ZSBlZGdlLiBBcmUgdGhleSB1c3VhbGx5IHRoZSBzYW1lPyBJ
IGhhdmUgbm8gaWRlYS4uLgoKIFRvbWkKClRvbWkgVmFsa2VpbmVuICgzKToKICBBUk06IGR0czog
YW00Mzd4LWdwL2Vwb3MtZXZtOiBmaXggcGFuZWwgY29tcGF0aWJsZQogIEFSTTogZHRzOiBhbTQz
N3gtZ3AvZXBvcy1ldm06IGRyb3AgdW51c2VkIHBhbmVsIHRpbWluZ3MKICBkcm0vcGFuZWw6IHNp
bXBsZTogZml4IG9zZDA3MHQxNzE4XzE5dHMgc3luYyBkcml2ZSBlZGdlCgogYXJjaC9hcm0vYm9v
dC9kdHMvYW00Mzd4LWdwLWV2bS5kdHMgIHwgMTggKy0tLS0tLS0tLS0tLS0tLS0tCiBhcmNoL2Fy
bS9ib290L2R0cy9hbTQzeC1lcG9zLWV2bS5kdHMgfCAxOCArLS0tLS0tLS0tLS0tLS0tLS0KIGRy
aXZlcnMvZ3B1L2RybS9wYW5lbC9wYW5lbC1zaW1wbGUuYyB8ICAzICsrLQogMyBmaWxlcyBjaGFu
Z2VkLCA0IGluc2VydGlvbnMoKyksIDM1IGRlbGV0aW9ucygtKQoKLS0KVGV4YXMgSW5zdHJ1bWVu
dHMgRmlubGFuZCBPeSwgUG9ya2thbGFua2F0dSAyMiwgMDAxODAgSGVsc2lua2kuClktdHVubnVz
L0J1c2luZXNzIElEOiAwNjE1NTIxLTQuIEtvdGlwYWlra2EvRG9taWNpbGU6IEhlbHNpbmtpCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwg
bWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0
cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
