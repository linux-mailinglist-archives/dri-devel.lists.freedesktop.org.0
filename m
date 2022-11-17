Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FC9962E2A5
	for <lists+dri-devel@lfdr.de>; Thu, 17 Nov 2022 18:13:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 87FEF10E19F;
	Thu, 17 Nov 2022 17:12:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x102f.google.com (mail-pj1-x102f.google.com
 [IPv6:2607:f8b0:4864:20::102f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0FDBC10E19F
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Nov 2022 17:12:54 +0000 (UTC)
Received: by mail-pj1-x102f.google.com with SMTP id
 k2-20020a17090a4c8200b002187cce2f92so782103pjh.2
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Nov 2022 09:12:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=1R822jcgCiPh3CxEI4LZqZZ6f8Tc9V1v0R26xcOw7ZM=;
 b=KDavSi0mdYdPpqiYNYkyB6ALcKpDiqvA6qoBp6uo6WPci0B62WhYU+tEdx9RvVST13
 nElxU5sXpxk3vxdRv+MV45hsoF0ryXbvYsAViuobUqZoG9JbGFahBbsKCrbMj5XI9nC5
 FJGIZdApp0fONaw//XhTp7kkKzXF8Y5TisIVs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=1R822jcgCiPh3CxEI4LZqZZ6f8Tc9V1v0R26xcOw7ZM=;
 b=05FcO8QXQZpR0qmsnhqqk/w7d7f919xcsyY2hbZ7JpTWTISES6r3wEB2AxmJ433U+b
 G19MMh6C1OiRB0fbX94FTiyuvmqmLqE3PuIcuyubjhthT+7DdcHEzepT9RIrP8U7CiuK
 ww1LUOaT7CnEhrsWsHL48LH3G0NJNuYKINI+6MggHzxAkvZibR45WJH5og5yGCrJeIgF
 e/pISAAsQN9XaWRGvpqb+CIMi71JiPN3EGRLsNdh7X9k4T+QoqS34RwL5TgymVZvk/O/
 GffKSNbFwqgGNVUVZoDM+2QiaEwQsnIuNxmCSDSm0Evzdn0eg4dmNML0Zii9qpPrCmIs
 NXKg==
X-Gm-Message-State: ANoB5pnZePP2AfKijFqXGAAx4Ms70kN1chQszQFA6LhjokPlAZcCNb0/
 8dW2pIceruNCmnOBComQeXcMNhCZfvohw+PIGS8dhA==
X-Google-Smtp-Source: AA0mqf4Sr75qf5iJL/dTTs3yLXtqkRa5F/ANwcf6gxNnYDL3LMROj1R4pCZt6TEyz7OGaduAq6Tj4R9nhmFejgKpai4=
X-Received: by 2002:a17:90a:5317:b0:213:34f7:fb14 with SMTP id
 x23-20020a17090a531700b0021334f7fb14mr9449761pjh.25.1668705173302; Thu, 17
 Nov 2022 09:12:53 -0800 (PST)
MIME-Version: 1.0
References: <20221117110804.1431024-1-hsinyi@chromium.org>
 <CAD=FV=VEC=GzkDfaOqauBB5Y79teS1ENA5wFUHZmnTRkg6Z4tg@mail.gmail.com>
In-Reply-To: <CAD=FV=VEC=GzkDfaOqauBB5Y79teS1ENA5wFUHZmnTRkg6Z4tg@mail.gmail.com>
From: Hsin-Yi Wang <hsinyi@chromium.org>
Date: Fri, 18 Nov 2022 01:20:19 +0800
Message-ID: <CAJMQK-gQj83N1MBu1s+_YDJ4qbqN4McSqCnOwWAq4iaNXo5Sfg@mail.gmail.com>
Subject: Re: [PATCH v6 1/3] drm_bridge: register content protect property
To: Doug Anderson <dianders@chromium.org>
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, Allen Chen <allen.chen@ite.com.tw>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Sean Paul <seanpaul@chromium.org>, Robert Foss <robert.foss@linaro.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Nov 17, 2022 at 11:57 PM Doug Anderson <dianders@chromium.org> wrote:
>
> Hi,
>
> On Thu, Nov 17, 2022 at 3:08 AM Hsin-Yi Wang <hsinyi@chromium.org> wrote:
> >
> > Some bridges are able to update HDCP status from userspace request if
> > they support HDCP.
> >
> > HDCP property is the same as other connector properties that needs to be
> > created after the connecter is initialized and before the connector is
> > registered.
> >
> > If there exists a bridge that supports HDCP, add the property to the
> > bridge connector.
> >
> > Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
> > Reviewed-by: Sean Paul <seanpaul@chromium.org>
> > Reported-by: kernel test robot <lkp@intel.com>
>
> Not sure it's worth spinning for, but FWIW I wouldn't put
> "Reported-by: kernel test robot <lkp@intel.com>". The emails from that
> bot are always a bit confusing in this regards, but I think they mean
> "if the patch has already landed and you're sending a separate patch
> with a fix then please add the "Reported-by" tag". ...but adding it to
> the original patch just doesn't make a lot of sense.

Got it, thanks. I think I'll wait for a while to see if there's other
comments. Otherwise should I send another version to remove the tag?
