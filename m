Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B9F34ECEBE
	for <lists+dri-devel@lfdr.de>; Wed, 30 Mar 2022 23:27:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 824BC10EB26;
	Wed, 30 Mar 2022 21:26:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-BN1-obe.outbound.protection.outlook.com
 (mail-bn1nam07on2082.outbound.protection.outlook.com [40.107.212.82])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C835110EB26;
 Wed, 30 Mar 2022 21:26:56 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nvnPJnmlcm9gCKGmvMZDT2hkGwD/svGGNUWYCQRKAEZyJIRYOhbjEb+rq2LCN3TRXBMGzFDjxAotA9EVp5LkqzqXVcPVHiDp5VIwOQNDuFRbiDuVeKxChn6fbfEaDU75c4tGgdS8hPMhy+uegYw6aF81VDCuVCvjWdAkTi21zIxYhnlGmNATumbAL0SqFgsfH1eEAdz9qzAQdQs2wvtqRBiU1ppbDeyOP20F6cTf5PgEOL4sA4rLzd3D563NBCzmYOAuB4yxgcdyfS3Jb/DWN/0v4jgwts1fPFtnLXgLQbv7e9o8T0/rK9T9JLYk3C92Qx+NP5LqSf3KQgOjIvYr+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Jch77uFPKavCJ87fmaxrzM2yw3kdfmHVLjyFI0d1xfE=;
 b=apGSI1LrBVkoLTAHDdmsAIsPHv4dz6vgaVfmUeShwUuBmZURJMUHRJNm3ptald6yvv1eK2cSKTufWjWa2nTZbiCpJ7YXRPtAmG3GIpXm+2FdJdpTqiF/L+CfWqQx4tfPfxjRS+ECy4kuokcyKWYg/5od4l7WCOY2Av/lm5VMkjoyHuV0u6pb1MXtj9+tZrpuLYaXqmijAdxPnxrutXfpSq/vByFPv4ivZH049oMz99MpayQdtE2CgjD5YBdcKlVmR2lQoPIt53zUCO9vO+sBc7YdKtgdvWpMXt1mu4n5tsF+LNRyptu5ieEItZu4EZG0eoq+6bVth95FNIVi54VPlw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Jch77uFPKavCJ87fmaxrzM2yw3kdfmHVLjyFI0d1xfE=;
 b=pp+bz8WZEJJ7Td3rBpbR2+6FixpkYBahziF/0MWCkcgO78eWypgeIYj9TyJ9Hu2Ci4GA3DS/O0oWsAphVhOdFp2Vk0sTgIxHn6/ibQfahwMso5GH6M7nK1n4IzflI+3hDRAqnJ/vS8c2RHKAIFMIVCRSFpJk70AewYSkDyyyYJY=
Received: from SN6PR12MB2717.namprd12.prod.outlook.com (2603:10b6:805:68::29)
 by BL0PR12MB2468.namprd12.prod.outlook.com (2603:10b6:207:44::29)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5102.17; Wed, 30 Mar
 2022 21:26:52 +0000
Received: from SN6PR12MB2717.namprd12.prod.outlook.com
 ([fe80::11cf:fa0:1883:5db5]) by SN6PR12MB2717.namprd12.prod.outlook.com
 ([fe80::11cf:fa0:1883:5db5%6]) with mapi id 15.20.5102.025; Wed, 30 Mar 2022
 21:26:52 +0000
From: "Sierra Guiza, Alejandro (Alex)" <Alex.Sierra@amd.com>
To: "Sierra Guiza, Alejandro (Alex)" <Alex.Sierra@amd.com>, "jgg@nvidia.com"
 <jgg@nvidia.com>
