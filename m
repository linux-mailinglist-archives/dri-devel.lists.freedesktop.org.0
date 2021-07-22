Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CB6083D2CCB
	for <lists+dri-devel@lfdr.de>; Thu, 22 Jul 2021 21:33:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7D9026EDEA;
	Thu, 22 Jul 2021 19:33:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x231.google.com (mail-oi1-x231.google.com
 [IPv6:2607:f8b0:4864:20::231])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 317C96EDEA
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Jul 2021 19:33:40 +0000 (UTC)
Received: by mail-oi1-x231.google.com with SMTP id s23so7751806oiw.12
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Jul 2021 12:33:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:in-reply-to:references:from:user-agent:date:message-id
 :subject:to:cc;
 bh=6sZ7huFu4QsNFxnrBDafBDlbHlNytaLnm0nq8FswDwU=;
 b=WymYdktUlRBmMKQLtjkvozdpaU5i/01Ctu/IIM4hIiKk7uvJhsJPUu24DoxwIWa0So
 0gqburhQ2PKtCgdQEfnB239f1zQZIHbA0RY6AUJNrI4cXXHMnTB1rINT9SSQ7pb3XMWP
 dUMxTtzSoIoVYaLSrWkEi7gBmIhEBfuQ5v4bE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from
 :user-agent:date:message-id:subject:to:cc;
 bh=6sZ7huFu4QsNFxnrBDafBDlbHlNytaLnm0nq8FswDwU=;
 b=oeazaIKKlmJ/5UNOUdwkoz2jH3k5t8yBwExNgZ4YQPTI5WX6/TbCqLSgpxUiq9pWkV
 u/RajDnNhB5AZ9sWUtMOqJpgBfZ0xvv0m+l3ikFNPKvo7UU27qUUJXPqcWfzOMECgfPH
 RdRFnhKp9GdiiorkQQz9b9zPxlKLaopYbI3UfO7jOzCshkli3qwBz0Q8JxSKM38OHSs6
 7sAQq3vBqb4761z1IZlSk6I2Y3nvFAC7Mx8NlufMtX+zNrwxlwRaPDn3ihrha08u2NMW
 b0XgEQkNDXTPWqEN0qq1IkJfJYhfiIb5mznX1gM6qQPHbqu6C8iF+WaB7Lq4xpTqO3is
 SHQA==
X-Gm-Message-State: AOAM533X1C/wynb15WYzZzEX+2ltJJHpYTQ+lIy5HNDlUqGFNBsyY9i4
 Amj/rGLNEBaqmToCb2zFZ+3zUK+Zm0RBns1v5bj8ag==
X-Google-Smtp-Source: ABdhPJwqiAw4oHcAYrmnpJwwnDQOY2aWE8FH1iTkin5KHAN8tJqKjH1PqHmOGxwIdHQS6uWixabWA+4VT4Apg9rNolM=
X-Received: by 2002:a05:6808:114a:: with SMTP id
 u10mr1094329oiu.19.1626982419605; 
 Thu, 22 Jul 2021 12:33:39 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 22 Jul 2021 19:33:39 +0000
MIME-Version: 1.0
In-Reply-To: <20210722024227.3313096-2-bjorn.andersson@linaro.org>
References: <20210722024227.3313096-1-bjorn.andersson@linaro.org>
 <20210722024227.3313096-2-bjorn.andersson@linaro.org>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.9.1
Date: Thu, 22 Jul 2021 19:33:39 +0000
Message-ID: <CAE-0n52g4rxdcLbLBSOqoFywUJUYw6MRtBLv_41MtZSo8AGHnw@mail.gmail.com>
Subject: Re: [PATCH 1/5] dt-bindings: msm/dp: Change reg definition
To: Abhinav Kumar <abhinavk@codeaurora.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, 
 Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@linux.ie>,
 Rob Clark <robdclark@gmail.com>, 
 Rob Herring <robh+dt@kernel.org>, Sean Paul <sean@poorly.run>
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
Cc: devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Kuogee Hsieh <khsieh@codeaurora.org>, Tanmay Shah <tanmay@codeaurora.org>,
 freedreno@lists.freedesktop.org, Chandan Uddaraju <chandanu@codeaurora.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Quoting Bjorn Andersson (2021-07-21 19:42:23)
> reg was defined as one region covering the entire DP block, but the
> memory map is actually split in 4 regions and obviously the size of
> these regions differs between platforms.
>
> Switch the reg to require that all four regions are specified instead.
> It is expected that the implementation will handle existing DTBs, even
> though the schema defines the new layout.
>
> Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
