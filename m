Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 03D865F35EB
	for <lists+dri-devel@lfdr.de>; Mon,  3 Oct 2022 20:54:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4E4D210E481;
	Mon,  3 Oct 2022 18:54:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com
 [IPv6:2a00:1450:4864:20::62f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1E1BE10E481
 for <dri-devel@lists.freedesktop.org>; Mon,  3 Oct 2022 18:54:44 +0000 (UTC)
Received: by mail-ej1-x62f.google.com with SMTP id qx23so6074720ejb.11
 for <dri-devel@lists.freedesktop.org>; Mon, 03 Oct 2022 11:54:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date;
 bh=ZWtjJZk+dGfZ5Cry9jnZ+BrR/YXPmSkUOKLcc77u3W4=;
 b=DY4r3/PicRAOO9FkdHH4rccSAGulqdS9/1tnOHNNVIGd1Ldqq1zVd6/XvoMeQ9W+k5
 wNrTt6AzXUy+hyiINs7EK5KT7PoBRGE1SQEtNiA6rm2wPYr5yjxIvla9g32Dj7XSNkqd
 ONMu0gXko05+tsPCpqfFo/Whw2uEyQjAlMBMilJzrZS+9xG5DwJnlGHJ0V7tChTbpiMy
 QFCf9nbZNFzagzahmVSbmOe2yVUbpA4bNAZgYcvkUZQNK1LmKhGY5HYFTfStwHTFqYcN
 DE+4B1ak8POvVUdq/GtJUzXp5AMU3vWPttE9Rx0p7L/cBOX/cgW8rYqHjkQU3Vlqapyj
 DnMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date;
 bh=ZWtjJZk+dGfZ5Cry9jnZ+BrR/YXPmSkUOKLcc77u3W4=;
 b=bNCQsdc/msCUKt7d9f/YYinJGL5y984I00cwTsocgLh8cA3QqINZJ+FG05UN6J6erK
 STWhYHZeSNV/DVgaNTYwgXgGVX98POyAQAI8hS7SeXm8yWG8HYm3Sltyc1zk2JQbAEqQ
 +WRF06/xqHLb+C1jQaMSlAAMwjCVwi+lDiWKQJ5YBUnKxcjrVXnPjsb0vmG4LUdl6lHR
 MYiAjZzI5TLuoeRIgVVuITnOa5n+HRSwZaBefS2+brT3wyRgyctIc3KWmJFbXErDO4O4
 8YLIYC9IP3RDuOWvEyOnXAn6RLbJn8y/v7AtTEL5JkSUVSOIYP9uzKluiMG139BKL55H
 sdug==
X-Gm-Message-State: ACrzQf2JpAiaTDS0tln8o1/mv8tm1OLACHizZVqgk+38D6ciQHNSKHmO
 D593qzXhDML5uOCWJEL1yXpEmDrT7lXnhLXcZbSKvg==
X-Google-Smtp-Source: AMsMyM5g2fe/v9D9TU86UO8XUkvOTh5zkJrZWXucxKTmYfl8xARkrTTR7rXFy5Cn17tH4Qi/oJCqy5ktrjOgejVUGS4=
X-Received: by 2002:a17:907:a064:b0:78c:1511:a3cd with SMTP id
 ia4-20020a170907a06400b0078c1511a3cdmr3340550ejc.203.1664823282532; Mon, 03
 Oct 2022 11:54:42 -0700 (PDT)
MIME-Version: 1.0
References: <20220928093103.64014-1-khalid.masum.92@gmail.com>
In-Reply-To: <20220928093103.64014-1-khalid.masum.92@gmail.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 3 Oct 2022 20:54:31 +0200
Message-ID: <CACRpkdbZWMk9+wH8ndFEzZyUwKecjNfgT2xJnZEQx0ACPzLWbw@mail.gmail.com>
Subject: Re: [PATCH] drm/tve200: Use drm_* variants for logging
To: Khalid Masum <khalid.masum.92@gmail.com>
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
Cc: David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Sep 28, 2022 at 11:31 AM Khalid Masum <khalid.masum.92@gmail.com> wrote:

> We have routines like drm_info/warn/err for logging. Use them instead
> of dev_* variants to get drm-formatted log messages.
>
> Signed-off-by: Khalid Masum <khalid.masum.92@gmail.com>

So is this the new thing? We've been through:
- DRM_INFO_ETC BIG CAPITAL LETTER MACROS
- Just use dev_info() & friends like everyone else
- Now drm_info() & co

Note I don't wanna bikeshed about this, just tell me there is
consensus now so we know what to do.

Yours,
Linus Walleij
