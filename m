Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D2BB85388AD
	for <lists+dri-devel@lfdr.de>; Mon, 30 May 2022 23:49:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D9AA410E1F2;
	Mon, 30 May 2022 21:49:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x72e.google.com (mail-qk1-x72e.google.com
 [IPv6:2607:f8b0:4864:20::72e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7F10E10E1F2
 for <dri-devel@lists.freedesktop.org>; Mon, 30 May 2022 21:49:54 +0000 (UTC)
Received: by mail-qk1-x72e.google.com with SMTP id 190so11968204qkj.8
 for <dri-devel@lists.freedesktop.org>; Mon, 30 May 2022 14:49:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=oyIZLMpN8yM0C+zjTwxWjwcZ2QrcKF6IgeGKdgmBFJY=;
 b=gHcxRtGDoYeO+1kAyP6pFVBMMe0X3RvUE1GAgq20de6KB30VN8KNhd8+GPYpjxwIY5
 KALbPX55/RvHg8AeuuBUC4el4dBrfSm5QYa8H2uW/dP1D7PigbqIlrl084fYKQlgJ10E
 rjdcV65g8ZK0vPIc/mvl+B3HbQbtfCD3+f8RqOH5FB0hd2DyFYG6EPD3ZckOXOjtf6ql
 pUU6rLqd+YbMNhBb6sy1J6kxHWO1pUtOc14aHifvdD+NFbpEZh2DjDpvVP8GBhEoaBya
 6uhd0jw2PLnFaW5RpzLveGX/SVZd+SWgUM/MWyw4FuAuAxlXPXxk3x9gXFrlIWW27Z5x
 HguA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=oyIZLMpN8yM0C+zjTwxWjwcZ2QrcKF6IgeGKdgmBFJY=;
 b=30A9pfUw6yL9JtIbsPte9cIEmHu8u+lZup4NF7h5493cQXs0y88BR3BrTxEHVPbqgA
 viSHWICArRUffknUEqVVYcqWk6YmNiQF9Q7+MH9lfz4khYraYpnrV3TSD2sneRaVq5EF
 +rVuy9ZvYFLk9zWU/ch42VoxwC6A/68B3hUgvHzGIUBLZr5FSqp+1eaBQ+V0vipqLjhF
 U0bpBBTxPp4Nemxdz4FSAKkLNZ0CbhlznYbE3lpgFexD8J9e1Q/LTyW+VzEKnryErZRe
 n7MNDXKD0Exd3f638GuXtd/ifDU9qG/2GXOT+tAaQL1FJRTHqqudRUWUsT2WTjVemOuQ
 0+lQ==
X-Gm-Message-State: AOAM531knJ7TIqUZ5LQ18iTDZ2gMJAAo9dZoxTgdQjCHYRyELa4/pAGz
 ITb6hphSIBrgEapn4ZU725qK7xPp2IoPqSoH9gRt4A==
X-Google-Smtp-Source: ABdhPJwsqssNs4WAxkzWklQmjHdnCgJ3D8qJrLr2CI/UtjeDrebRWydyU53sBgITCNcpLLIKJKP3und/snBq/5zczLM=
X-Received: by 2002:a37:6883:0:b0:6a3:42ae:e17b with SMTP id
 d125-20020a376883000000b006a342aee17bmr36933263qkc.59.1653947393598; Mon, 30
 May 2022 14:49:53 -0700 (PDT)
MIME-Version: 1.0
References: <1653877196-23114-1-git-send-email-baihaowen@meizu.com>
In-Reply-To: <1653877196-23114-1-git-send-email-baihaowen@meizu.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Tue, 31 May 2022 00:49:42 +0300
Message-ID: <CAA8EJpqfvMPZza=J-TKxNtP2L1GPsy+va_dJ9EWuCAYtZWQrjA@mail.gmail.com>
Subject: Re: [PATCH] drm/msm/dpu: Fix pointer dereferenced before checking
To: Haowen Bai <baihaowen@meizu.com>
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
Cc: freedreno@lists.freedesktop.org, David Airlie <airlied@linux.ie>,
 linux-arm-msm@vger.kernel.org, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Sean Paul <sean@poorly.run>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, 30 May 2022 at 05:20, Haowen Bai <baihaowen@meizu.com> wrote:
>
> The phys_enc->wb_idx is dereferencing before null checking, so move
> it after checking.
>
> Signed-off-by: Haowen Bai <baihaowen@meizu.com>
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry
