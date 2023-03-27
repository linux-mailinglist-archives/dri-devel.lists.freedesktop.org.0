Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 908166CB1D4
	for <lists+dri-devel@lfdr.de>; Tue, 28 Mar 2023 00:32:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 732A510E011;
	Mon, 27 Mar 2023 22:31:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vs1-xe29.google.com (mail-vs1-xe29.google.com
 [IPv6:2607:f8b0:4864:20::e29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C36EA10E011
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Mar 2023 22:31:56 +0000 (UTC)
Received: by mail-vs1-xe29.google.com with SMTP id z17so2237007vsf.4
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Mar 2023 15:31:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1679956314;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=c9Wt+WsnnVD5DSCi0zCQh6BBH6TNLjKpNQABAtkF2NM=;
 b=TJJnlhbbvX8CYLVVoocAVzW32w5wyAy0w60WP17fBop9zORjJqlfutrdzs/xPjGob3
 uEulrtjagGT+SgE63CFj5egKzLS3IbJHrXB6yTWm1tmCzSoarY0t5YK0cyBT/kqQnlq8
 eRBkjUz66+OCudU1Z0B0MRnmlsKdT+AOpyZPk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679956314;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=c9Wt+WsnnVD5DSCi0zCQh6BBH6TNLjKpNQABAtkF2NM=;
 b=FBm3ZLbMbMuiuiKUO6Uj07UafssaPgu0DsmTU6IzfZPMg0kGWMZzXqLN1xct1qjcTk
 X/QuZwGDyQqsu/bi+W3i/Udvo6TDX5Z5QQJyaeMQyAcXRWDMLJECRF8kLO/1Ohjyuwmq
 y5xvLXub1Z584+PPur0WouIDS3wXWeVr0T/hCyQVUqi67Gf5NpjfBobFoOC0g9FDRAR3
 Lg+C1C/hIr0Hv+bzkLyeE0savX/t5sgj1UBxXe41Hqj1cqLU0RJD8ZoNSQEKmg2pvi4T
 dY9CBOJLtxtCcDM+7B8cVXCuntXEiegDPtNvRGvluSSt8OAIfYMWFZeEzeMImkCyYRAN
 UXtg==
X-Gm-Message-State: AAQBX9c7h0QRNJhC00yXntjVCLr+Z/uVcr50tTpYfVVl6m6kAyvkuH7g
 /7i2DOJEPf77dtti7OPLShhqLfuqe8U+g8nrqf4=
X-Google-Smtp-Source: AKy350aXQOf0Pi4SoNmNxDXtf2mGMpWhX2cV/H+Ek8lBx5gcM/FXBiZgFEG9P1kuBu3GSn3P4nn9fQ==
X-Received: by 2002:a05:6102:285a:b0:425:bd6e:e603 with SMTP id
 az26-20020a056102285a00b00425bd6ee603mr4936206vsb.23.1679956314645; 
 Mon, 27 Mar 2023 15:31:54 -0700 (PDT)
Received: from mail-ua1-f46.google.com (mail-ua1-f46.google.com.
 [209.85.222.46]) by smtp.gmail.com with ESMTPSA id
 i7-20020a05610220c700b0041ebb606a9dsm3174950vsr.20.2023.03.27.15.31.53
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 27 Mar 2023 15:31:53 -0700 (PDT)
Received: by mail-ua1-f46.google.com with SMTP id h34so7534543uag.4
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Mar 2023 15:31:53 -0700 (PDT)
X-Received: by 2002:ab0:6082:0:b0:765:8f29:d679 with SMTP id
 i2-20020ab06082000000b007658f29d679mr329648ual.1.1679956313217; Mon, 27 Mar
 2023 15:31:53 -0700 (PDT)
MIME-Version: 1.0
References: <20230324165909.131831-1-vkoul@kernel.org>
 <CAD=FV=UJepzmKczemVGB8NacjyvLDqXiRoc81s1tJ=u5+HAeqg@mail.gmail.com>
 <fb2d333e-c459-f394-a299-533083b83596@linaro.org>
In-Reply-To: <fb2d333e-c459-f394-a299-533083b83596@linaro.org>
From: Doug Anderson <dianders@chromium.org>
Date: Mon, 27 Mar 2023 15:31:41 -0700
X-Gmail-Original-Message-ID: <CAD=FV=WTz=FVPP+pB8VMA8qWtD9hH00yBhFvs5rkfynranyr4w@mail.gmail.com>
Message-ID: <CAD=FV=WTz=FVPP+pB8VMA8qWtD9hH00yBhFvs5rkfynranyr4w@mail.gmail.com>
Subject: Re: [PATCH] drm/panel-edp: Add B133UAN01.0 edp panel entry
To: Neil Armstrong <neil.armstrong@linaro.org>
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
 Bjorn Andersson <bjorn.andersson@linaro.org>, Vinod Koul <vkoul@kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Sam Ravnborg <sam@ravnborg.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Fri, Mar 24, 2023 at 12:13=E2=80=AFPM Neil Armstrong
<neil.armstrong@linaro.org> wrote:
>
> Le 24/03/2023 =C3=A0 18:04, Doug Anderson a =C3=A9crit :
> > Hi,
> >
> > On Fri, Mar 24, 2023 at 9:59=E2=80=AFAM Vinod Koul <vkoul@kernel.org> w=
rote:
> >>
> >> From: Bjorn Andersson <bjorn.andersson@linaro.org>
> >>
> >> This panel is found in Lenovo Flex 5G laptop, so add the entry for it
> >>
> >> Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> >> Signed-off-by: Vinod Koul <vkoul@kernel.org>
> >> ---
> >>   drivers/gpu/drm/panel/panel-edp.c | 1 +
> >>   1 file changed, 1 insertion(+)
> >
> > Reviewed-by: Douglas Anderson <dianders@chromium.org>
> >
> > ...assuming nothing distracts me, I'll plan to land this Monday to
> > drm-misc-next.
>
> If you get distracted, I'll apply it!
>
> Acked-by: Neil Armstrong <neil.armstrong@linaro.org>

Pushed to drm-misc-next:

981f8866754d drm/panel-edp: Add B133UAN01.0 edp panel entry
