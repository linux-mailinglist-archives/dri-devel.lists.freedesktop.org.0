Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EEBE7ADF8FD
	for <lists+dri-devel@lfdr.de>; Wed, 18 Jun 2025 23:56:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 57F1510E965;
	Wed, 18 Jun 2025 21:56:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="RWimqCUK";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8107810E965
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Jun 2025 21:56:51 +0000 (UTC)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55ILUL83024580
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Jun 2025 21:56:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:reply-to:subject:to; s=
 qcppdkim1; bh=yhi2gUMJI0GE6nkozrV+9GIwcZZGzNlNIqUIg0Ii+H0=; b=RW
 imqCUKuFGFflkZYP4qCHeriH/9TLGe/K4aDUHOQNRu8GjS0eib6V26+M4zsBoop0
 S385uPczv6cabfmOlL1rZnajQ2sjxvPou9g6AvwJZlo8ir0O/huOGVozrUtOD6iw
 d9QWfP06oN1nt7ZijwDrueEC3oeDKM1QFDqE9WOuMRO+U8iLLyU6RogCjSsKDYWH
 WS4ovx4USd8sZchLL3Fhy2n1QLHqUpUchiwlsIBuT9dqtOUviKOSrbZRCPynuWxB
 Iw01CyrlqtxYa8ow9KVGv5FEGv2W2EX4CPjCSNZQXZEFE1yI4uL2ULwxdJ8dCMwi
 0wiUaUmzC0kylWUhcrNQ==
Received: from mail-oo1-f70.google.com (mail-oo1-f70.google.com
 [209.85.161.70])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47bw139r1h-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Jun 2025 21:56:50 +0000 (GMT)
Received: by mail-oo1-f70.google.com with SMTP id
 006d021491bc7-60bf020e4a1so184579eaf.0
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Jun 2025 14:56:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1750283810; x=1750888610;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :reply-to:in-reply-to:references:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=yhi2gUMJI0GE6nkozrV+9GIwcZZGzNlNIqUIg0Ii+H0=;
 b=pol3Z9dzZ5E6IKhtSJwUsJ54iKSuudoJHddLWAf1utUuKLY77oO31tMEUSEvMkVotl
 8Gq+1tfS2AWuUBfgv7WhPO/xtym9cbRqWqZJW8863TcVrkIanTSrgUBxA9K7QTP+tDz9
 DqOudtQM4R6V7Pgy+kgx1J0F8h7si6Ch1jvdjKVzlChxHSRUQD+VHuFDy7ECzL8yvNvJ
 BmuTev5ZxbwyS+8WOdQHrYOBknuUajccWu5DbfoD/PhcAw/+4VBezoMYfqsqEEWWnpFC
 S8O/Tqw2N12PGg4AdN1ObXKO1BsuLjSBuE7cILd4FwSr0TPpyD8ki+XVT4VhAcykKdIy
 Xn0A==
X-Gm-Message-State: AOJu0Ywdzg8KMAbr/zTyiTk6zja4eOcgd5PG1pgRaEZ9x9hUEGq9S1Es
 F+r7LXIiDLIszhNRQ7mScEVUrZVhXzX5OF2e5R+K38y4fjcKMrd8ykbHbgauP6RLg2N4k1/cq9Y
 uRZty2eGdIfX5JlrzFnIOI8ZQsQvicHoh4cUtAu4uX3nBJvR2NCDmykPC88uI1RmY65/vdwl+7J
 GZBZR87U8pC+5mHzGxL0/oflIWjTpmjtdax9fUbXcerNzymA==
X-Gm-Gg: ASbGnct9n8oFot7f94f1amhSGDepnOA0AXGvnPq8C+IPSLuSanG+zr3lsf97z6MpZqX
 20SRBGt8kyhTmYsMtj3jiP+NqVFpvoQO0fsad2XIACUqxAX6x2xNETlBzfNUG7vLN9HpgXGu/2w
 V6z0lE7x2DteSgZR9ZDQeEzRDQD3E2bwXwTAw=
