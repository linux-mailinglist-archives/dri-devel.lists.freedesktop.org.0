Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8CxWGexlhmlLMwQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Fri, 06 Feb 2026 23:06:36 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CE5D1103A7B
	for <lists+dri-devel@lfdr.de>; Fri, 06 Feb 2026 23:06:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F1E2010E946;
	Fri,  6 Feb 2026 22:06:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="jIX8QeUR";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-dy1-f182.google.com (mail-dy1-f182.google.com
 [74.125.82.182])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B7ADA10E945
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Feb 2026 22:06:30 +0000 (UTC)
Received: by mail-dy1-f182.google.com with SMTP id
 5a478bee46e88-2b703e04984so318641eec.3
 for <dri-devel@lists.freedesktop.org>; Fri, 06 Feb 2026 14:06:30 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770415590; cv=none;
 d=google.com; s=arc-20240605;
 b=JLaIbVQEBvK1yB6h7mHzKDaRld4XQUyjD8bo/payPM+qhzmjdl3hZ3gfTieFvi0mHg
 yoUPYMkja6JTDHejpBXJlWLzz6iH27b6h7r91IBteh3Kt9eEHwpG0UlV+KDRGrIoY9Rf
 Rf7QuavXBzhg6mEEfajfNodQ/eD2tXxrXbLxvp3JY1NXt3q+5OAl1MPwEYAENQqb0Egn
 TX6ISCur4g6Za8HROCdfX709ppMVSRTaJSVqx5JgwrrYwNWeRH31ZIpAPkt+Goegqec5
 zexC99FpmKbnQEXErszsgJrg8+H3K63EngcznniPXHLNLC5RosEE8odWX1MOUPm5sJ48
 W4Yg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=t9JUCkixPVH7e1MZ+SkL97/AHvO6ZFT/H4gh0z3m0gI=;
 fh=MuHb3h5/MUYL0pmAdt28ab2jVEPNmzNiBfyE2sTxTLg=;
 b=fMwCtDwT1jNeYk5hKfoxyl7H5rZSI53mMfrqX1IzHtHP57se6/pc3IyCYwLKAGV35M
 eNVlyNcD4XC0CBZ5ibH5HShQgLudxWBEfal74Ylvr08FOP6QH9+BW567DOk0RCBw9Osx
 cMmji0DnnQtjq+GB6mu8rvtSnLnlut0Ir6TJuB/azhqfJ8lhc0W1uhu8L9JG4gpGIp6u
 Qh7DLc8IkaPZNPqufujThX3etzJpLLAfe8a7pR1Qb5tqGVuJF5DUMd2WITJY+JL/BahM
 bw7+UP+kG3SSHXJygzz0kl3dX8DutYPZl9LjAo7H4NPmlQPO8KiR3cvkDBHXQq165kwE
 2AHg==; darn=lists.freedesktop.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1770415590; x=1771020390; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=t9JUCkixPVH7e1MZ+SkL97/AHvO6ZFT/H4gh0z3m0gI=;
 b=jIX8QeURnv9Y0FoKimHY+ytgmf3wDXPsDz+0JspbEkcHM2pN5N8lTsgmghth6kGhrL
 Vw4D98G40E+sFfBhieG51Xz1CtW5s+ohCt0Wocx5QCiklw86+uL81j/fyBPe2c3RXmAX
 KcKOY0v87uRhlTisgvRD4jDsp4Zvjof2U7vpiQkwpx/5vGYB7c4uLD2xAL0VurJQ5rV5
 iQNEev1FQdhXveznX1mCfr9gIHj2j3d9gHQBhlcs7Rb2qpldo03a51Rw9ec5MhGD70Yv
 BfyIrT21F1Y7YPfn8M8QlFic+PRR/dCejQ+1OA79nAuMoUCEgby6bnQkCZ92MhmCbEY/
 +7xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1770415590; x=1771020390;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=t9JUCkixPVH7e1MZ+SkL97/AHvO6ZFT/H4gh0z3m0gI=;
 b=NNwdmb+txuj/s5Hxp783Rvyq0+4OKnmL3HhdvaH2DN3lzCS9xSTHEgZgg4Pdle2JQy
 QK1HabEvA+O+mJCCqI6Xpj7FCEVc35mRRx1eIFngZFat4d7+SUWrACCE+Llk/JIatPEz
 zpaMN1pQd0RvimztUu3Ru5NJGsS29r1f8Jt/RRf1K1CpXYUSIKKZcVAsESAKbJyq6mZU
 mJyC3c078NxcB55fUOrA4BoM7aD2xYKTrbznFW/heaVEgJPZ73+yoqCsG6DFS06CQmL9
 7ImUuk80VxVOQBPxumBtwHXCcGxSy/79OqeLdRFTbO7eTA+nu24Ea5fVfDSjbVk9zyfV
 ctRw==
