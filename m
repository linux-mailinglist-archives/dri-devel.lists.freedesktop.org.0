Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6Hj/MKiVlGneFgIAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 17 Feb 2026 17:22:00 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 78E9914E16B
	for <lists+dri-devel@lfdr.de>; Tue, 17 Feb 2026 17:22:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D6C2410E511;
	Tue, 17 Feb 2026 16:21:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="NNB/3NJL";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-dl1-f42.google.com (mail-dl1-f42.google.com [74.125.82.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 514BC10E510
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Feb 2026 16:21:57 +0000 (UTC)
Received: by mail-dl1-f42.google.com with SMTP id
 a92af1059eb24-1273882d901so207713c88.1
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Feb 2026 08:21:57 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1771345317; cv=none;
 d=google.com; s=arc-20240605;
 b=LmA7aV+6IFV8zGUDDMnPgMrnrzWAqLjMLtwSwCx8uNbDJ4L7ua2KTEHOBEG8mR9DNt
 xjcJ89ZU2XU08gavTbxatYcc+7qUR3/VOqjJqSSj3KLWMajK6viWNWQM8BUwTeL1kS4q
 C9NUEzj+zERdP7czBx2boQCjfmN6BVvsalufbpz2xiwoJuljCaQIA+ih/zGIsZ4eMts2
 h+w3hKDrSI6nOrURvKiI2jQlDGzGcmOE61irrUl+1bR8FnMiCw9cs6f8MO6O3irqd38v
 EOCU2F/zo8bV1Ib6SHWviTwoGYYOVMNsz5mlItPwN/+DhheM/I3vwmuiSPID97haKv5h
 pPPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=JI+eAeEIWKzUc1jTb5Uxg80e6X7Dqvgv9KFMaR62OBE=;
 fh=T/alvuD3lFsOxo2L+B8kgcVyxavTZ545sqLtYdeLHBU=;
 b=Kye1gEu1yfoHY8PAc+Kq2tl8K378FCrVHqkwbyLsTfBpFgKSdni56rtUKWRqvkKCjC
 xUcJETKMMAI4qYBAqyEmK17KmsvmLs2o8E2fOYRxO7vgnbUWZ5ttSfcZlJ8jbXbLJTPt
 J/BIYkPY8fL0k4sb59VGqaSX9vDMRWEH5+EOTHUN6S90PAfKlV2BeFE2VisxA9GVyCJM
 OVvcioa5GlVfxiydUnFytxwq3QoXmTpHiGwwN+qEPGdFbDYGWU3lSXkLfT6GFNH0hD3T
 Au5Er96DQ4GS2i5hc7YylS/2foNGRFCAvAAHf65doXkHuIaUP3CRnHs3VQDz2dq1BUqF
 w72g==; darn=lists.freedesktop.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1771345317; x=1771950117; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=JI+eAeEIWKzUc1jTb5Uxg80e6X7Dqvgv9KFMaR62OBE=;
 b=NNB/3NJLxNQO/igWXH4r9z0UcuqfrKfZvzVXSFQ29h+DXbuT+/8FPaYybhyC1OYWUR
 UQ9QEf6UscoCs8jv/VCgJuYrOK2wN9Voodwmk5dFCsHDdYNlsdw0IfTjZbQfZlR2Sctp
 73FIxXZG5KmNzzRjo3YTg42l954+GA8PtWVLRzIOr4qXk6wZQfofpKyrSZme7O1u0CYb
 HL0tC7ODp/ku7c29Gz9zoJ+BpPqtEa7nJQ8DVs/4zq3331JzNLrN+J9mR7quQWdhCf7R
 ubwjwhvPLO340A4I2p1fXMpIuqlqTecKD0tqBIsl5mKN6PMh5pvJMjKw7BlMGvpEJBGh
 wtiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1771345317; x=1771950117;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=JI+eAeEIWKzUc1jTb5Uxg80e6X7Dqvgv9KFMaR62OBE=;
 b=H39zO2lGWV/6G2WS5AA922+idhQTesYiJySRWnpn/28FiBY9yoHlGhvaS4TY3okuwv
 lEAGnGF5HJEq4Xs+t0qWt3Zkz4m8xNCmI/6Bk3/thQKr9bozCLfbv9++HhV+mgahXYBm
 RJK+cGFTdLRy5SJxNt9irxlhrdS4RXIuZSTM/+65jr/V9Ad5wTCBNATcXXn5G7USma5e
 pVNWYhTxU/FSPJZ1eGXPzfN75W6818+8oyVAXYel+OHlS1mTj5hnYuHMR3aYqHSs47HF
 yiM3Esu+uMq4mJnDdWJGXTrTlvLRWQ+sSzRbvqOqzBVS5c3yRsatJ3s1OFHe2TyUpOo1
 +HmQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVu4AMQv1MP+3g6zh+pTv7pLw89elnAxJHExdIWTyOFZVXIJWyfIhP8FygQ/VnLe3mUa9BkfRQfs5k=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzoDMHRtx7Qy0OnNMmlawS/xA2x27YeRJgq7BRjpaeRABHwj00l
 Jrkembo7uiZ/ZWAoAwFdxTt7q4NNAwXX3Wnm7xyteBfOqRvpZv/3odSqWGCTMArRPjCG0EAv7Md
 aS1tvQEsaUA2CBnsv0+O5QWxN+RDybl4=
X-Gm-Gg: AZuq6aLUZdJ8634c2H6dNeb5tBwtwij/wJypRb8ANDbH64PEEVb0aYKaq2gPnJyBFxx
 YN7XZbCqMhsMToqqFTn9vzwraEUi/x+/u+DxgvXDhDO2Yp10mm5+ziEMrqycLT8TgMHz52SlKLl
 X0xF0klLarhD/GUTdQNRUn51MJXB7hrFWO7Z940tdYGyT2yKOZs4nexqkLlkVj/NMKhe45dX01i
 5vorSE5oUnhMkJCTJ5lzIzmi9IOOvyNYdDY4pxqvxE5w+Zj6wdxAIoRg0QXmnZcfmVaJnVul810
 jEhFj5L0PJty7W7+Ime77mMlp9WqM/kDMyxVnHg0fQCgeaNe3cyOw3R5EOvnuOPevXhEMg==
X-Received: by 2002:a05:7022:ead2:b0:119:e56b:46b7 with SMTP id
 a92af1059eb24-1273979e682mr3080179c88.1.1771345316437; Tue, 17 Feb 2026
 08:21:56 -0800 (PST)
MIME-Version: 1.0
References: <20260211102657.4180-1-pierre-eric.pelloux-prayer@amd.com>
 <20260211102657.4180-5-pierre-eric.pelloux-prayer@amd.com>
In-Reply-To: <20260211102657.4180-5-pierre-eric.pelloux-prayer@amd.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Tue, 17 Feb 2026 11:21:44 -0500
X-Gm-Features: AaiRm51vZKMiP2LZQsl7_es59ocK_810Bdu0_NdUsWKUDv9OGdKsU4jiGzIh6Go
Message-ID: <CADnq5_P02Fx6-VG8Nei4QZozZ9hK1vY=1sYm4DOh71nXtmVehA@mail.gmail.com>
Subject: Re: [PATCH v1 5/6] drm/amdgpu: store ib info for devcoredump
To: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>
Cc: Alex Deucher <alexander.deucher@amd.com>, 
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Kees Cook <kees@kernel.org>, 
 "Gustavo A. R. Silva" <gustavoars@kernel.org>, amd-gfx@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 linux-hardening@vger.kernel.org
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
	FORGED_RECIPIENTS(0.00)[m:pierre-eric.pelloux-prayer@amd.com,m:alexander.deucher@amd.com,m:christian.koenig@amd.com,m:airlied@gmail.com,m:simona@ffwll.ch,m:kees@kernel.org,m:gustavoars@kernel.org,m:amd-gfx@lists.freedesktop.org,m:linux-kernel@vger.kernel.org,m:linux-hardening@vger.kernel.org,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	FORGED_SENDER(0.00)[alexdeucher@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FREEMAIL_CC(0.00)[amd.com,gmail.com,ffwll.ch,kernel.org,lists.freedesktop.org,vger.kernel.org];
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
	RCPT_COUNT_SEVEN(0.00)[11];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,amd.com:email,mail.gmail.com:mid]
X-Rspamd-Queue-Id: 78E9914E16B
X-Rspamd-Action: no action

On Wed, Feb 11, 2026 at 5:29=E2=80=AFAM Pierre-Eric Pelloux-Prayer
<pierre-eric.pelloux-prayer@amd.com> wrote:
>
> Store the basic state of IBs so we can read it back in the
> amdgpu_devcoredump_format function.
>
> Signed-off-by: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd=
.com>

Reviewed-by: Alex Deucher <alexander.deucher@amd.com>


> ---
>  drivers/gpu/drm/amd/amdgpu/amdgpu_dev_coredump.c | 13 ++++++++++---
>  drivers/gpu/drm/amd/amdgpu/amdgpu_dev_coredump.h |  9 +++++++++
>  2 files changed, 19 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_dev_coredump.c b/drivers/g=
pu/drm/amd/amdgpu/amdgpu_dev_coredump.c
> index 0bf85ab43204..d0af8a294abf 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_dev_coredump.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_dev_coredump.c
> @@ -387,6 +387,7 @@ void amdgpu_coredump(struct amdgpu_device *adev, bool=
 skip_vram_check,
>  {
>         struct drm_device *dev =3D adev_to_drm(adev);
>         struct amdgpu_coredump_info *coredump;
> +       size_t size =3D sizeof(*coredump);
>         struct drm_sched_job *s_job;
>         u64 total_ring_size, ring_count;
>         struct amdgpu_ring *ring;
> @@ -395,10 +396,10 @@ void amdgpu_coredump(struct amdgpu_device *adev, bo=
ol skip_vram_check,
>         if (adev->coredump_in_progress)
>                 return;
>
> -       if (adev->coredump_in_progress)
> -               return;
> +       if (job && job->pasid)
> +               size +=3D sizeof(struct amdgpu_coredump_ib_info) * job->n=
um_ibs;
>
> -       coredump =3D kzalloc(sizeof(*coredump), GFP_NOWAIT);
> +       coredump =3D kzalloc(size, GFP_NOWAIT);
>         if (!coredump)
>                 return;
>
> @@ -406,6 +407,7 @@ void amdgpu_coredump(struct amdgpu_device *adev, bool=
 skip_vram_check,
>
>         coredump->skip_vram_check =3D skip_vram_check;
>         coredump->reset_vram_lost =3D vram_lost;
> +       coredump->pasid =3D job->pasid;
>
>         if (job && job->pasid) {
>                 struct amdgpu_task_info *ti;
> @@ -415,6 +417,11 @@ void amdgpu_coredump(struct amdgpu_device *adev, boo=
l skip_vram_check,
>                         coredump->reset_task_info =3D *ti;
>                         amdgpu_vm_put_task_info(ti);
>                 }
> +               coredump->num_ibs =3D job->num_ibs;
> +               for (i =3D 0; i < job->num_ibs; ++i) {
> +                       coredump->ibs[i].gpu_addr =3D job->ibs[i].gpu_add=
r;
> +                       coredump->ibs[i].ib_size_dw =3D job->ibs[i].lengt=
h_dw;
> +               }
>         }
>
>         if (job) {
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_dev_coredump.h b/drivers/g=
pu/drm/amd/amdgpu/amdgpu_dev_coredump.h
> index 1c3d22356cc7..49486d1f6a5d 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_dev_coredump.h
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_dev_coredump.h
> @@ -38,6 +38,11 @@ struct amdgpu_coredump_ring {
>         u32                             offset;
>  };
>
> +struct amdgpu_coredump_ib_info {
> +       uint64_t                        gpu_addr;
> +       u32                             ib_size_dw;
> +};
> +
>  struct amdgpu_coredump_info {
>         struct amdgpu_device            *adev;
>         struct amdgpu_task_info         reset_task_info;
> @@ -58,6 +63,10 @@ struct amdgpu_coredump_info {
>          */
>         ssize_t                         formatted_size;
>         char                            *formatted;
> +
> +       unsigned int                    pasid;
> +       int                             num_ibs;
> +       struct amdgpu_coredump_ib_info  ibs[] __counted_by(num_ibs);
>  };
>  #endif
>
> --
> 2.43.0
>
