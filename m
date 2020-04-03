Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 58DBC19DCEB
	for <lists+dri-devel@lfdr.de>; Fri,  3 Apr 2020 19:39:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8AC6E6EC48;
	Fri,  3 Apr 2020 17:39:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x241.google.com (mail-lj1-x241.google.com
 [IPv6:2a00:1450:4864:20::241])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7AB476EC48
 for <dri-devel@lists.freedesktop.org>; Fri,  3 Apr 2020 17:39:01 +0000 (UTC)
Received: by mail-lj1-x241.google.com with SMTP id q19so7751733ljp.9
 for <dri-devel@lists.freedesktop.org>; Fri, 03 Apr 2020 10:39:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=anholt-net.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=0K9eZsccyGUqFYcHU/IoIwlTnYYNR7yq7lrMKfDJmYY=;
 b=FKH72XXHJzcFHs7y+nHq6SfiQSNx5cl2T/V6hihSHhw2NdUCTXAWPkrDOsEGOH+02Q
 tXfK1grJm8nUCcEam947N3gD7BOYVTDkcxR6E8GHtPNw60b7rca4NwhtT/Snxpth57Wu
 eYvlY2cBqoZjdsQoYnVZWKsg1GpGDKt3TxjaohTR740GT/F8Qiqk7xFDALo23KtkRqyq
 C8JbuunuAmQ+ubfkT/Pv5bxHfY4U3JBWZUbon0Xc9NXvlrcObKeLfFvWQE5QL2GWUX9i
 Zsv0V7qs2cnOMlbsR3OdBhoRP8teTR/nXS2kZg/aVHbXmVkp4oCRtJaKcT8O6pEhmABD
 3IAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=0K9eZsccyGUqFYcHU/IoIwlTnYYNR7yq7lrMKfDJmYY=;
 b=K22nXQ0Bj8qDP/djJND3RfEjjXYOv1w8nHaL+xfQcXkU/pUsJO2WJ2qpAKnu9rRy2a
 roFFCehmmHk/LdHfiVU8IJ9k99oT626yprnrKWscVyDuTGoRHvNO3uc6UjAdrhHrUI6j
 UNZdB/PGkbMN97xXD9TuYKBP6wZGIqpYp1+i2zS/9LM2mJVrKjM8dmgJ/7Y82N96kqob
 uWb1z9CP03Gt5xnBI+dHcBjYIIR3XDrfweRTcML7//XaXfIy96zKDz02f2vhROf5bG2Y
 AAo7YuhqzNK37iyQI+GbeCQm4RHlxkGbSRVjEuXQUF3dGFyt6e2LkouEU6uNhavTp/AY
 HZ1Q==
X-Gm-Message-State: AGi0PuZFaE/a8k9d/d5xlVO0tCSM0QJ1XQMCdxfDX6W1Md611VAiLYFV
 PYC3O/ZO9J9c2f6T5FjNYZCfYg/6NcUdyfxOGjjbGeab
X-Google-Smtp-Source: APiQypIKoBdeftEGeZvmr3/GqxkRJdQkQROnMB5wbsUQQsL/E3vMV2vztxxbkFwGtsat4Po4+ffhCGuXhYqHUnN+csQ=
X-Received: by 2002:a2e:9718:: with SMTP id r24mr5144221lji.287.1585935539987; 
 Fri, 03 Apr 2020 10:38:59 -0700 (PDT)
MIME-Version: 1.0
References: <20200403135828.2542770-1-daniel.vetter@ffwll.ch>
 <20200403135828.2542770-25-daniel.vetter@ffwll.ch>
In-Reply-To: <20200403135828.2542770-25-daniel.vetter@ffwll.ch>
From: Eric Anholt <eric@anholt.net>
Date: Fri, 3 Apr 2020 10:38:48 -0700
Message-ID: <CADaigPUwpL=vCf3YrRV9-RpVdGvY=ELopUrVaOri0MZxLZ3thA@mail.gmail.com>
Subject: Re: [PATCH 24/44] drm/hx8357d: Use devm_drm_dev_alloc
To: Daniel Vetter <daniel.vetter@ffwll.ch>
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
Cc: Daniel Vetter <daniel.vetter@intel.com>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 DRI Development <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Apr 3, 2020 at 6:59 AM Daniel Vetter <daniel.vetter@ffwll.ch> wrote:
>
> Already using devm_drm_dev_init, so very simple replacment.
>
> Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>

Acked-by: Eric Anholt <eric@anholt.net>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
