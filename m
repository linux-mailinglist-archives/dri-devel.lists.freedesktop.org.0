Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E8BD0632A2
	for <lists+dri-devel@lfdr.de>; Tue,  9 Jul 2019 10:08:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BACCB8941E;
	Tue,  9 Jul 2019 08:08:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR03-AM5-obe.outbound.protection.outlook.com
 (mail-eopbgr30050.outbound.protection.outlook.com [40.107.3.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C4E198941E
 for <dri-devel@lists.freedesktop.org>; Tue,  9 Jul 2019 08:08:16 +0000 (UTC)
Received: from AM6PR08CA0026.eurprd08.prod.outlook.com (2603:10a6:20b:c0::14)
 by DB6PR0802MB2599.eurprd08.prod.outlook.com (2603:10a6:4:a2::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2052.17; Tue, 9 Jul
 2019 08:08:13 +0000
Received: from DB5EUR03FT005.eop-EUR03.prod.protection.outlook.com
 (2a01:111:f400:7e0a::209) by AM6PR08CA0026.outlook.office365.com
 (2603:10a6:20b:c0::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.2052.18 via Frontend
 Transport; Tue, 9 Jul 2019 08:08:13 +0000
Received-SPF: TempError (protection.outlook.com: error in processing during
 lookup of arm.com: DNS Timeout)
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT005.mail.protection.outlook.com (10.152.20.122) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2052.18 via Frontend Transport; Tue, 9 Jul 2019 08:08:11 +0000
Received: ("Tessian outbound 189fc018761e:v23");
 Tue, 09 Jul 2019 08:08:11 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 42a4a86927180151
X-CR-MTA-TID: 64aa7808
Received: from 54b35023b8df.1 (cr-mta-lb-1.cr-mta-net [104.47.4.57])
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 875AB352-D75F-4EAF-9845-E20811244BAC.1; 
 Tue, 09 Jul 2019 08:08:05 +0000
Received: from EUR02-AM5-obe.outbound.protection.outlook.com
 (mail-am5eur02lp2057.outbound.protection.outlook.com [104.47.4.57])
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 54b35023b8df.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-SHA384);
 Tue, 09 Jul 2019 08:08:05 +0000
Received: from VE1PR08MB5006.eurprd08.prod.outlook.com (10.255.159.31) by
 VE1PR08MB5087.eurprd08.prod.outlook.com (20.179.29.209) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2052.18; Tue, 9 Jul 2019 08:08:04 +0000
Received: from VE1PR08MB5006.eurprd08.prod.outlook.com
 ([fe80::4062:a380:35ba:11d1]) by VE1PR08MB5006.eurprd08.prod.outlook.com
 ([fe80::4062:a380:35ba:11d1%3]) with mapi id 15.20.2032.019; Tue, 9 Jul 2019
 08:08:04 +0000
From: "james qian wang (Arm Technology China)" <james.qian.wang@arm.com>
To: Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: Re: [PATCH 3/5] drm/komeda: remove img_enhancement property
Thread-Topic: [PATCH 3/5] drm/komeda: remove img_enhancement property
Thread-Index: AQHVMyqb2HM+Bczs4kKXV5Z0Y9vFr6bB9H8A
Date: Tue, 9 Jul 2019 08:08:04 +0000
Message-ID: <20190709080756.GC22276@jamwan02-TSP300>
References: <20190705121006.26085-1-daniel.vetter@ffwll.ch>
 <20190705121006.26085-3-daniel.vetter@ffwll.ch>
In-Reply-To: <20190705121006.26085-3-daniel.vetter@ffwll.ch>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mutt/1.10.1 (2018-07-13)
x-originating-ip: [113.29.88.7]
x-clientproxiedby: HK2PR04CA0053.apcprd04.prod.outlook.com
 (2603:1096:202:14::21) To VE1PR08MB5006.eurprd08.prod.outlook.com
 (2603:10a6:803:113::31)
Authentication-Results-Original: spf=none (sender IP is )
 smtp.mailfrom=james.qian.wang@arm.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: 1d6ab61f-93ea-499c-e1c9-08d7044495cb
X-MS-Office365-Filtering-HT: Tenant
X-Microsoft-Antispam-Untrusted: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(7168020)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:VE1PR08MB5087; 
X-MS-TrafficTypeDiagnostic: VE1PR08MB5087:|DB6PR0802MB2599:
X-Microsoft-Antispam-PRVS: <DB6PR0802MB25996174315CEBBC2902E2ACB3F10@DB6PR0802MB2599.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
x-ms-oob-tlc-oobclassifiers: OLM:9508;OLM:9508;
x-forefront-prvs: 0093C80C01
X-Forefront-Antispam-Report-Untrusted: SFV:NSPM;
 SFS:(10009020)(7916004)(4636009)(376002)(396003)(366004)(39860400002)(136003)(346002)(199004)(189003)(33716001)(6436002)(11346002)(476003)(8676002)(6246003)(8936002)(9686003)(6512007)(229853002)(25786009)(4326008)(53936002)(486006)(68736007)(52116002)(99286004)(33656002)(446003)(86362001)(81156014)(81166006)(6916009)(6506007)(386003)(55236004)(102836004)(76176011)(5024004)(66476007)(66066001)(6116002)(71190400001)(71200400001)(64756008)(14454004)(66556008)(66446008)(6486002)(2906002)(26005)(5660300002)(3846002)(58126008)(256004)(73956011)(316002)(478600001)(66946007)(305945005)(1076003)(54906003)(186003)(7736002)(309714004);
 DIR:OUT; SFP:1101; SCL:1; SRVR:VE1PR08MB5087;
 H:VE1PR08MB5006.eurprd08.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: arm.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info-Original: 8PV50I3Bf4dFpvW3PyAS1PVUQsSTNgReXY3cCfxYdIw6pO1chlDKtXav2B3a+VbY00SEPD4+0G36PKAOXdGvUGCQkb1+5T9Uc7wRob3Pp409nyvz9U4/ZXp6SLWmSNKa75gaUncz8+EDLvTA8MyIzXLe0PPgEFJPnLXhXe3bDDkgwXgwJmweNf7w5Msaf5AMwyKdkjQPAVDnd8VDwZfW+9rL9rpqs7jkVvaIi+s+haTJqM2MZ4DcTnfXysLvsY7z+4/8KqlmPJOX9DYzjx+10Frf82X4/05M8RH8F/MIDrXv/6h1+soXVrflwGgrqic63oMc5iqZAEv8Gb65f6cKeDqWBAA9xNdF2APiD4ZSp7KAc3S1hAItVCOxj9suuU3ueBkHc4Mln19gfSjrIvjnSl1kBkFycrQSg8BOgqiUh+g=
Content-ID: <873063DE0B2FD64A98DA8B56C728404A@eurprd08.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR08MB5087
Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=james.qian.wang@arm.com; 
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: DB5EUR03FT005.eop-EUR03.prod.protection.outlook.com
X-Forefront-Antispam-Report: CIP:63.35.35.123; IPV:CAL; SCL:-1; CTRY:IE;
 EFV:NLI; SFV:NSPM;
 SFS:(10009020)(4636009)(7916004)(346002)(376002)(39860400002)(396003)(136003)(2980300002)(199004)(189003)(9686003)(70586007)(97756001)(6512007)(8746002)(70206006)(2906002)(8936002)(6246003)(356004)(47776003)(81166006)(186003)(25786009)(81156014)(33656002)(229853002)(8676002)(6486002)(446003)(5024004)(46406003)(33716001)(316002)(1076003)(11346002)(66066001)(386003)(58126008)(336012)(54906003)(63370400001)(126002)(486006)(23726003)(63350400001)(478600001)(14454004)(476003)(26005)(26826003)(305945005)(3846002)(6862004)(86362001)(76130400001)(6506007)(6116002)(7736002)(5660300002)(50466002)(102836004)(99286004)(4326008)(22756006)(76176011)(309714004);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DB6PR0802MB2599;
 H:64aa7808-outbound-1.mta.getcheckrecipient.com; FPR:; SPF:TempError; LANG:en;
 PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com; A:1; MX:1; 
X-MS-Office365-Filtering-Correlation-Id-Prvs: a915b23f-0611-4cd5-e1ce-08d70444911d
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(710020)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:DB6PR0802MB2599; 
NoDisclaimer: True
X-Forefront-PRVS: 0093C80C01
X-Microsoft-Antispam-Message-Info: jvJyA2Frkw7VirFsPYvaBRTv1cRGufl7GnF186evLMFMFM9X/SBXxsm/X7wZQbSWTvSrOwPpe67VsNmuZvnqXtMn8zWof67atkgKUuoP+dc4xeuASyLk3PAR11SNGzSjMJNNpGwet8TrlonbFJm7MiywhVLNOvihkjkbzF5BruM7rtqrMlHgK+J/QEn48gu0Tr70j9OGcrZuEJjqTkAMCxJT6GKGUBVfSaZX9r42hDMW5Lgcj8n+yxuTfRQ3gIqsj3w7dAO2mO57G7ClNzKJUQsLosL9B4P6mNHN7fTK1XqTZ7lCXu/CaaT1P6ib5oN9v5Zik9gsj9d3M7lmNg2cng2F6Ld2dq3Rja/6BMZxYjaaad9T4tMpbsv8umjqBo9JG2zCRMkebY/LsUqCvk3l13cUAYLWHcQ2vygeJpNjgeo=
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jul 2019 08:08:11.3118 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1d6ab61f-93ea-499c-e1c9-08d7044495cb
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[63.35.35.123];
 Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR0802MB2599
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=A0glRCFxj385VyLygie5CbuuHWsWhWXJB/VfBpwJmTw=;
 b=FieXQlXLp1Shg8S/pe7yQe41VzM/JA2jHD6v2Up2T0UYAH/VfqdeU9lD8+I0H/FoWFIIhHq+TOrz3bKT/3MMigjaFKtu0uZF7JC0cHHRdYYCgKOf7PdgovedHMSjI8lk605Kd+gsi2Z90Mf9lDk/DdoA52a/sKljMTgn54s2JR4=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=A0glRCFxj385VyLygie5CbuuHWsWhWXJB/VfBpwJmTw=;
 b=FieXQlXLp1Shg8S/pe7yQe41VzM/JA2jHD6v2Up2T0UYAH/VfqdeU9lD8+I0H/FoWFIIhHq+TOrz3bKT/3MMigjaFKtu0uZF7JC0cHHRdYYCgKOf7PdgovedHMSjI8lk605Kd+gsi2Z90Mf9lDk/DdoA52a/sKljMTgn54s2JR4=
X-Mailman-Original-Authentication-Results: spf=temperror (sender IP is
 63.35.35.123)
 smtp.mailfrom=arm.com; lists.freedesktop.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.freedesktop.org;
 dmarc=temperror action=none header.from=arm.com;
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
Cc: nd <nd@arm.com>, Liviu Dudau <Liviu.Dudau@arm.com>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Mali DP Maintainers <malidp@foss.arm.com>,
 Daniel Vetter <daniel.vetter@intel.com>, "Lowry Li \(Arm
 Technology China\)" <Lowry.Li@arm.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpLCBKdWwgMDUsIDIwMTkgYXQgMDI6MTA6MDRQTSArMDIwMCwgRGFuaWVsIFZldHRlciB3
cm90ZToKPiBQcm9wZXJ0aWVzIGFyZSB1YXBpIGxpa2UgYW55dGhpbmcgZWxzZSwgd2l0aCBhbGwg
dGhlIHVzdWFsIHJ1bGVzCj4gcmVnYXJkaW5nIHJldmlldywgdGVzdGNhc2VzLCBvcGVuIHNvdXJj
ZSB1c2Vyc3BhY2UgLi4uIEZ1cnRoZXJtb3JlCj4gZHJpdmVyLXByaXZhdGUga21zIHByb3BlcnRp
ZXMgYXJlIGhpZ2hseSBkaXNjb3VyYWdlZCwgb3ZlciB0aGUgcGFzdAo+IGZldyB5ZWFycyB3ZSd2
ZSByZWFsaXplZCB3ZSBuZWVkIHRvIG1ha2UgYSBzZXJpb3VzIGVmZm9ydCBhdCBiZXR0ZXIKPiBz
dGFuZGFyZGl6aW5nIHRoaXMgc3R1ZmYuCj4gCj4gQWdhaW4gdGhpcyBwcm9iYWJseSBuZWVkcyBt
dWx0aXBsZSBwaWVjZXMgdG8gc29sdmUgdGhpcyBwcm9wZXJseToKPiAKPiAtIEluc3RlYWQgb2Yg
ZXhwZWN0aW5nIHVzZXJzcGFjZSB0byBjb21wdXRlIHRoaXMgKGFuZCBkdXBsaWNhdGluZwo+ICAg
bW9kZXNldCBjb2RlKSwgdGhlIGtlcm5lbCBkcml2ZXIgc2hvdWxkIGNvbXB1dGUgd2hlbiBpdCdz
IHBvc3NpYmxlCj4gICB0byBlbmFibGUgdGhpcyBiZXR0ZXIgdXAvZG93bnNjYWxlIG1vZGUgKGFz
c3VtaW5nIEkgdW5kZXJzdG9vZAo+ICAgTGl2aXUgY29ycmVjdGx5IG9uIHdoYXQgdGhpcyBkb2Vz
KSBhdXRvbWF0aWNhbGx5Lgo+IAo+IC0gSWYgdGhpcyBpcyBuZWVkZWQgZm9yIHZhbGlkYXRpb24g
dGhlbiB5b3Ugd2FudCBhIGRlYnVnZnMgZmlsZSB0bwo+ICAgZm9yY2UgdGhpcyBvbmUgd2F5IG9y
IHRoZSBvdGhlciwgb3IgYWx0ZXJuYXRpdmVseSAgdXNlCj4gICAtPmF0b21pY19wcmludF9zdGF0
ZSB0byBkdW1wIHN1Y2ggaGlkZGVuIGRyaXZlci1wcml2YXRlIHN0YXRlLgo+ICAgRGVwZW5kcyB1
cG9uIGhvdyB5b3UgZG8geW91ciB2YWxpZGF0aW9uIG9mYy4KPiAKPiBGaXhlczogNDJiNmYxMThm
NmQxICgiZHJtL2tvbWVkYTogQWRkIGltYWdlIGVuaGFuY2VtZW50IHN1cHBvcnQiKQo+IENjOiBM
b3dyeSBMaSAoQXJtIFRlY2hub2xvZ3kgQ2hpbmEpIDxsb3dyeS5saUBhcm0uY29tPgo+IENjOiBK
YW1lcyBRaWFuIFdhbmcgKEFybSBUZWNobm9sb2d5IENoaW5hKSA8amFtZXMucWlhbi53YW5nQGFy
bS5jb20+Cj4gQ2M6IExpdml1IER1ZGF1IDxsaXZpdS5kdWRhdUBhcm0uY29tPgo+IENjOiBNYWxp
IERQIE1haW50YWluZXJzIDxtYWxpZHBAZm9zcy5hcm0uY29tPgo+IENjOiBCcmlhbiBTdGFya2V5
IDxicmlhbi5zdGFya2V5QGFybS5jb20+Cj4gU2lnbmVkLW9mZi1ieTogRGFuaWVsIFZldHRlciA8
ZGFuaWVsLnZldHRlckBpbnRlbC5jb20+CgpIaSBEYW5pZWw6ClRoYW5rIHlvdSBmb3IgdGhlIHBh
dGNoIQoKUmV2aWV3ZWQtYnk6IEphbWVzIFFpYW4gV2FuZyAoQXJtIFRlY2hub2xvZ3kgQ2hpbmEp
IDxqYW1lcy5xaWFuLndhbmdAYXJtLmNvbT4KCj4gLS0tCj4gIC4uLi9ncHUvZHJtL2FybS9kaXNw
bGF5L2tvbWVkYS9rb21lZGFfa21zLmggICB8ICAyIC0tCj4gIC4uLi9ncHUvZHJtL2FybS9kaXNw
bGF5L2tvbWVkYS9rb21lZGFfcGxhbmUuYyB8IDE5ICsrLS0tLS0tLS0tLS0tLS0tLS0KPiAgMiBm
aWxlcyBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDE5IGRlbGV0aW9ucygtKQo+IAo+IGRpZmYg
LS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYXJtL2Rpc3BsYXkva29tZWRhL2tvbWVkYV9rbXMuaCBi
L2RyaXZlcnMvZ3B1L2RybS9hcm0vZGlzcGxheS9rb21lZGEva29tZWRhX2ttcy5oCj4gaW5kZXgg
YzU0NWNiOTYzZDQwLi5mYjJhZGMyMzM3NjAgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9ncHUvZHJt
L2FybS9kaXNwbGF5L2tvbWVkYS9rb21lZGFfa21zLmgKPiArKysgYi9kcml2ZXJzL2dwdS9kcm0v
YXJtL2Rpc3BsYXkva29tZWRhL2tvbWVkYV9rbXMuaAo+IEBAIC0zNCw4ICszNCw2IEBAIHN0cnVj
dCBrb21lZGFfcGxhbmUgewo+ICAJICovCj4gIAlzdHJ1Y3Qga29tZWRhX2xheWVyICpsYXllcjsK
PiAgCj4gLQkvKiogQHByb3BfaW1nX2VuaGFuY2VtZW50OiBmb3Igb24vb2ZmIGltYWdlIGVuaGFu
Y2VtZW50ICovCj4gLQlzdHJ1Y3QgZHJtX3Byb3BlcnR5ICpwcm9wX2ltZ19lbmhhbmNlbWVudDsK
PiAgCS8qKiBAcHJvcF9sYXllcl9zcGxpdDogZm9yIG9uL29mZiBsYXllcl9zcGxpdCAqLwo+ICAJ
c3RydWN0IGRybV9wcm9wZXJ0eSAqcHJvcF9sYXllcl9zcGxpdDsKPiAgfTsKPiBkaWZmIC0tZ2l0
IGEvZHJpdmVycy9ncHUvZHJtL2FybS9kaXNwbGF5L2tvbWVkYS9rb21lZGFfcGxhbmUuYyBiL2Ry
aXZlcnMvZ3B1L2RybS9hcm0vZGlzcGxheS9rb21lZGEva29tZWRhX3BsYW5lLmMKPiBpbmRleCAw
NGIxMjJmMjhmYjYuLjIzZGIzODY1MGE0NiAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0v
YXJtL2Rpc3BsYXkva29tZWRhL2tvbWVkYV9wbGFuZS5jCj4gKysrIGIvZHJpdmVycy9ncHUvZHJt
L2FybS9kaXNwbGF5L2tvbWVkYS9rb21lZGFfcGxhbmUuYwo+IEBAIC0xOTcsOSArMTk3LDcgQEAg
a29tZWRhX3BsYW5lX2F0b21pY19nZXRfcHJvcGVydHkoc3RydWN0IGRybV9wbGFuZSAqcGxhbmUs
Cj4gIAlzdHJ1Y3Qga29tZWRhX3BsYW5lICprcGxhbmUgPSB0b19rcGxhbmUocGxhbmUpOwo+ICAJ
c3RydWN0IGtvbWVkYV9wbGFuZV9zdGF0ZSAqc3QgPSB0b19rcGxhbmVfc3Qoc3RhdGUpOwo+ICAK
PiAtCWlmIChwcm9wZXJ0eSA9PSBrcGxhbmUtPnByb3BfaW1nX2VuaGFuY2VtZW50KQo+IC0JCSp2
YWwgPSBzdC0+aW1nX2VuaGFuY2VtZW50Owo+IC0JZWxzZSBpZiAocHJvcGVydHkgPT0ga3BsYW5l
LT5wcm9wX2xheWVyX3NwbGl0KQo+ICsJaWYgKHByb3BlcnR5ID09IGtwbGFuZS0+cHJvcF9sYXll
cl9zcGxpdCkKPiAgCQkqdmFsID0gc3QtPmxheWVyX3NwbGl0Owo+ICAJZWxzZQo+ICAJCXJldHVy
biAtRUlOVkFMOwo+IEBAIC0yMTYsOSArMjE0LDcgQEAga29tZWRhX3BsYW5lX2F0b21pY19zZXRf
cHJvcGVydHkoc3RydWN0IGRybV9wbGFuZSAqcGxhbmUsCj4gIAlzdHJ1Y3Qga29tZWRhX3BsYW5l
ICprcGxhbmUgPSB0b19rcGxhbmUocGxhbmUpOwo+ICAJc3RydWN0IGtvbWVkYV9wbGFuZV9zdGF0
ZSAqc3QgPSB0b19rcGxhbmVfc3Qoc3RhdGUpOwo+ICAKPiAtCWlmIChwcm9wZXJ0eSA9PSBrcGxh
bmUtPnByb3BfaW1nX2VuaGFuY2VtZW50KQo+IC0JCXN0LT5pbWdfZW5oYW5jZW1lbnQgPSAhIXZh
bDsKPiAtCWVsc2UgaWYgKHByb3BlcnR5ID09IGtwbGFuZS0+cHJvcF9sYXllcl9zcGxpdCkKPiAr
CWlmIChwcm9wZXJ0eSA9PSBrcGxhbmUtPnByb3BfbGF5ZXJfc3BsaXQpCj4gIAkJc3QtPmxheWVy
X3NwbGl0ID0gISF2YWw7Cj4gIAllbHNlCj4gIAkJcmV0dXJuIC1FSU5WQUw7Cj4gQEAgLTI1OCwx
NyArMjU0LDYgQEAga29tZWRhX3BsYW5lX2NyZWF0ZV9sYXllcl9wcm9wZXJ0aWVzKHN0cnVjdCBr
b21lZGFfcGxhbmUgKmtwbGFuZSwKPiAgCXN0cnVjdCBkcm1fcGxhbmUgKnBsYW5lID0gJmtwbGFu
ZS0+YmFzZTsKPiAgCXN0cnVjdCBkcm1fcHJvcGVydHkgKnByb3AgPSBOVUxMOwo+ICAKPiAtCS8q
IHByb3BlcnR5OiBsYXllciBpbWFnZV9lbmhhbmNlbWVudCAqLwo+IC0JaWYgKGxheWVyLT5iYXNl
LnN1cHBvcnRlZF9vdXRwdXRzICYgS09NRURBX1BJUEVMSU5FX1NDQUxFUlMpIHsKPiAtCQlwcm9w
ID0gZHJtX3Byb3BlcnR5X2NyZWF0ZV9ib29sKGRybSwgRFJNX01PREVfUFJPUF9BVE9NSUMsCj4g
LQkJCQkJCSJpbWdfZW5oYW5jZW1lbnQiKTsKPiAtCQlpZiAoIXByb3ApCj4gLQkJCXJldHVybiAt
RU5PTUVNOwo+IC0KPiAtCQlkcm1fb2JqZWN0X2F0dGFjaF9wcm9wZXJ0eSgmcGxhbmUtPmJhc2Us
IHByb3AsIDApOwo+IC0JCWtwbGFuZS0+cHJvcF9pbWdfZW5oYW5jZW1lbnQgPSBwcm9wOwo+IC0J
fQo+IC0KPiAgCS8qIHByb3BlcnR5OiBsYXllciBzcGxpdCAqLwo+ICAJaWYgKGxheWVyLT5yaWdo
dCkgewo+ICAJCXByb3AgPSBkcm1fcHJvcGVydHlfY3JlYXRlX2Jvb2woZHJtLCBEUk1fTU9ERV9Q
Uk9QX0FUT01JQywKPiAtLSAKPiAyLjIwLjEKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlz
dGluZm8vZHJpLWRldmVs
