Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 55D17A67A2C
	for <lists+dri-devel@lfdr.de>; Tue, 18 Mar 2025 18:00:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8F4A110E23E;
	Tue, 18 Mar 2025 17:00:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="n7vyPiqP";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E9C7D10E23E
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Mar 2025 17:00:17 +0000 (UTC)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52I9kYdS021228
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Mar 2025 17:00:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 y2+oGra/6n3RT/E0bgcmLmlGUUYmT3cDQKHxKgoP1X4=; b=n7vyPiqPP60GKUYv
 KyfgoZ2dbZ8ANP+gZK1C5EO2s4O3Yh1c902e3ABut/HPE7R29LgTax5h9SKuP8nj
 WHCDUFa3HlT4bX1Ok3fkcUZitncfT0p484zTSnXk07mp3l1Mxqf5K97bOJbaC6Dm
 5nRzlqwt81lP8NW6ygPfLFn4p9+nrTMOCX1kCf+uj3VihIyuIu2tQlv7droXxU1O
 If3hNaaOqB5KcDzloZmRTI5+N0JHsplNzq7RhCpJ4mbkP0BKWjYR8XGBuASNvZLn
 fpBtMephPn0qMURAvldMQ6I5ll8xGatjVzlcAPscTmJAFnMxCmlaVKfg3ECGJeXb
 WJ6vTw==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com
 [209.85.216.70])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45d1x812hc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Mar 2025 17:00:16 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id
 98e67ed59e1d1-2ff6af1e264so9681084a91.3
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Mar 2025 10:00:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1742317215; x=1742922015;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=y2+oGra/6n3RT/E0bgcmLmlGUUYmT3cDQKHxKgoP1X4=;
 b=silQX4i8yAhYlfbWR3/zq/XoIXoO/93vj/f2SW0IcS/xDQt60bvCspXT97BcJ+2tWN
 yNYcbYeq8A2YDE8bN+mqZVmhdmjEFo0B/tdU+IiN2zzu6pkxWJiDEvYZKUcnVH2Cv4jC
 8IjlZSdlvkgbzgSugSqaCxY8AVfRjHrL5aZzb6Lqej9hHPVZqyuR1rbTPxZ/qgYBI9Sq
 wd83b1wf3apbwCXyTFY5ZBGvRv6TRbVelcW7u0ubhiM1yqW6FIJkvonEVz5lLvoZ0ULB
 PTcy/nw3O3yBUrGKSsGBdnSITV7BLaccDZAsrRc8C5DA3LwmhLLRYvLG7ZM64dgCOacQ
 TGEA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUT0gZ6y3Eqjor9PEARZp9ElVwyw0C2avXPhLjPWw3NSdopxva/CBy9d8OhWVf/QzM+OPJJU1Ml8cY=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwSDVrUbLyFxs4Ijbe2Q65Yrfps2roW6kNHEyB88ylZPtXJCCP+
 +ES6RQ2u6zWApffY5wGUg45HIUPcyqpagaQZIlUomQ2LogQD2+n90+aSQdnpV0fzPfCxYgPWSaP
 LKylJvYCdwAnpl8Ui+FFzvK98UKHfmokWo+iExTBWOibeRfvDv4fZ5gkk9HsoiufjNOJY1rA56G
 3C1MZRTlfrmMps2SapROOO3b0ELGd+eBu3gkATKOKzpJgDY6RPKJbv1fmKGw==
X-Gm-Gg: ASbGncuKo0nXcevsEAbj71tfZ+m+/vxATwyyMdteOrKayoDReQ3evWhWAvf4+19AvvC
 gPn9GdDQF+QUyS9669v/XA7rKjrQ4dSAAke1JBRwUr/qi28swydxCIfX97EgfrxRP5qAnhIedM1
 WHAPKrGaAGHsnF6hIRLJjwWOrKLvw=
X-Received: by 2002:a17:90b:4c:b0:2ff:64c3:3bd4 with SMTP id
 98e67ed59e1d1-301a5bff158mr4199733a91.31.1742317215069; 
 Tue, 18 Mar 2025 10:00:15 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE7orlCcOTzKv9495d2zLbaIYhSzdkmmHIEtE7pvmf6UIGCyN7EII36oOZjnWb5Dtj/qMO2TMbq6kymi9NSXHQ=
X-Received: by 2002:a17:90b:4c:b0:2ff:64c3:3bd4 with SMTP id
 98e67ed59e1d1-301a5bff158mr4199631a91.31.1742317214205; Tue, 18 Mar 2025
 10:00:14 -0700 (PDT)
MIME-Version: 1.0
References: <20250316-b4-panel-ls043t1le01-v1-1-ee38371b0ba0@redhat.com>
 <zs4tt57ur6hbesipab3kuiost4gokfu6tmfsicfwtdwri2wwli@fylnnpu3xoen>
 <CAN9Xe3SkXCK3FJx6c=EDigBxdXeGh9NYEf-wcR0_jFwraFGeDg@mail.gmail.com>
