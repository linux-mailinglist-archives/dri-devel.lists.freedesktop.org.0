Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A2484F56D9
	for <lists+dri-devel@lfdr.de>; Wed,  6 Apr 2022 09:36:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B2E4110F508;
	Wed,  6 Apr 2022 07:36:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x531.google.com (mail-pg1-x531.google.com
 [IPv6:2607:f8b0:4864:20::531])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1A2BA10F508
 for <dri-devel@lists.freedesktop.org>; Wed,  6 Apr 2022 07:36:47 +0000 (UTC)
Received: by mail-pg1-x531.google.com with SMTP id q19so1520216pgm.6
 for <dri-devel@lists.freedesktop.org>; Wed, 06 Apr 2022 00:36:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=bBkJiLuPHjOc9NWEYiRCYWyb3Lk5w/JeF/xlR5gs4hs=;
 b=YFbbcWhLrIQiF1+6PHpsstMvedJMKsyUdVbwOSE5Jv5LsHhfx0glQxkm3++FnDzv04
 LYQYaYWej7V5SXpmEJvWuR537StZYvls37Kxndpmp/3su25zybk7xG1vWl4qiFgj0BNr
 N5SzzMS4goMIOlEcOJHz2nTNAQHZEyFOy5sTuG6/YXCjoHqfLtO/3QRoqQlGD9zHJHZq
 6GrNzNqLmnWNjYjrU0A4rTQsrWPD+pRdzk+ZkvDW02hAIKNhLXVHQaR1xGAL6iVQMuhv
 juiE005RBlZIHgDUhOjyajJx7s+FlQT9V5txMBAYQVMptZWrbfc4k8LKWrib9OfROvcC
 iX7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=bBkJiLuPHjOc9NWEYiRCYWyb3Lk5w/JeF/xlR5gs4hs=;
 b=xRtSwhuaPb5O5kH0xNbP8E0r2X5GJJcRO7OpfOQAdcT4f8REEZyRxuBTM657043JcI
 7iC0gSrPykANBtosg1pMzVvMXdvVtDVhgbWRmgstp/HP8kvScLsoVlo7FhVTczqYwLWE
 aC7yxtdN6uRBx9CudBHYC92UG2sVsKr+WAKSTEsHtTncsb/gnRcG75nmPOoNP1qxUQ9k
 iI5ANv+hyashL9wS1lwQFapOOY7RpTEp5gCJKs7z+pqfwVrBtUvdwwWLV8+LfUz2cOaV
 2osxKFqhWi7uyfjwT7wtiXE9LKIJ0sFw/D2IyRcS2YYv8tBHBh8L+KR4Rx+Lqtf0eB6k
 Kb+w==
X-Gm-Message-State: AOAM530UpZU1PVDgRXqcEnzWQ7UC3Kh8ACXnPLhkbCEOk1RP8sQoXg+x
 2h/7tgL2CVJNDlv7zbx9dexsCcTEMRrRMQfExE80AA==
X-Google-Smtp-Source: ABdhPJzDlXAqdXyJmzlyqhZzt4gotOVEw9vpY/kAHpMA21l6uadwNlKjnJyvsTIKuRVX7bsm7J3/f8KYBijEG3MKDWM=
X-Received: by 2002:aa7:9110:0:b0:4fa:e388:af57 with SMTP id
 16-20020aa79110000000b004fae388af57mr7435754pfh.1.1649230606699; Wed, 06 Apr
 2022 00:36:46 -0700 (PDT)
MIME-Version: 1.0
References: <20220406014250.902187-1-marex@denx.de>
 <CAG3jFyuDzKW3fKSZMob3idBWGk3S8jmGVw83p7Rnm02ouyy0Pg@mail.gmail.com>
In-Reply-To: <CAG3jFyuDzKW3fKSZMob3idBWGk3S8jmGVw83p7Rnm02ouyy0Pg@mail.gmail.com>
From: Robert Foss <robert.foss@linaro.org>
Date: Wed, 6 Apr 2022 09:36:35 +0200
Message-ID: <CAG3jFyv5Cm1oRbu4fy3idDWpOM1aBdwNp4V1B+LGvztwbc_KOQ@mail.gmail.com>
Subject: Re: [PATCH] drm: bridge: icn6211: Mark module exit callback with
 __exit
To: Marek Vasut <marex@denx.de>
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
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, dri-devel@lists.freedesktop.org,
 Jagan Teki <jagan@amarulasolutions.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Sam Ravnborg <sam@ravnborg.org>,
 Maxime Ripard <maxime@cerno.tech>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Applied to drm-misc-next.
