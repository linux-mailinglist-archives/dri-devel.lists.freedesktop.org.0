Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7491123A2D6
	for <lists+dri-devel@lfdr.de>; Mon,  3 Aug 2020 12:42:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 49CC06E248;
	Mon,  3 Aug 2020 10:42:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com
 [207.211.31.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3FCA56E248
 for <dri-devel@lists.freedesktop.org>; Mon,  3 Aug 2020 10:42:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1596451370;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=+bnr20DWse3hnxM4IaXhaBpbW0TWRM0m+ZB+3jgFT9M=;
 b=Jql41LA/T+7xRkneNAvrYMDAo9fj0IZRyuGNgCdeqAHroUVXyfatCTiWXHnWZID2VD1KHP
 wodJGdviVl0BcRU2pMzff3jcM6DIy+R2Z051DKZLoyd3PZCr1Qf1cRHPv0zOcydPztesB0
 SsrzocXpBoHQy4Gy+b7zjYLpn6odheY=
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-101-IKTb84IbOGm8XYPsknH5GQ-1; Mon, 03 Aug 2020 06:42:46 -0400
X-MC-Unique: IKTb84IbOGm8XYPsknH5GQ-1
Received: by mail-qv1-f71.google.com with SMTP id v5so20706343qvr.1
 for <dri-devel@lists.freedesktop.org>; Mon, 03 Aug 2020 03:42:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=+bnr20DWse3hnxM4IaXhaBpbW0TWRM0m+ZB+3jgFT9M=;
 b=irZbtTGJ2+P+MoeemjSr0VDCYg6Dpwfv6N7BhMKhmFQrLuScyajpqvgnRhd/1wJ827
 xCEXbiDH9SpZTROBr6I51Y9hHVlowUjGIna9HiygUJx2v20RfSmcK4QFg5DhbYFxLFiO
 TFA1DoFAsw0RVci8LjJGgRRup+kiOBwammQDfYA9szRyQQpTG6vpBsy0oNOqIGnmOxxP
 D5kSWVXcGFJa88YR/KvfSrzoWN6ajUL/k9UHV/UZDaYMu40tYJhl4oazElx/pKlo4FU6
 4iUwt1Y6mvHt9mT4XH3tOf1tMk3IvlgYM8JFJgPEsck77Nt04IGO6BgAD2gStYmDTrda
 uKwg==
X-Gm-Message-State: AOAM5301jeN6Y65Jf850sCAuf25z9vJewBdxZFZcTCYvPiTX55ZYVxmp
 WIilkEl3S50WS8qHI7IKPK7XjuGLktOkRHgCv/nWsSQZ1y8fzMOzVwL0a8RGNRQSJcXjvbt1UmG
 kMMDuudFTysgsaHzVP1yishxwQ5nIvhcxUyNEkKL40iri
X-Received: by 2002:a37:90e:: with SMTP id 14mr15896182qkj.102.1596451365658; 
 Mon, 03 Aug 2020 03:42:45 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzhxbdP+GWP4eAMFRYsKdTR78UMQm0cR2+UBqbqAyJHGCbvlFNyBXYetm44K0qZipDzP6iTc6iemkg+iwFYP3s=
X-Received: by 2002:a37:90e:: with SMTP id 14mr15896161qkj.102.1596451365347; 
 Mon, 03 Aug 2020 03:42:45 -0700 (PDT)
MIME-Version: 1.0
References: <20200803034827.100685-1-jingxiangfeng@huawei.com>
In-Reply-To: <20200803034827.100685-1-jingxiangfeng@huawei.com>
From: Karol Herbst <kherbst@redhat.com>
Date: Mon, 3 Aug 2020 12:42:34 +0200
Message-ID: <CACO55tsFuRmHac1_7KdebdrgGk=bAh2_aAUB302PH9rSSxdsjQ@mail.gmail.com>
Subject: Re: [Nouveau] [PATCH] drm/nouveau/acr: fix a coding style in
 nvkm_acr_lsfw_load_bl_inst_data_sig()
To: Jing Xiangfeng <jingxiangfeng@huawei.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kherbst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
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
Cc: David Airlie <airlied@linux.ie>, nouveau <nouveau@lists.freedesktop.org>,
 LKML <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, Ben Skeggs <bskeggs@redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Reviewed-by: Karol Herbst <kherbst@redhat.com>

On Mon, Aug 3, 2020 at 5:46 AM Jing Xiangfeng <jingxiangfeng@huawei.com> wrote:
>
> This patch performs the following changes:
> 1. remove a redundant parentheses around the  nvkm_acr_lsfw_add() calls
> 2. do assignment before this if condition, it is more readable
>
> Signed-off-by: Jing Xiangfeng <jingxiangfeng@huawei.com>
> ---
>  drivers/gpu/drm/nouveau/nvkm/subdev/acr/lsfw.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/acr/lsfw.c b/drivers/gpu/drm/nouveau/nvkm/subdev/acr/lsfw.c
> index 07d1830126ab..5f6006418472 100644
> --- a/drivers/gpu/drm/nouveau/nvkm/subdev/acr/lsfw.c
> +++ b/drivers/gpu/drm/nouveau/nvkm/subdev/acr/lsfw.c
> @@ -191,7 +191,8 @@ nvkm_acr_lsfw_load_bl_inst_data_sig(struct nvkm_subdev *subdev,
>         u32 *bldata;
>         int ret;
>
> -       if (IS_ERR((lsfw = nvkm_acr_lsfw_add(func, acr, falcon, id))))
> +       lsfw = nvkm_acr_lsfw_add(func, acr, falcon, id);
> +       if (IS_ERR(lsfw))
>                 return PTR_ERR(lsfw);
>
>         ret = nvkm_firmware_load_name(subdev, path, "bl", ver, &bl);
> --
> 2.17.1
>
> _______________________________________________
> Nouveau mailing list
> Nouveau@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/nouveau
>

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
