Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oJFtBvjKi2m4bAAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Wed, 11 Feb 2026 01:19:04 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A2A6120446
	for <lists+dri-devel@lfdr.de>; Wed, 11 Feb 2026 01:19:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C587D10E058;
	Wed, 11 Feb 2026 00:18:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=ite.com.tw header.i=@ite.com.tw header.b="nSFh00Cd";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ironport.ite.com.tw (219-87-157-213.static.tfn.net.tw
 [219.87.157.213])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0AA1C10E058
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Feb 2026 00:18:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ite.com.tw; s=dkim;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=X8VNOLxVdr6v0QbTbvixpoK8YWaNtPDCEHxIV7FWnYc=;
 b=nSFh00CdZA+VcEW1M8+RDUjf9zA6nip5p6KaUhlYTWaYfW3ZwjWSuqms
 olV5M4GIfEZXeoFRFaY294ji+ONg/FcYhwD/9SJ6ajiFragYW9THXyUg3
 EboLdShUYD0W8jM6xn+H/3LWdJPRaVQGr+5CXFjN0v6ui5ArG0edPFKY6
 SLKF2NEcrNkKfycXwK9IM2wkxl7xMV0YRy4CC+5JF654RG7T8e9UJa0lx
 oyNd1palyCarPY002pJamKthviSe7HqndolS3BHZ/EsBu2JawORtbrATN
 /UF5t9aqWMwAhrcqsocjmcXCB2ZatxSAVB/3yKDndreA7MoG5OzRDUPhp w==;
X-CSE-ConnectionGUID: HUSOHO6GSZ6nqjsytGGoVg==
X-CSE-MsgGUID: 8ii6Z/1qQCScnaKShCMFKQ==
Received: from unknown (HELO mse.ite.com.tw) ([192.168.35.30])
 by ironport.ite.com.tw with ESMTP; 11 Feb 2026 08:14:25 +0800
Received: from CSBMAIL1.internal.ite.com.tw (CSBMAIL2.internal.ite.com.tw
 [192.168.65.41]) by mse.ite.com.tw with ESMTP id 61B0HiXX098938;
 Wed, 11 Feb 2026 08:17:44 +0800 (+08)
 (envelope-from Pet.Weng@ite.com.tw)
Received: from CSBMAIL2.internal.ite.com.tw (192.168.65.41) by
 CSBMAIL2.internal.ite.com.tw (192.168.65.41) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Wed, 11 Feb 2026 08:17:42 +0800
Received: from CSBMAIL2.internal.ite.com.tw ([fe80::9446:9aa0:fea6:7e92]) by
 CSBMAIL2.internal.ite.com.tw ([fe80::9446:9aa0:fea6:7e92%15]) with mapi id
 15.02.2562.035; Wed, 11 Feb 2026 08:17:42 +0800
From: <Pet.Weng@ite.com.tw>
To: <robh@kernel.org>
CC: <andrzej.hajda@intel.com>, <neil.armstrong@linaro.org>, <rfoss@kernel.org>,
 <Laurent.pinchart@ideasonboard.com>, <jonas@kwiboo.se>,
 <jernej.skrabec@gmail.com>, <maarten.lankhorst@linux.intel.com>,
 <mripard@kernel.org>, <tzimmermann@suse.de>, <airlied@gmail.com>,
 <simona@ffwll.ch>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
 <dri-devel@lists.freedesktop.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <Hermes.Wu@ite.com.tw>,
 <Kenneth.Hung@ite.com.tw>, <Jau-Chih.Tseng@ite.com.tw>,
 <treapking@google.com>
Subject: RE: [PATCH v6 1/3] dt-binding: display: Add ITE IT61620 MIPI DSI to
 HDMI bridge
Thread-Topic: [PATCH v6 1/3] dt-binding: display: Add ITE IT61620 MIPI DSI to
 HDMI bridge
Thread-Index: AQHclTklgY85MwF+Skm21guaMZWaebV8rCLw
Date: Wed, 11 Feb 2026 00:17:42 +0000
Message-ID: <ec0c9019f02f4d3db3498758f9c0fd7d@ite.com.tw>
References: <20260130-it61620-0714-v6-0-70afa65923b5@ite.com.tw>
 <20260130-it61620-0714-v6-1-70afa65923b5@ite.com.tw>
 <20260203181546.GA3341586-robh@kernel.org>
