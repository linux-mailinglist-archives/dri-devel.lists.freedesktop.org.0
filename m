Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B0F638004DE
	for <lists+dri-devel@lfdr.de>; Fri,  1 Dec 2023 08:41:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0595110E804;
	Fri,  1 Dec 2023 07:41:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-x1132.google.com (mail-yw1-x1132.google.com
 [IPv6:2607:f8b0:4864:20::1132])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B177910E809
 for <dri-devel@lists.freedesktop.org>; Fri,  1 Dec 2023 07:41:41 +0000 (UTC)
Received: by mail-yw1-x1132.google.com with SMTP id
 00721157ae682-5cfc3a48ab2so19969777b3.0
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Nov 2023 23:41:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1701416501; x=1702021301; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=i0XSc3CmqydMornUaDDfp0sHFoeCR+iaudYxBuXUebQ=;
 b=EmXLiLw83YVjzQRyuhsrl6El6NA5QPPLj6w6otNKM4FzyngpjQsaSjMQxXlYa7MHcV
 1Ou6uEtSgRt6OywBBIRFQtGTpwxUiXS9V8cRrJp4X084aGh8us2fhUApovhWMyJOmm2a
 3liU5k2gdMfJXutEM/bMeh5hY7QGPgOWayMtRQQIvD5wu6nUEgPDBkF0YSHIgpjEQTW0
 6BlqhyZSAVH0LRTuIKlhZmghsnym12mGYOTPjarVXt4NGyE/jPTnrKkVBJZlBV2AaD8A
 ncEtcw5SlGJePCd2TnUdsHS+tQPywTvMv3GQ70SFMUvPiUk4lZjOv5WeUO5sKLNZ/aRz
 zYsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701416501; x=1702021301;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=i0XSc3CmqydMornUaDDfp0sHFoeCR+iaudYxBuXUebQ=;
 b=PQUKjEuPCo1mZr+TXPfTsG22YptQNeJ3qsq7kPAp0qGRfulOmJlnMWcupVp/SM7JZs
 irSCxh6eOMgdPIWxK8YslsMSvnPQ+BzEdWoK0Dw8jKj8z0iNYA7gF1Fzq0eoEQXX61p2
 gDpUR6kYPvULh286AKRtDdMoINOw/8+V5C3Dsr0NpJ0tEgU33MdIh7MLJW54UQXvTxsM
 Q3qMpeN3KZ4HzldoS7vT317wekXaWdx64V+0ehSPnOSG1tUkB6plCa4oES2GIyiXPkOT
 IkIP+IwxUF1cK3pKMICh3rArq4aDDAIKScgNxR6Y8R8iY5C3Ebj5PRSnpX7RKvcCyrIw
 SEwA==
X-Gm-Message-State: AOJu0Yxe+RWDp9RUUaePnnlss/nSRv3ii/AqKsgBnJzuzRPKlxH1JypT
 ll30z8Z++tvpEOTJDpO4Ag+9fEBJ+GCF9w02QgHi6A==
X-Google-Smtp-Source: AGHT+IHdkwEvjszcJvfywc8Jpimsn1KEvtMQIBx9T044fmlSpJfllVrTTdQUFvJqGwQtnx6zsdDOuMBQYw8GmjCE0wU=
X-Received: by 2002:a81:7808:0:b0:5d3:c23c:d6a with SMTP id
 t8-20020a817808000000b005d3c23c0d6amr2594670ywc.18.1701416500809; Thu, 30 Nov
 2023 23:41:40 -0800 (PST)
MIME-Version: 1.0
References: <20231201014101.15802-1-quic_parellan@quicinc.com>
In-Reply-To: <20231201014101.15802-1-quic_parellan@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 1 Dec 2023 09:41:29 +0200
Message-ID: <CAA8EJprzcWTmqkUNN2r81APkv3rE039xhmaZW5=Zp7WkkQ=pHQ@mail.gmail.com>
Subject: Re: [PATCH v3 0/2] Stabilize use of vblank_refcount
To: Paloma Arellano <quic_parellan@quicinc.com>
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
Cc: linux-arm-msm@vger.kernel.org, quic_abhinavk@quicinc.com,
 dri-devel@lists.freedesktop.org, swboyd@chromium.org, seanpaul@chromium.org,
 steev@kali.org, marijn.suijten@somainline.org, quic_jesszhan@quicinc.com,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, 1 Dec 2023 at 03:41, Paloma Arellano <quic_parellan@quicinc.com> wrote:
>
> There is currently a race condition occuring when accessing
> vblank_refcount. Therefore, vblank irq timeouts may occur.
>
> Avoid any vblank irq timeouts by stablizing the use of vblank_refcount.
>
> Changes from prior versions:
>    v2: - Slightly changed wording of patch #2 commit message
>    v3: - Mistakenly did not change wording of patch #2 in last version.
>          It is done now.

Usually sending a series once a day is enough. If you have any pending
changes, it might be better to reply to your patch stating that you
want to do this and that, while still allowing reviewers to respond
(and thus you can incorporate their review in the next iteration).

>
> Paloma Arellano (2):
>   drm/msm/dpu: Modify vblank_refcount if error in callback
>   drm/msm/dpu: Add mutex lock in control vblank irq
>
>  drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c          |  6 ++++++
>  drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h     |  6 ++++++
>  drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c | 11 +++++++++--
>  drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c | 11 +++++++++--
>  4 files changed, 30 insertions(+), 4 deletions(-)
>
> --
> 2.41.0
>


-- 
With best wishes
Dmitry
