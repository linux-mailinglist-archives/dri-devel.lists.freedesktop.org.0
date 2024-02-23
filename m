Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E4389861C64
	for <lists+dri-devel@lfdr.de>; Fri, 23 Feb 2024 20:20:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D68B410E052;
	Fri, 23 Feb 2024 19:20:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="h8wauObP";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com
 [209.85.208.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0AC3E10E052;
 Fri, 23 Feb 2024 19:20:24 +0000 (UTC)
Received: by mail-ed1-f52.google.com with SMTP id
 4fb4d7f45d1cf-56454c695e6so2195929a12.0; 
 Fri, 23 Feb 2024 11:20:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1708716023; x=1709320823; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=M5k+Z4nPDwnRiBjbOv3TCMIZZge42YuOc06DAKki524=;
 b=h8wauObPmrtw2XEWHLideLIaXV08GsbeLeagXHKHbvJdowJxps6kXXuwUPXZQDF5Rs
 I0v0T/CEvAtbL2+8j7pkB35eDG/7al0bVhBWwqhL1QNzuwThf0k8EZ3HwJC7C0DgSobn
 iFGriT6S2wVuQpk/EBnRxh8cToBCv/tlfP+WeUvIg4oc59byPFGRqpBkE7bd8jxS+k2O
 dy3y2yQLb6O6d1jqN2h1DiDW6bIJJ334BO8yN5y0mdEhCQCttv9415EDP9p5vYtE6+rn
 R4FfYBMaHShOn8NPb+4KDX4gpK8b1UCivUnpHKAiprasaiwG7C6CnqKb6EiQ1G84D45R
 B7yQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708716023; x=1709320823;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=M5k+Z4nPDwnRiBjbOv3TCMIZZge42YuOc06DAKki524=;
 b=ug3yL4krBx0t2hGvipnHz4WPv9vOvtIyC5TQooVV311A+pDW9JXIK7jnsj5y8nBKj8
 XojrVPN2/4vzNzcQ/vDe4r6MHzxkW3C7F2xsuw471x+sCuJDC2GnkBaoO8iZ2PGDg8bB
 kj+gOR/Gkfa3gEvWcyUluadvisRtSRX5+g0hBVTo4I9rCgJzMiSGdxM6RPRK6mAeSMqv
 Mu7xISQLkycgmcXNVT2JxeM/sVmp16skSLMZoLt/Q1RDvl+2EizevaFWwpPtoIL9WmL2
 ATRmBPPa5+c0deheJhTUnzU7mB6VN4ons9/cOnUDLPdT0pYDuFrL0kuf4VxxBrrvGZ/p
 5IJA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVtfkM/QtW3Rlf3GvNyn47MFVibMw05qrwkxG8s4AQrA3PRlHSVuMEGjXQxcBmtnQ/ag3l85fPLRbJhUOPGAyG2DECKEMY7i4NHGjGVQJNNG87uUnlUxcB/rgMbLtwRTC36CLpJAe5puX5pJL1znz8R
X-Gm-Message-State: AOJu0YxW5+IcOVgNmmsmWOb4u0swTeKWNWPXsFoZ/0LdALbkeG6RVAxq
 TVRk56MlRx3AiVmOPVGE47MQ4bFo0oC06yf0D/zozr66WHc/yAG6UC/nZVlXm/dM5vKTjXAMd4D
 4dVyQYZonvf5YLJJe88j2xi6v+5A=
X-Google-Smtp-Source: AGHT+IFxzxNvseF7FRtNGReSOFATSOOCh/1iiT7dXL+XxvU/9GXBLYa5JADHu4mYKLvEoJ+ZN/R02g6XFdvoxwcEuBM=
X-Received: by 2002:aa7:cb4f:0:b0:565:7ce5:abdf with SMTP id
 w15-20020aa7cb4f000000b005657ce5abdfmr600067edt.9.1708716022607; Fri, 23 Feb
 2024 11:20:22 -0800 (PST)
MIME-Version: 1.0
References: <20240220121741.2994222-1-dmitry.baryshkov@linaro.org>
 <54a3f3d9-ad3e-4828-96c0-61dd81c61d76@collabora.com>
 <CAA8EJpq-17XSwmoT1HKVgxi=fUKD-fETtwbtpznR+RY+iFCE6w@mail.gmail.com>
In-Reply-To: <CAA8EJpq-17XSwmoT1HKVgxi=fUKD-fETtwbtpznR+RY+iFCE6w@mail.gmail.com>
From: Rob Clark <robdclark@gmail.com>
Date: Fri, 23 Feb 2024 11:20:10 -0800
Message-ID: <CAF6AEGtsL2pwQQ2pDDbYmRmp57aX2WjtD4qsZ=J_p07b+o2Tkw@mail.gmail.com>
Subject: Re: [PATCH] drm: ci: uprev IGT
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Helen Koike <helen.koike@collabora.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org
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

On Wed, Feb 21, 2024 at 6:36=E2=80=AFPM Dmitry Baryshkov
<dmitry.baryshkov@linaro.org> wrote:
>
> On Tue, 20 Feb 2024 at 16:31, Helen Koike <helen.koike@collabora.com> wro=
te:
> >
> >
> >
> > On 20/02/2024 09:17, Dmitry Baryshkov wrote:
> > > Bump IGT revision to pick up Rob Clark's fixes for the msm driver:
> > >
> > > - msm_submit@invalid-duplicate-bo-submit,Fail
> > >
> > > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> >
> > Do you have a gitlab pipeline link I can check?
>
> Before uprev: https://gitlab.freedesktop.org/drm/msm/-/pipelines/1109455
>
> After uprev: https://gitlab.freedesktop.org/drm/msm/-/pipelines/1109501

jfyi a couple more fixes landed after this, for kms_plane_cursor
(skips->pass) and kms_universal_plane (fail->pass)..

I have additional fixes for kms_bw, and kms_plane_scaling still
waiting for review

BR,
-R