In-Reply-To: <20260203181546.GA3341586-robh@kernel.org>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [192.168.70.27]
x-tm-snts-smtp: 939A3E17BBBADCDF9341C6EA23535C7A814FB5CBDEA5BAC7755381E8927EA15E2002:8
Content-Type: text/plain; charset="big5"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MAIL: mse.ite.com.tw 61B0HiXX098938
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.29 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[ite.com.tw,quarantine];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[ite.com.tw:s=dkim];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MIME_BASE64_TEXT(0.10)[];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:robh@kernel.org,m:andrzej.hajda@intel.com,m:neil.armstrong@linaro.org,m:rfoss@kernel.org,m:Laurent.pinchart@ideasonboard.com,m:jonas@kwiboo.se,m:jernej.skrabec@gmail.com,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:Hermes.Wu@ite.com.tw,m:Kenneth.Hung@ite.com.tw,m:Jau-Chih.Tseng@ite.com.tw,m:treapking@google.com,m:jernejskrabec@gmail.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	SUSPICIOUS_AUTH_ORIGIN(0.00)[];
	FORGED_SENDER(0.00)[Pet.Weng@ite.com.tw,dri-devel-bounces@lists.freedesktop.org];
	RCPT_COUNT_TWELVE(0.00)[21];
	FREEMAIL_CC(0.00)[intel.com,linaro.org,kernel.org,ideasonboard.com,kwiboo.se,gmail.com,linux.intel.com,suse.de,ffwll.ch,lists.freedesktop.org,vger.kernel.org,ite.com.tw,google.com];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FROM_NEQ_ENVFROM(0.00)[Pet.Weng@ite.com.tw,dri-devel-bounces@lists.freedesktop.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	HAS_XOIP(0.00)[];
	TO_DN_NONE(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	DKIM_TRACE(0.00)[ite.com.tw:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel,dt];
	MISSING_XM_UA(0.00)[];
	DBL_PROHIBIT(0.00)[0.0.0.58:email,0.0.0.2:email];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	FROM_NO_DN(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[0.0.0.0:email,devicetree.org:url,0.0.0.1:email]
X-Rspamd-Queue-Id: 0A2A6120446
X-Rspamd-Action: no action

PiBPbiBGcmksIEphbiAzMCwgMjAyNiBhdCAwMzo1MTozNFBNICswODAwLCBQZXQgV2VuZyB3cm90
ZToNCj4gPiBUaGlzIGNoaXAgcmVjZWl2ZXMgTUlQSSBEU0kgaW5wdXQgYW5kIG91dHB1dHMgSERN
SSwgYW5kIGlzIGNvbW1vbmx5DQo+ID4gY29ubmVjdGVkIHRvIFNvQ3MgdmlhIEkyQyBhbmQgRFNJ
Lg0KPiA+DQo+ID4gU2lnbmVkLW9mZi1ieTogUGV0IFdlbmcgPHBldC53ZW5nQGl0ZS5jb20udHc+
DQo+IA0KPiBNaXNzaW5nIEtyenlzenRvZidzIFJldmlld2VkLWJ5Lg0KPiANCg0KVGhhbmtzIGZv
ciBwb2ludGluZyB0aGF0IG91dC4NCllvdSdyZSByaWdodCChWCBJIG1pc3NlZCBLcnp5c3p0b2Yn
cyBSZXZpZXdlZC1ieSB0YWcuIEmhpmxsIGluY2x1ZGUgaXQgaW4gdGhlIG5leHQgcmV2aXNpb24u
DQpQZXQNCg0KPiA+IC0tLQ0KPiA+ICAuLi4vYmluZGluZ3MvZGlzcGxheS9icmlkZ2UvaXRlLGl0
NjE2MjAueWFtbCAgICAgICB8IDE0MiArKysrKysrKysrKysrKysrKysrKysNCj4gPiAgMSBmaWxl
IGNoYW5nZWQsIDE0MiBpbnNlcnRpb25zKCspDQo+ID4NCj4gPiBkaWZmIC0tZ2l0IGEvRG9jdW1l
bnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkvYnJpZGdlL2l0ZSxpdDYxNjIwLnlh
bWwNCj4gYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS9icmlkZ2Uv
aXRlLGl0NjE2MjAueWFtbA0KPiA+IG5ldyBmaWxlIG1vZGUgMTAwNjQ0DQo+ID4gaW5kZXggMDAw
MDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMC4uZTE5NWQxOTJmNmIxYTJkMDky
YjM3NDVlM2U3ZjYyYjhiMWQyZDhjZQ0KPiA+IC0tLSAvZGV2L251bGwNCj4gPiArKysgYi9Eb2N1
bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS9icmlkZ2UvaXRlLGl0NjE2MjAu
eWFtbA0KPiA+IEBAIC0wLDAgKzEsMTQyIEBADQo+ID4gKyMgU1BEWC1MaWNlbnNlLUlkZW50aWZp
ZXI6IChHUEwtMi4wLW9ubHkgT1IgQlNELTItQ2xhdXNlKQ0KPiA+ICslWUFNTCAxLjINCj4gPiAr
LS0tDQo+ID4gKyRpZDogaHR0cDovL2RldmljZXRyZWUub3JnL3NjaGVtYXMvZGlzcGxheS9icmlk
Z2UvaXRlLGl0NjE2MjAueWFtbCMNCj4gPiArJHNjaGVtYTogaHR0cDovL2RldmljZXRyZWUub3Jn
L21ldGEtc2NoZW1hcy9jb3JlLnlhbWwjDQo+ID4gKw0KPiA+ICt0aXRsZTogSVRFIElUNjE2MjAg
TUlQSSBEU0kgdG8gSERNSSBCcmlkZ2UNCj4gPiArDQo+ID4gK21haW50YWluZXJzOg0KPiA+ICsg
IC0gUGV0IFdlbmcgPHBldC53ZW5nQGl0ZS5jb20udHc+DQo+ID4gKw0KPiA+ICtkZXNjcmlwdGlv
bjogfA0KPiA+ICsgIFRoZSBJVEUgSVQ2MTYyMCBpcyBhIGhpZ2gtcGVyZm9ybWFuY2UsIGxvdy1w
b3dlciBIRE1JIGJyaWRnZSB0aGF0IGNvbnZlcnRzDQo+ID4gKyAgTUlQSSBEU0kgaW5wdXQgdG8g
SERNSSAxLjRiIFRNRFMgb3V0cHV0LiBJdCBzdXBwb3J0cyB1cCB0byA0IGxhbmVzIG9mIE1JUEkN
Cj4gPiArICBELVBIWSAyLjAgaW5wdXQgYXQgMi41R2JwcyBwZXIgbGFuZSAoMTBHYnBzIHRvdGFs
KSwgY29tcGF0aWJsZSB3aXRoIERTSS0yDQo+ID4gKyAgdjIuMC4NCj4gPiArDQo+ID4gKyAgVGhl
IEhETUkgdHJhbnNtaXR0ZXIgc2lkZSBzdXBwb3J0cyB1cCB0byA0S3gyS0AzMEh6IHJlc29sdXRp
b25zLCBhbmQgaXMNCj4gPiArICBjb21wbGlhbnQgd2l0aCBIRE1JIDEuNGIgYW5kIEhEQ1AgMS40
Lg0KPiA+ICsNCj4gPiArICBGb3IgYXVkaW8sIHRoZSBJVDYxNjIwIHN1cHBvcnRzIHVwIHRvIDgt
Y2hhbm5lbCBMUENNIHZpYSBJMlMgKG11bHRpLWxpbmUgb3INCj4gPiArICBURE0gbW9kZSksIHdp
dGggb3B0aW9uYWwgUy9QRElGIG9yIERTRCAoZm9yIFNBQ0QpLiBJdCBzdXBwb3J0cyBhdWRpbw0K
PiA+ICsgIHNhbXBsaW5nIHJhdGVzIHVwIHRvIDE5MmtIei4NCj4gPiArDQo+ID4gK2FsbE9mOg0K
PiA+ICsgIC0gJHJlZjogL3NjaGVtYXMvc291bmQvZGFpLWNvbW1vbi55YW1sIw0KPiA+ICsNCj4g
PiArcHJvcGVydGllczoNCj4gPiArICBjb21wYXRpYmxlOg0KPiA+ICsgICAgY29uc3Q6IGl0ZSxp
dDYxNjIwDQo+ID4gKw0KPiA+ICsgIHJlZzoNCj4gPiArICAgIG1heEl0ZW1zOiAxDQo+ID4gKw0K
PiA+ICsgIGludGVycnVwdHM6DQo+ID4gKyAgICBtYXhJdGVtczogMQ0KPiA+ICsNCj4gPiArICBy
ZXNldC1ncGlvczoNCj4gPiArICAgIG1heEl0ZW1zOiAxDQo+ID4gKw0KPiA+ICsgIGl2ZGQtc3Vw
cGx5Og0KPiA+ICsgICAgZGVzY3JpcHRpb246IGNvcmUgdm9sdGFnZQ0KPiA+ICsNCj4gPiArICBv
dmRkLXN1cHBseToNCj4gPiArICAgIGRlc2NyaXB0aW9uOiBJL08gdm9sdGFnZQ0KPiA+ICsNCj4g
PiArICBvdmRkMTgzMy1zdXBwbHk6DQo+ID4gKyAgICBkZXNjcmlwdGlvbjogZmxleGlibGUgSS9P
IHZvbHRhZ2UNCj4gPiArDQo+ID4gKyAgIiNzb3VuZC1kYWktY2VsbHMiOg0KPiA+ICsgICAgY29u
c3Q6IDANCj4gPiArDQo+ID4gKyAgcG9ydHM6DQo+ID4gKyAgICAkcmVmOiAvc2NoZW1hcy9ncmFw
aC55YW1sIy9wcm9wZXJ0aWVzL3BvcnRzDQo+ID4gKw0KPiA+ICsgICAgcHJvcGVydGllczoNCj4g
PiArICAgICAgcG9ydEAwOg0KPiA+ICsgICAgICAgICRyZWY6IC9zY2hlbWFzL2dyYXBoLnlhbWwj
LyRkZWZzL3BvcnQtYmFzZQ0KPiA+ICsgICAgICAgIHVuZXZhbHVhdGVkUHJvcGVydGllczogZmFs
c2UNCj4gPiArICAgICAgICBkZXNjcmlwdGlvbjogSW5wdXQgcG9ydCBmb3IgTUlQSSBEU0kNCj4g
PiArDQo+ID4gKyAgICAgICAgcHJvcGVydGllczoNCj4gPiArICAgICAgICAgIGVuZHBvaW50Og0K
PiA+ICsgICAgICAgICAgICAkcmVmOiAvc2NoZW1hcy9tZWRpYS92aWRlby1pbnRlcmZhY2VzLnlh
bWwjDQo+ID4gKyAgICAgICAgICAgIHVuZXZhbHVhdGVkUHJvcGVydGllczogZmFsc2UNCj4gPiAr
ICAgICAgICAgICAgcmVxdWlyZWQ6DQo+ID4gKyAgICAgICAgICAgICAgLSBkYXRhLWxhbmVzDQo+
ID4gKw0KPiA+ICsgICAgICBwb3J0QDE6DQo+ID4gKyAgICAgICAgJHJlZjogL3NjaGVtYXMvZ3Jh
cGgueWFtbCMvcHJvcGVydGllcy9wb3J0DQo+ID4gKyAgICAgICAgZGVzY3JpcHRpb246IE91dHB1
dCBwb3J0IGZvciBIRE1JIG91dHB1dA0KPiA+ICsNCj4gPiArICAgICAgcG9ydEAyOg0KPiA+ICsg
ICAgICAgICRyZWY6IC9zY2hlbWFzL2dyYXBoLnlhbWwjL3Byb3BlcnRpZXMvcG9ydA0KPiA+ICsg
ICAgICAgIGRlc2NyaXB0aW9uOiBBdWRpbyBpbnB1dCBwb3J0IChJMlMpDQo+ID4gKw0KPiA+ICsg
ICAgcmVxdWlyZWQ6DQo+ID4gKyAgICAgIC0gcG9ydEAwDQo+ID4gKyAgICAgIC0gcG9ydEAxDQo+
ID4gKw0KPiA+ICtyZXF1aXJlZDoNCj4gPiArICAtIGNvbXBhdGlibGUNCj4gPiArICAtIHJlZw0K
PiA+ICsgIC0gaW50ZXJydXB0cw0KPiA+ICsgIC0gcmVzZXQtZ3Bpb3MNCj4gPiArICAtIGl2ZGQt
c3VwcGx5DQo+ID4gKyAgLSBvdmRkLXN1cHBseQ0KPiA+ICsgIC0gb3ZkZDE4MzMtc3VwcGx5DQo+
ID4gKyAgLSBwb3J0cw0KPiA+ICsNCj4gPiArdW5ldmFsdWF0ZWRQcm9wZXJ0aWVzOiBmYWxzZQ0K
PiA+ICsNCj4gPiArZXhhbXBsZXM6DQo+ID4gKyAgLSB8DQo+ID4gKyAgICAjaW5jbHVkZSA8ZHQt
YmluZGluZ3MvZ3Bpby9ncGlvLmg+DQo+ID4gKyAgICAjaW5jbHVkZSA8ZHQtYmluZGluZ3MvaW50
ZXJydXB0LWNvbnRyb2xsZXIvaXJxLmg+DQo+ID4gKw0KPiA+ICsgICAgaTJjIHsNCj4gPiArICAg
ICAgICAjYWRkcmVzcy1jZWxscyA9IDwxPjsNCj4gPiArICAgICAgICAjc2l6ZS1jZWxscyA9IDww
PjsNCj4gPiArDQo+ID4gKyAgICAgICAgYnJpZGdlQDU4IHsNCj4gPiArICAgICAgICAgICAgY29t
cGF0aWJsZSA9ICJpdGUsaXQ2MTYyMCI7DQo+ID4gKyAgICAgICAgICAgIHJlZyA9IDwweDU4PjsN
Cj4gPiArICAgICAgICAgICAgI3NvdW5kLWRhaS1jZWxscyA9IDwwPjsNCj4gPiArICAgICAgICAg
ICAgaW50ZXJydXB0LXBhcmVudCA9IDwmcGlvPjsNCj4gPiArICAgICAgICAgICAgaW50ZXJydXB0
cyA9IDwxMjggSVJRX1RZUEVfTEVWRUxfTE9XPjsNCj4gPiArICAgICAgICAgICAgcGluY3RybC1u
YW1lcyA9ICJkZWZhdWx0IjsNCj4gPiArICAgICAgICAgICAgcGluY3RybC0wID0gPCZpdDYxNjIw
X3BpbnM+Ow0KPiA+ICsgICAgICAgICAgICByZXNldC1ncGlvcyA9IDwmcGlvIDEyNyBHUElPX0FD
VElWRV9MT1c+Ow0KPiA+ICsgICAgICAgICAgICBpdmRkLXN1cHBseSA9IDwmcHAxMDAwX2hkbWlf
eD47DQo+ID4gKyAgICAgICAgICAgIG92ZGQtc3VwcGx5ID0gPCZwcDMzMDBfdmlvMjhfeD47DQo+
ID4gKyAgICAgICAgICAgIG92ZGQxODMzLXN1cHBseSA9IDwmcHAxODAwX3ZjYW1pb194PjsNCj4g
PiArDQo+ID4gKyAgICAgICAgICAgIHBvcnRzIHsNCj4gPiArICAgICAgICAgICAgICAgICNhZGRy
ZXNzLWNlbGxzID0gPDE+Ow0KPiA+ICsgICAgICAgICAgICAgICAgI3NpemUtY2VsbHMgPSA8MD47
DQo+ID4gKw0KPiA+ICsgICAgICAgICAgICAgICAgcG9ydEAwIHsNCj4gPiArICAgICAgICAgICAg
ICAgICAgICByZWcgPSA8MD47DQo+ID4gKyAgICAgICAgICAgICAgICAgICAgaXQ2MTYyMF9kc2lf
aW46IGVuZHBvaW50IHsNCj4gPiArICAgICAgICAgICAgICAgICAgICAgICAgZGF0YS1sYW5lcyA9
IDwwIDEgMiAzPjsNCj4gPiArICAgICAgICAgICAgICAgICAgICAgICAgcmVtb3RlLWVuZHBvaW50
ID0gPCZkc2lfb3V0PjsNCj4gPiArICAgICAgICAgICAgICAgICAgICB9Ow0KPiA+ICsgICAgICAg
ICAgICAgICAgfTsNCj4gPiArDQo+ID4gKyAgICAgICAgICAgICAgICBwb3J0QDEgew0KPiA+ICsg
ICAgICAgICAgICAgICAgICAgIHJlZyA9IDwxPjsNCj4gPiArICAgICAgICAgICAgICAgICAgICBp
dDYxNjIwX2hkbWlfb3V0OiBlbmRwb2ludCB7DQo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAg
IHJlbW90ZS1lbmRwb2ludCA9IDwmaGRtaV9jb25uZWN0b3JfaW4+Ow0KPiA+ICsgICAgICAgICAg
ICAgICAgICAgIH07DQo+ID4gKyAgICAgICAgICAgICAgICB9Ow0KPiA+ICsNCj4gPiArICAgICAg
ICAgICAgICAgIHBvcnRAMiB7DQo+ID4gKyAgICAgICAgICAgICAgICAgICAgcmVnID0gPDI+Ow0K
PiA+ICsgICAgICAgICAgICAgICAgICAgIGl0NjE2MjBfYXVkaW9faW46IGVuZHBvaW50IHsNCj4g
PiArICAgICAgICAgICAgICAgICAgICAgICAgcmVtb3RlLWVuZHBvaW50ID0gPCZpMnMwX291dD47
DQo+ID4gKyAgICAgICAgICAgICAgICAgICAgfTsNCj4gPiArICAgICAgICAgICAgICAgIH07DQo+
ID4gKyAgICAgICAgICAgIH07DQo+ID4gKyAgICAgICAgfTsNCj4gPiArICAgIH07DQo+ID4NCj4g
PiAtLQ0KPiA+IDIuMzQuMQ0KPiA+DQo=
