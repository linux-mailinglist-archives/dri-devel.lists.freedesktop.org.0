Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E0A6BA5B6B1
	for <lists+dri-devel@lfdr.de>; Tue, 11 Mar 2025 03:29:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4B94310E50D;
	Tue, 11 Mar 2025 02:29:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=oracle.com header.i=@oracle.com header.b="LyoxO2ga";
	dkim=pass (1024-bit key; unprotected) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="DvExvqpW";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com
 [205.220.165.32])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4293810E50D
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Mar 2025 02:29:49 +0000 (UTC)
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52B1fvcj021401;
 Tue, 11 Mar 2025 02:29:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
 :content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=corp-2023-11-20; bh=tqFeD7mIYRdpvLkCVM
 uiLZRytZbJF1U5FAZmk7Xrn0w=; b=LyoxO2gaQkRt6atcZh9TA05SOOeOmMDEfe
 H0tt8aMaKWEbxhVq+Q38FDrm0l3p/fq7Dlf/CBBV64oZ0pYTvTbu7Ggzevi3sVIE
 RYU83M8kAVHgQxAgpAWXE4sya0xklSqcvcKi8kcl1+UWiar/Y/B+ckypbvNVbsh3
 8zijtf9a4gK0ePX7czCx6eSochWRJRcW15D1Rsy0MX+joHuOP36hALqCMVy8Bq9G
 Z7oGUDCF3nwk3Vh5hONnr9jrd67cL0g0TDXYqVKZdSgbfh9h1jHOtDtoa5pDCANe
 wqTHYlqFWX8G4CervMi2d4Z+qli2F39x4r8DL6IV35QVl2YVw6eA==
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com
 (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 458eeu3wv6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 11 Mar 2025 02:29:19 +0000 (GMT)
Received: from pps.filterd
 (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
 by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2)
 with ESMTP id 52B010t0020152; Tue, 11 Mar 2025 02:29:18 GMT
Received: from nam12-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam12lp2047.outbound.protection.outlook.com [104.47.66.47])
 by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id
 458cb8dv5e-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 11 Mar 2025 02:29:18 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OtRlPUPL8APeW+iHXZAzWdUGaD+ni8MmC2XJeip9bDM9aNLP8qEzuot5CMSM4fa+aXESLe+kZfejn8GK5uJqmuyAKf5tDvJekFkA9nVRPMS/igYHQGy4ZZcHMPXvQWn4RASnx6FfKJmS/glhHPycZMILMTNYF8fLKKxATolWsIXx5uVk+87dBYXcGdHOYre6ki27vx56MQjL5GRO4XQKuEGH+NxvgIOgNhEZserxODjN7mfKsP8qf0kttB7xhCPICf+4FK8uk3p+TYqsKONP9YAvVcVFjDciyuI4JdIs7Vgk4XvPWVzZz/DzBCVwedGn2NVy9Y+MKDWk/r5VqMrlqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tqFeD7mIYRdpvLkCVMuiLZRytZbJF1U5FAZmk7Xrn0w=;
 b=JzrI9O6NqpnbSp8A0xjIpN063+eeeHshlHC8W5ECwGNiBAs0N2WedMbDJhOUPbVmQEkt6jYKucZWbG9GoFktXvTED0oFwWaOtkK4J62rfaz79cCAdhWX4GeNOItiaOEVTm4e5mVmkpGgK1xcFaHrSum0qb7MT9NWaYETee4ps9cBfBlqbJ5fjHAqcwRQQViE2ZSOS3AS3jp9wLpIoSo4zVE6/59EgIjW4b0r29L/8iudDn4Ezge2+kDKy3rbrgvA9Ct20YNrFBr/83W22H8GF+XzAV477rDHKCMUbWiKnavx6FtC5LejTQ9dK4q6UUyaToCOCMDrpJH9CdmmOrziCw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tqFeD7mIYRdpvLkCVMuiLZRytZbJF1U5FAZmk7Xrn0w=;
 b=DvExvqpWiLV2gEAFRYSzJn4Gixqrg5uW3Cyr2/RQqUI4D8LAp0lBxizRBzLd8a0DzOv2Y5cmNBLhckDAHRkFbXBWP9g/O+XYX4UrL9s2w5vgMxzA7d9nZwicyIoZXt4p9AZJ7ijLdhK9srWNwFH9ybyKU04Fw1smDGcz9L5Fks4=
