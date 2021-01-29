Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B2AD230898E
	for <lists+dri-devel@lfdr.de>; Fri, 29 Jan 2021 15:33:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DF4E26EB27;
	Fri, 29 Jan 2021 14:33:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x22b.google.com (mail-lj1-x22b.google.com
 [IPv6:2a00:1450:4864:20::22b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 100026EB27
 for <dri-devel@lists.freedesktop.org>; Fri, 29 Jan 2021 14:33:38 +0000 (UTC)
Received: by mail-lj1-x22b.google.com with SMTP id e18so10677087lja.12
 for <dri-devel@lists.freedesktop.org>; Fri, 29 Jan 2021 06:33:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=y6dF4WUedvz6pLrMDwh3hMnPfHhN0I4PTPGpJHkOaks=;
 b=oOjQhnLFoKrNClkqmplgFGVq5kRtcI5bANFduZVx4PIqIObdjR4kYvLjodUddtSYgl
 9YKaxqklVy3+BdGgUhS9Rh7n+i9pe47nWURchNRlQXc2Zd1ZsJ9sbTDw7oy0aBW8w0To
 sWoQClvcBfVtt5DOR/grRX4NCeFpcZyKFnlHgYgdCqc61+uzMCr3G79rvZtRmdrgNllM
 1NiGp5GKHIAqopP/arGEhvSEnLmVfdpltGEF7la1D0dViKM6cY+PuL0bE+mdFrnoQt+8
 Lv5a9EXN9+gcf+ji/XlxtICYI7g4yQvl5H417jRVdWbk/m2Tvi2dW0z7UK39FLnzLc0V
 5ynA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=y6dF4WUedvz6pLrMDwh3hMnPfHhN0I4PTPGpJHkOaks=;
 b=WTmAUlvR9wm7gb0GBeZJAcola319H77N7KGpBsfvV8De486tzvYB4ahZl2a2Z8F6U1
 sVeD8deYvzlR+EubiM4f/ZIcUAIw66T0DRmTazcN5op7fPP1Oceai4boJyoa6qdpAIVm
 Nw4XRlKMABySHgu1Q63+wJuK1cp+sEx+7jyml0R/shzD72Hg1v6GTr7JROgVRFNI/3BF
 XmsNtjbtbBGu/7RpBj8FZDA6wWnt91EAx9ikPnoPHlu5JIAa0Efz5bSmou3cS9UCHk+W
 7plhARgVTl97Dt4innvEKPaU8c7YNJkfPuWh/NckXjPnCQpbWuvN6ajm1HDjX93adkD8
 0txw==
X-Gm-Message-State: AOAM533AdwrDWdrp4qbxBygszfcVpgK2yfdeaIFFGDSmN8EjEohKhRF/
 Ld4lFxkc75j4m++lMR9gx7D+SFgovYZikycUrls=
X-Google-Smtp-Source: ABdhPJxlzm+T34Xnet4D8RQ5/eG9HJfcQYVKzCuUOlyKyR5CObQerWcBhS4iEvI96uJgRUaPuKdKdL0Fe0dzaAQnZWI=
X-Received: by 2002:a2e:993:: with SMTP id 141mr1878927ljj.372.1611930816482; 
 Fri, 29 Jan 2021 06:33:36 -0800 (PST)
MIME-Version: 1.0
References: <20210129095604.32423-1-tzimmermann@suse.de>
 <20210129095604.32423-4-tzimmermann@suse.de>
In-Reply-To: <20210129095604.32423-4-tzimmermann@suse.de>
From: Patrik Jakobsson <patrik.r.jakobsson@gmail.com>
Date: Fri, 29 Jan 2021 15:33:25 +0100
Message-ID: <CAMeQTsb7sdKGXhB+sFCZQHJ3g3bcZKTyMoz=8_V70jTNUa_A3w@mail.gmail.com>
Subject: Re: [PATCH 3/5] drm/gma500: Drop DRM_GMA3600 config option
To: Thomas Zimmermann <tzimmermann@suse.de>
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
Cc: David Airlie <airlied@linux.ie>,
 dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Jan 29, 2021 at 10:56 AM Thomas Zimmermann <tzimmermann@suse.de> wrote:
>
> With support for the MID-related chips removed, only support for
> desktop chips is left in the driver. So just build the complete
> driver if DRM_GMA500 has been selected. Anyone who wants to enable
> the Poulsbo code would probably also want the Cedarview code.
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>

As GMA600 is staying, can you please also merge that config?

-Patrik
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
