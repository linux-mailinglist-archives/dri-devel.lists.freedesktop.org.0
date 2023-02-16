Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 59B146997AD
	for <lists+dri-devel@lfdr.de>; Thu, 16 Feb 2023 15:42:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 78CD510EDB0;
	Thu, 16 Feb 2023 14:42:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A63EA10EDB0
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Feb 2023 14:42:19 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 2D83E61573
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Feb 2023 14:42:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9123AC4339C
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Feb 2023 14:42:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1676558538;
 bh=1oxCpm4govChwxnrWbBKkeSBKiNpqIg7oKaukmWGuLI=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=qlS183GqNvRSEdrnVvi4dyrVgvNMA7hU4qtQGrxZ5z1lGzoiuixP+tV06pmqZCBsz
 9xTyF8bNNzyfgWlflpnfpc0JPPEpMLdmoFSe0G935zyP4PoZEwvzvbLvNbNfHehdYT
 nTWQXDSaxXz15g52jNMgdPaWgdj5IgE7DWyUUH5CbWYuwlEequhuLMDGgEYot/rjmW
 YKIg6xHmRvStYUsU2JZ7kXHagC7GEKu85G6PXvKeKs9AgxG0yv5Ik8UrExjUuWEHN8
 rCNYgrQ95EYE/yo1Hj6T8Vf/bVd5QDTRITh6L+egUSHiHkdbcaQugnT0fhnj1Fah9w
 N6f4pwrwvjnwg==
Received: by mail-yw1-f174.google.com with SMTP id
 00721157ae682-52ecd867d89so27277247b3.8
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Feb 2023 06:42:18 -0800 (PST)
X-Gm-Message-State: AO0yUKXLwLn1E/vVizdFT67vRY2FNNwY34JjcW+0CLnYLb1D2N0fSXqL
 IhmXuSPeqGIeHu3SAOU182g9MJNwMeuQK1yYCEw=
X-Google-Smtp-Source: AK7set/h/QZbnvz10Jpej51w7hGkoQ7yp8WdchZC9bWh8SiCJyYUlbUCOaNWvzjx0rLxqBrWpQIX3QvfASmE4/aBW28=
X-Received: by 2002:a0d:ea05:0:b0:52e:fbcd:e1b4 with SMTP id
 t5-20020a0dea05000000b0052efbcde1b4mr790508ywe.0.1676558537664; Thu, 16 Feb
 2023 06:42:17 -0800 (PST)
MIME-Version: 1.0
References: <20230213085658.96918-1-colin.i.king@gmail.com>
In-Reply-To: <20230213085658.96918-1-colin.i.king@gmail.com>
From: Oded Gabbay <ogabbay@kernel.org>
Date: Thu, 16 Feb 2023 16:41:51 +0200
X-Gmail-Original-Message-ID: <CAFCwf11_+NH1A-1eWUriWFuuh38TiOQCMHLvqFVq_4Uwn1+HUQ@mail.gmail.com>
Message-ID: <CAFCwf11_+NH1A-1eWUriWFuuh38TiOQCMHLvqFVq_4Uwn1+HUQ@mail.gmail.com>
Subject: Re: [PATCH][next] habanalabs: Fix spelling mistake "offest" ->
 "offset"
To: Colin Ian King <colin.i.king@gmail.com>
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
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Feb 13, 2023 at 10:57 AM Colin Ian King <colin.i.king@gmail.com> wrote:
>
> There is a spelling mistake in a dev_err message. Fix it.
>
> Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
> ---
>  drivers/accel/habanalabs/common/command_submission.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/accel/habanalabs/common/command_submission.c b/drivers/accel/habanalabs/common/command_submission.c
> index 6c4d9b1aa5de..74ccafeb38dc 100644
> --- a/drivers/accel/habanalabs/common/command_submission.c
> +++ b/drivers/accel/habanalabs/common/command_submission.c
> @@ -3199,7 +3199,7 @@ static int ts_buff_get_kernel_ts_record(struct hl_mmap_mem_buf *buf,
>                         usleep_range(100, 1000);
>                         if (++iter_counter == MAX_TS_ITER_NUM) {
>                                 dev_err(buf->mmg->dev,
> -                                       "Timestamp offest processing reached timeout of %lld ms\n",
> +                                       "Timestamp offset processing reached timeout of %lld ms\n",
>                                         ktime_ms_delta(ktime_get(), timestamp));
>                                 return -EAGAIN;
>                         }
> --
> 2.30.2
>
Thanks,
but I've already fixed it in my tree in the original patch before
seeing this email, sorry.
Oded
