Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mmhqOC+RlGl3FgIAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 17 Feb 2026 17:02:55 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C631F14DD47
	for <lists+dri-devel@lfdr.de>; Tue, 17 Feb 2026 17:02:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A858610E506;
	Tue, 17 Feb 2026 16:02:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="j3vZi/un";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-dy1-f178.google.com (mail-dy1-f178.google.com
 [74.125.82.178])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2360A10E506
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Feb 2026 16:02:51 +0000 (UTC)
Received: by mail-dy1-f178.google.com with SMTP id
 5a478bee46e88-2ba6737fafbso248526eec.3
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Feb 2026 08:02:51 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1771344170; cv=none;
 d=google.com; s=arc-20240605;
 b=HlU7ws/kN7yZAJh2PApIs4rhr9aH97ICrbzpQXPzqld9OQSjVOVTkf0zVEm71bNP1D
 DKPXnRZb+/+tVImtHmsa5x8bYjD2BYOWCrjTt00giPk67NmASCmHd4QMbTFalSOBm5mH
 bFKMgQ4VsGtHgBwSuukY0kQTilhmOtjFsFnVv9bnexXcqRdaBnf+inOiZt96PFmzg5g8
 VONH0rD6PSa8PeqGUuNnDN31yOCM11KlvE4b3VRMiBUCUMn5bxbC34LDer0/peSex/Gj
 b/1tf9N/R/702qfBEfqdCHsnTwxPY8JjVhvvRpozuNJSZBa7W9e2FT0OSjQt5NVOlI9N
 oOwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=ds5w4fDDQjAmUOKkCZAAHm6bwPF1jPuCREKc474PPb8=;
 fh=JS9SbTD8IYeW7D1lftsbtKDe2d/MNCZh6IqQZPuHm7U=;
 b=QNicKzyfDhK/QOCMoC53GILGnfW685zTilhUPG/Q5USCimpEpXNKQtfrVXtskpByCG
 BoMLINhdTTk6YvSR6mEWvlzrd4FQ+XKoquV6z5XllE5fTwn/8s9ODDp879E4mzyGwQiG
 7An/urgVZAjbblSa9vJBjAAPsOpWPYA8/VLKYpzNrTnYpHd3Ac/De0zIGSJAQ1C9CTYd
 jbjDqstIZ/D5kmmxnt9LVFNsB9RlCbyxhLt/02xj6CmY9l6JjxAx1CSLX9kHupl5iy6d
 PCdZUjftc4u4Zs2VDfkP7QPcJyzbDoVHkTsUnY2QmHf8MV3EIMsTOK32ExbybuR6ysNS
 ltYg==; darn=lists.freedesktop.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1771344170; x=1771948970; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ds5w4fDDQjAmUOKkCZAAHm6bwPF1jPuCREKc474PPb8=;
 b=j3vZi/unS9wJdm2vdx6TcIzxA2hCwhqvEKUpYFZvs/kbzCi2xZIBQRrVIpPMYK+JAJ
 0StUD/9LbPUK3suB6fWhs5ODWO0n6ziuZn/+YiBxumuqmGLwIdqq+Qn65uV8ZhWrvPce
 naCYEKgtgZbQy+65fpNAGLY5YRs5ksWYLcTp41gJA9um86M/aZjf6TFT6XSpGiE7c9gH
 4sHk1eJjF1PuWjuvhKQD2xdHSn644qjgdbBj9Zs7uuxKdURso/xI2zX4zJgl3gCZGm7x
 QtodQtBqNPotnHujGFP+W5sBYZeOnP3C5yP5t+RGKl+hTzKtZTYVfEZixLWWVeQ9PGgc
 EJ2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1771344170; x=1771948970;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=ds5w4fDDQjAmUOKkCZAAHm6bwPF1jPuCREKc474PPb8=;
 b=R4yx0TpwGumZcIUKZegOwFpcJYOs3JIYT7FSjePr0itGDWjVnob7tPXIRAtqdZ75xL
 pOa+tc2mCm0z8uXZzkPGzkp0Gv9f67SElnYPd5ZR+2p3Oy961An5sivJew/qPXmlYcBv
 4xMV12/ZFn9FzJx3T3O1bRbfJf6N8Wrs6Hz2Cqh1p8aAeSZ/CZDaCihZIOd/7o0ASTI9
 SrGykS6YREQZYot5hcdxcLrt6PXx53PRVVr9TLfoZI+a2eo0TTslHjiARp2qtgRdsS6j
 O1wdPctJSj6b6/7rrE6Do2sCfYJ7WC7oRQxrZMLgA+AhvfA78Ffh8jkCoBF5FG8dPnEy
 xefQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXhtJGk5t15cBEhPkTxkstz+Fk025lPLgXSifuJFdLAV910KtVl8MyCZeNWAAsuXPBfCGwKcwhEXVc=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzFqwG8bPlvtzUtLebSIA5H80scMYsjSjvyY4Mk8vaeq3Y6mXdJ
 afjIkfcGy6B/agf2LGvxd/G7SuDj0KuWzKdeH8lNW3HyjntWARsxDcgMHNMxUn92jo3c3rRUeNV
 LT1CI9Kq6er/FtgAjvHtluL9hdJFTg+U=
X-Gm-Gg: AZuq6aKhufVDnThBogZuUMMp3NBDG73ONohlIgTrjRvDVFiaukgnuOXZdxjUyMQgHOi
 YfJWSiNJYDtV9c1LiYAc0EXgtt5JrMQ/2O8xVQV1lzZKj0GN6tZHbnJBYdeeouOK9huV5dM/boN
 TLZeLL+WxFHNkgsngYwTZpDpeeSb6CT+p2ksIJfWXJMH9Qx6Qo4Uza26c+FBzuBVX6GSW1ce3q5
 +NzVIrpNA0Qw9KPpHm8wG05luVWQIV2jMQeltf1uOZjZutJRezcFjzulo9spMPzve0CHcS3vqs3
 vweyvlqgY7KLV2EA8XNi8B3qrLUzcSf0sNG4s8I+jzj3+QlF0YXqtN/hEN3/q7tPjwCYsg==
X-Received: by 2002:a05:7022:3f88:b0:127:1186:8139 with SMTP id
 a92af1059eb24-127399924b3mr2422472c88.7.1771344169843; Tue, 17 Feb 2026
 08:02:49 -0800 (PST)
MIME-Version: 1.0
References: <20260211102657.4180-1-pierre-eric.pelloux-prayer@amd.com>
 <20260211102657.4180-2-pierre-eric.pelloux-prayer@amd.com>
In-Reply-To: <20260211102657.4180-2-pierre-eric.pelloux-prayer@amd.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Tue, 17 Feb 2026 11:02:37 -0500
X-Gm-Features: AaiRm52PCCSzU4QYVzs4N2Ex_L7aEWiZQn__J-gR4mjdzdGVpgCy8sdjxtXFQqk
Message-ID: <CADnq5_N8tOnB6TRTESD724F-X4_ak=f83qJ-cKSZX3ntmg9mkQ@mail.gmail.com>
Subject: Re: [PATCH v1 2/6] drm/amdgpu: move devcoredump generation to a worker
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,mail.gmail.com:mid]
X-Rspamd-Queue-Id: C631F14DD47
X-Rspamd-Action: no action

On Wed, Feb 11, 2026 at 5:28=E2=80=AFAM Pierre-Eric Pelloux-Prayer
<pierre-eric.pelloux-prayer@amd.com> wrote:
>
> Update the way drm_coredump_printer is used based on its documentation
> and Xe's code: the main idea is to generate the final version in one go
> and then use memcpy to return the chunks requested by the caller of
> amdgpu_devcoredump_read.
>
> The generation is moved to a separate worker thread.
>
> This cuts the time to copy the dump from 40s to ~0s on my machine.
>
> Signed-off-by: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd=
.com>

Acked-by: Alex Deucher <alexander.deucher@amd.com>


> ---
>  drivers/gpu/drm/amd/amdgpu/amdgpu.h           |  5 ++
>  .../gpu/drm/amd/amdgpu/amdgpu_dev_coredump.c  | 66 +++++++++++++++++--
>  .../gpu/drm/amd/amdgpu/amdgpu_dev_coredump.h  |  9 +++
>  3 files changed, 74 insertions(+), 6 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu.h b/drivers/gpu/drm/amd/am=
dgpu/amdgpu.h
> index 057c8bd2ad89..ae81a428cfb5 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu.h
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu.h
> @@ -1200,6 +1200,11 @@ struct amdgpu_device {
>
>         struct amdgpu_reset_domain      *reset_domain;
>
> +#ifdef CONFIG_DEV_COREDUMP
> +       /* If a coredump state capture is in progress don't start a new o=
ne. */
> +       bool coredump_in_progress;
> +#endif
> +
>         struct mutex                    benchmark_mutex;
>
>         bool                            scpm_enabled;
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_dev_coredump.c b/drivers/g=
pu/drm/amd/amdgpu/amdgpu_dev_coredump.c
> index 42a969512dcc..0808ca98ccd9 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_dev_coredump.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_dev_coredump.c
> @@ -34,6 +34,8 @@ void amdgpu_coredump(struct amdgpu_device *adev, bool s=
kip_vram_check,
>  }
>  #else
>
> +#define AMDGPU_CORE_DUMP_SIZE_MAX (256 * 1024 * 1024)
> +
>  const char *hw_ip_names[MAX_HWIP] =3D {
>         [GC_HWIP]               =3D "GC",
>         [HDP_HWIP]              =3D "HDP",
> @@ -196,11 +198,9 @@ static void amdgpu_devcoredump_fw_info(struct amdgpu=
_device *adev,
>  }
>
>  static ssize_t
> -amdgpu_devcoredump_read(char *buffer, loff_t offset, size_t count,
> -                       void *data, size_t datalen)
> +amdgpu_devcoredump_format(char *buffer, size_t count, struct amdgpu_core=
dump_info *coredump)
>  {
>         struct drm_printer p;
> -       struct amdgpu_coredump_info *coredump =3D data;
>         struct drm_print_iterator iter;
>         struct amdgpu_vm_fault_info *fault_info;
>         struct amdgpu_ip_block *ip_block;
> @@ -208,7 +208,6 @@ amdgpu_devcoredump_read(char *buffer, loff_t offset, =
size_t count,
>
>         iter.data =3D buffer;
>         iter.offset =3D 0;
> -       iter.start =3D offset;
>         iter.remain =3D count;
>
>         p =3D drm_coredump_printer(&iter);
> @@ -323,11 +322,60 @@ amdgpu_devcoredump_read(char *buffer, loff_t offset=
, size_t count,
>         return count - iter.remain;
>  }
>
> +static ssize_t
> +amdgpu_devcoredump_read(char *buffer, loff_t offset, size_t count,
> +                       void *data, size_t datalen)
> +{
> +       struct amdgpu_coredump_info *coredump =3D data;
> +       ssize_t byte_copied;
> +
> +       if (!coredump)
> +               return -ENODEV;
> +
> +       flush_work(&coredump->work);
> +
> +       if (!coredump->formatted)
> +               return -ENODEV;
> +
> +       if (offset >=3D coredump->formatted_size)
> +               return 0;
> +
> +       byte_copied =3D count < coredump->formatted_size - offset ? count=
 :
> +               coredump->formatted_size - offset;
> +       memcpy(buffer, coredump->formatted + offset, byte_copied);
> +
> +       return byte_copied;
> +}
> +
>  static void amdgpu_devcoredump_free(void *data)
>  {
> +       struct amdgpu_coredump_info *coredump =3D data;
> +
> +       cancel_work_sync(&coredump->work);
> +       coredump->adev->coredump_in_progress =3D false;
> +       kfree(coredump->formatted);
>         kfree(data);
>  }
>
> +static void amdgpu_devcoredump_deferred_work(struct work_struct *work)
> +{
> +       struct amdgpu_coredump_info *coredump =3D container_of(work, type=
of(*coredump), work);
> +
> +       dev_coredumpm(coredump->adev->dev, THIS_MODULE, coredump, 0, GFP_=
NOWAIT,
> +                     amdgpu_devcoredump_read, amdgpu_devcoredump_free);
> +
> +       /* Do a one-time preparation of the coredump output because
> +        * repeatingly calling drm_coredump_printer is very slow.
> +        */
> +       coredump->formatted_size =3D
> +               amdgpu_devcoredump_format(NULL, AMDGPU_CORE_DUMP_SIZE_MAX=
, coredump);
> +       coredump->formatted =3D kvzalloc(coredump->formatted_size, GFP_KE=
RNEL);
> +       if (!coredump->formatted)
> +               return;
> +       amdgpu_devcoredump_format(coredump->formatted, coredump->formatte=
d_size, coredump);
> +       coredump->adev->coredump_in_progress =3D false;
> +}
> +
>  void amdgpu_coredump(struct amdgpu_device *adev, bool skip_vram_check,
>                      bool vram_lost, struct amdgpu_job *job)
>  {
> @@ -335,10 +383,15 @@ void amdgpu_coredump(struct amdgpu_device *adev, bo=
ol skip_vram_check,
>         struct amdgpu_coredump_info *coredump;
>         struct drm_sched_job *s_job;
>
> +       if (adev->coredump_in_progress)
> +               return;
> +
>         coredump =3D kzalloc(sizeof(*coredump), GFP_NOWAIT);
>         if (!coredump)
>                 return;
>
> +       adev->coredump_in_progress =3D true;
> +
>         coredump->skip_vram_check =3D skip_vram_check;
>         coredump->reset_vram_lost =3D vram_lost;
>
> @@ -361,8 +414,9 @@ void amdgpu_coredump(struct amdgpu_device *adev, bool=
 skip_vram_check,
>
>         ktime_get_ts64(&coredump->reset_time);
>
> -       dev_coredumpm(dev->dev, THIS_MODULE, coredump, 0, GFP_NOWAIT,
> -                     amdgpu_devcoredump_read, amdgpu_devcoredump_free);
> +       /* Kick off coredump formatting to a worker thread. */
> +       INIT_WORK(&coredump->work, amdgpu_devcoredump_deferred_work);
> +       queue_work(system_unbound_wq, &coredump->work);
>
>         drm_info(dev, "AMDGPU device coredump file has been created\n");
>         drm_info(dev, "Check your /sys/class/drm/card%d/device/devcoredum=
p/data\n",
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_dev_coredump.h b/drivers/g=
pu/drm/amd/amdgpu/amdgpu_dev_coredump.h
> index ef9772c6bcc9..4c37a852b74a 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_dev_coredump.h
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_dev_coredump.h
> @@ -35,9 +35,18 @@ struct amdgpu_coredump_info {
>         struct amdgpu_device            *adev;
>         struct amdgpu_task_info         reset_task_info;
>         struct timespec64               reset_time;
> +
> +       struct work_struct work;
> +
>         bool                            skip_vram_check;
>         bool                            reset_vram_lost;
>         struct amdgpu_ring              *ring;
> +       /* Readable form of coredevdump, generate once to speed up
> +        * reading it (see drm_coredump_printer's documentation).
> +        */
> +       ssize_t                         formatted_size;
> +       char                            *formatted;
> +
>  };
>  #endif
>
> --
> 2.43.0
>
