Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B717343CC1
	for <lists+dri-devel@lfdr.de>; Mon, 22 Mar 2021 10:27:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4CE0C89906;
	Mon, 22 Mar 2021 09:27:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-CO1-obe.outbound.protection.outlook.com
 (mail-eopbgr690060.outbound.protection.outlook.com [40.107.69.60])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9322889906;
 Mon, 22 Mar 2021 09:27:41 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JSxLdpusDg4c+eQ8ShMx8ygkenaDl0jfVzx6S2uVIuBR2uxLrLGsW1DSXOK6JYB1lhH+nQe4zvhrNhl9GC9GEYF5d0lLyKR1mwl4RRck7x3VeC6NiieR4w5yCLXQ1Bmj9dR8WGUxCfeg9bPZ6eDz2Ggq2VYmGYaCcsbdrlF80GyMtMV9k0ORqaDUlbWX5CP2aINBbm0Eh/xEG4ZeHyY6cAIBswNUVtwcZpOa6HHZVOGWXXZoMA4FToYm6GnnG1Eqw+x6eOwad6Qm6KopLxLz+57/5ZHi7KcKzF2QpqhxJ7ADxUved96zcE9AFbZtGGh70xWOqTuvrYsUxXF/2NwxYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RQstACXxhRbgfGic/9H1wBzJo+J7NBQEs2uehIvi1pg=;
 b=ZQQpxSkApnIrlsWxLnvNdCEmo3ZaAJqlNiJxSOLvspGcNNOR5ZxHxXKy5qCEafPr3XobXhnsYXcAeVqtQ0pfoYr0VJiI4jW8V3lcgHb60kRR7fUgLLtQBnsdRq2zwix41w7bqnSx24WsC60l9864vu1gganLCshRRvguBGxYmO5Voar/Hdol2DaFR1AQP0nKXb/kknBaG5a/GcpC81bJZ5SX8hEKbp2Ky5tWcCFFqyPhJJ6+ZUdehMx72AP+dMttdNJpcL8dndHyWZ7+zzCmzzSYjcqVl824y22DISFeR/kkEnhDn93Tc9LVcHgT9iW5/6KMBOoYMEM69YnGxIeomw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.112.34) smtp.rcpttodomain=lists.freedesktop.org
 smtp.mailfrom=nvidia.com; dmarc=pass (p=none sp=none pct=100) action=none
 header.from=nvidia.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RQstACXxhRbgfGic/9H1wBzJo+J7NBQEs2uehIvi1pg=;
 b=bINofUd9HjDpToHTpe34LlTWicLpbpI+MsNlI+wczeiIRXb1gwWmTh5bE/FDQWzXEBQAW0fNMIiSw4egcGmINMrYZLXLcmlgy4VB94Nx8Cd6wuNBNijTaoJum1e3f8XlqTa5G032U/CVr4MVizArimVobzUse6rWJ8J0XETfp8xdHCQSIxYMZM7COWkp+Q82E2xlzd4Vt3KinSHBhJ2PzMBYE5mJFJbBQDamfcXiA5/736bqXVY8Ylu9LKqnYNRR8UYy3m1+wZmcjwilje8rREiLw3OhITYylcgprCvVeM6Nr38HQU0wzG92Sjq2gN1Y7jTlquGJZ481aEsbt0GmbQ==
Received: from BN0PR03CA0013.namprd03.prod.outlook.com (2603:10b6:408:e6::18)
 by DM4PR12MB5200.namprd12.prod.outlook.com (2603:10b6:5:397::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3955.18; Mon, 22 Mar
 2021 09:27:39 +0000
Received: from BN8NAM11FT061.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:e6:cafe::9f) by BN0PR03CA0013.outlook.office365.com
 (2603:10b6:408:e6::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3955.18 via Frontend
 Transport; Mon, 22 Mar 2021 09:27:39 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.112.34)
 smtp.mailfrom=nvidia.com; lists.freedesktop.org; dkim=none (message not
 signed) header.d=none;lists.freedesktop.org; dmarc=pass action=none
 header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.112.34 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.112.34; helo=mail.nvidia.com;
Received: from mail.nvidia.com (216.228.112.34) by
 BN8NAM11FT061.mail.protection.outlook.com (10.13.177.144) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.3955.18 via Frontend Transport; Mon, 22 Mar 2021 09:27:38 +0000
Received: from nvdebian.localnet (172.20.145.6) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Mon, 22 Mar
 2021 09:27:35 +0000
From: Alistair Popple <apopple@nvidia.com>
To: Christoph Hellwig <hch@infradead.org>
Subject: Re: [PATCH v6 8/8] nouveau/svm: Implement atomic SVM access
Date: Mon, 22 Mar 2021 20:27:33 +1100
Message-ID: <6407817.nLXe9rGL3b@nvdebian>
In-Reply-To: <20210315075113.GD4136862@infradead.org>
References: <20210312083851.15981-1-apopple@nvidia.com>
 <20210312083851.15981-9-apopple@nvidia.com>
 <20210315075113.GD4136862@infradead.org>
