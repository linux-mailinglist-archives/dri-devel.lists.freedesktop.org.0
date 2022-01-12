Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0920248C059
	for <lists+dri-devel@lfdr.de>; Wed, 12 Jan 2022 09:52:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C3E9A112E97;
	Wed, 12 Jan 2022 08:52:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x630.google.com (mail-pl1-x630.google.com
 [IPv6:2607:f8b0:4864:20::630])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EAC16112E5B
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Jan 2022 08:51:46 +0000 (UTC)
Received: by mail-pl1-x630.google.com with SMTP id w7so3090901plp.13
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Jan 2022 00:51:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=zzw2OtCR4zPV/tIIl1/hV37vrWAMfZ8fJBYvnqWy2q8=;
 b=hHECxXlMoYf14MQJ3tQJkv4kQ7uab+TTEaUemUAAkIuWjaabOadj1FMSjeYta2dCjp
 gB0HbhfB7MLID93RZnwH0a515EiVSiyjmZPlolw+jfvnHlu5WeeZy23jAIk1AHnB+nCk
 9magP1ZEMWU+D8gaJeSnz/i9FGS47HRhYJBJ2G/k7RTAlxY73lJsGqet7gYKpW0+G+uL
 fHjNbSdjcWpsbt1kRndztSsCdAiHr+se1zXxYqxlXXgM7H1tihAb15Pe0rjGitAgZMJH
 v23DvmU1ov2aUML97rlJ8HVdw/QG1cRewfebYLSdrmTKZqPYjAc/rQS+wL5w9UnbbzP9
 RD8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=zzw2OtCR4zPV/tIIl1/hV37vrWAMfZ8fJBYvnqWy2q8=;
 b=DPWrt12eVYZ9jDs87GC1Dci5ysolTojE5iKI9cnVZWIAF2vLs/7bJEMx9MijQ+x36x
 hGmJeRPu5Gj4pYkGb3dMbm1w9uTVDIaEQed4V4471rTRX9krlecgFmEXIYQWXFOSGNiK
 OrMUyxfVxsJFYmrO2WIv+H9JidvmWMryjCLqR05kA75ttf1VpQb4gmbjhsvA1uJ59f34
 smb21vXqZGgVYtCnnGEHdsg29yQsPfouH4k/4SV++U2aFjWEpqY3FzcfcK+un8hCtUZD
 Z+h4g72OL+AHOMokErlWyLzgUdxJTW9Rojp61PV6tcLw4g5CLltYvnlII/s0h4+nfL3I
 rYCg==
X-Gm-Message-State: AOAM532broIPj0k23ruPix9usZT+ic1pfShGnMQ2X76t9vB5NHQHHEYM
 +IPL3ya8It4XZyVychb9BpIAA04KYnfFw4yEf3Q=
X-Google-Smtp-Source: ABdhPJzAMp0qhUOkAs8lyb7w/Cmd+w4mx+GQT+Hi8e57os8JA9Nyi+7lzew7Keed8zAsAPsBLVcpsorK+ZZ+drIuXuE=
X-Received: by 2002:a17:90a:68c5:: with SMTP id
 q5mr7636274pjj.40.1641977505496; 
 Wed, 12 Jan 2022 00:51:45 -0800 (PST)
MIME-Version: 1.0
References: <20220112082524.667552-1-chi.minghao@zte.com.cn>
In-Reply-To: <20220112082524.667552-1-chi.minghao@zte.com.cn>
From: Patrik Jakobsson <patrik.r.jakobsson@gmail.com>
Date: Wed, 12 Jan 2022 09:51:34 +0100
Message-ID: <CAMeQTsbsrg0yNQMAxgocGuHkMtwiyRoh3nPJEmeR3yVGUoBg_g@mail.gmail.com>
Subject: Re: [PATCH] drm/gma500: remove redundant ret variable
To: cgel.zte@gmail.com
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
Cc: David Airlie <airlied@linux.ie>, Zeal Robot <zealci@zte.com.cn>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 Minghao Chi <chi.minghao@zte.com.cn>,
 dri-devel <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Jan 12, 2022 at 9:25 AM <cgel.zte@gmail.com> wrote:
>
> From: Minghao Chi <chi.minghao@zte.com.cn>
>
> Return value directly instead of taking this in another redundant
> variable.
>
> Reported-by: Zeal Robot <zealci@zte.com.cn>
> Signed-off-by: Minghao Chi <chi.minghao@zte.com.cn>
> Signed-off-by: CGEL ZTE <cgel.zte@gmail.com>

Thanks for the patch. I'll apply this to drm-misc-next

-Patrik

> ---
>  drivers/gpu/drm/gma500/cdv_intel_dp.c | 12 +++---------
>  1 file changed, 3 insertions(+), 9 deletions(-)
>
> diff --git a/drivers/gpu/drm/gma500/cdv_intel_dp.c b/drivers/gpu/drm/gma500/cdv_intel_dp.c
> index ba6ad1466374..74e67679714e 100644
> --- a/drivers/gpu/drm/gma500/cdv_intel_dp.c
> +++ b/drivers/gpu/drm/gma500/cdv_intel_dp.c
> @@ -82,7 +82,6 @@ i2c_algo_dp_aux_address(struct i2c_adapter *adapter, u16 address, bool reading)
>  {
>         struct i2c_algo_dp_aux_data *algo_data = adapter->algo_data;
>         int mode = MODE_I2C_START;
> -       int ret;
>
>         if (reading)
>                 mode |= MODE_I2C_READ;
> @@ -90,8 +89,7 @@ i2c_algo_dp_aux_address(struct i2c_adapter *adapter, u16 address, bool reading)
>                 mode |= MODE_I2C_WRITE;
>         algo_data->address = address;
>         algo_data->running = true;
> -       ret = i2c_algo_dp_aux_transaction(adapter, mode, 0, NULL);
> -       return ret;
> +       return i2c_algo_dp_aux_transaction(adapter, mode, 0, NULL);
>  }
>
>  /*
> @@ -122,13 +120,11 @@ static int
>  i2c_algo_dp_aux_put_byte(struct i2c_adapter *adapter, u8 byte)
>  {
>         struct i2c_algo_dp_aux_data *algo_data = adapter->algo_data;
> -       int ret;
>
>         if (!algo_data->running)
>                 return -EIO;
>
> -       ret = i2c_algo_dp_aux_transaction(adapter, MODE_I2C_WRITE, byte, NULL);
> -       return ret;
> +       return i2c_algo_dp_aux_transaction(adapter, MODE_I2C_WRITE, byte, NULL);
>  }
>
>  /*
> @@ -139,13 +135,11 @@ static int
>  i2c_algo_dp_aux_get_byte(struct i2c_adapter *adapter, u8 *byte_ret)
>  {
>         struct i2c_algo_dp_aux_data *algo_data = adapter->algo_data;
> -       int ret;
>
>         if (!algo_data->running)
>                 return -EIO;
>
> -       ret = i2c_algo_dp_aux_transaction(adapter, MODE_I2C_READ, 0, byte_ret);
> -       return ret;
> +       return i2c_algo_dp_aux_transaction(adapter, MODE_I2C_READ, 0, byte_ret);
>  }
>
>  static int
> --
> 2.25.1
>
