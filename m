Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8794CADBCD0
	for <lists+dri-devel@lfdr.de>; Tue, 17 Jun 2025 00:25:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B623310E462;
	Mon, 16 Jun 2025 22:25:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="QWcv7X10";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A8C6B10E462
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Jun 2025 22:25:21 +0000 (UTC)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55GHOGgH002991
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Jun 2025 22:25:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:reply-to:subject:to; s=
 qcppdkim1; bh=BKywj4VHkEs0JU42aBEgCevEgvNKao+BH8DsvhKGCeQ=; b=QW
 cv7X101Rmwv6xFw+4znvDH6w6EZfXm+oYvYXcRBhXYo5xJWI78z9xk6jhBWuBH5N
 ZAvzMWBrPvPlBclgm0e8bTpCUgPJfX26iI31cUEp60M499IGVguwBfaZIEDYw4Xt
 bXY2DzqODWsXDStlJ7s0lMb9ILHmI16M6Ygq0GsET9R6K2uIQ/B3Z1f9xzP/uSCB
 Btb6S0Am+V3pTUVBZtAES+SRO8Ti0/ntw3SbCpDv1h04jZWMHx6f8bDDRzaYuFKJ
 cm3wxiEjQg4U5pg8UqqZsBRGGBwrKz7Dja3rXjSvcXwHerdGW/yn7eAdHmSfzNBi
 Cjs5Qa+y6dXiKMC9fW8A==
Received: from mail-oo1-f69.google.com (mail-oo1-f69.google.com
 [209.85.161.69])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47ag2327au-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Jun 2025 22:25:21 +0000 (GMT)
Received: by mail-oo1-f69.google.com with SMTP id
 006d021491bc7-60f39b59860so1043095eaf.1
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Jun 2025 15:25:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1750112720; x=1750717520;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :reply-to:in-reply-to:references:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=BKywj4VHkEs0JU42aBEgCevEgvNKao+BH8DsvhKGCeQ=;
 b=TvX15HLPagMHdN1l1MXzdbl6vwkNsFTFnv9JbelIxQYttypDkewTK1gTkWR+ILgjUV
 9X2fKNHibOUI/ElGMce7+OIL4lBPxegMFpQ1tWunIlgWuBLlUAQj8y7oNMpR/VZNTBaV
 1eydk/XojBmCIa6Chx6USnSXOTxyABrQtIrgDRLGfj+GBWJ9Mtx8OzNJfH8LZGRTpP1d
 U+ssZtmlxYEzRSgWY19biNUJfSaek7OphFFnkcJ8hn0Ig0w28YG83XhRdi1BT5sP7dDZ
 C7wFYNEawgEiIY+Igsb5VzrU8406kWniqo7uBXHJs6rURY96hWniE8SNNzhbeOGBTeeK
 6mGA==
X-Gm-Message-State: AOJu0YzoDpz/zVzchJANXEZp/MiOXKuAVd4YpXNnQnzoGbxTZJEhj6te
 kFVytH3vJWgfJlgF2W1MIqBT1pjgtRM1yKrijVQ05dFAgin49MyJ0NHZKILtnbq18hpXBz+pE0a
 XBTt/BTtOhUwPgHHAhJneffpWdXjv/S+0I+//e7GgAT3v1MFXsfuqRbiePVv0AAFsuaz8JZTA6n
 Dw197wOqqs5rlndXpniCjHRvZ/t8CsSEnXoI/q1pEqHQY6qw==
X-Gm-Gg: ASbGncstO3y4aUp6bkiZcskZ8NJMCBzZeYdN8ntmC0VjuQCLUqKxflqvusYkpsqQ7Bb
 +s0bB1lFIy46x1sDl3aAI1L4l4EdOo/kRRT0sWcyazx7kxvcPn6Duz0pH1yBI44FGO6ALpCyjY+
 XIs8iJXVnHdt4rVneItpQZKJkXtC2J7pOEd2E=
X-Received: by 2002:a05:6871:3a06:b0:2b7:7abf:df6b with SMTP id
 586e51a60fabf-2eaf08af8f4mr6927184fac.26.1750112720126; 
 Mon, 16 Jun 2025 15:25:20 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFqmXfWLhQeUMt/Jl85rjVo4uK/LrD8KsRZegFSv17dxtAYSc5JIIXm1M0FOijdpfihvv5RfghpXpsD5Ezmz34=
