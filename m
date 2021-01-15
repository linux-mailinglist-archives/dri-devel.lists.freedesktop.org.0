Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 03EE62F7ECD
	for <lists+dri-devel@lfdr.de>; Fri, 15 Jan 2021 16:02:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DAB1889D52;
	Fri, 15 Jan 2021 15:02:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam08on2061.outbound.protection.outlook.com [40.107.100.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5F10989D52
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Jan 2021 15:02:18 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NehHC9Iy69rwDNNr3ROH0p2y1yCdbryqtND9hU7gdiP/nEZp6NKDVn0dWu6jC4OkZWIQ1LF9Om7phxxFwknlZ8VXR0iSNkFOv7x1bUVHCM2jaF5sySR+aHteUq6FcxMiYNP+JOi2vAbxDT07e3v3Gsr+GAQa9MxrYiBeXXmRBQlcLr2il49FSjoNcOquOXgER8axIIbELtop/WQQBO4ozqvWMbPV4pjV/rXkzHhmKfIUCHmuPf6/GwnA2OMcLXHCB8vUxdUwrJqnWAIbqWrZG2JUWkybH0Ijs8iYr0rV/rGzbsT2DBuRs6uAq0o/J8ONPG9HhF5lJO8fdYPECY4Yag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cHkdgQThqXuZhDnj3OHb4q6VpVfuQwJNtHMvPWUUEf4=;
 b=Ho3qLmYiQ5qrI9jZeFokvSVIKdw3zTMsAzJiVOgx1RmwiFxFoR6n4Bn0Q851WJQyPDN+Vw8Xg7MeW68zgiTTG/bkbAWt3+nz8G1V0HcsnbGKmqOS6IBke1oX7RKd+nIlMwUb324pcWJOAxmlKbHsUMrIZwrEtYiAlcQ1ZJzfmIDhDv8EkKdnm7uW/hB/jiJcGwxANoPUcljWVhca7+Ipah7gvHVcQJ4PsvOVl9j3WHbIKj61cjpMcdAcl4lxJp9q2kadG9ppEMqo5PzJ50iBpG9E6t+yb7uA4FltKJDMPnVjHBW7sxlvTs0T7Ttb/xrd+IvRNwduneeqaEbmAunhRA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cHkdgQThqXuZhDnj3OHb4q6VpVfuQwJNtHMvPWUUEf4=;
 b=t8aU8pBER6ixB+/fF6UFegi33Hb2xEuXluYrcUSILW6CaG4U82xY0IVb1woDpib8jMPGvQmhKU1st1PrBhxNCHBo0AdDGyrN09q54a2J0xOoBee4H076fQ5Q31I352TsShjrHNTcPJIKfkxXFnxTAxG/lqfMIJ0aAgXzHN/325A=
Authentication-Results: suse.de; dkim=none (message not signed)
 header.d=none;suse.de; dmarc=none action=none header.from=amd.com;
Received: from DM6PR12MB3916.namprd12.prod.outlook.com (2603:10b6:5:1ca::21)
 by DM6PR12MB3259.namprd12.prod.outlook.com (2603:10b6:5:180::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3763.11; Fri, 15 Jan
 2021 15:02:15 +0000
Received: from DM6PR12MB3916.namprd12.prod.outlook.com
 ([fe80::f872:3677:28c3:660b]) by DM6PR12MB3916.namprd12.prod.outlook.com
 ([fe80::f872:3677:28c3:660b%5]) with mapi id 15.20.3763.012; Fri, 15 Jan 2021
 15:02:15 +0000
From: Nirmoy Das <nirmoy.das@amd.com>
To: tzimmermann@suse.de,
	Christian.Koenig@amd.com
Subject: [PATCH] drm/amdgpu: Remove unused variable
Date: Fri, 15 Jan 2021 16:02:01 +0100
Message-Id: <20210115150201.34256-1-nirmoy.das@amd.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210115122310.7dd6bb11@canb.auug.org.au>
References: <20210115122310.7dd6bb11@canb.auug.org.au>
X-Originating-IP: [165.204.84.11]
X-ClientProxiedBy: BN1PR10CA0004.namprd10.prod.outlook.com
 (2603:10b6:408:e0::9) To DM6PR12MB3916.namprd12.prod.outlook.com
 (2603:10b6:5:1ca::21)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.amd.com (165.204.84.11) by
 BN1PR10CA0004.namprd10.prod.outlook.com (2603:10b6:408:e0::9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3763.9 via Frontend Transport; Fri, 15 Jan 2021 15:02:13 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: b8de4114-e5bc-49ba-ea6c-08d8b9668b73
X-MS-TrafficTypeDiagnostic: DM6PR12MB3259:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM6PR12MB3259567EBAC814353BE9FAD78BA70@DM6PR12MB3259.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:418;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: pHqRyiViCsWD+Pp0riGTYvOoe+uWALvP6horZcjIQLVSja57WPuDd8rrX6kkptOVFiyZ/+NaCIASbtn7VDCiISUgz8VDX51Db8SW5n642HpSanrrUGtuiW/ci3MIBSVEwJA7kp4ivPyMadp+9g/Cj7nTlLFZ1faAxWJ86ZRFBlLwaD/Zr3z7BeiUM80Xa81JVgVYhgNAqv52CvJwOe8WP7Psgcp4Pj76B8bjYdeNhilNBbBukjcfcu/GoABW3LrXwzy693tCH/d3QMryf2D+oq0d6aKdMTuaO4cKvDbmD7TezW+SHf5M/Cix0Dl0H69ThM5OFlSzwaXYuPCbYK5tu8X1f5iduPZJX37D1joyXTYJ+/qxf9xxksy+8T6mbTjD/o0a9u8vgGgIiQCmK5KwkQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR12MB3916.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(376002)(346002)(136003)(39860400002)(396003)(2906002)(6636002)(316002)(4744005)(16526019)(26005)(44832011)(2616005)(52116002)(956004)(86362001)(36756003)(6486002)(186003)(6666004)(478600001)(4326008)(66476007)(8676002)(5660300002)(8936002)(83380400001)(1076003)(66946007)(66556008)(7696005);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?9/Gd5TISPZLfmoRNvUkOzWqbMsfpf1CU3TiCDT9xrDitUlU+Tik9tCah2J2Q?=
 =?us-ascii?Q?HpTkK4oBDdaCysT7e4LRuKxpp9X0V+yS980K0TLHBOE/iTFT2+eK3LB62uzB?=
 =?us-ascii?Q?2qsLTZRe08MKnsrcehBIGqLfNu8Ymg7siWOUGlI6CtjCkzbpRby8ePF0q7Sk?=
 =?us-ascii?Q?KKPJWQN2XJhaWH+uNUMcttd7yj0fP1lgO5zSleWejdgaqLhyD8/40ltK42C6?=
 =?us-ascii?Q?WNwXx6OBCwmfURnLamGVsnX1eqcb2tr0NQt5kGirUodb5x5/l/dLB73UNsXl?=
 =?us-ascii?Q?MhPsIzL1C5BXDXHKxRxby6hJD4LbrfGHQ2gMlpDzurMB4e+tbTRK4F1e1s5M?=
 =?us-ascii?Q?vib7VJz4+htFSZtPV/OWuIM1ilw+hz0L/gDMwgheaScJsZCo2OG5nSPXAbxd?=
 =?us-ascii?Q?9U3hzJm0iZgdaoHDEpUqDJmS3rTC3zdcYA0oxv3f9PdF2E1RcUZiIodcsioF?=
 =?us-ascii?Q?tzWjw9wMGkiq/tMBuZwNfdE0QZyCSYYVBDT8I/Vo4s4NlFJYxGR/HqoJMfKO?=
 =?us-ascii?Q?wArGxkhxPyI7GwTmdQ/vZkDEp/J3Kj6t3wH69qHx6N+LSsiu/pbhlP6wBhCP?=
 =?us-ascii?Q?iakVITaiq3ElkRqsfofebiLUKXiOwtgpcu+eHE286qwdGTAWIqT3GOk11unb?=
 =?us-ascii?Q?3CQ2NQLgEoeDxvti60EN+uWTQiwnfI6okpiAniozPPY4X7z1g5ABe8aDyAbX?=
 =?us-ascii?Q?yDxG3OONh3loGI1nFyXIJuu5ilbKtdR8gfx0KQM+wnAoOJ4E5zPYXDdzHyS8?=
 =?us-ascii?Q?O+IvZwynfE8n64PIxsoUP7RXomo8WPPJ1TXbVtlk4mqoyR59o1/0RLZZDjmD?=
 =?us-ascii?Q?jktixc0wfRPTqTjgFk/Mtme5kfdNynl9yYUsMfv4ZdAO6OPolJl3jizHHt1z?=
 =?us-ascii?Q?I2Ufaa0cgqsBDOEfRnDuq+Q7XQxt6Y10/1FHtipaccM9MNR8zyP3m+WVx3Jd?=
 =?us-ascii?Q?dzvCzdMaW8tTRsqf1w9eqYjmWrQWIAseBCOTsnUop0qwKVH3Esj1U7SiREFd?=
 =?us-ascii?Q?jNHt?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b8de4114-e5bc-49ba-ea6c-08d8b9668b73
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB3916.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jan 2021 15:02:15.8692 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9sMFwor+Ffia2hpvh43nZMjElM5UzKB46IYg/TgnIn07GILh5z6FGmMTlTv0/VGC/cm7OUgLSIlqxGz7LEwn1A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB3259
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
Cc: sfr@canb.auug.org.au, Nirmoy Das <nirmoy.das@amd.com>,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Remove unused adev variable

Fixes:   8f66090b7bb7 ("drm/amdgpu: Remove references to struct drm_device.pdev")
Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
Signed-off-by: Nirmoy Das <nirmoy.das@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_display.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_display.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_display.c
index 0150a51b65ef..f764803c53a4 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_display.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_display.c
@@ -926,7 +926,6 @@ amdgpu_display_user_framebuffer_create(struct drm_device *dev,
 				       struct drm_file *file_priv,
 				       const struct drm_mode_fb_cmd2 *mode_cmd)
 {
-	struct amdgpu_device *adev = drm_to_adev(dev);
 	struct drm_gem_object *obj;
 	struct amdgpu_framebuffer *amdgpu_fb;
 	int ret;
-- 
2.29.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
