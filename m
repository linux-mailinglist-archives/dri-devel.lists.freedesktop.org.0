Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D6A10C56B3D
	for <lists+dri-devel@lfdr.de>; Thu, 13 Nov 2025 10:56:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BBC3810E09A;
	Thu, 13 Nov 2025 09:56:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=windriver.com header.i=@windriver.com header.b="gL1ZVqqR";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 1812 seconds by postgrey-1.36 at gabe;
 Thu, 13 Nov 2025 09:56:27 UTC
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com
 [205.220.178.238])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EF57D10E09A
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Nov 2025 09:56:27 +0000 (UTC)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
 by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5AD8lmGp2054174; Thu, 13 Nov 2025 09:25:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=cc:content-transfer-encoding:content-type:date:from
 :message-id:mime-version:subject:to; s=PPS06212021; bh=JQcIKrY1S
 xvYbX2Pb3p61/CqtQ3L6qP8caj9qmawMrU=; b=gL1ZVqqRu9iDHd+0SYeQLX/6q
 NXm4yehVrqP3kJAcwRZy9K+ZqdhCSZa2rggqr87iI8VyBAZ/mnFl9TH8ZTYEf+Yw
 q3mHoT09VCIyBLvh0snr7Gq9rRiliASBQUfQLLGKhpB4oWUgYWy+Rb26XhIHsACe
 uwCD6NLSdVlm8uCzWjt2dcM77mV7U+g3ROL9tJBGMwPkC967l+FgTrOW98GkaUty
 eEsJn+pdY7nkGzdjPKgUaK7QioJrRomhb1G1ciVbHPe6rPWv7kx3vsi1Vk6xm20s
 XQEnV8xrkrc5yTA49uZh62Mbz3ZlONts9n/5EoZDZaZg193Ps3EjzglFFyR0A==
Received: from bn1pr04cu002.outbound.protection.outlook.com
 (mail-eastus2azon11010005.outbound.protection.outlook.com [52.101.56.5])
 by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4a9u2x78h1-1
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
 Thu, 13 Nov 2025 09:25:57 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DsakoUlZGt1YQ5KFruIJsv0w6/9+aOicQ5zRa0VUMDyshP34hNfojcqUrXCujpWAchFq0rBaYaq0+8AqGOSRmqkwXLQyscTUj+eThtfqeU0bsu+ImQ9uOObGsW2LXggK6TU6DRrIELArUwiFcjhYa2viLhfR2UmQO2fMszOXvqjQ176TjobLmLZDL6qco1rVs2Nxmr7x/7ktpOFk1/VHXktYzR2ExXTcAyRFMulwREN8E2m1iVksolIPLTE4sPiOyHqIaNfNvTXr3QJcTsT81AIVHfB3B+6HckoG48C8pTcQseVqOkLO4Am8nrE/g1yZk5LB1XITElmRjywuG5QUMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JQcIKrY1SxvYbX2Pb3p61/CqtQ3L6qP8caj9qmawMrU=;
 b=iFUSC8EFR/IXGkBVa+NnMRL7sfcueJwy8KgIG9ZXnVwMKVuXvToC3y8TBMkWz63xloh7AxvFaFwR2WylG2VboMeZjB1hreaqX/C+XUksQ0DUGK2ir/0vD3iruquxoMS7fes17bQctAIBDvl5liIL9U3DXLPfuQSa7BoLyDQgZHduTjybN+MSh3UYidrUe+GRc8ckOjK02tUnITaIBT6n8KgSMZNcqoqVXuaFvqecPWAuZj3uwU5yiLW/uh/ZrDIhNkN06X7raH/8XuWHZbFFV2i3w3GsilDOSBMdS7ld20or3PY7pzwgnpvA+ePWcvN7iFXlmFR9aVQHtDTqx5xkDw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS4PPFD667CEBB6.namprd11.prod.outlook.com
 (2603:10b6:f:fc02::53) by PH3PPFF2B8F6C64.namprd11.prod.outlook.com
 (2603:10b6:518:1::d60) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.16; Thu, 13 Nov
 2025 09:25:55 +0000
