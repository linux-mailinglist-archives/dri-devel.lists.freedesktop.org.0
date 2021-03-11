Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 95FAB337C54
	for <lists+dri-devel@lfdr.de>; Thu, 11 Mar 2021 19:19:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EF31C6E051;
	Thu, 11 Mar 2021 18:19:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam08on2058.outbound.protection.outlook.com [40.107.101.58])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 607F36E051;
 Thu, 11 Mar 2021 18:19:14 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ezPt7mYvkz5FIdUZB4iaCyyBZrRce+dj5AtY/VMvOkgnTa9BVAKp3quVLWu2MnKu2csZTbbQWoD3lQooSBmiqGYOsQ4rvdIZFepCSwPpuGy8cWMq1ggI2DIs9U3RKpJvohHVgr3J32Z3mUYMBg4czqWTBSd+JFHsZ22bB1UMi0KVvR2CW0tTV5vmCCzjqgGtxIoBi9srYZ/H3c+1ycWMkU1evoU+JoxK+t+zxnMr5XJPioSz/uvHwZFHK33CtHU8HL2Ba3ZpFe2kYWbjLdZqd8R9ITBfPMOy7CB/3RLvy2MMvGriBW3jiTGpYk0OsNBTYSEY4Mav4giOgPIntS+HPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lhCTF1iHHaXxVx7D6NhxRc1hfBeU+GUN8P2CGU0bXEA=;
 b=OQupSvcQK7ax3rOnXNKuZBhGEjpZ0iujt9bf7zQzFRTTUPwrbZPxqz3TpULxd4KpcKUkeOWlK8iMM216xL3U/UTkMlRYUgh0spXO5mZ1RVTz1D416ir2yK2vJpQYOysCIQ18xG9oDX5WfZUY367BhBrxSjq5cS0pzM/FMioztRuElRMrsCxH1vjsj/XSKmasdD6byeQVp1nKOMS4JTo/dqj2n+F+BCtcbJ7pSs295Va4+wQBIOU+LQR6qxNx00ZxSiH+zaHzwgS2rMalOEVsgxxePZe3nDrt+MByi1Y0N4QakfCizhNINDd7pEQUjNkS3InXPMizmBdJQXC+lOyvmA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lhCTF1iHHaXxVx7D6NhxRc1hfBeU+GUN8P2CGU0bXEA=;
 b=swBNSkBFzsbOiz6fg5PgegBd26MYdDIUF1No2qpAvrY0uY2eTO253/uFNSZ6rTKx/JUEHEBik4IFbuWErB9eXrysPQ3aSfXnP07eNUrD3drUlHu2t/zuPM8xVb/G32Ep1qRui/HEuxtTycJd+NxtJzRIiVUaUTRcz90a2v0jwzc=
Received: from DM6PR12MB4108.namprd12.prod.outlook.com (2603:10b6:5:220::18)
 by DM6PR12MB3628.namprd12.prod.outlook.com (2603:10b6:5:3d::26) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3912.18; Thu, 11 Mar
 2021 18:19:11 +0000
Received: from DM6PR12MB4108.namprd12.prod.outlook.com
 ([fe80::c947:3e87:e1c7:ad01]) by DM6PR12MB4108.namprd12.prod.outlook.com
 ([fe80::c947:3e87:e1c7:ad01%5]) with mapi id 15.20.3912.031; Thu, 11 Mar 2021
 18:19:11 +0000
From: "Bhardwaj, Rajneesh" <Rajneesh.Bhardwaj@amd.com>
To: "Zeng, Oak" <Oak.Zeng@amd.com>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>
Subject: RE: [PATCH 2/2] drm/amdgpu: fix a few compiler warnings
Thread-Topic: [PATCH 2/2] drm/amdgpu: fix a few compiler warnings
Thread-Index: AQHXFia9Jad3k/JmIUCPgn8s4YGaBqp/GYRw
Date: Thu, 11 Mar 2021 18:19:10 +0000
Message-ID: <DM6PR12MB4108DC6A5354731152CCCF73FE909@DM6PR12MB4108.namprd12.prod.outlook.com>
References: <1615433344-16267-1-git-send-email-Oak.Zeng@amd.com>
 <1615433344-16267-2-git-send-email-Oak.Zeng@amd.com>
