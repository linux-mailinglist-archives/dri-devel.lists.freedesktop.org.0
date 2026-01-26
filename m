Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KCtuJVh4d2n7ggEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Mon, 26 Jan 2026 15:21:12 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 477DD8966A
	for <lists+dri-devel@lfdr.de>; Mon, 26 Jan 2026 15:21:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 68F6E10E174;
	Mon, 26 Jan 2026 14:21:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="W3FIVHHI";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-dy1-f173.google.com (mail-dy1-f173.google.com
 [74.125.82.173])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 090D410E439
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Jan 2026 14:21:08 +0000 (UTC)
Received: by mail-dy1-f173.google.com with SMTP id
 5a478bee46e88-2b7063004daso254519eec.0
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Jan 2026 06:21:08 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769437267; cv=none;
 d=google.com; s=arc-20240605;
 b=bFId+7Xn9i9Y0JSJzwHjCHVd7t4e29RsDYbj0JZsfWjmDpH9g4PnPskGX7vPFuFwTq
 Bk0lAATs8Tx9KrnxiK/J6t1q1nqHpe6LKbfoAveKe/kYxBpfCMXFhShd3XOS5adKljGF
 raRmYiJNz0jaROBoOunS+j9bwEHvnBW2epf6WKHl3+tl6jHXGLmixUtzMBEHx/mkgK5p
 eYBgzUa6z4C37QJJhFAoEzLM78+sMGZc1ujcClJLRHDvq/+9dnQKncEGca2cEU2LMGcb
 EGQFJ9OQeYs4W4RkdllxW9/eGBLTB9K09EPZFwY8yTYc2DbwE8VJV/axPeBgWPGRie4x
 D8Qw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=Tto4FmdVik1l4FkS8WldjHtZI0UABPRursXto4Nd10I=;
 fh=wasdHFkIwBV0z2gx1iNEue1R1+9ald9z0JYHP4N6rEw=;
 b=liXTG+nbh5q93s04kzGg4XoT1nCbVQhFcQBkQZqPcdTj3XLshArpFhRC//qWLSthZH
 cYYel6iStiCr4qkPvgkKUvqPk9AZhl15NiUQm+S28Kw81DXmn1PQDaBawhSuhCgd1ebi
 joHhlO8yshg39zmsty7UOsEZFsoyAshe+iLYwDzFX9c+WGk/wuT1sk37vYfbvBCoMWkw
 N+DsBvTw+CPcmo0PdStUiCJjI9F49oOGfjhos3it045iJ1yjHM0sb9SvqPorq2rFfTyM
 +RCemPmPbliAQQlfKHBbNVTf4B0K7ftkamo1VlrBariEx6qSbrv3ww11lnVCXGOEyOEo
 L/7Q==; darn=lists.freedesktop.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1769437267; x=1770042067; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Tto4FmdVik1l4FkS8WldjHtZI0UABPRursXto4Nd10I=;
 b=W3FIVHHI6rzgwplR7Rm8R6Y1VPey3Zg3XdBsVm5beyq8Y2yO2PKPax2wthZz15Qkey
 YFKh88WVxkA0AokVaQnHmmiBRBl7s2RsXPf/jp0HjC0Rqah/DSEX8HjoDPSI68+v1hR7
 /4o4Kw3PsYiz1VC6gUnS8ijCaM763PI4i8j/mz4cSVjB0D+IPOxMWE/eh2Hi8U4khVES
 0Qi+Hu8n1GGyKoLQ7Ey0MdJWc4zawbtI5gxkCU7AoWuRkz+QYAET02vKu0jUTByJgDtm
 Yy0sEnnld69DkECZRpSoEtwH1hcdDn8h2h4qCuFdsse3yZo7IGq0M/EA+u0rP3SV2fFC
 YG9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1769437267; x=1770042067;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=Tto4FmdVik1l4FkS8WldjHtZI0UABPRursXto4Nd10I=;
 b=o1a3trGpFm7XKqYpsdbiJ3913QDss9YmbqbbutMjlrqYdIw5qRRfEGfWnng9gV7/NV
 mBcxzEpO+ZrZsQ/aeCXKXjFKG+Abz2WVuq9T7gjVXiuu5lJpkaE3lxY4gX4EFiewApPx
 PlYZjkHBJiaweRXH7e8yN7r9OOKya6lTLnh9BIXW7z1c3CJ5IBS14GOVPL7G7dPN6z6U
 zJd+3dBk4GV2W/r0Z/9mVIUl59JKaP3ccwuEkTplBFEJ7goEWGlQlX91oOPCVnPb2dQr
 CecxwEWuZKkzX/QQZPnKGiqyQMIbGWpcSUsajm4qDsseyPG1S/GrHxa/ZhsqoVWUlVEW
 ovxw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUIa/qg5LZw8qgxuRD5z6U//BA4Ou02ZXD3JIlxKVxDkLGFL9K0sWbjIN2i0Md+/jkW/dRafI95938=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw+/WTmg8KUoN3Dn+UoCAG9nfxjDCJze4WGDMvrKyyxd7vYx4wX
 3peePouDH/5FsS6jCojruJBkpAbVlKz49etGuo1AzdAruucih353gGC8a9BNwS3Rp2om+4h5hbq
 OCsROVcy/zG60ITKtGTellNlKPQQht6I=
X-Gm-Gg: AZuq6aI+M2y/9Ru4U2osiXJwYDWTrLHD3GYeBZSzIht6xmlPKFXERH1wbtp2MEftYwB
 LKxKJDNSfSQp5TTTrLQdTYV6YjYQNa4W5KPSHeTGNFtOcSHYYR3p+JxQDDzfyXbw5v7zhYK31z7
 oGrb38+c5Yk2zUQw+STz3CI6Tlql+6Y0rPZkpCrN9w+bfObNbHO1d+so8H/o9tOIoFgH1MU0a58
 U72ocdhp/isvdZ7G70KC1m1J2K1deho40Mw/K8BL8E+Fy9OL+BO9mzH2WxMg+6qnBc/TCNZ
X-Received: by 2002:a05:7022:4394:b0:119:e56b:46b7 with SMTP id
 a92af1059eb24-1248ebc8ad8mr1289343c88.1.1769437267030; Mon, 26 Jan 2026
 06:21:07 -0800 (PST)
MIME-Version: 1.0
References: <20260123000537.2450496-1-someguy@effective-light.com>
 <2de6d428-b997-4ba8-8766-a211e5612e72@amd.com>
 <2349754.vFx2qVVIhK@timur-hyperion>
 <a8b972be-7265-492f-9855-cdec94a0e0dc@amd.com>
 <aXUQKSJGkz7nzHJ4@hal-station.localdomain>
