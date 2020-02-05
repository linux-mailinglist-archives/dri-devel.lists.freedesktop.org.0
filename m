Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 014FC1539A9
	for <lists+dri-devel@lfdr.de>; Wed,  5 Feb 2020 21:41:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DA8C16F942;
	Wed,  5 Feb 2020 20:41:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x342.google.com (mail-ot1-x342.google.com
 [IPv6:2607:f8b0:4864:20::342])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 18B836F943
 for <dri-devel@lists.freedesktop.org>; Wed,  5 Feb 2020 20:41:44 +0000 (UTC)
Received: by mail-ot1-x342.google.com with SMTP id g64so3267743otb.13
 for <dri-devel@lists.freedesktop.org>; Wed, 05 Feb 2020 12:41:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=C80FvtF14u18Q5GuI4vN3cPxQNFCTPS0fGip7F+rzSA=;
 b=tUzYU7xPl+51dvzEMgLEd/cCMubfaL8ywjSse0rY7RFkACLPYA4FOyxZvncSztxGfm
 jFsPLMfKId7jpqzuZVxT2EFmuMLwh+x8Uzd2b6p6oOpYZTrPVrxfRUoUs9SiWeil9MEl
 yg3G0cSD2guGQ453ii26L+O3hPobLCKda6c5k48Srl5Yl0CLV7URwPTuaaKYCo+W82Uw
 zYcfpRpIMGhr7SSz87faIU23uuVkeMhwdM06oNRgj2Hb9/VE/+uxfuAdOGmHUe/euw8X
 cH3J+NDend/xp57RcU74XjqeczV2W7ypldS6fRitxcboaDc5T8+C/X2ZQRo1+uH4ScSX
 IPoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=C80FvtF14u18Q5GuI4vN3cPxQNFCTPS0fGip7F+rzSA=;
 b=bDiMKJk9iwh3bYiGpwtmLudWGnWgybX54TMkszUyIUpwvny9AkPyja3pEreoRUeFAH
 vwDMjYOa2McNDevcd6CiWX6QD4h8lGLYHEEYwNcTB6aXu0dWFmA9tPGdY/C3RoYA3iuU
 6bAB0Ovy3ec756rPHJhBGaGMJTOwuSgLqEjBORw3y28hvbhaQiXIMJg90LYQvyjLHB16
 rBn6ELbox5u0Rj1jxQHTPrIobdgLYn2So/CAGCiYmNHqsFTV4it1JfgMaWq6T6U630Zx
 OX12+s+EK5URr6JTxWBgZ+wwrQRktk6Aq0USlNSUKVgybKH2lfuAMa+aFBb7NOl0BWbe
 6UHA==
X-Gm-Message-State: APjAAAWVzuNi5ndVjxA3EDGb+6YsMhKgYpwOkCf/dqSrSgjVvlvXHz0P
 68w8W7PJeCxpG42U7q7SuB7ft/RC98t/uia0JHfCOg==
X-Google-Smtp-Source: APXvYqy9KjEBmSX5NkhLfBxg20I2V+XHYQ3xYGJSq4SDwQ1CyKJCQ+J9WrP3E0MhyV/DgPruw7w2Y2qCsPlY5jZD2/4=
X-Received: by 2002:a9d:7493:: with SMTP id t19mr14867146otk.332.1580935303244; 
 Wed, 05 Feb 2020 12:41:43 -0800 (PST)
MIME-Version: 1.0
References: <1580838148-2981-1-git-send-email-jcrouse@codeaurora.org>
In-Reply-To: <1580838148-2981-1-git-send-email-jcrouse@codeaurora.org>
From: John Stultz <john.stultz@linaro.org>
Date: Wed, 5 Feb 2020 12:41:32 -0800
Message-ID: <CALAqxLX73PWJUFB1g2_nkdanGvCXJJDznwMUwjN2x5AiAJ=Ppg@mail.gmail.com>
Subject: Re: [PATCH] drm/msm/a6xx: Remove unneeded GBIF unhalt
To: Jordan Crouse <jcrouse@codeaurora.org>
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
Cc: Sean Paul <sean@poorly.run>, David Airlie <airlied@linux.ie>,
 linux-arm-msm@vger.kernel.org, Sharat Masetty <smasetty@codeaurora.org>,
 lkml <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, freedreno@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Feb 4, 2020 at 9:42 AM Jordan Crouse <jcrouse@codeaurora.org> wrote:
>
> Commit e812744c5f95 ("drm: msm: a6xx: Add support for A618") added a
> universal GBIF un-halt into a6xx_start(). This can cause problems for
> a630 targets which do not use GBIF and might have access protection
> enabled on the region now occupied by the GBIF registers.
>
> But it turns out that we didn't need to unhalt the GBIF in this path
> since the stop function already takes care of that after executing a flush
> but before turning off the headswitch. We should be confident that the
> GBIF is open for business when we restart the hardware.
>
> Signed-off-by: Jordan Crouse <jcrouse@codeaurora.org>

Sorry, yesterday got busy with other things and I didn't get around to
testing your patch, but I have tested earlier with my own patch which
is identical:
  https://git.linaro.org/people/john.stultz/android-dev.git/commit/?h=dev/db845c-mainline-WIP&id=4e6a2e84dd77fe74faa1a6b797eb0ee7bf11ffd7

So, I think I can safely add:
Tested-by: John Stultz <john.stultz@linaro.org>

Thanks so much for the quick turnaround on this!
-john
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
