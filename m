Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E57613ECE8D
	for <lists+dri-devel@lfdr.de>; Mon, 16 Aug 2021 08:21:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 85CE389C05;
	Mon, 16 Aug 2021 06:20:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2058.outbound.protection.outlook.com [40.107.237.58])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 46DE789C05
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Aug 2021 06:20:26 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dXmhcUBJJFvItf7hYWRy0Y7j6SSlyJhQUvRuzNzUHwu3Fc6xMrupXVqLVk51vS+8IftFv3sj2LBU+MExcxvjfk0aLJTIktzOQ0TWDeAoar3Bz8P3eBglsirG17C5XPkBsdtVIWRQArLnGoEKu/+F/vqZu+A9g02C1lYhtWD9ZzhNVOff6w+DLN2FBuhL9Y0/U0T/6o893zxrdw4q8jYFEXFtCK9gLrZK9x9DBs2tS0AnqMu9SpIImF37BTXzQVPLb9hJrxId9LFez5Jn7Nxk+N1t9DI8hbspfSVPTx5OMdTmW7KqSzGtg0OkOKy8ejoiHe2TFz7jtppAIhbGdvx+Hw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/TshE7TgaXf5I5ZRw43+fFuFwDoHlZ1BdgcjqkKX4Pc=;
 b=KYqqUjgLbihs+WBmTClIBpWANWWFV0fR23ViNCl6+wTqum4Zm8oUq0asyC7pNQuKo1fK7KNLzb8mBsn8QvsFQl9Cs+62zcri9EuQjf09a5sBC7y419UncAC0Unkvks/B9dlidXg15CV1IA3yVsMeyi6nVsHiuolOEP0IEFjfVmI+nRt8XUeWNBTJcKx3r8hHyXFT9VjP+9OvHwxCI1QRag/BHl4a6D5tP92sMKkkpC3xSRVwEqPmXi4Ooaa3BrqkJZ2LcshkM4e7JohOWBLuH7TQrY5KClpr2YLmBTc33L8Lpz3nGj8NQMj1+/rVXtiPr/BObYfZtWm5SBgCUDgbBw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=me.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/TshE7TgaXf5I5ZRw43+fFuFwDoHlZ1BdgcjqkKX4Pc=;
 b=QXc03eDBU8Eg9TLWEpdVWNmj3c/Ovbf+1N/L2phdEUcJXW3z7PKdtWk2myc5YmyEqiV9Sq3VoNKK4dXfRa5V3F2Z8O6GuRkq+e9cfZ6NwYNnXoEIjsdioaICJ+2jos6WjFljMWYQ9lhbGyu3dBmB0lDxla1uBd2W97ZL49T6eK4=
Received: from BN6PR22CA0067.namprd22.prod.outlook.com (2603:10b6:404:ca::29)
 by CH0PR12MB5265.namprd12.prod.outlook.com (2603:10b6:610:d0::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4415.14; Mon, 16 Aug
 2021 06:20:24 +0000
Received: from BN8NAM11FT046.eop-nam11.prod.protection.outlook.com
 (2603:10b6:404:ca:cafe::90) by BN6PR22CA0067.outlook.office365.com
 (2603:10b6:404:ca::29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4415.14 via Frontend
 Transport; Mon, 16 Aug 2021 06:20:24 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; me.com; dkim=none (message not signed)
 header.d=none;me.com; dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com;
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT046.mail.protection.outlook.com (10.13.177.127) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4415.16 via Frontend Transport; Mon, 16 Aug 2021 06:20:24 +0000
Received: from hr-amd (10.180.168.240) by SATLEXMB04.amd.com (10.181.40.145)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2242.12; Mon, 16 Aug
 2021 01:20:22 -0500
Date: Mon, 16 Aug 2021 14:20:18 +0800
From: Huang Rui <ray.huang@amd.com>
To: Dan Moulding <dmoulding@me.com>
CC: "Koenig, Christian" <Christian.Koenig@amd.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "jason@jlekstrand.net" <jason@jlekstrand.net>, Alex Deucher
 <alexander.deucher@amd.com>
Subject: Re: [PATCH 0/1] Fix DRM driver initialization failure in kernel v5.14
Message-ID: <20210816062018.GB1179183@hr-amd>
References: <20210810195906.22220-1-dmoulding@me.com>
 <20210813165014.31106-1-dmoulding@me.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20210813165014.31106-1-dmoulding@me.com>
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0deac57c-7704-40c3-be06-08d9607deea4
X-MS-TrafficTypeDiagnostic: CH0PR12MB5265:
X-Microsoft-Antispam-PRVS: <CH0PR12MB5265FF9E07F904960A07A46EECFD9@CH0PR12MB5265.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4303;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: AhvRbIVThcFCirBbbE78XGAgfRyQQUrIgViFtHWTrgAbcERyKNgdR9bQoJvf4NBfCAdMj34jMXQq4BRerSwaRbf9CmTDFiriuFJ14O+QrspyLa67lPo6x0OSdOi+LnJbEZQiC146wqj6Fa3L3SqF/RuJPRJhxu580NSoa/ypYpT9XVg1yPSy+fhjt7pztvzL17bk3rFB6cF7VjinAQHKcyXumOa8/xHYPilLrg/KdZPssj71v0o++lQWoz+4KtG97osQqr28rz4BITxmjnckFMEHGYz4PKzeZqlBPtJ+zkvFjPN4GfOzt/qEWAZuRvNu/mbk4Awoeniy7ZKxrXCoKVf8gPmUH+PgvZp7tYvEKkb3lcP3kH98ujowoWddKBI4lVxGa8625QbAsM7aa77lZIFFDFG8XkMMqOo9NGsVeA7u4SjOsh7D3lZOBGx3jj4XDi3ityMEuQrDMqox62UVwnVKgR/aR+oCoZoLH3LM6jBe9BBJIhysAUC4YfNro1TbuO2Qt9xw+agAk650Z/gjg2rFiQrYuUh556fTz9fh/JrhZX4y9UzZ2RGogGjFQoHieM/acva34U17ctG1d5DLYk/foTeeDXPlGvOYSFgDjDHwGh5AGIhNZovvzcEAonK9/eDExCKYtNPYwimILGrGRKub9akdVThc8j5eyCmiNdhQxfHA3URxLP5AROR0kEIFAwv61Ah4B0eKu1azMQurQwGrOq+dsjrHP5nIIf4RIfNNMqS6K2kSgWFT5KhqMPCH1QxUfYxm76ydCg6GKtAMYw==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(4636009)(36840700001)(46966006)(36860700001)(81166007)(336012)(5660300002)(4744005)(1076003)(8676002)(33716001)(426003)(8936002)(356005)(82310400003)(34020700004)(47076005)(2906002)(70206006)(6666004)(508600001)(9686003)(55016002)(26005)(16526019)(186003)(4326008)(83380400001)(86362001)(33656002)(6916009)(316002)(70586007)(54906003)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Aug 2021 06:20:24.0148 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0deac57c-7704-40c3-be06-08d9607deea4
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT046.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR12MB5265
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

On Sat, Aug 14, 2021 at 12:50:14AM +0800, Dan Moulding wrote:
> Just a friendly reminder that this fix for a regression needs
> review. It should be a quick review.
> 
> It would probably be good to ensure this gets in before the final 5.14
> release, otherwise this is going to be a very visible regression for
> anyone that uses DRM and does not use debugfs.
> 

Just took a look at your patch, it's ok for me. Alex/Christian, could you
help to apply this fix if you have no concern?

Best Regards,
Ray
