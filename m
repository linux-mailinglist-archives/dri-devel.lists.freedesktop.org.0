Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7126554AFEF
	for <lists+dri-devel@lfdr.de>; Tue, 14 Jun 2022 14:09:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 590D010ECB4;
	Tue, 14 Jun 2022 12:09:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com
 [205.220.165.32])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 63AD810ECB4
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Jun 2022 12:09:15 +0000 (UTC)
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 25EBYWG9011677;
 Tue, 14 Jun 2022 12:09:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=date : from : to : cc
 : subject : message-id : content-type : mime-version; s=corp-2021-07-09;
 bh=ieURvTjibMbduP6XS3Cg5Rx9+Rquex7IiiU+78pyCoo=;
 b=XD/ZTT0Q4Y+hTJb8YTm/G9gYH+SuV29Ib8urgr5IsFBet6+4qsKJbqYYqLkQt4R/m+xT
 nSciCBOEZQrUt4lC0tQ3VA2TyP9jVfS3/l/0wEIXJG+nUR9zzbR5jUiZnu/TIkwizhG3
 QwdylJLhUGCDFpT3y/Y8UkzcDJmfdnMSHPWIAZRCquRBENWJFUIWgP7P3gP/IFyCdg/Q
 /gZysp3WS2h6JExGdDCpR1S4Qx4vUcza8d1jhHVh1STJu3+LB+8Y9QwsC+2Frz5NOd+v
 1G134gjO4bieJPmoXzexCu5+9AorgMvftcb4JCKZeqbTkmGAl7iHtGZ3/zecKGyDXepU QQ== 
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com
 (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3gmhn0dnyp-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 14 Jun 2022 12:09:07 +0000
Received: from pps.filterd
 (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
 by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.16.1.2/8.16.1.2)
 with SMTP id 25EC5jml010145; Tue, 14 Jun 2022 12:09:07 GMT
Received: from nam12-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam12lp2040.outbound.protection.outlook.com [104.47.66.40])
 by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com with ESMTP id
 3gpr7mtqv1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 14 Jun 2022 12:09:07 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EX3Cuqrf2/J/LyhUOJ/tazdCaNBJg9peTB+ZqPZZomzYwr+fsZiBQiWiKPjnbsXGNqJ2/n9URNK+mk/QgIWRNTIw2Yo0yoFGR1ZGJYxt2ton0xEhRiZcAUPCs0/PHT6osbr4u7sBoQAv9+gkv67C1Ju3fEXq0B2ex9ShuXptMEr+3DOku72alpEXwo1GO9DR+vQHbFreLKHtlZO16N00j1jmx75avu3U3MAg3+lJMtUbOh4Sw1a5Eq803NxxC4utPJ/eQYDMYtR+UWfgtpcxSDbrD/aUozWkFs8ybn6mWji3WUYMMYAXeAJeEweUeZ1BM4V4OZ92lI6KwlPbmCCK3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ieURvTjibMbduP6XS3Cg5Rx9+Rquex7IiiU+78pyCoo=;
 b=JQvUI2LhFOFusY6ZioChd+Jf3lB8SWkYSc6H2qcgFPS46DXxXz1bmb5HBJBuPlCy5Mwhqgs3Jd+pkWkEOZ+GQBLDib4P0eOTsDp66/vGArCfThn4NgSJMBHsfNo00Ut1/IjvqKQvmUI5iXHnKhrKKKVQuOeB36VsRiYIUo+ah6uOZDgREDIRfghU9G04W3tclV2W/OcQ9sZkPE/olNo/E3nAVPxG1Jkle/Ynh1rg3TrMpBo+2cBNOsrfoiHSE/fCrFJonlWOn/YLQ8wYU6+NnQJ1+CuFuorbNQ2PbzF315Ff7EbzvdHZWi0g+7ThjYZCL8GoEIGbVvd+rfL5It+iiw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ieURvTjibMbduP6XS3Cg5Rx9+Rquex7IiiU+78pyCoo=;
 b=yGx+Rsk7H2SN4Uk2fwOpLCJW/z6cMtqluQZfw7y0FrCDSgjSz2DBnpS8mFqNPK3q89cA/COx3mGyakZ/VbYKvbRTng02S62foIc3XnCWPRyBons/jm8wBjHBAZ6mJ8JTerdqcVwtsFQ+nGDWLSTmVPqtEa9fptNliUW5X2zb3ok=
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28) by DM5PR10MB1482.namprd10.prod.outlook.com
 (2603:10b6:3:c::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5332.15; Tue, 14 Jun
 2022 12:09:05 +0000
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::5020:9b82:5917:40b]) by MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::5020:9b82:5917:40b%6]) with mapi id 15.20.5332.020; Tue, 14 Jun 2022
 12:09:05 +0000
