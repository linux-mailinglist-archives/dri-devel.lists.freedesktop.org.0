Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F196B1767D
	for <lists+dri-devel@lfdr.de>; Thu, 31 Jul 2025 21:16:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4E0A510E38D;
	Thu, 31 Jul 2025 19:16:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="CCHHQXpM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com
 [209.85.216.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 816FB10E2AA;
 Thu, 31 Jul 2025 19:16:01 +0000 (UTC)
Received: by mail-pj1-f46.google.com with SMTP id
 98e67ed59e1d1-313336f8438so120177a91.0; 
 Thu, 31 Jul 2025 12:16:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1753989361; x=1754594161; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Cn8rhLd+pEEUOUPpSiZavvw/rqdfDh7ZoQlltq8FbbA=;
 b=CCHHQXpMWbK5vkldMF2DRkQvYWWKE8g/rkfi8miAK2MckwfxVU3ivsiUulpu4e9g1D
 xYVPIUMgroGs0KjSsHEFpdgm8kIqYwe8YRXhFOF67hZS/LRci8XBtItTOHH3iepqK1rr
 iSgyFvJaKB6EJcsCwLlQx8DiD5FD1E4MEwobiZmQISsXRU+S3zMyJvWM16HFdYttT0eg
 tOSNU7U1XdaOmixxLbdBaJuLqe8TQDODo4/GOm76rGbUM4srm5ARi9DvNraXeBxSxUek
 /sHFWkxBi3/kvzsVq/JsG+yRguOQneLsuTkHZiVOxDm5f1iStTIDkyeFcl+QrFtjPOzD
 UcIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753989361; x=1754594161;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Cn8rhLd+pEEUOUPpSiZavvw/rqdfDh7ZoQlltq8FbbA=;
 b=EB0O+JxCbgK7StsKEmcOkcbUWgNIBsFTVVSaLRKrCXSlmVMWMyVr3qxtcPUshMw9jp
 1ITUYIxvuTvU7QuX1w1vdtGSFgfRiFaV936f4OnAzGqvSQ5P9jQHZWLJWeO1AR9dy4OL
 N8y2XvqOFoCQ7qBCyO1E5znODVAIZHV7y31kLUogwxRkeCNWl1ZuOJiMZ9ytNerl4PvC
 hOpA2o/E6e8VSe60vV9c06D/lE5LX16sbsooq405Vj1fOC3Sma7e7t8A/idxfj7u/wxe
 3F2Dr0zjvR3XEnvOtFDRo9q+FX84flashhTzCbBSXti7Z3zhvEhBlhIe7vk4Zc5mvvzT
 IuWw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVSXykl5pxHnf4QBQ20HoQPVcD4PzOWRsTnZad/Fh/eOnwCzwb29/wjW1YkBXJBwWwIcbUq7X+Ap9Q=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx1v8q8EDD7EfMsBA03ky/E0s2lf4WMsJ2G+2J5BTXmyXxshkH0
 XzRELOdPwuxQ+sPR8GcLr4BszNJXjrBVk7QqW4HRPtWBSLhmP2JSquz5GczpYh6ZVCGWI4Jk5T/
 1OXd9mDM0V/fCwLXxagBFjjDEvZr48Fn6AruB
X-Gm-Gg: ASbGncsaXF/LQTVRsjA/WxvDEUIJ2kWqH0tWt3AftLo97vApytzaLmqK/UM77OvQIUj
 M+3OCQz8jSFjLeHFUKup+NGt2sAjGkdgKSVr8NmotqyW+yXMrXMm18j8zPPatCALTwLbDS0RoSk
 tMUQvLX6btGjnfgAv2ktSRkEt5ryYrQWncHPoEyXCK/bJABWxDrlOgWfNzM32mmidfLA62h39Gw
 iGdufY=
X-Google-Smtp-Source: AGHT+IEu/ADiBuOsnU9STlGTu3rwTdJjPniO2Z9r/r425/pU8HcEQ16Nz5WPbiQltfir7tdUPXbYKhfu5V/X9mtmrKE=
X-Received: by 2002:a17:90b:4d88:b0:313:2f9a:13c0 with SMTP id
 98e67ed59e1d1-31f5dd9ca39mr1287471a91.1.1753989360980; Thu, 31 Jul 2025
 12:16:00 -0700 (PDT)
MIME-Version: 1.0
References: <20250728203412.22573-1-robin.clark@oss.qualcomm.com>
 <20250728203412.22573-2-robin.clark@oss.qualcomm.com>
 <CACu1E7F=Y2oKfiWtD0VYfmLkL24e7JrZYMt8dmoGW7zrq7bd2g@mail.gmail.com>
 <CACSVV02W28L0MS32J0n1PTpEsaq_6RxEPgb_6y6G=6TryGEPQw@mail.gmail.com>
 <CACSVV02DLSM2dHUj4MiPpogF3pgjk4ex5=9_P2AKdGmtx4bd=g@mail.gmail.com>
In-Reply-To: <CACSVV02DLSM2dHUj4MiPpogF3pgjk4ex5=9_P2AKdGmtx4bd=g@mail.gmail.com>
From: Connor Abbott <cwabbott0@gmail.com>
Date: Thu, 31 Jul 2025 15:15:49 -0400
X-Gm-Features: Ac12FXxlm9JnMukSNQYaLbB4cXPsAUd9A2TtT5GgTEBC58nIMT1QTbODzdtFojo
Message-ID: <CACu1E7E6QaWgjFy13qP4BS_5mdhJ2vFVsnm9WtnJE3_t7rymPQ@mail.gmail.com>
Subject: Re: [PATCH 1/7] drm/msm: Add missing "location"s to devcoredump
To: rob.clark@oss.qualcomm.com
Cc: dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org, 
 freedreno@lists.freedesktop.org, Akhil P Oommen <akhilpo@oss.qualcomm.com>, 
 Sean Paul <sean@poorly.run>, Konrad Dybcio <konradybcio@kernel.org>, 
 Dmitry Baryshkov <lumag@kernel.org>, Abhinav Kumar <abhinav.kumar@linux.dev>, 
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>, 
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, open list <linux-kernel@vger.kernel.org>
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

On Tue, Jul 29, 2025 at 9:40=E2=80=AFAM Rob Clark <rob.clark@oss.qualcomm.c=
om> wrote:
>
> On Mon, Jul 28, 2025 at 3:15=E2=80=AFPM Rob Clark <rob.clark@oss.qualcomm=
.com> wrote:
> >
> > On Mon, Jul 28, 2025 at 2:04=E2=80=AFPM Connor Abbott <cwabbott0@gmail.=
com> wrote:
> > >
> > > On Mon, Jul 28, 2025 at 4:43=E2=80=AFPM Rob Clark <robin.clark@oss.qu=
alcomm.com> wrote:
> > > >
> > > > This is needed to properly interpret some of the sections.
> > > >
> > > > Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
> > > > ---
> > > >  drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c | 2 ++
> > > >  1 file changed, 2 insertions(+)
> > > >
> > > > diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c b/drivers/=
gpu/drm/msm/adreno/a6xx_gpu_state.c
> > > > index faca2a0243ab..e586577e90de 100644
> > > > --- a/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c
> > > > +++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c
> > > > @@ -1796,6 +1796,7 @@ static void a7xx_show_shader(struct a6xx_gpu_=
state_obj *obj,
> > > >
> > > >         print_name(p, "  - type: ", a7xx_statetype_names[block->sta=
tetype]);
> > > >         print_name(p, "    - pipe: ", a7xx_pipe_names[block->pipeid=
]);
> > > > +       drm_printf(p, "    - location: %d", block->location);
> > >
> > > We should probably at least try to keep it proper YAML by indenting
> > > everything after another level...
> >
> > this made me realize I missed a \n... but otherwise I think the indent
> > is correct?  Or should location not have a leading '-'?
>
> beyond that, even without the added location field, some random online
> yaml checker is telling me that we were already not proper yaml.. so I
> guess, :shrug:?
>
> BR,
> -R

Before this change, it looked like this:

  - pipe: A7XX_PIPE_BR
    - cluster-name: A7XX_CLUSTER_SP_PS
      - context: 3
        - { offset: 0x02a718, value: 0x00000003 }
        ...

Notice that each nested thing (pipe -> cluster -> context) has an
additional level of indentation. Now, it looks like this:

  - pipe: A7XX_PIPE_BR
    - cluster-name: A7XX_CLUSTER_SP_PS
      - context: 3
      - location: 4
        - { offset: 0x02a718, value: 0x00000003 }
        ...

So it looks a bit weird with the context and location not being
nested. Also, I think the correct nesting HW-wise is cluster ->
location -> context, rather than context-> location, so the location
should be first. But ultimately it's up to you.

Connor
