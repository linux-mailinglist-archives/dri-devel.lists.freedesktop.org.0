Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 03DB31D479B
	for <lists+dri-devel@lfdr.de>; Fri, 15 May 2020 10:01:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 12C746EC0F;
	Fri, 15 May 2020 08:01:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-f65.google.com (mail-ot1-f65.google.com
 [209.85.210.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4A5906EC0F
 for <dri-devel@lists.freedesktop.org>; Fri, 15 May 2020 08:01:54 +0000 (UTC)
Received: by mail-ot1-f65.google.com with SMTP id x21so524386otp.13
 for <dri-devel@lists.freedesktop.org>; Fri, 15 May 2020 01:01:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=No2JaVz5PL9MmPbAv0tHg6IM3vHIPX+5t5AsaHw9gns=;
 b=IRisPxhitKAuM+PaS8uIW5+uZrvMhsx1vUaiOeNhxTlHdFKLH6S93223Dj3n8xAw7I
 SjCi42wrH5fQVGVlLOgmPJ6pzahHc7cfHITR0ZwfrJOL6pY8fA7A4BVH7WZDIYwwwl+V
 OzIPfLC7uan4fgXf5WHTVYVqvUg8G3QR2Kwdq8BT1SRYMMh/IyvAHwQhmiJjjZs9IOUl
 jq+w09p2qTBd0+d11+/jBgSVeqt8dPw9P6hISUvt09dq13Dt7NFk4gTXMDaja6H1myS/
 5GhhqY0f0uFXmgC5M3jwXrjzJ4cXZDcOLwk5GWNAOXMnUh45Y0RbHezO/OJVEd79/Zug
 oc9w==
X-Gm-Message-State: AOAM5312iterOEAqzPuEvEbKBNNht9dWUSHnC38C3c4MkK+IOYIyJX5t
 9byjFlyV52J/a6q2HQw0nF2bPQQSRmMgRCLK4zM=
X-Google-Smtp-Source: ABdhPJwCq6Y/lOs53RDggLTbS01RRScdoE3P0pVdRcRsT6E+Llk//ag9J6IDyB3C9hS6lPP/nYJ2mm4UVfS8s0ycXAc=
X-Received: by 2002:a9d:7e92:: with SMTP id m18mr1308992otp.145.1589529713631; 
 Fri, 15 May 2020 01:01:53 -0700 (PDT)
MIME-Version: 1.0
References: <20200515012432.31326-1-laurent.pinchart+renesas@ideasonboard.com>
 <20200515012432.31326-4-laurent.pinchart+renesas@ideasonboard.com>
In-Reply-To: <20200515012432.31326-4-laurent.pinchart+renesas@ideasonboard.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 15 May 2020 10:01:42 +0200
Message-ID: <CAMuHMdUtZOB4_mZ56C-12ir3RjtMp1S13WN6PMcQYN1yj_XyKQ@mail.gmail.com>
Subject: Re: [PATCH 3/8] dt-bindings: media: renesas,fcp: Add resets and
 iommus properties
To: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
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
Cc: Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Linux Media Mailing List <linux-media@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, May 15, 2020 at 3:45 AM Laurent Pinchart
<laurent.pinchart+renesas@ideasonboard.com> wrote:
> The resets and iommus properties are used in DT sources in the kernel
> tree. Document them, and make resets mandatory. The iommus property is
> optional as not all platforms wire the FCP to a functional IOMMU.
>
> Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
