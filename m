Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FF6E24ACBC
	for <lists+dri-devel@lfdr.de>; Thu, 20 Aug 2020 03:53:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A61F86E88A;
	Thu, 20 Aug 2020 01:53:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x243.google.com (mail-oi1-x243.google.com
 [IPv6:2607:f8b0:4864:20::243])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 495B96E88A
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Aug 2020 01:53:20 +0000 (UTC)
Received: by mail-oi1-x243.google.com with SMTP id u63so718250oie.5
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Aug 2020 18:53:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=95vglf64Vq/O/1I3tuau6vIlhCDn5C32IVrNU3ul3Rs=;
 b=qN6Z+7A+Lbqvnw/Y3D/+sTqCsXSHZNFofii9Sv7TAGxZTT4nzYugE0dv9WTjhy2Ach
 +bhLMdQLy50q5omf+RBQ7ttymA4E2wnLpegiXS6qkD0jOwznXKg6Uhanq75UdpRrSZ66
 OM5P1bIQaiyp+S+D5AsSGvF1RLWV0iyMOLjSPXcJJ5W4N8NQvko9tn0H8YwE5EYRDUYh
 5bltJlJRMt+4kkGWuQZZd1tFeESB9OagrslJBjw8flAHuV7E+cA49b+f4QZ+Ys+qKJzf
 yt9Du/YLUFEDZvS0GWAkjnup+G5NgTLBJdMf5qwxqk3iQE1wPRWq6d8GTvx0sLSy1P6D
 aTtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=95vglf64Vq/O/1I3tuau6vIlhCDn5C32IVrNU3ul3Rs=;
 b=smOOawLf1A/RmkA2VLkYRcQBjypro2Zrmrv/S2IpTZvFnIuf9oKpFvAXmelfJqIr41
 25j6j9pVBkIDs2WI2Za99+NWI9BhQNWIMxgOOld+app61o4zQmHelgktDsPzRschZdX7
 KUVoP1Y6/HbE65ZVWBO7uDslaK4Mdj57l5c6VpMwtA+pB2DvmJHZbGfRFKR7URe7BsfD
 0K3st/06gi122O20OpcKWuLC3R/zfJ8AjbT0jjC0HAx2eihguE5VNdEfVmH6LZaRUKAP
 DfFJNvjBSmCradc1IovjhDupBoyDTAnOl/G8N3hmhWNlZr2bDoaWagzOqDBn4RAR0LYu
 /QCg==
X-Gm-Message-State: AOAM5321ZhTQpGftmA87VSR8hhG/DT6q4hWyff3bPYckMXxfcU44QV5Q
 RYT34vktqi/EACI592Yz3MDvQ/uQoeyO27MpDG2oKA==
X-Google-Smtp-Source: ABdhPJySRF2+7apSZAyGDFV0x5mhrt3OKJXKRRGDgyzVeBsX16AotO12+Vzd0RVSZAnZmVjb8g7Vq+nZj9NHf4LQsIU=
X-Received: by 2002:aca:1014:: with SMTP id 20mr557719oiq.169.1597888399467;
 Wed, 19 Aug 2020 18:53:19 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1597833138.git.mchehab+huawei@kernel.org>
 <9fa944021373ec5b82c2c1e118c15d9effe7f964.1597833138.git.mchehab+huawei@kernel.org>
In-Reply-To: <9fa944021373ec5b82c2c1e118c15d9effe7f964.1597833138.git.mchehab+huawei@kernel.org>
From: John Stultz <john.stultz@linaro.org>
Date: Wed, 19 Aug 2020 18:53:06 -0700
Message-ID: <CALAqxLV-LaMPKD-ddRM1EehFh+JZfh1eUsKobXgVG9R+q0EF2w@mail.gmail.com>
Subject: Re: [PATCH 25/49] staging: hikey9xx/gpu: do some code cleanups
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
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
Cc: driverdevel <devel@driverdev.osuosl.org>,
 Liwei Cai <cailiwei@hisilicon.com>, Manivannan Sadhasivam <mani@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linuxarm@huawei.com,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Xiubin Zhang <zhangxiubin1@huawei.com>, Chen Feng <puck.chen@hisilicon.com>,
 mauro.chehab@huawei.com, lkml <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Aug 19, 2020 at 4:46 AM Mauro Carvalho Chehab
<mchehab+huawei@kernel.org> wrote:
> @@ -376,7 +355,7 @@ static int kirin_drm_platform_resume(struct platform_device *pdev)
>  }
>
>  static const struct of_device_id kirin_drm_dt_ids[] = {
> -       { .compatible = "hisilicon,hi3660-dpe",
> +       { .compatible = "hisilicon,kirin960-dpe",


One issue, elsewhere in your patch stack you still refer to the
hisilicon,hi3660-dpe compatible string. This should probably be
consistent one way or the other.

thanks
-john
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
