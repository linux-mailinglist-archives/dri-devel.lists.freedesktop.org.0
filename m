Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 987678994CD
	for <lists+dri-devel@lfdr.de>; Fri,  5 Apr 2024 07:49:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7A6E6113917;
	Fri,  5 Apr 2024 05:49:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="VMVEj1QS";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com
 [209.85.208.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9C461113910;
 Fri,  5 Apr 2024 05:49:10 +0000 (UTC)
Received: by mail-ed1-f52.google.com with SMTP id
 4fb4d7f45d1cf-56c5d05128dso2091405a12.0; 
 Thu, 04 Apr 2024 22:49:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1712296149; x=1712900949; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=ZZKOFz6ndGM4V5kyukstdMcEsPcO/J51RsMhMKg1OJo=;
 b=VMVEj1QSMMJmOiIre6BHsioiXp6to55nOJXgSSzVlRk8t+plSVrUvtGynEcfcxGzqd
 pnY4UJeZToKflAnHnjWeVz+TJvq3Go2fdL4hOxQVdUw3AFl1knqTCAIiNlpm1j165rtW
 33aj9P9LDfrm//rx7GbVaiL3SOdUxvF1vT7PvIIOQER/+jsevkxiKrD0qFgSQ+7bl928
 W+S+SxVKjZZutDOzOxrCbuUNixWsGqZyOAgbWo98sectIbB//v0mkKehqCs6DxTKnAne
 OaPL1ssFJ+EFFWoCY7wLnUcJpm/7N4wMVxFrbE+yM44I4zwgUqI+Ajije7nFhvCSFaRx
 AUgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1712296149; x=1712900949;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ZZKOFz6ndGM4V5kyukstdMcEsPcO/J51RsMhMKg1OJo=;
 b=uRSrSRZGn0u36ibuskNmAAvdYNkmRWcNbVI6dn8F59cW0jIesuFc4Ql8TDKv6AsdSP
 ByMO/9MTxOBvbymk2EKz549+hZiBrgfzU6hVL1bLtkPkeFpJqhlo+Y/0B2GsGCVkrmjb
 E3E6H81MfwtoACf53pn1zuktoPt8G9+AHzBM7ZxF88F9G6atD7SgjZM4Q7SpNtw/9bA2
 BZz1bgZfgTdIz0sdIpLnJov1ZUkpctSatE9uNHDrVwM7qGOgujR7AcPO/2+wlsWua8lq
 k/8gDlAJjyA0bR6RODm1jXTPxquk22uhQFbosQSzpiz+UPWRE5hK0N728aodvDbgnJPe
 YVYg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXwa9IkvTf7+GW/dhXMp0tdYS6Igof+IWdQRSgaz9E3t648SqCHDCauDdJ6pZiDVrDwjylH4+B4Skfs6mkXRf81D9wA/9QbDxTMaPuGu5pTMUBP4bnLIZUSBE8v48tdPMAlcgLR+0gKjukLJqEPiPba
X-Gm-Message-State: AOJu0YxUr2rr8qiWRqD8mL8oN+vdMRKdvuho6qXxAUjnKpG5tjUzev1x
 n6YvrAPr6gOA7qWKud1Ih9aaxBF1nthz6RpKPcaHnt9hlcyBV5hYE1kRrMITIp2ovI59A2xN69f
 ZWogwhAaW4fWc/pt2vLg+yyMxKfg=
X-Google-Smtp-Source: AGHT+IEHU8JkUqjrnhPwohYAWoxv8H66yzcJ9LBbvY+7XMSq/92aLDElEDpOiWktBF8uDc+wXmV650EDLIzDNqNXR3g=
X-Received: by 2002:a17:906:4e93:b0:a4e:757:989a with SMTP id
 v19-20020a1709064e9300b00a4e0757989amr230219eju.8.1712296148621; Thu, 04 Apr
 2024 22:49:08 -0700 (PDT)
MIME-Version: 1.0
References: <20240326212324.185832-1-ojeda@kernel.org>
 <da9dcd58-41c1-089c-2061-be3bad6349a7@quicinc.com>
In-Reply-To: <da9dcd58-41c1-089c-2061-be3bad6349a7@quicinc.com>
From: Dave Airlie <airlied@gmail.com>
Date: Fri, 5 Apr 2024 15:48:56 +1000
Message-ID: <CAPM=9tzDfZA6up+wY+OfBtfFRg0ffU4dm0ja33iCV6VVg_hq=w@mail.gmail.com>
Subject: Re: [PATCH] drm/msm: fix the `CRASHDUMP_READ` target of
 `a6xx_get_shader_block()`
To: Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Rob Clark <robdclark@gmail.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, Daniel Vetter <daniel@ffwll.ch>,
 Connor Abbott <cwabbott0@gmail.com>, linux-arm-msm@vger.kernel.org, 
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

On Sat, 30 Mar 2024 at 04:39, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
>
>
>
> On 3/26/2024 2:23 PM, Miguel Ojeda wrote:
> > Clang 14 in an (essentially) defconfig arm64 build for next-20240326
> > reports [1]:
> >
> >      drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c:843:6: error:
> >      variable 'out' set but not used [-Werror,-Wunused-but-set-variable]
> >
> > The variable `out` in these functions is meant to compute the `target` of
> > `CRASHDUMP_READ()`, but in this case only the initial value (`dumper->iova
> > + A6XX_CD_DATA_OFFSET`) was being passed.
> >
> > Thus use `out` as it was intended by Connor [2].
> >
> > There was an alternative patch at [3] that removed the variable
> > altogether, but that would only use the initial value.
> >
> > Fixes: 64d6255650d4 ("drm/msm: More fully implement devcoredump for a7xx")
> > Closes: https://lore.kernel.org/lkml/CANiq72mjc5t4n25SQvYSrOEhxxpXYPZ4pPzneSJHEnc3qApu2Q@mail.gmail.com/ [1]
> > Link: https://lore.kernel.org/lkml/CACu1E7HhCKMJd6fixZSPiNAz6ekoZnkMTHTcLFVmbZ-9VoLxKg@mail.gmail.com/ [2]
> > Link: https://lore.kernel.org/lkml/20240307093727.1978126-1-colin.i.king@gmail.com/ [3]
> > Signed-off-by: Miguel Ojeda <ojeda@kernel.org>
> > ---
>
>
> LGTM,
>
> Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>

I'm seeing this on my drm-next tree, where is this fix landing?

Dave.