Received: from CH0PR10MB5338.namprd10.prod.outlook.com (2603:10b6:610:cb::8)
 by PH3PPFAF33AAF2A.namprd10.prod.outlook.com (2603:10b6:518:1::7c0) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.27; Tue, 11 Mar
 2025 02:29:15 +0000
Received: from CH0PR10MB5338.namprd10.prod.outlook.com
 ([fe80::5cca:2bcc:cedb:d9bf]) by CH0PR10MB5338.namprd10.prod.outlook.com
 ([fe80::5cca:2bcc:cedb:d9bf%4]) with mapi id 15.20.8511.026; Tue, 11 Mar 2025
 02:29:15 +0000
To: Andrew Morton <akpm@linux-foundation.org>
Cc: "Martin K. Petersen" <martin.petersen@oracle.com>, Yaron Avizrat
 <yaron.avizrat@intel.com>, Oded Gabbay <ogabbay@kernel.org>, Julia
 Lawall <Julia.Lawall@inria.fr>, Nicolas Palix <nicolas.palix@imag.fr>,
 James Smart <james.smart@broadcom.com>, Dick Kennedy
 <dick.kennedy@broadcom.com>, "James E.J. Bottomley"
 <James.Bottomley@HansenPartnership.com>, Jaroslav Kysela
 <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, Chris Mason
 <clm@fb.com>, Josef Bacik <josef@toxicpanda.com>, David Sterba
 <dsterba@suse.com>, Ilya Dryomov <idryomov@gmail.com>, Dongsheng Yang
 <dongsheng.yang@easystack.cn>, Jens Axboe <axboe@kernel.dk>, Xiubo Li
 <xiubli@redhat.com>, Damien Le Moal <dlemoal@kernel.org>, Niklas Cassel
 <cassel@kernel.org>, Carlos Maiolino <cem@kernel.org>, "Darrick J. Wong"
 <djwong@kernel.org>, Sebastian Reichel <sre@kernel.org>, Keith Busch
 <kbusch@kernel.org>, Christoph Hellwig <hch@lst.de>, Sagi Grimberg
 <sagi@grimberg.me>, Frank Li <Frank.Li@nxp.com>, Mark Brown
 <broonie@kernel.org>, Shawn Guo <shawnguo@kernel.org>, Sascha Hauer
 <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, Shyam
 Sundar S K <Shyam-sundar.S-k@amd.com>, Hans de Goede <hdegoede@redhat.com>,
 Ilpo =?utf-8?Q?J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 Henrique de Moraes Holschuh <hmh@hmh.eng.br>, Selvin Xavier
 <selvin.xavier@broadcom.com>, Kalesh AP
 <kalesh-anakkur.purayil@broadcom.com>,
 Jason Gunthorpe <jgg@ziepe.ca>, Leon Romanovsky <leon@kernel.org>,
 Easwar Hariharan <eahariha@linux.microsoft.com>, cocci@inria.fr,
 linux-kernel@vger.kernel.org, linux-scsi@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-sound@vger.kernel.org,
 linux-btrfs@vger.kernel.org, ceph-devel@vger.kernel.org,
 linux-block@vger.kernel.org, linux-ide@vger.kernel.org,
 linux-xfs@vger.kernel.org, linux-pm@vger.kernel.org,
 linux-nvme@lists.infradead.org, linux-spi@vger.kernel.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 platform-driver-x86@vger.kernel.org,
 ibm-acpi-devel@lists.sourceforge.net, linux-rdma@vger.kernel.org,
 Takashi Iwai <tiwai@suse.de>, Carlos Maiolino <cmaiolino@redhat.com>
Subject: Re: (subset) [PATCH v3 00/16] Converge on using secs_to_jiffies()
 part two