X-Received: by 2002:a05:6871:3a06:b0:2b7:7abf:df6b with SMTP id
 586e51a60fabf-2eaf08af8f4mr6927167fac.26.1750112719638; Mon, 16 Jun 2025
 15:25:19 -0700 (PDT)
MIME-Version: 1.0
References: <20250613235705.28006-1-robin.clark@oss.qualcomm.com>
 <20250613235705.28006-3-robin.clark@oss.qualcomm.com>
 <aE1RPZ_-oFyM4COy@pollux>
 <CACSVV00uwmuAC4eMi-4QiF4sOu4r9u8eXxyAgt83YS8Yfgoemg@mail.gmail.com>
 <aFCO7_RHuAaGyq1Q@pollux>
In-Reply-To: <aFCO7_RHuAaGyq1Q@pollux>
From: Rob Clark <rob.clark@oss.qualcomm.com>
Date: Mon, 16 Jun 2025 15:25:08 -0700
X-Gm-Features: AX0GCFtOto0zyVpQeYp5jBop9UvSHgX2u-zFbK-GGootkeuIkxZ2PZ8ZpDl8bmA
Message-ID: <CACSVV03WboQp_A1bzQ+xpX5DDkfaoXmbTuo9RfZ9bMaVTqdU+A@mail.gmail.com>
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
X-Proofpoint-ORIG-GUID: iQ4jxnrcPDV62pxvNQXwUFrGN7ocJxjE
X-Authority-Analysis: v=2.4 cv=edY9f6EH c=1 sm=1 tr=0 ts=685099d1 cx=c_pps
 a=lVi5GcDxkcJcfCmEjVJoaw==:117 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10
 a=20KFwNOVAAAA:8 a=PboIhGL1U7HzPZusu2gA:9 a=QEXdDO2ut3YA:10
 a=rBiNkAWo9uy_4UTK5NWh:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjE2MDE1OSBTYWx0ZWRfXyQHzLeLyz7Up
 lL40Y03KWPLYiddUSuffB+RhmVVsyqp37mdLGkD73pLaS+c/P5PqzNbMbs/2cn6ECfMRBtajR0j
 sUj/ShAO/QQxjkWnc36n3tGplbm3wt1kIPtdgYuQYqsFkARhl/lqOqAcKStGJsk+qIvBkFE/2wA
 DfQyh/DArDcyd5wHrHbN/a7sudFTYUegHOK2N13URKF1z3jVTvFpdoU4NT4AjdlgTKuqYSD64In
 bzvNC5SxIfGg9uVjd+Q5o+/XwZsN7WCz9amb0KHuW2ZsjJSCizX1YeuUuQ4/DlV9vNCbZkwrwPF
 vBW7Oa7Y+OCwqJxs3wFv4NmOEp+Kr1xO5rJANCXWk/dvb3ik8G1XZzNlqf71TnmF7d6+c3UqLCy
 A6NhpdogpAlIb/sl5fcp9zOwM6E3bOolgu4diCy4CfbmRDsNNNc+fUeZZAJU/WkFbsTJwma4
X-Proofpoint-GUID: iQ4jxnrcPDV62pxvNQXwUFrGN7ocJxjE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-16_11,2025-06-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 priorityscore=1501 suspectscore=0 spamscore=0 bulkscore=0
 impostorscore=0 mlxscore=0 clxscore=1015 mlxlogscore=999 malwarescore=0
 phishscore=0 adultscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506160159
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

On Mon, Jun 16, 2025 at 2:39=E2=80=AFPM Danilo Krummrich <dakr@redhat.com> =
wrote:
>
> On Sat, Jun 14, 2025 at 08:03:20AM -0700, Rob Clark wrote:
> > On Sat, Jun 14, 2025 at 3:39=E2=80=AFAM Danilo Krummrich <dakr@redhat.c=
om> wrote:
> > >
> > > On Fri, Jun 13, 2025 at 04:57:03PM -0700, Rob Clark wrote:
> > > > For UNMAP/REMAP steps we could be needing to lock objects that are =
not
> > > > explicitly listed in the VM_BIND ioctl in order to tear-down unmapp=
ed
> > > > VAs.  These helpers handle locking/preparing the needed objects.
> > >
> > > Yes, that's a common use-case. I think drivers typically iterate thro=
ugh their
> > > drm_gpuva_ops to lock those objects.
> > >
> > > I had a look at you link [1] and it seems that you keep a list of ops=
 as well by
