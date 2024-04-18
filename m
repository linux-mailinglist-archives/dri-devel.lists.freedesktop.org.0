Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E5468A99F9
	for <lists+dri-devel@lfdr.de>; Thu, 18 Apr 2024 14:40:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 72BF5113C42;
	Thu, 18 Apr 2024 12:40:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=oracle.com header.i=@oracle.com header.b="AMXkONHH";
	dkim=pass (1024-bit key; unprotected) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="TGlKonKX";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com
 [205.220.177.32])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1A82D113C41
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Apr 2024 12:40:22 +0000 (UTC)
Received: from pps.filterd (m0333520.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 43ICJ68q027549; Thu, 18 Apr 2024 12:40:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=message-id : date :
 from : to : cc : subject : content-type : content-transfer-encoding :
 mime-version; s=corp-2023-11-20;
 bh=kXWvCHVlK96+awYz1vyfuknN9WBoGE4w4r6IhbSLuuQ=;
 b=AMXkONHHACI+zjf1JObnzJJ6+lgTrSbTFHDSOMm1/nnYb9LAxjZbHv0O36pX4674Prkc
 aSMexCy5bs+GrEekIYSPFqyw4NJR1FdHVzVbrVorfQHFH/6UrCsKnBNjOyQgoF9TM2Z1
 y76zlxs5JmItT5aJGRSp+1bLjNYkrU+B+hVaJwElneh+YZvKvnVU31OdO5Ut5hbbvUXp
 KWCpktE7tj/NqF9WQnLOKGPxfKow6plsNPIiAqvoWgjjNY1Qhg1pXOSTAacUxJvAr0iM
 VXJbDfs5R69c8xGIX1D2EEN9ZVSQAYQ6M3gyf3DnKhwwWFvl4kdzolDNDyOZWmxaQK5s 3g== 
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com
 (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3xfj3eaf6c-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 18 Apr 2024 12:40:07 +0000
Received: from pps.filterd
 (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
 by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.17.1.19/8.17.1.19)
 with ESMTP id 43ICY5m8029401; Thu, 18 Apr 2024 12:40:06 GMT
Received: from nam11-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam11lp2169.outbound.protection.outlook.com [104.47.57.169])
 by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id
 3xfggaahp8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 18 Apr 2024 12:40:06 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mYxsE/nTVLDl990cAWrJisoYdxsu00wSCYq5dUDszjuzCJYBIrMfGYy4KVBFIgqhKUs7Ff3O4cqynodGYdYsTwGnleEMudyTOt1abijZoNGQzCE761c655dscovr7i+ufNJcH/tVmY06j0y1m/NEdfwZu267yjXdzFP7+mwOR6qj/XgIzzH+7jpGpPqTH8SeAtXMpDTe/tsD2bSKKDDf6PIJ2VON1Y9Z6PGnPNZE0aglsoUD0Ca3GeRqCF3gySh7l8PMeeCTmwyJJnfkvDiMBpbKl0tydmqJTcjXl0QfkJK8PMyL1qe9wzNY2ez38MA9YN24LiLFVjvX0cZ4tjU/rQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kXWvCHVlK96+awYz1vyfuknN9WBoGE4w4r6IhbSLuuQ=;
 b=ICM+yYlP5ky29YNyz8/LOHRXdLWneyWk+VXKXkUVPWeAGbgrq9Kmbr9kd4e6JPlEcIUOo9eaEl406s+rIbe2YdPGSgfxR6MijpeOL1Kpt1lfeXW28MSVJC1emaY4QdH5hzhAazKUKkFXKeUYgoOseimLpTYT4RqZe7p3//8uV9EADBebDcvtSkSPLf6QBbNpihpxDrjqzqtbC6C4ErAkYnk9h3oN+JNToVVS76LEkPZVo+H3XrofCdWJcbenbVR3jEeWPxjjkIUF9RbnD8Py5iyznPtfB2FOtCSBJyJGMSS2nDfJXvoBtX/jtrOZiiCgM0f7GamrnkOL4ONRepxTCg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kXWvCHVlK96+awYz1vyfuknN9WBoGE4w4r6IhbSLuuQ=;
 b=TGlKonKX3xOeCf/ShKUC469JjSskcgDhCQlNwISKnkC1s4a5vmELVwJ5EHTYA79SZ6wOA28zcGEHDnWs40I/it52ANqYhG4soToUlppNBSNwiM3QCv9+m3sppF5j0pXYlrxNQTBy73Y7IqBvLG/HcODRyGb1n6gWxtwsTlw4Lwo=
Received: from PH8PR10MB6290.namprd10.prod.outlook.com (2603:10b6:510:1c1::7)
 by BN0PR10MB5095.namprd10.prod.outlook.com (2603:10b6:408:123::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7472.41; Thu, 18 Apr
 2024 12:40:03 +0000
Received: from PH8PR10MB6290.namprd10.prod.outlook.com
 ([fe80::309b:26bb:11d5:cc76]) by PH8PR10MB6290.namprd10.prod.outlook.com
 ([fe80::309b:26bb:11d5:cc76%6]) with mapi id 15.20.7452.049; Thu, 18 Apr 2024
 12:40:03 +0000
Message-ID: <271372d6-e665-4e7f-b088-dee5f4ab341a@oracle.com>
Date: Thu, 18 Apr 2024 18:09:53 +0530
User-Agent: Mozilla Thunderbird
Content-Language: en-US
From: Harshit Mogalapalli <harshit.m.mogalapalli@oracle.com>
To: jayalk@intworks.biz, Daniel Vetter <daniel@ffwll.ch>, deller@gmx.de,
 linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org
Cc: tiwai@suse.de, namcao@linutronix.de, bigeasy@linutronix.de,
 patrik.r.jakobsson@gmail.com, LKML <linux-kernel@vger.kernel.org>,
 Vegard Nossum <vegard.nossum@oracle.com>,
 George Kennedy <george.kennedy@oracle.com>,
 Darren Kenny <darren.kenny@oracle.com>, chuansheng.liu@intel.com
Subject: [bug-report] task info hung problem in fb_deferred_io_work()
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: TY2PR0101CA0010.apcprd01.prod.exchangelabs.com
 (2603:1096:404:92::22) To PH8PR10MB6290.namprd10.prod.outlook.com
 (2603:10b6:510:1c1::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR10MB6290:EE_|BN0PR10MB5095:EE_
X-MS-Office365-Filtering-Correlation-Id: e509e131-1d66-42db-921b-08dc5fa4ab62
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: adw5hTiZQVJtCoiPPkvhgfls/l1nxfvgPINNAMQ5L2EbGIW11Z73ExUMOVHrzHJbsW2HvVEQNbd7KNgQGkmYBaCiPryV04d/rQsJk38BuFG9qTVeGOiyO96imF+gfJPeAR+YzYmDU8AEEWR9aMUyAgTSi3xXUVvhx4SFyyN0vErPP496ewaSb7+g31hRcnzDvHvho4AUnKFANPnHwp8R91sjdzSuaPxt8SOvrYTmyLLmtw284ZGABoufXuDWITorpnW7bXV2EVMCjI2qAgjzFl9YZHVc85FxkkxNEEiN/GEeNwWa9zY79svUCr9kQCjeTJ7lSgVvW6mqCaVpaN2wAA7EzppAfVnwMXuUN+g9xx28yICsWimjbZno2VdUXqRN0/aonct6GzykcsCU7BRcClBmCXl7uXqo8ZD4Hu7rupkR7so6ZiGsqoEdjRP8sMSGcDo5eEv5pkBko0CuoLWRxxubeHxMQ/dS5D3enItb0KNW4MczLSsB8dUsTAQd8u0Y7u2ILGqFGG3FlneI1BbjV3uv0wfOi/SeXTi2NTB5X7j07JHTNklCPgU3Dx4RYS7PflvV6qDXNPsuoCdkr7HLdueEp5NQKgo1zXjUVDZtBagTSmZBTgTzYsIbtcDbcZhZLgkVfcEvtIScIR+P6SdQF3pp927ananaWk2DyX4XhEU=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR10MB6290.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366007)(7416005)(376005)(1800799015); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SDBwSDBOMzQ0S0RLMUM4VWZ2cnZjV1RIUHdGQVhDbVgrNmpTYnBTMzRaeWUx?=
 =?utf-8?B?a25SN05LQkZxWUpVUDFYVllweXY1ck56VmJ1Y3BJQmlrMXBpdkJuNnFPRHhv?=
 =?utf-8?B?R2hiUDZkemNlTnNDKzcrUFF0RXFHM3hiUlpKelZwMTNBWTZzVnBlQWNLaS9V?=
 =?utf-8?B?dUN1amxTZkhjL2ZrRDdNTkYzU21Da1JnamZUT0NvUExGa0NCNmpzN3dSSTBP?=
 =?utf-8?B?dWMxK1U5aURpZENrNDVPd0FTUDFHdnl6aG9DS0xhZ1dCdkZobllIZ0pQT0tn?=
 =?utf-8?B?MUV2NmlObU5IK2pwT1pLeE1jejZCdHptS1ZFbVpCUEdDQTJkeEVvemRRZldB?=
 =?utf-8?B?MjBBMk45Z2hzYjFlUFI3WitoYVpUUkxFVTIxU1RKVTBCRGpuNWtIbElkSWVT?=
 =?utf-8?B?clNaZVBiU21yaEo3Q0R2c2QrcllpQ3AyMHQ5dDl2Rjl0aHZUMVpxaWhpV1g5?=
 =?utf-8?B?OHgxWTdTbEJnWEpRejgvb0NZcTYrVnY2b1BOSkVXS3NnY1c4S3dheVFaQm1r?=
 =?utf-8?B?N05VSWM5bjJKRmZuS0JkUnNLSXN6bUFFbEViWU5FV0RPTXlkSzNDbFNTSkUw?=
 =?utf-8?B?dkwzM0orbnFUd1FIMjFKMFlMNTQwejJqYjFoZTYwWVdQaGtEQUdtNUJNTXBM?=
 =?utf-8?B?QUlPZHhGeXpsNnFzdDF2NEpvQlRWRFoveUpXZ2hmNnV6VG1iV2dHSDE2bEU4?=
 =?utf-8?B?RUp2MjhQT3hZRE0vREx2RUJvVGlFWkRwZmkzU1FORkRjZkwvS0ZPTkd4OVhl?=
 =?utf-8?B?eVg3R2JpME1DZGVHaUpwVys5Q1FmNGpibzVNT2VOc2NPbXI0VTFhMytQUVYr?=
 =?utf-8?B?S2p2VjF4bXVBODhpaFRqalR2ZDBCcStPTGJmaVJCejV6TUhzRXZ2MEtoNjNl?=
 =?utf-8?B?Q050MDI2Y1c2Mmpla1JwSWVsL2dGVjZUWTZTTTAvbWVwK0ZPdWZOSzI5S2ox?=
 =?utf-8?B?RWtGYnJOcjhQYU41TVQ5YkdmdnV0bEh0MSszSmVNZXJyT1N3blU2QmdGOWR6?=
 =?utf-8?B?SjI0YXpoSnFZT1RvNTlwamVpTDl3bVo4Rk44YlVVTUN0VmtSWUFQbXVFeXhu?=
 =?utf-8?B?TzJ1NU5YOWVucnlsaGRmTHJJNUFOWktZc1dGbUs5WVdjNkFvazJQcVJXYTZK?=
 =?utf-8?B?NjM2YW9oeE5USEh5bzU4c29jaDVBSlAwTGR6ZHBMd09iQU00WTcwKzFuWWtx?=
 =?utf-8?B?SGg1Rjc0MFp1Q2lCR1R5bnU4alhweEx5MmFBVG4vay96eUpKWERnRHF2N2pJ?=
 =?utf-8?B?SExETDhHNG5QL2R3RUg1eUdHS0Vka3ZtM3pPZUZac2p5bjJFL0lvMGM5eWhU?=
 =?utf-8?B?SnQvNFVkc2pXek1BYktMTXBHVC9LZnlCMTA1YXJ3eG1MaWJrQnYwcy9VNk5O?=
 =?utf-8?B?bVZjRVNKUGRCK1grc1pDRGEyZnp0N3dZZXpEQm1PeVNETXB2VDJtNVRTdnFy?=
 =?utf-8?B?NkFjQnEzZEF3UEdqNlNuc1NQT2plbzBUN3p4eUl5SkVMQ0gzZ2IyN20rTm54?=
 =?utf-8?B?U2NMTUVnZmgvMjF2b1dlYmJieDQvd0FmWm0wU3p2bVJINlZFWEI1SjRRR0gw?=
 =?utf-8?B?WWhtVzBTVlVUVTBkbEJjRlE0ekVaSVpUTWR4M21waHJGdzBqSnlFeGk1KzFm?=
 =?utf-8?B?YkV2WWtFVytOZFR2Nm9Pd3VxeFpNUmhFYnFDcmo3LzJBMW04QnI0L0hCQkFV?=
 =?utf-8?B?b1I1dXFMRFgrbnp0T3NyMHIwOWJXSFNrbm14VDJXYmczTGtxSElWSWgwM1lu?=
 =?utf-8?B?K0E3eWVZWm1hYjAxMlhpU3NMVmFnRFhGMXNHOUlKeXRLYzdDYlZXaGxJMnRa?=
 =?utf-8?B?YkZPeUxZTWVzUDZPMnlpOExzVm5SWXRXTytPM3c3emlmZUZMRklHbXVYWXdp?=
 =?utf-8?B?NHhmcGVHd3JmY3RCeWgrRWpJTGw1TFFjZkdnd2xPNTU0Q0c1WCtvNlBRMGR4?=
 =?utf-8?B?aEE4NkFkaHpub0FpNERiNXBHK2NsdHFKYjBGWk0rcks1anhyOXRSemlPMXlt?=
 =?utf-8?B?RzFTSk55VGRkSGRzODFWUitPcDdzK3FDbnpSM0owa3ZPSDd0dmhid1haeld2?=
 =?utf-8?B?RGg2WHhvYmFVTXE5UGdCdnZLNnJUVFZkL2YwYXg3VHo5cWpFQVA4OFQ2MHpV?=
 =?utf-8?B?cS9iMGMvcC9NMm5GSFhwT2IvNWVNTG1PSTk3RGp5azFld3A2RzhISHZiT0sw?=
 =?utf-8?Q?TAW8Ds3NyCyqKXQiClMSU/4=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: d2P7rzmBh33V67h0yfiq/sEa1PIWdVP0n/RbHOzt+ccapxeyvLeCzrad9rBe3+8Kv+UJ0dXbz05oZfYFK+4X/F9bnlJ9z/z3Dldvmf8FgFpPbat25FCiOB3aECbQW8KVuG6t506W7iiysy+uaj76fDI+sui7van+Jg2EwuEnJKF4CgBN4Z8J7txiDA2Wq0RNCyaDoUeUOSz2o7CckFXnJ9iaVpRt9pkz+QwSLHOfXP6uzQ5HjwJWcHgyaCpGmLz0LFYKb4UuMWQzyby2jZFelMJZQRyhxlXBlCXYoY578mZW80zx+OIBKNdNp+hRRkIJDz/mbw1c2Imxm98rAkdIHBIEKXTCrDmHVJ/bY9S6NwX0AatEyzy4QyK1CnHCtqfFLgaorB6ZHY26hwsvmLxBvEw/YprC6wXL6wBNw9tJmqXwZ2mbx1/9Kma/QFVXvxkawfraaISz4WIlOwDEpZY8Qrc7lYq8+OopMCqeZr9YIQ9Vs+s2nSQFxSIx4MkbRp7BCS9zdI7UrR3GGh48G7By6WnG8d/hWRUu3rkRmb06Few8oZRYm8Q+cOc0wKGcWLD7GGbCcrsv/PTe3m41KzMUJPnLGcIkIhpit5vEiyitJF4=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e509e131-1d66-42db-921b-08dc5fa4ab62
X-MS-Exchange-CrossTenant-AuthSource: PH8PR10MB6290.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Apr 2024 12:40:03.6938 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AHMY2tAAVby0rmUmtte07znCRkvON3a+qoSYIq4INTX5UUC2XWLekpNbi4BR+mvPzeGiX1KJamlZKY092WdK07JJHUS7xWAim8pA3V/7cWu8NKrM2pQB0mvCLeoiDlQ1
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN0PR10MB5095
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-04-18_10,2024-04-17_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 spamscore=0
 mlxlogscore=999 phishscore=0 mlxscore=0 malwarescore=0 bulkscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2404010000 definitions=main-2404180090
X-Proofpoint-GUID: NeqY2lKAOW0VlIsD_FQOHib8OOj2kLKZ
X-Proofpoint-ORIG-GUID: NeqY2lKAOW0VlIsD_FQOHib8OOj2kLKZ
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

While fuzzing 5.15.y kernel with Syzkaller, we noticed a INFO: task hung 
bug in fb_deferred_io_work()


This is in 5.15.149 tag, and this is introduced by a set of commits:

2655757a3f10 fbdev: flush deferred IO before closing
15492bab7393 fbdev: Fix incorrect page mapping clearance at 
fb_deferred_io_release()
87b9802ca824 fbdev: Fix invalid page access after closing deferred I/O 
devices
9a95fc04261f fbdev: Rename pagelist to pagereflist for deferred I/O
186b89659c4c fbdev: Track deferred-I/O pages in pageref struct
e79b2b2aadef fbdev: defio: fix the pagelist corruption
0616b00a31d6 fbdev: Don't sort deferred-I/O pages by default
5d3aff76a316 fbdev/defio: Early-out if page is already enlisted

I then tried if it could be reproducible on upstream kernel as well, and 
it did. below is the call trace with latest 6.9-rc4 based kernel. I have 
enabled the LOCKDEP to get locking related information.

  INFO: task kworker/0:3:1077 blocked for more than 122 seconds.
        Not tainted 6.9.0-rc4+ #54
  "echo 0 > /proc/sys/kernel/hung_task_timeout_secs" disables this message.
  task:kworker/0:3     state:D stack:0     pid:1077  tgid:1077  ppid:2 
    flags:0x00004000
  Workqueue: events fb_deferred_io_work
  Call Trace:
   <TASK>
  __schedule (kernel/sched/core.c:5409 kernel/sched/core.c:6746)
  ? __pfx___schedule (kernel/sched/core.c:6617)
  ? schedule (kernel/sched/core.c:6804 kernel/sched/core.c:6837)
  ? __pfx___lock_release (kernel/locking/lockdep.c:5406)
  ? schedule (kernel/sched/core.c:6804 kernel/sched/core.c:6837)
  schedule (./arch/x86/include/asm/preempt.h:84 kernel/sched/core.c:6824 
kernel/sched/core.c:6838)
  io_schedule (kernel/sched/core.c:9019 kernel/sched/core.c:9045)
  folio_wait_bit_common (mm/filemap.c:1272)
  ? __pfx_folio_wait_bit_common (mm/filemap.c:1206)
  ? __pfx___mutex_lock (kernel/locking/mutex.c:751)
  ? lock_acquire.part.0 (kernel/locking/lockdep.c:467 
kernel/locking/lockdep.c:5756)
  ? __pfx_wake_page_function (mm/filemap.c:1091)
  ? __pfx_lock_acquire.part.0 (kernel/locking/lockdep.c:5719)
  fb_deferred_io_work (./include/linux/pagemap.h:1069 
drivers/video/fbdev/core/fb_defio.c:248)
  ? lock_acquire (./include/trace/events/lock.h:24 
kernel/locking/lockdep.c:5725)
  process_one_work (kernel/workqueue.c:3254)
  ? __pfx_lock_acquire.part.0 (kernel/locking/lockdep.c:5719)
  ? __pfx_process_one_work (kernel/workqueue.c:3156)
  ? assign_work (kernel/workqueue.c:1210)
  worker_thread (kernel/workqueue.c:3329 kernel/workqueue.c:3416)
  ? __kthread_parkme (kernel/kthread.c:293)
  ? __pfx_worker_thread (kernel/workqueue.c:3362)
  kthread (kernel/kthread.c:388)
  ? __pfx_kthread (kernel/kthread.c:341)
  ret_from_fork (arch/x86/kernel/process.c:147)
  ? __pfx_kthread (kernel/kthread.c:341)
  ret_from_fork_asm (arch/x86/entry/entry_64.S:257)
   </TASK>
  INFO: task r:2664 blocked for more than 123 seconds.
        Not tainted 6.9.0-rc4+ #54
  "echo 0 > /proc/sys/kernel/hung_task_timeout_secs" disables this message.
  task:r               state:D stack:0     pid:2664  tgid:2664 
ppid:2618   flags:0x00000002
  Call Trace:
   <TASK>
  __schedule (kernel/sched/core.c:5409 kernel/sched/core.c:6746)
  ? __pfx___schedule (kernel/sched/core.c:6617)
  ? schedule (kernel/sched/core.c:6804 kernel/sched/core.c:6837)
  ? __pfx___lock_release (kernel/locking/lockdep.c:5406)
  ? schedule (kernel/sched/core.c:6804 kernel/sched/core.c:6837)
  schedule (./arch/x86/include/asm/preempt.h:84 kernel/sched/core.c:6824 
kernel/sched/core.c:6838)
  schedule_timeout (kernel/time/timer.c:2559)
  ? __pfx_schedule_timeout (kernel/time/timer.c:2544)
  ? mark_lock.part.0 (./arch/x86/include/asm/bitops.h:227 
./arch/x86/include/asm/bitops.h:239 
./include/asm-generic/bitops/instrumented-non-atomic.h:142 
kernel/locking/lockdep.c:228 kernel/locking/lockdep.c:4656)
  ? mark_held_locks (kernel/locking/lockdep.c:4274)
  ? lockdep_hardirqs_on_prepare.part.0 (kernel/locking/lockdep.c:4300 
kernel/locking/lockdep.c:4359)
  __wait_for_common (kernel/sched/completion.c:95 
kernel/sched/completion.c:116)
  ? __pfx_schedule_timeout (kernel/time/timer.c:2544)
  ? __pfx___wait_for_common (kernel/sched/completion.c:110)
  ? start_flush_work (kernel/workqueue.c:4192)
  __flush_work (kernel/workqueue.c:4207)
  ? __pfx___flush_work (kernel/workqueue.c:4195)
  ? __pfx_wq_barrier_func (kernel/workqueue.c:3742)
  ? flush_delayed_work (kernel/workqueue.c:4249)
  ? __pfx_fb_release (drivers/video/fbdev/core/fb_chrdev.c:375)
  fb_deferred_io_lastclose (drivers/video/fbdev/core/fb_defio.c:321)
  ? __pfx_fb_release (drivers/video/fbdev/core/fb_chrdev.c:375)
  fb_deferred_io_release (drivers/video/fbdev/core/fb_defio.c:333)
  fb_release (drivers/video/fbdev/core/fb_chrdev.c:383)
  ? __pfx_fb_release (drivers/video/fbdev/core/fb_chrdev.c:375)
  __fput (fs/file_table.c:422)
  task_work_run (kernel/task_work.c:180 (discriminator 1))
  ? __pfx_task_work_run (kernel/task_work.c:148)
  ? do_raw_spin_unlock (./arch/x86/include/asm/paravirt.h:589 
./arch/x86/include/asm/qspinlock.h:57 kernel/locking/spinlock_debug.c:142)
  do_exit (kernel/exit.c:879)
  ? do_raw_spin_lock (./arch/x86/include/asm/atomic.h:115 
./include/linux/atomic/atomic-arch-fallback.h:2170 
./include/linux/atomic/atomic-instrumented.h:1302 
./include/asm-generic/qspinlock.h:111 kernel/locking/spinlock_debug.c:116)
  ? __pfx_do_exit (kernel/exit.c:819)
  ? __pfx_do_raw_spin_lock (kernel/locking/spinlock_debug.c:114)
  do_group_exit (kernel/exit.c:1008)
  __x64_sys_exit_group (kernel/exit.c:1036)
  do_syscall_64 (arch/x86/entry/common.c:52 arch/x86/entry/common.c:83)
  entry_SYSCALL_64_after_hwframe (arch/x86/entry/entry_64.S:130)
  RIP: 0033:0x7f9cfe71e5f1
  RSP: 002b:00007ffd636aec08 EFLAGS: 00000246 ORIG_RAX: 00000000000000e7
  RAX: ffffffffffffffda RBX: 00007f9cfe7fc510 RCX: 00007f9cfe71e5f1
  RDX: 000000000000003c RSI: 00000000000000e7 RDI: 0000000000000000
  RBP: 0000000000000000 R08: ffffffffffffff80 R09: 0000000000000000
  R10: 0000000000000020 R11: 0000000000000246 R12: 00007f9cfe7fc510
  R13: 0000000000000000 R14: 00007f9cfe7fc9e8 R15: 00007f9cfe7fca00
   </TASK>

  Showing all locks held in the system:
  1 lock held by khungtaskd/50:
  #0: ffffffff950219c0 (rcu_read_lock){....}-{1:2}, at: 
debug_show_all_locks (./include/linux/rcupdate.h:329 (discriminator 1) 
./include/linux/rcupdate.h:781 (discriminator 1) 
kernel/locking/lockdep.c:6614 (discriminator 1))
  3 locks held by kworker/0:3/1077:
  #0: ffff88810005ad48 ((wq_completion)events){+.+.}-{0:0}, at: 
process_one_work (kernel/workqueue.c:3229)
  #1: ffff8881080dfd98 
((work_completion)(&(&info->deferred_work)->work)){+.+.}-{0:0}, at: 
process_one_work (kernel/workqueue.c:3230)
  #2: ffff88811416db38 (&fbdefio->lock){+.+.}-{3:3}, at: 
fb_deferred_io_work (drivers/video/fbdev/core/fb_defio.c:246)
  1 lock held by r/2664:
  #0: ffff8881141fe078 (&fb_info->lock){+.+.}-{3:3}, at: fb_release 
(drivers/video/fbdev/core/fb_chrdev.c:380)



Syzkaller initially generated a long reproducer, Vegard simplified it to 
the one below

C repro:

#define _GNU_SOURCE
#include <sys/mman.h>
#include <fcntl.h>
#include <stdlib.h>
#include <unistd.h>

int main(void)
{
         int fd = open("/dev/fb0", O_RDWR, 0);

         char *ptr = (char *) 0x20000000ul;

         mmap(ptr, 4096, PROT_WRITE, MAP_FIXED | MAP_SHARED, fd, 0xff000);
         *ptr = 0;

         mmap(ptr, 4096, PROT_WRITE, MAP_FIXED | MAP_SHARED, fd, 0);
         *ptr = 0;

         return 0;
}

This needs to be run as root to see the hang in 122 seconds.

238 static void fb_deferred_io_work(struct work_struct *work)
239 {
240         struct fb_info *info = container_of(work, struct fb_info, 
deferred_work.work);
241         struct fb_deferred_io_pageref *pageref, *next;
242         struct fb_deferred_io *fbdefio = info->fbdefio;
243
244         /* here we mkclean the pages, then do all deferred IO */
245         mutex_lock(&fbdefio->lock);
246         list_for_each_entry(pageref, &fbdefio->pagereflist, list) {
247                 struct page *cur = pageref->page;
248                 lock_page(cur);
249                 page_mkclean(cur);
250                 unlock_page(cur);
251         }

It is stalling on lock_page() in fb_deferred_io_work()

I will be happy to try any patches and report back.


Thanks,
Harshit
