Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D69A572F102
	for <lists+dri-devel@lfdr.de>; Wed, 14 Jun 2023 02:30:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0A9FF10E3FA;
	Wed, 14 Jun 2023 00:30:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com
 [205.220.165.32])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E95B910E3F8;
 Wed, 14 Jun 2023 00:30:41 +0000 (UTC)
Received: from pps.filterd (m0333521.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 35DGiAxn028717; Wed, 14 Jun 2023 00:29:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=date : from : to : cc
 : subject : message-id : references : content-type : in-reply-to :
 mime-version; s=corp-2023-03-30;
 bh=M8Pt3pcMSxiQDoc55h56ZsKisRiukivBYUPys3Op59o=;
 b=yxmMEXvw0EFQFIUi88AjBzO0k5MVTKL9fUJc+JB3z+LaUFH6ZSz/WTkkFoOw6J/ulUuY
 CTMQS26pqbUJo2W2DN/XhHQKSLq5JifLI/PcTPIO5G+fQMcjpLDUB73scyKz/bInJEJd
 OLP+yiADvLk6/AgvjvA3T8Y9pu4SqGPW4AHpbw+rCN9cd0LzQThMQWy6OWLfsna8+u4g
 1lO0au2l+RaLws1dWP69dAKVTmGGRR4+c/8MWeJ332ZEQ2Ok8suY/IkVGSZKboZhO3W5
 S6SCpfFGouPuevfMpsNgvitFhQsFwMWI5GI1Vkuo9FjKpO4o28o2mS92bf/p5v/7t2fn pg== 
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com
 (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3r4g3bpj0e-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 14 Jun 2023 00:29:49 +0000
Received: from pps.filterd
 (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
 by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.17.1.19/8.17.1.19)
 with ESMTP id 35E0Bc4S008941; Wed, 14 Jun 2023 00:29:47 GMT
Received: from nam11-co1-obe.outbound.protection.outlook.com
 (mail-co1nam11lp2174.outbound.protection.outlook.com [104.47.56.174])
 by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id
 3r4fm54px1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 14 Jun 2023 00:29:47 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Bm6NwgA1HM14dXVx7ZeSYDw0AUiY+zdeX10UDOZP20B/65a/M+qxjjXcqLqwYgO2X0oQUd+5gq+O5Awl/SxQvJNRgdLIKXMWT9SrblLM8nVEIPjSra3P6/Abc+DwqOK/DZ2ishHXyFS40NlnHYLHaGXAWH6BtwCEAn20Ub4V2RWDlGQvlsG0pji4aw4Zb3Ekl8lhJbjU+PmIA9x9oh8LMKNurM5N5pYlU0ozrVjtTabFB0qUwbnDmA66XBWZuuU4GCBLS5kvId8KogHZ1IvPSPVZuo4iDHrDoz8xquX3RQUIBQaCAF2RUGiVJCgSHES8U/DaITiCaU/Tr27+XtH0ww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=M8Pt3pcMSxiQDoc55h56ZsKisRiukivBYUPys3Op59o=;
 b=MO5+SSdsz/WPbnvfRzE2Ol9YFcKb9FaWLCYT26MqCBJrVU5FbjLMB6dVtEGe2CHFXNx/fzEm55hSked1xDt1QEDQqtiviygi4tD6zg5/XW5vOEs9opgi3tjPoXmOv8bo72IO+s8BVL1oNzA6xLd4FGyP591E3qgl2Ft/TtOlXD3JvhYLk7AnnYWgBZTcBjoh5MpqaUn8Z5tKWUrYJn23zGIEHN/KuHBNEXN5d1Yx2wOLxeFyaMYZoRU20H3FRhN2jUd4mmvp/eFdElo6aBbfnurt3BQHnfasmFdcXuTCZmRDDmDpF22wgK317XDdGHh5tz0MyMicctC6xIeE0TjKqA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=M8Pt3pcMSxiQDoc55h56ZsKisRiukivBYUPys3Op59o=;
 b=zwy7m6bR3tt4mT9WueoJQbEiC858PTUOMUQ60/D8y9UYTt2dAmRF40Y6u1vGxAFF5p6/2HsgSFd6eSTUPybtgaCIZCdMbAGCYdaQlQUZqdI7fWDMhWwv/xx1OU24H3w5pEDB6DOsnJQDPtZlG4bRi6J3LpqUSAk1G0j3zoZkc4U=
Received: from SN6PR10MB3022.namprd10.prod.outlook.com (2603:10b6:805:d8::25)
 by PH0PR10MB5595.namprd10.prod.outlook.com (2603:10b6:510:f7::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.28; Wed, 14 Jun
 2023 00:29:42 +0000
Received: from SN6PR10MB3022.namprd10.prod.outlook.com
 ([fe80::998f:d221:5fb6:c67d]) by SN6PR10MB3022.namprd10.prod.outlook.com
 ([fe80::998f:d221:5fb6:c67d%7]) with mapi id 15.20.6455.045; Wed, 14 Jun 2023
 00:29:42 +0000
Date: Tue, 13 Jun 2023 20:29:35 -0400
From: "Liam R. Howlett" <Liam.Howlett@Oracle.com>
To: Danilo Krummrich <dakr@redhat.com>
Subject: Re: [PATCH drm-next v4 03/14] drm: manager to keep track of GPUs VA
 mappings
Message-ID: <20230614002935.rwbbys7bbxuaoxod@revolver>
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
References: <20230606223130.6132-1-dakr@redhat.com>
 <20230606223130.6132-4-dakr@redhat.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230606223130.6132-4-dakr@redhat.com>
User-Agent: NeoMutt/20220429
X-ClientProxiedBy: YT4PR01CA0185.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:110::29) To SN6PR10MB3022.namprd10.prod.outlook.com
 (2603:10b6:805:d8::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN6PR10MB3022:EE_|PH0PR10MB5595:EE_
X-MS-Office365-Filtering-Correlation-Id: 58a7fd88-1024-4b51-f34f-08db6c6e7204
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 0h5rpgI9fhH+pXoDKWsNcgo+A32Uj3k0mns7bfJB5+m5EKg/Gf1svyYmPIe1FdWQ8H1T59hEWHqvycL/GNqMFNRq92yXhOBv1ZvMXBDb+O7ZDRrF9SYJ+iPUJitGow35MvuNu3BdCILdvEaArF+Ra/9bJWsSQbXfkdXFXiRD0nAvE7sV638rrWwiHLQBIn/x7+48Quw+XqvQIYJGh5vJpN4STg40QT4JZbYW3UL/6E1kY/hqCf/yCp5PhG1aiqrcHO1DnTgiwxyjeNerYiB3OAfIQDDb1BkTFZvxjphTS2veBNWDVkusof4wwA7dXYKa9jUJ3PyjaUsy5ZFVEbTyw70Ey3ewUxYk48tKdQOhrWNjr15qYbRlYpTr+TltLiZ3lHkQPrn7EvO2SuJvs1koR9X9a0tM7B7LzS+QRMSltEt9HHAd4Sh1M+RA8CaeYCXyhvygMDfb+47q7nxHQK9xoCEkQF4R11YdTs7hM9D56+ReyQ3pHYRpYww0fRd1+3Hq7QqlY4f9rksIajV6Ps7/csfZmveAfoaaJJTLgUKaUZU+MMoQbpCcv+XNg1Y/JxqmHjdv6nRKCC1Ka7cY8pOcrPVAeBqUYqs4LO6AL52owUUsynUzI34x3aR2RVebXYEDy+LJQOVBLfUlszmCsxJWRw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN6PR10MB3022.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(7916004)(396003)(39860400002)(136003)(346002)(376002)(366004)(451199021)(83380400001)(38100700002)(86362001)(33716001)(478600001)(2906002)(6666004)(966005)(6486002)(8936002)(66476007)(5660300002)(8676002)(4326008)(6916009)(66556008)(316002)(30864003)(66946007)(41300700001)(66899021)(7416002)(6512007)(26005)(9686003)(1076003)(6506007)(186003)(579004)(559001)(309714004);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?1YHaCqzVU8Kd2uypfws2tj8v/I1kpNk1OPgAHJ0R/mNam9uMEtpYUO2uD9X1?=
 =?us-ascii?Q?POf/dyYSuJGV8f3Tp2P+kO95cLQoR5qD68+lBRV1Sn2KoBbrt4/Ey6T32iuH?=
 =?us-ascii?Q?QM0aiZafCUPMor4S/KSGDqHInd4KpIbGORy0+NmQdzGKP7Bn8xxiido7YFl2?=
 =?us-ascii?Q?wBuQZlNqZlY6QjOrQpLgKKCEUg5IfKBFo7IffjLltxyyaGFZ005QLXKMbmQO?=
 =?us-ascii?Q?a79pIDmBvx78KxzrMXQjA9NQmcGk2VPeaKomFUcebSDT9osRJfyKPuYxUiae?=
 =?us-ascii?Q?O2b2YxigLEjSTxPssDegYWLRVLGbWXRMMlhfRoAinZVmVe0Rn7EvcVA3lcW0?=
 =?us-ascii?Q?P/iHDTdkACWjJ8yAhpqdAKPN28D4WsXAtmljNJVJH+d5Myuej3r1aY7YEjhU?=
 =?us-ascii?Q?BWBhGpRMBMH3g3cibC5PLt4R3eAKEfP9RU5FME+tS2aDmY8Cgu2tgr7t6lUr?=
 =?us-ascii?Q?vYCBL9Tz5FRBdopicwSjY+W7lArO38DGTrwq6O4AL9MJI+pYrq8JC2tFkjYc?=
 =?us-ascii?Q?OJ8p1xMciQAkGKAFuiLmAjtjFmlwG4hyc+n659zEz0fTRKg2O1kYENJgxftg?=
 =?us-ascii?Q?s6tOCeph7K0MIwEu2zVgTjj/67EY8R12MgsKu8QXjsnQ7RUA5W85ogWIspgt?=
 =?us-ascii?Q?enUoTWP9zbJvI+9acFQxKSZR1UbXi7OghVvshKGHR+yKfs/zSzmxh2uLvh3r?=
 =?us-ascii?Q?np96xFVCfX11S/OTIhx23iKBdTI2Z5UUWABTntf8qVCrsJD7P9EN0PSeJ4am?=
 =?us-ascii?Q?+d1PDH810EM5kXYcIPrG83kJaupyq5O8R34z1t7SjIHdS+l56KIuDOb9adCp?=
 =?us-ascii?Q?W0ThRs8dIH7oFZ8T5CikpWSBbMnXPOjcjaTfO0R3f2ZwSZXTjkoojNTA/Rzo?=
 =?us-ascii?Q?sZ0uPT8i9eZ08vUdFuDC6wittEDBcjiKA4UQZ7UX2Dpl/1uE94Ab0W5d7pbq?=
 =?us-ascii?Q?PeFZiyN3ngdfkx22jEtDqNr2EvdmwTA9I/WhaANrCuHcQrPXAOdV7vY2+xAc?=
 =?us-ascii?Q?kaRfWXHPsvCfDVTbb+Yj4kSoPYZYM7NDCVOSdSwhbQIqbJNPY3xVQJWvgxwa?=
 =?us-ascii?Q?HIY/zH7q13nSroXlSyXgBUH0v91bCfviV/BncJwxYa2c3YG4Eq8v1Bbx8+/i?=
 =?us-ascii?Q?hIxOCpDWEoyKO6ED2KDO5a2F3RBosDH0xlWUl2PRvGWIaf9pc3fw1JkX6mEQ?=
 =?us-ascii?Q?5p7AH0puZB8Vyt51bNY07CnJcj987ye3PjJL2kFAtcobHbrb8iZXhaYNu79x?=
 =?us-ascii?Q?+4wp0qNsm+LSN79UUI0R7Fe7IR0StixOB52j/5K1cHjxQAyPsl3xZQcysGpF?=
 =?us-ascii?Q?FE3Co0kLc0w95bFLAewj6b9IUZZo5tBHZWU7CJVlPEr2fWdL8W8v7FMxEzYH?=
 =?us-ascii?Q?fu/Uo+EfE/nNMbPKoOHPu0ogfVtlcAHElX4mZgN58Az8bKgddBiKL8qHFMj6?=
 =?us-ascii?Q?0mJA9M30BJWnXVlGdGdzf0KDgveIvhvfAjYMTBE44CvX/MjPBCPNLSxs7nQT?=
 =?us-ascii?Q?lDAPC8UwELaGjiV5/eKCUfaJ2KHjixn0343BcA27ms5/cXtZS4OBTnDu++9C?=
 =?us-ascii?Q?FmLheft9IOaoNWCy5BSHIIV3eqr8kl5jsv1KdiSI4x4de1MuIxcaQHHn0nY3?=
 =?us-ascii?Q?Vg=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: =?us-ascii?Q?NcjuC7NJKGxyhn1A1w3qDtL56iV0DFgNk6RKnJuoFTw3hYQI4jokIxI9d5Vq?=
 =?us-ascii?Q?Hc+vQGmiCjvQwGsQiZ17iWCRyy8GLvHncqDiZrALopg3hUzaCQypDemp/PNt?=
 =?us-ascii?Q?BfVbz10MSR5ShHGqxKs0IPGmSE+3o79bELF9joDusQBp+rj7cfONfMgh37h1?=
 =?us-ascii?Q?2aSG84rLm/C7gyUDwSPwuIAJWXiaY7SbHYD9N5SRvR8yCUYzIv3nLo51bLqu?=
 =?us-ascii?Q?RGC6Sukc38dVnlunEP6JEdQc/Dx7spEaBZBimQuWy404C42DaqMKdAvdEh1M?=
 =?us-ascii?Q?maYWdExuYVyj0rSezxSyaO/BbOuIPtA74mY6vAFMvdRzncs4rT+E6lhKSmrF?=
 =?us-ascii?Q?UjHtgdNJy+i9lME9qar+ySoKCnXRF/B0RmenA4fUFNX9BkFuRoLFW+aB4pea?=
 =?us-ascii?Q?54CP8palbGQAJ88evWbu6rg0b5pahu05wiFgAzOOdWsjPr5WgOgqCkwIsR0F?=
 =?us-ascii?Q?NsFxQc2r1FhBxkJxh65/DHxbDvT2y9fW4ZDNyunn1wPLy2a7RXH966mj/OYK?=
 =?us-ascii?Q?0sT/X6W19GoKxtCpJHNZu8yqfr+b9B+eIZ+ocK9a9yBYZFAYCTNQOJcPXEqv?=
 =?us-ascii?Q?dw0HbJl6jmHZg0wiCP7xZuvNp6Qz2bsHQhFPnc0gKzoOIs75WHW3HFjJRLSU?=
 =?us-ascii?Q?u9J5daGWzInqL+xqJDi+DWhoigJAPeNLOg3L6VFge5naMM7m+BOOQeVRFZnG?=
 =?us-ascii?Q?FemCczBrg1t+CzoI9wkhNy6gIrq13KzKobnnAYkUwLfciUo2RDHwlBqMePHb?=
 =?us-ascii?Q?TrMqp+Tvv1UPW58P/2/dJA5/S8n8LfyOiuJQcOQVhwjVkO5cWNFQd+3aQKnG?=
 =?us-ascii?Q?6L1708OcO+yPQ77jk5f5H/OxMqAfOEyo1HqWbOMlUL5+ELvx6TkBVPI5Ht1m?=
 =?us-ascii?Q?jBUdMpoNDGWwcrXHnvWCiWRfIV87MQPYntmqWAZUVSSHz7Y5UXGD8JoWBCis?=
 =?us-ascii?Q?xnBmqzQzFQ3IWORfKktY3mdqLuteYyLqmVRy2gfkXQ2M+y89QEdT+fkUUi1f?=
 =?us-ascii?Q?lQcpGVVchZKiPzJ6EzcoiTSj299FGApdX6RrOb3QWSmlLxibm+Fd46c/Rp+t?=
 =?us-ascii?Q?q3zlO1nSiFcJDlY5kslPkHomBtDz0GVua9vMtrXzSZSTbDeLV7WBFQpqIi2V?=
 =?us-ascii?Q?OLqDqaEQCmYgsX4BRWo0rk7nZZj/s8RrnjltxiYIVsYJQCXQ+Um3DRQ=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 58a7fd88-1024-4b51-f34f-08db6c6e7204
X-MS-Exchange-CrossTenant-AuthSource: SN6PR10MB3022.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jun 2023 00:29:42.3403 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aMqwKtZ5fmsBePHn2GBKudyQ1QZg1ScEPGR/5pDkdprzEKXtfSUpV7bfdCEKVXsnki98wYuf7sM0qDx5ZdrK/w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR10MB5595
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.573,FMLib:17.11.176.26
 definitions=2023-06-13_24,2023-06-12_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0
 bulkscore=0 phishscore=0
 mlxscore=0 suspectscore=0 malwarescore=0 mlxlogscore=999 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2305260000
 definitions=main-2306140001
X-Proofpoint-ORIG-GUID: 0q11R9ZhqOBu2R8O3RIZt7wqR3wpAilw
X-Proofpoint-GUID: 0q11R9ZhqOBu2R8O3RIZt7wqR3wpAilw
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
 bskeggs@redhat.com, tzimmermann@suse.de, Dave Airlie <airlied@redhat.com>,
 bagasdotme@gmail.com, christian.koenig@amd.com, jason@jlekstrand.net
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

* Danilo Krummrich <dakr@redhat.com> [230606 18:32]:
> Add infrastructure to keep track of GPU virtual address (VA) mappings
> with a decicated VA space manager implementation.
> 
> New UAPIs, motivated by Vulkan sparse memory bindings graphics drivers
> start implementing, allow userspace applications to request multiple and
> arbitrary GPU VA mappings of buffer objects. The DRM GPU VA manager is
> intended to serve the following purposes in this context.
> 
> 1) Provide infrastructure to track GPU VA allocations and mappings,
>    making use of the maple_tree.
> 
> 2) Generically connect GPU VA mappings to their backing buffers, in
>    particular DRM GEM objects.
> 
> 3) Provide a common implementation to perform more complex mapping
>    operations on the GPU VA space. In particular splitting and merging
>    of GPU VA mappings, e.g. for intersecting mapping requests or partial
>    unmap requests.
> 
> Suggested-by: Dave Airlie <airlied@redhat.com>
> Signed-off-by: Danilo Krummrich <dakr@redhat.com>
> ---
>  Documentation/gpu/drm-mm.rst    |   31 +
>  drivers/gpu/drm/Makefile        |    1 +
>  drivers/gpu/drm/drm_gem.c       |    3 +
>  drivers/gpu/drm/drm_gpuva_mgr.c | 1687 +++++++++++++++++++++++++++++++
>  include/drm/drm_drv.h           |    6 +
>  include/drm/drm_gem.h           |   75 ++
>  include/drm/drm_gpuva_mgr.h     |  681 +++++++++++++
>  7 files changed, 2484 insertions(+)
>  create mode 100644 drivers/gpu/drm/drm_gpuva_mgr.c
>  create mode 100644 include/drm/drm_gpuva_mgr.h
> 
> diff --git a/Documentation/gpu/drm-mm.rst b/Documentation/gpu/drm-mm.rst
> index a52e6f4117d6..c9f120cfe730 100644
> --- a/Documentation/gpu/drm-mm.rst
> +++ b/Documentation/gpu/drm-mm.rst
> @@ -466,6 +466,37 @@ DRM MM Range Allocator Function References
>  .. kernel-doc:: drivers/gpu/drm/drm_mm.c
>     :export:
>  
> +DRM GPU VA Manager
> +==================
> +
> +Overview
> +--------
> +
> +.. kernel-doc:: drivers/gpu/drm/drm_gpuva_mgr.c
> +   :doc: Overview
> +
> +Split and Merge
> +---------------
> +
> +.. kernel-doc:: drivers/gpu/drm/drm_gpuva_mgr.c
> +   :doc: Split and Merge
> +
> +Locking
> +-------
> +
> +.. kernel-doc:: drivers/gpu/drm/drm_gpuva_mgr.c
> +   :doc: Locking
> +
> +
> +DRM GPU VA Manager Function References
> +--------------------------------------
> +
> +.. kernel-doc:: include/drm/drm_gpuva_mgr.h
> +   :internal:
> +
> +.. kernel-doc:: drivers/gpu/drm/drm_gpuva_mgr.c
> +   :export:
> +
>  DRM Buddy Allocator
>  ===================
>  
> diff --git a/drivers/gpu/drm/Makefile b/drivers/gpu/drm/Makefile
> index 9c6446eb3c83..8eeed446a078 100644
> --- a/drivers/gpu/drm/Makefile
> +++ b/drivers/gpu/drm/Makefile
> @@ -45,6 +45,7 @@ drm-y := \
>  	drm_vblank.o \
>  	drm_vblank_work.o \
>  	drm_vma_manager.o \
> +	drm_gpuva_mgr.o \
>  	drm_writeback.o
>  drm-$(CONFIG_DRM_LEGACY) += \
>  	drm_agpsupport.o \
> diff --git a/drivers/gpu/drm/drm_gem.c b/drivers/gpu/drm/drm_gem.c
> index 1a5a2cd0d4ec..cd878ebddbd0 100644
> --- a/drivers/gpu/drm/drm_gem.c
> +++ b/drivers/gpu/drm/drm_gem.c
> @@ -164,6 +164,9 @@ void drm_gem_private_object_init(struct drm_device *dev,
>  	if (!obj->resv)
>  		obj->resv = &obj->_resv;
>  
> +	if (drm_core_check_feature(dev, DRIVER_GEM_GPUVA))
> +		drm_gem_gpuva_init(obj);
> +
>  	drm_vma_node_reset(&obj->vma_node);
>  	INIT_LIST_HEAD(&obj->lru_node);
>  }
> diff --git a/drivers/gpu/drm/drm_gpuva_mgr.c b/drivers/gpu/drm/drm_gpuva_mgr.c
> new file mode 100644
> index 000000000000..dd8dd7fef14b
> --- /dev/null
> +++ b/drivers/gpu/drm/drm_gpuva_mgr.c
> @@ -0,0 +1,1687 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Copyright (c) 2022 Red Hat.
> + *
> + * Permission is hereby granted, free of charge, to any person obtaining a
> + * copy of this software and associated documentation files (the "Software"),
> + * to deal in the Software without restriction, including without limitation
> + * the rights to use, copy, modify, merge, publish, distribute, sublicense,
> + * and/or sell copies of the Software, and to permit persons to whom the
> + * Software is furnished to do so, subject to the following conditions:
> + *
> + * The above copyright notice and this permission notice shall be included in
> + * all copies or substantial portions of the Software.
> + *
> + * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
> + * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
> + * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SHALL
> + * THE COPYRIGHT HOLDER(S) OR AUTHOR(S) BE LIABLE FOR ANY CLAIM, DAMAGES OR
> + * OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE,
> + * ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
> + * OTHER DEALINGS IN THE SOFTWARE.
> + *
> + * Authors:
> + *     Danilo Krummrich <dakr@redhat.com>
> + *
> + */
> +
> +#include <drm/drm_gem.h>
> +#include <drm/drm_gpuva_mgr.h>
> +
> +/**
> + * DOC: Overview
> + *
> + * The DRM GPU VA Manager, represented by struct drm_gpuva_manager keeps track
> + * of a GPU's virtual address (VA) space and manages the corresponding virtual
> + * mappings represented by &drm_gpuva objects. It also keeps track of the
> + * mapping's backing &drm_gem_object buffers.
> + *
> + * &drm_gem_object buffers maintain a list (and a corresponding list lock) of
> + * &drm_gpuva objects representing all existent GPU VA mappings using this
> + * &drm_gem_object as backing buffer.
> + *
> + * GPU VAs can be flagged as sparse, such that drivers may use GPU VAs to also
> + * keep track of sparse PTEs in order to support Vulkan 'Sparse Resources'.
> + *
> + * The GPU VA manager internally uses a &maple_tree to manage the
> + * &drm_gpuva mappings within a GPU's virtual address space.
> + *
> + * The &drm_gpuva_manager contains a special &drm_gpuva representing the
> + * portion of VA space reserved by the kernel. This node is initialized together
> + * with the GPU VA manager instance and removed when the GPU VA manager is
> + * destroyed.
> + *
> + * In a typical application drivers would embed struct drm_gpuva_manager and
> + * struct drm_gpuva within their own driver specific structures, there won't be
> + * any memory allocations of it's own nor memory allocations of &drm_gpuva
> + * entries.
> + *
> + * However, the &drm_gpuva_manager needs to allocate nodes for it's internal
> + * tree structures when &drm_gpuva entries are inserted. In order to support
> + * inserting &drm_gpuva entries from dma-fence signalling critical sections the
> + * &drm_gpuva_manager provides struct drm_gpuva_prealloc. Drivers may create
> + * pre-allocated nodes which drm_gpuva_prealloc_create() and subsequently insert
> + * a new &drm_gpuva entry with drm_gpuva_insert_prealloc().
> + */
> +
> +/**
> + * DOC: Split and Merge
> + *
> + * The DRM GPU VA manager also provides an algorithm implementing splitting and
> + * merging of existent GPU VA mappings with the ones that are requested to be
> + * mapped or unmapped. This feature is required by the Vulkan API to implement
> + * Vulkan 'Sparse Memory Bindings' - drivers UAPIs often refer to this as
> + * VM BIND.
> + *
> + * Drivers can call drm_gpuva_sm_map() to receive a sequence of callbacks
> + * containing map, unmap and remap operations for a given newly requested
> + * mapping. The sequence of callbacks represents the set of operations to
> + * execute in order to integrate the new mapping cleanly into the current state
> + * of the GPU VA space.
> + *
> + * Depending on how the new GPU VA mapping intersects with the existent mappings
> + * of the GPU VA space the &drm_gpuva_fn_ops callbacks contain an arbitrary
> + * amount of unmap operations, a maximum of two remap operations and a single
> + * map operation. The caller might receive no callback at all if no operation is
> + * required, e.g. if the requested mapping already exists in the exact same way.
> + *
> + * The single map operation represents the original map operation requested by
> + * the caller.
> + *
> + * &drm_gpuva_op_unmap contains a 'keep' field, which indicates whether the
> + * &drm_gpuva to unmap is physically contiguous with the original mapping
> + * request. Optionally, if 'keep' is set, drivers may keep the actual page table
> + * entries for this &drm_gpuva, adding the missing page table entries only and
> + * update the &drm_gpuva_manager's view of things accordingly.
> + *
> + * Drivers may do the same optimization, namely delta page table updates, also
> + * for remap operations. This is possible since &drm_gpuva_op_remap consists of
> + * one unmap operation and one or two map operations, such that drivers can
> + * derive the page table update delta accordingly.
> + *
> + * Note that there can't be more than two existent mappings to split up, one at
> + * the beginning and one at the end of the new mapping, hence there is a
> + * maximum of two remap operations.
> + *
> + * Analogous to drm_gpuva_sm_map() drm_gpuva_sm_unmap() uses &drm_gpuva_fn_ops
> + * to call back into the driver in order to unmap a range of GPU VA space. The
> + * logic behind this function is way simpler though: For all existent mappings
> + * enclosed by the given range unmap operations are created. For mappings which
> + * are only partically located within the given range, remap operations are
> + * created such that those mappings are split up and re-mapped partically.
> + *
> + * To update the &drm_gpuva_manager's view of the GPU VA space
> + * drm_gpuva_insert(), drm_gpuva_insert_prealloc(), and drm_gpuva_remove() may
> + * be used. Please note that these functions are not safe to be called from a
> + * &drm_gpuva_fn_ops callback originating from drm_gpuva_sm_map() or
> + * drm_gpuva_sm_unmap(). The drm_gpuva_map(), drm_gpuva_remap() and
> + * drm_gpuva_unmap() helpers should be used instead.
> + *
> + * The following diagram depicts the basic relationships of existent GPU VA
> + * mappings, a newly requested mapping and the resulting mappings as implemented
> + * by drm_gpuva_sm_map() - it doesn't cover any arbitrary combinations of these.
> + *
> + * 1) Requested mapping is identical. Replace it, but indicate the backing PTEs
> + *    could be kept.
> + *
> + *    ::
> + *
> + *	     0     a     1
> + *	old: |-----------| (bo_offset=n)
> + *
> + *	     0     a     1
> + *	req: |-----------| (bo_offset=n)
> + *
> + *	     0     a     1
> + *	new: |-----------| (bo_offset=n)
> + *
> + *
> + * 2) Requested mapping is identical, except for the BO offset, hence replace
> + *    the mapping.
> + *
> + *    ::
> + *
> + *	     0     a     1
> + *	old: |-----------| (bo_offset=n)
> + *
> + *	     0     a     1
> + *	req: |-----------| (bo_offset=m)
> + *
> + *	     0     a     1
> + *	new: |-----------| (bo_offset=m)
> + *
> + *
> + * 3) Requested mapping is identical, except for the backing BO, hence replace
> + *    the mapping.
> + *
> + *    ::
> + *
> + *	     0     a     1
> + *	old: |-----------| (bo_offset=n)
> + *
> + *	     0     b     1
> + *	req: |-----------| (bo_offset=n)
> + *
> + *	     0     b     1
> + *	new: |-----------| (bo_offset=n)
> + *
> + *
> + * 4) Existent mapping is a left aligned subset of the requested one, hence
> + *    replace the existent one.
> + *
> + *    ::
> + *
> + *	     0  a  1
> + *	old: |-----|       (bo_offset=n)
> + *
> + *	     0     a     2
> + *	req: |-----------| (bo_offset=n)
> + *
> + *	     0     a     2
> + *	new: |-----------| (bo_offset=n)
> + *
> + *    .. note::
> + *       We expect to see the same result for a request with a different BO
> + *       and/or non-contiguous BO offset.
> + *
> + *
> + * 5) Requested mapping's range is a left aligned subset of the existent one,
> + *    but backed by a different BO. Hence, map the requested mapping and split
> + *    the existent one adjusting it's BO offset.
> + *
> + *    ::
> + *
> + *	     0     a     2
> + *	old: |-----------| (bo_offset=n)
> + *
> + *	     0  b  1
> + *	req: |-----|       (bo_offset=n)
> + *
> + *	     0  b  1  a' 2
> + *	new: |-----|-----| (b.bo_offset=n, a.bo_offset=n+1)
> + *
> + *    .. note::
> + *       We expect to see the same result for a request with a different BO
> + *       and/or non-contiguous BO offset.
> + *
> + *
> + * 6) Existent mapping is a superset of the requested mapping. Split it up, but
> + *    indicate that the backing PTEs could be kept.
> + *
> + *    ::
> + *
> + *	     0     a     2
> + *	old: |-----------| (bo_offset=n)
> + *
> + *	     0  a  1
> + *	req: |-----|       (bo_offset=n)
> + *
> + *	     0  a  1  a' 2
> + *	new: |-----|-----| (a.bo_offset=n, a'.bo_offset=n+1)
> + *
> + *
> + * 7) Requested mapping's range is a right aligned subset of the existent one,
> + *    but backed by a different BO. Hence, map the requested mapping and split
> + *    the existent one, without adjusting the BO offset.
> + *
> + *    ::
> + *
> + *	     0     a     2
> + *	old: |-----------| (bo_offset=n)
> + *
> + *	           1  b  2
> + *	req:       |-----| (bo_offset=m)
> + *
> + *	     0  a  1  b  2
> + *	new: |-----|-----| (a.bo_offset=n,b.bo_offset=m)
> + *
> + *
> + * 8) Existent mapping is a superset of the requested mapping. Split it up, but
> + *    indicate that the backing PTEs could be kept.
> + *
> + *    ::
> + *
> + *	      0     a     2
> + *	old: |-----------| (bo_offset=n)
> + *
> + *	           1  a  2
> + *	req:       |-----| (bo_offset=n+1)
> + *
> + *	     0  a' 1  a  2
> + *	new: |-----|-----| (a'.bo_offset=n, a.bo_offset=n+1)
> + *
> + *
> + * 9) Existent mapping is overlapped at the end by the requested mapping backed
> + *    by a different BO. Hence, map the requested mapping and split up the
> + *    existent one, without adjusting the BO offset.
> + *
> + *    ::
> + *
> + *	     0     a     2
> + *	old: |-----------|       (bo_offset=n)
> + *
> + *	           1     b     3
> + *	req:       |-----------| (bo_offset=m)
> + *
> + *	     0  a  1     b     3
> + *	new: |-----|-----------| (a.bo_offset=n,b.bo_offset=m)
> + *
> + *
> + * 10) Existent mapping is overlapped by the requested mapping, both having the
> + *     same backing BO with a contiguous offset. Indicate the backing PTEs of
> + *     the old mapping could be kept.
> + *
> + *     ::
> + *
> + *	      0     a     2
> + *	 old: |-----------|       (bo_offset=n)
> + *
> + *	            1     a     3
> + *	 req:       |-----------| (bo_offset=n+1)
> + *
> + *	      0  a' 1     a     3
> + *	 new: |-----|-----------| (a'.bo_offset=n, a.bo_offset=n+1)
> + *
> + *
> + * 11) Requested mapping's range is a centered subset of the existent one
> + *     having a different backing BO. Hence, map the requested mapping and split
> + *     up the existent one in two mappings, adjusting the BO offset of the right
> + *     one accordingly.
> + *
> + *     ::
> + *
> + *	      0        a        3
> + *	 old: |-----------------| (bo_offset=n)
> + *
> + *	            1  b  2
> + *	 req:       |-----|       (bo_offset=m)
> + *
> + *	      0  a  1  b  2  a' 3
> + *	 new: |-----|-----|-----| (a.bo_offset=n,b.bo_offset=m,a'.bo_offset=n+2)
> + *
> + *
> + * 12) Requested mapping is a contiguous subset of the existent one. Split it
> + *     up, but indicate that the backing PTEs could be kept.
> + *
> + *     ::
> + *
> + *	      0        a        3
> + *	 old: |-----------------| (bo_offset=n)
> + *
> + *	            1  a  2
> + *	 req:       |-----|       (bo_offset=n+1)
> + *
> + *	      0  a' 1  a  2 a'' 3
> + *	 old: |-----|-----|-----| (a'.bo_offset=n, a.bo_offset=n+1, a''.bo_offset=n+2)
> + *
> + *
> + * 13) Existent mapping is a right aligned subset of the requested one, hence
> + *     replace the existent one.
> + *
> + *     ::
> + *
> + *	            1  a  2
> + *	 old:       |-----| (bo_offset=n+1)
> + *
> + *	      0     a     2
> + *	 req: |-----------| (bo_offset=n)
> + *
> + *	      0     a     2
> + *	 new: |-----------| (bo_offset=n)
> + *
> + *     .. note::
> + *        We expect to see the same result for a request with a different bo
> + *        and/or non-contiguous bo_offset.
> + *
> + *
> + * 14) Existent mapping is a centered subset of the requested one, hence
> + *     replace the existent one.
> + *
> + *     ::
> + *
> + *	            1  a  2
> + *	 old:       |-----| (bo_offset=n+1)
> + *
> + *	      0        a       3
> + *	 req: |----------------| (bo_offset=n)
> + *
> + *	      0        a       3
> + *	 new: |----------------| (bo_offset=n)
> + *
> + *     .. note::
> + *        We expect to see the same result for a request with a different bo
> + *        and/or non-contiguous bo_offset.
> + *
> + *
> + * 15) Existent mappings is overlapped at the beginning by the requested mapping
> + *     backed by a different BO. Hence, map the requested mapping and split up
> + *     the existent one, adjusting it's BO offset accordingly.
> + *
> + *     ::
> + *
> + *	            1     a     3
> + *	 old:       |-----------| (bo_offset=n)
> + *
> + *	      0     b     2
> + *	 req: |-----------|       (bo_offset=m)
> + *
> + *	      0     b     2  a' 3
> + *	 new: |-----------|-----| (b.bo_offset=m,a.bo_offset=n+2)
> + */
> +
> +/**
> + * DOC: Locking
> + *
> + * Generally, the GPU VA manager does not take care of locking itself, it is
> + * the drivers responsibility to take care about locking. Drivers might want to
> + * protect the following operations: inserting, removing and iterating
> + * &drm_gpuva objects as well as generating all kinds of operations, such as
> + * split / merge or prefetch.
> + *
> + * The GPU VA manager also does not take care of the locking of the backing
> + * &drm_gem_object buffers GPU VA lists by itself; drivers are responsible to
> + * enforce mutual exclusion.
> + */
> +
> + /*
> +  * Maple Tree Locking
> +  *
> +  * The maple tree's advanced API requires the user of the API to protect
> +  * certain tree operations with a lock (either the external or internal tree
> +  * lock) for tree internal reasons.
> +  *
> +  * The actual rules (when to aquire/release the lock) are enforced by lockdep
> +  * through the maple tree implementation.
> +  *
> +  * For this reason the DRM GPUVA manager takes the maple tree's internal
> +  * spinlock according to the lockdep enforced rules.
> +  *
> +  * Please note, that this lock is *only* meant to fulfill the maple trees
> +  * requirements and does not intentionally protect the DRM GPUVA manager
> +  * against concurrent access.
> +  *
> +  * The following mail thread provides more details on why the maple tree
> +  * has this requirement.
> +  *
> +  * https://lore.kernel.org/lkml/20230217134422.14116-5-dakr@redhat.com/
> +  */
> +
> +static int __drm_gpuva_insert(struct drm_gpuva_manager *mgr,
> +			      struct drm_gpuva *va);
> +static void __drm_gpuva_remove(struct drm_gpuva *va);
> +
> +/**
> + * drm_gpuva_manager_init - initialize a &drm_gpuva_manager
> + * @mgr: pointer to the &drm_gpuva_manager to initialize
> + * @name: the name of the GPU VA space
> + * @start_offset: the start offset of the GPU VA space
> + * @range: the size of the GPU VA space
> + * @reserve_offset: the start of the kernel reserved GPU VA area
> + * @reserve_range: the size of the kernel reserved GPU VA area
> + * @ops: &drm_gpuva_fn_ops called on &drm_gpuva_sm_map / &drm_gpuva_sm_unmap
> + *
> + * The &drm_gpuva_manager must be initialized with this function before use.
> + *
> + * Note that @mgr must be cleared to 0 before calling this function. The given
> + * &name is expected to be managed by the surrounding driver structures.
> + */
> +void
> +drm_gpuva_manager_init(struct drm_gpuva_manager *mgr,
> +		       const char *name,
> +		       u64 start_offset, u64 range,
> +		       u64 reserve_offset, u64 reserve_range,
> +		       const struct drm_gpuva_fn_ops *ops)
> +{
> +	mt_init(&mgr->mtree);
> +
> +	mgr->mm_start = start_offset;
> +	mgr->mm_range = range;
> +
> +	mgr->name = name ? name : "unknown";
> +	mgr->ops = ops;
> +
> +	memset(&mgr->kernel_alloc_node, 0, sizeof(struct drm_gpuva));
> +
> +	if (reserve_range) {
> +		mgr->kernel_alloc_node.va.addr = reserve_offset;
> +		mgr->kernel_alloc_node.va.range = reserve_range;
> +
> +		__drm_gpuva_insert(mgr, &mgr->kernel_alloc_node);
> +	}
> +
> +}
> +EXPORT_SYMBOL(drm_gpuva_manager_init);
> +
> +/**
> + * drm_gpuva_manager_destroy - cleanup a &drm_gpuva_manager
> + * @mgr: pointer to the &drm_gpuva_manager to clean up
> + *
> + * Note that it is a bug to call this function on a manager that still
> + * holds GPU VA mappings.
> + */
> +void
> +drm_gpuva_manager_destroy(struct drm_gpuva_manager *mgr)
> +{
> +	mgr->name = NULL;
> +
> +	if (mgr->kernel_alloc_node.va.range)
> +		__drm_gpuva_remove(&mgr->kernel_alloc_node);
> +
> +	mtree_lock(&mgr->mtree);
> +	WARN(!mtree_empty(&mgr->mtree),
> +	     "GPUVA tree is not empty, potentially leaking memory.");
> +	__mt_destroy(&mgr->mtree);
> +	mtree_unlock(&mgr->mtree);
> +}
> +EXPORT_SYMBOL(drm_gpuva_manager_destroy);
> +
> +static inline bool
> +drm_gpuva_in_mm_range(struct drm_gpuva_manager *mgr, u64 addr, u64 range)
> +{
> +	u64 end = addr + range;
> +	u64 mm_start = mgr->mm_start;
> +	u64 mm_end = mm_start + mgr->mm_range;
> +
> +	return addr < mm_end && mm_start < end;
> +}
> +
> +static inline bool
> +drm_gpuva_in_kernel_node(struct drm_gpuva_manager *mgr, u64 addr, u64 range)
> +{
> +	u64 end = addr + range;
> +	u64 kstart = mgr->kernel_alloc_node.va.addr;
> +	u64 krange = mgr->kernel_alloc_node.va.range;
> +	u64 kend = kstart + krange;
> +
> +	return krange && addr < kend && kstart < end;
> +}
> +
> +static inline bool
> +drm_gpuva_range_valid(struct drm_gpuva_manager *mgr,
> +		      u64 addr, u64 range)
> +{
> +	return drm_gpuva_in_mm_range(mgr, addr, range) &&
> +	       !drm_gpuva_in_kernel_node(mgr, addr, range);
> +}
> +
> +/**
> + * drm_gpuva_iter_remove - removes the iterators current element
> + * @it: the &drm_gpuva_iterator
> + *
> + * This removes the element the iterator currently points to.
> + */
> +void
> +drm_gpuva_iter_remove(struct drm_gpuva_iterator *it)
> +{
> +	mas_lock(&it->mas);
> +	mas_erase(&it->mas);
> +	mas_unlock(&it->mas);
> +}
> +EXPORT_SYMBOL(drm_gpuva_iter_remove);
> +
> +/**
> + * drm_gpuva_prealloc_create - creates a preallocated node to store a
> + * &drm_gpuva entry.
> + *
> + * Returns: the &drm_gpuva_prealloc object on success, NULL on failure
> + */
> +struct drm_gpuva_prealloc *
> +drm_gpuva_prealloc_create(struct drm_gpuva_manager *mgr)
> +{
> +	struct drm_gpuva_prealloc *pa;
> +
> +	pa = kzalloc(sizeof(*pa), GFP_KERNEL);
> +	if (!pa)
> +		return NULL;
> +
> +	mas_init(&pa->mas, &mgr->mtree, 0);

I've broken this interface on you too, with the mas_preallocate()
change - See below.

> +	if (mas_preallocate(&pa->mas, GFP_KERNEL)) {
> +		kfree(pa);
> +		return NULL;
> +	}
> +
> +	return pa;
> +}
> +EXPORT_SYMBOL(drm_gpuva_prealloc_create);
> +
> +/**
> + * drm_gpuva_prealloc_destroy - destroyes a preallocated node and frees the
> + * &drm_gpuva_prealloc

I tend to think of it as destroying a maple state by freeing the
preallocated nodes, but I guess the state isn't destroyed.

> + *
> + * @pa: the &drm_gpuva_prealloc to destroy
> + */
> +void
> +drm_gpuva_prealloc_destroy(struct drm_gpuva_prealloc *pa)
> +{
> +	mas_destroy(&pa->mas);
> +	kfree(pa);
> +}
> +EXPORT_SYMBOL(drm_gpuva_prealloc_destroy);
> +
> +static int
> +drm_gpuva_insert_state(struct drm_gpuva_manager *mgr,
> +		       struct ma_state *mas,
> +		       struct drm_gpuva *va)

