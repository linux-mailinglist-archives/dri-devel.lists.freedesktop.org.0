Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A3E254D9244
	for <lists+dri-devel@lfdr.de>; Tue, 15 Mar 2022 02:27:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 792CA10E44A;
	Tue, 15 Mar 2022 01:27:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x82a.google.com (mail-qt1-x82a.google.com
 [IPv6:2607:f8b0:4864:20::82a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DE7C610E443
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Mar 2022 01:27:08 +0000 (UTC)
Received: by mail-qt1-x82a.google.com with SMTP id g7so8116828qtg.7
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Mar 2022 18:27:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=+V4iyUGPnF/NQhkHTPBkqtdb3tsV1eLSkglbcthvJjk=;
 b=F7WlOKX8QUi+Ggrzwp05RoLUrZK+fo2HnWaEve3xfgNOcc+YuoLVSG+IG0CR+xUgog
 QnPZzCtz76OykGAtwKL/2hT4biTkPTPhOoIbbu5iWjDi2fTNbXWq7Y9tznrrexq98h4E
 6/eg/XUSas7Az8p0fA2W2jBAEVL8xLswQ3X2c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=+V4iyUGPnF/NQhkHTPBkqtdb3tsV1eLSkglbcthvJjk=;
 b=mfC+zvT1I+vPjLfV0i+NBb+bdY1+jQDMjW+dUw891DvyiHCNF9T5FrP8HXQ48/0Ybq
 UOyG7nhu2u3f8lUBwVkxOPQAwxtehDZJ1RqUMbCMS478Tw1NlDL2Qu+KCJIx74InVSpK
 ZftpS3jfM9RkycFDdVBFzgno+AsGeP8BU+fJtFjaN98Szg/+F7/omAf79XX9qEmx/NFK
 rTgCGrLLrnQAXG3loPVCZ53BWqC4xQGiKr9hbq7c6ZRIqJeVIOJWvB8QPViw7gJGFSbF
 eE3GCxt4L921mAbj9orQyOSCu+302/Vnf2+BZGkEMGQZNyiOSjIuB50z7s2l7CWqGdO+
 3u4A==
X-Gm-Message-State: AOAM532je+00muiPx80gQFJc9uFDD/UPSSVfH7SZXBd7ewCRMeU4bNZA
 FzkhSDKaF8lswd/K8/jKkMJ7Vo2EfbSWUEbuvkU=
X-Google-Smtp-Source: ABdhPJzE6usGxaJAkzghzKID06dDa9XcVgDlW8+O+LojgMNzBWy91SSpCcSY5Qmt4oRq5XcbaMVucMXmRSpOpfRYl8k=
X-Received: by 2002:a05:622a:14c8:b0:2e1:d626:66ea with SMTP id
 u8-20020a05622a14c800b002e1d62666eamr4668263qtx.58.1647307627925; Mon, 14 Mar
 2022 18:27:07 -0700 (PDT)
MIME-Version: 1.0
References: <20220304000311.970267-1-joel@jms.id.au>
 <20220304000311.970267-2-joel@jms.id.au>
 <CACRpkda3q=Rh7Kmi8Cycg4CAYUhzpRxLf+ErwxR_0drtTNTr+g@mail.gmail.com>
In-Reply-To: <CACRpkda3q=Rh7Kmi8Cycg4CAYUhzpRxLf+ErwxR_0drtTNTr+g@mail.gmail.com>
From: Joel Stanley <joel@jms.id.au>
Date: Tue, 15 Mar 2022 01:26:56 +0000
Message-ID: <CACPK8XetyrHHmpbSiE3rXgtdQt9JTg_ZHfuFhsyOoWdSrCvk=A@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] dt-bindings: pinctrl: aspeed: Update gfx node in
 example
To: Linus Walleij <linus.walleij@linaro.org>
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
Cc: devicetree <devicetree@vger.kernel.org>,
 linux-aspeed <linux-aspeed@lists.ozlabs.org>, Andrew Jeffery <andrew@aj.id.au>,
 "open list:DRM DRIVERS" <dri-devel@lists.freedesktop.org>,
 Rob Herring <robh+dt@kernel.org>, Lee Jones <lee.jones@linaro.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 15 Mar 2022 at 01:21, Linus Walleij <linus.walleij@linaro.org> wrote:
>
> On Fri, Mar 4, 2022 at 1:03 AM Joel Stanley <joel@jms.id.au> wrote:
>
> > The example needs updating to match the to be added yaml bindings for
> > the gfx node.
> >
> > Signed-off-by: Joel Stanley <joel@jms.id.au>
>
> Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
>
> I guess you will merge this elsewhere or shall I apply it to the pinctrl tree?

Feel free to take this one.


>
> Yours,
> Linus Walleij