Received: from DS4PPFD667CEBB6.namprd11.prod.outlook.com
 ([fe80::4b10:b3ea:35de:ab99]) by DS4PPFD667CEBB6.namprd11.prod.outlook.com
 ([fe80::4b10:b3ea:35de:ab99%7]) with mapi id 15.20.9320.013; Thu, 13 Nov 2025
 09:25:54 +0000
From: Xiaolei Wang <xiaolei.wang@windriver.com>
To: mwen@igalia.com, mcanal@igalia.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com,
 simona@ffwll.ch, xiaolei.wang@windriver.com
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: [PATCH] drm/v3d: set the V3D GPU sg segment limitation
Date: Thu, 13 Nov 2025 17:25:38 +0800
Message-ID: <20251113092538.1971286-1-xiaolei.wang@windriver.com>
X-Mailer: git-send-email 2.43.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TYCP301CA0075.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:405:7d::13) To DS4PPFD667CEBB6.namprd11.prod.outlook.com
 (2603:10b6:f:fc02::53)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS4PPFD667CEBB6:EE_|PH3PPFF2B8F6C64:EE_
X-MS-Office365-Filtering-Correlation-Id: a71483ae-5475-468f-4409-08de2296a534
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|376014|52116014|1800799024|38350700014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?H3rHP+T9YSUIdNEXlarssMWTFvPx/X3npyzegyzGY6eo4c7MwQ8tuSJxgNlm?=
 =?us-ascii?Q?Ja1u1GN5w3Y/8Fz1dWWj/2wOJbVP1ewtZOSqv58hsNRvvavglsBGthrf3Z6U?=
 =?us-ascii?Q?MCLA4YEvS1Lzpj5HnKGEUUEzQ6b/vAi8j724KQbItSxjytI+ZWISIE1kRQcC?=
 =?us-ascii?Q?RPjrRHrxuDfYZARQKW8PpUihruO3W1FlaAlvQIH9bJ0jYktAoMn/FdPgJhn2?=
 =?us-ascii?Q?+dBoxm601elOWnQkWPai2tT0d+vjUevZ7TCto61KV2fKwBCexzkGDe0XBy7b?=
 =?us-ascii?Q?gwBS427pApqrlUDTCOq6Ipj4jCOMVge/Oesqs5gUb7CkAUu9dX5BGf+cyseD?=
 =?us-ascii?Q?d/TaO7faCv1n+DE8y8HmsACpIC1cilwdCSEyDDUp5ARgf1/9oZa1iOqe4gCW?=
 =?us-ascii?Q?iK56MAj1F12R6Twk9o79SVlxyn4ixxTb5BmEadzAFiRlbdmWZULr0+y1fiZ8?=
 =?us-ascii?Q?dy+f6bnnAnN29I1m/vJ4+Om8wvgrzzAEtNYp9ZV0/l4FjGrw/K2JEOOGmqHB?=
 =?us-ascii?Q?Z26jXViFeUjFDrMV3TEAaOxDgNk1Jx+zqPKkTmI47hN7WVSZ9nAhj6AVcEI9?=
 =?us-ascii?Q?vccYoexZpkZo3Q5gmdxcvya554i5tXdOGDznGK7CG3BC42j39tXblgnDLsvB?=
 =?us-ascii?Q?MMxKqlnGSg82q+MBNINotIb8EJGc4gyrUG9hLT+E61L3HV05wjCN5Qal12JO?=
 =?us-ascii?Q?sq3dVH2ZbozzUvi73uvjpgWSCP+N8Rwrdr1E4/zZ79QJX0AQCa2fK+rRwaeS?=
 =?us-ascii?Q?Fru2ncyELUFNdks0N9zlXtnsx2rwsxfO/pAV/IqwnsCQ/lnxvzflXfLdhSWd?=
 =?us-ascii?Q?E/E5vFhISfKgX6BHxhv3FC+EVFa95Lc+cK7I2T3yXSOgvRnz2FMn04hEZkI6?=
 =?us-ascii?Q?aKyJCleZQ0ytVWRoiyQctKXVufN/7dNTqjCiMeTye9ulEVuCNnLQbNveTCJT?=
 =?us-ascii?Q?pQHBvj7gWXJsjQT0THNyVjPi9hkw26sR4OfAAOe/PKdhnZSyFWxO8tPS9S+U?=
 =?us-ascii?Q?1fxEHzLhiVI72mU91mNDOfN3evmYOEs0kMYy0IX8h9cH/RwRQuB/4KSh89n9?=
 =?us-ascii?Q?QM8E2o7nb5FoRWyAfa+jUdX+JTIzjBEkH5aTQ1zTpdOpuxPgXJKXIaibRxLp?=
 =?us-ascii?Q?2OEE0ZJAsJqHbYEGVXx3iMH3kv/lOBuhcu43FvwI2fO7xKgooZPdpHmaQrHY?=
 =?us-ascii?Q?lgw4l3/3ZpVXeg18e85LBJP4zwOJiayRRNEGkJulrts3sF7Ae4kqhW4QGUUT?=
 =?us-ascii?Q?4NuzvWulH3ioSYMLz0dM5a9wmZw/unL56/MdwM8V2cJv21+WPsidFcpCmT3w?=
 =?us-ascii?Q?RjtpEk5qO1pnDkwLJpi3un7eYc4IwnzYMrlnAXsng+P75IKMjVg3w5EYEnBk?=
 =?us-ascii?Q?Hy/1ls1BXkXxvenOh35kxJdUSZz4Xi/qE+ZEaumUZplrvAytaQg1YaOCQxaf?=
 =?us-ascii?Q?g7oStKULBn9H+UMmQh4GUq86wDETHfvlxVtUg1C6DRsG8CNtuqkgF/ccJK6D?=
 =?us-ascii?Q?A7X2yOMZBgaa4yM/SHMHtM7bUWhkeI3eQ3z9?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS4PPFD667CEBB6.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(52116014)(1800799024)(38350700014); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?it9uEFTjcN9uFaxn+wJ4r8CZz1W/9rxMxfc5QxzlDGmAFhCVU6I+Y9kRD5G0?=
 =?us-ascii?Q?9Mf1F5aEWI5d5mjIDha3QpRVC5o+Upj5L910KsO9wkLwEL+EA7t0Jmyvx6PM?=
 =?us-ascii?Q?ZwyKBIkXEBWqxvxhykgXemSPxNAgOhCdSMuI0DxjnQtmj+W/3kbtXaAkQT15?=
 =?us-ascii?Q?cXX3Pq2PT8KfP19n7z7nKEEadBwqEVFDC39KV41mCEyjcQXElme4Pe+C9Q4d?=
 =?us-ascii?Q?l7wWfdXJlBKt27a6MofB/AeP2sxQL8RYeOpGVymvYytyq7DuznBUHAdQIeyW?=
 =?us-ascii?Q?gmxthvu6OkaoqyF55cJxx5I9dNCsoRQbKjgmi+pnKNhhRxTbdfe/lam1gjJC?=
 =?us-ascii?Q?NX2ddTnjIUftB4li9H7yW2Tmotrx62XPt7GqQjhxLiXReXtEhzzkd8aP9PdV?=
 =?us-ascii?Q?eapJ9LaiFOHJqLFjF/cAkosrCHOJ/CvOpJ6s2Pyo7+33N1C95uVVpoJbqCcn?=
 =?us-ascii?Q?qapcivcD9qQ4bwnyj16xv+W12bQ1p1PMZbS9DWc43Zj83fJ6Z8hGc+Uqcg6c?=
 =?us-ascii?Q?jSrMr7VPJq+Y3EDgy6D9wGPjmxFTyeDgWlFrz0Fwl5A3wZu3JYV4Ndov+UUl?=
 =?us-ascii?Q?R7hww4dcytUQ8LHNsh+fJW1ZQ0+j0DfB8F6Qqr+QNZH8PxuhnPVIc2jcghUv?=
 =?us-ascii?Q?lfhwKbCH3/FPX92Qc0z+dZjg35s+grUT5HIv+pep41xS5aMBB5k+EihXB/dV?=
 =?us-ascii?Q?eIwJugBZ0x4DlGbu4pgQ0gWATW/SYjkvKNp/6quAjB+Yrc2Q7/hHI+ZWzi9V?=
 =?us-ascii?Q?EGjVTlMILgLV/Ymgb9tZwpEftz7YHK+h2XZzILwXg9rKMqiRApfChZeK1iia?=
 =?us-ascii?Q?mvcnWmRfyC2EuEtbjoaminLnAADymjvxGyq/bfPn1ClJWvmv2wFfj+RaNiKQ?=
 =?us-ascii?Q?b7pve51MVJsb1RE6NF/Nk86I4FikzSwKzhD6CC1oMljFBepydxd3X5adij/2?=
 =?us-ascii?Q?eE5K+UEq4O5E1nJej1955PyBeog7fFGU+BLBPdJdv+KeY1o2ZYVKiPWouaM/?=
 =?us-ascii?Q?6FGmc+btjKW2Pt3GABsKIrvgbGHwDj4UC42w6iyzm9vvNF7uoJvN1wsmf7Um?=
 =?us-ascii?Q?Y3uRW7NAPq+5rnylzIS/yID/bvqYhKW86mGA3MRh1+bOQ0cCGtQbR0m/yo9u?=
 =?us-ascii?Q?8m+K0cRlotys+LRUO0Bs3oSAziRk/1/2E3UiZREJZ5fPmwS45Paega6HGmfB?=
 =?us-ascii?Q?c7eu3ffI9O+R6nvt0lKdPr2cSlgrzjAYmG8LzwT5G738GvgO6t2XJ1OsNkCd?=
 =?us-ascii?Q?JGTNQXbvnr21RjLXSSO0/oOgukW6XwChJ/zM7Xj5wWTNaPRjTovTPr0nc45d?=
 =?us-ascii?Q?aagSCZOQQEZGqJgvVBWLbhH+m/araDTWiwwgXI/KSGyqE7soQiptQB6ZXvQi?=
 =?us-ascii?Q?0cDJkoYqFf3ZuR/doRbu62KO/O5OYlVksi72UhXldXjUpIXjBrCuTch80yUT?=
 =?us-ascii?Q?KdQrqZSrNu5ORH1aP53HLJDF8JTaqntISdeMQm1wgPTs5ZIYIVGKnDSyXycF?=
 =?us-ascii?Q?A5egIaOrAvfIwRyWZ1qiNeVtKos9kjaMvhoUNY0dnzv7MG034WxfcoRuGdic?=
 =?us-ascii?Q?/grj2D8FiQIkRv6qTEqHgNTHQEziiSb074Cr1IygNplMlRCS4d0zVcyCyJbe?=
 =?us-ascii?Q?lw=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a71483ae-5475-468f-4409-08de2296a534
