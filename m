Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 182226C8613
	for <lists+dri-devel@lfdr.de>; Fri, 24 Mar 2023 20:41:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3895810EC6D;
	Fri, 24 Mar 2023 19:41:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb32.google.com (mail-yb1-xb32.google.com
 [IPv6:2607:f8b0:4864:20::b32])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 84FED10EC66
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Mar 2023 19:41:11 +0000 (UTC)
Received: by mail-yb1-xb32.google.com with SMTP id k17so3562055ybm.11
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Mar 2023 12:41:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1679686870;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=IUCD+IxRLqwZzbEH30wWX1QCJBeJYUOVFgyf9bSu9hM=;
 b=kG7mEr+AyiSspI904z+BgOxO0ChJNkROnsq0QV+jI5dKx/vtfbi9ldMLD967dOzPIn
 fr1AjHm0vYdhY8RNYqgs8jBPt7vtGZcuXWLo81Wer4eszGIUI/zgis0PV9gU2l2U4WZ7
 L0aLLZ/yGqpciuFzH1Vb22wpt5ZY89HZEsgqg0srlSfWtMWMYQ7FCl6qplFzV8Y+WS4H
 L7XZCX6vYV/9PDvnZj8w2AwI9NDJxDcs9OY3CQg3zGYnCZmvlzTSFRb28s7BUaTyL6Vk
 nLbewqemd7B68TTFOTzerrXm99ib/mgoNYbg6KUOQsxfRZLG3XR2sxTzn/NIxwEjxL7E
 MAnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679686870;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=IUCD+IxRLqwZzbEH30wWX1QCJBeJYUOVFgyf9bSu9hM=;
 b=EFJSexuTuA5UnpmB6xee5j1U45avCQ5j+zoQGaUErjBrPjsxpEt7zjguyjQk6LGkrF
 9znxKPrBafrnFsvHp9EqO+h8kNMZkS1Mu+uns/FptWTZFS+oTuYhm5n5VNQ/TGLDGbYd
 lcdLsUYGjvSoLpBp5MCMacCz1JjUqnOs3iUkUv/ICiDDUO8hbBMwlqTAHchLXm0sVlPc
 f/NXTSfzYKW+wbbrAEXUwDV49bEFj4TnmQr12wuqtgInMuiP9py5wYk5//bN1VNzxNza
 U3YLnrGyLNbkqvqB35HwMzrV2EpporZQUAaAnYmum1Sx7F/idPh7JZHorN2Jq2heIYtI
 JTXw==
X-Gm-Message-State: AAQBX9dkJC3X4we/N5/imYTyjF1wTGCmfsfSrqDlPvMT/o7zCLxX+38a
 iUVBp202YDeh9nDxW2KLXHgGnwGJ4hed0vYHhalQfQ==
X-Google-Smtp-Source: AKy350ab+2+iDDqjp/8MtBPau3csSAqLpql7w1Couc3tePNqHMKcEaSxPYFWamsrYuol36PWs6TWCUU1P72W7/eLEug=
X-Received: by 2002:a05:6902:a93:b0:b78:5f10:672d with SMTP id
 cd19-20020a0569020a9300b00b785f10672dmr674911ybb.9.1679686870645; Fri, 24 Mar
 2023 12:41:10 -0700 (PDT)
MIME-Version: 1.0
References: <20230324192058.3916571-1-markyacoub@google.com>
 <20230324192058.3916571-2-markyacoub@google.com>
In-Reply-To: <20230324192058.3916571-2-markyacoub@google.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 24 Mar 2023 21:40:59 +0200
Message-ID: <CAA8EJpo1Ki+Axav2FXc68AxXbM6Vof=FGLejW_EYUMZs=qdwQw@mail.gmail.com>
Subject: Re: [PATCH v7 01/10] drm/hdcp: Add drm_hdcp_atomic_check()
To: Mark Yacoub <markyacoub@chromium.org>
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
Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>, suraj.kandpal@intel.com,
 Jani Nikula <jani.nikula@intel.com>, intel-gfx@lists.freedesktop.org,
 dianders@chromium.org, linux-kernel@vger.kernel.org, seanpaul@chromium.org,
 dri-devel@lists.freedesktop.org, Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, 24 Mar 2023 at 21:21, Mark Yacoub <markyacoub@chromium.org> wrote:
>
> From: Sean Paul <seanpaul@chromium.org>
>
> Move the hdcp atomic check from i915 to drm_hdcp so other
> drivers can use it. No functional changes, just cleaned up some of the
> code when moving it over.
>
> Acked-by: Jani Nikula <jani.nikula@intel.com>
> Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> Signed-off-by: Sean Paul <seanpaul@chromium.org>
> Signed-off-by: Mark Yacoub <markyacoub@chromium.org>

Please:

1) Cc the cover letter to all parties, so that we know what is going on
2) Please also Cc the whole series including the cover letter to
freedreno@ so that it hits patchwork as a whole.

-- 
With best wishes
Dmitry
