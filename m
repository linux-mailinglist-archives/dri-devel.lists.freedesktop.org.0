Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3708F874091
	for <lists+dri-devel@lfdr.de>; Wed,  6 Mar 2024 20:37:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7628C1134BE;
	Wed,  6 Mar 2024 19:37:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="sF2aBxdp";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-f177.google.com (mail-yw1-f177.google.com
 [209.85.128.177])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C52EC1134B9
 for <dri-devel@lists.freedesktop.org>; Wed,  6 Mar 2024 19:37:25 +0000 (UTC)
Received: by mail-yw1-f177.google.com with SMTP id
 00721157ae682-609d9ce5bdeso830157b3.2
 for <dri-devel@lists.freedesktop.org>; Wed, 06 Mar 2024 11:37:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1709753844; x=1710358644; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=GNGb5BZ7AINJbJgQXn/Q7jDuTAr3ISUOPfFvM1cAIAU=;
 b=sF2aBxdpVbr5Jy0BPQ+cDrCm56jPQEJvrz3ZQRL1gd92pMs81DAXwkOVdyEDdNLc+P
 4QtVaEpUwSOntbejL4647fNf/L7nW2JE55cdj4GTp4Iv6DngtKrOVS+nhQ1KYMPbQ+Lp
 vXp3QPdGdJJlFyn9vI5CUlVAnMQaJ7R+6BAc2/yQFE5ZRUwIAJy/HiSJMKp3FjtM3XMX
 Hkvup160qMmz5epWIM6bdKD53R8Omu5+SxInE4zqaLcMGCpeMZJJj9Dx21pcn6wmb5Eg
 e9iDM9CopyQGAqa+YnmnAQNXXuALoY94/sB+804TlYwZAGnDrQjkA5hmK5L/SAVIMxR8
 /IjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709753844; x=1710358644;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=GNGb5BZ7AINJbJgQXn/Q7jDuTAr3ISUOPfFvM1cAIAU=;
 b=C2YGd7RYdkwIq9XbLwCxGuZ1I21m+ZVoxTWFhusOvaN3AK/5K0WW9aCWc4Eiea+K0m
 VdXZUvbYr8wMjwAM0Q1HIKFS1ZHx1n0KSlcM3RMxysOBca0/dNAdfPK2bPsYttiDnQo1
 6nKgIJG6R4wqTMa2gFGtkXAxVZ/q3xFdQs/u4fdqrl1qXPmRHJxM4+ApvDO8Jeyzn2AF
 lFF2uqbyi13n/zQoXtos3C56MPZ1YRwt+s4Xs2QRMkxaboX8PqL1kUtPssDE73+Bu09l
 TkgqFIdAW/k/QpsWNQOz9dT64lA97hHDsXGgWlDpyJEJhGryHQIpFCzyjjsRA8S33PhR
 lB+A==
X-Forwarded-Encrypted: i=1;
 AJvYcCVrg91ul/BzrBLY41eLWZlKgiFM4EZfzx03Lsj54Q7TJV6bsiQcaA9y8H0BBgmHGG5YVmvkh4eN0FhF4mtx6Cug4CGthPElrlC1pI/8adMp
X-Gm-Message-State: AOJu0YxNGiAzD1i5at4Ymrm9ILkjcF/vwpzbgz+U53peksDPGaTC5jSm
 FpHW2ZL4SKBJQ8gzox2B/sEdA8Mn+exFBX3Dn5BPYmqHoxzH0i7D5zDwAai8GF6geg/wUDdj3jg
 7A47WFi+/8qCTcii6HpuySNAQfZhA3Sc6vqOXag==
X-Google-Smtp-Source: AGHT+IHuei9cSteH/A4mQ8tGokXyI8WejeGtf2o3u3B0yT5hvLrRj3UV5f5zbG98ZxwHbe98Gp2+giMbUEY+VqeSeS0=
X-Received: by 2002:a0d:e8c4:0:b0:609:845a:4a89 with SMTP id
 r187-20020a0de8c4000000b00609845a4a89mr16100721ywe.39.1709753844667; Wed, 06
 Mar 2024 11:37:24 -0800 (PST)
MIME-Version: 1.0
References: <20240306193515.455388-1-quic_abhinavk@quicinc.com>
In-Reply-To: <20240306193515.455388-1-quic_abhinavk@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Wed, 6 Mar 2024 21:37:13 +0200
Message-ID: <CAA8EJpqATJdV6f7Yi4gDeSpmgd45TUxqFmtk-nniPe6EhtFtXg@mail.gmail.com>
Subject: Re: [PATCH] drm/msm/dp: fix typo in
 dp_display_handle_port_status_changed()
To: Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc: freedreno@lists.freedesktop.org, Rob Clark <robdclark@gmail.com>, 
 Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Kuogee Hsieh <quic_khsieh@quicinc.com>, dri-devel@lists.freedesktop.org, 
 swboyd@chromium.org, quic_jesszhan@quicinc.com, quic_parellan@quicinc.com, 
 Rob Clark <robdclark@chromium.org>, linux-arm-msm@vger.kernel.org, 
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

On Wed, 6 Mar 2024 at 21:35, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
>
> Fix the typo in the name of dp_display_handle_port_status_changed().
>
> Fixes: c58eb1b54fee ("drm/msm/dp: fix connect/disconnect handled at irq_hpd")
> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


-- 
With best wishes
Dmitry
