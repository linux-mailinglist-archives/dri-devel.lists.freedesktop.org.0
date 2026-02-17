Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wMR5JJSVlGneFgIAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 17 Feb 2026 17:21:40 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F43E14E134
	for <lists+dri-devel@lfdr.de>; Tue, 17 Feb 2026 17:21:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9087B10E50E;
	Tue, 17 Feb 2026 16:21:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="b0FfDJ30";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-dl1-f48.google.com (mail-dl1-f48.google.com [74.125.82.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BFC3E10E50B
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Feb 2026 16:21:36 +0000 (UTC)
Received: by mail-dl1-f48.google.com with SMTP id
 a92af1059eb24-1273c690e5bso229050c88.2
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Feb 2026 08:21:36 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1771345296; cv=none;
 d=google.com; s=arc-20240605;
 b=SE4tWEst1RP8SrB4ailYKApOItg4wS+6ffDSPtogMUFmcMNfj/rmyA1cJ6sRmkWqu/
 3Q6ag/MiBugDDUj691iRt4RChPMsiTR2csFuBAc52hRzxJ2AYiTvg4rD9+u9KTdhnifm
 jERKqon3wXzOuXkYBxOSj2ffZAFgcgJ0c2d08XIWUB7bJZDWRPATGDmADopSHV0tlt/x
 8hEnc9uv9uneX+/HQy820d5SRmxMdGjKDDFCGSOFy+4mmcRR68aMYVeKGw2i95/VgffB
 GWpRdZkOsCh5uV9s/1VIfAB7/RbdyZU2Z12w3yYSzmvbCbAUrH3HMCNZn0GJyxPG0/qw
 CxYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=5OjLMNpEhGZOhH95nEM9Q612OzOTY/1NripapqhTwW8=;
 fh=0eazF3TgzDzjuXRSXGx4HVMIGRxzH8BMv6m+r6Y6UWE=;
 b=M4r+q0Gr6GK5IeGIv4qKSwFKVtnfb3ni47bbq07CqfFV/DVqaqtUetYxpG54sDMKCC
 E887YexGINZ/bWXxHeoH9fnYcakOWI8TCdXunpG7syX+IofVEkiesCFJj9c4Tq3PqX7q
 s1/BIsRsY9k60KSrraGW5W0dBEhM/YahdLMlrFOFsDd5sJ8X69iq+9MrFcyXXV3D8gfX
 OMUYD15o7UWJES8l6n5rt3UiHw6dKlYSOOjE8WDleuF+nPOR/5hU1Zo0PFbitf0pQWQb
 iJKlaCGi+fTMKgHT0sJK8nR3EoRdD+6F660aMA+ysjQNz8A1Om5C7jB1eFJqMVqSCbmh
 VuYA==; darn=lists.freedesktop.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1771345296; x=1771950096; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=5OjLMNpEhGZOhH95nEM9Q612OzOTY/1NripapqhTwW8=;
 b=b0FfDJ30pCzvZwQQCGtIzsLGrCqIFsNrUgjsq2ehyOxMuzfF3wEn/wrtdDX+BGlRSu
 MfEbDmJiVwOM9HNlsyt9Sfd7hSwYtgNJrHuiKTjgvgvGbDskW/K1dnRyxjib451u6RrD
 qPvarLMRr+Cvy9ix50Y7mpplZBtIBZupOx30DsYU7hpsOQ4/xPSQkfpLZi5BbbJq97RW
 5RHoB64wmVaCrXjWjqiW2Jpq85/htuG7NPOwCjTW+SW1PXhsSVnId4F3moOPMq4Pgejp
 QGufmG/qkTtkQsY9IfOWUvZCg6BZcgpZkQi1JZgWZQwPU9d7i3pF7cOdcU27bNbqCRld
 nVOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1771345296; x=1771950096;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=5OjLMNpEhGZOhH95nEM9Q612OzOTY/1NripapqhTwW8=;
 b=xRGuqJsZnzKy02X82NRu5LhEO/JJN83JZy7WtsT0ZVBIrlo3AwVRiXbWTAPKdb7Pty
 k3MJ2GE31vIcInAVdcQSdX3i09NGp35dgF+l+a72WMOhe7mejnBbQBKUHBVAmwTh/NPT
 IFqIb3m4sYSM/dU9v43Qy+BlMwe8gHYmES1GrEkTkKudVEe19UYpj9qfaXEtaH77tTfQ
 hrHLPjbnSi4DpvYysn5qmDsFiO0YwpNZiZCi38xgjUPo2MeCwpD8ZnqVwvSmGgrajSSU
 Ao5xZmHl0+EfRqo4icQzSoXYQ5CPEOlO1kZ+TrfhSIYCXKERlQKYqOuFI411iGD/ea52
 Y8/g==
X-Forwarded-Encrypted: i=1;
 AJvYcCVghoAFSNJD4tBdlXTRlgR+aRAwcYGJlyUlE4JZLqd3C1JpF/txNVRw205af12aOVd9kVHd3ELjwwU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyEvubl3I0bR7YjTnjbkDMHfK4MXjjlNAQEUJy02f4ClGM6R0Wk
 GEvvrCpsqolglSJ5HLr8goOMqvKgFVbFpO6e4EiNere7tzXm/btHnLtQB1iXuapOd4THPAUxZul
 oH96kwNYw8dwwVjqvZIdQ+RcBY0RY8yoK3VqP
X-Gm-Gg: AZuq6aJrQbdCDTQ1d5gFtt2h22tSIOOq1Jcvmm6XzGC7mEayPuhK5zvD0uJsjmBIVeB
 40Iy0HcuB95Vun6Fc7iGy7i52ZEViBCW7UykUEGxnX78Nk/1ddtTeg7D0tgfzdykRICIc4NnSrb
 /9+cCzyaTBfszQI0bTfisU4PJ59JxVM0YFk2SC68ef2j00JyrmnAWNRWnMWr43ExZnF6vB3Ap4G
 s52LOCAjss/lJ+f0WvXean0kesLmWVSq57VEHZaAahVOm1ReISoqBES1hDoU95JMhxtD0Ln3147
 ddDAtytLTdrTlp5r+TIwRGNn6FBWfOftGW+MLWKNosNu9g0CDZ2JEH+KoB8wqRRQFgICPQ==
X-Received: by 2002:a05:7022:6b98:b0:123:308f:667b with SMTP id
 a92af1059eb24-12739793cc8mr4162045c88.2.1771345295795; Tue, 17 Feb 2026
 08:21:35 -0800 (PST)
MIME-Version: 1.0
References: <20260211102657.4180-1-pierre-eric.pelloux-prayer@amd.com>
 <20260211102657.4180-4-pierre-eric.pelloux-prayer@amd.com>
In-Reply-To: <20260211102657.4180-4-pierre-eric.pelloux-prayer@amd.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Tue, 17 Feb 2026 11:21:23 -0500
X-Gm-Features: AaiRm50OCgHm5iw9B2jU8EV7pEsKwcUfBQT0WA1EEpOMEpk41fegxP0li_OlOuc
Message-ID: <CADnq5_OS1k3EdY73hw+68nHC2Qg8KcjX9bLYZKp-R6df1vLUow@mail.gmail.com>
Subject: Re: [PATCH v1 4/6] drm/amdgpu: extract amdgpu_vm_lock_by_pasid from
 amdgpu_vm_handle_fault
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,amd.com:email,mail.gmail.com:mid]
X-Rspamd-Queue-Id: 3F43E14E134
X-Rspamd-Action: no action

On Wed, Feb 11, 2026 at 5:37=E2=80=AFAM Pierre-Eric Pelloux-Prayer
<pierre-eric.pelloux-prayer@amd.com> wrote:
>
> This is tricky to implement right and we're going to need
> it from the devcoredump.
>
> Signed-off-by: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd=
.com>

Acked-by: Alex Deucher <alexander.deucher@amd.com>

> ---
>  drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c | 84 +++++++++++++++++---------
>  drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h |  3 +
>  2 files changed, 57 insertions(+), 30 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c b/drivers/gpu/drm/amd=
/amdgpu/amdgpu_vm.c
> index 807f8bcc7de5..6a5b3e148554 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
> @@ -2930,6 +2930,50 @@ int amdgpu_vm_ioctl(struct drm_device *dev, void *=
data, struct drm_file *filp)
>         return 0;
>  }
>
> +/**
> + * amdgpu_vm_lock_by_pasid - return an amdgpu_vm and its root bo from a =
pasid, if possible.
> + * @adev: amdgpu device pointer
> + * @root: root BO of the VM
> + * @pasid: PASID of the VM
> + * The caller needs to unreserve and unref the root bo on success.
> + */
> +struct amdgpu_vm *amdgpu_vm_lock_by_pasid(struct amdgpu_device *adev,
> +                                         struct amdgpu_bo **root, u32 pa=
sid)
> +{
> +       unsigned long irqflags;
> +       struct amdgpu_vm *vm;
> +       int r;
> +
> +       xa_lock_irqsave(&adev->vm_manager.pasids, irqflags);
> +       vm =3D xa_load(&adev->vm_manager.pasids, pasid);
> +       *root =3D vm ? amdgpu_bo_ref(vm->root.bo) : NULL;
> +       xa_unlock_irqrestore(&adev->vm_manager.pasids, irqflags);
> +
> +       if (!*root)
> +               return NULL;
> +
> +       r =3D amdgpu_bo_reserve(*root, true);
> +       if (r)
> +               goto error_unref;
> +
> +       /* Double check that the VM still exists */
> +       xa_lock_irqsave(&adev->vm_manager.pasids, irqflags);
> +       vm =3D xa_load(&adev->vm_manager.pasids, pasid);
> +       if (vm && vm->root.bo !=3D *root)
> +               vm =3D NULL;
> +       xa_unlock_irqrestore(&adev->vm_manager.pasids, irqflags);
> +       if (!vm)
> +               goto error_unlock;
> +
> +       return vm;
> +error_unlock:
> +       amdgpu_bo_unreserve(*root);
> +
> +error_unref:
> +       amdgpu_bo_unref(root);
> +       return NULL;
> +}
> +
>  /**
>   * amdgpu_vm_handle_fault - graceful handling of VM faults.
>   * @adev: amdgpu device pointer
> @@ -2945,50 +2989,31 @@ int amdgpu_vm_ioctl(struct drm_device *dev, void =
*data, struct drm_file *filp)
>   * shouldn't be reported any more.
>   */
>  bool amdgpu_vm_handle_fault(struct amdgpu_device *adev, u32 pasid,
> -                           u32 vmid, u32 node_id, uint64_t addr, uint64_=
t ts,
> -                           bool write_fault)
> +                           u32 vmid, u32 node_id, uint64_t addr,
> +                           uint64_t ts, bool write_fault)
>  {
>         bool is_compute_context =3D false;
>         struct amdgpu_bo *root;
> -       unsigned long irqflags;
>         uint64_t value, flags;
>         struct amdgpu_vm *vm;
>         int r;
>
> -       xa_lock_irqsave(&adev->vm_manager.pasids, irqflags);
> -       vm =3D xa_load(&adev->vm_manager.pasids, pasid);
> -       if (vm) {
> -               root =3D amdgpu_bo_ref(vm->root.bo);
> -               is_compute_context =3D vm->is_compute_context;
> -       } else {
> -               root =3D NULL;
> -       }
> -       xa_unlock_irqrestore(&adev->vm_manager.pasids, irqflags);
> -
> -       if (!root)
> +       vm =3D amdgpu_vm_lock_by_pasid(adev, &root, pasid);
> +       if (!vm)
>                 return false;
>
> +       is_compute_context =3D vm->is_compute_context;
> +
>         addr /=3D AMDGPU_GPU_PAGE_SIZE;
>
> -       if (is_compute_context && !svm_range_restore_pages(adev, pasid, v=
mid,
> -           node_id, addr, ts, write_fault)) {
> +       if (is_compute_context &&
> +               !svm_range_restore_pages(adev, pasid, vmid, node_id, addr=
,
> +                                       ts, write_fault)) {
> +               amdgpu_bo_unreserve(root);
>                 amdgpu_bo_unref(&root);
>                 return true;
>         }
>
> -       r =3D amdgpu_bo_reserve(root, true);
> -       if (r)
> -               goto error_unref;
> -
> -       /* Double check that the VM still exists */
> -       xa_lock_irqsave(&adev->vm_manager.pasids, irqflags);
> -       vm =3D xa_load(&adev->vm_manager.pasids, pasid);
> -       if (vm && vm->root.bo !=3D root)
> -               vm =3D NULL;
> -       xa_unlock_irqrestore(&adev->vm_manager.pasids, irqflags);
> -       if (!vm)
> -               goto error_unlock;
> -
>         flags =3D AMDGPU_PTE_VALID | AMDGPU_PTE_SNOOPED |
>                 AMDGPU_PTE_SYSTEM;
>
> @@ -3027,7 +3052,6 @@ bool amdgpu_vm_handle_fault(struct amdgpu_device *a=
dev, u32 pasid,
>         if (r < 0)
>                 dev_err(adev->dev, "Can't handle page fault (%d)\n", r);
>
> -error_unref:
>         amdgpu_bo_unref(&root);
>
>         return false;
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h b/drivers/gpu/drm/amd=
/amdgpu/amdgpu_vm.h
> index 139642eacdd0..2051eda55c99 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h
> @@ -589,6 +589,9 @@ bool amdgpu_vm_handle_fault(struct amdgpu_device *ade=
v, u32 pasid,
>                             u32 vmid, u32 node_id, uint64_t addr, uint64_=
t ts,
>                             bool write_fault);
>
> +struct amdgpu_vm *amdgpu_vm_lock_by_pasid(struct amdgpu_device *adev,
> +                                         struct amdgpu_bo **root, u32 pa=
sid);
> +
>  void amdgpu_vm_set_task_info(struct amdgpu_vm *vm);
>
>  void amdgpu_vm_move_to_lru_tail(struct amdgpu_device *adev,
> --
> 2.43.0
>
