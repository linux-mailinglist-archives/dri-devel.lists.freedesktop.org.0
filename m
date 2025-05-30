Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B068AAC92C0
	for <lists+dri-devel@lfdr.de>; Fri, 30 May 2025 17:54:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 181CA10E158;
	Fri, 30 May 2025 15:54:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="b3go5w+Q";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 40F0910E157
 for <dri-devel@lists.freedesktop.org>; Fri, 30 May 2025 15:54:54 +0000 (UTC)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54U9xGvY008042
 for <dri-devel@lists.freedesktop.org>; Fri, 30 May 2025 15:54:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 X4ENBxC2u4diVPd7lfc4+FXoOF/Vd8re4YvniFacYdk=; b=b3go5w+Qh4TAyf22
 NxihhNODaswOwXXMylPCo1bq1E0Hoxm6+1KLMp8I/QgrYCRQ1TNEO1ZJ2x1omnkM
 jlEF3kKfESUR6cxbeENV5PdC9xMo13fJkMyDL2KGjhQhrtzcrdk0A+QoJS8WJGd1
 6QKOQWMZ/ckS1RASsj81+nxcOouiqYom/ldQNPIBaO+XAH329pcfWj0ZaFyCbIVU
 cS++4lCwEiI3IHYoKHl8PROipLS+wBoKmO1U/RHbHSqNzSIpoGmcRzcz2I2W9PpZ
 skjc2VtBaQU8GjAFiajRoVQwJgtKRVJ/iE+vG4M0u/9ZM8SAhvVvymh+aqu4yZ8r
 fOoKxg==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46whufa316-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Fri, 30 May 2025 15:54:53 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id
 d75a77b69052e-476a44cec4cso28308581cf.2
 for <dri-devel@lists.freedesktop.org>; Fri, 30 May 2025 08:54:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1748620492; x=1749225292;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=X4ENBxC2u4diVPd7lfc4+FXoOF/Vd8re4YvniFacYdk=;
 b=F7MXukQYI1nfmpg5aAvsSdEywK263cwVs0JEUsuSoo8TOMytpTNn7b7aEXndjLGsb2
 07/hn73qNPnAfGS5NGu29jRgOEVxpkOY4DL5nwWbCHGjzqv7h/bcN1/tPNrFp6tZjkhD
 5WUL4yC4h/PdZyjcVRC/IDJIoQCYE9zFO4dyCR29eYwWCgtHozmBlsWsyq+uvIAsrBVV
 LIHloROV6W9RfKcuR8YnubM3/K83k14q7eh9COOI4cU6qaI9m7oImmtVMpZBPSmhIr8j
 0svBkRIBJWTz5DfrjHG7c3ia7Oo+tJjHkAw3XSG6ubzaZW/vCmIWlo8ispwSTq6s/FZl
 +pbA==
X-Forwarded-Encrypted: i=1;
 AJvYcCV7ZR4OEmp4bI01yCBfrcVCd4yHVXMXtIJ1+pvWsIDgK8zruxZtAH02DPWd9xnFvZ8gjc6imxVVNlI=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwrpsVuyvyHbtE/IpU1uDXJfwVKhqqPOdQcAJQd+x5F6a5QWDxN
 QMS7NJ8iACIZ1CnhWPjpt7Ar7+ZAvoiRyivxukR506XYQwDVpoDGRJubCaZNy3tBHQMGpHTnLnr
 zYSsXPtXpQhqt0m1JW/PhzbuDqEQS/C5EC5z+Y6YKaJE0e19XKpr4PPMbni5dNGoE1Cei83c5yP
 /mORVyTZ0cCulLWuFPjF996JGADqvsjQlSK9HkDoXW8KxhVSaY0QiNdA==
X-Gm-Gg: ASbGnctFVIaVfW2OVkI35vex0wiV5jqnpFI9EVk1AHI78Rn9hoFG6eYQ85YL5qUqM3s
 JUPz6117BULaFHRciwU4UYOAPXjmueOlp5rc6eEUyZtGe26kjv5gp1XHCngpmiJd/bYJ+9BkWlJ
 5iteEMfIusRPN3UNINfYsH44i5kHljqqMDjoXC
X-Received: by 2002:a05:622a:4816:b0:490:8cc3:d111 with SMTP id
 d75a77b69052e-4a4400549c0mr73198311cf.27.1748620491891; 
 Fri, 30 May 2025 08:54:51 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFoKXsQKc9vz7c/69hZ892/jQ0A3mCfTEOA3YGsz+LBY2eCQelClQXwXgQV22H4VZ1SrmLjAX7p3EeMPH25o54=
