Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A1DDF37A773
	for <lists+dri-devel@lfdr.de>; Tue, 11 May 2021 15:24:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B329B6E1CD;
	Tue, 11 May 2021 13:24:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2068.outbound.protection.outlook.com [40.107.236.68])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AABAF6E1B6;
 Tue, 11 May 2021 13:24:46 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eMc66P1O/wN+Y83VN1jl5F6bH1jsSH4pFwaDiw+90kjwxBy421T1yR1/JCSGs30uDQ19vQs0aMnluifu5gJOjMRbhTUbISkfUeyV9kkzSqBrKfRIGjKeMFJ5vbDTBmBqDjjf6ALQXDWVGvF5GJYEtO53xvef7O/jO9iFRuBLZqzIjHTHjfqBIPN255ykDkaIFL73+xnOBFS38jMML+pZlaKdcd69F+fCGokLgVURb1MJsjXIyBYGiEsaRNXlkMHI1dtBj2YWA9cXcVRgQbzXzlMF+BHTdyq4P5ZfzWqcWWj6vGpKLU0+dfv7JQjIsyO9oyMd0speFfp1zfbRqj9/WQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sVRqFORBlrjkVxOx7sasoOZ+PIY8xtVz0d+Yy3UzoU0=;
 b=bXg+qsxgIRxwL7NchWJ5lrrWNJ0UW1zeYPsivXdqnPBxNSHDW60H90v5GCzpXL+HwwGRaR8IT7lsBRzUIMrwbYnK4n1eTroXLT++wL8szU/PW9YdxmOJd92Anmh5w8yZVuAJ2A7pYEMG52dRFq385SoN6+YQIe9IyHIP/G6icLOKVqbVtvsZfNRa1sxM8N5FAfOcG/qW9Nd0vUVK5OoL922fxC5uXeIeuoRDK6ROc2SXkSmjxScPFZVYphjTgWiZKeZ5D65VF9nf+m3xi1UP1kQkzYQCJD2IFBmkVww6Jwc02qaFleUGkdHvK79k7sGyOIQPy6ca4ZFFJ2KhkgwXDg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sVRqFORBlrjkVxOx7sasoOZ+PIY8xtVz0d+Yy3UzoU0=;
 b=fWitJ9y/r8fv2TeWCDmxnkCRHYQzSOMO5TPqjo4r1VHq2fZJ8lvvuMAlmjUsjW3pOu8Wu/qNT6yguPxDI+TM2sktcbHXhcvOrzsPAZ1lD9JP5LE8KzEHk9WcpOp9xluXGi4ikJvXAzs+eemTzTUKsmx3vDLBbFVRmtqUxp3Datg=
Received: from MN2PR12MB4488.namprd12.prod.outlook.com (2603:10b6:208:24e::19)
 by MN2PR12MB4640.namprd12.prod.outlook.com (2603:10b6:208:38::29)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4108.27; Tue, 11 May
 2021 13:24:42 +0000
Received: from MN2PR12MB4488.namprd12.prod.outlook.com
 ([fe80::3d98:cefb:476c:c36e]) by MN2PR12MB4488.namprd12.prod.outlook.com
 ([fe80::3d98:cefb:476c:c36e%8]) with mapi id 15.20.4108.032; Tue, 11 May 2021
 13:24:42 +0000
From: "Deucher, Alexander" <Alexander.Deucher@amd.com>
To: "Grodzovsky, Andrey" <Andrey.Grodzovsky@amd.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 "linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>,
 "ckoenig.leichtzumerken@gmail.com" <ckoenig.leichtzumerken@gmail.com>,
 "daniel.vetter@ffwll.ch" <daniel.vetter@ffwll.ch>, "Wentland, Harry"
 <Harry.Wentland@amd.com>
Subject: Re: [PATCH v6 04/16] drm/amdkfd: Split kfd suspend from devie exit
Thread-Topic: [PATCH v6 04/16] drm/amdkfd: Split kfd suspend from devie exit
Thread-Index: AQHXRbqtDRMsp19jhUCOu9VNWlbr7areRmsh
Date: Tue, 11 May 2021 13:24:42 +0000
Message-ID: <MN2PR12MB4488E82C859899CDB2BE8D7AF7539@MN2PR12MB4488.namprd12.prod.outlook.com>
References: <20210510163625.407105-1-andrey.grodzovsky@amd.com>,
 <20210510163625.407105-5-andrey.grodzovsky@amd.com>
