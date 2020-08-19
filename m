Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F0C77249F81
	for <lists+dri-devel@lfdr.de>; Wed, 19 Aug 2020 15:22:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 667726E2EF;
	Wed, 19 Aug 2020 13:22:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on2062.outbound.protection.outlook.com [40.107.22.62])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 94A546E2EF
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Aug 2020 13:22:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ths1yTPKkYGM0/8Qcc1BcQ4a98FqWjFSwIkDNIvTLmg=;
 b=l3iRNc1BUoz0LAV5UN/FPoyL00gEpWzVyX855c/2sEeNqXvOdsx9KvTCSEin66m89LXfopDYDWaukg6TxbnhwOcYBybTEjCr7pKF226bPVL21lwl7xJ4tMbNC1r5CgSDhTkqqGIEe1Z8fpwLH3sg/I9qZ0v06j43Xmvx0IskdC8=
Received: from DB6PR0802CA0040.eurprd08.prod.outlook.com (2603:10a6:4:a3::26)
 by DB8PR08MB5035.eurprd08.prod.outlook.com (2603:10a6:10:eb::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3305.24; Wed, 19 Aug
 2020 13:22:17 +0000
Received: from DB5EUR03FT010.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:4:a3:cafe::1c) by DB6PR0802CA0040.outlook.office365.com
 (2603:10a6:4:a3::26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3305.25 via Frontend
 Transport; Wed, 19 Aug 2020 13:22:17 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.freedesktop.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.freedesktop.org;
 dmarc=bestguesspass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT010.mail.protection.outlook.com (10.152.20.96) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3305.24 via Frontend Transport; Wed, 19 Aug 2020 13:22:16 +0000
Received: ("Tessian outbound bac899b43a54:v64");
 Wed, 19 Aug 2020 13:22:16 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 40791383dc47070f
X-CR-MTA-TID: 64aa7808
Received: from 97e241cfc2a8.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 087D9188-85A5-4C3E-828F-89BF29CDC413.1; 
 Wed, 19 Aug 2020 13:22:10 +0000
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 97e241cfc2a8.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 19 Aug 2020 13:22:10 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fL4aHVkLNMOo0UZtdpsHIq1kdbDbkjuDZy4FUuYPvAY1sEP0hjPWnowxR9duC0CmU1Ei0N9XM6yXmylkNPtfTm1z/Y+MzMU0ff9eWl7InvEofje03pIcxngL30evD63isyMOGhX/0sMxq2UVDID7OlxZL0LBCOTVl5MDpZU9SWe2vGEYnpQcZQYr8x/Q4hMhH15otbFxxFqWh3Ifgyy/pQ+bQ0jYFPyBZ0iEhK3AnKRVo6xZ/2vGuwx0qiW0D8yOEHELCzXZy4ICNQg4ZrFzQklqIIW0QeK+H146jZa74tX6qDU+3RQjogzNhMSIuCnsOSOqg6BQVOHBY56xt0eVgg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ths1yTPKkYGM0/8Qcc1BcQ4a98FqWjFSwIkDNIvTLmg=;
 b=n5TirmjnvExDxul/+djRWmnJmfnczO+InB0pZuC1hTftntGM50XseLkmx7aRfGQQjgl8v3BIXsWMP7k/IS8ZVeOePlJ2NxXjaPgkBoK60jB6+QtQkpvK9UQBIJKspVdUt0YMrjMC92pzew+6DLeEI/wQ7dvbTdU12/zoG2uQmWbDZO+ouUVquANTBXAVQEGuvleP56fLHBCQ7Snqu5xF51gtAa2/HB2Ru5pvYNTdkL2E7XLKx8QqRqJ8WpxZcPykoCb7rCb7b7X8RIk6l2jj7TsZ/vmaI1URc33nptA/L4KSCBZpuu5uq3yLBHqNfJesvF0Zh8W/39NoIxbAH5hvaQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ths1yTPKkYGM0/8Qcc1BcQ4a98FqWjFSwIkDNIvTLmg=;
 b=l3iRNc1BUoz0LAV5UN/FPoyL00gEpWzVyX855c/2sEeNqXvOdsx9KvTCSEin66m89LXfopDYDWaukg6TxbnhwOcYBybTEjCr7pKF226bPVL21lwl7xJ4tMbNC1r5CgSDhTkqqGIEe1Z8fpwLH3sg/I9qZ0v06j43Xmvx0IskdC8=
Authentication-Results-Original: samsung.com; dkim=none (message not signed)
 header.d=none;samsung.com; dmarc=none action=none header.from=arm.com;
Received: from HE1PR08MB2890.eurprd08.prod.outlook.com (2603:10a6:7:36::11) by
 HE1PR0801MB1900.eurprd08.prod.outlook.com (2603:10a6:3:4d::9) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3305.25; Wed, 19 Aug 2020 13:22:07 +0000
Received: from HE1PR08MB2890.eurprd08.prod.outlook.com
 ([fe80::14f5:cc22:9381:1d13]) by HE1PR08MB2890.eurprd08.prod.outlook.com
 ([fe80::14f5:cc22:9381:1d13%6]) with mapi id 15.20.3283.028; Wed, 19 Aug 2020
 13:22:07 +0000
Date: Wed, 19 Aug 2020 14:22:04 +0100
From: Brian Starkey <brian.starkey@arm.com>
To: Cho KyongHo <pullip.cho@samsung.com>
Subject: Re: [PATCH 0/3] Chunk Heap Support on DMA-HEAP
Message-ID: <20200819132204.2rki3xsczdy2cpsk@DESKTOP-E1NTVVP.localdomain>
References: <CGME20200818074547epcas2p21e0c2442873d03800c7bc2c3e76405d6@epcas2p2.samsung.com>
 <20200818080415.7531-1-hyesoo.yu@samsung.com>
 <20200818105557.svky5c7gdvk6khzu@DESKTOP-E1NTVVP.localdomain>
 <20200819034626.GB70898@KEI>
Content-Disposition: inline
In-Reply-To: <20200819034626.GB70898@KEI>
User-Agent: NeoMutt/20180716-849-147d51-dirty
X-ClientProxiedBy: LO2P265CA0008.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:62::20) To HE1PR08MB2890.eurprd08.prod.outlook.com
 (2603:10a6:7:36::11)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from DESKTOP-E1NTVVP.localdomain (217.140.99.251) by
 LO2P265CA0008.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:62::20) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3305.24 via Frontend Transport; Wed, 19 Aug 2020 13:22:05 +0000
X-Originating-IP: [217.140.99.251]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: f105c4f4-3c27-4d76-01f8-08d84442e46b
X-MS-TrafficTypeDiagnostic: HE1PR0801MB1900:|DB8PR08MB5035:
X-Microsoft-Antispam-PRVS: <DB8PR08MB5035D5D817D0D15706DB9B86F05D0@DB8PR08MB5035.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: KWAvcn/YZlaHthP1aDV1SJeSKsHaopkxTtPekL7fwKHP0DuVS4QHS/IcTEeDL5EAfRN9Wxv/wJZy/VT+fgaTPWPb82DyeXCsya5+Lo5LUNI/bT7IsARgfySDZ5F2Hm7TEAvMiOS5jjv1Sqvw4TXolDNyQYw1DIF87LNOcZEgZWJCghS5IDk6DXTCG3SED8wr80TbZzS/0rab5XgYEKO2cLH3K+hb8eoYY/X1OkBBSPKKAUEoP+hfLOaZegTEwWRmT1V3HH1xkR/KIf+eXW04zYyAWgrxSLzPTpsM4BMzd5HsfJeNnKBoxVErXBIXFE5XBgmcH90tg5Q8HwdmaQwJLg==
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255; CTRY:; LANG:en;
 SCL:1; SRV:; IPV:NLI; SFV:NSPM; H:HE1PR08MB2890.eurprd08.prod.outlook.com;
 PTR:; CAT:NONE;
 SFS:(4636009)(39860400002)(376002)(346002)(366004)(396003)(136003)(186003)(2906002)(8676002)(9686003)(16526019)(6916009)(316002)(26005)(83380400001)(44832011)(8936002)(6506007)(55016002)(52116002)(7696005)(956004)(478600001)(86362001)(5660300002)(4326008)(66556008)(66476007)(7416002)(66946007)(1076003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: pJTU1/fUz7pKiHECRoVxyqLso/mKrvZYGvwrJCskOD4cF/mwSOmUwKpN++lsxSJ61U8uRF09dA279FfE9n7rbA0ThKxiovEtn+/C3+tGayjMtmZmIdoLCgKcXY66fDtXOhpxWCsxTyUaD7wqqh1mfSNTm0PU6sMCSNyUXhQ6nYbJYZSnRJ8n9T8dl0i/VpmW0CSUgfX2WwOi9Z4le6/pTq6gTfQXsZPkZK5xz2IKyiNZ661Cwv5NOFaHg9zxbpueTehyG3qN8+E4GUB/HTFxs2cKKCRUklbbdsPIgtlqhHEVpWn22YRQ7dspQ+C+TJhgePomlJ6rEUP3dmU0e/8xW2d3Q8DF9xeiSaoRnvXSPrsaol2T2C4o+JpsOH3OdpjKg2ousqWGYuDQ3HSLrKIEbr8NqqQvETp8LoVMkTKxUAcvBxJ1/uy9dpWp7321IxIpOHRgDn5H1e4MOfa/ioDvwwsPEyvJjO9FaD8NSrz3B+qunlBj8C35GHIOd1MS73rkEdCsLfIw/VqbY4WY2uk+u3urgYxKmJZU1n5cMYgAbnVB4tOHDDZ++VFiYh4UCrQKXz7BwkHVZPNV0t5TkTbZ3BqK8Vxumq3nrCHUhGZ9QTnGE/npUpXi6N5NGCFwa5dL8jNCUSkIkcFIbFftIGLNuQ==
X-MS-Exchange-Transport-Forked: True
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1PR0801MB1900
Original-Authentication-Results: samsung.com; dkim=none (message not signed)
 header.d=none;samsung.com; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: DB5EUR03FT010.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs: c4451903-a581-4239-3669-08d84442ded8
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: yfL7ntZmcRK9HuPXg/R39ByC95ToYyEdD177O+uQv8sWB3hHdOaX3MgtHl2hn2oBfgbcD1ktXrPkwrEHKJtLsB5yVZKqXgy3KJig8FPddMfGCn36r+7MW1GroI7Rg34oI5osgc4TL2+uJa8MiO8w90243XCMQ4tzfgVfPpunc7DuNsVRky8rl68WTVZOyscYMyEILQ+VUBE3hV45qi400IwcQbHk1qjC2fP6KkyCx7uwvb5dSzCiZKI8K5W6wkTtY+VMf0/Djc3Lrl8YYyGjvNromUJ0q4eUGUUDkZMdYmwCHP9LnzCgKZ0eAuAP1jaDgpktZO0NbWamTS52N4gR5w67wB1BaXOHjgJe2ecUTnSBb2231PM+CczIIpA+qRXw46wgxN6DvhBAeV61Ox6bdA==
X-Forefront-Antispam-Report: CIP:63.35.35.123; CTRY:IE; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:64aa7808-outbound-1.mta.getcheckrecipient.com;
 PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com; CAT:NONE;
 SFS:(4636009)(39860400002)(346002)(376002)(396003)(136003)(46966005)(6506007)(83380400001)(5660300002)(336012)(70586007)(8676002)(70206006)(82740400003)(16526019)(9686003)(81166007)(186003)(8936002)(2906002)(356005)(7696005)(26005)(1076003)(82310400002)(86362001)(47076004)(316002)(478600001)(956004)(4326008)(55016002)(44832011)(6862004);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Aug 2020 13:22:16.3613 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f105c4f4-3c27-4d76-01f8-08d84442e46b
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[63.35.35.123];
 Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: DB5EUR03FT010.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR08MB5035
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
Cc: dri-devel@lists.freedesktop.org, linux-mm@kvack.org,
 Hyesoo Yu <hyesoo.yu@samsung.com>, labbott@redhat.com,
 linux-media@vger.kernel.org, devicetree@vger.kernel.org,
 linaro-mm-sig@lists.linaro.org, robh+dt@kernel.org, nd@arm.com,
 surenb@google.com, akpm@linux-foundation.org, vbabka@suse.cz,
 linux-kernel@vger.kernel.org, lmark@codeaurora.org, afd@ti.com,
 minchan@kernel.org, joaodias@google.com, iamjoonsoo.kim@lge.com,
 christian.koenig@amd.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi KyongHo,

On Wed, Aug 19, 2020 at 12:46:26PM +0900, Cho KyongHo wrote:
> I have seriously considered CPA in our product but we developed our own
> because of the pool in CPA.

Oh good, I'm glad you considered it :-)

> The high-order pages are required by some specific users like Netflix
> app. Moreover required number of bytes are dramatically increasing
> because of high resolution videos and displays in these days.
> 
> Gathering lots of free high-order pages in the background during
> run-time means reserving that amount of pages from the entier available
> system memory. Moreover the gathered pages are soon reclaimed whenever
> the system is sufferring from memory pressure (i.e. camera recording,
> heavy games).

Aren't these two things in contradiction? If they're easily reclaimed
then they aren't "reserved" in any detrimental way. And if you don't
want them to be reclaimed, then you need them to be reserved...

The approach you have here assigns the chunk of memory as a reserved
CMA region which the kernel is going to try not to use too - similar
to the CPA pool.

I suppose it's a balance depending on how much you're willing to wait
for migration on the allocation path. CPA has the potential to get you
faster allocations, but the downside is you need to make it a little
more "greedy".

Cheers,
-Brian
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