X-Forwarded-Encrypted: i=1;
 AJvYcCV1zJnbu2enMuicD76ytIJtlVtgVLWwJXQLud8NMGsTGnZd7Vvn/8+C0NB5Bt8T4gO5lFILuRHBHHw=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyAbdLOjb4SSRYQpy9l27Z4xAkc5KU6EDhAEJQhUswhTfwMv3tW
 0u8BevlL4OsA8fZJmZrGVfsQoZzWVUENH64ZqAVIHoqXX6gg9pAaeYf4mOaWWTarQFEUxjeG4Rp
 HSQWNdKBHCqz4VWE5m/jqcyjcR8AV7IQ=
X-Gm-Gg: AZuq6aL6mU4vKaYWfxskzJeqqfK/ONQL4XMV0Rjv+/d0jHOml43jvrxYB6Yc/rVWeLh
 42p6BCfcdz+a2DkG6bQcxNvh2J5ynakI9r89vMPGbBWb7B2H72DYnWB0SOVe3ndODmPy2fmr7kQ
 GaD0McC/HMvzwrhaiUs3H1yd1VK6VOZ/w2s9lLqmv6e4fjpebJ9R+kxAB4OL5Ob1AWsq9XbooIa
 SoWU8lZCBA/Lts7ejxKAuhOXVMB5gtiyqR8Om/OWUdz75Gq71S7uBZGColZzKZkzUvyXh/4
X-Received: by 2002:a05:7300:5721:b0:2b7:1c58:dc9e with SMTP id
 5a478bee46e88-2b85671db42mr976513eec.9.1770415589926; Fri, 06 Feb 2026
 14:06:29 -0800 (PST)
MIME-Version: 1.0
References: <20260203185626.55428-1-tomasz.pakula.oficjalny@gmail.com>
 <20260203185626.55428-20-tomasz.pakula.oficjalny@gmail.com>
