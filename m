Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B70825993BD
	for <lists+dri-devel@lfdr.de>; Fri, 19 Aug 2022 05:49:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D81B810E109;
	Fri, 19 Aug 2022 03:49:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x102a.google.com (mail-pj1-x102a.google.com
 [IPv6:2607:f8b0:4864:20::102a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 33BE210E109
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Aug 2022 03:49:26 +0000 (UTC)
Received: by mail-pj1-x102a.google.com with SMTP id pm17so3490907pjb.3
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Aug 2022 20:49:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc; bh=o6+bzfnlGaEWpMhwfJW2zto2uMkruXy6+3QpUu+xD6g=;
 b=V8RTDRLODn5II43HPHgDHfS7XWKXawY26cVuG/kmI1r8UdNDiV9JRKTlmUYp8ddoEI
 L2Q5klCl9yfd+fra9wDWBzAiqAVLg11H+ODKy4psrUP6m1/x+JUjZk3IveqXB6lp/HpT
 6cr8SgKodvI3068vJY+54sf/4suIfU+fpZivYCLuQVNEzVgsIoz0pZk3IFQq13CouyVA
 HOG4yeGNZQG9XDO9e60aSL5Mm3PGYTqC8pmPrAXBCiQ3hxtzpGt8DKKX6I0lhjqtZC2K
 sFnXyti0RXtqu85XzeoUL+STD4d1QFZRYAz0LIoksR0B8NnyZZur/Y5vovlZG+8n6oUX
 44hQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc;
 bh=o6+bzfnlGaEWpMhwfJW2zto2uMkruXy6+3QpUu+xD6g=;
 b=Ikba+MrGF4uze1X/pdIaRYD7ATAh9Z5HY1pgPrGSAQvKoYKKI6XOA2Kq08mH6YwrYF
 vhLDwFfN22C37zlOM8hiSu001CRB9vFq9O2osqCje/CmqjRo0UuaAPOwP5I/7Vuetp2h
 TvCLdJZw/ZvV6bIyHW+afdwTENi8dnfaTUuiWZ9OdLE+phG3ymPrfuMBcl4y0Ek5Az/F
 Mg5qmIHpA0ewIpKQlzZLDWqpwJ29ndsNwZ2vEqi2/l7ubbLo6mCo+D6hh24oPdhumBWx
 8wrZB4TrK2a2ltNTSamiVTH8GdmQTkj1HGGEou+9V6cgKr9XnppzAZZuG9QAv32wjtxZ
 2fEQ==
X-Gm-Message-State: ACgBeo1JfheNeImJaIX+sfWZogAZKnaN7RjYFYkaRnsIJlDAAtlrSi59
 gmlZDgXlUhNveFX0sJJdnOY=
X-Google-Smtp-Source: AA6agR7VjjeqbWEdCP6zin2oXuIgKZRlURca+x5lYxJ9oJFSJygSV3vjHgRHjz6NccOiYfmFh4EuVg==
X-Received: by 2002:a17:90b:4b4f:b0:1f3:19ed:37b5 with SMTP id
 mi15-20020a17090b4b4f00b001f319ed37b5mr11682151pjb.108.1660880965573; 
 Thu, 18 Aug 2022 20:49:25 -0700 (PDT)
Received: from [192.168.43.80] (subs32-116-206-28-41.three.co.id.
 [116.206.28.41]) by smtp.gmail.com with ESMTPSA id
 b20-20020a62a114000000b0052dddf69db2sm2425774pff.57.2022.08.18.20.49.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 18 Aug 2022 20:49:24 -0700 (PDT)
Message-ID: <b5394ac7-1a2f-1863-4967-5abc1a35abc9@gmail.com>
Date: Fri, 19 Aug 2022 10:49:19 +0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH 10/13] docs: leds: add leds-qcom-lpg.rst to the index file
Content-Language: en-US
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
 Linux Doc Mailing List <linux-doc@vger.kernel.org>, corbet@lwn.net
References: <cover.1660829433.git.mchehab@kernel.org>
 <14865c294b60fef58f660922889775bd57ce44c2.1660829433.git.mchehab@kernel.org>
From: Bagas Sanjaya <bagasdotme@gmail.com>
In-Reply-To: <14865c294b60fef58f660922889775bd57ce44c2.1660829433.git.mchehab@kernel.org>
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
Cc: David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Andy Shevchenko <andy.shevchenko@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 8/18/22 20:38, Mauro Carvalho Chehab wrote:
> Address this warning:
> 	Documentation/leds/leds-qcom-lpg.rst: WARNING: o documento não está incluído em nenhum toctree
> 
> Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>
> ---
> 
> See [PATCH 00/13] at: https://lore.kernel.org/all/cover.1660829433.git.mchehab@kernel.org/
> 
>  Documentation/leds/index.rst           | 1 +
>  drivers/gpu/drm/scheduler/sched_main.c | 1 +
>  include/drm/gpu_scheduler.h            | 1 +
>  3 files changed, 3 insertions(+)
> 
> diff --git a/Documentation/leds/index.rst b/Documentation/leds/index.rst
> index e5d63b940045..014e009b0761 100644
> --- a/Documentation/leds/index.rst
> +++ b/Documentation/leds/index.rst
> @@ -25,4 +25,5 @@ LEDs
>     leds-lp5562
>     leds-lp55xx
>     leds-mlxcpld
> +   leds-qcom-lpg
>     leds-sc27xx
> diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/scheduler/sched_main.c
> index 68317d3a7a27..56c53a616816 100644
> --- a/drivers/gpu/drm/scheduler/sched_main.c
> +++ b/drivers/gpu/drm/scheduler/sched_main.c
> @@ -994,6 +994,7 @@ static int drm_sched_main(void *param)
>   *		used
>   * @score: optional score atomic shared with other schedulers
>   * @name: name used for debugging
> + * @dev: Device structure
>   *
>   * Return 0 on success, otherwise error code.
>   */
> diff --git a/include/drm/gpu_scheduler.h b/include/drm/gpu_scheduler.h
> index addb135eeea6..f31988e03256 100644
> --- a/include/drm/gpu_scheduler.h
> +++ b/include/drm/gpu_scheduler.h
> @@ -435,6 +435,7 @@ struct drm_sched_backend_ops {
>   * @_score: score used when the driver doesn't provide one
>   * @ready: marks if the underlying HW is ready to work
>   * @free_guilty: A hit to time out handler to free the guilty job.
> + * @dev: Device structure
>   *
>   * One scheduler is implemented for each hardware ring.
>   */

Hi Mauro,

I have already sent the fix (resend a long time ago) at [1] and got
Acked-by from Pavel, but seems like he forgot to push it. Maybe the
subsystem had maintenanceship issue as pointed by Andy (CC'ed) ([2]).

[1]: https://lore.kernel.org/linux-doc/20220612000125.9777-1-bagasdotme@gmail.com/
[2]: https://lore.kernel.org/lkml/CAHp75VeWKgyz32scczN0c+iJwGZXVP42g0NG0oXrdJ34GyHB8w@mail.gmail.com/

Thanks.

-- 
An old man doll... just what I always wanted! - Clara