In-Reply-To: <1615433344-16267-2-git-send-email-Oak.Zeng@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_76546daa-41b6-470c-bb85-f6f40f044d7f_Enabled=true;
 MSIP_Label_76546daa-41b6-470c-bb85-f6f40f044d7f_SetDate=2021-03-11T18:19:01Z; 
 MSIP_Label_76546daa-41b6-470c-bb85-f6f40f044d7f_Method=Standard;
 MSIP_Label_76546daa-41b6-470c-bb85-f6f40f044d7f_Name=Internal Use Only -
 Unrestricted;
 MSIP_Label_76546daa-41b6-470c-bb85-f6f40f044d7f_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
 MSIP_Label_76546daa-41b6-470c-bb85-f6f40f044d7f_ActionId=8bb4ce24-aa53-40f3-82fc-f9191173783c;
 MSIP_Label_76546daa-41b6-470c-bb85-f6f40f044d7f_ContentBits=1
msip_justification: I confirm the recipients are approved for sharing this
 content
authentication-results: amd.com; dkim=none (message not signed)
 header.d=none;amd.com; dmarc=none action=none header.from=amd.com;
x-originating-ip: [184.148.68.141]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 554fd83a-7c08-4692-9b44-08d8e4ba2b11
x-ms-traffictypediagnostic: DM6PR12MB3628:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DM6PR12MB36287D8FD629E9C0DC71F151FE909@DM6PR12MB3628.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:207;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: SV1XTm54/5FCO11auOIr78l1G5Dpp19IMcIyK5LrXljggEskhZ0jDR0t1vLQnFMpcIOwmz21/mb95bwy/HUGO3wosg6DSB2Q3ow/41dAQnPzXoEqTCek5WfRVkPvMTP84pBWjTwoHlSXyn0NlfytLBBBEZ+oAZ+dieFfFl4/GjCGs4Aw2k0xV0LmhV5vaFAba23O+8jYjB97QBi9vuE64iEhGi6Be5qgMeBFAKt7EnBvTFzUxOstblwMg4Ujint0wlags6GXbwh4RFPhAMjJN8Rq3fZy73pGMAMMlxQNgtKz6nqKhBnpR+i0noX9Dt9J4t6KOJltreSc1gi1uneGYzNSUwJkjYjUg9XS2p8kFXWcyxSMzPB2yE5E+/e609Sn61C41g/YXnA4ol75iylCrDZkfDExcAF4oxc9KIKA007MmkgfAhilM5ygXEazXsnu78j3O5nfbMf+AWF1ObSa3zSr2mygNyUCP13Jxqk20UNDi+EQyamWCslMSOyP4fiZde6FSB8S52zTO41hzEjqOw17/7CNWrXrT8M6Jk1mM8vBQ6Bf/RRxpMjx/w3Uu3j1
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR12MB4108.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39860400002)(366004)(396003)(346002)(376002)(136003)(2906002)(66446008)(64756008)(66556008)(52536014)(5660300002)(86362001)(4326008)(55016002)(45080400002)(110136005)(83380400001)(966005)(8936002)(9686003)(450100002)(53546011)(33656002)(6506007)(7696005)(76116006)(8676002)(71200400001)(66946007)(26005)(316002)(186003)(478600001)(66476007);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: =?us-ascii?Q?PSoRAwGtOhndiutTpyEn0fVeLSnYde2S+fcuF87myFsWSJQ+l+fnC5Fgxf3B?=
 =?us-ascii?Q?2D7VJnbloXk2mgmCbWURFPkMERJieP7yXc41pqI8D2AyF+l6Qug0GC+EWYN2?=
 =?us-ascii?Q?Bndv/w3Lq9Y+aNxOdY7CMyscFIhwp1/qSLUlBE8OGhJku8M2a+DhwFqdmMpr?=
 =?us-ascii?Q?tGVnPFJX2cWdnxM/2nTSkVZgknvOa46vFH9XDzqdq7hp8jyHwhR/1aqvxs/I?=
 =?us-ascii?Q?PAw44ANA6O/+y3bpIIkPF2AV+LqGsfkdHjrEghlJo/nOcymB4oGwxY+ZGkyW?=
 =?us-ascii?Q?nrzCqmKu9ikFrUq8JBwuQyfU0/j2m8GWJbYqbho+BVqmn+RPlJ+ZNK58sCpJ?=
 =?us-ascii?Q?DnqE0oZ5gdc1TNdH98ekiBbjRki9eyGHnc2+03+BrllBFJyBftybezz3nXQc?=
 =?us-ascii?Q?qnEI/T2SKTWRXR+cljztEYEn2PSRnMnjjT3C6Wt40xZugP9jtKkmO4vhUr/4?=
 =?us-ascii?Q?/aJPhl6BZ3039f5o4eVkIw+yc4w1KDOIlrHvoOfBALOksltf53yjU3PcZal4?=
 =?us-ascii?Q?xu9fKNhLdWICjgXPPZQmvnm1EyCjZN8kjz2SEPEFLsdzMR2duWqop2TqkUpd?=
 =?us-ascii?Q?eTb3vw9pYQ9n/LUDTIZ5coRFqRnNPqoQlIzijMUBCTatn666PEs+cqM8Wj+m?=
 =?us-ascii?Q?BdAB7bOrNTPtNZASMEwqYeT+CoQh+Z1nykDO+pMO7nZ1tWD2Gk0gxa4rVPso?=
 =?us-ascii?Q?+BUd+G4TlEvyEwsS38dKtyHUAbMi2WglkM4fXVYNSi+YxrnBrvqijBGWw5sl?=
 =?us-ascii?Q?Glsjf+nMTzW3j1R0i8V9U1jgM+QoDWAMZSep3lYgpuH+ooPte8Ap3bpInF64?=
 =?us-ascii?Q?ldo9rlzXSppwKDZeepino9WXMsxz9YFINA7mb5AmztZG0icFivPsHcEmCqbk?=
 =?us-ascii?Q?GXvaWBYfO2Eh0FUQJvuAp0Zql75WWAiOoFOlA4eAL9YVpQyINVwfSZyhlk34?=
 =?us-ascii?Q?9ELjj/1Hj4hPU5xDFLrYfsgxePVxBZzqBVlzm72dgGa5SEEAhlRvAsYksWTO?=
 =?us-ascii?Q?0qGtNqEXIhPTfFVu7ECiwY7U0yBpsrTFvPcwllC5ell6Ks4hgpyvInHqUuUY?=
 =?us-ascii?Q?5CPA32KEid0uAcYhXKYoi8VUkhqlK24qirbcnmi38kg3tSePvp2/VpB/+zAA?=
 =?us-ascii?Q?YNeNGfk+LKqHMDdmq1yVDyY53MQrrZ3KgHhAEm1hIrjfg8pjJLGNx8Tmlsfb?=
 =?us-ascii?Q?kr++i7dqYrc9KMqRK49PCREEoQSkl0J2ALKcNWXQyL53aFNmFkeGgPrdMkFt?=
 =?us-ascii?Q?GNINcfbDRhN6r/8wBKFo2fl4Fgaf5YsVK4bELHfFJJxL/CVn3ksYtvFJzq54?=
 =?us-ascii?Q?y9DwxS9GrCK5/nyn+p/Hvu03?=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB4108.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 554fd83a-7c08-4692-9b44-08d8e4ba2b11
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Mar 2021 18:19:10.9344 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: D/+0z/VEc4pOEO9cQbUNwdJ5sV9Xdf781eERFt0LB8rpW1Bn+y524KdjDYuaiAGSoCdf1tuMDkKmEYRTQH8vgw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB3628
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
Cc: "Zeng, Oak" <Oak.Zeng@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

