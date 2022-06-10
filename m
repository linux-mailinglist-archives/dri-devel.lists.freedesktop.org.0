Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1096B546E32
	for <lists+dri-devel@lfdr.de>; Fri, 10 Jun 2022 22:21:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E37B2112EE0;
	Fri, 10 Jun 2022 20:21:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x229.google.com (mail-oi1-x229.google.com
 [IPv6:2607:f8b0:4864:20::229])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A5A53112EE0
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Jun 2022 20:21:41 +0000 (UTC)
Received: by mail-oi1-x229.google.com with SMTP id w16so559917oie.5
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Jun 2022 13:21:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:in-reply-to:references:from:user-agent:date:message-id
 :subject:to:cc;
 bh=v6z8gULTHIEXJFyVfHn/zYRZEQ/mq5kGz4DwMssZmiM=;
 b=Yas5LCbeDxcOPo3MtUKZPoVtjGz2N7nWVFhOKmjgn5RnpUF00Uq4gIqlVy09L363kc
 gdafOTbPwf1O8ium0rvj7YV7d7ulOBtUIuJlR3T0KBIQJpQn9u1liHa411It6wWWEuN5
 FJVF4ZMWGGE2AhisPOXQ1h6NI1U6P69ujwl/c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:in-reply-to:references:from
 :user-agent:date:message-id:subject:to:cc;
 bh=v6z8gULTHIEXJFyVfHn/zYRZEQ/mq5kGz4DwMssZmiM=;
 b=47Lo2Af4yHXsO3/MTZjruz+GgmGHGDriA7vLMbBblnFju89Rde/xUesKdash5ySkKw
 vSXHK4UHICqzIhv021hEKa6j5H4Psc0jBGGjcMnqUqEyaoEgOoyCD8teIPhbjTuyulho
 Hapc7YVweSOAAOElDg6DRfmHfs5JyN0tmFDaUZfQw4yFp+u2Zx477+1/n13K4Yo4eJEE
 DgM7PV3TrysjWcRjTqu0DAld674HdRn7w4u/R6wmYwK78s1fhSZSlZyx9DTnf1bprAob
 ILrCywJcNa7kyN5FB4Y4LalpoiP2sLGxoJtGzrU9aFfGxucjHYtVdExoi985x3U8R8L8
 LyaQ==
X-Gm-Message-State: AOAM532bkpvIusBL6oMy5yazHveI98Aev6uUMX2Xfb7qd4wk2s4wnzHE
 1iN54WIk+FjBxq8rBEyqiQM+5C84PbzLeRodsHa3mQ==
X-Google-Smtp-Source: ABdhPJwZSfk+gNJ3MxdQNfb3bKMEr+pEObaXeEJqxZl5sl6oW8U5vvDxSDnaFP1z3ZStaQR+bR5RyDX3py/JnYaYMbI=
X-Received: by 2002:a05:6808:e87:b0:32e:4789:d2c with SMTP id
 k7-20020a0568080e8700b0032e47890d2cmr774448oil.193.1654892500954; Fri, 10 Jun
 2022 13:21:40 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 10 Jun 2022 13:21:40 -0700
MIME-Version: 1.0
In-Reply-To: <20220609072722.3488207-9-hsinyi@chromium.org>
References: <20220609072722.3488207-1-hsinyi@chromium.org>
 <20220609072722.3488207-9-hsinyi@chromium.org>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date: Fri, 10 Jun 2022 13:21:40 -0700
Message-ID: <CAE-0n51UTDJ1zkhrwcxrYL7X9_MrhAeodiTJ30k+3Zef3zP2=Q@mail.gmail.com>
Subject: Re: [PATCH v7 8/8] drm: Config orientation property if panel provides
 it
To: Douglas Anderson <dianders@chromium.org>,
 Hans de Goede <hdegoede@redhat.com>, 
 Hsin-Yi Wang <hsinyi@chromium.org>, Sam Ravnborg <sam@ravnborg.org>
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
Cc: Rob Clark <robdclark@chromium.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, Thierry Reding <thierry.reding@gmail.com>,
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Quoting Hsin-Yi Wang (2022-06-09 00:27:23)
> Panel orientation property should be set before drm_dev_register().
> Some drm driver calls drm_dev_register() in .bind(). However, most
> panels sets orientation property relatively late, mostly in .get_modes()
> callback, since this is when they are able to get the connector and
> binds the orientation property to it, though the value should be known
> when the panel is probed.
>
> In drm_bridge_connector_init(), if a bridge is a panel bridge, use it to
> set the connector's panel orientation property.
>
> Suggested-by: Doug Anderson <dianders@chromium.org>
> Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
