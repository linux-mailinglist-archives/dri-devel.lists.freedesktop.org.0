Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C14D4842A5
	for <lists+dri-devel@lfdr.de>; Tue,  4 Jan 2022 14:39:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 924CF10E358;
	Tue,  4 Jan 2022 13:39:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x102d.google.com (mail-pj1-x102d.google.com
 [IPv6:2607:f8b0:4864:20::102d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 20F5110E358
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Jan 2022 13:39:17 +0000 (UTC)
Received: by mail-pj1-x102d.google.com with SMTP id
 y16-20020a17090a6c9000b001b13ffaa625so40924463pjj.2
 for <dri-devel@lists.freedesktop.org>; Tue, 04 Jan 2022 05:39:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=bqezZ2/HwBTxC4hfR4A8RkBTbm8B6r0iUtltdIvH/WQ=;
 b=Spb99MNnUWNfoRD9S/I/T0lbsxERyN+nho8GZl3ZDXDzDRSIav+MmsreSY+xrIIM7K
 2B4RuVB1FPNovuY9h2yfFHl2C1im8TKcm7i15p+Zx/NtbfKaOM0wOw/hE9gqcS7nsVK8
 TmKnX/vLnS+OD9+/MbrZqTeIY1thlSPoL7q1+HEsGpU/8XdZEGoD/CT86cGm8uIAMrTW
 Xdip8YielnZC4A98vEAe/1LQD7heu4XXSsoMAHfrb87LKmM4Bfv+N11hbxq7Ba2N6J5Y
 4aTScot3pVKiF+5zNoWmJfxZ878hawf+aZ1irt9vMSnpn/pCWpeJUfg3z5WEHF967cNI
 tJ2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=bqezZ2/HwBTxC4hfR4A8RkBTbm8B6r0iUtltdIvH/WQ=;
 b=OA2ZVZFbu7GbnRy5+7OuahhKdQ5lRMuH6Rvgc6Iex4VQ3etMleaZl1n0Oe27xNZo94
 FiTSwlu30z5+cW86bsEktbPzQkocWWowlCeVFgbi5ilFlLtxIPJN1jCh62Ef3A6Dn34w
 ehUY07QcNYlFQ+ph7iJWXbikNGUPYIkPwdgGvLPkPl0LbTnbhKYriREWbuP4d2qEKEej
 2rQkY0vg5ihZyuW58BA4LnQHRNTI7ra4G0YtgrwlIRJzlL1l3QE78z1SDVJCYfbJYTvj
 6mTZaXKpS1A1A7EaFaw2wDDQJEQGiVbQXpGobz5W4KQSteZ7AjP5Qp3myxbI9eQ6CD6R
 xjpg==
X-Gm-Message-State: AOAM532g7HhYapT0X5TXsodsw3AfYOu3Ax9NU9CnBWl060D0uCX2ijUU
 lFIjUfz2UZAovu8T9Kleq9VjwE7FC2YKeqSInKnoog==
X-Google-Smtp-Source: ABdhPJxBX2L2LUeGUOYQ7W28MienpyMZUn6kUm2DXZieJErY/vwm5O6dOGpdWxhVKsztFBo7qkfsa6vuxb9xYUvUACY=
X-Received: by 2002:a17:90b:4c89:: with SMTP id
 my9mr58418361pjb.152.1641303556701; 
 Tue, 04 Jan 2022 05:39:16 -0800 (PST)
MIME-Version: 1.0
References: <20211119015804.3824027-1-xji@analogixsemi.com>
 <CAG3jFytg88mWgA24ce4CbPKDA7HDdXOjC=AVxYrhv1c0Z5GTPA@mail.gmail.com>
In-Reply-To: <CAG3jFytg88mWgA24ce4CbPKDA7HDdXOjC=AVxYrhv1c0Z5GTPA@mail.gmail.com>
From: Robert Foss <robert.foss@linaro.org>
Date: Tue, 4 Jan 2022 14:39:05 +0100
Message-ID: <CAG3jFyuqgRP-xcH4DS-TQ_5+-kRnErkqh67cn2-J_hiOaFC9wQ@mail.gmail.com>
Subject: Re: [PATCH v2] drm/bridge: anx7625: Check GPIO description to avoid
 crash
To: Xin Ji <xji@analogixsemi.com>
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
Cc: drinkcat@google.com, pihsun@chromium.org, jonas@kwiboo.se, airlied@linux.ie,
 bliang@analogixsemi.com, dri-devel@lists.freedesktop.org,
 narmstrong@baylibre.com, linux-kernel@vger.kernel.org,
 jernej.skrabec@gmail.com, tzungbi@google.com,
 laurent.pinchart@ideasonboard.com, hsinyi@chromium.org, sam@ravnborg.org,
 qwen@analogixsemi.com, dan.carpenter@oracle.com, maxime@cerno.tech
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Applied to drm-misc-next
