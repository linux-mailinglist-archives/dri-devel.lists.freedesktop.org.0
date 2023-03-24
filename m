Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 318FD6C82D4
	for <lists+dri-devel@lfdr.de>; Fri, 24 Mar 2023 18:05:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2E1E410E566;
	Fri, 24 Mar 2023 17:04:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-x1129.google.com (mail-yw1-x1129.google.com
 [IPv6:2607:f8b0:4864:20::1129])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 448F210EC11
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Mar 2023 17:04:54 +0000 (UTC)
Received: by mail-yw1-x1129.google.com with SMTP id
 00721157ae682-5447d217bc6so44099207b3.7
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Mar 2023 10:04:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1679677492;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=55jXLirChjS+BkN9O/QVlhBVJ6/URXMG6y24YCNnkYA=;
 b=guU1oU5G7/yHf2+DsUxV9XQtKtafHnGW8LxGkAehMw/sR3e3gnFng83w07+icz93Rm
 wv1+oDHt4AqUvxv5Ez4tT7OSaju8El1XZWyDrKBDbs2wAf4Tf9JvEbXXA9t3Jw2cduB9
 nhn53QKaK9vezYM1B9jSf/mJ9S5JwvQoPNgd8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679677492;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=55jXLirChjS+BkN9O/QVlhBVJ6/URXMG6y24YCNnkYA=;
 b=ISiUBGJ911WlWjXSYxOYlmPz0ONLHtrBF8TSrOcCWGGAtpAlJBdh0ojFQXPjSHgCqr
 Xer/eVWSBZ4+AF6Mz/2eQo68oQxoXwLsyBRVcqQF/CyVMuMHgtkaRgIXcseCwlAaqgLO
 DUBnEa1tf79CqBUDsGB7H3cRiUfhYvTn09m6z17EcCQuawhmEblCaqMlYgG82mn3GBmx
 Sb9DAy1m20hNynV0q4kpOM6XeD3qubIsyWzMo7o26JgP3TB5aHpAl3GNlD+fQ/5wOBii
 QzhF/ohrSnZFE6H3Wm020eO4WSCOtqSOXf/d2DY3lRYhLg9RCJZoNfn718wx5eAOvRKP
 RoeQ==
X-Gm-Message-State: AAQBX9ee4gDulRWO/dCsAQN+FxnBkgP5cXRirB9MzQRNikHroiS95cyM
 7eVmXAK1Bj9AX3IiAHGwu59Pkh0zqVJziFGrcSI=
X-Google-Smtp-Source: AKy350Yq+8oMJWIkK7ZO5qLOdJ6RyqlaJ9k0ybsE3/KchiKPD7N5kuW87FGBONTd8O5p0ltiG/bJng==
X-Received: by 2002:a81:7506:0:b0:543:6327:8d63 with SMTP id
 q6-20020a817506000000b0054363278d63mr3160128ywc.2.1679677492402; 
 Fri, 24 Mar 2023 10:04:52 -0700 (PDT)
Received: from mail-yb1-f173.google.com (mail-yb1-f173.google.com.
 [209.85.219.173]) by smtp.gmail.com with ESMTPSA id
 v32-20020a81b720000000b00545a08184bdsm510118ywh.77.2023.03.24.10.04.51
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 24 Mar 2023 10:04:51 -0700 (PDT)
Received: by mail-yb1-f173.google.com with SMTP id e65so2981295ybh.10
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Mar 2023 10:04:51 -0700 (PDT)
X-Received: by 2002:a05:6902:18cd:b0:b74:6c88:7bff with SMTP id
 ck13-20020a05690218cd00b00b746c887bffmr1571883ybb.0.1679677491319; Fri, 24
 Mar 2023 10:04:51 -0700 (PDT)
MIME-Version: 1.0
References: <20230324165909.131831-1-vkoul@kernel.org>
In-Reply-To: <20230324165909.131831-1-vkoul@kernel.org>
From: Doug Anderson <dianders@chromium.org>
Date: Fri, 24 Mar 2023 10:04:39 -0700
X-Gmail-Original-Message-ID: <CAD=FV=UJepzmKczemVGB8NacjyvLDqXiRoc81s1tJ=u5+HAeqg@mail.gmail.com>
Message-ID: <CAD=FV=UJepzmKczemVGB8NacjyvLDqXiRoc81s1tJ=u5+HAeqg@mail.gmail.com>
Subject: Re: [PATCH] drm/panel-edp: Add B133UAN01.0 edp panel entry
To: Vinod Koul <vkoul@kernel.org>
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
Cc: linux-arm-msm@vger.kernel.org, Bjorn Andersson <andersson@kernel.org>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Sam Ravnborg <sam@ravnborg.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Fri, Mar 24, 2023 at 9:59=E2=80=AFAM Vinod Koul <vkoul@kernel.org> wrote=
:
>
> From: Bjorn Andersson <bjorn.andersson@linaro.org>
>
> This panel is found in Lenovo Flex 5G laptop, so add the entry for it
>
> Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> Signed-off-by: Vinod Koul <vkoul@kernel.org>
> ---
>  drivers/gpu/drm/panel/panel-edp.c | 1 +
>  1 file changed, 1 insertion(+)

Reviewed-by: Douglas Anderson <dianders@chromium.org>

...assuming nothing distracts me, I'll plan to land this Monday to
drm-misc-next.
