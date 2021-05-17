Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C6CA8386B22
	for <lists+dri-devel@lfdr.de>; Mon, 17 May 2021 22:17:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7A1666EA84;
	Mon, 17 May 2021 20:17:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x741.google.com (mail-qk1-x741.google.com
 [IPv6:2607:f8b0:4864:20::741])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3B67D6EA84
 for <dri-devel@lists.freedesktop.org>; Mon, 17 May 2021 20:17:45 +0000 (UTC)
Received: by mail-qk1-x741.google.com with SMTP id x8so7141504qkl.2
 for <dri-devel@lists.freedesktop.org>; Mon, 17 May 2021 13:17:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=vLJpaxOqtbI+Qb2zKdqGEkILQIDGWpq1zNOEwsHFtPQ=;
 b=ZrQnlImcr9WmIFORVAFZEDpXisiakdk1c7hJMqPolW1P1zOfpLXZ3jX5JU9XArrkzs
 G34/AQNfxUiOIu9TsyBjCX92VuSpj1TU4tm1DDgZ1LYT+tZzk7hX8XHH+P0xYvW8BNO5
 78J1WTzrDq24zp159QAD+LFEZPxjmaEHktb1o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=vLJpaxOqtbI+Qb2zKdqGEkILQIDGWpq1zNOEwsHFtPQ=;
 b=d8jU91H8fce/lOXA7FgVXJvalrStDPyyowTzRB3KuwqkVzyNBdRsfZHXnpjN2MH5pC
 WQM5PJecS4RtVakr7yHIaeqdJKewggQezKiQjWW/9N27qL8NSWb8nocyIw277XDdx6qC
 uhpVH//UiWRtMLHEIDlu6jj0YoDNaXcaQHBf8dkEJeaAwUzACuviRHv+8Gl1i2IGJIaP
 IS3mbJIApFuN1WiG32GX8DJKtlrt61xAWjmv0vQZwRpWk2LaHAbtRr1TGw2O8YfBv6pm
 HroFgTlt5msHN02hgNCZ8FliQJFpACX8bO0Yk7RDSkNWgDC842KQ29s2ST+5gJDoJnDB
 FNSQ==
X-Gm-Message-State: AOAM531I7CqFaV/td2cKrQ7mel2Ba+3eOTDUCLu5VPN0AQfrjnm+vVsF
 Akq9EVQADUKwohRAhdfFfe9jYXho/euXdQ==
X-Google-Smtp-Source: ABdhPJyrUVWa+eRMGlTou/D0U06bgGEAilPn2hKeUd9jP+4jjGWuRoDXCjEaQHN897LW1pelKW4gMg==
X-Received: by 2002:a37:6b47:: with SMTP id g68mr1648412qkc.89.1621282664310; 
 Mon, 17 May 2021 13:17:44 -0700 (PDT)
Received: from mail-yb1-f172.google.com (mail-yb1-f172.google.com.
 [209.85.219.172])
 by smtp.gmail.com with ESMTPSA id i5sm11152630qki.115.2021.05.17.13.16.59
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 17 May 2021 13:17:05 -0700 (PDT)
Received: by mail-yb1-f172.google.com with SMTP id y2so10177831ybq.13
 for <dri-devel@lists.freedesktop.org>; Mon, 17 May 2021 13:16:59 -0700 (PDT)
X-Received: by 2002:a25:aad4:: with SMTP id t78mr2151750ybi.343.1621282601374; 
 Mon, 17 May 2021 13:16:41 -0700 (PDT)
MIME-Version: 1.0
References: <20210503215844.2996320-1-dianders@chromium.org>
 <20210503145750.v6.1.Ib7e3a4af2f3e2cb3bd8e4adbac3bcfc966f27791@changeid>
In-Reply-To: <20210503145750.v6.1.Ib7e3a4af2f3e2cb3bd8e4adbac3bcfc966f27791@changeid>
From: Doug Anderson <dianders@chromium.org>
Date: Mon, 17 May 2021 13:16:29 -0700
X-Gmail-Original-Message-ID: <CAD=FV=UuBo_T_FiPWT3Wz1SGtcAkwnsKKAtxtLkGDnzeYaybtg@mail.gmail.com>
Message-ID: <CAD=FV=UuBo_T_FiPWT3Wz1SGtcAkwnsKKAtxtLkGDnzeYaybtg@mail.gmail.com>
Subject: Re: [PATCH v6 1/5] i2c: i2c-core-of: Fix corner case of finding
 adapter by node
To: Wolfram Sang <wsa@kernel.org>
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
Cc: Rob Clark <robdclark@chromium.org>,
 Jernej Skrabec <jernej.skrabec@siol.net>, Thierry Reding <treding@nvidia.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Neil Armstrong <narmstrong@baylibre.com>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>, Jonas Karlman <jonas@kwiboo.se>,
 LKML <linux-kernel@vger.kernel.org>, Steev Klimaszewski <steev@kali.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Stanislav Lisovskiy <stanislav.lisovskiy@intel.com>,
 Andrzej Hajda <a.hajda@samsung.com>, linux-i2c <linux-i2c@vger.kernel.org>,
 Stephen Boyd <swboyd@chromium.org>, Sam Ravnborg <sam@ravnborg.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Mon, May 3, 2021 at 2:59 PM Douglas Anderson <dianders@chromium.org> wrote:
>
> The of_find_i2c_adapter_by_node() could end up failing to find an
> adapter in certain conditions. Specifically it's possible that
> of_dev_or_parent_node_match() could end up finding an I2C client in
> the list and cause bus_find_device() to stop early even though an I2C
> adapter was present later in the list.
>
> Let's move the i2c_verify_adapter() into the predicate function to
> prevent this. Now we'll properly skip over the I2C client and be able
> to find the I2C adapter.
>
> This issue has always been a potential problem if a single device tree
> node could represent both an I2C client and an adapter. I believe this
> is a sane thing to do if, for instance, an I2C-connected DP bridge
> chip is present. The bridge chip is an I2C client but it can also
> provide an I2C adapter (DDC tunneled over AUX channel). We don't want
> to have to create a sub-node just so a panel can link to it with the
> "ddc-i2c-bus" property.
>
> I believe that this problem got worse, however, with commit
> e814e688413a ("i2c: of: Try to find an I2C adapter matching the
> parent"). Starting at that commit it would be even easier to
> accidentally miss finding the adapter.
>
> Signed-off-by: Douglas Anderson <dianders@chromium.org>
> Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> ---
> Later patches in this series won't work right without this one, but
> they won't crash. If we can't find the i2c bus we'll just fall back to
> the hardcoded panel modes which, at least today, all panels have.
>
> I'll also note that part of me wonders if we should actually fix this
> further to run two passes through everything: first look to see if we
> find an exact match and only look at the parent pointer if there is no
> match. I don't currently have a need for that and it's a slightly
> bigger change, but it seems conceivable that it could affect someone?
>
> (no changes since v1)
>
>  drivers/i2c/i2c-core-of.c | 17 ++++++++++-------
>  1 file changed, 10 insertions(+), 7 deletions(-)

FYI that I've just posted v7 of this series and I've dropped
${SUBJECT} patch from my series.

I think that ${SUBJECT} patch is still correct and could be useful to
land, but it's no longer needed by my series since I'm getting access
to the DDC bus in a different way. If this patch needs to be spun,
please let me know. ...or, feel free to land it! :-)

-Doug