X-Received: by 2002:a05:6870:b413:b0:2d6:7266:a8d8 with SMTP id
 586e51a60fabf-2eaf07f45edmr11310583fac.3.1750283809644; 
 Wed, 18 Jun 2025 14:56:49 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHUI4eoCFyxm0AQjdCzb9oYhfBUJv5zftI1me8lyA42OhvAvHVS0Y5LoZkIu8ti01QiSTWjmhk5JnrDmlBbqq4=
X-Received: by 2002:a05:6870:b413:b0:2d6:7266:a8d8 with SMTP id
 586e51a60fabf-2eaf07f45edmr11310569fac.3.1750283809238; Wed, 18 Jun 2025
 14:56:49 -0700 (PDT)
MIME-Version: 1.0
References: <20250613235705.28006-1-robin.clark@oss.qualcomm.com>
 <20250613235705.28006-3-robin.clark@oss.qualcomm.com>
 <aE1RPZ_-oFyM4COy@pollux>
 <CACSVV00uwmuAC4eMi-4QiF4sOu4r9u8eXxyAgt83YS8Yfgoemg@mail.gmail.com>
 <aFCO7_RHuAaGyq1Q@pollux>
 <CACSVV03WboQp_A1bzQ+xpX5DDkfaoXmbTuo9RfZ9bMaVTqdU+A@mail.gmail.com>
 <aFE6pq8l33NXfFdT@pollux>
 <CACSVV00VzOfTDh2sKst+POzkZ-5MH+0BDY-GVB2WKTyONRrHjw@mail.gmail.com>
 <CACSVV00cng4PzHzqydGw_L34_f+6KiZTyCRdggNfHaDePGzFOA@mail.gmail.com>
 <aFMuV7PNfSZVWb-b@pollux>
In-Reply-To: <aFMuV7PNfSZVWb-b@pollux>
From: Rob Clark <rob.clark@oss.qualcomm.com>
Date: Wed, 18 Jun 2025 14:56:37 -0700
X-Gm-Features: Ac12FXz1hvs2DatuE2Jl92AC0Ic67ojrFvzA6PneWV9sFClqIYfa-8ye6_PjtCE
Message-ID: <CACSVV00MJDTXk-qVB3FZV36CPuJ4LLtCDPFpF07EQXBfyqncuQ@mail.gmail.com>
Subject: Re: [PATCH 2/2] drm/gpuvm: Add locking helpers
To: Danilo Krummrich <dakr@redhat.com>
Cc: dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Authority-Analysis: v=2.4 cv=QbBmvtbv c=1 sm=1 tr=0 ts=68533622 cx=c_pps
 a=lkkFf9KBb43tY3aOjL++dA==:117 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10
 a=20KFwNOVAAAA:8 a=EUspDBNiAAAA:8 a=OZCDo3Bp5fOm185c5pAA:9 a=QEXdDO2ut3YA:10
 a=k4UEASGLJojhI9HsvVT1:22
