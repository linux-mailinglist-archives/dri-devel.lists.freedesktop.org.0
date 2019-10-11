Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 86DA0D38C2
	for <lists+dri-devel@lfdr.de>; Fri, 11 Oct 2019 07:43:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3D6C46E9BF;
	Fri, 11 Oct 2019 05:43:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-eopbgr70051.outbound.protection.outlook.com [40.107.7.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AC6F56E554
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Oct 2019 05:43:30 +0000 (UTC)
Received: from VI1PR0802CA0034.eurprd08.prod.outlook.com
 (2603:10a6:800:a9::20) by DB7PR08MB3148.eurprd08.prod.outlook.com
 (2603:10a6:5:24::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2347.21; Fri, 11 Oct
 2019 05:43:26 +0000
Received: from VE1EUR03FT038.eop-EUR03.prod.protection.outlook.com
 (2a01:111:f400:7e09::206) by VI1PR0802CA0034.outlook.office365.com
 (2603:10a6:800:a9::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.2347.16 via Frontend
 Transport; Fri, 11 Oct 2019 05:43:26 +0000
Received-SPF: TempError (protection.outlook.com: error in processing during
 lookup of arm.com: DNS Timeout)
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT038.mail.protection.outlook.com (10.152.19.112) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2305.15 via Frontend Transport; Fri, 11 Oct 2019 05:43:24 +0000
Received: ("Tessian outbound 927f2cdd66cc:v33");
 Fri, 11 Oct 2019 05:43:09 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 20b2fe191d2f3947
X-CR-MTA-TID: 64aa7808
Received: from 5578faaff9c3.2 (ip-172-16-0-2.eu-west-1.compute.internal
 [104.47.6.54]) by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 0F2463F0-1604-4F40-9672-9614E8BEA0DE.1; 
 Fri, 11 Oct 2019 05:43:04 +0000
Received: from EUR02-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur02lp2054.outbound.protection.outlook.com [104.47.6.54])
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 5578faaff9c3.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-SHA384);
 Fri, 11 Oct 2019 05:43:04 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lHqYLDqlplCkQ+bbQgCGG/wgpGEcx4hVUDVsndkOCXI0MJzDM3it4ZmjqAEQH8GO2ILdimckxzmBJWSyIeRcqx8B1kR0R+yJJzZDSr0x5PzLCy5s5Gxej/CCiyTCKGhJHJQvCfKYWYcRCoj7WWYRE0gRo2SoqNEd0FcvYMtbju1piReoP0t9FgUTqlaqYJ60AuqzApdP49uRx6VCRdyuuzAPW+mjopmoHFVHpLQTvVqS14TNNMTHyaZKzJLNpqaWnuhziUx4ZKyqM/200HHbgZuwNM5pW2/atW4fU1AzjhENPmkhh8n1ejuGiYVattgTxeLu/0bm/Rzqw9AVrktroQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=E3exUIpO43eg+isG5bikJNfuF7PWKS/F5BOA9HkurNU=;
 b=OI+9YbQFEkyth4PYf6p4Mj5d2WBCdx420xH4a8pyTwSBVVqhAnh6M4Dgha6jkv7i65AnNoML72kCfvq/9DK56xrTGYmd6yBsOezyrc19sj2667ptyS65yjlHpvtIWGZcTHbLWHQ7QoXNICOHNzniAJUBSoHAnXhVkNwT6t0knBl1vWjURWk5OaCtgdZu6AtsX2onTbUYW13bJ2MjUWstifsizcqHaGjwcEUnRKXSVuOvZuH/uvO6qZW0YrNpBPwKtP0hFQWGhDkzu/cuVvL2sFhwXl9U70Xbe4SKKjiERIdoOeO4+vtfmAKZv7+jbFyt7C25Vtzrhej10mIOldNaJA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
Received: from VE1PR08MB5006.eurprd08.prod.outlook.com (10.255.159.31) by
 VE1PR08MB5134.eurprd08.prod.outlook.com (10.255.158.83) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2347.16; Fri, 11 Oct 2019 05:43:02 +0000
Received: from VE1PR08MB5006.eurprd08.prod.outlook.com
 ([fe80::40ed:7ed3:90cf:ece5]) by VE1PR08MB5006.eurprd08.prod.outlook.com
 ([fe80::40ed:7ed3:90cf:ece5%3]) with mapi id 15.20.2347.021; Fri, 11 Oct 2019
 05:43:02 +0000
From: "james qian wang (Arm Technology China)" <james.qian.wang@arm.com>
To: Liviu Dudau <Liviu.Dudau@arm.com>, "airlied@linux.ie" <airlied@linux.ie>, 
 Brian Starkey <Brian.Starkey@arm.com>, "maarten.lankhorst@linux.intel.com"
 <maarten.lankhorst@linux.intel.com>, "sean@poorly.run" <sean@poorly.run>, 
 "imirkin@alum.mit.edu" <imirkin@alum.mit.edu>
Subject: [PATCH v2 0/4] drm/komeda: Enable CRTC color-mgmt
Thread-Topic: [PATCH v2 0/4] drm/komeda: Enable CRTC color-mgmt
Thread-Index: AQHVf/a+U+eWgo62gEmtUPhfF5P9aw==
Date: Fri, 11 Oct 2019 05:43:01 +0000
Message-ID: <20191011054240.17782-1-james.qian.wang@arm.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [113.29.88.7]
x-clientproxiedby: HK2P15301CA0005.APCP153.PROD.OUTLOOK.COM
 (2603:1096:202:1::15) To VE1PR08MB5006.eurprd08.prod.outlook.com
 (2603:10a6:803:113::31)
Authentication-Results-Original: spf=none (sender IP is )
 smtp.mailfrom=james.qian.wang@arm.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: git-send-email 2.20.1
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: c54bed35-5eb2-441f-041e-08d74e0def1a
X-MS-Office365-Filtering-HT: Tenant
X-MS-TrafficTypeDiagnostic: VE1PR08MB5134:|VE1PR08MB5134:|DB7PR08MB3148:
X-MS-Exchange-PUrlCount: 3
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS: <DB7PR08MB3148CD91C3DE10544DF19492B3970@DB7PR08MB3148.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
x-ms-oob-tlc-oobclassifiers: OLM:6790;OLM:6790;
x-forefront-prvs: 0187F3EA14
X-Forefront-Antispam-Report-Untrusted: SFV:NSPM;
 SFS:(10009020)(979002)(4636009)(396003)(376002)(136003)(39860400002)(346002)(366004)(189003)(199004)(66066001)(486006)(386003)(6506007)(64756008)(99286004)(966005)(50226002)(52116002)(81156014)(6486002)(8936002)(81166006)(66946007)(102836004)(8676002)(305945005)(55236004)(26005)(66476007)(71200400001)(6116002)(3846002)(66556008)(6436002)(71190400001)(7736002)(36756003)(186003)(2906002)(256004)(476003)(6512007)(2616005)(14444005)(66446008)(6306002)(54906003)(25786009)(14454004)(2501003)(103116003)(110136005)(316002)(4326008)(5660300002)(86362001)(478600001)(2201001)(1076003)(2171002)(969003)(989001)(999001)(1009001)(1019001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:VE1PR08MB5134;
 H:VE1PR08MB5006.eurprd08.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: arm.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: Pv1KhBu9zJhx5wtxpaWCEaMYuUhyD3jUgPApX7kNpdyo8ETeui+LPxtsNdMokKTuHqGdjhPmBRGq0NYQEo8zwOUNLHmshgpX3JdkLuS6TTqjsA6V7OF3X31b3QWpVXQ8oiz3fL1KMuScoWG/722bmeQtKae8nqEB6WwH2THW5BHYYZHrnll0K96z37Smweqjm5qO/H6V9Qvq0+aVMaYzbGJLN6M40fX/j8HsHvuv9pXxHn3zGDfmKdL3B9UNKEJNad7AYfnHk9vNKiwIaNA+6ghpSZLknLxKlkHhQT3NoJn9cDkecLqkxmkwGFXbtXRvGb+pxJEErmVbaQN3bIsc9yQENhwpqad0OYeSM+GPrtPMzPtifxW7Juna6VvfdfnOIoGQO42HzmdxEN05PuqFCs8ZgIJ+D8nNiuBpV6q5IGZnOuy8dTFBrdEcI+PFi65GL5l6WKSI2MqmkN6I2iDfsA==
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR08MB5134
Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=james.qian.wang@arm.com; 
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: VE1EUR03FT038.eop-EUR03.prod.protection.outlook.com
X-Forefront-Antispam-Report: CIP:63.35.35.123; IPV:CAL; SCL:-1; CTRY:IE;
 EFV:NLI; SFV:NSPM;
 SFS:(10009020)(979002)(4636009)(376002)(396003)(39860400002)(346002)(136003)(189003)(199004)(186003)(386003)(6506007)(70586007)(36906005)(99286004)(70206006)(26826003)(6512007)(6306002)(26005)(102836004)(22756006)(23756003)(8676002)(966005)(50466002)(36756003)(25786009)(76130400001)(14444005)(316002)(3846002)(6486002)(7736002)(305945005)(81166006)(8936002)(8746002)(54906003)(110136005)(50226002)(86362001)(336012)(5660300002)(103116003)(81156014)(6116002)(2171002)(63350400001)(1076003)(356004)(66066001)(126002)(476003)(486006)(47776003)(478600001)(2616005)(2906002)(4326008)(2201001)(2501003)(14454004)(969003)(989001)(999001)(1009001)(1019001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DB7PR08MB3148;
 H:64aa7808-outbound-1.mta.getcheckrecipient.com; FPR:; SPF:TempError; LANG:en;
 PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com; MX:1; A:1; 
X-MS-Office365-Filtering-Correlation-Id-Prvs: d4b6b874-fdae-4051-b625-08d74e0de118
NoDisclaimer: True
X-Forefront-PRVS: 0187F3EA14
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: I76Gw/F5NbgfaabXuPnnY7oRcbnWuKQb7eEM00gcY0Gnn7xA7WpFUqvIuoY/kIyBV3+Hw8oIFxpxsXnH0ZbOHCgyRkg34IZNKKg5FuZ/yIn6lHJY2AwoSIWHz4m/ESqFjgEg31q8aIRgjV1ruunDptGJUuRow75LQ419zq5rIR6b4Yu+HuNTYaj1WgEBSGx5HH0eAVet5Gl11efZ6VFUTvvuihgjBzgCLRmNI2d7ZDwtEal+44yAJbitsOsAyl3IH8obmx9RqxW7uUnWl20Hvcm63kez3Arp2G88EbS1rk2tj03xROMw81/b0PK/KJLNrnpCx1sHcHmPF7wDOSxBoZRYCxNaVmagGVI4CWqGYsDEBIpHuUpo/84pHPSglUdFUUJFZTHzAS/SV8Q6QK/BUlbXPcisyfEGuQOWO+2k55oc1VP1sjCzf5i/oyp4yQQxipBEJID1xNFl2TmHFnlyWg==
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Oct 2019 05:43:24.7384 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c54bed35-5eb2-441f-041e-08d74e0def1a
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[63.35.35.123];
 Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR08MB3148
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=E3exUIpO43eg+isG5bikJNfuF7PWKS/F5BOA9HkurNU=;
 b=IZUtc2khZ/YDHkOEW+lIEg7CQ7rvFd5l+9rs0fEmuU9669HxsDw9Bg2OzgBVfy+Rlsj+W8eHXl1QJm8OvxMUdVHId3Qz/uZQxPJxyhRQVowF2+egfSEWA7c/DC96Tz//PVEcpOMm8VsO3CE0uYtyplOBMgV74d+0JpfKdQxs1YI=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=E3exUIpO43eg+isG5bikJNfuF7PWKS/F5BOA9HkurNU=;
 b=IZUtc2khZ/YDHkOEW+lIEg7CQ7rvFd5l+9rs0fEmuU9669HxsDw9Bg2OzgBVfy+Rlsj+W8eHXl1QJm8OvxMUdVHId3Qz/uZQxPJxyhRQVowF2+egfSEWA7c/DC96Tz//PVEcpOMm8VsO3CE0uYtyplOBMgV74d+0JpfKdQxs1YI=
X-Mailman-Original-Authentication-Results: spf=temperror (sender IP is
 63.35.35.123)
 smtp.mailfrom=arm.com; lists.freedesktop.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.freedesktop.org; dmarc=none
 action=none header.from=arm.com;
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
Cc: nd <nd@arm.com>, Ayan Halder <Ayan.Halder@arm.com>, "Oscar
 Zhang \(Arm Technology China\)" <Oscar.Zhang@arm.com>, "Tiannan Zhu \(Arm
 Technology China\)" <Tiannan.Zhu@arm.com>,
 Mihail Atanassov <Mihail.Atanassov@arm.com>,
 "Jonathan Chai \(Arm Technology China\)" <Jonathan.Chai@arm.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, "Julien
 Yin \(Arm Technology China\)" <Julien.Yin@arm.com>, "Channing Chen \(Arm
 Technology China\)" <Channing.Chen@arm.com>,
 "james qian wang \(Arm Technology China\)" <james.qian.wang@arm.com>,
 "Yiqi Kang \(Arm Technology China\)" <Yiqi.Kang@arm.com>,
 "Thomas Sun \(Arm Technology China\)" <thomas.Sun@arm.com>,
 "Lowry Li \(Arm Technology China\)" <Lowry.Li@arm.com>,
 Ben Davis <Ben.Davis@arm.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGhpcyBzZXJpZXMgZW5hYmxlIENSVEMgY29sb3ItbWdtdCBmb3Iga29tZWRhIGRyaXZlciwgZm9y
IGN1cnJlbnQga29tZWRhIEhXCndoaWNoIG9ubHkgc3VwcG9ydHMgY29sb3IgY29udmVyc2lvbiBh
bmQgZm9yd2FyZCBnYW1tYSBmb3IgQ1JUQy4KClRoaXMgc2VyaWVzIGFjdHVhbGx5IGFyZSByZWdy
b3VwZWQgZnJvbToKLSBkcm0va29tZWRhOiBFbmFibGUgbGF5ZXIvcGxhbmUgY29sb3ItbWdtdDoK
ICBodHRwczovL3BhdGNod29yay5mcmVlZGVza3RvcC5vcmcvc2VyaWVzLzYwODkzLwoKLSBkcm0v
a29tZWRhOiBFbmFibGUgQ1JUQyBjb2xvci1tZ210CiAgaHR0cHM6Ly9wYXRjaHdvcmsuZnJlZWRl
c2t0b3Aub3JnL3Nlcmllcy82MTM3MC8KCkZvciByZW1vdmluZyB0aGUgZGVwZW5kZW5jZSBvbjoK
LSBodHRwczovL3BhdGNod29yay5mcmVlZGVza3RvcC5vcmcvc2VyaWVzLzMwODc2LwoKTG93cnkg
TGkgKEFybSBUZWNobm9sb2d5IENoaW5hKSAoMSk6CiAgZHJtL2tvbWVkYTogQWRkcyBnYW1tYSBh
bmQgY29sb3ItdHJhbnNmb3JtIHN1cHBvcnQgZm9yIERPVS1JUFMKCmphbWVzIHFpYW4gd2FuZyAo
QXJtIFRlY2hub2xvZ3kgQ2hpbmEpICgzKToKICBkcm0va29tZWRhOiBBZGQgYSBuZXcgaGVscGVy
IGRybV9jb2xvcl9jdG1fczMxXzMyX3RvX3FtX24oKQogIGRybS9rb21lZGE6IEFkZCBkcm1fbHV0
X3RvX2ZnYW1tYV9jb2VmZnMoKQogIGRybS9rb21lZGE6IEFkZCBkcm1fY3RtX3RvX2NvZWZmcygp
Cgp2MjoKICBNb3ZlIHRoZSBmaXhwb2ludCBjb252ZXJzaW9uIGZ1bmN0aW9uIHMzMV8zMl90b19x
Ml8xMigpIHRvIGRybSBjb3JlCiAgYXMgYSBzaGFyZWQgaGVscGVyLgoKIC4uLi9hcm0vZGlzcGxh
eS9rb21lZGEvZDcxL2Q3MV9jb21wb25lbnQuYyAgICB8IDI0ICsrKysrKysKIC4uLi9hcm0vZGlz
cGxheS9rb21lZGEva29tZWRhX2NvbG9yX21nbXQuYyAgICB8IDY2ICsrKysrKysrKysrKysrKysr
KysKIC4uLi9hcm0vZGlzcGxheS9rb21lZGEva29tZWRhX2NvbG9yX21nbXQuaCAgICB8IDEwICsr
LQogLi4uL2dwdS9kcm0vYXJtL2Rpc3BsYXkva29tZWRhL2tvbWVkYV9jcnRjLmMgIHwgIDIgKwog
Li4uL2RybS9hcm0vZGlzcGxheS9rb21lZGEva29tZWRhX3BpcGVsaW5lLmggIHwgIDMgKwogLi4u
L2Rpc3BsYXkva29tZWRhL2tvbWVkYV9waXBlbGluZV9zdGF0ZS5jICAgIHwgIDYgKysKIGRyaXZl
cnMvZ3B1L2RybS9kcm1fY29sb3JfbWdtdC5jICAgICAgICAgICAgICB8IDIzICsrKysrKysKIGlu
Y2x1ZGUvZHJtL2RybV9jb2xvcl9tZ210LmggICAgICAgICAgICAgICAgICB8ICAyICsKIDggZmls
ZXMgY2hhbmdlZCwgMTM1IGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKCi0tCjIuMjAuMQpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwg
bWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0
cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