MIME-Version: 1.0
X-Originating-IP: [172.20.145.6]
X-ClientProxiedBy: HQMAIL105.nvidia.com (172.20.187.12) To
 HQMAIL107.nvidia.com (172.20.187.13)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f89110f9-433d-47b9-ec2e-08d8ed14bc77
X-MS-TrafficTypeDiagnostic: DM4PR12MB5200:
X-Microsoft-Antispam-PRVS: <DM4PR12MB5200B43C5D71E47629643337DF659@DM4PR12MB5200.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: EYPmVZ8NVK1ujJIBvTl2wbBciwt6o3DmYWe5L3KyicneaumPZl4L1G2My+o+V+YDu/L+2wM2MDiMeXI8EKEUjDookQmr1g/656hqJd6c+xmtO7alvUQXhUVjAWf1lESpq63ncp16mgVeM2GKA5z/QaorVaaeYamoZ2TqpGaon7NJ8klCWuTpjKtRmSEPEZvZ2muPvag/bkoZ4Az9tn02yH2As9CChxRLSBWV5hHPSkH5Xr/eMGbRrhQQHg23KIhKTPHV9QwwHODMXvsSroc44vK0UbhA7MZLjXEI6N3oSrO2UmDhf40cCtlqwswbH9Tzwu2qtJF96bKdlblozePIGoimXSz57Vb9uOs6NcoQDRcZeVOy4lluEkJA4bSn67OMimudrv9LlXB+t/JDwDfxk8k7gImu7O0ua9pjg9CYNAxHeLWpAp1RdaT2eQ9ckwEXS1H/pwMzL5sjEYrW7bzjUTHxlZjphVTRXwqj2/wTamEk7K30vB9lpb8rUCT1aoaebr7N5B+uoqIT1dpYDd/yKz/aTiOVBmmKDFhJxmZX/CfcOWVh6el+OPugBh7gWsmPjIOZfl5kXIV8EWdUXoW4WA0hPO1nw33d9ZfzI1p6XoqJ5zBJe+g5NxC5qIjhjCRfIrH+eWPBx4A2Wn4LwJ555BRDyF3mTg9vUyFWinFKH9mceJXAhCLgTn21YkVHAKnr+qPJQ2j/JJ49F4ClzeAesA==
X-Forefront-Antispam-Report: CIP:216.228.112.34; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:schybrid03.nvidia.com; CAT:NONE;
 SFS:(4636009)(39860400002)(396003)(346002)(136003)(376002)(46966006)(36840700001)(4326008)(9576002)(16526019)(36906005)(2906002)(186003)(336012)(316002)(8676002)(86362001)(8936002)(47076005)(70206006)(26005)(426003)(7416002)(5660300002)(82310400003)(70586007)(54906003)(82740400003)(36860700001)(478600001)(33716001)(356005)(7636003)(83380400001)(6916009)(9686003)(39026012)(21314003);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Mar 2021 09:27:38.8350 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f89110f9-433d-47b9-ec2e-08d8ed14bc77
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.112.34];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT061.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB5200
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

On Monday, 15 March 2021 6:51:13 PM AEDT Christoph Hellwig wrote:
> > -	/*XXX: atomic? */
> > -	return (fa->access == 0 || fa->access == 3) -
> > -	       (fb->access == 0 || fb->access == 3);
> > +	/* Atomic access (2) has highest priority */
> > +	return (-1*(fa->access == 2) + (fa->access == 0 || fa->access == 3)) -
> > +	       (-1*(fb->access == 2) + (fb->access == 0 || fb->access == 3));
> 
> This looks really unreabable.  If the magic values 0, 2 and 3 had names
> it might become a little more understadable, then factor the duplicated
> calculation of the priority value into a helper and we'll have code that
> mere humans can understand..

Fair enough, will add some definitions for the magic values.

> > +		mutex_lock(&svmm->mutex);
> > +		if (mmu_interval_read_retry(&notifier->notifier,
> > +					    notifier_seq)) {
> > +			mutex_unlock(&svmm->mutex);
> > +			continue;
> > +		}
> > +		break;
> > +	}
> 
> This looks good, why not:
> 
> 		mutex_lock(&svmm->mutex);
> 		if (!mmu_interval_read_retry(&notifier->notifier,
> 					     notifier_seq))
> 			break;
> 		mutex_unlock(&svmm->mutex);
> 	}

I had copied that from nouveau_range_fault() but this suggestion is better. 
Will update, thanks for looking.



_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
