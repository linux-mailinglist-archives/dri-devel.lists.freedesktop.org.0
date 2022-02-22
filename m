Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BFFF74BF99E
	for <lists+dri-devel@lfdr.de>; Tue, 22 Feb 2022 14:42:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0836410E6BA;
	Tue, 22 Feb 2022 13:42:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com
 [IPv6:2a00:1450:4864:20::132])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9019F10E73C
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Feb 2022 13:41:59 +0000 (UTC)
Received: by mail-lf1-x132.google.com with SMTP id u20so24862078lff.2
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Feb 2022 05:41:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=dYjRWsW9pcEcQ2t56kY0xhwAZ/vjldT5YxHAgh3ZMy8=;
 b=pd2VrkzjJ4DBKAhv8/hr9VAZh4WjtLOx7ruO96wujvdkx/wDgPKZa5mu60uS6OIePa
 Sa9iKw2/HEoCvRBUHHhYkkzuacsAL6Z6rJoNPxvLQuzftqPq74Q85SThu6HaspZs1IuE
 MpP4w255u+2HMw6vlJJjXSkvrtoL7TJL5rptqS72lZ5ap0OofJHvmEZd4UANtlq8tUTv
 5mRJFuS97fwv7YoArKXUtkOC02JRz8GSO5+N4d5b8f5hRdJgMiNCTTeoQeXYC1ZiqPUn
 4u+g5xMJwyogUDEcRQy2wZ3AU3S+ZcmdrYMdvBT6jeQx05vhucub6pJwijTBQKGpd7nG
 fLjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=dYjRWsW9pcEcQ2t56kY0xhwAZ/vjldT5YxHAgh3ZMy8=;
 b=ZRvkwJFi/KOxr92OVyulOU4HJEapCYfnR1d+FD/4/1wIWdDS8RHuQD2D5bL08St9tn
 1IL0xA9qp2/8AlDZ/lzUCBCr7S1RhUqrsVFU/ZzvUmknahUewfh5c3eMeoJxFCydyWWa
 ERW/1sndSWoHZMckpHekBWksiW7PJijZbFldNLkfNol/Fk/4EMmm4IkDaLdI2wyGDEW1
 TfTd8z1y2eiLnuxdw+RXcSGAlak8OscBbEJFNrQs4zSYmnf0/5XsWA0Zn0xIhVaQ3NHd
 yyINa6/wDp9Zqz4Wk7xmS3ZDPSUWWiEFl1rzqljgvb/mYIpXTcbq9vxJM5OM6DpmXfoE
 NtQg==
X-Gm-Message-State: AOAM530iyL0eyfbZlE0lCopfCmZDVibYjCp3jMcStYcTQTvTyGVunTkd
 yKLiI8rpwmsdnaiFeCjBROURzEW6Va+N1b+AjIpf8Q==
X-Google-Smtp-Source: ABdhPJxt9zV8dVY/0aDDpkL90WGgkd5FN2NEf8alpUvu7/9ecS098UHve0gpczfD3R14rIkO5fSzXtB8tRbj+L3iREs=
X-Received: by 2002:a19:ee17:0:b0:443:5f2c:289e with SMTP id
 g23-20020a19ee17000000b004435f2c289emr17236703lfb.57.1645537317803; Tue, 22
 Feb 2022 05:41:57 -0800 (PST)
MIME-Version: 1.0
References: <tencent_22C6C2E595DEFED1417A98A5736539482809@qq.com>
In-Reply-To: <tencent_22C6C2E595DEFED1417A98A5736539482809@qq.com>
From: Sumit Semwal <sumit.semwal@linaro.org>
Date: Tue, 22 Feb 2022 19:11:46 +0530
Message-ID: <CAO_48GGSPnQzo2D3zK-TuWHSdHn6XGV0=9MuF2d06XSAn1isVQ@mail.gmail.com>
Subject: Re: [PATCH] dma-buf: check the return value of kstrdup()
To: xkernel.wang@foxmail.com
Content-Type: text/plain; charset="UTF-8"
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
Cc: linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org,
 christian.koenig@amd.com, dri-devel@lists.freedesktop.org,
 linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Xiaoke,

On Tue, 22 Feb 2022 at 17:00, <xkernel.wang@foxmail.com> wrote:
>
> From: Xiaoke Wang <xkernel.wang@foxmail.com>
>
> kstrdup() is a memory allocation function which can return NULL when
> some internaly memory errors happen. It is better to check the return
> value of it to prevent further wrong memory access.
Thanks for the patch; looks sane.
>
> Signed-off-by: Xiaoke Wang <xkernel.wang@foxmail.com>
Acked-by: Sumit Semwal <sumit.semwal@linaro.org>

Will queue it up.
> ---
>  drivers/dma-buf/selftest.c | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/drivers/dma-buf/selftest.c b/drivers/dma-buf/selftest.c
> index c60b694..2c29e2a 100644
> --- a/drivers/dma-buf/selftest.c
> +++ b/drivers/dma-buf/selftest.c
> @@ -50,6 +50,9 @@ static bool apply_subtest_filter(const char *caller, const char *name)
>         bool result = true;
>
>         filter = kstrdup(__st_filter, GFP_KERNEL);
> +       if (!filter)
> +               return false;
> +
>         for (sep = filter; (tok = strsep(&sep, ","));) {
>                 bool allow = true;
>                 char *sl;
> --


Best,
Sumit.
