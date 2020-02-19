Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8756416499B
	for <lists+dri-devel@lfdr.de>; Wed, 19 Feb 2020 17:13:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5C0156EC3E;
	Wed, 19 Feb 2020 16:13:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x143.google.com (mail-lf1-x143.google.com
 [IPv6:2a00:1450:4864:20::143])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D86926EC3D
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Feb 2020 16:13:28 +0000 (UTC)
Received: by mail-lf1-x143.google.com with SMTP id f24so572200lfh.3
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Feb 2020 08:13:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=22/PVbYKXHMADDhw0wzpGPRk2i7z5XpXWtaUk7jhSPc=;
 b=WIzcvICIqCO9Zlof090PeCcCxpyVkOi+7K+16gUgIRz0a3iLcbVsLJpJweZaSqGLP/
 p+KZMkUwhQPjUN6iv/91Z7b8gYeWJSqtfpOqlLWrUoF1QmHiCwc6D+qyGxwlEYaAP05T
 ZC8VFIglKc5DCKRNfusBnmMI9Y4A6PvDt4O1gNZLg9Q3KBrls59Efl6I49Y1kN86aveC
 59zReTM++k6+R9cc3sjJdUaIaS4Qfn9hptLMgHvEEI0vcpCWApRwls9EmbMeuL9zCZEy
 tdk2fI5aGK/0ZoooZiP+3OApW7qQy1a/oZtLG4kE7J3ZA+Ueostx3OKaoyRIaPvKvkKV
 5D3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=22/PVbYKXHMADDhw0wzpGPRk2i7z5XpXWtaUk7jhSPc=;
 b=iD/njMc33J9UDtFopmt+uFktaHQYOYe1bD4t2Gn9SHWZarZ0diDGgnvuAZak3Rh8lZ
 sI10P66/Act+QI7QZ0Q9CC3lmZw+b89qmudYgKGuALH3NkkczNp7R3kiUYAAUA3MSwxr
 JIFQfVQQzTASI4ttKlQzveGz/9ezOQINjaT6crCDZBPW9rcY0CfCQnN0uzweRLHDlXrV
 eltYeJMMDyNQjRzikty5w1tq+AZchNtRuu2jGA1dmM9l9fS9sGPAd5dALLrQrmdrvJDS
 l5GHfUm7+fswQV46tztu5hQ5TEO/8zmOqtAw2SJJnfrJhAGFVfF0L4vOV0WYAOqnCcm5
 deDg==
X-Gm-Message-State: APjAAAW4jMOO4U0lSkwPdOJJIUUjU1H7bugYnD4eJr/86qY1yMoQdBRp
 /UNUkpAItSYF+0QgcG2OYrxqhmLMUPGAdcE9YJ8nqg==
X-Google-Smtp-Source: APXvYqw3VD6FmHX4qJfF16RzBYM36HdY6H5Tm+D6dP6mXLk3si7sNYGp6eQNFjw4N/S6mUKDfZu8qke/COBt01ynPKY=
X-Received: by 2002:ac2:4d04:: with SMTP id r4mr14008314lfi.77.1582128807267; 
 Wed, 19 Feb 2020 08:13:27 -0800 (PST)
MIME-Version: 1.0
References: <20200219102122.1607365-1-daniel.vetter@ffwll.ch>
 <20200219102122.1607365-35-daniel.vetter@ffwll.ch>
In-Reply-To: <20200219102122.1607365-35-daniel.vetter@ffwll.ch>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 19 Feb 2020 17:13:15 +0100
Message-ID: <CACRpkdZpSsZbVe-YyzXH9pLaim=3LTwQS4AVGjDTAKfq602DrA@mail.gmail.com>
Subject: Re: [PATCH 34/52] drm/mcde: More devm_drm_dev_init
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

> Auto-unwind ftw, now possible with the fixed drm_device related
> management.
>
> Aside, clk/regulator seem to be missing devm versions for a bunch of
> functions, preventing a pile of these simpler drivers from outright
> losing their ->remove hook.
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
