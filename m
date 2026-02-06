Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +JoPK1lYhmnDMAQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Fri, 06 Feb 2026 22:08:41 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EEC010352C
	for <lists+dri-devel@lfdr.de>; Fri, 06 Feb 2026 22:08:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7B40310E0DF;
	Fri,  6 Feb 2026 21:08:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="N7sTEL8G";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com
 [209.85.218.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 02BE310E916
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Feb 2026 21:08:37 +0000 (UTC)
Received: by mail-ej1-f42.google.com with SMTP id
 a640c23a62f3a-b8864618c99so36897266b.2
 for <dri-devel@lists.freedesktop.org>; Fri, 06 Feb 2026 13:08:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1770412116; x=1771016916; darn=lists.freedesktop.org;
 h=mime-version:user-agent:content-transfer-encoding
 :disposition-notification-to:references:in-reply-to:date:cc:to:from
 :subject:message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=/+NJOFqSVdQV18UFk9RR7F7roLWkGvtxbswC+y4nQIM=;
 b=N7sTEL8GB4nTdWqDkpk/klNRzWo0BUwOO0WYnzxgfMKzGYi/OGYztt9PDtXzwi0F36
 9DnayoHVOJk4gRokROo3/GpA4jLaa3i/HrtM+vdH1O/+0Ldb7R0DYIAQHck1sAFDBp4q
 PvaSrLVuqmjx0Mdi4hsJsq5J2Nat9oC2zDpg7ea2cd5ay13u3k1/Pwpq8Q/aZnbKQmUp
 vbimm+q9WG10O2mJ5+AzfnJqzn+VWIrv/b72/3vpohZ3xSLNYQxj+BF4pHuoyyH4Of1w
 RW/tQSfAIVZK7nBKrYgdy5KvNqEtff/AfNDwqnpEnXjpsp8W7AUVJF9kqMcXeiqomGK4
 7hAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1770412116; x=1771016916;
 h=mime-version:user-agent:content-transfer-encoding
 :disposition-notification-to:references:in-reply-to:date:cc:to:from
 :subject:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to;
 bh=/+NJOFqSVdQV18UFk9RR7F7roLWkGvtxbswC+y4nQIM=;
 b=ZiGSrxqXpwTcUGt7GySdoTWXRo/wA7X1FPiqV6RFt7DCi6rw/mpOQJt26QvkaoCaO8
 XtTsypaSz8+uZoVfTQ5h93VgVjys96ZpuVZFv8q1232+PI3B4Whr89fii5wPiNgSmC+H
 9esCzMdPRAF6YdW+GEYnrqtEeczqHam4iiXarNAezFJawUmPF+8IMQ0RtNwplG0hXX8T
 q2Sn/Bd9qLNkWXZw3mPZpfaEf91nEeWFJxC8am91+6lXFr7mZdBgSbRe7KhnorSPA6NI
 OyRcZpVwAmc3roKghrzlnD/eZif6qwoyYsmSaRRcM74zd2PsNX0V78/YUacgsk7s9ip/
 Wkbw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVVKssgMLQULRt840fxMDRF+GrUKw+uO8A2iGJpeH7Vo7qv7yW69xLcEZHSHoNsG5q9OJX1lw8kCSY=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwQpDrAFxavMndcVilI0XUfJuDhT4nbEdYqkWMYZBYUI0Aw+w0n
 6okxRqmN/k9uVDrxw0EGibCoOwSt5YvB/ja/myp+tYLEij9fPR2E25gh
X-Gm-Gg: AZuq6aJQpWAVifgLSBueWfli+mX7KgaeVpK0mU6VJl/uxXRmIoYPhv5xsFYwgoAmJlL
 LpDlMLkeeorMFXHUV3R8yx0tYJZUcBOu14/Jr3AIBxmMQ3XCbL5WK4X7gcrTN/NlPNKGAMoUbVD
 Jw2HBzRcWZEfljyVKBwkMTy1ic2wINPk0Wm+WKRxLcHIwg+mMFfHZU/0DHaGe1f0SQBOivTpozL
 5zXIuqXPkOaG6NwNQLbxAadboPZTm+v6Fz8yz8wFtn/2GxqrJBz725TBjdmtRoG3LvB9dSYcOSd
 Mqn0FscgBsXKhENuwUCZ6HBoXyOIYEDFdJs9j17nkwAIxQoWMrpPWaxxH33+F2cRGOuEEcTVavB
 Z1l0WUrrDIchS78xqAIkWl1yVNDlnII54tB5nab++J9eM0aLheUUHPIk0MTjad7z6KWmuapqZOr
 ljdLNGx60VqZedjA5Ig7p0Gx/u2lBO5vEDrcufzOg8UdVJswWztsreHS48lbao427GUCpfxQriD
 6me4+EnXQ==
X-Received: by 2002:a17:906:6a0f:b0:b88:5095:b740 with SMTP id
 a640c23a62f3a-b8edf4ead62mr117120066b.7.1770412116127; 
 Fri, 06 Feb 2026 13:08:36 -0800 (PST)
Received: from [192.168.1.239] (87-205-5-123.static.ip.netia.com.pl.
 [87.205.5.123]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b8eda7a3004sm113593866b.15.2026.02.06.13.08.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 Feb 2026 13:08:35 -0800 (PST)
Message-ID: <1f0ce7317fa941ef443c0d8c04aab00b78033cc1.camel@gmail.com>
Subject: Re: [PATCH v3 19/19] drm/amd/display: Add HDMI VRR desktop mode
From: Tomasz =?UTF-8?Q?Paku=C5=82a?= <tomasz.pakula.oficjalny@gmail.com>
To: Harry Wentland <harry.wentland@amd.com>, alexander.deucher@amd.com, 
 sunpeng.li@amd.com
Cc: maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, 	airlied@gmail.com, simona@ffwll.ch,
 siqueira@igalia.com, 	dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, 	linux-kernel@vger.kernel.org,
 bernhard.berger@gmail.com, 	michel.daenzer@mailbox.org,
 daniel@fooishbar.org, admin@ptr1337.dev
Date: Fri, 06 Feb 2026 22:08:33 +0100
In-Reply-To: <ee4a21fc-3625-4086-b2d0-9acf20b5d2ef@amd.com>
References: <20260203185626.55428-1-tomasz.pakula.oficjalny@gmail.com>
 <20260203185626.55428-20-tomasz.pakula.oficjalny@gmail.com>
 <ee4a21fc-3625-4086-b2d0-9acf20b5d2ef@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.58.3 
MIME-Version: 1.0
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
X-Spamd-Result: default: False [1.99 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	R_DKIM_REJECT(1.00)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	DMARC_POLICY_SOFTFAIL(0.10)[gmail.com : SPF not aligned (relaxed),none];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	TAGGED_FROM(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:harry.wentland@amd.com,m:alexander.deucher@amd.com,m:sunpeng.li@amd.com,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:siqueira@igalia.com,m:amd-gfx@lists.freedesktop.org,m:linux-kernel@vger.kernel.org,m:bernhard.berger@gmail.com,m:michel.daenzer@mailbox.org,m:daniel@fooishbar.org,m:admin@ptr1337.dev,m:bernhardberger@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[tomaszpakulaoficjalny@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FREEMAIL_FROM(0.00)[gmail.com];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:-];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	NEURAL_HAM(-0.00)[-0.983];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[tomaszpakulaoficjalny@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	FREEMAIL_CC(0.00)[linux.intel.com,kernel.org,suse.de,gmail.com,ffwll.ch,igalia.com,lists.freedesktop.org,vger.kernel.org,mailbox.org,fooishbar.org,ptr1337.dev];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: 0EEC010352C
X-Rspamd-Action: no action

On Fri, 2026-02-06 at 13:58 -0500, Harry Wentland wrote:
> On 2026-02-03 13:56, Tomasz Paku=C5=82a wrote:
> > [Why]
> > Many TVs and other HDMI sinks suffer from blanking and possibly other
> > glitches when VRR is toggled. With FreeSync present on such sinks, they
> > behave like the signal is always variable, even in fixed refresh rate
> > situations.
> >=20
> > [How]
> > Keep HDMI VRR toggled if it's supported and not explicitly disabled.
> > Additionnally, add module parameter which allows users to configure HDM=
I
> > VRR triggering to only happen when the signal is truly asking for
> > variable state. This is useful if end user has a TV that automatically
> > toggles ALLM/Game mode when VRR is active and such user doesn't want
> > gaming mode in normal desktop usage.
> >=20
>=20
> Can't this already be done by the compositor by simply setting the
> VRR_ENABLED property on a crtc?
>=20
> I don't like doing behavior behind the backs of compositors that
> they might not be expecting.
>=20
> Harry

This actually mimics how FreeSync works on Windows. It keeps signaling
VRR or well, FreeSync mode, to the sink while keeping the signal fixed.=20
Overall behavior is the same as with VRR completely disabled. Signal is
only variable if the compositor sets VRR_ENABLED.

It's a bit similar to freesync video or VRR_STATE_ACTIVE_FIXED.

FreeSync infopacket contains separate FreeSync on Desktop, and FreeSync
active fields and in this change, the check for VRR with
hdmi_vrr_on_desktop is the same as for FreeSync on Desktop field.

I could better show this by uploading a video to youtube, especially
with a comparison to the Windows driver.

Sadly, VRR_ENABLED is just a bool whereas compositors could give drivers
info in three steps: Disabled, Inactive, Active. This way, we could
still completely disable VRR signaling though again, the desired
behavior is preset even in the Windows driver or maybe it's baked into
FreeSync specification? I don't know if it's public, I know I haven't
seen it but it would be nice.

The need for this is due to the fact that, contrary to VESA Adaptive
Sync, HDMI doesn't seem to enforce that VRR mode toggling shouldn't
cause a mode change this A LOT of TVs will blank.

This is especially egregious with Windows' Dynamic Refresh rate setting
where the desktop becomes absolutely unusable. With constant blanking.


> > Signed-off-by: Tomasz Paku=C5=82a <tomasz.pakula.oficjalny@gmail.com>
> > ---
> >  drivers/gpu/drm/amd/amdgpu/amdgpu.h                 |  1 +
> >  drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c             | 13 +++++++++++++
> >  .../amd/display/modules/info_packet/info_packet.c   |  9 +++++++--
> >  3 files changed, 21 insertions(+), 2 deletions(-)
> >=20
> > diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu.h b/drivers/gpu/drm/amd/=
amdgpu/amdgpu.h
> > index 312aa32064d5..d49cd55e0f35 100644
> > --- a/drivers/gpu/drm/amd/amdgpu/amdgpu.h
> > +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu.h
> > @@ -269,6 +269,7 @@ extern int amdgpu_rebar;
> >  extern int amdgpu_wbrf;
> >  extern int amdgpu_user_queue;
> >  extern uint amdgpu_allm_mode;
> > +extern bool amdgpu_hdmi_vrr_desktop_mode;
> > =20
> >  extern uint amdgpu_hdmi_hpd_debounce_delay_ms;
> > =20
> > diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c b/drivers/gpu/drm/=
amd/amdgpu/amdgpu_drv.c
> > index 4b038c8bbf9f..f53c2ffeffa2 100644
> > --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
> > +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
> > @@ -249,6 +249,7 @@ int amdgpu_rebar =3D -1; /* auto */
> >  int amdgpu_user_queue =3D -1;
> >  uint amdgpu_hdmi_hpd_debounce_delay_ms;
> >  uint amdgpu_allm_mode =3D 1;
> > +bool amdgpu_hdmi_vrr_desktop_mode =3D true;
> > =20
> >  DECLARE_DYNDBG_CLASSMAP(drm_debug_classes, DD_CLASS_TYPE_DISJOINT_BITS=
, 0,
> >  			"DRM_UT_CORE",
> > @@ -1146,6 +1147,18 @@ module_param_named(hdmi_hpd_debounce_delay_ms, a=
mdgpu_hdmi_hpd_debounce_delay_ms
> >  MODULE_PARM_DESC(allm_mode, "Changes ALLM trigger mode (0 =3D disable,=
 1 =3D enable (default), 2 =3D force enable)");
> >  module_param_named(allm_mode, amdgpu_allm_mode, uint, 0644);
> > =20
> > +/**
> > + * DOC: hdmi_vrr_on_dekstop (bool)
> > + * Enables FreeSync behavior mimicking by keeping HDMI VRR signalling =
active in
> > + * fixed refresh rate conditions like normal desktop work/web browsing=
.
> > + * Possible values:
> > + *
> > + * - false =3D HDMI VRR is only enabled if refresh rate is truly varia=
ble
> > + * - true  =3D Mimics FreeSync behavior and keeps HDMI VRR always acti=
ve
> > + */
> > +MODULE_PARM_DESC(hdmi_vrr_desktop_mode, "Changes HDMI VRR desktop mode=
 (false =3D disable, true =3D enable (default))");
> > +module_param_named(hdmi_vrr_desktop_mode, amdgpu_hdmi_vrr_desktop_mode=
, bool, 0644);
> > +
> >  /* These devices are not supported by amdgpu.
> >   * They are supported by the mach64, r128, radeon drivers
> >   */
> > diff --git a/drivers/gpu/drm/amd/display/modules/info_packet/info_packe=
t.c b/drivers/gpu/drm/amd/display/modules/info_packet/info_packet.c
> > index 5fd9e8aadc98..b41e2240e1ae 100644
> > --- a/drivers/gpu/drm/amd/display/modules/info_packet/info_packet.c
> > +++ b/drivers/gpu/drm/amd/display/modules/info_packet/info_packet.c
> > @@ -654,8 +654,13 @@ static void build_vtem_infopacket_data(const struc=
t dc_stream_state *stream,
> >  	bool vrr_active =3D false;
> >  	bool rb =3D false;
> > =20
> > -	vrr_active =3D vrr->state =3D=3D VRR_STATE_ACTIVE_VARIABLE ||
> > -		     vrr->state =3D=3D VRR_STATE_ACTIVE_FIXED;
> > +	if (amdgpu_hdmi_vrr_desktop_mode) {
> > +		vrr_active =3D vrr->state !=3D VRR_STATE_UNSUPPORTED &&
> > +			     vrr->state !=3D VRR_STATE_DISABLED;
> > +	} else {
> > +		vrr_active =3D vrr->state =3D=3D VRR_STATE_ACTIVE_VARIABLE ||
> > +			     vrr->state =3D=3D VRR_STATE_ACTIVE_FIXED;
> > +	}
> > =20
> >  	infopacket->sb[VTEM_MD0] =3D VTEM_M_CONST << VTEM_M_CONST_BIT;
> >  	infopacket->sb[VTEM_MD0] |=3D VTEM_FVA_FACTOR << VTEM_FVA_BIT;
