Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0BmEKJBOkGnUYQEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Sat, 14 Feb 2026 11:29:36 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 551DE13BAD3
	for <lists+dri-devel@lfdr.de>; Sat, 14 Feb 2026 11:29:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 578AD10E288;
	Sat, 14 Feb 2026 10:29:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="zZbCleZI";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yx1-f44.google.com (mail-yx1-f44.google.com
 [74.125.224.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6F5CD10E242
 for <dri-devel@lists.freedesktop.org>; Sat, 14 Feb 2026 10:29:32 +0000 (UTC)
Received: by mail-yx1-f44.google.com with SMTP id
 956f58d0204a3-64acd19e1dfso1660658d50.0
 for <dri-devel@lists.freedesktop.org>; Sat, 14 Feb 2026 02:29:32 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1771064971; cv=none;
 d=google.com; s=arc-20240605;
 b=UUKgr6I0Lu2CqQ1GS18iFBCnV0QpMUc6X89mnaxuG5nZgBBAFZk5Us1yGQkdpj+rvM
 Bq55Eo7Z0/HtynbJhiwSpdpN1B8OAyn+GHoMBc0JtdDrMeRIoc6qoBLpgCC50hEjWkr9
 zp3//BxnIveTTs+GxvU6D+4/9j9smFe5NN0oOBdV2LUlXVTrqyeuBACsDmzPqc8fBfDc
 vAm7KUZgoQroZOwfNnDtFDkfFPYc4vyx8A4wSpXG/ym8YIYJEX3gCQzlFIWrxVB/7J9E
 lm8bPtU/k652tRvU21XmhNxHFXcF5H4CPdCBXhTWmQB/7ydvOnOKSH3qe5UBcqKWKxkp
 HjSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=gcmTHiPmRVpe2FcnwvwiyGljW5AeBLZNUuFg0iLgKKU=;
 fh=lmCug1T2Hd5X5TcZwg1HBCoa0+/biwMQRcZnMsTtJiM=;
 b=M1HzRl7xtwl+qrr3tdi0whtLcAKcN6Zzl0QZbcpTULzlqaBe0rIYQmFRT8t6rd26WZ
 EEqDID7w8uu+us3gkU1v5Yrjvpha4/qP+qiz8dsN9oCajs1nFTZbVhTNgrzmOo6C7eXW
 XTWoDJ8Tcowf0wNe660Teof+uzUYxWiGM+4aHuGSnq73JPcWcj2siYwM+jOMMFTm2/ju
 nZhrF9VrIjQ/so1R0ZJW/wwY1wbxypIR1iJS5E9lOSPMBiNKsixu3cTwY8qpDQHe7MlE
 iITHXC2tmBaEcWr/KUvR7ho9RsG2cjwS6VuF13+3DLGRONv8BGDmiHcVdiWDRRkVZHap
 xXww==; darn=lists.freedesktop.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1771064971; x=1771669771; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=gcmTHiPmRVpe2FcnwvwiyGljW5AeBLZNUuFg0iLgKKU=;
 b=zZbCleZIF0Wvga9rRfBnGaXjjCpHJegfSxRxv3Q+9X1KAdS7huq5O6guxoScN/Vfla
 H0XqbkiViC6zsJn5/cAstik/nsCMgFZQuJTPXPJ0qESLmbPGPg8Re+e7LH5ML3D291Xj
 2evTDQ7dzhkVG6Up/plcRCq1VJg130EDE3JyLBUgvPF+lYb6ve5hAFoqurNqqcPKhDVo
 cgIIygDz/Vtm6R55kHyNq2PT8vSUptLVzocgTo59esPbAan0n55p+0HzWvoSg4xROI9O
 7TDhPyJuCJG5R0hyxIEytUTW9At5I7vLgn4mYe0rRlCRfJAtaIUOCmm2EwDKKkIEFBl5
 am2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1771064971; x=1771669771;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=gcmTHiPmRVpe2FcnwvwiyGljW5AeBLZNUuFg0iLgKKU=;
 b=INjOtGneVjSpHuhgExs0OZjfs+zI4Cw7rb8TPYCK63zPP0ZYBn7SLkYoumUtVs6l1B
 BASkH7kDt5ZaYyz+FfUNCygLXXPKu2nKazDdrbRHhQz3t9WMCFvmxtrMMvlWbnA6X2p8
 41QttpTSMxYu5eNknbsEkHh5Eo+ZneErIyj/9bAsFYMIFMYiK0JpyMsh+024X6kO0hHB
 MC4EHz3QzV4avpXETxEronC7MyFkU6p6OnLCLnzaVcivwkHNm8b4xWyMl5Pc7AU5lEe5
 PJTfFGu3iXpk7yph8lIXxeSYbh8S8Yv5zhJLzcRi1rmDazw8APKCsJp/JY38PPd7fEO3
 Z8lg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVFh1na8K7AVcNOx3VhSbtxZYEj671BMzSBaxZMei8UH1Mp5TfyUjoZ5pPqX5eq+rbTnDTvVbcDZyI=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzESjXeX3rG3qt5TTB+OnJ7Hog1Hd9PzZtEX55fkjQA+YU/sl6s
 B5/yYrYp6WCAJaWL/XE3XQ+PIJmUlmwGpxdK2yPpTdwwNhsOqj3VXdSkAJMSJQ5VKwqp/3GbavQ
 vLXHP1JhrlIWe0xJge6brYoMElW/cJM+3Jy47NTyJ8w==
X-Gm-Gg: AZuq6aLcQIZZr8hjt4zkiOhgdeCyX7G2FPU2uw5LTPLGv3iu+DYNALdxCtx3elV6KSP
 Xx7hVnZ4fdxMtMexc/A4bJjNDaTCd9DRkK3SArxj7s88LdfSFXp0K/VbtJlIy1HU8cMz5df5wzj
 N0GUFDmEmLHmqfeWRIzHaV1jtGt6z8pWcrnoRIH0m4y9GX92KXGw297TlyNL/CdAtAunkcIASxT
 mkpYzgrTI3XlzMQdn6BbH4Vy0sRX9XHVlZyBi+Jkpc1YSrPHV5q81Wo37Pfm41A7v/ixTnwthDm
 AThzQkiPaSixwg==
X-Received: by 2002:a05:690e:1409:b0:643:1ef1:9613 with SMTP id
 956f58d0204a3-64c1979b6d8mr4149787d50.15.1771064971290; Sat, 14 Feb 2026
 02:29:31 -0800 (PST)
MIME-Version: 1.0
References: <20260213-msm-next-quad-pipe-split-v18-0-5815158d3635@linaro.org>
 <20260213-msm-next-quad-pipe-split-v18-1-5815158d3635@linaro.org>
 <jbd4snirozad7u673dofl34xhpulybbmsyibijohecazhov6gc@5k2xqea6ofci>
In-Reply-To: <jbd4snirozad7u673dofl34xhpulybbmsyibijohecazhov6gc@5k2xqea6ofci>
From: Jun Nie <jun.nie@linaro.org>
Date: Sat, 14 Feb 2026 18:29:20 +0800
X-Gm-Features: AZwV_QgDlwmO9K_rYUkz2DZ3LGWafQXwiCWr_9F3NtQWs4yIhGJxH2WUyeofRHM
Message-ID: <CABymUCM58jptRgqXfMJUOyRU7KK3aWdpZRQ73Q9QzhBDdKJamw@mail.gmail.com>
Subject: Re: [PATCH v18 1/4] drm/msm/dpu: Extract plane splitting into a
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
X-Rspamd-Server: lfdr
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,qualcomm.com:email]
X-Rspamd-Queue-Id: 551DE13BAD3
X-Rspamd-Action: no action

Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com> =E4=BA=8E2026=E5=B9=B4=
2=E6=9C=8814=E6=97=A5=E5=91=A8=E5=85=AD 00:53=E5=86=99=E9=81=93=EF=BC=9A
>
> On Fri, Feb 13, 2026 at 10:54:25PM +0800, Jun Nie wrote:
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
>
> Wait... This still isn't improved. The dpu_plane_split() function should
> not be called if the plane is not visible. Move it after the check.
>
> Yes, it is currently a part of the code which is called before the
> check. But there is no need to keep that.

OK, will revise it. Thanks!

>
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
