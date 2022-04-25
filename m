Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EAE350DCEA
	for <lists+dri-devel@lfdr.de>; Mon, 25 Apr 2022 11:39:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9999D10E035;
	Mon, 25 Apr 2022 09:39:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-f172.google.com (mail-qt1-f172.google.com
 [209.85.160.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 218DF10E035
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Apr 2022 09:39:35 +0000 (UTC)
Received: by mail-qt1-f172.google.com with SMTP id t11so2993166qto.11
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Apr 2022 02:39:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=2tRy3X+G6F9AMLfmEd/AYKFbsJoOv/Jn2GeWGmxIUWo=;
 b=D+D4YVmL2hSDM/j3CvMVcR4mkQpRahfdnKBPFegQ+y8rstJL+0vkvJ5rscry1bJ/Fu
 Vk4sYyqjogeiJmSPc/2AuwkOhNzOFZOIBGc+Ka55CUib7LBxNBNkFZEJwSDYmPlrRZC1
 BtDjci80YC4qOxc1jf38m2DvZPCTEO7QbD5IVx40+LExxIyrznYC6C4KHz0dHGBHKppi
 IJAtkAuAuqUYc0x5xZv19GuEh1adqZhkDQEp9UcGQuBfNGE3FVnEA6/ebZbyEqiyvHj9
 jxm/cuMr9Z2ry2Jd7j0uoycQpW5Nk8lM/sOXMGiu+/ILof0TMI0FsyGyfLUZe842EGMy
 cI2g==
X-Gm-Message-State: AOAM530vzOuf+0CQuDuEdItu/Z2kosWjtwT4hSZ2i4S1Jypqzf0vVDgj
 h6+7hoONr+lm/sEJkuapc+RP0pkIBMFW2w==
X-Google-Smtp-Source: ABdhPJznywd9EDPGSHmw5wvs8rHxNfK6zfxpS1oNtBRI03FfEiYPxlhRgJngRscvJ4u4SiNLSyLbBg==
X-Received: by 2002:a05:622a:1d6:b0:2e2:db3:17c9 with SMTP id
 t22-20020a05622a01d600b002e20db317c9mr11178743qtw.665.1650879573992; 
 Mon, 25 Apr 2022 02:39:33 -0700 (PDT)
Received: from mail-yb1-f172.google.com (mail-yb1-f172.google.com.
 [209.85.219.172]) by smtp.gmail.com with ESMTPSA id
 t125-20020a372d83000000b0069c1df12422sm4622045qkh.84.2022.04.25.02.39.33
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 25 Apr 2022 02:39:33 -0700 (PDT)
Received: by mail-yb1-f172.google.com with SMTP id j2so26045487ybu.0
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Apr 2022 02:39:33 -0700 (PDT)
X-Received: by 2002:a25:3492:0:b0:645:6f78:b3b4 with SMTP id
 b140-20020a253492000000b006456f78b3b4mr15527731yba.546.1650879573436; Mon, 25
 Apr 2022 02:39:33 -0700 (PDT)
MIME-Version: 1.0
References: <20220424214550.19463-1-laurent.pinchart+renesas@ideasonboard.com>
In-Reply-To: <20220424214550.19463-1-laurent.pinchart+renesas@ideasonboard.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 25 Apr 2022 11:39:21 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXWqvwrNBCBtjOHs6+Dn-+OSKw94Reug5ggt_TzhE9y7Q@mail.gmail.com>
Message-ID: <CAMuHMdXWqvwrNBCBtjOHs6+Dn-+OSKw94Reug5ggt_TzhE9y7Q@mail.gmail.com>
Subject: Re: [PATCH] drm: rcar-du: Drop file name from comment header blocks
To: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
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
Cc: Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
 Biju Das <biju.das.jz@bp.renesas.com>,
 Kieran Bingham <kieran.bingham@ideasonboard.com>,
 DRI Development <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sun, Apr 24, 2022 at 11:46 PM Laurent Pinchart
<laurent.pinchart+renesas@ideasonboard.com> wrote:
> The comment blocks at the beginning of each file have a one-line
> summary description of the file that includes the file name. While the
> description is useful, the file name only creates opportunities for
> mistakes (as seen in rcar_du_vsp.c) without any added value. Drop it.
>
> Reported-by: Biju Das <biju.das.jz@bp.renesas.com>
> Suggested-by: Geert Uytterhoeven <geert@linux-m68k.org>
> Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