X-Proofpoint-ORIG-GUID: 96viQEI97hx28xsPu6tkhpf2eHiGytE0
X-Proofpoint-GUID: 96viQEI97hx28xsPu6tkhpf2eHiGytE0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjE4MDE4OCBTYWx0ZWRfX4/qbMNoq/fyx
 Ma1/2qMlAReeW+M21fbl6eLrZVuIPVK89GiyHY4yxFaK019RVA78DDTdvebYEjsO5kfPTcinJtO
 eEHZISH2SSQyNKkziVdrAmZfb8J4yqXLiBI05+LKbKEINsiApqks/tBbE7VFKv+GkUYvhidRs8n
 FE6yvIo5Ije3ExZbYymbSzML2sd81H5wgUn11YiGNajMadyAg7DQ5llijMpvz0b99PTou9AlTMp
 aNaDBNuwlvGsdOqIEDA5Yl8+Zh5NEEiDD51L/7qW/BxGIW608FKcjushSQAyM5MhzIe+1Px2Ph9
 fhgpy9uIEVZYE6l9T0TjWzi2nMU6WFyr9AkNToypjFIOQyCxnaB+j4oNPpuSavQ+1S1BPXY+Zuh
 cLDqiUpzfis26899QQATNMxMCUOq0oEhFhHK6e+gtHHes8c4+1d+3dMnnzz++gLBJ8onBSt1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-18_06,2025-06-18_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 malwarescore=0 mlxlogscore=999 bulkscore=0
 adultscore=0 phishscore=0 clxscore=1015 suspectscore=0 lowpriorityscore=0
 mlxscore=0 impostorscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506180188
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
Reply-To: rob.clark@oss.qualcomm.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Jun 18, 2025 at 2:23=E2=80=AFPM Danilo Krummrich <dakr@redhat.com> =
wrote:
>
> On Tue, Jun 17, 2025 at 06:43:21AM -0700, Rob Clark wrote:
> > On Tue, Jun 17, 2025 at 5:48=E2=80=AFAM Rob Clark <rob.clark@oss.qualco=
mm.com> wrote:
> > >
> > > On Tue, Jun 17, 2025 at 2:51=E2=80=AFAM Danilo Krummrich <dakr@redhat=
.com> wrote:
> > > >
> > > > On Mon, Jun 16, 2025 at 03:25:08PM -0700, Rob Clark wrote:
> > > > > On Mon, Jun 16, 2025 at 2:39=E2=80=AFPM Danilo Krummrich <dakr@re=
dhat.com> wrote:
> > > > > >
> > > > > > On Sat, Jun 14, 2025 at 08:03:20AM -0700, Rob Clark wrote:
> > > > > > > On Sat, Jun 14, 2025 at 3:39=E2=80=AFAM Danilo Krummrich <dak=
r@redhat.com> wrote:
> > > > > > > >
> > > > > > > > On Fri, Jun 13, 2025 at 04:57:03PM -0700, Rob Clark wrote:
> > > > > > > > > For UNMAP/REMAP steps we could be needing to lock objects=
 that are not
> > > > > > > > > explicitly listed in the VM_BIND ioctl in order to tear-d=
own unmapped
> > > > > > > > > VAs.  These helpers handle locking/preparing the needed o=
bjects.
> > > > > > > >
> > > > > > > > Yes, that's a common use-case. I think drivers typically it=
erate through their
> > > > > > > > drm_gpuva_ops to lock those objects.
> > > > > > > >
> > > > > > > > I had a look at you link [1] and it seems that you keep a l=
ist of ops as well by
> > > > > > > > calling vm_op_enqueue() with a new struct msm_vm_op from th=
e callbacks.
> > > > > > > >
> > > > > > > > Please note that for exactly this case there is the op_allo=
c callback in
> > > > > > > > struct drm_gpuvm_ops, such that you can allocate a custom o=
p type (i.e. struct
> > > > > > > > msm_vm_op) that embedds a struct drm_gpuva_op.
> > > > > > >
> > > > > > > I did use drm_gpuvm_sm_xyz_ops_create() in an earlier iterati=
on of my
> > > > > > > VM_BIND series, but it wasn't quite what I was after.  I want=
ed to
> > > > > > > apply the VM updates immediately to avoid issues with a later
> > > > > > > map/unmap overlapping an earlier map, which
> > > > > > > drm_gpuvm_sm_xyz_ops_create() doesn't really handle.  I'm not=
 even
> > > > > > > sure why this isn't a problem for other drivers unless usersp=
ace is
> > > > > > > providing some guarantees.
> > > > > >
> > > > > > The drm_gpuva_ops are usually used in a pattern like this.
> > > > > >
> > > > > >         vm_bind {
> > > > > >                 for_each_vm_bind_operation {
> > > >                             drm_gpuvm_sm_xyz_ops_create();
> > > > > >                         drm_gpuva_for_each_op {
> > > > > >                                 // modify drm_gpuvm's interval =
tree
> > > > > >                                 // pre-allocate memory
> > > > > >                                 // lock and prepare objects
> > > > > >                         }
> > > > > >                 }
> > > > > >
> > > > > >                 drm_sched_entity_push_job();
> > > > > >         }
> > > > > >
> > > > > >         run_job {
> > > > > >                 for_each_vm_bind_operation {
> > > > > >                         drm_gpuva_for_each_op {
> > > > > >                                 // modify page tables
> > > > > >                         }
> > > > > >                 }
> > > > > >         }
> > > > > >
> > > > > >         run_job {
> > > > > >                 for_each_vm_bind_operation {
> > > > > >                         drm_gpuva_for_each_op {
> > > > > >                                 // free page table structures, =
if any
> > > > > >                                 // free unused pre-allocated me=
mory
> > > > > >                         }
> > > > > >                 }
> > > > > >         }
> > > > > >
> > > > > > What did you do instead to get map/unmap overlapping? Even more=
 interesting,
