Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B36A05A0175
	for <lists+dri-devel@lfdr.de>; Wed, 24 Aug 2022 20:39:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 80599A8E78;
	Wed, 24 Aug 2022 18:39:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x243.google.com (mail-oi1-x243.google.com
 [IPv6:2607:f8b0:4864:20::243])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1586AA07DB
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Aug 2022 20:34:29 +0000 (UTC)
Received: by mail-oi1-x243.google.com with SMTP id c185so16564692oia.7
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Aug 2022 13:34:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc;
 bh=Nyn8W0wCSba81gwjrclnwSz99SrDsKvUVdhDOsWRPXk=;
 b=StSfMjgG4+KNVbI5LW+rlwJS16aCF27eduJjDxqU6ksj8M0vXSPNQHVIJn4hW9piKt
 A/Jqz2lUEl9i5BEdwyvpFckZggIWJzy7NFhkCTXL7HK5AXYtkaxErFB+FqURcXE+GQH6
 gv0JCCjhmmfYVD1k83bJ1D2wW+vkIW5Q+agfE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc;
 bh=Nyn8W0wCSba81gwjrclnwSz99SrDsKvUVdhDOsWRPXk=;
 b=f1Iipq4BTIpqtmESx9m2TMVHBj9eAnFQSeNnI959Y3gjcGIp6bmaGNVcFiZFBmGb40
 /yh66etdOspp5ptfRzOCNfNFhtSBx1K8IGx1GiGM0sykrmioO2sZy7dUITc8y3OVUaDZ
 7rTRb0k+DVmCe9uH1rXbMu21t6Eev1WBXqwuWhP4zAwAqCC3lHjrQ5kKu5zaj4WAAsvv
 NGXTS5t+dsoNhGYuFLoiVGZvY5Bt1i6VZt5sMZfR5SC3LJWYmZBqhnDiKcbK3SrV0qyZ
 Rom+9IWX6+dFW1DhZgWjrsp2YnlXXPar47a+EKgccVGl7WyoF78Qv+IV8hZffpOjLbls
 rbAA==
X-Gm-Message-State: ACgBeo15DlshL9gNoM2mbhvNDF9VuG3NkxDSoFmp/EwCpN+RBuPgHgKd
 7nnQyJCUEIum9Lr8GZrSAVsNxlerpDR/gA==
X-Google-Smtp-Source: AA6agR60+GpcLNN4G6igOxudrQosGpC4XLnhIHJLEPegByF/VI9LnfQJWRk+/rG2urBXPmUVACj9uw==
X-Received: by 2002:a05:6808:1520:b0:344:ad75:cb41 with SMTP id
 u32-20020a056808152000b00344ad75cb41mr2316577oiw.283.1660768468440; 
 Wed, 17 Aug 2022 13:34:28 -0700 (PDT)
Received: from mail-oa1-f52.google.com (mail-oa1-f52.google.com.
 [209.85.160.52]) by smtp.gmail.com with ESMTPSA id
 q207-20020a4a33d8000000b0044528e04cdasm3235166ooq.23.2022.08.17.13.34.28
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 17 Aug 2022 13:34:28 -0700 (PDT)
Received: by mail-oa1-f52.google.com with SMTP id
 586e51a60fabf-11c59785966so2775173fac.11
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Aug 2022 13:34:28 -0700 (PDT)
X-Received: by 2002:a05:6870:d0d4:b0:10d:4a2:2c0e with SMTP id
 k20-20020a056870d0d400b0010d04a22c0emr2720148oaa.232.1660768467647; Wed, 17
 Aug 2022 13:34:27 -0700 (PDT)
MIME-Version: 1.0
References: <20220816064231.60473-1-zhangzekun11@huawei.com>
In-Reply-To: <20220816064231.60473-1-zhangzekun11@huawei.com>
From: Brian Norris <briannorris@chromium.org>
Date: Wed, 17 Aug 2022 13:34:13 -0700
X-Gmail-Original-Message-ID: <CA+ASDXMGbJSJ2PC_4_2HL_01hO2aDoiWyxmosvtOze43aaeWpw@mail.gmail.com>
Message-ID: <CA+ASDXMGbJSJ2PC_4_2HL_01hO2aDoiWyxmosvtOze43aaeWpw@mail.gmail.com>
Subject: Re: [PATCH -next] drm/bridge: Add missing clk_disable_unprepare() in
 analogix_dp_resume()
To: Zhang Zekun <zhangzekun11@huawei.com>
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
Cc: Jonas Karlman <jonas@kwiboo.se>, David Airlie <airlied@linux.ie>,
 Robert Foss <robert.foss@linaro.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Doug Anderson <dianders@chromium.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Linux Kernel <linux-kernel@vger.kernel.org>, xuqiang36@huawei.com,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Aug 15, 2022 at 11:46 PM Zhang Zekun <zhangzekun11@huawei.com> wrote:
>
> Add the missing clk_disable_unprepare() before return from
> analogix_dp_resume() in the error handling case.
>
> Fixes: 211f276ed3d9 ("drm: bridge: analogix/dp: add panel prepare/unprepare in suspend/resume time")
> Signed-off-by: Zhang Zekun <zhangzekun11@huawei.com>

Reviewed-by: Brian Norris <briannorris@chromium.org>