In-Reply-To: <CAN9Xe3SkXCK3FJx6c=EDigBxdXeGh9NYEf-wcR0_jFwraFGeDg@mail.gmail.com>
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Tue, 18 Mar 2025 19:00:02 +0200
X-Gm-Features: AQ5f1JozRfWE2AvU7W4G4CRnLtgMIlzRwdXAGIgnHgomtxzwNu4xMver5VaZXj4
Message-ID: <CAO9ioeXyJKGxXXanFHraspvquwWmMEKUdw_eN=wjV81VeMo43w@mail.gmail.com>
Subject: Re: [PATCH] drm/panel/sharp-ls043t1le01: Use _multi variants
To: Anusha Srivatsa <asrivats@redhat.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Tejas Vipin <tejasvipin76@gmail.com>, Doug Anderson <dianders@chromium.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-GUID: 25vRmT_xnxAhvyrnf0n2GlMCuZ27oNrC
X-Proofpoint-ORIG-GUID: 25vRmT_xnxAhvyrnf0n2GlMCuZ27oNrC
X-Authority-Analysis: v=2.4 cv=Jem8rVKV c=1 sm=1 tr=0 ts=67d9a6a0 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=IkcTkHD0fZMA:10 a=Vs1iUdzkB0EA:10
 a=20KFwNOVAAAA:8 a=EUspDBNiAAAA:8 a=68VyVwYxJFAdjPYCXN8A:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-18_08,2025-03-17_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0
 mlxlogscore=999 spamscore=0 mlxscore=0 malwarescore=0 adultscore=0
 phishscore=0 impostorscore=0 priorityscore=1501 lowpriorityscore=0
 bulkscore=0 clxscore=1015 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2503180125
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

On Tue, 18 Mar 2025 at 18:55, Anusha Srivatsa <asrivats@redhat.com> wrote:
>
> On Sun, Mar 16, 2025 at 7:32=E2=80=AFPM Dmitry Baryshkov <dmitry.baryshko=
v@oss.qualcomm.com> wrote:
>>
>> On Sun, Mar 16, 2025 at 02:58:22PM -0400, Anusha Srivatsa wrote:

>> > ---
>> >  drivers/gpu/drm/panel/panel-sharp-ls043t1le01.c | 36 ++++++++++------=
---------
>> >  1 file changed, 14 insertions(+), 22 deletions(-)
>> >
>> > diff --git a/drivers/gpu/drm/panel/panel-sharp-ls043t1le01.c b/drivers=
/gpu/drm/panel/panel-sharp-ls043t1le01.c
>> > index 729cbb0d8403ff7c0c4b9d21774909cc298904a2..9803eaf18e95d70742ece8=
8e82932751476fdda8 100644
>> > --- a/drivers/gpu/drm/panel/panel-sharp-ls043t1le01.c
>> > +++ b/drivers/gpu/drm/panel/panel-sharp-ls043t1le01.c
>> > @@ -36,15 +36,14 @@ static inline struct sharp_nt_panel *to_sharp_nt_p=
anel(struct drm_panel *panel)
>> >  static int sharp_nt_panel_init(struct sharp_nt_panel *sharp_nt)
>> >  {
>> >       struct mipi_dsi_device *dsi =3D sharp_nt->dsi;
>> > +     struct mipi_dsi_multi_context dsi_ctx =3D { .dsi =3D dsi };
>> >       int ret;
>> >
>> >       dsi->mode_flags |=3D MIPI_DSI_MODE_LPM;
>> >
>> > -     ret =3D mipi_dsi_dcs_exit_sleep_mode(dsi);
>> > -     if (ret < 0)
>> > -             return ret;
>> > +     mipi_dsi_dcs_exit_sleep_mode_multi(&dsi_ctx);
>> >
>> > -     msleep(120);
>> > +     mipi_dsi_msleep(&dsi_ctx, 120);
>> >
>> >       /* Novatek two-lane operation */
>> >       ret =3D mipi_dsi_dcs_write(dsi, 0xae, (u8[]){ 0x03 }, 1);
>>
>> Anusha. Please. Start reviewing your patches before you send them. This
>> is a MIPI DSI call. And it wasn't switched to _multi / context. You
>> should have cought this. I don't know why you didn't. Please review and
>> check your code before sending it upstream.
>
>
> Actually , mipi_dsi_dcs_write() doesnt have a _multi() variant. There are=
 _multi() variants for other writes: mipi_dsi_dcs_write_buffer() has mipi_d=
si_dcs_write_buffer_multi(), mipi_dsi_generic_write() has mipi_dsi_generic_=
write_multi() but not the one used above.

That doesn't mean that it can be left unconverted. You can use
mipi_dsi_dcs_write_buffer_multi().

P.S. Please wrap your replies ont some useful boundary (72-75 chars is
the recommended value).

--=20
With best wishes
Dmitry
