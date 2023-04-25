Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3649E6EE308
	for <lists+dri-devel@lfdr.de>; Tue, 25 Apr 2023 15:31:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9F84210E2B7;
	Tue, 25 Apr 2023 13:31:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1792410E2B7
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Apr 2023 13:31:04 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 529F362E7E
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Apr 2023 13:31:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DF904C4331F
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Apr 2023 13:31:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1682429462;
 bh=wmID8emQw+is79zlL5AF9o/8qFWaAe9tV8o9bZxfmd8=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=fxGwf6b9V0b29A2x9MYnoTsl71mf4LD1BQ5xiSM87TifE9z+pWZOrX+W2UgCNWodL
 LDAckxfK7xvn5rR3VGWy7Xf9PjSO/4Gc26E0cEDgdVhBMNHS5kcPxdxQh06Ilqfybb
 ohF0NOnTIRVVfTTOUB5OKFBf1WBzmhWjo2ZeoOqSFFdkfonHXrywEgr1kkHur0paBC
 WjwYMBBGYQAGJ4drv36Zn11BsfiIhkIh8pdIb3SlTVEhoWT6YA635pCaJW4z7mxoVH
 IIFvFUJp4nALyM0B8XIQ5mkCFxAHt0KvfOaxyQccLSpyJc0w5MyCrqaJIpbvBmdWm5
 ZWt2L5dzcDSNA==
Received: by mail-pf1-f175.google.com with SMTP id
 d2e1a72fcca58-63b4a64c72bso4624133b3a.0
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Apr 2023 06:31:02 -0700 (PDT)
X-Gm-Message-State: AAQBX9duaik4te0sdeltsf5v1BGNkZS+0zAJ3hLSiAND5zJz+Wr9FYB4
 JZNc5VyBg/9oZkO14K23NLRVUruWh/loyOQ3VL+n7Q==
X-Google-Smtp-Source: AKy350aIvPvFU11G6qOuvvWHhyxXmANsSsmKypyebe+yKmS7qPVlrUVJUhVNvRKDlhe6tff+0goq4lc4uY0rFxX3mp8=
X-Received: by 2002:a05:6a20:3d94:b0:f3:6b70:2dd7 with SMTP id
 s20-20020a056a203d9400b000f36b702dd7mr12684872pzi.34.1682429462222; Tue, 25
 Apr 2023 06:31:02 -0700 (PDT)
MIME-Version: 1.0
References: <40c60719-4bfe-b1a4-ead7-724b84637f55@web.de>
 <1a11455f-ab57-dce0-1677-6beb8492a257@web.de>
 <14636275-4d26-d639-5f6e-293fc6d1c4c6@web.de>
In-Reply-To: <14636275-4d26-d639-5f6e-293fc6d1c4c6@web.de>
From: Robert Foss <rfoss@kernel.org>
Date: Tue, 25 Apr 2023 15:30:51 +0200
X-Gmail-Original-Message-ID: <CAN6tsi7caOQZLLvbL7phMEtNvBLaWgJuHLkLo3YWdqQw7Vxnaw@mail.gmail.com>
Message-ID: <CAN6tsi7caOQZLLvbL7phMEtNvBLaWgJuHLkLo3YWdqQw7Vxnaw@mail.gmail.com>
Subject: Re: [PATCH] drm/bridge: it6505: Move a variable assignment behind a
 null pointer check in receive_timing_debugfs_show()
To: Markus Elfring <Markus.Elfring@web.de>
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
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, Jonas Karlman <jonas@kwiboo.se>,
 Allen Chen <allen.chen@ite.com.tw>, kernel-janitors@vger.kernel.org,
 LKML <linux-kernel@vger.kernel.org>, dri-devel@lists.freedesktop.org,
 Hermes Wu <hermes.wu@ite.com.tw>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Hsin-yi Wang <hsinyi@chromium.org>, cocci@inria.fr,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hey Markus,

This patch seems to be a part of a series without being marked as
such, this causes issues when importing this patch with maintainer
tools like b4 which automatically pull in the entire series and not
just the specific patch. Either label the patch as being part of a
series ( [PATCH 1/XX] ), or submit it separately.

On Sun, Apr 16, 2023 at 5:47=E2=80=AFPM Markus Elfring <Markus.Elfring@web.=
de> wrote:
>
> Date: Sun, 16 Apr 2023 17:30:46 +0200
>
> The address of a data structure member was determined before
> a corresponding null pointer check in the implementation of
> the function =E2=80=9Creceive_timing_debugfs_show=E2=80=9D.
>
> Thus avoid the risk for undefined behaviour by moving the assignment
> for the variable =E2=80=9Cvid=E2=80=9D behind the null pointer check.
>
> This issue was detected by using the Coccinelle software.
>
> Fixes: b5c84a9edcd418cd055becad6a22439e7c5e3bf8 ("drm/bridge: add it6505 =
driver")
> Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>

The email in the Signed-off tag should match the email of the sender,
which it doesn't.

With the two above issues fixed, please add my r-b.
Reviewed-by: Robert Foss <rfoss@kernel.org>

> ---
>  drivers/gpu/drm/bridge/ite-it6505.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/bridge/ite-it6505.c b/drivers/gpu/drm/bridge=
/ite-it6505.c
> index abaf6e23775e..45f579c365e7 100644
> --- a/drivers/gpu/drm/bridge/ite-it6505.c
> +++ b/drivers/gpu/drm/bridge/ite-it6505.c
> @@ -3207,7 +3207,7 @@ static ssize_t receive_timing_debugfs_show(struct f=
ile *file, char __user *buf,
>                                            size_t len, loff_t *ppos)
>  {
>         struct it6505 *it6505 =3D file->private_data;
> -       struct drm_display_mode *vid =3D &it6505->video_info;
> +       struct drm_display_mode *vid;
>         u8 read_buf[READ_BUFFER_SIZE];
>         u8 *str =3D read_buf, *end =3D read_buf + READ_BUFFER_SIZE;
>         ssize_t ret, count;
> @@ -3216,6 +3216,7 @@ static ssize_t receive_timing_debugfs_show(struct f=
ile *file, char __user *buf,
>                 return -ENODEV;
>
>         it6505_calc_video_info(it6505);
> +       vid =3D &it6505->video_info;
>         str +=3D scnprintf(str, end - str, "---video timing---\n");
>         str +=3D scnprintf(str, end - str, "PCLK:%d.%03dMHz\n",
>                          vid->clock / 1000, vid->clock % 1000);
> --
> 2.40.0
>
