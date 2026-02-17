Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kKemIU+TlGl3FgIAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 17 Feb 2026 17:11:59 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 389F214DEDC
	for <lists+dri-devel@lfdr.de>; Tue, 17 Feb 2026 17:11:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D72BF10E50C;
	Tue, 17 Feb 2026 16:11:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="KD2qBgiF";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-dl1-f54.google.com (mail-dl1-f54.google.com [74.125.82.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4D41A10E50C
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Feb 2026 16:11:54 +0000 (UTC)
Received: by mail-dl1-f54.google.com with SMTP id
 a92af1059eb24-12736a0147cso305526c88.1
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Feb 2026 08:11:54 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1771344714; cv=none;
 d=google.com; s=arc-20240605;
 b=c+vCFPQNY6g9nQq9qSV04jpSaAetBGXbjP2U7vrTtkcvRBZmZBTcNZtNz2qUH0jVUz
 0giJKL7tNMzt6ZM1dCPngbKxBF2mfg1tMKU8ApdwEBZAdiot0JjL3pvQnwLA4HxumjAd
 KsAS1d+7YfMP5zg/qZzxHgUaFMnqWInsauQNkNyaHVAtqqdLnxH8tsy1XfNderW7DKsp
 8V1a/Ph6iWedrKmiEc1/XfBZFJDllvINwp0Fp3ZGVci57rv0jt8ezUce4sl8JiDq4tGV
 cTUc2SbZPDbGgqHgHM8qfpS5X7JBY38gHHfpUrAtqtoFVFkTqyRkVIQXDhBMhnEbg4Fh
 33DA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=Ys2nmb9jfZmDWRjPOlnRXiHNClkGEjC4v6EyMQw4yIs=;
 fh=RpSHRc0exRqtmdndstWbV2UgX5KqHCffydY40WnDenk=;
 b=GsStqUt5SzssUL0AbAv5wghLJbUmahc0gfXnTTjv5598wcyzBxWK7BpwYJHXwVlM3U
 0foteD++V6dHJkkrKnbmOu2SbF7oORbMFl0ZvB7AsgEEkdCAmKklMUsl5RdpZBPMK3Zh
 96fy41itoISzZFCDK8Sk7Yq17bPxzzJJR4CmuF96kSS8XbVeaEAhXgP+2z2PcSd3K2BZ
 XShwxPsxgEf/pUVU1HTSmtfyO7xEqGCY9PvGQDeUCJoSFDsalCA3fIfJiax1M9/ZqcOb
 97L3/TQHGoZck+gCNKdod87U5besyUmptUmvg+UbbAd46FFT18GQkvQ/HrmIbD5xn8Cb
 H2Kw==; darn=lists.freedesktop.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1771344714; x=1771949514; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Ys2nmb9jfZmDWRjPOlnRXiHNClkGEjC4v6EyMQw4yIs=;
 b=KD2qBgiFZlZFxF/F0K7kqtzb2S6lyCyVmfYns+pMuNJ7jLU+RE7F1aUjqD+2AEN5l7
 3feQQXUKtCUOU/QmLEabRa45kremQjmGYBHwS0CCv0XVXRazPraGRav7KmQzoIAdJr+q
 U6fyAFZ1ZBMd4WQVcjQRjyMdM6KuOLy6NwvfADdYEvm53To6SffeOeZ4EsZ8EiJtlxId
 ufRB31FdSoaHz3A86ejwuEUa3HWjR+LTa2SeZjrN47K5sYZAp+FKgpV26ML6kyHZngpO
 8SuadCCppJ2x6lKYh1q44pdLj1u0gM5Vkas9crzzw4hv7lN6Jk6fvOAGvlGvqbuDdt90
 ygrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1771344714; x=1771949514;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=Ys2nmb9jfZmDWRjPOlnRXiHNClkGEjC4v6EyMQw4yIs=;
 b=Q3xv2q1CwnE2d+mTs53xgzbbBQFhQ0JCEgoLSdma6vYSKLRLzG7jyKMVb3id3WmXDW
 0on6kokXsqt39TA22Pgt6h8nJ/OxM+N3aCUdzVTdhTWNCpgg/mcqIJ9+sKoVaHo8ZL6T
 0nBlP9BwIOkdpnGp8SqkseW+678yoCSIWOKWB/Fvx466QafZhymNADlYcCvUOFycSpDc
 ksc5MZE2idlno01wlA8d+juPeE8qV1E2YWQgzFBH8J7IAOyTFKomeANIYvCklmkDuw2V
 QjIRegqIkJ6SwQFh9DMnA7/uDFqilrGB78H4vsbWWumVTt7KyL3TDi2tUEYDP/VPhTlW
 k8PQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUSruXo/kv6T8p8x2Gx1QUeizCuGWgq40QVxIyBHBa2Zq601LdmLvk89M0CGl+iN0FqtG7152Ga/Kc=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzYDBVE+kfmlfa3+ZMtZE1ndGjWIoghH6/2k9WjzKCbl+FCK+3y
 qoHqpxVR1Xg1+ajJqDzDhZjir8a0lRC/+jr2167KJxmR3geS9B39uwy7FhM2IE4dqUHLdVuE4SQ
 Lud4GH4Hv5ExbzzHhHbojkHEcq39uG+s=
X-Gm-Gg: AZuq6aLG8oFK0hNQys7N5t8a2bhEL8A18a1qr7PS0YmoQgy9Lc37QTFkILT3hWwcMJX
 H8SQ3fhqn43tSaAT96B/Ime41+CCvQ2cV1N6WjuzM3nVZ0MBMBb30JBf+f1Yoh1A7Z2tvt+a4QI
 iXthfQ0j8vRgvOXPEpBfVBohcBYdvlLjWFLc7FkvwTlSzzZ3Uub9LBbIrQ6RuxSZI2sCrxSHhie
 YnGqv/6YUsdGqOhKsP66tBxv27YQPx5s4S5RvKQgAec6G8OaSTmyTgjYnMqDpFySe5U5pSwBxXr
 La38yKlrt+k4HWT9AdWLuKcjiaJaGRsJuzAc2kgsbQt2BOg1vdTfx+gYkDrql0xeunakag==
X-Received: by 2002:a05:7022:920:b0:119:e55a:95a1 with SMTP id
 a92af1059eb24-1273985ace2mr2655137c88.3.1771344713572; Tue, 17 Feb 2026
 08:11:53 -0800 (PST)
MIME-Version: 1.0
References: <20260211102657.4180-1-pierre-eric.pelloux-prayer@amd.com>
 <20260211102657.4180-3-pierre-eric.pelloux-prayer@amd.com>
In-Reply-To: <20260211102657.4180-3-pierre-eric.pelloux-prayer@amd.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Tue, 17 Feb 2026 11:11:42 -0500
X-Gm-Features: AaiRm52pBRBbeOkwLwIwii93PtigtFIgvM8bUjN8oL2VmLbaA8mWe6_bsR4uGDE
Message-ID: <CADnq5_M9xctfe8j-w99+N7Liqq2J9DP+g9xb8vwjugE7baBJfQ@mail.gmail.com>
Subject: Re: [PATCH v1 3/6] drm/amdgpu: save ring content before resetting the
 device
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,iter.data:url,amd.com:email]
X-Rspamd-Queue-Id: 389F214DEDC
X-Rspamd-Action: no action

On Wed, Feb 11, 2026 at 5:29=E2=80=AFAM Pierre-Eric Pelloux-Prayer
<pierre-eric.pelloux-prayer@amd.com> wrote:
>
> Otherwise the content might not be relevant.
>
> When a coredump is generated the rings with outstanding fences
> are saved and then printed to the final devcoredump from the
> worker thread.
> Since this requires memory allocation, the ring capture might
> be missing from the generated devcoredump.
>
> Signed-off-by: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd=
.com>

Reviewed-by: Alex Deucher <alexander.deucher@amd.com>

> ---
>  .../gpu/drm/amd/amdgpu/amdgpu_dev_coredump.c  | 85 +++++++++++++++----
>  .../gpu/drm/amd/amdgpu/amdgpu_dev_coredump.h  | 13 ++-
>  2 files changed, 81 insertions(+), 17 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_dev_coredump.c b/drivers/g=
pu/drm/amd/amdgpu/amdgpu_dev_coredump.c
> index 0808ca98ccd9..0bf85ab43204 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_dev_coredump.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_dev_coredump.c
> @@ -204,7 +204,9 @@ amdgpu_devcoredump_format(char *buffer, size_t count,=
 struct amdgpu_coredump_inf
>         struct drm_print_iterator iter;
>         struct amdgpu_vm_fault_info *fault_info;
>         struct amdgpu_ip_block *ip_block;
> -       int ver;
> +       struct amdgpu_ring *ring;
> +       int ver, i, j;
> +       u32 ring_idx, off;
>
>         iter.data =3D buffer;
>         iter.offset =3D 0;
> @@ -294,23 +296,25 @@ amdgpu_devcoredump_format(char *buffer, size_t coun=
t, struct amdgpu_coredump_inf
>
>         /* Add ring buffer information */
>         drm_printf(&p, "Ring buffer information\n");
> -       for (int i =3D 0; i < coredump->adev->num_rings; i++) {
> -               int j =3D 0;
> -               struct amdgpu_ring *ring =3D coredump->adev->rings[i];
> +       if (coredump->num_rings) {
> +               for (i =3D 0; i < coredump->num_rings; i++) {
> +                       ring_idx =3D coredump->rings[i].ring_index;
> +                       ring =3D coredump->adev->rings[ring_idx];
> +                       off =3D coredump->rings[i].offset;
>
> -               drm_printf(&p, "ring name: %s\n", ring->name);
> -               drm_printf(&p, "Rptr: 0x%llx Wptr: 0x%llx RB mask: %x\n",
> -                          amdgpu_ring_get_rptr(ring),
> -                          amdgpu_ring_get_wptr(ring),
> -                          ring->buf_mask);
> -               drm_printf(&p, "Ring size in dwords: %d\n",
> -                          ring->ring_size / 4);
> -               drm_printf(&p, "Ring contents\n");
> -               drm_printf(&p, "Offset \t Value\n");
> +                       drm_printf(&p, "ring name: %s\n", ring->name);
> +                       drm_printf(&p, "Rptr: 0x%llx Wptr: 0x%llx RB mask=
: %x\n",
> +                                  coredump->rings[i].rptr,
> +                                  coredump->rings[i].wptr,
> +                                  ring->buf_mask);
> +                       drm_printf(&p, "Ring size in dwords: %d\n",
> +                               ring->ring_size / 4);
> +                       drm_printf(&p, "Ring contents\n");
> +                       drm_printf(&p, "Offset \t Value\n");
>
> -               while (j < ring->ring_size) {
> -                       drm_printf(&p, "0x%x \t 0x%x\n", j, ring->ring[j =
/ 4]);
> -                       j +=3D 4;
> +                       for (j =3D 0; j < ring->ring_size; j +=3D 4)
> +                               drm_printf(&p, "0x%x \t 0x%x\n", j,
> +                                          coredump->rings_dw[off + j / 4=
]);
>                 }
>         }
>
> @@ -354,6 +358,8 @@ static void amdgpu_devcoredump_free(void *data)
>         cancel_work_sync(&coredump->work);
>         coredump->adev->coredump_in_progress =3D false;
>         kfree(coredump->formatted);
> +       kfree(coredump->rings);
> +       kfree(coredump->rings_dw);
>         kfree(data);
>  }
>
> @@ -382,6 +388,12 @@ void amdgpu_coredump(struct amdgpu_device *adev, boo=
l skip_vram_check,
>         struct drm_device *dev =3D adev_to_drm(adev);
>         struct amdgpu_coredump_info *coredump;
>         struct drm_sched_job *s_job;
> +       u64 total_ring_size, ring_count;
> +       struct amdgpu_ring *ring;
> +       int i, off, idx;
> +
> +       if (adev->coredump_in_progress)
> +               return;
>
>         if (adev->coredump_in_progress)
>                 return;
> @@ -410,6 +422,47 @@ void amdgpu_coredump(struct amdgpu_device *adev, boo=
l skip_vram_check,
>                 coredump->ring =3D to_amdgpu_ring(s_job->sched);
>         }
>
> +       /* Dump ring content if memory allocation succeeds. */
> +       ring_count =3D 0;
> +       total_ring_size =3D 0;
> +       for (i =3D 0; i < adev->num_rings; i++) {
> +               ring =3D adev->rings[i];
> +
> +               /* Only dump rings with unsignalled fences. */
> +               if (atomic_read(&ring->fence_drv.last_seq) =3D=3D ring->f=
ence_drv.sync_seq &&
> +                   coredump->ring !=3D ring)
> +                       continue;
> +
> +               total_ring_size +=3D ring->ring_size;
> +               ring_count++;
> +       }
> +       coredump->rings_dw =3D kzalloc(total_ring_size, GFP_NOWAIT);
> +       coredump->rings =3D kcalloc(ring_count, sizeof(struct amdgpu_core=
dump_ring), GFP_NOWAIT);
> +       if (coredump->rings && coredump->rings_dw) {
> +               for (i =3D 0, off =3D 0, idx =3D 0; i < adev->num_rings; =
i++) {
> +                       ring =3D adev->rings[i];
> +
> +                       if (atomic_read(&ring->fence_drv.last_seq) =3D=3D=
 ring->fence_drv.sync_seq &&
> +                           coredump->ring !=3D ring)
> +                               continue;
> +
> +                       coredump->rings[idx].ring_index =3D ring->idx;
> +                       coredump->rings[idx].rptr =3D amdgpu_ring_get_rpt=
r(ring);
> +                       coredump->rings[idx].wptr =3D amdgpu_ring_get_wpt=
r(ring);
> +                       coredump->rings[idx].offset =3D off;
> +
> +                       memcpy(&coredump->rings_dw[off], ring->ring, ring=
->ring_size);
> +                       off +=3D ring->ring_size;
> +                       idx++;
> +               }
> +               coredump->num_rings =3D idx;
> +       } else {
> +               kfree(coredump->rings_dw);
> +               kfree(coredump->rings);
> +               coredump->rings_dw =3D NULL;
> +               coredump->rings =3D NULL;
> +       }
> +
>         coredump->adev =3D adev;
>
>         ktime_get_ts64(&coredump->reset_time);
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_dev_coredump.h b/drivers/g=
pu/drm/amd/amdgpu/amdgpu_dev_coredump.h
> index 4c37a852b74a..1c3d22356cc7 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_dev_coredump.h
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_dev_coredump.h
> @@ -31,6 +31,13 @@
>
>  #define AMDGPU_COREDUMP_VERSION "1"
>
> +struct amdgpu_coredump_ring {
> +       u64                             rptr;
> +       u64                             wptr;
> +       u32                             ring_index;
> +       u32                             offset;
> +};
> +
>  struct amdgpu_coredump_info {
>         struct amdgpu_device            *adev;
>         struct amdgpu_task_info         reset_task_info;
> @@ -41,12 +48,16 @@ struct amdgpu_coredump_info {
>         bool                            skip_vram_check;
>         bool                            reset_vram_lost;
>         struct amdgpu_ring              *ring;
> +
> +       struct amdgpu_coredump_ring     *rings;
> +       u32                             *rings_dw;
> +       u32                             num_rings;
> +
>         /* Readable form of coredevdump, generate once to speed up
>          * reading it (see drm_coredump_printer's documentation).
>          */
>         ssize_t                         formatted_size;
>         char                            *formatted;
> -
>  };
>  #endif
>
> --
> 2.43.0
>
