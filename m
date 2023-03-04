Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A93A6AAD80
	for <lists+dri-devel@lfdr.de>; Sun,  5 Mar 2023 00:31:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CCC5C10E2D8;
	Sat,  4 Mar 2023 23:31:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oo1-xc29.google.com (mail-oo1-xc29.google.com
 [IPv6:2607:f8b0:4864:20::c29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 566AD10E2D5;
 Sat,  4 Mar 2023 23:31:07 +0000 (UTC)
Received: by mail-oo1-xc29.google.com with SMTP id
 bd3-20020a4aee03000000b00517affa07c0so1020288oob.7; 
 Sat, 04 Mar 2023 15:31:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1677972666;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=CZUqjk/iG+8naJqH8Gd/XvA4gVrVu3fZTaTX8+wG+x4=;
 b=N7NOdG196+EHJDvkE4yk2D13wnbKce3b94cqLBDSiDol4wVDx3LyEda+DH3WzmqIcn
 vr1vavfYc/5jg1cJZmH1vC6BZiz9+bcOSlngne3XQKlFPNTIo/LM9wLVsZ4NPNp+xIyq
 aXHWE7U4pnkzJ8pdjSNviEbzBr9tcyPYALV2xMqCdk9Rl4jLLFgdb1/JQ8F7mvNOllx4
 hCdop6ruIyyqgwMKsqdoO8pUE08eBtEpQ0J2e4Ye+eQjBvxoM8IBxRF9t+d1Njv0gA5q
 ZheK9V+LbopS9CS7bI8+kbmJfc3xvApw4rNZ6jTbYkV6qnZCheiQ4OBzQx58erCCHLKt
 kUeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1677972666;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=CZUqjk/iG+8naJqH8Gd/XvA4gVrVu3fZTaTX8+wG+x4=;
 b=zEgq+HiNBrUtxGezws9eNfYtxzYKbXXJo8m6fmBWoZCG1Bsk+Ebaj5KKSKs4UO52s0
 oApDe+2aO9rH12TzVIFCkHTDqKYuJzIuCuEQRA3a++nIji/xSxiUewjEIzAEXtO6UHjI
 nmjyTRravOCZ3JWqt2qpfkRnVxhkzT3+v18tuUbSHOj17rbZkdszOkiDsNQ04xWb0LJl
 bUBKQZP/EO0tw3BjvbCoxMoewRWFcqlDy4PFCXaGDQBdpUE8OMU74TQJsoh4Z7HYHoZd
 aXXxk7ZG404OAOius4xa1nbUgt5EuYXbYFlN1pVP6mx7TnkwTksSjaSAYCdeJPEknw2P
 RKng==
X-Gm-Message-State: AO0yUKVJto4tSmqAa6m8lBTb7FT6LxeBnMXWpssPAsRM4CLKUZv9EmLZ
 Wor1paZqoLaMquA1cX/ahQxlswoXDlZw31kkAdA=
X-Google-Smtp-Source: AK7set+z2pmBm0ZkDIgXktqrZ8KiSU3jRWaT5Hx8xV3VK0By/96jj8eY4QVMVjXQBqzEaiz+wUAjcXEVIGTOUf3o3qE=
X-Received: by 2002:a4a:ae84:0:b0:525:499e:ce2f with SMTP id
 u4-20020a4aae84000000b00525499ece2fmr2185131oon.1.1677972666339; Sat, 04 Mar
 2023 15:31:06 -0800 (PST)
MIME-Version: 1.0
References: <1677972416-7353-1-git-send-email-quic_abhinavk@quicinc.com>
In-Reply-To: <1677972416-7353-1-git-send-email-quic_abhinavk@quicinc.com>
From: Rob Clark <robdclark@gmail.com>
Date: Sat, 4 Mar 2023 15:30:55 -0800
Message-ID: <CAF6AEGv-K0X+Pp=OrST42=7UnNEbF-az=KRZjqDFnsZKPEtpfg@mail.gmail.com>
Subject: Re: [PATCH] MAINTAINERS: Update the URI for MSM DRM bugs
To: Abhinav Kumar <quic_abhinavk@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
Cc: dmitry.baryshkov@linaro.org, freedreno@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sat, Mar 4, 2023 at 3:27=E2=80=AFPM Abhinav Kumar <quic_abhinavk@quicinc=
.com> wrote:
>
> Update the URI for MSM DRM bugs for users to be able
> to file bugs at a centralized location.
>
> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>

Acked-by: Rob Clark <robdclark@gmail.com>

> ---
>  MAINTAINERS | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index a47d963af3b8..504138e294ef 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -6641,6 +6641,7 @@ L:        linux-arm-msm@vger.kernel.org
>  L:     dri-devel@lists.freedesktop.org
>  L:     freedreno@lists.freedesktop.org
>  S:     Maintained
> +B:     https://gitlab.freedesktop.org/drm/msm/-/issues
>  T:     git https://gitlab.freedesktop.org/drm/msm.git
>  F:     Documentation/devicetree/bindings/display/msm/
>  F:     drivers/gpu/drm/msm/
> --
> 2.7.4
>
