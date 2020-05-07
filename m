Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E3561C9B43
	for <lists+dri-devel@lfdr.de>; Thu,  7 May 2020 21:41:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 336EB6E1AA;
	Thu,  7 May 2020 19:41:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [IPv6:2a00:1450:4864:20::332])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 496456E1AA;
 Thu,  7 May 2020 19:41:44 +0000 (UTC)
Received: by mail-wm1-x332.google.com with SMTP id z6so8178357wml.2;
 Thu, 07 May 2020 12:41:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=PMpVNBoEhxmM4CRkfdIX0zaCW76FCXVtwoTgqUPcVLU=;
 b=HX97W0uxJyJtTZ3HW9vIAYer0wvYtLnSikfxmAflXPahf0PgFsIk0LGBDsJfVVrzP6
 x3FABNboCvUFz9RilZ7X33rF8JL7u16GUL9zLUiOE/80ITtDvC/hmPUAzRo2QCzMlQEf
 DuS3fcoY23eYsOCcErlMfOrfIvAoV40J1f90Z0ouwbNBfmSLLKwngBA2cnleXbOz5Ije
 yc15pVmsIdGTk9avwk9xUFH+UrVqJAJAOvjHxN6BwvWAHyB/4OKuGOOdcP6Eb2pt7w59
 u2ctaW0Lk7d92HpR2PcZhsDkbcM1KvAvJ8tE8YytiSt8agVvChqT69F8psGu4vGEGMyT
 ivHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=PMpVNBoEhxmM4CRkfdIX0zaCW76FCXVtwoTgqUPcVLU=;
 b=KIt9TPTEIaTNBlvvHNWHZ1PZxQgPOfIAbmTHJG0pCiTi25MbGzXVhKgQ8lEHT5QrTO
 w7j95gzFlnv4LzhmIGHuwn4yFS0O1EZ8Ghmb5qLf1h9gWFlLCwcbEWGEXrOXBxr6Gkyz
 A5P5Kt2V3gpbOx0AFPnRyeQ+PMdTnqlQ5WZ3CsZKOacIvLW13Fdy1/dtt7M4Jv9Kvrxg
 b8YUzwZqqsnNCFZxAn+NWgJRCOzT52zo340okZCpQxK8zY/+OcEjpWsTOqNeurDkp78X
 IbLzqBMBdm+tw26GOYo7v42g2qGLm5ricn1+CTjdE5n2hl4Y9JiPcrmCT3HGDjX8LbHB
 aPvg==
X-Gm-Message-State: AGi0Pub4Jiu6WeTQgQb1pSVXWa1WNnsWGwlWXXx8BH68U9kAJ373gXP1
 x5k4B/UAZVkYOr2QFv9GO6w5jIjJKDRk7+Ea7l4=
X-Google-Smtp-Source: APiQypL+sep8ou8J6mqKZQXNqve2pmJX8BmGCDtinGGz6khiz1mmiredSXRSShGE44sQLQI1B+pqUO+oGpZv4AQ5u9o=
X-Received: by 2002:a1c:6344:: with SMTP id x65mr12146860wmb.56.1588880502897; 
 Thu, 07 May 2020 12:41:42 -0700 (PDT)
MIME-Version: 1.0
References: <20200507112412.10829-1-chentao107@huawei.com>
In-Reply-To: <20200507112412.10829-1-chentao107@huawei.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Thu, 7 May 2020 15:41:31 -0400
Message-ID: <CADnq5_MDPZbDrrgCCdWVfSX47it0=JvTj3k_W8woK6=O=qzCnQ@mail.gmail.com>
Subject: Re: [PATCH -next] drm/amd/dc: Remove a useless comparison
To: ChenTao <chentao107@huawei.com>
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
Cc: Sam Ravnborg <sam@ravnborg.org>, Dave Airlie <airlied@linux.ie>, "Siqueira,
 Rodrigo" <Rodrigo.Siqueira@amd.com>, murton.liu@amd.com,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 LKML <linux-kernel@vger.kernel.org>, "Leo \(Sunpeng\) Li" <sunpeng.li@amd.com>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 Anthony Koo <Anthony.Koo@amd.com>, Christian Koenig <christian.koenig@amd.com>,
 Su Sung Chung <Su.Chung@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, May 7, 2020 at 9:35 AM ChenTao <chentao107@huawei.com> wrote:
>
> Fix the following warning:
>
> 'en' is uint32_t and can never be negative.
>
> drivers/gpu/drm/amd/amdgpu/../display/dc/gpio/hw_hpd.c:132:10: warning:
> comparison of unsigned expression < 0 is always false [-Wtype-limits]
>   if ((en < GPIO_DDC_LINE_MIN) || (en > GPIO_DDC_LINE_MAX)) {
> drivers/gpu/drm/amd/amdgpu/../display/dc/gpio/hw_generic.c:109:10: warning:
> comparison of unsigned expression < 0 is always false [-Wtype-limits]
>   if ((en < GPIO_DDC_LINE_MIN) || (en > GPIO_DDC_LINE_MAX)) {
>

While it's not required, I think it improves readability and protects
if the enum has negative values.  I think it would be better to change
the en var to signed.

Alex

> Reported-by: Hulk Robot <hulkci@huawei.com>
> Signed-off-by: ChenTao <chentao107@huawei.com>
> ---
>  drivers/gpu/drm/amd/display/dc/gpio/hw_generic.c | 2 +-
>  drivers/gpu/drm/amd/display/dc/gpio/hw_hpd.c     | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/display/dc/gpio/hw_generic.c b/drivers/gpu/drm/amd/display/dc/gpio/hw_generic.c
> index f9e847e6555d..6cd50232c432 100644
> --- a/drivers/gpu/drm/amd/display/dc/gpio/hw_generic.c
> +++ b/drivers/gpu/drm/amd/display/dc/gpio/hw_generic.c
> @@ -106,7 +106,7 @@ void dal_hw_generic_init(
>         enum gpio_id id,
>         uint32_t en)
>  {
> -       if ((en < GPIO_DDC_LINE_MIN) || (en > GPIO_DDC_LINE_MAX)) {
> +       if (en > GPIO_DDC_LINE_MAX) {
>                 ASSERT_CRITICAL(false);
>                 *hw_generic = NULL;
>         }
> diff --git a/drivers/gpu/drm/amd/display/dc/gpio/hw_hpd.c b/drivers/gpu/drm/amd/display/dc/gpio/hw_hpd.c
> index 692f29de7797..f91f426699c0 100644
> --- a/drivers/gpu/drm/amd/display/dc/gpio/hw_hpd.c
> +++ b/drivers/gpu/drm/amd/display/dc/gpio/hw_hpd.c
> @@ -129,7 +129,7 @@ void dal_hw_hpd_init(
>         enum gpio_id id,
>         uint32_t en)
>  {
> -       if ((en < GPIO_DDC_LINE_MIN) || (en > GPIO_DDC_LINE_MAX)) {
> +       if (en > GPIO_DDC_LINE_MAX) {
>                 ASSERT_CRITICAL(false);
>                 *hw_hpd = NULL;
>         }
> --
> 2.22.0
>
> _______________________________________________
> amd-gfx mailing list
> amd-gfx@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/amd-gfx
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
