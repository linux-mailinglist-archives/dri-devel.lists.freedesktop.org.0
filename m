Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CDA717BF949
	for <lists+dri-devel@lfdr.de>; Tue, 10 Oct 2023 13:09:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C50C110E1D0;
	Tue, 10 Oct 2023 11:09:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2073.outbound.protection.outlook.com [40.107.237.73])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9BD7310E1D0
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Oct 2023 11:09:49 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Cn+tBl05dXKlu9XLxK601qw+n0ZEVlOQfQ7gVxRMPciFsjsLZ/tf6r6svKzzALIEwOyUE/Ce+Lkgrbiwsys5Ddg3SERGFGhhBEN2LlTCwfV+ELtsnpoBx5MWKPRMBdohFinvSM8Snln34c0/BGw6kxyokGiQL6j1prqJBYiyXWMWGD1I/vG8f6TLEaFN65Mr/fG0HOgUfe09yfqTFDIiEfNl5pOokWhyMp2DyjoGEDJzhBSOXUyaeQ/lt5egdqbJlqYOZ6Qztj2HNTMiSOmnLvdH61dkVeyVgZUUBmXd95c+10u+zdVQJ9NRH6iZdn6SnJs5uwT6TZPcTmgVwUy/jQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/2qcP/tdYHKkItJBndzLFbKjN2xykQrph81mr+cFOnA=;
 b=SE7NZmivg4//6taRWBOWKv6Ww9Br4W7O/ZJZ50McE96fuwzn1ISe8u7StgcSVsFIMIhZsyXIzS39It4oZMw7kMxggLesXmheR798ckqWu8ero74vIQXO0KzPT2tnsg1NKHNPPHFLUIF8QoweY4S9YmI/uvDllG5b1m4uvol+WfqaHZQ7dq5R0JmOExRp+bJWBcKKU5JjZ5i6D/M7RmBxInNC/88EqrCycW3h60odF6ZGrNMg8Ya2HHrgqyQtufUCh7m53/H446KgDC+k3+oQI6lRUyM9UCt//ATEI8X3q81EN9ZNaoGM54r9nSn5nmAg1rRDVFzyhvpreXd8oYdZkw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/2qcP/tdYHKkItJBndzLFbKjN2xykQrph81mr+cFOnA=;
 b=MHsXx9Z/4REOqqa0iJTgt6kOlFxq9F0AP7kfSGpf6Ki72sFQ7AHrdsV3sgf91Mn4RPV5jjkm5hGcY6SchCyi99kF2WXegxCXjzgEpL6TfHvNVp2Shnh/aSQl85UNOCls7G0gwae7UbBcQRmXveOYjmxByG16g/0JRZ0k55Lx4L8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from SJ2PR12MB8690.namprd12.prod.outlook.com (2603:10b6:a03:540::10)
 by IA1PR12MB6627.namprd12.prod.outlook.com (2603:10b6:208:3a1::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6863.38; Tue, 10 Oct
 2023 11:09:46 +0000
Received: from SJ2PR12MB8690.namprd12.prod.outlook.com
 ([fe80::c3b:811:fd1d:c33e]) by SJ2PR12MB8690.namprd12.prod.outlook.com
 ([fe80::c3b:811:fd1d:c33e%6]) with mapi id 15.20.6863.032; Tue, 10 Oct 2023
 11:09:46 +0000
Date: Tue, 10 Oct 2023 19:09:20 +0800
From: Huang Rui <ray.huang@amd.com>
To: Dmitry Osipenko <dmitry.osipenko@collabora.com>
Subject: Re: [PATCH v2] drm/virtio: add definitions for gfxstream and venus
 capset
Message-ID: <ZSUw4IY+13Yfd+Tx@amd.com>
References: <20231010032553.1138036-1-ray.huang@amd.com>
 <245f993a-72f2-7834-34b4-345f97737be1@collabora.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <245f993a-72f2-7834-34b4-345f97737be1@collabora.com>
X-ClientProxiedBy: SG2PR02CA0069.apcprd02.prod.outlook.com
 (2603:1096:4:54::33) To SJ2PR12MB8690.namprd12.prod.outlook.com
 (2603:10b6:a03:540::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR12MB8690:EE_|IA1PR12MB6627:EE_
X-MS-Office365-Filtering-Correlation-Id: 8733a9ad-e760-4ae9-1846-08dbc981698e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Ff0obUu3k7LI7iwC8+j+pPTSbUw053ucXitLfEQdmhl12aTE9D/U0Sf732t38gcrjhRAuHc5aKG/Ig/70Ap4uBUC5EsHJgV7an2/uMAHGs+C9fCT+6ku4E2TcnS9xpbPE/gkwzg5COe0owTsSnhxNNR9boXPVs4AZwPd5BcYIu2ONBlbdyQYBN+pecpdFhQsdpLPqacyxaP40RBbRZDLFGkojJvne1k8xakNcam47KVt3XFeHhJMxPmbUAB+mWrtDJYOfyEQKW7LgYXsDl7kx52XtRAFkCYkfrLMe5LN04Bkm49c0u19PSdP5aU8EnrZj3QX9KmVru0E7mSl1Vaxq23uZ1gxzP6aqyEg9T6Z+rQzRrPLgCi2YbNnVJmXxwsNXsE6G0DAkEPPO7Q+/yVp1rMNZiH/INkdiInVCe/OMk8s2aIWCHgU0BX6iVzl9dht87+CC7IJksSCGvJTdhVH1vx0ZukozlDGky3LzEwFwXKUFJfq87y2VzNEh2AIfVB4I+GcHBUN0g3l7oBItameeX+xaQEVX2/lk1kU4dEZukE=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ2PR12MB8690.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(39860400002)(346002)(366004)(136003)(376002)(396003)(230922051799003)(1800799009)(64100799003)(451199024)(186009)(6506007)(6916009)(53546011)(26005)(38100700002)(8676002)(8936002)(4326008)(83380400001)(478600001)(66946007)(66556008)(66476007)(41300700001)(5660300002)(6512007)(6486002)(7416002)(2616005)(2906002)(6666004)(316002)(54906003)(966005)(36756003)(86362001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?SUvZ64aE1KfJAHLda60z83s7NmivTwgsWDT2F7gwj5nUayXLVelHeYdSJx/e?=
 =?us-ascii?Q?Fadm5jj5HS6sG4n5A8UxF+XD8xByYhfzwSJuNbjWP/Rbvs7zthABkdTFCU61?=
 =?us-ascii?Q?HE+MLvvl0ZTNWJl6MxBkRKLa/7H1q8Y4z2mpmmdBmbI2XxWSX2ZcMLCsXEtK?=
 =?us-ascii?Q?Cw9odFxlyBmPCzIeLF30j6yEvULmoyT0OG4yL/WMJhBKmrRE1Sg/e5dxRFsy?=
 =?us-ascii?Q?QmEpyXeEilP0GkUJRZ8EBIXOvhnBWflsaZNv8etGQfZoKGLN1mkB7WfOwaUT?=
 =?us-ascii?Q?5jfqfx3AQ7RvTgefm11StOBb+EhPWOY5rEPOxhvKNC7Kx6JZnlXCIEQ9VU1Q?=
 =?us-ascii?Q?QJa27G+WXW1oO2xbErS+0ozMzZ+57VoOlhJfEVlwLNE0DFhdWDZV/asYqVi2?=
 =?us-ascii?Q?KF2KDdyAAJ55/12s0WQQSSiariwvOxZdFklL881O2EPDWkpDcUV8aQCaA249?=
 =?us-ascii?Q?X/6z1AWG+X7EhXEOBQ7YsCSCBtaebu3nrk4USsPZBHWi0MJSqsVfPKvV+qei?=
 =?us-ascii?Q?k9DbrxkZIcTUR0pqeuVHMb8CsZcol7/xXuc8+LaKJiiwfAVKPd9ClRYLuc5b?=
 =?us-ascii?Q?8XoqVNByBrJtcY9w6TcFUvAzm+k4Q/HQbJbsTlu1oVj6XAQ23vTK5GsIbeQo?=
 =?us-ascii?Q?Z2mjJlUkYBYV/KnBngv79Nb2dU0FCFnwbxuCF6cpOzLqjoeiDjWeSxolyDn7?=
 =?us-ascii?Q?0w4TfK7mpUsVKsSJ3RKDiT9AgZz/sWguXo32ml7zXPqiKcs3VtfNTi/Sv34/?=
 =?us-ascii?Q?j6Pd5rkHVdB432o+cZUpnJ293raSA4eD6m8LfYCeNKoBm9gOuXLxDjNshrsJ?=
 =?us-ascii?Q?D8xoTJgmG2S/eX5ywmoHivrWf8+OjTWOtS4EFu2LRX0mjaGdWmcksRHpLk6z?=
 =?us-ascii?Q?W7vI7SXYE76bHxpW4wmWVABg90co0YV0CfZ1T+iC8atAmXn5uxsPm5syEAMi?=
 =?us-ascii?Q?MS9kvIJyZhdnenzO5RmfFiyIAoRKQAZzOhBpNDBCp2R2CsrDDufzBt1Beb5Z?=
 =?us-ascii?Q?PRo5Vh96kmD81fXYwFkSp5zrZo8t6bceGTCB04pv/oZxih5u7QHUolhV0e7m?=
 =?us-ascii?Q?eTwKZt/d3fwk1TSa0SA8l+ycXN4yR4XV6HpYmnM1miW08ZXCE5YeQSc9Jju9?=
 =?us-ascii?Q?HiGxeGZvpu5q/Ob1zq53z1jn/7Stq7y3Xa2iza5ZWt0M4z5sxEnHsPcQwpoi?=
 =?us-ascii?Q?RbY1JUYuDJulecAWNKnRnXv2utPJDpT7V/Wluxxx0R7SQ7c8DuJc+wqZ49T8?=
 =?us-ascii?Q?vZ/GHR1fETShSCYVMD2SjfssKxzCNjLRaQ7y8tkk9hCjA+tXjZcRl2fR08L3?=
 =?us-ascii?Q?Y6/oJnUA8h/8/Pd6clC2gCGIEqfGXZ+w/Mxo0Uj0ClbhIOIcQ4G7VpMm+Usq?=
 =?us-ascii?Q?hNEdaSspR+2Ps7cnpYZUesNc5ge3oQqg8YlbbU0/mCkCGIuDESwl99FjNrJj?=
 =?us-ascii?Q?TP+ebAKfXAqR9OjJvhMrOb6cbjOw6XEXyJSMpOzt/sJiiyapxK+Flzp2ZMFC?=
 =?us-ascii?Q?hDcPrm5EgGgHxiVqVgJB1NGpoHmaATWxNQJxz9u8aEKp3WDUFIv8u5PpNm14?=
 =?us-ascii?Q?BcjeHaJkyElm+fmLmUoeVQXpN0ARz6yHIaOmPg/w?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8733a9ad-e760-4ae9-1846-08dbc981698e
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR12MB8690.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Oct 2023 11:09:46.7189 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jDZtH9vXp+BO3Gqn26iQBvAs6QM30KIeVqwe0qcMt/teQnJMgtiZGxgkeeJyJmzVTHfIMXU/uxctCD9t1I10VQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6627
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
Cc: "Huang, Honglei1" <Honglei1.Huang@amd.com>, "Zhang,
 Julia" <Julia.Zhang@amd.com>, Akihiko Odaki <akihiko.odaki@daynix.com>,
 "Stabellini, Stefano" <stefano.stabellini@amd.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>, "Ragiadakou,
 Xenia" <Xenia.Ragiadakou@amd.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Gurchetan Singh <gurchetansingh@chromium.org>, "Chen,
 Jiqian" <Jiqian.Chen@amd.com>,
 =?iso-8859-1?Q?Marc-Andr=E9?= Lureau <marcandre.lureau@gmail.com>,
 Gerd Hoffmann <kraxel@redhat.com>, "Deucher,
 Alexander" <Alexander.Deucher@amd.com>, David Airlie <airlied@redhat.com>,
 "virtualization@lists.linux-foundation.org"
 <virtualization@lists.linux-foundation.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Oct 10, 2023 at 06:20:03PM +0800, Dmitry Osipenko wrote:
> Hi,
> 
> On 10/10/23 06:25, Huang Rui wrote:
> > These definitions are used fro qemu, and qemu imports this marco in the
> > headers to enable gfxstream or venus for virtio gpu. So it should add it
> > even kernel doesn't use this.
> > 
> > Signed-off-by: Huang Rui <ray.huang@amd.com>
> > ---
> > 
> > Changes V1 -> V2:
> > - Add all capsets including gfxstream and venus in kernel header (Dmitry Osipenko)
> > 
> > v1: https://lore.kernel.org/lkml/20230915105918.3763061-1-ray.huang@amd.com/
> > 
> >  include/uapi/linux/virtio_gpu.h | 2 ++
> >  1 file changed, 2 insertions(+)
> > 
> > diff --git a/include/uapi/linux/virtio_gpu.h b/include/uapi/linux/virtio_gpu.h
> > index f556fde07b76..327792658bdc 100644
> > --- a/include/uapi/linux/virtio_gpu.h
> > +++ b/include/uapi/linux/virtio_gpu.h
> > @@ -309,6 +309,8 @@ struct virtio_gpu_cmd_submit {
> >  
> >  #define VIRTIO_GPU_CAPSET_VIRGL 1
> >  #define VIRTIO_GPU_CAPSET_VIRGL2 2
> > +#define VIRTIO_GPU_CAPSET_GFXSTREAM 3
> > +#define VIRTIO_GPU_CAPSET_VENUS 4
> >  
> >  /* VIRTIO_GPU_CMD_GET_CAPSET_INFO */
> >  struct virtio_gpu_get_capset_info {
> 
> By the "all" capsets, I meant to pick up all definitions from crosvm.
> There should be VIRTIO_GPU_CAPSET_DRM at minimum, could you please add it?
> 

Sure. Thanks for the reminder.

Best Regards,
Ray