Subject: RE: [PATCH] drm/amdkfd: Add SVM API support capability bits
Thread-Topic: [PATCH] drm/amdkfd: Add SVM API support capability bits
Thread-Index: AQHYRHyQ/YsZujGeV0SWTSHGpB4J2KzYcKpw
Date: Wed, 30 Mar 2022 21:26:52 +0000
Message-ID: <SN6PR12MB2717CBD5A2A27E1C0026D614FD1F9@SN6PR12MB2717.namprd12.prod.outlook.com>
References: <20220330212420.12003-1-alex.sierra@amd.com>
In-Reply-To: <20220330212420.12003-1-alex.sierra@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 04679cc0-b089-4767-0fa9-08da1294022b
x-ms-traffictypediagnostic: BL0PR12MB2468:EE_
x-microsoft-antispam-prvs: <BL0PR12MB24681257BF882C92B09A1E2BFD1F9@BL0PR12MB2468.namprd12.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Fz1g6Z3tRqBM8NATPA7Yhm6Iy1Wv/YfHV2IG9UI4L+kgAPiwkcKgOYhgCGKyMQNJSj4k8V1jEHxUFgMrX/Da5kQrNmqiHnJZZ+VRikzQGN2I9OycRAZ2e7fOQ/0znACr06DaqUs+0Ut4623e5miKdw/rXmonQ6yNRTWbcmoDsku7W9xfYtjXFuGBwIdpRQMlDgibbe/0qXPOAMRZTc4MfR6pZHe5xNKcTnjn33K/GZFZqFpoZwIrszC32S1I8gkRwu8lRxPSWK+Mh9NP36x4/h8VgJeRP+rJX34f6ba5rbwns4ScUAiKKQt8Wrxk8gTpjUfXcrYxIqkdj739whJ9tb+2Q/6COwz9BRZ/oh637W+SBq75og4LlRF3S5t6Oq+6nIMs7w2HVmVVHqOQNMUBvR2pfrII0Vn8VI0UarO9iAF5k1bXXcTvk3Yd99lvpYCr3uHP5F7yJtsl2wmBFiAqE5ovmh2KndOW3xJbOS1yqICjy9km64+LXVBr8T67jAyb2CME8LZ2rkeB09K1VmwoGZPoZriPg3dGjf9n/xTRIuK0tmFOczC2HCLdFKhuN8iVhToc7P8ZP9t8pB5QSeFo9jVtxjGUkuo+Og9sd8kvJ9eCfjfgPMhXMoZHdLl+SsCohvK//ttCMBPBQqNnQecg7JzmGtDUUJg1MMiXk/xvyKpL6Z84O16PvwIj0vw5Hrf029LbGyo+REy0yAWZqOSQaA==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN6PR12MB2717.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(186003)(110136005)(64756008)(83380400001)(316002)(26005)(54906003)(33656002)(5660300002)(8676002)(76116006)(55016003)(4326008)(66476007)(86362001)(66446008)(66556008)(508600001)(7416002)(8936002)(66946007)(2906002)(38100700002)(38070700005)(71200400001)(6506007)(122000001)(9686003)(53546011)(52536014)(7696005);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?MqO+qt+6C9u67/YFFpMFzVEW3N13q8mj2eTBsXTfXo9E14lqofepeEVpzv/8?=
 =?us-ascii?Q?3EiI5dp5oYNT1KMRhjXxoqY8GJWei3ME0lNXcluE4TOpoUV4y7GHKa2Q8LmB?=
 =?us-ascii?Q?D6k50Jdu0E7VXVcW/UPY1Upp2Rr+9xa6hLoEWTmzcjdw9fEkrQBzrZQ/r4wY?=
 =?us-ascii?Q?3scrExSr3+IRSx2Wtz5i4kKh+A5Ng+RFXyZJcFAwd6PXJWKOt3FCenH3OKKC?=
 =?us-ascii?Q?h+zYQP2Uh5Y48Lw7YrPpIKDFrND15YZ6qXyNrzYrVa8rNN5lm6s240eBlYcz?=
 =?us-ascii?Q?NVr+iBTHccqyhSeWFVggpI1S7cP2AwkgsOSJUpM8PSpwnf1WCLvHfk0aXAEV?=
 =?us-ascii?Q?Atg7FxCJB2VOf1ECKQWWWYO4e5r5Af3meO+Hq5mSUvPsnGwqsBjf+Q14ICJL?=
 =?us-ascii?Q?v25HRmNwhcpo1eEok6Pob/tzNOit20x0W/tPLTRO5+AUGTGv+tseuwFo9qi+?=
 =?us-ascii?Q?+hSya3IZb3OyAo8FBLiDC5dBr3u3cLw2r4xztCONDZHVwk3VvJXagV2UcX86?=
 =?us-ascii?Q?2N1D5rVi4qlrndr3N+MJerKwZTqM4RiPzc4YUgrjQxHpfmvWEwZp6yzKLOpq?=
 =?us-ascii?Q?GY8aaHHvPl7VimOkhVckUDFWdY4KEohPs7kLltzgR/Hn7npGL/b+FrsMSHwV?=
 =?us-ascii?Q?15lYRyslnw9fs28LahlCU8r36Fp/jXe8UNeyzQpJBWCwmnSaOGXmtLCke9rb?=
 =?us-ascii?Q?kHpN+qVlytwhituKx+HWYVex1KbXpo0l2Elsa9iFH9VkwIlN4ZN4xTpiH1fc?=
 =?us-ascii?Q?GOcXu5jWm29yjDk0HDJeSW0sOIgSzYRp3VM3n7Gnow8MlGM6gSRuJD4kSDyQ?=
 =?us-ascii?Q?5o+G67FW022uq2AsDtrAd/RZ0aQRIAEBpcLGQLNFbj9b8AETIpptTzUIfK12?=
 =?us-ascii?Q?96gsegKOKdKgWVEl8dkt9yYkDUK0o6m9xiwH3yQGFS3HfG8TcF6MCvRBnjAY?=
 =?us-ascii?Q?QFTg+0g+p8Gge66JO1XtzIQITMiqQurLqtP0nELtCISbC/BWPgoOc1WNSo8g?=
 =?us-ascii?Q?TTJDF7G5YkzcaCOkbueGjHwBC1HrXbuITzf4MLanxLW8GKSdSb8wUsOFaJ1O?=
 =?us-ascii?Q?szqpllB6fHvSjpJ50JeospiLT+8kQkEjmWyuzOoO/obctf3P7p1oSErUBnA5?=
 =?us-ascii?Q?7bvfFdhpCg2msGX7fHo0s0mHnIyJG++Qver8NvBopNvPw+1lf4Z/RSqQUbuE?=
 =?us-ascii?Q?LhWHUHpo3nI+56vfeI+GeklVgXhANUUVZJe/V6NW6dlgG89DEyzfBomPJgE5?=
 =?us-ascii?Q?CPkseveW4HbykRhUkB4hq9Dku3/bC3Cx1u14qWLiSa0wjCxHX73O8Y8E8f2r?=
 =?us-ascii?Q?X9zJhoIVGXcQYniSOIE5Xlrzo2j93erLAYQnXtw8xHNuUWRpiHSiGriJs5K0?=
 =?us-ascii?Q?effNNeBIc7nysS4YdVyZXfRXIK1odK8pVDx+f251N03rVG0kP5J8n+6P1RCj?=
 =?us-ascii?Q?eWZSsUr6XNyLrFICO8FYTea+FLQc3L+YjTGZj6bH2I5ql8r8RM6gKyzFvqUs?=
 =?us-ascii?Q?t6pBcBq5E6tBjni9eX6VC/ec7gNktr1Kb+Kn771nzOH402Kfk7IjUAxZ7VyT?=
 =?us-ascii?Q?53kuz6F1URanC7OYZUiv88ByLWPq+QAY2LLUmHNyRnXPIXv0f67dqSyTpYOp?=
 =?us-ascii?Q?gpmcM8YUWpJmXb5o0ASVFxjmNOhECb79Ke7AX6QrYKVqgcRzw8LZ62/e2XyK?=
 =?us-ascii?Q?sdn0eoe18z1M3DdjfV3kBvkpDf2M1+SewEthpEVR1UerdnLt?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN6PR12MB2717.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 04679cc0-b089-4767-0fa9-08da1294022b
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Mar 2022 21:26:52.6089 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ilrCU2O5ANg/HosGcSnG8/kXVcPpUl3u934neE0KZtY2XWcHze19DW6alF35D8X6VqKyi8xjAK5NkQMdCL5eVw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR12MB2468
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
Cc: "rcampbell@nvidia.com" <rcampbell@nvidia.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "david@redhat.com" <david@redhat.com>, "Kuehling, 
 Felix" <Felix.Kuehling@amd.com>, "apopple@nvidia.com" <apopple@nvidia.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 "linux-xfs@vger.kernel.org" <linux-xfs@vger.kernel.org>,
 "linux-mm@kvack.org" <linux-mm@kvack.org>,
 "jglisse@redhat.com" <jglisse@redhat.com>,
 "willy@infradead.org" <willy@infradead.org>,
 "akpm@linux-foundation.org" <akpm@linux-foundation.org>,
 "linux-ext4@vger.kernel.org" <linux-ext4@vger.kernel.org>,
 "hch@lst.de" <hch@lst.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Please ignore this patch.

