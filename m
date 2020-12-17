Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D5492DDFDA
	for <lists+dri-devel@lfdr.de>; Fri, 18 Dec 2020 09:34:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B23C289D56;
	Fri, 18 Dec 2020 08:32:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ironport.ite.com.tw (60-251-196-230.HINET-IP.hinet.net
 [60.251.196.230])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2ABA96E239
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Dec 2020 10:17:40 +0000 (UTC)
IronPort-SDR: QG24yfAsjfeNtckUD1JP48yVAI/mWh3Ou+653xk2bw473IjP931h9WtQgM9h48tZqIpxXz+aHV
 rJz7vH1MqUwQ==
Received: from unknown (HELO mse.ite.com.tw) ([192.168.35.30])
 by ironport.ite.com.tw with ESMTP; 17 Dec 2020 18:17:39 +0800
Received: from CSBMAIL1.internal.ite.com.tw (csbmail1.internal.ite.com.tw
 [192.168.65.58]) by mse.ite.com.tw with ESMTP id 0BHAHXwi011831;
 Thu, 17 Dec 2020 18:17:33 +0800 (GMT-8)
 (envelope-from allen.chen@ite.com.tw)
Received: from CSBMAIL1.internal.ite.com.tw (192.168.65.58) by
 CSBMAIL1.internal.ite.com.tw (192.168.65.58) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1713.5; Thu, 17 Dec 2020 18:17:33 +0800
Received: from CSBMAIL1.internal.ite.com.tw ([fe80::2cba:f37c:ac09:f33f]) by
 CSBMAIL1.internal.ite.com.tw ([fe80::2cba:f37c:ac09:f33f%22]) with mapi id
 15.01.1713.004; Thu, 17 Dec 2020 18:17:33 +0800
From: <allen.chen@ite.com.tw>
To: <mathieutournier@gmail.com>
Subject: RE: [PATCH v6] drm/bridge: add it6505 driver
Thread-Topic: [PATCH v6] drm/bridge: add it6505 driver
Thread-Index: AQHW09kDeNVHdtyQH0m9AQl+m0+RXan5ifSAgAF7uVA=
Date: Thu, 17 Dec 2020 10:17:33 +0000
Message-ID: <d056de706f244ef68121f1ca275f9dfa@ite.com.tw>
References: <3F164009-1941-4980-A704-A35EAE3EDAB1@hxcore.ol>
 <CABWh7Q-j57g_vcTx29Po_L8t_nnOMNjUvYdzbuGsFz-xsmV7AQ@mail.gmail.com>
In-Reply-To: <CABWh7Q-j57g_vcTx29Po_L8t_nnOMNjUvYdzbuGsFz-xsmV7AQ@mail.gmail.com>
Accept-Language: en-US
Content-Language: zh-TW
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [192.168.70.104]
x-tm-snts-smtp: 83C1934D75706A74833661191BBC425129E4A12CD44046931B732A017E5019F22000:8
MIME-Version: 1.0
X-MAIL: mse.ite.com.tw 0BHAHXwi011831
X-Mailman-Approved-At: Fri, 18 Dec 2020 08:31:48 +0000
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
Cc: Kenneth.Hung@ite.com.tw, jitao.shi@mediatek.com, Jau-Chih.Tseng@ite.com.tw,
 airlied@linux.ie, jonas@kwiboo.se, jernej.skrabec@siol.net,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 narmstrong@baylibre.com, a.hajda@samsung.com, Hermes.Wu@ite.com.tw,
 linux-mediatek@lists.infradead.org, Laurent.pinchart@ideasonboard.com,
 pihsun@chromium.org, matthias.bgg@gmail.com, yllin@google.com,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgTWF0aGlldQ0KDQpGb3IgZ29vZ2xlIHJlZmVyZW5jZSBkZXNpZ24obXQ4MTgzK2l0NjUwNSks
IHRoZSBtYXhpbXVtIDk1MDAwa0h6IGlzIGRlcGVuZHMgb24gbXQ4MTgzIHJlcXVpcmVtZW50Lg0K
DQotLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KRnJvbTogTWF0aGlldSBUb3VybmllciBbbWFp
bHRvOm1hdGhpZXV0b3VybmllckBnbWFpbC5jb21dIA0KU2VudDogVGh1cnNkYXksIERlY2VtYmVy
IDE3LCAyMDIwIDI6NDcgQU0NClRvOiBBbGxlbiBDaGVuICjpmbPmn4/lrocpDQpDYzogSmF1LUNo
aWggVHNlbmcgKOabvuaYreaZuik7IEtlbm5ldGggSHVuZyAo5rSq5a625YCrKTsgTGF1cmVudC5w
aW5jaGFydEBpZGVhc29uYm9hcmQuY29tOyBhLmhhamRhQHNhbXN1bmcuY29tOyBhaXJsaWVkQGxp
bnV4LmllOyBkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnOyBIZXJtZXMgV3UgKOWQs+S9
s+Wujyk7IGplcm5lai5za3JhYmVjQHNpb2wubmV0OyBqaXRhby5zaGlAbWVkaWF0ZWsuY29tOyBq
b25hc0Brd2lib28uc2U7IGxpbnV4LWFybS1rZXJuZWxAbGlzdHMuaW5mcmFkZWFkLm9yZzsgbGlu
dXgta2VybmVsQHZnZXIua2VybmVsLm9yZzsgbGludXgtbWVkaWF0ZWtAbGlzdHMuaW5mcmFkZWFk
Lm9yZzsgbWF0dGhpYXMuYmdnQGdtYWlsLmNvbTsgbmFybXN0cm9uZ0BiYXlsaWJyZS5jb207IHBp
aHN1bkBjaHJvbWl1bS5vcmc7IHlsbGluQGdvb2dsZS5jb20NClN1YmplY3Q6IFJlOiBbUEFUQ0gg
djZdIGRybS9icmlkZ2U6IGFkZCBpdDY1MDUgZHJpdmVyDQoNCkhpIEFsbGVuLg0KDQpBcyBpdDY1
MDUgaXMgY29tcGF0aWJsZSB3aXRoIERpc3BsYXlQb3J0IDEuMWEsDQpTaG91bGQgRFBJX1BJWEVM
X0NMS19NQVggYmUgMTY1IDAwMCBpbnN0ZWFkIG9mIDk1IDAwMCBraHogPw0KVGhpcyB3b3VsZCBw
ZXJtaXQgMTA4MHAgc3VwcG9ydCwgYXMgaXQgbWF5IGJlIHN1cHBvcnRlZC4NCg0KTWF0aGlldQ0K
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
