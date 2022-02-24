Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 903A84C332B
	for <lists+dri-devel@lfdr.de>; Thu, 24 Feb 2022 18:07:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 99EE610E8B5;
	Thu, 24 Feb 2022 17:07:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com
 [IPv6:2a00:1450:4864:20::12a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 520E510E8D0
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Feb 2022 17:07:12 +0000 (UTC)
Received: by mail-lf1-x12a.google.com with SMTP id b9so5002667lfv.7
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Feb 2022 09:07:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=N0jQLv1+zuQN7juoAXyJ+WWIVk1aqUcFAR93hnw7M9Y=;
 b=h4SyIOcr6gUDJDSMri5CABMlLmrTqmXTYoPBWmZ5Lsz6MfmMYMHjqQFLDrSWZEaPNm
 Mnq6Hz6mtjIlWlS1fbJ6a/izSvhS/6Uvomrp9DKrs3Fg3PrltiuwwR0ly1LWmYz22Ysr
 NsONJOkpJEmpXKKQBv4tu/bLVhIYOu3NXXkxOgGeCaqKoPoAd1eM25dodyz0EEIQKhf4
 gDbV7jZK2bRJdtz+aAKNWcFgh7lABpJJNGQ4UM4x0f3S8xGjlwoZsRPVDJvzmIa4DdrI
 5HIWkNKOK6TLHoEex2DuwVFllrkb02rq3ksmS4B2WP7brvQPdHO6pcIuSrWZH+SYgi8u
 A1xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=N0jQLv1+zuQN7juoAXyJ+WWIVk1aqUcFAR93hnw7M9Y=;
 b=oMKefN6SRuPBP93LrVoTUwD/8DVlH079ZDmiB2luwtq6uhuxIwZFNn5m0k15dZhsaQ
 DR/yIEEMvgU8m6F1M2M3MeBsbpmn4gHXuEoMDr1WxHFyLLJ3CTSroVRHTKy5/WadUlDM
 uDfVwpvOVPFgfTwpwkkhG/OBQtmtgVVc9sKNF70ya3at2goidWxcvgpvDYIzjr96wKFP
 it/R+OhgTUFUubtAPCQvj4Qp3TJAIJ4tzOU2cTYbp0p98bNIR2VZ2LQwtxFYi3auW8Ok
 ObgH3Xn9P4YKQRbSk8FNhaAZ2QFIDziYB8sZugYzdgPYAZg3rScEk9Y389bD6kA8oAK7
 kA8w==
X-Gm-Message-State: AOAM530hXrd0uKBejrJ+ziPHWVUihVP2JZfDu2rm/yt+3vgKfFcDvECk
 NAKIQ4EsuvXF0r5cVgpVX3k=
X-Google-Smtp-Source: ABdhPJwByzbLPtYGX70Ak/KjjViiZSUd1OOgzHpWQYmN6ffI8my/q+YdLYlcaAtO3d6HUFEPBcq61g==
X-Received: by 2002:ac2:554d:0:b0:443:6539:a299 with SMTP id
 l13-20020ac2554d000000b004436539a299mr2456801lfk.552.1645722429067; 
 Thu, 24 Feb 2022 09:07:09 -0800 (PST)
Received: from [192.168.2.145] (109-252-137-194.dynamic.spd-mgts.ru.
 [109.252.137.194]) by smtp.googlemail.com with ESMTPSA id
 k11-20020a2e920b000000b002463777bbb9sm17962ljg.24.2022.02.24.09.07.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 24 Feb 2022 09:07:08 -0800 (PST)
Message-ID: <50d71f43-ff35-7dba-8263-0891125984de@gmail.com>
Date: Thu, 24 Feb 2022 20:07:08 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH libdrm v2 07/25] tegra: Make API more consistent
Content-Language: en-US
To: Thierry Reding <thierry.reding@gmail.com>
References: <20220217191931.2534836-1-thierry.reding@gmail.com>
 <20220217191931.2534836-2-thierry.reding@gmail.com>
From: Dmitry Osipenko <digetx@gmail.com>
In-Reply-To: <20220217191931.2534836-2-thierry.reding@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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
Cc: linux-tegra@vger.kernel.org, dri-devel@lists.freedesktop.org,
 =?UTF-8?B?TWljaGHFgiBNaXJvc8WCYXc=?= <mirq-linux@rere.qmqm.pl>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

17.02.2022 22:19, Thierry Reding пишет:
> From: Thierry Reding <treding@nvidia.com>
> 
> Most functions in libdrm_tegra take as first parameter the object that
> they operate on. Make the device and buffer object creation functions
> follow the same scheme.
> 
> Signed-off-by: Thierry Reding <treding@nvidia.com>
> ---
>  tegra/tegra.c           | 13 +++++++------
>  tegra/tegra.h           | 10 +++++-----
>  tests/tegra/openclose.c |  2 +-
>  3 files changed, 13 insertions(+), 12 deletions(-)
> 
> diff --git a/tegra/tegra.c b/tegra/tegra.c
> index cf091c1d758f..6a51c43110e5 100644
> --- a/tegra/tegra.c
> +++ b/tegra/tegra.c
> @@ -66,7 +66,7 @@ static int drm_tegra_wrap(struct drm_tegra **drmp, int fd, bool close)
>      return 0;
>  }
>  
> -drm_public int drm_tegra_new(struct drm_tegra **drmp, int fd)
> +drm_public int drm_tegra_new(int fd, struct drm_tegra **drmp)

Does libdrm allow to break ABI?
