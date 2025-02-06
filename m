Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 34DB4A2BE05
	for <lists+dri-devel@lfdr.de>; Fri,  7 Feb 2025 09:32:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 78F5210EA54;
	Fri,  7 Feb 2025 08:32:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=oracle.com header.i=@oracle.com header.b="jeyDZaTo";
	dkim=pass (1024-bit key; unprotected) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="SldyFFGd";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com
 [205.220.165.32])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2FA0410E98F
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Feb 2025 23:20:38 +0000 (UTC)
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 516JfuB9004588;
 Thu, 6 Feb 2025 23:20:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
 :content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=corp-2023-11-20; bh=j6izYYHwro+E9IWkmi
 tln+EGBjyCTqc8Ej4xvWbm5yE=; b=jeyDZaToq8AbIpWJWswQNfQN8PRx0UgF9i
 xWW/RbfIWgrtdqRcYGX+5dyHgCvwc1jHekjLuvvEikJf5S1e5spKxeFBVKpgAQyQ
 u43HeSyNJp0olB2pvpN8mGMJj4eMTQmU/NgKj3sHy2B8Scm9ILLEm9ETS9jKa/mS
 7H9du4Sa0y45MNo2RglPS0jJzDxvcnknmd5NZp61w57isx32As2e+SkRzi1dGTvg
 Q6djx8G6E2gwI1MFqaE3Uvwek/9kZFVnnAxtwKubjXzWV4apOU4bAvrWlo41O6Aa
 fXBX9Pn4Pe36H4ow0LSPKXp5xILgYuLk/XV2pSIP6zwRqEoSMCDA==
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com
 (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 44m58cksrh-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 06 Feb 2025 23:20:29 +0000 (GMT)
Received: from pps.filterd
 (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
 by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2)
 with ESMTP id 516M8ujU027020; Thu, 6 Feb 2025 23:20:29 GMT
Received: from nam12-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam12lp2044.outbound.protection.outlook.com [104.47.66.44])
 by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id
 44j8fqq1q4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 06 Feb 2025 23:20:29 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TGjhAAu5aNYHbaIF9h78PP8InT/+rg/Aa+CS5+uXoI3lqBdwVy6BCUISSQl47XjFii+LcHn7MBAEd1Bw7Ct/lnV5xEpaIU3xGgPQPi4Dw2eXR+C7KzgpJ1VuU5LyM24HS+Lf0HF/aToB62QoKpsTmTRWKrK8drqcLYjclB3x2lI9Nq3eheb2Nbzn+b1GmK386l1ztNIQyeF5Enp8G0j5exehWkL68xXWSnqWy3uSgp+DzcsphbO9MDqHmUDSxJjQl8DH27KvgvcADaGZTGKpOOXj31aCDupT8iX3YXk7OjEfjOuetlOsX5lyoGfL4rh2o9SvLxSb0amNAfuEUs4qPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=j6izYYHwro+E9IWkmitln+EGBjyCTqc8Ej4xvWbm5yE=;
 b=bhgV73dR7uZBYQTq691575jv+aFZlj6rt+temoBJXOsHzQ2sh/SzG7oo2qsGvCAe3gB31vh5VOeU6axb9wBM7Gvn6wG4Gz/sH0+Qn2JOYZ/ixoWfpwHiwV7zJEXjp0qbvFIALXLGMB+J9Va8Bm8wlYFC+pxudcb9qteFvgfKk7IM//jycCjh77AUeFMBkgvBWY9UTCIVdg0AwN5rnDtLsXRsEqsgVmydGAIMDLHI0PZiCXDY2iJ8N2IXnD/J8KEtVWNNbnprLCNCtKslN31eSXR7hOYrXpFbpfKOl4woDigedy4HHKawyOWqIJ99/pG3ByQm1USFHuV8fn1FE9a+pQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=j6izYYHwro+E9IWkmitln+EGBjyCTqc8Ej4xvWbm5yE=;
 b=SldyFFGduJwpx27kk7T2i4YW27eTSVmwG/8Ew20qRLMzg7jRlZpGwaBIvhFWOuZfj5DYYoXrR2/j6JHmXO+RBTt43QnQ6Yto4ZMMtzhh3UdZnRq0gYVP6yw6F0Ep3h9zCKd3VocdKK4GO+dX8zw9MD+ltcje55aNiXAsGzkgEyk=
