Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E3F89B4DE6
	for <lists+dri-devel@lfdr.de>; Tue, 17 Sep 2019 14:36:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 970656EC3B;
	Tue, 17 Sep 2019 12:36:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-CO1-obe.outbound.protection.outlook.com
 (mail-eopbgr690072.outbound.protection.outlook.com [40.107.69.72])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A49F06EC3A
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Sep 2019 12:36:37 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Qlftv8wMkVB7GoyDB4Np5fPRWCypzpkde2C6KRu/jZ0QL/gRc4EoYmf98FM0fjWJDB2ZO6idcAWCJycrBE6aTw+0QEOrrqJ6ChhYrkMOcNFm0r6FKjgG4uD285pOf42ITRE0jZDJS4hhaczA0okv5HFTpTca1l4ErhwMo0dvNGzBnkgcjro1Tq95UY0vgrx78dwPw+CKth8AltvoURcgdpqkGDq5mj7Fhk1cmTYB/q78u6c7lYuabzgrjSwNR+JkBa9Av0/eNVAPjTvIEknKV1Pl9K+vmYOhKt5/Sy4vgwk8aUPeUmauTz7j86qxVLaTUzs49AKHl7iO3B44gtf3cw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=c9S/iHXK6B5BhvKvZAwTXJP++eoDhbLZ52mEhE/ggZM=;
 b=Og1k3lKlh2cq/12a3gl15et7nkvLjLHhlgl5ZmSB9JDvenrttO3kVRjdIjnuXBrKXitdkv9iy3fNxdiPy5jDy8N/3OZ8dR5f1wiNtjAELpSBZhXicaK8njPzizu7fezoY2fyEH4vmY4wzm0U5cHdaX4wMAEFeMROfaSR4mOCw3N11aDcN+gqZlCd77Fh66E/eCAdtqMCitKRrUVRpkiG/iryeZrsTpu7mtCfeufwOLrKhiEcgp6Di1zuYLB6U1mBrGAdhwpe4g7VE2rs/RoiuLsFky3Ppf8HJSPctIgoGWLdhDeZGVnr2BVZ+iEeAthSLUPVo7Vra0EZlQ1YyWhv9A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from MWHPR12MB1406.namprd12.prod.outlook.com (10.169.207.13) by
 MWHPR12MB1710.namprd12.prod.outlook.com (10.175.56.16) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2263.16; Tue, 17 Sep 2019 12:36:36 +0000
Received: from MWHPR12MB1406.namprd12.prod.outlook.com
 ([fe80::f101:efcf:4b19:b68d]) by MWHPR12MB1406.namprd12.prod.outlook.com
 ([fe80::f101:efcf:4b19:b68d%8]) with mapi id 15.20.2263.023; Tue, 17 Sep 2019
 12:36:36 +0000
From: "Zhou, David(ChunMing)" <David1.Zhou@amd.com>
To: Lionel Landwerlin <lionel.g.landwerlin@intel.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Subject: Re: [PATCH 1/1] drm/syncobj: add sideband payload
Thread-Topic: [PATCH 1/1] drm/syncobj: add sideband payload
Thread-Index: AQHVbUeZUQHaaBT+D0ur6hwP/XdANKcvzgFK
Date: Tue, 17 Sep 2019 12:36:36 +0000
Message-ID: <MWHPR12MB14060F7960E92E46B0CCC63BB48F0@MWHPR12MB1406.namprd12.prod.outlook.com>
References: <20190917110343.32371-1-lionel.g.landwerlin@intel.com>,
 <20190917110343.32371-2-lionel.g.landwerlin@intel.com>
In-Reply-To: <20190917110343.32371-2-lionel.g.landwerlin@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [101.87.176.8]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 2c462658-a7a5-496b-5434-08d73b6badfc
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(5600167)(711020)(4605104)(1401327)(4618075)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7193020);
 SRVR:MWHPR12MB1710; 
