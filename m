Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mDsZIh+RlGk9FgIAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 17 Feb 2026 17:02:39 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 09F2A14DD28
	for <lists+dri-devel@lfdr.de>; Tue, 17 Feb 2026 17:02:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7710010E4F8;
	Tue, 17 Feb 2026 16:02:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="E9qoWt1U";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-dl1-f42.google.com (mail-dl1-f42.google.com [74.125.82.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0EC1310E502
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Feb 2026 16:02:30 +0000 (UTC)
Received: by mail-dl1-f42.google.com with SMTP id
 a92af1059eb24-1275750cfadso33843c88.1
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Feb 2026 08:02:30 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1771344149; cv=none;
 d=google.com; s=arc-20240605;
 b=ar/uuZinfWhkFBeCGarbdipA0T/DzlRCCOYsLnlmQQ+DIx9vqOEb0juo+F2RMAN28E
 zZdNycwzVJoKg7eEeT1VKi9L0gd/3Kf5+m9SCz1aOeXMC0KW2mxL69yZQui0rmtuPz0a
 JQGG6CO4MbNC/TicepUYx1UfIepbTxKLFOtha6erdxntRE1emhuytowkPeZIim8Ohnjk
 ccKn/KeZ6PfK/z9ikTI8DwlG+msvq4IGx08Qu0R5xrBSR3yogh4oTuaQaBn9SOQlYBlZ
 tqcLkIDKKFKfkkX/8pVdVZMCIZz7r9ATslsGLCq/Ea6ZLir6QvDj2QsmV87SGJVVykuJ
 RmLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=EqXPlDnCCR4VXmK4w3wj/qdnA6EVnGunafgo1gp6IFQ=;
 fh=HriwcL4oTOCNXd87EBdNnR9M+ySwvYHDtLudyarRwo4=;
 b=cYuD6DNZtCQPurJUhQd8hKkb9ed/0UHdLB+Tayk6mnhWDuSPiWRqQTncCA6vayMzJ2
 DntpoRfSv///wjprfj+vwtvTYLRIAd4TwVWQnuq8E//7KcG81U1+kXgALym/ZWuXPdRN
 h3v7NGvpikOfEKqiNehgjHiQOfVABxG2SqOjHFkIL789us9mhgw+13DPI2L2wr77ZNWj
 K0kAH+V3D5YhMiSPV+UmzTkaZlru3GSVNufVYGIHF/WRDtHEoaInfdjn+M0UoDDG2yCl
 dNfLA2Yc9W+P9n6rZNXHodFtOHVHjlulX1s9yws1koyFH/BsXZo3pbnYNOLtvG5uIZxi
 ZdGg==; darn=lists.freedesktop.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1771344149; x=1771948949; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=EqXPlDnCCR4VXmK4w3wj/qdnA6EVnGunafgo1gp6IFQ=;
 b=E9qoWt1UXz4GqAF3vUOSVMN6elXtsv/tzqEdr0MdDhWLnOHzCSJ7rzIAJa9YRZSQS5
 dotvjjIOwkEYu9Os68Fb6Rr5UTY/oN9kMX92KaQVGD6ztmKbkKAA7fTVsj804OXmWDgX
 MqZJPucr0qh6NZfhiQt+TiSgAvzB9aGUhr2vYSb0rlFkN8MVKsKTZrSuMQVtcDzD5tOV
 eesTLk/KvsHwyxuP47PVRRuIWEkM6zqK8nvJoQ8qZRMEnGnLxn+jp3ohjSz8OKcebhPZ
 NYB7WRVspsKH9vO/1EMV1evkf3KQCzeTvqnkZzYRbMYbMGV82sg5Q/hJKZ4XtFPxt+T3
 vHCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1771344149; x=1771948949;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=EqXPlDnCCR4VXmK4w3wj/qdnA6EVnGunafgo1gp6IFQ=;
 b=RGEHyPFpWEADgDmdRhpHxvHy1yRY+DwLMExWiMfXwinrFRGYfN3LEg6Vx4oG/jzNY1
 MZs2Oyh+b0Fx6ERb4KmXIhoZHIp7xi0UHnaeFpFt/DnsJRM0yw7HM8FuYYVO9c8o5EHV
 IifJLGEVAR+j8p9ue3vM+5NkeEQ1q28noDSothGS/6g2Uf/svg25LlHotT6CIj2JiL/i
 pTaMx4nXHhaMxtI1cOv0M0WnRTLuNCGpQP01UbbOVQoVO0Cy3zBfxV+1Rb8H7KBK1qYF
 MN/kha8zwwwh9GNnKHve0pBBMnpEa6bL664yONlUHO2cDeHuy9awxix4FoNJnRIKhAvI
 DfVw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWnb4WcSkYKgNE7zcBUeb91mLAGVudtExb0EIBEB9cW902NAQs+61vPD2I4dq7KzWrNUJ0cVeAyBoo=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyfAqwRl987V0bxs/z1cYTH6rjCV8Lsvb8rtf2chJeIblpeH9DV
 XoWfyZHPTXkafrt8n7a5wIh4y8ES5TlMbLgPj+zWVt32QMfFfyUYBWBxLp5QbNSSKE/L2MGHyuz
 Wv+npPdKFtwsCRE2o95YhXnBaq5bkZIY=
X-Gm-Gg: AZuq6aL312WQZz96aC6u+GAaZAECotzRt3t5UZcKiWiE6YuKmYupBtndip3DtjBtMPn
 T1U7eVujBBhu5u20NQqtXjIvfdobcNZEojm3+QU8TsVHICkCSKvBtgN9k+Xp9DUz3U66A/GFD5L
 4IG3rNjAQgnRKUNkE082eQCE6nUnzFMsuwRKIonzyih7hUr2jSgBnTV+xl1CC2xnB1T3uXvWYrl
 YMpxk99wT4smMxg9qizcv+eVJjkVsMwTKv04CWd8O81r3rmex/9jcCj6FciE53ECUwF6ozwsTs/
 mBvrafdcGH0/5VH8mqzqGFVEtakFS65hTwuKxDqvVLq62L+PwhATWzfH173zEMWF/8oNPA==
X-Received: by 2002:a05:7022:2508:b0:11e:3e9:3e98 with SMTP id
 a92af1059eb24-127399685bfmr3520040c88.7.1771344148947; Tue, 17 Feb 2026
 08:02:28 -0800 (PST)
MIME-Version: 1.0
References: <20260211102657.4180-1-pierre-eric.pelloux-prayer@amd.com>
In-Reply-To: <20260211102657.4180-1-pierre-eric.pelloux-prayer@amd.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Tue, 17 Feb 2026 11:02:15 -0500
X-Gm-Features: AaiRm51NhEBeOoc9apveFMnbjgnXnafm5yb1e5nA61D0DGNbsMPeN_hhEcOJsMo
Message-ID: <CADnq5_NsUnDMCQHH=cGVLpkqZeBE-ntaTALN=OYLZdLNg6qz-A@mail.gmail.com>
Subject: Re: [PATCH v1 1/6] drm/amdgpu: include ip discovery data in
 devcoredump
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
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[3];
	FORGED_RECIPIENTS(0.00)[m:pierre-eric.pelloux-prayer@amd.com,m:alexander.deucher@amd.com,m:christian.koenig@amd.com,m:airlied@gmail.com,m:simona@ffwll.ch,m:amd-gfx@lists.freedesktop.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_SENDER(0.00)[alexdeucher@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	ASN_FAIL(0.00)[177.210.252.131.asn.rspamd.com:query timed out];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[alexdeucher@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	FREEMAIL_CC(0.00)[amd.com,gmail.com,ffwll.ch,lists.freedesktop.org,vger.kernel.org];
	RCPT_COUNT_SEVEN(0.00)[8];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid]
X-Rspamd-Queue-Id: 09F2A14DD28
X-Rspamd-Action: no action

On Wed, Feb 11, 2026 at 5:28=E2=80=AFAM Pierre-Eric Pelloux-Prayer
<pierre-eric.pelloux-prayer@amd.com> wrote:
>
> This is the best way to describe the GPU to a tool loading
> the devcoredump.
>
> Signed-off-by: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd=
.com>

Reviewed-by: Alex Deucher <alexander.deucher@amd.com>

> ---
>  .../gpu/drm/amd/amdgpu/amdgpu_dev_coredump.c  |  2 +
>  drivers/gpu/drm/amd/amdgpu/amdgpu_discovery.c | 42 +++++++++++++++++++
>  drivers/gpu/drm/amd/amdgpu/amdgpu_discovery.h |  3 ++
>  3 files changed, 47 insertions(+)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_dev_coredump.c b/drivers/g=
pu/drm/amd/amdgpu/amdgpu_dev_coredump.c
> index 0bb430853a9f..42a969512dcc 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_dev_coredump.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_dev_coredump.c
> @@ -262,6 +262,8 @@ amdgpu_devcoredump_read(char *buffer, loff_t offset, =
size_t count,
>                 }
>         }
>
> +       amdgpu_discovery_dump(coredump->adev, &p);
> +
>         /* IP firmware information */
>         drm_printf(&p, "\nIP Firmwares\n");
>         amdgpu_devcoredump_fw_info(coredump->adev, &p);
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_discovery.c b/drivers/gpu/=
drm/amd/amdgpu/amdgpu_discovery.c
> index 41e63c286912..d7325c23fa53 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_discovery.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_discovery.c
> @@ -1380,6 +1380,48 @@ static void amdgpu_discovery_sysfs_fini(struct amd=
gpu_device *adev)
>         kobject_put(&ip_top->kobj);
>  }
>
> +/* devcoredump support */
> +void amdgpu_discovery_dump(struct amdgpu_device *adev, struct drm_printe=
r *p)
> +{
> +       struct ip_discovery_top *ip_top =3D adev->discovery.ip_top;
> +       struct ip_die_entry *ip_die_entry;
> +       struct list_head *el_die, *el_hw_id, *el_hw_inst;
> +       struct ip_hw_id *hw_id;
> +       struct kset *die_kset;
> +       struct ip_hw_instance *ip_inst;
> +       int i =3D 0, j;
> +
> +       die_kset =3D &ip_top->die_kset;
> +
> +       drm_printf(p, "\nHW IP Discovery\n");
> +       spin_lock(&die_kset->list_lock);
> +       list_for_each(el_die, &die_kset->list) {
> +               drm_printf(p, "die %d\n", i++);
> +               ip_die_entry =3D to_ip_die_entry(list_to_kobj(el_die));
> +
> +               list_for_each(el_hw_id, &ip_die_entry->ip_kset.list) {
> +                       hw_id =3D to_ip_hw_id(list_to_kobj(el_hw_id));
> +                       drm_printf(p, "hw_id %d %s\n", hw_id->hw_id, hw_i=
d_names[hw_id->hw_id]);
> +
> +                       list_for_each(el_hw_inst, &hw_id->hw_id_kset.list=
) {
> +                               ip_inst =3D to_ip_hw_instance(list_to_kob=
j(el_hw_inst));
> +                               drm_printf(p, "\tinstance %d\n", ip_inst-=
>num_instance);
> +                               drm_printf(p, "\tmajor %d\n", ip_inst->ma=
jor);
> +                               drm_printf(p, "\tminor %d\n", ip_inst->mi=
nor);
> +                               drm_printf(p, "\trevision %d\n", ip_inst-=
>revision);
> +                               drm_printf(p, "\tharvest 0x%01X\n", ip_in=
st->harvest);
> +                               drm_printf(p, "\tnum_base_addresses %d\n"=
,
> +                                          ip_inst->num_base_addresses);
> +                               for (j =3D 0; j < ip_inst->num_base_addre=
sses; j++)
> +                                       drm_printf(p, "\tbase_addr[%d] 0x=
%08X\n",
> +                                                  j, ip_inst->base_addr[=
j]);
> +                       }
> +               }
> +       }
> +       spin_unlock(&die_kset->list_lock);
> +}
> +
> +
>  /* =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D */
>
>  static int amdgpu_discovery_reg_base_init(struct amdgpu_device *adev)
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_discovery.h b/drivers/gpu/=
drm/amd/amdgpu/amdgpu_discovery.h
> index 4ce04486cc31..c8242992c912 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_discovery.h
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_discovery.h
> @@ -30,6 +30,7 @@
>  #define DISCOVERY_TMR_OFFSET    (64 << 10)
>
>  struct ip_discovery_top;
> +struct drm_printer;
>
>  struct amdgpu_discovery_info {
>         struct debugfs_blob_wrapper debugfs_blob;
> @@ -47,4 +48,6 @@ int amdgpu_discovery_get_nps_info(struct amdgpu_device =
*adev,
>                                   struct amdgpu_gmc_memrange **ranges,
>                                   int *range_cnt, bool refresh);
>
> +void amdgpu_discovery_dump(struct amdgpu_device *adev, struct drm_printe=
r *p);
> +
>  #endif /* __AMDGPU_DISCOVERY__ */
> --
> 2.43.0
>
