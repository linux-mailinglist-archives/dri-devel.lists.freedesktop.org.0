Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 011B1ADF96F
	for <lists+dri-devel@lfdr.de>; Thu, 19 Jun 2025 00:28:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2C54110E970;
	Wed, 18 Jun 2025 22:28:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="a4+UugGs";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F1EC110E98E
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Jun 2025 22:28:30 +0000 (UTC)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55II7So4026662
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Jun 2025 22:28:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:reply-to:subject:to; s=
 qcppdkim1; bh=epPMJzOrwzGETwD77hWik2wtMJpWMHttwV94Ec6Z3RY=; b=a4
 +UugGsAXBhuu/rbNXGfdR2bEyC6dZYXuEFQVBPo1QELMa3F7p1lKLYSgq5cTqimw
 X5eYMN2pMn9bgXHBizFR5I6fCiKhk2T/snOPsd7psoZxlpS3xutwc3iy7bKEUu/P
 b7O4fwJA6aNru1eT8OFpI+qxmwRl/S4xg9068qZv4aJgiCFTBWtJNNZSCSqRSRAQ
 serNzgYL7Kt97vLYpsd+6YaEUbDd3W2+Zx/iXSHbWUhcHLuiGbrapRB8wH8IrZNn
 G+XQCtKWfz85DDwgrim3sZWQY+HL1BbfclzySMaYvU8gWgYEuHP71aLNCGLOpZer
 vRaYgVd+GLMc/rKYLJLQ==
Received: from mail-oo1-f72.google.com (mail-oo1-f72.google.com
 [209.85.161.72])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47928mnqvy-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Jun 2025 22:28:30 +0000 (GMT)
Received: by mail-oo1-f72.google.com with SMTP id
 006d021491bc7-60f48d860e6so204404eaf.1
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Jun 2025 15:28:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1750285709; x=1750890509;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :reply-to:in-reply-to:references:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=epPMJzOrwzGETwD77hWik2wtMJpWMHttwV94Ec6Z3RY=;
 b=Tkp8VRa+V3IlW6EUhk1hDTkzjW64bk0iiEUSS4371eilLX9vKapVSXa+bJHj9YQu6f
 GiZZvQPeV+FXAdXPBFzaAmUS6Z127MDgXnfYRXhnHv/78E8BPNxz+2vSQr9PKNSzLIUJ
 0kqa9+E+RCZGG8h0PQeMw3uZUrD5uc4f9kzVhMUFBu+XrxeQ4gep8VqrN5Ams1Nh8pnM
 d5tIjhvxBxFtclMkMrgsLwmt5gw8ZHhWuA+Gru9joOkt9WoWIg/JtM6C5mR4bEuMa9Z6
 iptw1SA59iN1VCCKZcGf7CFWfS0zYcdWtCD9TYb+pK5bdeqfdOxhBt1XDnjKo0SAetKP
 x2dA==
X-Gm-Message-State: AOJu0Yw1HcjNgn2gxynyX4Qow8wb27IR+ZS5Nnx8q9SIJoge0OJc/ToB
 OOKmaps7sjeGVlU6LRAo2aqRIOElUEwFeGONVFaoaWzuqgLd6oQt475Y1OV+cPJAFjimtOyn3/o
 XPC0kFlgsH4O383pH9alN1+oH6SbeUUM6UFCSdSuxteD1WU0NlkSAP76yU7FTHG2vsqHMpaMIgc
 uJLe/Gs7V/WDnZekeqgnwsBtW4DB7SfiqjbduS8RF9WOI3ew==
X-Gm-Gg: ASbGnctNL+lXb6A4xD2i9cSajuqjInHWv7icf6udlIWM5nwWmTMIxs+5sJpoSor+bMi
 FKZuRUhOjYhjowgO3L+klFZu9Tw/nxsj6hBix2M7+VL/cYamSUVNSBJp0Z5HXNzKHl9GrvkfLxJ
 +u5wjQ1lcbPa1hJvl9kSciBU+CdI6o3UAao/k=
