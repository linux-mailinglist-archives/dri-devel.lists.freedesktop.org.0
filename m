Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C7E0AB07DD
	for <lists+dri-devel@lfdr.de>; Fri,  9 May 2025 04:22:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3BA9710E08C;
	Fri,  9 May 2025 02:22:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com
 [205.220.166.238])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 300C010E08C
 for <dri-devel@lists.freedesktop.org>; Fri,  9 May 2025 02:22:47 +0000 (UTC)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
 by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5491auCe009035;
 Thu, 8 May 2025 19:22:33 -0700
Received: from nam10-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam10lp2044.outbound.protection.outlook.com [104.47.55.44])
 by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 46dee3ep1q-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 08 May 2025 19:22:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MT2jZ+cYjVpKke4Tpw6mAi+hIdeNYeyw7JFoNmdJi3vZtuat40dGVz5AQvZSXwWMeDypg6groOk5nr6fXwFKy8oCpf3fDHBariCMa6RLruVD4WSrYc/BxEofFn8d74V/L4ScoBhRo5r3lJrDlqjytMEgmC59Jjlo24kMrkG83qiLD51orlMrFVubAh/OAaT1Q4Jq00hYSC9UF0N0IZW08Wta5VojVNsqEBuSVptJB3GmD5mHJKavgcJQGEdGBtv01eKsJEO/vkl74kcs3A2+kM4SqWWeTuJ0xPP+Oo1wYQcZplMOWo39YBmaDokD4rqtgy2awZMUFU9kaXioCB1+3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nquZu8StwxLh11s8bzPsKtO/Gk+SMMxvQfexFl/T9Ug=;
 b=IeOIWclTttbgBXciE0fTf9lJ8EPhi8xY0QE0XsV+aeMADDx9jddwowoVGBpX8+uEbkAhRzPKUp5ZB5I+kyFT77c2gstH8oHQPC/wd2Xvc24Ik0a2lmW3Gy3fs+OmowE7kfVaRKktrdAMI6iDk9jQruRwmzvdrfqgz53EPASlZqgKbzlptUrV9hgOkr3qyPFTAmKxKK8wWZJl16lHgtROI/ilSkfFgoCS4JdH+Kjv3ASXvSNMwpDAYg7TR3SBOErxMXs/L21VGwRk+Gltub+sznlmvXU+rHDHNhv+n+Z/LoDm58Y30CpwO/xLv4VM/wkhMVl6bCCjXUtdqZ8paiETxA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=eng.windriver.com; dkim=pass header.d=eng.windriver.com; arc=none
