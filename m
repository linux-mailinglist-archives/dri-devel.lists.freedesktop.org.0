Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 74A85793C29
	for <lists+dri-devel@lfdr.de>; Wed,  6 Sep 2023 14:03:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6C60E10E61E;
	Wed,  6 Sep 2023 12:03:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com
 [IPv6:2a00:1450:4864:20::535])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 11E1A10E61E
 for <dri-devel@lists.freedesktop.org>; Wed,  6 Sep 2023 12:03:38 +0000 (UTC)
Received: by mail-ed1-x535.google.com with SMTP id
 4fb4d7f45d1cf-52a5c0d949eso4965536a12.0
 for <dri-devel@lists.freedesktop.org>; Wed, 06 Sep 2023 05:03:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1694001816; x=1694606616; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=TG8v1WUrQJRuwyVst1yh78ZkZ2N3yjOTrkiIIhevQjM=;
 b=KlQxRekDMll5z0+TE/SCtGZcgsJv+3kwOr8EUfI6Vs7fNYAnv653F48b7MX1708I1r
 rm8zRGWKSXEs+U5B+04TfIlWHuhQi5SY3nKmCLPfjYqSdgaP5TzxgklDGNqtnjhaz/95
 27AwAGg2Bv3z/HjH/d47HcSqHJwhrMEf3T2ZTFrJkeeQeGHsGfRUwEJZSgmKLiG8rn6L
 xLttc1DfuYYlF1HYk3YbOrX1ssY09kNSexK8njChFRze4nAqs+IWhzPzaCuxl0TaDBJh
 uDt2wyBgvwcInvDgUoSEJC+sBLfagjr75CXwUhbjimxFF8uULL3UyhX01DBm12Ls8P4z
 K8FA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1694001816; x=1694606616;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=TG8v1WUrQJRuwyVst1yh78ZkZ2N3yjOTrkiIIhevQjM=;
 b=Sy4odV4Two0YZhC+gtiCe1TyLwTK8BfsVkPeVEV/aetoYZTqH0W0nInk81v0I5K21A
 ycmlGl+E1TNQAdoX0PVPKEdqqJn7PYXUwgx76fL/r2BEFgU6xl//2ySf25T0FtDj3Fmw
 LAJO/+PIXafGzFnOc4Qx32c7m83JJ194bjR1v4OFpNLzVc4LEUx212j8MrcdY5xQzy5M
 mP9noCdH5tm44YR6WqE4GE9Mb+uM1eVWzQzM31/pfwd5ON420/eNSw/HwoB8twYGp1NJ
 /beKszPzz0IX8LVLAs9DWucXvUwskROK/o5dd3Usikur0RxCa8EmepjAN2eWz1bzYeDB
 xC1Q==
X-Gm-Message-State: AOJu0Yxt6vxJ18W9g1STNG4gtNhU4DXuw30FA0lxhZ9Nc2Rh8eDrXy/j
 DSmUIH815fvgM78Q/C/O/P67tQXmVWJnsNl8q9JDOytxms31rrg8l8wYkA==
X-Google-Smtp-Source: AGHT+IEq8qhz9cNHqr8duJ2KbTtO4ySOl5J8Jd6unVRxNtSyip3WQ7CbJufHcW0Xz4GUVvZWdnonI9xLeXNXTLjmBnY=
X-Received: by 2002:aa7:c0cf:0:b0:522:ca6b:ad7d with SMTP id
 j15-20020aa7c0cf000000b00522ca6bad7dmr2017626edp.9.1694001816458; Wed, 06 Sep
 2023 05:03:36 -0700 (PDT)
MIME-Version: 1.0
References: <20230821152606.10325-1-vinayakph123@gmail.com>
In-Reply-To: <20230821152606.10325-1-vinayakph123@gmail.com>
From: Sumit Semwal <sumit.semwal@linaro.org>
Date: Wed, 6 Sep 2023 17:33:25 +0530
Message-ID: <CAO_48GESs+C-jRTefgLbksRSS25HtAcpCmbGKgFDDee-UsPnVA@mail.gmail.com>
Subject: Re: [PATCH] Remove the parameter not described warning
To: Vinayak Hegde <vinayakph123@gmail.com>
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
Cc: gustavo@padovan.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hello Vinayak,

On Mon, 21 Aug 2023 at 20:56, Vinayak Hegde <vinayakph123@gmail.com> wrote:
>
> Signed-off-by: Vinayak Hegde <vinayakph123@gmail.com>

Thank you for your patch. Could you please make the git commit message
a bit more descriptive? Please describe how did you find this warning,
atleast.

> ---
>  include/uapi/linux/sync_file.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/include/uapi/linux/sync_file.h b/include/uapi/linux/sync_fil=
e.h
> index 7e42a5b7558b..ff0a931833e2 100644
> --- a/include/uapi/linux/sync_file.h
> +++ b/include/uapi/linux/sync_file.h
> @@ -56,7 +56,7 @@ struct sync_fence_info {
>   * @name:      name of fence
>   * @status:    status of fence. 1: signaled 0:active <0:error
>   * @flags:     sync_file_info flags
> - * @num_fences number of fences in the sync_file
> + * @num_fences:        number of fences in the sync_file
>   * @pad:       padding for 64-bit alignment, should always be zero
>   * @sync_fence_info: pointer to array of struct &sync_fence_info with al=
l
>   *              fences in the sync_file
> --
> 2.34.1
>

Best,
Sumit.

--=20
Thanks and regards,

Sumit Semwal (he / him)
Tech Lead - LCG, Vertical Technologies
Linaro.org =E2=94=82 Open source software for ARM SoCs
