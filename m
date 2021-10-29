Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D5F0243FE3E
	for <lists+dri-devel@lfdr.de>; Fri, 29 Oct 2021 16:14:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ABB526EA60;
	Fri, 29 Oct 2021 14:14:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR03-DB5-obe.outbound.protection.outlook.com
 (mail-eopbgr40059.outbound.protection.outlook.com [40.107.4.59])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D22856EA60
 for <dri-devel@lists.freedesktop.org>; Fri, 29 Oct 2021 14:14:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aImYsxQdvR555r1pgbpDPb+v62OodbeidaIlzqhlu98=;
 b=i829vny7IMiE8SX/g7ry7/ImXUV8myr31/5H1uxK01DEWnfsmPSi3GV1E59pAqeviSYE/656smegUo0PX0Oz0g6xqoeldjyeQ2lhDyX8BsRQglvgocLcuxuKgvkINAW+QdVNY4FRKXqUFePu44NNLEFaV4aI4xXq33XGTj1RCdw=
Received: from AS8PR04CA0123.eurprd04.prod.outlook.com (2603:10a6:20b:127::8)
 by DB7PR08MB3657.eurprd08.prod.outlook.com (2603:10a6:10:4d::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4628.18; Fri, 29 Oct
 2021 14:14:14 +0000
Received: from AM5EUR03FT047.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:127:cafe::ee) by AS8PR04CA0123.outlook.office365.com
 (2603:10a6:20b:127::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4649.15 via Frontend
 Transport; Fri, 29 Oct 2021 14:14:14 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT047.mail.protection.outlook.com (10.152.16.197) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4649.14 via Frontend Transport; Fri, 29 Oct 2021 14:14:14 +0000
Received: ("Tessian outbound e7ce0d853b63:v108");
 Fri, 29 Oct 2021 14:14:14 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: af39d61463f16451
X-CR-MTA-TID: 64aa7808
Received: from 125557e2caf0.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 DA005191-9E45-4D83-94EB-E5B823DC855A.1; 
 Fri, 29 Oct 2021 14:14:04 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 125557e2caf0.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Fri, 29 Oct 2021 14:14:04 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=T21R2iJIQBC13201TM+OAX/5+AAHTwYgLKezKl/tsDFGGkcnzUQVsIYAMB14djr5s5PcQMbLAyjXn/QmvPo06a8cLBA/L1jbTwt/iowgQFt9ennZeUzTQtGn82RAXh9iM6CxTt+QYCB6gaCOu9oaWJ/uo0lD4FMAuhAm4F0MhMCFDP6/nvi4xxv2VwDwvcvrR9Ir6m46u4DbFTynOPVVIwffxvl/RvzAjI5d/xIboKTE5dsZk6vOLSIWS73MYZ/2ezLp47KK3SoA1kklUq/plAUK8atcvQDi6mXCT9mSeutIx3H4M4thL8DIKBrM9ryowTrE1RH0ObqXqRiptVjZZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aImYsxQdvR555r1pgbpDPb+v62OodbeidaIlzqhlu98=;
 b=Fg1oL0vAnVDdsT/Cmroh2cPZ/Uo4S5kGL6Wsl5BUOWKUL4GOzkbjQEPzIu9uTxR0nX9g4GcfI/myPrFoLkI8gADa95qXiek0kg+1LBs3U6ZoKSE8k3wNQHbuPMtyAsb9wF2l2qbME0/4jiWxV7NQlbWp0ZhO9XwpjlRhUzN5XqVUzIXzrW9rYoRUaPGOXB0fVTmq616ykV3xePzI3AT556XtgciFOLlK9WLFJxYyfw7N6qnmCcKX4/n71uGzIIuM1jsjQJanrfleIO6E1H15ElYkC+2+rxVUMAKU9GCEVIN3YlFs6owCKjGOtGquWJrH04hNzCdDCDi31wG7eF5UaA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aImYsxQdvR555r1pgbpDPb+v62OodbeidaIlzqhlu98=;
 b=i829vny7IMiE8SX/g7ry7/ImXUV8myr31/5H1uxK01DEWnfsmPSi3GV1E59pAqeviSYE/656smegUo0PX0Oz0g6xqoeldjyeQ2lhDyX8BsRQglvgocLcuxuKgvkINAW+QdVNY4FRKXqUFePu44NNLEFaV4aI4xXq33XGTj1RCdw=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Received: from DB9PR08MB6812.eurprd08.prod.outlook.com (2603:10a6:10:2a2::15)
 by DBBPR08MB6028.eurprd08.prod.outlook.com (2603:10a6:10:208::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4649.15; Fri, 29 Oct
 2021 14:14:01 +0000
Received: from DB9PR08MB6812.eurprd08.prod.outlook.com
 ([fe80::8da0:3380:60cf:9849]) by DB9PR08MB6812.eurprd08.prod.outlook.com
 ([fe80::8da0:3380:60cf:9849%6]) with mapi id 15.20.4649.015; Fri, 29 Oct 2021
 14:14:01 +0000
Date: Fri, 29 Oct 2021 15:14:00 +0100
From: Brian Starkey <brian.starkey@arm.com>
To: George Kennedy <george.kennedy@oracle.com>
Cc: Ville =?utf-8?B?U3lyasOkbMOk?= <ville.syrjala@linux.intel.com>,
 gregkh@linuxfoundation.org, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@linux.ie,
 daniel@ffwll.ch, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, ben.davis@arm.com,
 Liviu.Dudau@arm.com, Dan Carpenter <dan.carpenter@oracle.com>, nd@arm.com
Subject: Re: [PATCH] drm: check drm_format_info hsub and vsub to avoid divide
 by zero
Message-ID: <20211029141400.vcswmabtk5i3cvv7@000377403353>
References: <1635429437-21718-1-git-send-email-george.kennedy@oracle.com>
 <YXqt46TPL9tUZCL1@intel.com>
 <26fdb955-10c8-a5d6-07b6-85a4374e7754@oracle.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <26fdb955-10c8-a5d6-07b6-85a4374e7754@oracle.com>
X-ClientProxiedBy: LO2P123CA0096.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:139::11) To DB9PR08MB6812.eurprd08.prod.outlook.com
 (2603:10a6:10:2a2::15)
MIME-Version: 1.0
Received: from 000377403353 (217.140.106.53) by
 LO2P123CA0096.GBRP123.PROD.OUTLOOK.COM (2603:10a6:600:139::11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4649.15 via Frontend Transport; Fri, 29 Oct 2021 14:14:01 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 19fd550b-6831-4c58-cc3d-08d99ae66328
X-MS-TrafficTypeDiagnostic: DBBPR08MB6028:|DB7PR08MB3657:
X-Microsoft-Antispam-PRVS: <DB7PR08MB3657E07A32EDA83BEA8E1A59F0879@DB7PR08MB3657.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 4DzY2JilctBzOTbg8fIGjZSJH3aXval3bHvEXU61o3hX6dR+HMcgF974EWjiqcaB7tXFPcGOoefNFk5+pyRHm1mvmUFIHFBwsL3sLlmC8nM/zXW4RvAp71dR9997QKkXsd9dtBUyMEJM/NWERVikOifjeCzYHOMUW6zjakeeMd704TmX3x7WsaxqF3w7v8gJM47n9IyeGRNqIzSZVO+IF0h1iuL8xOD4vLlcNIpUrdBmyj96GVLSZj4vIBD+mJNDxf5MesIQZJGtEoHspKvIdXUgvoR40bUaAcPHSWRSuxuq26HmANCPrxliEdZcmpFpHVigDjGSh7ojGeWY9Lybfm0/fCYCX25AqplkbrIRTnXJVC0PAP3FF8qOPdyxF7Rv8WvH/gsLcqKhIzAUG0llJE66mad3FiK3Yh5EEi0KVfR6QvlT4ZlocwVN3ihm1LmCCDc/2eJPchYykLLIELSuHRAKyK2leGWQpdcLTc6zTy/AYV2p4bswclVqLtY8tDr39/evFPH1ZKTjuMESliYHAUcdNf9gmJdW10Fdn5XjkaerRn9BIXhCvfTtga0ZweBLux2bxT9DLRjTXSKmqUqmMYnhBHqkGLZCBN6RmYdbrzmptGkTVMWQGC3NYRvY3cdlrwFoUNlcTI3ScAAGVy7Q/E7yIvXdxR4z3Gh3uBByJtiIsYBTc5va5fGitQid/E/zQwacT08HOaBcaP4c7pw0KQ==
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255; CTRY:; LANG:en;
 SCL:1; SRV:; IPV:NLI; SFV:NSPM; H:DB9PR08MB6812.eurprd08.prod.outlook.com;
 PTR:; CAT:NONE;
 SFS:(4636009)(366004)(4744005)(55016002)(6496006)(9576002)(1076003)(33716001)(86362001)(66556008)(83380400001)(66946007)(9686003)(66476007)(956004)(44832011)(8676002)(5660300002)(38100700002)(4326008)(38350700002)(7416002)(26005)(6916009)(54906003)(316002)(2906002)(186003)(52116002)(8936002)(508600001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR08MB6028
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: AM5EUR03FT047.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs: 1733aec8-509b-4cc2-4760-08d99ae65b70
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Sji4xYYp05f0muK7QEayw03bkPzQhd0faTM7lIEgWKQrjO9QAd19l0b4nWZwFo2mfCm498PH9AqzUD1i1qRv7YGrzkb+y4Jx5WBcsY84xc4lwvlymyZnHgYc/6VQ8fhfO0kIpwYCIE0lk/Zd+TlFaebIver8Z3/2NYQwyRl5NQyz38Lr59AqHO8SFgTRjwlfnLHnrgsWf1iPHAqrdpHZFYGQEExdr+KcCcLsbNdY2eSvf+hodAUE7wPRVN3mp9z6ev648RymAHHBQEfTRFWhPKcRa6YjH1s4s6u1hrdZaJQP0+rkzTgm1HCmci4c3u/932cnCz9LzrLqggp7IAiXb7cba+nQkk9VMGquGZnNcDy+KBjE5YU1RQ282OcDc/G3WjYz9Ct69eJfqDmh0/bDAdXZOyTI9SPIcrSfVW4SKTB04QEsSKlXYoAUi22rVdcK51yvFUA1SfRCoN4HlnUx4uHWRCAYfOts+taDWWVQ4IElmmao7CaWilmHBu2ZdBOUJknHMYaP2/zUME6/g1zipkVcwH3qhIaYoqQ3GnPo/nsRKkQENgnz6QvAyXhkffIw98WbpLR7aWznoIe7n0OCA7HG+HWbyxJJyIa6PPJgqQ6tpkMA5+GRZL9zYrnaYpoRoX8iIwNr6B9YLo9ymNxdGFinCikbpM+ylfGjGMba80UOypQEc6vY0Rp1LCBLGiLtalLU4n1HWoaoWCrvxhhXKA==
X-Forefront-Antispam-Report: CIP:63.35.35.123; CTRY:IE; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:64aa7808-outbound-1.mta.getcheckrecipient.com;
 PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com; CAT:NONE;
 SFS:(4636009)(46966006)(36840700001)(36860700001)(9576002)(70206006)(33716001)(6862004)(1076003)(70586007)(186003)(508600001)(4326008)(55016002)(316002)(956004)(44832011)(26005)(81166007)(4744005)(2906002)(83380400001)(47076005)(9686003)(8936002)(6496006)(5660300002)(336012)(82310400003)(8676002)(86362001)(54906003)(356005);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Oct 2021 14:14:14.5799 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 19fd550b-6831-4c58-cc3d-08d99ae66328
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[63.35.35.123];
 Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: AM5EUR03FT047.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR08MB3657
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

Hi,

On Fri, Oct 29, 2021 at 09:15:28AM -0400, George Kennedy wrote:
> 
> Asking if you have any input on how to deal with hsub and vsub = zero?

That's just a straight mistake on those formats - they should
be 1. My bad for not spotting it in review.

On the one hand, having formats in this table is a nice
machine-readable way to describe them. On the other, as drm_fourcc is
being used as the canonical repository for formats, including ones
not used in DRM, we can end up with situations like this.
(R10/R12 being another example of formats not used in DRM:
20211027233140.12268-1-laurent.pinchart@ideasonboard.com)

Thanks,
-Brian
