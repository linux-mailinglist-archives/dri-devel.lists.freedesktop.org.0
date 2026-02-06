Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +ECRA3hlhmlLMwQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Fri, 06 Feb 2026 23:04:40 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A581C103A36
	for <lists+dri-devel@lfdr.de>; Fri, 06 Feb 2026 23:04:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D0B8B10E944;
	Fri,  6 Feb 2026 22:04:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="eU1wPoVf";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-dy1-f181.google.com (mail-dy1-f181.google.com
 [74.125.82.181])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2E47810E944
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Feb 2026 22:04:34 +0000 (UTC)
Received: by mail-dy1-f181.google.com with SMTP id
 5a478bee46e88-2b718524994so126077eec.1
 for <dri-devel@lists.freedesktop.org>; Fri, 06 Feb 2026 14:04:34 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770415473; cv=none;
 d=google.com; s=arc-20240605;
 b=jYLU33/LqsxHrCQyh6Dp7SfTrTyx7Gn6l7iVVDoJ2YD3+DVO7GQNSqGQYFfCesU8Fk
 NYjjbE1KcF5dtOn3F1Gh2i7TTMKJtyVuLWOPyqXpl1CaZogW7IAgpmPk3xP3FdP25jq6
 f+SvUDdmQtnEvC2dzuLzwAkmX3nd/Y+7RCmzrkFR2ICeJIrLNJ2V16L6r6C/TPrpfRuL
 DkZgXOP6b5KDYfzwDaWOUP2hsGVB6crE7B5ZhMu67pg/cTTjvelDMSxQjKajNVEfXpzs
 msMlj33b624J7KV6YY83S4ghPu9gbUo1hdF1ID3WMKbzbLTOsl4EN9Tzada5euvd2vqf
 T7Xg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=Jk6BL44RE1W/bDaY04V8/OOSteQH3jII9mxbIReoKUI=;
 fh=JAyrOr3AZyT+QdlT9j4cRR6fF/QDIjCzUzig52Q2kDg=;
 b=CGDfZMSPOBJN6BoQPpWEn3CNDcSsc9uQEL5onRVm96wg3kJovn7tjo4s/E13+TB5Dp
 qbaXSIbbbFFt3f0yUQ9C66Ie1wH4ZykU0/6P5gMouiKRntDPNbmVfYw6jga/seBI8Wcu
 5kW9YmXUzOVPhndE6CIrLQBRjzHyXXB/H8RfBH50JsyENtwNjNhkL5oUP2lpcnXVng6Z
 h5UCYAp4oejkKy1o9PpMqm3gADUuZZuCxCbYxLmn8S6SvrEe33KUIel07WuN7diiEO8Y
 XgpYHWny7xhnIitmPTXMOd+nkIGvuz/CRehKN/4s+oYgIsP4l95W45m/U4WCvNWI1BuL
 y2yw==; darn=lists.freedesktop.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1770415473; x=1771020273; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Jk6BL44RE1W/bDaY04V8/OOSteQH3jII9mxbIReoKUI=;
 b=eU1wPoVf6fSPhjFXhfvHyKz2IE5T7Lpz1OSVwco5LBxsWAU+vCMzcwVeBF1WMLn9PX
 D+nR3t1vxXSxKA9fIkIUVX97sMZ1eNzu4nFfmA66K0PYdP8TlXHT3AA3dOrWKWp1IQTi
 QzpWNOxMQri0XjtYQ7PzE1ULg0dt61M3kAHtYdrseJbVuH0wqvsQhmuRYqctUHvyREq/
 KaE19Mr0k/T94x8+dyrQuuzYgrXOddBFRIkM7y4Lo8eueLywORsrLRS79pzIPti5N585
 ySIX8PtHUAvG69r5UC8xFG80Xg9M24QCY70y8xDA4Xaqy93IH+STKPJ1kFmN0rufb6Wb
 kWag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1770415473; x=1771020273;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=Jk6BL44RE1W/bDaY04V8/OOSteQH3jII9mxbIReoKUI=;
 b=vVRIF+Btc30K/ZmF/M5Y78daH3Uc73XNAEW1e0KeHktsOKYOkgsgTFkqghIiPBQl/z
 wJUEVgZIvDy9xPXBdCeFa8G2H0BHlHRmy/gdIZxuJz2uSC/1W0BlZ6+u2NGDinBou6Uj
 DaxaMeAJB5kTNXHNMe4YaTxYbeo+h8TX+gOI9YTgDSmvhGUV1IHfY1S0ob3sHLOnXzSh
 kJ24HkFvSI5HfaSsBPTm06nkmTbGmA1ixWrCHrla7oTDNGnSvna29VBZaw6L7K2QsjBW
 /NURSMho+lyv4+/3PXilIiP+79OC8wfBP2lCETT2lOFuwHixPQrA2N9mrlqV/c3mzBlL
 Bi9Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCXYZejxosH+lIK3tCqjZajwCpDe3QOLPXlS/L2KYmV1eWmywCS/5SQIuBB9OcqaEck0qqNswk08tlM=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw7qcv4nZNZxHiysWxIPo22DssemFCZuZO3zLP0XCt8gsLf8/uN
 tdmJUl5OC0886d29IYjgncJTxB3fydiLeoR/bJqasq+VDkhTtwSrr0fBHt127yPAq31Bb8istUb
 ZoFjYaHq+bRakcJnWt1UxdbshydUazEI=
