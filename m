Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yLVkBGXbpWkvHgAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Mon, 02 Mar 2026 19:48:05 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A70CA1DE771
	for <lists+dri-devel@lfdr.de>; Mon, 02 Mar 2026 19:48:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7E38810E587;
	Mon,  2 Mar 2026 18:48:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="BwbX7wCe";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-dl1-f51.google.com (mail-dl1-f51.google.com [74.125.82.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EF47E10E587
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Mar 2026 18:47:58 +0000 (UTC)
Received: by mail-dl1-f51.google.com with SMTP id
 a92af1059eb24-12739fe9a0eso324816c88.2
 for <dri-devel@lists.freedesktop.org>; Mon, 02 Mar 2026 10:47:58 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772477278; cv=none;
 d=google.com; s=arc-20240605;
 b=fEiOG4BRLTJeJ4Z6VSKge7vFUqZ2dnDNpWSZhsPPlyTwg402RziZlQzLkVpjGX3o6j
 pbfDkhJSeKCl4j9W6Srf4qJ+48E3qOEBRTEilVuluBT47pJMdulStYczK9ipb80U2/R/
 MsVdExmbL6lHGH55JAsyFLWNoPSLHWRq9eCjFlUJNiOBUsKtBKTWYB0KmkKvaVGZSxoJ
 2mIXF8SKv+lgbv9AzGqmFYUpmoRD0+2aCN827yZLQ2ibmzmtzsVZmVlhqTK/fKWMaMtE
 WiK5dJaOR/CY5Ff/5xoSJwt7uOe+p1epdXf7ee0PlODqZzFVvjqjv+KHg2qtjgyWCA7w
 MztA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=PhaxULRQYchacioDU3vakiclpPLY/jVd5nFbk4UvYrY=;
 fh=+rFprttuzhlJOKge0f1dsPIGVXkltA9wjV+QL/KRH/0=;
 b=j7cNgOhvf/yFSKRuBDXd6+sr7+3EmAeCcmMZohImYoWyCRWhUqiwlGU/7n6B/6ROyv
 O4mT5V/XmRRrMPcDImVRV8bVaFUzd5s7CSv+DhH2mXnV5VXu3tmzYIUz+6itqLrLBbz+
 ZLpzphC4kdLDI36384herssjqRzCJoSLsSUKZM6LnfQEQj/q/XWHypE27AvX6xO5Ob6J
 FSTu2fQxOeiKsFjCfo6r8/MEyHQesYXhHvICr0cmW1V4wmKK58s7McavaDqRZvzsAqim
 +5J/oyzZOpcP3ozgezB7UmzDIQscDe2PHHb+WNi1SjKUM+1dfpTELq8NwgEwZHNRcRaU
 RlZQ==; darn=lists.freedesktop.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1772477278; x=1773082078; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=PhaxULRQYchacioDU3vakiclpPLY/jVd5nFbk4UvYrY=;
 b=BwbX7wCeslJVMpNQZBrdKQPmRqoGPEBJCxTNGIzzRqCaqG6A/pt6DMzsfNb/MKMYR4
 NkHsSbPu4rKnIatuhXs/jKD1OygQOTyswjuFX7zHYYQQa0pNkISoofM+qK3PHh70F92K
 YtEpdNMYNKpq7xQlaEKLc6u/LDn8LzjZcrHhfoszBPQGl6XS5WPq6MIqwj5FdXILwbb5
 UpZqejffU4UF79c573OBYeFF85PLuUfZzk1xox/IKhhY1cV23ZZIv7Wx13pp1pexahrf
 lKPKJ2Sve4cN1614Wq7Qc8vndZ/ccppFbiGLzWV6J/3b/NANc9TsPX22bEjE/Nx3ZeeZ
 n1rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772477278; x=1773082078;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=PhaxULRQYchacioDU3vakiclpPLY/jVd5nFbk4UvYrY=;
 b=o/9lc+/fEEE8Vcn/tFeLjf1CTA16zPbzuwx2FeIbXivypo//mF2c2xUY+swZPbm9Jo
 0yFTMNQklAozer8CrGLnogRXg0OodXhfxYbOLyFnir2egzkuLPyLCWs5FksrcUU0CLeI
 CAAJVMIdtoqT/LIKEj1Nqngv0LwsGGfcwqlvs5vVjNp5uiOMgow489O+hey9ecZDeUK3
 h8aHqScfRjRLc8DlPPNfVaYnPXfP0Kc3OLmZ3NZe0n/4iPRhBBwPD8K0TBmLDyerzNHO
 DljXuei125YD56VKBN5RZgNPN99HSGgPYJfYol4kkvPKkDO/inCsFa6cqukDiZp4hJNs
 E9Sw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWzsZBA6rqPtuugaVWF4R7wBT89PuwtS+iQ+hdGGiHXWMgmYmx3481UgEyBuSfbxL4Ad0sAZgtfO8k=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzpVYTR2tfxLiOFVm7SMavTcmbnaHlCAPediZ4/FqpxP0LUzT9h
 Bciqi5Kcds5tQUo6GYk4e3rclgMttFvl45StLAvG6UqvVHGSjUHqn6ZlCub45uJ+gEX5CWoO8hM
 J+zjX+t0v/TEheHpBUWK3Qbp5sN/mLwc=
X-Gm-Gg: ATEYQzw2vn9c17LUwlsJObDSCOc/uHpSvLr7IMtZF2KyDESRpdcr7z5z5Dlq39kzEdH
 MVeOHhJt7B+ydlDO7wt2grlbV9lrXS7bt3H6mxR6w3X1XLi7+0JqVtPlAC25TNhw2nga0qqQwvz
 6lCEvZly+3G5zo9fEGB1cXOriS1U4PGzuDLSQELrUpMK2IjI+HNHic9guKX9AgktFNbh07qr2nN
 q3/iadyA52IaW+29LEQmEHYQAaDqAOCFkq0sIH95hVtJiuOcUlRYndkeGfxPa43238149SrJ4m+
 JRxGxtHUrLvMyMcGEI0zn0RmDrVrHbXuhzzAkU46f3bdlKZmm2Qne99Dmibt+CgD9asWug==
X-Received: by 2002:a05:7022:439e:b0:127:1186:812f with SMTP id
 a92af1059eb24-1278fd12699mr2707242c88.7.1772477277777; Mon, 02 Mar 2026
 10:47:57 -0800 (PST)
MIME-Version: 1.0
References: <20260226093727.2584-1-pierre-eric.pelloux-prayer@amd.com>
 <20260226093727.2584-6-pierre-eric.pelloux-prayer@amd.com>
In-Reply-To: <20260226093727.2584-6-pierre-eric.pelloux-prayer@amd.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Mon, 2 Mar 2026 13:47:45 -0500
X-Gm-Features: AaiRm52KgTUh-oE9R4J6uimSKwR89a_13yJJU7x5eCzcIbspb-yc-pcKUsAVKa4
Message-ID: <CADnq5_NMc0HSQy7x3DxZaox6myjjDkCtBEO7cp0523XNs+X1Jg@mail.gmail.com>
Subject: Re: [PATCH v2 6/6] drm/amdgpu: dump job ibs in the devcoredump
To: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>
Cc: Alex Deucher <alexander.deucher@amd.com>, 
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
X-Rspamd-Queue-Id: A70CA1DE771
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
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:pierre-eric.pelloux-prayer@amd.com,m:alexander.deucher@amd.com,m:christian.koenig@amd.com,m:airlied@gmail.com,m:simona@ffwll.ch,m:amd-gfx@lists.freedesktop.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[3];
	FORGED_SENDER(0.00)[alexdeucher@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FREEMAIL_CC(0.00)[amd.com,gmail.com,ffwll.ch,lists.freedesktop.org,vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	NEURAL_HAM(-0.00)[-0.998];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[alexdeucher@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_SEVEN(0.00)[8];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[dri-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo,mail.gmail.com:mid,amd.com:email,iter.data:url]
X-Rspamd-Action: no action

On Thu, Feb 26, 2026 at 4:49=E2=80=AFAM Pierre-Eric Pelloux-Prayer
<pierre-eric.pelloux-prayer@amd.com> wrote:
>
> Now that we have a worker thread, we can try to access the
> IBs of the job. The process is:
> * get the VM from the PASID
> * get the BO from its VA and the VM
> * map the BO for CPU access
> * copy everything, then add it to the dump
> Each step can fail so we have to be cautious.
> These operations can be slow so when amdgpu_devcoredump_format
> is called only to determine the size of the buffer we skip all
> of them and assume they will succeed.
>
> ---
> v2: added some comments
> ---
>
> Signed-off-by: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd=
.com>

Reviewed-by: Alex Deucher <alexander.deucher@amd.com>

> ---
>  .../gpu/drm/amd/amdgpu/amdgpu_dev_coredump.c  | 93 ++++++++++++++++++-
>  1 file changed, 92 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_dev_coredump.c b/drivers/g=
pu/drm/amd/amdgpu/amdgpu_dev_coredump.c
> index d0af8a294abf..e489bf089bc9 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_dev_coredump.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_dev_coredump.c
> @@ -200,14 +200,24 @@ static void amdgpu_devcoredump_fw_info(struct amdgp=
u_device *adev,
>  static ssize_t
>  amdgpu_devcoredump_format(char *buffer, size_t count, struct amdgpu_core=
dump_info *coredump)
>  {
> +       struct amdgpu_device *adev =3D coredump->adev;
>         struct drm_printer p;
>         struct drm_print_iterator iter;
>         struct amdgpu_vm_fault_info *fault_info;
> +       struct amdgpu_bo_va_mapping *mapping;
>         struct amdgpu_ip_block *ip_block;
> +       struct amdgpu_res_cursor cursor;
> +       struct amdgpu_bo *abo, *root;
> +       uint64_t va_start, offset;
>         struct amdgpu_ring *ring;
> -       int ver, i, j;
> +       struct amdgpu_vm *vm;
> +       u32 *ib_content;
> +       uint8_t *kptr;
> +       int ver, i, j, r;
>         u32 ring_idx, off;
> +       bool sizing_pass;
>
> +       sizing_pass =3D buffer =3D=3D NULL;
>         iter.data =3D buffer;
>         iter.offset =3D 0;
>         iter.remain =3D count;
> @@ -323,6 +333,87 @@ amdgpu_devcoredump_format(char *buffer, size_t count=
, struct amdgpu_coredump_inf
>         else if (coredump->reset_vram_lost)
>                 drm_printf(&p, "VRAM is lost due to GPU reset!\n");
>
> +       if (coredump->num_ibs) {
> +               /* Don't try to lookup the VM or map the BOs when calcula=
ting the
> +                * size required to store the devcoredump.
> +                */
> +               if (sizing_pass)
> +                       vm =3D NULL;
> +               else
> +                       vm =3D amdgpu_vm_lock_by_pasid(adev, &root, cored=
ump->pasid);
> +
> +               for (int i =3D 0; i < coredump->num_ibs && (sizing_pass |=
| vm); i++) {
> +                       ib_content =3D kvmalloc_array(coredump->ibs[i].ib=
_size_dw, 4,
> +                                                   GFP_KERNEL);
> +                       if (!ib_content)
> +                               continue;
> +
> +                       /* vm=3DNULL can only happen when 'sizing_pass' i=
s true. Skip to the
> +                        * drm_printf() calls (ib_content doesn't need to=
 be initialized
> +                        * as its content won't be written anywhere).
> +                        */
> +                       if (!vm)
> +                               goto output_ib_content;
> +
> +                       va_start =3D coredump->ibs[i].gpu_addr & AMDGPU_G=
MC_HOLE_MASK;
> +                       mapping =3D amdgpu_vm_bo_lookup_mapping(vm, va_st=
art / AMDGPU_GPU_PAGE_SIZE);
> +                       if (!mapping)
> +                               goto free_ib_content;
> +
> +                       offset =3D va_start - (mapping->start * AMDGPU_GP=
U_PAGE_SIZE);
> +                       abo =3D amdgpu_bo_ref(mapping->bo_va->base.bo);
> +                       r =3D amdgpu_bo_reserve(abo, false);
> +                       if (r)
> +                               goto free_ib_content;
> +
> +                       if (abo->flags & AMDGPU_GEM_CREATE_NO_CPU_ACCESS)=
 {
> +                               off =3D 0;
> +
> +                               if (abo->tbo.resource->mem_type !=3D TTM_=
PL_VRAM)
> +                                       goto unreserve_abo;
> +
> +                               amdgpu_res_first(abo->tbo.resource, offse=
t,
> +                                                coredump->ibs[i].ib_size=
_dw * 4,
> +                                                &cursor);
> +                               while (cursor.remaining) {
> +                                       amdgpu_device_mm_access(adev, cur=
sor.start / 4,
> +                                                               &ib_conte=
nt[off], cursor.size / 4,
> +                                                               false);
> +                                       off +=3D cursor.size;
> +                                       amdgpu_res_next(&cursor, cursor.s=
ize);
> +                               }
> +                       } else {
> +                               r =3D ttm_bo_kmap(&abo->tbo, 0,
> +                                               PFN_UP(abo->tbo.base.size=
),
> +                                               &abo->kmap);
> +                               if (r)
> +                                       goto unreserve_abo;
> +
> +                               kptr =3D amdgpu_bo_kptr(abo);
> +                               kptr +=3D offset;
> +                               memcpy(ib_content, kptr,
> +                                      coredump->ibs[i].ib_size_dw * 4);
> +
> +                               amdgpu_bo_kunmap(abo);
> +                       }
> +
> +output_ib_content:
> +                       drm_printf(&p, "\nIB #%d 0x%llx %d dw\n",
> +                                  i, coredump->ibs[i].gpu_addr, coredump=
->ibs[i].ib_size_dw);
> +                       for (int j =3D 0; j < coredump->ibs[i].ib_size_dw=
; j++)
> +                               drm_printf(&p, "0x%08x\n", ib_content[j])=
;
> +unreserve_abo:
> +                       if (vm)
> +                               amdgpu_bo_unreserve(abo);
> +free_ib_content:
> +                       kfree(ib_content);
> +               }
> +               if (vm) {
> +                       amdgpu_bo_unreserve(root);
> +                       amdgpu_bo_unref(&root);
> +               }
> +       }
> +
>         return count - iter.remain;
>  }
>
> --
> 2.43.0
>
