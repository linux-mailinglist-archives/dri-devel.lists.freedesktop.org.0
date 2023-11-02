Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CB2407DECE2
	for <lists+dri-devel@lfdr.de>; Thu,  2 Nov 2023 07:32:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BF76610E13C;
	Thu,  2 Nov 2023 06:32:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb31.google.com (mail-yb1-xb31.google.com
 [IPv6:2607:f8b0:4864:20::b31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DFA3910E078
 for <dri-devel@lists.freedesktop.org>; Thu,  2 Nov 2023 06:32:44 +0000 (UTC)
Received: by mail-yb1-xb31.google.com with SMTP id
 3f1490d57ef6-da2b9234a9fso574593276.3
 for <dri-devel@lists.freedesktop.org>; Wed, 01 Nov 2023 23:32:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1698906764; x=1699511564; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=e463TBeue+MFy7uWY9tlDphfm+xYnPDbO9CJfPVFqIQ=;
 b=sGbVL1ekYnpSTX9jUxBgHO5XLflQ5MzGGVC+qj0YIO1Ir0tznqoeGQ/BNUAj0qLkYq
 daT+9ZYBXSt+BiGCYmziJt1Gd2M95AJbwOdgfxu59AbIdrpDJ1VQnOrdkBtwLPZtJ7iA
 8wHV3PWsEGOlAbcoQuO/fYSI8ty1ao9aZNjwa+LZ8irZ62qZECx46CL2XWSl/Kg9daPF
 tIHSBY8C/ptLXb9Q762jxO8uY0CKAqUSUVNDasVnd7Vhx+NfcjogUo7/QtUj85XELD4m
 xNd5lzHs0kZqhL8BHS92NNiUFruxMUnwPVfwnk4nk0RbqsDruyTK03bUtWdUXkK2YopD
 XADg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698906764; x=1699511564;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=e463TBeue+MFy7uWY9tlDphfm+xYnPDbO9CJfPVFqIQ=;
 b=XIUBDvIW9bGGJv9DMyOIX7flzZ+7MUaY1S3E9BJRR14hXQ7Q+SdWbQ7fUWM5do7oj4
 KUZKxUITRCE4wDNS1pxfnvs0Y29dLWRwrKNUkcqnVRAGrJQc2dldQRx1Iru5jn/gENxF
 1JtOUCZffxzEwOlX2DlRnJ+WHSJvp5i0Q7sN7OibHvd2By/nIq1QXtBRqHZeJiRCCIe1
 ffgQCOU62GYJuDURS/oeqfh7eNaFrS380gRHZZ9DdvgBLw0xEb3Bqw77P+22/2AhpTIc
 YLuOUc/nW8Z14jenFJq0cBnBCi0SxXHfgnOeJgVscpa4HfEqx94DS6WqL/Oudk11zR7g
 wB5A==
X-Gm-Message-State: AOJu0Ywh4ggkJlGV9ISW7P1KOCaF/vfbA+W0J/86+4Mvkc41t1QPTbV3
 nQS4dzWSnSDOVVJvYKk7TRHvhZd0dr45Ro/GApz5iQ==
X-Google-Smtp-Source: AGHT+IEKbxMkN9v/F+SLKkpicMwLxreimmwuAvu7DOVgsoD2WJnvmaGxs9R33WZY2hRSvlC1PaE7wCNfetxGDTKGF3w=
X-Received: by 2002:a25:7648:0:b0:da0:7826:8b98 with SMTP id
 r69-20020a257648000000b00da078268b98mr17766201ybc.55.1698906763884; Wed, 01
 Nov 2023 23:32:43 -0700 (PDT)
MIME-Version: 1.0
References: <20231102022946.115603-1-penghao@dingdao.com>
In-Reply-To: <20231102022946.115603-1-penghao@dingdao.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Thu, 2 Nov 2023 08:32:32 +0200
Message-ID: <CAA8EJprEX72imAwt-975povxgMw-pH7SkrBJKg5pV-PEKMvb1Q@mail.gmail.com>
Subject: Re: [PATCH] gpu/drm/drm_framebuffer.c: Use Macro instead of actual
 number.
To: Peng Hao <penghao@dingdao.com>
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
Cc: tzimmermann@suse.de, linux-kernel@vger.kernel.org, mripard@kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 2 Nov 2023 at 04:35, Peng Hao <penghao@dingdao.com> wrote:
>
> Use Macro DRM_FORMAT_MAX_PLANES instead of 4, to improve modifiability.
>
> Signed-off-by: Peng Hao <penghao@dingdao.com>
> ---
>  drivers/gpu/drm/drm_framebuffer.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


-- 
With best wishes
Dmitry