Received: from BYAPR11MB3832.namprd11.prod.outlook.com (2603:10b6:a03:ff::18)
 by MN2PR11MB4680.namprd11.prod.outlook.com (2603:10b6:208:26d::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.21; Fri, 9 May
 2025 02:22:26 +0000
Received: from BYAPR11MB3832.namprd11.prod.outlook.com
 ([fe80::83ab:15a8:cce6:b531]) by BYAPR11MB3832.namprd11.prod.outlook.com
 ([fe80::83ab:15a8:cce6:b531%7]) with mapi id 15.20.8722.020; Fri, 9 May 2025
 02:22:25 +0000
From: Zhi Yang <Zhi.Yang@eng.windriver.com>
To: stable@vger.kernel.org, zack.rusin@broadcom.com
Cc: xiangyu.chen@windriver.com, zhe.he@windriver.com,
 bcm-kernel-feedback-list@broadcom.com, dri-devel@lists.freedesktop.org,
 maaz.mombasawala@broadcom.com, martin.krastev@broadcom.com,
 linux-graphics-maintainer@vmware.com, sroland@vmware.com,
 airlied@linux.ie, daniel@ffwll.ch, sumit.semwal@linaro.org,
 christian.koenig@amd.com, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org
Subject: [PATCH 5.10.y] drm/vmwgfx: Fix a deadlock in dma buf fence polling
Date: Fri,  9 May 2025 10:22:08 +0800
Message-Id: <20250509022208.3027108-1-Zhi.Yang@eng.windriver.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TYCPR01CA0131.jpnprd01.prod.outlook.com
 (2603:1096:400:26d::19) To BYAPR11MB3832.namprd11.prod.outlook.com
 (2603:10b6:a03:ff::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR11MB3832:EE_|MN2PR11MB4680:EE_
X-MS-Office365-Filtering-Correlation-Id: ed6f2ef7-ea34-49de-172b-08dd8ea0566e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|52116014|7416014|1800799024|366016|7053199007|38350700014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?ixYj37VkPBCNlBPuGf3cxMo/dF/uex1EL/qd60HEZWoGFnXSLXDyLlZ4Yd14?=
 =?us-ascii?Q?jtIORj8MQvzxwcci4FySlgNvjSgtIK9ftOziQLCZoy6+DGgBs0+p9UbRGCOi?=
 =?us-ascii?Q?vZfoUAs1W0KgSp2VhihKJkbD6Fy1B/l288tI+hsG4NlBLqK5bSzX43GamMjE?=
 =?us-ascii?Q?0OICDJEA3A9/zDwqRuTqnXDzBdaF87igHpV0u5iRrGTmkuNTh0f7N84j2mhz?=
 =?us-ascii?Q?3vwYcN8AgNIljWRmEXPZm4McLj/hKBu44E3FnrZ8dr4CNtDZJSieVg1esckE?=
 =?us-ascii?Q?KV3UEDSlEFZKl+weFz6DGy0eNcLr82oTy3zB5ZnfNMQieNWr7o/102Sy2tw5?=
 =?us-ascii?Q?t5CjgncJz7ypAJPysxBS71gceqsIsRN8+oT65dDWSwNOWDl3NYFo290kgQ71?=
 =?us-ascii?Q?eOHxmP/oUMeSb/5h22pmDPpRm6xRUEZo+GycbWwueTZc26eRXLLquXbJx+jw?=
 =?us-ascii?Q?dJOHG+EDay1d01ppQPUwEL2xkmff3ABwqICdFG4XWErXQY0Yxi02acoGOtgk?=
 =?us-ascii?Q?MwCA3z4kzxd67Gp6O7BRvAvWvPJnYSrTnGSZ+IWXlG/QZJBfpHN8kGbh2Uu6?=
 =?us-ascii?Q?FqegUbP5xeL03NmiufZlgLvVkwSnjPpX3DyFE3gkMStFkBXVGjynS+FiaxyI?=
 =?us-ascii?Q?rlSM+taX7M1RaBiApiD0piIWWLMZfwh/na/JQQIFoJ8YVx+C5ye0zdG/2LVx?=
 =?us-ascii?Q?WRzE+Ee3rnFQ9Dzjhu6gt2oewifQ2dWqdK9IZwZu2oXMaFcLj4eF4grcWN33?=
 =?us-ascii?Q?xV1NezGvo3Ra2YWS0qejvGRURJINKCQCxrPk6hViUsPT3rN25Y6Woobzq6Pl?=
 =?us-ascii?Q?VTtrDijqRa4osVja+Y5sXlAYBXUPr7g+amr2Y+bqGztxO5ITPbOTlUa5zbhJ?=
 =?us-ascii?Q?eOFK/m179asIcZDoiEBnOmZIapqKDo7QtWHp/Upx7/f43J39eboSInSZyWwL?=
 =?us-ascii?Q?7Zgm7WmNhr68I1sNqMgKl6BYbarYH7b+G15gnsmU4+f+VYxTkD8zTiZahzY7?=
 =?us-ascii?Q?c9S3KjAkYhlLQvEkJWkBgcYhgDxcM/RnOtFSV7iWhH7nqa2jzHkeWAWhDAoo?=
 =?us-ascii?Q?RG9zDXL9w25vfkHdt5DQfc/+txeUhxzbRnkcaz+8xKo4AWV1HYyBfvYWAD3k?=
 =?us-ascii?Q?3fjyHV/ws7UCuZqpZOIPrYKpdSLNnGvoifv8HKR8T1FLeSAzjHbzWwsrodAd?=
 =?us-ascii?Q?ysfGPcg5rVkhfRytJxktl9dY5CaXWv4UDh/CeAmB0dchSivdze3krm3sJxdE?=
 =?us-ascii?Q?AE9jifFceBgZG5iihP/Jmlxgt7aw/tkNr9P+PT3UFrkcuipcoAXk6EzVPsDl?=
 =?us-ascii?Q?RwH8yFvnXYcHX1vKpGsfhliKAh21Z3CWqi/q5vhoxwa+UULKIbgP5u8Z1wms?=
 =?us-ascii?Q?fKEkDmiOO+pstxgO+E2VNmrjxk+gQR7ma9LIor/cyptwNg5ADyXz1RosSp36?=
 =?us-ascii?Q?rIdR0mkkJxY=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR11MB3832.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(52116014)(7416014)(1800799024)(366016)(7053199007)(38350700014);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?31Q9JVrtUiueGmmaW9oFV4Hp/F+qXt9Q+UKKsgLwmcII4bFV3bbJGbUQg+xU?=
 =?us-ascii?Q?oYUdSVc5HJvrNwfjgenrxoZNOmIPBeLTF3SwguHosE+IGxK9jSW+/N6T/EG6?=
 =?us-ascii?Q?r2N5Jn1BPQQS3ubtzQt6d2HGEev3KqFrk9qAquFcJYCZrwSMka/TG5iGZWi8?=
 =?us-ascii?Q?1XK+5BGDI0WqheNRbdY7h3g/j+JgjcsQuF6wwIhrUOtXnvwIPADssBTndmxT?=
 =?us-ascii?Q?BQD+8OnIFtyB1RU6Tb7bRMEoqt5DsAnGFVhXdmzEeJmImVPnPdmUQ4+q6dqy?=
 =?us-ascii?Q?omTooGXjX5BrTsl2us7CNVjGjTYFrzP5qN/6RtuqgSQ0DUJPUajAB8tOrRFr?=
 =?us-ascii?Q?ropY3V29eY/iqzw5cXzSjfX75a1a1RZAJuh/Uam2vvGX6fGppNVvDqZazitQ?=
 =?us-ascii?Q?H5muSoX7zbUUNzmmFCgDE0ON/b4ftLwx3k/ipzlnw61ursGtLttjwZWb50Vb?=
 =?us-ascii?Q?lI4WCUqXfpKVyLPuLkj3Cdh+iNr7pN7KSb0jKiQ3hL01RqX0FGa23SAiHa6z?=
 =?us-ascii?Q?bsvpr8MV1RbzGShL3lDS9FeMLO+9nquhcJNlPV7WNPOkjmqgwi+cfihyQnpz?=
 =?us-ascii?Q?7ajFFqqYK8uOHOoP4oD6VczDHhbeyekrNCxu/Jo3PO8Oe14VZt7o5k5kaWF8?=
 =?us-ascii?Q?0rwypwptv+GlPsCmsr4ssyJl7XyvA80o50b5cU2nrQV0IoQbPEisAHMabZHf?=
 =?us-ascii?Q?oou1yRMclFCcnd9iNOoz9wpA/Fhv3aBrEw2IaIIyAXLg2dKa4j9P5EiMYgsb?=
 =?us-ascii?Q?m9w/ZZ+GPz/O/BBB1mVm73h6bwrSCMjZnxR02/NwfhE8g28NwonnwxBWojRL?=
 =?us-ascii?Q?CQBAup0w4y8hVEtrNcgzgGcrK496amrKJ0otyJy/chSpR95eBoaTW1GryOh0?=
 =?us-ascii?Q?9LsivYweVWsNV+FAffQhV33pWNeksFTZPqFU/0UxNKVaJCdQr3AWrZqAArdx?=
 =?us-ascii?Q?+/2effAo6BvrYochW7XZpjMyd6NT4kgkhT8888+gKsa14dNpMKWSvV04EcGc?=
 =?us-ascii?Q?03XHC4OmvRhpF5E+XlSkRjUblUfUyyWkoxeSmPy7QOUw7Z2qE2vwFaLdsKgi?=
 =?us-ascii?Q?ezo4e8cmLsK8upxAMVmMP3f97zyncbQC7oquWgwC+/8u0nFtLkGFrabIaP8G?=
 =?us-ascii?Q?baBTEAFEhgSdu7/cWqk5hAymQPzh7WlvD0lUEtR3bHOBdA5s3mjQ1cO+xCZl?=
 =?us-ascii?Q?U5bc2q0z1aTn73sErGnjkK6i6t7o0JUKAbBDkKUajmSxqidZ7FEH0ti1aDZX?=
 =?us-ascii?Q?UphYhZ1dt7Nd3du6BgoBuEfW3Xe+hCD9R+0Fcgl/gnxI2zmdoqNO/0FOFkTS?=
 =?us-ascii?Q?0IoKG3cvXaBIBnveINnUsNkMT3yVWAcsoDZmgUirK6WM+FXJ+LZCWCz3kc/Y?=
 =?us-ascii?Q?/HnjhYeOP640ZCV4E/QkNx7FVLf3tY0FAi6PC7FYHuyh17cqfY+NCK+EVBbM?=
 =?us-ascii?Q?M8m4tSdI2Nxfw+gLSe7oVqc7jPkkPhJ1kY/9SzqhRhgkN2v/SqW4xAsuJiEb?=
 =?us-ascii?Q?ENqcI8W+WyI3yckDgY+XdhbGG7KNM68mVeiMvHJn3Om8TdhJki9jKpRvjTbv?=
 =?us-ascii?Q?Y02SX3dpfnk3O5g3afTaRy06GUwm7xjrkJgpII8E?=
X-OriginatorOrg: eng.windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ed6f2ef7-ea34-49de-172b-08dd8ea0566e
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB3832.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 May 2025 02:22:25.7225 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NbAVyAD3CcyX+ERJKfF+qBMDMpUvE1NOxIKDd9ZLHAX7ZzVgA1A65m2Is3ps9O3SY+W1G1sH4p1sgxBIAyl3mg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB4680
X-Proofpoint-ORIG-GUID: PK_AmuhlCypCEG43kqYq1OshMkyomDu7
X-Authority-Analysis: v=2.4 cv=Pd3/hjhd c=1 sm=1 tr=0 ts=681d66e8 cx=c_pps
 a=t4e0UQJdoJrPmzgCWb9hsw==:117 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19
 a=xqWC_Br6kY4A:10 a=dt9VzEwgFbYA:10
 a=e5mUnYsNAAAA:8 a=Q-fNiiVtAAAA:8 a=VwQbUJbxAAAA:8 a=t7CeM3EgAAAA:8
 a=azflqpau20-cq16KAhMA:9 a=Vxmtnl_E_bksehYqCbjh:22 a=FdTzh2GWekK77mhwV6Dw:22
 a=Omh45SbU8xzqK50xPoZQ:22
X-Proofpoint-GUID: PK_AmuhlCypCEG43kqYq1OshMkyomDu7
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTA5MDAyMSBTYWx0ZWRfX9aOdUK2Ia/RH
 deCJApwQA4GF0Iv+plke671upnLiwAoosRf7pOTpSOeJ72SyaTRVvX7a95cj/X0NpKn17f9FfWf
 OFFjhFezGA5YpHJeVhnYcpPVnFaVnLL0NRRl9HyCT5xCDdWyNeYBb08+1tgUgr08XUW3GHY586g
 h4dwYAnQAkFL6uO7FurTZUkyNts5TNO/hisnzvA8vXV3boe/8qWtGTky0YRhq7UsXQb5CEOoPmg
 JzCP8V9s4LH4oD1f+ueMs0M9z5JJRpRGAU9sSvzj3ZyKb+Rf4rzlnQZCUsRfPyxQACYo7/GO/Gi
 zGmFc5onb442Hqnqp2yyDIndALbpCI2QyhF/dvAnQnRyXmqnpoJ5usliYX813eisKHCsXWkGJUm
 GNZf8kO7pXykajLgnTP+8j59OijKSorcu0V00EeBWqwervYGRhHhk83PTPm1UXJaXuR8c33d
X-Sensitive_Customer_Information: Yes
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-09_01,2025-05-08_04,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0
 priorityscore=1501 mlxscore=0 suspectscore=0 spamscore=0 malwarescore=0
 impostorscore=0 clxscore=1011 mlxlogscore=999 phishscore=0 bulkscore=0
 lowpriorityscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.21.0-2504070000
 definitions=main-2505090021
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

From: Zack Rusin <zack.rusin@broadcom.com>

commit e58337100721f3cc0c7424a18730e4f39844934f upstream.

Introduce a version of the fence ops that on release doesn't remove
the fence from the pending list, and thus doesn't require a lock to
fix poll->fence wait->fence unref deadlocks.

vmwgfx overwrites the wait callback to iterate over the list of all
fences and update their status, to do that it holds a lock to prevent
the list modifcations from other threads. The fence destroy callback
both deletes the fence and removes it from the list of pending
fences, for which it holds a lock.

dma buf polling cb unrefs a fence after it's been signaled: so the poll
calls the wait, which signals the fences, which are being destroyed.
The destruction tries to acquire the lock on the pending fences list
which it can never get because it's held by the wait from which it
was called.

Old bug, but not a lot of userspace apps were using dma-buf polling
interfaces. Fix those, in particular this fixes KDE stalls/deadlock.

Signed-off-by: Zack Rusin <zack.rusin@broadcom.com>
Fixes: 2298e804e96e ("drm/vmwgfx: rework to new fence interface, v2")
Cc: Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>
Cc: dri-devel@lists.freedesktop.org
Cc: <stable@vger.kernel.org> # v6.2+
Reviewed-by: Maaz Mombasawala <maaz.mombasawala@broadcom.com>
Reviewed-by: Martin Krastev <martin.krastev@broadcom.com>
Link: https://patchwork.freedesktop.org/patch/msgid/20240722184313.181318-2-zack.rusin@broadcom.com
[Minor context change fixed]
Signed-off-by: Zhi Yang <Zhi.Yang@windriver.com>
Signed-off-by: He Zhe <zhe.he@windriver.com>
---
Build test passed.
---
 drivers/gpu/drm/vmwgfx/vmwgfx_fence.c | 17 +++++++----------
 1 file changed, 7 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_fence.c b/drivers/gpu/drm/vmwgfx/vmwgfx_fence.c
index 6bacdb7583df..0505f87d13c0 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_fence.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_fence.c
@@ -32,7 +32,6 @@
 #define VMW_FENCE_WRAP (1 << 31)
 
 struct vmw_fence_manager {
-	int num_fence_objects;
 	struct vmw_private *dev_priv;
 	spinlock_t lock;
 	struct list_head fence_list;
@@ -113,13 +112,13 @@ static void vmw_fence_obj_destroy(struct dma_fence *f)
 {
 	struct vmw_fence_obj *fence =
 		container_of(f, struct vmw_fence_obj, base);
-
 	struct vmw_fence_manager *fman = fman_from_fence(fence);
 
-	spin_lock(&fman->lock);
-	list_del_init(&fence->head);
-	--fman->num_fence_objects;
-	spin_unlock(&fman->lock);
+	if (!list_empty(&fence->head)) {
+		spin_lock(&fman->lock);
+		list_del_init(&fence->head);
+		spin_unlock(&fman->lock);
+	}
 	fence->destroy(fence);
 }
 
@@ -250,7 +249,6 @@ static const struct dma_fence_ops vmw_fence_ops = {
 	.release = vmw_fence_obj_destroy,
 };
 
-
 /**
  * Execute signal actions on fences recently signaled.
  * This is done from a workqueue so we don't have to execute
@@ -353,7 +351,6 @@ static int vmw_fence_obj_init(struct vmw_fence_manager *fman,
 		goto out_unlock;
 	}
 	list_add_tail(&fence->head, &fman->fence_list);
-	++fman->num_fence_objects;
 
 out_unlock:
 	spin_unlock(&fman->lock);
@@ -402,7 +399,7 @@ static bool vmw_fence_goal_new_locked(struct vmw_fence_manager *fman,
 {
 	u32 goal_seqno;
 	u32 *fifo_mem;
-	struct vmw_fence_obj *fence;
+	struct vmw_fence_obj *fence, *next_fence;
 
 	if (likely(!fman->seqno_valid))
 		return false;
@@ -413,7 +410,7 @@ static bool vmw_fence_goal_new_locked(struct vmw_fence_manager *fman,
 		return false;
 
 	fman->seqno_valid = false;
-	list_for_each_entry(fence, &fman->fence_list, head) {
+	list_for_each_entry_safe(fence, next_fence, &fman->fence_list, head) {
 		if (!list_empty(&fence->seq_passed_actions)) {
 			fman->seqno_valid = true;
 			vmw_mmio_write(fence->base.seqno,
-- 
2.34.1