X-Received: by 2002:a17:90b:17cb:b0:311:ad7f:329f with SMTP id
 98e67ed59e1d1-31241a8050cmr5125743a91.31.1748620480611; Fri, 30 May 2025
 08:54:40 -0700 (PDT)
MIME-Version: 1.0
References: <20250526-v6-15-quad-pipe-upstream-v10-0-5fed4f8897c4@linaro.org>
 <20250526-v6-15-quad-pipe-upstream-v10-10-5fed4f8897c4@linaro.org>
 <45hk22fdghaqnilukvqayjcbnf3btntknqrwf5ivx346vrgag3@aebzt76tkjzw>
 <CABymUCNuYDjmytbb+HLg1KF5eOyQVNczcq_wqFdo51cr0Y6BdQ@mail.gmail.com>
In-Reply-To: <CABymUCNuYDjmytbb+HLg1KF5eOyQVNczcq_wqFdo51cr0Y6BdQ@mail.gmail.com>
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Fri, 30 May 2025 18:54:29 +0300
X-Gm-Features: AX0GCFti6M5M305KtZRmPulPOdtjGChqY7dKpQLOJRYbcxrJZz16Fw4PnmbLHtU
Message-ID: <CAO9ioeUS5Oq1Ka9uh1idourTNsfp5bg4TcVWSMV_rkByy+e9Yg@mail.gmail.com>
Subject: Re: [PATCH v10 10/12] drm/msm/dpu: support SSPP assignment for
 quad-pipe case
To: Jun Nie <jun.nie@linaro.org>
Cc: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Jessica Zhang <quic_jesszhan@quicinc.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Authority-Analysis: v=2.4 cv=OslPyz/t c=1 sm=1 tr=0 ts=6839d4cd cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10
 a=sWKEhP36mHoA:10 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=99vq82EtyZOdbYV9uHAA:9
 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: 60KoXy515QBmTT2KSLderZxcFlMvUUdF
X-Proofpoint-GUID: 60KoXy515QBmTT2KSLderZxcFlMvUUdF
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTMwMDE0MCBTYWx0ZWRfX9+RkMpFZBYgv
 N08MSWybG8YpFWNQ4Vkckh4xgIneAPB0Ou3vsQyk1LX2lfijwkkZZnoAzCKPL0vMQGXZccUp1pu
 botGVdQAcbbS8ceFttJfJwS2yyHtO/B47U5H2VHOvmKcHs8+uAeP2AM/rGdLHwk9ZPHDIZgXnNi
 /2UHtGmxojNoceLJmgqT660WcIeC7kxbdKMgriyYogjCRYdoNZyyQLHKmnpdyQ5vI5wdEg3MPfR
 Fyxvh8D5iJCivWOyIXDf94JzEMgEGzUIDcr9sOpwW6ocFvpKdqzj7im1bZTG1/7JSEFinxtS6rk
 olXTBkQqeOgSqAGNkPhFgUL+0AtEwdeyalVQDJF2hbKyDjFRY0iJYr/iA2/VsXwJR217G4JPtNA
 9oXxjL6z7boJeNTXKnmrJk2QwdeURLNkSkDM5VL39k7tmtwNyXceHlZEE9F0BWWGWVT3EiOl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-30_07,2025-05-30_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 mlxlogscore=999 adultscore=0 malwarescore=0
 bulkscore=0 priorityscore=1501 clxscore=1015 mlxscore=0 lowpriorityscore=0
 spamscore=0 suspectscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505160000
 definitions=main-2505300140
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

