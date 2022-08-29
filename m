Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 717075A446E
	for <lists+dri-devel@lfdr.de>; Mon, 29 Aug 2022 10:02:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9C8E310E567;
	Mon, 29 Aug 2022 08:01:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x432.google.com (mail-pf1-x432.google.com
 [IPv6:2607:f8b0:4864:20::432])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1BD9C10E567
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Aug 2022 08:01:36 +0000 (UTC)
Received: by mail-pf1-x432.google.com with SMTP id y127so7437354pfy.5
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Aug 2022 01:01:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc;
 bh=NadoXRR6ilfmCAucbvVV5J8mAN2n+t5qu+Hu/Yb8UBI=;
 b=Cjdl8Kr6t5W8LrCiuLr0MIOboPp+gr01hpyfJrAoi/JjKq8dZ70oKsElPHfJhdN1l/
 etbDYaAgT1DzIhJdDEHE7lY2xFRN0I/wgrQJtUR6ODGVE9nhp9uZaGaap5abArnOwhni
 WFGZtXPLuljnRQ9AofZgDze84UvqeBRpJl7wNF6NOT4lCdplMTbzwkDGiG6UyWidkcY8
 i60TIBBv8RMi9tTBa/qVFicaNSiGrJp31Pehld8oIfTx1BycMNcxmBH+q0kolpdbVULj
 cltMW+sPFb1EMGqyuuHI6hAnulG9lr71oD0IHLCndp0VcNDwecuam+68Lx/n2y/n5vWT
 zEiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc;
 bh=NadoXRR6ilfmCAucbvVV5J8mAN2n+t5qu+Hu/Yb8UBI=;
 b=2YRvr1a8JkE0oxHbIuAKd7ZwITeEHqUveumMCr01BEzYE76QmvgqVXJS2HEwtrFSaD
 mHN+BvbclOkkILC9fsI517X65aQ7A03xTSFUqxCj6nxw2gsUeg77P5aNiYIHav+laUYw
 udjV2NY6Wb4r824gYPw3eitKst4e4E9zeFeCGPc+x9z/q2zRbauxNLKae3ufF64aFnyj
 JtB2K1e0+hDS89gm/VorUqL8fcRhwt+qrgiSN9cU9+pkt3lduch2UsiISB/D6AnuM65+
 y3KmZnEeX/0X7+VULZts6h3NHi08Ajdm0KGEr6KjfVGpXuArknsOPbHZYVCBZnru7pHp
 wy/Q==
X-Gm-Message-State: ACgBeo1iXS4qH1NR+fnF9S7cDnO6X2cSi9tmPHiz5V+9FEoB4FZW4U3M
 0TBbK3H+CBpc8OG5gcmLyYSOZ51AWLic/hLO+FM=
X-Google-Smtp-Source: AA6agR6Brb1AxOxSWY8d2PTMAnSSpK3AeXfazmkWERkRjX85mgdIOK8WkqraX/iHpGP4xOjUI31tQxyYHvrmVJ52a6o=
X-Received: by 2002:a63:2c8b:0:b0:41c:5f9e:a1d6 with SMTP id
 s133-20020a632c8b000000b0041c5f9ea1d6mr12660935pgs.601.1661760095667; Mon, 29
 Aug 2022 01:01:35 -0700 (PDT)
MIME-Version: 1.0
References: <20220804114751.46714-1-wangborong@cdjrlc.com>
In-Reply-To: <20220804114751.46714-1-wangborong@cdjrlc.com>
From: Patrik Jakobsson <patrik.r.jakobsson@gmail.com>
Date: Mon, 29 Aug 2022 10:01:24 +0200
Message-ID: <CAMeQTsZidqROwpsPzLVz0y-Zj0nFRvX81+vr2zO9VRv74gDjoA@mail.gmail.com>
Subject: Re: [PATCH] drm/gma500: Fix comment typo
To: Jason Wang <wangborong@cdjrlc.com>
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
Cc: airlied@linux.ie, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Aug 4, 2022 at 1:48 PM Jason Wang <wangborong@cdjrlc.com> wrote:
>
> The double `the' is duplicated in the comment, remove one.
>
> Signed-off-by: Jason Wang <wangborong@cdjrlc.com>

Pushed to drm-misc-next

Thanks
Patrik

> ---
>  drivers/gpu/drm/gma500/cdv_intel_dp.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/gma500/cdv_intel_dp.c b/drivers/gpu/drm/gma500/cdv_intel_dp.c
> index bb2e9d64018a..53b967282d6a 100644
> --- a/drivers/gpu/drm/gma500/cdv_intel_dp.c
> +++ b/drivers/gpu/drm/gma500/cdv_intel_dp.c
> @@ -115,7 +115,7 @@ i2c_algo_dp_aux_stop(struct i2c_adapter *adapter, bool reading)
>
>  /*
>   * Write a single byte to the current I2C address, the
> - * the I2C link must be running or this returns -EIO
> + * I2C link must be running or this returns -EIO
>   */
>  static int
>  i2c_algo_dp_aux_put_byte(struct i2c_adapter *adapter, u8 byte)
> --
> 2.35.1
>