X-MS-Exchange-CrossTenant-AuthSource: DS4PPFD667CEBB6.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Nov 2025 09:25:54.8225 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NARwWXc/qzyi4kufI3/Mt2BU7/ie3ipOSak5HP9KuUljMWlBnH8MK/95i5/NmGpLKuYgDRTXDA+wdBq8pykUZTdUr579I7gOzye1gk7S5QA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH3PPFF2B8F6C64
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTEzMDA2OCBTYWx0ZWRfXysA2PzuZO+z5
 SGvQ+7ywZCGQpgo3rY7FGAJASXTvwhIMoFGHQCCT+G9O5XUjLbPJAoJssqIgvhlVufbvP3y6pY9
 Dy9pdWOceeam1yaAsQX7ia0OiDl6RorOfwaCzQ2HOPf2Zm4LQJCQjFvaeJ0cGCq+TzxRC9rIqqL
 tA0SVhz2QmMbsHliuxRB3jobD+dShUb6pijvOTyiOCFsL8R550gnAeb3nbKfF2iEGEz7OAe288s
 t50I6By6drS1a3krunwlbFi6TnVsFCV4AN25lmSuP0tYjBRgRzu8AuInhzJY75gjtjzt3ZHWvAt
 vp2PHf8kWAlppfDaWdIuadnpRDCdfbM5esAlrf3FrAwK522lfNkxLGolw2eNTj86JY0itdDgVda
 pe9Ei3pjBw3fsf//1Z69pC3FiXHdQw==