[AMD Official Use Only - Internal Distribution Only]

Reviewed-by: Rajneesh Bhardwaj <rajneesh.bhardwaj@amd.com>

-----Original Message-----
From: amd-gfx <amd-gfx-bounces@lists.freedesktop.org> On Behalf Of Oak Zeng
Sent: Wednesday, March 10, 2021 10:29 PM
To: dri-devel@lists.freedesktop.org; amd-gfx@lists.freedesktop.org
Cc: Zeng, Oak <Oak.Zeng@amd.com>
Subject: [PATCH 2/2] drm/amdgpu: fix a few compiler warnings

[CAUTION: External Email]

1. make function mmhub_v1_7_setup_vm_pt_regs static 2. indent a if statement

Signed-off-by: Oak Zeng <Oak.Zeng@amd.com>
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 drivers/gpu/drm/amd/amdgpu/gfxhub_v1_1.c | 4 ++--  drivers/gpu/drm/amd/amdgpu/mmhub_v1_7.c  | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/gfxhub_v1_1.c b/drivers/gpu/drm/amd/amdgpu/gfxhub_v1_1.c
index 3b4193c..8fca72e 100644
--- a/drivers/gpu/drm/amd/amdgpu/gfxhub_v1_1.c
+++ b/drivers/gpu/drm/amd/amdgpu/gfxhub_v1_1.c
@@ -88,14 +88,14 @@ int gfxhub_v1_1_get_xgmi_info(struct amdgpu_device *adev)
                adev->gmc.xgmi.num_physical_nodes = max_region + 1;

                if (adev->gmc.xgmi.num_physical_nodes > max_num_physical_nodes)
