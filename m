Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6894B5796A3
	for <lists+dri-devel@lfdr.de>; Tue, 19 Jul 2022 11:47:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 957211139C6;
	Tue, 19 Jul 2022 09:47:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com
 [205.220.177.32])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BE550113E71
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Jul 2022 09:47:38 +0000 (UTC)
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 26J80osD013956;
 Tue, 19 Jul 2022 09:47:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=date : from : to : cc
 : subject : message-id : content-type : mime-version; s=corp-2022-7-12;
 bh=kdhJnyLCK8DSkbu7GqsCyw0bLTZMiqpf/PbSw4iE/JA=;
 b=NgqZUMPLNWXq10eP8vITnHRSlVB+ylX8wiR895beyzPoFVHLt/TzZdt2XHWvCuW3gr+u
 Opd0ssxHfjeOO1LjPqmTUkuNubrIz94x18zTD9EEXWUGw0Oi8xaH7ySOPVfWC0oEMbFy
 XRJqy6PKLeIoaNlT3jALZjb2B7GZZOAkMNKaqr1FSJH3ZRB2deydUH9woxf5a534cjQZ
 RFh17Cr5+sReVyMjl4UWj+vCCicoGd4J7yelzJ/kIsZCE6hSicRIQuzI7WuqyTeEPn1j
 lkd4HU/NIS0wP7pAtpqOg4X4ocBY/vWJNaxwmvGbEF92SXoiZl4hgm55GjYzDLut3fFW Wg== 
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com
 (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3hbmxs5qd1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 19 Jul 2022 09:47:36 +0000
Received: from pps.filterd
 (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
 by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.17.1.5/8.17.1.5)
 with ESMTP id 26J8ZgaD039175; Tue, 19 Jul 2022 09:47:35 GMT
Received: from nam11-bn8-obe.outbound.protection.outlook.com
 (mail-bn8nam11lp2168.outbound.protection.outlook.com [104.47.58.168])
 by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id
 3hc1k4k5nw-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 19 Jul 2022 09:47:35 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CWpFQG1rJq3NQ9lNa+vEws+LXQLR7uS8uxJZiV5OvV/A9xRqfXaDaa5jdF5+vKGn+u73T2zSAWMMVLHuCbNqyBvIwJMwlC88/GpPOIRQv0j65UO2IyRaZaT7n26VThvOyjAreZgeoZZoKrSqsiJT6MC3PbMTyZf2ouzk2VuM+neeT9kFYnj1BgkF1aybEHqAuxbSFabf2XzC3lER2fiyIC88YhE1vGbpOwynn+zRkg5CDkZKYk7eQGH5iFSXT4RUxmXQL/9b02qrPqtyg/hJqkSx7bLt+z5+4K8l94ohQvSle29SLZoZqVJ5JN59CyeumT5P3nUaoHptv7w6WuCyQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kdhJnyLCK8DSkbu7GqsCyw0bLTZMiqpf/PbSw4iE/JA=;
 b=DX3ORfIDxBe69oJzzZhfXbqrG9J/j55mNMBRSake7vvgg4q+kYVLlEScaytCNLS7Q2/huvEy+n6UaDoyfJMUY2gbJjvhCZYSYJ24V5G/LGSjad0n+TYsVXZFkfZ2JOF5JlRn0jYDgCx8IIaMymHEO9jZq1iCHH04ERUZ9Cc2570nSQtkUs1Q4EPabK/U8whDcjFeBg5lIDk2GziAlANoIY/W5FpHxTq7SX6DffCWgXgqLxNDqBpDm1qORHmQozEqt3Zrg0dD3mj44vcaSvM+NKaUGfvMZzb8fpMoHWsbCorDa86V8PlNBv+6dR2rv8MsFF8xxvMHjV0JdR2prrmisQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kdhJnyLCK8DSkbu7GqsCyw0bLTZMiqpf/PbSw4iE/JA=;
 b=BkHJHg5BJsJvvJq7/8Ua8uXrxEkSrftFGnVkocg2E3r+n2d/Py1Kv+pY1dZ/7VkoOIW6mmM++LclGucK1/Sk5FtsmnjAqTpefewhfmxWHGWKcNIJqHihY/ObznREVdKXdLhA+BfNmP3DyZTkcDVjbuvL2OVZfUA9tWN0FOBO4+w=
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28) by IA1PR10MB5924.namprd10.prod.outlook.com
 (2603:10b6:208:3d4::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5438.23; Tue, 19 Jul
 2022 09:47:33 +0000
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::5020:9b82:5917:40b]) by MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::5020:9b82:5917:40b%6]) with mapi id 15.20.5438.023; Tue, 19 Jul 2022
 09:47:33 +0000
