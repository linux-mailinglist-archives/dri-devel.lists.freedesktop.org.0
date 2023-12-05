Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A5F1804308
	for <lists+dri-devel@lfdr.de>; Tue,  5 Dec 2023 01:02:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7449910E44E;
	Tue,  5 Dec 2023 00:02:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-x112c.google.com (mail-yw1-x112c.google.com
 [IPv6:2607:f8b0:4864:20::112c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3D94010E44B
 for <dri-devel@lists.freedesktop.org>; Tue,  5 Dec 2023 00:02:19 +0000 (UTC)
Received: by mail-yw1-x112c.google.com with SMTP id
 00721157ae682-5d7346442d4so24154277b3.2
 for <dri-devel@lists.freedesktop.org>; Mon, 04 Dec 2023 16:02:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1701734538; x=1702339338; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=3xI9L7eTJe/QWXc9juI1mud1Z9AYoG2UULweun2XvpI=;
 b=dObhcTKtfZ3D+7jKSs+fkdkI5/iS067PqSCp4M38E42Z8hsAE0KZsgnhygMWHYm0/f
 f1vfdyMLCvrshO+TjgfDnZOFNk2wGAlgaW42OpZcuO2J3FHtWkAE5dTQN4rhfU8YMBUs
 0VZfRch1wJQo6AIQ2HyvvmwZKhS0bJc4EtvULK3d9jSjKV+PoyG+1Ga+P9MgJ5pE5gTi
 9yV3AWWI28xaYwvn8fhLAd6hi/ZP4SFeb/1p0ZdPXy5cb8KTnuMBlk1+TpfM3G0bxC1Z
 deykpMbC5GfwPHmjNluHAcOGts5TahZzLG131/jjGhY0UGN9FadvGK/q4OpBaamuRZeV
 dv3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701734538; x=1702339338;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=3xI9L7eTJe/QWXc9juI1mud1Z9AYoG2UULweun2XvpI=;
 b=Gd5s0d9NiCJAmzjn0SQMolugR1y0fe0TEMUAimb/wh/Zpux2PVeV6OR1Lc088+RdC1
 D7xe6xpCNiVxHJIChVMtXOiC3udQ+hwIqi12deJwTAGTebKlsDc+LcxHTYOXhuxyzBjj
 ktJj+2OnmcTHYujUo8uOJ+D4cxAu9Zw08iuYIjDKMSBMslQfSnLqGKWCBEyz3afCq/yx
 tqu6UpKu78zZQXYQvX9pAV12+8SEfsrz4f4tRRAIp3ve0FwVSIA5uiiUwYivVGm2b1LG
 OPeo2J2i3anXvQdQhi+/l9H6uRrtAeFHIqNCvM+icqEpoYY0H/kY4jtmgNq0YLdHDHr+
 Pzhw==
X-Gm-Message-State: AOJu0YzenS0las/hIIWS7krhMa6jocoxJsRn8vD/rn8JrG9USpGiCjxq
 GBa5hTfpXyOtjoUazD3a3L7ScUp+j1CK6Zzu9vkrpxAsuamMUYwF
X-Google-Smtp-Source: AGHT+IEOxPFF2KkSzJwDCbpCS7ZMeUuG+qV9rs6KCCZ8WFQySImhbc9P6KBg4Cq+5fa2Ay84+VlcJgXdf0LG8qDHprE=
X-Received: by 2002:a81:4328:0:b0:5d7:1941:355c with SMTP id
 q40-20020a814328000000b005d71941355cmr3549292ywa.67.1701734538332; Mon, 04
 Dec 2023 16:02:18 -0800 (PST)
MIME-Version: 1.0
References: <20231203115315.1306124-1-dmitry.baryshkov@linaro.org>
 <20231203115315.1306124-4-dmitry.baryshkov@linaro.org>
 <8b556eac-a874-a3cb-60bb-33e5142afdc7@quicinc.com>
In-Reply-To: <8b556eac-a874-a3cb-60bb-33e5142afdc7@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Tue, 5 Dec 2023 02:02:07 +0200
Message-ID: <CAA8EJpp3NS605Sv65KH4WD_44sn8KG52depnAYDRjg2nT0NChQ@mail.gmail.com>
Subject: Re: [PATCH RESEND v2 3/3] drm/msm/dpu: move encoder status to
 standard encoder debugfs dir
To: Abhinav Kumar <quic_abhinavk@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, freedreno@lists.freedesktop.org,
 Maxime Ripard <mripard@kernel.org>, dri-devel@lists.freedesktop.org,
 linux-arm-msm@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 5 Dec 2023 at 01:36, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
>
>
>
> On 12/3/2023 3:53 AM, Dmitry Baryshkov wrote:
> > Now as we have standard per-encoder debugfs directory, move DPU encoder
> > status file to that directory.
> >
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > ---
> >   drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 45 +++------------------
> >   1 file changed, 6 insertions(+), 39 deletions(-)
> >
>
> For this change,
>
> Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
>
> Looking more closely at other drivers, most of them (atleast what I
> checked) were doing the same functionality in drm_encoder's
> late_register / early_unregister as DPU.
>
> This can be a wider cleanup across the tree if needed or we can stop here.

Yes, that's why I thought that this is a good idea. I think I'll let
other driver maintainers rework their drivers.

-- 
With best wishes
Dmitry
