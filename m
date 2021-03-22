Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BF26343C98
	for <lists+dri-devel@lfdr.de>; Mon, 22 Mar 2021 10:20:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DEA1D89D7C;
	Mon, 22 Mar 2021 09:20:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2043.outbound.protection.outlook.com [40.107.92.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9910389D7C;
 Mon, 22 Mar 2021 09:20:14 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ncU4kAkpGlI8KH59+ib9bu57bA2pCA59eAeXa3jfZl8sbX4I2ihThNsczeJXJUvgQZI05wqzemsAV9H+dUO5bBwY+TI+OpYWiJxbYX9X5/LGKk0+J3x22L11OhelsEECKtYZW3RiKbo+fRkzqGYofBvN9jVe38owM/qljrwmvN3fNssoSgLo+B+Zu9+CYuWZKax9psEXUVTdwqTuDgPAwwOmPHzmm6ko5ENOBfolUEvWdmX0F+tuW+EMl3y1sJUdjIL+VyiJQ6+WJB4x1DHQip3mcmRRmDoHxtGcOq3MTan5H68GsKW1pkIX28im22H7H5ykh7MZl8Pe/oqnNzY/+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7PjgjOoPIn79dcehwmI54t/6L4wBBoa0m84RXRN81Pg=;
 b=kwp7+eMr0ZktJD8c+2XdRm8Owwuo7jDI3MjqKr5Rk568dmVkiIE5MWQ1cWZcTWKuowP2yH976WFXMEPsnWKJt1ocNW0xdkjMml/gdBTfBXTEDux2PgBh4+o34ky9CJUcBv9hiPh3WOgScXHN9dzXY68J2QYi5ieUVZgr7h/8JWWFciOZgwcdDFVq8Lg4uW1pxHMEUPyGCOGWCn8EwyEaJa1thkhQd5aMyXM6ua93GqIU9JCsDxTQrO3zeB/QOLizN+oWrIbgcEqXBuaVV7GPJs41Fd04/5cM7oPHkTfNLH82caJDvAom5usVNCtFgKLaHugq8nAMjGxM2Airouo2FA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.112.34) smtp.rcpttodomain=lists.freedesktop.org
 smtp.mailfrom=nvidia.com; dmarc=pass (p=none sp=none pct=100) action=none
 header.from=nvidia.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7PjgjOoPIn79dcehwmI54t/6L4wBBoa0m84RXRN81Pg=;
 b=stog+HaaPlb3GxW4BbXKqcfC3ADcm5TmaMazu2ZgeSHyMqMoMGA1PcBS3pHLp+AzSe/Az7nXyY46LSZPFQuP9GnwLneddjYrBTI3EDxeDcw5uTB2UbxACrro6mW6jB3biXwcfcrX71ZDkPhmSSIg9rl5j8kW48CHbfNG+WwSv+T7NtN4EURjelY2F5yhZ3Nuwl45UI1Ha1peoJNOE2QUqgxN264bE1bgGm4yGKL0nCvRBcey3Zf+uFBGcMPl0A5r1wOc5sWJMyS3IoTGjXXTrKo9V5hejVU2oWEa6X3rw4IC13yrEZWryDi+sth7krjFhuDOpMZNwcVTy2iB1a615A==
