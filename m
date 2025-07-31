Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B931B17736
	for <lists+dri-devel@lfdr.de>; Thu, 31 Jul 2025 22:32:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8A39810E2B2;
	Thu, 31 Jul 2025 20:32:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="bItUczJe";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B913810E7E5
 for <dri-devel@lists.freedesktop.org>; Thu, 31 Jul 2025 20:32:03 +0000 (UTC)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56VDf8SN001318
 for <dri-devel@lists.freedesktop.org>; Thu, 31 Jul 2025 20:32:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:reply-to:subject:to; s=
 qcppdkim1; bh=95j11hbpABfVkWXAtbUrfq5oYNt/9RLXdyb6uZduDVU=; b=bI
 tUczJeCkAQYvmh2+CUG6hR+kEzUQgFzWdtxpccVFSteLEausfVNDS5ZSKCx57Juy
 HVR3KsEw8v4ONwLSXFo9oaxnw31rRQ4y3bZQK2WTG22wCY7jaw5X4dZ5WW0U7MMU
 IeMz6WKXysiTTjjKA5mslzwBOomWRjwaInq2HpIdk0DUeRtijUwuUbVkqy2x4XF6
 UVZR11p1uvgjKay4sIz3gXIpBzceuwGEZN0IJNCCUePFDtVlD20pXhG8bXUc0TpR
 +kkpHNgfHAI/kZCSPMX7tlk2pINjOXtCkteSXk9qTESDjQM0CbZ5eVkSTnI9djZZ
 t6uxz1cYvZRy7ibispdA==
