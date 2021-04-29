Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 48A9436F0F9
	for <lists+dri-devel@lfdr.de>; Thu, 29 Apr 2021 22:22:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6BD766F4AE;
	Thu, 29 Apr 2021 20:22:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-xf32.google.com (mail-qv1-xf32.google.com
 [IPv6:2607:f8b0:4864:20::f32])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 62F0B6F4AE
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Apr 2021 20:22:39 +0000 (UTC)
Received: by mail-qv1-xf32.google.com with SMTP id jm10so1070755qvb.5
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Apr 2021 13:22:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=QxFmOQwYpvfFl26HR2J/lIuaiWz/UN+EBx51IROMZs8=;
 b=hzLQuZ/7rMiKX1bt5E5t3c2FdBOL35x7Ym3yz6DDcoUDpg5JKlKcTOPSUuZW9s0Lmw
 txUfnulVFoYaGs6ee0YFbDw+bwIEisM0FVWUzmEVr+QmYMTWY7WjTIdUOTPapVsZBE8Q
 7PopzCGm2G1nxZssLXEs7HdoaLiXxSnv6sbQY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=QxFmOQwYpvfFl26HR2J/lIuaiWz/UN+EBx51IROMZs8=;
 b=N5ZACk9MR5bpn2A65bP4ydVKyo4/MNQNKBJBpbXPndyamjQAVtNvOR2As+6wrHUD+T
 I1ROcwAQm50r7AoO4HYAowtBwcnrfX+phtqPBJl5MPjku/YdTs7cEQRcv9PVbc5XMeRM
 uSZe+nImf3sZyRrq/B4fX3HGxgKF8IAhZd8uGu7Gff5Y/75Bl1qkUmxFFz6rGIRD+WJy
 jHoz1aNHDWkpmtZ3SuUW8SuM5jK2qp4Mbc8jm3TpF7KiylDD/76Xd7tYIhuLNe6CmQOF
 dTarnq/gpH2nCKCdAvgmpTotDKpWngAzg7Ir/Mj1R7LKBMb/yh/p9x8jSLcGOBVu+mck
 D9nw==
X-Gm-Message-State: AOAM531Ao8jYskWtlb0FMV8qMWKIUOYT5aubIh5UiK3ZdA8oC5eHixP8
 SceFb70TExCBNn4ZJQWJl+fGrZQLx7xvsA==
X-Google-Smtp-Source: ABdhPJws9SGrURAkZFeWr39ZH23Yo4tjezWDR7tj58WA11gOyD4WU+wWDGtgWETlenE+28+FXJjqAQ==
X-Received: by 2002:a05:6214:a43:: with SMTP id
 ee3mr1646564qvb.61.1619727758367; 
 Thu, 29 Apr 2021 13:22:38 -0700 (PDT)
Received: from mail-yb1-f180.google.com (mail-yb1-f180.google.com.
 [209.85.219.180])
 by smtp.gmail.com with ESMTPSA id u64sm3062214qkc.127.2021.04.29.13.22.37
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 29 Apr 2021 13:22:38 -0700 (PDT)
Received: by mail-yb1-f180.google.com with SMTP id j84so10532679ybj.9
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Apr 2021 13:22:37 -0700 (PDT)
X-Received: by 2002:a25:6088:: with SMTP id u130mr1999909ybb.257.1619727757565; 
 Thu, 29 Apr 2021 13:22:37 -0700 (PDT)
MIME-Version: 1.0
References: <20210405234713.3190693-1-linus.walleij@linaro.org>
In-Reply-To: <20210405234713.3190693-1-linus.walleij@linaro.org>
From: Doug Anderson <dianders@chromium.org>
Date: Thu, 29 Apr 2021 13:22:26 -0700
X-Gmail-Original-Message-ID: <CAD=FV=UH4JSppo1ss7DPQSoaEkZE-gjbMddo2v_N00oEi2hjrg@mail.gmail.com>
Message-ID: <CAD=FV=UH4JSppo1ss7DPQSoaEkZE-gjbMddo2v_N00oEi2hjrg@mail.gmail.com>
Subject: Re: [1/2] drm/panel: Add DT bindings for Samsung LMS397KF04
To: Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, LinusW <linus.walleij@linaro.org>
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
Cc: "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Thu, Apr 29, 2021 at 8:39 AM Linus Walleij <linus.walleij@linaro.org> wrote:
>
> This adds device tree bindings for the Samsung LMS397KF04
> RGB DPI display panel.
>
> Cc: devicetree@vger.kernel.org
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> Reviewed-by: Rob Herring <robh@kernel.org>
> ---
>  .../display/panel/samsung,lms397kf04.yaml     | 74 +++++++++++++++++++
>  1 file changed, 74 insertions(+)

Probably not needed since you have Rob Herring's review, but:

Reviewed-by: Douglas Anderson <dianders@chromium.org>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