Received: from BLAPR10MB5217.namprd10.prod.outlook.com (2603:10b6:208:327::10)
 by DM6PR10MB4123.namprd10.prod.outlook.com (2603:10b6:5:210::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8422.11; Thu, 6 Feb
 2025 23:20:27 +0000
Received: from BLAPR10MB5217.namprd10.prod.outlook.com
 ([fe80::68fa:11c9:9f82:f7be]) by BLAPR10MB5217.namprd10.prod.outlook.com
 ([fe80::68fa:11c9:9f82:f7be%4]) with mapi id 15.20.8422.010; Thu, 6 Feb 2025
 23:20:26 +0000
Content-Type: multipart/alternative;
 boundary="------------FG10D8hakTrtPUnIlxun4Fud"
Message-ID: <dd4be3b7-d7ff-466a-82ed-378a1e3e2a78@oracle.com>
Date: Thu, 6 Feb 2025 18:20:24 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: hyper_bf soft lockup on Azure Gen2 VM when taking kdump or
 executing kexec
To: Michael Kelley <mhklinux@outlook.com>,
 "mhkelley58@gmail.com" <mhkelley58@gmail.com>,
 "haiyangz@microsoft.com" <haiyangz@microsoft.com>,
 "wei.liu@kernel.org" <wei.liu@kernel.org>,
 "decui@microsoft.com" <decui@microsoft.com>,
 "drawat.floss@gmail.com" <drawat.floss@gmail.com>,
 "javierm@redhat.com" <javierm@redhat.com>,
 Helge Deller <deller@gmx.de>, "daniel@ffwll.ch" <daniel@ffwll.ch>,
 "airlied@gmail.com" <airlied@gmail.com>,
 "tzimmermann@suse.de" <tzimmermann@suse.de>
Cc: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-fbdev@vger.kernel.org" <linux-fbdev@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-hyperv@vger.kernel.org" <linux-hyperv@vger.kernel.org>
References: <BLAPR10MB521793485093FDB448F7B2E5FDE92@BLAPR10MB5217.namprd10.prod.outlook.com>
 <BLAPR10MB521780F7C93DC013E2E031BDFDE92@BLAPR10MB5217.namprd10.prod.outlook.com>
 <SN6PR02MB415732CABA59155898531226D4E92@SN6PR02MB4157.namprd02.prod.outlook.com>
 <BLAPR10MB521743AC3C146116D8F6BCACFDE92@BLAPR10MB5217.namprd10.prod.outlook.com>
 <SN6PR02MB415777C53A930259A54E213ED4F52@SN6PR02MB4157.namprd02.prod.outlook.com>
 <SN6PR02MB41578AC54B7C0B7386B8ED00D4F62@SN6PR02MB4157.namprd02.prod.outlook.com>
Content-Language: en-US
From: thomas.tai@oracle.com
In-Reply-To: <SN6PR02MB41578AC54B7C0B7386B8ED00D4F62@SN6PR02MB4157.namprd02.prod.outlook.com>
X-ClientProxiedBy: BL1PR13CA0420.namprd13.prod.outlook.com
 (2603:10b6:208:2c2::35) To BLAPR10MB5217.namprd10.prod.outlook.com
 (2603:10b6:208:327::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BLAPR10MB5217:EE_|DM6PR10MB4123:EE_
X-MS-Office365-Filtering-Correlation-Id: 1429d26a-ced8-4b7a-dc66-08dd4704d6b3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|7416014|366016|7053199007|8096899003|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?M0R3Y053WXliZ0RXcm1ISm5sSnl1YTBDY3psL3cwNWc4RXBXU1RPOVFuQVh3?=
 =?utf-8?B?UlVNbHNud0dVdkFvUFoxeGswYkEvRFdKTmFDWFR1TTd0L00wamZRejltYU9i?=
 =?utf-8?B?bmxyaXloTHBQbzJmaVNCUmVvc1BaTlljT0RxckttMzJ6RGJQYUJtU2t5VjBJ?=
 =?utf-8?B?YW9PRmhKNkJ4bEswY1JmbjFDVjVXWHgwTlNqNDhBeTNXTmNxNWE5cTFIeU55?=
 =?utf-8?B?RjVoL21FR1N1Lys2Ty95UVZjR1MwUXZEbWZHQ2ZMNXlYNERDOGFTWEt3USs3?=
 =?utf-8?B?U2x2RlFwdnBubk0vaTZrS3hGZXhQdEd4VmU5Z0p2RzNRcUVzTitWZ1FqTzUx?=
 =?utf-8?B?S3FHc0RGeUp1bzJhT0NPdmxhOHJrOVdydW55RFpCYnRUenlxU1l2RjFyZWJY?=
 =?utf-8?B?Ylo2WHFYWWNleUNuZzAyRjFPNXJoUFpYN2VmNmhLMjkrR1JrckVGKzVWaW9h?=
 =?utf-8?B?Y2YxNEtXMkRITk9kMmdLL294eFV0aEQxZ1J1a0ZJdTBheFEvb2xjL0lBVTlB?=
 =?utf-8?B?eXNlaVNYSDJiMzQrdmNxNGMxbmlvVWVLQXRoK3g4TWhSMHFUenpZd3lrMXlZ?=
 =?utf-8?B?NXoxZjhpelJHY3N5bEhjSyt3YTNNYTZXanpja1ZmT2ZGQ2JwTTk0OVJjY3JL?=
 =?utf-8?B?dy93SmpwRk5NbTBGTUtFVjBzQk5uK3p6QmwrdDI1NEJwSW1iMm16STZycEM1?=
 =?utf-8?B?dFk4SUZOZlJuV0tBSDhwMTUzRUxPRXI3bGZSVUdaamtoMzgwczhoT29ENFFK?=
 =?utf-8?B?VWF5dXFMVXJlR1JXWVFxN2ZqRzZpQ0l0MTdXVmtmMGJYSjh2M1JYbmZzaDRU?=
 =?utf-8?B?RVVkSUZKZmlPR3RhK01Gb1ZyenFYaWJRMndObm8xb2wxaXVaUVRlS1dZUFpH?=
 =?utf-8?B?bU9TUmZTcVZvOEpJM0NPUS8yWUp2NWN2U3kvQ21Od0NPSFVZOHN2YU1PMURn?=
 =?utf-8?B?eXFNd2ZlTkdtMmdQMHNCNkNxVk1QMXpVWUd0MU5EOGtaS1F4aVEvblY4ZWNl?=
 =?utf-8?B?TTlNZko3WjFCcGZqNmtLMG5oa3FxSWhkZmFPTUJ4TVN6cEM3THVDUTR5NitW?=
 =?utf-8?B?TmtvUG1Pcmgya0VSUHJQS2NLZTJuRGZqL1JaUW9XT0dqcm9lMHR6QlVGcS9v?=
 =?utf-8?B?enBxTUptWUdsb3NoeEJkNVhic1lzV2JNcndxL2hkbUJ4ZUdxazhhb1dDaHI2?=
 =?utf-8?B?SC9IL1ZDMTkyMlVWaVd5VHJZKzV1bGtZNGRERFQvME9jeWpEd21LYWxJdnFS?=
 =?utf-8?B?OE1NNnZtRWN4RFUzMXdQd3RzZzJISS9TSWpVTzRPNGVIemtLV0M1ZUR0Z0Ns?=
 =?utf-8?B?a2ZuK2VXZHJWZ3J6YmgvdkIwaC9zTldSNlJlbUJ2TG53SFJja0dhUkRJZ2Ez?=
 =?utf-8?B?NDdJNHR6NHNveHNzZVRqWWRzSEtadDZhdSthVytYQWtEMFI3c0o2ak5nQlFm?=
 =?utf-8?B?SEg1WDBFOFFSZWd2c09Ha0hUS1ZyT3J2SWMwSm9xR3U4TEpyTkpDUmxJYUF0?=
 =?utf-8?B?QjVJWXAzZDl5WFdrbVEzM0xWd2JPczAvR3pqcVdTSWo4azd2Y0drQXFtVWp3?=
 =?utf-8?B?b2M0cUllZm00cytkcks2Zk9vL0xWckh3R1hzTkUzdjRnS2pYbnlaZE04bTlu?=
 =?utf-8?B?bnMwUDhIbmxoaU9TaWdQcW9UYnZOcWhFcUdxZlF6cDFwUnBPNDYvZWtyUita?=
 =?utf-8?B?WUJGSWlhbzZWODdJcDZxVmd1VEx4Vkh0VU1aZlBzN3ZlZHpyZ2FVRkFXYkNC?=
 =?utf-8?B?SGphbksrcFdYV2Q1WE8ycmUxd0pKRkh6Mi94bzZwcWhnR0oxMDR1SWJXSjlF?=
 =?utf-8?B?RUZrd1d4bExiNnFCbmFXNEFTdFhSVmt1WU84VHNFY0ZXNFR0MkQxUmFPcDQ0?=
 =?utf-8?B?a0xNTU9NR0F2VGNoZWRBNE9QT25LM3puRHd0TnlpbDk0S3RXT3lvcHBBS2Ew?=
 =?utf-8?Q?qwZgYX3uMkY=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BLAPR10MB5217.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(7416014)(366016)(7053199007)(8096899003)(921020);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?c2pBUW54MWdtR2ROOUVYWmVySkdlbUU3ZEVXSGNCR3ZXUXZua0lodjdVejhh?=
 =?utf-8?B?NE9UVHNSZnBod3BUbldHWlNNMmRjMmc1eHRvT2M4dlpmVnlZT3lmcXFWN1Rm?=
 =?utf-8?B?NFdlWmEzaTBSZlk4QXkzVjgzblVORFRYN0FDVHlSZmVCUCtJNGNzS0hBZjd1?=
 =?utf-8?B?blNRYWMxd2VxOElDL0RGN3BtcUt2elNMRTR0dUJra0MvaUJwOEtzeXZ6U3JK?=
 =?utf-8?B?N0RLb3h3ai8ybncyNVVObklQakZDMmV2SHVzMlM2ME1hczA4RjliaTE5OUZG?=
 =?utf-8?B?aE1RaEVhdXlyaWRUMGh4anRqMnhrVzNDaXVqcEZEbGlEOEpzZDhZTVhjVWM2?=
 =?utf-8?B?eFJJbjdHWHVNVUV4RGRscmNQQWxvYWRWNE41T1hnd2J6a0VHL0lGK1JRZTkr?=
 =?utf-8?B?U3BDdWN4NjBNUXRMbHFGUXloT0o2VjRRS09jbWhDaVRaWmo2SGZUYzhHZmN3?=
 =?utf-8?B?VE5rdDlVcEdqU3dNdkFvUkloQ1pxZ0dVMzRmNFpqOEk0dmcrZEEwZ0x4dmNx?=
 =?utf-8?B?cmxhZlkyMWdpN2V1bjJrQjdvOHFaUjhMdVRndmtsa25DNWdvWFlTQWlaOGd1?=
 =?utf-8?B?RnVUMVlNTS9uM0RuMERhZmZNT3gxLzNqVjJOeWpyZTUyenl3Qm9vbktOTkNl?=
 =?utf-8?B?RXV4SWVVV2NKMVRJMFd0dzdaaDdMZVBudU5iaFVwM2FMU0JvZnNTNy9pZDNT?=
 =?utf-8?B?RFlGQXE2OU9xZHQrZHZ6U3NTTFlpSHgyY0pyY3FiQk80b1Q1NnVFaGgxMUNo?=
 =?utf-8?B?RVVaK0V2YXhLdkQxZHhJOWVzNGNpRWgwai8rSEM2djYvWDlWditEUmpjV2Vr?=
 =?utf-8?B?YTdCMlY2aVhscktQYnFhbzFxTzJkckpRWG5KQjdkaUswT0EzNDBEcFBweDI0?=
 =?utf-8?B?SUlLM2gzRDdvNUg1cWFEVjc1RDkxaGdvU1hzWHl5YW9xb05VV0tMY3p6dlNi?=
 =?utf-8?B?NmgzaTFpRWRRUUI4c1crcFcrMDAvN3E5R1hTVlpjZlhRU3FMdWtTby9ZcXpZ?=
 =?utf-8?B?NVZqdU9EaE5KNTlwZ0hKV01DQ3BrM2NrL2ozSktNMTJTelRRMEJOR0FrWjhN?=
 =?utf-8?B?Q1NPRGdKN2FTY3lLYTZXOUo2OHJmVWs4VlJOSVBvaWhyVG95NFBqazdTM0M1?=
 =?utf-8?B?V3IyTGtQVGNqb0M1NXNqcGVlTk9lbnR5WXowaW5SYW1DTjBJeXRqd2FBZ2ZF?=
 =?utf-8?B?VjVUbXczUWlzNWVYWERhYjBtTWlkTTcwVXBXTTZVZ1VjdWY3M05ySHlzdElk?=
 =?utf-8?B?LzhleUFJQzNOUXFZVDRlY0xUN0Z4QVJvQlVEWHRSVDBvZDNpK1RTTXQ4VUIz?=
 =?utf-8?B?YXlFN0FFZmY1RDdtcWpCSzFVT3J2RlMrbCtRRElrdWZycThKMFljMVVuVk5a?=
 =?utf-8?B?Smlud1RpRzE5c3RQajRweDUvSDBmYm9pQ0g5OGpYWlQyRWpRKys2MVNMdE9J?=
 =?utf-8?B?TzQzem1BTERqcitRMlR3N2wwZFVXL0hBZHl1MlVpTzJ0aDY5Ry9xNE40d04v?=
 =?utf-8?B?SWhUNjdkSEowS0llVWI2Y0VxMURPakRBbmhZU21tNDVGV3RUYUhCOGJINVVm?=
 =?utf-8?B?UUpHVmI3MVBYcmlzUzlxNGNzd2ttU0JFbDQxVTNOQWU3L1RBamhjaFRmaFNo?=
 =?utf-8?B?Yk5VOVdLaFNrN3QvNmhEWUJncHJheGg0MlI3aERhMVBialdwVEhYYlZDQ0JF?=
 =?utf-8?B?NzN5MTBqdlozNUFJdS8ybnloVjNkOTFNeEI4T0Y5S3RMb2E0eEhwVXYyQWlk?=
 =?utf-8?B?STc4NktKd2NWWU5WOFFpWVc5VVVuYWc4MnR3aHVjdElVUFp2ZE1VZ2xoVjh0?=
 =?utf-8?B?cVh1T0lNTGRZcGx1V0hwMmh3bVg3S29EZHNUa1pHMXFZYXZaZkl4UVlPYkFu?=
 =?utf-8?B?SWF3cW01dmxZK2I4NHp2ZzhGUklwcG8wYzJWeDhHYTJ3aGRST1JOTjN5eWt3?=
 =?utf-8?B?MWtjMi9GbVcrTUtpT1o5d09ZRHphaml3UTIzNEJNTFRUS2UwVVdBVzVZWmV1?=
 =?utf-8?B?RjJIeEhmYThnVnNOY1cvR0xRQ2NrMllHWC9MUGRlbUlXUVZtbTB2bU5TRlpx?=
 =?utf-8?B?REpTQ1ZabDdZbzVhQk5iMWpLZ0JzZHIvWlNEVzR2emVsMmluZGpLby9FUTRR?=
 =?utf-8?Q?jnvzWcLBwkUG9gOt9KXGdVRMS?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: EU8Xwft81/seLN+q8xH8WpB8oSJEZOHc1s7Uy5VKK95CId7PoXDnNypt4lMSl21v5aly0FDxG0vgLiKFd5KgWWca5gHPj12sr/27Qe2FBltaDTHfUjngP2TOThqFtFx1dkR0tJ2bm9pzSNoSy7enyV18mhCCQkdbn0FMD+vMFEdt+PBd/YARECoktGp8hVcAQynRzVe8wqbijuxHsmH2hBodUJOLSQ0BFrnT6bavjUuZreSKt7K4/NOFqMt/TFkfM/Oh17Wew9ER8SYj6QRtlWmk+7cfD56OCc++e2jDk1If8ZhsvW+Oybxvxie4WIKsyYZFk8UjAkZ89qna7W9H6MxNvyWqP2SXwyxF6Lixp7scgGFRy7Z3iUgJR5uHNYNKSy4rkp54K9ouCpWFljg4za10pJiNspqSdCC1LhHmEkIe9umtvPd4wOa75ayTFfO2mnPjcTritXA4g4fAn3qRQk72+AGp/fUJNWaz/sqKbvWiz+/lhbsb8p6QCorZHabeCva3aOgVhg4WSxX+S4f98KHSst8ml6OPvCHEzuBwC9REiGMCI3BvVDz/kf5Vfm/yXJqYKIV82j4T/q/b58iz9v8bXjAZ0hev4oTFFYcrrDY=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1429d26a-ced8-4b7a-dc66-08dd4704d6b3
X-MS-Exchange-CrossTenant-AuthSource: BLAPR10MB5217.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Feb 2025 23:20:26.8718 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5rmvpvfaE3onueDYk9HAkSviT0qWd/fOViP/mi47wsJCyQKK09yY6okJlUa8nPGpprOricYuCwRt9Q72pkbCcw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR10MB4123
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-06_07,2025-02-05_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0
 mlxscore=0 phishscore=0
 suspectscore=0 adultscore=0 bulkscore=0 mlxlogscore=999 spamscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2501170000
 definitions=main-2502060181
X-Proofpoint-ORIG-GUID: 30z1vX2cqLUvzEi1__N65Mu0ncPdHNUy
X-Proofpoint-GUID: 30z1vX2cqLUvzEi1__N65Mu0ncPdHNUy
X-Mailman-Approved-At: Fri, 07 Feb 2025 08:32:02 +0000
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

--------------FG10D8hakTrtPUnIlxun4Fud
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 2025-02-06 4:00 p.m., Michael Kelley wrote:
> From: Michael Kelley<mhklinux@outlook.com>
>> From: Thomas Tai<thomas.tai@oracle.com>  Sent: Thursday, January 30, 2025 12:44 PM
>>>> -----Original Message-----
>>>> From: Michael Kelley<mhklinux@outlook.com>  Sent: Thursday, January 30, 2025 3:20 PM
>>>>
>>>> From: Thomas Tai<thomas.tai@oracle.com>  Sent: Thursday, January 30,
>>>> 2025 10:50 AM
>>>>> Sorry for the typo in the subject title. It should have been 'hyperv_fb soft lockup on
>>>>> Azure Gen2 VM when taking kdump or executing kexec'
>>>>>
>>>>> Thomas
>>>>>
>>>>>> Hi Michael,
>>>>>>
>>>>>> We see an issue with the mainline kernel on the Azure Gen 2 VM when
>>>>>> trying to induce a kernel panic with sysrq commands. The VM would hang
>>>>>> with soft lockup. A similar issue happens when executing kexec on the VM.
>>>>>> This issue is seen only with Gen2 VMs(with UEFI boot). Gen1 VMs with bios
>>>>>> boot are fine.
>>>>>>
>>>>>> git bisect identifies the issue is cased by the commit 20ee2ae8c5899
>>>>>> ("fbdev/hyperv_fb: Fix logic error for Gen2 VMs in hvfb_getmem()" ).
>>>>>> However, reverting the commit would cause the frame buffer not to work
>>>>>> on the Gen2 VM.
>>>>>>
>>>>>> Do you have any hints on what caused this issue?
>>>>>>
>>>>>> To reproduce the issue with kdump:
>>>>>> - Install mainline kernel on an Azure Gen 2 VM and trigger a kdump
>>>>>> - echo 1 > /proc/sys/kernel/sysrq
>>>>>> - echo c > /proc/sysrq-trigger
>>>>>>
>>>>>> To reproduce the issue with executing kexec:
>>>>>> - Install mainline kernel on Azure Gen 2 VM and use kexec
>>>>>> - sudo kexec -l /boot/vmlinuz --initrd=/boot/initramfs.img --command-
>>>>>> line="$( cat /proc/cmdline )"
>>>>>> - sudo kexec -e
>>>>>>
>>>>>> Thank you,
>>>>>> Thomas
>>>> I will take a look, but it might be early next week before I can do so.
>>>>
>>> Thank you, Michael for your help!
>>>
>>>> It looks like your soft lockup log below is from the kdump kernel (or the newly
>>>> kexec'ed kernel). Can you confirm? Also, this looks like a subset of the full log.
>>> Yes, the soft lockup log below is from the kdump kernel.
>>>
>>>> Do you have the full serial console log that you could email to me?  Seeing
>>>> everything might be helpful. Of course, I'll try to repro the problem myself
>>>> as well.
>>> I have attached the complete bootup and kdump kernel log.
>>>
>>> File: bootup_and_kdump.log
>>> Line 1 ... 984 (bootup log)
>>> Line 990       (kdump kernel booting up)
>>> Line 1351      (soft lockup)
>>>
>>> Thank you,
>>> Thomas
>>>
>> I have reproduced the problem in an Azure VM running Oracle Linux
>> 9.4 with the 6.13.0 kernel. Interestingly, the problem does not occur
>> in a VM running on a locally installed Hyper-V with Ubuntu 20.04 and
>> the 6.13.0 kernel. There are several differences in the two
>> environments:  the version of Hyper-V, the VM configuration, the Linux
>> distro, and the .config file used to build the 6.13.0 kernel. I'll try to
>> figure out what make the difference, and then the root cause.
>>
> This has been a real bear to investigate. :-(  The key observation
> is that with older kernel versions, the efifb driver does *not* try
> to load when running in the kdump kernel, and everything works.
> In newer kernels, the efifb driver *does* try to load, and it appears
> to hang.  (Actually, it is causing the VM to run very slowly. More on
> that in a minute.)
>
> I've bisected the kernel again, compensating for the fact that commit
> 20ee2ae8c5899 is needed to make the Hyper-V frame buffer work. With
> that compensation, the actual problematic commit is 2bebc3cd4870
> (Revert "firmware/sysfb: Clear screen_info state after consuming it").
> Doing the revert causes screen_info.orig_video_isVGA to retain its value
> of 0x70 (VIDEO_TYPE_EFI), which the kdump kernel picks up, causing it
> to load the efifb driver.
>
> Then the question is why the efifb driver doesn't work in the kdump
> kernel. Actually, it *does* work in many cases. I built the 6.13.0 kernel
> on the Oracle Linux 9.4 system, and transferred the kernel image binary
> and module binaries to an Ubuntu 20.04 VM in Azure. In that VM, the
> efifb driver is loaded as part of the kdump kernel, and it doesn't cause
> any problems. But there's an interesting difference. In the Oracle Linux
> 9.4 VM, the efifb driver finds the framebuffer at 0x40000000, while on
> the Ubuntu 20.04 VM, it finds the framebuffer at 0x40900000. This
> difference is due to differences in how the screen_info variable gets
> setup in the two VMs.
>
> When the normal kernel starts in a freshly booted VM, Hyper-V provides
> the EFI framebuffer at 0x40000000, and it works. But after the Hyper-V
> FB driver or Hyper-V DRM driver has initialized, Linux has picked a
> different MMIO address range and told Hyper-V to use the new
> address range (which often starts at 0x40900000). A kexec does *not*
> reset Hyper-V's transition to the new range, so when the efifb driver
> tries to use the framebuffer at 0x40000000, the accesses trap to
> Hyper-V and probably fail or timeout (I'm not sure of the details). After
> the guest does some number of these bad references, Hyper-V considers
> itself to be under attack from an ill-behaving guest, and throttles the
> guest so that it doesn't run for a few seconds. The throttling repeats,
> and results in extremely slow running in the kdump kernel.
>
> Somehow in the Ubuntu 20.04 VM, the location of the frame buffer
> as stored in screen_info.lfb_base gets updated to be 0x40900000. I
> haven't fully debugged how that happens. But with that update, the
> efifb driver is using the updated framebuffer address and it works. On
> the Oracle Linux 9.4 system, that update doesn't appear to happen,
> and the problem occurs.rent between Ubuntu and Oracle Linux.

Thanks, Michael, for the detailed information. I will ask if anyone in 
Oracle can

help debug the difference between Ubuntu and Oracle that may have caused 
the issue.

Thomas


>
> This in an interim update on the problem. I'm still investigating how
> screen_info.lfb_base is set in the kdump kernel, and why it is different
> in the Ubuntu 20.04 VM vs. in the Oracle Linux 9.4 VM. Once that is
> well understood, we can contemplate how to fix the problem. Undoing
> the revert that is commit 2bebc3cd4870 doesn't seem like the solution
> since the original code there was reported to cause many other issues.
> The solution focus will likely be on how to ensure the kdump kernel gets
> the correct framebuffer address so the efifb driver works, since the
> framebuffer address changing is a quirk of Hyper-V behavior.
>
> If anyone else has insight into what's going on here, please chime in.
> What I've learned so far is still somewhat tentative.
>
> Michael
--------------FG10D8hakTrtPUnIlxun4Fud
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 7bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 2025-02-06 4:00 p.m., Michael Kelley
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:SN6PR02MB41578AC54B7C0B7386B8ED00D4F62@SN6PR02MB4157.namprd02.prod.outlook.com">
      <pre class="moz-quote-pre" wrap="">From: Michael Kelley <a class="moz-txt-link-rfc2396E" href="mailto:mhklinux@outlook.com">&lt;mhklinux@outlook.com&gt;</a>
</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">
From: Thomas Tai <a class="moz-txt-link-rfc2396E" href="mailto:thomas.tai@oracle.com">&lt;thomas.tai@oracle.com&gt;</a> Sent: Thursday, January 30, 2025 12:44 PM
</pre>
        <blockquote type="cite">
          <pre class="moz-quote-pre" wrap="">
</pre>
          <blockquote type="cite">
            <pre class="moz-quote-pre" wrap="">-----Original Message-----
From: Michael Kelley <a class="moz-txt-link-rfc2396E" href="mailto:mhklinux@outlook.com">&lt;mhklinux@outlook.com&gt;</a> Sent: Thursday, January 30, 2025 3:20 PM

From: Thomas Tai <a class="moz-txt-link-rfc2396E" href="mailto:thomas.tai@oracle.com">&lt;thomas.tai@oracle.com&gt;</a> Sent: Thursday, January 30,
2025 10:50 AM
</pre>
            <blockquote type="cite">
              <pre class="moz-quote-pre" wrap="">
Sorry for the typo in the subject title. It should have been 'hyperv_fb soft lockup on
Azure Gen2 VM when taking kdump or executing kexec'

Thomas

</pre>
              <blockquote type="cite">
                <pre class="moz-quote-pre" wrap="">
Hi Michael,

We see an issue with the mainline kernel on the Azure Gen 2 VM when
trying to induce a kernel panic with sysrq commands. The VM would hang
with soft lockup. A similar issue happens when executing kexec on the VM.
This issue is seen only with Gen2 VMs(with UEFI boot). Gen1 VMs with bios
boot are fine.

git bisect identifies the issue is cased by the commit 20ee2ae8c5899
(&quot;fbdev/hyperv_fb: Fix logic error for Gen2 VMs in hvfb_getmem()&quot; ).
However, reverting the commit would cause the frame buffer not to work
on the Gen2 VM.

Do you have any hints on what caused this issue?

To reproduce the issue with kdump:
- Install mainline kernel on an Azure Gen 2 VM and trigger a kdump
- echo 1 &gt; /proc/sys/kernel/sysrq
- echo c &gt; /proc/sysrq-trigger

To reproduce the issue with executing kexec:
- Install mainline kernel on Azure Gen 2 VM and use kexec
- sudo kexec -l /boot/vmlinuz --initrd=/boot/initramfs.img --command-
line=&quot;$( cat /proc/cmdline )&quot;
- sudo kexec -e

Thank you,
Thomas
</pre>
              </blockquote>
            </blockquote>
            <pre class="moz-quote-pre" wrap="">
I will take a look, but it might be early next week before I can do so.

</pre>
          </blockquote>
          <pre class="moz-quote-pre" wrap="">
Thank you, Michael for your help!

</pre>
          <blockquote type="cite">
            <pre class="moz-quote-pre" wrap="">It looks like your soft lockup log below is from the kdump kernel (or the newly
kexec'ed kernel). Can you confirm? Also, this looks like a subset of the full log.
</pre>
          </blockquote>
          <pre class="moz-quote-pre" wrap="">
Yes, the soft lockup log below is from the kdump kernel.

</pre>
          <blockquote type="cite">
            <pre class="moz-quote-pre" wrap="">Do you have the full serial console log that you could email to me?  Seeing
everything might be helpful. Of course, I'll try to repro the problem myself
as well.
</pre>
          </blockquote>
          <pre class="moz-quote-pre" wrap="">
I have attached the complete bootup and kdump kernel log.

File: bootup_and_kdump.log
Line 1 ... 984 (bootup log)
Line 990       (kdump kernel booting up)
Line 1351      (soft lockup)

Thank you,
Thomas

</pre>
        </blockquote>
        <pre class="moz-quote-pre" wrap="">
I have reproduced the problem in an Azure VM running Oracle Linux
9.4 with the 6.13.0 kernel. Interestingly, the problem does not occur
in a VM running on a locally installed Hyper-V with Ubuntu 20.04 and
the 6.13.0 kernel. There are several differences in the two
environments:  the version of Hyper-V, the VM configuration, the Linux
distro, and the .config file used to build the 6.13.0 kernel. I'll try to
figure out what make the difference, and then the root cause.

</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
This has been a real bear to investigate. :-(  The key observation
is that with older kernel versions, the efifb driver does *not* try
to load when running in the kdump kernel, and everything works.
In newer kernels, the efifb driver *does* try to load, and it appears
to hang.  (Actually, it is causing the VM to run very slowly. More on
that in a minute.)

I've bisected the kernel again, compensating for the fact that commit
20ee2ae8c5899 is needed to make the Hyper-V frame buffer work. With
that compensation, the actual problematic commit is 2bebc3cd4870
(Revert &quot;firmware/sysfb: Clear screen_info state after consuming it&quot;).
Doing the revert causes screen_info.orig_video_isVGA to retain its value
of 0x70 (VIDEO_TYPE_EFI), which the kdump kernel picks up, causing it
to load the efifb driver.

Then the question is why the efifb driver doesn't work in the kdump
kernel. Actually, it *does* work in many cases. I built the 6.13.0 kernel
on the Oracle Linux 9.4 system, and transferred the kernel image binary
and module binaries to an Ubuntu 20.04 VM in Azure. In that VM, the
efifb driver is loaded as part of the kdump kernel, and it doesn't cause
any problems. But there's an interesting difference. In the Oracle Linux
9.4 VM, the efifb driver finds the framebuffer at 0x40000000, while on
the Ubuntu 20.04 VM, it finds the framebuffer at 0x40900000. This
difference is due to differences in how the screen_info variable gets
setup in the two VMs.

When the normal kernel starts in a freshly booted VM, Hyper-V provides
the EFI framebuffer at 0x40000000, and it works. But after the Hyper-V
FB driver or Hyper-V DRM driver has initialized, Linux has picked a
different MMIO address range and told Hyper-V to use the new
address range (which often starts at 0x40900000). A kexec does *not*
reset Hyper-V's transition to the new range, so when the efifb driver
tries to use the framebuffer at 0x40000000, the accesses trap to
Hyper-V and probably fail or timeout (I'm not sure of the details). After
the guest does some number of these bad references, Hyper-V considers
itself to be under attack from an ill-behaving guest, and throttles the
guest so that it doesn't run for a few seconds. The throttling repeats,
and results in extremely slow running in the kdump kernel.

Somehow in the Ubuntu 20.04 VM, the location of the frame buffer
as stored in screen_info.lfb_base gets updated to be 0x40900000. I
haven't fully debugged how that happens. But with that update, the
efifb driver is using the updated framebuffer address and it works. On
the Oracle Linux 9.4 system, that update doesn't appear to happen,
and the problem occurs.<span style="white-space: normal">rent between Ubuntu and Oracle Linux. 
</span></pre>
    </blockquote>
    <p>Thanks, Michael, for the detailed information. I will ask if
      anyone in Oracle can</p>
    <p>help debug the difference between Ubuntu and Oracle that may have
      caused the issue. <br>
    </p>
    <p>Thomas<br>
    </p>
    <p><br>
    </p>
    <blockquote type="cite" cite="mid:SN6PR02MB41578AC54B7C0B7386B8ED00D4F62@SN6PR02MB4157.namprd02.prod.outlook.com">
      <pre class="moz-quote-pre" wrap="">

This in an interim update on the problem. I'm still investigating how
screen_info.lfb_base is set in the kdump kernel, and why it is different
in the Ubuntu 20.04 VM vs. in the Oracle Linux 9.4 VM. Once that is
well understood, we can contemplate how to fix the problem. Undoing
the revert that is commit 2bebc3cd4870 doesn't seem like the solution
since the original code there was reported to cause many other issues.
The solution focus will likely be on how to ensure the kdump kernel gets
the correct framebuffer address so the efifb driver works, since the
framebuffer address changing is a quirk of Hyper-V behavior.

If anyone else has insight into what's going on here, please chime in.
What I've learned so far is still somewhat tentative.

Michael
</pre>
    </blockquote>
  </body>
</html>

--------------FG10D8hakTrtPUnIlxun4Fud--