Date: Tue, 19 Jul 2022 12:47:22 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
To: Zack Rusin <zackr@vmware.com>
Subject: [PATCH] drm/vmwgfx: clean up some error pointer checking
Message-ID: <YtZ9qrKeBqmmK8Hv@kili>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
X-ClientProxiedBy: ZR0P278CA0157.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:41::22) To MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4a301c71-2570-4369-31a4-08da696bb402
X-MS-TrafficTypeDiagnostic: IA1PR10MB5924:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: NB7QzLs7AD3eEfRLkJRx4NTt92Fr9B/sBHM1NHvr4JzgzdZxbEhhE0LHhPgJ6TUZkA+q+m/Rk4+HijZ4zWpbdVCYdEzesLLhgnPJ8QyIhH550ddMThe7Zyn46VvnFHIG0s97hZ0/8ZDQwULeqIWGzFaQM+/jlZFI13EOoZwWgB70aJCsw8gmoDL2tqKLFwNy7kgQpWxafWRyK94FT4I0utOmcyQnNKgVucPKrTl8S1DqVIVcHpaOhimXliFdenG+LNLS7stHvmj+ywiZVHbJmq1vLtmPZmOwmopBNc0NL98z2eOhpeW+SHHZBH8Im/eI+972nOtA5SvYb/ksCj44kzxfu3xK9ZSgAl4vpBKEkDYGJ4mu53ZZhekhwCaBFxZGch/w3pCl2Ia2UdFB6Z1/jLx5U64jdRobdihdOregy6x4joAF5I3Lt3jwkWT2q9TsYl05xdZA6K2MgA6WLd8u/InRLmPYppjOG5tRf3mxltKgz2lkeyIBUOehzonTkkjfP93Cc9LPLAMu8bv1N0nItQjB0blBNRuPIU/cyNZ8FB8RIRD/qQv+qpQMPA524EAP/4iaQh2U5eR8ddfu6+BYu8my9wfwGyDAOQdZrOhNlRNyYpU3TsvgieiIHr/wY+MMLsgzmH4K1NS2p10hPDbXfDsgcbwgegxCZefQN3DxA3hxvG7XuXhyuldf/g/rQVs2bFeNLj7JzS+8OrZLX3KKWr2drA0lcVzkMWTqTrYUJHasLCQbHPsw/JVJcj0P6K14u6df9W7++vXeEt42PGoNBV186I47GmMWCzjnvx3VhJxlj7VHIoHe683hUQsIJP0s
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR1001MB2365.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(7916004)(376002)(136003)(346002)(39860400002)(396003)(366004)(86362001)(478600001)(6666004)(41300700001)(6486002)(26005)(9686003)(186003)(52116002)(6506007)(83380400001)(6916009)(316002)(6512007)(54906003)(66556008)(66476007)(4326008)(5660300002)(8676002)(44832011)(8936002)(66946007)(33716001)(2906002)(38100700002)(38350700002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?vGcZG6fHQKpqtrsSMJNRsGfPUHfUc6B3/weynxwtrrXsYByCFT3SmFjtPSQf?=
 =?us-ascii?Q?Us84D2j0ltf/xqkJCSFMNtVBvqsdPEnsw3NjdQeHhvqreom8DpKg+MunS9lg?=
 =?us-ascii?Q?aZs6U8Tqw8HtybJee1sWPWm5JYKF1fCBGFMVKKgRmaW2Vp+l/PK82W17NDnP?=
 =?us-ascii?Q?yguIiRylvZyl1Uqpt+ItntdY0IVjRyOqWfCYv/3cQTmNyedog2RtJ3CFOp+t?=
 =?us-ascii?Q?AE2q+Cs9AJLKaeGcovcBo4XJlb7fz62T+lXtGytB8OmlAjI0xmPMBoDjfjH+?=
 =?us-ascii?Q?raoSrnKcEq/WSkyZnPJ9tWwMvKtCRYvfwTwTr71JhmoyCZDuPGSGpgZVUUjz?=
 =?us-ascii?Q?QeYsOaddNCRxusdAu+jp7sl+IDFoxvrYm/gwH2YpRViQqzk7Lcs9FX63X8VY?=
 =?us-ascii?Q?Ib1Tow6om/fj3+tEtXtJfTWgHLg2wLvIh7RoWnveSvEqqIycN/6Zm6Cn4LCu?=
 =?us-ascii?Q?G0LFaM+q5gdrDozBln2wFaX+XCYpyzvLyMwPn+QWRONgzAFbgL5We8S/OOQm?=
 =?us-ascii?Q?uTD2aSc2lb+tQa7ayaJqWeuUBdMjdWoxj+d0XszFm71+Ux29Ef62orT4Zf+A?=
 =?us-ascii?Q?BCmB1ErSsNJMeUOjdlYE5oHLpYB38bGKMOwoXGicYVMaORdqUHT2fVpz7zuQ?=
 =?us-ascii?Q?6LRmTTVnAlnhNxwMkAgeB36vwYBOwl+I5/0QAuvaf/NzRiHNtHgW/LCn61Jt?=
 =?us-ascii?Q?7x7M/AHjJ8Fjzy8bbpH1ai0AWNWmMRb0LUhHTLpIsiS6uX+vuJ7DN4i6OW0D?=
 =?us-ascii?Q?9xYxLb+S8iVwIUsV/V8PFshHKQEc84JyAC2ZivUnY9dT/+avjZpkgPOszf3Y?=
 =?us-ascii?Q?2p513HpivlJ2+5bDRjxDzUlLtlKUrs21m90RSNq0LWh2BHpMK04GuLwWDsy4?=
 =?us-ascii?Q?gwiQiElL0dUmq6cXEVRny0tTgncdDIf6RCpR+yrUxBomEaW/qSEAHyt3pVra?=
 =?us-ascii?Q?NTdusuqqnBYeQetUWmEZ7ps4vtFhDC/52C5G9oJcwcg5/PY33NxdYWKIxVAX?=
 =?us-ascii?Q?XCmH6oBk8G3w4jqDYTZqy5KpRqYEMmCTIVeKA+1j4ZMVDg9Za8JjYU4QX6Tb?=
 =?us-ascii?Q?BiUir76VuriowC515aT7ESQla7r5BYyJeMFVdloA/8q4Jt9vYhqXP1DbbtsD?=
 =?us-ascii?Q?fzYgiLw5+fXtZAtIjiY8i0iJ2ZCEYAsnMRxh+5jQ1TORwvSyB2ngdql2jviH?=
 =?us-ascii?Q?ZqF1Uyq3ijmGtaxUzO1LhwVPoEqd8JHitNOkb5epcyb6i4CkGSbO0c98jBoE?=
 =?us-ascii?Q?Ojut8fLjf6uY0ZbGWPgUpEMYgvKEpufkR1lJYk3w4bcbRMza+DmXJTQvXXH9?=
 =?us-ascii?Q?FKrBhyiVEmNPzBJsdPzA6EFs41QmuzYYyRZXP8ZVCUgdgn0vbPi0TzljNiKs?=
 =?us-ascii?Q?Z0rHeXvTUoqPdPQ2FUo/ZQSllUEPZWanJUciKSaef+r591+UuvGthXeyhzft?=
 =?us-ascii?Q?wO8RlCcRPRRW4i/RecUhzyuld64Y+ssD1FgFIoTk6Njg0nouO1vSTDrlZh/p?=
 =?us-ascii?Q?oCK9aKTWxy63dpCGW4/DpC8MI7EzwPFC6fEJ77UKB3WX0BRhPKAq4T/B5MHn?=
 =?us-ascii?Q?Wks0dnmuaBK65ymK/8fgKgDdBIFjmgR2UUHdxmHgwdCbjoFiISSlYs7PAsWT?=
 =?us-ascii?Q?+Q=3D=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4a301c71-2570-4369-31a4-08da696bb402
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1001MB2365.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jul 2022 09:47:33.2399 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PeQD0TaGiPzxN/jswy6zcDUQlOxJ4nTQqsR+YJI8TJlZnJgsSjEIkz+Aaw6VcMOnZTQEvOIRJmETbT4pDQsj+o2A9txV0H8z4dXel/ZN9nI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR10MB5924
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-07-18_22,2022-07-18_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0
 suspectscore=0
 mlxlogscore=999 malwarescore=0 adultscore=0 mlxscore=0 spamscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2206140000 definitions=main-2207190041
X-Proofpoint-GUID: _uADklidL_2FQznhndLdatrlbcTw60Zj
X-Proofpoint-ORIG-GUID: _uADklidL_2FQznhndLdatrlbcTw60Zj
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
Cc: David Airlie <airlied@linux.ie>, kernel-janitors@vger.kernel.org,
 VMware Graphics Reviewers <linux-graphics-maintainer@vmware.com>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The vmw_user_bo_noref_lookup() function cannot return NULL.  If it
could, then this function would return PTR_ERR(NULL) which is success.
Returning success without initializing "*vmw_bo_p = vmw_bo;" would
lead to an uninitialized variable bug in the caller.  Smatch complains
about this:

drivers/gpu/drm/vmwgfx/vmwgfx_execbuf.c:1177 vmw_translate_mob_ptr() warn: passing zero to 'PTR_ERR'
drivers/gpu/drm/vmwgfx/vmwgfx_execbuf.c:1314 vmw_cmd_dx_bind_query() error: uninitialized symbol 'vmw_bo'.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 drivers/gpu/drm/vmwgfx/vmwgfx_execbuf.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_execbuf.c b/drivers/gpu/drm/vmwgfx/vmwgfx_execbuf.c
index d49de4905efa..f085dbd4736d 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_execbuf.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_execbuf.c
@@ -1172,7 +1172,7 @@ static int vmw_translate_mob_ptr(struct vmw_private *dev_priv,
 
 	vmw_validation_preload_bo(sw_context->ctx);
 	vmw_bo = vmw_user_bo_noref_lookup(sw_context->filp, handle);
-	if (IS_ERR_OR_NULL(vmw_bo)) {
+	if (IS_ERR(vmw_bo)) {
 		VMW_DEBUG_USER("Could not find or use MOB buffer.\n");
 		return PTR_ERR(vmw_bo);
 	}
@@ -1226,7 +1226,7 @@ static int vmw_translate_guest_ptr(struct vmw_private *dev_priv,
 
 	vmw_validation_preload_bo(sw_context->ctx);
 	vmw_bo = vmw_user_bo_noref_lookup(sw_context->filp, handle);
-	if (IS_ERR_OR_NULL(vmw_bo)) {
+	if (IS_ERR(vmw_bo)) {
 		VMW_DEBUG_USER("Could not find or use GMR region.\n");
 		return PTR_ERR(vmw_bo);
 	}
-- 
2.35.1

