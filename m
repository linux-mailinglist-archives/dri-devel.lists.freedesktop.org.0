Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 240542135FD
	for <lists+dri-devel@lfdr.de>; Fri,  3 Jul 2020 10:12:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1485A6EB4C;
	Fri,  3 Jul 2020 08:12:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ua1-x941.google.com (mail-ua1-x941.google.com
 [IPv6:2607:f8b0:4864:20::941])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9114B6E213
 for <dri-devel@lists.freedesktop.org>; Thu,  2 Jul 2020 10:19:41 +0000 (UTC)
Received: by mail-ua1-x941.google.com with SMTP id l12so4004632uak.7
 for <dri-devel@lists.freedesktop.org>; Thu, 02 Jul 2020 03:19:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=4U7pwdobnpXo2+wodK7ksalwXz6Csu9FNbhdoHm2mYM=;
 b=XMx/fc3xmJqXwVmTNjgMsBz83N0C2Kq3cIcO/pJWjkhn7tOUwBn61bA4t7caSbjr5I
 dAoMZyZV68ybxMK5Dx8DFoKV3BaQ7/Ot699//UXl4XINrvz9z6/cXIcdLw+KRcorqTWK
 /APWX4fp1ugr4nQN1i3vMDdfjC4Hz+SFcGfzSNjARGAqMHNjEKTZTHGWnt3yphz2P1Js
 OeXra52huDYRiUEiIq8vbwl1W4nu9WvZ9dmApJe8I76Dl9I3sQXfCJsfh5DoJBMWchqh
 v5XwC4e1U66nUFk0IY1mNlZ870ZSYK42CMJsatPe9nEwETUpb8hcTVFFI2TdXIopVPzA
 NF8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=4U7pwdobnpXo2+wodK7ksalwXz6Csu9FNbhdoHm2mYM=;
 b=JPcK7EjDycKDtaHbCLC3Xd8o5pnmykC9Znl5TO3R6OdcoySxM8P+hGEATEBpnfk7Zd
 ZlwBaCsp/eItGnc8hjGqZXIL2sp7NEApdM7lcMcR80yTQIULyA5ZHAdL2zglQXzcLXJu
 c+6RKsJzqgNZvxLlMfdiJFw8xIWwk6Rr5gzqZR1YQtBZ4frb1+8MrTx3biBEwlB5YvUt
 4RwdH04m7BRw6ytYk6wgTkSFi+S6AqxxjWTQQ4zdfyS8JRdZuMG9yTUAfjqJxolC5tht
 usJvnBzEUulqa0i29b1bnx9bZvJI7J4o2k/gqNcjK95i3mCSpy9NM0AB3NmbQhZ4dZtT
 4F8A==
X-Gm-Message-State: AOAM533DZcxyOva6HD+fdJMowpPHNmy8muIbdrpikg3+O6gCmADEqK0o
 2w3DBcxKQd3KMSbf2A/zvHGo+mN1azjrd6SPIPE=
X-Google-Smtp-Source: ABdhPJwMf/Kv5n2Q9kIIKesJRBtlUU5WcGzuyUHA2ORibg+smZ2ST2LjLE1roKk1U7HOvOfOfzx5ebAkOEZSoX7OhRQ=
X-Received: by 2002:ab0:2a46:: with SMTP id p6mr4105124uar.88.1593685180856;
 Thu, 02 Jul 2020 03:19:40 -0700 (PDT)
MIME-Version: 1.0
References: <20200702091810.4999-1-weiyongjun1@huawei.com>
In-Reply-To: <20200702091810.4999-1-weiyongjun1@huawei.com>
From: Vaibhav Gupta <vaibhavgupta40@gmail.com>
Date: Thu, 2 Jul 2020 15:48:01 +0530
Message-ID: <CAP+cEOM1tExZzxnkdtX9w2ZyPoFTJ+JxQw+q=ErWM1JJJc8w7Q@mail.gmail.com>
Subject: Re: [PATCH net-next] ksz884x: mark pcidev_suspend() as __maybe_unused
To: Wei Yongjun <weiyongjun1@huawei.com>
X-Mailman-Approved-At: Fri, 03 Jul 2020 08:12:01 +0000
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
Cc: "Michael S. Tsirkin" <mst@redhat.com>,
 Nikolay Aleksandrov <nikolay@cumulusnetworks.com>, netdev@vger.kernel.org,
 Julian Wiedmann <jwi@linux.ibm.com>, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org, Hulk Robot <hulkci@huawei.com>,
 Jakub Kicinski <kuba@kernel.org>, Shannon Nelson <snelson@pensando.io>,
 zhong jiang <zhongjiang@huawei.com>, linux-media@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Jul 2, 2020 at 2:38 PM Wei Yongjun <weiyongjun1@huawei.com> wrote:
>
> In certain configurations without power management support, gcc report
> the following warning:
>
> drivers/net/ethernet/micrel/ksz884x.c:7182:12: warning:
>  'pcidev_suspend' defined but not used [-Wunused-function]
>  7182 | static int pcidev_suspend(struct device *dev_d)
>       |            ^~~~~~~~~~~~~~
>
> Mark pcidev_suspend() as __maybe_unused to make it clear.
>
> Fixes: 64120615d140 ("ksz884x: use generic power management")
> Reported-by: Hulk Robot <hulkci@huawei.com>
> Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>
> ---
>  drivers/net/ethernet/micrel/ksz884x.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/net/ethernet/micrel/ksz884x.c b/drivers/net/ethernet/micrel/ksz884x.c
> index 24901342ecc0..2ce7304d3753 100644
> --- a/drivers/net/ethernet/micrel/ksz884x.c
> +++ b/drivers/net/ethernet/micrel/ksz884x.c
> @@ -7179,7 +7179,7 @@ static int __maybe_unused pcidev_resume(struct device *dev_d)
>         return 0;
>  }
>
> -static int pcidev_suspend(struct device *dev_d)
> +static int __maybe_unused pcidev_suspend(struct device *dev_d)
>  {
>         int i;
>         struct platform_info *info = dev_get_drvdata(dev_d);
>
This is a necessary fix. Thanks !
--Vaibhav Gupta
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
