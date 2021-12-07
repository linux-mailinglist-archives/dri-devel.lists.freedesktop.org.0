Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B145446C08C
	for <lists+dri-devel@lfdr.de>; Tue,  7 Dec 2021 17:17:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6B80CABD8A;
	Tue,  7 Dec 2021 16:17:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd36.google.com (mail-io1-xd36.google.com
 [IPv6:2607:f8b0:4864:20::d36])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A2DE7ABD43
 for <dri-devel@lists.freedesktop.org>; Tue,  7 Dec 2021 16:17:03 +0000 (UTC)
Received: by mail-io1-xd36.google.com with SMTP id m9so17914012iop.0
 for <dri-devel@lists.freedesktop.org>; Tue, 07 Dec 2021 08:17:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=gmWS9TjLgGqZ+g1YHcRQV99bcbdUvJkmlKsPhxgxsCY=;
 b=SSYZUtmknty2K0xQ3CwS7w4YcGWspE+Nfqyy3dv/dEqrdOoowNYgFukY6yRnj/4jnN
 Z8kgMEP4/vdUOnTOiX2ACoadIctzI2lBYo7MRdAYnx6k6IEb1+JxAwo/sTuMje5y0fM2
 lJSdFQOCRkioBiCmI2qKpJTgyAspTesDXwo+4XSSzSJlUj+nBdEboyxvqgKZRygruYbs
 GJYeilG+8u/wcEbMZoV4SX00EC0Q1YCUoVmPFbybQANbddT07zD8j/dCIP/u3NhabC5s
 Nx99cK0gUP3R3UXyU0oQYIDZGLe/S1KzY3zmgQ4f/8lb7UvN44OriAHXFD/FXC/tatZn
 Fapw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=gmWS9TjLgGqZ+g1YHcRQV99bcbdUvJkmlKsPhxgxsCY=;
 b=dxBtlS5oy3PHqCn+/MLs44lg2cr0Rd+9LeyYElP3h2CJMC8ItuC8i9oUKb+3eUIjQH
 JDOKeZf3E0o5vE0A+HI62dQ1eeFw81Y1jLW75q+axZYwdG7r6rqh00lEOgq4URZpEv5C
 BMSplXWC0RsnYuJSibXLBCIGQHn1TuvPluH8tu4VoLN2hDCibeBZb7tWgV5GcBFjzUvF
 sAhd1m5qTrtvN3+q4dm6kyfggp0MEODkeF8iJ3BeMYk5HO2+yTB9ebNVkIDWyS/8YNvM
 4v6xhaXunEJNfBqa8FrtCrdNK+IQMfngK4v/AEgRJPB8SIh7R0lJQZL5wAnlLV2F7jn4
 f1Ng==
X-Gm-Message-State: AOAM530X/pK/M/cunZc29LQUQlDtTZR/XOHYdo4/Vn8I0fFZPf2lssKD
 vVbOr5jZJ9iJhiB54aTM7LSXD30YsDMVvTKJuFH2sw==
X-Google-Smtp-Source: ABdhPJyy+b+L3LlvJM1Iiho74qcXJCkSlfcsc/kFP26/3ibIGOCb0nEAJqVkhN+uv7XitGO1xv1s9gKsMfM5DSy234A=
X-Received: by 2002:a5e:9b07:: with SMTP id j7mr355952iok.136.1638893822676;
 Tue, 07 Dec 2021 08:17:02 -0800 (PST)
MIME-Version: 1.0
References: <20211123075205.2457975-1-yangcong5@huaqin.corp-partner.google.com>
 <20211201023230.344976-1-yangcong5@huaqin.corp-partner.google.com>
In-Reply-To: <20211201023230.344976-1-yangcong5@huaqin.corp-partner.google.com>
From: Doug Anderson <dianders@google.com>
Date: Tue, 7 Dec 2021 08:16:50 -0800
Message-ID: <CAD=FV=Ut=gP9EWPmVqar9pxPA_mTZFD+E1L14fjmFASCfh8_6g@mail.gmail.com>
Subject: Re: [v2] drm/panel: Update Boe-tv110c9m and Inx-hj110iz initial code
To: yangcong <yangcong5@huaqin.corp-partner.google.com>
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
Cc: devicetree@vger.kernel.org, airlied@linux.ie, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, thierry.reding@gmail.com, sam@ravnborg.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Tue, Nov 30, 2021 at 6:32 PM yangcong
<yangcong5@huaqin.corp-partner.google.com> wrote:
>
> At present, we have enough panel to confirm the effect,
> update the initial code to achieve the best effect.
> Such as gamma, Gop timing. They are all minor modifications
> and doesn't affect the lighting of the panel.
>
> a)Boe-tv110c9m panel Optimized touch horizontal grain.
> b)Inx-hj110iz panel Optimized GOP timing and gamma.
>
> Signed-off-by: yangcong <yangcong5@huaqin.corp-partner.google.com>
> Reviewed-by: Douglas Anderson <dianders@chromium.org>
> ---
>  .../gpu/drm/panel/panel-boe-tv101wum-nl6.c    | 108 ++++++++++++------
>  1 file changed, 74 insertions(+), 34 deletions(-)

Pushed to drm-misc-next.

42c632b0555e drm/panel: Update Boe-tv110c9m and Inx-hj110iz initial code
