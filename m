Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B88B088CADB
	for <lists+dri-devel@lfdr.de>; Tue, 26 Mar 2024 18:29:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EC68110F15E;
	Tue, 26 Mar 2024 17:29:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="wt8Ic3/5";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-f173.google.com (mail-yb1-f173.google.com
 [209.85.219.173])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9D71010F15E
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Mar 2024 17:29:24 +0000 (UTC)
Received: by mail-yb1-f173.google.com with SMTP id
 3f1490d57ef6-dcbef31a9dbso4221832276.1
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Mar 2024 10:29:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1711474163; x=1712078963; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=11p0UMmKH1MnLtrO/gYwy55UQmZhc7eSQzB1zZ0+1Y8=;
 b=wt8Ic3/5dmOy/fiZwC5ssxwv6miDZhgBq1bQ0RIUNz+Lted8pqrFUi6+ZN7YQuotgg
 SrsQ+aVY82Y1Va0/Wg7GOqmkmDpcpolI9wK/W+R7Vl40UY+ch5MzvV6kQdA1bcKjzqZh
 QFv3/MBYbVgMa23oCFA7yCDaH9fMzUCRv6Gd2QGvH+Dx5gFH7LipRsaFaTnb1/7NWV0S
 M/FqSMGa1JL810AcaoL04Rnp+a+kr/LfL/I9OQbm38jVqSOiiHhBBiCiLLRcF2RNVQae
 CNKSKgjSuYmqqgWfCDIA7ssONfUMh9iFG7vJ/ndFVh4EpfEkWatJj9xJeHKQ5Dwa1upd
 uk8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1711474163; x=1712078963;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=11p0UMmKH1MnLtrO/gYwy55UQmZhc7eSQzB1zZ0+1Y8=;
 b=CCzncB4FGBDrfZ8mHf9Xgz00ljZz5JobkN18sBAKYuQnCS2dQdWFt7uTGyeY//ITKa
 NQt8NUEp7sSu+VoFHgpkxKzNCePXawlTAFkhwA1d9ufNg5/iWWEefoVt0leMy/ubllkK
 8Dd11eMLuU9eoTo6eIkv58B1Czn7o3JludH8GLm6yZ6CXcxGWFftkegSzIno2JdiZiHA
 ZUid9VG00RlkMfthaWvHz1PCk7JFccySEbJVuZyYd/NTrR5r0pIEiLXFbMjYjDOMweh5
 zMBbHxKtRuTpzJnvqhP7wA5LcY9aK7l7pnNx5/UR87tB60CVSEdcjud1XNnnZyZBEQuO
 ePMA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXFlq6cJqs5EYkWk1kqYyXjJLJy4IvUM/uVA0B8/OTSOhrwoUgxAQRLy2UUHoueBPAJ7nmLc7yL3nkxX7+bdEo3aT1PQOAoo9pEyCvGaiCy
X-Gm-Message-State: AOJu0YzOvHrLJXDErvALzrEpZstTyTd2uuoRMynX+bu0gqZBPG3h7EeQ
 HpAVitiLMO8xnWgWx0ZL+655F2ey5K93+7I6lYY9aA+1taDi6pNtsPxFoLfSDWlxZ0HcvRiWxRE
 eRoH39Z0hnJqiIBFlBqjBstz7PSLfpz0E9o3MSA==
X-Google-Smtp-Source: AGHT+IEOabZ1Kz0WgVjOqqWDaky7HSvouC3ZuU/CFz3IlxB6Zt/5TpK+icVIpdKPsEQ3pgI240eYE6V09+ITV2S47Yg=
X-Received: by 2002:a5b:98f:0:b0:dc7:42b8:2561 with SMTP id
 c15-20020a5b098f000000b00dc742b82561mr9218122ybq.34.1711474163590; Tue, 26
 Mar 2024 10:29:23 -0700 (PDT)
MIME-Version: 1.0
References: <20240326-msm-dp-cleanup-v1-0-e775556ecec0@quicinc.com>
 <20240326-msm-dp-cleanup-v1-2-e775556ecec0@quicinc.com>
In-Reply-To: <20240326-msm-dp-cleanup-v1-2-e775556ecec0@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Tue, 26 Mar 2024 19:29:12 +0200
Message-ID: <CAA8EJpqeV-GCizJ5t-BvLDt_O0k6qQ+omma+8KkwFtX3PP_uxw@mail.gmail.com>
Subject: Re: [PATCH 2/6] drm/msm/dp: Removed fixed nvid "support"
To: Bjorn Andersson <andersson@kernel.org>,
 Kuogee Hsieh <quic_khsieh@quicinc.com>
Cc: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 linux-arm-msm@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, Bjorn Andersson <quic_bjorande@quicinc.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 26 Mar 2024 at 17:06, Bjorn Andersson <andersson@kernel.org> wrote:
>
> From: Bjorn Andersson <quic_bjorande@quicinc.com>
>
> The "desc" member of struct dp_panel is zero-initialized during
> allocation and never assigned, resulting in dp_ctrl_use_fixed_nvid()
> never returning true. This returned boolean value is passed around but
> never acted upon.
>
> Perform constant propagation and remove the traces of "fixed nvid".
>
> Signed-off-by: Bjorn Andersson <quic_bjorande@quicinc.com>
> ---
>  drivers/gpu/drm/msm/dp/dp_catalog.c |  2 +-
>  drivers/gpu/drm/msm/dp/dp_catalog.h |  2 +-
>  drivers/gpu/drm/msm/dp/dp_ctrl.c    | 17 +----------------
>  drivers/gpu/drm/msm/dp/dp_panel.h   |  1 -
>  4 files changed, 3 insertions(+), 19 deletions(-)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

Kuogee could you possibly comment, why was this necessary at all?

-- 
With best wishes
Dmitry
