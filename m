Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AE80758E40
	for <lists+dri-devel@lfdr.de>; Wed, 19 Jul 2023 09:01:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 97B7E10E1C1;
	Wed, 19 Jul 2023 07:01:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com
 [205.220.177.32])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 53B5110E3E8
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Jul 2023 23:44:54 +0000 (UTC)
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 36ILedJf031152; Tue, 18 Jul 2023 23:44:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=date : from : to : cc
 : subject : message-id : references : content-type : in-reply-to :
 mime-version; s=corp-2023-03-30;
 bh=kdA2oJpjUl3fMCzthY9DQjuPW7B9bNzxpaLxCSGse/8=;
 b=F7gLkcXBPmh0cHNien2NjEXut6TcsCsU95ma/azykM5RGWpdD/VPc8AYuEqQLYFy8/Z4
 h/kjDMp8OpDaywJ3Jsyy/oGfumD1L6UZeNrhxgCySVgAuCiFcO1v21lyzdvmQ5R6Ta/c
 flDiBY2DIgz+xQ3fM3b8oRTpTBufI3iiFnP0+61KvnO0cnIw3coqxwhHf/ptp4Wm/w8E
 1/4zdsnv64OBoKofC3m82J8ZW65g9gY26yj8BI3f7rDDuVz6e6CCx1mCG3DtQOecBSn2
 U1jCJoBAY8BVhw6mi2GZrgiEafHDjjCMxOtDLD2HA5+FFEf/2N/b3FGdeevHf2MurFm4 Mw== 
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com
 (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3run7868u1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 18 Jul 2023 23:44:44 +0000
Received: from pps.filterd
 (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
 by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.17.1.19/8.17.1.19)
 with ESMTP id 36IMWEdB019218; Tue, 18 Jul 2023 23:44:44 GMT
Received: from nam10-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam10lp2107.outbound.protection.outlook.com [104.47.55.107])
 by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id
 3ruhw6d147-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 18 Jul 2023 23:44:43 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TAa2fKDiQAAkI0GMBTey4pAgtAMjkaX9Ip8Py2jK0heFNcyJjSk4Ks78bAvWAoljxt903+PL5Gd8T8XpC7e6d4MSl/6IYu6PYZPDAO3ZfrfEJWEYvD1oQxdncyhCT6hDt7GU70FEOydPjI0ZkKqgAzwu3nJuL6VuISYoOEOl4gUzwF9kP7Jdnw642D8M1AttIHXlkR96zJWh5dwxl3fiM6WsBfV6iMxoTM6IM1wOAvt4CMWkBRAeK9C5kefcJVBa3FyozqHeG3kUCnEn5UrYUsuiDm2ZWJ6bCrE0OmiCA5dcsOQlCatC/wLHCHNjq8on22Q8xg9tV07/RKgN3WlZVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kdA2oJpjUl3fMCzthY9DQjuPW7B9bNzxpaLxCSGse/8=;
 b=dXXeX4rLXxSKZnbTiK1NWfQtCXRYJtF2pUzLyLEAmRBTeiusua6FsWhuqHxYdBPDirulyVULQ9OxBthPHFJI5iiKT/Nbw2dGEIRep8b8+gH8YPqzylHIXoDPs0TVAUgP4EW+Ss4PARq9NLL9eLuw3VIJBxFG75q0P/9QINQ703auiQMRclPVv45zsh/VzV7rsaoLEfP2/Ro7yCZ4OuC3jrrvzcAvoV0jfUIOA6yUjH3+RLD740QpZ5hDgjT6cnx72hCeqm7wBGpj2jdiftjdg+ARj3lkpmMz41WtbaT86IJC7Um1GwO5DRAPq76sDEAJRjigGPfmOHeNj/rYJTuR2Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kdA2oJpjUl3fMCzthY9DQjuPW7B9bNzxpaLxCSGse/8=;
 b=mWVoX2E02ORDqf1TtClXw0rO9jwJsHjNxGM09S3cHi5BwIDNzAcDpTHnSNJb5PUinhXOWAcO0vrReloPgDLqYuOIEDqp1mor+Eg29NhNpSr+GsotA0OlblPWfkEZn25AZLrwyKcNnQCdbaC9C2b1/xjbhiBvBaVwlVZieZv4p6g=
