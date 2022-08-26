Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 05E5F5A27BD
	for <lists+dri-devel@lfdr.de>; Fri, 26 Aug 2022 14:24:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 894EB10E8CC;
	Fri, 26 Aug 2022 12:24:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com
 [IPv6:2a00:1450:4864:20::633])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 81F6010E8CD
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Aug 2022 12:23:59 +0000 (UTC)
Received: by mail-ej1-x633.google.com with SMTP id fy31so2430138ejc.6
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Aug 2022 05:23:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc;
 bh=iswjqihI39pJSaQrk0zhp/1DjrI5VO03giQl4zayVOw=;
 b=V6MbecQH+BMO7nOYngQ2Op+s60PFvTCzQtnyrmljXtco8iKeR6OpePcmw+NunAtXio
 K9f+UkeDXLfkPmviTBk73Bj50b0UizOHiR/sivAxJANVyl1FImRip8YITjDn6PA0/2KX
 DToaKCGY6RWD8cMBZ8zQc9mBbGqpISJf5FIkuQh2YwtRYl34sLa2gMkWJ5Nxahmlga/G
 b31hlYf7n5hkGic0deo5fiSljuVDIRen3AhsMkmegV+K4rnDVgu5s87gNUqdoCIHw4Mx
 qhG2FKAsGGbSiRhStHLwwi2TvssAzvuUfODXm9ie1Rvya4oxtO920BiT4TKxalbHUwhO
 p+QQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc;
 bh=iswjqihI39pJSaQrk0zhp/1DjrI5VO03giQl4zayVOw=;
 b=ghan14p+cfS3vn15ZVi26Ho7k/FgqHB5mr4QLhaVIUDDA9apiJWks6+AXTS5Lp3Dbs
 ZTCxr21mDAhdb9T/O2t9cm5K1FkHseRRy68F1ldaYnsxtVs/e58PTIDXtSIdWekUYasr
 gYdUlMn8YUlClxG9j8zRBq6dhsmmHD08MRCIuePcwSoeSqzSQqICXwJhSAlQhaVnE7us
 cZXjCcHgkGW0/ON1fxiRkHqtRiHRLh0gZxRCyhXrvaVWTqJxu6K/vEZRo8CBcwHi2KQS
 gOWw0LTIzEq4YVQdpDRkQvfSu5ybgmD7v0PzIoLIrVKWRzHrVxL6lhgMlpE9k1hoFh7b
 fhAA==
X-Gm-Message-State: ACgBeo0IoZjl/JTWN51KpI41QatpA3NpCZXIrGCCmdmYbMEArVxE3r51
 jn6JjOPOeIvQVBlFZcq/xk+JFkjQoI//nJ2ks78a8RTjx7k=
X-Google-Smtp-Source: AA6agR5KFrdn04yjC4VEtGy5UXQ9eyUzQclX1Vtfht/EiRtvvmERpIlgbqDQZX4uaoCIW4blErvkiiueHpz2rSxLxPU=
X-Received: by 2002:a17:906:478f:b0:73d:7919:b23 with SMTP id
 cw15-20020a170906478f00b0073d79190b23mr4979606ejc.690.1661516637973; Fri, 26
 Aug 2022 05:23:57 -0700 (PDT)
MIME-Version: 1.0
References: <20220505215019.2332613-1-linus.walleij@linaro.org>
 <CACRpkdZKUGu_BCP1sUWU_-ObNuc9MhgO98WRi-6OT4Vv-VYibg@mail.gmail.com>
 <20220826120507.GI2030@kadam>
In-Reply-To: <20220826120507.GI2030@kadam>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 26 Aug 2022 14:23:46 +0200
Message-ID: <CACRpkdY+47ZsbREyZEDG_Myog3dG5O9RiA+VKq323AvvHB11qw@mail.gmail.com>
Subject: Re: [PATCH] drm/tve200: Fix smatch warning
To: Dan Carpenter <dan.carpenter@oracle.com>
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
Cc: linux-arm-kernel@lists.infradead.org,
 Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Aug 26, 2022 at 2:05 PM Dan Carpenter <dan.carpenter@oracle.com> wrote:
> On Fri, Aug 26, 2022 at 01:35:56PM +0200, Linus Walleij wrote:
> > On Thu, May 5, 2022 at 11:52 PM Linus Walleij <linus.walleij@linaro.org> wrote:
> >
> > > The "ret" variable is ambiguously returning something that
> > > could be zero in the tve200_modeset_init() function, assign
> > > it an explicit error return code to make this unambiguous.
> > >
> > > Reported-by: Dan Carpenter <dan.carpenter@oracle.com>
> > > Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> >
> > Would someone show mercy on this patch and review it so I
> > can apply it?
> >
> > Dan maybe? If it solves the problem you reported.
>
> Yes.  This patch makes me happy.  Thanks!
>
> Reviewed-by: Dan Carpenter <dan.carpenter@oracle.com>

Excellent, patch applied!

Yours,
Linus Walleij