X-Received: by 2002:a05:6871:4318:b0:2d4:ce45:6990 with SMTP id
 586e51a60fabf-2eaf07f3d68mr11140138fac.7.1750285709025; 
 Wed, 18 Jun 2025 15:28:29 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHt/DCdeSihnlYid2jzWle7Jgne9x6+SLxfnpukFlCmvoswoBSHicpf3IeeQzIbtpGMjjF8shno7oTPiKvf2KI=
X-Received: by 2002:a05:6871:4318:b0:2d4:ce45:6990 with SMTP id
 586e51a60fabf-2eaf07f3d68mr11140121fac.7.1750285708644; Wed, 18 Jun 2025
 15:28:28 -0700 (PDT)
MIME-Version: 1.0
References: <20250613235705.28006-3-robin.clark@oss.qualcomm.com>
 <aE1RPZ_-oFyM4COy@pollux>
 <CACSVV00uwmuAC4eMi-4QiF4sOu4r9u8eXxyAgt83YS8Yfgoemg@mail.gmail.com>
 <aFCO7_RHuAaGyq1Q@pollux>
 <CACSVV03WboQp_A1bzQ+xpX5DDkfaoXmbTuo9RfZ9bMaVTqdU+A@mail.gmail.com>
 <aFE6pq8l33NXfFdT@pollux>
 <CACSVV00VzOfTDh2sKst+POzkZ-5MH+0BDY-GVB2WKTyONRrHjw@mail.gmail.com>
 <CACSVV00cng4PzHzqydGw_L34_f+6KiZTyCRdggNfHaDePGzFOA@mail.gmail.com>
 <aFMuV7PNfSZVWb-b@pollux>
 <CACSVV00MJDTXk-qVB3FZV36CPuJ4LLtCDPFpF07EQXBfyqncuQ@mail.gmail.com>
 <aFM7gyGEJSVpQe1y@pollux>
In-Reply-To: <aFM7gyGEJSVpQe1y@pollux>
From: Rob Clark <rob.clark@oss.qualcomm.com>
Date: Wed, 18 Jun 2025 15:28:17 -0700
X-Gm-Features: Ac12FXxNkhbCuKyo_HSDjtF9QlLL155lTjSWkqyKRkuUzbcpYrmmQfDDvYdswW4
Message-ID: <CACSVV00mDy=SNkq9bbtqkmP4tVwZMGjjSPcS7dHgjkfSt4bYRQ@mail.gmail.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjE4MDE5MyBTYWx0ZWRfX7Zm7HCExFrut
 gBj3p8m6z2t667HSLwx9wB2xhZdtA68NJf+Ynx+W0P9Vel+l45Y5SYpshuDtodl2hUyKdFrAU0k
 ChlO61NyzgdmOIizpZ5QTD1As7O3U6jMZLj4X/6AYfQe5UOIzzWLJI3SviRlr/NcatpbwJc6AFS
 a01Rs9OnN81j30WvAs5TX4QnVnB2aa9khyK6zMOQfZIuyf7sOi4mkD9t14pnwkju+ZTpqmL54Jf
 1KNYTkfVkLiEwBiTuZXOiI5o1ux3CCrbff75uPqGMWNvoN2YDZoULWUk7TIt1XXfYvKOHrsKYpU
 4t0eK1O3blQky7AKfXH/bdnFeG+3T1PUF6uLIgTnwz5fOEGM+yJeGsz4vOjUdG+QF5VGzbrkbf8
 I3e1emQjlP6xSoVzAwJGkPVQNUZ3mRRTnMqRgrhGp58e4u7XTruGuhuRs7YVucAgtqcd2VW8