On Fri, 30 May 2025 at 17:59, Jun Nie <jun.nie@linaro.org> wrote:
>
> Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com> =E4=BA=8E2025=E5=B9=
=B45=E6=9C=8829=E6=97=A5=E5=91=A8=E5=9B=9B 02:22=E5=86=99=E9=81=93=EF=BC=9A
> >
> > On Mon, May 26, 2025 at 05:28:28PM +0800, Jun Nie wrote:
> > > Currently, SSPPs are assigned to a maximum of two pipes. However,
> > > quad-pipe usage scenarios require four pipes and involve configuring
> > > two stages. In quad-pipe case, the first two pipes share a set of
> > > mixer configurations and enable multi-rect mode when certain
> > > conditions are met. The same applies to the subsequent two pipes.
> > >
> > > Assign SSPPs to the pipes in each stage using a unified method and
> > > to loop the stages accordingly.
> > >
> > > Signed-off-by: Jun Nie <jun.nie@linaro.org>
> > > ---
> > >  drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c  |  11 +++
> > >  drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.h  |   2 +
> > >  drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c | 126 ++++++++++++++++++--=
----------
> > >  3 files changed, 88 insertions(+), 51 deletions(-)
> > >
> > > diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c b/drivers/gpu/d=
rm/msm/disp/dpu1/dpu_crtc.c
> > > index 85f585206218f4578e18b00452762dbada060e9c..47ab43dfec76acc058fb2=
75d1928603e8e8e7fc6 100644
> > > --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> > > +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> > > @@ -1562,6 +1562,17 @@ int dpu_crtc_vblank(struct drm_crtc *crtc, boo=
l en)
> > >       return 0;
> > >  }
> > >
> > > +/**
> > > + * dpu_crtc_get_num_lm - Get mixer number in this CRTC pipeline
> > > + * @state: Pointer to drm crtc state object
> > > + */
> > > +unsigned int dpu_crtc_get_num_lm(const struct drm_crtc_state *state)
> > > +{
> > > +     struct dpu_crtc_state *cstate =3D to_dpu_crtc_state(state);
> > > +
> > > +     return cstate->num_mixers;
> > > +}
> > > +
> > >  #ifdef CONFIG_DEBUG_FS
> > >  static int _dpu_debugfs_status_show(struct seq_file *s, void *data)
> > >  {
> > > diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.h b/drivers/gpu/d=
rm/msm/disp/dpu1/dpu_crtc.h
> > > index 94392b9b924546f96e738ae20920cf9afd568e6b..6eaba5696e8e6bd1246a9=
895c4c8714ca6589b10 100644
> > > --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.h
> > > +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.h
> > > @@ -267,4 +267,6 @@ static inline enum dpu_crtc_client_type dpu_crtc_=
get_client_type(
> > >
> > >  void dpu_crtc_frame_event_cb(struct drm_crtc *crtc, u32 event);
> > >
> > > +unsigned int dpu_crtc_get_num_lm(const struct drm_crtc_state *state)=
;
> > > +
> > >  #endif /* _DPU_CRTC_H_ */
> > > diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c b/drivers/gpu/=
drm/msm/disp/dpu1/dpu_plane.c
> > > index 0bb153a71353ca9eaca138ebbee4cd699414771d..f721dc504bbbe3a499862=
39adee113bfb6790f70 100644
> > > --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> > > +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> > > @@ -961,6 +961,33 @@ static int dpu_plane_is_multirect_parallel_capab=
le(struct dpu_hw_sspp *sspp,
> > >               dpu_plane_is_parallel_capable(pipe_cfg, fmt, max_linewi=
dth);
> > >  }
> > >
> > > +static bool dpu_plane_check_single_pipe(struct dpu_plane_state *psta=
te,
> > > +                                     struct dpu_sw_pipe **single_pip=
e,
> > > +                                     struct dpu_sw_pipe_cfg **single=
_pipe_cfg,
> > > +                                     bool config_pipe)
> > > +{
> > > +     int i, valid_pipe =3D 0;
> > > +     struct dpu_sw_pipe *pipe;
> > > +
> > > +     for (i =3D 0; i < PIPES_PER_PLANE; i++) {
> > > +             if (drm_rect_width(&pstate->pipe_cfg[i].src_rect) !=3D =
0) {
> > > +                     valid_pipe++;
> > > +                     if (valid_pipe > 1)
> > > +                             return false;
> > > +                     *single_pipe =3D &pstate->pipe[i];
> > > +                     *single_pipe_cfg =3D &pstate->pipe_cfg[i];
> > > +             } else {
> > > +                     if (!config_pipe)
> > > +                             continue;
> > > +                     pipe =3D &pstate->pipe[i];
> > > +                     pipe->multirect_index =3D DPU_SSPP_RECT_SOLO;
> > > +                     pipe->multirect_mode =3D DPU_SSPP_MULTIRECT_NON=
E;
> > > +                     pipe->sspp =3D NULL;
> >
> > If this function is 'check', then why does it change something in the
> > pipe configuration?
>
> I see modification is made in other check functions, like
> dpu_plane_atomic_check_nosspp(). So
> the name is referenced. Do you think dpu_plane_get_single_pipe() is OK he=
re?

Because it follows the semantics of drm_foo_atomic_check_bar(), the
_atomic_check_ being a key part.


--=20
With best wishes
Dmitry
