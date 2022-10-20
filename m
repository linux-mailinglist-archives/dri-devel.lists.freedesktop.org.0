Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 21917606893
	for <lists+dri-devel@lfdr.de>; Thu, 20 Oct 2022 21:02:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7C48810E4DD;
	Thu, 20 Oct 2022 19:02:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x82c.google.com (mail-qt1-x82c.google.com
 [IPv6:2607:f8b0:4864:20::82c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BAFB710ED22
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Oct 2022 19:02:37 +0000 (UTC)
Received: by mail-qt1-x82c.google.com with SMTP id f22so240694qto.3
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Oct 2022 12:02:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=MFeXXJ6sQN07sTc4bebyU3JZBZRL/EnosXd0tePVziU=;
 b=S+ykdCtQJzepC6nF6XQ9cWi9wozt6rHNW8TF745ZRDRMGmrCLxN6mNJ257A4cDROqm
 vIN/BvtQoMRHA5S5izciwsVOaYJGaOqhhHjuIa76O+wy1vUajyldp0BLTtyRuEQvAFjq
 Lphr9W8gywol8GahXC/v4krENPSshlJQANyMIX5MGgbxSD07Fii8kfFTB8vvoJm5OmLF
 nDA03H8McLFeK6f1T7Z8Xf3k7/YH1333cDeLlvqllaTS0/ZicDv3mjdSXz0JCV3S0yYV
 x44kDiXhkAjplA7zc0gBthSE7gM3YP+UDYzPOAiqTIYjM6hKOg6feaiQRMS3I6MmdkLJ
 fnkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=MFeXXJ6sQN07sTc4bebyU3JZBZRL/EnosXd0tePVziU=;
 b=Dn2idH06TsilruNX3KMnHQOnZHnK44CUPUpDcdFI2uRekaXQ+sGIQK9exggsaGB2m6
 5jpUaPDWnbZfG1F5e6hvitE1DQyQ8jgs8q33h6WrGE4IghxSIMEoC42XoOfJwhUtxXO+
 9twcLC4u9r11NHZG+9M8+XGa6LCv06EwakqAx2HKL15j2NYLKcwwYoU8FzxdP137R3pa
 r91QRHXw9oXipRHzLHRMGzj30WctIrLehXFDMJbNOub6zGNMywld8e9Qqo1mVe56T9jc
 yQHQF2FuhVEWIgtnf6FM/lN9ngSa4f/3+fWCdnMhHjztky/1upX4f7jXH5L3o3/YBIvi
 AC3w==
X-Gm-Message-State: ACrzQf3E0OWYiYNA2AQk1hwEm3kEKrH/VX7y99aMwe96otbQSBssaHB/
 kwC1VJnl6AwOH2ANatCAjX70OKvtfusRDPfo868+hjnOmTo=
X-Google-Smtp-Source: AMsMyM6y+AJHCvbv0IPJE0/Hh7sdQmuBvukUOwm985kFRDmvZONoLPfVA6+KkteJ3sbJ70oQ4Yrxq/7n/IUkfy7Nsbo=
X-Received: by 2002:a05:620a:2552:b0:6ca:bf8f:4d27 with SMTP id
 s18-20020a05620a255200b006cabf8f4d27mr10453489qko.383.1666292546472; Thu, 20
 Oct 2022 12:02:26 -0700 (PDT)
MIME-Version: 1.0
References: <20221020175334.1820519-1-maciej.kwapulinski@linux.intel.com>
 <20221020175334.1820519-5-maciej.kwapulinski@linux.intel.com>
 <CAHp75VeFDYjmoJzbC5z8Kf=xYxsVASxjwGBB3OPvBMMPsQDjtw@mail.gmail.com>
In-Reply-To: <CAHp75VeFDYjmoJzbC5z8Kf=xYxsVASxjwGBB3OPvBMMPsQDjtw@mail.gmail.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Thu, 20 Oct 2022 22:01:50 +0300
Message-ID: <CAHp75VcWnZSxgyA0dYGGbwyMYOv1-Zyy_f63_z2yT3ZS8W+MEg@mail.gmail.com>
Subject: Re: [PATCH v5 04/10] gna: initialize MMU
To: Maciej Kwapulinski <maciej.kwapulinski@linux.intel.com>
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
Cc: Mikolaj Grzybowski <mikolajx.grzybowski@intel.com>,
 Arnd Bergmann <arnd@arndb.de>, Jonathan Corbet <corbet@lwn.net>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Dragan Cvetic <dragan.cvetic@xilinx.com>, linux-doc@vger.kernel.org,
 Tomasz Jankowski <tomasz1.jankowski@intel.com>,
 dri-devel@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>,
 Derek Kiernan <derek.kiernan@xilinx.com>,
 Jianxun Zhang <jianxun.zhang@linux.intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Oct 20, 2022 at 10:00 PM Andy Shevchenko
<andy.shevchenko@gmail.com> wrote:
> On Thu, Oct 20, 2022 at 8:57 PM Maciej Kwapulinski
> <maciej.kwapulinski@linux.intel.com> wrote:

...

> > +       desc_size = round_up(gna_priv->info.desc_info.desc_size, PAGE_SIZE);
>
> PFN_UP() ?

Or PFN_ALIGN() ?

-- 
With Best Regards,
Andy Shevchenko