x-ms-traffictypediagnostic: MWHPR12MB1710:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MWHPR12MB1710182E7332E9FB5E59A3FBB48F0@MWHPR12MB1710.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:5516;
x-forefront-prvs: 01630974C0
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(136003)(366004)(346002)(376002)(396003)(39860400002)(199004)(189003)(54906003)(478600001)(76176011)(26005)(110136005)(14444005)(64756008)(66556008)(9686003)(5660300002)(476003)(54896002)(66946007)(66476007)(66446008)(33656002)(14454004)(76116006)(86362001)(8676002)(52536014)(229853002)(7736002)(486006)(6436002)(74316002)(105004)(8936002)(55016002)(81156014)(71200400001)(71190400001)(186003)(3846002)(256004)(6246003)(446003)(11346002)(81166006)(2501003)(99286004)(2906002)(91956017)(316002)(4326008)(6506007)(53546011)(7696005)(19627405001)(66066001)(25786009)(6116002)(102836004);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MWHPR12MB1710;
 H:MWHPR12MB1406.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: 44f3QN86rGDy4yVcGgVu1jBhcoCWKlMaVqvTUEpqigxGmmEEXEvHxm961mI4yxTqiucotRap9Mjp04bLn/Bn0LyD8HldfFUfo4yAGpob+IAKzzb/v9HRhr2+LUDXZ2usT9GbuFyFtboDctt1DmP+2Jn7HYpw45JSXa5+cRDj4i8gPqtLbcEp5ani8s1UxpxVJMv7vrXXFkHjvookCCBvHTFFSCd8NhtasiImEVhUCz+wkhng/3YY/9DvSrNBGnVQeGadaKKm+sapvnvaoxuklKIYu+f+ZhZrVAL/+42YuE4C3F9LexkInlEebusVLmE/BWHSauogEPcHPEcoZVrYWgsbnCDG3IgL5QKeJL4l4HHJ8T8QVRbubHsMkZ4/sPVSEM2Z6PfCNQ7mejTgZzLxBT2YueHb4S1nx4hy00XnA04=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2c462658-a7a5-496b-5434-08d73b6badfc
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Sep 2019 12:36:36.0630 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: rXhsqUWBB+lodL+il6lrWbfi86lnmPu3xZFC6aqNE7eV/UmOO1IcKu5Zzpo0Ad8L
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR12MB1710
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=c9S/iHXK6B5BhvKvZAwTXJP++eoDhbLZ52mEhE/ggZM=;
 b=v8C6KpVQ6oT47Kh7bphLyoWeKJX3I4LxgUX3/HpIfk1V2+B/2DkG3LVrrUOx/90KJlAXZvWAj3pYhFB80vUhphgTThhYhUG/BAbpwKGztTmixGuKMeIRvAu6VNU3WhNKQao4I9KL5mDHJ/lAXZQ/N7Ee1pTF6fsWrOPx2SPYqP4=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=David1.Zhou@amd.com; 
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.23
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
Cc: "Koenig, Christian" <Christian.Koenig@amd.com>,
 Jason Ekstrand <jason@jlekstrand.net>
Content-Type: multipart/mixed; boundary="===============0962489630=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============0962489630==
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_MWHPR12MB14060F7960E92E46B0CCC63BB48F0MWHPR12MB1406namp_"

--_000_MWHPR12MB14060F7960E92E46B0CCC63BB48F0MWHPR12MB1406namp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi Lionel,
The update looks good to me.
I tried your signal-order test, seems it isn't ready to run, not sure if I =
can reproduce your this issue.

-David
________________________________
From: Lionel Landwerlin <lionel.g.landwerlin@intel.com>
Sent: Tuesday, September 17, 2019 7:03 PM
To: dri-devel@lists.freedesktop.org <dri-devel@lists.freedesktop.org>
Cc: Lionel Landwerlin <lionel.g.landwerlin@intel.com>; Zhou, David(ChunMing=
) <David1.Zhou@amd.com>; Koenig, Christian <Christian.Koenig@amd.com>; Jaso=
n Ekstrand <jason@jlekstrand.net>
Subject: [PATCH 1/1] drm/syncobj: add sideband payload

The Vulkan timeline semaphores allow signaling to happen on the point
of the timeline without all of the its dependencies to be created.

The current 2 implementations (AMD/Intel) of the Vulkan spec on top of
the Linux kernel are using a thread to wait on the dependencies of a
given point to materialize and delay actual submission to the kernel
driver until the wait completes.

If a binary semaphore is submitted for signaling along the side of a
timeline semaphore waiting for completion that means that the drm
syncobj associated with that binary semaphore will not have a DMA
fence associated with it by the time vkQueueSubmit() returns. This and
the fact that a binary semaphore can be signaled and unsignaled as
before its DMA fences materialize mean that we cannot just rely on the
fence within the syncobj but we also need a sideband payload verifying
that the fence in the syncobj matches the last submission from the
Vulkan API point of view.