In-Reply-To: <20210510163625.407105-5-andrey.grodzovsky@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_0d814d60-469d-470c-8cb0-58434e2bf457_Enabled=True;
 MSIP_Label_0d814d60-469d-470c-8cb0-58434e2bf457_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
 MSIP_Label_0d814d60-469d-470c-8cb0-58434e2bf457_SetDate=2021-05-11T13:24:42.280Z;
 MSIP_Label_0d814d60-469d-470c-8cb0-58434e2bf457_Name=AMD
 Public; MSIP_Label_0d814d60-469d-470c-8cb0-58434e2bf457_ContentBits=0;
 MSIP_Label_0d814d60-469d-470c-8cb0-58434e2bf457_Method=Privileged; 
authentication-results: amd.com; dkim=none (message not signed)
 header.d=none;amd.com; dmarc=none action=none header.from=amd.com;
x-originating-ip: [192.161.79.245]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 83294e79-c590-4856-de26-08d91480233f
x-ms-traffictypediagnostic: MN2PR12MB4640:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MN2PR12MB4640A039D5A41DB60686067FF7539@MN2PR12MB4640.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:4714;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: CmTPVTujYP9FZR3TwqhFwMkX5LKQrHvG6N9Jj9gkT1r2euNKvjYZXf4iy0l5F3FjRwf7SZ8MsjaimKSxjXoxoDUj89FtJ2XC3AmRbttKK0YJVMzAqBjx5MlHaJzCWtXnnJAMfeDLe7hqhjBVXk5iYUyfBnB35hF1Hd1NB4DsTf6Pb5nW3aUOTbbMqzKJckWTnxbrfHL/wKVRxcsWZcsNWNIqqxfNiKaiOIxx02VrSGOWh/bJcMYkVyXv+bY887NBLaIm2WD5VM4yAWYy13OnVCSoYCjMjP2/+bNNcwIxT6HBVbzvP+tSkl1RP2BfswQWfAEB88N2Ajv9i2EcYFCD0rNw1n50pqwsQTBO/iutRzHaqXL4va24lHhIHZ/M2lqJHvTlEVDbtevZGXAlqcOlLDYfi0UhORqrdhk4lkpwN/6FEa/zka7gTBjmzDQ8aosmQXRXKRV437onhi9/sniwIemWtVpl+/KLKelnY4ET/zbNlwVRaqKUdytmHZ3n/T0jnmB51HWPyVg5EA15tPfRgucXb5PeGLXAM2PB91RvZA2eeZtM9DNyRgrxOSk174fqFF2YPrFesrXuQj3LZhucfRAq/wk5RKJAFgkQmUtTpyA=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB4488.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(39850400004)(376002)(136003)(346002)(396003)(71200400001)(15650500001)(26005)(186003)(478600001)(5660300002)(53546011)(9686003)(66556008)(4326008)(64756008)(8936002)(33656002)(52536014)(66476007)(54906003)(6506007)(76116006)(110136005)(66946007)(66446008)(316002)(83380400001)(6636002)(7696005)(122000001)(55016002)(38100700002)(19627405001)(8676002)(2906002)(86362001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: =?us-ascii?Q?TifB5UWG5gjgzKKohgnmN/jmvSJYuWt+OPvJgscULkOvyEMwTQIg91dRXTTl?=
 =?us-ascii?Q?+bB/0iqA+KQxqAFitwT0Gk7bK2Dg6wsgV3EPEiOH1M7Hhn18e3ds5+Rh5svF?=
 =?us-ascii?Q?BgGKoWcUMPoU77m5MrU+4mSRjL11yUJN2SzGX230UK1wilGuw+xD+Cj1c2Ry?=
 =?us-ascii?Q?6Z6Ui4KyfBnwMwCG2ICc3qFZiS44KvEjH5o7IAUuOKgo/w3yty8omq/PqA5d?=
 =?us-ascii?Q?j5G/TyFu9EiZa+SGt/+rvnSDJk3gpJBPnHEa/F2NA4Ye5akPjceXW18G7Lhs?=
 =?us-ascii?Q?+JpB0jL4VP/ijDKPUUQlWT+mDk95WSpZC+atWf0Pbhf2/fLHSMCeeH89rORK?=
 =?us-ascii?Q?d8kWoJbOn5HbLABpNFzLHrwZZFcglrIvmpzPBd7zNg1OZlhAOilRRFUIn5Vu?=
 =?us-ascii?Q?9BcLnPJ7U5vWq3HyTJF71gYNTDUFWnbsPediXq9KGOoQLI6vAr9tFbkxN/sa?=
 =?us-ascii?Q?V0/m223uR0KxcAj4Z2s2RCd3dvlIy+u/fN+KymjMMiQ5VprGICYSGnzBj0Y1?=
 =?us-ascii?Q?webyM7pVMflgq/JXwucgeIpMTxzLV314O4Qa0l/vwjKVYAjZl/dbwtysS5Lp?=
 =?us-ascii?Q?NsccuHv/r27ecegiDemYXNlKs8kxnJXhUtuxMesK1DT7bofiArWc29hoYcQ4?=
 =?us-ascii?Q?+LoEyG2Gnu8A26gPQOZH78qxSe3ek2G0TEcPSSa3GB5Xb8aalDGwZhF2QRPw?=
 =?us-ascii?Q?Oa/+wjKVgoNOKrBd73OB0I9OJShRrhSUUUJEFDqmKRVFaBROyHR7dgoB5hjj?=
 =?us-ascii?Q?JZxevpzzkQfJVvGfWAEW3SysjVTMk90WvSXwhfgXliH2kYSuKfHJXbo3i53v?=
 =?us-ascii?Q?j+CT++U6FZOBzCuBLNaPPzNO1dl47sd8qzwY4+dh59PBIr5RVmICLvr4lsJk?=
 =?us-ascii?Q?2oiZGg0I+hvvYPccSidWRzdlgZFVQAlFld8uRpOrX8NzVuL7PvXcBM9RPUZd?=
 =?us-ascii?Q?SvbNKAkhqYFs8SZG5V9GFBcsJOAStRY9vqmolNDdjKfgvEnW1jQhQKXv8soD?=
 =?us-ascii?Q?cl2hzN/OPMidwsseZqDFdWbahhhqpgn3ML1T9v/jsLZMO+Fhf8pVso641mO4?=
 =?us-ascii?Q?T+lwC3LUAE7d48QhIU8TY0LmhWdDEYlc5BZ2aJ5sVtB68JRp0UbHzgpnfq8Z?=
 =?us-ascii?Q?/vY8eggETpg/ndnS9U2KjFLQO8Z3EtFhjQT12PulC7XVWM6TXhzROArtTP8P?=
 =?us-ascii?Q?nWCPxUNJah8phI8qeRL0Q4rIq/k2T9rovuLxKohkPqw4bHGbyfJGq9A7Mgt+?=
 =?us-ascii?Q?oQWPCKI68B8EGXw6dKCoJ1IYf3v9HQDG7og1P7O1+37xbNyhAAeLyrYpppOK?=
 =?us-ascii?Q?aZjiq6AGOFfKzsmKYC/S8BIT?=
Content-Type: multipart/alternative;
 boundary="_000_MN2PR12MB4488E82C859899CDB2BE8D7AF7539MN2PR12MB4488namp_"
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB4488.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 83294e79-c590-4856-de26-08d91480233f
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 May 2021 13:24:42.8049 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: VwqQFtqc8Nd2/SE1c23TO7LadLh1lcb8yEG5OOFvDaSO1c/ZMb26wTf9MuKgrBprbkgWeUx6S3mS2oEO8kralw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4640
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
Cc: "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
 "helgaas@kernel.org" <helgaas@kernel.org>, "Kuehling,
 Felix" <Felix.Kuehling@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--_000_MN2PR12MB4488E82C859899CDB2BE8D7AF7539MN2PR12MB4488namp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

[AMD Public Use]

Typo in the subject: devie > device

Alex
________________________________
From: Grodzovsky, Andrey <Andrey.Grodzovsky@amd.com>
Sent: Monday, May 10, 2021 12:36 PM
To: dri-devel@lists.freedesktop.org <dri-devel@lists.freedesktop.org>; amd-=
gfx@lists.freedesktop.org <amd-gfx@lists.freedesktop.org>; linux-pci@vger.k=
ernel.org <linux-pci@vger.kernel.org>; ckoenig.leichtzumerken@gmail.com <ck=
oenig.leichtzumerken@gmail.com>; daniel.vetter@ffwll.ch <daniel.vetter@ffwl=
l.ch>; Wentland, Harry <Harry.Wentland@amd.com>
Cc: ppaalanen@gmail.com <ppaalanen@gmail.com>; Deucher, Alexander <Alexande=
r.Deucher@amd.com>; gregkh@linuxfoundation.org <gregkh@linuxfoundation.org>=
; helgaas@kernel.org <helgaas@kernel.org>; Kuehling, Felix <Felix.Kuehling@=
amd.com>; Grodzovsky, Andrey <Andrey.Grodzovsky@amd.com>
Subject: [PATCH v6 04/16] drm/amdkfd: Split kfd suspend from devie exit

Helps to expdite HW related stuff to amdgpu_pci_remove

Signed-off-by: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.c | 2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.h | 2 +-
 drivers/gpu/drm/amd/amdkfd/kfd_device.c    | 3 ++-
 3 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.c b/drivers/gpu/drm/a=
md/amdgpu/amdgpu_amdkfd.c
index 5f6696a3c778..2b06dee9a0ce 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.c
@@ -170,7 +170,7 @@ void amdgpu_amdkfd_device_init(struct amdgpu_device *ad=
ev)
         }
 }