Received: from mail-oi1-f199.google.com (mail-oi1-f199.google.com
 [209.85.167.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 484nyu9phv-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Thu, 31 Jul 2025 20:32:03 +0000 (GMT)
Received: by mail-oi1-f199.google.com with SMTP id
 5614622812f47-427850a77a2so257450b6e.3
 for <dri-devel@lists.freedesktop.org>; Thu, 31 Jul 2025 13:32:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753993922; x=1754598722;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :reply-to:in-reply-to:references:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=95j11hbpABfVkWXAtbUrfq5oYNt/9RLXdyb6uZduDVU=;
 b=tkdTXp8zX3HwcJhrhtjnnfPDk46DzEimOoOTSnZBanOmq2nnndjR1iHe7EgeYQaEkp
 z3IpTw1TdrjqV6gyTkfJCf/NHo42Lu7N89UqqQcq8UoJ9zunDSfOnYpYk+1kILoIxpOg
 m3XiG3a94BbfBhdwospSY9dq8C6Ygi/NSM2Merhl2LHikdjrGL4/bwKj9tWkY3AjUNdv
 blfQ16Hm3rYsVBFh3lXPoo5L7yAB0DO2Io4cnuqvtWDz8+sf82NbLPMqEyYViU59VlB3
 KUfG/KIoUlwbVHPRqEABbFgOdptljzgTjKpgifBLDr3w4eHJ+eHE4sY5+iPRWCCD4dge
 L1ow==
X-Gm-Message-State: AOJu0YzHY06yQrGwqXKuC3IthrblqU1BDQtWV7ssjYeGnE7kynpvBULh
 s0tIDhV8evcrjnPv7YG+0v7eF3iyOEx5rSWkKLzo1bI5N8EsegALnodN2i7pOCDcSPjfuKyIHlY
 RoA0zsfXq7FiW9ESaKz1I/eL+1/reZ8jhji1gmJIYIbewbLwv0Miw0L7qS9Du0nseJwA+9MK0bR
 OzCzZTv34y5U5LMqftd9WJrslLuIxDnetFxrgNlEZ9++6t2g==
X-Gm-Gg: ASbGncs7ygqLbS+JAZIcfe9wu5K8TOrYSeeiOyhLbQeoiZAaql99F+8c0MmNB39C8br
 dyL8YA/0vwkOelwbbzu1aOr7dfKPsSP80/D5sKhKvAfra1xO1wEB28lVhRqTSH8kL4oE38XrRdE
 Fh3Esi/Fb90qQ3/Kieh3ysLc7k3O5eO/pQ7rVrjEme/4mRes4jxYoZ
X-Received: by 2002:a05:6808:d48:b0:40c:f698:c132 with SMTP id
 5614622812f47-43199c82e9bmr5343036b6e.11.1753993921802; 
 Thu, 31 Jul 2025 13:32:01 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEB1z2a8DRYITGDp5oVp8wvyaSOT3GViM176ZVbHA0f+yokdIDGj8gjhCgpQ3jKYYoQb+mKpRMhxR6uPxgxVkQ=
X-Received: by 2002:a05:6808:d48:b0:40c:f698:c132 with SMTP id
 5614622812f47-43199c82e9bmr5343020b6e.11.1753993921409; Thu, 31 Jul 2025
 13:32:01 -0700 (PDT)
MIME-Version: 1.0
References: <20250728203412.22573-1-robin.clark@oss.qualcomm.com>
 <20250728203412.22573-2-robin.clark@oss.qualcomm.com>
 <CACu1E7F=Y2oKfiWtD0VYfmLkL24e7JrZYMt8dmoGW7zrq7bd2g@mail.gmail.com>
 <CACSVV02W28L0MS32J0n1PTpEsaq_6RxEPgb_6y6G=6TryGEPQw@mail.gmail.com>
 <CACSVV02DLSM2dHUj4MiPpogF3pgjk4ex5=9_P2AKdGmtx4bd=g@mail.gmail.com>
 <CACu1E7E6QaWgjFy13qP4BS_5mdhJ2vFVsnm9WtnJE3_t7rymPQ@mail.gmail.com>
In-Reply-To: <CACu1E7E6QaWgjFy13qP4BS_5mdhJ2vFVsnm9WtnJE3_t7rymPQ@mail.gmail.com>
From: Rob Clark <rob.clark@oss.qualcomm.com>
Date: Thu, 31 Jul 2025 13:31:49 -0700
X-Gm-Features: Ac12FXxbyEjKFrDZgWUpR8ETQOQajKnWdha82A9YYrUt8UGqoYorcn4PYFKocMw
Message-ID: <CACSVV02qk59riW4_UAZjd=NTsSLF7qsQW6hkYEz7JcttBJDWTw@mail.gmail.com>
Subject: Re: [PATCH 1/7] drm/msm: Add missing "location"s to devcoredump
To: Connor Abbott <cwabbott0@gmail.com>
Cc: dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org,
 Akhil P Oommen <akhilpo@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-GUID: ipaQ3M5JAuPguGMiQRPXCVXVTYfnr5Z2
X-Proofpoint-ORIG-GUID: ipaQ3M5JAuPguGMiQRPXCVXVTYfnr5Z2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzMxMDE0NiBTYWx0ZWRfX4f593XU6dkiL
 d8VDG9G/Z39szAumi9hdGsDFwY6xg35SKFNdr96JhvtX3wO0E4uq/RXtKh+wRo8GajLbNv0+lbw
 Ixbz1N0wxdH0dIBVSyABOD9yeTJaouOQg8Tm1ET040oCnkhd+JH1tzXhueczuw8T/HM0gqpwJqo
 p91X5UXlzE8OoKe460NG/ShJ4pMk/En+UecN0pofRzHGrXI28Eu82cTieKX+6+3ylGn7SJ2b9qc
 P8+wIL8Ll8GGhdo84a8Aqru+Pj9ShDznU4XKuJt+tsGQFmVVfn/pQGHzf3WDjPyDKAOXwzVgbBr
 OwSF3zIA8CHWShiYdsyVVK/nH1mfMTHbnpUOh9gv7gfBGQl8LhsYhjUQWU1BwQRuMr32OhzrE/i
 pd9RSbfw+mPzJxy61GjpkUeNRa2cNqfoW4yrEvyyGkk7fH6J0OVFoIDYbY9MMHOwVI2Q9ee/
X-Authority-Analysis: v=2.4 cv=CLoqXQrD c=1 sm=1 tr=0 ts=688bd2c3 cx=c_pps
 a=yymyAM/LQ7lj/HqAiIiKTw==:117 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=3X2iVFLOVPrzddhlX30A:9 a=QEXdDO2ut3YA:10
 a=efpaJB4zofY2dbm2aIRb:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-31_04,2025-07-31_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 adultscore=0 suspectscore=0 mlxlogscore=999 spamscore=0
 priorityscore=1501 phishscore=0 lowpriorityscore=0 malwarescore=0 bulkscore=0
 clxscore=1015 impostorscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507310146
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
Reply-To: rob.clark@oss.qualcomm.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Jul 31, 2025 at 12:16=E2=80=AFPM Connor Abbott <cwabbott0@gmail.com=
> wrote:
>
> On Tue, Jul 29, 2025 at 9:40=E2=80=AFAM Rob Clark <rob.clark@oss.qualcomm=
.com> wrote:
> >
> > On Mon, Jul 28, 2025 at 3:15=E2=80=AFPM Rob Clark <rob.clark@oss.qualco=
mm.com> wrote:
> > >
> > > On Mon, Jul 28, 2025 at 2:04=E2=80=AFPM Connor Abbott <cwabbott0@gmai=
l.com> wrote:
> > > >
> > > > On Mon, Jul 28, 2025 at 4:43=E2=80=AFPM Rob Clark <robin.clark@oss.=
qualcomm.com> wrote:
> > > > >
> > > > > This is needed to properly interpret some of the sections.
> > > > >
> > > > > Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
> > > > > ---
> > > > >  drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c | 2 ++
> > > > >  1 file changed, 2 insertions(+)
> > > > >
> > > > > diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c b/driver=
s/gpu/drm/msm/adreno/a6xx_gpu_state.c
> > > > > index faca2a0243ab..e586577e90de 100644
> > > > > --- a/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c
> > > > > +++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c
> > > > > @@ -1796,6 +1796,7 @@ static void a7xx_show_shader(struct a6xx_gp=
u_state_obj *obj,
> > > > >
> > > > >         print_name(p, "  - type: ", a7xx_statetype_names[block->s=
tatetype]);
> > > > >         print_name(p, "    - pipe: ", a7xx_pipe_names[block->pipe=
id]);
> > > > > +       drm_printf(p, "    - location: %d", block->location);
> > > >
> > > > We should probably at least try to keep it proper YAML by indenting
> > > > everything after another level...
> > >
> > > this made me realize I missed a \n... but otherwise I think the inden=
t
> > > is correct?  Or should location not have a leading '-'?
> >
> > beyond that, even without the added location field, some random online
> > yaml checker is telling me that we were already not proper yaml.. so I
> > guess, :shrug:?
> >
> > BR,
> > -R
>
> Before this change, it looked like this:
>
>   - pipe: A7XX_PIPE_BR
>     - cluster-name: A7XX_CLUSTER_SP_PS
>       - context: 3
>         - { offset: 0x02a718, value: 0x00000003 }
>         ...
>
> Notice that each nested thing (pipe -> cluster -> context) has an
> additional level of indentation. Now, it looks like this:
>
>   - pipe: A7XX_PIPE_BR
>     - cluster-name: A7XX_CLUSTER_SP_PS
>       - context: 3
>       - location: 4
>         - { offset: 0x02a718, value: 0x00000003 }
>         ...
>
> So it looks a bit weird with the context and location not being
> nested. Also, I think the correct nesting HW-wise is cluster ->
> location -> context, rather than context-> location, so the location
> should be first. But ultimately it's up to you.

In terms of nesting, type, pipe, and location are all at the same
level, and then for that tuple there is SPs nested under that, and
then USPTPs nested under the SPs.  Although I guess we already had
pipe nested under type..

BR,
-R