> > > > > > what are you doing now?
> > > > >
> > > > > From what I can tell, the drivers using drm_gpva_for_each_op()/et=
c are
> > > > > doing drm_gpuva_remove() while iterating the ops list..
> > > > > drm_gpuvm_sm_xyz_ops_create() itself does not modify the VM.  So =
this
> > > > > can only really work if you perform one MAP or UNMAP at a time.  =
Or at
> > > > > least if you process the VM modifying part of the ops list before
> > > > > proceeding to the next op.
> > > >
> > > > (Added the drm_gpuvm_sm_xyz_ops_create() step above.)
> > > >
> > > > I went through the code you posted [1] and conceptually you're impl=
ementing
> > > > exactly the pattern I described above, i.e. you do:
> > > >
> > > >         vm_bind {
> > > >                 for_each_vm_bind_operation {
> > > >                         drm_gpuvm_sm_xyz_exec_lock();
> > > >                 }
> > > >
> > > >                 for_each_vm_bind_operation {
> > > >                         drm_gpuvm_sm_xyz() {
> > > >                                 // modify drm_gpuvm's interval tree
> > > >                                 // create custom ops
> > > >                         }
> > > >                 }
> > > >
> > > >                 drm_sched_entity_push_job();
> > > >         }
> > > >
> > > >         run_job {
> > > >                 for_each_vm_bind_operation {
> > > >                         for_each_custom_op() {
> > > >                                 // do stuff
> > > >                         }
> > > >                 }
> > > >         }
> > >
> > > Close, but by the time we get to run_job there is just a single list
> > > of ops covering all the vm_bind operations:
> > >
> > >         run_job {
> > >                 for_each_custom_op() {
> > >                         // do stuff
> > >                 }
> > >         }
> > >
> > > rather than a list of va ops per vm_bind op.
> > >
> > > > However, GPUVM intends to solve your use-case with the following, s=
emantically
> > > > identical, approach.
> > > >
> > > >         vm_bind {
> > > >                 for_each_vm_bind_operation {
> > > >                         drm_gpuvm_sm_xyz_ops_create();
> > > >
> > > >                         drm_gpuva_for_each_op {
> > > >                                 // modify drm_gpuvm's interval tree
> > > >                                 // lock and prepare objects (1)
> > >
> > > I currently decouple lock+pin from VM modification to avoid an error
> > > path that leaves the VM partially modified.  Once you add this back
> > > in, the va-ops approach isn't simpler, IMHO.
> >
> > Oh, actually scratch that.. using va-ops, it is not even possible to
> > decouple locking/prepare from VM modifications.  So using
> > DRM_EXEC_INTERRUPTIBLE_WAIT, for ex, with va-ops list would be an
> > actively bad idea.
>
> Well, you would need to unwind the VM modifications. I think so far this =
hasn't
> been an issue for drivers, since they have to unwind VM modifications for=
 other
> reasons anyways.

Only thing that can fail at this point are the drm_gpuvm_sm_xyz()
calls[1].  Which should only be for small kmalloc's which should not
fail.  But all the "usual" errors (bad params from userspace,
interrupted locking, etc) are dealt with before we begin to modify the
VM.  If anything does fail after we start modifying the VM we mark the
vm as unusable, similar to a gpu fault.

[1] ok, I should put some drm_gpuvm_range_valid() checks earlier in
the ioctl, while parsing out and validating args/flags/etc.  I
overlooked this.

> Do you never need to unwind for other reasons than locking dma_resv and
> preparing GEM objects? Are you really sure there's nothing else in the cr=
itical
> path?
>
> If there really isn't anything, I agree that those helpers have value and=
 we
> should add them. So, if we do so, please document in detail the condition=
s under
> which drm_gpuvm_sm_{map,unmap}_exec_lock() can be called for multiple VM_=
BIND
> ops *without* updating GPUVM's interval tree intermediately, including an
> example.

Ok.. in the function headerdoc comment block?  Or did you have
somewhere else in mind?

BR,
-R
