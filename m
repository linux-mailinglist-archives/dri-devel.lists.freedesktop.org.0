Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C78B777976B
	for <lists+dri-devel@lfdr.de>; Fri, 11 Aug 2023 21:00:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DC22D10E6ED;
	Fri, 11 Aug 2023 19:00:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com
 [IPv6:2a00:1450:4864:20::52d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DBC0210E0FD;
 Fri, 11 Aug 2023 19:00:17 +0000 (UTC)
Received: by mail-ed1-x52d.google.com with SMTP id
 4fb4d7f45d1cf-51cff235226so4774773a12.0; 
 Fri, 11 Aug 2023 12:00:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1691780416; x=1692385216;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Wv5TNbtUKmnHCQA/yQdDqBxB3gW5w/TNnsdxNd4Nvjs=;
 b=cJjiJ4bizkdgNF53pbJKGc9ZGoQNfKsfEVusYbhJBkx9MUXhIQtOiiGQ9IvR6kn4TE
 B77SSWUL0XisngHJ/JYtSxwYm1YnINATuxi08IUV1bQogLTqINYyurLtzGdvWx1ZdutX
 2+FJJ92Ea+ZI1QcBlX4IllzkxjBMVd1C6FKU7m8vfSWzHku6UyYTanCTtbDFdpBxqtCM
 Ut6fs5inuRK19Pme2mXZjRi+A+Yt1UboNso4C9h9rKrHTaIRj+h2WPadj2tqrVhMJ6hC
 lPtsUia1pr9gJjxTrcX0suaRp+li+LNWyt09Rm9mY+R/A7Z9Lb90OJdNkJNMwOsqx2eh
 k+VA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1691780416; x=1692385216;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Wv5TNbtUKmnHCQA/yQdDqBxB3gW5w/TNnsdxNd4Nvjs=;
 b=WT2+mjbBQWe94n4pILZk0Fx2PCvSuxq2YmC2whURMuxRalUXALPmVH4zLfAWQFnZc1
 LfANlRTZT+J7TXTUjkOMArEdO4dSs12JQHb/ueWmtE0wXIBvYfd4eAPlqtFKZ3gcBZI0
 oV65Cnzy+5Rr7TkaQgAJn1bkKwSJK6u5Zr40AegLhPZzoN2vewB0iPzZzG/7AuitUBB8
 vH5QiQbQBTc3KfVCUm5OrwzfSoudr8OWmHudt/N1ze5GEJkI3TTdHyLWZ8MAXddY7x2Q
 bvb9BaxIBo36FcXHQWcTOjwQmpnuh0vWJBBPXYKTHd9gt74k9mduTnJ4MzgosJC/LNf7
 ID4w==
X-Gm-Message-State: AOJu0Yz/L/yXcTckYb2XChK91kqqY5kUa4Kq65T5IrXopRAjnxFKEE/Y
 hm0t9L9gMNQeoFo2phJJ2MvcWGH6sOffqn7UUCeypssUsqs=
X-Google-Smtp-Source: AGHT+IFex8H+lmC2IT+v4JO8bEE/uHzWDocwpGmeqw8bMRnrL3T8LCvx3W2PDf9a3HN6+YqPbeUowRSYLLguVMmROWA=
X-Received: by 2002:a05:6402:35d5:b0:521:ef0f:8ef9 with SMTP id
 z21-20020a05640235d500b00521ef0f8ef9mr7109624edc.19.1691780416119; Fri, 11
 Aug 2023 12:00:16 -0700 (PDT)
MIME-Version: 1.0
References: <20230620232319.991918-1-festevam@gmail.com>
 <33390a7a-f6f6-f2c5-1574-970ed1dc3a20@linaro.org>
 <CAOMZO5AYWpTPGuUEpXzGoH_Rr1=Xaz1BnJiRjdhvyWuoHq+1XQ@mail.gmail.com>
 <CAOMZO5COpKCy=mqF2=P40EHo=sM9z4897OPna98Rgh_4fbfTwA@mail.gmail.com>
In-Reply-To: <CAOMZO5COpKCy=mqF2=P40EHo=sM9z4897OPna98Rgh_4fbfTwA@mail.gmail.com>
From: Rob Clark <robdclark@gmail.com>
Date: Fri, 11 Aug 2023 12:00:03 -0700
Message-ID: <CAF6AEGvC=edrTeHkbA+zDsUOPgXwdSUde91gZmK4Dhs6QS_Tvg@mail.gmail.com>
Subject: Re: [PATCH v3] drm/msm/a2xx: Call adreno_gpu_init() earlier
To: Fabio Estevam <festevam@gmail.com>
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
Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Fabio Estevam <festevam@denx.de>, freedreno@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, jonathan@marek.ca
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

It is in https://gitlab.freedesktop.org/drm/msm/-/merge_requests/75 so
should be in msm-next for v6.6

BR,
-R

On Fri, Aug 11, 2023 at 9:11=E2=80=AFAM Fabio Estevam <festevam@gmail.com> =
wrote:
>
> Hi Rob,
>
> Any comments, please?
>
> On Mon, Jul 24, 2023 at 5:28=E2=80=AFPM Fabio Estevam <festevam@gmail.com=
> wrote:
> >
> > Hi Rob,
> >
> > A gentle ping.
> >
> > On Thu, Jun 22, 2023 at 3:37=E2=80=AFPM Dmitry Baryshkov
> > <dmitry.baryshkov@linaro.org> wrote:
> > >
> > > On 21/06/2023 02:23, Fabio Estevam wrote:
> > > > From: Fabio Estevam <festevam@denx.de>
> > > >
> > > > The adreno_is_a20x() and adreno_is_a225() functions rely on the
> > > > GPU revision, but such information is retrieved inside adreno_gpu_i=
nit(),
> > > > which is called afterwards.
> > > >
> > > > Fix this problem by caling adreno_gpu_init() earlier, so that
> > > > the GPU information revision is available when adreno_is_a20x()
> > > > and adreno_is_a225() run.
> > > >
> > > > Tested on a imx53-qsb board.
> > > >
> > > > Fixes: 21af872cd8c6 ("drm/msm/adreno: add a2xx")
> > > > Signed-off-by: Fabio Estevam <festevam@denx.de>
> > > > ---
> > > > Hi,
> > > >
> > > > This error has been exposed by a recent commit in linux-next:
> > > >
> > > > cc943f43ece7 ("drm/msm/adreno: warn if chip revn is verified before=
 being set")
> > > >
> > > > , but the error has been present since the very first a2xx commit.
> > > >
> > > > Changes since v2:
> > > > - Call adreno_gpu_init() earlier.
> > >
> > > Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > >
> > >
> > > >
> > > >   drivers/gpu/drm/msm/adreno/a2xx_gpu.c | 8 ++++----
> > > >   1 file changed, 4 insertions(+), 4 deletions(-)
> > >
> > >
> > > --
> > > With best wishes
> > > Dmitry
> > >
