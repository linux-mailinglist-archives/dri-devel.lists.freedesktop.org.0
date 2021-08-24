Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 519FF3F6BC0
	for <lists+dri-devel@lfdr.de>; Wed, 25 Aug 2021 00:37:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8DB146E0D8;
	Tue, 24 Aug 2021 22:37:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd2d.google.com (mail-io1-xd2d.google.com
 [IPv6:2607:f8b0:4864:20::d2d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8F4726E0D8
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Aug 2021 22:37:46 +0000 (UTC)
Received: by mail-io1-xd2d.google.com with SMTP id f6so20831313iox.0
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Aug 2021 15:37:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=N2KxnHa/5CXRSQusM6YnlNCt9dIjl+2phwzvOUDij4o=;
 b=Kv/F+w3zogYrf9JdN1LrLuzl5nxItyM8qeG/HMMw9o+i2vG9H2xfFJSQuIZNXsE87a
 8EiZC7wL/9jLYg0OOl/pglYwTsaCkvjnCVnsPiiHPC7D2Rl9mBCxTCz7k8xeHs8VH4Rd
 VYifVKaWpWMP0wxasf7327R0Jzs0rqN85faKI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=N2KxnHa/5CXRSQusM6YnlNCt9dIjl+2phwzvOUDij4o=;
 b=jq/JC9IdQYUtJ1a6ex9DLZfHPaA0XmjacTXgjvXsJ4BLDcZQTOX9MMwF24y+hJ5ns6
 NqQaO5RLHS6mI80JnwD7U5CO7SSUbph9wwh1nhGyqbZhLl+Zg9jU8JI5ehdqCvLZ+sne
 Grg4oVnl+FkgZtO4mdR8BM7ekPEoxw/NaUT8T1W1jEEOL1OeeNqE4Gyawi9cZy1qxFPe
 umMCnomR9EJTzhCMsjk+7Qa8S/QPQx6VqfZMne5rP8QIkTpO14niXE/pFrPYYi406P0H
 Da7QYz18syHMKIY4NrAT3g3N1ToCmb3uYem+HktwG/57SdPEppP0Q4TC/zSh0fTR83vQ
 pDVw==
X-Gm-Message-State: AOAM5309wGTKIbmziTFY8tTwtbNqDYZovamhdcKRUl8KvWRvMEDXQWdp
 JbdYIzbTLBiuA1bBxU1m5XJ/PdOrh+WOew==
X-Google-Smtp-Source: ABdhPJzI1YgieBV41Qc9T4gJIOfhHC2U8x2NhHUlW4Jw3hOSZAHmyNoBS2buicUFt534/NvRaz2Mtg==
X-Received: by 2002:a6b:6a14:: with SMTP id x20mr34876108iog.177.1629844665651; 
 Tue, 24 Aug 2021 15:37:45 -0700 (PDT)
Received: from mail-io1-f54.google.com (mail-io1-f54.google.com.
 [209.85.166.54])
 by smtp.gmail.com with ESMTPSA id k6sm10299014ilu.41.2021.08.24.15.37.44
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 24 Aug 2021 15:37:44 -0700 (PDT)
Received: by mail-io1-f54.google.com with SMTP id f6so20831249iox.0
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Aug 2021 15:37:44 -0700 (PDT)
X-Received: by 2002:a5e:a813:: with SMTP id c19mr33362612ioa.199.1629844664506; 
 Tue, 24 Aug 2021 15:37:44 -0700 (PDT)
MIME-Version: 1.0
References: <20210820162201.1.I8ead7431357409f2526e5739ec5bc3ddfd242243@changeid>
In-Reply-To: <20210820162201.1.I8ead7431357409f2526e5739ec5bc3ddfd242243@changeid>
From: Doug Anderson <dianders@chromium.org>
Date: Tue, 24 Aug 2021 15:37:32 -0700
X-Gmail-Original-Message-ID: <CAD=FV=W56FsUOzrRQ7Y5F4g7yBSXr-KJ45t32ghGSsNtFsNUMg@mail.gmail.com>
Message-ID: <CAD=FV=W56FsUOzrRQ7Y5F4g7yBSXr-KJ45t32ghGSsNtFsNUMg@mail.gmail.com>
Subject: Re: [PATCH] drm/bridge: parade-ps8640: Reorg the macros
To: Philip Chen <philipchen@chromium.org>
Cc: LKML <linux-kernel@vger.kernel.org>, Stephen Boyd <swboyd@chromium.org>, 
 Philip Chen <philipchen@google.com>, Andrzej Hajda <a.hajda@samsung.com>, 
 Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@linux.ie>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, Jonas Karlman <jonas@kwiboo.se>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Neil Armstrong <narmstrong@baylibre.com>, Robert Foss <robert.foss@linaro.org>,
 dri-devel <dri-devel@lists.freedesktop.org>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Fri, Aug 20, 2021 at 4:22 PM Philip Chen <philipchen@chromium.org> wrote:
>
> From: Philip Chen <philipchen@chromium.org>
>
> Reorg the macros as follows:
> (1) Group the registers on the same page together.
> (2) Group the register and its bit operation together while indenting
> the macros of the bit operation with one space.
>
> Also fix a misnomer for the number of mipi data lanes.
>
> Signed-off-by: Philip Chen <philipchen@chromium.org>
> Signed-off-by: Philip Chen <philipchen@google.com>
> ---
>
>  drivers/gpu/drm/bridge/parade-ps8640.c | 18 ++++++++++--------
>  1 file changed, 10 insertions(+), 8 deletions(-)

This seems fine to me other than the slightly mixed up Signed-off-by
lines. I think that the git config from wherever you ran "git
send-email" had your @google.com address even if you authored the
patch with your @chomium.org address. Once that's fixed then I'm happy
to add my Reviewed-by and (unless someone objects) I'll plan to apply
this patch to drm-misc-next.

-Doug
