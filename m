Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0682F9F38F2
	for <lists+dri-devel@lfdr.de>; Mon, 16 Dec 2024 19:29:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C25E710E75D;
	Mon, 16 Dec 2024 18:29:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="UW8NUrUU";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-x112c.google.com (mail-yw1-x112c.google.com
 [IPv6:2607:f8b0:4864:20::112c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2C57310E75D
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Dec 2024 18:29:03 +0000 (UTC)
Received: by mail-yw1-x112c.google.com with SMTP id
 00721157ae682-6eff5f99de4so49385797b3.1
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Dec 2024 10:29:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1734373742; x=1734978542;
 darn=lists.freedesktop.org; 
 h=cc:to:subject:message-id:date:user-agent:from:references
 :in-reply-to:mime-version:from:to:cc:subject:date:message-id
 :reply-to; bh=/TIlSRQ7ahuGDkgFihn78l4akEjGDGdpYykjVXL65kQ=;
 b=UW8NUrUUe9654SEVe7pI1c+Lgs2TMoTdolmBW3KaAKrfvcGLDCLTYhHCnyueCw4MPZ
 77FdCuOkz5qjXZwl4YkmI5qYvUfbMK1q7vBq3cqd5HzMvazTFdqg61jqa0LCsPXx/6gU
 YQdrQXnlVabKmgjv46sTJfVoIbgpRpXaL3r8Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1734373742; x=1734978542;
 h=cc:to:subject:message-id:date:user-agent:from:references
 :in-reply-to:mime-version:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=/TIlSRQ7ahuGDkgFihn78l4akEjGDGdpYykjVXL65kQ=;
 b=JaFsPSsF2asvwFNutys9hqA/1TN8FgiHcTiar7i4BAB5kMZz88B81XDgppQyrxo9pu
 coYLb7P5EXxJHoyCrbZ2GHUSS4GZIjUw7b5wGcPQfjLVDRda+RR6d4XPCr2VDsS3E9pN
 sxecWbELdi7uveR7FDYBNQ0WFJFsFQqfvhACABrWI7Tuve716XMXTeEqB2kTea7+qRBD
 /YQ/tlstd/Um9mXr1C6cs3otNOD2zF2zvX1gqcIvxR+/7f4xFhZwIPpNsKBKv5vaMQEM
 /EytmhyhfRgKdspmpVbtLA4LuyLvGa+MEhKq2kjhOn5WHWyxQRFpj2sZgXHblD2tx4l6
 k0SQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXKpm6FZed+iAvlI0K8QIiSB1930eAkfvWzBpv6r8A9NLvBiHPMaVccSIKsGzxHlkTALOe1adjMKgs=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxA5duk4xINZDOG/s1Mv4QSc+yEFns++2Wcs8xqaEpw5uSQ5PQY
 EKt2YfMn6VYQDQsh+LOCgq2xGU3QpTuf04yxLc7JGg2bMsFgMr04h0fpk0siBivXVBgM9eCLZCY
 HiZ+VyK9ifRjn66wyBk2Zwg3O9YB26bK+8zx8
X-Gm-Gg: ASbGncuEQ9pg0oAx5YISQokNUTQ/8z5WHU/HSDm9tPNb/rEHrBeZetmA7IW6NKn+T8g
 zs4Ca8IFZXjUoQ9dOqotu9iSBCmNu6k2x3BLQgsDHwuSTFoyXpsncpXuy0/nGO2EDPQ==
X-Google-Smtp-Source: AGHT+IFQ80scUMo8d9IxWp5aJ4xwNtnqqvy6ffJBkw26JRJsHSxXxD+1I6D1JK6A0t7aCTHue6+bvR9ehNx3WdpmehA=
X-Received: by 2002:a05:690c:b15:b0:6ee:5cf9:f898 with SMTP id
 00721157ae682-6f279b75052mr120990327b3.33.1734373742393; Mon, 16 Dec 2024
 10:29:02 -0800 (PST)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 16 Dec 2024 12:29:01 -0600
MIME-Version: 1.0
In-Reply-To: <20241216-fd-dp-audio-fixup-v4-5-f8d1961cf22f@linaro.org>
References: <20241216-fd-dp-audio-fixup-v4-0-f8d1961cf22f@linaro.org>
 <20241216-fd-dp-audio-fixup-v4-5-f8d1961cf22f@linaro.org>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.12.dev1+gaa8c22fdeedb
Date: Mon, 16 Dec 2024 12:29:01 -0600
Message-ID: <CAE-0n52S3k01eueL_GZ4Dk359x879EDiOJ7zHK_BduM3bkJVOQ@mail.gmail.com>
Subject: Re: [PATCH v4 05/16] drm/msm/dp: stop passing panel to
 msm_dp_audio_get()
To: Abhinav Kumar <quic_abhinavk@quicinc.com>, David Airlie <airlied@gmail.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 Marijn Suijten <marijn.suijten@somainline.org>,
 Paloma Arellano <quic_parellan@quicinc.com>, 
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Simona Vetter <simona@ffwll.ch>
Cc: Douglas Anderson <dianders@chromium.org>, linux-arm-msm@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org
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

Quoting Dmitry Baryshkov (2024-12-15 14:44:10)
> The dp_audio module doesn't make any use of the passed DP panel
> instance. Drop the argument.
>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
Tested-by: Stephen Boyd <swboyd@chromium.org> # sc7180-trogdor
