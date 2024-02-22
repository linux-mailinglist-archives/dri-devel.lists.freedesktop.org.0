Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9117485EF2B
	for <lists+dri-devel@lfdr.de>; Thu, 22 Feb 2024 03:36:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3C0C210E83D;
	Thu, 22 Feb 2024 02:36:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="eVTgwVg0";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-f171.google.com (mail-yw1-f171.google.com
 [209.85.128.171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B198A10E83D
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Feb 2024 02:36:44 +0000 (UTC)
Received: by mail-yw1-f171.google.com with SMTP id
 00721157ae682-607e54b6cf5so3298657b3.0
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Feb 2024 18:36:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1708569403; x=1709174203; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=ex/qgQGXt7I+7DTRMMrl9hcZbKjDkDxeMDhblP7uzZo=;
 b=eVTgwVg0VW8xmQT32dTkbaRxn16aDf3dewPH8PTSdTQaZG5VT3E/uaJg3muSbyr1+d
 80pP8DfzoCL8Py7MNZjS1FlBkDCIPZ4Bj4JuZoUlKLN2kpuWUl305Zve4sDGEe8/ocDq
 Ao8jDIkcxAeWo1pKVQFiRGW8a9C9ro4xO7nJSsOSJOiHwWDiqslcyDWxTb8J5zvXEhu/
 vmSUvArcaQJWtRzUUQjP1XiJrXH1Fivd1O8DIA4Y4uwlsFCVZtYjKP1THaSCDcRrieBl
 tvER9sIrP4qm6n6QKyWuWg4U9r1WNo8Fzl3u5FWWXbVj4RZ/KEOnmZj93ZUx4pMu8EWJ
 vESw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708569403; x=1709174203;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ex/qgQGXt7I+7DTRMMrl9hcZbKjDkDxeMDhblP7uzZo=;
 b=BDZFlj4T3H1W/U4ByEoEkhaVnC9EP+gNV0wS+R9yPtepsZIFE2ZhlHthf0aor9UnKQ
 D7hoiQYB02HvIZ5DH4+MnYe5/fphlhLN1sCxQ/fDtH8jdZ619aT9MU9bKjhyc3TKNPHC
 EP+YXS3J+peliTtC37RVZV8mE8C5CRgmuXGuu8J/Sv2FQrPPFzaDeYKz1/XW8hBwy6cK
 BMwt5cCiyoQLgk+OSzJNkKrfuZ+jcnoGKoBQprjr8rr3++er0aZKeLWC2XzN6sAImqMu
 ULRh+CSS/A8T63O9EeXFo/j+FOZAa8iSVni9O3B0bkdO2Ct6R479WCGKoOSV3TxF6E6L
 eb6w==
X-Forwarded-Encrypted: i=1;
 AJvYcCWMayRGwir1x6nmSH8PVWCuYeyPdUML65k8c+2pdGunhwSEs2syoCPAyxCVAevMHdu6xPOow8iZ3SN2Se03dejKM45cDrqjUYeup6xr39hc
X-Gm-Message-State: AOJu0YzsgVqvuxYhuLEJ+3C5PaJa3m11WlNdaURypohze5Of6lHJlneh
 TkKvWn/MmakTl1ql4jjnntHqp+hkZ3aMY+fUXgC3wYEWmPF6fV1NWt1Fa1PyBKTgXXjBQAzEn5r
 g2WBKMLVRVVSmZrV/l5eEJcdYm5nu5KYiS9fPAA==
X-Google-Smtp-Source: AGHT+IF6DtJIMjCodEyUY/qWcBvG/l4B5U7/74mJYMS7Q6XDQkr9ZX6fbumrpxwW4rEDcCk4U6VVw8CKa+BUHQDEgd4=
X-Received: by 2002:a81:844c:0:b0:608:93a7:3d8d with SMTP id
 u73-20020a81844c000000b0060893a73d8dmr611679ywf.25.1708569403647; Wed, 21 Feb
 2024 18:36:43 -0800 (PST)
MIME-Version: 1.0
References: <20240220121741.2994222-1-dmitry.baryshkov@linaro.org>
 <54a3f3d9-ad3e-4828-96c0-61dd81c61d76@collabora.com>
In-Reply-To: <54a3f3d9-ad3e-4828-96c0-61dd81c61d76@collabora.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Thu, 22 Feb 2024 04:36:32 +0200
Message-ID: <CAA8EJpq-17XSwmoT1HKVgxi=fUKD-fETtwbtpznR+RY+iFCE6w@mail.gmail.com>
Subject: Re: [PATCH] drm: ci: uprev IGT
To: Helen Koike <helen.koike@collabora.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, 
 Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
 linux-arm-msm@vger.kernel.org
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

On Tue, 20 Feb 2024 at 16:31, Helen Koike <helen.koike@collabora.com> wrote:
>
>
>
> On 20/02/2024 09:17, Dmitry Baryshkov wrote:
> > Bump IGT revision to pick up Rob Clark's fixes for the msm driver:
> >
> > - msm_submit@invalid-duplicate-bo-submit,Fail
> >
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>
> Do you have a gitlab pipeline link I can check?

Before uprev: https://gitlab.freedesktop.org/drm/msm/-/pipelines/1109455

After uprev: https://gitlab.freedesktop.org/drm/msm/-/pipelines/1109501

-- 
With best wishes
Dmitry
