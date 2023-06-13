Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 373C872E97F
	for <lists+dri-devel@lfdr.de>; Tue, 13 Jun 2023 19:26:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BD1DD10E0FA;
	Tue, 13 Jun 2023 17:26:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com
 [205.220.165.32])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 34F5510E0DA;
 Tue, 13 Jun 2023 17:26:05 +0000 (UTC)
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 35DGiBQ2013871; Tue, 13 Jun 2023 17:25:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=date : from : to : cc
 : subject : message-id : references : content-type : in-reply-to :
 mime-version; s=corp-2023-03-30;
 bh=SeGKV2FbE5oaBOinr8p+N5j5c9oH38W99kLRnydrRPc=;
 b=KpH/HTz7AGBUeyPBCdGodQtbVg8CHUkGFsacvYM6ofveswjGfUYEeU7sxxzhW+t8q4GI
 BD5hZKxNC5QRcHa/MSXZ1LET6Gj/9MB/4EyXGAiul7a0chgGWGX63uUJ6PeqyyboTT80
 z5N/OzehEL1OWv+6JYxYN0xph9KVH0aEwWOFMeYn+6zJ1rQ4VjNhE4XBrEYQvHkbTc+f
 MNxGEptWmyDmB7GiHaZ7JMgo+7Vg4NSDAMnDuaTd/5h1RinWVeN0lOIGRJG6t8RdC9GI
 +FPbii1wTyk/ADUfyYavhstLpxbJfLDlLzZbsUtLQWWuecab3RG5Jtx3ursJrU4vi3Gx 5Q== 
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com
 (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3r4fs1wvmq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 13 Jun 2023 17:25:41 +0000
Received: from pps.filterd
 (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
 by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.17.1.19/8.17.1.19)
 with ESMTP id 35DG3n1j016278; Tue, 13 Jun 2023 17:25:39 GMT
Received: from nam11-bn8-obe.outbound.protection.outlook.com
 (mail-bn8nam11lp2169.outbound.protection.outlook.com [104.47.58.169])
 by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id
 3r4fm4fwsn-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 13 Jun 2023 17:25:39 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Y2PGmiPuEKiyVzpt05nwc/Rwja0W3XpOO/Ds6ZcHfaMeRqsz4P62wP6DggnYKxD1VgZEIaDjtJxRJUiAJnF+t8MqY59VbgV5+rhA8zo2R7uFOUBF1gh3WUsJbK5aPvyEEoIUzVT90rlsG4JoKxhO1LOwo62RGaWuMCbsXMTxfUJxj9TvZWQt/HOlOYvKhOL8ghO0w26gV/ltTNLfycbssqfGIQLEjHUxXTiVHTyLlWJCmOCkB9V7Anvw4PwFji9s8y2T9ZELHfWtOcbsAOacsZPy+SECLZl/YQM1wZlYFgk1kD0vlBqFuDFShCblnEZzNzPSNWOhne1icn0MEdFDHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SeGKV2FbE5oaBOinr8p+N5j5c9oH38W99kLRnydrRPc=;
 b=fY43GtwpKWijLFQShaSzLb/QmeatxLmqSox86ePatOj+I3jprZN1kin3j7AajL3wIs55cLDb0eGJtR+mfPejAin0Lih8Wj9Onm1wIJI+KFByDgZ2AOxrFS0h50A5hOxEIkKjC3Xg4J0Wd5l0FO3Ss8eYX7/6vCSkTDLwLZI542wYjKi4ZvU1M5fQdHFByHxqOTgVswy4ty0Z5T5A8HETPI7eoT+l0xlw6SMAHkNztSbWY6WUTuHSzlc+jpmMUrFpEcFGplgNkZE1MuVRGrX4tnUURDbkUQkwJwgYYvq/ku0Yye+J+SqGpFYIIUqT5Q59tIlXPmy90BSvZfFyHB95fA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SeGKV2FbE5oaBOinr8p+N5j5c9oH38W99kLRnydrRPc=;
 b=D2rDt5EblaTDW6CEKNtpOc2iWAtnRQ+s5kMmWgCsgrG6Z/M9beNFIB9LaTWkxUB6LZasdRVL9ScDVcxFp9tTnkBVruGaC0SsaR9qsAyQVrEdrwfuDCsii0LrDR0LHOHmaq/tpVL4Ou1i3SAO56c9EiDSsN3Spojng2kgIISwihQ=
Received: from SN6PR10MB3022.namprd10.prod.outlook.com (2603:10b6:805:d8::25)
 by CO1PR10MB4596.namprd10.prod.outlook.com (2603:10b6:303:6f::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.44; Tue, 13 Jun
 2023 17:25:36 +0000
Received: from SN6PR10MB3022.namprd10.prod.outlook.com
 ([fe80::998f:d221:5fb6:c67d]) by SN6PR10MB3022.namprd10.prod.outlook.com
 ([fe80::998f:d221:5fb6:c67d%7]) with mapi id 15.20.6455.045; Tue, 13 Jun 2023
 17:25:36 +0000
Date: Tue, 13 Jun 2023 13:25:32 -0400
From: "Liam R. Howlett" <Liam.Howlett@Oracle.com>
To: Danilo Krummrich <dakr@redhat.com>
Subject: Re: [PATCH drm-next v4 02/14] maple_tree: split up MA_STATE() macro
Message-ID: <20230613172532.o7gswjygcqndzsqw@revolver>
Mail-Followup-To: "Liam R. Howlett" <Liam.Howlett@Oracle.com>,
 Danilo Krummrich <dakr@redhat.com>, airlied@gmail.com,
 daniel@ffwll.ch, tzimmermann@suse.de, mripard@kernel.org,
 corbet@lwn.net, christian.koenig@amd.com, bskeggs@redhat.com,
 matthew.brost@intel.com, boris.brezillon@collabora.com,
 alexdeucher@gmail.com, ogabbay@kernel.org, bagasdotme@gmail.com,
 willy@infradead.org, jason@jlekstrand.net,
 dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 linux-doc@vger.kernel.org, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org
References: <20230606223130.6132-1-dakr@redhat.com>
 <20230606223130.6132-3-dakr@redhat.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230606223130.6132-3-dakr@redhat.com>
User-Agent: NeoMutt/20220429
X-ClientProxiedBy: YT4PR01CA0403.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:108::17) To SN6PR10MB3022.namprd10.prod.outlook.com
 (2603:10b6:805:d8::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN6PR10MB3022:EE_|CO1PR10MB4596:EE_
X-MS-Office365-Filtering-Correlation-Id: 640ce331-a024-4efd-a88b-08db6c333369
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: NrdeWLbJxnPdQIxod87ZF/oe6Tv2HCT5m937UdAFwSwmaUKV25AnOI4P8twlLeim2B4qy8Hi2RbBbegYR0fXaS6EU6sLxoX3AlZNc0bYnMTiRXqvcI06Q75onYiqeU5k5L6+ywBsPQmgOa1yoYg4nwrF9hVrTJVxeU+Jk9w1POE9Ik2PwgCwQ1C9mSlkYDIurD+m9P45nOUvMSs0vOX/LpmZyEAO6uF3nJkfxs4tRsUrsnM12WfSv767eODzAbgBzTZUWshEPcpXLSvOtdCvBz8z35j5Iu6OCZFTLapc3zy1p+74pdvtYhAYVDNUbRuKCQOZ74ePQrYZinjUQGGKQZ3E60ZhGiT3uMOtNx8OjisrdbrfqP/29hAlLXjWx23HYe5a6twR8iGWnbbxZhfsZmcc1ihkC2VIlSKyQWnxevyx+0lGOlAZmSfzVEREQmNB/nbL9/qaePn5gEgZ1iVvYdwZoT5YgHBLL1fqygf0NBEuCZZajZQC+qd6CEib/h/8t4EqLEplSHzXp1GiKJU1cZECDwfb3Up/eeHQzhXedDmXDMrNRW0rDnvRf+tiyrsV
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN6PR10MB3022.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(7916004)(396003)(346002)(136003)(376002)(366004)(39860400002)(451199021)(6486002)(6666004)(9686003)(83380400001)(38100700002)(86362001)(33716001)(6512007)(26005)(1076003)(6506007)(186003)(2906002)(5660300002)(8676002)(7416002)(8936002)(316002)(41300700001)(6916009)(66946007)(66556008)(4326008)(66476007)(478600001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?riDRQKvDVDcQvV/GLBPlaOaEIJGT4e+YAImAlZNNXTo+Io3uogZNwOupum1Z?=
 =?us-ascii?Q?AKqG2RAq65hnZAkGde123Njw1FY4DA1lf+IuV9kgYZLysXlxxANPv/DKnd+r?=
 =?us-ascii?Q?67170BAljZs4ftmzZVbICxEp8bHMbcBusfzc7j6XR0rul0XVyQ2OrKjiX4Hz?=
 =?us-ascii?Q?6rwba9wyc1u3VC3LAObqQW03kIMeAHCiG/+LS43tr0EVyfGucN8LNIgK74F0?=
 =?us-ascii?Q?gVuSqnz9rDvCrT8qaA0kFdmUzSHFOkLT3Fwzzudk8PpUD1NrHBQ8cfF5VidD?=
 =?us-ascii?Q?ODMQQDgCshlNFFSyWaA7rtOwU+rSZbuNIjdHS3n7UVk6Rg43vCZusbniD2Ri?=
 =?us-ascii?Q?JrFJUEFAgWnHZbkaxD4aj2UJECPXowmCCZmtgC9AMIcTW9A5njt87E+0+uui?=
 =?us-ascii?Q?tGc7Lv1p/psjNYrSkMi9g4hCvBJfRxUNT2tBn1/ijWsRTPJZ1oxYGyNHoJTX?=
 =?us-ascii?Q?XwcTN1Y2AZDqcKh7K8q8rq2XcAZCzv85pyVLIqO8jD3H9YdDPIJlbKQv7zRT?=
 =?us-ascii?Q?IN4ah6GB+jhJPPRGOkiHp9upIO9/ne/4+A/uqXyGFV6Bdxr9A/tK6LH4zLEY?=
 =?us-ascii?Q?kEruXnT9ecxUKrm+CxPZ547uOJ5lOtsDh3qj3wMsdd6sT/DQd4suC5HeidQj?=
 =?us-ascii?Q?ciM+foC8lWFenVtk4kMzoQDNeoVu+lNTZeY9lXSLeY35vb5TA8HeMzx2OPk7?=
 =?us-ascii?Q?mdkhirRjcVtxMJ/jYiXyfGkEqvmf2I+mgRf+06qWORn2P/PPEgTY+cyVnsAi?=
 =?us-ascii?Q?ZYW0t/HLJth5XN43OlJZeduYWTb4mWEFBsicfcFXjR+P2UcPbDfjiOyOfwwk?=
 =?us-ascii?Q?PAvVUZE8+SKibTBKZL3hXNWM7cT1iSWiFkNB2qLN1SOrH/lrae72SaTe5yQ5?=
 =?us-ascii?Q?8dpJPpfoKS+OBYE6AddYOXcX5WRcSEXeSb2ZhwY4VMEotsr0HrXNDSsYtGb7?=
 =?us-ascii?Q?mKgpS+2u5Hf4TtWCgV8pHeCxpESwt5bPD5LokBLIoPYvOk/hMdNlGrS751fm?=
 =?us-ascii?Q?YFCoDwxhGkGL5yoYIxlHjcf9W4fC/b4qMgCex+Xm10XGgN5HbELlB0ZL/gFy?=
 =?us-ascii?Q?OwhLJhpDMfg7QlyUxnKUDPMWjHFYl2KH8eFAuJhZvNK98MOq/mUN2i/vztK5?=
 =?us-ascii?Q?aXtXo9Ls8EHPSn3/Xo5R0Oq3DyuRL92kXko4Vh0QEbV4cauDhxzXuZa0jINN?=
 =?us-ascii?Q?ShhtL7f3cbtBpnqGO06iaUQkLsP92+hHXwB8r3yUTsahSZxZmkl6gNqRDHl3?=
 =?us-ascii?Q?sdvB4ecxEPpitaHnB7N5/LS0gDhnjW0kW+j93EMGm6lUIDY5KLfGnuTQRnkN?=
 =?us-ascii?Q?LoNzgiNVDh0MB1B255YaTnhKG1Ii1A0NCzCEiuxeuUREsYZnNsJUsTuiOH6W?=
 =?us-ascii?Q?Agz676ZaMUZglGz4jVVrrBKn1UHUk4Kndp9UcduaogZBast4v+WXd7JZTCrs?=
 =?us-ascii?Q?u80r9CfMs4smTnZslb0dltSkzhuyHlO4nHfgqvrKPdM84aoABe12lfrpu2zn?=
 =?us-ascii?Q?2kzhwqRc6t5LnSkoCx5OiurlzcWvXMXi/mVeS1Z97aYo9rAOHpJ2o/abD2wH?=
 =?us-ascii?Q?L2XjXymVg5WTcIQyDWiFpnGWO3jW9zORFobowSIOfbUVNRDSRsRK7Mhactfg?=
 =?us-ascii?Q?DQ=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: =?us-ascii?Q?N4WO+w89SjHcVLkFb4ZSm8WN+fMinGRDep2AOJDhKiZxA7ApQ9In/1oWTmyY?=
 =?us-ascii?Q?3fjIGyaB4rXko1MxneNNz6y2goncsuE7b2XD7Zzzt8NF/28ptNBpKUgWKi5K?=
 =?us-ascii?Q?38wkj7fesVoADTFNs5ic0gSk/sc3y1Zo+aiqdfwlVR/iWQHKpK+asybHVonI?=
 =?us-ascii?Q?PH4ZNmxaZxNyEhqgYY5Nu2OMh73B9RBo3kPy0glHGBh7XyFnhkNaPbKi4jf+?=
 =?us-ascii?Q?Yoy3vQU+ZRwq/76DRXoz5/qvFcOHJ+YCmvjRiQgne6PiuiEvbr7+aVr+RONV?=
 =?us-ascii?Q?5WcdmPa9f/em+WyTC3eAzqEwparXPH5hvkcQ2E0ITQZeU2d/ennN1AgB9SKu?=
 =?us-ascii?Q?6i5bzkLTSYsla8MyRUeVeGWS7aFMSW+1CwkqeGNBlreGZgyqGKC/BT7MMKXl?=
 =?us-ascii?Q?H6bpA0GDgEjod68XADnTBW4jYvrD4WqgjjF5Hmu4nolSS8NU41Y69NdwWthn?=
 =?us-ascii?Q?Vb6lCpOEz0A4lQc1xIUztGo/wqAjhFQr7tDidsOPgc2KOvZktm6cT7yNpx31?=
 =?us-ascii?Q?Ubonef9hQLBxSa7ERHWnqlukc1ZISW3fya56Y6AgNkAi1u4hKqnNMni1o+VW?=
 =?us-ascii?Q?TiuUf/KxIP68f/UM9opawRI+V2ybHkK3WYPMHfnXhll/Gh2Ajt+zBZwQpC7n?=
 =?us-ascii?Q?o4Elj3QMwyT35EL3IfP4+/eIUn/s0zykDmctYNbUvmrIDfZ54NTd195vkieu?=
 =?us-ascii?Q?FsxqtJFjwhDU6TIdlSCvJ7KVwU/bbCXTnzvILDgT+tHmqmE4K2xVfwUA9hQH?=
 =?us-ascii?Q?JRtIf6Eiit8tZrv84DiJGC0PkOrDSG3Bmeete1s515db62OUV6wYGW825tl2?=
 =?us-ascii?Q?OM2GPW0JtQDRMFZQvp2JR2KZNx3FWYi8INNeky8FiNBKzFCt3tacBiOIiTcr?=
 =?us-ascii?Q?UCAvit6eMquloXjCtGevj9Mdt0ormqzw8SX5Er0CamdDS+v0Uy2IIc9Wn6pc?=
 =?us-ascii?Q?tJ6Sz48IoJCLXVcR17jTGQWcNffFJCE0+vbyo9ObTJbQ0zHKIN9+X0Xkpldw?=
 =?us-ascii?Q?/AfVY79EY79iozKdxf7ky142/NhOaCy5Da+Pk0vq/Z8JIR3dxuxlNC45c4Ub?=
 =?us-ascii?Q?oivAyQtE6MPF0guu2DkDSc2++T5FYjZDBEVv7OUxcQ5HXQ04V95MAZMj7R+B?=
 =?us-ascii?Q?nfEbBrDmVMKwh/8giUYEGw9NmH1Do6/wzQ=3D=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 640ce331-a024-4efd-a88b-08db6c333369
X-MS-Exchange-CrossTenant-AuthSource: SN6PR10MB3022.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jun 2023 17:25:36.5681 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nR6pIlSOcQ1TdkqpFh3fuqPYbVilXS8AlpTWkn9LwfjkdlbcP3dusrSryZY/5zTfLvPWNEk3ssRJJKAzp0GNBw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR10MB4596
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.573,FMLib:17.11.176.26
 definitions=2023-06-13_20,2023-06-12_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999
 bulkscore=0 mlxscore=0
 spamscore=0 malwarescore=0 adultscore=0 phishscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2305260000
 definitions=main-2306130154
X-Proofpoint-GUID: vpWtrFuiJbunxAjfgUpK1H4iSDUxzOT1
X-Proofpoint-ORIG-GUID: vpWtrFuiJbunxAjfgUpK1H4iSDUxzOT1
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
Cc: matthew.brost@intel.com, willy@infradead.org,
 dri-devel@lists.freedesktop.org, corbet@lwn.net, nouveau@lists.freedesktop.org,
 ogabbay@kernel.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 mripard@kernel.org, linux-mm@kvack.org, boris.brezillon@collabora.com,
 bskeggs@redhat.com, tzimmermann@suse.de, bagasdotme@gmail.com,
 christian.koenig@amd.com, jason@jlekstrand.net
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

* Danilo Krummrich <dakr@redhat.com> [230606 18:31]:
> Split up the MA_STATE() macro such that components using the maple tree
> can easily inherit from struct ma_state and build custom tree walk
> macros to hide their internals from users.
> 
> Example:
> 
> struct sample_iterator {
> 	struct ma_state mas;
> 	struct sample_mgr *mgr;
> };
> 
> \#define SAMPLE_ITERATOR(name, __mgr, start)			\
> 	struct sample_iterator name = {				\
> 		.mas = MA_STATE_INIT(&(__mgr)->mt, start, 0),	\
> 		.mgr = __mgr,					\
> 	}
> 
> \#define sample_iter_for_each_range(it__, entry__, end__) \
> 	mas_for_each(&(it__).mas, entry__, end__)
> 
> --
> 
> struct sample *sample;
> SAMPLE_ITERATOR(si, min);
> 
> sample_iter_for_each_range(&si, sample, max) {
> 	frob(mgr, sample);
> }
> 
> Signed-off-by: Danilo Krummrich <dakr@redhat.com>

Reviewed-by: Liam R. Howlett <Liam.Howlett@oracle.com>

> ---
>  include/linux/maple_tree.h | 7 +++++--
>  1 file changed, 5 insertions(+), 2 deletions(-)
> 
> diff --git a/include/linux/maple_tree.h b/include/linux/maple_tree.h
> index 1fadb5f5978b..87d55334f1c2 100644
> --- a/include/linux/maple_tree.h
> +++ b/include/linux/maple_tree.h
> @@ -423,8 +423,8 @@ struct ma_wr_state {
>  #define MA_ERROR(err) \
>  		((struct maple_enode *)(((unsigned long)err << 2) | 2UL))
>  
> -#define MA_STATE(name, mt, first, end)					\
> -	struct ma_state name = {					\
> +#define MA_STATE_INIT(mt, first, end)					\
> +	{								\
>  		.tree = mt,						\
>  		.index = first,						\
>  		.last = end,						\
> @@ -435,6 +435,9 @@ struct ma_wr_state {
>  		.mas_flags = 0,						\
>  	}
>  
> +#define MA_STATE(name, mt, first, end)					\
> +	struct ma_state name = MA_STATE_INIT(mt, first, end)
> +
>  #define MA_WR_STATE(name, ma_state, wr_entry)				\
>  	struct ma_wr_state name = {					\
>  		.mas = ma_state,					\
> -- 
> 2.40.1
> 
> 