In-Reply-To: <20260203185626.55428-20-tomasz.pakula.oficjalny@gmail.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Fri, 6 Feb 2026 17:06:18 -0500
X-Gm-Features: AZwV_Qh0tTckj59GVgrqkBR4zfCFR6o2l2IYC3E9lcEzFllb9aXm2dUuZwlqjqM
Message-ID: <CADnq5_OPP+bbJ9OXGSUEN9EC=hseY4DCfKngpAoA2keMbG5z7g@mail.gmail.com>
Subject: Re: [PATCH v3 19/19] drm/amd/display: Add HDMI VRR desktop mode
To: =?UTF-8?Q?Tomasz_Paku=C5=82a?= <tomasz.pakula.oficjalny@gmail.com>
Cc: alexander.deucher@amd.com, harry.wentland@amd.com, sunpeng.li@amd.com, 
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de, 
 airlied@gmail.com, simona@ffwll.ch, siqueira@igalia.com, 
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, bernhard.berger@gmail.com, 
 michel.daenzer@mailbox.org, daniel@fooishbar.org, admin@ptr1337.dev
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
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[3];
	FORGED_RECIPIENTS(0.00)[m:tomasz.pakula.oficjalny@gmail.com,m:alexander.deucher@amd.com,m:harry.wentland@amd.com,m:sunpeng.li@amd.com,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:siqueira@igalia.com,m:amd-gfx@lists.freedesktop.org,m:linux-kernel@vger.kernel.org,m:bernhard.berger@gmail.com,m:michel.daenzer@mailbox.org,m:daniel@fooishbar.org,m:admin@ptr1337.dev,m:tomaszpakulaoficjalny@gmail.com,m:bernhardberger@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[alexdeucher@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[17];
	FREEMAIL_FROM(0.00)[gmail.com];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	NEURAL_HAM(-0.00)[-0.994];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[alexdeucher@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	FREEMAIL_CC(0.00)[amd.com,linux.intel.com,kernel.org,suse.de,gmail.com,ffwll.ch,igalia.com,lists.freedesktop.org,vger.kernel.org,mailbox.org,fooishbar.org,ptr1337.dev];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid]
X-Rspamd-Queue-Id: CE5D1103A7B
X-Rspamd-Action: no action

On Tue, Feb 3, 2026 at 2:07=E2=80=AFPM Tomasz Paku=C5=82a
<tomasz.pakula.oficjalny@gmail.com> wrote:
>
> [Why]
> Many TVs and other HDMI sinks suffer from blanking and possibly other
> glitches when VRR is toggled. With FreeSync present on such sinks, they
> behave like the signal is always variable, even in fixed refresh rate
> situations.
>
> [How]
> Keep HDMI VRR toggled if it's supported and not explicitly disabled.
> Additionnally, add module parameter which allows users to configure HDMI
> VRR triggering to only happen when the signal is truly asking for
> variable state. This is useful if end user has a TV that automatically
> toggles ALLM/Game mode when VRR is active and such user doesn't want
> gaming mode in normal desktop usage.
>
> Signed-off-by: Tomasz Paku=C5=82a <tomasz.pakula.oficjalny@gmail.com>
> ---
>  drivers/gpu/drm/amd/amdgpu/amdgpu.h                 |  1 +
>  drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c             | 13 +++++++++++++
>  .../amd/display/modules/info_packet/info_packet.c   |  9 +++++++--
>  3 files changed, 21 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu.h b/drivers/gpu/drm/amd/am=
dgpu/amdgpu.h
> index 312aa32064d5..d49cd55e0f35 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu.h
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu.h
> @@ -269,6 +269,7 @@ extern int amdgpu_rebar;
>  extern int amdgpu_wbrf;
>  extern int amdgpu_user_queue;
>  extern uint amdgpu_allm_mode;
> +extern bool amdgpu_hdmi_vrr_desktop_mode;
>
>  extern uint amdgpu_hdmi_hpd_debounce_delay_ms;
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c b/drivers/gpu/drm/am=
d/amdgpu/amdgpu_drv.c
> index 4b038c8bbf9f..f53c2ffeffa2 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
> @@ -249,6 +249,7 @@ int amdgpu_rebar =3D -1; /* auto */
>  int amdgpu_user_queue =3D -1;
>  uint amdgpu_hdmi_hpd_debounce_delay_ms;
>  uint amdgpu_allm_mode =3D 1;
> +bool amdgpu_hdmi_vrr_desktop_mode =3D true;
>
>  DECLARE_DYNDBG_CLASSMAP(drm_debug_classes, DD_CLASS_TYPE_DISJOINT_BITS, =
0,
>                         "DRM_UT_CORE",
> @@ -1146,6 +1147,18 @@ module_param_named(hdmi_hpd_debounce_delay_ms, amd=
gpu_hdmi_hpd_debounce_delay_ms
>  MODULE_PARM_DESC(allm_mode, "Changes ALLM trigger mode (0 =3D disable, 1=
 =3D enable (default), 2 =3D force enable)");
>  module_param_named(allm_mode, amdgpu_allm_mode, uint, 0644);
>
> +/**
> + * DOC: hdmi_vrr_on_dekstop (bool)

*desktop

> + * Enables FreeSync behavior mimicking by keeping HDMI VRR signalling ac=
tive in
> + * fixed refresh rate conditions like normal desktop work/web browsing.
> + * Possible values:
> + *
> + * - false =3D HDMI VRR is only enabled if refresh rate is truly variabl=
e
> + * - true  =3D Mimics FreeSync behavior and keeps HDMI VRR always active
> + */
> +MODULE_PARM_DESC(hdmi_vrr_desktop_mode, "Changes HDMI VRR desktop mode (=
false =3D disable, true =3D enable (default))");
> +module_param_named(hdmi_vrr_desktop_mode, amdgpu_hdmi_vrr_desktop_mode, =
bool, 0644);

This also seems like it would be better to be a KMS property.

Alex

> +
>  /* These devices are not supported by amdgpu.
>   * They are supported by the mach64, r128, radeon drivers
>   */
> diff --git a/drivers/gpu/drm/amd/display/modules/info_packet/info_packet.=
c b/drivers/gpu/drm/amd/display/modules/info_packet/info_packet.c
> index 5fd9e8aadc98..b41e2240e1ae 100644
> --- a/drivers/gpu/drm/amd/display/modules/info_packet/info_packet.c
> +++ b/drivers/gpu/drm/amd/display/modules/info_packet/info_packet.c
> @@ -654,8 +654,13 @@ static void build_vtem_infopacket_data(const struct =
dc_stream_state *stream,
>         bool vrr_active =3D false;
>         bool rb =3D false;
>
> -       vrr_active =3D vrr->state =3D=3D VRR_STATE_ACTIVE_VARIABLE ||
> -                    vrr->state =3D=3D VRR_STATE_ACTIVE_FIXED;
> +       if (amdgpu_hdmi_vrr_desktop_mode) {
> +               vrr_active =3D vrr->state !=3D VRR_STATE_UNSUPPORTED &&
> +                            vrr->state !=3D VRR_STATE_DISABLED;
> +       } else {
> +               vrr_active =3D vrr->state =3D=3D VRR_STATE_ACTIVE_VARIABL=
E ||
> +                            vrr->state =3D=3D VRR_STATE_ACTIVE_FIXED;
> +       }
>
>         infopacket->sb[VTEM_MD0] =3D VTEM_M_CONST << VTEM_M_CONST_BIT;
>         infopacket->sb[VTEM_MD0] |=3D VTEM_FVA_FACTOR << VTEM_FVA_BIT;
> --
> 2.52.0
>
