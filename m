Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4JHOD56blGmrFwIAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 17 Feb 2026 17:47:26 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CCA5D14E64C
	for <lists+dri-devel@lfdr.de>; Tue, 17 Feb 2026 17:47:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0E2F810E518;
	Tue, 17 Feb 2026 16:47:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="dJFpzaJS";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-dl1-f45.google.com (mail-dl1-f45.google.com [74.125.82.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9AE7D10E518
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Feb 2026 16:47:22 +0000 (UTC)
Received: by mail-dl1-f45.google.com with SMTP id
 a92af1059eb24-1273c690e5bso232976c88.2
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Feb 2026 08:47:22 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1771346842; cv=none;
 d=google.com; s=arc-20240605;
 b=UT3QOaCmPqkn82dZM2FCi1yMikb7kit3Ot8xafDxrt39BOUH/3xjPSrlW6inwlxg/n
 snNITz7gBZIZdh7ldlWblsWpp/RDS3ON4pCPgGIyVX0R1np9wUrvNGx779dYNJyU7p5K
 mkj7f/Vx7vstmXHKaCmBBucj/5n58Ys2iJ/FM9VdHtf2sxi5pHbNTg7z/DVmkV9qgSY0
 g39m/ty0Itthizyic+jlu63X2RAuuW1n7IukFgc2pgekabuyQlC4gvtPURJwnJ1i9Fbd
 IaD2odtlTJX5LZ7UnCsfkVykqIyj4/L9Qs+TC84X7vhVRyZ2WO62aNpvsA770eUli/ln
 CXrg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=VokuTejaQBC0yTx29wLjFLNBukrHovvkoeyofn8ozM8=;
 fh=Xxl+6Z2T3O6qANgA1qz9DMfdhjyoG3gfL8eXsnHMXsU=;
 b=eS4I55PIhOhdPAutCJhRkPKNnQLX2Y03EcH3c5b1Bc/n2wxmDgnHaFq+y+M5sU0Qb5
 gCQDLmYT/0DQxqYSQjqzO5MUYSUWUW1xyg5mN3EvEbFq8caPJ4AQ1Dkg2W+bC4zLMz+O
 MnXb9Um39U8tDwrZR1ZgEew68onejxJpkdcayXm2dsYphd4c86pmlIYejxdGnOs3x+xH
 /UTjyK4O37TaZpMzpoRDpPZ1UoBElUNRL6AXys2ZEYJEPySGo0sOZg3/myhs1/kCYBGu
 y1Rz9HKzGq6ND1p5wbZxViJmTaT4jlNUNV43G8C5llPgWIw2aHWAEjPbzXwlRjSJj1l3
 KTRw==; darn=lists.freedesktop.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1771346842; x=1771951642; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=VokuTejaQBC0yTx29wLjFLNBukrHovvkoeyofn8ozM8=;
 b=dJFpzaJSLoyPOKPZ3/qLqsF7YVo5jT9XxDa7fLe0GruyzKArfnI09mhQflsTg+Fbzi
 XPb/YvlJWkb1rNWoUj3ZttRpDNOncb9dQmP5jfQPLZdnN1Qa9Ug2+UDBQlGzp6x4uqQZ
 7Z1Ym4HMO7k3ruqun4GRBhrZH78GinyJOgzXu2P5v6OMKZ6Y/UFERHnqfg7rbZC3CAOn
 cgi7UnBXWdtVpRkc5gZiMEXfWgUbSU2Hg/iykEA5DS6X/Bg0OY8KUIA+zX3i7nTO7Xz1
 26XXgeyzR9QqaISie730+wIcbXok+5wGNlDRVfxnL/v13iChqXAi7oIj8eQ0/vvfAM4a
 fPJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1771346842; x=1771951642;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=VokuTejaQBC0yTx29wLjFLNBukrHovvkoeyofn8ozM8=;
 b=HydHlxEr3Hu26Ys3AoTjacAvozy36pDcDe2DdQJ6UlG6wJQeESZ0fqRf5UAAwSlnOB
 7GtOlIp4joxP4E7fOSzdJVVxQjeWYqihWotIY/UJjIGazPX04YcXlc3AyhIuqsermt/T
 qIbMgT/0f3JiKKwqx7QipOftmP98pYadllcscsKwftCwaZLeAT8O2V45Adsi7bMOQ/Dl
 YCa4emrFI+I5LX3f0zSutmQy+LkV8kNSC+0oJ/LPcVmazV1KaVSj8+EPZuQ8Qb7dy791
 XQHujmqZ/b3lWWac5//2HY7UrhvC+lNz9R4kwrIJWGxORMI5uNvmkt7oY26fNg2OWaIk
 netg==
X-Forwarded-Encrypted: i=1;
 AJvYcCU9ISzzGeGkRsALQ04gcHx8jpHtp7nvBXqfBd6DOzjFVUQa5hWbHkU/TxWifVknfl5ZQodD+yFNHi8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyQHsjD8EU6meokGiytdGHFhlfU0777JaYQbmHqHgKW6EBI0V7g
 02D1OeWJ9cMTr72vV0Nfj4lFvPf5F5KSaCAThat1E1WrMPL8FQaMrDWk8RSYxLSPcqOL6V205FN
 5/aiTwNARYff2YVC5/oLZX4CqjutRF6A=
X-Gm-Gg: AZuq6aLkmN34iHN/zURluRRVmGK4xK1ctVLiVRyLA9yUZoTpv+/bRLf0fCchwFVySrj
 6l2hzOQ8okzb9BZdzj9ZtQe/Pvxs5bCyWSZq1NZUWt9S9ZCxucyK8YIGPDer0VDcGGlkaZrLIXf
 yR1kFLaERspUGJCZAlhtymQy8mMSQ/9Uk/iabqpaMNHk89UW/dL/DMBg+BIZlYc2SzL7h0hyI0v
 H1nNHxqfq0NXaEWrAP2LDGIqKSwWnTr+QUb/XD/qKUGgJ9QOYOZllAM8l4X7gd9aNrpKSj7sfQS
 0YdmRxXTep7Qi2xLq2Lh6CGlBygtQy3MfKNgy5K86p0NcG5PGl0Vv2wQkFH4lejcQEasug==
X-Received: by 2002:a05:7022:2228:b0:124:9e46:830e with SMTP id
 a92af1059eb24-12739793825mr3442314c88.1.1771346841830; Tue, 17 Feb 2026
 08:47:21 -0800 (PST)
MIME-Version: 1.0
References: <20260211102657.4180-1-pierre-eric.pelloux-prayer@amd.com>
 <20260211102657.4180-6-pierre-eric.pelloux-prayer@amd.com>
 <CADnq5_Ndh2zaQ5VcoA1jNjAohkurqofd5_TweCfX+iaKz9h+vA@mail.gmail.com>
 <78b10f62-60d1-4dee-94a0-fa2eaf139cb6@damsy.net>
In-Reply-To: <78b10f62-60d1-4dee-94a0-fa2eaf139cb6@damsy.net>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Tue, 17 Feb 2026 11:47:10 -0500
X-Gm-Features: AaiRm50GcYHyj25MurjIg32rg_RXR15XSO2HmWEmfm3sOAkyfluuePJnNxPb9kA
Message-ID: <CADnq5_OJ3jS8yUN6yih5UaydOKHUr=-dxW9+anBFgniOV0UqNg@mail.gmail.com>
Subject: Re: [PATCH v1 6/6] drm/amdgpu: dump job ibs in the devcoredump
To: Pierre-Eric Pelloux-Prayer <pierre-eric@damsy.net>
Cc: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>, 
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 amd-gfx@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.31 / 15.00];
	ARC_ALLOW(-1.00)[google.com:s=arc-20240605:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:pierre-eric@damsy.net,m:pierre-eric.pelloux-prayer@amd.com,m:alexander.deucher@amd.com,m:christian.koenig@amd.com,m:airlied@gmail.com,m:simona@ffwll.ch,m:amd-gfx@lists.freedesktop.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	FORGED_SENDER(0.00)[alexdeucher@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FREEMAIL_CC(0.00)[amd.com,gmail.com,ffwll.ch,lists.freedesktop.org,vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[alexdeucher@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCPT_COUNT_SEVEN(0.00)[9];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,iter.data:url,mail.gmail.com:mid,damsy.net:email]
X-Rspamd-Queue-Id: CCA5D14E64C
X-Rspamd-Action: no action

On Tue, Feb 17, 2026 at 11:38=E2=80=AFAM Pierre-Eric Pelloux-Prayer
<pierre-eric@damsy.net> wrote:
>
>
>
> Le 17/02/2026 =C3=A0 17:20, Alex Deucher a =C3=A9crit :
> > On Wed, Feb 11, 2026 at 6:07=E2=80=AFAM Pierre-Eric Pelloux-Prayer
> > <pierre-eric.pelloux-prayer@amd.com> wrote:
> >>
> >> Now that we have a worker thread, we can try to access the
> >> IBs of the job. The process is:
> >> * get the VM from the PASID
> >> * get the BO from its VA and the VM
> >> * map the BO for CPU access
> >> * copy everything, then add it to the dump
> >> Each step can fail so we have to be cautious.
> >> These operations can be slow so when amdgpu_devcoredump_format
> >> is called only to determine the size of the buffer we skip all
> >> of them and assume they will succeed.
> >>
> >> Signed-off-by: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@=
amd.com>
> >> ---
> >>   .../gpu/drm/amd/amdgpu/amdgpu_dev_coredump.c  | 84 +++++++++++++++++=
+-
> >>   1 file changed, 83 insertions(+), 1 deletion(-)
> >>
> >> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_dev_coredump.c b/driver=
s/gpu/drm/amd/amdgpu/amdgpu_dev_coredump.c
> >> index d0af8a294abf..d576518c212d 100644
> >> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_dev_coredump.c
> >> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_dev_coredump.c
> >> @@ -200,12 +200,20 @@ static void amdgpu_devcoredump_fw_info(struct am=
dgpu_device *adev,
> >>   static ssize_t
> >>   amdgpu_devcoredump_format(char *buffer, size_t count, struct amdgpu_=
coredump_info *coredump)
> >>   {
> >> +       struct amdgpu_device *adev =3D coredump->adev;
> >>          struct drm_printer p;
> >>          struct drm_print_iterator iter;
> >>          struct amdgpu_vm_fault_info *fault_info;
> >> +       struct amdgpu_bo_va_mapping *mapping;
> >>          struct amdgpu_ip_block *ip_block;
> >> +       struct amdgpu_res_cursor cursor;
> >> +       struct amdgpu_bo *abo, *root;
> >> +       uint64_t va_start, offset;
> >>          struct amdgpu_ring *ring;
> >> -       int ver, i, j;
> >> +       struct amdgpu_vm *vm;
> >> +       u32 *ib_content;
> >> +       uint8_t *kptr;
> >> +       int ver, i, j, r;
> >>          u32 ring_idx, off;
> >>
> >>          iter.data =3D buffer;
> >> @@ -323,6 +331,80 @@ amdgpu_devcoredump_format(char *buffer, size_t co=
unt, struct amdgpu_coredump_inf
> >>          else if (coredump->reset_vram_lost)
> >>                  drm_printf(&p, "VRAM is lost due to GPU reset!\n");
> >>
> >> +       if (coredump->num_ibs) {
> >> +               if (buffer)
> >> +                       vm =3D amdgpu_vm_lock_by_pasid(adev, &root, co=
redump->pasid);
> >> +               else
> >> +                       vm =3D NULL;
> >
> > Is there any point in doing the loop if the vm is NULL?
>
> Yes : when doing the first pass to size the final buffer I skip the
> buffers mapping + read operations that might be slow and instead just
> account for the outputting of ib_size_dw dwords.

But if you don't map the buffer, you'll just be dumping the random
content from ib_content[].

>
> >
> >> +
> >> +               for (int i =3D 0; i < coredump->num_ibs && (!buffer ||=
 vm); i++) {
> >> +                       ib_content =3D kvmalloc_array(coredump->ibs[i]=
.ib_size_dw, 4,
> >> +                                                   GFP_KERNEL);
> >
> > Shouldn't this be GFP_NOWAIT?
>
> This is executed by a worker so GFP_KERNEL should be ok?

Oh, right.  Yeah, should be ok.

Alex

>
> Pierre-Eric
>
> >
> > Alex
> >
> >> +                       if (!ib_content)
> >> +                               continue;
> >> +
> >> +                       if (!vm)
> >> +                               goto output_ib_content;
> >> +
> >> +                       va_start =3D coredump->ibs[i].gpu_addr & AMDGP=
U_GMC_HOLE_MASK;
> >> +                       mapping =3D amdgpu_vm_bo_lookup_mapping(vm, va=
_start / AMDGPU_GPU_PAGE_SIZE);
> >> +                       if (!mapping)
> >> +                               goto free_ib_content;
> >> +
> >> +                       offset =3D va_start - (mapping->start * AMDGPU=
_GPU_PAGE_SIZE);
> >> +                       abo =3D amdgpu_bo_ref(mapping->bo_va->base.bo)=
;
> >> +                       r =3D amdgpu_bo_reserve(abo, false);
> >> +                       if (r)
> >> +                               goto free_ib_content;
> >> +
> >> +                       if (abo->flags & AMDGPU_GEM_CREATE_NO_CPU_ACCE=
SS) {
> >> +                               off =3D 0;
> >> +
> >> +                               if (abo->tbo.resource->mem_type !=3D T=
TM_PL_VRAM)
> >> +                                       goto unreserve_abo;
> >> +
> >> +                               amdgpu_res_first(abo->tbo.resource, of=
fset,
> >> +                                                coredump->ibs[i].ib_s=
ize_dw * 4,
> >> +                                                &cursor);
> >> +                               while (cursor.remaining) {
> >> +                                       amdgpu_device_mm_access(adev, =
cursor.start / 4,
> >> +                                                               &ib_co=
ntent[off], cursor.size / 4,
> >> +                                                               false)=
;
> >> +                                       off +=3D cursor.size;
> >> +                                       amdgpu_res_next(&cursor, curso=
r.size);
> >> +                               }
> >> +                       } else {
> >> +                               r =3D ttm_bo_kmap(&abo->tbo, 0,
> >> +                                               PFN_UP(abo->tbo.base.s=
ize),
> >> +                                               &abo->kmap);
> >> +                               if (r)
> >> +                                       goto unreserve_abo;
> >> +
> >> +                               kptr =3D amdgpu_bo_kptr(abo);
> >> +                               kptr +=3D offset;
> >> +                               memcpy(ib_content, kptr,
> >> +                                      coredump->ibs[i].ib_size_dw * 4=
);
> >> +
> >> +                               amdgpu_bo_kunmap(abo);
> >> +                       }
> >> +
> >> +output_ib_content:
> >> +                       drm_printf(&p, "\nIB #%d 0x%llx %d dw\n",
> >> +                                  i, coredump->ibs[i].gpu_addr, cored=
ump->ibs[i].ib_size_dw);
> >> +                       for (int j =3D 0; j < coredump->ibs[i].ib_size=
_dw; j++)
> >> +                               drm_printf(&p, "0x%08x\n", ib_content[=
j]);
> >> +unreserve_abo:
> >> +                       if (vm)
> >> +                               amdgpu_bo_unreserve(abo);
> >> +free_ib_content:
> >> +                       kfree(ib_content);
> >> +               }
> >> +               if (vm) {
> >> +                       amdgpu_bo_unreserve(root);
> >> +                       amdgpu_bo_unref(&root);
> >> +               }
> >> +       }
> >> +
> >>          return count - iter.remain;
> >>   }
> >>
> >> --
> >> 2.43.0
> >>
