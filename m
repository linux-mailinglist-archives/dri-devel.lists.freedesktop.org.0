Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +IITK2mVlGnNFgIAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 17 Feb 2026 17:20:57 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F7A214E0DC
	for <lists+dri-devel@lfdr.de>; Tue, 17 Feb 2026 17:20:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4B16110E508;
	Tue, 17 Feb 2026 16:20:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="VaVSSD7b";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-dl1-f45.google.com (mail-dl1-f45.google.com [74.125.82.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E2BB110E508
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Feb 2026 16:20:52 +0000 (UTC)
Received: by mail-dl1-f45.google.com with SMTP id
 a92af1059eb24-1275750cfadso35842c88.1
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Feb 2026 08:20:52 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1771345252; cv=none;
 d=google.com; s=arc-20240605;
 b=iElTCSlgecZRotSIhf0oaunZ9wFAdYFAiM2orsNvMOLZ3Vo2SmQjFD/OZpJ9VkW4l9
 BIsE5/n8pWSzQkH11U2VjNUki3wqX65TO6+ScereIP1a5ZNSHLSHlRpdzNHSAEnw5zCT
 yaVThwoMUscWaDfIjngESQ31a0CW3cujcp5t0d/EcvCBuaKR8UZBlpLuf+UfpzOw4UOa
 1UB8WJgtHYQxWPQhGFaz7gDTpLI+O9O1JgWLNJnxJNnCrQFNFCBXMBepGTcJmP48+HFl
 PD9YBmVIxDVUDbp53u6sC+6lGUjnAZGUMaW/0ugvmbRCrCke/12gGMDOELN28Y9+TCgf
 hQWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=9i55LZieGKs05yWNPk9MKUvqSoDlPgmRzyXhZLZD6vQ=;
 fh=tIvafRQNVGdUIm7aISF2us5K1mAvGfFWYOEByPf1CqY=;
 b=VCJjG6bhsoLv7VDLpiGGGPa4169HY0HjzeiVjxjka5nECdfoxBsIZSQH22tDasN0/P
 NsewmgkOtGXwqbEEFz4k3FgNYnJrOoO1SmwimATthrrlvu7yOorGDzImJ4q4L/hFM1Ab
 heH9xr1ZcXrp22XrphHjpInFur1+vezl3tryH5sK7GBSabqFsOspNc82yoNzRMZJ+GvW
 LBRSNTbOkTWdryeUt18YVwI9Va/dWIossusEQ6eXGZz/gNZNbUCQEhLzh5h5wULPmMi/
 QeidsbP5sjrHjDGsaHjLIrXZpYXaDnTgqnznA6tpYkMw/5jHNlwH+vdKeA2aWXrYmW4F
 KDGQ==; darn=lists.freedesktop.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1771345252; x=1771950052; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=9i55LZieGKs05yWNPk9MKUvqSoDlPgmRzyXhZLZD6vQ=;
 b=VaVSSD7b+EpWvlK9NAPPW4SjrPb5s2Z/+Tw6+zOGwYgfA7eHl5zoHkhDM9eyqQTAm5
 vhrUh/G+jaG5BXnx81MOCP5C0TdHFu3uxx2OP9aXaIqho6ZdoVhCfFCc4jIFZyJcBdlg
 5ZWG/nw66vy7xF2sOkQ7Ew+dWiv8pljkRbbL7KtZYF+UHL6HA6YwaDutwP/bjy0JvtB3
 OyjOxznmxn05QHY0nNuqRBJ2uA1iikwV2GkdsY3WExiRhmDzm6JKVE8z3PuYVDT45OhY
 uUp7DkexzPQOsolH5ibPtgZZYe0h7cVwR2VKX59sDVt5hlQNpg77rUz4xPsjKG85Z7+2
 Rusw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1771345252; x=1771950052;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=9i55LZieGKs05yWNPk9MKUvqSoDlPgmRzyXhZLZD6vQ=;
 b=aUIJYAjDLqBaaHUokJOxL1HVMi1fbqLCIqlQiN8QWi/ENTETZvqMmz/fdfMhaSAS56
 Fo76gEyoihOTGrt1pyVPw4QF8m/yP/FIlJZJmjbTrYTc9t/YMZw6kOLyvZCSjkn5hyKp
 b5L+HeaJyKpTSTgORpRUsnp+cfrpnBTmYZcAQwZkTfk/okq2nhX3piESfO5h0rEeLFSs
 eRCnS4Wdw/nu8v5dZ+vHA1VoYmvM61aGbZaYU7Aj3zDBN0uoO9yH7OAotNbXUUzOmjQY
 UxJNl8pL6BovpsEp0g7G0GGo2ha8AULfCxPuOJsqV57fKkGcOZGMO18ShwKtjz/zRy8g
 VAAQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWbtm193a63QB8YnwvT16Ks1VW8kG/FolGMGnaJ4w0XjUV+e59KzLzHkne8R4sjl6nJXw2MHwTjDfE=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzSGcTyawVRY+M5AmpNHa8sQoCnFFO798XaIzdO4meeotUSRwdW
 ZMyFFyi+K/MfhnIcvNx53I2KjzkfmRckApOgVcsauBgkSKvKHAl+TMGY9LP6NQ6r7MoGY6xvjkf
 MajL5fX5LZ91y7R5Codc/ggjFQgpsEz4=
X-Gm-Gg: AZuq6aLP4j8PqCHWM34H0KE2TUUWOLGu7Wwqe5LC7B/ySBhCrk6K8bScQ8clYsqzeuK
 D7et7WHiAjTwZbYWmv1HAfs2G2sREnKyEcnsm0fwlfUZNBi/9otRp4jz8Q8iKalmgGx7li0+C1n
 sVt60IruCE6fjp9Lys2hdne21/oBUiwwrZOtExHO9Ih0z+BEcr/T5yQVnYIOAB89bKVB2p7Aat9
 5s2k1GbPkkcEpdBBORNnTgPa2Cn7hylwRaMoyR++CMed+7uFR4e9ZpKtTbRD5GdRIz1JbRDneSY
 5ceupysP0krlo2cOp+poYQysv2QFHcg3BHhO1EclQ4+atkA3lVNkIUolA1u4QW/rjtkbWXiRauD
 pZe2O
X-Received: by 2002:a05:7022:3f09:b0:124:94b6:2a1f with SMTP id
 a92af1059eb24-127398118b9mr2362895c88.3.1771345252051; Tue, 17 Feb 2026
 08:20:52 -0800 (PST)
MIME-Version: 1.0
References: <20260211102657.4180-1-pierre-eric.pelloux-prayer@amd.com>
 <20260211102657.4180-6-pierre-eric.pelloux-prayer@amd.com>
In-Reply-To: <20260211102657.4180-6-pierre-eric.pelloux-prayer@amd.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Tue, 17 Feb 2026 11:20:40 -0500
X-Gm-Features: AaiRm50d9cmG136ZAb4BP8CYmpO7L52Et3tMmtNHutM6CWuRv-FRvnuQyTDqA0U
Message-ID: <CADnq5_Ndh2zaQ5VcoA1jNjAohkurqofd5_TweCfX+iaKz9h+vA@mail.gmail.com>
Subject: Re: [PATCH v1 6/6] drm/amdgpu: dump job ibs in the devcoredump
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
	FORGED_RECIPIENTS(0.00)[m:pierre-eric.pelloux-prayer@amd.com,m:alexander.deucher@amd.com,m:christian.koenig@amd.com,m:airlied@gmail.com,m:simona@ffwll.ch,m:amd-gfx@lists.freedesktop.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
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
	RCPT_COUNT_SEVEN(0.00)[8];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,mail.gmail.com:mid,amd.com:email,iter.data:url]
X-Rspamd-Queue-Id: 1F7A214E0DC
X-Rspamd-Action: no action

On Wed, Feb 11, 2026 at 6:07=E2=80=AFAM Pierre-Eric Pelloux-Prayer
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
> Signed-off-by: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd=
.com>
> ---
>  .../gpu/drm/amd/amdgpu/amdgpu_dev_coredump.c  | 84 ++++++++++++++++++-
>  1 file changed, 83 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_dev_coredump.c b/drivers/g=
pu/drm/amd/amdgpu/amdgpu_dev_coredump.c
> index d0af8a294abf..d576518c212d 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_dev_coredump.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_dev_coredump.c
> @@ -200,12 +200,20 @@ static void amdgpu_devcoredump_fw_info(struct amdgp=
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
>
>         iter.data =3D buffer;
> @@ -323,6 +331,80 @@ amdgpu_devcoredump_format(char *buffer, size_t count=
, struct amdgpu_coredump_inf
>         else if (coredump->reset_vram_lost)
>                 drm_printf(&p, "VRAM is lost due to GPU reset!\n");
>
> +       if (coredump->num_ibs) {
> +               if (buffer)
> +                       vm =3D amdgpu_vm_lock_by_pasid(adev, &root, cored=
ump->pasid);
> +               else
> +                       vm =3D NULL;

Is there any point in doing the loop if the vm is NULL?

> +
> +               for (int i =3D 0; i < coredump->num_ibs && (!buffer || vm=
); i++) {
> +                       ib_content =3D kvmalloc_array(coredump->ibs[i].ib=
_size_dw, 4,
> +                                                   GFP_KERNEL);

Shouldn't this be GFP_NOWAIT?

Alex

> +                       if (!ib_content)
> +                               continue;
> +
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
