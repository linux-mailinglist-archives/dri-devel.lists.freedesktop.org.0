Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A5C9B5B6146
	for <lists+dri-devel@lfdr.de>; Mon, 12 Sep 2022 20:48:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5551910E152;
	Mon, 12 Sep 2022 18:48:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com
 [IPv6:2a00:1450:4864:20::12d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ED2E710E152
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Sep 2022 18:48:25 +0000 (UTC)
Received: by mail-lf1-x12d.google.com with SMTP id z25so16381250lfr.2
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Sep 2022 11:48:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date;
 bh=ajtCtNcs3weh6Y8N5o6lcKpUrALT4dcANWcW4NXZ6zE=;
 b=P/NMHCqKPibLKjl1SPZZBdBqH5dotxf3enKihGybHwv8/O9ykWM7srH1b9b8iLpPBN
 IHQYSEVR3ajiMG7+YhlxNjQHzfwRFVAF1kZTQXAEtf5CD268GiBdDD8L1d1RayQcAon3
 WtUH8cY8xntBhhBWcy/KN/D2nZyA9FyjM+/dU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date;
 bh=ajtCtNcs3weh6Y8N5o6lcKpUrALT4dcANWcW4NXZ6zE=;
 b=glQRx7ojmoFU532IEL7am4GVT9qzgTChezRCaNHzQsHtKVqpANcbosUYoQlXmrvdY5
 xbt7R3aPFozrLYMlljOmWf89igy05ZEvPzFWuH0q9j+KlC1/8rosfHVGyHN4VdH+/Vh3
 SLUq/xfnqW9SJ4f/+JpKgFn9W+53AY3BdengUoWtv4SW3pGC5xpp8azmbw14yTfz7hmG
 EPLUy3C9GAqCh6UHqy7tflTlNqIUx7vVlfiZmPQWpNGKBz+N6Ihq89TMKaRXOG1kLXzN
 ArxpkXtlB4sodgsI25KTR7OlfjQiNKRzo25qG+4Xwv1aTMMAvu4onBU77Qib1glV+ir9
 UZaw==
X-Gm-Message-State: ACgBeo0MXJz5750bkTDe07GsiRxlySpT8WlUii9CoCGlnaV2Xo94DCzZ
 PnblVwwxhCq2sHFamGixP6XF3j8b32Oa6w==
X-Google-Smtp-Source: AA6agR77sgSNjPBp0THu42KUMiC49LX0a7lfVvwLlnJtoHXLI2Xlxkna9san/bLqV4LK6F+7olHH8w==
X-Received: by 2002:a05:6512:3113:b0:497:abbf:493d with SMTP id
 n19-20020a056512311300b00497abbf493dmr9509091lfb.310.1663008504108; 
 Mon, 12 Sep 2022 11:48:24 -0700 (PDT)
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com.
 [209.85.167.43]) by smtp.gmail.com with ESMTPSA id
 l23-20020a194957000000b004946c3e4470sm1208572lfj.133.2022.09.12.11.48.22
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 12 Sep 2022 11:48:22 -0700 (PDT)
Received: by mail-lf1-f43.google.com with SMTP id a3so4351171lfk.9
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Sep 2022 11:48:22 -0700 (PDT)
X-Received: by 2002:a05:6512:2303:b0:49b:ec39:c4ab with SMTP id
 o3-20020a056512230300b0049bec39c4abmr103166lfu.512.1663008502265; Mon, 12 Sep
 2022 11:48:22 -0700 (PDT)
MIME-Version: 1.0
References: <20220822180729.1.I8ac5abe3a4c1c6fd5c061686c6e883c22f69022c@changeid>
 <CAD=FV=W5X2XvvKT5tq+1ywJSmVB0TAHquGgn02uNmn4s-sqndg@mail.gmail.com>
 <CA+ASDXMetKHtL8Hm_=S7xPcHX19FDaCoXtHmh=E6i6pLEXQZ0g@mail.gmail.com>
In-Reply-To: <CA+ASDXMetKHtL8Hm_=S7xPcHX19FDaCoXtHmh=E6i6pLEXQZ0g@mail.gmail.com>
From: Brian Norris <briannorris@chromium.org>
Date: Mon, 12 Sep 2022 11:48:09 -0700
X-Gmail-Original-Message-ID: <CA+ASDXOMYGgaJSrxQUNFhN+9qT-kfedk_UJJnOO58iJpWdxu1w@mail.gmail.com>
Message-ID: <CA+ASDXOMYGgaJSrxQUNFhN+9qT-kfedk_UJJnOO58iJpWdxu1w@mail.gmail.com>
Subject: Re: [PATCH] Revert "drm: bridge: analogix/dp: add panel
 prepare/unprepare in suspend/resume time"
To: Doug Anderson <dianders@chromium.org>,
 Zhang Zekun <zhangzekun11@huawei.com>
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
Cc: Neil Armstrong <narmstrong@baylibre.com>,
 LKML <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, xuqiang36@huawei.com,
 Robert Foss <robert.foss@linaro.org>, Andrzej Hajda <andrzej.hajda@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Aug 25, 2022 at 11:06 AM Brian Norris <briannorris@chromium.org> wrote:
> On Thu, Aug 25, 2022 at 10:37 AM Doug Anderson <dianders@chromium.org> wrote:
> > Given that this is _not_ an area that I'm an expert in nor is it an
> > area where the consequences are super easy to analyze, I'm a little
> > hesitant to apply this to drm-misc-next myself. Ideally someone more
> > familiar with the driver would do it. However, if nobody steps up
> > after a few weeks and nobody has yelled about this patch, I'll apply
> > it.

For this particular patch, I'd be interested in whether Zhang Zekun
has any feedback (even a Tested-by?), since they were patching this
function in the first place, which is why I paid attention:

Subject: [PATCH -next] drm/bridge: Add missing clk_disable_unprepare()
in analogix_dp_resume()
https://lore.kernel.org/lkml/20220816064231.60473-1-zhangzekun11@huawei.com/

But in absence of that...it has now been a few weeks :)

I'll also mark this to come back to again in a week or two, in case
somebody is still hoping to wait longer.

Regards,
Brian