-               return -EINVAL;
+                       return -EINVAL;

                adev->gmc.xgmi.physical_node_id =
                REG_GET_FIELD(xgmi_lfb_cntl, MC_VM_XGMI_LFB_CNTL,
                              PF_LFB_REGION);

                if (adev->gmc.xgmi.physical_node_id > max_physical_node_id)
-               return -EINVAL;
+                       return -EINVAL;

                adev->gmc.xgmi.node_segment_size = seg_size;
        }
diff --git a/drivers/gpu/drm/amd/amdgpu/mmhub_v1_7.c b/drivers/gpu/drm/amd/amdgpu/mmhub_v1_7.c
index ac74d66..29d7f50 100644
--- a/drivers/gpu/drm/amd/amdgpu/mmhub_v1_7.c
+++ b/drivers/gpu/drm/amd/amdgpu/mmhub_v1_7.c
@@ -53,7 +53,7 @@ static u64 mmhub_v1_7_get_fb_location(struct amdgpu_device *adev)
        return base;
 }

-void mmhub_v1_7_setup_vm_pt_regs(struct amdgpu_device *adev, uint32_t vmid,
+static void mmhub_v1_7_setup_vm_pt_regs(struct amdgpu_device *adev, 
+uint32_t vmid,
                                uint64_t page_table_base)  {
        struct amdgpu_vmhub *hub = &adev->vmhub[AMDGPU_MMHUB_0];
--
2.7.4

_______________________________________________
amd-gfx mailing list
amd-gfx@lists.freedesktop.org
https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Flists.freedesktop.org%2Fmailman%2Flistinfo%2Famd-gfx&amp;data=04%7C01%7Crajneesh.bhardwaj%40amd.com%7C8f296a25634a47c40dde08d8e43dde97%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637510301669209178%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sdata=ucX2H8f4HhlXKJ4OBcZZwjfBTBAXYDSrGpPF%2BK1JOLw%3D&amp;reserved=0
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