X-Authority-Analysis: v=2.4 cv=fvbcZE4f c=1 sm=1 tr=0 ts=68533d8e cx=c_pps
 a=wURt19dY5n+H4uQbQt9s7g==:117 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10
 a=20KFwNOVAAAA:8 a=EUspDBNiAAAA:8 a=WNEkua8qePtfmiliVmwA:9 a=QEXdDO2ut3YA:10
 a=-UhsvdU3ccFDOXFxFb4l:22
X-Proofpoint-GUID: MeTkuUS96F7zXmFCW_n8f3_SnyBVIGkF
X-Proofpoint-ORIG-GUID: MeTkuUS96F7zXmFCW_n8f3_SnyBVIGkF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-18_06,2025-06-18_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 bulkscore=0 priorityscore=1501
 mlxlogscore=999 phishscore=0 clxscore=1015 mlxscore=0 impostorscore=0
 adultscore=0 spamscore=0 suspectscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506180193
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

On Wed, Jun 18, 2025 at 3:19=E2=80=AFPM Danilo Krummrich <dakr@redhat.com> =
wrote:
>
> On Wed, Jun 18, 2025 at 02:56:37PM -0700, Rob Clark wrote:
> > On Wed, Jun 18, 2025 at 2:23=E2=80=AFPM Danilo Krummrich <dakr@redhat.c=
om> wrote:
> > >
> > > On Tue, Jun 17, 2025 at 06:43:21AM -0700, Rob Clark wrote:
> > > > On Tue, Jun 17, 2025 at 5:48=E2=80=AFAM Rob Clark <rob.clark@oss.qu=
alcomm.com> wrote:
> > > > >
> > > > > On Tue, Jun 17, 2025 at 2:51=E2=80=AFAM Danilo Krummrich <dakr@re=
dhat.com> wrote:
> > > > > >
> > > > > > On Mon, Jun 16, 2025 at 03:25:08PM -0700, Rob Clark wrote:
> > > > > > > On Mon, Jun 16, 2025 at 2:39=E2=80=AFPM Danilo Krummrich <dak=
r@redhat.com> wrote:
> > > > > > > >
> > > > > > > > On Sat, Jun 14, 2025 at 08:03:20AM -0700, Rob Clark wrote:
> > > > > > > > > On Sat, Jun 14, 2025 at 3:39=E2=80=AFAM Danilo Krummrich =
<dakr@redhat.com> wrote:
> > > > > > > > > >
> > > > > > > > > > On Fri, Jun 13, 2025 at 04:57:03PM -0700, Rob Clark wro=
te:
> > > > > > > > > > > For UNMAP/REMAP steps we could be needing to lock obj=
ects that are not
> > > > > > > > > > > explicitly listed in the VM_BIND ioctl in order to te=
ar-down unmapped
> > > > > > > > > > > VAs.  These helpers handle locking/preparing the need=
ed objects.
> > > > > > > > > >
> > > > > > > > > > Yes, that's a common use-case. I think drivers typicall=
y iterate through their
> > > > > > > > > > drm_gpuva_ops to lock those objects.
> > > > > > > > > >
> > > > > > > > > > I had a look at you link [1] and it seems that you keep=
 a list of ops as well by
> > > > > > > > > > calling vm_op_enqueue() with a new struct msm_vm_op fro=
m the callbacks.
> > > > > > > > > >
> > > > > > > > > > Please note that for exactly this case there is the op_=
alloc callback in
> > > > > > > > > > struct drm_gpuvm_ops, such that you can allocate a cust=
om op type (i.e. struct
> > > > > > > > > > msm_vm_op) that embedds a struct drm_gpuva_op.
> > > > > > > > >
> > > > > > > > > I did use drm_gpuvm_sm_xyz_ops_create() in an earlier ite=
ration of my
> > > > > > > > > VM_BIND series, but it wasn't quite what I was after.  I =
wanted to
> > > > > > > > > apply the VM updates immediately to avoid issues with a l=
ater
> > > > > > > > > map/unmap overlapping an earlier map, which
> > > > > > > > > drm_gpuvm_sm_xyz_ops_create() doesn't really handle.  I'm=
 not even
