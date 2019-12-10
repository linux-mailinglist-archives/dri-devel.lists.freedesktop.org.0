Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B21A91182B6
	for <lists+dri-devel@lfdr.de>; Tue, 10 Dec 2019 09:48:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C95D16E85F;
	Tue, 10 Dec 2019 08:48:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR02-AM5-obe.outbound.protection.outlook.com
 (mail-am5eur02on0619.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe07::619])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B57006E85D
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Dec 2019 08:48:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GOWuTGlIb85XqmFSw5Y6ts0GT4ZqZESMemMiq0nEuaA=;
 b=XU73e0MNi030/MrdJL8H4VV6uf4mmgFA3qv1UNdITaqv1/SV9eE9NgKZd2b9C//Dn5KHvCt8lmI3+FwCjdmkbS6Kg75n0bfKqNt5FeiGtWHM+JS8DQhh8xe56q2dqQfMrr8hgNyv9lA+2rhufXxIsMKoc8NfbKYIAjtc4wtWDl4=
Received: from DB6PR0801CA0066.eurprd08.prod.outlook.com (2603:10a6:4:2b::34)
 by AM0PR08MB4353.eurprd08.prod.outlook.com (2603:10a6:208:144::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2516.17; Tue, 10 Dec
 2019 08:48:51 +0000
Received: from DB5EUR03FT055.eop-EUR03.prod.protection.outlook.com
 (2a01:111:f400:7e0a::202) by DB6PR0801CA0066.outlook.office365.com
 (2603:10a6:4:2b::34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2516.13 via Frontend
 Transport; Tue, 10 Dec 2019 08:48:51 +0000
Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.freedesktop.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.freedesktop.org;
 dmarc=bestguesspass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT055.mail.protection.outlook.com (10.152.21.30) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2495.18 via Frontend Transport; Tue, 10 Dec 2019 08:48:51 +0000
Received: ("Tessian outbound 1e3e4a1147b7:v37");
 Tue, 10 Dec 2019 08:48:50 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 0a5805570502bca8
X-CR-MTA-TID: 64aa7808
Received: from 76e75d32b073.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 04062F71-9C93-42C1-AA2D-C3A19EC8F5B8.1; 
 Tue, 10 Dec 2019 08:48:45 +0000
Received: from EUR02-HE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 76e75d32b073.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Tue, 10 Dec 2019 08:48:45 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=irO9ukmbTStOKE0iTd1DOnyGeZ6hYeA7nwETLSZTqJb31vvQ/FXtFieozaNod5t5iYiUSzCQMwIQ4vZFfIntQKqIDPKVC9/MJ6GasmKuqS99rY8+oMvQ1mrI3Z26U+8dEIAwGYAY0yjR5cT29AILjXUl0O3DboLLl5s9sj7BhM5tslFolps2p3dlXs9T8h2MHcOcyWRw29/0SQFMF9y6qx9j6PKeB/9tm3RbrNoAZ2k9TGXisdGnk3YLqG2VJh6szNVK7KB22g1YCSYqCLk35cNW9RDrdtM+vAwlQowOOJ5qqaoS/8mDaubXN4sOXy7LQQ9PD6V8lJdqeXIBJ9kkeQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GOWuTGlIb85XqmFSw5Y6ts0GT4ZqZESMemMiq0nEuaA=;
 b=IR0f3/BFlaN3uDKvs1V7EY9zuoZwCxjHat+5tiS8t+xdwQQk3rq8CYj3mj+6/Pr1SraDji5I0cMDUJjYeibvkMKJEZlvBejAHsWf3N4HmcIMzCLUpVKFfZ+xJcd6dzcAoEuwW54G/tlp8ViZEn6r3v97WW6A0AZEqFtvbMazXFKyDUCmSR3bhjF0Pecr8hgKM4OOoI8jwpeM7y4IRhe75Es5fKnMSOvU1fIDnVWNEmXeHgFPOvMDk9fHZiKeI2rVepddwc1npnPyxgRlf456+ku/MYqzZO0Hxq1bmnyjh5RV5hGUGkmUog/tAw8aKrdMuXGUlWSxdHXqwB/uLCkxWg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GOWuTGlIb85XqmFSw5Y6ts0GT4ZqZESMemMiq0nEuaA=;
 b=XU73e0MNi030/MrdJL8H4VV6uf4mmgFA3qv1UNdITaqv1/SV9eE9NgKZd2b9C//Dn5KHvCt8lmI3+FwCjdmkbS6Kg75n0bfKqNt5FeiGtWHM+JS8DQhh8xe56q2dqQfMrr8hgNyv9lA+2rhufXxIsMKoc8NfbKYIAjtc4wtWDl4=
Received: from VE1PR08MB5006.eurprd08.prod.outlook.com (10.255.159.31) by
 VE1PR08MB5182.eurprd08.prod.outlook.com (20.179.31.89) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2516.14; Tue, 10 Dec 2019 08:48:42 +0000
Received: from VE1PR08MB5006.eurprd08.prod.outlook.com
 ([fe80::f984:b0c7:bce9:144e]) by VE1PR08MB5006.eurprd08.prod.outlook.com
 ([fe80::f984:b0c7:bce9:144e%2]) with mapi id 15.20.2516.018; Tue, 10 Dec 2019
 08:48:42 +0000
From: "james qian wang (Arm Technology China)" <james.qian.wang@arm.com>
To: Mihail Atanassov <Mihail.Atanassov@arm.com>
Subject: [PATCH v3 0/2] drm/komeda: Add new product "D32" support
Thread-Topic: [PATCH v3 0/2] drm/komeda: Add new product "D32" support
Thread-Index: AQHVrzagsCbotHFGX02GRYU5HNi2+A==
Date: Tue, 10 Dec 2019 08:48:42 +0000
Message-ID: <20191210084828.19664-1-james.qian.wang@arm.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [113.29.88.7]
x-clientproxiedby: LO2P265CA0283.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:a1::31) To VE1PR08MB5006.eurprd08.prod.outlook.com
 (2603:10a6:803:113::31)
Authentication-Results-Original: spf=none (sender IP is )
 smtp.mailfrom=james.qian.wang@arm.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: git-send-email 2.20.1
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 45b22e0d-7a64-492d-2214-08d77d4dc7a3
X-MS-TrafficTypeDiagnostic: VE1PR08MB5182:|VE1PR08MB5182:|AM0PR08MB4353:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS: <AM0PR08MB4353A315443D60A7D11D57DFB35B0@AM0PR08MB4353.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
x-ms-oob-tlc-oobclassifiers: OLM:3173;OLM:3173;
x-forefront-prvs: 02475B2A01
X-Forefront-Antispam-Report-Untrusted: SFV:NSPM;
 SFS:(10009020)(4636009)(346002)(136003)(376002)(366004)(396003)(39860400002)(189003)(199004)(53754006)(54906003)(4326008)(66446008)(26005)(1076003)(103116003)(66556008)(37006003)(186003)(66946007)(64756008)(8676002)(66476007)(36756003)(6862004)(305945005)(2616005)(2906002)(71200400001)(6486002)(86362001)(4744005)(478600001)(6512007)(6636002)(316002)(71190400001)(5660300002)(55236004)(81156014)(81166006)(8936002)(52116002)(6506007);
 DIR:OUT; SFP:1101; SCL:1; SRVR:VE1PR08MB5182;
 H:VE1PR08MB5006.eurprd08.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: arm.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: LKBXS/kv77coucQl8Z8aaWbwk/dFllF7BB25gKs/v5VdCCcTKiTfN59hRZgRUyUmCM6ZcSyXC24APH3ZRXePJPAQweZbGKc/fEHTg9Gcbj8Fnv7UO4jtIp/f/LjJ9tt87NhbIcdC/qFzE7Im/nzWUNVwxbAjh8omwZ4ZaSUZU1znO9b34SKQSBgorEDB+1FceJy78AHi9rE/Epwxr9xPIPe4nRJElNbTEFALlkdehT42VWYAhABo/3JjzccwfUz/JD5kiakWW/oIQQKkYN1nICc5py59O0nj5pumCV+OTpzSbzQOACoLlfgTluTPCfkENeCivFYTEa4cQZG1bEwt5P+LGEyjjrgj7f50oqtsngA0i4NrIRoIU8/9ZtLeYR9EatW+PR4LTaxwSCLw0c5tXoUmI8JTKK2daCuSZArAT/DZXz65qGlT2yf1IV4n7wVJ8fxVplYQdFkEpKflBI6sc4XWToewnGApMEZMMgPPXtk5WnvioD2OC5Cnu6eAyDLq
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR08MB5182
Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=james.qian.wang@arm.com; 
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: DB5EUR03FT055.eop-EUR03.prod.protection.outlook.com
X-Forefront-Antispam-Report: CIP:63.35.35.123; IPV:CAL; SCL:-1; CTRY:IE;
 EFV:NLI; SFV:NSPM;
 SFS:(10009020)(4636009)(346002)(396003)(136003)(39860400002)(376002)(189003)(199004)(53754006)(26826003)(186003)(36756003)(478600001)(103116003)(26005)(305945005)(8936002)(1076003)(2906002)(356004)(316002)(5660300002)(81156014)(6512007)(6636002)(2616005)(37006003)(8676002)(81166006)(54906003)(86362001)(6862004)(6506007)(76130400001)(336012)(6486002)(70206006)(4326008)(70586007)(4744005);
 DIR:OUT; SFP:1101; SCL:1; SRVR:AM0PR08MB4353;
 H:64aa7808-outbound-1.mta.getcheckrecipient.com; FPR:; SPF:Pass; LANG:en;
 PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com; MX:1; A:1; 
X-MS-Office365-Filtering-Correlation-Id-Prvs: e374416c-eaff-45c2-24f7-08d77d4dc24f
NoDisclaimer: True
X-Forefront-PRVS: 02475B2A01
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: l+0AUgjOm2QdwXhkL9jC0poWHXt9hWoTJL84fj+SRUPGIozKnFttpCzxQp5ib2JGfb0AvONtXZj4ZnNOO/XgYJKVrs3UcFg2SxOJLueYAxMWM5U8+VPKFhVkG2VW8bH160sVtdH1NblvwJrpzRGi3WuaNQvKJ5rVeiGKzDAtHJDxfFU6pG53nLB9tt/1L7/DferlBjpJfaVHu0qCCkB0f6ZYM7M1S/wIGQoSULW0WT1XYxh3/6Jz3/t/rtPjDZ4facG9PNGY7RyjaCJIy8xLh9V5rMfrEODdeTaLuMnPW75KLjoeqKDeg7DowsZzeWw7++Tvt5+wdm1RzZ6Dr1nq17PJQ1+LEavXdb8w1vJNevP9FmEt9BmJ5zP4sUChd7QKRFfn3hFwBBydnGLs46fG1RxeAFHnQkvdAuv2AKAVfZUvIribGETmdPoKAO98ZSmnG6hmVDWOHQMFEKODoqZxC1MU0mnjvk/8xBX3tOmRA6jzJf7bM1Aqzs6o5rDy3rY8
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Dec 2019 08:48:51.0844 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 45b22e0d-7a64-492d-2214-08d77d4dc7a3
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[63.35.35.123];
 Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB4353
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
Cc: "Lowry Li \(Arm Technology China\)" <Lowry.Li@arm.com>,
 "Oscar Zhang \(Arm Technology China\)" <Oscar.Zhang@arm.com>,
 "Tiannan Zhu \(Arm Technology China\)" <Tiannan.Zhu@arm.com>,
 "Jonathan Chai \(Arm Technology China\)" <Jonathan.Chai@arm.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "Channing Chen \(Arm Technology China\)" <Channing.Chen@arm.com>,
 "james qian wang \(Arm Technology China\)" <james.qian.wang@arm.com>,
 nd <nd@arm.com>, Ben Davis <Ben.Davis@arm.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi All:

This series enables new product "D32" support

v2: Rebase
v3: Address Mihail's review comments.

james qian wang (Arm Technology China) (2):
  drm/komeda: Update the chip identify
  drm/komeda: Enable new product D32 support

 .../drm/arm/display/include/malidp_product.h  |  3 +-
 .../arm/display/komeda/d71/d71_component.c    |  2 +-
 .../gpu/drm/arm/display/komeda/d71/d71_dev.c  | 58 +++++++++++++-----
 .../gpu/drm/arm/display/komeda/d71/d71_regs.h | 13 ++++
 .../gpu/drm/arm/display/komeda/komeda_dev.c   | 61 ++++++++++---------
 .../gpu/drm/arm/display/komeda/komeda_dev.h   | 14 +----
 .../gpu/drm/arm/display/komeda/komeda_drv.c   | 10 +--
 7 files changed, 96 insertions(+), 65 deletions(-)

--
2.20.1
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
