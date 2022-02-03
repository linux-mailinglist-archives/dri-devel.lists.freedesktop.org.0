Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 21DF84A8151
	for <lists+dri-devel@lfdr.de>; Thu,  3 Feb 2022 10:21:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B7C0510E5A9;
	Thu,  3 Feb 2022 09:21:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.kundenserver.de (mout.kundenserver.de [217.72.192.74])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 54F0910E5A9
 for <dri-devel@lists.freedesktop.org>; Thu,  3 Feb 2022 09:21:13 +0000 (UTC)
Received: from mail-wm1-f50.google.com ([209.85.128.50]) by
 mrelayeu.kundenserver.de (mreue106 [213.165.67.113]) with ESMTPSA (Nemesis)
 id 1N7yz7-1mAg9E1ww7-0153Ph for <dri-devel@lists.freedesktop.org>; Thu, 03
 Feb 2022 10:21:11 +0100
Received: by mail-wm1-f50.google.com with SMTP id
 bg21-20020a05600c3c9500b0035283e7a012so1399947wmb.0
 for <dri-devel@lists.freedesktop.org>; Thu, 03 Feb 2022 01:21:11 -0800 (PST)
X-Gm-Message-State: AOAM530D6atJMI71IShCK15jWvWGDp5X3apvGncDuKjcULOkCyUlDPwt
 IO3Q8K1dXOaaeoPpBT7ZmDli0qDgMN9VXDqNprE=
X-Google-Smtp-Source: ABdhPJzzGHS040+Ga0s5Uewyaa/jDPD/fj5JRTVbX2eFjm6kLmPkl8rRFjQT8dqAI3jEVH6cV/zk5k8WD1CiDjX4ogQ=
X-Received: by 2002:a05:600c:2309:: with SMTP id
 9mr9597514wmo.82.1643880070927; 
 Thu, 03 Feb 2022 01:21:10 -0800 (PST)