In-Reply-To: <aXUQKSJGkz7nzHJ4@hal-station.localdomain>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Mon, 26 Jan 2026 09:20:55 -0500
X-Gm-Features: AZwV_QijZbfDm80LvfOz2KOV1eORQnBB63BRHrSGLChaoas2MT3UbMiWqTiW85s
Message-ID: <CADnq5_Ob8yiivco+szanSiXuRwdAu4xHMe=8OQSk+Ufqykgobg@mail.gmail.com>
Subject: Re: [PATCH 1/2] drm: introduce page_flip_timeout()
To: Hamza Mahfooz <someguy@effective-light.com>
Cc: Mario Limonciello <mario.limonciello@amd.com>,
 =?UTF-8?Q?Timur_Krist=C3=B3f?= <timur.kristof@gmail.com>, 
 dri-devel@lists.freedesktop.org, 
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 Alex Deucher <alexander.deucher@amd.com>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Harry Wentland <harry.wentland@amd.com>,
 Leo Li <sunpeng.li@amd.com>, Rodrigo Siqueira <siqueira@igalia.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Sunil Khatri <sunil.khatri@amd.com>, Ce Sun <cesun102@amd.com>,
 Lijo Lazar <lijo.lazar@amd.com>, 
 Kenneth Feng <kenneth.feng@amd.com>, Ivan Lipski <ivan.lipski@amd.com>, 
 Alex Hung <alex.hung@amd.com>, Tom Chung <chiahsuan.chung@amd.com>, 
 Melissa Wen <mwen@igalia.com>,
 =?UTF-8?Q?Michel_D=C3=A4nzer?= <mdaenzer@redhat.com>, 
 Fangzhi Zuo <Jerry.Zuo@amd.com>, amd-gfx@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org
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
X-Spamd-Result: default: False [-0.81 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[google.com:s=arc-20240605:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	FORGED_RECIPIENTS(0.00)[m:someguy@effective-light.com,m:mario.limonciello@amd.com,m:timur.kristof@gmail.com,m:christian.koenig@amd.com,m:alexander.deucher@amd.com,m:airlied@gmail.com,m:simona@ffwll.ch,m:harry.wentland@amd.com,m:sunpeng.li@amd.com,m:siqueira@igalia.com,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:sunil.khatri@amd.com,m:cesun102@amd.com,m:lijo.lazar@amd.com,m:kenneth.feng@amd.com,m:ivan.lipski@amd.com,m:alex.hung@amd.com,m:chiahsuan.chung@amd.com,m:mwen@igalia.com,m:mdaenzer@redhat.com,m:Jerry.Zuo@amd.com,m:amd-gfx@lists.freedesktop.org,m:linux-kernel@vger.kernel.org,m:timurkristof@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[alexdeucher@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[26];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[alexdeucher@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	FREEMAIL_CC(0.00)[amd.com,gmail.com,lists.freedesktop.org,ffwll.ch,igalia.com,linux.intel.com,kernel.org,suse.de,redhat.com,vger.kernel.org];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: 477DD8966A
X-Rspamd-Action: no action

On Mon, Jan 26, 2026 at 3:09=E2=80=AFAM Hamza Mahfooz
<someguy@effective-light.com> wrote:
>
> On Fri, Jan 23, 2026 at 04:30:12PM -0600, Mario Limonciello wrote:
> > Hamza - since you seem to have a "workload" that can run overnight and =
this
> > series recovers, can you try what Alex said and do a dc_suspend() and
> > dc_resume() for failure?
> >
> > Make sure you log a message so you can know it worked.
>
> Sure, I'll try something along the lines of:
>
> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_crtc.c b/dri=
vers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_crtc.c
> index 492457c86393..bc7abd00f5f4 100644
> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_crtc.c
> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_crtc.c
> @@ -579,11 +579,28 @@ amdgpu_dm_atomic_crtc_get_property(struct drm_crtc =
*crtc,
>  }
>  #endif
>
> -static void amdgpu_dm_crtc_handle_timeout(struct drm_crtc *crtc)
> +static void amdgpu_dm_crtc_handle_timeout(struct drm_crtc *crtc,
> +                                         struct drm_crtc_commit *commit)
>  {
>         struct amdgpu_device *adev =3D drm_to_adev(crtc->dev);
>         struct amdgpu_reset_context reset_ctx;
> +       struct amdgpu_ip_block *ip_block;
>
> +       ip_block =3D amdgpu_device_ip_get_ip_block(adev, AMD_IP_BLOCK_TYP=
E_DCE);
> +       if (!ip_block)
> +               goto full_reset;
> +
> +       ip_block->version->funcs->suspend(ip_block);
> +       ip_block->version->funcs->resume(ip_block);
> +

I suspect just calling drm_crtc_send_vblank_event() here on the
relevant crtcs would be enough.

Alex

> +       if (drm_crtc_commit_wait(commit)) {
> +               drm_err(crtc->dev, "suspend-resume failed!\n");
> +               goto full_reset;
> +       }
> +
> +       return;
> +
> +full_reset:
>         if (amdgpu_device_should_recover_gpu(adev)) {
>                 memset(&reset_ctx, 0, sizeof(reset_ctx));
>
> diff --git a/drivers/gpu/drm/drm_atomic_helper.c b/drivers/gpu/drm/drm_at=
omic_helper.c
> index 7175294ccb57..b38c4ee2fc95 100644
> --- a/drivers/gpu/drm/drm_atomic_helper.c
> +++ b/drivers/gpu/drm/drm_atomic_helper.c
> @@ -1961,7 +1961,7 @@ void drm_atomic_helper_wait_for_flip_done(struct dr=
m_device *dev,
>                                 crtc->base.id, crtc->name);
>
>                         if (crtc->funcs->page_flip_timeout)
> -                               crtc->funcs->page_flip_timeout(crtc);
> +                               crtc->funcs->page_flip_timeout(crtc, comm=
it);
>                 }
>         }
>
> diff --git a/include/drm/drm_crtc.h b/include/drm/drm_crtc.h
> index 45dc5a76e915..47a34a05f6de 100644
> --- a/include/drm/drm_crtc.h
> +++ b/include/drm/drm_crtc.h
> @@ -616,7 +616,8 @@ struct drm_crtc_funcs {
>          * and can be used by drivers to attempt to recover from a page f=
lip
>          * timeout.
>          */
> -       void (*page_flip_timeout)(struct drm_crtc *crtc);
> +       void (*page_flip_timeout)(struct drm_crtc *crtc,
> +                                 struct drm_crtc_commit *commit);
>
>         /**
>          * @set_property:
