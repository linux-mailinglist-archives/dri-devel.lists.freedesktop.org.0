Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 16BA0794210
	for <lists+dri-devel@lfdr.de>; Wed,  6 Sep 2023 19:32:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ADF6010E6CF;
	Wed,  6 Sep 2023 17:32:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com
 [IPv6:2a00:1450:4864:20::12e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8767F10E06D
 for <dri-devel@lists.freedesktop.org>; Wed,  6 Sep 2023 17:32:10 +0000 (UTC)
Received: by mail-lf1-x12e.google.com with SMTP id
 2adb3069b0e04-5009d4a4897so43707e87.0
 for <dri-devel@lists.freedesktop.org>; Wed, 06 Sep 2023 10:32:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1694021529; x=1694626329; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Faf197ap58+uI4FaNirUJNIB8FfxXIHwVOAyYDFccMo=;
 b=EJ2IRF7LQSileDqCwSFMmnVf7NMoq7n+wn6kYkt59KyoqVmKTPuTd0J0db32JvwS47
 Ql3exDnEuAaPn49ZW6O/2v69jGDgmL22cJ1Z5BPo/MqZxYOQf7HR0ZBvMQDQ38qa/lZx
 cUHwuMHZsEjJBMS86JaTMgrk5bIv0qud+AM4G58hEWajiOJB4qQpqn0dO6ondr/yBFnR
 +K/V/fHmL748tFjwh+NbM9AdX6G6JM4PY/UoGmdwUXvg4zktOaWIHqHAFUYgg2YnpeGS
 is/rqZnjFwlnfUtHTZKSWdW0hdOm91reiGU82ghHDSsbfSmP8vaoOaS6xBdkXPuSyIqj
 KEmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1694021529; x=1694626329;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Faf197ap58+uI4FaNirUJNIB8FfxXIHwVOAyYDFccMo=;
 b=KLim86nxdX4GetwHoV35kpYjFnZ/jxMnsYUNHpLCzNsrVXmQPTGKxfG7j6hNPZPdN6
 qPbShjzu6zVa30J5PmVB7VhQWhk36iIICMm6UeleOQKnaeB/TwfWc12bq6gypo1SWQoQ
 cSv8fMtE6KHNWjVMoHgtVsyDPlzLmLCY94IaOXzYqvaCzF5a8dNVKX7CHPgmjXiWcHnN
 L1CKXG2JQnBunwfvL+ecODrM5Jg/iXnIdFApUL8BXjexHIGuNvD8FEhBEx/U59AmeGvG
 VcVJZkV1kgu+7xHCJWdQ82+7bOCbihVSlmIugv0YxwoOWa8ToYZV9oVY8zgVgxZWDAzb
 rExw==
X-Gm-Message-State: AOJu0YyBVtNX+0SjV52oPUjD6JbbhkoCmj58YeGfyRRGxIr25F7rznY4
 s8Sfd61V88p9v5uw2J9JCGltFqeDyy/e+JneOvB9Cw==
X-Google-Smtp-Source: AGHT+IE/xRN6VmZoaZ3/LQybPH9SnvALv5OkW+FNw4aOSnZk0lP+hWg4VBqn1530qyxOE1DKdructQX/EcvWMQr3aUE=
X-Received: by 2002:a05:6512:2399:b0:4fd:f84f:83c1 with SMTP id
 c25-20020a056512239900b004fdf84f83c1mr3286553lfv.64.1694021528640; Wed, 06
 Sep 2023 10:32:08 -0700 (PDT)
MIME-Version: 1.0
References: <ZPiuH+ghqamtwJGA@vinayak-ubuntu>
In-Reply-To: <ZPiuH+ghqamtwJGA@vinayak-ubuntu>
From: Sumit Semwal <sumit.semwal@linaro.org>
Date: Wed, 6 Sep 2023 23:01:57 +0530
Message-ID: <CAO_48GGbrgV7grhuWt448ZcTKUvt6d_3zVjVF5wm-8=ZWn_C6g@mail.gmail.com>
Subject: Re: [PATCH v2] Remove the parameter not described warning
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

Hi Vinayak,

On Wed, 6 Sept 2023 at 22:21, Vinayak Hegde <vinayakph123@gmail.com> wrote:
>
> I encountered a warning during kernel documentation compilation
> due to a missing colon in the documentation for the
> 'num_fences' variable in the sync_file.h header file.
> This change adds the missing colon to align with the documentation format=
.
>
> Signed-off-by: Vinayak Hegde <vinayakph123@gmail.com>
Thanks for your patch; I'll queue it via drm-misc.
> ---
>  include/uapi/linux/sync_file.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/include/uapi/linux/sync_file.h b/include/uapi/linux/sync_fil=
e.h
> index 7e42a5b7558b..b389a5495181 100644
> --- a/include/uapi/linux/sync_file.h
> +++ b/include/uapi/linux/sync_file.h
> @@ -56,7 +56,7 @@ struct sync_fence_info {
>   * @name:      name of fence
>   * @status:    status of fence. 1: signaled 0:active <0:error
>   * @flags:     sync_file_info flags
> - * @num_fences number of fences in the sync_file
> + * @num_fences: number of fences in the sync_file
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
