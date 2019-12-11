Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 91C2611BA52
	for <lists+dri-devel@lfdr.de>; Wed, 11 Dec 2019 18:30:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6CB156EB94;
	Wed, 11 Dec 2019 17:30:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR03-VE1-obe.outbound.protection.outlook.com
 (mail-eopbgr50045.outbound.protection.outlook.com [40.107.5.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 029596EB99
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Dec 2019 17:30:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=47muZcJqcdrDAhjem+PYlfaiiIA89kh7P3pEFizoZ/A=;
 b=EAbJ+NLkpnfhThg7ObcAUEtLuAMuayiLZiUMFgxCcf7a0sjPnWUWzZN5nvwzCjp/866I460tIRDcyYe2/xq5zr8maq21mlrtAOsd3C29XDLGe0teG61RF7FPP1LcRHPibe8y9vNlbEKCU9Mkh6bSsenBVENv6N7mlm90GOXufcc=
Received: from AM6PR08CA0007.eurprd08.prod.outlook.com (2603:10a6:20b:b2::19)
 by AM4PR0802MB2306.eurprd08.prod.outlook.com (2603:10a6:200:5e::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2538.15; Wed, 11 Dec
 2019 17:30:11 +0000
Received: from AM5EUR03FT037.eop-EUR03.prod.protection.outlook.com
 (2a01:111:f400:7e08::201) by AM6PR08CA0007.outlook.office365.com
 (2603:10a6:20b:b2::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2538.14 via Frontend
 Transport; Wed, 11 Dec 2019 17:30:11 +0000
Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.freedesktop.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.freedesktop.org;
 dmarc=bestguesspass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT037.mail.protection.outlook.com (10.152.17.241) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2495.18 via Frontend Transport; Wed, 11 Dec 2019 17:30:10 +0000
Received: ("Tessian outbound 58ad627f3883:v37");
 Wed, 11 Dec 2019 17:30:10 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: aa402616a960aa56
X-CR-MTA-TID: 64aa7808
Received: from 0c035635b898.3
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 7D932FF7-45BD-4FAC-9FE2-4733ED567894.1; 
 Wed, 11 Dec 2019 17:30:03 +0000
Received: from EUR03-DB5-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 0c035635b898.3
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 11 Dec 2019 17:30:03 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Eto7VtgF/bFZYQqTSOdAJ2yMkb7RTUHd9B2/H3MTfx5ZVMVKvt7ShXA42xLO1jXbSDPaYNUKcT8zswdYn46ZkqlT+T02EaOmnRcgbFwPqTogaB3KvyjWGRPbnr+EDXPd3gFihrcRs+L0wgD9YJB3jTdDQxHBL6RY5mFRPk3H+ydUsCZBEDbxtZNVyTXMLRz9arUqddEq9lPveCwgp+b/sjXDla+6TOkp2p55rIxIDIOO1w9t/9qhHuR0zahgeR3KwYm7IxgyiC2THcaGZdPTfnRPceaELifGAH7gIAkqQSC0DKYjgwuRHmzelm4+astWS48GuOD0fLQM5l+poq9eOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=47muZcJqcdrDAhjem+PYlfaiiIA89kh7P3pEFizoZ/A=;
 b=YRzexFNqtxxuCYA31hZFTbYc8crwoAboanblraRu4HPaztZ4ixT08WHmNT1donq1LAjvjgCZbD68zQRckyP42iQUkSqOKu/psVafsUVs43CYZpu+3HBbQEgGbC5fB3Y2Y7eZ+DkOHdEDNU7vzNWVoYpzhn04ImCU71r6Wsad25WmWmOBJtfOphNx1jlg31hJj0l+yVZ4Ip9FEXxNZYU8VIoFvkaLRBxSQ0m6h7C3GeQfl+tn01otFI+6+e/qB+su/YkgK02zBSjc+Am27MS4njoxUKOqV1tTfn5QRWLUZQDhl5LcCj+C6LsQDS7WpmnTwHYDNU1D6BmwB/Y0Mf1yWQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=47muZcJqcdrDAhjem+PYlfaiiIA89kh7P3pEFizoZ/A=;
 b=EAbJ+NLkpnfhThg7ObcAUEtLuAMuayiLZiUMFgxCcf7a0sjPnWUWzZN5nvwzCjp/866I460tIRDcyYe2/xq5zr8maq21mlrtAOsd3C29XDLGe0teG61RF7FPP1LcRHPibe8y9vNlbEKCU9Mkh6bSsenBVENv6N7mlm90GOXufcc=
Received: from VI1PR08MB4078.eurprd08.prod.outlook.com (20.178.127.92) by
 VI1PR08MB3151.eurprd08.prod.outlook.com (52.133.15.138) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2516.12; Wed, 11 Dec 2019 17:30:01 +0000
Received: from VI1PR08MB4078.eurprd08.prod.outlook.com
 ([fe80::3d0a:7cde:7f1f:fe7c]) by VI1PR08MB4078.eurprd08.prod.outlook.com
 ([fe80::3d0a:7cde:7f1f:fe7c%7]) with mapi id 15.20.2516.018; Wed, 11 Dec 2019
 17:30:01 +0000
From: Mihail Atanassov <Mihail.Atanassov@arm.com>
To: "james qian wang (Arm Technology China)" <james.qian.wang@arm.com>
Subject: Re: [PATCH] drm/komeda: Correct d71 register block counting
Thread-Topic: [PATCH] drm/komeda: Correct d71 register block counting
Thread-Index: AQHVryCISCrm/Iio6km6+MdLrsMXu6e1I3uA
Date: Wed, 11 Dec 2019 17:30:01 +0000
Message-ID: <1904852.g9mvNTCQN0@e123338-lin>
References: <20191210061015.25905-1-james.qian.wang@arm.com>
In-Reply-To: <20191210061015.25905-1-james.qian.wang@arm.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [217.140.106.54]
x-clientproxiedby: LO2P265CA0194.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:9e::14) To VI1PR08MB4078.eurprd08.prod.outlook.com
 (2603:10a6:803:e5::28)
Authentication-Results-Original: spf=none (sender IP is )
 smtp.mailfrom=Mihail.Atanassov@arm.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: ebcdd3f8-d638-4ea8-9330-08d77e5fc628
X-MS-TrafficTypeDiagnostic: VI1PR08MB3151:|VI1PR08MB3151:|AM4PR0802MB2306:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS: <AM4PR0802MB2306CCFF0202704DB27A79A68F5A0@AM4PR0802MB2306.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
x-ms-oob-tlc-oobclassifiers: OLM:1443;OLM:1443;
x-forefront-prvs: 024847EE92
X-Forefront-Antispam-Report-Untrusted: SFV:NSPM;
 SFS:(10009020)(7916004)(4636009)(396003)(136003)(39860400002)(376002)(366004)(346002)(199004)(189003)(8936002)(5660300002)(86362001)(478600001)(6636002)(2906002)(54906003)(71200400001)(8676002)(81156014)(81166006)(66446008)(52116002)(186003)(4326008)(6512007)(26005)(64756008)(316002)(33716001)(9686003)(6862004)(6486002)(6506007)(66476007)(66556008)(66946007)(39026012);
 DIR:OUT; SFP:1101; SCL:1; SRVR:VI1PR08MB3151;
 H:VI1PR08MB4078.eurprd08.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: arm.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: R0CbE0/kTM80krFAiMiZETAWqM1drahEVjOqu2vYhcSvz+bWVaqb0JiBBKTLTfRdqtHOgQCXEutd9n4pJVLb/cD5EiYuqaus90/Maziu4wUaih3mjNs3DY7Cq0TXRp1J4QI6/49sc2TJHKZ0jq03Wn7qIeiDpc6Xx7ijjFJJFl/26MsU1QxAeXKsQL3HOULJJQcN16LESnaU50nqByrw/n2NvvalY75Tl4TmwnLZ7aNh3uIMSIeb/GBaSH2VWFmJpqyZF5zJ0PgRvPv+tfz2UDebbG7vPMEFC6h5rfq7/627a4jD8omlNTUTdAjS/OYek+enlFE1G0UqIT4ie2ET9oZX5yARGRclTXktqnj8WJOC+ICgDpwUrSidaJZDXIXCGKpVnLJc3OqXdGrHu7mhCXffBf40RXbvWjDxR54RRabKB2kusR6Im3awJ//vRkcbQpKze+qbVxtoPNoLWtNRb03oo/clcDGk7LzmFUTfhEz2z+dnePUU5xWo2xx4djtQ
Content-ID: <277462619924DD4B997912FDC952039A@eurprd08.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB3151
Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Mihail.Atanassov@arm.com; 
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: AM5EUR03FT037.eop-EUR03.prod.protection.outlook.com
X-Forefront-Antispam-Report: CIP:63.35.35.123; IPV:CAL; SCL:-1; CTRY:IE;
 EFV:NLI; SFV:NSPM;
 SFS:(10009020)(7916004)(4636009)(396003)(39860400002)(136003)(346002)(376002)(189003)(199004)(6636002)(5660300002)(76130400001)(186003)(6486002)(70586007)(70206006)(86362001)(81156014)(8676002)(81166006)(6506007)(8936002)(6862004)(478600001)(26826003)(36906005)(316002)(33716001)(2906002)(6512007)(26005)(9686003)(356004)(336012)(54906003)(4326008)(39026012);
 DIR:OUT; SFP:1101; SCL:1; SRVR:AM4PR0802MB2306;
 H:64aa7808-outbound-1.mta.getcheckrecipient.com; FPR:; SPF:Pass; LANG:en;
 PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com; MX:1; A:1; 
X-MS-Office365-Filtering-Correlation-Id-Prvs: ec7f7202-3695-4c4e-534f-08d77e5fc042
NoDisclaimer: True
X-Forefront-PRVS: 024847EE92
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Lj3ZutkOnZi5baeVGxB+FGln7wQimYIMsxLrJPvytBVTTFdP4azix7fx3FxswYqWpbKZ9NBln5nsQoVDriBUOo0u2y2uA6Bd9NAwRwFrM0hasthX7pKNTWKBsxDULd41GES0FlGep59EEY8Tjcrxzv5B6OKg2Pnui6pMj8p3xW9dB45PS3aFXUGgywb6BfT0rrv0UIfOh+VYNQAeGhZ+/gOGOSitr8veX9Gq8Gjucs8qcxdfPUCkXEFz4egoqmBEe2ESFq/qwmZokP3ubayppoFj4o0T3RVefOaydO1V/AGTX6NREqhqXnvsjFCM0BGJYCVfq1CcH9o8qVZPY53JKVKCQNOoon6L5pzo5x58Q2fpwAFo3N2qX8opI+e8G52rBErCKVIMG2DVn1q4BUuu0J4FlzPzp9wsOeCLXUH100AcJoqjfFVJcwYJyp3uASPk02wn3dqDR72DO8w5+m4ugP3NrHYmKj5wN7iR8+05+zoEYeqwCCb45l9oCIXqer78
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Dec 2019 17:30:10.7164 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ebcdd3f8-d638-4ea8-9330-08d77e5fc628
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[63.35.35.123];
 Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM4PR0802MB2306
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
Cc: nd <nd@arm.com>, "Oscar
 Zhang \(Arm Technology China\)" <Oscar.Zhang@arm.com>,
 "Tiannan Zhu \(Arm Technology China\)" <Tiannan.Zhu@arm.com>,
 "Jonathan Chai \(Arm Technology China\)" <Jonathan.Chai@arm.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "Channing Chen \(Arm Technology China\)" <Channing.Chen@arm.com>,
 "Lowry Li \(Arm Technology China\)" <Lowry.Li@arm.com>,
 Ben Davis <Ben.Davis@arm.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tuesday, 10 December 2019 06:10:34 GMT james qian wang (Arm Technology China) wrote:
> Per HW, d71->num_blocks includes reserved blocks but no PERIPH block,
> correct the block counting accordingly.
> D71 happens to only have one reserved block and periph block, which
> hides this counting error.
> 
> Signed-off-by: james qian wang (Arm Technology China) <james.qian.wang@arm.com>
> ---
>  drivers/gpu/drm/arm/display/komeda/d71/d71_dev.c | 9 ++++++---
>  1 file changed, 6 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/arm/display/komeda/d71/d71_dev.c b/drivers/gpu/drm/arm/display/komeda/d71/d71_dev.c
> index 822b23a1ce75..d53f95dea0a1 100644
> --- a/drivers/gpu/drm/arm/display/komeda/d71/d71_dev.c
> +++ b/drivers/gpu/drm/arm/display/komeda/d71/d71_dev.c
> @@ -414,8 +414,11 @@ static int d71_enum_resources(struct komeda_dev *mdev)
>  		d71->pipes[i] = to_d71_pipeline(pipe);
>  	}
>  
> -	/* loop the register blks and probe */
> -	i = 2; /* exclude GCU and PERIPH */
> +	/* loop the register blks and probe.
> +	 * NOTE: d71->num_blocks includes reserved blocks.
> +	 * d71->num_blocks = GCU + valid blocks + reserved blocks
> +	 */
> +	i = 1; /* exclude GCU */
>  	offset = D71_BLOCK_SIZE; /* skip GCU */
>  	while (i < d71->num_blocks) {
>  		blk_base = mdev->reg_base + (offset >> 2);
> @@ -425,9 +428,9 @@ static int d71_enum_resources(struct komeda_dev *mdev)
>  			err = d71_probe_block(d71, &blk, blk_base);
>  			if (err)
>  				goto err_cleanup;
> -			i++;
>  		}
>  
> +		i++;
>  		offset += D71_BLOCK_SIZE;
>  	}
>  
> 

Reviewed-by: Mihail Atanassov <mihail.atanassov@arm.com>

-- 
Mihail



_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
