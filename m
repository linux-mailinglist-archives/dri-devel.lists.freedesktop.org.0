Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5290D3CA170
	for <lists+dri-devel@lfdr.de>; Thu, 15 Jul 2021 17:27:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8E3466E87D;
	Thu, 15 Jul 2021 15:27:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x22d.google.com (mail-lj1-x22d.google.com
 [IPv6:2a00:1450:4864:20::22d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5CA386E88E
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Jul 2021 15:27:25 +0000 (UTC)
Received: by mail-lj1-x22d.google.com with SMTP id r16so9413487ljk.9
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Jul 2021 08:27:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=xN5nwQhQGUrXuksqSdFQcf0YAddDFXMs40qw1Ze2qr4=;
 b=LSXtlQAAcA25pZsvDm9c7ZsYvpTCN7Uk0glC10eflwx4ZqcYtuNCq6Zi7lgsHUm2su
 9KrEopTi8WodyfuMfA4DYBGM6X5UQXKX3AzgQIdp+eiAuAZCR8bWjC6RdwY8Isv/mAa2
 CJU2SDEj3SjfAX1wR27jmvZ6yXmegxRKY//wB8aUtzrfjkkc4EvzcLbVV871TFgYqpG0
 uVlR20FlLIJy95K6HJaX0OmUXzwLWfMVVQqSJ42DWPxbqRXzt8MP7JqB6Xlnzm8M/+Ej
 z2y6T17/fb5HDi80fi16pU0xDa2S1+DFsk19NLVK/XDZJNjFDH4XGCvDAGwVOjDpB0Lw
 Gysw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=xN5nwQhQGUrXuksqSdFQcf0YAddDFXMs40qw1Ze2qr4=;
 b=Yh4Hg6xHIiNMYu+U7ALqhPUmHBqdPz4FEDkFDiDbleOjMQE3GfdkTOcTf2JaUtOpZ3
 jn7+v/+7KmBwRUrR+6a/uEofBnurj1n977XvLfcdKU6MoxjeHOul2rHDb72/hoNRGa1P
 QEwAB6toT0M0zHqWhkOmxvqRMXoLVTnG0HgHpwz9Jh+GGIEkbpXdyDp+Pp7ae9oB2eaY
 U5Wxkf9fqkRpCJnYH4wzV8lW8yV5PKvlh6MzT+HhiiRurERWFD+xpYJ8M2MK3n6U32BY
 KeA49HP+ETeCstWg3HwFhg1FchJ1QlMu94ljxvhaMbcK7KRPCHDpNC2TJGlQknn0mDRy
 5bkw==
X-Gm-Message-State: AOAM5338+uizqlMSupFfHUrW+gsKYAkscJL/09gKiD722iuEsyC1iQvk
 6cIGXCgDU0ND1clMppzmeZ4=
X-Google-Smtp-Source: ABdhPJxnrw87zO1lePrRxNhXx2vfzzDY2UtMaEkyPPCNeRsT4ZW/JTpVdl6ADPqTQHcIAmzyJ4dfCA==
X-Received: by 2002:a2e:720f:: with SMTP id n15mr97549ljc.333.1626362843891;
 Thu, 15 Jul 2021 08:27:23 -0700 (PDT)
Received: from [192.168.2.145] (94-29-37-113.dynamic.spd-mgts.ru.
 [94.29.37.113])
 by smtp.googlemail.com with ESMTPSA id z10sm437313lfe.22.2021.07.15.08.27.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 15 Jul 2021 08:27:23 -0700 (PDT)
Subject: Re: [PATCH v8 09/14] drm/tegra: Implement new UAPI
To: Thierry Reding <thierry.reding@gmail.com>
References: <20210709193146.2859516-1-thierry.reding@gmail.com>
 <20210709193146.2859516-10-thierry.reding@gmail.com>
From: Dmitry Osipenko <digetx@gmail.com>
Message-ID: <c8999755-f47b-ae08-60fb-cc430b1fbad5@gmail.com>
Date: Thu, 15 Jul 2021 18:27:22 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210709193146.2859516-10-thierry.reding@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
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
 Mikko Perttunen <mperttunen@nvidia.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

09.07.2021 22:31, Thierry Reding пишет:
> diff --git a/drivers/gpu/drm/tegra/drm.c b/drivers/gpu/drm/tegra/drm.c
> index cddee6425461..6ee08e49ec57 100644
> --- a/drivers/gpu/drm/tegra/drm.c
> +++ b/drivers/gpu/drm/tegra/drm.c
> @@ -21,6 +21,7 @@
>  #include <drm/drm_prime.h>
>  #include <drm/drm_vblank.h>
>  
> +#include "uapi.h"
>  #include "drm.h"
>  #include "gem.h"

alphabet order
