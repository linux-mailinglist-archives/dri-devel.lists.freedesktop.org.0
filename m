Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C1BDA4D178
	for <lists+dri-devel@lfdr.de>; Tue,  4 Mar 2025 03:12:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E208410E19B;
	Tue,  4 Mar 2025 02:12:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=oracle.com header.i=@oracle.com header.b="bLvvq2GR";
	dkim=pass (1024-bit key; unprotected) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="iLF5tb4K";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com
 [205.220.165.32])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5807C10E1A4
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Mar 2025 02:11:48 +0000 (UTC)
Received: from pps.filterd (m0333521.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5241NNMT017408;
 Tue, 4 Mar 2025 02:11:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
 :content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=corp-2023-11-20; bh=btDV4ppvtC97SDL88T
 adt2S0/80U6CObJHZY0tXAoCU=; b=bLvvq2GRXibq3664FbYfVltKTgsWdHaGwa
 52qOfSsSMq3IYzH6nQ8foBIKYM1ZTeANjeYj/zr3IKWpIQBZHiN0he0aS4D4uJpA
 oasLnuqKa4MvMTbihykaHXWx4aFHdgH08OF8G/CoXbM+UhTLMGQMfe2YMpkYEUjc
 +9Hrco3ypGlS+Y8jkgZqu/nX0vuamK/Y3YJlVaG91cNf/qYuo98NMMa8hJ3EZQc7
 fcREpxjTK+Z8M17LoW6dW6QcyU7J/6yVZ5jxuzMorBb85XahyBj5XDYH5JI3Lsze
 /bfLTDUMi280ppv6HHurWw2jSpiso/6dknQyfVVYu67i2UxtlXOA==
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com
 (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 453u9qc2kn-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 04 Mar 2025 02:11:21 +0000 (GMT)
Received: from pps.filterd
 (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
 by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2)
 with ESMTP id 5240vLfM010984; Tue, 4 Mar 2025 02:11:20 GMT
Received: from nam10-bn7-obe.outbound.protection.outlook.com
 (mail-bn7nam10lp2044.outbound.protection.outlook.com [104.47.70.44])
 by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id
 453rp9u882-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 04 Mar 2025 02:11:20 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=D3OnGnuHCLOHIa1OtA5jbPtJM8+ka+JvudW+M32g086O7kicw7S//x0oMT+htXBrxdq+J2AiOG9e7LIje5cubrKdjRnFyBJPir0lc0I3OOpyNgvJw5ImADqiLZWsBcm5sCnRp2vWMqd0IgChJ0ZhW/zW0P8J4w96h+/0pudiIsZh2NYns0I1ZgHjyvZ/qnm41fJW2UhIt04auyQz/VP4H+50gvEMnx9mSetNZf1kTDFYEQ0VI3CKDcfBByyj//tnh5un2WRjnQxXduhNOL3hdW/byz9hXvVstmsrtXg75Aqc7BsIDSJkHp7rCNg3yJtoAdyfM84M9ossgJo7uy9tMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=btDV4ppvtC97SDL88Tadt2S0/80U6CObJHZY0tXAoCU=;
 b=YteUOX2U1V1h/+wHhVv3x4OdzoOAlry5j1oWnX5bC7vIYgqkQWZLRBidG4Kq/Au9PoxujAynR6wsPlF6OA4raX7AcbnRkVqBPy7ZUUBUXT2CDIAlSSCb39UGIxpWGkRDvwF9s2upWoyXpvng0LjYhbv0UprvuKcAN9sa/Gbp6O+z357ARWPla3hco5j7Uwanuc40lsn4Z4illm6OKstZGWgVs55M42vwTe/3lX8tkS2SM4KGIvODQ6aRqn77t+FhJzpRVor9PbnBYtN1ZUp9V2qeRkGeSwt8Ig25jmXgmoRjbwtuU7z4n1BdZYgywj/NTKyfMpHHoh0pTeN1jdl+Xw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=btDV4ppvtC97SDL88Tadt2S0/80U6CObJHZY0tXAoCU=;
 b=iLF5tb4KEK7ymS1wB+6kq1WCOhXpylbvj2hYilemS8QZmACA1ULpxfyDOiU8zqpSK0ULIA+MmietFeh8Q+gb2nERNPy6/VlAi9f48jL8eDoV0NCI3zMsQwbeJC3y1sgHSJGh8KMuaNr0dmyVif2BxRy3F/pfPKjy/BnX6z+YScM=
Received: from CH0PR10MB5338.namprd10.prod.outlook.com (2603:10b6:610:cb::8)
 by BLAPR10MB4964.namprd10.prod.outlook.com (2603:10b6:208:30c::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8489.28; Tue, 4 Mar
 2025 02:11:16 +0000
Received: from CH0PR10MB5338.namprd10.prod.outlook.com
 ([fe80::5cca:2bcc:cedb:d9bf]) by CH0PR10MB5338.namprd10.prod.outlook.com
 ([fe80::5cca:2bcc:cedb:d9bf%4]) with mapi id 15.20.8489.028; Tue, 4 Mar 2025
 02:11:16 +0000
To: Easwar Hariharan <eahariha@linux.microsoft.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, Yaron Avizrat
 <yaron.avizrat@intel.com>, Oded Gabbay <ogabbay@kernel.org>, Julia
 Lawall <Julia.Lawall@inria.fr>, Nicolas Palix <nicolas.palix@imag.fr>,
 James Smart <james.smart@broadcom.com>, Dick Kennedy
 <dick.kennedy@broadcom.com>, "James E.J. Bottomley"
 <James.Bottomley@HansenPartnership.com>, "Martin K. Petersen"
 <martin.petersen@oracle.com>, Jaroslav Kysela <perex@perex.cz>, Takashi
 Iwai <tiwai@suse.com>, Chris Mason <clm@fb.com>, Josef Bacik
 <josef@toxicpanda.com>, David Sterba <dsterba@suse.com>, Ilya Dryomov
 <idryomov@gmail.com>, Dongsheng Yang <dongsheng.yang@easystack.cn>, Jens
 Axboe <axboe@kernel.dk>, Xiubo Li <xiubli@redhat.com>, Damien Le Moal
 <dlemoal@kernel.org>, Niklas Cassel <cassel@kernel.org>, Carlos Maiolino
 <cem@kernel.org>, "Darrick J. Wong" <djwong@kernel.org>, Sebastian
 Reichel <sre@kernel.org>, Keith Busch <kbusch@kernel.org>, Christoph
 Hellwig <hch@lst.de>, Sagi Grimberg <sagi@grimberg.me>, Frank Li
 <Frank.Li@nxp.com>, Mark Brown <broonie@kernel.org>, Shawn Guo
 <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam
 <festevam@gmail.com>, Shyam Sundar S K <Shyam-sundar.S-k@amd.com>, Hans
 de Goede <hdegoede@redhat.com>, Ilpo =?utf-8?Q?J=C3=A4rvinen?=
 <ilpo.jarvinen@linux.intel.com>, Henrique de Moraes Holschuh
 <hmh@hmh.eng.br>, Selvin Xavier <selvin.xavier@broadcom.com>, Kalesh AP
 <kalesh-anakkur.purayil@broadcom.com>,
 Jason Gunthorpe <jgg@ziepe.ca>, Leon Romanovsky <leon@kernel.org>,
 cocci@inria.fr, linux-kernel@vger.kernel.org,
 linux-scsi@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-sound@vger.kernel.org, linux-btrfs@vger.kernel.org,
 ceph-devel@vger.kernel.org, linux-block@vger.kernel.org,
 linux-ide@vger.kernel.org, linux-xfs@vger.kernel.org,
 linux-pm@vger.kernel.org, linux-nvme@lists.infradead.org,
 linux-spi@vger.kernel.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, platform-driver-x86@vger.kernel.org,
 ibm-acpi-devel@lists.sourceforge.net, linux-rdma@vger.kernel.org
Subject: Re: [PATCH v3 02/16] scsi: lpfc: convert timeouts to secs_to_jiffies()
From: "Martin K. Petersen" <martin.petersen@oracle.com>
In-Reply-To: <20250225-converge-secs-to-jiffies-part-two-v3-2-a43967e36c88@linux.microsoft.com>
 (Easwar Hariharan's message of "Tue, 25 Feb 2025 20:17:16 +0000")
Organization: Oracle Corporation
Message-ID: <yq1plixv94t.fsf@ca-mkp.ca.oracle.com>
References: <20250225-converge-secs-to-jiffies-part-two-v3-0-a43967e36c88@linux.microsoft.com>
 <20250225-converge-secs-to-jiffies-part-two-v3-2-a43967e36c88@linux.microsoft.com>
Date: Mon, 03 Mar 2025 21:11:13 -0500
Content-Type: text/plain
X-ClientProxiedBy: BY5PR13CA0008.namprd13.prod.outlook.com
 (2603:10b6:a03:180::21) To CH0PR10MB5338.namprd10.prod.outlook.com
 (2603:10b6:610:cb::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR10MB5338:EE_|BLAPR10MB4964:EE_
X-MS-Office365-Filtering-Correlation-Id: 4477a3e9-1c12-4e9c-6031-08dd5ac1d872
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|7416014|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?fkuNL2W/44rIQ36y3j4VyYZzmNHoyrz+X7QmvP+wCWjDBcP9CO6hUjimURrs?=
 =?us-ascii?Q?/2yIlKh6BROK1BzDf5c8KYUgO4ODG17maaX3V+8F0W5JMfjBvizI+JjvQ1BN?=
 =?us-ascii?Q?f3Gv7o1QEXMxEKdOrbcbnd3xpEbW34JBZzb7+UFvnRZnhAddGKX12LlMQUju?=
 =?us-ascii?Q?HUrPxd2sL3G0NFSNgbUtXAxmzs1GAQVc+T4NdtvD03tzo/YZ06dc/YInEuO2?=
 =?us-ascii?Q?r94Oqq25HIOR5Q7Wb/16W7LfqjY/3nrSj/jOlGDvYXKxPmusNQM/t6H4GZm8?=
 =?us-ascii?Q?HorTJKJ4MeNEQrahYDJbOyQ5JO8LX1CIR7SSdc+ImIIvZh+7W50OGJL7q4N/?=
 =?us-ascii?Q?Pg5tyhcHADXcJkLh0KXV+ErogP2oFHFbQtnin4XJBpro5Vvu3eTQpEUpGuwR?=
 =?us-ascii?Q?bn9ejvLe7CleNxZYqgu/rCNb/FxFlnaytLxku/h3GIFfkYZC99TOcm4u1Og6?=
 =?us-ascii?Q?FW3zhgsnkH/6eW8d9OFRvItfzJf8mWPxm0gfU3yJPJ9HApMhU1r80BHDdbT5?=
 =?us-ascii?Q?t5xKKUQwly267yC3RAesEYpWPtjz1j+vRFwLgZyGqMwUpCLmTZ1ud6En/qru?=
 =?us-ascii?Q?8LF70T3Cn4IqqyZMK5HX2vfirYBD1ovSH8S/T00OHF9zbfGC55hrDhnHW3hM?=
 =?us-ascii?Q?h+ZgSmMVBzICA4u65WJS1ta2keojmVlLIzmQfKM0nOzdMmMXal/QIhiurLKj?=
 =?us-ascii?Q?Qlm0u5Qk/q9MBeYsR+idO41gAM2CWeCIsnSEZIWOqqTI2Va7hlFzzD/AS5qB?=
 =?us-ascii?Q?jhEBlvJfqpt+Tbq/uv3w7xW4gtWS0mL8VwWo+mFhwkIjF9lOFX4fewbPc9El?=
 =?us-ascii?Q?rUMRD3l5KTjJIBU2qS9G5QRzoeeNvtUKtqZ+5YYE9LOP3XOIy/lYY9EkBnTy?=
 =?us-ascii?Q?5sTxQ2f/li+X9Qz8+Y2+glfOImfvp1rlE6UJ5YxI2PPoPCznwMUVlJf02fnq?=
 =?us-ascii?Q?cYFbe1FCH1oe9doptdgv57xuVsE8jkeyWy7x6KR81sp1VQ84S/aQPIMrf6cn?=
 =?us-ascii?Q?xrCCzAedoxvyKi2HWQnUKTjgkyX7AD+UyBMpReuOQmFvoIQvCGOM3EwjGWvH?=
 =?us-ascii?Q?tH7v2WDAAYOY3cGFyJ4A7psTUDQIKxQw+/bP2X9O6d0Wf0MwZOs3IH8ptc7N?=
 =?us-ascii?Q?DLtnZxSZ08BkkrXP3Tre7YP5Nc15h4sya+1KNTAC84anXhctkJZnHonJQKQU?=
 =?us-ascii?Q?nhHpB6mWkQpdThfhzdeAvUl6DZyvi7hhHEJUPhhH1LA0rz75jx3j+2eEI66z?=
 =?us-ascii?Q?hFikRN/EFBg4nxiicwTNO25oqhQG9233C0jUAPYcRYmOO085mPzemBtq9yjn?=
 =?us-ascii?Q?0by2iocuI4stOf4CwEPH8kDgsl0j5khXTrtEsotCNO5kqX6HBuM2OQpmznOC?=
 =?us-ascii?Q?/4fE9ubocMLYibmBoM894mO4x8KU?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR10MB5338.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(7416014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?F6LDMBO3njMdYHS+V34aVtKp9FBPYV4i6Du7LViu+khaKyDQ4rCyQr3kkjjl?=
 =?us-ascii?Q?TI8d0EDr7unCjwnKYFGogJyRHNH2/tVJW18E7SImWz4ySUniKhad24YZ2DSN?=
 =?us-ascii?Q?qjwD3N+nZBsXeBcVMC0HX7Fh/M8Q+6Gq3+cBzWMTejP1yCB4t7R32ID+p+em?=
 =?us-ascii?Q?HB4ElBNbGDWoZ7nd4YOhuJNs09Alt8BObJ6Rz6Qt2pV4RQSMA9DcGuwBtVp1?=
 =?us-ascii?Q?NrMSX8YnZrQPXYHs4fP7O2GbvQGZD4nJq4cU2vdwDlYXDA/l2J2QJZiCTVuw?=
 =?us-ascii?Q?Dni/1Pb3xycYct1sZQ0UYy+j5y6geY3qoyqHxlNDVja/oqPx5XChRmRc61VK?=
 =?us-ascii?Q?OUtmwTMZySI/WgbL5KNQd7+duavQNs1q6e0Y3lYYOPP4aBVeUpAN/ffPmYdK?=
 =?us-ascii?Q?Qrh7qUCwOD3dWE7VPWHhf197gD78OUR8ptGmjUDOaJuVjRQC3ItUWunkr+ME?=
 =?us-ascii?Q?uNZx9vXMH9FBY5TKkdq65skrWtrC0UmTcFlq7QCA9k2WUXyXL5QGW9qwsZLs?=
 =?us-ascii?Q?15eQQzSbFJIqwYozD8t7muFr2nEtzm6pqqwbtwB++6o9AwSmf0xzJwXsbFuj?=
 =?us-ascii?Q?/ySZ2tzFOdfzZUkukQM5poR7T4JC4OIBuuyJ+onazDU+/5eQTQ1ioxP19ugD?=
 =?us-ascii?Q?A+h+GP0PtBfi9zyGGfVjNLrWy97ff/tu+fMIVPMT7AIiusc7aUC09+BvCi0K?=
 =?us-ascii?Q?cBq7rWTRENn/XBpIjxFC2w9uT1FMaFBaREovnhcFZY75FxRgmpPFA+rGwo88?=
 =?us-ascii?Q?/LHYo+nzB9+qJkNRV2lSGrE/opEBHThYMyIlHY4qkCLyF7jDwNqN6gT4byf8?=
 =?us-ascii?Q?BP0e6hF2QJUqwH0EN9+xkSo/aA0dMzrCLjWVDZ2ebQu/Dm55P3IvM8LulEMQ?=
 =?us-ascii?Q?H2yFEhcAE7BOcz7+Zpz6WPztURA8Wp3Yj/Veb9quPgl0mys9rj5u5gsuOLZh?=
 =?us-ascii?Q?xWLGxLL/HS3qMUus8Sq4EL9pPwWLDckoQZvv3wsS1PtLplvlNFx9DFNKoSHs?=
 =?us-ascii?Q?hBFWyu9b8/U6eKGGX51cJFR2RZlDQ9xa3EDqM86IcsZASag3575ELrUSofGy?=
 =?us-ascii?Q?hYVNkX9saL0NAkVMK3Cb3CAUgEkDv7qPXRtk9eje8Jn2YNQJCVzM68gVd+Di?=
 =?us-ascii?Q?eohr6r5heCgq+wdFCfowiWGdCT0k+/i61FzsRL3jtJPEMoXy+Pjm/0fFcZ1q?=
 =?us-ascii?Q?FbV9bGkT8mF0bDcmYFR6/GCOKnLDaiJ85nP6PCNpPZ3Tmfq9ZrISarQxZPmn?=
 =?us-ascii?Q?j9x8LgznV8/auRm9ZCeMAQh11/Wl8uo5Z9AOgj0oczytUqvIaq68bsdAiNdE?=
 =?us-ascii?Q?Ru73ng06V/ZoLThAxQNY6qcPRDpR2kBsnZS0gPf3y9VfSS83Wpaq98iT2MpN?=
 =?us-ascii?Q?s/sfvlo8RVbQgzyXRZNGbnUE3OntWNGU3rxWdwEwLXO7sITJFbIzesUA2uuP?=
 =?us-ascii?Q?TF+/6P/GD/LSSVVoCQStVLztKVOpiF2uiMuJoSZTLu1aeqHH26QoDvGUSa3X?=
 =?us-ascii?Q?5tzfd/o+DH1sbGmt40NffOJkLSrbWdRNYgi6SLDajB2+8+TGuBd5C5MRyELB?=
 =?us-ascii?Q?YGblPReY+GloKgk/3C6n9CuCB0knmQzHPRfzMTZ6QXiyu6BhXopX9+F/gkDR?=
 =?us-ascii?Q?Rg=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: UsJ50NUebHDcNSW1WXThU/+QL5KxeyLwFqjwbmJuXaaUXVgMsLsT8QiX1AuwOUjTBwALSA6zkmOVBVglOEUra2di7ZgBHvVyfsuwW2hwObz6hntyj8inpy2AxS3pt1W/KCUB7qUITZjd9PE+msZ+RGQekARzAH3mCWKfxCwe7A99ZxyZ5ebSZQbduQ9hTCukkJ71+JQA/lEG8X/X6Qml6gMeLNIAELYfEp++UddcZcgjqKSaEVIQTonfOnrsCh3EwmUNX4rHLL/7lgpyCygkZzkR12iTXhNyHBrZzORmhjNJtw0lepOgBKdT5ZKyOqzsRpHcbfJ/pA3jShsq3/eBCf4tQ+ipNnx+KeLx/ONvBIoXzJHsRxbesA/MUFxm7ffP970bFuuZij2GuRlBKNpkQ65bsO9t7vKg5DjAnmkr8HzTNAgeJCFMtZhOpbKPYXoIrVPFrSZ7SHlCV2qK2ej/irRe/pZsixTPCN0dl/T5otCA3G8+GjjH0vw9rhobQjNqxQEXkYMW5L2zp3dqkPBXpYd9SLBHBlj8DkY18uzCVtFh5lP+x+PRHL6RQO/zt+m/ESEEk3S9781KTMvTYtUrJ8KSKcRCs8zH652wiYvl3+M=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4477a3e9-1c12-4e9c-6031-08dd5ac1d872
X-MS-Exchange-CrossTenant-AuthSource: CH0PR10MB5338.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Mar 2025 02:11:16.4304 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4y4oI4DvmtMpSrmreJPVtPCbXkxGJv7rxr1qDYlmeAc2id73OuvHtQOtP3ksJw+fyFBoZMmFIkkZqPYbTol+b6qI2w9x+M4q2AreXiDuZgo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BLAPR10MB4964
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-04_01,2025-03-03_04,2024-11-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=813
 adultscore=0 mlxscore=0
 spamscore=0 bulkscore=0 suspectscore=0 malwarescore=0 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2502100000
 definitions=main-2503040017
X-Proofpoint-ORIG-GUID: hhfOBlo0AVpdxJFTPFYr8mXXDbnXlZ2R
X-Proofpoint-GUID: hhfOBlo0AVpdxJFTPFYr8mXXDbnXlZ2R
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


Easwar,

> Commit b35108a51cf7 ("jiffies: Define secs_to_jiffies()") introduced
> secs_to_jiffies(). As the value here is a multiple of 1000, use
> secs_to_jiffies() instead of msecs_to_jiffies() to avoid the
> multiplication

Fixed compilation error and applied to 6.15/scsi-staging, thanks!

-- 
Martin K. Petersen	Oracle Linux Engineering