X-Gm-Gg: AZuq6aLYc/eaRZ5RUR/wutM1MLWFWrXL9wbr0DQPzqj+VKUaj8xkf0m62bJ2EMuL89t
 FzkY3YwrR1/66kdSPcVqEIK0kBmpQY3ORUs9RjjnvKaBZ80a8sn7NYqrqthRwQzUnO5oAVMaps3
 miZG7vvC9UyRE8Ep+l7rVpizutkyAQSLTDPYCsiPmWT0tzyTvMeyqTSnhGauR8MeMkLPaGW1Mn7
 JMk6rB5OTS+hYjLF1uoJVyhFLy1c8BeeT7WlVknQI5fOGb47MgBQANeDKKiKtuT0IEitx+I
X-Received: by 2002:a05:693c:2d8d:b0:2b7:121a:99f with SMTP id
 5a478bee46e88-2b8560df66dmr932478eec.0.1770415473201; Fri, 06 Feb 2026
 14:04:33 -0800 (PST)
MIME-Version: 1.0
References: <20260203185626.55428-1-tomasz.pakula.oficjalny@gmail.com>
 <20260203185626.55428-17-tomasz.pakula.oficjalny@gmail.com>
 <f19af3c6-f865-4758-8c50-aba40ec1cf68@amd.com>
 <79264ab170e48e1372b3b847d75f4635dcc57aa6.camel@gmail.com>
In-Reply-To: <79264ab170e48e1372b3b847d75f4635dcc57aa6.camel@gmail.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Fri, 6 Feb 2026 17:04:21 -0500
X-Gm-Features: AZwV_Qg5_HyKaL-TkdSFX65qrZjXS-4tErdA08bSm8cYOxgRIao9D_8r3N1EXmc
Message-ID: <CADnq5_PhcNPU=4s1P30OqbWY7qPD3dHmjEtoz4_Md41u=xaxFw@mail.gmail.com>
Subject: Re: [PATCH v3 16/19] drm/amd/display: Add parameter to control ALLM
 behavior
To: =?UTF-8?Q?Tomasz_Paku=C5=82a?= <tomasz.pakula.oficjalny@gmail.com>
Cc: Harry Wentland <harry.wentland@amd.com>, alexander.deucher@amd.com,
 sunpeng.li@amd.com, 
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
	FORGED_RECIPIENTS(0.00)[m:tomasz.pakula.oficjalny@gmail.com,m:harry.wentland@amd.com,m:alexander.deucher@amd.com,m:sunpeng.li@amd.com,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:siqueira@igalia.com,m:amd-gfx@lists.freedesktop.org,m:linux-kernel@vger.kernel.org,m:bernhard.berger@gmail.com,m:michel.daenzer@mailbox.org,m:daniel@fooishbar.org,m:admin@ptr1337.dev,m:tomaszpakulaoficjalny@gmail.com,m:bernhardberger@gmail.com,s:lists@lfdr.de];
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
	NEURAL_HAM(-0.00)[-0.998];
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
X-Rspamd-Queue-Id: A581C103A36
X-Rspamd-Action: no action

