Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 49FC24EDFEE
	for <lists+dri-devel@lfdr.de>; Thu, 31 Mar 2022 19:54:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 50EF910E46F;
	Thu, 31 Mar 2022 17:54:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x102a.google.com (mail-pj1-x102a.google.com
 [IPv6:2607:f8b0:4864:20::102a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 807E110E46F
 for <dri-devel@lists.freedesktop.org>; Thu, 31 Mar 2022 17:54:36 +0000 (UTC)
Received: by mail-pj1-x102a.google.com with SMTP id
 mp6-20020a17090b190600b001c6841b8a52so3011553pjb.5
 for <dri-devel@lists.freedesktop.org>; Thu, 31 Mar 2022 10:54:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=7J9AhjvqrCb/ODOda+p37kJ9lCqTYxXbCZFAQ6nE7Oo=;
 b=onGGeky9iNo+5QwUaBpZjwqxEfsoW7BXbfm2pdMdHy+94u/9VNL4MlkJf9QpfshuNe
 Ba9mnRmG0ododviz4+HJf7IhJPubWL7DQ9YmBnijS448If+o7h/tRlrswIJ5oFqYA9vy
 mPBYo+BwxafbifQ4Iebnq3aWw+EItAXt6XZM0A31Ovy4ujT6H63W22SuXzYtuqrDDif0
 cqBTXWhFQmxdERFYkdArqy2K8mRoMxMtYKrMFUbUKfH6b0kPoqhGHTGzDhyR+j27SFpv
 sr3L+z0iTBM2mS/QqI/YETgVOqNeqzMMw+pr878gLaBJVs8ZniZwIQFf3ymUEq2uUhLx
 0tNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=7J9AhjvqrCb/ODOda+p37kJ9lCqTYxXbCZFAQ6nE7Oo=;
 b=1G2c0H/RaxpoMen/ngeFTqDYXS9b3Opg+9Wl0mdOwTzca4N5USldLVCgOXjXEaDdIo
 Uh1kfq0AeDW4ikzBmMHeF5n7eid7SXJvwXZwPEjv1Ahkx5Sm/4Nd2OmrlopGwLJ7QEh5
 MjEPk+vN1a7yPfVYl5VezSPvBM0afWTqeXWeX9HRx0xUrHA7ieuN2kgzi/qdl0jGjS5s
 xA5cD1BLZGOxjfIi/s2dv379NTYTMYv6yFnJthbEBNzV2BIbQj16nsMu90RBXfUJjSBo
 iOIw3dc73XhEq1Dxds5xfOaznFnfcvwP/YSSXcOZQcgcl7gR7JYcxMwoFjpOMN3qQcuz
 q/ZQ==
X-Gm-Message-State: AOAM531uEce9N+ljjdSMPAv6Lvejg2Mo0EzAZVl4Ap1P70fIGyQBe8Cp
 ttBsrEClSseKh4PONSJO2KJ7oXxL8g84z9o5cLcJzQ==
X-Google-Smtp-Source: ABdhPJy824YST011jP+2/ha/Y0M0WLOF47Rnzawtzhz+XtpAtoAQ6cUB9KAwmzaTz7eubfQ89pV8Z9oxHog6ZO1lQCk=
X-Received: by 2002:a17:90b:1247:b0:1c6:932a:2605 with SMTP id
 gx7-20020a17090b124700b001c6932a2605mr7415159pjb.152.1648749276093; Thu, 31
 Mar 2022 10:54:36 -0700 (PDT)
MIME-Version: 1.0
References: <20220331154503.66054-1-jagan@amarulasolutions.com>
 <20220331154503.66054-3-jagan@amarulasolutions.com>
 <CAG3jFystEb+QysYVY=qjUp9cOZDg9rRVuM7mi-PJwpF1cr612w@mail.gmail.com>
In-Reply-To: <CAG3jFystEb+QysYVY=qjUp9cOZDg9rRVuM7mi-PJwpF1cr612w@mail.gmail.com>
From: Robert Foss <robert.foss@linaro.org>
Date: Thu, 31 Mar 2022 19:54:24 +0200
Message-ID: <CAG3jFytXo_THOhffLzQ_GJ-mZ2jJnEmk0xbEArcH8NF6B0dYdw@mail.gmail.com>
Subject: Re: [PATCH v4 3/5] drm: bridge: mtk_dsi: Switch to
 devm_drm_of_get_bridge
To: Jagan Teki <jagan@amarulasolutions.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>
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
Cc: Neil Armstrong <narmstrong@baylibre.com>, Sam Ravnborg <sam@ravnborg.org>,
 dri-devel@lists.freedesktop.org,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, linux-amarula@amarulasolutions.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Philippe, Chun-Kuang,

I applied this patch without realizing it is outside of my maintainer
domain, and caused conflict in dim-tip, which I've resolved.
Even with the conflict resolved, I think getting an AB after the fact
would be good.

Sorry about the inconvenience.
