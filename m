Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AE9326E81B
	for <lists+dri-devel@lfdr.de>; Fri, 18 Sep 2020 00:17:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 929D76E41D;
	Thu, 17 Sep 2020 22:17:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x444.google.com (mail-pf1-x444.google.com
 [IPv6:2607:f8b0:4864:20::444])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4B63B6E2D7
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Sep 2020 17:36:55 +0000 (UTC)
Received: by mail-pf1-x444.google.com with SMTP id k13so1157038pfg.1
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Sep 2020 10:36:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=8xZMHi4HwDhGZXftClnq46LW61QUYpAjALMHSAmeHFo=;
 b=HrJY2l/+l6LLt+Iw+bTAHyVBsfRpf7NXHisw3NF+BRrcx97XLJ1enSWvPFYFay6mlq
 nIPRsnaEYtIDGPEQOSnNcHEug3cCEXVWXaRveLYt/Wj5rweFLiorsoUedzM/kkVQg7DE
 pt87URxYnqvl+qYdQDAmzB9SmZKlpSN3tCDu56s/pq5y6sFOY7GsDnat4M0Um5xN2acp
 nkOscukJPH2POn4AO+doyLqmX3oi3cc1Iv3NGHvSq9y3yaeaAeqxyiCh0jrUDluzlSy5
 TcAgjwkcWg/DUbcbv3GSssYHuZhxPrsQ3+lRtQaikvqx2J19Gsnj9n6rMCNCCu4UfCCn
 ejxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=8xZMHi4HwDhGZXftClnq46LW61QUYpAjALMHSAmeHFo=;
 b=cOlRulaZTQMRRmZZPHqd4DujiWD+3kY9VTAHHffQweSDN3Ix0fq9gn6N2Mj0Gv0jJF
 xzV4ccOJYb4JBbb4UYYUFdwcUZ9UxGXvw0jmlwNsDpkYwA08zUlYq/n15vpnnk7wtQqz
 DTo8Ja1PyYBjWMorU6ReqcI8m0B9lOYvDHiwzl/+zKNEC5eD8/j3goqDWWwbEDnydXvS
 nWyCxJbGmw/BHFy4PbzmbGpJBr5m0RVrRVOaUcRQ+AzUtW5I2dlZWlY/2ygOCWgW2+zR
 j9f9VN8rygRclgDTxtIEwJnC/qyJIngfcW7aCsyVwufyczCpo61xlgedUcGop5FuUILB
 q/zg==
X-Gm-Message-State: AOAM530Eocei0oZerqY60qaCi+VR6Jqa6jy2h5SpKv7amhOXdho4vCg9
 GDaMVxuBKhzONxkFqn6XkjyRjO20t6YGDwEYh8HkkQ==
X-Google-Smtp-Source: ABdhPJxE3ZgMjHDO8XI3+2LaZOLj4qA0/dlWB3n1yY4pXgIC9QaqYcsZlYmpVt+Ecsma4zqmTYQ9dIr0Ws0KfewjqLg=
X-Received: by 2002:a63:5d57:: with SMTP id o23mr7458172pgm.263.1600364214666; 
 Thu, 17 Sep 2020 10:36:54 -0700 (PDT)
MIME-Version: 1.0
References: <20200917131515.147029-1-jingxiangfeng@huawei.com>
In-Reply-To: <20200917131515.147029-1-jingxiangfeng@huawei.com>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Thu, 17 Sep 2020 10:36:43 -0700
Message-ID: <CAKwvOdnm-PkEt6T3HqB-NYNYADth0MJkXCvFsc-_gyqRE-nmcg@mail.gmail.com>
Subject: Re: [PATCH] fbcon: Remove the superfluous break
To: Jing Xiangfeng <jingxiangfeng@huawei.com>
X-Mailman-Approved-At: Thu, 17 Sep 2020 22:17:03 +0000
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
Cc: linux-fbdev@vger.kernel.org,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, daniel.vetter@ffwll.ch,
 "Gustavo A. R. Silva" <gustavo@embeddedor.com>,
 LKML <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, george.kennedy@oracle.com,
 Greg KH <gregkh@linuxfoundation.org>, Joe Perches <joe@perches.com>,
 Nathan Chancellor <natechancellor@gmail.com>, jirislaby@kernel.org,
 peda@axentia.se
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Sep 17, 2020 at 6:15 AM Jing Xiangfeng <jingxiangfeng@huawei.com> wrote:
>
> Remove the superfuous break, as there is a 'return' before it.

superfluous (missed "l")

>
> Signed-off-by: Jing Xiangfeng <jingxiangfeng@huawei.com>

Reviewed-by: Nick Desaulniers <ndesaulniers@google.com>

Thanks for the patch; I audited the rest of the switch statements in
this translation unit; LGTM.

> ---
>  drivers/video/fbdev/core/fbcon.c | 2 --
>  1 file changed, 2 deletions(-)
>
> diff --git a/drivers/video/fbdev/core/fbcon.c b/drivers/video/fbdev/core/fbcon.c
> index 0b49b0f44edf..623359aadd1e 100644
> --- a/drivers/video/fbdev/core/fbcon.c
> +++ b/drivers/video/fbdev/core/fbcon.c
> @@ -1727,7 +1727,6 @@ static bool fbcon_scroll(struct vc_data *vc, unsigned int t, unsigned int b,
>                                     vc->vc_video_erase_char,
>                                     vc->vc_size_row * count);
>                         return true;
> -                       break;
>
>                 case SCROLL_WRAP_MOVE:
>                         if (b - t - count > 3 * vc->vc_rows >> 2) {
> @@ -1818,7 +1817,6 @@ static bool fbcon_scroll(struct vc_data *vc, unsigned int t, unsigned int b,
>                                     vc->vc_video_erase_char,
>                                     vc->vc_size_row * count);
>                         return true;
> -                       break;
>
>                 case SCROLL_WRAP_MOVE:
>                         if (b - t - count > 3 * vc->vc_rows >> 2) {
> --
> 2.17.1
>


-- 
Thanks,
~Nick Desaulniers
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
