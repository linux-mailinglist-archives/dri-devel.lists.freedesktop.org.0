Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D989F5EC74F
	for <lists+dri-devel@lfdr.de>; Tue, 27 Sep 2022 17:12:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B33EC10E397;
	Tue, 27 Sep 2022 15:12:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com
 [IPv6:2a00:1450:4864:20::62c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5C9BC10E397
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Sep 2022 15:12:12 +0000 (UTC)
Received: by mail-ej1-x62c.google.com with SMTP id lc7so21492531ejb.0
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Sep 2022 08:12:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date;
 bh=rIT3T5nfBfgdp3S4can3yr3bG6afRaMGveOO8LpJvUg=;
 b=IhYS23hpFcbaqZ/GqGoEc1aJLXR/HRxP6hJ3bg3cz4cFAyBAS4m86GpiY63Uz6cp4k
 +cDxOVK589bGTZR6jQTIWkOpxy0lj2J5bUo9eIXjqs/FK85lbDWg6Zk/3ExsvFSw7F62
 m7syMyxV6oqDzZji0DSbITIUEFU6ZICV+qB14=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date;
 bh=rIT3T5nfBfgdp3S4can3yr3bG6afRaMGveOO8LpJvUg=;
 b=JPx0TkROxKh7peAXr657vU2ygp2NuqTMMYAV4tklPZpRJwMpjf6T5mlvLUN+eyyO2P
 Zo8xLDVs5RP7hnj9IWunFoK/bBZULCabTxndrd/oULolwZFE6FQxCpyJQsfHJbwYXCQ8
 4jEzyqZ4TATD2tvglV7TZeMH/tdJBcApV0ThtCMnmOJOYEDKy6uaw7yQZJgWQKthU1ak
 4cCNTqbL9BpEL7wsf6dzta8sabmgSgy9vw7M3M8xmnu8OAoaIS8POrgyRnVFABPHWBR9
 CvNBk9P5J11VHFbD4ZEeXvlYUeCPlW2f4O+UvKgLslpupUrkAS4krY6tug1XJCt/JZrO
 +8uQ==
X-Gm-Message-State: ACrzQf1vYU+PsdDqgiHnvA+bHA/el0RkTD0Z+2A9Xl2qBwdcq9n66rxr
 Jh7W36F9n2OrpTkSFTr81QvNFgiagPnTIEsh
X-Google-Smtp-Source: AMsMyM7Qpghr0YhwueFXHwOfyKdcjhyhs2Qugrd30l+SPyJPvGrSvk6n+8fxzp7l3VAJh3H0wVx/NA==
X-Received: by 2002:a17:907:78a:b0:782:2223:a7cd with SMTP id
 xd10-20020a170907078a00b007822223a7cdmr22629647ejb.532.1664291530620; 
 Tue, 27 Sep 2022 08:12:10 -0700 (PDT)
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com.
 [209.85.221.49]) by smtp.gmail.com with ESMTPSA id
 e24-20020a170906375800b0077077b59085sm917210ejc.184.2022.09.27.08.12.09
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 27 Sep 2022 08:12:09 -0700 (PDT)
Received: by mail-wr1-f49.google.com with SMTP id x18so15481179wrm.7
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Sep 2022 08:12:09 -0700 (PDT)
X-Received: by 2002:adf:f90d:0:b0:20c:de32:4d35 with SMTP id
 b13-20020adff90d000000b0020cde324d35mr17074684wrr.583.1664291528783; Tue, 27
 Sep 2022 08:12:08 -0700 (PDT)
MIME-Version: 1.0
References: <20220927021021.488295-1-sean.hong@quanta.corp-partner.google.com>
In-Reply-To: <20220927021021.488295-1-sean.hong@quanta.corp-partner.google.com>
From: Doug Anderson <dianders@chromium.org>
Date: Tue, 27 Sep 2022 08:11:55 -0700
X-Gmail-Original-Message-ID: <CAD=FV=X9KmnAkj2PeDWzBYUk=Eq9JH7kcPDubVGOCOQewE3i5Q@mail.gmail.com>
Message-ID: <CAD=FV=X9KmnAkj2PeDWzBYUk=Eq9JH7kcPDubVGOCOQewE3i5Q@mail.gmail.com>
Subject: Re: [PATCH] drm/panel-edp: Fix delays for INX N116BCN-EA1 (HW: C4)
To: Sean Hong <sean.hong@quanta.corp-partner.google.com>
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
Cc: David Airlie <airlied@linux.ie>, LKML <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Mon, Sep 26, 2022 at 7:10 PM Sean Hong
<sean.hong@quanta.corp-partner.google.com> wrote:
>
> This panel has the same delay timing as N116BCA-EA1. So, fix the
> delay timing from delay_200_500_p2e80 to delay_200_500_e80_d50.
>
> Signed-off-by: Sean Hong <sean.hong@quanta.corp-partner.google.com>
> ---
>  drivers/gpu/drm/panel/panel-edp.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Please include "Fixes" tags for patches like this, like:

Fixes: 9f4a57148120 ("drm/panel-edp: Add INX N116BCN-EA1")

In any case, this looks OK:

Reviewed-by: Douglas Anderson <dianders@chromium.org>

Pushed to drm-misc-next:

8397d2984528 drm/panel-edp: Fix delays for INX N116BCN-EA1 (HW: C4)
