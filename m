Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A8F4827ABD
	for <lists+dri-devel@lfdr.de>; Mon,  8 Jan 2024 23:43:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4920D10E2E0;
	Mon,  8 Jan 2024 22:43:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb2d.google.com (mail-yb1-xb2d.google.com
 [IPv6:2607:f8b0:4864:20::b2d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5E07F10E2E0
 for <dri-devel@lists.freedesktop.org>; Mon,  8 Jan 2024 22:43:44 +0000 (UTC)
Received: by mail-yb1-xb2d.google.com with SMTP id
 3f1490d57ef6-dbed4b84667so1590056276.0
 for <dri-devel@lists.freedesktop.org>; Mon, 08 Jan 2024 14:43:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1704753823; x=1705358623; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=yWZ/93/0FZh/gn5cm1zBSBRnDMVQRiaGGWGBlyAPerw=;
 b=iR44LteKY/CR5P+NTTQVaTD7Y5aXuk4e8RUyizoNRFPcOyTMbuF+aKloICGtB76ReR
 WUoL3rck/yNVJWgPIBWteQ+a8caDjU7LUjLVJrEgBOT5VhD/3iFuGmtUI7qDpLVO8ZvS
 DJnV1PY8hSwyMlFMWTg24ctxFUXAGWTef/eyPUrb5eXrqUUMtKNSPxr9fu9ynNLnVS89
 VAbnsTz86Ydfzf8VMgi0N4FIA5O3cxOYVzgb6bsM4C6VxDkX820yOy8APrGsmRVJALwc
 iuVx2vr0Zi0exqW5HPgoU+lE32k6vdQ44D7szjdQvxXN+zficWsjArj7+BbJ8OKKf99C
 iTnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704753823; x=1705358623;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=yWZ/93/0FZh/gn5cm1zBSBRnDMVQRiaGGWGBlyAPerw=;
 b=OR64m/pBwrQBhE0RGUoBpiQMU7ezEDfnYULrY3IcyuEKOMPrCqpq2+DzxyQbf/j3YZ
 GxdLWGADlr5ChAtukIKX4IxvFPAsL77MUmQ7VxAa+4RN8B2Y6ejRJ7QCh/QlxSu0qmUS
 5qn22MXq+Gfr+P8KCikvY48UiJOMUyuGRijg7ilVDMP5PnVAr6UXSExTqw+xF61/mweC
 GuTjUdD9F7x9/DKDV8GfRXq8QB4QanKk+A9VtKn5o6vQgXoOHHRQJUq+yU7UP6tfpePS
 m84gTG1v1xSAbb7MQy0/20JmUZkuLcg6IY6TmkZk+4sqHN2e6x1NV4WgDEC12b6oD9Qe
 ndjw==
X-Gm-Message-State: AOJu0YxPTi8hM6t4EPVMj18qrcC0UFTkUS7Jik+arpAkck3tyj+8efe2
 /q7TG4T2YIRFAzb9/Zvpa4hF9kuG5/B33lBNZGKcR0FElebTXg==
X-Google-Smtp-Source: AGHT+IFdl1xSh3s2jD5qgED4ACRR92qOyXXHTlK0brp8aUmpvjPvWC95g+KDfZXY9Fwki8NSHqhSBb3lWuSIPGPXyf8=
X-Received: by 2002:a05:6902:2510:b0:db5:4d4b:d8a7 with SMTP id
 dt16-20020a056902251000b00db54d4bd8a7mr2127690ybb.50.1704753823315; Mon, 08
 Jan 2024 14:43:43 -0800 (PST)
MIME-Version: 1.0
References: <20231225130853.3659424-1-dmitry.baryshkov@linaro.org>
 <20231225130853.3659424-5-dmitry.baryshkov@linaro.org>
 <2a536654-b5ec-3599-6f0a-2e369b080c70@quicinc.com>
In-Reply-To: <2a536654-b5ec-3599-6f0a-2e369b080c70@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Tue, 9 Jan 2024 00:43:32 +0200
Message-ID: <CAA8EJpohQoApcvJuxt5_Xxjx88xSCxPyCkeAbXHsG7s1_6o3wA@mail.gmail.com>
Subject: Re: [PATCH v3 4/5] drm/msm/dpu: move writeback's atomic_check to
 dpu_writeback.c
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
Cc: freedreno@lists.freedesktop.org, Bjorn Andersson <andersson@kernel.org>,
 dri-devel@lists.freedesktop.org, Stephen Boyd <swboyd@chromium.org>,
 linux-arm-msm@vger.kernel.org, Marijn Suijten <marijn.suijten@somainline.org>,
 Sean Paul <sean@poorly.run>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, 8 Jan 2024 at 23:39, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
>
>
>
> On 12/25/2023 5:08 AM, Dmitry Baryshkov wrote:
> > dpu_encoder_phys_wb is the only user of encoder's atomic_check callback.
> > Move corresponding checks to drm_writeback_connector's implementation
> > and drop the dpu_encoder_phys_wb_atomic_check() function.
> >
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > ---
> >   .../drm/msm/disp/dpu1/dpu_encoder_phys_wb.c   | 54 ------------------
> >   drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c       |  9 ++-
> >   drivers/gpu/drm/msm/disp/dpu1/dpu_writeback.c | 57 ++++++++++++++++++-
> >   drivers/gpu/drm/msm/disp/dpu1/dpu_writeback.h |  3 +-
> >   4 files changed, 64 insertions(+), 59 deletions(-)
> >
>
> I am fine with this change with respect to how the code is today.
>
> Hence,
>
> Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
>
> But if we start noticing a pattern like below in dpu_encoder.c's
> atomic_check,
>
> if (INTF_WB)
> .....
> else if (INTF_DP || INTF_DSI)
> .....
>
> then, it will demand bringing back a phys specific callback.

The problem is that INTF_DP || INTF_DSI does not have the
phys-specific implementation. So while I agree about the INTF_WB part,
INTF_DP || INTF_DSI either should go as is, or it should be refactored
into output-specific handlers.

-- 
With best wishes
Dmitry
