Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 906051282D4
	for <lists+dri-devel@lfdr.de>; Fri, 20 Dec 2019 20:40:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 58CE36EC9D;
	Fri, 20 Dec 2019 19:40:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com
 [IPv6:2a00:1450:4864:20::343])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CFC5C6E12A;
 Fri, 20 Dec 2019 19:40:36 +0000 (UTC)
Received: by mail-wm1-x343.google.com with SMTP id p9so10086297wmc.2;
 Fri, 20 Dec 2019 11:40:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=hdYNVeVJ9zG7uGLj2brLM5VkYYRU60Z3UwUXj26j7Y4=;
 b=CQjMpL4hpX1WnvIacGuyzDar6rEtOQ1Hzw1EWSkC5XHG14fswPnJF+1QV21ZfGULQA
 mo9Kz7hvURKWJsuf04nj3n1t675ntsjJiu6YgdNBoPx+1I1VLVA5sNxdGONzPvsomlcy
 UR35nKhJ3NFWeMAlJz/Nm17pxvMqiK3/R8cLZjLuwX6skmzUW6/NBiL2F2E609zQBP6l
 EnMNIw+vKToWzJCrnqHUKuW0T16VZaqdkAwBDK6jOZHj/wAb62pB9QGbeOGw3vzCBrQS
 jvsjALrM4HfNat7B+63vHH17sL5/w5yEgaPTkOdOdi4e1Ph+JDDG6mRaza3jnjxOT1nt
 9TBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=hdYNVeVJ9zG7uGLj2brLM5VkYYRU60Z3UwUXj26j7Y4=;
 b=Cf3lhe+/km6Pec0JF9H1eNRlLxMFOJ8oCe+G5+SOCTUPLCxoXaN1jPkC2cNhsh6OI3
 7h+revaT7mE6D1g1+aw5Bw1eZHjTHwq+70B4Hpz2m+VUBkeWc094defzFJYuswy+HWa6
 sSzlrRAun2FC7JeiGdVbjk/snTdGR1DyAcu0wr+lkMyuraGyY3Z6ShtXcf87fT8h2bNX
 ZIVe3zyzmjUsamD/wtVhgntpVoOxg8rcGBhT56lrcE2EjxYOZqZbkD1+7vyaHYk8jLob
 fDmE3KJUmhYooI6NOr8YccW6Sk4avE7/nQCIHTIuWBA3tAWqAC+Y9hIXyKtDgBxa8nZ+
 NihQ==
X-Gm-Message-State: APjAAAW7vBbbvC2NPPn/UR9n2FMnyohgd4fdQi4dHyb48X22oT8vcXfp
 C0HRIeVURAeEIPW484a6dzbCn5K55t+oWPKQI8o=
X-Google-Smtp-Source: APXvYqym0wfGn4MUh0Q5DxHRfhzWymg3X0lx1rvhD/+srbD8Wct7zzVCcUi8kXTeECHde0dGL3nXAC88Ujygt72NEnw=
X-Received: by 2002:a1c:6404:: with SMTP id y4mr18312577wmb.143.1576870835379; 
 Fri, 20 Dec 2019 11:40:35 -0800 (PST)
MIME-Version: 1.0
References: <1576834568-82874-1-git-send-email-mafeng.ma@huawei.com>
In-Reply-To: <1576834568-82874-1-git-send-email-mafeng.ma@huawei.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Fri, 20 Dec 2019 14:40:23 -0500
Message-ID: <CADnq5_MgHpY4NJg+QcneaEWjVUa0qtdN8WX4aBrsx=hv2ukVdw@mail.gmail.com>
Subject: Re: [PATCH] drm/amdgpu: Remove unneeded variable 'ret' in navi10_ih.c
To: Ma Feng <mafeng.ma@huawei.com>
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
Cc: David Airlie <airlied@linux.ie>, LKML <linux-kernel@vger.kernel.org>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 Alex Deucher <alexander.deucher@amd.com>,
 Christian Koenig <christian.koenig@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Dec 20, 2019 at 10:10 AM Ma Feng <mafeng.ma@huawei.com> wrote:
>
> Fixes coccicheck warning:
>
> drivers/gpu/drm/amd/amdgpu/navi10_ih.c:113:5-8: Unneeded variable: "ret". Return "0" on line 182
>
> Reported-by: Hulk Robot <hulkci@huawei.com>
> Signed-off-by: Ma Feng <mafeng.ma@huawei.com>

Applied.  Thanks!

Alex

> ---
>  drivers/gpu/drm/amd/amdgpu/navi10_ih.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/navi10_ih.c b/drivers/gpu/drm/amd/amdgpu/navi10_ih.c
> index 9af7356..f737ce4 100644
> --- a/drivers/gpu/drm/amd/amdgpu/navi10_ih.c
> +++ b/drivers/gpu/drm/amd/amdgpu/navi10_ih.c
> @@ -110,7 +110,6 @@ static uint32_t navi10_ih_rb_cntl(struct amdgpu_ih_ring *ih, uint32_t ih_rb_cntl
>  static int navi10_ih_irq_init(struct amdgpu_device *adev)
>  {
>         struct amdgpu_ih_ring *ih = &adev->irq.ih;
> -       int ret = 0;
>         u32 ih_rb_cntl, ih_doorbell_rtpr, ih_chicken;
>         u32 tmp;
>
> @@ -179,7 +178,7 @@ static int navi10_ih_irq_init(struct amdgpu_device *adev)
>         /* enable interrupts */
>         navi10_ih_enable_interrupts(adev);
>
> -       return ret;
> +       return 0;
>  }
>
>  /**
> --
> 2.6.2
>
> _______________________________________________
> amd-gfx mailing list
> amd-gfx@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/amd-gfx
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
