Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 59A50B0FB16
	for <lists+dri-devel@lfdr.de>; Wed, 23 Jul 2025 21:43:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AFC3910E010;
	Wed, 23 Jul 2025 19:43:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="JkvWhFKN";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ua1-f42.google.com (mail-ua1-f42.google.com
 [209.85.222.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0630610E010;
 Wed, 23 Jul 2025 19:43:18 +0000 (UTC)
Received: by mail-ua1-f42.google.com with SMTP id
 a1e0cc1a2514c-87ed6d59f9aso16869241.0; 
 Wed, 23 Jul 2025 12:43:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1753299798; x=1753904598; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=VLwJLwrvxgt/xsPZw/m3LYggy+8iY07yBN+YnVJglfg=;
 b=JkvWhFKNtQH/azR0uMBiRA8xm3LwM8Tkeh9TKczRgxChVhrdL2wjIQa+PuQz7/BUgw
 ga4rQOZiMI7YDh+yJamW96k81ZFMg++jd3jzXjAi8bXa7iLAnJWbZGXrRurwE2jqWvAj
 e3w/xUPkNIEQIQOebEHS0DhRPp1Zb5/LTaeOVdtwoRGhIXmopDuRTEUMd3GQLjzzwSki
 +2XdZ3XRx8hjsXzIyywkVDITbbmuCs2rZ5/1b3Vxq6pPeXmpm5YTIUN3txvbj7KMfC+j
 A4+SRfff+0CRnaMpK3MxhD2girgQAtn5uZ8mzgm+qJwx7KRnaFuQ46lYjsb2RwLqlAgI
 gihw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753299798; x=1753904598;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=VLwJLwrvxgt/xsPZw/m3LYggy+8iY07yBN+YnVJglfg=;
 b=RQy+ydxe4QMKWzcEpX5a/Ppa2Ara+WHgnGJJ9JGqtGdUVl/Z8d8+9kG4Q7yAxnu6r0
 0fnNdnZRWWdmo/yaNWu8iAv/bAf7+5FNo7hd0L/urU1J1ArqgLhD4l/ZYAP/8C9v9pOL
 EZFJQLzrPJNGaylNfAjUJrcJkj6Fg2L5d+JiIVCIpwtF/hLM7H1v6Pr67KvRNNtY1Pk6
 qKDx/nnAH0EOj+IcX8V0XWa4dvepPnFa+djE1yR14jdsG7aQ/kUVt+i2I6esa7B371eP
 AF9gs0kp7QFkeuYBoJh+qGUarG6Fx/ZGt6mzu/dh8rBL5GHbqHN6VpoIBC6W13NKmE3D
 3afg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWSRhJhICW64lR/9qqy+89T/mogmhyqSszF522pFKMkTS5/z3luJDW9VcdGZtNZFbNRMSwDeWhQry4=@lists.freedesktop.org,
 AJvYcCWvx7B7ER6U23+Witys+lCI/khqXTmBeWTrsO4pYlsitU4B+/0/Zd5e03iXelZ8yeYtZrAnkR7QeFzv@lists.freedesktop.org
X-Gm-Message-State: AOJu0Ywu3uh+e1gxG6QikL3nPI2QNowwL8AcmbyWKQy/OXIDZRccUgKT
 v+7+iRLivLV+BEQMYjkgH/bUVYhsMHIaXMeu1g2mc5p9yGWZNADd/Ubiu8IpZSyOMD1wekUN52q
 Hsq4rmQTp7uiSVR6gJEStTsbUKDGNRg==
X-Gm-Gg: ASbGncsqIwkrkymWLHOkqeNcPPWphlMj5eJvRVKTzbiINazRiLCtZfCPOlnLUYlkCi6
 1TNrr3obgMpRweF4y/Fmx20DfTTsoLF7RY/2EcBNgJcSSM7ef/pjWzEC1liMGCC/FnGRBwU7gVV
 gIDNQzvfj6iVDg1ag6j6rlrrHhdqkrClulh7QSzWNso+Y4EhiUEyBCFvub6F1illOqolNxi6vwg
 EoeVhA=
X-Google-Smtp-Source: AGHT+IHeKBka0XSBYI9j8YgnKfuDdyTEyHmyHYiq8wsuJyyYC0gkyj/gafdGPZCNFkUQKu6gmocFiIRCDZh089FWNic=
X-Received: by 2002:a05:6102:5985:b0:4de:ec93:edde with SMTP id
 ada2fe7eead31-4fa14fbd4d1mr811264137.2.1753299797703; Wed, 23 Jul 2025
 12:43:17 -0700 (PDT)
MIME-Version: 1.0
References: <20250722211740.3697191-1-chenyuan0y@gmail.com>
 <ciawdvjevycjjuowmykfux2v25lvr66kzey4jklq7t5cjzqalj@qfcva77k2bvr>
In-Reply-To: <ciawdvjevycjjuowmykfux2v25lvr66kzey4jklq7t5cjzqalj@qfcva77k2bvr>
From: Chenyuan Yang <chenyuan0y@gmail.com>
Date: Wed, 23 Jul 2025 12:43:06 -0700
X-Gm-Features: Ac12FXyfDgvypAhX518Ytb4IDIHsDM1ZIOFH6GXk5RFMsuqTApG8e4d9TBwGU60
Message-ID: <CALGdzurR2XPoai8qshTX6hzgF-zLQ-FrsWxu5NGjrkjNzWaHaQ@mail.gmail.com>
Subject: Re: [PATCH] drm/msm/dpu: Add a null ptr check for
 dpu_encoder_needs_modeset
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: robin.clark@oss.qualcomm.com, lumag@kernel.org, abhinav.kumar@linux.dev, 
 jessica.zhang@oss.qualcomm.com, sean@poorly.run, 
 marijn.suijten@somainline.org, airlied@gmail.com, simona@ffwll.ch, 
 tglx@linutronix.de, krzysztof.kozlowski@linaro.org, 
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

On Wed, Jul 23, 2025 at 12:05=E2=80=AFPM Dmitry Baryshkov
<dmitry.baryshkov@oss.qualcomm.com> wrote:
>
> On Tue, Jul 22, 2025 at 04:17:40PM -0500, Chenyuan Yang wrote:
> > The drm_atomic_get_new_connector_state() can return NULL if the
> > connector is not part of the atomic state. Add a check to prevent
> > a NULL pointer dereference.
> >
> > This follows the same pattern used in dpu_encoder_update_topology()
> > within the same file, which checks for NULL before using conn_state.
> >
> > Signed-off-by: Chenyuan Yang <chenyuan0y@gmail.com>
> > Fixes: 1ce69c265a53 ("drm/msm/dpu: move resource allocation to CRTC")
> > ---
> >  drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 2 ++
> >  1 file changed, 2 insertions(+)
> >
> > diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/=
drm/msm/disp/dpu1/dpu_encoder.c
> > index c0ed110a7d30..4bddb9504796 100644
> > --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> > +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> > @@ -729,6 +729,8 @@ bool dpu_encoder_needs_modeset(struct drm_encoder *=
drm_enc, struct drm_atomic_st
> >               return false;
> >
> >       conn_state =3D drm_atomic_get_new_connector_state(state, connecto=
r);
> > +     if (!conn_state)
> > +             return false;
>
> Did this happen in a real case or is it just
> yet-another-static-analysys?

This is a static-analysis detected bug.

> >
> >       /**
> >        * These checks are duplicated from dpu_encoder_update_topology()=
 since
> > --
> > 2.34.1
> >
>
> --
> With best wishes
> Dmitry
