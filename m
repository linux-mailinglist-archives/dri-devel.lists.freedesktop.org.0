Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B76048134B7
	for <lists+dri-devel@lfdr.de>; Thu, 14 Dec 2023 16:27:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6A5BF10E306;
	Thu, 14 Dec 2023 15:27:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oo1-xc2f.google.com (mail-oo1-xc2f.google.com
 [IPv6:2607:f8b0:4864:20::c2f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EAEDB10E1A5;
 Thu, 14 Dec 2023 15:27:08 +0000 (UTC)
Received: by mail-oo1-xc2f.google.com with SMTP id
 006d021491bc7-5906988ab8dso3647766eaf.0; 
 Thu, 14 Dec 2023 07:27:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1702567628; x=1703172428; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=RQPQZjgJy3gqYdaJqPCEjYdalaI4tsnH21GXtDs8Yzk=;
 b=TX7RJXOHFxRD4ZTiw7rcZnHTHOOIfkatLhqeunGtiUXJsoSYoWE21Im4NsGRAjDMyJ
 sYBdIIe9Ut5fxHBno0hVNd1MdUqP0rN2M3/Av/Ne6++lNcOH+sZFrTctuGiaHvy/cII8
 uK/TzSlnLHJeFKcweTxFJ6Lt6carpsO2tIKAM+Dfo2GL+5uGMRu1bK0zfWwf9dnqY96a
 I7MXo/LtaCMm6g0Q6WZgoq6+C4FshalZGpatl3wEBdUVOqjOZo7X4xvNAlmE/TyUQ6py
 8fuy6A1YJibtqLopQL7L2ewwB7Ju9NsGrJNV+gZx/Nb3levRNNrmWAzLpTBsgPVn2x1/
 NXXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1702567628; x=1703172428;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=RQPQZjgJy3gqYdaJqPCEjYdalaI4tsnH21GXtDs8Yzk=;
 b=UhECD9Q7u4rlwhStbO/QgxWX6jamiFqyFI2ayd/GxOsDhHej8L6Zm/aMIvf3CDsDyJ
 KVPpjHN019y0WMMpVN+B5/RCBeZKUmAAxv9Je22lZbe4U5vubqKeF1amcaXRb/PJgQou
 uwqMVC2l7I4FiW4NbmtiSt6niZTtcIzoE+3cVoTJUbWHrrCCeP1PMCMlQp3v5NRkOdDJ
 D1Tl3EX9r867AcMfPhbK1kCEjCfxaGb+7DFzPeaJoMN5DlpTL+6+9gYMnw7ySXBWrgNJ
 AmdNpAA8aH0IgVByl+LwNfnVPfp8YQDvC4P3KEAHlsAyFwrUH2+pfjDWydgATB6MI5OG
 Cnfg==
X-Gm-Message-State: AOJu0YzkNkzyZGuGv4JYsl8EqQXmvrVKwfLBjOrA8mQn/0/4YDxWqyU7
 Kbig4vBMzLv181nvBg8HjqKetX0ecESPod8D4Fc=
X-Google-Smtp-Source: AGHT+IFxaUhMiZjLyo8TSQCHB2je7fkWGNaqTddpcZklvoyg8gxDKp/bPrzox5hejyW2il5ejMtz4rlwVUvZjrPf978=
X-Received: by 2002:a05:6870:171e:b0:203:5573:9f17 with SMTP id
 h30-20020a056870171e00b0020355739f17mr572625oae.115.1702567628088; Thu, 14
 Dec 2023 07:27:08 -0800 (PST)
MIME-Version: 1.0
References: <20231214010154.47054-1-yang.lee@linux.alibaba.com>
In-Reply-To: <20231214010154.47054-1-yang.lee@linux.alibaba.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Thu, 14 Dec 2023 10:26:56 -0500
Message-ID: <CADnq5_OK9+7VcXU9p1gyTcgmjAP=1p=WO1-UZKKEe8jyp83cgw@mail.gmail.com>
Subject: Re: [PATCH -next] drm/amd/pm: Remove unneeded semicolon
To: Yang Li <yang.lee@linux.alibaba.com>
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
Cc: Abaci Robot <abaci@linux.alibaba.com>, linux-kernel@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 alexander.deucher@amd.com, christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Applied.  Thanks!

On Wed, Dec 13, 2023 at 8:02=E2=80=AFPM Yang Li <yang.lee@linux.alibaba.com=
> wrote:
>
> ./drivers/gpu/drm/amd/pm/swsmu/amdgpu_smu.c:1418:2-3: Unneeded semicolon
>
> Reported-by: Abaci Robot <abaci@linux.alibaba.com>
> Closes: https://bugzilla.openanolis.cn/show_bug.cgi?id=3D7743
> Signed-off-by: Yang Li <yang.lee@linux.alibaba.com>
> ---
>  drivers/gpu/drm/amd/pm/swsmu/amdgpu_smu.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/amd/pm/swsmu/amdgpu_smu.c b/drivers/gpu/drm/=
amd/pm/swsmu/amdgpu_smu.c
> index d409857fd622..c16703868e5c 100644
> --- a/drivers/gpu/drm/amd/pm/swsmu/amdgpu_smu.c
> +++ b/drivers/gpu/drm/amd/pm/swsmu/amdgpu_smu.c
> @@ -1415,7 +1415,7 @@ static int smu_wbrf_event_handler(struct notifier_b=
lock *nb,
>                 break;
>         default:
>                 return NOTIFY_DONE;
> -       };
> +       }
>
>         return NOTIFY_OK;
>  }
> --
> 2.20.1.7.g153144c
>
