Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E5A39600844
	for <lists+dri-devel@lfdr.de>; Mon, 17 Oct 2022 10:02:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 24A9110E392;
	Mon, 17 Oct 2022 08:02:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com
 [IPv6:2a00:1450:4864:20::62b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3ABA510E392
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Oct 2022 08:01:58 +0000 (UTC)
Received: by mail-ej1-x62b.google.com with SMTP id 13so23062634ejn.3
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Oct 2022 01:01:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=toYeRRrkY+OmurSRkJCHe148bI7k9Qw/KSYRDICfcAg=;
 b=aQMIZsOm5iLO3vkqKMiqfd6cmN7qcmgN/kzihPMT7r7jvaJVIq5LUJFfU36qjmEbqF
 cL014/KhVutl2iOQpPffae0iJqpLiAq/R//Sc+NMNagaaYrK9nDO/aUkPqcvlezPLW5i
 21tNdMokykd/9agT+CSh+xpqNzXpksP/jWD76d9pAZEQ50HITPjiZOo6hoZxYjV5Pd8Z
 AoU5HZ6fajwBLMfTzhEP/NTVu+cZPxI4Cz/N8b7x25w5JM9qkumGL18me/zACK9lELE3
 HppEwhg9pkl0nYbmht/Ursw3hlms9KjwJD8MM3RVnT43OD3GCwNhk0FxDwigaNH56c7V
 Yv+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=toYeRRrkY+OmurSRkJCHe148bI7k9Qw/KSYRDICfcAg=;
 b=FkPq0+2KMKpdj9GbfDxnpHwpqOk9Tc9lfK0tErdQj7Oe/iFZgYI9DRSV2YUYdjmTQF
 c2XWnms6m64YAvYfeG3E8lOuyCqqNuQ01K5a+29AoKmuHThJHEwLneN1ZifC+wd1ojJ7
 RopjoLRHoGsdIiSoi+REHf803zkttHSrF0kGnczxBUhgaRjFuD3+cVBR6yrMK5BHst8M
 KcODaOml/oQX6aPWy7kP7cXzPW+RxbWzxGGgKeJagFQFZA7t938mh4WK6xJp1k2Od07X
 45TTOcAOgH3/Vr3z/L8J+GFFTq+MIEnszgUQRpkS1d5Qy2vhej5qKl3dYggNC4T0AJaV
 n9Ag==
X-Gm-Message-State: ACrzQf2MnLobHUNRIJyzntqUaJAMZ6UNvE/Ja/0GIf2BprguG1t1l8U2
 fQODvxUkenjNB7kKIquOZgwyxRo0dD5LOPqTRuVgPfxt
X-Google-Smtp-Source: AMsMyM7s/PgKj15YGQd7W0kvmhh7+dg5jTxy7px2DvCcbLCm7ssMWwx/Xrw3H2BlMCqO16T73VupNGJjhtyTcZZgo3Y=
X-Received: by 2002:a17:907:75d5:b0:78d:ef76:da7d with SMTP id
 jl21-20020a17090775d500b0078def76da7dmr7701213ejc.476.1665993716618; Mon, 17
 Oct 2022 01:01:56 -0700 (PDT)
MIME-Version: 1.0
References: <CAPM=9ty3DGWa8vnfumgSrpSgWnixWjikb6C0Zk_5bW+deKLVQw@mail.gmail.com>
 <20221016080833.5503-1-user@am64>
 <CAPM=9txsBf5HJ97tAMOQ8PdiPciK-zqngERUm7hGJO8Zyyqb+w@mail.gmail.com>
 <C98B32CF-86B0-438D-BC8D-10FA255B3B4F@internode.on.net>
 <7c645fa8-bf29-4b30-bdc5-e61e6bb09927@amd.com>
 <f0110d36-a9c2-c1b9-b193-32da4f98a975@amd.com>
 <67e2904a-4b80-5173-2d8f-6a3d1f702fbb@amd.com>
In-Reply-To: <67e2904a-4b80-5173-2d8f-6a3d1f702fbb@amd.com>
From: Dave Airlie <airlied@gmail.com>
Date: Mon, 17 Oct 2022 18:01:44 +1000
Message-ID: <CAPM=9tz8=iDye+vYai2NLLW-u3TfZ=DKdA_h2e+kk==ZO7q3PQ@mail.gmail.com>
Subject: Re: [git pull] drm fixes for 6.1-rc1
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
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
Cc: Arunpravin Paneer Selvam <arunpravin.paneerselvam@amd.com>,
 daniel.vetter@ffwll.ch, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, torvalds@linux-foundation.org, "Deucher,
 Alexander" <Alexander.Deucher@amd.com>,
 Arthur Marsh <arthur.marsh@internode.on.net>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, 17 Oct 2022 at 17:07, Christian K=C3=B6nig <christian.koenig@amd.co=
m> wrote:
>
> Hi Arun,
>
> the hw generation doesn't matter. This error message here:
>
> amdgpu: Move buffer fallback to memcpy unavailable
>
> indicates that the detection of linear buffers still doesn't work as
> expected or that we have a bug somewhere else.
>
> Maybe the limiting when SDMA moves are not available isn't working
> correctly?

It is a CAPE_VERDE, so maybe something with the SI UVD memory limitations?

Dave.