On Fri, Feb 6, 2026 at 4:12=E2=80=AFPM Tomasz Paku=C5=82a
<tomasz.pakula.oficjalny@gmail.com> wrote:
>
> On Fri, 2026-02-06 at 13:52 -0500, Harry Wentland wrote:
> > On 2026-02-03 13:56, Tomasz Paku=C5=82a wrote:
> > > [Why]
> > > Some users prefer to always manually control ALLM/Gaming mode while
> > > others might want it permanently forced on.
> > >
> > > [How]
> > > Since there isn't yet an API to control this, expose module parameter
> > >
> > > Changes in v3:
> > > - Include a fix for possible NULL pointer dereference by Peter
> > >
> > > Closes: https://github.com/CachyOS/linux-cachyos/issues/680
> > >
> > > Co-developed-by: Peter Jung <admin@ptr1337.dev>
> > > Signed-off-by: Peter Jung <admin@ptr1337.dev>
> > > Signed-off-by: Tomasz Paku=C5=82a <tomasz.pakula.oficjalny@gmail.com>
> > > ---
> > >  drivers/gpu/drm/amd/amdgpu/amdgpu.h           |  1 +
> > >  drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c       | 14 +++++-
> > >  .../gpu/drm/amd/display/dc/core/dc_resource.c |  7 +--
> > >  .../amd/display/modules/inc/mod_info_packet.h |  1 +
> > >  .../display/modules/info_packet/info_packet.c | 46 ++++++++++++++++-=
--
> > >  5 files changed, 56 insertions(+), 13 deletions(-)
> > >
> > > diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu.h b/drivers/gpu/drm/am=
d/amdgpu/amdgpu.h
> > > index 447e734c362b..312aa32064d5 100644
> > > --- a/drivers/gpu/drm/amd/amdgpu/amdgpu.h
> > > +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu.h
> > > @@ -268,6 +268,7 @@ extern int amdgpu_rebar;
> > >
> > >  extern int amdgpu_wbrf;
> > >  extern int amdgpu_user_queue;
> > > +extern uint amdgpu_allm_mode;
> > >
> > >  extern uint amdgpu_hdmi_hpd_debounce_delay_ms;
> > >
> > > diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c b/drivers/gpu/dr=
m/amd/amdgpu/amdgpu_drv.c
> > > index d6d0a6e34c6b..4b038c8bbf9f 100644
> > > --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
> > > +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
> > > @@ -248,6 +248,7 @@ int amdgpu_umsch_mm_fwlog;
> > >  int amdgpu_rebar =3D -1; /* auto */
> > >  int amdgpu_user_queue =3D -1;
> > >  uint amdgpu_hdmi_hpd_debounce_delay_ms;
> > > +uint amdgpu_allm_mode =3D 1;
> > >
> > >  DECLARE_DYNDBG_CLASSMAP(drm_debug_classes, DD_CLASS_TYPE_DISJOINT_BI=
TS, 0,
> > >                     "DRM_UT_CORE",
> > > @@ -1124,7 +1125,7 @@ module_param_named(rebar, amdgpu_rebar, int, 04=
44);
> > >  MODULE_PARM_DESC(user_queue, "Enable user queues (-1 =3D auto (defau=
lt), 0 =3D disable, 1 =3D enable, 2 =3D enable UQs and disable KQs)");
> > >  module_param_named(user_queue, amdgpu_user_queue, int, 0444);
> > >
> > > -/*
> > > +/**
> > >   * DOC: hdmi_hpd_debounce_delay_ms (uint)
> > >   * HDMI HPD disconnect debounce delay in milliseconds.
> > >   *
> > > @@ -1134,6 +1135,17 @@ module_param_named(user_queue, amdgpu_user_que=
ue, int, 0444);
> > >  MODULE_PARM_DESC(hdmi_hpd_debounce_delay_ms, "HDMI HPD disconnect de=
bounce delay in milliseconds (0 to disable (by default), 1500 is common)");
> > >  module_param_named(hdmi_hpd_debounce_delay_ms, amdgpu_hdmi_hpd_debou=
nce_delay_ms, uint, 0644);
> > >
> > > +/**
> > > + * DOC: allm_mode (int)

Would be good to define ALLM.

> > > + * Changes ALLM triggering mode (if sink supports ALLM). Possible va=
lues:
> > > + *
> > > + * - 0 =3D ALLM disabled
> > > + * - 1 =3D ALLM dynamically triggered based on VRR state / Game Cont=
ent Type Hint
> > > + * - 2 =3D ALLM forced always on
> > > + */
> > > +MODULE_PARM_DESC(allm_mode, "Changes ALLM trigger mode (0 =3D disabl=
e, 1 =3D enable (default), 2 =3D force enable)");
> > > +module_param_named(allm_mode, amdgpu_allm_mode, uint, 0644);