> > > > > > > > > sure why this isn't a problem for other drivers unless us=
erspace is
> > > > > > > > > providing some guarantees.
> > > > > > > >
> > > > > > > > The drm_gpuva_ops are usually used in a pattern like this.
> > > > > > > >
> > > > > > > >         vm_bind {
> > > > > > > >                 for_each_vm_bind_operation {
> > > > > >                             drm_gpuvm_sm_xyz_ops_create();
> > > > > > > >                         drm_gpuva_for_each_op {
> > > > > > > >                                 // modify drm_gpuvm's inter=
val tree
> > > > > > > >                                 // pre-allocate memory
> > > > > > > >                                 // lock and prepare objects
> > > > > > > >                         }
> > > > > > > >                 }
> > > > > > > >
> > > > > > > >                 drm_sched_entity_push_job();
> > > > > > > >         }
> > > > > > > >
> > > > > > > >         run_job {
> > > > > > > >                 for_each_vm_bind_operation {
> > > > > > > >                         drm_gpuva_for_each_op {
> > > > > > > >                                 // modify page tables
> > > > > > > >                         }
> > > > > > > >                 }
> > > > > > > >         }
> > > > > > > >
> > > > > > > >         run_job {
> > > > > > > >                 for_each_vm_bind_operation {
> > > > > > > >                         drm_gpuva_for_each_op {
> > > > > > > >                                 // free page table structur=
es, if any
> > > > > > > >                                 // free unused pre-allocate=
d memory
> > > > > > > >                         }
> > > > > > > >                 }
> > > > > > > >         }
> > > > > > > >
> > > > > > > > What did you do instead to get map/unmap overlapping? Even =
more interesting,
> > > > > > > > what are you doing now?
> > > > > > >
> > > > > > > From what I can tell, the drivers using drm_gpva_for_each_op(=
)/etc are
> > > > > > > doing drm_gpuva_remove() while iterating the ops list..
> > > > > > > drm_gpuvm_sm_xyz_ops_create() itself does not modify the VM. =
 So this