This change adds a sideband payload that is incremented with signaled
syncobj when vkQueueSubmit() is called. The next vkQueueSubmit()
waiting on a the syncobj will read the sideband payload and wait for a
fence chain element with a seqno superior or equal to the sideband
payload value to be added into the fence chain and use that fence to
trigger the submission on the kernel driver.

v2: Use a separate ioctl to get/set the sideband value (Christian)

v3: Use 2 ioctls for get/set (Christian)

v4: Use a single new ioctl

v5: a bunch of blattant mistakes
    Store payload atomically (Chris)

v6: Only touch atomic value once (Jason)

v7: Updated atomic value when importing sync file

Signed-off-by: Lionel Landwerlin <lionel.g.landwerlin@intel.com>
Reviewed-by: David Zhou <David1.Zhou@amd.com> (v6)
Cc: Christian Koenig <Christian.Koenig@amd.com>
Cc: Jason Ekstrand <jason@jlekstrand.net>
Cc: David(ChunMing) Zhou <David1.Zhou@amd.com>
---
 drivers/gpu/drm/drm_internal.h |  2 ++
 drivers/gpu/drm/drm_ioctl.c    |  3 ++
 drivers/gpu/drm/drm_syncobj.c  | 64 ++++++++++++++++++++++++++++++++--
 include/drm/drm_syncobj.h      |  9 +++++
 include/uapi/drm/drm.h         | 17 +++++++++
 5 files changed, 93 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/drm_internal.h b/drivers/gpu/drm/drm_internal.=
h
index 51a2055c8f18..e297dfd85019 100644
--- a/drivers/gpu/drm/drm_internal.h
+++ b/drivers/gpu/drm/drm_internal.h
@@ -208,6 +208,8 @@ int drm_syncobj_timeline_signal_ioctl(struct drm_device=
 *dev, void *data,
                                       struct drm_file *file_private);
 int drm_syncobj_query_ioctl(struct drm_device *dev, void *data,
                             struct drm_file *file_private);
+int drm_syncobj_binary_ioctl(struct drm_device *dev, void *data,
+                            struct drm_file *file_private);

 /* drm_framebuffer.c */
 void drm_framebuffer_print_info(struct drm_printer *p, unsigned int indent=
,
diff --git a/drivers/gpu/drm/drm_ioctl.c b/drivers/gpu/drm/drm_ioctl.c
index f675a3bb2c88..644d0bc800a4 100644
--- a/drivers/gpu/drm/drm_ioctl.c
+++ b/drivers/gpu/drm/drm_ioctl.c
@@ -703,6 +703,9 @@ static const struct drm_ioctl_desc drm_ioctls[] =3D {
                       DRM_RENDER_ALLOW),
         DRM_IOCTL_DEF(DRM_IOCTL_SYNCOBJ_QUERY, drm_syncobj_query_ioctl,
                       DRM_RENDER_ALLOW),
+       DRM_IOCTL_DEF(DRM_IOCTL_SYNCOBJ_BINARY, drm_syncobj_binary_ioctl,
+                     DRM_RENDER_ALLOW),
+
         DRM_IOCTL_DEF(DRM_IOCTL_CRTC_GET_SEQUENCE, drm_crtc_get_sequence_i=
octl, 0),
         DRM_IOCTL_DEF(DRM_IOCTL_CRTC_QUEUE_SEQUENCE, drm_crtc_queue_sequen=
ce_ioctl, 0),
         DRM_IOCTL_DEF(DRM_IOCTL_MODE_CREATE_LEASE, drm_mode_create_lease_i=
octl, DRM_MASTER),
diff --git a/drivers/gpu/drm/drm_syncobj.c b/drivers/gpu/drm/drm_syncobj.c
index 4b5c7b0ed714..2de8f1380890 100644
--- a/drivers/gpu/drm/drm_syncobj.c
+++ b/drivers/gpu/drm/drm_syncobj.c
@@ -418,8 +418,10 @@ int drm_syncobj_create(struct drm_syncobj **out_syncob=
j, uint32_t flags,
         if (flags & DRM_SYNCOBJ_CREATE_SIGNALED)
                 drm_syncobj_assign_null_handle(syncobj);

-       if (fence)
+       if (fence) {
                 drm_syncobj_replace_fence(syncobj, fence);
+               atomic64_set(&syncobj->binary_payload, fence->seqno);
+       }

         *out_syncobj =3D syncobj;
         return 0;
@@ -604,6 +606,7 @@ static int drm_syncobj_import_sync_file_fence(struct dr=
m_file *file_private,
         }

         drm_syncobj_replace_fence(syncobj, fence);
+       atomic64_set(&syncobj->binary_payload, fence->seqno);
         dma_fence_put(fence);
         drm_syncobj_put(syncobj);
         return 0;
@@ -1224,8 +1227,10 @@ drm_syncobj_reset_ioctl(struct drm_device *dev, void=
 *data,
         if (ret < 0)
                 return ret;

-       for (i =3D 0; i < args->count_handles; i++)
+       for (i =3D 0; i < args->count_handles; i++) {
                 drm_syncobj_replace_fence(syncobjs[i], NULL);
+               atomic64_set(&syncobjs[i]->binary_payload, 0);
+       }

         drm_syncobj_array_free(syncobjs, args->count_handles);

@@ -1395,6 +1400,61 @@ int drm_syncobj_query_ioctl(struct drm_device *dev, =
void *data,
                 if (ret)
                         break;
         }
+
+       drm_syncobj_array_free(syncobjs, args->count_handles);
+
+       return ret;
+}
+
+int drm_syncobj_binary_ioctl(struct drm_device *dev, void *data,
+                            struct drm_file *file_private)
+{
+       struct drm_syncobj_binary_array *args =3D data;
+       struct drm_syncobj **syncobjs;
+       u32 __user *access_flags =3D u64_to_user_ptr(args->access_flags);
+       u64 __user *values =3D u64_to_user_ptr(args->values);
+       u32 i;
+       int ret;
+
+       if (!drm_core_check_feature(dev, DRIVER_SYNCOBJ_TIMELINE))
+               return -EOPNOTSUPP;
+
+       if (args->pad !=3D 0)
+               return -EINVAL;
+
+       if (args->count_handles =3D=3D 0)
+               return -EINVAL;
+
+       ret =3D drm_syncobj_array_find(file_private,
+                                    u64_to_user_ptr(args->handles),
+                                    args->count_handles,
+                                    &syncobjs);
+       if (ret < 0)
+               return ret;
+
+       for (i =3D 0; i < args->count_handles; i++) {
+               u32 flags;
+               u64 value;
+
+               if (get_user(flags, &access_flags[i])) {
+                       ret =3D -EFAULT;
+                       break;
+               }
+
+               if (flags & DRM_SYNCOBJ_BINARY_VALUE_INC)
+                       value =3D atomic64_inc_return(&syncobjs[i]->binary_=
payload) - 1;
+               else if (flags & DRM_SYNCOBJ_BINARY_VALUE_READ)
+                       value =3D atomic64_read(&syncobjs[i]->binary_payloa=
d);
+
+               if (flags & DRM_SYNCOBJ_BINARY_VALUE_READ) {
+                       if (put_user(value, &values[i])) {
+                               ret =3D -EFAULT;
+                               break;
+                       }
+               }
+
+       }
+
         drm_syncobj_array_free(syncobjs, args->count_handles);

         return ret;
diff --git a/include/drm/drm_syncobj.h b/include/drm/drm_syncobj.h
index 6cf7243a1dc5..aa76cb3f9107 100644
--- a/include/drm/drm_syncobj.h
+++ b/include/drm/drm_syncobj.h
@@ -61,6 +61,15 @@ struct drm_syncobj {
          * @file: A file backing for this syncobj.
          */
         struct file *file;
+       /**
+        * @binary_payload: A 64bit payload for binary syncobjs.
+        *
+        * We use the payload value to wait on binary syncobj fences to
+        * materialize. It is a reservation mechanism for the signaler to
+        * express that at some point in the future a dma fence with the sa=
me
+        * seqno will be put into the syncobj.
+        */
+       atomic64_t binary_payload;
 };

 void drm_syncobj_free(struct kref *kref);
diff --git a/include/uapi/drm/drm.h b/include/uapi/drm/drm.h
index 8a5b2f8f8eb9..78a0a413b788 100644
--- a/include/uapi/drm/drm.h
+++ b/include/uapi/drm/drm.h
@@ -785,6 +785,22 @@ struct drm_syncobj_timeline_array {
         __u32 pad;
 };

+struct drm_syncobj_binary_array {
+       /* A pointer to an array of u32 syncobj handles. */
+       __u64 handles;
+       /* A pointer to an array of u32 access flags for each handle. */
+       __u64 access_flags;
+       /* The binary value of a syncobj is read before it is incremented. =
*/
+#define DRM_SYNCOBJ_BINARY_VALUE_READ (1u << 0)
+#define DRM_SYNCOBJ_BINARY_VALUE_INC  (1u << 1)
+       /* A pointer to an array of u64 values written to by the kernel if =
the
+        * handle is flagged for reading.
+        */
+       __u64 values;
+       /* The length of the 3 arrays above. */
+       __u32 count_handles;
+       __u32 pad;
+};

 /* Query current scanout sequence number */
 struct drm_crtc_get_sequence {
@@ -946,6 +962,7 @@ extern "C" {
 #define DRM_IOCTL_SYNCOBJ_QUERY         DRM_IOWR(0xCB, struct drm_syncobj_=
timeline_array)
 #define DRM_IOCTL_SYNCOBJ_TRANSFER      DRM_IOWR(0xCC, struct drm_syncobj_=
transfer)
 #define DRM_IOCTL_SYNCOBJ_TIMELINE_SIGNAL       DRM_IOWR(0xCD, struct drm_=
syncobj_timeline_array)
+#define DRM_IOCTL_SYNCOBJ_BINARY       DRM_IOWR(0xCE, struct drm_syncobj_b=
inary_array)

 /**
  * Device specific ioctls should only be in their respective headers
--
2.23.0


--_000_MWHPR12MB14060F7960E92E46B0CCC63BB48F0MWHPR12MB1406namp_
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
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
Hi Lionel,</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
The update looks good to me.</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
I tried your signal-order test, seems it isn't ready to run, not sure if I =
can reproduce your this issue.</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
-David</div>
<div id=3D"appendonsend"></div>
<hr style=3D"display:inline-block;width:98%" tabindex=3D"-1">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" st=
yle=3D"font-size:11pt" color=3D"#000000"><b>From:</b> Lionel Landwerlin &lt=
;lionel.g.landwerlin@intel.com&gt;<br>
<b>Sent:</b> Tuesday, September 17, 2019 7:03 PM<br>
<b>To:</b> dri-devel@lists.freedesktop.org &lt;dri-devel@lists.freedesktop.=
org&gt;<br>
<b>Cc:</b> Lionel Landwerlin &lt;lionel.g.landwerlin@intel.com&gt;; Zhou, D=
avid(ChunMing) &lt;David1.Zhou@amd.com&gt;; Koenig, Christian &lt;Christian=
.Koenig@amd.com&gt;; Jason Ekstrand &lt;jason@jlekstrand.net&gt;<br>
<b>Subject:</b> [PATCH 1/1] drm/syncobj: add sideband payload</font>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt;=
">
<div class=3D"PlainText">The Vulkan timeline semaphores allow signaling to =
happen on the point<br>
of the timeline without all of the its dependencies to be created.<br>
<br>
The current 2 implementations (AMD/Intel) of the Vulkan spec on top of<br>
the Linux kernel are using a thread to wait on the dependencies of a<br>
given point to materialize and delay actual submission to the kernel<br>
driver until the wait completes.<br>
<br>
If a binary semaphore is submitted for signaling along the side of a<br>
timeline semaphore waiting for completion that means that the drm<br>
syncobj associated with that binary semaphore will not have a DMA<br>
fence associated with it by the time vkQueueSubmit() returns. This and<br>
the fact that a binary semaphore can be signaled and unsignaled as<br>
before its DMA fences materialize mean that we cannot just rely on the<br>
fence within the syncobj but we also need a sideband payload verifying<br>
that the fence in the syncobj matches the last submission from the<br>
Vulkan API point of view.<br>
<br>
This change adds a sideband payload that is incremented with signaled<br>
syncobj when vkQueueSubmit() is called. The next vkQueueSubmit()<br>
waiting on a the syncobj will read the sideband payload and wait for a<br>
fence chain element with a seqno superior or equal to the sideband<br>
payload value to be added into the fence chain and use that fence to<br>
trigger the submission on the kernel driver.<br>
<br>
v2: Use a separate ioctl to get/set the sideband value (Christian)<br>
<br>
v3: Use 2 ioctls for get/set (Christian)<br>
<br>
v4: Use a single new ioctl<br>
<br>
v5: a bunch of blattant mistakes<br>
&nbsp;&nbsp;&nbsp; Store payload atomically (Chris)<br>
<br>
v6: Only touch atomic value once (Jason)<br>
<br>
v7: Updated atomic value when importing sync file<br>
<br>
Signed-off-by: Lionel Landwerlin &lt;lionel.g.landwerlin@intel.com&gt;<br>
Reviewed-by: David Zhou &lt;David1.Zhou@amd.com&gt; (v6)<br>
Cc: Christian Koenig &lt;Christian.Koenig@amd.com&gt;<br>
Cc: Jason Ekstrand &lt;jason@jlekstrand.net&gt;<br>
Cc: David(ChunMing) Zhou &lt;David1.Zhou@amd.com&gt;<br>
---<br>
&nbsp;drivers/gpu/drm/drm_internal.h |&nbsp; 2 &#43;&#43;<br>
&nbsp;drivers/gpu/drm/drm_ioctl.c&nbsp;&nbsp;&nbsp; |&nbsp; 3 &#43;&#43;<br=
>
&nbsp;drivers/gpu/drm/drm_syncobj.c&nbsp; | 64 &#43;&#43;&#43;&#43;&#43;&#4=
3;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#4=
3;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;--<br>
&nbsp;include/drm/drm_syncobj.h&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |&nbsp; 9 &#4=
3;&#43;&#43;&#43;&#43;<br>
&nbsp;include/uapi/drm/drm.h&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
; | 17 &#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;<br>
&nbsp;5 files changed, 93 insertions(&#43;), 2 deletions(-)<br>
<br>
diff --git a/drivers/gpu/drm/drm_internal.h b/drivers/gpu/drm/drm_internal.=
h<br>
index 51a2055c8f18..e297dfd85019 100644<br>
--- a/drivers/gpu/drm/drm_internal.h<br>
&#43;&#43;&#43; b/drivers/gpu/drm/drm_internal.h<br>
@@ -208,6 &#43;208,8 @@ int drm_syncobj_timeline_signal_ioctl(struct drm_de=
vice *dev, void *data,<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; struct drm_file *file_private);<br>
&nbsp;int drm_syncobj_query_ioctl(struct drm_device *dev, void *data,<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp; struct drm_file *file_private);<br>
&#43;int drm_syncobj_binary_ioctl(struct drm_device *dev, void *data,<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp; struct drm_file *file_private);<br>
&nbsp;<br>
&nbsp;/* drm_framebuffer.c */<br>
&nbsp;void drm_framebuffer_print_info(struct drm_printer *p, unsigned int i=
ndent,<br>
diff --git a/drivers/gpu/drm/drm_ioctl.c b/drivers/gpu/drm/drm_ioctl.c<br>
index f675a3bb2c88..644d0bc800a4 100644<br>
--- a/drivers/gpu/drm/drm_ioctl.c<br>
&#43;&#43;&#43; b/drivers/gpu/drm/drm_ioctl.c<br>
@@ -703,6 &#43;703,9 @@ static const struct drm_ioctl_desc drm_ioctls[] =3D=
 {<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; DRM_RENDER_ALLOW)=
,<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; DRM_IOCTL_DEF(DRM_IOCTL_SY=
NCOBJ_QUERY, drm_syncobj_query_ioctl,<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; DRM_RENDER_ALLOW)=
,<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; DRM_IOCTL_DEF(DRM_IOCTL_SYNCOBJ_B=
INARY, drm_syncobj_binary_ioctl,<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; DRM_RENDER_ALLOW),<br>
&#43;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; DRM_IOCTL_DEF(DRM_IOCTL_CR=
TC_GET_SEQUENCE, drm_crtc_get_sequence_ioctl, 0),<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; DRM_IOCTL_DEF(DRM_IOCTL_CR=
TC_QUEUE_SEQUENCE, drm_crtc_queue_sequence_ioctl, 0),<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; DRM_IOCTL_DEF(DRM_IOCTL_MO=
DE_CREATE_LEASE, drm_mode_create_lease_ioctl, DRM_MASTER),<br>
diff --git a/drivers/gpu/drm/drm_syncobj.c b/drivers/gpu/drm/drm_syncobj.c<=
br>
index 4b5c7b0ed714..2de8f1380890 100644<br>
--- a/drivers/gpu/drm/drm_syncobj.c<br>
&#43;&#43;&#43; b/drivers/gpu/drm/drm_syncobj.c<br>
@@ -418,8 &#43;418,10 @@ int drm_syncobj_create(struct drm_syncobj **out_sy=
ncobj, uint32_t flags,<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (flags &amp; DRM_SYNCOB=
J_CREATE_SIGNALED)<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; drm_syncobj_assign_null_handle(syncobj);<br>
&nbsp;<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (fence)<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (fence) {<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; drm_syncobj_replace_fence(syncobj, fence);<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; atomic64_set(&amp;syncobj-&gt;binary_payload, fence-&gt;seqn=
o);<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&nbsp;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; *out_syncobj =3D syncobj;<=
br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return 0;<br>
@@ -604,6 &#43;606,7 @@ static int drm_syncobj_import_sync_file_fence(struc=
t drm_file *file_private,<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&nbsp;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; drm_syncobj_replace_fence(=
syncobj, fence);<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; atomic64_set(&amp;syncobj-&gt;bin=
ary_payload, fence-&gt;seqno);<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; dma_fence_put(fence);<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; drm_syncobj_put(syncobj);<=
br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return 0;<br>
@@ -1224,8 &#43;1227,10 @@ drm_syncobj_reset_ioctl(struct drm_device *dev, =
void *data,<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (ret &lt; 0)<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; return ret;<br>
&nbsp;<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; for (i =3D 0; i &lt; args-&gt;count_h=
andles; i&#43;&#43;)<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; for (i =3D 0; i &lt; args-&gt;cou=
nt_handles; i&#43;&#43;) {<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; drm_syncobj_replace_fence(syncobjs[i], NULL);<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; atomic64_set(&amp;syncobjs[i]-&gt;binary_payload, 0);<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&nbsp;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; drm_syncobj_array_free(syn=
cobjs, args-&gt;count_handles);<br>
&nbsp;<br>
@@ -1395,6 &#43;1400,61 @@ int drm_syncobj_query_ioctl(struct drm_device *d=
ev, void *data,<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; if (ret)<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; break=
;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&#43;<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; drm_syncobj_array_free(syncobjs, =
args-&gt;count_handles);<br>
&#43;<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return ret;<br>
&#43;}<br>
&#43;<br>
&#43;int drm_syncobj_binary_ioctl(struct drm_device *dev, void *data,<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp; struct drm_file *file_private)<br>
&#43;{<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; struct drm_syncobj_binary_array *=
args =3D data;<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; struct drm_syncobj **syncobjs;<br=
>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; u32 __user *access_flags =3D u64_=
to_user_ptr(args-&gt;access_flags);<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; u64 __user *values =3D u64_to_use=
r_ptr(args-&gt;values);<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; u32 i;<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; int ret;<br>
&#43;<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (!drm_core_check_feature(dev, =
DRIVER_SYNCOBJ_TIMELINE))<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; return -EOPNOTSUPP;<br>
&#43;<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (args-&gt;pad !=3D 0)<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; return -EINVAL;<br>
&#43;<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (args-&gt;count_handles =3D=3D=
 0)<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; return -EINVAL;<br>
