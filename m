Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ID3PGbCgcGlyYgAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Wed, 21 Jan 2026 10:47:28 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 19A4254A50
	for <lists+dri-devel@lfdr.de>; Wed, 21 Jan 2026 10:47:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 226E310E738;
	Wed, 21 Jan 2026 09:47:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="TjMpg/Za";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-f173.google.com (mail-yw1-f173.google.com
 [209.85.128.173])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 56C5C10E737
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Jan 2026 09:47:24 +0000 (UTC)
Received: by mail-yw1-f173.google.com with SMTP id
 00721157ae682-78fc3572431so66677897b3.0
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Jan 2026 01:47:24 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1768988843; cv=none;
 d=google.com; s=arc-20240605;
 b=Ot1g+o2TRxECdrksmsQWRR5Siw1+aXrR9weo5LydbcJCP2cZL7JJy774/vedZiPkZV
 Do70lXxisVtjd+HKOXNvpt2JYtWOZeaJPyB5ndL3gkbe4+jgNh+j3OguHN2eCfGUP82o
 TUdrqNq6yZrWERJseTldiY+A2V4YxqEvtoFIrSlUtpB6yitk6QOsTyTevTL29H0KYAsL
 NzzCqhSQImNxHVvDKWxgj/iow58bN0pI0hhOLJwiVhHhl95i3V+TMExsXF+EaPlAgdgm
 eaZgG6KVWDz9p8+CkIT33hoOfDriOxsQtpwU3nxvpcSpq3jaHHQ6964+MKjTOCNFJ9C1
 6GOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=yzpzBhx+tgtelMf0JL+10tIUjjzmad8fmPtlVfu/TV4=;
 fh=haaLawcHIWdLgwqdN/YpBSXVGDUkUOjW4b7CpG3iRgI=;
 b=iPFCCjb8vnYK6jVjP+0PIJazn3u4Q+3w4H1iedPYMM7kJVz8PG/wG29VRgvoNtR5Fb
 LShG2fwofgoCZeIlDtxNvHAXOkSmMulcJNM0J4rdAq/hDuuIZnE4Kl2cXwb5le+JhUe7
 qR6yAqfdJeLP14Zjuf3LRR5slUI5fg4DZRBTGiUAh8CmfT9lJ2WsFZ2upN1luzKsSyae
 O8wWIY6T2yNwOWss9JTLeTl13d3svHLOgrSj6FD/ySEoloRrlV0L/rUuWKFjWMN7vMlp
 81Ux1Ke59660MT/l7W9T9OnMXczrcCWqZPXyJegxvVVuWcnxeTCPeBEElpYJOe6fa7Wb
 3Fqg==; darn=lists.freedesktop.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1768988843; x=1769593643; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=yzpzBhx+tgtelMf0JL+10tIUjjzmad8fmPtlVfu/TV4=;
 b=TjMpg/Za5HAEUaUu1aO/X6pciZLMNmtYrcjFJSp9UPBYlbg65pDlCjJikJEdzPFIh0
 4lwWyOLf4/wGwHkhtHIplWvfd5RbV6tHFqpuuP9fN3RpzFkojLuE/Ybk6qWblt9PNpI4
 SY6OphqCBQu8yqt6pNDpnl3PsjOQwP9X8aEpZ4OqgfcEK8FJ8r1zzfj1MUsbh3N3w4qR
 KDSG5nxgcwlYNlNndl9MepByHc17ni8EVEwpnfzbLAM+cO9xKTD5NdisgudR6aKd4LOg
 kcFkZqIyWDzFwn3G6SfKpvsZX6lVhe3XOlW41zl2bEFplaZR6ZrLjLkbakKN6aPjmZrR
 YZ8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768988843; x=1769593643;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=yzpzBhx+tgtelMf0JL+10tIUjjzmad8fmPtlVfu/TV4=;
 b=AcK6RP0Q7K7C3226alwnAsowZr9qLvoSKmrWzaa8tBzAJ1M28RxPMRSsMItomFwA63
 5T2ladi+C8H7S0GjBFcru98G3Y1tVwPd3uI+eOhePW5MyTunzaYRc6H5aIrTZZ0+TuDN
 S2jGcdzl34mQR3LbAfuB4+S9AjADuVe610VxLQsGT1gGiU+OZ/jtegxudvJPYPxL2j2F
 M6Ol9HzYgZgW+5jZ8ToUfpmjLh3BIpKdKgYHiY19wNxyJn0MDFlMGQHNY7begHAJCS27
 Ck9cHCb0Gd9nUNAPljsLbRWIxmIwvG/KaV1WQJWkQ5KuS8j7ym8qah5URBlFI/ZgbR7B
 8AQw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVRhsJu08RGSsuEPzLhqYX4MxL5wrRUhsKeru4CcmWgDTf9qoGJ2mANk6xF2XWltxGpHQmnoAzvT+U=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzgypO3+wnuzTfpYRNsojRXKHxlP2PSt1MXFkFMeOE60T8xBj4f
 /RSs7ofxtVcEsAVMfqkzbdm//xY2MdsKY/KmZZ/9vMwwz4x/UGJ7E7eTGpJ2Wb4d90M9ie6mWyw
 nLEAit52uoDpN+u8eTR81CZ8BCO4yS30BZiKKICoqXg==
