Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FB2B7067EB
	for <lists+dri-devel@lfdr.de>; Wed, 17 May 2023 14:20:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4AC7510E40C;
	Wed, 17 May 2023 12:20:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-x1136.google.com (mail-yw1-x1136.google.com
 [IPv6:2607:f8b0:4864:20::1136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C86D510E135
 for <dri-devel@lists.freedesktop.org>; Wed, 17 May 2023 12:20:36 +0000 (UTC)
Received: by mail-yw1-x1136.google.com with SMTP id
 00721157ae682-559f1819c5dso7322687b3.0
 for <dri-devel@lists.freedesktop.org>; Wed, 17 May 2023 05:20:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1684326035; x=1686918035;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ltwPQUfHcnWmj6VOTv4xyYpzTycQbcqHQNvaDQAVaHQ=;
 b=HOyV5PMO/aOWK4yVwus5waDzP8sR1jERuHT/y6aMu+Tyuh60QM32VyRT3faBB2N3wY
 ezNPlqOW6+rBN/BU3rqroIxqXuAw2ftIJdhQBQ1lVHr0vDA/muI8Cr6UEwGRvnknSf5x
 kNTCnXUyKFPdvPQYhXrPVVLJmWcQpaMp5QHW0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684326035; x=1686918035;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ltwPQUfHcnWmj6VOTv4xyYpzTycQbcqHQNvaDQAVaHQ=;
 b=Z26vHas58Ri3ugvoWfUpRSbRpao9jzhY6unl1v2JAlc9wT7eEWNN8G+k4w6w/nvjF8
 VJ1JPkdLt7L6PuogY0GFwc3okeqTXuWcL/CSGCj6mslAJhNANjZQGolAcVRdhgT4vp1v
 Z/F9gNVEifQNqRNn4v0aNvqjuCwAUjGwytShjVTax5kHEfb4CvctZ+wFWUv/RVKORRbX
 XXPE+iexhDTPjV4Jr+t1tZaWEtZO/Tr6d0TaTswIiWc0XnFj44T4ovfNfHR4hL3o+/L9
 F4u/eItWzN2pvWHNjJFmORUhQEvqVVgX5/vm4LDH+vOuJ9nbDXzccnR/Y4eaBXJ9wmhg
 NggQ==
X-Gm-Message-State: AC+VfDx3vv3I9271pVBpjCS1EanLvIkLsRAiTL0zG+hEbyZef1T8hP+K
 oo0mxAyhKfUM7YyZ044U89sNCciOzCOQpXLUmitpeg==
X-Google-Smtp-Source: ACHHUZ6gms/DiTFU2XgEoNWwGRw96pbllbcGtmFo9dVbMA5y22pUQKoImfpkgwaSQZhZy/ka1Mu3WoN2DUxERxTUuek=
X-Received: by 2002:a81:6dd6:0:b0:561:dd1b:e516 with SMTP id
 i205-20020a816dd6000000b00561dd1be516mr594222ywc.35.1684326035233; Wed, 17
 May 2023 05:20:35 -0700 (PDT)
MIME-Version: 1.0
References: <CAO9szn18KsR0c+U8EEY1=xnmsKMxy6SEArMUic0z=aYJDVwWCQ@mail.gmail.com>
 <023f6cf9-0f08-f27e-d203-5ff78faf110f@linaro.org>
 <CAO9szn1EsbuPSRrOW8CLqhp+QUcL=9NE93FAwsg2n3htd_aJTw@mail.gmail.com>
In-Reply-To: <CAO9szn1EsbuPSRrOW8CLqhp+QUcL=9NE93FAwsg2n3htd_aJTw@mail.gmail.com>
From: Jagan Teki <jagan@amarulasolutions.com>
Date: Wed, 17 May 2023 17:50:22 +0530
Message-ID: <CAMty3ZCAP6CRsJWMUZZ6+hd5igX3NgyNfhdEv2FwuDtqj4iaaA@mail.gmail.com>
Subject: Re: [PATCH v2] dt-bindings: display: panel: add panel-mipi-dsi-bringup
To: Paulo Pavacic <pavacic.p@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
Cc: neil.armstrong@linaro.org, conor+dt@kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, sam@ravnborg.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, May 17, 2023 at 12:39=E2=80=AFPM Paulo Pavacic <pavacic.p@gmail.com=
> wrote:
>
> Hello, thank you for your time to review this patch and sorry for not
> addressing all of the concerns, it was done unintentionally. This is
> my first contribution to the Linux kernel and it is quite a process.
> I have run those two scripts and haven't received any errors I have
> latest master cloned so I will check what I did wrong.
>
> The thing I would like to get approval on before I try anything else
> is the name 'panel-mipi-dsi-bringup':
>
> > Still wrong filename. You did not respond to my previous comments, so I
> don't really understand what's this.
> >
> > Judging by compatible, this should be fannal,c3004.yaml
> >
> > If not, explain please.
> >
> > Missing user of the bindings - driver or DTS. Please sent patches toget=
her as patchset.
>
>
> I wasn't sure how to name it and this name seemed fit. I'm not sure
> how to be concise about this, but here is the full story as to why I
> have done that:
>
> I got a task to enable panel for which working driver wasn't
> available. I have started testing raydium driver and modifying parts
> of it until I got it working.
> Driver was modified quite a lot, new functions, macros and structures
> were added which resulted in a new driver.
> Therefore I have made a simple driver which I have submitted for a
> review which will probably be rejected now due tomany reasons I have
> noticed after sending it:
> https://lore.kernel.org/lkml/CAO9szn03msW6pu37Zws5EaFGL10rjp9ugPdCuDvOPuQ=
RU72gVQ@mail.gmail.com/T/
>
> While talking with manufacturers of the panel I have figured out that
> they aren't that familiar with the Linux kernel.
> They had previously only enabled  it on bare metal (PLA?) and provided
> me with the initialization sequences. Initialization sequences are hex
> values sent over MIPI DSI to initialize panel controller.
> Initialization sequences sometimes also require delays after certain
> commands and for different panels it can be very different.
> I believe I have simplified it so that someone can follow comments
> inside of the driver and try to enable mipi dsi panel by copy pasting
> initialization code from bare metal system and doing minor
> modifications.
> Since I have targeted this at people who need to enable their panels
> for the first time name seemed okay. I thought that since there is
> panel-simple.yml that panel-mipi-dsi-bringup.yml would be acceptable
> name.

Just to add a few pieces of information for you to understand better
on the context of dsi panels. DSI panels can be part of panel-simple.c
or panel-<vendor-part>.c DSI panels whose init and exit sequence is
generic are suitable to add it in panel-simple and have bindings on
panel-simple.yml. Some DSI panels have specific init and exit
sequences in terms of power, reset and DCS then those have separate
drivers to handle and whose driver name must be panel-<vendor-part>.c
or similar and bindings also follow a similar naming convention.

Just decide which part of the category that your panel belongs and add
separate patches for binding and driver.

Thanks,
Jagan.
