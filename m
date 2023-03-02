Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E53E06A798F
	for <lists+dri-devel@lfdr.de>; Thu,  2 Mar 2023 03:39:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2632110E064;
	Thu,  2 Mar 2023 02:39:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com
 [205.220.165.32])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9487910E042;
 Thu,  2 Mar 2023 02:39:00 +0000 (UTC)
Received: from pps.filterd (m0333521.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 321NBQCi011770; Thu, 2 Mar 2023 02:38:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=date : from : to : cc
 : subject : message-id : references : content-type :
 content-transfer-encoding : in-reply-to : mime-version; s=corp-2022-7-12;
 bh=1dpreVIBytiiWLdfkrs6pZPCAe15VfixPAxfMUEjebc=;
 b=msDPZTkumtuwQZimrj2fEsQPkCUhxMKmN+hd2ggfGexc7ZbG5WZceA3kjsrDHdeTdf3D
 XfyPW7mD8nI9Tsj1fxzqZEYn8PO7ehd4Vuly3t9KZa+45D328+tiFrPNk+avy/3/hDqQ
 1LI7vmw2p6NIaCuc5JZDJQGNqyRVTNQVhsbKtDVxx3Syuw11H4N95RsEXeakHkGJVW2l
 31P0Od1GNNIDvAuyj1ofGEYNmS/zB8ncP7dyrfyeTSbiiY2Br4El68dFQzVhsZrNbuXL
 FPZsfOhU/V+Xd5sBm+mjtopPVlIQvxYqfabdA42e3PzwGb8o7AwQvOkPm2dhy5BSf+98 ug== 
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com
 (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3nyb7wtj4p-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 02 Mar 2023 02:38:37 +0000
Received: from pps.filterd
 (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
 by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.17.1.5/8.17.1.5)
 with ESMTP id 3220rv2N028604; Thu, 2 Mar 2023 02:38:35 GMT
Received: from nam10-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam10lp2104.outbound.protection.outlook.com [104.47.58.104])
 by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id
 3ny8sffvkf-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 02 Mar 2023 02:38:35 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ouf4OpjSbJutorbLT0qh4Ww3qh/0yw25bjlNM66xI8byzD/vS47Js7d9RjBHMkH997QpX1M8/LItnU2fPOgbPtNV5sxxvav1qbFFPD5UkpsYI3/kxuglSZw+dvOzYHfRkDLx4Z2l+zwAeee7Fco1oqI5QTtIjNMkQoEsKuIeAX8I1cd7OyKEDlLy5/TIxlirsiiuL4QX7mYbIaikN1SVzl2TkF2DM9AStrGRPP0dfn0POZegBVYUnXnwWoBRM1ly8TVJy+pqzehppxqpJ0w587U2TwmkYUDqsOH2m4A3VMBDnQN1NjLiFgPVV28WBdgqPDjVSpRUJ9o+4wuJPWQzUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1dpreVIBytiiWLdfkrs6pZPCAe15VfixPAxfMUEjebc=;
 b=DIOkchVCIvxnZ24bhu/wL7iU7ZCEkHVk4VItGpwdvSY8Buz1ueSrxLjRCVeYsy2Mgmeag0cU4WligmZFeiJx8y8eh4BS/QsZNhVaARJ3vojxhn5uO29vnfTjWU9M4ew7WXIByCRJppjtEldtdKxbarmk96oM1PzZKuzRyBoWROjLpIcvpTytxL4dUFmB05JrcDfFKPDPtetA+WUH88eclP4c5JYM151xg/v9ljEXBgMz/rl25fusjkXlDQS/lU1h5LGoCBvFt9DRyAZdpOHUxYsOc2TbJ2qxmLmJPRmY88KCtMvG8hoZJvhtedIR9IkanZrxlezFkFstpyx5xeEpyg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1dpreVIBytiiWLdfkrs6pZPCAe15VfixPAxfMUEjebc=;
 b=npSogmK5dECda+lMpSbNIezjA7gqdkIx3dwnZn8uJowZ6xiRBw/IhAa1MDwR46RI7M9sjLnbGuwBL3g2+Z2JFovDmlByM1xji/oivUNoS/6HNpSV4ZgmPv5KVCXYrTnAr2jGBNUeZdvbQRKRuPFngJZ8tJuPIIWUBqkMO4+44xQ=
Received: from SN6PR10MB3022.namprd10.prod.outlook.com (2603:10b6:805:d8::25)
 by DS7PR10MB5104.namprd10.prod.outlook.com (2603:10b6:5:3a1::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6156.18; Thu, 2 Mar
 2023 02:38:33 +0000
Received: from SN6PR10MB3022.namprd10.prod.outlook.com
 ([fe80::93c9:c99e:5ab:4319]) by SN6PR10MB3022.namprd10.prod.outlook.com
 ([fe80::93c9:c99e:5ab:4319%7]) with mapi id 15.20.6156.017; Thu, 2 Mar 2023
 02:38:33 +0000
Date: Wed, 1 Mar 2023 21:38:29 -0500
From: "Liam R. Howlett" <Liam.Howlett@Oracle.com>
To: Danilo Krummrich <dakr@redhat.com>
Subject: Re: [PATCH drm-next v2 05/16] drm: manager to keep track of GPUs VA
 mappings
Message-ID: <20230302023829.kcxyukt7guacr7xg@revolver>
Mail-Followup-To: "Liam R. Howlett" <Liam.Howlett@Oracle.com>,
 Danilo Krummrich <dakr@redhat.com>, airlied@gmail.com,
 daniel@ffwll.ch, tzimmermann@suse.de, mripard@kernel.org,
 corbet@lwn.net, christian.koenig@amd.com, bskeggs@redhat.com,
 matthew.brost@intel.com, boris.brezillon@collabora.com,
 alexdeucher@gmail.com, ogabbay@kernel.org, bagasdotme@gmail.com,
 willy@infradead.org, jason@jlekstrand.net,
 dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 linux-doc@vger.kernel.org, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org, Dave Airlie <airlied@redhat.com>
References: <20230217134422.14116-1-dakr@redhat.com>
 <20230217134422.14116-6-dakr@redhat.com>
 <20230221182050.day6z5ge2e3dxerv@revolver>
 <ce3ee7f2-e8a3-80eb-9bca-cd465f7f332e@redhat.com>
 <20230223190941.bkkloowmvqjiu6d7@revolver>
 <0868bbeb-11b4-b832-a601-f289278e3e76@redhat.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <0868bbeb-11b4-b832-a601-f289278e3e76@redhat.com>
User-Agent: NeoMutt/20220429
X-ClientProxiedBy: YT4PR01CA0262.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:10f::26) To SN6PR10MB3022.namprd10.prod.outlook.com
 (2603:10b6:805:d8::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN6PR10MB3022:EE_|DS7PR10MB5104:EE_
X-MS-Office365-Filtering-Correlation-Id: 1bd209e9-2712-466d-69df-08db1ac73705
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: wLD8byrIYAmLJvzpw/dU7a5k48jTkP2EngfXi153own+uV5aSxU/neibyUajQEMqPPCftxcpRdIRvTbvrH583RseJYU5YVvJbzIoOq2shyqljyrUSBfzTozUQ9kq1/19akFSha2GWXbm4T0l+VUUvvIYkrGIBXIHq4pH0zpadieAnJYkd90sh0yVltfxr5wsfyIiXGVtjZe11Axnvb6FX74YClAz0ERpdqNgFDXB1L8iUlLlLAA59pV3ErigSdjlmLEVBA8hSnhSe/a8tV4eQmVQ9RbJJeakt8Vr7jG2NtmnuL0dadSg0lV+E5dCKinkJUbbKqk6FczwGF10QGjPVzJn8OZDYtXRqAvh4o3YKFxUVHMzNme9s+OEBhJqBGT+OP2ivWsZPzxtuGZ2e0tbtxrYZQ0L3jHwCbUjn0RXQtIA2CtJqICFsFYWfOB5vMicE8S+iX8wH1Zn485QCkhBiq/Ne2rXHC8CUrScKDcO4MJWJiCW8TRH2HDptmZqDRYdhfqhPJa5jGB/NFLWd0lj1GprllqGoIuEgLFy7c3zttB9mDBzQvPBDxRFj2x5C5jcDU6TYWPFi96BAVVCrYEOXNvNMk1RnxbB+YaMbfbAUtwiN8PV2CRkBC9qamRI1sJk
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN6PR10MB3022.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(7916004)(136003)(366004)(376002)(39860400002)(396003)(346002)(451199018)(66899018)(84970400001)(4326008)(66556008)(66476007)(8676002)(66946007)(6916009)(8936002)(5660300002)(2906002)(30864003)(7416002)(38100700002)(86362001)(41300700001)(6486002)(478600001)(6666004)(316002)(33716001)(1076003)(26005)(9686003)(6506007)(186003)(83380400001)(6512007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?5WgtmOObjjNuPMG8AyezsW/1QDJHeeE3t1et0g7x0wRYHA7W4XpLApxV/D4a?=
 =?us-ascii?Q?G8kjSY0RNu6XLkdWrsWvkRYudbbrH9ShLMQlqExG/BKly7FR8E8mv8Ap726N?=
 =?us-ascii?Q?GJGGgCW1TgSFvZ97u3aU4dE/ndFGoXjIAMXMpF+ObEW6f/C0pMUsGWurlxwm?=
 =?us-ascii?Q?OYTzYLJjksfiUtCXsX1nMaLf5eqc6Xf/60/4kDr96Yb97W/6th29WPjY7rKK?=
 =?us-ascii?Q?CSxCy2KiBl4CytFWdyhqHTtb6L7z8OqPZyrss1QwH57+S1oxT8n6IgJ7Hltq?=
 =?us-ascii?Q?Q4GYybXSY9cdl7MKv2+WyP1FaYzLIUx41Ece2uuWC2uEoMlOEwCUN/tqNK/4?=
 =?us-ascii?Q?jd1yWrCY6jNQ+H9QIqyTv0LoOsuYBzlGALN74J7uXotx7oVvrI3ohigEU3Xf?=
 =?us-ascii?Q?GrRr4l/aRFRk3pDAlN6eT66MmzI0SkeSf5el1USmAt8hssTeCH5MjClEsBOb?=
 =?us-ascii?Q?9iJcJtzr9wYznWP1VCiWH2Cy6+w6AHc7lEciibGCclE51/Dv86xKyAUBq1bS?=
 =?us-ascii?Q?8QF+wl12gEb6kxAtPpx+OF7l4Qg5gSobAmNeu21sBfdOuULkhEml1S8RjuDY?=
 =?us-ascii?Q?HtSK61UltVcBPVvhqys/m88ebyPOjsOymmfE8wtA3zKsOIH9tk22uaZ79Ld+?=
 =?us-ascii?Q?j+an9Q0ZZPExXvffk9JedCD4j5cuYi48UZKx/cI/BKAfHwtthDoMyujxbkSH?=
 =?us-ascii?Q?WiMCJ72Lz6KO5NVP4aWXMcjbiay5I9PWcVKjapcXFZnn2vPT0RbjEsvxSXvj?=
 =?us-ascii?Q?ltLoutoYpMrsz40EB6aLAi3991ctFoPXv/Dscv7FqkIs2N95YZpmF8nZX95C?=
 =?us-ascii?Q?BFe5LzvOSU4jNAOrR+E+DaUZrhytfExx72YNZYRJh0D7YtareEdp3S0hXujG?=
 =?us-ascii?Q?LtrqAlXd2L2pBgbubVKW6b42gc2/aEw+5cpI7QzolPh785JPgJjFTd0MGnVk?=
 =?us-ascii?Q?an68WPwkNoZAzk+kSyDpkNjWLs79xLPixr2c75sEZcqskGnzDcruDghXrCur?=
 =?us-ascii?Q?Lciie1gosCeGn9gA/2yS6Rpio4lvrLYGhzvy/nXL6ZoRonxcIkcnb4seTgcw?=
 =?us-ascii?Q?k9F7IlukIRlWShP27UEd5YQJ+dnO3Zzf36byycqGa5uFfSLOTLqCfISF/uui?=
 =?us-ascii?Q?0U0/IiNl8MYd8LdOvCBx2Xs2t6pvV7ZEMHxsczG3MmHUbcy2RFpGHUgwjCOQ?=
 =?us-ascii?Q?vFPthKuWGPflY/puTSIKmQWvVUYFI22c2YjEmJ0JgdRrCt2MKReiz3u+FV+X?=
 =?us-ascii?Q?R8EDC6t6Z7ld7S77pj5Gtf4vD5mh4/YgJ320nvzqm7e7bTjqm6gglgwtiZ8W?=
 =?us-ascii?Q?D6ktVRHdw5lFT6MCY79e0IVhbaFbJD2NnDbdIplEVrf+ZUMgd4NZYV3rT6ng?=
 =?us-ascii?Q?eyT+aKzKhCp6J8vGgkvuHmefxGohVYVrlSX0v8CqEQKFn0FCH8FcSiTeY9Ab?=
 =?us-ascii?Q?WvW03WNUuoJPWdII31mJRywDhDAMRqgkreq/WsNPYktrf9UlWmXoHP2e9839?=
 =?us-ascii?Q?5DNRbtTcpUVUJLlIiX8UV9iHrtPEgALLZm/e0t3BcrOxDZ5hfdbicndyekua?=
 =?us-ascii?Q?jom1JwRB1bBV5s6Zlk0mOy8caYPBmYwGEwUMWQ8r8NjomIf/MqCaLZRAaTxK?=
 =?us-ascii?Q?Rg=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: =?us-ascii?Q?iKUZvs53ooBzq2uDaQ3HHDMx0xebnR6F4n5q3HTDqEDbPnkEzoYFCiVpq8Vg?=
 =?us-ascii?Q?32/ZpPQYQ5Q4nK9SaBxYukc9smgOkP0NqWbv9gr4/B3Dj2GAUnqp7VK3nXoy?=
 =?us-ascii?Q?fm1tevu2JejKAK3JfUDDQF+1GDWPXYblM49XPUyAvFpe5Qrb+JpeLzCZbk0F?=
 =?us-ascii?Q?8f9CAUqRjf+1XDVREQDyJ5ese8uMhg5uy2CQUo/G543ax3S0r4boKJEUr0m8?=
 =?us-ascii?Q?bKQ2N4ofdSDhexmNhMKF+JGq+iIoLdYl+hL7Wr4IexdDA8KxBvu9jLrkC3Xo?=
 =?us-ascii?Q?l7ujhQ/ad0s2QmWgij/qSGnYsVvB9hZcyRO6N55Wht8tjiLdSJZDzR/eVBFQ?=
 =?us-ascii?Q?0DNmB/dVWNfNdWng6tNbkAkQbK/AUdH+UngJDQuIL+yBGcMpSIJfc2+JOuWF?=
 =?us-ascii?Q?p/e3dlNTJ06pkpN7RrquWCXsTNiA0mCwQfUkB9hOUFJz5YdfrxpbhuedjmXi?=
 =?us-ascii?Q?yeN3LlvmbVtId2t4CrkZeHFaBOEMiuqlqGK8d9n4CezVRFHtT3YNKbjgmw5O?=
 =?us-ascii?Q?D8Yeh5H7ED8Sy7MfoFzKKPHZVEwlTWvIpgBF51cTkUgxaw3zhdaz3oZ0KTJe?=
 =?us-ascii?Q?7gI2iNhUptqxjfZ7ihf/TcuTgpRauRMQx+1qOVL2vuelhoE5xH9mO9R0yA4i?=
 =?us-ascii?Q?uq97BMJFEuYzbTZT0tR+iZfgpU7D5pVvzr0xj7PEet3wF5W+3SCUguxFLnT3?=
 =?us-ascii?Q?aCOtBV+UTz0DdQm58vxN1Vu4mlWbS4y6ys4h8eSb9+0CvPiuZF8TqkO6nsMQ?=
 =?us-ascii?Q?t7eh650Lif1UVWgJHJnTP+Ln8ZJw0ikF9qbZgGJX7qpP9tTiSLDj18o/AN1J?=
 =?us-ascii?Q?KEQTnEWyxNbTFfLsTE+jmTmmojKOYcDp4SuddTd+tWOfCDB9tKlASSL9yl8v?=
 =?us-ascii?Q?HR+0gJiv+XLbthmh9jzZD6xKmXlER6yiG0O2S+uxV9L4f9RGuR8goQGR9p6v?=
 =?us-ascii?Q?yDafY0rF+aSTLwqBc3afL8LbdxrQNvt1GVjJljFfmV9g4wibBSqVcnGt8AiS?=
 =?us-ascii?Q?HqnWRYylcMuiXj5ZICjmfy83N28tflzq+wrY04Eg9UG+5idAyoLoQ92T2Jw/?=
 =?us-ascii?Q?Gl1vvx0cX9waEPL0RjIvtp9GC6uCpiR8wvdI9Cls5XKKokJ9TLn9SBfN2MZG?=
 =?us-ascii?Q?Wchc0L8kaKYTVl6BGK665MnwaW1Vkg8pOg=3D=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1bd209e9-2712-466d-69df-08db1ac73705
X-MS-Exchange-CrossTenant-AuthSource: SN6PR10MB3022.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Mar 2023 02:38:32.9941 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hBx2RmzYBXic7mzVQoLctAuuFOhNPpORUrpMfan2gI3iv4kRyG7ppMhqYAr2QxeqW3oiu3LptnWfnWtWRvlINQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR10MB5104
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-01_17,2023-03-01_03,2023-02-09_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999
 mlxscore=0
 suspectscore=0 spamscore=0 adultscore=0 phishscore=0 malwarescore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2303020019
X-Proofpoint-GUID: E496qiqROwUNZQZGKlz0A0PdPBIeMwHl
X-Proofpoint-ORIG-GUID: E496qiqROwUNZQZGKlz0A0PdPBIeMwHl
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
 tzimmermann@suse.de, Dave Airlie <airlied@redhat.com>, bagasdotme@gmail.com,
 christian.koenig@amd.com, jason@jlekstrand.net
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

* Danilo Krummrich <dakr@redhat.com> [230227 08:17]:

...
> > > Would this variant be significantly more efficient?
> >=20
> > Well, what you are doing is walking the tree to see if there's anything
> > there... then re-walking the tree to store it.  So, yes, it's much more
> > efficient..  However, writing is heavier.  How much of the time is spen=
t
> > walking vs writing depends on the size of the tree, but it's rather eas=
y
> > to do this in a single walk of the tree so why wouldn't you?
>=20
> I will, I was just curious about how much of an impact it has.
>=20
> >=20
> > >=20
> > > Also, would this also work while already walking the tree?
> >=20
> > Yes, to an extent.  If you are at the correct location in the tree, you
> > can write to that location.  If you are not in the correct location and
> > try to write to the tree then things will go poorly..  In this scenario=
,
> > we are very much walking the tree and writing to it in two steps.
> >=20
> > >=20
> > > To remove an entry while walking the tree I have a separate function
> > > drm_gpuva_iter_remove(). Would I need something similar for inserting
> > > entries?
> >=20
> > I saw that.  Your remove function uses the erase operation which is
> > implemented as a walk to that location and a store of a null over the
> > range that is returned.  You do not need a function to insert an entry
> > if the maple state is at the correct location, and that doesn't just
> > mean setting mas.index/mas.last to the correct value.  There is a node =
&
> > offset saved in the maple state that needs to be in the correct
> > location.  If you store to that node then the node may be replaced, so
> > other iterators that you have may become stale, but the one you used
> > execute the store operation will now point to the new node with the new
> > entry.
> >=20
> > >=20
> > > I already provided this example in a separate mail thread, but it may=
 makes
> > > sense to move this to the mailing list:
> > >=20
> > > In __drm_gpuva_sm_map() we're iterating a given range of the tree, wh=
ere the
> > > given range is the size of the newly requested mapping. __drm_gpuva_s=
m_map()
> > > invokes a callback for each sub-operation that needs to be taken in o=
rder to
> > > fulfill this mapping request. In most cases such a callback just crea=
tes a
> > > drm_gpuva_op object and stores it in a list.
> > >=20
> > > However, drivers can also implement the callback, such that they dire=
ctly
> > > execute this operation within the callback.
> > >=20
> > > Let's have a look at the following example:
> > >=20
> > >       0     a     2
> > > old: |-----------|       (bo_offset=3Dn)
> > >=20
> > >             1     b     3
> > > req:       |-----------| (bo_offset=3Dm)
> > >=20
> > >       0  a' 1     b     3
> > > new: |-----|-----------| (a.bo_offset=3Dn,b.bo_offset=3Dm)
> > >=20
> > > This would result in the following operations.
> > >=20
> > > __drm_gpuva_sm_map() finds entry "a" and calls back into the driver
> > > suggesting to re-map "a" with the new size. The driver removes entry =
"a"
> > > from the tree and adds "a'"
> >=20
> > What you have here won't work.  The driver will cause your iterators
> > maple state to point to memory that is freed.  You will either need to
> > pass through your iterator so that the modifications can occur with tha=
t
> > maple state so it remains valid, or you will need to invalidate the
> > iterator on every modification by the driver.
> >=20
> > I'm sure the first idea you have will be to invalidate the iterator, bu=
t
> > that is probably not the way to proceed.  Even ignoring the unclear
> > locking of two maple states trying to modify the tree, this is rather
> > inefficient - each invalidation means a re-walk of the tree.  You may a=
s
> > well not use an iterator in this case.
> >=20
> > Depending on how/when the lookups occur, you could still iterate over
> > the tree and let the driver modify the ending of "a", but leave the tre=
e
> > alone and just store b over whatever - but the failure scenarios may
> > cause you grief.
> >=20
> > If you pass the iterator through, then you can just use it to do your
> > writes and keep iterating as if nothing changed.
>=20
> Passing through the iterater clearly seems to be the way to go.
>=20
> I assume that if the entry to insert isn't at the location of the iterato=
r
> (as in the following example) we can just keep walking to this location m=
y
> changing the index of the mas and calling mas_walk()?

no.  You have to mas_set() to the value and walk from the top of the
tree.  mas_walk() walks down, not from side to side - well, it does go
forward within a node (increasing offset), but if you hit the node limit
then you have gotten yourself in trouble.

> This would also imply
> that the "outer" tree walk continues after the entry we just inserted,
> right?

I don't understand the "outer" tree walk statement.

>=20
>            1     a     3
> old:       |-----------| (bo_offset=3Dn)
>=20
>      0     b     2
> req: |-----------|       (bo_offset=3Dm)
>=20
>      0     b     2  a' 3
> new: |-----------|-----| (b.bo_offset=3Dm,a.bo_offset=3Dn+2)
>=20
> Again, after finding "a", we want to remove it and insert "a'" instead.

Ah, so you could walk to 0, see that it's NULL from 0 - 1, call
mas_next() and get "a" from 1 - 3, write "a'" from 2 - 3:

        0     1  a   2  a' 3
broken: |-----|------|-----| (a is broken in this 1/2 step)

mas_set_range(&mas, 0, 2); /* Resets the tree location to MAS_START */
mas_store(&mas, b);
        0     b     2  a' 3
new:    |-----------|-----| (b.bo_offset=3Dm,a.bo_offset=3Dn+2)


You can *probably* also get away with this:

walk to 0, see that it's NULL from 0 - 1, call mas_next() and get "a"
from 1 - 3, write "a'" from 2 - 3:

        0     1  a   2  a' 3
broken: |-----|------|-----| (a is broken in this 1/2 step)

mas_prev(&mas, 0); /* Looking at broken a from 1-2.
mas_store(&mas, NULL); /* NULL is expanded on write to 0-2.
            0    NULL   2  a' 3
broken':    |-----------|-----| (b.bo_offset=3Dm,a.bo_offset=3Dn+2)

mas_store(&mas, b);
        0     b     2  a' 3
new:    |-----------|-----| (b.bo_offset=3Dm,a.bo_offset=3Dn+2)

You may want to iterate backwards and do the writes as you go until you
have enough room.. it really depends how you want to go about doing
things.

>=20
> >=20
> > >=20
> > > __drm_gpuva_sm_map(), ideally, continues the loop searching for nodes
> > > starting from the end of "a" (which is 2) till the end of the request=
ed
> > > mapping "b" (which is 3). Since it doesn't find any other mapping wit=
hin
> > > this range it calls back into the driver suggesting to finally map "b=
".
> > >=20
> > > If there would have been another mapping between 2 and 3 it would hav=
e
> > > called back into the driver asking to unmap this mapping beforehand.
> > >=20
> > > So, it boils down to re-mapping as described at the beginning (and
> > > analogously at the end) of a new mapping range and removing of entrie=
s that
> > > are enclosed by the new mapping range.
> >=20
> > I assume the unmapped area is no longer needed, and the 're-map' is
> > really a removal of information?  Otherwise I'd suggest searching for a
> > gap which fits your request.  What you have here is a lot like
> > "MAP_FIXED" vs top-down/bottom-up search in the VMA code, this seems to
> > be like your __drm_gpuva_sm_map() and the drm mm range allocator with
> > DRM_MM_INSERT_LOW, and DRM_MM_INSERT_HIGH.
> >=20
> > Why can these split/unmappings fail?  Is it because they are still
> > needed?
> >=20
>=20
> You mean the check before the mas_*() operations in drm_gpuva_insert()?

Yes, the callbacks.

>=20
> Removing entries should never fail, inserting entries should fail when th=
e
> caller tries to store to an area outside of the VA space (it doesn't
> necessarily span the whole 64-bit space), a kernel reserved area of the V=
A
> space, is not in any pre-allocated range of the VA space (if regions are
> enabled) or an entry already exists at that location.

In the mmap code, I have to deal with splitting the start/end VMA and
removing any VMAs in the way.  I do this by making a 'detached' tree
that is dealt with later, then just overwriting the area with one
mas_store() operation.  Would something like that work for you?

>=20
> > >=20
> > > > > +	if (unlikely(ret))
> > > > > +		return ret;
> > > > > +
> > > > > +	va->mgr =3D mgr;
> > > > > +	va->region =3D reg;
> > > > > +
> > > > > +	return 0;
> > > > > +}
> > > > > +EXPORT_SYMBOL(drm_gpuva_insert);
> > > > > +
> > > > > +/**
> > > > > + * drm_gpuva_remove - remove a &drm_gpuva
> > > > > + * @va: the &drm_gpuva to remove
> > > > > + *
> > > > > + * This removes the given &va from the underlaying tree.
> > > > > + */
> > > > > +void
> > > > > +drm_gpuva_remove(struct drm_gpuva *va)
> > > > > +{
> > > > > +	MA_STATE(mas, &va->mgr->va_mt, va->va.addr, 0);
> > > > > +
> > > > > +	mas_erase(&mas);
> > > > > +}
> > > > > +EXPORT_SYMBOL(drm_gpuva_remove);
> > > > > +
> > > > ...
> > > >=20
> > > > > +/**
> > > > > + * drm_gpuva_find_first - find the first &drm_gpuva in the given=
 range
> > > > > + * @mgr: the &drm_gpuva_manager to search in
> > > > > + * @addr: the &drm_gpuvas address
> > > > > + * @range: the &drm_gpuvas range
> > > > > + *
> > > > > + * Returns: the first &drm_gpuva within the given range
> > > > > + */
> > > > > +struct drm_gpuva *
> > > > > +drm_gpuva_find_first(struct drm_gpuva_manager *mgr,
> > > > > +		     u64 addr, u64 range)
> > > > > +{
> > > > > +	MA_STATE(mas, &mgr->va_mt, addr, 0);
> > > > > +
> > > > > +	return mas_find(&mas, addr + range - 1);
> > > > > +}
> > > > > +EXPORT_SYMBOL(drm_gpuva_find_first);
> > > > > +
> > > > > +/**
> > > > > + * drm_gpuva_find - find a &drm_gpuva
> > > > > + * @mgr: the &drm_gpuva_manager to search in
> > > > > + * @addr: the &drm_gpuvas address
> > > > > + * @range: the &drm_gpuvas range
> > > > > + *
> > > > > + * Returns: the &drm_gpuva at a given &addr and with a given &ra=
nge
> > > >=20
> > > > Note that mas_find() will continue upwards in the address space if =
there
> > > > isn't anything at @addr.  This means that &drm_gpuva may not be at
> > > > &addr.  If you want to check just at &addr, use mas_walk().
> > >=20
> > > Good catch. drm_gpuva_find() should then either also check for 'va->v=
a.addr
> > > =3D=3D addr' as well or, alternatively, use mas_walk(). As above, any=
 reason to
> > > prefer mas_walk()?

I think I missed this question last time..

Internally, mas_find() is just a mas_walk() on the first call, then
mas_next() for each call after that.  If, during the mas_walk(), there
is no value at addr, it immediately calls mas_next() to get a value to
return.  It will continue upwards until the limit is reached (addr +
range - 1 in your case).

So if you only want to know if there is something at addr, then it's
best to use mas_walk() and keep things a bit more efficient.  Then you
can check mas.last for your end value.

If you do want the first VMA within the range passed in, then mas_find()
is the function you want.

> > >=20
> > > >=20
> > > > > + */
> > > > > +struct drm_gpuva *
> > > > > +drm_gpuva_find(struct drm_gpuva_manager *mgr,
> > > > > +	       u64 addr, u64 range)
> > > > > +{
> > > > > +	struct drm_gpuva *va;
> > > > > +
> > > > > +	va =3D drm_gpuva_find_first(mgr, addr, range);
> > > > > +	if (!va)
> > > > > +		goto out;
> > > > > +
> > > > > +	if (va->va.range !=3D range)
> > > > > +		goto out;
> > > > > +
> > > > > +	return va;
> > > > > +
> > > > > +out:
> > > > > +	return NULL;
> > > > > +}
> > > > > +EXPORT_SYMBOL(drm_gpuva_find);
> > > > > +
> > > > > +/**
> > > > > + * drm_gpuva_find_prev - find the &drm_gpuva before the given ad=
dress
> > > > > + * @mgr: the &drm_gpuva_manager to search in
> > > > > + * @start: the given GPU VA's start address
> > > > > + *
> > > > > + * Find the adjacent &drm_gpuva before the GPU VA with given &st=
art address.
> > > > > + *
> > > > > + * Note that if there is any free space between the GPU VA mappi=
ngs no mapping
> > > > > + * is returned.
> > > > > + *
> > > > > + * Returns: a pointer to the found &drm_gpuva or NULL if none wa=
s found
> > > > > + */
> > > > > +struct drm_gpuva *
> > > > > +drm_gpuva_find_prev(struct drm_gpuva_manager *mgr, u64 start)
> > > >=20
> > > > find_prev() usually continues beyond 1 less than the address. I fou=
nd
> > > > this name confusing.
> > >=20
> > > Don't really get that, mind explaining?
> >=20
> > When I ask for the previous one in a list or tree, I think the one
> > before.. but since you are limiting your search from start to start - 1=
,
> > you may as well walk to start - 1 and see if one exists.
> >=20
> > Is that what you meant to do here?
>=20
> Yes, I want to know whether there is a previous entry which ends right
> before the current entry, without a gap between the two.
>=20
> >=20
> > >=20
> > > > You may as well use mas_walk(), it would be faster.
> > >=20
> > > How would I use mas_walk() for that? If I understand it correctly,
> > > mas_walk() requires me to know that start address, which I don't know=
 for
> > > the previous entry.
> >=20
> > mas_walk() walks to the value you specify and returns the entry at that
> > address, not necessarily the start address, but any address in the
> > range.
> >=20
> > If you have a tree and store A =3D [0x1000 - 0x2000] and set your maple
> > state to walk to 0x1500, mas_walk() will return A, and the maple state
> > will have mas.index =3D 0x1000 and mas.last =3D 0x2000.
> >=20
> > You have set the maple state to start at "start" and called
> > mas_prev(&mas, start - 1).  start - 1 is the lower limit, so the
> > internal implementation will walk to start then go to the previous entr=
y
> > until start - 1.. it will stop at start - 1 and return NULL if there
> > isn't one there.
>=20
> Thanks for the clarification and all the other very helpful comments and
> explanations!
>=20

Always glad to help.  The more users the tree has, the more I can see
where we may need to expand the interface to help others.

...

