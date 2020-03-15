Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BC91718607A
	for <lists+dri-devel@lfdr.de>; Mon, 16 Mar 2020 00:19:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 976836E2F8;
	Sun, 15 Mar 2020 23:19:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-x142.google.com (mail-il1-x142.google.com
 [IPv6:2607:f8b0:4864:20::142])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B3A796E0BF
 for <dri-devel@lists.freedesktop.org>; Sun, 15 Mar 2020 15:25:10 +0000 (UTC)
Received: by mail-il1-x142.google.com with SMTP id c8so14014853ilm.1
 for <dri-devel@lists.freedesktop.org>; Sun, 15 Mar 2020 08:25:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=8oElHQLKFLOVtRHqu7xiZ6PSJACuRnWmCrjsIOT03/4=;
 b=RsMP5ZfF9Kle+rjBS3Bso6AHBFITrbE13HUp2ObAa4PaLpubX0IyO20urbKNQZ8QzO
 zyawLivUZMOXmEf4KS1gockamB5ifWcK8RDanr4T91XtPkH5uqz3rQkJuTN29cfWqPbo
 UetMtw8CUEnybaWElSX6cG1rLsDBv9M8fdTLj8NPJFE16pwbaVq9cVWA4uz7b76daa0o
 JOFelYtJ96GsHGmlh0CnSFIMH+ubQ4nER8Nckilais8GLUoMFOPtDNa0hT5zBIWZUkDE
 7TeitOReluipDTZmFIWdjKp9FiDr+lWqjIq0utvdsGanqMtRlVOq6xPtcmqtTp0FDcdD
 QTvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=8oElHQLKFLOVtRHqu7xiZ6PSJACuRnWmCrjsIOT03/4=;
 b=uZA/sJ25vMpCJknCVlzZkuuY+3jyRbBnAihnLpUeROD0MQcgvWD/j6lZdI4Uo4I5Iy
 wno9zyINpRxY1hjxhYZAE8wyuebtgjJStV5H2aLEnMsfOPN5MaJDrk9LsSqYdG3PM8B2
 WPZEkQMD9c4YH5vIT3Zm3+6xCQqD8/njU/pHsjtyrUk5qt2M+/f0rbUahE2xyzpy7zB8
 u5i/kmpVGxJBA9ePYC0hD72thEmIxl+v3EBcUuuxDCqSPLIoy6ZPa/eHoEuzpj5YpmUH
 93JFNCJKZne0SCMkZvmT/suyAIz2MjGw8gDjYP+nb/4s0ULJX2kv+AkK/lp7CPi1nrdu
 P+iw==
X-Gm-Message-State: ANhLgQ2foQqxYrKlrmI/wMVRU72gNQCni91al6M4nhrsezC4LMTaXOmF
 OnadTNMljKvemdOUQbJGSpSu+qePyiah/YrItzM=
X-Google-Smtp-Source: ADFU+vt9/0tLT5TMHQJuvt7jSFZQO9BbU2DRVErpzh0iupQQjp//EFou6F5rBpQO/z0gYMAYYRnt+hMR7/PR6UXiFmE=
X-Received: by 2002:a92:8f53:: with SMTP id j80mr17379957ild.171.1584285909944; 
 Sun, 15 Mar 2020 08:25:09 -0700 (PDT)
MIME-Version: 1.0
References: <1583920112-2680-1-git-send-email-simhavcs@gmail.com>
 <20200312151752.GA7490@bogus>
In-Reply-To: <20200312151752.GA7490@bogus>
From: Vinay Simha B N <simhavcs@gmail.com>
Date: Sun, 15 Mar 2020 20:54:58 +0530
Message-ID: <CAGWqDJ7DP3DuR7EWT6Ni8YxN3Adg3RgJZut6+AtpAak_HB=QCQ@mail.gmail.com>
Subject: Re: [PATCH 1/2] dt-binding: Add DSI/LVDS tc358775 bridge bindings
To: Rob Herring <robh@kernel.org>
X-Mailman-Approved-At: Sun, 15 Mar 2020 23:19:05 +0000
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
 <devicetree@vger.kernel.org>, David Airlie <airlied@linux.ie>,
 open list <linux-kernel@vger.kernel.org>,
 "open list:DRM DRIVERS" <dri-devel@lists.freedesktop.org>,
 Andrzej Hajda <a.hajda@samsung.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

rob,

i do not get the error when running 'make dt_binding_check' in my
build environment
Documentation/devicetree/bindings/display/bridge/toshiba-tc358775.yaml

is there any tool available similar to  scripts/checkpatch.pl -f
<file> , for yaml files?

On Thu, Mar 12, 2020 at 8:47 PM Rob Herring <robh@kernel.org> wrote:
>
> On Wed, 11 Mar 2020 15:18:24 +0530, Vinay Simha BN wrote:
> > Add yaml documentation for DSI/LVDS tc358775 bridge
> >
> > Signed-off-by: Vinay Simha BN <simhavcs@gmail.com>
> >
> > ---
> > v1:
> >  Initial version
> > ---
> >  .../bindings/display/bridge/toshiba-tc358775.yaml  | 174 +++++++++++++++++++++
> >  1 file changed, 174 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/display/bridge/toshiba-tc358775.yaml
> >
>
> My bot found errors running 'make dt_binding_check' on your patch:
>
> Documentation/devicetree/bindings/display/bridge/toshiba-tc358775.yaml:  while scanning for the next token
> found character that cannot start any token
>   in "<unicode string>", line 11, column 1
> Documentation/devicetree/bindings/Makefile:12: recipe for target 'Documentation/devicetree/bindings/display/bridge/toshiba-tc358775.example.dts' failed
> make[1]: *** [Documentation/devicetree/bindings/display/bridge/toshiba-tc358775.example.dts] Error 1
> make[1]: *** Waiting for unfinished jobs....
> warning: no schema found in file: Documentation/devicetree/bindings/display/bridge/toshiba-tc358775.yaml
> /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/display/bridge/toshiba-tc358775.yaml: ignoring, error parsing file
> Makefile:1262: recipe for target 'dt_binding_check' failed
> make: *** [dt_binding_check] Error 2
>
> See https://patchwork.ozlabs.org/patch/1252753
> Please check and re-submit.



-- 
regards,
vinaysimha
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
