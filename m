Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 365B282B40B
	for <lists+dri-devel@lfdr.de>; Thu, 11 Jan 2024 18:27:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9951610E0E2;
	Thu, 11 Jan 2024 17:27:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-x1136.google.com (mail-yw1-x1136.google.com
 [IPv6:2607:f8b0:4864:20::1136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 66E8B10E0E2
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Jan 2024 17:27:37 +0000 (UTC)
Received: by mail-yw1-x1136.google.com with SMTP id
 00721157ae682-5ebca94cf74so55710907b3.0
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Jan 2024 09:27:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1704994056; x=1705598856; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=zwX+Q8u87YRBeqp+9doFk/KRGXo5yTvV0ztJoK1gxhA=;
 b=kWNe2nRyaXY+o5T6psRrla8WGSHUHpKS98lWh032Yu89+BPd9hveQJ7474yOMI3Hoi
 ZXsMH7w8UwNbFfb7gOKkp07+28tYmcFfVeF0WoZrCEEmm3dEq6BCfnKT8t9vr+BDGsCL
 Cit+w2zO2KwCVAx2K5g5UnBqqaRcZ4VV1xwKKSzzm5F/VT9WCPLODkh4ZzfjarGt5+zJ
 q9woPZdNk96UfCi5R89xBkstL47HODD/KftjnLdFkh4TNXVPcDtcCrYID6V/DnyTS8hy
 9/gKrsgwFIXA8CS3jFYH90Hx1S4l+fwvevpWtVniCoT0d6GYEpJfNIOoL5b3Itn9dZBP
 l9cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704994056; x=1705598856;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=zwX+Q8u87YRBeqp+9doFk/KRGXo5yTvV0ztJoK1gxhA=;
 b=X3idmZ4CdfACL0XnYt2gk6pCPpdQQky7+IL94iCatv8nKd5SVp2If0ok9ZFJf4h77J
 f7i8rDRSwGb5fQbWrjg7YOXYaSMIikDVD5byttkn7UV1BBk6P2PJcqDWv+sdTEIwDR86
 0t5leNhvIWOSucjhOnP8malJkd9JJkjebpc36+BoIEYy1uROoYzrUwubx9qd1fyKLhNZ
 myUjAHmIJxuNrmaQcu1hhB6xVAmJxiKzmKzVk+61hkIUP7ZzN/QQaa1rj5SPsO6THOK6
 jr3Mnfwnd//zccnx8UR6lnZHo5JX0P1oLJNQk8z2EEd+AfkkPWQ34P/Lc7AoZrM/iqkS
 CRBg==
X-Gm-Message-State: AOJu0YzCBPjbRF1bpHwvBNIVTN83Wiz9GYRIftSXLGna88VOYoVhZLKY
 v9/umAIsCZaUapr878tIENOewEE0WnHYBn8dJmlztlazdRLmJw==
X-Google-Smtp-Source: AGHT+IFXacy54wlB2/avVyvlqWPg2me5MG2fUSxjyMqNRuv2t5PPokTTThra3Y7tS7jvxnp1hqWagKKX50vYF3/UjZg=
X-Received: by 2002:a81:bc12:0:b0:5e7:5cd8:92b2 with SMTP id
 a18-20020a81bc12000000b005e75cd892b2mr114924ywi.69.1704994056560; Thu, 11 Jan
 2024 09:27:36 -0800 (PST)
MIME-Version: 1.0
References: <1704993255-12753-1-git-send-email-quic_khsieh@quicinc.com>
In-Reply-To: <1704993255-12753-1-git-send-email-quic_khsieh@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Thu, 11 Jan 2024 19:27:25 +0200
Message-ID: <CAA8EJprHVbPv8ULK3mRPXGOFbuCQ6sw+r68uhdfCe8=E5=YkAw@mail.gmail.com>
Subject: Re: [PATCH v1] drm/msm/dp: remove mdss_dp_test_bit_depth_to_bpc()
To: Kuogee Hsieh <quic_khsieh@quicinc.com>
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
Cc: freedreno@lists.freedesktop.org, quic_sbillaka@quicinc.com,
 linux-kernel@vger.kernel.org, quic_abhinavk@quicinc.com, andersson@kernel.org,
 dri-devel@lists.freedesktop.org, dianders@chromium.org, vkoul@kernel.org,
 agross@kernel.org, marijn.suijten@somainline.org, quic_jesszhan@quicinc.com,
 swboyd@chromium.org, sean@poorly.run, linux-arm-msm@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 11 Jan 2024 at 19:14, Kuogee Hsieh <quic_khsieh@quicinc.com> wrote:
>
> mdss_dp_test_bit_depth_to_bpc() can be replace by
> mdss_dp_test_bit_depth_to_bpp() / 3. Hence remove it.
>
> Signed-off-by: Kuogee Hsieh <quic_khsieh@quicinc.com>
> ---
>  drivers/gpu/drm/msm/dp/dp_debug.c |  2 +-
>  drivers/gpu/drm/msm/dp/dp_link.h  | 23 -----------------------
>  2 files changed, 1 insertion(+), 24 deletions(-)

Thank you!

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry
