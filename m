Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 479D227C7B
	for <lists+dri-devel@lfdr.de>; Thu, 23 May 2019 14:11:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8D37489D73;
	Thu, 23 May 2019 12:11:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-CY1-obe.outbound.protection.outlook.com
 (mail-eopbgr760088.outbound.protection.outlook.com [40.107.76.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6DE3C89D73;
 Thu, 23 May 2019 12:11:22 +0000 (UTC)
Received: from MN2PR12MB2910.namprd12.prod.outlook.com (20.179.81.219) by
 MN2PR12MB3327.namprd12.prod.outlook.com (20.178.243.84) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1922.18; Thu, 23 May 2019 12:11:20 +0000
Received: from MN2PR12MB2910.namprd12.prod.outlook.com
 ([fe80::385d:9453:a16d:3964]) by MN2PR12MB2910.namprd12.prod.outlook.com
 ([fe80::385d:9453:a16d:3964%6]) with mapi id 15.20.1922.017; Thu, 23 May 2019
 12:11:20 +0000
From: "Zhou, David(ChunMing)" <David1.Zhou@amd.com>
To: Lionel Landwerlin <lionel.g.landwerlin@intel.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>
Subject: Re:[PATCH 1/2] drm/syncobj: add an output syncobj parameter to
 find_fence
Thread-Topic: Re:[PATCH 1/2] drm/syncobj: add an output syncobj parameter to
 find_fence
Thread-Index: AQHVEV0oNxfE5mUrmUOptueOxTf8zKZ4nojJ
Date: Thu, 23 May 2019 12:11:20 +0000
Message-ID: <-puwqkvl1kf9u-b7x3md-nw9l5d8fjhc1-57ay9i80p3ne5zfq-v36laytxxssb-707g2imrn1o7-kvonq5nbuaig-6dlanc9wrlar1w0zlrxn0apu-qaxsb6-ac864zux0f2o3d8y3zq369i3-f7fg8.1558613478804@email.android.com>
References: <20190523114620.19335-1-lionel.g.landwerlin@intel.com>,
 <20190523114620.19335-2-lionel.g.landwerlin@intel.com>
In-Reply-To: <20190523114620.19335-2-lionel.g.landwerlin@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [101.86.234.22]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: c4bfc9c7-f43e-496b-4914-08d6df77c419
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600141)(711020)(4605104)(4618075)(2017052603328)(7193020);
 SRVR:MN2PR12MB3327; 
x-ms-traffictypediagnostic: MN2PR12MB3327:
x-microsoft-antispam-prvs: <MN2PR12MB3327E1891D8618341E692CE3B4010@MN2PR12MB3327.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:4502;
x-forefront-prvs: 00462943DE
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(136003)(396003)(39860400002)(366004)(346002)(376002)(13464003)(189003)(199004)(54896002)(72206003)(6486002)(316002)(91956017)(76116006)(66446008)(64756008)(66556008)(66476007)(66946007)(478600001)(73956011)(5660300002)(6512007)(9686003)(81166006)(81156014)(8676002)(8936002)(2501003)(14444005)(256004)(7736002)(6436002)(66066001)(54906003)(3846002)(6116002)(76176011)(25786009)(68736007)(86362001)(102836004)(6506007)(4326008)(53936002)(476003)(11346002)(446003)(486006)(110136005)(71190400001)(71200400001)(99286004)(2906002)(26005)(186003)(14454004)(37363001)(87826002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR12MB3327;
 H:MN2PR12MB2910.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: lhWQOLMNwNOUkTFvNwUbzzzjA4Vdo0jRZcQosCGC4Vh/vX1CC17g0Ud/ZXpTlKXvjolISPmLcWGlX3Gj9BWTSJar0g4Vq4ke8I1upU4q9nivHtY4qVNsw0EQuj2G/9HZG1TN4dt+q64TPHrYfIYZpDZxTJ+iY0CYgZXoWs/37adro7ExticfajckEgTFVcUAH964nhjzRO4fSPrBxdM0LBRRRfVv4OMKn5cE8aEVcoI5Dhua/43ygau+DUwaTZdDeMn08UuGK/vxQELkA4AX/L6dp//PTtvpQjgpaKwzZivmYt645mkCmggIep/5lUtPX+2Us42NiiBU/sZCXldQ4LY+8d3ObuUtk6I7O8AebAAuWZV0Uk25QfcvZ7dZZB1GyRPowQ6QY9RfG6STE4I2A1gvAiSCQGkwDWT0LQisuso=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c4bfc9c7-f43e-496b-4914-08d6df77c419
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 May 2019 12:11:20.1238 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: zhoucm1@amd.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3327
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=c+cZHM357duC9Az6walKVHjf+NmODG6ztndh0lb0Q4c=;
 b=Tr8NA2AzCk+WxsyzWxuZIGlk+Z6xRtB2oMxNJh1cK8RcFfVigUAzgCg5/jXUpxZO3t5l/jVzD5+fCkzEG+U2E5S3egHPddktlrHo+1eQRbHKGwQ+wBl5mwHN+VEfktEwAX0YTo9w2mYer/FEfyfLIz9/2rL05gJolwToc3iLif4=
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
 DRI-Devel <dri-devel@lists.freedesktop.org>
Content-Type: multipart/mixed; boundary="===============0245364130=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============0245364130==
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_puwqkvl1kf9ub7x3mdnw9l5d8fjhc157ay9i80p3ne5zfqv36laytxx_"

--_000_puwqkvl1kf9ub7x3mdnw9l5d8fjhc157ay9i80p3ne5zfqv36laytxx_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

can you make the parameter optional? Otherwise looks good to me.

-David

-------- Original Message --------
Subject: [PATCH 1/2] drm/syncobj: add an output syncobj parameter to find_f=
ence
From: Lionel Landwerlin
To: intel-gfx@lists.freedesktop.org
CC: Lionel Landwerlin ,"Koenig, Christian" ,"Zhou, David(ChunMing)" ,Eric A=
nholt ,DRI-Devel

[CAUTION: External Email]

We would like to get both the fence & the syncobj in i915 rather than
doing 2 calls to drm_syncobj_find() & drm_syncobj_find_fence().

Signed-off-by: Lionel Landwerlin <lionel.g.landwerlin@intel.com>
Cc: Christian Koenig <Christian.Koenig@amd.com>
Cc: David(ChunMing) Zhou <David1.Zhou@amd.com>
Cc: Eric Anholt <eric@anholt.net>
CC: DRI-Devel <dri-devel@lists.freedesktop.org>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c |  4 ++-
 drivers/gpu/drm/drm_syncobj.c          | 45 +++++++++++++++++---------
 drivers/gpu/drm/v3d/v3d_gem.c          |  5 ++-
 include/drm/drm_syncobj.h              |  1 +
 4 files changed, 38 insertions(+), 17 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c b/drivers/gpu/drm/amd/a=
mdgpu/amdgpu_cs.c
index 2f6239b6be6f..09fde3c73a2c 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
@@ -1124,10 +1124,11 @@ static int amdgpu_syncobj_lookup_and_add_to_sync(st=
ruct amdgpu_cs_parser *p,
                                                 uint32_t handle, u64 point=
,
                                                 u64 flags)
 {
+       struct drm_syncobj *syncobj;
        struct dma_fence *fence;
        int r;

-       r =3D drm_syncobj_find_fence(p->filp, handle, point, flags, &fence)=
;
+       r =3D drm_syncobj_find_fence(p->filp, handle, point, flags, &syncob=
j, &fence);
        if (r) {
                DRM_ERROR("syncobj %u failed to find fence @ %llu (%d)!\n",
                          handle, point, r);
@@ -1136,6 +1137,7 @@ static int amdgpu_syncobj_lookup_and_add_to_sync(stru=
ct amdgpu_cs_parser *p,

        r =3D amdgpu_sync_fence(p->adev, &p->job->sync, fence, true);
        dma_fence_put(fence);
+       drm_syncobj_put(syncobj);

        return r;
 }
diff --git a/drivers/gpu/drm/drm_syncobj.c b/drivers/gpu/drm/drm_syncobj.c
index 3d400905100b..f2fd0c1fb1d3 100644
--- a/drivers/gpu/drm/drm_syncobj.c
+++ b/drivers/gpu/drm/drm_syncobj.c
@@ -222,29 +222,32 @@ static void drm_syncobj_assign_null_handle(struct drm=
_syncobj *syncobj)
  * @handle: sync object handle to lookup.
  * @point: timeline point
  * @flags: DRM_SYNCOBJ_WAIT_FLAGS_WAIT_FOR_SUBMIT or not
+ * @syncobj: out parameter for the syncobj
  * @fence: out parameter for the fence
  *
  * This is just a convenience function that combines drm_syncobj_find() an=
d
  * drm_syncobj_fence_get().
  *
- * Returns 0 on success or a negative error value on failure. On success @=
fence
- * contains a reference to the fence, which must be released by calling
- * dma_fence_put().
+ * Returns 0 on success or a negative error value on failure. On
+ * success @syncobj and @fence contains a reference respectively to
+ * the syncobj and to the fence, which must be released by calling
+ * respectively drm_syncobj_put() and dma_fence_put().
  */
 int drm_syncobj_find_fence(struct drm_file *file_private,
                           u32 handle, u64 point, u64 flags,
+                          struct drm_syncobj **syncobj,
                           struct dma_fence **fence)
 {
-       struct drm_syncobj *syncobj =3D drm_syncobj_find(file_private, hand=
le);
        struct syncobj_wait_entry wait;
        u64 timeout =3D nsecs_to_jiffies64(DRM_SYNCOBJ_WAIT_FOR_SUBMIT_TIME=
OUT);
        int ret;

-       if (!syncobj)
+       *syncobj =3D drm_syncobj_find(file_private, handle);
+
+       if (!(*syncobj))
                return -ENOENT;

-       *fence =3D drm_syncobj_fence_get(syncobj);
-       drm_syncobj_put(syncobj);
+       *fence =3D drm_syncobj_fence_get(*syncobj);

        if (*fence) {
                ret =3D dma_fence_chain_find_seqno(fence, point);
@@ -255,13 +258,15 @@ int drm_syncobj_find_fence(struct drm_file *file_priv=
ate,
                ret =3D -EINVAL;
        }

-       if (!(flags & DRM_SYNCOBJ_WAIT_FLAGS_WAIT_FOR_SUBMIT))
+       if (!(flags & DRM_SYNCOBJ_WAIT_FLAGS_WAIT_FOR_SUBMIT)) {
+               drm_syncobj_put(*syncobj);
                return ret;
+       }

        memset(&wait, 0, sizeof(wait));
        wait.task =3D current;
        wait.point =3D point;
-       drm_syncobj_fence_add_wait(syncobj, &wait);
+       drm_syncobj_fence_add_wait(*syncobj, &wait);

        do {
                set_current_state(TASK_INTERRUPTIBLE);
@@ -286,7 +291,10 @@ int drm_syncobj_find_fence(struct drm_file *file_priva=
te,
        *fence =3D wait.fence;

        if (wait.node.next)
-               drm_syncobj_remove_wait(syncobj, &wait);
+               drm_syncobj_remove_wait(*syncobj, &wait);
+
+       if (ret)
+               drm_syncobj_put(*syncobj);

        return ret;
 }
@@ -531,6 +539,7 @@ static int drm_syncobj_export_sync_file(struct drm_file=
 *file_private,
                                        int handle, int *p_fd)
 {
        int ret;
+       struct drm_syncobj *syncobj;
        struct dma_fence *fence;
        struct sync_file *sync_file;
        int fd =3D get_unused_fd_flags(O_CLOEXEC);
@@ -538,13 +547,14 @@ static int drm_syncobj_export_sync_file(struct drm_fi=
le *file_private,
        if (fd < 0)
                return fd;

-       ret =3D drm_syncobj_find_fence(file_private, handle, 0, 0, &fence);
+       ret =3D drm_syncobj_find_fence(file_private, handle, 0, 0, &syncobj=
, &fence);
        if (ret)
                goto err_put_fd;

        sync_file =3D sync_file_create(fence);

        dma_fence_put(fence);
+       drm_syncobj_put(syncobj);

        if (!sync_file) {
                ret =3D -EINVAL;
@@ -682,7 +692,8 @@ drm_syncobj_fd_to_handle_ioctl(struct drm_device *dev, =
void *data,
 static int drm_syncobj_transfer_to_timeline(struct drm_file *file_private,
                                            struct drm_syncobj_transfer *ar=
gs)
 {
-       struct drm_syncobj *timeline_syncobj =3D NULL;
+       struct drm_syncobj *timeline_syncobj;
+       struct drm_syncobj *src_syncobj;
        struct dma_fence *fence;
        struct dma_fence_chain *chain;
        int ret;
@@ -693,7 +704,7 @@ static int drm_syncobj_transfer_to_timeline(struct drm_=
file *file_private,
        }
        ret =3D drm_syncobj_find_fence(file_private, args->src_handle,
                                     args->src_point, args->flags,
-                                    &fence);
+                                    &src_syncobj, &fence);
        if (ret)
                goto err;
        chain =3D kzalloc(sizeof(struct dma_fence_chain), GFP_KERNEL);
@@ -704,6 +715,7 @@ static int drm_syncobj_transfer_to_timeline(struct drm_=
file *file_private,
        drm_syncobj_add_point(timeline_syncobj, chain, fence, args->dst_poi=
nt);
 err1:
        dma_fence_put(fence);
+       drm_syncobj_put(src_syncobj);
 err:
        drm_syncobj_put(timeline_syncobj);

@@ -714,7 +726,8 @@ static int
 drm_syncobj_transfer_to_binary(struct drm_file *file_private,
                               struct drm_syncobj_transfer *args)
 {
-       struct drm_syncobj *binary_syncobj =3D NULL;
+       struct drm_syncobj *binary_syncobj;
+       struct drm_syncobj *src_syncobj;
        struct dma_fence *fence;
        int ret;

@@ -722,11 +735,13 @@ drm_syncobj_transfer_to_binary(struct drm_file *file_=
private,
        if (!binary_syncobj)
                return -ENOENT;
        ret =3D drm_syncobj_find_fence(file_private, args->src_handle,
-                                    args->src_point, args->flags, &fence);
+                                    args->src_point, args->flags,
+                                    &src_syncobj, &fence);
        if (ret)
                goto err;
        drm_syncobj_replace_fence(binary_syncobj, fence);
        dma_fence_put(fence);
+       drm_syncobj_put(src_syncobj);
 err:
        drm_syncobj_put(binary_syncobj);

diff --git a/drivers/gpu/drm/v3d/v3d_gem.c b/drivers/gpu/drm/v3d/v3d_gem.c
index 27e0f87075d9..26bd3a2e39ca 100644
--- a/drivers/gpu/drm/v3d/v3d_gem.c
+++ b/drivers/gpu/drm/v3d/v3d_gem.c
@@ -431,6 +431,7 @@ v3d_job_init(struct v3d_dev *v3d, struct drm_file *file=
_priv,
             struct v3d_job *job, void (*free)(struct kref *ref),
             u32 in_sync)
 {
+       struct drm_syncobj *in_syncobj =3D NULL;
        struct dma_fence *in_fence =3D NULL;
        int ret;

@@ -443,10 +444,12 @@ v3d_job_init(struct v3d_dev *v3d, struct drm_file *fi=
le_priv,

        xa_init_flags(&job->deps, XA_FLAGS_ALLOC);

-       ret =3D drm_syncobj_find_fence(file_priv, in_sync, 0, 0, &in_fence)=
;
+       ret =3D drm_syncobj_find_fence(file_priv, in_sync, 0, 0, &syncobj, =
&in_fence);
        if (ret =3D=3D -EINVAL)
                goto fail;

+       drm_syncobj_put(in_sync);
+
        ret =3D drm_gem_fence_array_add(&job->deps, in_fence);
        if (ret)
                goto fail;
diff --git a/include/drm/drm_syncobj.h b/include/drm/drm_syncobj.h
index 6cf7243a1dc5..08eca690f783 100644
--- a/include/drm/drm_syncobj.h
+++ b/include/drm/drm_syncobj.h
@@ -121,6 +121,7 @@ void drm_syncobj_replace_fence(struct drm_syncobj *sync=
obj,
                               struct dma_fence *fence);
 int drm_syncobj_find_fence(struct drm_file *file_private,
                           u32 handle, u64 point, u64 flags,
+                          struct drm_syncobj **syncobj,
                           struct dma_fence **fence);
 void drm_syncobj_free(struct kref *kref);
 int drm_syncobj_create(struct drm_syncobj **out_syncobj, uint32_t flags,
--
2.21.0.392.gf8f6787159e


--_000_puwqkvl1kf9ub7x3mdnw9l5d8fjhc157ay9i80p3ne5zfqv36laytxx_
Content-Type: text/html; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Diso-8859-=
1">
<meta name=3D"Generator" content=3D"Microsoft Exchange Server">
<!-- converted from text --><style><!-- .EmailQuote { margin-left: 1pt; pad=
ding-left: 4pt; border-left: #800000 2px solid; } --></style>
</head>
<body>
<div>can you make the parameter optional? Otherwise looks good to me.<br>
<br>
-David<br>
<br>
-------- Original Message --------<br>
Subject: [PATCH 1/2] drm/syncobj: add an output syncobj parameter to find_f=
ence<br>
From: Lionel Landwerlin <br>
To: intel-gfx@lists.freedesktop.org<br>
CC: Lionel Landwerlin ,&quot;Koenig, Christian&quot; ,&quot;Zhou, David(Chu=
nMing)&quot; ,Eric Anholt ,DRI-Devel
<br>
<br>
</div>
<font size=3D"2"><span style=3D"font-size:11pt;">
<div class=3D"PlainText">[CAUTION: External Email]<br>
<br>
We would like to get both the fence &amp; the syncobj in i915 rather than<b=
r>
doing 2 calls to drm_syncobj_find() &amp; drm_syncobj_find_fence().<br>
<br>
Signed-off-by: Lionel Landwerlin &lt;lionel.g.landwerlin@intel.com&gt;<br>
Cc: Christian Koenig &lt;Christian.Koenig@amd.com&gt;<br>
Cc: David(ChunMing) Zhou &lt;David1.Zhou@amd.com&gt;<br>
Cc: Eric Anholt &lt;eric@anholt.net&gt;<br>
CC: DRI-Devel &lt;dri-devel@lists.freedesktop.org&gt;<br>
---<br>
&nbsp;drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c |&nbsp; 4 &#43;&#43;-<br>
&nbsp;drivers/gpu/drm/drm_syncobj.c&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; | 45 &#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;=
&#43;&#43;&#43;&#43;&#43;&#43;---------<br>
&nbsp;drivers/gpu/drm/v3d/v3d_gem.c&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; |&nbsp; 5 &#43;&#43;-<br>
&nbsp;include/drm/drm_syncobj.h&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |&nbsp; 1 &#43;<br>
&nbsp;4 files changed, 38 insertions(&#43;), 17 deletions(-)<br>
<br>
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c b/drivers/gpu/drm/amd/a=
mdgpu/amdgpu_cs.c<br>
index 2f6239b6be6f..09fde3c73a2c 100644<br>
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c<br>
&#43;&#43;&#43; b/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c<br>
@@ -1124,10 &#43;1124,11 @@ static int amdgpu_syncobj_lookup_and_add_to_syn=
c(struct amdgpu_cs_parser *p,<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; uint32_t ha=
ndle, u64 point,<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; u64 flags)<=
br>
&nbsp;{<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; struct drm_syncobj *syncobj;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; struct dma_fence *fence;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; int r;<br>
<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; r =3D drm_syncobj_find_fence(p-&gt;fi=
lp, handle, point, flags, &amp;fence);<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; r =3D drm_syncobj_find_fence(p-&g=
t;filp, handle, point, flags, &amp;syncobj, &amp;fence);<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (r) {<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp; DRM_ERROR(&quot;syncobj %u failed to find fence @ %llu (%d)=
!\n&quot;,<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
 handle, point, r);<br>
@@ -1136,6 &#43;1137,7 @@ static int amdgpu_syncobj_lookup_and_add_to_sync(=
struct amdgpu_cs_parser *p,<br>
<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; r =3D amdgpu_sync_fence(p-&gt;ad=
ev, &amp;p-&gt;job-&gt;sync, fence, true);<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; dma_fence_put(fence);<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; drm_syncobj_put(syncobj);<br>
<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return r;<br>
&nbsp;}<br>
diff --git a/drivers/gpu/drm/drm_syncobj.c b/drivers/gpu/drm/drm_syncobj.c<=
br>
index 3d400905100b..f2fd0c1fb1d3 100644<br>
--- a/drivers/gpu/drm/drm_syncobj.c<br>
&#43;&#43;&#43; b/drivers/gpu/drm/drm_syncobj.c<br>
@@ -222,29 &#43;222,32 @@ static void drm_syncobj_assign_null_handle(struct=
 drm_syncobj *syncobj)<br>
&nbsp; * @handle: sync object handle to lookup.<br>
&nbsp; * @point: timeline point<br>
&nbsp; * @flags: DRM_SYNCOBJ_WAIT_FLAGS_WAIT_FOR_SUBMIT or not<br>
&#43; * @syncobj: out parameter for the syncobj<br>
&nbsp; * @fence: out parameter for the fence<br>
&nbsp; *<br>
&nbsp; * This is just a convenience function that combines drm_syncobj_find=
() and<br>
&nbsp; * drm_syncobj_fence_get().<br>
&nbsp; *<br>
- * Returns 0 on success or a negative error value on failure. On success @=
fence<br>
- * contains a reference to the fence, which must be released by calling<br=
>
- * dma_fence_put().<br>
&#43; * Returns 0 on success or a negative error value on failure. On<br>
&#43; * success @syncobj and @fence contains a reference respectively to<br=
>
&#43; * the syncobj and to the fence, which must be released by calling<br>
&#43; * respectively drm_syncobj_put() and dma_fence_put().<br>
&nbsp; */<br>
&nbsp;int drm_syncobj_find_fence(struct drm_file *file_private,<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp; u32 handle, u64 point, u64 flags,<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; struct drm_syncobj **syncobj,<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp; struct dma_fence **fence)<br>
&nbsp;{<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; struct drm_syncobj *syncobj =3D drm_s=
yncobj_find(file_private, handle);<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; struct syncobj_wait_entry wait;<=
br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; u64 timeout =3D nsecs_to_jiffies=
64(DRM_SYNCOBJ_WAIT_FOR_SUBMIT_TIMEOUT);<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; int ret;<br>
<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (!syncobj)<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; *syncobj =3D drm_syncobj_find(fil=
e_private, handle);<br>
&#43;<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (!(*syncobj))<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp; return -ENOENT;<br>
<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; *fence =3D drm_syncobj_fence_get(sync=
obj);<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; drm_syncobj_put(syncobj);<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; *fence =3D drm_syncobj_fence_get(=
*syncobj);<br>
<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (*fence) {<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp; ret =3D dma_fence_chain_find_seqno(fence, point);<br>
@@ -255,13 &#43;258,15 @@ int drm_syncobj_find_fence(struct drm_file *file_=
private,<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp; ret =3D -EINVAL;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (!(flags &amp; DRM_SYNCOBJ_WAIT_FL=
AGS_WAIT_FOR_SUBMIT))<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (!(flags &amp; DRM_SYNCOBJ_WAI=
T_FLAGS_WAIT_FOR_SUBMIT)) {<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; drm_syncobj_put(*syncobj);<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp; return ret;<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; memset(&amp;wait, 0, sizeof(wait=
));<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; wait.task =3D current;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; wait.point =3D point;<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; drm_syncobj_fence_add_wait(syncobj, &=
amp;wait);<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; drm_syncobj_fence_add_wait(*synco=
bj, &amp;wait);<br>
<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; do {<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp; set_current_state(TASK_INTERRUPTIBLE);<br>
@@ -286,7 &#43;291,10 @@ int drm_syncobj_find_fence(struct drm_file *file_p=
rivate,<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; *fence =3D wait.fence;<br>
<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (wait.node.next)<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; drm_syncobj_remove_wait(syncobj, &amp;wait);<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; drm_syncobj_remove_wait(*syncobj, &amp;wait);<br>
&#43;<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (ret)<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; drm_syncobj_put(*syncobj);<br>
<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return ret;<br>
&nbsp;}<br>
@@ -531,6 &#43;539,7 @@ static int drm_syncobj_export_sync_file(struct drm_=
file *file_private,<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp; int handle, int *p_fd)<br>
&nbsp;{<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; int ret;<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; struct drm_syncobj *syncobj;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; struct dma_fence *fence;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; struct sync_file *sync_file;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; int fd =3D get_unused_fd_flags(O=
_CLOEXEC);<br>
@@ -538,13 &#43;547,14 @@ static int drm_syncobj_export_sync_file(struct dr=
m_file *file_private,<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (fd &lt; 0)<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp; return fd;<br>
<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ret =3D drm_syncobj_find_fence(file_p=
rivate, handle, 0, 0, &amp;fence);<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ret =3D drm_syncobj_find_fence(fi=
le_private, handle, 0, 0, &amp;syncobj, &amp;fence);<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (ret)<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp; goto err_put_fd;<br>
<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; sync_file =3D sync_file_create(f=
ence);<br>
<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; dma_fence_put(fence);<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; drm_syncobj_put(syncobj);<br>
<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (!sync_file) {<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp; ret =3D -EINVAL;<br>
@@ -682,7 &#43;692,8 @@ drm_syncobj_fd_to_handle_ioctl(struct drm_device *d=
ev, void *data,<br>
&nbsp;static int drm_syncobj_transfer_to_timeline(struct drm_file *file_pri=
vate,<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; struct drm_syncobj_transfer *args)<br>
&nbsp;{<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; struct drm_syncobj *timeline_syncobj =
=3D NULL;<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; struct drm_syncobj *timeline_sync=
obj;<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; struct drm_syncobj *src_syncobj;<=
br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; struct dma_fence *fence;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; struct dma_fence_chain *chain;<b=
r>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; int ret;<br>
@@ -693,7 &#43;704,7 @@ static int drm_syncobj_transfer_to_timeline(struct =
drm_file *file_private,<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ret =3D drm_syncobj_find_fence(f=
ile_private, args-&gt;src_handle,<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; args-&gt=
;src_point, args-&gt;flags,<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &amp;fence);<=
br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &amp;src_=
syncobj, &amp;fence);<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (ret)<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp; goto err;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; chain =3D kzalloc(sizeof(struct =
dma_fence_chain), GFP_KERNEL);<br>
@@ -704,6 &#43;715,7 @@ static int drm_syncobj_transfer_to_timeline(struct =
drm_file *file_private,<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; drm_syncobj_add_point(timeline_s=
yncobj, chain, fence, args-&gt;dst_point);<br>
&nbsp;err1:<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; dma_fence_put(fence);<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; drm_syncobj_put(src_syncobj);<br>
&nbsp;err:<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; drm_syncobj_put(timeline_syncobj=
);<br>
<br>
@@ -714,7 &#43;726,8 @@ static int<br>
&nbsp;drm_syncobj_transfer_to_binary(struct drm_file *file_private,<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; struct drm_syncobj_transfer *args)<br>
&nbsp;{<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; struct drm_syncobj *binary_syncobj =
=3D NULL;<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; struct drm_syncobj *binary_syncob=
j;<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; struct drm_syncobj *src_syncobj;<=
br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; struct dma_fence *fence;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; int ret;<br>
<br>
@@ -722,11 &#43;735,13 @@ drm_syncobj_transfer_to_binary(struct drm_file *f=
ile_private,<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (!binary_syncobj)<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp; return -ENOENT;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ret =3D drm_syncobj_find_fence(f=
ile_private, args-&gt;src_handle,<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; args-&gt;src_=
point, args-&gt;flags, &amp;fence);<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; args-&gt;=
src_point, args-&gt;flags,<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &amp;src_=
syncobj, &amp;fence);<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (ret)<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp; goto err;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; drm_syncobj_replace_fence(binary=
_syncobj, fence);<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; dma_fence_put(fence);<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; drm_syncobj_put(src_syncobj);<br>
&nbsp;err:<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; drm_syncobj_put(binary_syncobj);=
<br>
<br>
diff --git a/drivers/gpu/drm/v3d/v3d_gem.c b/drivers/gpu/drm/v3d/v3d_gem.c<=
br>
index 27e0f87075d9..26bd3a2e39ca 100644<br>
--- a/drivers/gpu/drm/v3d/v3d_gem.c<br>
&#43;&#43;&#43; b/drivers/gpu/drm/v3d/v3d_gem.c<br>
@@ -431,6 &#43;431,7 @@ v3d_job_init(struct v3d_dev *v3d, struct drm_file *=
file_priv,<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; st=
ruct v3d_job *job, void (*free)(struct kref *ref),<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; u3=
2 in_sync)<br>
&nbsp;{<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; struct drm_syncobj *in_syncobj =
=3D NULL;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; struct dma_fence *in_fence =3D N=
ULL;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; int ret;<br>
<br>
@@ -443,10 &#43;444,12 @@ v3d_job_init(struct v3d_dev *v3d, struct drm_file=
 *file_priv,<br>
<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; xa_init_flags(&amp;job-&gt;deps,=
 XA_FLAGS_ALLOC);<br>
<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ret =3D drm_syncobj_find_fence(file_p=
riv, in_sync, 0, 0, &amp;in_fence);<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ret =3D drm_syncobj_find_fence(fi=
le_priv, in_sync, 0, 0, &amp;syncobj, &amp;in_fence);<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (ret =3D=3D -EINVAL)<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp; goto fail;<br>
<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; drm_syncobj_put(in_sync);<br>
&#43;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ret =3D drm_gem_fence_array_add(=
&amp;job-&gt;deps, in_fence);<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (ret)<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp; goto fail;<br>
diff --git a/include/drm/drm_syncobj.h b/include/drm/drm_syncobj.h<br>
index 6cf7243a1dc5..08eca690f783 100644<br>
--- a/include/drm/drm_syncobj.h<br>
&#43;&#43;&#43; b/include/drm/drm_syncobj.h<br>
@@ -121,6 &#43;121,7 @@ void drm_syncobj_replace_fence(struct drm_syncobj *=
syncobj,<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; struct dma_fence *fence);<br>
&nbsp;int drm_syncobj_find_fence(struct drm_file *file_private,<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp; u32 handle, u64 point, u64 flags,<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; struct drm_syncobj **syncobj,<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp; struct dma_fence **fence);<br>
&nbsp;void drm_syncobj_free(struct kref *kref);<br>
&nbsp;int drm_syncobj_create(struct drm_syncobj **out_syncobj, uint32_t fla=
gs,<br>
--<br>
2.21.0.392.gf8f6787159e<br>
<br>
</div>
</span></font>
</body>
</html>

--_000_puwqkvl1kf9ub7x3mdnw9l5d8fjhc157ay9i80p3ne5zfqv36laytxx_--

--===============0245364130==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0245364130==--