Received: from BY5PR10MB4196.namprd10.prod.outlook.com (2603:10b6:a03:20d::23)
 by SN4PR10MB5560.namprd10.prod.outlook.com (2603:10b6:806:203::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6588.32; Tue, 18 Jul
 2023 23:44:41 +0000
Received: from BY5PR10MB4196.namprd10.prod.outlook.com
 ([fe80::4a17:13b0:2876:97f2]) by BY5PR10MB4196.namprd10.prod.outlook.com
 ([fe80::4a17:13b0:2876:97f2%7]) with mapi id 15.20.6588.017; Tue, 18 Jul 2023
 23:44:41 +0000
Date: Tue, 18 Jul 2023 16:44:36 -0700
From: Mike Kravetz <mike.kravetz@oracle.com>
To: Vivek Kasireddy <vivek.kasireddy@intel.com>
Subject: Re: [PATCH v2 2/2] udmabuf: Add back support for mapping hugetlb
 pages (v2)
Message-ID: <20230718234436.GB10413@monkey>
References: <20230718082605.1570740-1-vivek.kasireddy@intel.com>
 <20230718082605.1570740-3-vivek.kasireddy@intel.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230718082605.1570740-3-vivek.kasireddy@intel.com>
X-ClientProxiedBy: MW4PR04CA0366.namprd04.prod.outlook.com
 (2603:10b6:303:81::11) To BY5PR10MB4196.namprd10.prod.outlook.com
 (2603:10b6:a03:20d::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY5PR10MB4196:EE_|SN4PR10MB5560:EE_
X-MS-Office365-Filtering-Correlation-Id: e799e784-7a2c-459e-07b0-08db87e8f3e1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: tKycgZqDMHlY1wPlqYSJP9hagJ7vdssZGzMnqnxaxa7bhElMCp6xlZc+R8cYZPsAy0gkubN8Uzf4uz0irBPoM4/EH/k+Vzg/LX4519yY+PT95ZgJmiejqaSPw20of8kKT97v2pKxKn6Mm7PNcXtR24i+84C/NKDsZEO/1ULOMUSbyk1vjoxb2I73estvCsJs0+QKv3SUlyOiNPoOsB4H5eQoyxCOsV8pQ7C+gJv9jhY1Kh0xG4Xzk7dCRct0UlJBbpWn8aEwcO1ROzlB1/fBH0GYhvWWFJAwRwG77Ximy5zsZ5WZb1KtgPDZAwFt4P6x59DCEzJ1v+az2fJgjf3GjF+JCqjqnGrGm0OjCoFUyE1Y4SoB8o2v3Lyn+DMH8AsFbUOUFccocA72nLUE/NuueAxjjHxrPRzO5gwyTLPU9YWjKMOLzOU1hhPuCroC5a0Eau991efz0n+F9aJJ+Ik03sK6KZQCgBskivcgH4XD89XfdoA+St/92cpbAfSzduTTgA0q5oKdM5Zx/ENEQ5KTTWpGbfknEHiZAqPDx8w1FufBpM0Zwfes3q0qlHmdlQKJ
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR10MB4196.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(7916004)(366004)(376002)(136003)(346002)(39860400002)(396003)(451199021)(6916009)(33716001)(316002)(66946007)(4326008)(86362001)(9686003)(38100700002)(6512007)(6666004)(478600001)(8936002)(54906003)(41300700001)(44832011)(66556008)(7416002)(8676002)(66476007)(6506007)(5660300002)(1076003)(53546011)(26005)(186003)(33656002)(83380400001)(2906002)(6486002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?9Eix5JfAV4WJCWHs3i0p7LOT8/JLPfSL6SX8uNDLgPrgMYYs+WtxwvDGOA0k?=
 =?us-ascii?Q?nGBlQ78zysG5MzAGAgxmyVzA3hqOvM123Nf8b6ytZz5itJU8yZUSBgsid549?=
 =?us-ascii?Q?31P/9v0JtYgsw5jRRDL01seGrObVZrkXst92rF8OSiqzWjZ1d0sG334eBH/Z?=
 =?us-ascii?Q?yevYMOCiZUsnUx1DhflGw5ewpEnEGAPLuUE4MTCSArh4hG76Ooz/YvF7CK6r?=
 =?us-ascii?Q?D3m4AtQ1ZxUQ0uPJW/zneEAr7WffSaTxDWuhNsagByHwEGBuE9PIDoaWoDJS?=
 =?us-ascii?Q?dwr8a7g6LMQb0lPF1G0LMRyfBprvT/rR1n9F0pqss1F9w+IMMSlB9lSBan/l?=
 =?us-ascii?Q?c0/1L1wxRZvIa3wBfIRoBCcBM572UCWe4/BIrO9nyMV1a5UtxjoY9YXBiDBo?=
 =?us-ascii?Q?pZgY/bwHpoyMgcvBe96nk0ieRH88GYIVmMBbsZ4OFatjXC7dqsuHxVXMX57l?=
 =?us-ascii?Q?PoWQA94/MYdJAnbIv81nA7s6NrKGJruxvQXj21f8/NyO6JFrW8NzRq+6vpUJ?=
 =?us-ascii?Q?Jmb8B95rsmurfaoOOzsUdoWaE6F+Vgf+GzyWV/aVCz+OzsDFvs4VYQw9lUWt?=
 =?us-ascii?Q?Fx2j7wzFa8Me5/HJpkABCmtXyUSmm+xXfTzXsTMvV8TNuH1JiOlEgcR2eSjb?=
 =?us-ascii?Q?ia09JufrOVxgTLEXVbj93oSH/UaAvr473FoYrIWb+EvSmKR0z2Lb02qCrAoR?=
 =?us-ascii?Q?MNhi4vo91sf+2Dp6L1RSH6p2GHJZL39J/UtASbe4vuMsQz4QqhE5Sx5zB8Hr?=
 =?us-ascii?Q?YYaXL269ZknagCFXTe1GR9ExH3JX96U1XRBUoOJF/T/0ptm6ZYBnl9pxVFGV?=
 =?us-ascii?Q?CROCwzOfVD1hASpAKqqeJXMlGBziLoAVUras9i+P2bVztfZwZZKx0V4EFhk2?=
 =?us-ascii?Q?amnv1Xw23xq+7I6MOim0J/qO6qVeTkkvs/rwxwqzJC/GH4nX3FEbz9jbbTw4?=
 =?us-ascii?Q?AiW7ezLzzWkPkik0L7lrTybXLq8i8eaCc7XLQbiq4z8rRZYwqxrjUKMSlX3Y?=
 =?us-ascii?Q?dXEnH0FgZsFVWlt3tzt4gHlF76o12w/b+dYt1pkLzBy9yCmjc8NWNF8xKFq4?=
 =?us-ascii?Q?b0mpiR5kKAh2YUBshwqtgq0k7qTQmWg6cd8FRh/q/uf5b8GYqbCVyu1xWB7H?=
 =?us-ascii?Q?C4MSoZMWfOSXbjucjAVW4Xt7GWvhKLnmVqszlF2iAy3xD4WXZxqlYnVUK6Dk?=
 =?us-ascii?Q?83DLe0lOMEk7EnuwC+5j9qWgfrj9dh+WqH6D61kYt3pUccvwW5ivpXeVABdD?=
 =?us-ascii?Q?sryjWmH0mxPMecZCTR9gMBjmlCcoOXXE0wuWGLrIJuKsGfub61GSMx9eiV+e?=
 =?us-ascii?Q?tuc8w0RMOiLhtN2HtBPwwWKkPqU6smOjgJiKlzAy/d3lKuApsfgWoY9Pvjut?=
 =?us-ascii?Q?h42IbiX7jtzW0fIjdhG16VV9OZpT9gKsfF152uPooHkKEnEe9p9FHv12rGsq?=
 =?us-ascii?Q?D2fkFWopvV05TO4kHb7cDVPtghwKeNKHNk9Uhj3X4n9gaPVJoc/8zgWe57b7?=
 =?us-ascii?Q?5j0Snu7FRJMeBKZRiE3TEjiStw83uO3l+0b69wbp1DnXQ5Y0sZ58Z0Iw+Oq+?=
 =?us-ascii?Q?B0yxE9QrbNBgWD0BcgCelepIZGNIqnALutggJzqi?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: O9SEV1+Zyv/I4n7iw7umuDTVyw5Brc/HQD7+yBU7KB4jDJ6FkGn2hsE+Hvn9KgqkdZr1HpaSphbgbUG6KZnGtHCr6FiW2q65E0a4dKzvwXMQEgSFTK04t1xClsdg7/L5wen0otFqEK9+Ok+e4DWComOcm+fBhbwaFrgtZRETmO73P8Qe+lECEmSIZxbO6lkIshWJgvnChzxoqmgB6JWpHP6vZhyjyg6evBh7o8O+jAE/9VWUw1EZcYecgABTLX4kZzCxtDMzDQR2VCYh4DnQtcWT7+Fj13ZwkLOd7t03059VZMnujbbbYmVfBby2mB6xQC2RZcSQ52KuRnKlCGEo7mc6ZEfcCtVIqDTG70u6JfsoTUtVgTdUOZeqZCvIQGo6XYKD7NjGo0Q+LyQbq0w9FxRMm+9GyNpCVENvD7NKKRLmG0nRTLmWDy+HmOW9DMmqbwi5/Vl8Qg1un0FeI9So9L47QWwcXMTtTVLsahlSyKtJroC3RMOhQRZBvbIZhtt/HpfDMqcJzqrHhYW/KMqNEvmr4BmLzbR//3qhzfbDhbEV6V2a1YIWWZIHPs1uUbqynUJxxdK9Mx9f9ygwbzIXiVaRcch1bUyXTDwMrAY/cEHUaiweRjYQlF0AG9+yET2lx8tahW9I7eacoxCIHeMsAqBsnCaB1bZyeVmhX+iCy8gJBic82IXOJ2xsmW/EKDKzeYkMwl8F2j/hafUBSKd7dM96yGNrDs5ebu06WOHhWgmn3Tu52G1OsIKTLvavJH5D8QUjuVCBeFAGta+NuZVTlSZZ9t0d4QrC+BpMol5zRgynBJNIKKD7i3gxGubrXTWTiwJ2EPBUip7UecsXoIvkU2UTOdZ59jiwvcx+bqz90GHDBM8JfXmj8eOG+L5fQdu1G0bw7c0BHGqn1lqGCeH6DvYhS5RaOcv5R9wk++g+g5g=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e799e784-7a2c-459e-07b0-08db87e8f3e1
X-MS-Exchange-CrossTenant-AuthSource: BY5PR10MB4196.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jul 2023 23:44:41.1470 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3ADZnHiDUw2A3GQAW/0oTCBU2hJxvW6qWyQ0r/RUaH4vxPM86KIy/wjNQDS8mGdUlBcx9YIxDt8ACs3qTylaHg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN4PR10MB5560
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-07-18_18,2023-07-18_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 malwarescore=0
 mlxscore=0 adultscore=0 spamscore=0 phishscore=0 bulkscore=0
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2306200000 definitions=main-2307180209
X-Proofpoint-ORIG-GUID: OXArqoMC4x-06Gtqi6-kQfXenJdKM164
X-Proofpoint-GUID: OXArqoMC4x-06Gtqi6-kQfXenJdKM164
X-Mailman-Approved-At: Wed, 19 Jul 2023 07:01:14 +0000
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
Cc: Dongwon Kim <dongwon.kim@intel.com>, David Hildenbrand <david@redhat.com>,
 Junxiao Chang <junxiao.chang@intel.com>, Hugh Dickins <hughd@google.com>,
 Peter Xu <peterx@redhat.com>, linux-mm@kvack.org,
 dri-devel@lists.freedesktop.org, Jason Gunthorpe <jgg@nvidia.com>,
 Gerd Hoffmann <kraxel@redhat.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 07/18/23 01:26, Vivek Kasireddy wrote:
> A user or admin can configure a VMM (Qemu) Guest's memory to be
> backed by hugetlb pages for various reasons. However, a Guest OS
> would still allocate (and pin) buffers that are backed by regular
> 4k sized pages. In order to map these buffers and create dma-bufs
> for them on the Host, we first need to find the hugetlb pages where
> the buffer allocations are located and then determine the offsets
> of individual chunks (within those pages) and use this information
> to eventually populate a scatterlist.
> 
> Testcase: default_hugepagesz=2M hugepagesz=2M hugepages=2500 options
> were passed to the Host kernel and Qemu was launched with these
> relevant options: qemu-system-x86_64 -m 4096m....
> -device virtio-gpu-pci,max_outputs=1,blob=true,xres=1920,yres=1080
> -display gtk,gl=on
> -object memory-backend-memfd,hugetlb=on,id=mem1,size=4096M
> -machine memory-backend=mem1
> 
> Replacing -display gtk,gl=on with -display gtk,gl=off above would
> exercise the mmap handler.
> 
> v2: Updated get_sg_table() to manually populate the scatterlist for
>     both huge page and non-huge-page cases.
> 
> Cc: David Hildenbrand <david@redhat.com>
> Cc: Mike Kravetz <mike.kravetz@oracle.com>
> Cc: Hugh Dickins <hughd@google.com>
> Cc: Peter Xu <peterx@redhat.com>
> Cc: Jason Gunthorpe <jgg@nvidia.com>
> Cc: Gerd Hoffmann <kraxel@redhat.com>
> Cc: Dongwon Kim <dongwon.kim@intel.com>
> Cc: Junxiao Chang <junxiao.chang@intel.com>
> Signed-off-by: Vivek Kasireddy <vivek.kasireddy@intel.com>
> ---
>  drivers/dma-buf/udmabuf.c | 84 +++++++++++++++++++++++++++++++++------
>  1 file changed, 71 insertions(+), 13 deletions(-)
> 
> diff --git a/drivers/dma-buf/udmabuf.c b/drivers/dma-buf/udmabuf.c
> index 820c993c8659..10c47bf77fb5 100644
> --- a/drivers/dma-buf/udmabuf.c
> +++ b/drivers/dma-buf/udmabuf.c
> @@ -10,6 +10,7 @@
>  #include <linux/miscdevice.h>
>  #include <linux/module.h>
>  #include <linux/shmem_fs.h>
> +#include <linux/hugetlb.h>
>  #include <linux/slab.h>
>  #include <linux/udmabuf.h>
>  #include <linux/vmalloc.h>
> @@ -28,6 +29,7 @@ struct udmabuf {
>  	struct page **pages;
>  	struct sg_table *sg;
>  	struct miscdevice *device;
> +	pgoff_t *offsets;
>  };
>  
>  static vm_fault_t udmabuf_vm_fault(struct vm_fault *vmf)
> @@ -41,6 +43,10 @@ static vm_fault_t udmabuf_vm_fault(struct vm_fault *vmf)
>  		return VM_FAULT_SIGBUS;
>  
>  	pfn = page_to_pfn(ubuf->pages[pgoff]);
> +	if (ubuf->offsets) {
> +		pfn += ubuf->offsets[pgoff] >> PAGE_SHIFT;
> +	}
> +
>  	return vmf_insert_pfn(vma, vmf->address, pfn);
>  }
>  
> @@ -90,23 +96,31 @@ static struct sg_table *get_sg_table(struct device *dev, struct dma_buf *buf,
>  {
>  	struct udmabuf *ubuf = buf->priv;
>  	struct sg_table *sg;
> +	struct scatterlist *sgl;
> +	pgoff_t offset;
> +	unsigned long i = 0;
>  	int ret;
>  
>  	sg = kzalloc(sizeof(*sg), GFP_KERNEL);
>  	if (!sg)
>  		return ERR_PTR(-ENOMEM);
> -	ret = sg_alloc_table_from_pages(sg, ubuf->pages, ubuf->pagecount,
> -					0, ubuf->pagecount << PAGE_SHIFT,
> -					GFP_KERNEL);
> +
> +	ret = sg_alloc_table(sg, ubuf->pagecount, GFP_KERNEL);
>  	if (ret < 0)
> -		goto err;
> +		goto err_alloc;
> +
> +	for_each_sg(sg->sgl, sgl, ubuf->pagecount, i) {
> +		offset = ubuf->offsets ? ubuf->offsets[i] : 0;
> +		sg_set_page(sgl, ubuf->pages[i], PAGE_SIZE, offset);
> +	}
>  	ret = dma_map_sgtable(dev, sg, direction, 0);
>  	if (ret < 0)
> -		goto err;
> +		goto err_map;
>  	return sg;
>  
> -err:
> +err_map:
>  	sg_free_table(sg);
> +err_alloc:
>  	kfree(sg);
>  	return ERR_PTR(ret);
>  }
> @@ -143,6 +157,7 @@ static void release_udmabuf(struct dma_buf *buf)
>  
>  	for (pg = 0; pg < ubuf->pagecount; pg++)
>  		put_page(ubuf->pages[pg]);
> +	kfree(ubuf->offsets);
>  	kfree(ubuf->pages);
>  	kfree(ubuf);
>  }
> @@ -206,7 +221,9 @@ static long udmabuf_create(struct miscdevice *device,
>  	struct udmabuf *ubuf;
>  	struct dma_buf *buf;
>  	pgoff_t pgoff, pgcnt, pgidx, pgbuf = 0, pglimit;
> -	struct page *page;
> +	struct page *page, *hpage = NULL;
> +	pgoff_t hpoff, chunkoff, maxchunks;
> +	struct hstate *hpstate;
>  	int seals, ret = -EINVAL;
>  	u32 i, flags;
>  
> @@ -242,7 +259,7 @@ static long udmabuf_create(struct miscdevice *device,
>  		if (!memfd)
>  			goto err;
>  		mapping = memfd->f_mapping;
> -		if (!shmem_mapping(mapping))
> +		if (!shmem_mapping(mapping) && !is_file_hugepages(memfd))
>  			goto err;
>  		seals = memfd_fcntl(memfd, F_GET_SEALS, 0);
>  		if (seals == -EINVAL)
> @@ -253,16 +270,56 @@ static long udmabuf_create(struct miscdevice *device,
>  			goto err;
>  		pgoff = list[i].offset >> PAGE_SHIFT;
>  		pgcnt = list[i].size   >> PAGE_SHIFT;
> +		if (is_file_hugepages(memfd)) {
> +			if (!ubuf->offsets) {
> +				ubuf->offsets = kmalloc_array(ubuf->pagecount,
> +							      sizeof(*ubuf->offsets),
> +							      GFP_KERNEL);
> +				if (!ubuf->offsets) {
> +					ret = -ENOMEM;
> +					goto err;
> +				}
> +			}
> +			hpstate = hstate_file(memfd);
> +			hpoff = list[i].offset >> huge_page_shift(hpstate);
> +			chunkoff = (list[i].offset &
> +				    ~huge_page_mask(hpstate)) >> PAGE_SHIFT;
> +			maxchunks = huge_page_size(hpstate) >> PAGE_SHIFT;
> +		}
>  		for (pgidx = 0; pgidx < pgcnt; pgidx++) {
> -			page = shmem_read_mapping_page(mapping, pgoff + pgidx);
> -			if (IS_ERR(page)) {
> -				ret = PTR_ERR(page);
> -				goto err;
> +			if (is_file_hugepages(memfd)) {
> +				if (!hpage) {
> +					hpage = find_get_page_flags(mapping, hpoff,
> +								    FGP_ACCESSED);
> +					if (!hpage) {
> +						ret = -EINVAL;
> +						goto err;
> +					}
> +				}
> +				get_page(hpage);

Is the intention to increase the ref count of the hugetlb page once for
each 'sub-page' added?  Or, am I reading that incorrectly?

> +				ubuf->pages[pgbuf] = hpage;

Ah!, answering my own question.  Since the 'head page' is added to the
array the ref count of the head page will decremented in
release_udmabuf.

> +				ubuf->offsets[pgbuf++] = chunkoff << PAGE_SHIFT;
> +				if (++chunkoff == maxchunks) {
> +					put_page(hpage);
> +					hpage = NULL;
> +					chunkoff = 0;
> +					hpoff++;
> +				}
> +			} else {
> +				page = shmem_read_mapping_page(mapping, pgoff + pgidx);

It may not matter to your users, but the semantics for hugetlb and shmem
pages is different.  hugetlb requires the pages exist in the page cache
while shmem will create/add pages to the cache if necessary.

> +				if (IS_ERR(page)) {
> +					ret = PTR_ERR(page);
> +					goto err;
> +				}
> +				ubuf->pages[pgbuf++] = page;
>  			}
> -			ubuf->pages[pgbuf++] = page;
>  		}
>  		fput(memfd);
>  		memfd = NULL;
> +		if (hpage) {
> +			put_page(hpage);
> +			hpage = NULL;
> +		}
>  	}
>  
>  	exp_info.ops  = &udmabuf_ops;
> @@ -287,6 +344,7 @@ static long udmabuf_create(struct miscdevice *device,
>  		put_page(ubuf->pages[--pgbuf]);
>  	if (memfd)
>  		fput(memfd);
> +	kfree(ubuf->offsets);
>  	kfree(ubuf->pages);
>  	kfree(ubuf);
>  	return ret;
> -- 
> 2.39.2
> 

Nothing else stands out,

Acked-by: Mike Kravetz <mike.kravetz@oracle.com>

I see there is a RFC for the coherency issue with hole punch.
-- 
Mike Kravetz
