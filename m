Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BB7E400657
	for <lists+dri-devel@lfdr.de>; Fri,  3 Sep 2021 22:10:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4B4146E8D6;
	Fri,  3 Sep 2021 20:10:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb30.google.com (mail-yb1-xb30.google.com
 [IPv6:2607:f8b0:4864:20::b30])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 00DDF6E8D6
 for <dri-devel@lists.freedesktop.org>; Fri,  3 Sep 2021 20:10:26 +0000 (UTC)
Received: by mail-yb1-xb30.google.com with SMTP id a93so653040ybi.1
 for <dri-devel@lists.freedesktop.org>; Fri, 03 Sep 2021 13:10:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=LP2bBlDJllmmHFJvDTszRJ/iVXWMJaLGjn6V7C/ZvWY=;
 b=QIgQHvFa7Q9UW9hHmoWcsX0yYzphBVNkNumIGLtgdMy79Lm/5ihpFSqSzx2ORHRHxd
 w2WZ6D1VTkux8OlpFAeZXueSNHxAiQQVslH3yoUtix5t19kwk8dwlTKqMK8SMqr55kFj
 zVar8MJxA6fMpP3oUq9W6y0m67z+wQh9AsXWt9TsYk5WYWD3kkjUWpNMzYWDoaPJpaKu
 mWWgE6F1r8DZVOPC9gaEcCyIldXybqjw41EOqBbOWo5ZOM3SHN9me2ndWSkKdYE0vekH
 lYNpJkODbNsHc1mI6imR0fePkyLu0OBM2gchlyh8/iF6wJRyaBqErL39UndgW+aAYHxO
 ACmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=LP2bBlDJllmmHFJvDTszRJ/iVXWMJaLGjn6V7C/ZvWY=;
 b=MW6Wxc822Crc8SniXt611elb6unJhEc4H1GexADYLmUfi2tc3uuTt3RZWFtu0KSsc9
 EqON0qE6utMoAuOshZbVXrPPlt5ODcpKs6/kU7rzF6zwwFB6+kk59u4M+wriEOgPSmW5
 /UcxhWLdjXzyOEgjMsN3f1AZVyCRAyESyeUJvN6iW7pBRZLZR95zICOtuRRGuvmHIJ90
 Iy2PECA5zTpLDLO5ZdJpLCUt8MPOJt3Q5AzkuNF+CPH3lNlQx5GRQKrMUuHF+r3O4FHu
 0/rSN9w9U3uDrz1G3wde77+V1cUjz993K3PFM3eWy9vr5n7lxaYsx09e2hEctomYhNMp
 Cb1A==
X-Gm-Message-State: AOAM530xsrn6h/Ge5CZQZKqxL+aTC3sZ93AYSD0sxuaj6xsOFFe+0k7C
 iAfweXKr08o0s0e7fbQMz1tXxrfqEv/JGNQOZHk=
X-Google-Smtp-Source: ABdhPJyz9dgUh4N2QxnWbIat+3XPtafsZbC1TLsbwyBA4gMbJEVcpOhBvWCL7Oj5hrXl/X4XHAjPDTjawJ6AjTD2gWs=
X-Received: by 2002:a25:b7c6:: with SMTP id u6mr1053989ybj.16.1630699826098;
 Fri, 03 Sep 2021 13:10:26 -0700 (PDT)
MIME-Version: 1.0
References: <CADVatmPB9-oKd=ypvj25UYysVo6EZhQ6bCM7EvztQBMyiZfAyw@mail.gmail.com>
 <20210903160302.yh42vpkuob45dbpb@gilmour>
In-Reply-To: <20210903160302.yh42vpkuob45dbpb@gilmour>
From: Sudip Mukherjee <sudipm.mukherjee@gmail.com>
Date: Fri, 3 Sep 2021 21:09:50 +0100
Message-ID: <CADVatmMqT1yq3YHBzt4-VsL8uVHUULmy2gpaH27rAqimao2i_A@mail.gmail.com>
Subject: Re: Regression with mainline kernel on rpi4
To: Maxime Ripard <maxime@cerno.tech>
Cc: Emma Anholt <emma@anholt.net>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, Philipp Zabel <p.zabel@pengutronix.de>,
 dri-devel <dri-devel@lists.freedesktop.org>, 
 linux-kernel <linux-kernel@vger.kernel.org>, 
 Linus Torvalds <torvalds@linux-foundation.org>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Maxime,

On Fri, Sep 3, 2021 at 5:03 PM Maxime Ripard <maxime@cerno.tech> wrote:
>
> Hi Sudip,
>
> On Thu, Sep 02, 2021 at 10:08:19AM +0100, Sudip Mukherjee wrote:
> > Hi All,
> >
>

<snip>

>
> >
> > You can see the complete dmesg at
> > https://openqa.qa.codethink.co.uk/tests/76#step/dmesg/8
>
> What test were you running?

Nothing particular, its just a boot test that we do every night after
pulling from torvalds/linux.git


-- 
Regards
Sudip
