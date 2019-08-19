Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BFAC91D94
	for <lists+dri-devel@lfdr.de>; Mon, 19 Aug 2019 09:12:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5609789182;
	Mon, 19 Aug 2019 07:12:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 (mail-eopbgr140048.outbound.protection.outlook.com [40.107.14.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E933889182
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Aug 2019 07:11:58 +0000 (UTC)
Received: from DB6PR0802CA0048.eurprd08.prod.outlook.com (2603:10a6:4:a3::34)
 by AM0PR08MB4947.eurprd08.prod.outlook.com (2603:10a6:208:158::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2157.14; Mon, 19 Aug
 2019 07:11:53 +0000
Received: from AM5EUR03FT008.eop-EUR03.prod.protection.outlook.com
 (2a01:111:f400:7e08::203) by DB6PR0802CA0048.outlook.office365.com
 (2603:10a6:4:a3::34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.2178.16 via Frontend
 Transport; Mon, 19 Aug 2019 07:11:52 +0000
Received-SPF: TempError (protection.outlook.com: error in processing during
 lookup of arm.com: DNS Timeout)
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT008.mail.protection.outlook.com (10.152.16.123) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2178.16 via Frontend Transport; Mon, 19 Aug 2019 07:11:51 +0000
Received: ("Tessian outbound 40a263b748b4:v26");
 Mon, 19 Aug 2019 07:11:51 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 17c0c0d5820c59e1
X-CR-MTA-TID: 64aa7808
Received: from 32001b4b2c8b.1 (cr-mta-lb-1.cr-mta-net [104.47.5.59])
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 82E97174-9B33-4195-AB79-47D8F74A207D.1; 
 Mon, 19 Aug 2019 07:11:46 +0000
Received: from EUR02-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur02lp2059.outbound.protection.outlook.com [104.47.5.59])
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 32001b4b2c8b.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-SHA384);
 Mon, 19 Aug 2019 07:11:46 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SuQpp0Af6DOPAO4eX7TskPNs+QBPfXoPanCWbcw1IkDzQF2Mfx761GfgtCh7UVD0Jq13Y0m3oBQqzFylt1yvDxHlBKbQrOEbLzFCt6px8jbKeYcjzyWhyT2IPcZZL81woBzOBpWv0QG8vPYYFaQGMBLjGLaAhE2O7e5IQ/rgHXcDpammVWfUuyOxM7zaw4hEToqobR9CJx4a7faWrgwSnYQjXkPFi251R3C+5EjOPOf1h4iXQSk1sVO75Ul/aDDkAYcZaPTJKjLotDy8JdSY7X9G4yf6hRb2b+8t5nDvsMg8y4ZIs+uADkQIfotojeNscByjOK/++jNFL9azNDYqUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zlg1Tc94IepN7r3QT5jTKASgUr1LSBTD5GIhSYNldak=;
 b=h3pFU/B3EptTRi9f+7wfyUGQrwbEKKNRlI0smk62Q3p7P5pbE58p6UcwYTkHEvFntfFgJpqtkbAnZDJlDEQhEDqy8oAvYeahrLIeDIqbBRvplX8V4B/0OM3pX/OXe5Q0Yl5aAZytIwY7j/HkWzLs73r6qmor+Wo+On5RKN6bTbvCRyYoXcskwLJsJt5mKyBp9rJl2b3DMF3wMLMOMAgsv5n2i09EXbLVANqMU7k/pxzYVq06oH+66UKVDx0Lp6cc7CgImkpGncZ9fH6K5sbTjvqSIWkGXtrCSJzKVgWA48ZnDUhlIlRC7EPx69flCjpk+5FOXttqog2oMtMqK3mQ6A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
Received: from VE1PR08MB5006.eurprd08.prod.outlook.com (10.255.159.31) by
 VE1PR08MB4752.eurprd08.prod.outlook.com (10.255.112.204) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2178.16; Mon, 19 Aug 2019 07:11:44 +0000
Received: from VE1PR08MB5006.eurprd08.prod.outlook.com
 ([fe80::2151:f0b1:3ea7:c134]) by VE1PR08MB5006.eurprd08.prod.outlook.com
 ([fe80::2151:f0b1:3ea7:c134%6]) with mapi id 15.20.2157.022; Mon, 19 Aug 2019
 07:11:44 +0000
From: "james qian wang (Arm Technology China)" <james.qian.wang@arm.com>
To: Dan Carpenter <dan.carpenter@oracle.com>
Subject: Re: [bug report] drm/komeda: Add writeback support
Thread-Topic: [bug report] drm/komeda: Add writeback support
Thread-Index: AQHVUqnshOcjsw6tLUubTO4PThInXKcCFVqA
Date: Mon, 19 Aug 2019 07:11:44 +0000
Message-ID: <20190819071137.GA6502@jamwan02-TSP300>
References: <20190814140930.GA31850@mwanda>
In-Reply-To: <20190814140930.GA31850@mwanda>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mutt/1.10.1 (2018-07-13)
x-originating-ip: [113.29.88.7]
x-clientproxiedby: HK2PR0401CA0010.apcprd04.prod.outlook.com
 (2603:1096:202:2::20) To VE1PR08MB5006.eurprd08.prod.outlook.com
 (2603:10a6:803:113::31)
Authentication-Results-Original: spf=none (sender IP is )
 smtp.mailfrom=james.qian.wang@arm.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: 9d96d8c6-810b-4933-f91a-08d724748234
X-MS-Office365-Filtering-HT: Tenant
X-Microsoft-Antispam-Untrusted: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(7168020)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:VE1PR08MB4752; 
X-MS-TrafficTypeDiagnostic: VE1PR08MB4752:|AM0PR08MB4947:
X-Microsoft-Antispam-PRVS: <AM0PR08MB494730AACC39F4FA375573DDB3A80@AM0PR08MB4947.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
x-ms-oob-tlc-oobclassifiers: OLM:8882;OLM:8882;
x-forefront-prvs: 0134AD334F
X-Forefront-Antispam-Report-Untrusted: SFV:NSPM;
 SFS:(10009020)(4636009)(7916004)(39850400004)(136003)(346002)(366004)(396003)(376002)(199004)(189003)(486006)(81156014)(2906002)(33656002)(81166006)(8676002)(6116002)(6246003)(99286004)(6916009)(5660300002)(66066001)(256004)(14444005)(3846002)(7736002)(305945005)(66476007)(64756008)(8936002)(71200400001)(1076003)(71190400001)(53936002)(316002)(86362001)(26005)(52116002)(6436002)(446003)(76176011)(66446008)(66556008)(386003)(14454004)(55236004)(6506007)(66946007)(478600001)(102836004)(4326008)(6486002)(186003)(6512007)(9686003)(33716001)(25786009)(229853002)(476003)(54906003)(11346002)(58126008);
 DIR:OUT; SFP:1101; SCL:1; SRVR:VE1PR08MB4752;
 H:VE1PR08MB5006.eurprd08.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: arm.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info-Original: TvCivEyoEwr5NtWCuslHZtukxxowf76CZoweUrK9jGJiTx50/tkVXO/+CVXjG5VEa0hK3vsQMPJhZxvnT/SodCjK7pLlOpc8P8B7yVkdQBcyl+S57OU/mM8ZMCCL8e2QINuTMMbVL+IvuoViXmJEfaPx0HnVnfIY628sGfBwjKgq+t21ASUH5nPMZxLZPT1eQUYcKd/RWB49PSvQuanFAVfjwDWInJZl/IiS7LgHAMdaGeVs05egctFpI05aj/HnPgfQflsu0OVA6KwNXWDP5n56a344v9LlVJB0CSOtgzMRPYripOQ9ganK14KvBofAhhlO7KcauVg/258OjvFnIHFeNVaMIQMofMtLMaTqpARvU9RQsxfDMyBwAjbg89CenAN8pBcSrx5qS1BUTZdBjAkYQMQmVTGwbZD8fVoQASU=
x-ms-exchange-transport-forked: True
Content-ID: <5F62800EB9245A48BE4A0B58D7D54A30@eurprd08.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR08MB4752
Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=james.qian.wang@arm.com; 
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: AM5EUR03FT008.eop-EUR03.prod.protection.outlook.com
X-Forefront-Antispam-Report: CIP:63.35.35.123; IPV:CAL; SCL:-1; CTRY:IE;
 EFV:NLI; SFV:NSPM;
 SFS:(10009020)(4636009)(7916004)(136003)(376002)(396003)(39850400004)(346002)(2980300002)(189003)(199004)(76130400001)(33716001)(5660300002)(8746002)(316002)(36906005)(14454004)(8676002)(446003)(126002)(476003)(7736002)(4326008)(305945005)(26005)(229853002)(47776003)(14444005)(102836004)(76176011)(6506007)(486006)(356004)(6862004)(63370400001)(26826003)(11346002)(186003)(1076003)(386003)(23726003)(22756006)(33656002)(25786009)(6116002)(81166006)(70586007)(478600001)(3846002)(81156014)(9686003)(63350400001)(66066001)(8936002)(336012)(58126008)(70206006)(50466002)(6486002)(86362001)(46406003)(6512007)(2906002)(6246003)(99286004)(54906003)(97756001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:AM0PR08MB4947;
 H:64aa7808-outbound-1.mta.getcheckrecipient.com; FPR:; SPF:TempError; LANG:en;
 PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com; MX:1; A:1; 
X-MS-Office365-Filtering-Correlation-Id-Prvs: e018119c-ae6b-4540-b9c2-08d724747dc7
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(710020)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:AM0PR08MB4947; 
NoDisclaimer: True
X-Forefront-PRVS: 0134AD334F
X-Microsoft-Antispam-Message-Info: kenho7O3c9YzGixw0jv+ypbmT+lJkzLdGImGt6PbPZc0k2ek9/xG15LnaXs1FaOr1j7w+0xitDQcy6S5qYk2RzbDlZH7BPAp+BqOMtEop9KzeLbxu7BVRGBOMhyppbSqACoTSlqz8qJcmKAOqjqA16QzE3dtcL0YQxqcU9bl/J19n+xSE2bD59j58Xk0bMowUk8pbaU4A8lSDeOA+yg5N/agB2NG0EOEtkgW6y43TEGo7vvyB8tFw6Isj5pB9sIrA0zwgD2TiyBaMkHK0P2oAnUdMPDQPdkl9H432xxK6X+ImRjaTSkx8SrWgqAe+gaX5zurHcMrrT34fW/Hsn5dq7RMVQaColX6Dq9QzW+lbXdtphYHk0vgrCAXs5K+RLewB3pgTBx/RTye8DQ+OnN8EDIK+VF9CnZ0EdfkdFn/8WE=
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Aug 2019 07:11:51.4779 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9d96d8c6-810b-4933-f91a-08d724748234
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[63.35.35.123];
 Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB4947
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zlg1Tc94IepN7r3QT5jTKASgUr1LSBTD5GIhSYNldak=;
 b=lXtUlrVyTmIHRJln/97T6vT5S+wFOZbiQTiSGMilcTSB89/vweVbmxtOzAf8zYnWAJU4+WYgZQ6v++cW79LJ1dIwM26eYYUL2nEe7Q2qASX7sHW50EyVubAkq+gmA8Xikp1FcwINIn5cVxA1+WBpQGXb+DFDSxLQiNKaYIz7SRM=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zlg1Tc94IepN7r3QT5jTKASgUr1LSBTD5GIhSYNldak=;
 b=lXtUlrVyTmIHRJln/97T6vT5S+wFOZbiQTiSGMilcTSB89/vweVbmxtOzAf8zYnWAJU4+WYgZQ6v++cW79LJ1dIwM26eYYUL2nEe7Q2qASX7sHW50EyVubAkq+gmA8Xikp1FcwINIn5cVxA1+WBpQGXb+DFDSxLQiNKaYIz7SRM=
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
Cc: nd <nd@arm.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCBBdWcgMTQsIDIwMTkgYXQgMDU6MDk6MzBQTSArMDMwMCwgRGFuIENhcnBlbnRlciB3
cm90ZToKPiBIZWxsbyBqYW1lcyBxaWFuIHdhbmcgKEFybSBUZWNobm9sb2d5IENoaW5hKSwKPiAK
PiBUaGUgcGF0Y2ggNWQ1MWY2YzBkYTFiOiAiZHJtL2tvbWVkYTogQWRkIHdyaXRlYmFjayBzdXBw
b3J0IiBmcm9tIE1heQo+IDIzLCAyMDE5LCBsZWFkcyB0byB0aGUgZm9sbG93aW5nIHN0YXRpYyBj
aGVja2VyIHdhcm5pbmc6Cj4gCj4gCWRyaXZlcnMvZ3B1L2RybS9hcm0vZGlzcGxheS9rb21lZGEv
a29tZWRhX3diX2Nvbm5lY3Rvci5jOjE1MSBrb21lZGFfd2JfY29ubmVjdG9yX2FkZCgpCj4gCWVy
cm9yOiBub3QgYWxsb2NhdGluZyBlbm91Z2ggZGF0YSAxNTkyIHZzIDE1ODQKPiAKPiBkcml2ZXJz
L2dwdS9kcm0vYXJtL2Rpc3BsYXkva29tZWRhL2tvbWVkYV93Yl9jb25uZWN0b3IuYwo+ICAgIDEz
OSAgc3RhdGljIGludCBrb21lZGFfd2JfY29ubmVjdG9yX2FkZChzdHJ1Y3Qga29tZWRhX2ttc19k
ZXYgKmttcywKPiAgICAxNDAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgc3Ry
dWN0IGtvbWVkYV9jcnRjICprY3J0YykKPiAgICAxNDEgIHsKPiAgICAxNDIgICAgICAgICAgc3Ry
dWN0IGtvbWVkYV9kZXYgKm1kZXYgPSBrbXMtPmJhc2UuZGV2X3ByaXZhdGU7Cj4gICAgMTQzICAg
ICAgICAgIHN0cnVjdCBrb21lZGFfd2JfY29ubmVjdG9yICprd2JfY29ubjsKPiAgICAxNDQgICAg
ICAgICAgc3RydWN0IGRybV93cml0ZWJhY2tfY29ubmVjdG9yICp3Yl9jb25uOwo+ICAgIDE0NSAg
ICAgICAgICB1MzIgKmZvcm1hdHMsIG5fZm9ybWF0cyA9IDA7Cj4gICAgMTQ2ICAgICAgICAgIGlu
dCBlcnI7Cj4gICAgMTQ3ICAKPiAgICAxNDggICAgICAgICAgaWYgKCFrY3J0Yy0+bWFzdGVyLT53
Yl9sYXllcikKPiAgICAxNDkgICAgICAgICAgICAgICAgICByZXR1cm4gMDsKPiAgICAxNTAgIAo+
ICAgIDE1MSAgICAgICAgICBrd2JfY29ubiA9IGt6YWxsb2Moc2l6ZW9mKCp3Yl9jb25uKSwgR0ZQ
X0tFUk5FTCk7Cj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIF5e
Xl5eXl4KPiBUaGlzIHNob3VsZCBwcm9iYWJseSBiZSAia3diX2Nvbm4iIHdpdGggYSBrPwoKSGkg
RGFuOgoKVGhhbmsgeW91IHZlcnkgbXVjaCwgSSdsbCBjb3JyZWN0IGl0IEFTQVAuCgpCVFc6ClNl
ZW1zIHRoaXMgZXJyb3IgaGFkIGJlZW4gZGV0ZWN0ZWQgYnkgYSBzdGF0aWMgcGFyc2VyLCBpZiBw
b3NzaWJsZQpjYW4geW91IHNoYXJlIHlvdXIgdG9vbHMgb3IgeW91ciBjb21tYW5kIGZvciBob3cg
dG8gY2F0Y2ggc3VjaCBwcm9ibGVtCgp0aGFua3MKSmFtZXMuCgo+ICAgIDE1MiAgICAgICAgICBp
ZiAoIWt3Yl9jb25uKQo+ICAgIDE1MyAgICAgICAgICAgICAgICAgIHJldHVybiAtRU5PTUVNOwo+
ICAgIDE1NCAgCj4gICAgMTU1ICAgICAgICAgIGt3Yl9jb25uLT53Yl9sYXllciA9IGtjcnRjLT5t
YXN0ZXItPndiX2xheWVyOwo+ICAgIDE1NiAgCj4gICAgMTU3ICAgICAgICAgIHdiX2Nvbm4gPSAm
a3diX2Nvbm4tPmJhc2U7Cj4gICAgMTU4ICAgICAgICAgIHdiX2Nvbm4tPmVuY29kZXIucG9zc2li
bGVfY3J0Y3MgPSBCSVQoZHJtX2NydGNfaW5kZXgoJmtjcnRjLT5iYXNlKSk7Cj4gICAgMTU5ICAK
PiAgICAxNjAgICAgICAgICAgZm9ybWF0cyA9IGtvbWVkYV9nZXRfbGF5ZXJfZm91cmNjX2xpc3Qo
Jm1kZXYtPmZtdF90YmwsCj4gICAgMTYxICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgIGt3Yl9jb25uLT53Yl9sYXllci0+bGF5ZXJfdHlwZSwKPiAgICAxNjIg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgJm5fZm9ybWF0
cyk7Cj4gCj4gcmVnYXJkcywKPiBkYW4gY2FycGVudGVyCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVs
QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