From: "Martin K. Petersen" <martin.petersen@oracle.com>
In-Reply-To: <20250310190803.aaf868760781c9ae3fbe6df1@linux-foundation.org>
 (Andrew Morton's message of "Mon, 10 Mar 2025 19:08:03 -0700")
Organization: Oracle Corporation
Message-ID: <yq1wmcwnw1k.fsf@ca-mkp.ca.oracle.com>
References: <20250225-converge-secs-to-jiffies-part-two-v3-0-a43967e36c88@linux.microsoft.com>
 <174165504986.528513.3575505677065987375.b4-ty@oracle.com>
 <20250310190803.aaf868760781c9ae3fbe6df1@linux-foundation.org>
Date: Mon, 10 Mar 2025 22:29:12 -0400
Content-Type: text/plain
X-ClientProxiedBy: BY1P220CA0003.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:a03:59d::10) To CH0PR10MB5338.namprd10.prod.outlook.com
 (2603:10b6:610:cb::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR10MB5338:EE_|PH3PPFAF33AAF2A:EE_
X-MS-Office365-Filtering-Correlation-Id: 24bdb8ba-d380-47f4-4153-08dd60448485
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|7416014|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?miNS8jRlGSyPGCyDWQw54ZoHWlxmyd6vOWYdyGTCyV/lj30JiQwTraS4M5Bb?=
 =?us-ascii?Q?f7sQUtwsxn1Ei4G7C5TzQE1+fT/+nLoRSWVuf4XDwJwFJ+Nfp9jyrfmNI3OJ?=
 =?us-ascii?Q?ZgaOcHANxKIZco28TEaTYdddTFnTLWfaYovDIGpLNYPNcyI7zULJ5kyDLzNm?=
 =?us-ascii?Q?j12B1QGfP7bLnmfdRbuJtGzk0XhH3CoDW996iDWHigj1qB6tFaEqr5k3o7Qq?=
 =?us-ascii?Q?vNLKU2NjOV2VifB4I7gaa6CSD3/LAFA9uie57KifDG81nGbFi5hXNMqnvNE7?=
 =?us-ascii?Q?r3gSbzoyt6PVz2BbOMbq/93BhjDRJ5HNpNuEpR/gqznL4ZNtDnODMUKspXix?=
 =?us-ascii?Q?uGoo3r4W4E0XqqXcFpZjwM/HjCQJtOenxdHZ4ypdCvA7RLqIOF63SEdTd2KF?=
 =?us-ascii?Q?zgTJNqHEcmro5gVU0xhspf5IjaT4nYhP/AgQzJwQhJOwV0hE6YQn76t4nrK+?=
 =?us-ascii?Q?Xy4ebp95OqyMMP6ZLNUmyxzQuJxYTk9j2WISH6rsi1Gw1icE8YxK3I8Fd5Jx?=
 =?us-ascii?Q?Ktnjdsac7NH7rwV0/W2Yoo/C0a+cW2yvzqzjK0RfO0yT6bQdql4xcKEcNpfa?=
 =?us-ascii?Q?EQyEipXXg0W0V87mU+aeaZHhFDODn1vgwAXvRKtcN4+09IYjCufDpqw44SuF?=
 =?us-ascii?Q?BCrnwnOV9EKIKMnT8XrAp7VqZV/m5otPw3ijfLTcY8C+nbdp+tV6YBtL87mp?=
 =?us-ascii?Q?5BbuIOpTXofp10o2s3qezqQ43Su8n1l4E6qWLyfuAxEL1d/tfnSKwXpgjgHg?=
 =?us-ascii?Q?XOAUPzjnfpsQCAyrSIKqMncrb5dATHUFZfe3Uv9xwkDnRhWv3eJvX5PVmxqi?=
 =?us-ascii?Q?mnpYSm26UnFw/Y7316noZ4kIJmCPamMAi3Qb4FcsvaL4hvSIm1gNYQQvyLL/?=
 =?us-ascii?Q?tJAdzf1ffMJqahvSGDUMU53/coXdfheDiX9eeo56eBKQGcwnBkryQq5IaS7A?=
 =?us-ascii?Q?WaN4Lh/sBJZniZHtBmswTcZ5QlE9q/JQhlJA7FUpyYKfdXscT0XOd4Qoa6iu?=
 =?us-ascii?Q?aCogdVyvmSujgNKQEmPe5TDwMr5YPVmFpcvncl03BkM1Jr7qn33cwE/3OqpU?=
 =?us-ascii?Q?MGm095ZF14TnNAIHkQ5eNEJX+hoDAru8auoAt4/nhcpG5Slu7QPme6j4rfuA?=
 =?us-ascii?Q?eHh31BqsCbLSgbexbenxvi3pgWtXbclJWEUXiH31ox6lo6FO6OrrbZcB7Y0I?=
 =?us-ascii?Q?d7ufWR8l/uVuc1F2zWjxMlbm+hasZLbEIE2hB5Bk576DrtHiHSrwNsSpfLx9?=
 =?us-ascii?Q?G5iCk6sGyHgCgxBM7u2M98P0xVD5ylb+Dd2uaQeX8mXeIURnMgq5h9myGA5D?=
 =?us-ascii?Q?kq+qTPp2Fq9EZ39b1arqzGLZCuXq1kSnxvp7x3XfAsRjeCfaKHNCIhz9rErn?=
 =?us-ascii?Q?gStfhoWNt7XBTof7+jC+wY+M0zzB?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR10MB5338.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(7416014)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?tetoXBIFiXpETEk31phOe40dVggTdp2pFf1ck713UAuPkMSDISTXCBynHl1r?=
 =?us-ascii?Q?OQpufwsGqYuHgdzDr2GVs8lhNTXb9UA2Uoi+Cvm1LKX3qMp74eZxevbEbrbw?=
 =?us-ascii?Q?gCt8E2GvAEUwKZGcth+7VJ3RvTy2aicGj7JyN3eO49xsxCBM9OBCQkmp7LkY?=
 =?us-ascii?Q?GAqqT1QCpT9t9WvXmyZ/TU5M2hm2pPDkbk5naIGnRum55bz4QaUBac7DblXG?=
 =?us-ascii?Q?D28hr2fY53qdJ4Sqgz8/s1wWwtQn0M1zAJ/zbSv+GwSe6QYlziuh+xjmm55n?=
 =?us-ascii?Q?QND1d+q4YKuW+liAHSxjFAS4TiWt8a8l8MnnH/IH0ZqTX5RTnt6LkG7xlLxy?=
 =?us-ascii?Q?J8bX2CySsa3EnMt2tkgq86s3MdSNBP+iOvpkOOxk9e13K5r/NN59GGktc0e6?=
 =?us-ascii?Q?mcc+a5+ZWqSQ9RH19LEW0vlzf4pU7vuaXGyxUfrcp/ABoQKHyn/i99nmQ1sy?=
 =?us-ascii?Q?QVT6f491ylrrPg7g+AF6uiPSw86lca8vi8DS9ljmLSitfzIg2xMKekN7n5xn?=
 =?us-ascii?Q?ALfY3VYL/6tBCJE7KPF69m36mWhY71q2j3YS6Ykof6mP5TumJssE7V5cw07b?=
 =?us-ascii?Q?3G2TzmtWQuQpzNdxK1RC01nAV3sfuruwfzXIbX8Pv3SsZTNLocT0ndl0skEn?=
 =?us-ascii?Q?KFlcclm//xLjxeUvGkAvHmE5Hvytz6Og43lwyQZX7+cF50sMqgjs7Mtxxf0u?=
 =?us-ascii?Q?71iVr6DRr4k5PYvbWamTzxGL622HLd1TaMHgmnNmNnxMIyfJxcKl8qyJPV4Z?=
 =?us-ascii?Q?rx2p+RG97X7u6q8CsMSnrH7p2j/k+OD8RgEGEV+zEURMkPV/taZ59/MHdH/u?=
 =?us-ascii?Q?0dDJxStWVpM6FeW4R5esLnFUFnYedIfgXoi1wVbxIavCfTkhxVrRFGS7qNqh?=
 =?us-ascii?Q?slpT71Jc3ZKYUZb86sg2Hs1LsEsRI5wgkyqle+V/YGNfcRXYSC5Q6A/cfbbq?=
 =?us-ascii?Q?9YbD1QLMVsrZ29wvReaJ9qyGucJ5CW/auD9c6DuwjFstPvw56SBOrebx9Bt1?=
 =?us-ascii?Q?i+/43urEFlcOmJd9F/4TwTyXVP77vEEG5li+cyeyWyvnvnTGlldKqj8GToNx?=
 =?us-ascii?Q?e2jnWaHrcarTDDH5U3yfntxRMBV+fr1jskU9GppHdIQZI7x2tC6wX0KCHTnQ?=
 =?us-ascii?Q?2M9Y78LsXhFIPFn4X/r/W4PPf0BRgtWJrf04NUQnJwTTJzCiYC4fGM9IxCYB?=
 =?us-ascii?Q?91bHI+LOTVkDqUyZlto2qWJyj2wyrGP/RiBw6vSh5LD+cfv7M1+ky+FlQRV0?=
 =?us-ascii?Q?NXoMvrWW4wjYGOsB0mY+3PRuzOxH4sZbmmCM3VjQR+lp8yUg4HM1jlFe3SvI?=
 =?us-ascii?Q?auGw907hC/la5NCWMijHl+1vf4azcAJVphOwl2uCzlSzEL3M378OohsDVQFW?=
 =?us-ascii?Q?Xg7AlWGZ/tbigCKElXDNTgFj1q2odYXCZ/b3boiuU25hn/o5eu5u+KMDYJwj?=
 =?us-ascii?Q?fLh9tZcN5agGB44Nus5mVNWaXGlF7FCqNVlX1UWVR/SlW3YrMxaTr9lGNk4z?=
 =?us-ascii?Q?vjZEtdBSiTYIt9FwLzz3D2S0jzkE80vw6I4fgZfd5/Dg0+sNHnJGILvGXezv?=
 =?us-ascii?Q?c9xgitft/Xl2LoPpa1k5JxHbXKUZ7Z0dl3Fm7ITSKhKHRL4Vc4cMDfa0tBY2?=
 =?us-ascii?Q?tw=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: jIBhPqEtbMIzsCbm+wWqMW0mNl+hLZk7OStywOA6LaJwq5ZivrzcNkZQ2XwiJQaTAWCgR5NrmAsqH9qBGInGw5y/uKR87O9EOL6dNCB13gRnkpv36HOSICEVniQYSNmpHuej8KqJ05kAvNoQxs1EqGMorNMvCCNiGZ7nWwbOe0HNqNm81KOQWuplL3+4xNuZ6rR5KdLVVt39BTI80tGIHLmawKVh9fqtSbsV/nVg/6r2ViMH2809IvNjViV7yil5SBzuU3oEBsSyhU9G0yJblEGLU79IG22U6jsDwwO3yS8u07FSW6nVHHD9so5ssbr5hanP3iEAWBRish07XKCNhww0RrlqxhFBuXScrywpG4wcaAPsWSJNqp87kQG5jGhva1gnEQsQtcaYagAJpAHyk5BiTz9TjXtXD+Xdrv/X0qKc49YXImAKDatX6dgvhFpxdiB82SUgWiyhzMElndrzExNxVJBqIOr/UYlucNxu0yR7HPawU3AuhdHk3wQ7uEmDLHrzw5HxHuBsluaZGuEBuPJdd782GYbViI+JZyAFi4n8C5BtmmWKAdnw3XueoCNxMr/xwJqNPAPYg/tpY9T0wZ2lE7Xs76jCZQCBP+f3D/E=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 24bdb8ba-d380-47f4-4153-08dd60448485
X-MS-Exchange-CrossTenant-AuthSource: CH0PR10MB5338.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Mar 2025 02:29:15.5888 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: h2BEULhv1mmEhVd2TvZX7+YTUHhOzQNB5EYsZ7oC0gAvsnJ22fqIOfmZ/26+s3eFdWu+tSaYSQCNv36ctsNk9/CGkw5bxVoGDdUYKe23kqM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH3PPFAF33AAF2A
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-11_01,2025-03-07_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0
 mlxlogscore=927
 suspectscore=0 phishscore=0 adultscore=0 bulkscore=0 spamscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2502100000 definitions=main-2503110016
X-Proofpoint-ORIG-GUID: v2kP1NyYUbmIhHNEMbAtzo1Ha-jyPSgI
X-Proofpoint-GUID: v2kP1NyYUbmIhHNEMbAtzo1Ha-jyPSgI
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


Hi Andrew!

> Really, an acked-by would have been much easier all around, but
> whatever.

Hard to keep track of which of these kernel-wide series go through one
tree and which ones don't. I generally err on the side of picking up
things which may conflict with driver updates in my tree.

Judging by the commit message, I did notice the missing parenthesis.

Thanks!

-- 
Martin K. Petersen	Oracle Linux Engineering