X-Gm-Gg: AZuq6aICp/SRF6YMK4XLhxRLT379CYbmH9OVxozaL26GsW+yo9xi8mFl5v9BmH/GV+J
 SiiCLdYv2kvpPkCtGOzJk7dYldoTbQV5AMywz6DC6PmGpMQ2YkV87Ct6qcu9hs33fquO6X6J5Xk
 0PTKNNq6AOfBNIxzz9ioFk6UG6b6w/Dca4ujaK+NbwCDCHmlDnnGjHs7pkpPp7NEV+B/nomlGN1
 8R3y7/sBHm+27qvIyMJcV0MupS6TmcbnVGglw5UUX3mWYxkvkvzefOdwNB8QRjGt576J6E=
X-Received: by 2002:a05:690e:4084:b0:640:b8ef:b777 with SMTP id
 956f58d0204a3-6493c855d73mr3562332d50.69.1768988843214; Wed, 21 Jan 2026
 01:47:23 -0800 (PST)
MIME-Version: 1.0
References: <20260121-msm-next-quad-pipe-split-v17-0-6eb6d8675ca2@linaro.org>
 <20260121-msm-next-quad-pipe-split-v17-1-6eb6d8675ca2@linaro.org>
 <6ymh64lnipo5pncnrlipbb6zl5xyxxnaqieg52hrylmknqumyj@ovaspuihqzy6>
In-Reply-To: <6ymh64lnipo5pncnrlipbb6zl5xyxxnaqieg52hrylmknqumyj@ovaspuihqzy6>
From: Jun Nie <jun.nie@linaro.org>
Date: Wed, 21 Jan 2026 17:47:12 +0800
X-Gm-Features: AZwV_QjNYOBELD3O1oGAJpYM1DqkSzjERA88OueFZGWPOmcvrGSqTlahCkJyR1E
Message-ID: <CABymUCOSNtWoNRAxTheqkLxJM8kWYwQoR7=HJdKdsJwfC9NVLg@mail.gmail.com>
Subject: Re: [PATCH v17 1/4] drm/msm/dpu: Extract plane splitting into a
 dedicated function
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Abhinav Kumar <abhinav.kumar@linux.dev>,
 Dmitry Baryshkov <lumag@kernel.org>, 
 Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Clark <robin.clark@oss.qualcomm.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, 
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
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
X-Spamd-Result: default: False [-2.31 / 15.00];
	ARC_ALLOW(-1.00)[google.com:s=arc-20240605:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:dmitry.baryshkov@oss.qualcomm.com,m:abhinav.kumar@linux.dev,m:lumag@kernel.org,m:sean@poorly.run,m:marijn.suijten@somainline.org,m:airlied@gmail.com,m:simona@ffwll.ch,m:robin.clark@oss.qualcomm.com,m:neil.armstrong@linaro.org,m:linux-arm-msm@vger.kernel.org,m:freedreno@lists.freedesktop.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[3];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[jun.nie@linaro.org,dri-devel-bounces@lists.freedesktop.org];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[linaro.org:+];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jun.nie@linaro.org,dri-devel-bounces@lists.freedesktop.org];
	FREEMAIL_CC(0.00)[linux.dev,kernel.org,poorly.run,somainline.org,gmail.com,ffwll.ch,oss.qualcomm.com,linaro.org,vger.kernel.org,lists.freedesktop.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,linaro.org:email,linaro.org:dkim,gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo]