Also, maybe a per connector kms property would be preferable.  Then
you could change it per display.

Alex

> > > +
> > >  /* These devices are not supported by amdgpu.
> > >   * They are supported by the mach64, r128, radeon drivers
> > >   */
> > > diff --git a/drivers/gpu/drm/amd/display/dc/core/dc_resource.c b/driv=
ers/gpu/drm/amd/display/dc/core/dc_resource.c
> > > index 4a7c9f810e35..b779aac28dfa 100644
> > > --- a/drivers/gpu/drm/amd/display/dc/core/dc_resource.c
> > > +++ b/drivers/gpu/drm/amd/display/dc/core/dc_resource.c
> > > @@ -44,6 +44,7 @@
> > >  #include "clk_mgr.h"
> > >  #include "dc_state_priv.h"
> > >  #include "dc_stream_priv.h"
> > > +#include "modules/inc/mod_info_packet.h"
> >
> > Architecturally DC can't have a dependency on modules.
> > Is there a different way we can handle this?
> >
> > Could we do the determination in amdgpu_dm (with help of
> > the module) and then set a flag on the stream?
> >
> > Harry
>
> Sure. I don't have any opinion on how it should be done. I think I only
> did this like that because I wanted it to be easily changeable at
> runtime, but the value of having this RW is next to none.
>
> >
> > >
> > >  #include "virtual/virtual_link_hwss.h"
> > >  #include "link/hwss/link_hwss_dio.h"
> > > @@ -4503,8 +4504,6 @@ static void set_avi_info_frame(
> > >     unsigned int vic =3D pipe_ctx->stream->timing.vic;
> > >     unsigned int rid =3D pipe_ctx->stream->timing.rid;
> > >     unsigned int fr_ind =3D pipe_ctx->stream->timing.fr_index;
> > > -   enum dc_timing_3d_format format;
> > > -   bool allm;
> > >
> > >     if (stream->avi_infopacket.valid) {
> > >             *info_packet =3D stream->avi_infopacket;
> > > @@ -4658,10 +4657,8 @@ static void set_avi_info_frame(
> > >     ///VIC
> > >     if (pipe_ctx->stream->timing.hdmi_vic !=3D 0)
> > >             vic =3D 0;
> > > -   format =3D stream->timing.timing_3d_format;
> > > -   allm =3D stream->link->local_sink->edid_caps.allm;
> > >     /*todo, add 3DStereo support*/
> > > -   if ((format !=3D TIMING_3D_FORMAT_NONE) || allm) {
> > > +   if (!is_hdmi_vic_mode(pipe_ctx->stream)) {
> > >             // Based on HDMI specs hdmi vic needs to be converted to =
cea vic when 3D is enabled
> > >             switch (pipe_ctx->stream->timing.hdmi_vic) {
> > >             case 1:
> > > diff --git a/drivers/gpu/drm/amd/display/modules/inc/mod_info_packet.=
h b/drivers/gpu/drm/amd/display/modules/inc/mod_info_packet.h
> > > index 306eb7355c25..9ec123ecc7c4 100644
> > > --- a/drivers/gpu/drm/amd/display/modules/inc/mod_info_packet.h
> > > +++ b/drivers/gpu/drm/amd/display/modules/inc/mod_info_packet.h
> > > @@ -41,6 +41,7 @@ void set_vsc_packet_colorimetry_data(
> > >             enum dc_color_space cs,
> > >             enum color_transfer_func tf);
> > >
> > > +bool is_hdmi_vic_mode(const struct dc_stream_state *stream);
> > >  void mod_build_vsc_infopacket(const struct dc_stream_state *stream,
> > >             struct dc_info_packet *info_packet,
> > >             enum dc_color_space cs,
> > > diff --git a/drivers/gpu/drm/amd/display/modules/info_packet/info_pac=
ket.c b/drivers/gpu/drm/amd/display/modules/info_packet/info_packet.c
> > > index 53e488fdb4ea..829cce9455db 100644
> > > --- a/drivers/gpu/drm/amd/display/modules/info_packet/info_packet.c
> > > +++ b/drivers/gpu/drm/amd/display/modules/info_packet/info_packet.c
> > > @@ -23,12 +23,13 @@
> > >   *
> > >   */
> > >
> > > -#include "mod_info_packet.h"
> > > +#include "amdgpu.h"
> > >  #include "core_types.h"
> > > -#include "dc_types.h"
> > > -#include "mod_shared.h"
> > > -#include "mod_freesync.h"
> > >  #include "dc.h"
> > > +#include "dc_types.h"
> > > +#include "mod_freesync.h"
> > > +#include "mod_info_packet.h"
> > > +#include "mod_shared.h"
> > >
> > >  enum vsc_packet_revision {
> > >     vsc_packet_undefined =3D 0,
> > > @@ -54,6 +55,12 @@ enum vsc_packet_revision {
> > >  #define HF_VSIF_3D_BIT   0
> > >  #define HF_VSIF_ALLM_BIT 1
> > >
> > > +enum allm_trigger_mode {
> > > +   ALLM_MODE_DISABLED        =3D 0,
> > > +   ALLM_MODE_ENABLED_DYNAMIC =3D 1,
> > > +   ALLM_MODE_ENABLED_FORCED  =3D 2,
> > > +};
> > > +
> > >  // VTEM Byte Offset
> > >  #define VTEM_PB0           0
> > >  #define VTEM_PB1           1
> > > @@ -499,7 +506,32 @@ void mod_build_vsc_infopacket(const struct dc_st=
ream_state *stream,
> > >     }
> > >  }
> > >
> > > -static bool is_hdmi_vic_mode(const struct dc_stream_state *stream)
> > > +static bool is_hdmi_allm_mode(const struct dc_stream_state *stream)
> > > +{
> > > +   /* No local sink */
> > > +   if (!stream->link->local_sink)
> > > +           return false;
> > > +
> > > +   /* Sink doesn't expose ALLM support in edid */
> > > +   if (!stream->link->local_sink->edid_caps.allm)
> > > +           return false;
> > > +
> > > +   switch (amdgpu_allm_mode) {
> > > +   case ALLM_MODE_DISABLED:
> > > +           return false;
> > > +
> > > +   case ALLM_MODE_ENABLED_DYNAMIC:
> > > +           break;
> > > +
> > > +   case ALLM_MODE_ENABLED_FORCED:
> > > +           return true;
> > > +   }
> > > +
> > > +   return stream->content_type =3D=3D DISPLAY_CONTENT_TYPE_GAME ||
> > > +          stream->vrr_active_variable;
> > > +}
> > > +
> > > +bool is_hdmi_vic_mode(const struct dc_stream_state *stream)
> > >  {
> > >     if (stream->timing.hdmi_vic =3D=3D 0)
> > >             return false;
> > > @@ -512,7 +544,7 @@ static bool is_hdmi_vic_mode(const struct dc_stre=
am_state *stream)
> > >     if (stream->view_format !=3D VIEW_3D_FORMAT_NONE)
> > >             return false;
> > >
> > > -   if (stream->link->local_sink->edid_caps.allm)
> > > +   if (is_hdmi_allm_mode(stream))
> > >             return false;
> > >
> > >     return true;
> > > @@ -541,7 +573,7 @@ void mod_build_hf_vsif_infopacket(const struct dc=
_stream_state *stream,
> > >
> > >             info_packet->valid =3D false;
> > >
> > > -           allm =3D stream->link->local_sink->edid_caps.allm;
> > > +           allm =3D is_hdmi_allm_mode(stream);
> > >             format =3D stream->view_format =3D=3D VIEW_3D_FORMAT_NONE=
 ?
> > >                      TIMING_3D_FORMAT_NONE :
> > >                      stream->timing.timing_3d_format;