Date: Tue, 14 Jun 2022 15:08:53 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
To: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
Subject: [PATCH] drm: logicvc: fix error code in logicvc_layer_init()
Message-ID: <Yqh6VdNiDvJYMOQ+@kili>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
X-ClientProxiedBy: ZR0P278CA0009.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:16::19) To MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2c2230b7-bda4-4056-d8f1-08da4dfead39
X-MS-TrafficTypeDiagnostic: DM5PR10MB1482:EE_
X-Microsoft-Antispam-PRVS: <DM5PR10MB14825C777B476E6299F5F7D48EAA9@DM5PR10MB1482.namprd10.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 45a340xykyBYKM6hYuDr+eFN9MpcblypQnagQmLsqgTKdiZLbbOjU/zDudGcNxM2vllWM7xKspKI3NC56/SmlhmYxz7QgafcHGW0XHGdG+I23hac0KUzGJAD8/qF7QopJJaiE4zfu7RMdpFcpjHcf9fdOY98qMzLVAtI7Y0E+TzYr3quuKLA37kwXcmJIcRhFavKqYcxtVzgV4hR9VP9sjGh30ZbSl4yvrBnxvzC164k70jU4ku9VbtQOsLzpTQvfnPze0IM3C4pf12sy/+f+g5jZQZM4xGTFpYsyTpkg9DR02ylrIxzN+cYeBLiHGN4K1ErjmPdrWNS5pFiP69OVKRhx2NouiHpb8HK0NGyC7W2GJnruMDEaTjgnbAzXyhuh0YXHtpaH40JjslNt7B+fNywC8EtarqfcdnQgt5Fv1PBDdyvue8mT1dpwT7X8PjhQqU38tRYl3Ilb+IlfLyXll74XYHJ8rfyDc2znal6pPR5AzEejGAnqBjsOcCd/d7paRAAzOXhJ4m/b0PI+fvAlrlyLGwsCOQ22EjTyEbnPOJ1xjYLHNs0o+POJoWGD3RFmO1C/Y/LgR68dFiPouIFIlEbtVVmsk99Se/Zkhc1QYQ4wKOnOi643B1ddn0ueuYLsXK3Ys81XNphWKL2QAJmmKqrnP0ZzwAllkx3PkLGLw+S4EL3GyDjgu1EgbKn+xDd/4p52knuHiFIUqggOA0KVA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR1001MB2365.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(7916004)(366004)(9686003)(6512007)(52116002)(6486002)(26005)(6506007)(54906003)(6666004)(508600001)(33716001)(38350700002)(38100700002)(186003)(86362001)(5660300002)(4744005)(2906002)(66946007)(66556008)(8936002)(66476007)(316002)(8676002)(44832011)(6916009)(4326008);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?3XBi3rKzSGBHt6KEl1hnLQQcdpVHnJhy0XE6A1K0E/4YOGhEwwJfzm+E2qy6?=
 =?us-ascii?Q?CG0JE6IuKfPSI+7h8oHchNGvG7IOTVCge9WoX/2FIZMxyhyi56wFo7zvM1CD?=
 =?us-ascii?Q?zJJKNtAsR3vA0cwxURHyTDsI2C1euYYD8aDh3QYvD78J+MacQl7fvLW/81wp?=
 =?us-ascii?Q?TAlonXbJHV3iCyJJdHBHP13CfXWRk7BHsNcqBBOEpvFP0FzLyAJVMnAMRsWY?=
 =?us-ascii?Q?yfuJ+u4UB/M/VM0fK3dRrsX+uhSnMsrKc2ccP/SIlF4LdgIZFFlwnXbQf8MM?=
 =?us-ascii?Q?sJ73GqcLqnNFoZWEZVdUmh1GXpF/W4lkem1uFvPwYXGmn//ipTJp7r0G72Bx?=
 =?us-ascii?Q?/0K97x5nZqubnR1pI2HNLVFczno2/qpBWmgHwwD+sLQ5rg9doChFEXdVq/WO?=
 =?us-ascii?Q?nyGDowp4U+9NQoejBGwXt/TVYxxVJZtA0x7Vi5R4xw1OL63UlnSZyf5bLgor?=
 =?us-ascii?Q?JSR7VlP1PM/QuokbSgPSlTEJ1tsI5pSo2aIW/RHlgLii16QjZ9h0p3eqmmpY?=
 =?us-ascii?Q?6iadHNjO9RJ/ZNHK8GSniysCY4DriUzKszLnTFYwkpXFDQW4vGoSTqlEqLFq?=
 =?us-ascii?Q?0VhAi5uKOcRXphyKO0/ETNVHorxhM71LacP6l/aHuHPkEDlyxWl0pPhTyZ3m?=
 =?us-ascii?Q?WoqNUlh1gE3lj6/yanjqgsUHbSKUU/XDbhBgLDZ53CqqCqvWJePIp9wVIwKN?=
 =?us-ascii?Q?b71Uul4CzHG+gNXcxJeeXRKxApkhHMq943DxjvcI8R1pKfNQH0wGvt/nnXQx?=
 =?us-ascii?Q?PehioAdNHcXtjA2NVc9PqLJAchc9El6uZMsb1OJ542KkTaaguSkxamO9zPaV?=
 =?us-ascii?Q?SFg1ni5SWOt+oPWHaPHB//QGkVDL10A8NXbNLdnqX7Ux0UZO7Mr+KlL5KNKX?=
 =?us-ascii?Q?v1piF3yfdKgt5S5pTzu+/JOoy73o0SdsXu+6jVnuSf4/2Kd47VnqRKeOTviK?=
 =?us-ascii?Q?9U249kkJ9IgWwtKEWLpaqwCGKf6hR6wpJJRKYi7b6EfBFwFCMgHLrb6eVOjE?=
 =?us-ascii?Q?DF7lWQY6rlho1It8m/U9buSFtuZo2fzD/Jh2ldYlKqXsqR5rjGojm9Hsazr5?=
 =?us-ascii?Q?m29uEcFTQyLJx1/OALP3rX9QkexokOP8uFP+8qwhAjdZzxqaqYDmTE4EECH5?=
 =?us-ascii?Q?j62XSBL/LkPGssxRzlQI91pWTELwEWuFz+mHOJb2zCpVsQWuDXCGUF9IxyYF?=
 =?us-ascii?Q?wxXRNxcGwHE8dnhFxrqgf+BlFFfWoLhzEF7ix5pkrbcMPdwvCAKipx9kgqku?=
 =?us-ascii?Q?8x//YdAvTTV8mGeae4w8XWNCz8c4Yfi5KFFut1ER5w9xgMJO2wlQFSOM4E85?=
 =?us-ascii?Q?vN3dOIBz4Fsi7d5quizLlFmD5li/enYyftU/s1AjYVGvb84cUho+yxR6F4tF?=
 =?us-ascii?Q?VxOTIGVS5Kaz98NQ1pdBTbcJ5FRX7G5N/pUvsXPRJSU0yKfa6X3FiaydqpJL?=
 =?us-ascii?Q?kjrRbHghJY3zItQ+9ooT5STRZv3pVwVBZwastS+YNkCYZoweRfzZ0sA/ZtaA?=
 =?us-ascii?Q?XCXKoHaj9YEWTF6/5cU+l/EP0dRNASl6PFhOLqDm7JvV12ujG2xWAW11cU4j?=
 =?us-ascii?Q?CnYpIWg0Xx19rFLsKhlhTNkDR+QLl9IIfQRZSwBCtfZj3uCiXeE/Y07EmiyH?=
 =?us-ascii?Q?78uyEzC8M94QK6JohSDYOL5Vx4NzEsjIy9yK1KgeS05zsqMPUDMWDA88oywN?=
 =?us-ascii?Q?VjT1T5jGbtU2nY24EH5S9eTPdMFyPS7a6L468aETaxAjO4JotYMeG2ySwohQ?=
 =?us-ascii?Q?7hTMA7QwqzZwqLAywOyP7vW0RqPdqMc=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2c2230b7-bda4-4056-d8f1-08da4dfead39
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1001MB2365.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jun 2022 12:09:05.0877 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8pJmEFRiBN+m7cbmaqW7F9EqWCbNXoC2AiCJtHDgNpGvcoBXdE6k71bm0dhq9tpDjjJcM5plzelk5L9FG4IBe71+du8yr3hDIWkEWHJEc60=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR10MB1482
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.517, 18.0.874
 definitions=2022-06-14_03:2022-06-13,
 2022-06-14 signatures=0
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0
 malwarescore=0 mlxscore=0
 adultscore=0 suspectscore=0 mlxlogscore=912 spamscore=0 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2204290000
 definitions=main-2206140049
X-Proofpoint-GUID: kSXP_Rrm6ahUIwTk6eKb760brabRGdhy
X-Proofpoint-ORIG-GUID: kSXP_Rrm6ahUIwTk6eKb760brabRGdhy
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
Cc: David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org,
 kernel-janitors@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Return -EINVAL if logicvc_layer_formats_lookup() fails.  Don't return
success.

Fixes: efeeaefe9be5 ("drm: Add support for the LogiCVC display controller")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 drivers/gpu/drm/logicvc/logicvc_layer.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/logicvc/logicvc_layer.c b/drivers/gpu/drm/logicvc/logicvc_layer.c
index bae1c7f99569..9c94b67afbed 100644
--- a/drivers/gpu/drm/logicvc/logicvc_layer.c
+++ b/drivers/gpu/drm/logicvc/logicvc_layer.c
@@ -489,6 +489,7 @@ static int logicvc_layer_init(struct logicvc_drm *logicvc,
 	if (!formats) {
 		drm_err(drm_dev, "Failed to lookup formats for layer #%d\n",
 			index);
+		ret = -EINVAL;
 		goto error;
 	}
 
-- 
2.35.1

