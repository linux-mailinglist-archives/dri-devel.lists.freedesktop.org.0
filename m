Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B2D01164996
	for <lists+dri-devel@lfdr.de>; Wed, 19 Feb 2020 17:12:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CF1FB6E3F3;
	Wed, 19 Feb 2020 16:12:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x241.google.com (mail-lj1-x241.google.com
 [IPv6:2a00:1450:4864:20::241])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 827926EC31
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Feb 2020 16:12:52 +0000 (UTC)
Received: by mail-lj1-x241.google.com with SMTP id o15so956610ljg.6
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Feb 2020 08:12:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Hmg0e58Llvdw4Inqfn8X80e2eYeLDQtQXiBtM6n4esA=;
 b=e3Ih6Ny7chpcs5sdZ2gyHR5JBlDADKpsBnoUtVzlLjOR8EE1yAK3JN5lvyRAkW3IsY
 zF51RXn0Na9NQ/iyqpxyrrlV9BG1A3xDcQOimhV4zxRWufgowK+ub22zIS+HqLN8eZ/e
 RKp0KxrRqopgAyEoBiuVL5hUkCNmF6nGweEynoWWLAlIbEQAcIwQKYRnCJoVBs2uzABp
 +TlDDgUmLRUsY/L4u+AZ2PlEMypG54MBbs1peSMRjbqRkALurkVxZWCGkFpnUFgvnwbg
 BcwiKTNS44gGcNJ7LrJJqRR/hsRKS6pa0dFeDkj16mZYvJj52FNj1bMvhW1W49YBaA3J
 lENA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Hmg0e58Llvdw4Inqfn8X80e2eYeLDQtQXiBtM6n4esA=;
 b=sw0xdpWEhnnBj5ER5zvrzbS/g7/lxuvFX5ygFFf/Sdb80WTvw9bY6lSZZ3NsP5uT+7
 PWVVBWR6/4Pdo4g/lCCbVD/Fp2d24uDU9kGRCmmErxJXDH0mfE4JnfYmksMEjRltCmAw
 9zN05BIFfjFXEO20Siy8p890eBGoQaNMLwYCW9p1ZQyxJV0h3Dhw2v5XqtPgnHgW8c+j
 J1lMx6/0N3XXQ8kjDSGIRxOP8A4XuJGg1QRkobKWPOLLvPX80vrMTkweG7YRpiIzQmcY
 aAiARw85k6+e4zfQqBt7V9WDmP+7WTTh6GnH2Wf9or/fMNGgC7G1wqfrToiIdOQMKLl6
 LdNQ==
X-Gm-Message-State: APjAAAXMlOcS8Gx5NFQIYtrC1Xg91ciTQwGR9TQNMgGxUDiTTHRfYL2Q
 MTkoB/GFJB6hfKhmPPekzxrThlDAft0FiQb7rEihug==
X-Google-Smtp-Source: APXvYqwqmbvk7o9JHtK1u30MtYBrhvUHNeAQS8pEmYYwQ50AlZQhBSsFNdDZi83HjOLzGAxdZDoy3Pvw8WWyxWisQZc=
X-Received: by 2002:a2e:b6ce:: with SMTP id m14mr15179637ljo.99.1582128770966; 
 Wed, 19 Feb 2020 08:12:50 -0800 (PST)
MIME-Version: 1.0
References: <20200219102122.1607365-1-daniel.vetter@ffwll.ch>
 <20200219102122.1607365-34-daniel.vetter@ffwll.ch>
In-Reply-To: <20200219102122.1607365-34-daniel.vetter@ffwll.ch>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 19 Feb 2020 17:12:39 +0100
Message-ID: <CACRpkdZk93zL1e3NpCXa+NQ+uLGU5TOTC4PCf81QQNK=1u-q3Q@mail.gmail.com>
Subject: Re: [PATCH 33/52] drm/mcde: Drop explicit drm_mode_config_cleanup call
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

On Wed, Feb 19, 2020 at 11:22 AM Daniel Vetter <daniel.vetter@ffwll.ch> wrote:

> Allows us to drop the drm_driver.release callback.
>
> Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
> Cc: Linus Walleij <linus.walleij@linaro.org>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
