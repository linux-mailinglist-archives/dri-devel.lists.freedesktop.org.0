Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 400E15EFEFD
	for <lists+dri-devel@lfdr.de>; Thu, 29 Sep 2022 23:07:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7E2E310E031;
	Thu, 29 Sep 2022 21:07:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com
 [IPv6:2a00:1450:4864:20::62d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 050EE10E031
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Sep 2022 21:07:02 +0000 (UTC)
Received: by mail-ej1-x62d.google.com with SMTP id bj12so5236376ejb.13
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Sep 2022 14:07:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date;
 bh=Dn/r0R16rGyk66LvBxKFUrVN700Z69hs/pFlPXsErDc=;
 b=Qx5B9gGFMRtcXjWBBT/o0bhP3KrTcDBDlPRSvoh8AhpR04aylo6j6WL+pNxrJbOo+8
 FgmMka0eAPwRe4l39X9xjQUXffhIwOTInJYXkpXFdGqaW75YsviQwiOgaBlTIioiXUg0
 gQMWVp6NBUwx4P9PojQanDNUZaoSi3yFDnb/A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date;
 bh=Dn/r0R16rGyk66LvBxKFUrVN700Z69hs/pFlPXsErDc=;
 b=lYmlOYt/DdyFySBNbwiNeZKVPdRE4tLeebIMjroavGd2Zpb/mm7rcYkmEhRln9CHgq
 e9RI0ZuxUWdbsuaOKAWSZ8CQ93ZptnVuiVtqUps5jOynaB5McHBOpBQaZyfZHbjzcIN+
 ZClDfFoOYUhNbTf6/2aaN/s5dN3J4P28AxVW/M2J3cZLyuyMgfkZ4M4FUJ3vJRUrwEBF
 l3aTg5HhDThUQD3A4I5If72zUVfsOPAk45RN7wn47Kgsi2PqGycw7fM3/ZK0xO6gr+61
 EGlF6ZZ19bnM9H4nev59nLvCmnnnUiXjVM48OeLyjbZPhWqYFax7rVa+TE+P2/VbV3y/
 CWTQ==
X-Gm-Message-State: ACrzQf2VlCEgEym6cSznuFi9XVg/gEg56yafbtFJB4gU9ddmxdCiMYiZ
 qXRxZ/BjnHAXLhBpjpqcxK06wuLLUrYlh+J0
X-Google-Smtp-Source: AMsMyM5eOU1Dn+NDuAH0ZvdVWRE+rhRSReBfrN2Mt94hu514gqc9bKo73KOVFPgz17I9gtqI90RJ0Q==
X-Received: by 2002:a17:906:9754:b0:783:2bdf:182f with SMTP id
 o20-20020a170906975400b007832bdf182fmr4205533ejy.640.1664485621196; 
 Thu, 29 Sep 2022 14:07:01 -0700 (PDT)
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com.
 [209.85.221.41]) by smtp.gmail.com with ESMTPSA id
 i13-20020a1709063c4d00b00777557d1ea2sm132174ejg.47.2022.09.29.14.07.00
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 29 Sep 2022 14:07:00 -0700 (PDT)
Received: by mail-wr1-f41.google.com with SMTP id bq9so3988473wrb.4
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Sep 2022 14:07:00 -0700 (PDT)
X-Received: by 2002:a5d:6488:0:b0:22b:3b0b:5e72 with SMTP id
 o8-20020a5d6488000000b0022b3b0b5e72mr3813355wri.138.1664485619771; Thu, 29
 Sep 2022 14:06:59 -0700 (PDT)
MIME-Version: 1.0
References: <20220929015503.17301-1-yuancan@huawei.com>
 <20220929015503.17301-2-yuancan@huawei.com>
In-Reply-To: <20220929015503.17301-2-yuancan@huawei.com>
From: Doug Anderson <dianders@chromium.org>
Date: Thu, 29 Sep 2022 14:06:48 -0700
X-Gmail-Original-Message-ID: <CAD=FV=VKyZJE_5aiK1T8+8+qaVq4LWtCjqYnyjf85WE2=PuNcw@mail.gmail.com>
Message-ID: <CAD=FV=VKyZJE_5aiK1T8+8+qaVq4LWtCjqYnyjf85WE2=PuNcw@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] drm/panel: panel-edp: Use dev_err_probe() to
 simplify code
To: Yuan Can <yuancan@huawei.com>
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
Cc: Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 dri-devel <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Wed, Sep 28, 2022 at 6:56 PM Yuan Can <yuancan@huawei.com> wrote:
>
> In the probe path, dev_err() can be replaced with dev_err_probe()
> which will check if error code is -EPROBE_DEFER and prints the
> error name. It also sets the defer probe reason which can be
> checked later through debugfs.
>
> Signed-off-by: Yuan Can <yuancan@huawei.com>
> Reviewed-by: Douglas Anderson <dianders@chromium.org>
> ---
>  drivers/gpu/drm/panel/panel-edp.c | 22 ++++++----------------
>  1 file changed, 6 insertions(+), 16 deletions(-)

Pushed to drm-misc-next:

b28d204a7c19 drm/panel: panel-edp: Use dev_err_probe() to simplify code
