Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 608CA46414D
	for <lists+dri-devel@lfdr.de>; Tue, 30 Nov 2021 23:32:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 88E686E584;
	Tue, 30 Nov 2021 22:31:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd2d.google.com (mail-io1-xd2d.google.com
 [IPv6:2607:f8b0:4864:20::d2d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 902256E584
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Nov 2021 22:31:55 +0000 (UTC)
Received: by mail-io1-xd2d.google.com with SMTP id z18so28255200iof.5
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Nov 2021 14:31:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=AXXJ26Wt6dMZ0zORFCiW5WUqSHwbGwHJdBTa4iT2mVM=;
 b=azsCj/Xo7luiuJG3TgVodDC6kPkHmTnZZNjFIQRBNJHvod/t5kJhL+3sFQ39CkElhi
 qt3gxzzWZL6bhROlbkR5eapdsFYRXgJvxPC9b0UY4E9okDXc8IOHgyDgrYh5Q5UWRunb
 JE/nIziF8kLAGWW57/42rdDqwwrIzGEOnYhCLrUiXYTRjXkG2CzIfUEGzdCLHGe95wSX
 o6YclUuvPm1AyWV2P10GHzFCDsgH+tDrL3O8A1mmwmDxOxYyNMdJIFCBOM/oxjFc1KgJ
 XnlwphAl1r9BlxtMri+YDJ429Mz34xzM3IkHZjidJeqgQB/Yf1TqgKk/jRRJvi4iE3OJ
 7D0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=AXXJ26Wt6dMZ0zORFCiW5WUqSHwbGwHJdBTa4iT2mVM=;
 b=Jzdq6u/5ttjW/wwYMdOwSqy/qYvaOOei+2CB1Q1hslKx19UTYlUEn6VAltMEBk4axk
 qdK3nC/R5FXSkGfDpauorrI1jh3FxB6/ksBkcRAal1xy0l1gNsjJYjJB8dw+OahZpZhL
 RfW4FeDym4rAZaBDENRiE9hcKwib9aDstR1QJhDsdDHZRu2rVXJ2kPRy7ZHJm3Yx3G0q
 gk3hQtZpHY9U++eHY9qV6us1snwqIVYtgA9GLLCXMVNV0kC3kJnRve2nfc0tXc8LOjKQ
 vm4cGb5eyhwRJGNC+iGOYPRpGWzAdBh6NqDk5G+ZAeGnp193SiQgpyieOPjK4YfKkwHT
 Dw3g==
X-Gm-Message-State: AOAM530zRrAi5FtGjVNRycHFKHkWXqUzISAgFtuzSaRKRSJ0qaeJLuhv
 N4X2X6mUpanF4nHDbuq0tki64Mz3OUcICO4+xJHI3w==
X-Google-Smtp-Source: ABdhPJz1icdhjs029/3/wHzP6fD9o5E170eQhe4Tn7lyO0TJjPeJHsCU8ig12rKaMR80FMbMdbWkBs5TIS+o+SzjSuI=
X-Received: by 2002:a02:cc91:: with SMTP id s17mr3959716jap.3.1638311514465;
 Tue, 30 Nov 2021 14:31:54 -0800 (PST)
MIME-Version: 1.0
References: <20211123075205.2457975-1-yangcong5@huaqin.corp-partner.google.com>
In-Reply-To: <20211123075205.2457975-1-yangcong5@huaqin.corp-partner.google.com>
From: Doug Anderson <dianders@google.com>
Date: Tue, 30 Nov 2021 14:31:42 -0800
Message-ID: <CAD=FV=W=9Ux4ym4GsFME2L9Qjis-pJckOinRXaese4aO4YCq2w@mail.gmail.com>
Subject: Re: [PATCH] drm/panel: Update BOE and INX initial code
To: yangcong <yangcong5@huaqin.corp-partner.google.com>
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
Cc: devicetree@vger.kernel.org, airlied@linux.ie, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, thierry.reding@gmail.com, sam@ravnborg.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Mon, Nov 22, 2021 at 11:52 PM yangcong
<yangcong5@huaqin.corp-partner.google.com> wrote:
>
> At present, we have enough panel to confirm the effect,
> update the initial code to achieve the best effect.
> such as gamma, Gtp timing. They are all minor modifications
> and doesn't affect the lighting of the panel.
>
> a)Boe panel Optimized touch horizontal grain.
> b)Inx panel Optimized GOP timming and gamma.

s/timming/timing


> Signed-off-by: yangcong <yangcong5@huaqin.corp-partner.google.com>
> ---
>  .../gpu/drm/panel/panel-boe-tv101wum-nl6.c    | 108 ++++++++++++------
>  1 file changed, 71 insertions(+), 37 deletions(-)

Please resend and include the panel model in "${SUBJECT}". Right now
your subject makes it sound as if this affects _all_ BOE and INX
panels but it only affects two particular ones.


> @@ -111,18 +111,16 @@ static const struct panel_init_cmd boe_tv110c9m_init_cmd[] = {
>         _INIT_DCS_CMD(0xB0, 0x00, 0x00, 0x00, 0x1B, 0x00, 0x45, 0x00, 0x65, 0x00, 0x81, 0x00, 0x99, 0x00, 0xAE, 0x00, 0xC1),
>         _INIT_DCS_CMD(0xB1, 0x00, 0xD2, 0x01, 0x0B, 0x01, 0x34, 0x01, 0x76, 0x01, 0xA3, 0x01, 0xEF, 0x02, 0x27, 0x02, 0x29),
>         _INIT_DCS_CMD(0xB2, 0x02, 0x5F, 0x02, 0x9E, 0x02, 0xC9, 0x03, 0x00, 0x03, 0x26, 0x03, 0x53, 0x03, 0x63, 0x03, 0x73),
> -       _INIT_DCS_CMD(0xB3, 0x03, 0x86, 0x03, 0x9A, 0x03, 0xAF, 0x03, 0xDF, 0x03, 0xF5, 0x03, 0xF7),
> -
> +       _INIT_DCS_CMD(0xB3, 0x03, 0x86, 0x03, 0x9A, 0x03, 0xA7, 0x03, 0xCF, 0x03, 0xDE, 0x03, 0xE0),

You would know better than I would, but it seems like you've randomly
added / removed some blank lines in this patch. Since these are
totally opaque to me (which I hate) I don't know which is better or
worse, but it seems rather arbitrary to be messing with the spacing.


> @@ -428,10 +452,10 @@ static const struct panel_init_cmd inx_init_cmd[] = {

I should have noticed before, but the name "inx_init_cmd" is way too
generic. Can you also include a patch to rename this to
"inx_hj110iz_init_cmd" ?


Other than nits then I guess this is fine. I'll probably wait about a
week from whenever you send the next version and then plan to land it
in drm-misc-next barring any other feedback.

-Doug