-void amdgpu_amdkfd_device_fini(struct amdgpu_device *adev)
+void amdgpu_amdkfd_device_fini_sw(struct amdgpu_device *adev)
 {
         if (adev->kfd.dev) {
                 kgd2kfd_device_exit(adev->kfd.dev);
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.h b/drivers/gpu/drm/a=
md/amdgpu/amdgpu_amdkfd.h
index 14f68c028126..f8e10af99c28 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.h
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.h
@@ -127,7 +127,7 @@ void amdgpu_amdkfd_interrupt(struct amdgpu_device *adev=
,
                         const void *ih_ring_entry);
 void amdgpu_amdkfd_device_probe(struct amdgpu_device *adev);
 void amdgpu_amdkfd_device_init(struct amdgpu_device *adev);
-void amdgpu_amdkfd_device_fini(struct amdgpu_device *adev);
+void amdgpu_amdkfd_device_fini_sw(struct amdgpu_device *adev);
 int amdgpu_amdkfd_submit_ib(struct kgd_dev *kgd, enum kgd_engine_type engi=
ne,
                                 uint32_t vmid, uint64_t gpu_addr,
                                 uint32_t *ib_cmd, uint32_t ib_len);
diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_device.c b/drivers/gpu/drm/amd/=
amdkfd/kfd_device.c
index 357b9bf62a1c..ab6d2a43c9a3 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_device.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_device.c
@@ -858,10 +858,11 @@ bool kgd2kfd_device_init(struct kfd_dev *kfd,
         return kfd->init_complete;
 }

+
+
 void kgd2kfd_device_exit(struct kfd_dev *kfd)
 {
         if (kfd->init_complete) {
-               kgd2kfd_suspend(kfd, false);
                 device_queue_manager_uninit(kfd->dqm);
                 kfd_interrupt_exit(kfd);
                 kfd_topology_remove_device(kfd);
--
2.25.1


--_000_MN2PR12MB4488E82C859899CDB2BE8D7AF7539MN2PR12MB4488namp_
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
<p style=3D"font-family:Arial;font-size:10pt;color:#317100;margin:15pt;" al=
ign=3D"Left">
[AMD Public Use]<br>
</p>
<br>
<div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
Typo in the subject: <span class=3D"ITWTqi_23IoOPmK3O6ErT">devie</span> &gt=
; device</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
Alex<br>
</div>
<div id=3D"appendonsend"></div>
<hr style=3D"display:inline-block;width:98%" tabindex=3D"-1">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" st=
yle=3D"font-size:11pt" color=3D"#000000"><b>From:</b> Grodzovsky, Andrey &l=
t;Andrey.Grodzovsky@amd.com&gt;<br>
<b>Sent:</b> Monday, May 10, 2021 12:36 PM<br>
<b>To:</b> dri-devel@lists.freedesktop.org &lt;dri-devel@lists.freedesktop.=
org&gt;; amd-gfx@lists.freedesktop.org &lt;amd-gfx@lists.freedesktop.org&gt=
;; linux-pci@vger.kernel.org &lt;linux-pci@vger.kernel.org&gt;; ckoenig.lei=
chtzumerken@gmail.com &lt;ckoenig.leichtzumerken@gmail.com&gt;;
 daniel.vetter@ffwll.ch &lt;daniel.vetter@ffwll.ch&gt;; Wentland, Harry &lt=
;Harry.Wentland@amd.com&gt;<br>
<b>Cc:</b> ppaalanen@gmail.com &lt;ppaalanen@gmail.com&gt;; Deucher, Alexan=
der &lt;Alexander.Deucher@amd.com&gt;; gregkh@linuxfoundation.org &lt;gregk=
h@linuxfoundation.org&gt;; helgaas@kernel.org &lt;helgaas@kernel.org&gt;; K=
uehling, Felix &lt;Felix.Kuehling@amd.com&gt;; Grodzovsky, Andrey
 &lt;Andrey.Grodzovsky@amd.com&gt;<br>
<b>Subject:</b> [PATCH v6 04/16] drm/amdkfd: Split kfd suspend from devie e=
xit</font>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt;=
">
<div class=3D"PlainText">Helps to expdite HW related stuff to amdgpu_pci_re=
move<br>
<br>
Signed-off-by: Andrey Grodzovsky &lt;andrey.grodzovsky@amd.com&gt;<br>
---<br>
&nbsp;drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.c | 2 +-<br>
&nbsp;drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.h | 2 +-<br>
&nbsp;drivers/gpu/drm/amd/amdkfd/kfd_device.c&nbsp;&nbsp;&nbsp; | 3 ++-<br>
&nbsp;3 files changed, 4 insertions(+), 3 deletions(-)<br>
<br>
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.c b/drivers/gpu/drm/a=
md/amdgpu/amdgpu_amdkfd.c<br>
index 5f6696a3c778..2b06dee9a0ce 100644<br>
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.c<br>
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.c<br>
@@ -170,7 +170,7 @@ void amdgpu_amdkfd_device_init(struct amdgpu_device *ad=
ev)<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&nbsp;}<br>
&nbsp;<br>
-void amdgpu_amdkfd_device_fini(struct amdgpu_device *adev)<br>
+void amdgpu_amdkfd_device_fini_sw(struct amdgpu_device *adev)<br>
&nbsp;{<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (adev-&gt;kfd.dev) {<br=
>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; kgd2kfd_device_exit(adev-&gt;kfd.dev);<br>
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.h b/drivers/gpu/drm/a=
md/amdgpu/amdgpu_amdkfd.h<br>
index 14f68c028126..f8e10af99c28 100644<br>
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.h<br>
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.h<br>
@@ -127,7 +127,7 @@ void amdgpu_amdkfd_interrupt(struct amdgpu_device *adev=
,<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; const=
 void *ih_ring_entry);<br>
&nbsp;void amdgpu_amdkfd_device_probe(struct amdgpu_device *adev);<br>
&nbsp;void amdgpu_amdkfd_device_init(struct amdgpu_device *adev);<br>
-void amdgpu_amdkfd_device_fini(struct amdgpu_device *adev);<br>
+void amdgpu_amdkfd_device_fini_sw(struct amdgpu_device *adev);<br>
&nbsp;int amdgpu_amdkfd_submit_ib(struct kgd_dev *kgd, enum kgd_engine_type=
 engine,<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; uint32_t vmid, uint64_t gpu_addr=
,<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; uint32_t *ib_cmd, uint32_t ib_le=
n);<br>
diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_device.c b/drivers/gpu/drm/amd/=
amdkfd/kfd_device.c<br>
index 357b9bf62a1c..ab6d2a43c9a3 100644<br>
--- a/drivers/gpu/drm/amd/amdkfd/kfd_device.c<br>
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_device.c<br>
@@ -858,10 +858,11 @@ bool kgd2kfd_device_init(struct kfd_dev *kfd,<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return kfd-&gt;init_comple=
te;<br>
&nbsp;}<br>
&nbsp;<br>
+<br>
+<br>
&nbsp;void kgd2kfd_device_exit(struct kfd_dev *kfd)<br>
&nbsp;{<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (kfd-&gt;init_complete)=
 {<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; kgd2kfd_suspend(kfd, false);<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; device_queue_manager_uninit(kfd-&gt;dqm);<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; kfd_interrupt_exit(kfd);<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; kfd_topology_remove_device(kfd);<br>
-- <br>
2.25.1<br>
<br>
</div>
</span></font></div>
</div>
</body>
</html>

--_000_MN2PR12MB4488E82C859899CDB2BE8D7AF7539MN2PR12MB4488namp_--