X-Proofpoint-GUID: B1-Q1g8FqTINJP3tTDMDXttmp91dpMx7
X-Authority-Analysis: v=2.4 cv=Uvpu9uwB c=1 sm=1 tr=0 ts=6915a425 cx=c_pps
 a=sh1HRyDNv5RGx04/W1QObA==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=6UeiqGixMTsA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=t7CeM3EgAAAA:8 a=2nXAMA55c-ftXtIlIz8A:9 a=FdTzh2GWekK77mhwV6Dw:22
 a=cPQSjfK2_nFv0Q5t_7PE:22
X-Proofpoint-ORIG-GUID: B1-Q1g8FqTINJP3tTDMDXttmp91dpMx7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-13_01,2025-11-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1011 impostorscore=0 priorityscore=1501 adultscore=0
 lowpriorityscore=0 bulkscore=0 suspectscore=0 phishscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511130068
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

When using V3D rendering, the kernel occasionally reports a
segment size mismatch. This is because 'max_seg_size' is not
set. The kernel defaults to 64K. Based on V3D's addressing
capabilities, setting 'max_seg_size' to the maximum will
prevent 'debug_dma_map_sg()' from complaining about the
over-mapping of the V3D segment length.

DMA-API: v3d 1002000000.v3d: mapping sg segment longer than device
 claims to support [len=8290304] [max=65536]
