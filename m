Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E666376007A
	for <lists+dri-devel@lfdr.de>; Mon, 24 Jul 2023 22:28:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3FFFD10E02A;
	Mon, 24 Jul 2023 20:28:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x533.google.com (mail-pg1-x533.google.com
 [IPv6:2607:f8b0:4864:20::533])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6601210E02A;
 Mon, 24 Jul 2023 20:28:25 +0000 (UTC)
Received: by mail-pg1-x533.google.com with SMTP id
 41be03b00d2f7-56366112d64so498016a12.0; 
 Mon, 24 Jul 2023 13:28:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1690230505; x=1690835305;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ACVhCuYbyTCIAXi4CT8CW18d9cUT7JCXdATdUoNDmWs=;
 b=Hcr9k3R+2iloLepjZWsAwwEgWWeBSFwGB8SpLVs8XIo/jatRaNsS/2pAv/79QVaTi3
 GbZ/w/WCJqqrKzUMrb4Z0Z308oRtLHXbkpY0jQhQQZXBy8CJgtRQdylhz/q5PBqKSME+
 gkcDs5/hn1t7YrwJwq+ERLH1CgC/mM3c7L87Ati6rMyt7uLLgxrCOsseFykTWKGPTnaV
 0eu42SzyPBw8ImQnHheewncD96i1KLk1gSO+gXHqfLub1fip32UIYbctNUzyPHQI7KFl
 21Wi/jr5wNyz4Z+j+C8fND4G/3K5Qw1V8asd3ysmUxKoRkqmV90yy/TO1+Ssn8Rl+qZ8
 ZY7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690230505; x=1690835305;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ACVhCuYbyTCIAXi4CT8CW18d9cUT7JCXdATdUoNDmWs=;
 b=cFhrxxRUue3K3qA83u19sR7E9spxaTff9Ld6Regu8s3WgD8YIn3mrk2ihtnKzEPKFm
 maeabGY0l3eVtEj6NX7WCbinijbu4Z67IDl6OfzhKEnch+R+jqg/Db3dkXR/J6KLCsS2
 OjfVKXR416HY55NUUIXSXwWwvQkqcMZy8ilJ0fhPAL8tSq43CL9iQO/bGi5rT28VdG7M
 TPPHUHOOjdJSSvkDhfksFARg8xUoRWkr4Z1Ee8ybj6Vkc/XRpgNVrHaNuvpOMdu7UweI
 K0PUgSymqOVn7XtcEahuXJbFAD4BFRpjCjBtzMqvKPAuj0WS6YF2zWHdGxjh1qCRx/PZ
 MNpA==
X-Gm-Message-State: ABy/qLa3OT1N3/MLO2RKUcv4986RZW8PLygFfcTxpVCNBEZPDCcHqxFi
 DjBFZtmps8GpCE/PUur8ndtMyUsQmV6lcliQ+tnShdL5
X-Google-Smtp-Source: APBJJlEYsRZBAMzp7x8BefRfbyg3z4U3yjNd+OM5D4p6LZ+2GBnOrrJJ9Sg6/mS6KF0C3DgJcqVH8eW5jA814zVFPSo=
X-Received: by 2002:a17:902:cecd:b0:1b8:70d2:eb3a with SMTP id
 d13-20020a170902cecd00b001b870d2eb3amr14111006plg.0.1690230504894; Mon, 24
 Jul 2023 13:28:24 -0700 (PDT)
MIME-Version: 1.0
References: <20230620232319.991918-1-festevam@gmail.com>
 <33390a7a-f6f6-f2c5-1574-970ed1dc3a20@linaro.org>
In-Reply-To: <33390a7a-f6f6-f2c5-1574-970ed1dc3a20@linaro.org>
From: Fabio Estevam <festevam@gmail.com>
Date: Mon, 24 Jul 2023 17:28:12 -0300
Message-ID: <CAOMZO5AYWpTPGuUEpXzGoH_Rr1=Xaz1BnJiRjdhvyWuoHq+1XQ@mail.gmail.com>
Subject: Re: [PATCH v3] drm/msm/a2xx: Call adreno_gpu_init() earlier
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, robdclark@gmail.com
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
Cc: Fabio Estevam <festevam@denx.de>, freedreno@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, jonathan@marek.ca
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Rob,

A gentle ping.

On Thu, Jun 22, 2023 at 3:37=E2=80=AFPM Dmitry Baryshkov
<dmitry.baryshkov@linaro.org> wrote:
>
> On 21/06/2023 02:23, Fabio Estevam wrote:
> > From: Fabio Estevam <festevam@denx.de>
> >
> > The adreno_is_a20x() and adreno_is_a225() functions rely on the
> > GPU revision, but such information is retrieved inside adreno_gpu_init(=
),
> > which is called afterwards.
> >
> > Fix this problem by caling adreno_gpu_init() earlier, so that
> > the GPU information revision is available when adreno_is_a20x()
> > and adreno_is_a225() run.
> >
> > Tested on a imx53-qsb board.
> >
> > Fixes: 21af872cd8c6 ("drm/msm/adreno: add a2xx")
> > Signed-off-by: Fabio Estevam <festevam@denx.de>
> > ---
> > Hi,
> >
> > This error has been exposed by a recent commit in linux-next:
> >
> > cc943f43ece7 ("drm/msm/adreno: warn if chip revn is verified before bei=
ng set")
> >
> > , but the error has been present since the very first a2xx commit.
> >
> > Changes since v2:
> > - Call adreno_gpu_init() earlier.
>
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>
>
> >
> >   drivers/gpu/drm/msm/adreno/a2xx_gpu.c | 8 ++++----
> >   1 file changed, 4 insertions(+), 4 deletions(-)
>
>
> --
> With best wishes
> Dmitry
>
