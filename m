Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C670CB50A7D
	for <lists+dri-devel@lfdr.de>; Wed, 10 Sep 2025 03:50:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3590710E29A;
	Wed, 10 Sep 2025 01:50:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=oracle.com header.i=@oracle.com header.b="Kip4JBgG";
	dkim=pass (1024-bit key; unprotected) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="xtR+NHvY";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com
 [205.220.165.32])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3DB0C10E34F;
 Wed, 10 Sep 2025 01:50:49 +0000 (UTC)
Received: from pps.filterd (m0333521.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 589L0b1t004351;
 Wed, 10 Sep 2025 01:50:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
 :content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=corp-2025-04-25; bh=ax/Vek/NwA1fRNFrLo
 x/1zBw3jkvhEt8qOPJhS0W/hE=; b=Kip4JBgGxgB9QnInkpB2EXdOapnippPSb4
 59gbkS5W60iAX/G58kQYRGLInwizdBpAkGRwEd7pF9DkstdNvd3wiz0q2V4CWDrS
 rE9bu6xUEOj73wOz819V+ucqlr3FRvsMfPKR5r7vR/QsLYyVSCA3YTNtvjUpS1ib
 shr+tVqbjja31sdVjBwom1xraKV2Ay+RxKU2HCj+E/BXataSzQKqH7xcVIKlfd3f
 91lz8P6+fuWgO0b9hYMl1DZMjk7ygZMUoQWVLKNkxGKL56qi+xTQ+JG7U/ktuG5r
 EOrSv57+l3tW21iwYorqsj3VNXkYF3c2FZ5KnvUkCrW5QseQ/tZg==
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com
 (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 492296361f-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 10 Sep 2025 01:50:23 +0000 (GMT)
Received: from pps.filterd
 (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
 by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2)
 with ESMTP id 58A08DZO012839; Wed, 10 Sep 2025 01:50:23 GMT
Received: from ch1pr05cu001.outbound.protection.outlook.com
 (mail-northcentralusazon11010024.outbound.protection.outlook.com
 [52.101.193.24])
 by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id
 490bdakcke-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 10 Sep 2025 01:50:23 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yLOBIebhh0C+jkZFe7KA7DNMoqPYmcYIGedL1CT34b1f4qlBoKf39SAXbJOm9AkT9mF3ePdEQBB4upSvyoG1JuG48wpzMcyt4HWUhwrDt/hfPn79+YC86zTY8t3hAiBK3QyeYW097kMlrOX06IXG03kDugd0CinLEs4YIG6PF36Sv/YH+wt9Nvfzl/ztaBX3c0YBzU9XnPDW3Xr6ebWCnUI6PCQdSBLcpJMJhNrEvg953gxccTNlTHSnmebWaNkyCMseCrtDQMG0f/Ty1Pnop1LSkEYBAMDnUodQ7AGfV02NKQ2afuhuGdu5OvR0y2YgkaOmxPxHhOP5opaadP8hHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ax/Vek/NwA1fRNFrLox/1zBw3jkvhEt8qOPJhS0W/hE=;
 b=dwvPB6w+/XTYHBUVA/jV1B2G2Y86FsK2aqHYSepeW3riHnUAyRvO99CN5KbmGFPpssRe64+ueZ59zDr3UJoWkmAbWtoBk3vznpiMwxx7l7KBWugpgjLiiOE6ESZ2alSQAT7f3tGC1xZGB8hHD/9pg+pAv6ceWOb/rLnU1+38BAd5DXD6aLm/qBmUtukGm8nKTqDk+jjwJVFUJ4mOQxxKVZYd+6pMaqrZ0pDFbsfzAXKRNMruQSGkG0j+KeT9bdMQ0jgS8ibCjmkymOb6ajyKjSoVl9iAPLqAT3sy2HJSrfZNXHUjlSGNE0GuhMnPLisENaEkq7DWtaJ3Z9G1W8M+iA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ax/Vek/NwA1fRNFrLox/1zBw3jkvhEt8qOPJhS0W/hE=;
 b=xtR+NHvYI1u7+tjpzkXsPQEXSatwiBNVv9nUMvWnVSQFRUekZ7E2aRVrveseNZ0Yokhk5btdNPWLrzbva51qHkKwZqaOvfN/sGydYNf7MAPHto7dbuPOGb86DcKZxNMdE/VQlXVDPZNdmmQz1bGoTJ6LdHTgjoxyDdHjTNrJhdo=
Received: from CH0PR10MB5338.namprd10.prod.outlook.com (2603:10b6:610:cb::8)
 by SA1PR10MB7588.namprd10.prod.outlook.com (2603:10b6:806:376::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.22; Wed, 10 Sep
 2025 01:50:20 +0000
Received: from CH0PR10MB5338.namprd10.prod.outlook.com
 ([fe80::5cca:2bcc:cedb:d9bf]) by CH0PR10MB5338.namprd10.prod.outlook.com
 ([fe80::5cca:2bcc:cedb:d9bf%6]) with mapi id 15.20.9094.021; Wed, 10 Sep 2025
 01:50:19 +0000
To: "Mario Limonciello (AMD)" <superm1@kernel.org>
Cc: "Rafael J . Wysocki" <rafael@kernel.org>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, Danilo Krummrich <dakr@kernel.org>, Bjorn
 Helgaas <bhelgaas@google.com>, Pavel Machek <pavel@kernel.org>, Len
 Brown <lenb@kernel.org>, Christian =?utf-8?Q?K=C3=B6nig?=
 <christian.koenig@amd.com>,
 "James E . J . Bottomley" <James.Bottomley@HansenPartnership.com>,
 "Martin K . Petersen" <martin.petersen@oracle.com>, Steven Rostedt
 <rostedt@goodmis.org>, linux-pm@vger.kernel.org (open list:HIBERNATION
 (aka Software Suspend, aka swsusp)), amd-gfx@lists.freedesktop.org (open
 list:RADEON and AMDGPU DRM DRIVERS),
 dri-devel@lists.freedesktop.org (open list:DRM DRIVERS),
 linux-pci@vger.kernel.org (open list:PCI SUBSYSTEM),
 linux-scsi@vger.kernel.org (open list:SCSI SUBSYSTEM),
 linux-usb@vger.kernel.org (open list:USB SUBSYSTEM),
 linux-trace-kernel@vger.kernel.org (open list:TRACING), AceLan Kao
 <acelan.kao@canonical.com>, Kai-Heng Feng <kaihengf@nvidia.com>, Mark
 Pearson <mpearson-lenovo@squebb.ca>, Merthan =?utf-8?Q?Karaka=C5=9F?=
 <m3rthn.k@gmail.com>, Eric Naim <dnaim@cachyos.org>, "Guilherme G .
 Piccoli" <gpiccoli@igalia.com>
Subject: Re: [PATCH v7 02/12] scsi: Add PM_EVENT_POWEROFF into suspend
 callbacks
From: "Martin K. Petersen" <martin.petersen@oracle.com>
In-Reply-To: <20250909191619.2580169-3-superm1@kernel.org> (Mario
 Limonciello's message of "Tue, 9 Sep 2025 14:16:09 -0500")
Organization: Oracle Corporation
Message-ID: <yq18qin6pqg.fsf@ca-mkp.ca.oracle.com>
References: <20250909191619.2580169-1-superm1@kernel.org>
 <20250909191619.2580169-3-superm1@kernel.org>
Date: Tue, 09 Sep 2025 21:50:17 -0400
Content-Type: text/plain
X-ClientProxiedBy: YQBP288CA0041.CANP288.PROD.OUTLOOK.COM
 (2603:10b6:c01:9d::16) To CH0PR10MB5338.namprd10.prod.outlook.com
 (2603:10b6:610:cb::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR10MB5338:EE_|SA1PR10MB7588:EE_
X-MS-Office365-Filtering-Correlation-Id: 03451a65-a69c-4a96-a264-08ddf00c658d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|7416014|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?wf/1cUZ/pFy5I/aXgurdwHqog4I5xtQg23enMKeSVAgVD7hJY7qEv2XXjr2a?=
 =?us-ascii?Q?phvXCDWsTQIZhJ1FCe3hj7qqdsc/UK5S3Kes+uVNAQDftXysseTdP69+gXvW?=
 =?us-ascii?Q?c1Z3d261gzL0Jlf9MHfxlnFroo5ulKKbTQ/Jv9N5M0vxKW35AznCRmqVo8/A?=
 =?us-ascii?Q?6g4C+tG6D7Xp0fn/Ws7Z9uX7/KNJSTYA53dNIh/0UWHwUulkXYhkPvdpHNDv?=
 =?us-ascii?Q?wdtizprH29Z1+kt4IwO8YSEOY75YkqvK9Z2Iu0CYUgfMixR9OMIoBEXRmu6N?=
 =?us-ascii?Q?1nwfKHk7lTrSWvChDpCMJD7iGpY2ds63ArdQVxHP+w8//iHnWxr9YlGsJwsw?=
 =?us-ascii?Q?GdQSy8Idd0hKlTiFG9wftD2rDt1CHEpsOmWpGiBt15wP0pvjWr2mUa5d29a1?=
 =?us-ascii?Q?cOHCIDpyTVkbA8taWHUrfwUn6Dz+iLCGT3uUKeg3KEkhVexPdJFCySKilgi1?=
 =?us-ascii?Q?3UjPTW6YJ5mK+TZ9JVabGpHxEQRqbNxP2ECKc/AluKF9aQ9bf30cyRxut3/z?=
 =?us-ascii?Q?ufbWIgTZv7w3GA9feLaGT1Kunsw8HX3QJfFxHIPphUCskW8i66tvSvj2au9i?=
 =?us-ascii?Q?qBT4ub/glM49JJFf3dfh+PSvFVoIGb6W4YdpaFwpu9jnfIYIUmGQS61odL12?=
 =?us-ascii?Q?Hb617P0iJjwSSgGRnfbOZ2DwjtIlMBUXA1JmOcOIQKnaiXFyEr58RQkx5qeb?=
 =?us-ascii?Q?9hAe9aKAHfKctVwo1ndAGqCft7Nr1hPZCEiLV3rBgz/Ugrk9WeOi45Vd5Q++?=
 =?us-ascii?Q?KgHsfkciwO6jI01GrgSzk3jQkTxW0ZTqBeritFzbLA9qL5Wwc6lk3z2NJv2F?=
 =?us-ascii?Q?ozVbwkRsUozbQRDl5ClPV38iRlPHjTrh1KwcSYBPpYXYXLX7P3JcWnBeYI/0?=
 =?us-ascii?Q?bqO8cLu9zfMeA6OwCf/LvpXchJ0COuUpXoVMY8Rr36IJN2aq6jsuWId/I7Eq?=
 =?us-ascii?Q?N83Ejo21FG9PIQcZdisUS1zZhlbReC6r+sg1MlGC2tNljFBbD8WGaI1oAbr+?=
 =?us-ascii?Q?TI/wNu+IHC1LxErAjiNv3wqnYaggK3lM6rGlJDi6BPqfj16FEuT5BVGb2nIv?=
 =?us-ascii?Q?DwK3OITt/xIwJDfOLBEFxBkEVesPJc1BvmPyIMGp4EFnHTKlD0IIQitpRndy?=
 =?us-ascii?Q?FZ+MJWpPKLeQ9VUoYDZBYtqsj2P+so96RVdaKlhH3K/tmEtd8pwY0V+ZDYMX?=
 =?us-ascii?Q?dekSNiEqYCi2/dROtcTLEB50jrhLcDWeGk/pbj9pg7RfeuzkHIqp9aQzno9t?=
 =?us-ascii?Q?Tk8yNf++NKdOjz29GSmk+PgZQdoo2nowvLf/mmZ6jeFsOWmO8z4x49aKpVsr?=
 =?us-ascii?Q?p89naCkE7dOYRtZdCAiyetQcKORkwFS77ZyAD94FdLdCiDewy7McrWLvaHGa?=
 =?us-ascii?Q?tw7aEBTrRQPqBZVILtzXpQ93IXknFWG4nrBlWCrlbEqjJiSMsjrolPhoURZ1?=
 =?us-ascii?Q?DCQm7taLLvs=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR10MB5338.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(7416014)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?JuiYM2iK48lnPYPHCw2ITX7btavse4tB79G3Ou66zvf8pm+yxLkH+A1jaklq?=
 =?us-ascii?Q?MOsqb/KJrdzJBDvvvamiTvHOvZgQXFUARRVnMluY8sHguOxuifiBCaJxf16J?=
 =?us-ascii?Q?NVU7LrjR3O6yIcPE2Qm/ICdVdalQI+BfCnOukRyqpfl+ftv5OOXfX7FCPQZ4?=
 =?us-ascii?Q?ddLRky5BSpdVNycxAapFxelTkJihtuyhOR45kCGrRBrYJ7KY6jegAkq3l/2e?=
 =?us-ascii?Q?lRTAufMQvw1mjTleQUQF/Jqqj+9WsPwb4poGN604ikNkSAPlDjj4BK2a+mu7?=
 =?us-ascii?Q?4jcmj2nwwIAt0gQjTKnFRGvgDoe+/YaznI0KO+6Aizqn665w8miDemZtSz1o?=
 =?us-ascii?Q?rm5UYKld7LhCyaVYCoW/BeLlbXLTuDb3yFuWpzghQL2uX0WIJNLJ4dLYByph?=
 =?us-ascii?Q?v1PTcv9Ik/F8i+JeFjveP+BX43Nfr91DBYF8ZIBpX0gZLYXsJ1jtAf0R3PlF?=
 =?us-ascii?Q?d+5/qEjFOuu/6DIFBWeWdDaG6nN1cZIdesgYCV6um0KOpdki645lQdoAMunq?=
 =?us-ascii?Q?RfIitG+6lFphptzX+9OPdSw/ExpEzLcnQbfcmdxt9IwZ9+UPY1fUBtc+iYoc?=
 =?us-ascii?Q?sPQH8MsJ6X9du1lN+oiC7ck/387KUp+XebIwZ2sYYM4Fq3LzqcIAXz1vs3rX?=
 =?us-ascii?Q?c5nng2dtrCHE/JKbGxf4sxYUK3wLnheFMh2Lo2EeqqJag+BIjf1mclTZ421c?=
 =?us-ascii?Q?i+WgZhj10t6m6bJIWYX1MmtMBgMpcUJuhqMWlb/zdy2PZOJy6JrfpmAOFD8J?=
 =?us-ascii?Q?bEXPJMvQpw9LLkAbQgimHjcuOly4nQzReQCXEIaZUkzcfw+/J4r2BpjqaX3h?=
 =?us-ascii?Q?K/FgRB+urKboJTdhCmxEblb+U0K66XvismbPNoYmbpdCr8in8cQvjE9r76oP?=
 =?us-ascii?Q?ncMDwAutumLRRXvkf49ILkKgsORsKHGurJsWtzbHyBGvjEKlpRf4iNiMv3dv?=
 =?us-ascii?Q?DIu2/CZAmgTFALjaZGEfFvbAzk3nn8deYFBsQZVei6qNnmngVFKnFAIiqDjD?=
 =?us-ascii?Q?qj/AvDOLXCsJIJsRlnL1gKfg8dVbypaKPUZHBciF+NkSDh5ZN9IZubodYN2y?=
 =?us-ascii?Q?vah0JT4etRzfH4Zp8YsXQ7mXasaak7+wL8xz/hccpiH+D1sJupFMXdePx9rp?=
 =?us-ascii?Q?KYuPaEY1NlfAYo5LmRmTXTuOrFaDAzk4rPBmmCT6AtIraCW3YIRb52OadRyN?=
 =?us-ascii?Q?TAFH7hoF4SbGiQMUGHnKh4FKz6Gg3RStVwz9zru1iaERgL/O/FhSOZ6kvu3L?=
 =?us-ascii?Q?9ZHGQHfDWcvTrsVrEFaTKDZnjtNvUY1LNeQ/fBoRXi6w6qqfAtLg77fzbGIh?=
 =?us-ascii?Q?rl9MKaXlseih938qH1cZt9VcpwVQ7jSsPmQBrN027f/DlZbTXOQv+1CVrv1n?=
 =?us-ascii?Q?slJli/ovLeQsJvut7igMMMJcRibry94jtm/dTXtl/8Jc0HT+A5yLjaDNmxZ0?=
 =?us-ascii?Q?xhEH/6ozQ2qdUPQOF6K+0GOCsIrFOqkegXllyHef6asGWXfdT+87hJ+MIg+v?=
 =?us-ascii?Q?IFcKHEzu53kMxWJn0qIVhpT0DUvOcZfs4f0gjuZtQIXhC+dRi0aTwZdHBhc8?=
 =?us-ascii?Q?zdRTPWJEFjdE1uFQP0cys/4YmB8Yu2BRa+4J7U/MbcyvjT6/CHey0kKlHNlY?=
 =?us-ascii?Q?nA=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: puyrHrGdr6L0Gc7pMFbH8nxNufnTLhDDaxkJWsPOwbExwa65ayRnBU+hA/fQ7/wK3jpaiObOGwKHm14EdMqgduRErbgEpsnDxGVk+Zju+6U1O2wGMpvpEE1H32ADlUBqxdmVzOgLK7nzUf3OsGS13BA0ppZav73vJbSqZ2GaUsm4gpz8iU6SGjAdYWC7eUsAM87yGfY9u/M/xzORf7B3Lwr407f6ASPOx/UF988K7kOZcCdoNX9m6+ZUTcksP4cEEXeKHHH+6dX1bpIp9uisuMVLC9svO2/Piv9S5Xra0hp+6F7dK+vBypvI7iYEPnPqaCTnC10tu5YaUxhXRbzTfw0oyHRC+aLScRMRjXw99VUV1Vad7qv6i8r0+heMeUPDZKDLDAskmp/xil2eO1jtyQdiW4WpXgNzYzyNFXgwWMUseq6iVh00N/vDlH+zq4Hdsmwhw1YAB+DXyiU+tMRCRj2HeZXaolUM40VU06ylxvxe01Jwk9sIBT3kJsiNk/UC7hKLO+PuMGPz835UVXavJal1gvzO/lTsLhwA+vH6Q0XtfoSf7N7/3I0z0hNPsKE7rrVTZ3vSOR19wml6Nv/031g0yGbFSSW08DRz3IFpG9Q=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 03451a65-a69c-4a96-a264-08ddf00c658d
X-MS-Exchange-CrossTenant-AuthSource: CH0PR10MB5338.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Sep 2025 01:50:19.2513 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2dHue4iujP+SO00Zx4MnCMwl2OB4Qm1bl9N9tXwZZXzFJwJMZh7HJ4BSMP4CTfUUQ2cuCscYCPZ/oEF5onpdU+WWOim34f3jodFvaij2OTo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR10MB7588
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-09_03,2025-09-08_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0
 spamscore=0 mlxscore=0
 mlxlogscore=999 adultscore=0 phishscore=0 bulkscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2508110000
 definitions=main-2509100012
X-Proofpoint-GUID: ShdCcH2jxD5FL7FyrBQR904lCzYyrm9h
X-Authority-Analysis: v=2.4 cv=CPEqXQrD c=1 sm=1 tr=0 ts=68c0d95f b=1 cx=c_pps
 a=WeWmnZmh0fydH62SvGsd2A==:117
 a=WeWmnZmh0fydH62SvGsd2A==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=yJojWOMRYYMA:10
 a=GoEa3M9JfhUA:10 a=yPCof4ZbAAAA:8 a=Ua9zekmsM4hb7iqvQB8A:9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA4MDE1OSBTYWx0ZWRfXwghUkWToHKCT
 ccbh6PN2pAOCQInj3+VieoumxxHWaLdG8be1xGpdWZEUhg2LNhhEiEmWe8XBaXjmPGk71INqBiR
 GJmIoMMWjsqQnFh6k29q3n9KKw3Emv13dKal6bbvKS+CNW0b9Y+r2iUrOGqRJuHr+FlZqDAgpnb
 nAZDFXz3wMFLqzWIcM1Ipf+IfLmV0e777O8ALU60VYvXEmzhWKhau/U+OSZkFn02D58aoPRqDLg
 5unNnxDFLOaPiYyeGFiSFm/YjiFn4ocolbJsWJiw9CXo9oyAgbPC9U2GjBuBXQLhfJy0UKIbumq
 uT8fJBLbe0hNFsR0dAOTHXXjCyXH7NCvI8VEDy6EH+h6dgOoNdhCL6s0IHMeGdaJoG2JJu1jgR0
 YELhekIu
X-Proofpoint-ORIG-GUID: ShdCcH2jxD5FL7FyrBQR904lCzYyrm9h
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


Mario,

> When the ACPI core uses hibernation callbacks for shutdown drivers
> will receive PM_EVENT_POWEROFF and should handle it the same as
> PM_EVENT_HIBERNATE would have been used.

No objections from me wrt. the SCSI changes.

Reviewed-by: Martin K. Petersen <martin.petersen@oracle.com>

-- 
Martin K. Petersen