WARNING: CPU: 0 PID: 493 at kernel/dma/debug.c:1179 debug_dma_map_sg+0x330/0x388
CPU: 0 UID: 0 PID: 493 Comm: Xorg Not tainted 6.12.53-yocto-standard #1
Hardware name: Raspberry Pi 5 Model B Rev 1.0 (DT)
pstate: 60400009 (nZCv daif +PAN -UAO -TCO -DIT -SSBS BTYPE=--)
pc : debug_dma_map_sg+0x330/0x388
lr : debug_dma_map_sg+0x330/0x388
sp : ffff8000829a3ac0
x29: ffff8000829a3ac0 x28: 0000000000000001 x27: ffff8000813fe000
x26: ffffc1ffc0000000 x25: ffff00010fdeb760 x24: 0000000000000000
x23: ffff8000816a9bf0 x22: 0000000000000001 x21: 0000000000000002
x20: 0000000000000002 x19: ffff00010185e810 x18: ffffffffffffffff
x17: 69766564206e6168 x16: 74207265676e6f6c x15: 20746e656d676573
x14: 20677320676e6970 x13: 5d34303334393134 x12: 0000000000000000
x11: 00000000000000c0 x10: 00000000000009c0 x9 : ffff8000800e0b7c
x8 : ffff00010a315ca0 x7 : ffff8000816a5110 x6 : 0000000000000001
x5 : 000000000000002b x4 : 0000000000000002 x3 : 0000000000000008
x2 : 0000000000000000 x1 : 0000000000000000 x0 : ffff00010a315280
Call trace:
 debug_dma_map_sg+0x330/0x388
 __dma_map_sg_attrs+0xc0/0x278
 dma_map_sgtable+0x30/0x58
 drm_gem_shmem_get_pages_sgt+0xb4/0x140
 v3d_bo_create_finish+0x28/0x130 [v3d]
 v3d_create_bo_ioctl+0x54/0x180 [v3d]
 drm_ioctl_kernel+0xc8/0x140
 drm_ioctl+0x2d4/0x4d8

Signed-off-by: Xiaolei Wang <xiaolei.wang@windriver.com>
---
 drivers/gpu/drm/v3d/v3d_drv.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/v3d/v3d_drv.c b/drivers/gpu/drm/v3d/v3d_drv.c
index c5a3bbbc74c5..f4da7a94e401 100644
--- a/drivers/gpu/drm/v3d/v3d_drv.c
+++ b/drivers/gpu/drm/v3d/v3d_drv.c
@@ -377,6 +377,8 @@ static int v3d_platform_drm_probe(struct platform_device *pdev)
 	if (ret)
 		goto clk_disable;
 
+	dma_set_max_seg_size(&pdev->dev, UINT_MAX);
+
 	v3d->va_width = 30 + V3D_GET_FIELD(mmu_debug, V3D_MMU_VA_WIDTH);
 
 	ident1 = V3D_READ(V3D_HUB_IDENT1);
-- 
2.43.0