> > > > > > > can only really work if you perform one MAP or UNMAP at a tim=
e.  Or at
> > > > > > > least if you process the VM modifying part of the ops list be=
fore
> > > > > > > proceeding to the next op.
> > > > > >
> > > > > > (Added the drm_gpuvm_sm_xyz_ops_create() step above.)
> > > > > >
> > > > > > I went through the code you posted [1] and conceptually you're =
implementing
> > > > > > exactly the pattern I described above, i.e. you do:
> > > > > >
> > > > > >         vm_bind {
> > > > > >                 for_each_vm_bind_operation {
> > > > > >                         drm_gpuvm_sm_xyz_exec_lock();
> > > > > >                 }
> > > > > >
> > > > > >                 for_each_vm_bind_operation {
> > > > > >                         drm_gpuvm_sm_xyz() {
> > > > > >                                 // modify drm_gpuvm's interval =
tree
> > > > > >                                 // create custom ops
> > > > > >                         }
> > > > > >                 }
> > > > > >
> > > > > >                 drm_sched_entity_push_job();
> > > > > >         }
> > > > > >
> > > > > >         run_job {
> > > > > >                 for_each_vm_bind_operation {
> > > > > >                         for_each_custom_op() {
> > > > > >                                 // do stuff
> > > > > >                         }
> > > > > >                 }
> > > > > >         }
> > > > >
> > > > > Close, but by the time we get to run_job there is just a single l=
ist
> > > > > of ops covering all the vm_bind operations:
> > > > >
> > > > >         run_job {
> > > > >                 for_each_custom_op() {
> > > > >                         // do stuff
> > > > >                 }
> > > > >         }
> > > > >
> > > > > rather than a list of va ops per vm_bind op.
> > > > >
> > > > > > However, GPUVM intends to solve your use-case with the followin=
g, semantically
> > > > > > identical, approach.
> > > > > >
> > > > > >         vm_bind {
> > > > > >                 for_each_vm_bind_operation {
> > > > > >                         drm_gpuvm_sm_xyz_ops_create();
> > > > > >
> > > > > >                         drm_gpuva_for_each_op {
> > > > > >                                 // modify drm_gpuvm's interval =
tree
> > > > > >                                 // lock and prepare objects (1)
> > > > >
> > > > > I currently decouple lock+pin from VM modification to avoid an er=
ror
> > > > > path that leaves the VM partially modified.  Once you add this ba=
ck
> > > > > in, the va-ops approach isn't simpler, IMHO.
> > > >
> > > > Oh, actually scratch that.. using va-ops, it is not even possible t=
o
> > > > decouple locking/prepare from VM modifications.  So using
> > > > DRM_EXEC_INTERRUPTIBLE_WAIT, for ex, with va-ops list would be an
> > > > actively bad idea.
> > >
> > > Well, you would need to unwind the VM modifications. I think so far t=
his hasn't
> > > been an issue for drivers, since they have to unwind VM modifications=
 for other
> > > reasons anyways.
> >
> > Only thing that can fail at this point are the drm_gpuvm_sm_xyz()
> > calls[1].  Which should only be for small kmalloc's which should not
> > fail.
>
> But what happens *if* they fail? How do you handle this? If you don't unw=
ind all
> preceeding changes to the GPUVM's interval tree at this point your VM is =
broken.

Small GFP_KERNEL allocations will recurse into shrinker to reclaim
memory before failing.  _If_ they fail, things are in a pretty bad
shape already, the best thing to do is mark the VM unusable to signal
mesa to close the dev file to tear everything down.

> Glancing at the code, it seems that you're allocating the GPUVA ops. And =
if that
> fails you just return the error, leaving the VM in a broken state.
>
> What we could do is to implement a helper that calculates the worst case =
number
> of ops and pre-allocate them, but that's not exactly trivial.

No, we shouldn't add this complexity for something that cannot happen
(or if it does happen, you are in a state where nothing you do other
than tear it all down can improve things).

> drm_gpuvm_sm_{map,unmap}_exec_lock() only really makes sense if we can pr=
event
> the need to ever unwind, so that's a precondition.
>
> Alternatively, you can also decide to accept that your VM is dead if you =
can't
> allocate the GPUVA ops, I guess. In this case you'd really have to shut i=
t down
> though, otherwise you likely risk faults in your PT management code.

Correct, we never free backing pages while there is still a mapping to
the GPU.. that is the golden rule!

> > But all the "usual" errors (bad params from userspace,
> > interrupted locking, etc) are dealt with before we begin to modify the
> > VM.  If anything does fail after we start modifying the VM we mark the
> > vm as unusable, similar to a gpu fault.
> >
> > [1] ok, I should put some drm_gpuvm_range_valid() checks earlier in
> > the ioctl, while parsing out and validating args/flags/etc.  I
> > overlooked this.
> >
> > > Do you never need to unwind for other reasons than locking dma_resv a=
nd
> > > preparing GEM objects? Are you really sure there's nothing else in th=
e critical
> > > path?
> > >
> > > If there really isn't anything, I agree that those helpers have value=
 and we
> > > should add them. So, if we do so, please document in detail the condi=
tions under
> > > which drm_gpuvm_sm_{map,unmap}_exec_lock() can be called for multiple=
 VM_BIND
> > > ops *without* updating GPUVM's interval tree intermediately, includin=
g an
> > > example.
> >
> > Ok.. in the function headerdoc comment block?  Or did you have
> > somewhere else in mind?
>
> Yeah, in the function doc-comment.

ack

BR,
-R