> > > calling vm_op_enqueue() with a new struct msm_vm_op from the callback=
s.
> > >
> > > Please note that for exactly this case there is the op_alloc callback=
 in
> > > struct drm_gpuvm_ops, such that you can allocate a custom op type (i.=
e. struct
> > > msm_vm_op) that embedds a struct drm_gpuva_op.
> >
> > I did use drm_gpuvm_sm_xyz_ops_create() in an earlier iteration of my
> > VM_BIND series, but it wasn't quite what I was after.  I wanted to
> > apply the VM updates immediately to avoid issues with a later
> > map/unmap overlapping an earlier map, which
> > drm_gpuvm_sm_xyz_ops_create() doesn't really handle.  I'm not even
> > sure why this isn't a problem for other drivers unless userspace is
> > providing some guarantees.
>
> The drm_gpuva_ops are usually used in a pattern like this.
>
>         vm_bind {
>                 for_each_vm_bind_operation {
>                         drm_gpuva_for_each_op {
>                                 // modify drm_gpuvm's interval tree
>                                 // pre-allocate memory
>                                 // lock and prepare objects
>                         }
>                 }
>
>                 drm_sched_entity_push_job();
>         }
>
>         run_job {
>                 for_each_vm_bind_operation {
>                         drm_gpuva_for_each_op {
>                                 // modify page tables
>                         }
>                 }
>         }
>
>         run_job {
>                 for_each_vm_bind_operation {
>                         drm_gpuva_for_each_op {
>                                 // free page table structures, if any
>                                 // free unused pre-allocated memory
>                         }
>                 }
>         }
>
> What did you do instead to get map/unmap overlapping? Even more interesti=
ng,
> what are you doing now?

From what I can tell, the drivers using drm_gpva_for_each_op()/etc are
doing drm_gpuva_remove() while iterating the ops list..
drm_gpuvm_sm_xyz_ops_create() itself does not modify the VM.  So this
can only really work if you perform one MAP or UNMAP at a time.  Or at
least if you process the VM modifying part of the ops list before
proceeding to the next op.

>
> > Once I realized I only wanted to defer the
> > application of the pgtable changes, but keep all the
> > locking/allocation/etc in the synchronous part of the ioctl,
> > vm_op_enqueue() was the natural solution.
>
> But vm_op_enqueue() creates exactly this list of operations you would get=
 from
> drm_gpuvm_sm_{map,unmap}_ops_create(), just manually, no?

Only if each job only has a single VM_BIND MAP or UNMAP or if you
process the ops immediately.

OTOH vm_op_enqueue() generates the list of pgtable updates to perform
for a list of MAP/UNMAP ioctl ops.  I guess it would be an equivalent
of combining drm_gpuvm_sm_xyz_ops_create() plus the actual driver
callbacks in a single pass.

BR,
-R

> <snip>
>
> > > > Note that these functions do not strictly require the VM changes to=
 be
> > > > applied before the next drm_gpuvm_sm_map_lock()/_unmap_lock() call.=
  In
> > > > the case that VM changes from an earlier drm_gpuvm_sm_map()/_unmap(=
)
> > > > call result in a differing sequence of steps when the VM changes ar=
e
> > > > actually applied, it will be the same set of GEM objects involved, =
so
> > > > the locking is still correct.
> > >
> > > I'm not sure about this part, how can we be sure that's the case?
> >
> > I could be not imaginative enough here, so it is certainly worth a
> > second opinion.  And why I explicitly called it out in the commit msg.
> > But my reasoning is that any new op in the second pass that actually
> > applies the VM updates which results from overlapping with a previous
> > update in the current VM_BIND will only involve GEM objects from that
> > earlier update, which are already locked.
>
> Yeah, it's probably fine, since, as you say, the only additional object c=
an be
> the req_obj from the previous iteration.
>
