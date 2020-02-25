Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CA7E916E9BD
	for <lists+dri-devel@lfdr.de>; Tue, 25 Feb 2020 16:14:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D170D6EB22;
	Tue, 25 Feb 2020 15:14:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DFA076EB21;
 Tue, 25 Feb 2020 15:14:08 +0000 (UTC)
Received: by mail-wr1-x441.google.com with SMTP id v4so2296634wrs.8;
 Tue, 25 Feb 2020 07:14:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=QXzprrtp68rQTmrZnfpbTAHahYMoR+p+Au9u2qscN2A=;
 b=GkcVQcp/6ZPehbeQY8JZj9qHNu+KM+ij2Ac6LOcyHyi22wIPIdCemfzEJPKLf8LjLj
 FKb4c9SDJ4iV+jyMVfobWZzBWl+d3fXt6N8z1YvZsHakD1ndKIJFlGdpSxbNSb6/5JwG
 lxRlHQMNgeAKzX4T53OJCbDNPiDI35HTSDYdPMMLU8wm33DBGFCjTmapDBfilbz+GA1v
 ILCCmJxgX2voBzpUL+OwmekWtTi2fSOg3z8q47KjKAwxacpL14/gMxeLQjhVdR3Ezzx0
 8LKZK2gneeTU5kbo25SYbcsTM7Bg9QrononOXn3h0yBMFepS717EXBgMt5FQ7qD9YCeX
 ChDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=QXzprrtp68rQTmrZnfpbTAHahYMoR+p+Au9u2qscN2A=;
 b=smVlIMk71VjL4AymGodxheDKNEHDkq79OHgcgSxqiWOa1NEB4fJin2Jv058DbaMVu4
 AT2zYMlIiXu+Ne/3ezVXdEOip9cFNZldpvbSMJYYyNEMTymF32dnXbyrS5lI03iDZ+/y
 bGeHHsUYHoaGBVTQf70vgeB3g8g3TsQp0QS5zZL+AsuCIVJlBldzOJXXNIM2qvwxdfzZ
 q5FezFj601ScEZLM/ht293i8lOG1ESubvNWUggItJqz8HFDQv+A4c4N5gRy5JYCcGh0P
 ZqM2yts/qC+be1LVvsaQ6TyU6GQ9BAB37L6WUPcsBSjSPb2FA2l4Szlk+AHYlp/EuFOw
 t8Rw==
X-Gm-Message-State: APjAAAUOjz3ekOeb81M1OOv0+fUBN3EfFXGeuYHsg2X1xZYGqabVgPQw
 rkscNtNUlO7B971gAjSPnWSj2SupeD7+tqtWUtU=
X-Google-Smtp-Source: APXvYqz015XmLIRToUFz/saw+T7KQVzV9ftDiqBQjP1WNtuDuxUROpWkH2OtTEjG1hUe2M5d5d2uBilnQkLpf0g7uMc=
X-Received: by 2002:adf:b254:: with SMTP id y20mr72518730wra.362.1582643647644; 
 Tue, 25 Feb 2020 07:14:07 -0800 (PST)
MIME-Version: 1.0
References: <20200221122139.148664-1-chenzhou10@huawei.com>
 <MN2PR12MB33447575BAF26E919965AB5CE4EC0@MN2PR12MB3344.namprd12.prod.outlook.com>
In-Reply-To: <MN2PR12MB33447575BAF26E919965AB5CE4EC0@MN2PR12MB3344.namprd12.prod.outlook.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Tue, 25 Feb 2020 10:13:56 -0500
Message-ID: <CADnq5_OZgyYrkPSna0Sp+04-POYxWqgXgOPkjGfgxz2qCqiTwA@mail.gmail.com>
Subject: Re: [PATCH -next] drm/amd/powerplay: Use bitwise instead of
 arithmetic operator for flags
To: "Quan, Evan" <Evan.Quan@amd.com>
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
Cc: Chen Zhou <chenzhou10@huawei.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "airlied@linux.ie" <airlied@linux.ie>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>, "Deucher,
 Alexander" <Alexander.Deucher@amd.com>, "Feng, Kenneth" <Kenneth.Feng@amd.com>,
 "Koenig, Christian" <Christian.Koenig@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sun, Feb 23, 2020 at 10:21 PM Quan, Evan <Evan.Quan@amd.com> wrote:
>
> Thanks. Reviewed-by: Evan Quan <evan.quan@amd.com>
>

Applied.  Thanks!

Alex

> -----Original Message-----
> From: Chen Zhou <chenzhou10@huawei.com>
> Sent: Friday, February 21, 2020 8:22 PM
> To: Quan, Evan <Evan.Quan@amd.com>; Deucher, Alexander <Alexander.Deucher@amd.com>; Koenig, Christian <Christian.Koenig@amd.com>; Zhou, David(ChunMing) <David1.Zhou@amd.com>; airlied@linux.ie; daniel@ffwll.ch
> Cc: Feng, Kenneth <Kenneth.Feng@amd.com>; amd-gfx@lists.freedesktop.org; dri-devel@lists.freedesktop.org; linux-kernel@vger.kernel.org; chenzhou10@huawei.com
> Subject: [PATCH -next] drm/amd/powerplay: Use bitwise instead of arithmetic operator for flags
>
> This silences the following coccinelle warning:
>
> "WARNING: sum of probable bitmasks, consider |"
>
> Signed-off-by: Chen Zhou <chenzhou10@huawei.com>
> ---
>  drivers/gpu/drm/amd/powerplay/hwmgr/vega10_hwmgr.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/powerplay/hwmgr/vega10_hwmgr.c b/drivers/gpu/drm/amd/powerplay/hwmgr/vega10_hwmgr.c
> index 92a65e3d..f29f95b 100644
> --- a/drivers/gpu/drm/amd/powerplay/hwmgr/vega10_hwmgr.c
> +++ b/drivers/gpu/drm/amd/powerplay/hwmgr/vega10_hwmgr.c
> @@ -3382,7 +3382,7 @@ static int vega10_populate_and_upload_sclk_mclk_dpm_levels(
>         }
>
>         if (data->need_update_dpm_table &
> -                       (DPMTABLE_OD_UPDATE_SCLK + DPMTABLE_UPDATE_SCLK + DPMTABLE_UPDATE_SOCCLK)) {
> +                       (DPMTABLE_OD_UPDATE_SCLK | DPMTABLE_UPDATE_SCLK |
> +DPMTABLE_UPDATE_SOCCLK)) {
>                 result = vega10_populate_all_graphic_levels(hwmgr);
>                 PP_ASSERT_WITH_CODE((0 == result),
>                                 "Failed to populate SCLK during PopulateNewDPMClocksStates Function!", @@ -3390,7 +3390,7 @@ static int vega10_populate_and_upload_sclk_mclk_dpm_levels(
>         }
>
>         if (data->need_update_dpm_table &
> -                       (DPMTABLE_OD_UPDATE_MCLK + DPMTABLE_UPDATE_MCLK)) {
> +                       (DPMTABLE_OD_UPDATE_MCLK | DPMTABLE_UPDATE_MCLK)) {
>                 result = vega10_populate_all_memory_levels(hwmgr);
>                 PP_ASSERT_WITH_CODE((0 == result),
>                                 "Failed to populate MCLK during PopulateNewDPMClocksStates Function!",
> --
> 2.7.4
>
> _______________________________________________
> amd-gfx mailing list
> amd-gfx@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/amd-gfx
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
