Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D7BE91ABF1D
	for <lists+dri-devel@lfdr.de>; Thu, 16 Apr 2020 13:27:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0DDA16E2E2;
	Thu, 16 Apr 2020 11:27:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x244.google.com (mail-lj1-x244.google.com
 [IPv6:2a00:1450:4864:20::244])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4BA056E2D7
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Apr 2020 11:27:39 +0000 (UTC)
Received: by mail-lj1-x244.google.com with SMTP id y4so7396205ljn.7
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Apr 2020 04:27:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=7w8uSc7h8KgS1tb3yibkFzYY8qlF5pm6oSHV83Uw1Yo=;
 b=fK5JsDocnEIQpMxmcyB3SNBb4AiE3ckwZUinj2ftQ0O4JRKTIbO7AkXbjTfZHrcW4F
 Ph4c5dNJHtoDZPzBgS5P46KsV0i5vqL12l8Fs/R5cK17ebKdvWg/2V+X+dGThmiG0Mkv
 CY8x/8PHE4auLNJwrIDut8yIQXTG48mnpFO4s9Bkdg7Jqu0V2DhS3i+8y7+iU/jAYrz5
 gcPWZXxCD0D3Se2pwjLcJlq6OFklUaSAbw8qzQo2/9Eg8O6oPpRRVUNjnI8s5CRe/79x
 RLkZULM9yPYZh8o1WkzqHdKmixESJch8RSdCExmIi23JUhWnw8TPN8DTSxP75/5Ij5fh
 /jRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=7w8uSc7h8KgS1tb3yibkFzYY8qlF5pm6oSHV83Uw1Yo=;
 b=JDQ0rPETbM29D+RYk/ug0dQWNForFOIbdMdrDa5qfiBRV3OM3G1tQoDqUnUJlB+9Mt
 rE1rTc72TN9Tbk5oxpeDoSfM6898/m44p1VSRT15iW1RdSozYyHEJlAI0JfS95XoJSuA
 OZOwXjsOVVHxpelHrtfZvIMv7DsJxYBPz6aSG/xn8Vi5CK/mtJdqCk3h5nSfAHxlD0Cg
 UV8zLxtN88/Nu1t+TjPLRRHwHg6fT7MyQ5n4qo2sFg1y9ftccGXj56DnyZlYMWvcFvoq
 df+CDb96Ey7ho+FpNnY0N7+pkpckNuo8cL/2kqXITidOyZIVKBWpA5gjGZeqczDA8emB
 /EYA==
X-Gm-Message-State: AGi0Pua0VDBA0+nhO6+g2p0l443CHdmC9MUC6n7wyAv99VeobEr/Pekt
 cySQ0MBdVwE4U9qoxqv2Re4pOavKv+0/WNqKgpGGT6DL
X-Google-Smtp-Source: APiQypK+/66JCAU5dR9ygtoleJlBgRb0eW5swJDYGED+qjknJO+le0b3+Jc2JWnpyeRFTwKn69HDCp2PQXUZ6a9msV8=
X-Received: by 2002:a05:651c:32e:: with SMTP id
 b14mr1282479ljp.277.1587036457745; 
 Thu, 16 Apr 2020 04:27:37 -0700 (PDT)
MIME-Version: 1.0
References: <20200408195109.32692-1-sam@ravnborg.org>
 <20200408195109.32692-6-sam@ravnborg.org>
In-Reply-To: <20200408195109.32692-6-sam@ravnborg.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 16 Apr 2020 13:27:26 +0200
Message-ID: <CACRpkdaG+WcckCK27HPx=tCKMHaz+TLbTkj3gi+4cyK+EbbO3g@mail.gmail.com>
Subject: Re: [PATCH v2 05/36] dt-bindings: display: convert
 arm,versatile-tft-panel to DT Schema
To: Sam Ravnborg <sam@ravnborg.org>
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
Cc: Thierry Reding <thierry.reding@gmail.com>,
 "open list:DRM PANEL DRIVERS" <dri-devel@lists.freedesktop.org>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Apr 8, 2020 at 9:51 PM Sam Ravnborg <sam@ravnborg.org> wrote:

> v2:
>   - Fix entry in MAINTAINERS
>
> Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
> Cc: Linus Walleij <linus.walleij@linaro.org>
> Cc: Thierry Reding <thierry.reding@gmail.com>
> Cc: Sam Ravnborg <sam@ravnborg.org>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