&#43;<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ret =3D drm_syncobj_array_find(fi=
le_private,<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; u64_to_us=
er_ptr(args-&gt;handles),<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; args-&gt;=
count_handles,<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &amp;sync=
objs);<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (ret &lt; 0)<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; return ret;<br>
&#43;<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; for (i =3D 0; i &lt; args-&gt;cou=
nt_handles; i&#43;&#43;) {<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; u32 flags;<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; u64 value;<br>
&#43;<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; if (get_user(flags, &amp;access_flags[i])) {<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ret =3D -EFA=
ULT;<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; break;<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; }<br>
&#43;<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; if (flags &amp; DRM_SYNCOBJ_BINARY_VALUE_INC)<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; value =3D at=
omic64_inc_return(&amp;syncobjs[i]-&gt;binary_payload) - 1;<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; else if (flags &amp; DRM_SYNCOBJ_BINARY_VALUE_READ)<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; value =3D at=
omic64_read(&amp;syncobjs[i]-&gt;binary_payload);<br>
&#43;<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; if (flags &amp; DRM_SYNCOBJ_BINARY_VALUE_READ) {<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (put_user=
(value, &amp;values[i])) {<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ret =3D -EFAULT;<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; break;<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; }<br>
&#43;<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&#43;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; drm_syncobj_array_free(syn=
cobjs, args-&gt;count_handles);<br>
&nbsp;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return ret;<br>
diff --git a/include/drm/drm_syncobj.h b/include/drm/drm_syncobj.h<br>
index 6cf7243a1dc5..aa76cb3f9107 100644<br>
--- a/include/drm/drm_syncobj.h<br>
&#43;&#43;&#43; b/include/drm/drm_syncobj.h<br>
@@ -61,6 &#43;61,15 @@ struct drm_syncobj {<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; * @file: A file back=
ing for this syncobj.<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; */<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; struct file *file;<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /**<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; * @binary_payload: A 64bit =
payload for binary syncobjs.<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; *<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; * We use the payload value =
to wait on binary syncobj fences to<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; * materialize. It is a rese=
rvation mechanism for the signaler to<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; * express that at some poin=
t in the future a dma fence with the same<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; * seqno will be put into th=
e syncobj.<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; */<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; atomic64_t binary_payload;<br>
&nbsp;};<br>
&nbsp;<br>
&nbsp;void drm_syncobj_free(struct kref *kref);<br>
diff --git a/include/uapi/drm/drm.h b/include/uapi/drm/drm.h<br>
index 8a5b2f8f8eb9..78a0a413b788 100644<br>
--- a/include/uapi/drm/drm.h<br>
&#43;&#43;&#43; b/include/uapi/drm/drm.h<br>
@@ -785,6 &#43;785,22 @@ struct drm_syncobj_timeline_array {<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; __u32 pad;<br>
&nbsp;};<br>
&nbsp;<br>
&#43;struct drm_syncobj_binary_array {<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* A pointer to an array of u32 s=
yncobj handles. */<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; __u64 handles;<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* A pointer to an array of u32 a=
ccess flags for each handle. */<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; __u64 access_flags;<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* The binary value of a syncobj =
is read before it is incremented. */<br>
&#43;#define DRM_SYNCOBJ_BINARY_VALUE_READ (1u &lt;&lt; 0)<br>
&#43;#define DRM_SYNCOBJ_BINARY_VALUE_INC&nbsp; (1u &lt;&lt; 1)<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* A pointer to an array of u64 v=
alues written to by the kernel if the<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; * handle is flagged for rea=
ding.<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; */<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; __u64 values;<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* The length of the 3 arrays abo=
ve. */<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; __u32 count_handles;<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; __u32 pad;<br>
&#43;};<br>
&nbsp;<br>
&nbsp;/* Query current scanout sequence number */<br>
&nbsp;struct drm_crtc_get_sequence {<br>
@@ -946,6 &#43;962,7 @@ extern &quot;C&quot; {<br>
&nbsp;#define DRM_IOCTL_SYNCOBJ_QUERY&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; DRM_IOWR(0xCB, struct drm_syncobj_timeline_array)<br>
&nbsp;#define DRM_IOCTL_SYNCOBJ_TRANSFER&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; DRM_=
IOWR(0xCC, struct drm_syncobj_transfer)<br>
&nbsp;#define DRM_IOCTL_SYNCOBJ_TIMELINE_SIGNAL&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp; DRM_IOWR(0xCD, struct drm_syncobj_timeline_array)<br>
&#43;#define DRM_IOCTL_SYNCOBJ_BINARY&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; D=
RM_IOWR(0xCE, struct drm_syncobj_binary_array)<br>
&nbsp;<br>
&nbsp;/**<br>
&nbsp; * Device specific ioctls should only be in their respective headers<=
br>
-- <br>
2.23.0<br>
<br>
</div>
</span></font></div>
</body>
</html>

--_000_MWHPR12MB14060F7960E92E46B0CCC63BB48F0MWHPR12MB1406namp_--

--===============0962489630==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0962489630==--
