Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B9374BD5A4
	for <lists+dri-devel@lfdr.de>; Mon, 21 Feb 2022 06:53:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 640FD10EACE;
	Mon, 21 Feb 2022 05:53:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-x131.google.com (mail-il1-x131.google.com
 [IPv6:2607:f8b0:4864:20::131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9562510EAAF
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Feb 2022 05:53:15 +0000 (UTC)
Received: by mail-il1-x131.google.com with SMTP id 9so8520685ily.11
 for <dri-devel@lists.freedesktop.org>; Sun, 20 Feb 2022 21:53:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Tu5+ZumlPrWZWUHsiI2Qy64iwmLnXHPFMBECCxnAn1Q=;
 b=eNH4LlOm7E19BUvV8/YUg4na+pugGL0GQtGPyd4F0sskxsfwUbBSISYkazJdvs/PoP
 TCUuJ7V7E5q05LnFlzsaF6puEW9DPWepHDebomaIkIAB1deViIk2fnuBFkUBKQaOz4Wi
 r4T2B57aJdhZf+gNbMORQrt6rYCVmxRrpXl+k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Tu5+ZumlPrWZWUHsiI2Qy64iwmLnXHPFMBECCxnAn1Q=;
 b=B68302F3fHq3+dxZ0egZmWKfRCkaFYXQH83plfwgeZs9cXOKaIgJDFulSmKGRgV3jN
 ZeUFfmca6DYhOMlJEQHlfKtOJJkmms9qd0CQW+Oq2plFrOkiPQtRoopLjlMI41wRogVu
 tYMtoSgwzS3QmufvToQg9wHjSA7qx1x6R/dXT/DSAqNpDbus4+Ul3/3sEpI+lsmTHutv
 rh+zUaMcVw+kvaLHgRsUUMEn6bv19PESDdfXOKlKem8tbFs7nRt7Z5xlNHy9cESS7ciW
 9KIRAakfV8Roxpe9LOgeoxLNQHJfSmkhiCSmjT21a2QwV64dc/V0jRMeT8UXNkq/wsL8
 E8ow==
X-Gm-Message-State: AOAM532tiTpJAh+tX48lgBeGbp/y33v2sdsQAuWuRec6HUHNTpcnwn5H
 Zk8uT6dO8YcmAcseBkD8k5Qqskciz+G1dxGQTlitBw==
X-Google-Smtp-Source: ABdhPJy+ADYxxlDzmssOlbjH+urLluUHRb2DC7LoPstB1CTvBPMG2Vu8sbsrVI+mxW56/GIh/EIENpAVCZE2xANFsiE=
X-Received: by 2002:a92:b05:0:b0:2b7:ee19:ee15 with SMTP id
 b5-20020a920b05000000b002b7ee19ee15mr14838488ilf.10.1645422794893; Sun, 20
 Feb 2022 21:53:14 -0800 (PST)
MIME-Version: 1.0
References: <20220218094417.1631559-1-rexnie3@gmail.com>
 <CAG+K-_+txzJ2F9LONj_i3icqXFmn9byhUjJtu7N-xeY-5UKizQ@mail.gmail.com>
In-Reply-To: <CAG+K-_+txzJ2F9LONj_i3icqXFmn9byhUjJtu7N-xeY-5UKizQ@mail.gmail.com>
From: Hsin-Yi Wang <hsinyi@chromium.org>
Date: Mon, 21 Feb 2022 13:52:49 +0800
Message-ID: <CAJMQK-ibOOdofUVso=RvLz5OiCzH0kaQ16VMgXY7Qpxm5NEEYA@mail.gmail.com>
Subject: Re: [PATCH 1/2] drm/panel-edp: Add eDP innolux panel support
To: Rex Nie <rexnie3@gmail.com>
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
Cc: devicetree@vger.kernel.org,
 Daocai Nie <niedaocai@huaqin.corp-partner.google.com>,
 David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Rob Herring <robh+dt@kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Feb 18, 2022 at 5:59 PM Rex Nie <rexnie3@gmail.com> wrote:
>
> Add hsinyi@chromium.org to cc list
>
> On Fri, 18 Feb 2022 at 17:44, Rex Nie <rexnie3@gmail.com> wrote:
>>
>> From: Daocai Nie <niedaocai@huaqin.corp-partner.google.com>
>>
>> Add support for the 14" innolux,n140hca-eac eDP panel.
>>
>> Signed-off-by: Daocai Nie <niedaocai@huaqin.corp-partner.google.com>

Acked-by: Hsin-Yi Wang <hsinyi@chromium.org>
>> ---
>>  drivers/gpu/drm/panel/panel-edp.c | 26 ++++++++++++++++++++++++++
>>  1 file changed, 26 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/panel/panel-edp.c b/drivers/gpu/drm/panel/panel-edp.c
>> index f7bfcf63d48e..f5f9c9cb26ba 100644
>> --- a/drivers/gpu/drm/panel/panel-edp.c
>> +++ b/drivers/gpu/drm/panel/panel-edp.c
>> @@ -1330,6 +1330,29 @@ static const struct panel_desc innolux_n125hce_gn1 = {
>>         },
>>  };
>>
>> +static const struct display_timing innolux_n140hca_eac_timing = {
>> +       .pixelclock = { 72600000, 76420000, 80240000 },
>> +       .hactive = { 1920, 1920, 1920 },
>> +       .hfront_porch = { 80, 80, 80 },
>> +       .hback_porch = { 190, 190, 190 },
>> +       .hsync_len = { 60, 60, 60 },
>> +       .vactive = { 1080, 1080, 1080 },
>> +       .vfront_porch = { 6, 6, 6 },
>> +       .vback_porch = { 38, 38, 38 },
>> +       .vsync_len = { 8, 8, 8 },
>> +       .flags = DISPLAY_FLAGS_VSYNC_LOW | DISPLAY_FLAGS_HSYNC_LOW,
>> +};
>> +
>> +static const struct panel_desc innolux_n140hca_eac = {
>> +       .timings = &innolux_n140hca_eac_timing,
>> +       .num_timings = 1,
>> +       .bpc = 6,
>> +       .size = {
>> +               .width = 309,
>> +               .height = 174,
>> +       },
>> +};
>> +
>>  static const struct drm_display_mode innolux_p120zdg_bf1_mode = {
>>         .clock = 206016,
>>         .hdisplay = 2160,
>> @@ -1750,6 +1773,9 @@ static const struct of_device_id platform_of_match[] = {
>>         }, {
>>                 .compatible = "innolux,n125hce-gn1",
>>                 .data = &innolux_n125hce_gn1,
>> +       }, {
>> +               .compatible = "innolux,n140hca-eac",
>> +               .data = &innolux_n140hca_eac,
>>         }, {
>>                 .compatible = "innolux,p120zdg-bf1",
>>                 .data = &innolux_p120zdg_bf1,
>> --
>> 2.25.1
>>
