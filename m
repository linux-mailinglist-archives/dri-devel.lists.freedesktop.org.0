Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4067A1F6CE0
	for <lists+dri-devel@lfdr.de>; Thu, 11 Jun 2020 19:36:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CE2E46E92A;
	Thu, 11 Jun 2020 17:36:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x231.google.com (mail-oi1-x231.google.com
 [IPv6:2607:f8b0:4864:20::231])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 260CF6E92A
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Jun 2020 17:36:33 +0000 (UTC)
Received: by mail-oi1-x231.google.com with SMTP id p70so6106904oic.12
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Jun 2020 10:36:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=jrCOk7vsq1IE7uGd57AzoLSP1ALvkvtrfTao0LV5h+4=;
 b=PjCLvAgUk17O5rGvaRSULcAXIKgAeNPYfQj4+nc/jEDzvDt79xSOJ9y90gnyDsej57
 d6kv8CTeKJDW3tgsSbIhUH7B684pz0QDJS1PAC3ELlVYxup3lQZTLhIejtwsgQQWCbBm
 whcIjLz3Q4YA0rJbpmM7ez8cXb5PsSzB5hLw90jsFbfweSA0DgsHHTj0a3UpXNkTiXsK
 FHCNP6NH+PXkniJe6PD0IrUkKYLC/AfJYgTbByfESpbB7Eh6RWa3w2B8JexkbcgtqPsr
 BKFM8ErfoR7rUDwZJTpr2FypGZPTKX734j7VFNPPb3SuZIWCuP8HJJ3I2VIKp5nax4vd
 X7rA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=jrCOk7vsq1IE7uGd57AzoLSP1ALvkvtrfTao0LV5h+4=;
 b=WwWjHedSOS0a2wtkA1qL29oIgtZtDWH9f9zU/V0JSaAo6To3d6vN3e2uiIeC1G2MM+
 ItzJF2BQkxHa5N9E4Uc2VKcCdVxt8tqdEDiUuJBznEoUdWDgAPCpIzkpC+dUN7/PhfhM
 IZd9imZBpQFGryg8eVbOdZxxFjFrzscxu+dTuELzltcRSWSRuuBDLdYtow22Eu1Qr2z/
 MIy6yWW+H+E62nPga8FQ2Z6hv/orcMviYo1XQaKrwYmXY4c2nCZ34fh0kXF/bgkv01bg
 ZqfrN7+gOrZDpR3ssnI1KVibcfDsZ2fLQQsKUYsCEAmMUOPXBlOror1sJDKCnja0fZHy
 LcGg==
X-Gm-Message-State: AOAM5306xKE7Tv0EyE9bvjnZo/JfSowb657WCDy3gVDwFM+vzk0zRxMe
 wFwfhXC1P5Y9S2fsnlz8gmJ+3Pqf3yrjD3BJyAKP2Q==
X-Google-Smtp-Source: ABdhPJzBOdT+Dsmoz25Sk2BkH7lQgOo+1veTThTfIOcpemZoPqBRr3Bokq20sHjcYAD8NriytacdHguqDLTVuu4eLUw=
X-Received: by 2002:aca:2108:: with SMTP id 8mr7354040oiz.10.1591896992417;
 Thu, 11 Jun 2020 10:36:32 -0700 (PDT)
MIME-Version: 1.0
References: <1591880115-12721-1-git-send-email-mkrishn@codeaurora.org>
In-Reply-To: <1591880115-12721-1-git-send-email-mkrishn@codeaurora.org>
From: John Stultz <john.stultz@linaro.org>
Date: Thu, 11 Jun 2020 10:36:21 -0700
Message-ID: <CALAqxLWnXD4XzGU=7mkLCyAkN1ONB=NRne9y8PxPWGZg4hgX8Q@mail.gmail.com>
Subject: Re: [v1] drm/msm/dpu: request for display color blocks based on hw
 catalog entry
To: Krishna Manikandan <mkrishn@codeaurora.org>
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
Cc: "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 lkml <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Doug Anderson <dianders@chromium.org>, Sean Paul <seanpaul@chromium.org>,
 abhinavk@codeaurora.org, Kalyan Thota <kalyan_t@codeaurora.org>,
 hoegsberg@chromium.org, freedreno@lists.freedesktop.org,
 Matthias Kaehlcke <mka@chromium.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Jun 11, 2020 at 5:55 AM Krishna Manikandan
<mkrishn@codeaurora.org> wrote:
>
> From: Kalyan Thota <kalyan_t@codeaurora.org>
>
> Request for color processing blocks only if they are
> available in the display hw catalog and they are
> sufficient in number for the selection.
>
> Signed-off-by: Kalyan Thota <kalyan_t@codeaurora.org>

Tested-by: John Stultz <john.stultz@linaro.org>

Thanks so much for the quick fix!
-john
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
