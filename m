Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yI96Mq25c2n/yAAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Fri, 23 Jan 2026 19:10:53 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 020E479673
	for <lists+dri-devel@lfdr.de>; Fri, 23 Jan 2026 19:10:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4DFAC10EB99;
	Fri, 23 Jan 2026 18:10:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="jIxez7JS";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-dl1-f49.google.com (mail-dl1-f49.google.com [74.125.82.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E270610EB99
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Jan 2026 18:10:49 +0000 (UTC)
Received: by mail-dl1-f49.google.com with SMTP id
 a92af1059eb24-1232c98f98cso195469c88.3
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Jan 2026 10:10:49 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769191849; cv=none;
 d=google.com; s=arc-20240605;
 b=IFp/bpFWw8UjXXhTurbhjZUGGXZWVgvonsSm0B7gHTQrxM9ywjZOYnOBglwNbBH9ez
 yC0qPrgSsxC5VcEW0DgaimPQXXhVj/f7TatKDdqfrq3ml494HabAJVOOASlX3p1M58aZ
 6a1QhNnIpTiwZ1EzcPVPOb0LMhhsRo+cfa/Ixm3rgcFzR24Y+Us/LM19M81rlWEp0hrY
 sRK/o62xlYD+KLCdfgRp/u6lhqYk+tjPCmfXd9YLjLpDvjwSbrCbnTZyWOvElzIZ98Fm
 mbjc2tCO8S/qJeiCav19hAaiXAkvOrLt51By3BwcWtbWuKzhNEzla7HqXzsV4Wtd0wUU
 NmjA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=vaql0l49gV5B3V4JT/iqzY3yELhQQb2U1YohoLxMebQ=;
 fh=W9yuUQLqLUXgUfllgFRCxqijmbAikA9tzhq7vH22PNA=;
 b=lYUJilCe6qFvPu/Nh6HV33d8gAEwlMyRgqR9aBsqcH07Zzc7ACWfX9RLoHcX1d6lUZ
 kf1qlzV1Uc0auWnMdwy6JeygrdUFKuS2slspzX824v5dQYGOiW41kWlxWmz37TLP9G0l
 ZDSHUWZRHsQ47Gqn4OG1tR24CgzwhPH8urmw507SkBPTmAi/+TIkLjopj+IENntVNBR9
 ZhQg7l3IMx7kYdO4l06ZmE/OE95LFwDPqjOW56dG+Bq7FPcHqkO41moC1NIgQtLFio3q
 u83Izci12/EHlvfgMgtFpdSLooDnDbob6YE0dyfP2Ipabzpvo6SC/CFKgYxl9T/+gN3g
 lr1w==; darn=lists.freedesktop.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1769191849; x=1769796649; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=vaql0l49gV5B3V4JT/iqzY3yELhQQb2U1YohoLxMebQ=;
 b=jIxez7JShwW+m51ZWjy5TRcEWARNHUtnBTvPiWJZf1XpCPuDWz0k6DQMrQNEPgxQ5I
 QNp0u//6+gOd3NW1sfw0JI/vCkXkmJVvN2sfNS1mLOM/B6N0hfwHvYWkrpWSZCdlARpr
 4SD0GA7QZS+oZ93r04U5mHVqi2vna3VWSHnlENd3WGYv+S7OlKD0G023KVoGc4UgSxnm
 5TiaJaTnSafctoYEXt+F1Yt6HCYIyCyw8/tsyPfAKXgfznWwD9XyOtNaITz46wtjVS48
 ZmGpGCSjFqkJ1gGImLbwQCGHn5dYHqUHU0nHdWxv37dP64mlmXQO22DvIpWrB6QreRR5
 yzxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1769191849; x=1769796649;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=vaql0l49gV5B3V4JT/iqzY3yELhQQb2U1YohoLxMebQ=;
 b=mT+JV9SCtMwTOrnpP2qhp50LG+DgH0d9ZGRO7MWyQ2zGAKBODdr6Y/3MXPjP83FZCi
 sbupT+0BCInapyETUhPHAFiLxUxCb8cH8jywLp8IibvbqrOeeJRn/gr0gwpEFmI1p/Ep
 aLaNiEma6fTOMGEaAE4ZcCIxYXAbam8Cwk2x+96T8Rj7YEpfuOwcZoM6kPqKKSWIxpY/
 BUBAmOY4f3QgVQTq187ma7x1JobtcFLmMXE3PpZVxbMzWUztknc0JJZRQp9QL7bOyoa4
 MkP82SmIGQ/F2RjRaQ6mNWRq4SjqWNSB0mWobqGgO9u86QZb2lSpL5vXeQPKRUXyAARO
 bDvA==
X-Gm-Message-State: AOJu0YwUDFYvQgPsTsaK/HWHqbmK7vMqOupioB9ZzQCneKSJ8yz9nFz4
 i/yx7Z4fSPuj8Cp1i5D/Pt8RcMRLa2DR9GZNTZP8GJeh9a+uw7E7viTR9didAfYhxHy8bw8nug7
 oEi5YMRXCLvMlifmspKBXiN3DQaN0ZKw=
X-Gm-Gg: AZuq6aLFV9VBnnB4dXperM3RJI825ZgKXsJVw59GypUAM0rVl6xwYAvm3jDN10j9zWM
 7/2XrFbP7oOxcJGJsGnFgRrH+nIM0w6BIp9Ks/7BKQkr16H7ya1ro89kCy2fnHKA5XsnTpPxqKD
 nql+/00Xezwo4fyE6OG+eUZTsvC14Ghgm6zegWnz41J4Ewk4JIZaEOLUnGE+jx5iA0113TUskM7
 rZZTbJ/GoetRStMgHClFdRb7KtP3/XckX8yCIHHzuCUc/Y2lPLfXFjcGlKev5y33ihY+lAxOdJi
 W7P1CJk=
X-Received: by 2002:a05:7300:cacd:b0:2b0:2e6:5363 with SMTP id
 5a478bee46e88-2b7399655a8mr953398eec.1.1769191849082; Fri, 23 Jan 2026
 10:10:49 -0800 (PST)
MIME-Version: 1.0
References: <20260123000537.2450496-1-someguy@effective-light.com>
 <20260123000537.2450496-2-someguy@effective-light.com>
 <CADnq5_O8guOxzHyEUn_x6pjrPG2xm_OgJWTCzvhzDYa-POtnoQ@mail.gmail.com>
In-Reply-To: <CADnq5_O8guOxzHyEUn_x6pjrPG2xm_OgJWTCzvhzDYa-POtnoQ@mail.gmail.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Fri, 23 Jan 2026 13:10:37 -0500
X-Gm-Features: AZwV_QgQRN19iCQrWPjdU_Avp2WR-crzHPu89EmRHBYdFvjLqKX-xaKce67lmH0
Message-ID: <CADnq5_O2nvAEPm654aD1g5EQDfHOpE82N1wLVtCBxveWyiHB1w@mail.gmail.com>
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
	NEURAL_HAM(-0.00)[-0.990];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[alexdeucher@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	FREEMAIL_CC(0.00)[lists.freedesktop.org,amd.com,gmail.com,ffwll.ch,igalia.com,linux.intel.com,kernel.org,suse.de,redhat.com,vger.kernel.org];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,mail.gmail.com:mid]
X-Rspamd-Queue-Id: 020E479673
X-Rspamd-Action: no action

On Fri, Jan 23, 2026 at 12:49=E2=80=AFPM Alex Deucher <alexdeucher@gmail.co=
m> wrote:
>
> On Fri, Jan 23, 2026 at 3:37=E2=80=AFAM Hamza Mahfooz
> <someguy@effective-light.com> wrote:
> >
> > We now have a means to respond to page flip timeouts. So, hook up
> > support for the new page_flip_timeout() callback.
> >
> > Signed-off-by: Hamza Mahfooz <someguy@effective-light.com>
> > ---
> > Hi,
> >
> > I have tested this on 7940HS system and it appears even a MODE2 reset
> > will reset display firmware, so I don't think we need to force a full
> > reset here.
> > ---
> >  drivers/gpu/drm/amd/amdgpu/amdgpu_reset.c      |  2 ++
> >  drivers/gpu/drm/amd/amdgpu/amdgpu_reset.h      |  1 +
> >  .../drm/amd/display/amdgpu_dm/amdgpu_dm_crtc.c | 18 ++++++++++++++++++
> >  3 files changed, 21 insertions(+)
> >
> > diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_reset.c b/drivers/gpu/dr=
m/amd/amdgpu/amdgpu_reset.c
> > index 28c4ad62f50e..bd63f0345984 100644
> > --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_reset.c
> > +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_reset.c
> > @@ -343,6 +343,8 @@ void amdgpu_reset_get_desc(struct amdgpu_reset_cont=
ext *rst_ctxt, char *buf,
> >         case AMDGPU_RESET_SRC_USERQ:
> >                 strscpy(buf, "user queue trigger", len);
> >                 break;
> > +       case AMDGPU_RESET_SRC_DISPLAY:
> > +               strscpy(buf, "display hang", len);
> >         default:
> >                 strscpy(buf, "unknown", len);
> >         }
> > diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_reset.h b/drivers/gpu/dr=
m/amd/amdgpu/amdgpu_reset.h
> > index 07b4d37f1db6..53b577062b11 100644
> > --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_reset.h
> > +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_reset.h
> > @@ -44,6 +44,7 @@ enum AMDGPU_RESET_SRCS {
> >         AMDGPU_RESET_SRC_HWS,
> >         AMDGPU_RESET_SRC_USER,
> >         AMDGPU_RESET_SRC_USERQ,
> > +       AMDGPU_RESET_SRC_DISPLAY,
> >  };
> >
> >  struct amdgpu_reset_context {
> > diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_crtc.c b/d=
rivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_crtc.c
> > index 697e232acebf..2233e5b3b6a2 100644
> > --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_crtc.c
> > +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_crtc.c
> > @@ -28,6 +28,7 @@
> >
> >  #include "dc.h"
> >  #include "amdgpu.h"
> > +#include "amdgpu_reset.h"
> >  #include "amdgpu_dm_psr.h"
> >  #include "amdgpu_dm_replay.h"
> >  #include "amdgpu_dm_crtc.h"
> > @@ -578,12 +579,29 @@ amdgpu_dm_atomic_crtc_get_property(struct drm_crt=
c *crtc,
> >  }
> >  #endif
> >
> > +static void amdgpu_dm_crtc_handle_timeout(struct drm_crtc *crtc)
> > +{
> > +       struct amdgpu_device *adev =3D drm_to_adev(crtc->dev);
> > +       struct amdgpu_reset_context reset_context =3D {0};
> > +
> > +       if (amdgpu_device_should_recover_gpu(adev)) {
> > +               memset(&reset_context, 0, sizeof(reset_context));
> > +
> > +               reset_context.method =3D AMD_RESET_METHOD_NONE;
> > +               reset_context.reset_req_dev =3D adev;
> > +               reset_context.src =3D AMDGPU_RESET_SRC_DISPLAY;
> > +
> > +               amdgpu_device_gpu_recover(adev, NULL, &reset_context);
> > +       }
>
> Rather than resetting the whole GPU here, does just suspending and
> resuming DC help?  E.g., call dm_suspend() and dm_resume(), but force
> the reset path (the amdgpu_in_reset() case) in those functions.  If
> that works, that should help narrow down where the problem is.

Actually does just calling drm_crtc_send_vblank_event() for all of the
relevant crtcs at this point help?

Alex

>
> Alex
>
>
> > +}
> > +
> >  /* Implemented only the options currently available for the driver */
> >  static const struct drm_crtc_funcs amdgpu_dm_crtc_funcs =3D {
> >         .reset =3D amdgpu_dm_crtc_reset_state,
> >         .destroy =3D amdgpu_dm_crtc_destroy,
> >         .set_config =3D drm_atomic_helper_set_config,
> >         .page_flip =3D drm_atomic_helper_page_flip,
> > +       .page_flip_timeout =3D amdgpu_dm_crtc_handle_timeout,
> >         .atomic_duplicate_state =3D amdgpu_dm_crtc_duplicate_state,
> >         .atomic_destroy_state =3D amdgpu_dm_crtc_destroy_state,
> >         .set_crc_source =3D amdgpu_dm_crtc_set_crc_source,
> > --
> > 2.52.0
> >
