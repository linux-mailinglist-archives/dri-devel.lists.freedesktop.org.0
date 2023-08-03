Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BC1F476E2A4
	for <lists+dri-devel@lfdr.de>; Thu,  3 Aug 2023 10:14:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AB6C410E5C1;
	Thu,  3 Aug 2023 08:14:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [IPv6:2a00:1450:4864:20::336])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5E9E410E5C1
 for <dri-devel@lists.freedesktop.org>; Thu,  3 Aug 2023 08:14:16 +0000 (UTC)
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-3fe24dd8898so6827435e9.2
 for <dri-devel@lists.freedesktop.org>; Thu, 03 Aug 2023 01:14:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1691050455; x=1691655255;
 h=content-transfer-encoding:in-reply-to:organization:references:cc:to
 :content-language:subject:reply-to:from:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=NqGaWIotnKqKyzVdO4mnhnn37JZzzgHfkaj/9pvpDBI=;
 b=ZOwjQWAn7JHFjvwUzCCaWOHFoV4nYBigZDxL/pA53A8MmqPc98WhkWB8eKdDp1OZKb
 HcoFU2/1PWdxhxf+VIgg2OJV9ovta9q+8rV+34rPjs9nhrkvlLexUxH10+8ZX1gzINTS
 byYzHarpU0kESe4wPMGatxISUIFO32Frcj5qZyW7dRIBfh43sh6FGUBDLmyoTPsta8Mr
 kRlmIaqzy7oAGbektaYUDXMUxVcMwIWzb1ZzLQG24QNflszZ+HfXkK4XRTqw+yFDd5/v
 PgB7ztMdy3NqlvBPEzvM1hqR9n8BBqDU8Hx2Sxfj70ZlMOd5IOZ1pzsyjI+fghEzQYze
 9Gdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1691050455; x=1691655255;
 h=content-transfer-encoding:in-reply-to:organization:references:cc:to
 :content-language:subject:reply-to:from:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=NqGaWIotnKqKyzVdO4mnhnn37JZzzgHfkaj/9pvpDBI=;
 b=JpF9ZZbsY3TXTVgfCtOzsZuZgWaHbG2HVfCH1tmh3PcZPQkMAT0PMj6RVhAJXEBP22
 QyU7UZKiWkpNpk/cJSlQZejfg9iRHGAFCPW2jPIGulwWBiol6x3i6ZQjOP15+E4jVerD
 5mHZBseTlJ3iRS7lj9VLZePLcXshmGsKDUL6F1n3xhm4g2zWakf9Lp5kFA5760xu5+bq
 0+py2AX8Ds1DBLo8GrIThii5R9zcXDszVfhM8I5/EjfsVsKCiKw11Oib2jjgQB2Bhli3
 /Pexr49QXEGa+qZA+WtQRiCdHnP55USx4HD2bqJgsrJ+vBUzhk8bHrd0uk5Vx9IHBj0R
 n+mg==
X-Gm-Message-State: ABy/qLaS5bSPwe6XX5fXDx838OSfSUifX3wRH9K48qI0xxJVSJuxUmW+
 b7b1YvRR82ytkYWNk0KQsqJc6g==
X-Google-Smtp-Source: APBJJlHG7TGw7P8HEiLdxgaTyrTJbdQEUF5FJHRQOuTIptudXZcmxU7cKeKFDJfovphAgYX5+VJ/wA==
X-Received: by 2002:a05:600c:2a54:b0:3fa:934c:8350 with SMTP id
 x20-20020a05600c2a5400b003fa934c8350mr6677648wme.27.1691050454645; 
 Thu, 03 Aug 2023 01:14:14 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:8656:583:d034:d966?
 ([2a01:e0a:982:cbb0:8656:583:d034:d966])
 by smtp.gmail.com with ESMTPSA id
 u3-20020a7bcb03000000b003fbb06af219sm3567818wmj.32.2023.08.03.01.14.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 03 Aug 2023 01:14:14 -0700 (PDT)
Message-ID: <7e8202d9-3207-bb22-d69d-b2c80eca2a02@linaro.org>
Date: Thu, 3 Aug 2023 10:14:13 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH 2/2] drm/panel: Fix todo indentation for panel
 prepared/enabled cleanup
Content-Language: en-US
To: Douglas Anderson <dianders@chromium.org>,
 dri-devel@lists.freedesktop.org, Maxime Ripard <mripard@kernel.org>
References: <20230802074727.1.I4036706ad5e7f45e80d41b777164258e52079cd8@changeid>
 <20230802074727.2.Iaeb7b0f7951aee6b8c090364bbc87b1ae198a857@changeid>
Organization: Linaro Developer Services
In-Reply-To: <20230802074727.2.Iaeb7b0f7951aee6b8c090364bbc87b1ae198a857@changeid>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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
Reply-To: neil.armstrong@linaro.org
Cc: Stephen Rothwell <sfr@canb.auug.org.au>,
 Thomas Zimmermann <tzimmermann@suse.de>, Jonathan Corbet <corbet@lwn.net>,
 Daniel Vetter <daniel.vetter@ffwll.ch>, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 Linux Next Mailing List <linux-next@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 02/08/2023 16:47, Douglas Anderson wrote:
> In commit d2aacaf07395 ("drm/panel: Check for already prepared/enabled
> in drm_panel") the formatting for a code block was not quite
> right. This caused an error when building htmldocs:
> 
>    Documentation/gpu/todo.rst:469: ERROR: Unexpected indentation.
> 
> Fix the error by using the proper syntax for a code block.
> 
> Fixes: d2aacaf07395 ("drm/panel: Check for already prepared/enabled in drm_panel")
> Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
> Closes: https://lore.kernel.org/r/20230802141724.0edce253@canb.auug.org.au
> Signed-off-by: Douglas Anderson <dianders@chromium.org>
> ---
> 
>   Documentation/gpu/todo.rst | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/gpu/todo.rst b/Documentation/gpu/todo.rst
> index aa0052f9b93b..139980487ccf 100644
> --- a/Documentation/gpu/todo.rst
> +++ b/Documentation/gpu/todo.rst
> @@ -465,7 +465,8 @@ Clean up checks for already prepared/enabled in panels
>   
>   In a whole pile of panel drivers, we have code to make the
>   prepare/unprepare/enable/disable callbacks behave as no-ops if they've already
> -been called. To get some idea of the duplicated code, try:
> +been called. To get some idea of the duplicated code, try::
> +
>     git grep 'if.*>prepared' -- drivers/gpu/drm/panel
>     git grep 'if.*>enabled' -- drivers/gpu/drm/panel
>   

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
