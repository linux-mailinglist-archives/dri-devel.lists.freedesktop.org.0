Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 818CB48A18F
	for <lists+dri-devel@lfdr.de>; Mon, 10 Jan 2022 22:10:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4B1BF10E6AB;
	Mon, 10 Jan 2022 21:10:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2065.outbound.protection.outlook.com [40.107.236.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BA2DC10E6AB;
 Mon, 10 Jan 2022 21:10:47 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=brpDg2rqR7NLWqF5KYrAN12cU/Eu3CZ1ZWENc3ElMoqS4aNdw683w6frLi90Zt6GAXKt0nvf0j4Rz3RjJHM8t9zs7OelOm2ZqjSd/GoDSAddHOKLH5GOyZTQi6yClurrNnUJadhJ/AVPM0HcYWU5p8Id97xRBt1gcRsTOyclkVgOqeUcdqQsulRVGQJvvMKMsZ05steWxV97EcBuJwu5km7UvWGkWPyMpbwkmqqeMZ1AYaWkAqSoJhEw43luLe04OoonOKeAC5j7ejt6rBJ+bQhtgbBJfX7VKLAHXCTGpshpp9CbBmWNC6YhHNEHYWtDDew+zLIRhOoOe50DT7uj5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iWYbDk2cg/a2lvGujO7JHjDBXTKM+ph19lSanKXzPjs=;
 b=djrH8ufTph1NTOQEAI9ZgxYH7jZbth+Zf9Jva9ZeBOHSqcvFWN/+Yy2CtfIBCoQnR1tfuSRyvIG45Y+d4iaqS1QrQqQEZxnjj9nlbRwb5BC0UzRGdvZn+yvqkP33i8n6TIoGqpB69O+t8qlc6S6UCBNVmtQl388WRNqXM3dF4uR8GvIJmVgWxfzwWk7kVRaqKTFPpHUiumq8+mAJ6zc5bra3uDwH0lp2rCUuIWt8V6K/xCA5RXEAa1mJqzh5Do0paI1s3mv4kdwBgCccx15n5TPWGDIwKfnYVTQomqmMT3qUHTmw2JyZ3HhSex/wG5AiaPMlT+6rM4d2+ry6Ux9xlg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iWYbDk2cg/a2lvGujO7JHjDBXTKM+ph19lSanKXzPjs=;
 b=AOXlkv9uGHhEcMbPuNIn8GQecByosxJB8+j72jP0pl63kgHoMk3+LuN4LVBzCP4XJOmWhGt2a2LgRyyF3ezVl4lMPrE7oGN3Gn5EkI01hQ98WhPDgUlbg3s8lH4DRoLuBFnk0xCL08qB8wAsbgoBsRqP640wzLVl0SjdwUUTbhI=
Received: from BL1PR12MB5144.namprd12.prod.outlook.com (2603:10b6:208:316::6)
 by BL1PR12MB5141.namprd12.prod.outlook.com (2603:10b6:208:309::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4867.9; Mon, 10 Jan
 2022 21:10:43 +0000
Received: from BL1PR12MB5144.namprd12.prod.outlook.com
 ([fe80::99d4:4d4f:653f:61be]) by BL1PR12MB5144.namprd12.prod.outlook.com
 ([fe80::99d4:4d4f:653f:61be%4]) with mapi id 15.20.4867.012; Mon, 10 Jan 2022
 21:10:43 +0000
From: "Deucher, Alexander" <Alexander.Deucher@amd.com>
To: "Phillips, Daniel" <Daniel.Phillips@amd.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Subject: Re: [PATCH 1/1] Add available memory ioctl for libhsakmt
Thread-Topic: [PATCH 1/1] Add available memory ioctl for libhsakmt
Thread-Index: AQHYBmRjRMsXVi3zBkWK5auVkT3yTKxcv9lS
Date: Mon, 10 Jan 2022 21:10:43 +0000
Message-ID: <BL1PR12MB51449917D93BE664ECF3E5B5F7509@BL1PR12MB5144.namprd12.prod.outlook.com>
References: <20220110205457.3165572-1-daniel.phillips@amd.com>
In-Reply-To: <20220110205457.3165572-1-daniel.phillips@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_Enabled=True;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_SetDate=2022-01-10T21:10:42.577Z;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_Name=Public;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_ContentBits=0;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_Method=Privileged; 
suggested_attachment_session_id: bbe69131-7b82-5d16-bfb9-1ff36ba1f7b2
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: bceaec10-8dd4-4027-cc13-08d9d47da9bc
x-ms-traffictypediagnostic: BL1PR12MB5141:EE_
x-microsoft-antispam-prvs: <BL1PR12MB5141CF072916E5160683D154F7509@BL1PR12MB5141.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7219;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: gjiwmWaKOMjcsS8P+65fZa/bx9iNyyFqKmlXblYRxfytpk7g4VsF2eyseMiDB0WPPtKlDz8bcltiz+5GJM/VB3UYPfDc0bBszzWt0642VpvoMPJEKUY/FWCBhD3WXKftS4oa0NK0brv8AIfTnP8poqsMHvyJqomTb92UkQPGkScwswiqtTTlchV+ahTo7vD1dDW5EadAw4tnHPIO1G070+r4xDciruZB7fq/qQjWbroarO5u4EByvZI0/uJlM0QT2Q3usOW5DJqCHbU46UGpSyr0gtNKVAlQiedl/gjN1AmkE2epsWkA12UJuiaVBGalgQV49bkJ/Llaxjw6Wqy6Amq3BVaM9ozr3wBG7od7bb73yaovu6V+V7y1o783kjcEnK9Rj6XDu8+YttyWqttA0XdXNPCPz/pGnj243GyQkuq021AJeTjprIbWrBRO+CJUqW2MVx7nf4VwULls8MbVG2TB+SEqfmXeeJ2CVb9KB/jMYqkCbGs+o+WS9rkNFxnTGC0RtaiwA2zA/n/aQXqEMN/PHXPsnfPrqIQAjn4e//EKhwf11MRD+EgpjiIczIYk/V0ACMYtrnDKB+UoKGdLduWMebVYJvGVnkDqoGMfcE1cLNVvnbA6WauimiflzABPoI5bFTqViw5TNyDtpjbrk3sBJYdti6P+ivanYKYIhdJ9jpnkBndumm9c0IYwJSXY1v6GzOwCTmrdF+Osq53jlLxPqgpvTz4Ly2Uz44Pkj+utdk5p5iTVbLABSLmQrHoy
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL1PR12MB5144.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(66946007)(122000001)(64756008)(508600001)(55016003)(38070700005)(83380400001)(66476007)(53546011)(6506007)(186003)(7696005)(8936002)(26005)(5660300002)(316002)(52536014)(9686003)(450100002)(76116006)(38100700002)(19627405001)(8676002)(33656002)(110136005)(2906002)(71200400001)(66446008)(66556008)(86362001)(131093003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?Yu1JMd+r63ncC3tmNfUje2bTEvyy9CFt1F/l8GdcAzegMs0WPgpql9OpdoeY?=
 =?us-ascii?Q?ATC7XG0rHDkRbJGgleFB04zHJ+nAPNu0k3MOe7MuoaPbruQYd33r8e9NzMF4?=
 =?us-ascii?Q?tlBrsnicQm1bzhXniAZkVPlNKx2JakP0+rYWn28RAKOr6+dIp9TthPLsU13c?=
 =?us-ascii?Q?f6PJ3awhy0CbtnDCUcNT+hgqNt5KP7GozMEKWwBAAdCHsFo8Ygg9qoGRQRxy?=
 =?us-ascii?Q?stBf14AtTZC6wapy9NjuZfY/pdAeK/g1IqkTGYGfMNX3SFM7qJfNHf198Uno?=
 =?us-ascii?Q?H9Cjh60YIldr232fpzHnFEDSrK1NoH+WTO1YEyUSV2Q4kKvUyR7B06l6DDq2?=
 =?us-ascii?Q?0BgDiMVdCZSzBQXghjd901zl5Hfg8hoAH1EtvR/pf/p3z5YqgZC08S5doc2i?=
 =?us-ascii?Q?h3aXIgdc7jAZOJv3ClRggKhKwo+7HA93WFtV3Eye2ky+e7Nu2qwSmgaHdz50?=
 =?us-ascii?Q?5oD3vpUFXbVuDNMsThjnOkE7AbvXhMNKs9FVFXmDm2fQu2cZeObEq0Ir7sPH?=
 =?us-ascii?Q?8uzKfEvFiy7StQf+3NdNNyDqzYaQnJEatgJYYftQ+muDGqjUW1gGeD947V0F?=
 =?us-ascii?Q?JXehIDIgcWAzE9orsC60StAwN4HZC4WNJH/fMEjlnKuPMamjuGBl0Tzal35F?=
 =?us-ascii?Q?QderWdvioC4J+9EBfsacb7EWSjKzguzTE00CrwrX+7xbSi0UjQYMsbFT5Zvx?=
 =?us-ascii?Q?JPS1rfA5o6dy40vCV1iX/bw3T4JarNJDMSsDXinPQkbuh3DivmB+B7Xbo/Hf?=
 =?us-ascii?Q?uAMbMY+r6S82+A+5kZV5gkIc+DtWNJdq2PvZvDS31BLO0wjv3GlqrZyf/9oU?=
 =?us-ascii?Q?iK9DlLTXURSEpWI6tlAAA7IFgerDM6SJXHQLMBqtxJSwnN/7iB5L9ZXbwVcw?=
 =?us-ascii?Q?/O7fX/8Y7Mdb1gTlrECdG6TvLSd6dkdVdHkAFulHouDaMEuG8h/G/alqMIpM?=
 =?us-ascii?Q?9N2drlRno2MBukH8F52/+2oWwBawuVPMNeVQVv7ewAPuJDpv1iTCxhhA/Vpc?=
 =?us-ascii?Q?Twg1xMytrrGIyrC7wegJsGAxO9w3plbMcCxm9sxcjgcT2/48rrPy4yySP3W2?=
 =?us-ascii?Q?NS8R2/gQSSczjcU9cs5jmlIWXG8C7qWo6/8s9UrCthcP45kLNaYaLih+l3yT?=
 =?us-ascii?Q?+ukQ51HdRZr/WndrT/oTZdnukOh8TutrOZkC+rWNgQPXaCENOJD7NnkVqKum?=
 =?us-ascii?Q?PsGwMvxe/iM/TP2RrMSut1KpDHtuqRqy5nNpemqcmXxziIvfTdwecaXz1F78?=
 =?us-ascii?Q?iW9GAugrslFzZPsZTCpIcky5a4PTDtdv/VmGCXXvJTk4eDM23l2FlGaKykjY?=
 =?us-ascii?Q?dXwZQRTmOQX4hULQ4FckzlnSgXqb9etD9A1L7p/jb1lpeiG4GsngerXjpyYl?=
 =?us-ascii?Q?FApwDp5iDxbJ2mV4IbvyfyUdfBfFBvjm+snMeODwBTuPl3VgjqJrlZgCuUeC?=
 =?us-ascii?Q?q60otHNkK6zCkOdgU/M/9a90AxX+NC1B/dtHxbxindK5ERyLUWQg597uBe6/?=
 =?us-ascii?Q?ZGYjvmI46vgjuyGXxFOteBsKAUHs6yWdHjoKMu7lK94zXTcKpfxf2j1wzjT0?=
 =?us-ascii?Q?HWKD7vB4giRi+6dSCv0Chkns7Se3KnYABj9oM5G3OX3fVJc80Ue/GNsSEOTc?=
 =?us-ascii?Q?cfK0jcY02TSJIqURaOKhuMA=3D?=
Content-Type: multipart/alternative;
 boundary="_000_BL1PR12MB51449917D93BE664ECF3E5B5F7509BL1PR12MB5144namp_"
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5144.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bceaec10-8dd4-4027-cc13-08d9d47da9bc
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Jan 2022 21:10:43.1952 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 5Sf3v/K2WN9swzpNblRCXYA/XbkM/K5hLbfNZPk/w1SYk/k5BBLyZJnpw/g45aW+Sc65g5hqXQHHAkCiNjRIsw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5141
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

--_000_BL1PR12MB51449917D93BE664ECF3E5B5F7509BL1PR12MB5144namp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

[Public]

This is missing your signed-off-by.  Additionally, for UAPI changes, we nee=
d a link the patches for the userspace component that will make use of it.

Alex

________________________________
From: amd-gfx <amd-gfx-bounces@lists.freedesktop.org> on behalf of Daniel P=
hillips <daniel.phillips@amd.com>
Sent: Monday, January 10, 2022 3:54 PM
To: amd-gfx@lists.freedesktop.org <amd-gfx@lists.freedesktop.org>; dri-deve=
l@lists.freedesktop.org <dri-devel@lists.freedesktop.org>
Cc: Phillips, Daniel <Daniel.Phillips@amd.com>
Subject: [PATCH 1/1] Add available memory ioctl for libhsakmt

From: Daniel Phillips <dphillip@amd.com>

Add an ioctl to inquire memory available for allocation by libhsakmt
per node, allowing for space consumed by page translation tables.
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.h      |  1 +
 .../gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c    | 14 ++++++++++++++
 drivers/gpu/drm/amd/amdkfd/kfd_chardev.c        | 17 +++++++++++++++++
 include/uapi/linux/kfd_ioctl.h                  | 14 ++++++++++++--
 4 files changed, 44 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.h b/drivers/gpu/drm/a=
md/amdgpu/amdgpu_amdkfd.h
index fcbc8a9c9e06..64c6c36685d3 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.h
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.h
@@ -266,6 +266,7 @@ int amdgpu_amdkfd_gpuvm_acquire_process_vm(struct amdgp=
u_device *adev,
 void amdgpu_amdkfd_gpuvm_release_process_vm(struct amdgpu_device *adev,
                                         void *drm_priv);
 uint64_t amdgpu_amdkfd_gpuvm_get_process_page_dir(void *drm_priv);
+size_t amdgpu_amdkfd_get_available_memory(struct amdgpu_device *adev);
 int amdgpu_amdkfd_gpuvm_alloc_memory_of_gpu(
                 struct amdgpu_device *adev, uint64_t va, uint64_t size,
                 void *drm_priv, struct kgd_mem **mem,
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c b/drivers/gpu=
/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c
index 86a1a6c109d9..b7490a659173 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c
@@ -190,6 +190,20 @@ static int amdgpu_amdkfd_reserve_mem_limit(struct amdg=
pu_device *adev,
         return ret;
 }

+size_t amdgpu_amdkfd_get_available_memory(struct amdgpu_device *adev)
+{
+       uint64_t reserved_for_pt =3D
+               ESTIMATE_PT_SIZE(amdgpu_amdkfd_total_mem_size);
+       size_t available_memory;
+
+       spin_lock(&kfd_mem_limit.mem_limit_lock);
+       available_memory =3D
+               adev->gmc.real_vram_size -
+               adev->kfd.vram_used - reserved_for_pt;
+       spin_unlock(&kfd_mem_limit.mem_limit_lock);
+       return available_memory;
+}
+
 static void unreserve_mem_limit(struct amdgpu_device *adev,
                 uint64_t size, u32 alloc_flag)
 {
diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c b/drivers/gpu/drm/amd=
/amdkfd/kfd_chardev.c
index 4bfc0c8ab764..5c2f6d97ff1c 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c
@@ -486,6 +486,20 @@ static int kfd_ioctl_get_queue_wave_state(struct file =
*filep,
         return r;
 }

+static int kfd_ioctl_get_available_memory(struct file *filep,
+                                struct kfd_process *p, void *data)
+{
+       struct kfd_ioctl_get_available_memory_args *args =3D data;
+       struct kfd_dev *dev;
+
+       dev =3D kfd_device_by_id(args->gpu_id);
+       if (!dev)
+               return -EINVAL;
+
+       args->available =3D amdgpu_amdkfd_get_available_memory(dev->adev);
+       return 0;
+}
+
 static int kfd_ioctl_set_memory_policy(struct file *filep,
                                         struct kfd_process *p, void *data)
 {
@@ -1959,6 +1973,9 @@ static const struct amdkfd_ioctl_desc amdkfd_ioctls[]=
 =3D {

         AMDKFD_IOCTL_DEF(AMDKFD_IOC_SET_XNACK_MODE,
                         kfd_ioctl_set_xnack_mode, 0),
+
+       AMDKFD_IOCTL_DEF(AMDKFD_IOC_AVAILABLE_MEMORY,
+                       kfd_ioctl_get_available_memory, 0),
 };

 #define AMDKFD_CORE_IOCTL_COUNT ARRAY_SIZE(amdkfd_ioctls)
diff --git a/include/uapi/linux/kfd_ioctl.h b/include/uapi/linux/kfd_ioctl.=
h
index af96af174dc4..94a99add2432 100644
--- a/include/uapi/linux/kfd_ioctl.h
+++ b/include/uapi/linux/kfd_ioctl.h
@@ -32,9 +32,10 @@
  * - 1.4 - Indicate new SRAM EDC bit in device properties
  * - 1.5 - Add SVM API
  * - 1.6 - Query clear flags in SVM get_attr API
+ * - 1.7 - Add available_memory ioctl
  */
 #define KFD_IOCTL_MAJOR_VERSION 1
-#define KFD_IOCTL_MINOR_VERSION 6
+#define KFD_IOCTL_MINOR_VERSION 7

 struct kfd_ioctl_get_version_args {
         __u32 major_version;    /* from KFD */
@@ -98,6 +99,12 @@ struct kfd_ioctl_get_queue_wave_state_args {
         __u32 pad;
 };

+struct kfd_ioctl_get_available_memory_args {
+       __u64 available;        /* from KFD */
+       __u32 gpu_id;           /* to KFD */
+       __u32 pad;
+};
+
 /* For kfd_ioctl_set_memory_policy_args.default_policy and alternate_polic=
y */
 #define KFD_IOC_CACHE_POLICY_COHERENT 0
 #define KFD_IOC_CACHE_POLICY_NONCOHERENT 1
@@ -742,7 +749,10 @@ struct kfd_ioctl_set_xnack_mode_args {
 #define AMDKFD_IOC_SET_XNACK_MODE               \
                 AMDKFD_IOWR(0x21, struct kfd_ioctl_set_xnack_mode_args)

+#define AMDKFD_IOC_AVAILABLE_MEMORY            \
+               AMDKFD_IOR(0x22, struct kfd_ioctl_get_available_memory_args=
)
+
 #define AMDKFD_COMMAND_START            0x01
-#define AMDKFD_COMMAND_END             0x22
+#define AMDKFD_COMMAND_END             0x23

 #endif
--
2.34.1


--_000_BL1PR12MB51449917D93BE664ECF3E5B5F7509BL1PR12MB5144namp_
Content-Type: text/html; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dus-ascii"=
>
<style type=3D"text/css" style=3D"display:none;"> P {margin-top:0;margin-bo=
ttom:0;} </style>
</head>
<body dir=3D"ltr">
<p style=3D"font-family:Arial;font-size:10pt;color:#008000;margin:15pt;" al=
ign=3D"Left">
[Public]<br>
</p>
<br>
<div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
This is missing your signed-off-by.&nbsp; Additionally, for UAPI changes, w=
e need a link the patches for the userspace component that will make use of=
 it.</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
Alex</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div id=3D"appendonsend"></div>
<hr style=3D"display:inline-block;width:98%" tabindex=3D"-1">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" st=
yle=3D"font-size:11pt" color=3D"#000000"><b>From:</b> amd-gfx &lt;amd-gfx-b=
ounces@lists.freedesktop.org&gt; on behalf of Daniel Phillips &lt;daniel.ph=
illips@amd.com&gt;<br>
<b>Sent:</b> Monday, January 10, 2022 3:54 PM<br>
<b>To:</b> amd-gfx@lists.freedesktop.org &lt;amd-gfx@lists.freedesktop.org&=
gt;; dri-devel@lists.freedesktop.org &lt;dri-devel@lists.freedesktop.org&gt=
;<br>
<b>Cc:</b> Phillips, Daniel &lt;Daniel.Phillips@amd.com&gt;<br>
<b>Subject:</b> [PATCH 1/1] Add available memory ioctl for libhsakmt</font>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt;=
">
<div class=3D"PlainText">From: Daniel Phillips &lt;dphillip@amd.com&gt;<br>
<br>
Add an ioctl to inquire memory available for allocation by libhsakmt<br>
per node, allowing for space consumed by page translation tables.<br>
---<br>
&nbsp;drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.h&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; |&nbsp; 1 +<br>
&nbsp;.../gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c&nbsp;&nbsp;&nbsp; | 14 +=
+++++++++++++<br>
&nbsp;drivers/gpu/drm/amd/amdkfd/kfd_chardev.c&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp; | 17 +++++++++++++++++<br>
&nbsp;include/uapi/linux/kfd_ioctl.h&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | 14 ++++++=
++++++--<br>
&nbsp;4 files changed, 44 insertions(+), 2 deletions(-)<br>
<br>
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.h b/drivers/gpu/drm/a=
md/amdgpu/amdgpu_amdkfd.h<br>
index fcbc8a9c9e06..64c6c36685d3 100644<br>
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.h<br>
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.h<br>
@@ -266,6 +266,7 @@ int amdgpu_amdkfd_gpuvm_acquire_process_vm(struct amdgp=
u_device *adev,<br>
&nbsp;void amdgpu_amdkfd_gpuvm_release_process_vm(struct amdgpu_device *ade=
v,<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp; void *drm_priv);<br>
&nbsp;uint64_t amdgpu_amdkfd_gpuvm_get_process_page_dir(void *drm_priv);<br=
>
+size_t amdgpu_amdkfd_get_available_memory(struct amdgpu_device *adev);<br>
&nbsp;int amdgpu_amdkfd_gpuvm_alloc_memory_of_gpu(<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; struct amdgpu_device *adev, uint64_t va, uint64_t siz=
e,<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; void *drm_priv, struct kgd_mem **mem,<br>
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c b/drivers/gpu=
/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c<br>
index 86a1a6c109d9..b7490a659173 100644<br>
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c<br>
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c<br>
@@ -190,6 +190,20 @@ static int amdgpu_amdkfd_reserve_mem_limit(struct amdg=
pu_device *adev,<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return ret;<br>
&nbsp;}<br>
&nbsp;<br>
+size_t amdgpu_amdkfd_get_available_memory(struct amdgpu_device *adev)<br>
+{<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; uint64_t reserved_for_pt =3D<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; ESTIMATE_PT_SIZE(amdgpu_amdkfd_total_mem_size);<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; size_t available_memory;<br>
+<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; spin_lock(&amp;kfd_mem_limit.mem_limi=
t_lock);<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; available_memory =3D<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; adev-&gt;gmc.real_vram_size -<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; adev-&gt;kfd.vram_used - reserved_for_pt;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; spin_unlock(&amp;kfd_mem_limit.mem_li=
mit_lock);<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return available_memory;<br>
+}<br>
+<br>
&nbsp;static void unreserve_mem_limit(struct amdgpu_device *adev,<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; uint64_t size, u32 alloc_flag)<br>
&nbsp;{<br>
diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c b/drivers/gpu/drm/amd=
/amdkfd/kfd_chardev.c<br>
index 4bfc0c8ab764..5c2f6d97ff1c 100644<br>
--- a/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c<br>
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c<br>
@@ -486,6 +486,20 @@ static int kfd_ioctl_get_queue_wave_state(struct file =
*filep,<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return r;<br>
&nbsp;}<br>
&nbsp;<br>
+static int kfd_ioctl_get_available_memory(struct file *filep,<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; struct kfd_process *p, void *data)<br=
>
+{<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; struct kfd_ioctl_get_available_memory=
_args *args =3D data;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; struct kfd_dev *dev;<br>
+<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; dev =3D kfd_device_by_id(args-&gt;gpu=
_id);<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (!dev)<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; return -EINVAL;<br>
+<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; args-&gt;available =3D amdgpu_amdkfd_=
get_available_memory(dev-&gt;adev);<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return 0;<br>
+}<br>
+<br>
&nbsp;static int kfd_ioctl_set_memory_policy(struct file *filep,<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp; struct kfd_process *p, void *data)<br>
&nbsp;{<br>
@@ -1959,6 +1973,9 @@ static const struct amdkfd_ioctl_desc amdkfd_ioctls[]=
 =3D {<br>
&nbsp;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; AMDKFD_IOCTL_DEF(AMDKFD_IO=
C_SET_XNACK_MODE,<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; kfd_i=
octl_set_xnack_mode, 0),<br>
+<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; AMDKFD_IOCTL_DEF(AMDKFD_IOC_AVAILABLE=
_MEMORY,<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; kfd_ioctl_get_av=
ailable_memory, 0),<br>
&nbsp;};<br>
&nbsp;<br>
&nbsp;#define AMDKFD_CORE_IOCTL_COUNT ARRAY_SIZE(amdkfd_ioctls)<br>
diff --git a/include/uapi/linux/kfd_ioctl.h b/include/uapi/linux/kfd_ioctl.=
h<br>
index af96af174dc4..94a99add2432 100644<br>
--- a/include/uapi/linux/kfd_ioctl.h<br>
+++ b/include/uapi/linux/kfd_ioctl.h<br>
@@ -32,9 +32,10 @@<br>
&nbsp; * - 1.4 - Indicate new SRAM EDC bit in device properties<br>
&nbsp; * - 1.5 - Add SVM API<br>
&nbsp; * - 1.6 - Query clear flags in SVM get_attr API<br>
+ * - 1.7 - Add available_memory ioctl<br>
&nbsp; */<br>
&nbsp;#define KFD_IOCTL_MAJOR_VERSION 1<br>
-#define KFD_IOCTL_MINOR_VERSION 6<br>
+#define KFD_IOCTL_MINOR_VERSION 7<br>
&nbsp;<br>
&nbsp;struct kfd_ioctl_get_version_args {<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; __u32 major_version;&nbsp;=
&nbsp;&nbsp; /* from KFD */<br>
@@ -98,6 +99,12 @@ struct kfd_ioctl_get_queue_wave_state_args {<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; __u32 pad;<br>
&nbsp;};<br>
&nbsp;<br>
+struct kfd_ioctl_get_available_memory_args {<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; __u64 available;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; /* from KFD */<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; __u32 gpu_id;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* to KFD */<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; __u32 pad;<br>
+};<br>
+<br>
&nbsp;/* For kfd_ioctl_set_memory_policy_args.default_policy and alternate_=
policy */<br>
&nbsp;#define KFD_IOC_CACHE_POLICY_COHERENT 0<br>
&nbsp;#define KFD_IOC_CACHE_POLICY_NONCOHERENT 1<br>
@@ -742,7 +749,10 @@ struct kfd_ioctl_set_xnack_mode_args {<br>
&nbsp;#define AMDKFD_IOC_SET_XNACK_MODE&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; \<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; AMDKFD_IOWR(0x21, struct kfd_ioctl_set_xnack_mode_arg=
s)<br>
&nbsp;<br>
+#define AMDKFD_IOC_AVAILABLE_MEMORY&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp; \<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; AMDKFD_IOR(0x22, struct kfd_ioctl_get_available_memory_args)<br>
+<br>
&nbsp;#define AMDKFD_COMMAND_START&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp; 0x01<br>
-#define AMDKFD_COMMAND_END&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp; 0x22<br>
+#define AMDKFD_COMMAND_END&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp; 0x23<br>
&nbsp;<br>
&nbsp;#endif<br>
-- <br>
2.34.1<br>
<br>
</div>
</span></font></div>
</div>
</body>
</html>

--_000_BL1PR12MB51449917D93BE664ECF3E5B5F7509BL1PR12MB5144namp_--
