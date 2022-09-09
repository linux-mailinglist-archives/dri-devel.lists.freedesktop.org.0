Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E3BD55B40D6
	for <lists+dri-devel@lfdr.de>; Fri,  9 Sep 2022 22:43:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3F18310EE45;
	Fri,  9 Sep 2022 20:43:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-x2c.google.com (mail-oa1-x2c.google.com
 [IPv6:2001:4860:4864:20::2c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8D79E10EE45;
 Fri,  9 Sep 2022 20:43:19 +0000 (UTC)
Received: by mail-oa1-x2c.google.com with SMTP id
 586e51a60fabf-1225219ee46so7016317fac.2; 
 Fri, 09 Sep 2022 13:43:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date;
 bh=UpjlPyvLcw4N5LfAVf39R6W0A9McL24cYMQux8ptGv8=;
 b=e7HTVip99SqvqlRZXZalCOLj/1aFRkt+uGXux/sme46CxsjwtMp+xi7Uqnt0bgf1EF
 r55WBVxyF+PHAVpNFPwxSSAmQ8dLlHLPSq/IQsglAGoFpR+9oE33Hi2HAxmKBPg9yN7a
 1CcykSngo3e/TdSKIVGFIUvf0TdXX2SnrRJLLPjtv2C56Z0Z5UcKWzr3fXvIsX+zd+jq
 5zrekY3mfYb7QxEW0gJ5OcJHizC5Q3dUDEWEmDVj59QZRCikXp3eztjQI7uyF6glIACs
 PxlJv/rdKi0M1lDNE8+0mgsnS+/LPUI+GvoDZKMEB1AOVwVNJyKXv8fgqCabiKkRsrWv
 ozkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date;
 bh=UpjlPyvLcw4N5LfAVf39R6W0A9McL24cYMQux8ptGv8=;
 b=b6FiPSdatZnrAB2rmf3s1WdzJuJqf1eWjm6iHtt/bTj165lu+56UehyLzvWPMhFPd9
 Ie1063guPAI0vzJBAuK7ufxXNU0Lj7T/6ltqLSK0hh2zwkUSP4KuOAUllQmk4Ea6Rk0H
 BDhxpA7aDS7PXO6yJx9T3GArb7vEpQGYs6W97cpNWGJHslMrughaeWIHpBiLvfskPNed
 BC//Oi1s0AlFoNbzKTH0ir6ONZVLzAXt25g8LGUCAfefs/n69pawv0eMzg4HtB4UrM9i
 wNQeXZzVhU8+f/1uVOeCEqo/zMD2YAQ5N6x2FYabPT0UYudQwAwKDWA3iDShdaeMj9nq
 tyXQ==
X-Gm-Message-State: ACgBeo2wMu/CcKaY1Z6p1NNwzFW7QhmZ0fc1lpgJQYYln7lkOmFkLDBu
 XYWa5fH8EMXOL5Yy0TA0I/GydkO1nXVztB4dH/v8Ew8O
X-Google-Smtp-Source: AA6agR63zDi5mAVL6/Z4bTAfycaBgTKj2tKmHeRB6tfaRZx/HB4UWxeu3FEPvQrmT0fCvfSoxEcgxiYj/Jej3LHXWP0=
X-Received: by 2002:a05:6808:138e:b0:345:13d1:fd66 with SMTP id
 c14-20020a056808138e00b0034513d1fd66mr4517729oiw.96.1662756198847; Fri, 09
 Sep 2022 13:43:18 -0700 (PDT)
MIME-Version: 1.0
References: <20220901081131.76486-1-yang.lee@linux.alibaba.com>
In-Reply-To: <20220901081131.76486-1-yang.lee@linux.alibaba.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Fri, 9 Sep 2022 16:43:07 -0400
Message-ID: <CADnq5_OOTCb_AXV6rpB5DWnAv2+khhZuDZPrA5V0OGacuXTsdQ@mail.gmail.com>
Subject: Re: [PATCH -next] drm/amd/display: Simplify bool conversion
To: Yang Li <yang.lee@linux.alibaba.com>
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
Cc: sunpeng.li@amd.com, Abaci Robot <abaci@linux.alibaba.com>,
 Xinhui.Pan@amd.com, Rodrigo.Siqueira@amd.com, linux-kernel@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, airlied@linux.ie,
 dri-devel@lists.freedesktop.org, alexander.deucher@amd.com,
 christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Applied.  Thanks!

On Thu, Sep 1, 2022 at 4:11 AM Yang Li <yang.lee@linux.alibaba.com> wrote:
>
> The result of relational operation is Boolean, and the question mark
> expression is redundant.
>
> Link: https://bugzilla.openanolis.cn/show_bug.cgi?id=2027
> Reported-by: Abaci Robot <abaci@linux.alibaba.com>
> Signed-off-by: Yang Li <yang.lee@linux.alibaba.com>
> ---
>  .../gpu/drm/amd/display/dc/dml/dcn32/display_mode_vba_util_32.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/amd/display/dc/dml/dcn32/display_mode_vba_util_32.c b/drivers/gpu/drm/amd/display/dc/dml/dcn32/display_mode_vba_util_32.c
> index dc501ee7d01a..e4fd540dec0f 100644
> --- a/drivers/gpu/drm/amd/display/dc/dml/dcn32/display_mode_vba_util_32.c
> +++ b/drivers/gpu/drm/amd/display/dc/dml/dcn32/display_mode_vba_util_32.c
> @@ -1873,7 +1873,7 @@ void dml32_CalculateSurfaceSizeInMall(
>                 if (UseMALLForStaticScreen[k] == dm_use_mall_static_screen_enable)
>                         TotalSurfaceSizeInMALL = TotalSurfaceSizeInMALL + SurfaceSizeInMALL[k];
>         }
> -       *ExceededMALLSize =  (TotalSurfaceSizeInMALL <= MALLAllocatedForDCN * 1024 * 1024 ? false : true);
> +       *ExceededMALLSize =  (TotalSurfaceSizeInMALL > MALLAllocatedForDCN * 1024 * 1024);
>  } // CalculateSurfaceSizeInMall
>
>  void dml32_CalculateVMRowAndSwath(
> --
> 2.20.1.7.g153144c
>
