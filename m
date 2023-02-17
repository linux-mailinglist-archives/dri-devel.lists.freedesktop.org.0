Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 26CC769B247
	for <lists+dri-devel@lfdr.de>; Fri, 17 Feb 2023 19:19:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4B28110E2F5;
	Fri, 17 Feb 2023 18:19:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com
 [205.220.165.32])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4BD7610E2F5;
 Fri, 17 Feb 2023 18:19:18 +0000 (UTC)
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 31HGP7pS003195; Fri, 17 Feb 2023 18:18:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=date : from : to : cc
 : subject : message-id : references : content-type : in-reply-to :
 mime-version; s=corp-2022-7-12;
 bh=5bb+IcPL+x/GgKx7em+MH4XZwqQ9e6XDTnEjhVpeYPU=;
 b=fkUz9mUYyJCbfxvUVHtGAkOfxNCwq8HKMQ0khuAP4N6xsrEFsJDJF6au5xJODgYVGEFa
 6MtOchguUc/nU9Z49xgCzNb6fS4r9YVaM1fxmnHX4pv60EA0PTh234dENYQyJE+MnQoD
 6OK0raw2PkLa1b5GXa8p6aArLlZmbtGMGrgna6/awEayFk9afYtWQ6gQta4N8JfKNai0
 FBHAnUyXBkdY8BJVoj75PuvTyuyHpUzYMspMbOIc9XW6YShLcHK8DtTjMCIVFELAOONH
 GbbJGRL+/3tGj2RLbj9QJJ0iVf9Njr1y9OBVwNwWpotULG4keDeWaDCFMUt0xN3RKO0E 7Q== 
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com
 (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3np1m16qw6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 17 Feb 2023 18:18:57 +0000
Received: from pps.filterd
 (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
 by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.17.1.5/8.17.1.5)
 with ESMTP id 31HGmJkp013838; Fri, 17 Feb 2023 18:18:56 GMT
Received: from nam11-bn8-obe.outbound.protection.outlook.com
 (mail-bn8nam11lp2169.outbound.protection.outlook.com [104.47.58.169])
 by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id
 3np1fa3vkf-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 17 Feb 2023 18:18:56 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lZaQOSHdYtHPxrpUBrFDaj2B0sEhivKGgV6NhMvF8R5aGZqVnPXB7qnlqixOu7yJ22srjv6wy/WJvqeZWonHSmk2m/0a5DD0Wr5JWNwmu+xfYL91c0fQvuFnvTwbm2w0vyhlQVtTt+K0ZWK3+r1dzipzH9RbonC6K0Lqg+gZ5trwp045+cKh97Ns4O1Z5D2k0OCOgWcBx5CBBJ0pv/PdAUnZGh/g4pNLopguGgOEHqSiuNZi9qExAaN9y4thHk+9s+hrLLxB1VIWhzQUDUmUO4ddxzuwNktzcws33wFhSIGDCHYXA+PD9ReQB53XOzme3iBUsayLVdpEdO83BN22jQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5bb+IcPL+x/GgKx7em+MH4XZwqQ9e6XDTnEjhVpeYPU=;
 b=iOEvV8LtR7WgIk03sF7HVioB2J4LzGjvhILScV7k3bKcl1+pJGaQU74n7/6FlplGJLyOdY4mIFYooh2CPkvV6BZjeJuP4MazoZyNK4Bta2/8hMHmkvEhdeV6NVWYvJi0JVOvU7C13vrMLOCYThfTAgzVQBGmdNn5RyDqYkXHeY/Dhj+Glj8pCFJr1yJZX5xVx1dupufJ3NsjijfVYlNlQhaMZ64ckQVUU8aeedJF+1AVut/6CylqR9keCJ5rssP/iXrO/pK5sK+ohhOnO449dxsbdqSd9EXlY8pA7F3rhNA1jpQAqD106t9IQOy59EpypL450qrRjOe3WAZIeLBWBQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5bb+IcPL+x/GgKx7em+MH4XZwqQ9e6XDTnEjhVpeYPU=;
 b=Vw/mZvfX2cnRZIWZqAjsfYwmw9qgtYvkfmdQsx0A7hFlU2sTo6qGPnj+htiMplf33r0v3XI/BM0PDzgTHAg8YW/mudYplKKGhksoWTbqgID9oU/zK6moVp/6tt/6d0e0JXtcSExiVaOfrJGpIlbwISTz6JLKcva9JwwUmSCbKRc=
Received: from SN6PR10MB3022.namprd10.prod.outlook.com (2603:10b6:805:d8::25)
 by CY8PR10MB6850.namprd10.prod.outlook.com (2603:10b6:930:9e::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6134.12; Fri, 17 Feb
 2023 18:18:54 +0000
Received: from SN6PR10MB3022.namprd10.prod.outlook.com
 ([fe80::93c9:c99e:5ab:4319]) by SN6PR10MB3022.namprd10.prod.outlook.com
 ([fe80::93c9:c99e:5ab:4319%7]) with mapi id 15.20.6134.006; Fri, 17 Feb 2023
 18:18:54 +0000
Date: Fri, 17 Feb 2023 13:18:50 -0500
From: "Liam R. Howlett" <Liam.Howlett@Oracle.com>
To: Danilo Krummrich <dakr@redhat.com>
Subject: Re: [PATCH drm-next v2 04/16] maple_tree: add flag MT_FLAGS_LOCK_NONE
Message-ID: <20230217181850.mq7ua6rksl3ezwoi@revolver>
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
References: <20230217134422.14116-1-dakr@redhat.com>
 <20230217134422.14116-5-dakr@redhat.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230217134422.14116-5-dakr@redhat.com>
User-Agent: NeoMutt/20220429
X-ClientProxiedBy: YT4PR01CA0350.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:fc::20) To SN6PR10MB3022.namprd10.prod.outlook.com
 (2603:10b6:805:d8::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN6PR10MB3022:EE_|CY8PR10MB6850:EE_
X-MS-Office365-Filtering-Correlation-Id: 6bbc8eb0-46c2-445e-f82d-08db11136d32
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: +1niQrfo/nz5+v95ZwrDxQBCCQik0xHRy1vkBOUaat1QWZnbPwGSDIb4XOh3bw4NoYLPXaS71ybe8ZJ8RFzRzmnIZB5+aAt0Fy2HP/clrJUUDMyIerIYRgahWzSSsxOy1GY/WcuVQw/I16mZnso2SI0OewT66P/3X/zCZujQjt3jRXdIHL0uDKFB8RNidrEBVemj2GuwudyV7bIfLiBJmQpvDW1pDLZPnhV4U7dSgQrMnFgnFxIC3BL5bbwHvbZQ3DQKc3DRizs5QPqoVkh4DBtJoObU05L1+cSY+vY3Z4jayAnt08W9erWklxWnJDNmsD3P+xlmD8NC+7MYgOvtL5AUSITfZ31VE/wkInHtnu0gKKzn2pS4DycD5TETyXMgLrCtpOUjD7SSQG+DodVLVWnU2BnoCQ/9jHoRMl8uEFFrreeM2WzxAC42lo8ZZCFVJDKj4qwoF4SQ+hHTMhfCkS6kE9N/ssm2hLl6zcVdpco1Lq0OGBP4g4A8QaOU0U2IqvMMcCs4XWmTlTFznVctuuXYPSb6/PYEdnWSZZetm4Bu3UnhayrFLMkrrUzcrRZb2RBci49XhS6xK7pb5k2ZR4XzLTZ8SslS7aDKPvHiL2TuJheuoD1obLx7dhWwEnC/vlCmrPJVNu/GXgtBGJIkGw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN6PR10MB3022.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(7916004)(366004)(346002)(376002)(136003)(396003)(39860400002)(451199018)(38100700002)(6666004)(1076003)(6506007)(6512007)(186003)(9686003)(26005)(4326008)(6916009)(41300700001)(86362001)(66476007)(66556008)(66946007)(8676002)(5660300002)(7416002)(8936002)(2906002)(83380400001)(6486002)(478600001)(316002)(33716001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?FxOv6eXvAJblmZd4UHj6CkBHohEsTCZEz3dlNjOszyXc/Kcw0BcxiinIXQS0?=
 =?us-ascii?Q?+fPu/RXQ8CxRC11/HMoiO4CYz7wM+N7AlKXBBwWgz6xwFlKIRTxXFO3qP/gH?=
 =?us-ascii?Q?W6F8cvht92ltMmTrmRbR4GuLXdHu1pkRzDmoBruOuit3slpOiX5tpFR6hq6+?=
 =?us-ascii?Q?t7R1ehtdDiH0W4x0VfOf3akQbY3OxFj7Krs/pjbb3QonvVQo06WNZfBjm8VZ?=
 =?us-ascii?Q?58+TDa80n40GRM6rEbvoRW1jEW1uzW9CihKO6SJtWgNLzkMf9RUgd2I8cKGF?=
 =?us-ascii?Q?B1ZLgAjcPi36KCOY6kw6Ot5lLJJT9HaEPVjqpl1ggMHzix/UGb4FkIjTgsZz?=
 =?us-ascii?Q?Yg47wjavvxUAOR8QiGmYhKi2nz7V36e2kPUEXvU/KjxCgRfzALq2PWJbqW/2?=
 =?us-ascii?Q?Rn5CdWSFAxwnag3QY6ijIjgb2jqqjyO9GKtCx47xxY5qVwQW2BmHRmqMXb6P?=
 =?us-ascii?Q?Bp3H7A1kN5q80CAvMc8xj+TJc/hU7PW1/NyKZgjO94JI6DNNPd3Q4lglMQ61?=
 =?us-ascii?Q?U2wpgqVrsxvSUaMXUVQyYrhBnPShMmWJ1yFOKZaa1CdaW9wINB0Uf8I8yQ3O?=
 =?us-ascii?Q?oBuxf5mP95bHtBhA8W5om/XyQjTQBeIjLcdSNSsAJLn2g0S9IA1ZJspQ05O3?=
 =?us-ascii?Q?qbt4mz/3qbLqpn7G9GJdtvqvqbjC3fUMPa9LtAcSU7lzc+unU/By3Goj4eSG?=
 =?us-ascii?Q?QRGoEMkoLjBiQXyWYfFlULsbtKcAQIC03roxML4FroDHckqvWDog0vwSCp6f?=
 =?us-ascii?Q?VqPZPF5mq0YIeQoFjJkeOLIBni9tTd/aqhcf+U2ZaMPiKvK1bSBtO0os2K1W?=
 =?us-ascii?Q?JJ5YZslgr8LfKHqqvb7btFAyJkN2ToVSw1zJE+OayWESqAY30Yn6TjIXBM40?=
 =?us-ascii?Q?mhRBuE5jC7RPXx+LjJYn0r6vhIQeJFMwvwdTEjinZLHSppGK2Y/WWXcjFpLf?=
 =?us-ascii?Q?QtqrgdcvhNcygQADLqgwq8+o5FGVWSBQyJ9P6DI9WoqvLtkKit95ApJkzVFp?=
 =?us-ascii?Q?8FD/vgL+KHEgMQPa/iinmZBiloPVOfMC/7dcbeXAS/YEL3KDBq/n6lILf91d?=
 =?us-ascii?Q?Ewnuyq2CiU1sa08epoYglj5Mp77qsGq3BZW49Bm3yYTLtD+RGIDL6J1A4Fi3?=
 =?us-ascii?Q?oJQgFcq9iUHAfmbp/bBqBoJTco1X5h4ptzAci7JiyeNXFyJ1X+VMoZwNnTIj?=
 =?us-ascii?Q?VA284gXpT7CpIlePhiyOGmWK9Uk2sz16axLKgCDkmupmvN32X5iGmUtCgD23?=
 =?us-ascii?Q?imYRQBHSTOPcWXa+zzwrJfaWriH+xtES5delJuGjJAAkjKipn7HTG9oXTeFP?=
 =?us-ascii?Q?v1BCDfwRrDU+N4t/SbeBr2SoV0siQh8X8BWPEy1MNQCOfw8NchSQekmOKqSf?=
 =?us-ascii?Q?Zc0XHauTudzz8ahh92qa16VfVlAA7id5e1Yyv9+8pjerWDvfjJzfmO5sXu4C?=
 =?us-ascii?Q?NCWyPy+ZOTJ3fCOzEW7zZvrfTCe7EC5WEvKAtrLjsmQ0iNb6hWQ92n7+NVba?=
 =?us-ascii?Q?KFlqCWroteH5jRq54aIoSQA1dOm9++d8ahL/VhpPtZvuSGWGas7EjK0Sy/3E?=
 =?us-ascii?Q?FoWSkFk//+UKUn2QYR9tndqsg9yoZKXUKBq91p8EXOvFO1j3kd2BzOY0Tur+?=
 =?us-ascii?Q?rQ=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: =?us-ascii?Q?OrBR5osdYHK1UDz2P+aFWMkHt1X+zMIIw5+8lCZHL2xYg0RwaY7/oFaphsfd?=
 =?us-ascii?Q?tGwtYGxY32t90PPzCHahPkGbJ/SCAcg+ETegpHe5qi3DO9XG9vWYD5NKA5O2?=
 =?us-ascii?Q?XRhWkEGLmZtktdCYwm4s0B+dlaE7HdQ6XQlpy1FpSa2Em6zAHczGWXX3uo10?=
 =?us-ascii?Q?jHpIEnuoYMJOeClZkx0eks3Sw99cx0t+Txxf/RO1yVGSdhB7+G0oxGaYsA8C?=
 =?us-ascii?Q?4kThl0x73I9/K23H4yPWX7WIv3+J4a2J+/ZwYGISRvSKcxTBHh6lx5NNDbJI?=
 =?us-ascii?Q?qde/sz59q94LL62unwOLF1nJSxm/uoiKUpFWQrm780+WLv4bU8ygR6dsI7IG?=
 =?us-ascii?Q?75TlqZa53QXdq/Jl41t4QjJO1SxEAaB1wvDUlQj+P+1cBNaKfvhb+PUYUDbl?=
 =?us-ascii?Q?kYIfwWxbt9cnsd/wrCmHjPNc9wgs6JcfYBT/dg8IJmeEGBwayPaF0xCCRWjv?=
 =?us-ascii?Q?bB6n7LZQ/+SL76DlNXbDzcz2uvsa7u8XyricfS+tDfF989Zy752ASR05PDbJ?=
 =?us-ascii?Q?/OC5YkZ/FbgxV3/F6A90PdtrLr6n0VMKuGizhLArofLFe7s14msVJddcTEki?=
 =?us-ascii?Q?P4d1iAQnPjQ2ckRBGhSrhsxSyf7a1FzNOPgbNfNuI1iQdDEB7eY0fL+QW0K3?=
 =?us-ascii?Q?tlTkywbC6r5/N1r43++mgk2uv1p1R6ow2KjmJscTz1LCpGaVq//Ppjfn9Qf8?=
 =?us-ascii?Q?r5iMx0noa3I2HKOJetZNFzg5qPlrRJjwCuhnwKuFoS7EyGCpEg//LII+1Xdg?=
 =?us-ascii?Q?XWJ+bAyvClHaTucPja/DGrVDrWo1rIrLyIvk1/XjmgPNZzIvAg5c3wx/4B8u?=
 =?us-ascii?Q?ovrNgjyGoVvtfKjRwW114SasbupdCRrUnsyM14oOksXG3dwNYjWc2IzlhBRz?=
 =?us-ascii?Q?X7O3d59ixKPLPx9DWCp0ZPbYWgThEPNcQ0xL7iGzvLUQbSSAXSXgS4eur3kW?=
 =?us-ascii?Q?NDgqsiix296LXjxBogBoAUqVOgfQz4IkxTuojW1yr5Xsf9DP3l39CU6PMllT?=
 =?us-ascii?Q?tBCzWvwE3QgvmMSRsfUaxnP9GbtBaTSJazoUwALuSJH4gcqY2qy8RngSiB5z?=
 =?us-ascii?Q?SHaGbZ5OnY0TwUT9GheB4C+9rIimZ1xKAoNev9thLsNOUNkpmtfKDxMFERC+?=
 =?us-ascii?Q?pEPFEBR/+Ccxq+pSnh4wFGMVHiOeB4rwIA=3D=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6bbc8eb0-46c2-445e-f82d-08db11136d32
X-MS-Exchange-CrossTenant-AuthSource: SN6PR10MB3022.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Feb 2023 18:18:53.9352 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5+XsD7EAApSNGaA480aGvNqdJ5MJYSD+4ZepAFsMkIeHJrIX28HPqHWnlh6iJ5GNFvJCkfMU5VkUCmYS3kYdgg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR10MB6850
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.170.22
 definitions=2023-02-17_12,2023-02-17_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0
 suspectscore=0
 phishscore=0 spamscore=0 bulkscore=0 mlxlogscore=999 malwarescore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2302170162
X-Proofpoint-GUID: kW5wBFfml-x2a0Un0-7_yNzLQmuw2Sxf
X-Proofpoint-ORIG-GUID: kW5wBFfml-x2a0Un0-7_yNzLQmuw2Sxf
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
 linux-mm@kvack.org, boris.brezillon@collabora.com, bskeggs@redhat.com,
 tzimmermann@suse.de, bagasdotme@gmail.com, christian.koenig@amd.com,
 jason@jlekstrand.net
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

* Danilo Krummrich <dakr@redhat.com> [230217 08:44]:
> Generic components making use of the maple tree (such as the
> DRM GPUVA Manager) delegate the responsibility of ensuring mutual
> exclusion to their users.
> 
> While such components could inherit the concept of an external lock,
> some users might just serialize the access to the component and hence to
> the internal maple tree.
> 
> In order to allow such use cases, add a new flag MT_FLAGS_LOCK_NONE to
> indicate not to do any internal lockdep checks.
> 
> Signed-off-by: Danilo Krummrich <dakr@redhat.com>
> ---
>  include/linux/maple_tree.h | 20 +++++++++++++++-----
>  lib/maple_tree.c           |  7 ++++---
>  2 files changed, 19 insertions(+), 8 deletions(-)
> 
> diff --git a/include/linux/maple_tree.h b/include/linux/maple_tree.h
> index ca04c900e51a..f795e5def8d0 100644
> --- a/include/linux/maple_tree.h
> +++ b/include/linux/maple_tree.h
> @@ -170,10 +170,11 @@ enum maple_type {
>  #define MT_FLAGS_USE_RCU	0x02
>  #define MT_FLAGS_HEIGHT_OFFSET	0x02
>  #define MT_FLAGS_HEIGHT_MASK	0x7C
> -#define MT_FLAGS_LOCK_MASK	0x300
> +#define MT_FLAGS_LOCK_MASK	0x700
>  #define MT_FLAGS_LOCK_IRQ	0x100
>  #define MT_FLAGS_LOCK_BH	0x200
>  #define MT_FLAGS_LOCK_EXTERN	0x300
> +#define MT_FLAGS_LOCK_NONE	0x400

Please add this to the documentation above the flags as well.  We should
probably add enough context so that users don't just set this and then
use multiple writers.

>  
>  #define MAPLE_HEIGHT_MAX	31
>  
> @@ -559,11 +560,16 @@ static inline void mas_set(struct ma_state *mas, unsigned long index)
>  	mas_set_range(mas, index, index);
>  }
>  
> -static inline bool mt_external_lock(const struct maple_tree *mt)
> +static inline bool mt_lock_external(const struct maple_tree *mt)
>  {
>  	return (mt->ma_flags & MT_FLAGS_LOCK_MASK) == MT_FLAGS_LOCK_EXTERN;
>  }
>  
> +static inline bool mt_lock_none(const struct maple_tree *mt)
> +{
> +	return (mt->ma_flags & MT_FLAGS_LOCK_MASK) == MT_FLAGS_LOCK_NONE;
> +}
> +
>  /**
>   * mt_init_flags() - Initialise an empty maple tree with flags.
>   * @mt: Maple Tree
> @@ -577,7 +583,7 @@ static inline bool mt_external_lock(const struct maple_tree *mt)
>  static inline void mt_init_flags(struct maple_tree *mt, unsigned int flags)
>  {
>  	mt->ma_flags = flags;
> -	if (!mt_external_lock(mt))
> +	if (!mt_lock_external(mt) && !mt_lock_none(mt))
>  		spin_lock_init(&mt->ma_lock);
>  	rcu_assign_pointer(mt->ma_root, NULL);
>  }
> @@ -612,9 +618,11 @@ static inline void mt_clear_in_rcu(struct maple_tree *mt)
>  	if (!mt_in_rcu(mt))
>  		return;
>  
> -	if (mt_external_lock(mt)) {
> +	if (mt_lock_external(mt)) {
>  		BUG_ON(!mt_lock_is_held(mt));
>  		mt->ma_flags &= ~MT_FLAGS_USE_RCU;
> +	} else if (mt_lock_none(mt)) {
> +		mt->ma_flags &= ~MT_FLAGS_USE_RCU;
>  	} else {
>  		mtree_lock(mt);
>  		mt->ma_flags &= ~MT_FLAGS_USE_RCU;
> @@ -631,9 +639,11 @@ static inline void mt_set_in_rcu(struct maple_tree *mt)
>  	if (mt_in_rcu(mt))
>  		return;
>  
> -	if (mt_external_lock(mt)) {
> +	if (mt_lock_external(mt)) {
>  		BUG_ON(!mt_lock_is_held(mt));
>  		mt->ma_flags |= MT_FLAGS_USE_RCU;
> +	} else if (mt_lock_none(mt)) {
> +		mt->ma_flags |= MT_FLAGS_USE_RCU;
>  	} else {
>  		mtree_lock(mt);
>  		mt->ma_flags |= MT_FLAGS_USE_RCU;
> diff --git a/lib/maple_tree.c b/lib/maple_tree.c
> index 26e2045d3cda..f51c0fd4eaad 100644
> --- a/lib/maple_tree.c
> +++ b/lib/maple_tree.c
> @@ -802,8 +802,8 @@ static inline void __rcu **ma_slots(struct maple_node *mn, enum maple_type mt)
>  
>  static inline bool mt_locked(const struct maple_tree *mt)
>  {
> -	return mt_external_lock(mt) ? mt_lock_is_held(mt) :
> -		lockdep_is_held(&mt->ma_lock);
> +	return mt_lock_external(mt) ? mt_lock_is_held(mt) :
> +		mt_lock_none(mt) ? true : lockdep_is_held(&mt->ma_lock);

It might be better to just make this two return statements for clarity.

>  }
>  
>  static inline void *mt_slot(const struct maple_tree *mt,
> @@ -6120,7 +6120,8 @@ bool mas_nomem(struct ma_state *mas, gfp_t gfp)
>  		return false;
>  	}
>  
> -	if (gfpflags_allow_blocking(gfp) && !mt_external_lock(mas->tree)) {
> +	if (gfpflags_allow_blocking(gfp) &&
> +	    !mt_lock_external(mas->tree) && !mt_lock_none(mas->tree)) {
>  		mtree_unlock(mas->tree);
>  		mas_alloc_nodes(mas, gfp);
>  		mtree_lock(mas->tree);
> -- 
> 2.39.1
> 