X-Rspamd-Queue-Id: 19A4254A50
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com> =E4=BA=8E2026=E5=B9=B4=
1=E6=9C=8821=E6=97=A5=E5=91=A8=E4=B8=89 17:29=E5=86=99=E9=81=93=EF=BC=9A
>
> On Wed, Jan 21, 2026 at 04:01:50PM +0800, Jun Nie wrote:
> > dpu_plane_atomic_check_nosspp() currently handles both plane
> > validation and plane splitting. For better simplicity and to
> > facilitate future refactoring, move the splitting logic into
> > its own dedicated function.
> >
> > Signed-off-by: Jun Nie <jun.nie@linaro.org>
> > ---
> >  drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c | 51 ++++++++++++++++++++++-=
--------
> >  1 file changed, 36 insertions(+), 15 deletions(-)
> >
> > @@ -879,6 +866,34 @@ static int dpu_plane_atomic_check_nosspp(struct dr=
m_plane *plane,
> >               if (pstate->layout.plane_pitch[i] > DPU_SSPP_MAX_PITCH_SI=
ZE)
> >                       return -E2BIG;
> >
> > +     pstate->needs_qos_remap =3D drm_atomic_crtc_needs_modeset(crtc_st=
ate);
> > +
> > +     return 0;
> > +}
> > +
> > +static int dpu_plane_split(struct drm_plane *plane,
> > +                        struct drm_plane_state *new_plane_state,
> > +                        const struct drm_crtc_state *crtc_state)
> > +{
> > +     struct dpu_plane *pdpu =3D to_dpu_plane(plane);
> > +     struct dpu_kms *kms =3D _dpu_plane_get_kms(&pdpu->base);
> > +     u64 max_mdp_clk_rate =3D kms->perf.max_core_clk_rate;
> > +     struct dpu_plane_state *pstate =3D to_dpu_plane_state(new_plane_s=
tate);
> > +     struct dpu_sw_pipe_cfg *pipe_cfg;
> > +     struct dpu_sw_pipe_cfg *r_pipe_cfg;
> > +     uint32_t max_linewidth;
> > +
> > +     if (!new_plane_state->visible)
> > +             return 0;
> > +
> > +     /* move the assignment here, to ease handling to another pairs la=
ter */
> > +     pipe_cfg =3D &pstate->pipe_cfg[0];
> > +     r_pipe_cfg =3D &pstate->pipe_cfg[1];
> > +     /* state->src is 16.16, src_rect is not */
> > +     drm_rect_fp_to_int(&pipe_cfg->src_rect, &new_plane_state->src);
> > +
> > +     pipe_cfg->dst_rect =3D new_plane_state->dst;
> > +
> >       max_linewidth =3D pdpu->catalog->caps->max_linewidth;
> >
> >       drm_rect_rotate(&pipe_cfg->src_rect,
> > @@ -910,8 +925,6 @@ static int dpu_plane_atomic_check_nosspp(struct drm=
_plane *plane,
> >                                   new_plane_state->fb->width, new_plane=
_state->fb->height,
> >                                   new_plane_state->rotation);
> >
> > -     pstate->needs_qos_remap =3D drm_atomic_crtc_needs_modeset(crtc_st=
ate);
> > -
> >       return 0;
> >  }
> >
> > @@ -1129,6 +1142,10 @@ static int dpu_plane_atomic_check(struct drm_pla=
ne *plane,
> >       if (ret)
> >               return ret;
> >
> > +     ret =3D dpu_plane_split(plane, new_plane_state, crtc_state);
> > +     if (ret)
> > +             return ret;
> > +
> >       if (!new_plane_state->visible)
> >               return 0;
> >
> > @@ -1169,6 +1186,10 @@ static int dpu_plane_virtual_atomic_check(struct=
 drm_plane *plane,
> >       if (ret)
> >               return ret;
> >
> > +     ret =3D dpu_plane_split(plane, plane_state, crtc_state);
> > +     if (ret)
> > +             return ret;
>
> Why can't it be moved after !visible check? It's the first check in the
> function code.

Surely it can be moved after !visible check and it is a better place. Placi=
ng
 it just after dpu_plane_atomic_check_nosspp() is because
it is splitted from it. And it does not matter actually, because
dpu_plane_split() is moved to the deferred part
dpu_plane_virtual_assign_resources()
in the later patch. So that topology information is ready at that stage.

>
> > +
> >       if (!plane_state->visible) {
> >               /*
> >                * resources are freed by dpu_crtc_assign_plane_resources=
(),
> >
> > --
> > 2.43.0
> >
>
> --
> With best wishes
> Dmitry