MIME-Version: 1.0
References: <20220203091340.20285-1-tzimmermann@suse.de>
In-Reply-To: <20220203091340.20285-1-tzimmermann@suse.de>
From: Arnd Bergmann <arnd@arndb.de>
Date: Thu, 3 Feb 2022 10:20:55 +0100
X-Gmail-Original-Message-ID: <CAK8P3a3dYmCfyQV+iPj6KJAKpv8zYCVorDjqpeyVeAz7v7JyaQ@mail.gmail.com>
Message-ID: <CAK8P3a3dYmCfyQV+iPj6KJAKpv8zYCVorDjqpeyVeAz7v7JyaQ@mail.gmail.com>
Subject: Re: [PATCH] drm/panel: Select DRM_DP_HELPER for DRM_PANEL_EDP
To: Thomas Zimmermann <tzimmermann@suse.de>
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:M0yCHMCX5dav9n+2mkt9yF9AtjjyM+RDFvb6WGTsbY/eHHReGJq
 nmHEFKYLhxj5xYWxcaRpWXD9tCJ6rM6jwRpS5aIMDdu+t18M0k0BkYPWboGqlNA82e4QwNt
 s/vJxLx29uxfNaZvAXrF90ISZd9yWixXMDV0OTYNsphyrRru46/ZJOec70vdygaLZYhJ3Kr
 rsc3P7dmwziiXsSsmBThw==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:i6YAcpBoDFk=:YgfPbQjpzh/I2S+WtmJJGr
 5UktuKNbB6NhQ4qonuDnxkhVeAPqFufynSRWqz0Erj9yc1xSrl4dBYs5820xD+T6+G5WKsOTz
 qUyrMhwWxkr/bkP+kCGxmHGauu2ji0lFuIx8IQfB5/Eu6GoS7A1wzV1RQUGnjc6U5atM3NVaM
 rtxx5eO5k21o7VLVbdeFxOJMW6UyAQNFcNaA6x1pH4wTHLh0LREGbxFKOsWjPiq+0tYKuMnLu
 FIPE+0wTV+E2eNHF5/YeI+uuNSZ2pcmFeeFgQN2LRndiee/msEfLGWmMxGgmcT1e3qp5SWJTT
 5PNoSrZlTxdMXOIQi7wRhJtX+GgOzG6qelNHWlKab0sMawY21D+/GqBLiYEVv+p+tAiSOhmBb
 zf4PXSWGWde1l4lkV/W5uhEKo8iyMsa3TOvDDuSLh2QXSWjBNuMkZj+4DQpy0hDxGToiwPhTG
 dkxtJA9bJHqn37Op7StTNZFP8wqnaidpjzf1n71rZBW3mWO4qxWcZv5HPO3WtEt37KYIex1Hr
 2l3ZzADI8IfwyfJyW0a5+2fR5EgWq1juBb+zjfrZ0+F1ZhDlQXBcql0298gyS9MTZIIH7vBrB
 ZfDfVsokpsBC+rPW4guqgsc+IiYbp8koBTINRthc1KOvOEPs1CkWC/+R+hj+AkvDQ0ajBJAWa
 ovZX1P2Bhy9XuPM9CCYtfUvbB8QM/9UVmkfCJxnWRTSHpu3GK8srSOosrRgbkcxwFgC6Bqcml
 ymC46alqOa++prsynIJLDvrHnYuGTA63DGhKYCdZfVdY3LCSegU0bGB2fjBIHrTM9ZJTrVG/Z
 hS3YHVW7EoTPnt1tiiyf3wN2JvKEb8uozCDbItIKgZtCBJN3hM=
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
Cc: Arnd Bergmann <arnd@arndb.de>, David Airlie <airlied@linux.ie>,
 Randy Dunlap <rdunlap@infradead.org>, Doug Anderson <dianders@chromium.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 Naresh Kamboju <naresh.kamboju@linaro.org>, Sam Ravnborg <sam@ravnborg.org>,
 Ard Biesheuvel <ardb@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Feb 3, 2022 at 10:13 AM Thomas Zimmermann <tzimmermann@suse.de> wrote:
>
> As reported in [1], DRM_PANEL_EDP depends on DRM_DP_HELPER. Select
> the option to fix the build failure. The issue has been reported
> before, when DisplayPort helpers where hidden behind the option
> CONFIG_DRM_KMS_HELPER. [2]

The two links [1] and [2] appear to be missing here, and I would also recommend
copying the build output into the changelog text for easier reference.

When linking to a bug report, best use 'Link:' tags in below.
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> Fixes: adb9d5a2cc77 ("drm/dp: Move DisplayPort helpers into separate helper module")
> Fixes: 5f04e7ce392d ("drm/panel-edp: Split eDP panels out of panel-simple")
> Reported-by: Naresh Kamboju <naresh.kamboju@linaro.org>
> Cc: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: Lyude Paul <lyude@redhat.com>
> Cc: Daniel Vetter <daniel@ffwll.ch>
> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> Cc: Maxime Ripard <mripard@kernel.org>
> Cc: dri-devel@lists.freedesktop.org
> ---
>  drivers/gpu/drm/panel/Kconfig | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/drivers/gpu/drm/panel/Kconfig b/drivers/gpu/drm/panel/Kconfig
> index 434c2861bb40..0aec5a10b064 100644
> --- a/drivers/gpu/drm/panel/Kconfig
> +++ b/drivers/gpu/drm/panel/Kconfig
> @@ -106,6 +106,7 @@ config DRM_PANEL_EDP
>         depends on PM
>         select VIDEOMODE_HELPERS
>         select DRM_DP_AUX_BUS
> +       select DRM_DP_HELPER
>         help
>           DRM panel driver for dumb eDP panels that need at most a regulator and
>           a GPIO to be powered up. Optionally a backlight can be attached so
