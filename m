Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A851D34D822
	for <lists+dri-devel@lfdr.de>; Mon, 29 Mar 2021 21:28:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5DC5C6E512;
	Mon, 29 Mar 2021 19:28:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x631.google.com (mail-pl1-x631.google.com
 [IPv6:2607:f8b0:4864:20::631])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E11576E505
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Mar 2021 19:28:37 +0000 (UTC)
Received: by mail-pl1-x631.google.com with SMTP id h20so4897794plr.4
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Mar 2021 12:28:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:content-transfer-encoding:in-reply-to:references
 :subject:from:cc:to:date:message-id:user-agent;
 bh=+4cOVQ7+6L15zdo+E6zQB02I2bt0ll5FGJ5itLhgQnU=;
 b=ltyydm9yPLka+76TM3QCQVBtQlyeAGA4FTX4smC0ATrzMpkebPV1Qnh9VrUC5JwPQH
 yOqQT/iSfJLSXqmuvTk5tTefgGyR6LIEz/s7ddXqv6F5iiYaW5E1M9jXx3OQ50XbFN3c
 a5/bmx4GhNs4E0uKSUZTtTFKMaKVYirEqriFU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:content-transfer-encoding
 :in-reply-to:references:subject:from:cc:to:date:message-id
 :user-agent;
 bh=+4cOVQ7+6L15zdo+E6zQB02I2bt0ll5FGJ5itLhgQnU=;
 b=CAmDzpKO528Q3G3+ZyF+kjoFVusdWTc+qf0Vkh5HM551vLC+x4giO2GTPnZgYySX0f
 /e5N4gSOpXziXbkGXczzR4NTabqVHHkZVozskst1l1gw8f5mIlSdoUWWcNUCKV/7HQM3
 zejsXUdmiHZZmoxoDb3QS6GU/SGFK0RZtB6DJc/wnKKNZp5FgUEUUXGHKRlannKnLzZG
 3Cv8UEz3BGfJDO1YKM6YxQH2C7dDim1ru9LM2ZR8FVUSWaob8r12Ll8ZbR3Hl1UNjMiN
 LX0+7Kj1Zpxpsem/UgFMpVETKD5jpDABKbsGzLD0370SWvsZ6UX3BsUh6A02UD05/w/u
 pXZw==
X-Gm-Message-State: AOAM533j53ALTgOpfSNDLs+7QUFHiF2guqv0eTcwd70ppr20BCUfexEe
 Nr/pBj/uDP8b2z2oqaFmpooWKQ==
X-Google-Smtp-Source: ABdhPJx/4WH6fT1bN3OEwPuIpi0aEf2C6F7i8hpe8iRyxUdnZJchCoJBOeBSK6mRVIgduqkaUwXMLA==
X-Received: by 2002:a17:902:7407:b029:e4:9b2c:528b with SMTP id
 g7-20020a1709027407b02900e49b2c528bmr30412589pll.6.1617046117481; 
 Mon, 29 Mar 2021 12:28:37 -0700 (PDT)
Received: from chromium.org ([2620:15c:202:201:4091:2b37:966b:1fca])
 by smtp.gmail.com with ESMTPSA id y7sm295588pja.25.2021.03.29.12.28.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 29 Mar 2021 12:28:37 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20210329120051.3401567-3-dmitry.baryshkov@linaro.org>
References: <20210329120051.3401567-1-dmitry.baryshkov@linaro.org>
 <20210329120051.3401567-3-dmitry.baryshkov@linaro.org>
Subject: Re: [PATCH v4 2/4] dt-bindings: msm/disp: add compatibles for
 sm8150/sm8250 display
From: Stephen Boyd <swboyd@chromium.org>
To: Andy Gross <agross@kernel.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Rob Clark <robdclark@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 Sean Paul <sean@poorly.run>
Date: Mon, 29 Mar 2021 12:28:35 -0700
Message-ID: <161704611572.3012082.10802339085569147003@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
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
Cc: devicetree@vger.kernel.org, Jonathan Marek <jonathan@marek.ca>,
 David Airlie <airlied@linux.ie>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Quoting Dmitry Baryshkov (2021-03-29 05:00:49)
> From: Jonathan Marek <jonathan@marek.ca>
> 
> The driver already has support for sm8150/sm8250, but the compatibles were
> never added.
> 
> Signed-off-by: Jonathan Marek <jonathan@marek.ca>
> Acked-by: Rob Herring <robh@kernel.org>
> [DB: split dt-bindings into separate patch]
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>

This will conflict with the yaml changes to this file that are also in
flight.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
