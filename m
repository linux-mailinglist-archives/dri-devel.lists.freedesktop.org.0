Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kLbjDKS0c2liyAAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Fri, 23 Jan 2026 18:49:24 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 62ACC792E2
	for <lists+dri-devel@lfdr.de>; Fri, 23 Jan 2026 18:49:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B736A10E1E7;
	Fri, 23 Jan 2026 17:49:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="JCNCm/Nx";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-dl1-f47.google.com (mail-dl1-f47.google.com [74.125.82.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 85DED10E1E7
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Jan 2026 17:49:19 +0000 (UTC)
Received: by mail-dl1-f47.google.com with SMTP id
 a92af1059eb24-1244bce2c17so251335c88.1
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Jan 2026 09:49:19 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769190559; cv=none;
 d=google.com; s=arc-20240605;
 b=S4XG70v2bXGnBApC/TkmptOI+lvYvT9giJcYadwwM+3eXhbcWsKYyRK3su5ztYYU0B
 QROyjPtJMylkfwEdtBN/soWkoWkY8tBQmoLRDg8N14KiL6JFi5DfvonZLxvICmXOT2TS
 sIRxgCR77striZZKy62acxyWUn45xktdW6Dr+XgSWYKgZoYzoqt7ZA8bnhbnYsZHPuuD
 oavE5XYNkUNYlqSQw+BH0+H0Oy8TMHuYNINRBID9ibdCkzjrsAY5iVTp92BcOQhLoDcs
 DmS/z1l7ZPwVeo0Sx9aN55RqyYXPEmbIA0KQrRo1gzNx8rVNN7AiK0SPvAoYw9I1d4Nh
 AavA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=H4geAyuRV3L2A55ENiOqVPJISTgk75Uun8WE1iNkT/g=;
 fh=W9yuUQLqLUXgUfllgFRCxqijmbAikA9tzhq7vH22PNA=;
 b=arp/TlZ/Dv41+Y9UOcFNHFgki2BbMjBg2DWgPy2wbTLnrfALteQWU5a6d7bHMnSGz7
 wOywNYjj6X5+LZd87bqkC9zHiA2WSuovDEHJLcBaZN0iOfrryjdGqB8hVkBbDH/YwEt7
 xF29lavKLdWkg2k5ZHBQgWHkBr1dL7zOclNKKUrr/3oiFRNqZO7A9Hy69MQbCwTYcH16
 JDnJlQesH9+Dm7jDmiPHndWmXAlKMNqPjCBNBuFtTQn6sIAp/EP78zDdiTdIKjj6ZZve
 2FsdE0aVAkoERbl2fkik+xA15SPLXSLrL8NaLLfgsgeKXPH+Xb10OWGLNRMWEcDrBRyI
 uS6A==; darn=lists.freedesktop.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1769190559; x=1769795359; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=H4geAyuRV3L2A55ENiOqVPJISTgk75Uun8WE1iNkT/g=;
 b=JCNCm/NxeU/18ixCwZEUtW4GGhouGz9t0sL9L9/S7VKLORvfOTcFj5bS7jyzoY5TlQ
 RGhqRMY8EuxmEYhravQYU8X+oc3dRAfA4KrNk6Mt3237CxppXzFS3hw6pEORXk4RbTDN
 NZq+SjcEcZzLbvTxpNB+p/O8AT8Jfo23g9ueKPmp6eNl6D5x9VIcD2bW61pgDBOK+rSj
 bOTzeCycCCWPBGQaH2CBz5NIXiD0qAIUyA6vFFFlLiXlfmNUEak0xK4apE/QSS2HfMgf
 h5t3S9/gF8zDRsubEJ+NwD/bel8MRbBHiIYjok8Vw3cX2YSENbolq8xCTALuJQatX7qf
 hmmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1769190559; x=1769795359;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=H4geAyuRV3L2A55ENiOqVPJISTgk75Uun8WE1iNkT/g=;
 b=VmSMnMFWQDwRoirbuShxJkPtB7kw8sDdHtdso071o9Ub8WGRsiwbCWgcWcYu2MY1So
 5jDvkNhthStybj60lbFQOjm34FgYdGfM0+VmM+z1ZCjJo2wLrv+5DHoE9e0i5ESOMG0M
 e9K3anz+s3QWIbdpBRAkGevRgyAjS2jZDC2wOEArVwjPxtgermuW4e+5u4veFLBgKMJ5
 ixjajFl8IQqo6/Q0UX77s+WIWIM8Ji6LMCCkM5s2IuJUiMUdj2pKJr6/qPboVVmcB2Ug
 ve1gzQTwZfTZvrQk9Jvq2bT9pg2VtxYn4tQ36/9+kmdbwbJID9bEkYChQUmREI1iAb9P
 Lw5w==
X-Gm-Message-State: AOJu0Yy5So+Xz22Y6xR5jTTjkNAd1qUNB9qxpUAxgxFosPF4QXI6bWbL
 kUd/kHL4wYTUTgYI6sSvPk4YI5wNhhjHvIE3aHt/fiNF5PHJwQv7Pu/vchFFhu+aj+6EMLHsRYV
 x9/MRGfisq9UVjujZX18ROvSR3QKj0P8=
X-Gm-Gg: AZuq6aKB7U+EoUG6JyitUDrCMtqX0iOxQrbkUPQmSJFXGM1Rr1h4lyAFA51Ct5UuZ6y
 E5gqF3+MoA9YsMcyp1YyUxYP0MBKOyRYkYFoRKvceqPkQQ0Y66JqXseUHgOcOVQ7/X+b7Y+xQ/z
 hFW4NV/V9rOZGhcxwtWyeVe/igrgYY4j62a+kbJaWdFddfWZNYhx8y2VGo4bwwxCha/pfqWKwnE
 GY7MmzPviG0hA1GO2cOLm8TI2hCj82rcTWelUuLXWorAiTeu0uwblzE+/6HuusqEdKxWOyy
X-Received: by 2002:a05:7022:e08:b0:123:308f:667b with SMTP id
 a92af1059eb24-1247dbb12bdmr1102484c88.2.1769190558509; Fri, 23 Jan 2026
 09:49:18 -0800 (PST)
MIME-Version: 1.0
References: <20260123000537.2450496-1-someguy@effective-light.com>
 <20260123000537.2450496-2-someguy@effective-light.com>
In-Reply-To: <20260123000537.2450496-2-someguy@effective-light.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Fri, 23 Jan 2026 12:49:07 -0500
X-Gm-Features: AZwV_Qgz341wiZBc4dCsfNwGUWjzf2Qg8Y2SqPANEwcuh1YAs3llykUX0i1R1t8
Message-ID: <CADnq5_O8guOxzHyEUn_x6pjrPG2xm_OgJWTCzvhzDYa-POtnoQ@mail.gmail.com>
Subject: Re: [PATCH 2/2] drm/amdgpu: implement page_flip_timeout() support
To: Hamza Mahfooz <someguy@effective-light.com>
Cc: dri-devel@lists.freedesktop.org, Alex Deucher <alexander.deucher@amd.com>, 
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>, 
 Rodrigo Siqueira <siqueira@igalia.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Sunil Khatri <sunil.khatri@amd.com>, Lijo Lazar <lijo.lazar@amd.com>,
 Ce Sun <cesun102@amd.com>, 
 Ivan Lipski <ivan.lipski@amd.com>, Kenneth Feng <kenneth.feng@amd.com>, 
 Alex Hung <alex.hung@amd.com>, Tom Chung <chiahsuan.chung@amd.com>, 
 Melissa Wen <mwen@igalia.com>,
 =?UTF-8?Q?Michel_D=C3=A4nzer?= <mdaenzer@redhat.com>, 
 Fangzhi Zuo <Jerry.Zuo@amd.com>,
 =?UTF-8?Q?Timur_Krist=C3=B3f?= <timur.kristof@gmail.com>, 
 amd-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org
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
	FORGED_RECIPIENTS(0.00)[m:someguy@effective-light.com,m:alexander.deucher@amd.com,m:christian.koenig@amd.com,m:airlied@gmail.com,m:simona@ffwll.ch,m:harry.wentland@amd.com,m:sunpeng.li@amd.com,m:siqueira@igalia.com,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:sunil.khatri@amd.com,m:lijo.lazar@amd.com,m:cesun102@amd.com,m:ivan.lipski@amd.com,m:kenneth.feng@amd.com,m:alex.hung@amd.com,m:chiahsuan.chung@amd.com,m:mwen@igalia.com,m:mdaenzer@redhat.com,m:Jerry.Zuo@amd.com,m:timur.kristof@gmail.com,m:amd-gfx@lists.freedesktop.org,m:linux-kernel@vger.kernel.org,m:timurkristof@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[alexdeucher@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[25];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	NEURAL_HAM(-0.00)[-0.999];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[alexdeucher@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	FREEMAIL_CC(0.00)[lists.freedesktop.org,amd.com,gmail.com,ffwll.ch,igalia.com,linux.intel.com,kernel.org,suse.de,redhat.com,vger.kernel.org];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: 62ACC792E2
X-Rspamd-Action: no action

On Fri, Jan 23, 2026 at 3:37=E2=80=AFAM Hamza Mahfooz
<someguy@effective-light.com> wrote:
>
> We now have a means to respond to page flip timeouts. So, hook up
> support for the new page_flip_timeout() callback.
>
> Signed-off-by: Hamza Mahfooz <someguy@effective-light.com>
> ---
> Hi,
>
> I have tested this on 7940HS system and it appears even a MODE2 reset
> will reset display firmware, so I don't think we need to force a full
> reset here.
> ---
>  drivers/gpu/drm/amd/amdgpu/amdgpu_reset.c      |  2 ++
>  drivers/gpu/drm/amd/amdgpu/amdgpu_reset.h      |  1 +
>  .../drm/amd/display/amdgpu_dm/amdgpu_dm_crtc.c | 18 ++++++++++++++++++
>  3 files changed, 21 insertions(+)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_reset.c b/drivers/gpu/drm/=
amd/amdgpu/amdgpu_reset.c
> index 28c4ad62f50e..bd63f0345984 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_reset.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_reset.c
> @@ -343,6 +343,8 @@ void amdgpu_reset_get_desc(struct amdgpu_reset_contex=
t *rst_ctxt, char *buf,
>         case AMDGPU_RESET_SRC_USERQ:
>                 strscpy(buf, "user queue trigger", len);
>                 break;
> +       case AMDGPU_RESET_SRC_DISPLAY:
> +               strscpy(buf, "display hang", len);
>         default:
>                 strscpy(buf, "unknown", len);
>         }
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_reset.h b/drivers/gpu/drm/=
amd/amdgpu/amdgpu_reset.h
> index 07b4d37f1db6..53b577062b11 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_reset.h
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_reset.h
> @@ -44,6 +44,7 @@ enum AMDGPU_RESET_SRCS {
>         AMDGPU_RESET_SRC_HWS,
>         AMDGPU_RESET_SRC_USER,
>         AMDGPU_RESET_SRC_USERQ,
> +       AMDGPU_RESET_SRC_DISPLAY,
>  };
>
>  struct amdgpu_reset_context {
> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_crtc.c b/dri=
vers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_crtc.c
> index 697e232acebf..2233e5b3b6a2 100644
> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_crtc.c
> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_crtc.c
> @@ -28,6 +28,7 @@
>
>  #include "dc.h"
>  #include "amdgpu.h"
> +#include "amdgpu_reset.h"
>  #include "amdgpu_dm_psr.h"
>  #include "amdgpu_dm_replay.h"
>  #include "amdgpu_dm_crtc.h"
> @@ -578,12 +579,29 @@ amdgpu_dm_atomic_crtc_get_property(struct drm_crtc =
*crtc,
>  }
>  #endif
>
> +static void amdgpu_dm_crtc_handle_timeout(struct drm_crtc *crtc)
> +{
> +       struct amdgpu_device *adev =3D drm_to_adev(crtc->dev);
> +       struct amdgpu_reset_context reset_context =3D {0};
> +
> +       if (amdgpu_device_should_recover_gpu(adev)) {
> +               memset(&reset_context, 0, sizeof(reset_context));
> +
> +               reset_context.method =3D AMD_RESET_METHOD_NONE;
> +               reset_context.reset_req_dev =3D adev;
> +               reset_context.src =3D AMDGPU_RESET_SRC_DISPLAY;
> +
> +               amdgpu_device_gpu_recover(adev, NULL, &reset_context);
> +       }

Rather than resetting the whole GPU here, does just suspending and
resuming DC help?  E.g., call dm_suspend() and dm_resume(), but force
the reset path (the amdgpu_in_reset() case) in those functions.  If
that works, that should help narrow down where the problem is.

Alex


> +}
> +
>  /* Implemented only the options currently available for the driver */
>  static const struct drm_crtc_funcs amdgpu_dm_crtc_funcs =3D {
>         .reset =3D amdgpu_dm_crtc_reset_state,
>         .destroy =3D amdgpu_dm_crtc_destroy,
>         .set_config =3D drm_atomic_helper_set_config,
>         .page_flip =3D drm_atomic_helper_page_flip,
> +       .page_flip_timeout =3D amdgpu_dm_crtc_handle_timeout,
>         .atomic_duplicate_state =3D amdgpu_dm_crtc_duplicate_state,
>         .atomic_destroy_state =3D amdgpu_dm_crtc_destroy_state,
>         .set_crc_source =3D amdgpu_dm_crtc_set_crc_source,
> --
> 2.52.0
>