Received: from MWHPR20CA0018.namprd20.prod.outlook.com (2603:10b6:300:13d::28)
 by DM6PR12MB3257.namprd12.prod.outlook.com (2603:10b6:5:184::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3955.24; Mon, 22 Mar
 2021 09:20:11 +0000
Received: from CO1NAM11FT019.eop-nam11.prod.protection.outlook.com
 (2603:10b6:300:13d:cafe::e3) by MWHPR20CA0018.outlook.office365.com
 (2603:10b6:300:13d::28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3955.18 via Frontend
 Transport; Mon, 22 Mar 2021 09:20:11 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.112.34)
 smtp.mailfrom=nvidia.com; lists.freedesktop.org; dkim=none (message not
 signed) header.d=none;lists.freedesktop.org; dmarc=pass action=none
 header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.112.34 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.112.34; helo=mail.nvidia.com;
Received: from mail.nvidia.com (216.228.112.34) by
 CO1NAM11FT019.mail.protection.outlook.com (10.13.175.57) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.3955.18 via Frontend Transport; Mon, 22 Mar 2021 09:20:10 +0000
Received: from nvdebian.localnet (172.20.145.6) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Mon, 22 Mar
 2021 09:20:07 +0000
From: Alistair Popple <apopple@nvidia.com>
To: Christoph Hellwig <hch@infradead.org>
Subject: Re: [PATCH v6 1/8] mm: Remove special swap entry functions
Date: Mon, 22 Mar 2021 20:20:05 +1100
Message-ID: <13488904.3iE9EkMCc7@nvdebian>
In-Reply-To: <20210315072757.GA4136862@infradead.org>
References: <20210312083851.15981-1-apopple@nvidia.com>
 <20210312083851.15981-2-apopple@nvidia.com>
 <20210315072757.GA4136862@infradead.org>
MIME-Version: 1.0
X-Originating-IP: [172.20.145.6]
X-ClientProxiedBy: HQMAIL105.nvidia.com (172.20.187.12) To
 HQMAIL107.nvidia.com (172.20.187.13)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 400be08d-5f3a-43cd-a6be-08d8ed13b172
X-MS-TrafficTypeDiagnostic: DM6PR12MB3257:
X-Microsoft-Antispam-PRVS: <DM6PR12MB325797E4F4DF173B5BF601F6DF659@DM6PR12MB3257.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1360;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: C4uG3LeY5M3MA8lEsSXCTnNll2QeHbuRwIyZmLpR09/3PzJEZgxAv7bHsOjRTtH31hwTqIu2kLlHXBeEczQFdo8K/4aXQfDlNfMirdPb3SJ0xNxcI/4yVAI2RwJFpgKo6BdmJG7gGumTpVbyNbkTI/nFlCEt5dZ2ENpSBgy7U6AP2ZxG1hiVpmrlXQ3oyier34gNWhm4esrZCrobKGh/GUp6BbsH1Usmpe5FWKLqViqf8j1hz0xgINhUdMcsU9m49fkw+fUFCcLqY+yALdTyOHztTIdfXM9r3eO+uUQAMJjrk9UOuH7aNlcjwmzUpQyHOors2+2QXzxo3txs2pwl5rh5kj/JramWfmTDXLDG4UufRtRpTW429UYBOjU/ZlMkeTzLU4FoYh+y2/rthpZzMRtFUttizQDmmASwluCk7V/izwH9yLZBHu3PjPSExdTuZYjYU9P+MKf+5ReKPBduuObEsV5hfDmhlPFkHqVpOfmOIOSi4KtfGaB9JKKlkthZ7wjmsRQDiwifW+GYMD4vwXZz5efL2vzriY9pMp0LquELP+3uMaaDrLA6N+gTHcSR7x1UIvp90EpYBzHmjrRYSnEtBUbZamxV5fLqcEouyfYhrXB+9wgInBvCk/YwRJHtlRNFPlexgaf3+wbUUMo7g3u5RyNHGQczbqPWuXRFDabuvuev8Mp0mOhjjnq520vX
X-Forefront-Antispam-Report: CIP:216.228.112.34; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:schybrid03.nvidia.com; CAT:NONE;
 SFS:(4636009)(136003)(39860400002)(346002)(376002)(396003)(36840700001)(46966006)(9686003)(26005)(54906003)(16526019)(5660300002)(186003)(4744005)(47076005)(7416002)(426003)(82310400003)(336012)(36860700001)(2906002)(70586007)(36906005)(316002)(70206006)(8936002)(6916009)(33716001)(8676002)(86362001)(4326008)(478600001)(7636003)(356005)(9576002)(82740400003)(39026012);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Mar 2021 09:20:10.8948 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 400be08d-5f3a-43cd-a6be-08d8ed13b172
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.112.34];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT019.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB3257
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
Cc: rcampbell@nvidia.com, willy@infradead.org, linux-doc@vger.kernel.org,
 nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, kvm-ppc@vger.kernel.org, linux-mm@kvack.org,
 jglisse@redhat.com, bskeggs@redhat.com, jgg@nvidia.com, jhubbard@nvidia.com,
 akpm@linux-foundation.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Monday, 15 March 2021 6:27:57 PM AEDT Christoph Hellwig wrote:
> On Fri, Mar 12, 2021 at 07:38:44PM +1100, Alistair Popple wrote:
> > Remove the migration and device private entry_to_page() and
> > entry_to_pfn() inline functions and instead open code them directly.
> > This results in shorter code which is easier to understand.
> 
> I think this commit log should mention pfn_swap_entry_to_page() now.

Will add. Thanks for the review.

> Otherwise looks good:
> 
> Reviewed-by: Christoph Hellwig <hch@lst.de>
> 




_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