> -----Original Message-----
> From: amd-gfx <amd-gfx-bounces@lists.freedesktop.org> On Behalf Of Alex
> Sierra
> Sent: Wednesday, March 30, 2022 4:24 PM
> To: jgg@nvidia.com
> Cc: rcampbell@nvidia.com; willy@infradead.org; david@redhat.com;
> Kuehling, Felix <Felix.Kuehling@amd.com>; apopple@nvidia.com; amd-
> gfx@lists.freedesktop.org; linux-xfs@vger.kernel.org; linux-mm@kvack.org;
> jglisse@redhat.com; dri-devel@lists.freedesktop.org; akpm@linux-
> foundation.org; linux-ext4@vger.kernel.org; hch@lst.de
> Subject: [PATCH] drm/amdkfd: Add SVM API support capability bits
>=20
> From: Philip Yang <Philip.Yang@amd.com>
>=20
> SVMAPISupported property added to HSA_CAPABILITY, the value match
> HSA_CAPABILITY defined in Thunk spec:
>=20
> SVMAPISupported: it will not be supported on older kernels that don't hav=
e
> HMM or on systems with GFXv8 or older GPUs without support for 48-bit
> virtual addresses.
>=20
> CoherentHostAccess property added to HSA_MEMORYPROPERTY, the value
> match HSA_MEMORYPROPERTY defined in Thunk spec:
>=20
> CoherentHostAccess: whether or not device memory can be coherently
> accessed by the host CPU.
>=20
> Signed-off-by: Philip Yang <Philip.Yang@amd.com>
> Reviewed-by: Felix Kuehling <Felix.Kuehling@amd.com>
> Signed-off-by: Felix Kuehling <Felix.Kuehling@amd.com>
> Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
> ---
>  drivers/gpu/drm/amd/amdkfd/kfd_topology.c |  6 ++++++
> drivers/gpu/drm/amd/amdkfd/kfd_topology.h | 10 ++++++----
>  2 files changed, 12 insertions(+), 4 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_topology.c
> b/drivers/gpu/drm/amd/amdkfd/kfd_topology.c
> index cdef608db4f4..083ac9babfa8 100644
> --- a/drivers/gpu/drm/amd/amdkfd/kfd_topology.c
> +++ b/drivers/gpu/drm/amd/amdkfd/kfd_topology.c
> @@ -1419,6 +1419,12 @@ int kfd_topology_add_device(struct kfd_dev
> *gpu)
>  		dev->node_props.capability |=3D (adev->ras_features !=3D 0) ?
>  			HSA_CAP_RASEVENTNOTIFY : 0;
>=20
> +	/* SVM API and HMM page migration work together, device memory
> type
> +	 * is initialized to not 0 when page migration register device memory.
> +	 */
> +	if (adev->kfd.dev->pgmap.type !=3D 0)
> +		dev->node_props.capability |=3D
> HSA_CAP_SVMAPI_SUPPORTED;
> +
>  	kfd_debug_print_topology();
>=20
>  	if (!res)
> diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_topology.h
> b/drivers/gpu/drm/amd/amdkfd/kfd_topology.h
> index b8b68087bd7a..6bd6380b0ee0 100644
> --- a/drivers/gpu/drm/amd/amdkfd/kfd_topology.h
> +++ b/drivers/gpu/drm/amd/amdkfd/kfd_topology.h
> @@ -53,8 +53,9 @@
>  #define HSA_CAP_ASIC_REVISION_MASK		0x03c00000
>  #define HSA_CAP_ASIC_REVISION_SHIFT		22
>  #define HSA_CAP_SRAM_EDCSUPPORTED		0x04000000
> +#define HSA_CAP_SVMAPI_SUPPORTED		0x08000000
>=20
> -#define HSA_CAP_RESERVED			0xf80f8000
> +#define HSA_CAP_RESERVED			0xf00f8000
>=20
>  struct kfd_node_properties {
>  	uint64_t hive_id;
> @@ -98,9 +99,10 @@ struct kfd_node_properties {
>  #define HSA_MEM_HEAP_TYPE_GPU_LDS	4
>  #define HSA_MEM_HEAP_TYPE_GPU_SCRATCH	5
>=20
> -#define HSA_MEM_FLAGS_HOT_PLUGGABLE	0x00000001
> -#define HSA_MEM_FLAGS_NON_VOLATILE	0x00000002
> -#define HSA_MEM_FLAGS_RESERVED		0xfffffffc
> +#define HSA_MEM_FLAGS_HOT_PLUGGABLE		0x00000001
> +#define HSA_MEM_FLAGS_NON_VOLATILE		0x00000002
> +#define HSA_MEM_FLAGS_COHERENTHOSTACCESS	0x00000004
> +#define HSA_MEM_FLAGS_RESERVED			0xfffffff8
>=20
>  struct kfd_mem_properties {
>  	struct list_head	list;
> --
> 2.32.0