Couldn't these arguments could be on one line?

> +{
> +	u64 addr = va->va.addr;
> +	u64 range = va->va.range;
> +	u64 last = addr + range - 1;
> +
> +	mas_set(mas, addr);
> +
> +	mas_lock(mas);
> +	if (unlikely(mas_walk(mas))) {
> +		mas_unlock(mas);
> +		return -EEXIST;
> +	}
> +
> +	if (unlikely(mas->last < last)) {
> +		mas_unlock(mas);
> +		return -EEXIST;
> +	}
> +
> +	mas->index = addr;
> +	mas->last = last;
> +
> +	mas_store_prealloc(mas, va);
> +	mas_unlock(mas);
> +
> +	va->mgr = mgr;
> +
> +	return 0;
> +}
> +
> +static int
> +__drm_gpuva_insert(struct drm_gpuva_manager *mgr,
> +		   struct drm_gpuva *va)
> +{
> +	MA_STATE(mas, &mgr->mtree, 0, 0);
> +	int ret;
> +
> +	ret = mas_preallocate(&mas, GFP_KERNEL);

mas_preallocate() is in the process of being updated to reduce the
allocations, so this will eventually fail to compile [1].

mas_preallocate(&mas, va, GFP_KERNEL) will work in the future.

The calculated allocations depend on the area being written and if there
is a value or NULL being written.

> +	if (ret)
> +		return ret;
> +
> +	return drm_gpuva_insert_state(mgr, &mas, va);

This has the added effect that the mas_preallocate() examines the tree
by walking it, so you need to hold the lock during that work.  It is
also possible, since you are not holding the lock here, that you could
have a writer come in and change what you preallocated to store and may
cause the write to not have enough memory.  IIRC you have another
locking strategy that negates this, but you will still need to hold the
lock and have the maple state pointing at the correct range now (or,
well, soon) to keep lockdep happy.

Change this:
	MA_STATE(mas, &mgr->mtree, 0, 0);

to something like this (but hopefully less ugly..)
	MA_STATE(mas, &mgr->mtree, va->va.addr, va->va.addr + va->va.range - 1);

...maybe use mas_init() instead.

This strictly does not need to preallocate since you don't have complex
locking in this case, but I suspect you are preallocating for external
driver use as documented in this patch?  This can still work if the
preallocation call sets up the maple state and the driver doesn't mess
things up on you.  You could check that by verifying mas.index and
mas.last are what you expect, but I think you'll want to move your
mas_walk() checks to before preallocating.

[1] https://lore.kernel.org/all/20230612203953.2093911-1-Liam.Howlett@oracle.com/

> +}
> +
> +/**
> + * drm_gpuva_insert - insert a &drm_gpuva
> + * @mgr: the &drm_gpuva_manager to insert the &drm_gpuva in
> + * @va: the &drm_gpuva to insert
> + *
> + * Insert a &drm_gpuva with a given address and range into a
> + * &drm_gpuva_manager.
> + *
> + * It is not allowed to use this function while iterating this GPU VA space,
> + * e.g via drm_gpuva_iter_for_each().
> + *
> + * Returns: 0 on success, negative error code on failure.
> + */
> +int
> +drm_gpuva_insert(struct drm_gpuva_manager *mgr,
> +		 struct drm_gpuva *va)
> +{
> +	u64 addr = va->va.addr;
> +	u64 range = va->va.range;
> +
> +	if (unlikely(!drm_gpuva_range_valid(mgr, addr, range)))
> +		return -EINVAL;
> +
> +	return __drm_gpuva_insert(mgr, va);
> +}
> +EXPORT_SYMBOL(drm_gpuva_insert);
> +
> +/**
> + * drm_gpuva_insert_prealloc - insert a &drm_gpuva with a preallocated node
> + * @mgr: the &drm_gpuva_manager to insert the &drm_gpuva in
> + * @va: the &drm_gpuva to insert
> + * @pa: the &drm_gpuva_prealloc node
> + *
> + * Insert a &drm_gpuva with a given address and range into a
> + * &drm_gpuva_manager.
> + *
> + * It is not allowed to use this function while iterating this GPU VA space,
> + * e.g via drm_gpuva_iter_for_each().
> + *
> + * Returns: 0 on success, negative error code on failure.
> + */
> +int
> +drm_gpuva_insert_prealloc(struct drm_gpuva_manager *mgr,
> +			  struct drm_gpuva_prealloc *pa,
> +			  struct drm_gpuva *va)
> +{
> +	struct ma_state *mas = &pa->mas;
> +	u64 addr = va->va.addr;
> +	u64 range = va->va.range;
> +
> +	if (unlikely(!drm_gpuva_range_valid(mgr, addr, range)))
> +		return -EINVAL;
> +
> +	mas->tree = &mgr->mtree;

Are you trying to take the allocated nodes for a write to a different
tree?  You may not have enough nodes..

> +	return drm_gpuva_insert_state(mgr, mas, va);
> +}
> +EXPORT_SYMBOL(drm_gpuva_insert_prealloc);
> +
> +static void
> +__drm_gpuva_remove(struct drm_gpuva *va)
> +{
> +	MA_STATE(mas, &va->mgr->mtree, va->va.addr, 0);
> +
> +	mas_lock(&mas);
> +	mas_erase(&mas);
> +	mas_unlock(&mas);

This should be the same as: mtree_erase(&va->mgr->mtree, va->va.addr);

> +}
> +
> +/**
> + * drm_gpuva_remove - remove a &drm_gpuva
> + * @va: the &drm_gpuva to remove
> + *
> + * This removes the given &va from the underlaying tree.
> + *
> + * It is not allowed to use this function while iterating this GPU VA space,
> + * e.g via drm_gpuva_iter_for_each(). Please use drm_gpuva_iter_remove()
> + * instead.
> + */
> +void
> +drm_gpuva_remove(struct drm_gpuva *va)
> +{
> +	struct drm_gpuva_manager *mgr = va->mgr;
> +
> +	if (unlikely(va == &mgr->kernel_alloc_node)) {
> +		WARN(1, "Can't destroy kernel reserved node.\n");
> +		return;
> +	}
> +
> +	__drm_gpuva_remove(va);
> +}
> +EXPORT_SYMBOL(drm_gpuva_remove);
> +
> +/**
> + * drm_gpuva_link - link a &drm_gpuva
> + * @va: the &drm_gpuva to link
> + *
> + * This adds the given &va to the GPU VA list of the &drm_gem_object it is
> + * associated with.
> + *
> + * This function expects the caller to protect the GEM's GPUVA list against
> + * concurrent access.
> + */
> +void
> +drm_gpuva_link(struct drm_gpuva *va)
> +{
> +	if (likely(va->gem.obj))
> +		list_add_tail(&va->gem.entry, &va->gem.obj->gpuva.list);
> +}
> +EXPORT_SYMBOL(drm_gpuva_link);
> +
> +/**
> + * drm_gpuva_unlink - unlink a &drm_gpuva
> + * @va: the &drm_gpuva to unlink
> + *
> + * This removes the given &va from the GPU VA list of the &drm_gem_object it is
> + * associated with.
> + *
> + * This function expects the caller to protect the GEM's GPUVA list against
> + * concurrent access.
> + */
> +void
> +drm_gpuva_unlink(struct drm_gpuva *va)
> +{
> +	if (likely(va->gem.obj))
> +		list_del_init(&va->gem.entry);
> +}
> +EXPORT_SYMBOL(drm_gpuva_unlink);
> +
> +/**
> + * drm_gpuva_find_first - find the first &drm_gpuva in the given range
> + * @mgr: the &drm_gpuva_manager to search in
> + * @addr: the &drm_gpuvas address
> + * @range: the &drm_gpuvas range
> + *
> + * Returns: the first &drm_gpuva within the given range
> + */
> +struct drm_gpuva *
> +drm_gpuva_find_first(struct drm_gpuva_manager *mgr,
> +		     u64 addr, u64 range)
> +{
> +	MA_STATE(mas, &mgr->mtree, addr, 0);
> +	struct drm_gpuva *va;
> +

Again, this can be an rcu_read_lock()

> +	mas_lock(&mas);
> +	va = mas_find(&mas, addr + range - 1);
> +	mas_unlock(&mas);
> +
> +	return va;
> +}
> +EXPORT_SYMBOL(drm_gpuva_find_first);
> +
> +/**
> + * drm_gpuva_find - find a &drm_gpuva
> + * @mgr: the &drm_gpuva_manager to search in
> + * @addr: the &drm_gpuvas address
> + * @range: the &drm_gpuvas range
> + *
> + * Returns: the &drm_gpuva at a given &addr and with a given &range
> + */
> +struct drm_gpuva *
> +drm_gpuva_find(struct drm_gpuva_manager *mgr,
> +	       u64 addr, u64 range)
> +{
> +	struct drm_gpuva *va;
> +
> +	va = drm_gpuva_find_first(mgr, addr, range);
> +	if (!va)
> +		goto out;
> +
> +	if (va->va.addr != addr ||
> +	    va->va.range != range)
> +		goto out;
> +
> +	return va;
> +
> +out:
> +	return NULL;
> +}
> +EXPORT_SYMBOL(drm_gpuva_find);
> +
> +/**
> + * drm_gpuva_find_prev - find the &drm_gpuva before the given address
> + * @mgr: the &drm_gpuva_manager to search in
> + * @start: the given GPU VA's start address
> + *
> + * Find the adjacent &drm_gpuva before the GPU VA with given &start address.
> + *
> + * Note that if there is any free space between the GPU VA mappings no mapping
> + * is returned.
> + *
> + * Returns: a pointer to the found &drm_gpuva or NULL if none was found
> + */
> +struct drm_gpuva *
> +drm_gpuva_find_prev(struct drm_gpuva_manager *mgr, u64 start)
> +{
> +	MA_STATE(mas, &mgr->mtree, start - 1, 0);
> +	struct drm_gpuva *va;
> +
> +	if (start <= mgr->mm_start ||
> +	    start > (mgr->mm_start + mgr->mm_range))
> +		return NULL;
> +

And here as well.  Maybe mtree_load() would be easier?

> +	mas_lock(&mas);
> +	va = mas_walk(&mas);
> +	mas_unlock(&mas);
> +
> +	return va;
> +}
> +EXPORT_SYMBOL(drm_gpuva_find_prev);
> +
> +/**
> + * drm_gpuva_find_next - find the &drm_gpuva after the given address
> + * @mgr: the &drm_gpuva_manager to search in
> + * @end: the given GPU VA's end address
> + *
> + * Find the adjacent &drm_gpuva after the GPU VA with given &end address.
> + *
> + * Note that if there is any free space between the GPU VA mappings no mapping
> + * is returned.
> + *
> + * Returns: a pointer to the found &drm_gpuva or NULL if none was found
> + */
> +struct drm_gpuva *
> +drm_gpuva_find_next(struct drm_gpuva_manager *mgr, u64 end)
> +{
> +	MA_STATE(mas, &mgr->mtree, end, 0);
> +	struct drm_gpuva *va;
> +
> +	if (end < mgr->mm_start ||
> +	    end >= (mgr->mm_start + mgr->mm_range))
> +		return NULL;
> +

Here too, you can use the mtree_load() function.

A note though that when I store my VMAs in the mm code, the VMAs are
[start, end) and the tree is [start, end], so I always take one away.
Not sure if your VMAs are the same way.

> +	mas_lock(&mas);
> +	va = mas_walk(&mas);
> +	mas_unlock(&mas);
> +
> +	return va;
> +}
> +EXPORT_SYMBOL(drm_gpuva_find_next);
> +
> +/**
> + * drm_gpuva_interval_empty - indicate whether a given interval of the VA space
> + * is empty
> + * @mgr: the &drm_gpuva_manager to check the range for
> + * @addr: the start address of the range
> + * @range: the range of the interval
> + *
> + * Returns: true if the interval is empty, false otherwise
> + */
> +bool
> +drm_gpuva_interval_empty(struct drm_gpuva_manager *mgr, u64 addr, u64 range)
> +{
> +	DRM_GPUVA_ITER(it, mgr, addr);
> +	struct drm_gpuva *va;
> +
> +	drm_gpuva_iter_for_each_range(va, it, addr + range)
> +		return false;
> +
> +	return true;
> +}
> +EXPORT_SYMBOL(drm_gpuva_interval_empty);
> +
> +/**
> + * drm_gpuva_map - helper to insert a &drm_gpuva from &drm_gpuva_fn_ops
> + * callbacks
> + *
> + * @mgr: the &drm_gpuva_manager
> + * @pa: the &drm_gpuva_prealloc
> + * @va: the &drm_gpuva to inser
> + */
> +int
> +drm_gpuva_map(struct drm_gpuva_manager *mgr,
> +	      struct drm_gpuva_prealloc *pa,
> +	      struct drm_gpuva *va)
> +{
> +	return drm_gpuva_insert_prealloc(mgr, pa, va);
> +}
> +EXPORT_SYMBOL(drm_gpuva_map);
> +
> +/**
> + * drm_gpuva_remap - helper to insert a &drm_gpuva from &drm_gpuva_fn_ops
> + * callbacks
> + *
> + * @state: the current &drm_gpuva_state
> + * @prev: the &drm_gpuva to remap when keeping the start of a mapping,
> + * may be NULL
> + * @next: the &drm_gpuva to remap when keeping the end of a mapping,
> + * may be NULL
> + */
> +int
> +drm_gpuva_remap(drm_gpuva_state_t state,
> +		struct drm_gpuva *prev,
> +		struct drm_gpuva *next)
> +{
> +	struct ma_state *mas = &state->mas;
> +	u64 max = mas->last;
> +
> +	if (unlikely(!prev && !next))
> +		return -EINVAL;
> +
> +	if (prev) {
> +		u64 addr = prev->va.addr;
> +		u64 last = addr + prev->va.range - 1;
> +
> +		if (unlikely(addr != mas->index))
> +			return -EINVAL;
> +
> +		if (unlikely(last >= mas->last))
> +			return -EINVAL;
> +	}
> +
> +	if (next) {
> +		u64 addr = next->va.addr;
> +		u64 last = addr + next->va.range - 1;
> +
> +		if (unlikely(last != mas->last))
> +			return -EINVAL;
> +
> +		if (unlikely(addr <= mas->index))
> +			return -EINVAL;
> +	}
> +
> +	if (prev && next) {
> +		u64 p_last = prev->va.addr + prev->va.range - 1;
> +		u64 n_addr = next->va.addr;
> +
> +		if (unlikely(p_last > n_addr))
> +			return -EINVAL;
> +
> +		if (unlikely(n_addr - p_last <= 1))
> +			return -EINVAL;
> +	}
> +
> +	mas_lock(mas);
> +	if (prev) {
> +		mas_store(mas, prev);
> +		mas_next(mas, max);

This will advance to the next entry, is that what you want to do?  I
think you want mas_next_range(), which is in a recent patch set [2].  I
believe, what you have here is a large range which is NULL and you are
either inserting something at the start, at the end, or both?

[2] https://lore.kernel.org/lkml/20230518145544.1722059-29-Liam.Howlett@oracle.com/

> +		if (!next)
> +			mas_store(mas, NULL);
> +	}
> +
> +	if (next) {
> +		mas->last = next->va.addr - 1;
> +		mas_store(mas, NULL);
> +		mas_next(mas, max);
> +		mas_store(mas, next);
> +	}
> +	mas_unlock(mas);
> +
> +	return 0;
> +}
> +EXPORT_SYMBOL(drm_gpuva_remap);
> +
> +/**
> + * drm_gpuva_unmap - helper to remove a &drm_gpuva from &drm_gpuva_fn_ops
> + * callbacks
> + *
> + * @state: the current &drm_gpuva_state
> + *
> + * The entry associated with the current state is removed.
> + */
> +void
> +drm_gpuva_unmap(drm_gpuva_state_t state)
> +{
> +	drm_gpuva_iter_remove(state);
> +}
> +EXPORT_SYMBOL(drm_gpuva_unmap);
> +
> +static int
> +op_map_cb(const struct drm_gpuva_fn_ops *fn, void *priv,
> +	  u64 addr, u64 range,
> +	  struct drm_gem_object *obj, u64 offset)
> +{
> +	struct drm_gpuva_op op = {};
> +
> +	op.op = DRM_GPUVA_OP_MAP;
> +	op.map.va.addr = addr;
> +	op.map.va.range = range;
> +	op.map.gem.obj = obj;
> +	op.map.gem.offset = offset;
> +
> +	return fn->sm_step_map(&op, priv);
> +}
> +
> +static int
> +op_remap_cb(const struct drm_gpuva_fn_ops *fn,
> +	    drm_gpuva_state_t state, void *priv,
> +	    struct drm_gpuva_op_map *prev,
> +	    struct drm_gpuva_op_map *next,
> +	    struct drm_gpuva_op_unmap *unmap)
> +{
> +	struct drm_gpuva_op op = {};
> +	struct drm_gpuva_op_remap *r;
> +
> +	op.op = DRM_GPUVA_OP_REMAP;
> +	r = &op.remap;
> +	r->prev = prev;
> +	r->next = next;
> +	r->unmap = unmap;
> +
> +	return fn->sm_step_remap(&op, state, priv);
> +}
> +
> +static int
> +op_unmap_cb(const struct drm_gpuva_fn_ops *fn,
> +	    drm_gpuva_state_t state, void *priv,
> +	    struct drm_gpuva *va, bool merge)
> +{
> +	struct drm_gpuva_op op = {};
> +
> +	op.op = DRM_GPUVA_OP_UNMAP;
> +	op.unmap.va = va;
> +	op.unmap.keep = merge;
> +
> +	return fn->sm_step_unmap(&op, state, priv);
> +}
> +
> +static int
> +__drm_gpuva_sm_map(struct drm_gpuva_manager *mgr,
> +		   const struct drm_gpuva_fn_ops *ops, void *priv,
> +		   u64 req_addr, u64 req_range,
> +		   struct drm_gem_object *req_obj, u64 req_offset)
> +{
> +	DRM_GPUVA_ITER(it, mgr, req_addr);
> +	struct drm_gpuva *va, *prev = NULL;
> +	u64 req_end = req_addr + req_range;
> +	int ret;
> +
> +	if (unlikely(!drm_gpuva_in_mm_range(mgr, req_addr, req_range)))
> +		return -EINVAL;
> +
> +	if (unlikely(drm_gpuva_in_kernel_node(mgr, req_addr, req_range)))
> +		return -EINVAL;
> +
> +	drm_gpuva_iter_for_each_range(va, it, req_end) {
> +		struct drm_gem_object *obj = va->gem.obj;
> +		u64 offset = va->gem.offset;
> +		u64 addr = va->va.addr;
> +		u64 range = va->va.range;
> +		u64 end = addr + range;
> +		bool merge = !!va->gem.obj;
> +
> +		if (addr == req_addr) {
> +			merge &= obj == req_obj &&
> +				 offset == req_offset;
> +
> +			if (end == req_end) {
> +				ret = op_unmap_cb(ops, &it, priv, va, merge);
> +				if (ret)
> +					return ret;
> +				break;
> +			}
> +
> +			if (end < req_end) {
> +				ret = op_unmap_cb(ops, &it, priv, va, merge);
> +				if (ret)
> +					return ret;
> +				goto next;
> +			}
> +
> +			if (end > req_end) {
> +				struct drm_gpuva_op_map n = {
> +					.va.addr = req_end,
> +					.va.range = range - req_range,
> +					.gem.obj = obj,
> +					.gem.offset = offset + req_range,
> +				};
> +				struct drm_gpuva_op_unmap u = {
> +					.va = va,
> +					.keep = merge,
> +				};
> +
> +				ret = op_remap_cb(ops, &it, priv, NULL, &n, &u);
> +				if (ret)
> +					return ret;
> +				break;
> +			}
> +		} else if (addr < req_addr) {
> +			u64 ls_range = req_addr - addr;
> +			struct drm_gpuva_op_map p = {
> +				.va.addr = addr,
> +				.va.range = ls_range,
> +				.gem.obj = obj,
> +				.gem.offset = offset,
> +			};
> +			struct drm_gpuva_op_unmap u = { .va = va };
> +
> +			merge &= obj == req_obj &&
> +				 offset + ls_range == req_offset;
> +			u.keep = merge;
> +
> +			if (end == req_end) {
> +				ret = op_remap_cb(ops, &it, priv, &p, NULL, &u);
> +				if (ret)
> +					return ret;
> +				break;
> +			}
> +
> +			if (end < req_end) {
> +				ret = op_remap_cb(ops, &it, priv, &p, NULL, &u);
> +				if (ret)
> +					return ret;
> +				goto next;
> +			}
> +
> +			if (end > req_end) {
> +				struct drm_gpuva_op_map n = {
> +					.va.addr = req_end,
> +					.va.range = end - req_end,
> +					.gem.obj = obj,
> +					.gem.offset = offset + ls_range +
> +						      req_range,
> +				};
> +
> +				ret = op_remap_cb(ops, &it, priv, &p, &n, &u);
> +				if (ret)
> +					return ret;
> +				break;
> +			}
> +		} else if (addr > req_addr) {
> +			merge &= obj == req_obj &&
> +				 offset == req_offset +
> +					   (addr - req_addr);
> +
> +			if (end == req_end) {
> +				ret = op_unmap_cb(ops, &it, priv, va, merge);
> +				if (ret)
> +					return ret;
> +				break;
> +			}
> +
> +			if (end < req_end) {
> +				ret = op_unmap_cb(ops, &it, priv, va, merge);
> +				if (ret)
> +					return ret;
> +				goto next;
> +			}
> +
> +			if (end > req_end) {
> +				struct drm_gpuva_op_map n = {
> +					.va.addr = req_end,
> +					.va.range = end - req_end,
> +					.gem.obj = obj,
> +					.gem.offset = offset + req_end - addr,
> +				};
> +				struct drm_gpuva_op_unmap u = {
> +					.va = va,
> +					.keep = merge,
> +				};
> +
> +				ret = op_remap_cb(ops, &it, priv, NULL, &n, &u);
> +				if (ret)
> +					return ret;
> +				break;
> +			}
> +		}
> +next:
> +		prev = va;
> +	}
> +
> +	return op_map_cb(ops, priv,
> +			 req_addr, req_range,
> +			 req_obj, req_offset);
> +}
> +
> +static int
> +__drm_gpuva_sm_unmap(struct drm_gpuva_manager *mgr,
> +		     const struct drm_gpuva_fn_ops *ops, void *priv,
> +		     u64 req_addr, u64 req_range)
> +{
> +	DRM_GPUVA_ITER(it, mgr, req_addr);
> +	struct drm_gpuva *va;
> +	u64 req_end = req_addr + req_range;
> +	int ret;
> +
> +	if (unlikely(drm_gpuva_in_kernel_node(mgr, req_addr, req_range)))
> +		return -EINVAL;
> +
> +	drm_gpuva_iter_for_each_range(va, it, req_end) {
> +		struct drm_gpuva_op_map prev = {}, next = {};
> +		bool prev_split = false, next_split = false;
> +		struct drm_gem_object *obj = va->gem.obj;
> +		u64 offset = va->gem.offset;
> +		u64 addr = va->va.addr;
> +		u64 range = va->va.range;
> +		u64 end = addr + range;
> +
> +		if (addr < req_addr) {
> +			prev.va.addr = addr;
> +			prev.va.range = req_addr - addr;
> +			prev.gem.obj = obj;
> +			prev.gem.offset = offset;
> +
> +			prev_split = true;
> +		}
> +
> +		if (end > req_end) {
> +			next.va.addr = req_end;
> +			next.va.range = end - req_end;
> +			next.gem.obj = obj;
> +			next.gem.offset = offset + (req_end - addr);
> +
> +			next_split = true;
> +		}
> +
> +		if (prev_split || next_split) {
> +			struct drm_gpuva_op_unmap unmap = { .va = va };
> +
> +			ret = op_remap_cb(ops, &it, priv,
> +					  prev_split ? &prev : NULL,
> +					  next_split ? &next : NULL,
> +					  &unmap);
> +			if (ret)
> +				return ret;
> +		} else {
> +			ret = op_unmap_cb(ops, &it, priv, va, false);
> +			if (ret)
> +				return ret;
> +		}
> +	}
> +
> +	return 0;
> +}
> +
> +/**
> + * drm_gpuva_sm_map - creates the &drm_gpuva_op split/merge steps
> + * @mgr: the &drm_gpuva_manager representing the GPU VA space
> + * @req_addr: the start address of the new mapping
> + * @req_range: the range of the new mapping
> + * @req_obj: the &drm_gem_object to map
> + * @req_offset: the offset within the &drm_gem_object
> + * @priv: pointer to a driver private data structure
> + *
> + * This function iterates the given range of the GPU VA space. It utilizes the
> + * &drm_gpuva_fn_ops to call back into the driver providing the split and merge
> + * steps.
> + *
> + * Drivers may use these callbacks to update the GPU VA space right away within
> + * the callback. In case the driver decides to copy and store the operations for
> + * later processing neither this function nor &drm_gpuva_sm_unmap is allowed to
> + * be called before the &drm_gpuva_manager's view of the GPU VA space was
> + * updated with the previous set of operations. To update the
> + * &drm_gpuva_manager's view of the GPU VA space drm_gpuva_insert(),
> + * drm_gpuva_destroy_locked() and/or drm_gpuva_destroy_unlocked() should be
> + * used.
> + *
> + * A sequence of callbacks can contain map, unmap and remap operations, but
> + * the sequence of callbacks might also be empty if no operation is required,
> + * e.g. if the requested mapping already exists in the exact same way.
> + *
> + * There can be an arbitrary amount of unmap operations, a maximum of two remap
> + * operations and a single map operation. The latter one represents the original
> + * map operation requested by the caller.
> + *
> + * Returns: 0 on success or a negative error code
> + */
> +int
> +drm_gpuva_sm_map(struct drm_gpuva_manager *mgr, void *priv,
> +		 u64 req_addr, u64 req_range,
> +		 struct drm_gem_object *req_obj, u64 req_offset)
> +{
> +	const struct drm_gpuva_fn_ops *ops = mgr->ops;
> +
> +	if (unlikely(!(ops && ops->sm_step_map &&
> +		       ops->sm_step_remap &&
> +		       ops->sm_step_unmap)))
> +		return -EINVAL;
> +
> +	return __drm_gpuva_sm_map(mgr, ops, priv,
> +				  req_addr, req_range,
> +				  req_obj, req_offset);
> +}
> +EXPORT_SYMBOL(drm_gpuva_sm_map);
> +
> +/**
> + * drm_gpuva_sm_unmap - creates the &drm_gpuva_ops to split on unmap
> + * @mgr: the &drm_gpuva_manager representing the GPU VA space
> + * @priv: pointer to a driver private data structure
> + * @req_addr: the start address of the range to unmap
> + * @req_range: the range of the mappings to unmap
> + *
> + * This function iterates the given range of the GPU VA space. It utilizes the
> + * &drm_gpuva_fn_ops to call back into the driver providing the operations to
> + * unmap and, if required, split existent mappings.
> + *
> + * Drivers may use these callbacks to update the GPU VA space right away within
> + * the callback. In case the driver decides to copy and store the operations for
> + * later processing neither this function nor &drm_gpuva_sm_map is allowed to be
> + * called before the &drm_gpuva_manager's view of the GPU VA space was updated
> + * with the previous set of operations. To update the &drm_gpuva_manager's view
> + * of the GPU VA space drm_gpuva_insert(), drm_gpuva_destroy_locked() and/or
> + * drm_gpuva_destroy_unlocked() should be used.
> + *
> + * A sequence of callbacks can contain unmap and remap operations, depending on
> + * whether there are actual overlapping mappings to split.
> + *
> + * There can be an arbitrary amount of unmap operations and a maximum of two
> + * remap operations.
> + *
> + * Returns: 0 on success or a negative error code
> + */
> +int
> +drm_gpuva_sm_unmap(struct drm_gpuva_manager *mgr, void *priv,
> +		   u64 req_addr, u64 req_range)
> +{
> +	const struct drm_gpuva_fn_ops *ops = mgr->ops;
> +
> +	if (unlikely(!(ops && ops->sm_step_remap &&
> +		       ops->sm_step_unmap)))
> +		return -EINVAL;
> +
> +	return __drm_gpuva_sm_unmap(mgr, ops, priv,
> +				    req_addr, req_range);
> +}
> +EXPORT_SYMBOL(drm_gpuva_sm_unmap);
> +
> +static struct drm_gpuva_op *
> +gpuva_op_alloc(struct drm_gpuva_manager *mgr)
> +{
> +	const struct drm_gpuva_fn_ops *fn = mgr->ops;
> +	struct drm_gpuva_op *op;
> +
> +	if (fn && fn->op_alloc)
> +		op = fn->op_alloc();
> +	else
> +		op = kzalloc(sizeof(*op), GFP_KERNEL);
> +
> +	if (unlikely(!op))
> +		return NULL;
> +
> +	return op;
> +}
> +
> +static void
> +gpuva_op_free(struct drm_gpuva_manager *mgr,
> +	      struct drm_gpuva_op *op)
> +{
> +	const struct drm_gpuva_fn_ops *fn = mgr->ops;
> +
> +	if (fn && fn->op_free)
> +		fn->op_free(op);
> +	else
> +		kfree(op);
> +}
> +
> +static int
> +drm_gpuva_sm_step(struct drm_gpuva_op *__op,
> +		  drm_gpuva_state_t state,
> +		  void *priv)
> +{
> +	struct {
> +		struct drm_gpuva_manager *mgr;
> +		struct drm_gpuva_ops *ops;
> +	} *args = priv;
> +	struct drm_gpuva_manager *mgr = args->mgr;
> +	struct drm_gpuva_ops *ops = args->ops;
> +	struct drm_gpuva_op *op;
> +
> +	op = gpuva_op_alloc(mgr);
> +	if (unlikely(!op))
> +		goto err;
> +
> +	memcpy(op, __op, sizeof(*op));
> +
> +	if (op->op == DRM_GPUVA_OP_REMAP) {
> +		struct drm_gpuva_op_remap *__r = &__op->remap;
> +		struct drm_gpuva_op_remap *r = &op->remap;
> +
> +		r->unmap = kmemdup(__r->unmap, sizeof(*r->unmap),
> +				   GFP_KERNEL);
> +		if (unlikely(!r->unmap))
> +			goto err_free_op;
> +
> +		if (__r->prev) {
> +			r->prev = kmemdup(__r->prev, sizeof(*r->prev),
> +					  GFP_KERNEL);
> +			if (unlikely(!r->prev))
> +				goto err_free_unmap;
> +		}
> +
> +		if (__r->next) {
> +			r->next = kmemdup(__r->next, sizeof(*r->next),
> +					  GFP_KERNEL);
> +			if (unlikely(!r->next))
> +				goto err_free_prev;
> +		}
> +	}
> +
> +	list_add_tail(&op->entry, &ops->list);
> +
> +	return 0;
> +
> +err_free_unmap:
> +	kfree(op->remap.unmap);
> +err_free_prev:
> +	kfree(op->remap.prev);
> +err_free_op:
> +	gpuva_op_free(mgr, op);
> +err:
> +	return -ENOMEM;
> +}
> +
> +static int
> +drm_gpuva_sm_step_map(struct drm_gpuva_op *__op, void *priv)
> +{
> +	return drm_gpuva_sm_step(__op, NULL, priv);
> +}
> +
> +static const struct drm_gpuva_fn_ops gpuva_list_ops = {
> +	.sm_step_map = drm_gpuva_sm_step_map,
> +	.sm_step_remap = drm_gpuva_sm_step,
> +	.sm_step_unmap = drm_gpuva_sm_step,
> +};
> +
> +/**
> + * drm_gpuva_sm_map_ops_create - creates the &drm_gpuva_ops to split and merge
> + * @mgr: the &drm_gpuva_manager representing the GPU VA space
> + * @req_addr: the start address of the new mapping
> + * @req_range: the range of the new mapping
> + * @req_obj: the &drm_gem_object to map
> + * @req_offset: the offset within the &drm_gem_object
> + *
> + * This function creates a list of operations to perform splitting and merging
> + * of existent mapping(s) with the newly requested one.
> + *
> + * The list can be iterated with &drm_gpuva_for_each_op and must be processed
> + * in the given order. It can contain map, unmap and remap operations, but it
> + * also can be empty if no operation is required, e.g. if the requested mapping
> + * already exists is the exact same way.
> + *
> + * There can be an arbitrary amount of unmap operations, a maximum of two remap
> + * operations and a single map operation. The latter one represents the original
> + * map operation requested by the caller.
> + *
> + * Note that before calling this function again with another mapping request it
> + * is necessary to update the &drm_gpuva_manager's view of the GPU VA space. The
> + * previously obtained operations must be either processed or abandoned. To
> + * update the &drm_gpuva_manager's view of the GPU VA space drm_gpuva_insert(),
> + * drm_gpuva_destroy_locked() and/or drm_gpuva_destroy_unlocked() should be
> + * used.
> + *
> + * After the caller finished processing the returned &drm_gpuva_ops, they must
> + * be freed with &drm_gpuva_ops_free.
> + *
> + * Returns: a pointer to the &drm_gpuva_ops on success, an ERR_PTR on failure
> + */
> +struct drm_gpuva_ops *
> +drm_gpuva_sm_map_ops_create(struct drm_gpuva_manager *mgr,
> +			    u64 req_addr, u64 req_range,
> +			    struct drm_gem_object *req_obj, u64 req_offset)
> +{
> +	struct drm_gpuva_ops *ops;
> +	struct {
> +		struct drm_gpuva_manager *mgr;
> +		struct drm_gpuva_ops *ops;
> +	} args;
> +	int ret;
> +
> +	ops = kzalloc(sizeof(*ops), GFP_KERNEL);
> +	if (unlikely(!ops))
> +		return ERR_PTR(-ENOMEM);
> +
> +	INIT_LIST_HEAD(&ops->list);
> +
> +	args.mgr = mgr;
> +	args.ops = ops;
> +
> +	ret = __drm_gpuva_sm_map(mgr, &gpuva_list_ops, &args,
> +				 req_addr, req_range,
> +				 req_obj, req_offset);
> +	if (ret)
> +		goto err_free_ops;
> +
> +	return ops;
> +
> +err_free_ops:
> +	drm_gpuva_ops_free(mgr, ops);
> +	return ERR_PTR(ret);
> +}
> +EXPORT_SYMBOL(drm_gpuva_sm_map_ops_create);
> +
> +/**
> + * drm_gpuva_sm_unmap_ops_create - creates the &drm_gpuva_ops to split on unmap
> + * @mgr: the &drm_gpuva_manager representing the GPU VA space
> + * @req_addr: the start address of the range to unmap
> + * @req_range: the range of the mappings to unmap
> + *
> + * This function creates a list of operations to perform unmapping and, if
> + * required, splitting of the mappings overlapping the unmap range.
> + *
> + * The list can be iterated with &drm_gpuva_for_each_op and must be processed
> + * in the given order. It can contain unmap and remap operations, depending on
> + * whether there are actual overlapping mappings to split.
> + *
> + * There can be an arbitrary amount of unmap operations and a maximum of two
> + * remap operations.
> + *
> + * Note that before calling this function again with another range to unmap it
> + * is necessary to update the &drm_gpuva_manager's view of the GPU VA space. The
> + * previously obtained operations must be processed or abandoned. To update the
> + * &drm_gpuva_manager's view of the GPU VA space drm_gpuva_insert(),
> + * drm_gpuva_destroy_locked() and/or drm_gpuva_destroy_unlocked() should be
> + * used.
> + *
> + * After the caller finished processing the returned &drm_gpuva_ops, they must
> + * be freed with &drm_gpuva_ops_free.
> + *
> + * Returns: a pointer to the &drm_gpuva_ops on success, an ERR_PTR on failure
> + */
> +struct drm_gpuva_ops *
> +drm_gpuva_sm_unmap_ops_create(struct drm_gpuva_manager *mgr,
> +			      u64 req_addr, u64 req_range)
> +{
> +	struct drm_gpuva_ops *ops;
> +	struct {
> +		struct drm_gpuva_manager *mgr;
> +		struct drm_gpuva_ops *ops;
> +	} args;
> +	int ret;
> +
> +	ops = kzalloc(sizeof(*ops), GFP_KERNEL);
> +	if (unlikely(!ops))
> +		return ERR_PTR(-ENOMEM);
> +
> +	INIT_LIST_HEAD(&ops->list);
> +
> +	args.mgr = mgr;
> +	args.ops = ops;
> +
> +	ret = __drm_gpuva_sm_unmap(mgr, &gpuva_list_ops, &args,
> +				   req_addr, req_range);
> +	if (ret)
> +		goto err_free_ops;
> +
> +	return ops;
> +
> +err_free_ops:
> +	drm_gpuva_ops_free(mgr, ops);
> +	return ERR_PTR(ret);
> +}
> +EXPORT_SYMBOL(drm_gpuva_sm_unmap_ops_create);
> +
> +/**
> + * drm_gpuva_prefetch_ops_create - creates the &drm_gpuva_ops to prefetch
> + * @mgr: the &drm_gpuva_manager representing the GPU VA space
> + * @addr: the start address of the range to prefetch
> + * @range: the range of the mappings to prefetch
> + *
> + * This function creates a list of operations to perform prefetching.
> + *
> + * The list can be iterated with &drm_gpuva_for_each_op and must be processed
> + * in the given order. It can contain prefetch operations.
> + *
> + * There can be an arbitrary amount of prefetch operations.
> + *
> + * After the caller finished processing the returned &drm_gpuva_ops, they must
> + * be freed with &drm_gpuva_ops_free.
> + *
> + * Returns: a pointer to the &drm_gpuva_ops on success, an ERR_PTR on failure
> + */
> +struct drm_gpuva_ops *
> +drm_gpuva_prefetch_ops_create(struct drm_gpuva_manager *mgr,
> +			      u64 addr, u64 range)
> +{
> +	DRM_GPUVA_ITER(it, mgr, addr);
> +	struct drm_gpuva_ops *ops;
> +	struct drm_gpuva_op *op;
> +	struct drm_gpuva *va;
> +	int ret;
> +
> +	ops = kzalloc(sizeof(*ops), GFP_KERNEL);
> +	if (!ops)
> +		return ERR_PTR(-ENOMEM);
> +
> +	INIT_LIST_HEAD(&ops->list);
> +
> +	drm_gpuva_iter_for_each_range(va, it, addr + range) {
> +		op = gpuva_op_alloc(mgr);
> +		if (!op) {
> +			ret = -ENOMEM;
> +			goto err_free_ops;
> +		}
> +
> +		op->op = DRM_GPUVA_OP_PREFETCH;
> +		op->prefetch.va = va;
> +		list_add_tail(&op->entry, &ops->list);
> +	}
> +
> +	return ops;
> +
> +err_free_ops:
> +	drm_gpuva_ops_free(mgr, ops);
> +	return ERR_PTR(ret);
> +}
> +EXPORT_SYMBOL(drm_gpuva_prefetch_ops_create);
> +
> +/**
> + * drm_gpuva_gem_unmap_ops_create - creates the &drm_gpuva_ops to unmap a GEM
> + * @mgr: the &drm_gpuva_manager representing the GPU VA space
> + * @obj: the &drm_gem_object to unmap
> + *
> + * This function creates a list of operations to perform unmapping for every
> + * GPUVA attached to a GEM.
> + *
> + * The list can be iterated with &drm_gpuva_for_each_op and consists out of an
> + * arbitrary amount of unmap operations.
> + *
> + * After the caller finished processing the returned &drm_gpuva_ops, they must
> + * be freed with &drm_gpuva_ops_free.
> + *
> + * It is the callers responsibility to protect the GEMs GPUVA list against
> + * concurrent access.
> + *
> + * Returns: a pointer to the &drm_gpuva_ops on success, an ERR_PTR on failure
> + */
> +struct drm_gpuva_ops *
> +drm_gpuva_gem_unmap_ops_create(struct drm_gpuva_manager *mgr,
> +			       struct drm_gem_object *obj)
> +{
> +	struct drm_gpuva_ops *ops;
> +	struct drm_gpuva_op *op;
> +	struct drm_gpuva *va;
> +	int ret;
> +
> +	ops = kzalloc(sizeof(*ops), GFP_KERNEL);
> +	if (!ops)
> +		return ERR_PTR(-ENOMEM);
> +
> +	INIT_LIST_HEAD(&ops->list);
> +
> +	drm_gem_for_each_gpuva(va, obj) {
> +		op = gpuva_op_alloc(mgr);
> +		if (!op) {
> +			ret = -ENOMEM;
> +			goto err_free_ops;
> +		}
> +
> +		op->op = DRM_GPUVA_OP_UNMAP;
> +		op->unmap.va = va;
> +		list_add_tail(&op->entry, &ops->list);
> +	}
> +
> +	return ops;
> +
> +err_free_ops:
> +	drm_gpuva_ops_free(mgr, ops);
> +	return ERR_PTR(ret);
> +}
> +EXPORT_SYMBOL(drm_gpuva_gem_unmap_ops_create);
> +
> +
> +/**
> + * drm_gpuva_ops_free - free the given &drm_gpuva_ops
> + * @mgr: the &drm_gpuva_manager the ops were created for
> + * @ops: the &drm_gpuva_ops to free
> + *
> + * Frees the given &drm_gpuva_ops structure including all the ops associated
> + * with it.
> + */
> +void
> +drm_gpuva_ops_free(struct drm_gpuva_manager *mgr,
> +		   struct drm_gpuva_ops *ops)
> +{
> +	struct drm_gpuva_op *op, *next;
> +
> +	drm_gpuva_for_each_op_safe(op, next, ops) {
> +		list_del(&op->entry);
> +
> +		if (op->op == DRM_GPUVA_OP_REMAP) {
> +			kfree(op->remap.prev);
> +			kfree(op->remap.next);
> +			kfree(op->remap.unmap);
> +		}
> +
> +		gpuva_op_free(mgr, op);
> +	}
> +
> +	kfree(ops);
> +}
> +EXPORT_SYMBOL(drm_gpuva_ops_free);
> diff --git a/include/drm/drm_drv.h b/include/drm/drm_drv.h
> index b419c59c4bef..b6e22f66c3fd 100644
> --- a/include/drm/drm_drv.h
> +++ b/include/drm/drm_drv.h
> @@ -104,6 +104,12 @@ enum drm_driver_feature {
>  	 * acceleration should be handled by two drivers that are connected using auxiliary bus.
>  	 */
>  	DRIVER_COMPUTE_ACCEL            = BIT(7),
> +	/**
> +	 * @DRIVER_GEM_GPUVA:
> +	 *
> +	 * Driver supports user defined GPU VA bindings for GEM objects.
> +	 */
> +	DRIVER_GEM_GPUVA		= BIT(8),
>  
>  	/* IMPORTANT: Below are all the legacy flags, add new ones above. */
>  
> diff --git a/include/drm/drm_gem.h b/include/drm/drm_gem.h
> index b8efd836edef..f2782f55b7e7 100644
> --- a/include/drm/drm_gem.h
> +++ b/include/drm/drm_gem.h
> @@ -36,6 +36,8 @@
>  
>  #include <linux/kref.h>
>  #include <linux/dma-resv.h>
> +#include <linux/list.h>
> +#include <linux/mutex.h>
>  
>  #include <drm/drm_vma_manager.h>
>  
> @@ -347,6 +349,17 @@ struct drm_gem_object {
>  	 */
>  	struct dma_resv _resv;
>  
> +	/**
> +	 * @gpuva:
> +	 *
> +	 * Provides the list and list mutex of GPU VAs attached to this
> +	 * GEM object.
> +	 */
> +	struct {
> +		struct list_head list;
> +		struct mutex mutex;
> +	} gpuva;
> +
>  	/**
>  	 * @funcs:
>  	 *
> @@ -494,4 +507,66 @@ unsigned long drm_gem_lru_scan(struct drm_gem_lru *lru,
>  
>  int drm_gem_evict(struct drm_gem_object *obj);
>  
> +/**
> + * drm_gem_gpuva_init - initialize the gpuva list of a GEM object
> + * @obj: the &drm_gem_object
> + *
> + * This initializes the &drm_gem_object's &drm_gpuva list and the mutex
> + * protecting it.
> + *
> + * Calling this function is only necessary for drivers intending to support the
> + * &drm_driver_feature DRIVER_GEM_GPUVA.
> + */
> +static inline void drm_gem_gpuva_init(struct drm_gem_object *obj)
> +{
> +	INIT_LIST_HEAD(&obj->gpuva.list);
> +	mutex_init(&obj->gpuva.mutex);
> +}
> +
> +/**
> + * drm_gem_gpuva_lock - lock the GEM's gpuva list mutex
> + * @obj: the &drm_gem_object
> + *
> + * This unlocks the mutex protecting the &drm_gem_object's &drm_gpuva list.
> + */
> +static inline void drm_gem_gpuva_lock(struct drm_gem_object *obj)
> +{
> +	mutex_lock(&obj->gpuva.mutex);
> +}
> +
> +/**
> + * drm_gem_gpuva_unlock - unlock the GEM's gpuva list mutex
> + * @obj: the &drm_gem_object
> + *
> + * This unlocks the mutex protecting the &drm_gem_object's &drm_gpuva list.
> + */
> +static inline void drm_gem_gpuva_unlock(struct drm_gem_object *obj)
> +{
> +	mutex_unlock(&obj->gpuva.mutex);
> +}
> +
> +/**
> + * drm_gem_for_each_gpuva - iternator to walk over a list of gpuvas
> + * @entry: &drm_gpuva structure to assign to in each iteration step
> + * @obj: the &drm_gem_object the &drm_gpuvas to walk are associated with
> + *
> + * This iterator walks over all &drm_gpuva structures associated with the
> + * &drm_gpuva_manager.
> + */
> +#define drm_gem_for_each_gpuva(entry__, obj__) \
> +	list_for_each_entry(entry__, &(obj__)->gpuva.list, gem.entry)
> +
> +/**
> + * drm_gem_for_each_gpuva_safe - iternator to safely walk over a list of gpuvas
> + * @entry: &drm_gpuva structure to assign to in each iteration step
> + * @next: &next &drm_gpuva to store the next step
> + * @obj: the &drm_gem_object the &drm_gpuvas to walk are associated with
> + *
> + * This iterator walks over all &drm_gpuva structures associated with the
> + * &drm_gem_object. It is implemented with list_for_each_entry_safe(), hence
> + * it is save against removal of elements.
> + */
> +#define drm_gem_for_each_gpuva_safe(entry__, next__, obj__) \
> +	list_for_each_entry_safe(entry__, next__, &(obj__)->gpuva.list, gem.entry)
> +
>  #endif /* __DRM_GEM_H__ */
> diff --git a/include/drm/drm_gpuva_mgr.h b/include/drm/drm_gpuva_mgr.h
> new file mode 100644
> index 000000000000..b52ac2d00d12
> --- /dev/null
> +++ b/include/drm/drm_gpuva_mgr.h
> @@ -0,0 +1,681 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +
> +#ifndef __DRM_GPUVA_MGR_H__
> +#define __DRM_GPUVA_MGR_H__
> +
> +/*
> + * Copyright (c) 2022 Red Hat.
> + *
> + * Permission is hereby granted, free of charge, to any person obtaining a
> + * copy of this software and associated documentation files (the "Software"),
> + * to deal in the Software without restriction, including without limitation
> + * the rights to use, copy, modify, merge, publish, distribute, sublicense,
> + * and/or sell copies of the Software, and to permit persons to whom the
> + * Software is furnished to do so, subject to the following conditions:
> + *
> + * The above copyright notice and this permission notice shall be included in
> + * all copies or substantial portions of the Software.
> + *
> + * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
> + * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
> + * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SHALL
> + * THE COPYRIGHT HOLDER(S) OR AUTHOR(S) BE LIABLE FOR ANY CLAIM, DAMAGES OR
> + * OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE,
> + * ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
> + * OTHER DEALINGS IN THE SOFTWARE.
> + */
> +
> +#include <linux/maple_tree.h>
> +#include <linux/mm.h>
> +#include <linux/rbtree.h>
> +#include <linux/spinlock.h>
> +#include <linux/types.h>
> +
> +struct drm_gpuva_manager;
> +struct drm_gpuva_fn_ops;
> +struct drm_gpuva_prealloc;
> +
> +/**
> + * enum drm_gpuva_flags - flags for struct drm_gpuva
> + */
> +enum drm_gpuva_flags {
> +	/**
> +	 * @DRM_GPUVA_EVICTED:
> +	 *
> +	 * Flag indicating that the &drm_gpuva's backing GEM is evicted.
> +	 */
> +	DRM_GPUVA_EVICTED = (1 << 0),
> +
> +	/**
> +	 * @DRM_GPUVA_SPARSE:
> +	 *
> +	 * Flag indicating that the &drm_gpuva is a sparse mapping.
> +	 */
> +	DRM_GPUVA_SPARSE = (1 << 1),
> +
> +	/**
> +	 * @DRM_GPUVA_USERBITS: user defined bits
> +	 */
> +	DRM_GPUVA_USERBITS = (1 << 2),
> +};
> +
> +/**
> + * struct drm_gpuva - structure to track a GPU VA mapping
> + *
> + * This structure represents a GPU VA mapping and is associated with a
> + * &drm_gpuva_manager.
> + *
> + * Typically, this structure is embedded in bigger driver structures.
> + */
> +struct drm_gpuva {
> +	/**
> +	 * @mgr: the &drm_gpuva_manager this object is associated with
> +	 */
> +	struct drm_gpuva_manager *mgr;
> +
> +	/**
> +	 * @flags: the &drm_gpuva_flags for this mapping
> +	 */
> +	enum drm_gpuva_flags flags;
> +
> +	/**
> +	 * @va: structure containing the address and range of the &drm_gpuva
> +	 */
> +	struct {
> +		/**
> +		 * @addr: the start address
> +		 */
> +		u64 addr;
> +
> +		/*
> +		 * @range: the range
> +		 */
> +		u64 range;
> +	} va;
> +
> +	/**
> +	 * @gem: structure containing the &drm_gem_object and it's offset
> +	 */
> +	struct {
> +		/**
> +		 * @offset: the offset within the &drm_gem_object
> +		 */
> +		u64 offset;
> +
> +		/**
> +		 * @obj: the mapped &drm_gem_object
> +		 */
> +		struct drm_gem_object *obj;
> +
> +		/**
> +		 * @entry: the &list_head to attach this object to a &drm_gem_object
> +		 */
> +		struct list_head entry;
> +	} gem;
> +};
> +
> +void drm_gpuva_link(struct drm_gpuva *va);
> +void drm_gpuva_unlink(struct drm_gpuva *va);
> +
> +int drm_gpuva_insert(struct drm_gpuva_manager *mgr,
> +		     struct drm_gpuva *va);
> +int drm_gpuva_insert_prealloc(struct drm_gpuva_manager *mgr,
> +			      struct drm_gpuva_prealloc *pa,
> +			      struct drm_gpuva *va);
> +void drm_gpuva_remove(struct drm_gpuva *va);
> +
> +struct drm_gpuva *drm_gpuva_find(struct drm_gpuva_manager *mgr,
> +				 u64 addr, u64 range);
> +struct drm_gpuva *drm_gpuva_find_first(struct drm_gpuva_manager *mgr,
> +				       u64 addr, u64 range);
> +struct drm_gpuva *drm_gpuva_find_prev(struct drm_gpuva_manager *mgr, u64 start);
> +struct drm_gpuva *drm_gpuva_find_next(struct drm_gpuva_manager *mgr, u64 end);
> +
> +bool drm_gpuva_interval_empty(struct drm_gpuva_manager *mgr, u64 addr, u64 range);
> +
> +/**
> + * drm_gpuva_evict - sets whether the backing GEM of this &drm_gpuva is evicted
> + * @va: the &drm_gpuva to set the evict flag for
> + * @evict: indicates whether the &drm_gpuva is evicted
> + */
> +static inline void drm_gpuva_evict(struct drm_gpuva *va, bool evict)
> +{
> +	if (evict)
> +		va->flags |= DRM_GPUVA_EVICTED;
> +	else
> +		va->flags &= ~DRM_GPUVA_EVICTED;
> +}
> +
> +/**
> + * drm_gpuva_evicted - indicates whether the backing BO of this &drm_gpuva
> + * is evicted
> + * @va: the &drm_gpuva to check
> + */
> +static inline bool drm_gpuva_evicted(struct drm_gpuva *va)
> +{
> +	return va->flags & DRM_GPUVA_EVICTED;
> +}
> +
> +/**
> + * struct drm_gpuva_manager - DRM GPU VA Manager
> + *
> + * The DRM GPU VA Manager keeps track of a GPU's virtual address space by using
> + * &maple_tree structures. Typically, this structure is embedded in bigger
> + * driver structures.
> + *
> + * Drivers can pass addresses and ranges in an arbitrary unit, e.g. bytes or
> + * pages.
> + *
> + * There should be one manager instance per GPU virtual address space.
> + */
> +struct drm_gpuva_manager {
> +	/**
> +	 * @name: the name of the DRM GPU VA space
> +	 */
> +	const char *name;
> +
> +	/**
> +	 * @mm_start: start of the VA space
> +	 */
> +	u64 mm_start;
> +
> +	/**
> +	 * @mm_range: length of the VA space
> +	 */
> +	u64 mm_range;
> +
> +	/**
> +	 * @mtree: the &maple_tree to track GPU VA mappings
> +	 */
> +	struct maple_tree mtree;
> +
> +	/**
> +	 * @kernel_alloc_node:
> +	 *
> +	 * &drm_gpuva representing the address space cutout reserved for
> +	 * the kernel
> +	 */
> +	struct drm_gpuva kernel_alloc_node;
> +
> +	/**
> +	 * @ops: &drm_gpuva_fn_ops providing the split/merge steps to drivers
> +	 */
> +	const struct drm_gpuva_fn_ops *ops;
> +};
> +
> +void drm_gpuva_manager_init(struct drm_gpuva_manager *mgr,
> +			    const char *name,
> +			    u64 start_offset, u64 range,
> +			    u64 reserve_offset, u64 reserve_range,
> +			    const struct drm_gpuva_fn_ops *ops);
> +void drm_gpuva_manager_destroy(struct drm_gpuva_manager *mgr);
> +
> +/**
> + * struct drm_gpuva_prealloc - holds a preallocated node for the
> + * &drm_gpuva_manager to insert a single new entry
> + */
> +struct drm_gpuva_prealloc {
> +	/**
> +	 * @mas: the maple tree advanced state
> +	 */
> +	struct ma_state mas;
> +};
> +
> +struct drm_gpuva_prealloc * drm_gpuva_prealloc_create(struct drm_gpuva_manager *mgr);
> +void drm_gpuva_prealloc_destroy(struct drm_gpuva_prealloc *pa);
> +
> +/**
> + * struct drm_gpuva_iterator - iterator for walking the internal (maple) tree
> + */
> +struct drm_gpuva_iterator {
> +	/**
> +	 * @mas: the maple tree advanced state
> +	 */
> +	struct ma_state mas;
> +
> +	/**
> +	 * @mgr: the &drm_gpuva_manager to iterate
> +	 */
> +	struct drm_gpuva_manager *mgr;
> +};
> +typedef struct drm_gpuva_iterator * drm_gpuva_state_t;
> +
> +void drm_gpuva_iter_remove(struct drm_gpuva_iterator *it);
> +int drm_gpuva_iter_va_replace(struct drm_gpuva_iterator *it,
> +			      struct drm_gpuva *va);
> +
> +static inline struct drm_gpuva *
> +drm_gpuva_iter_find(struct drm_gpuva_iterator *it, unsigned long max)
> +{
> +	struct drm_gpuva *va;
> +
> +	mas_lock(&it->mas);

This is the write lock, if you can have more than one reader then use
rcu_read_lock() and friends.  You can also probably use mt_find() to
handle the locking here?

> +	va = mas_find(&it->mas, max);
> +	mas_unlock(&it->mas);
> +
> +	return va;
> +}
> +
> +/**
> + * DRM_GPUVA_ITER - create an iterator structure to iterate the &drm_gpuva tree
> + * @name: the name of the &drm_gpuva_iterator to create
> + * @mgr__: the &drm_gpuva_manager to iterate
> + * @start: starting offset, the first entry will overlap this
> + */
> +#define DRM_GPUVA_ITER(name, mgr__, start)				\
> +	struct drm_gpuva_iterator name = {				\
> +		.mas = MA_STATE_INIT(&(mgr__)->mtree, start, 0),	\
> +		.mgr = mgr__,						\
> +	}
> +
> +/**
> + * drm_gpuva_iter_for_each_range - iternator to walk over a range of entries
> + * @va__: the &drm_gpuva found for the current iteration
> + * @it__: &drm_gpuva_iterator structure to assign to in each iteration step
> + * @end__: ending offset, the last entry will start before this (but may overlap)
> + *
> + * This function can be used to iterate &drm_gpuva objects.
> + *
> + * It is safe against the removal of elements using &drm_gpuva_iter_remove,
> + * however it is not safe against the removal of elements using
> + * &drm_gpuva_remove.
> + */
> +#define drm_gpuva_iter_for_each_range(va__, it__, end__) \
> +	while (((va__) = drm_gpuva_iter_find(&(it__), (end__) - 1)))
> +
> +/**
> + * drm_gpuva_iter_for_each - iternator to walk over all existing entries
> + * @va__: the &drm_gpuva found for the current iteration
> + * @it__: &drm_gpuva_iterator structure to assign to in each iteration step
> + *
> + * This function can be used to iterate &drm_gpuva objects.
> + *
> + * In order to walk over all potentially existing entries, the
> + * &drm_gpuva_iterator must be initialized to start at
> + * &drm_gpuva_manager->mm_start or simply 0.
> + *
> + * It is safe against the removal of elements using &drm_gpuva_iter_remove,
> + * however it is not safe against the removal of elements using
> + * &drm_gpuva_remove.
> + */
> +#define drm_gpuva_iter_for_each(va__, it__) \
> +	drm_gpuva_iter_for_each_range(va__, it__, (it__).mgr->mm_start + (it__).mgr->mm_range)
> +
> +/**
> + * enum drm_gpuva_op_type - GPU VA operation type
> + *
> + * Operations to alter the GPU VA mappings tracked by the &drm_gpuva_manager.
> + */
> +enum drm_gpuva_op_type {
> +	/**
> +	 * @DRM_GPUVA_OP_MAP: the map op type
> +	 */
> +	DRM_GPUVA_OP_MAP,
> +
> +	/**
> +	 * @DRM_GPUVA_OP_REMAP: the remap op type
> +	 */
> +	DRM_GPUVA_OP_REMAP,
> +
> +	/**
> +	 * @DRM_GPUVA_OP_UNMAP: the unmap op type
> +	 */
> +	DRM_GPUVA_OP_UNMAP,
> +
> +	/**
> +	 * @DRM_GPUVA_OP_PREFETCH: the prefetch op type
> +	 */
> +	DRM_GPUVA_OP_PREFETCH,
> +};
> +
> +/**
> + * struct drm_gpuva_op_map - GPU VA map operation
> + *
> + * This structure represents a single map operation generated by the
> + * DRM GPU VA manager.
> + */
> +struct drm_gpuva_op_map {
> +	/**
> +	 * @va: structure containing address and range of a map
> +	 * operation
> +	 */
> +	struct {
> +		/**
> +		 * @addr: the base address of the new mapping
> +		 */
> +		u64 addr;
> +
> +		/**
> +		 * @range: the range of the new mapping
> +		 */
> +		u64 range;
> +	} va;
> +
> +	/**
> +	 * @gem: structure containing the &drm_gem_object and it's offset
> +	 */
> +	struct {
> +		/**
> +		 * @offset: the offset within the &drm_gem_object
> +		 */
> +		u64 offset;
> +
> +		/**
> +		 * @obj: the &drm_gem_object to map
> +		 */
> +		struct drm_gem_object *obj;
> +	} gem;
> +};
> +
> +/**
> + * struct drm_gpuva_op_unmap - GPU VA unmap operation
> + *
> + * This structure represents a single unmap operation generated by the
> + * DRM GPU VA manager.
> + */
> +struct drm_gpuva_op_unmap {
> +	/**
> +	 * @va: the &drm_gpuva to unmap
> +	 */
> +	struct drm_gpuva *va;
> +
> +	/**
> +	 * @keep:
> +	 *
> +	 * Indicates whether this &drm_gpuva is physically contiguous with the
> +	 * original mapping request.
> +	 *
> +	 * Optionally, if &keep is set, drivers may keep the actual page table
> +	 * mappings for this &drm_gpuva, adding the missing page table entries
> +	 * only and update the &drm_gpuva_manager accordingly.
> +	 */
> +	bool keep;
> +};
> +
> +/**
> + * struct drm_gpuva_op_remap - GPU VA remap operation
> + *
> + * This represents a single remap operation generated by the DRM GPU VA manager.
> + *
> + * A remap operation is generated when an existing GPU VA mmapping is split up
> + * by inserting a new GPU VA mapping or by partially unmapping existent
> + * mapping(s), hence it consists of a maximum of two map and one unmap
> + * operation.
> + *
> + * The @unmap operation takes care of removing the original existing mapping.
> + * @prev is used to remap the preceding part, @next the subsequent part.
> + *
> + * If either a new mapping's start address is aligned with the start address
> + * of the old mapping or the new mapping's end address is aligned with the
> + * end address of the old mapping, either @prev or @next is NULL.
> + *
> + * Note, the reason for a dedicated remap operation, rather than arbitrary
> + * unmap and map operations, is to give drivers the chance of extracting driver
> + * specific data for creating the new mappings from the unmap operations's
> + * &drm_gpuva structure which typically is embedded in larger driver specific
> + * structures.
> + */
> +struct drm_gpuva_op_remap {
> +	/**
> +	 * @prev: the preceding part of a split mapping
> +	 */
> +	struct drm_gpuva_op_map *prev;
> +
> +	/**
> +	 * @next: the subsequent part of a split mapping
> +	 */
> +	struct drm_gpuva_op_map *next;
> +
> +	/**
> +	 * @unmap: the unmap operation for the original existing mapping
> +	 */
> +	struct drm_gpuva_op_unmap *unmap;
> +};
> +
> +/**
> + * struct drm_gpuva_op_prefetch - GPU VA prefetch operation
> + *
> + * This structure represents a single prefetch operation generated by the
> + * DRM GPU VA manager.
> + */
> +struct drm_gpuva_op_prefetch {
> +	/**
> +	 * @va: the &drm_gpuva to prefetch
> +	 */
> +	struct drm_gpuva *va;
> +};
> +
> +/**
> + * struct drm_gpuva_op - GPU VA operation
> + *
> + * This structure represents a single generic operation.
> + *
> + * The particular type of the operation is defined by @op.
> + */
> +struct drm_gpuva_op {
> +	/**
> +	 * @entry:
> +	 *
> +	 * The &list_head used to distribute instances of this struct within
> +	 * &drm_gpuva_ops.
> +	 */
> +	struct list_head entry;
> +
> +	/**
> +	 * @op: the type of the operation
> +	 */
> +	enum drm_gpuva_op_type op;
> +
> +	union {
> +		/**
> +		 * @map: the map operation
> +		 */
> +		struct drm_gpuva_op_map map;
> +
> +		/**
> +		 * @remap: the remap operation
> +		 */
> +		struct drm_gpuva_op_remap remap;
> +
> +		/**
> +		 * @unmap: the unmap operation
> +		 */
> +		struct drm_gpuva_op_unmap unmap;
> +
> +		/**
> +		 * @prefetch: the prefetch operation
> +		 */
> +		struct drm_gpuva_op_prefetch prefetch;
> +	};
> +};
> +
> +/**
> + * struct drm_gpuva_ops - wraps a list of &drm_gpuva_op
> + */
> +struct drm_gpuva_ops {
> +	/**
> +	 * @list: the &list_head
> +	 */
> +	struct list_head list;
> +};
> +
> +/**
> + * drm_gpuva_for_each_op - iterator to walk over &drm_gpuva_ops
> + * @op: &drm_gpuva_op to assign in each iteration step
> + * @ops: &drm_gpuva_ops to walk
> + *
> + * This iterator walks over all ops within a given list of operations.
> + */
> +#define drm_gpuva_for_each_op(op, ops) list_for_each_entry(op, &(ops)->list, entry)
> +
> +/**
> + * drm_gpuva_for_each_op_safe - iterator to safely walk over &drm_gpuva_ops
> + * @op: &drm_gpuva_op to assign in each iteration step
> + * @next: &next &drm_gpuva_op to store the next step
> + * @ops: &drm_gpuva_ops to walk
> + *
> + * This iterator walks over all ops within a given list of operations. It is
> + * implemented with list_for_each_safe(), so save against removal of elements.
> + */
> +#define drm_gpuva_for_each_op_safe(op, next, ops) \
> +	list_for_each_entry_safe(op, next, &(ops)->list, entry)
> +
> +/**
> + * drm_gpuva_for_each_op_from_reverse - iterate backwards from the given point
> + * @op: &drm_gpuva_op to assign in each iteration step
> + * @ops: &drm_gpuva_ops to walk
> + *
> + * This iterator walks over all ops within a given list of operations beginning
> + * from the given operation in reverse order.
> + */
> +#define drm_gpuva_for_each_op_from_reverse(op, ops) \
> +	list_for_each_entry_from_reverse(op, &(ops)->list, entry)
> +
> +/**
> + * drm_gpuva_first_op - returns the first &drm_gpuva_op from &drm_gpuva_ops
> + * @ops: the &drm_gpuva_ops to get the fist &drm_gpuva_op from
> + */
> +#define drm_gpuva_first_op(ops) \
> +	list_first_entry(&(ops)->list, struct drm_gpuva_op, entry)
> +
> +/**
> + * drm_gpuva_last_op - returns the last &drm_gpuva_op from &drm_gpuva_ops
> + * @ops: the &drm_gpuva_ops to get the last &drm_gpuva_op from
> + */
> +#define drm_gpuva_last_op(ops) \
> +	list_last_entry(&(ops)->list, struct drm_gpuva_op, entry)
> +
> +/**
> + * drm_gpuva_prev_op - previous &drm_gpuva_op in the list
> + * @op: the current &drm_gpuva_op
> + */
> +#define drm_gpuva_prev_op(op) list_prev_entry(op, entry)
> +
> +/**
> + * drm_gpuva_next_op - next &drm_gpuva_op in the list
> + * @op: the current &drm_gpuva_op
> + */
> +#define drm_gpuva_next_op(op) list_next_entry(op, entry)
> +
> +struct drm_gpuva_ops *
> +drm_gpuva_sm_map_ops_create(struct drm_gpuva_manager *mgr,
> +			    u64 addr, u64 range,
> +			    struct drm_gem_object *obj, u64 offset);
> +struct drm_gpuva_ops *
> +drm_gpuva_sm_unmap_ops_create(struct drm_gpuva_manager *mgr,
> +			      u64 addr, u64 range);
> +
> +struct drm_gpuva_ops *
> +drm_gpuva_prefetch_ops_create(struct drm_gpuva_manager *mgr,
> +				 u64 addr, u64 range);
> +
> +struct drm_gpuva_ops *
> +drm_gpuva_gem_unmap_ops_create(struct drm_gpuva_manager *mgr,
> +			       struct drm_gem_object *obj);
> +
> +void drm_gpuva_ops_free(struct drm_gpuva_manager *mgr,
> +			struct drm_gpuva_ops *ops);
> +
> +/**
> + * struct drm_gpuva_fn_ops - callbacks for split/merge steps
> + *
> + * This structure defines the callbacks used by &drm_gpuva_sm_map and
> + * &drm_gpuva_sm_unmap to provide the split/merge steps for map and unmap
> + * operations to drivers.
> + */
> +struct drm_gpuva_fn_ops {
> +	/**
> +	 * @op_alloc: called when the &drm_gpuva_manager allocates
> +	 * a struct drm_gpuva_op
> +	 *
> +	 * Some drivers may want to embed struct drm_gpuva_op into driver
> +	 * specific structures. By implementing this callback drivers can
> +	 * allocate memory accordingly.
> +	 *
> +	 * This callback is optional.
> +	 */
> +	struct drm_gpuva_op *(*op_alloc)(void);
> +
> +	/**
> +	 * @op_free: called when the &drm_gpuva_manager frees a
> +	 * struct drm_gpuva_op
> +	 *
> +	 * Some drivers may want to embed struct drm_gpuva_op into driver
> +	 * specific structures. By implementing this callback drivers can
> +	 * free the previously allocated memory accordingly.
> +	 *
> +	 * This callback is optional.
> +	 */
> +	void (*op_free)(struct drm_gpuva_op *op);
> +
> +	/**
> +	 * @sm_step_map: called from &drm_gpuva_sm_map to finally insert the
> +	 * mapping once all previous steps were completed
> +	 *
> +	 * The &priv pointer matches the one the driver passed to
> +	 * &drm_gpuva_sm_map or &drm_gpuva_sm_unmap, respectively.
> +	 *
> +	 * Can be NULL if &drm_gpuva_sm_map is used.
> +	 */
> +	int (*sm_step_map)(struct drm_gpuva_op *op, void *priv);
> +
> +	/**
> +	 * @sm_step_remap: called from &drm_gpuva_sm_map and
> +	 * &drm_gpuva_sm_unmap to split up an existent mapping
> +	 *
> +	 * This callback is called when existent mapping needs to be split up.
> +	 * This is the case when either a newly requested mapping overlaps or
> +	 * is enclosed by an existent mapping or a partial unmap of an existent
> +	 * mapping is requested.
> +	 *
> +	 * Drivers must not modify the GPUVA space with accessors that do not
> +	 * take a &drm_gpuva_state as argument from this callback.
> +	 *
> +	 * The &priv pointer matches the one the driver passed to
> +	 * &drm_gpuva_sm_map or &drm_gpuva_sm_unmap, respectively.
> +	 *
> +	 * Can be NULL if neither &drm_gpuva_sm_map nor &drm_gpuva_sm_unmap is
> +	 * used.
> +	 */
> +	int (*sm_step_remap)(struct drm_gpuva_op *op,
> +			     drm_gpuva_state_t state,
> +			     void *priv);
> +
> +	/**
> +	 * @sm_step_unmap: called from &drm_gpuva_sm_map and
> +	 * &drm_gpuva_sm_unmap to unmap an existent mapping
> +	 *
> +	 * This callback is called when existent mapping needs to be unmapped.
> +	 * This is the case when either a newly requested mapping encloses an
> +	 * existent mapping or an unmap of an existent mapping is requested.
> +	 *
> +	 * Drivers must not modify the GPUVA space with accessors that do not
> +	 * take a &drm_gpuva_state as argument from this callback.
> +	 *
> +	 * The &priv pointer matches the one the driver passed to
> +	 * &drm_gpuva_sm_map or &drm_gpuva_sm_unmap, respectively.
> +	 *
> +	 * Can be NULL if neither &drm_gpuva_sm_map nor &drm_gpuva_sm_unmap is
> +	 * used.
> +	 */
> +	int (*sm_step_unmap)(struct drm_gpuva_op *op,
> +			     drm_gpuva_state_t state,
> +			     void *priv);
> +};
> +
> +int drm_gpuva_sm_map(struct drm_gpuva_manager *mgr, void *priv,
> +		     u64 addr, u64 range,
> +		     struct drm_gem_object *obj, u64 offset);
> +
> +int drm_gpuva_sm_unmap(struct drm_gpuva_manager *mgr, void *priv,
> +		       u64 addr, u64 range);
> +
> +int drm_gpuva_map(struct drm_gpuva_manager *mgr,
> +		  struct drm_gpuva_prealloc *pa,
> +		  struct drm_gpuva *va);
> +int drm_gpuva_remap(drm_gpuva_state_t state,
> +		    struct drm_gpuva *prev,
> +		    struct drm_gpuva *next);
> +void drm_gpuva_unmap(drm_gpuva_state_t state);
> +
> +#endif /* __DRM_GPUVA_MGR_H__ */
> -- 
> 2.40.1
> 
