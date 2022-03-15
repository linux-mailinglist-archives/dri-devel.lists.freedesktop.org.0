Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CFB04D95A8
	for <lists+dri-devel@lfdr.de>; Tue, 15 Mar 2022 08:52:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2AC1610E3E3;
	Tue, 15 Mar 2022 07:52:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-f179.google.com (mail-qt1-f179.google.com
 [209.85.160.179])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 33D9B10E3E3
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Mar 2022 07:52:36 +0000 (UTC)
Received: by mail-qt1-f179.google.com with SMTP id n11so9568555qtk.4
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Mar 2022 00:52:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=dLrWH/HTunHeNVedUT22wD7fuCnOVdEr3MibPq0EL+Y=;
 b=uczkBoop0gWY2p6IdwEuvPEv8otSs6xCBh7A3Y0T+hMVg78h1VCW77iUgoE0XatS5g
 Xeg2EoKFKLRjvu+nkBqqm17xtDhVH+MYoJ+4byL0zA7Gsd7mLNDBZQB+AXLOQJsCaSVq
 5tqqAGtr6sOpbeVT5PVN/W+9369QbRVUc4RMw3jHhRV9VbdOuiNTb2W7e2/AHKbu96OV
 ZyalrMwgSZAf0DEyuA59lhVczLbvOwNVAniDpdvzVwrAKzrHZAwsE1IwbUVsjHKNR634
 pmAcxtA+mrqIOQ4ofO4AhFUN/EUHUWAQc2V6EC62Zae0J9Crd3MLBoKe7ddbMop42Sgs
 slGg==
X-Gm-Message-State: AOAM531/ZuU2C23EpB0Q7d6Y6kpp+ny4g1fwMZnKNn0VW6KpVnSznzyh
 NXsQFFDdPmF/PD2skfMc/VEYXSVIWV+V7w==
X-Google-Smtp-Source: ABdhPJxuvnaENfReYgVZK5lP7DjOsmygktA94c3t07nt5pDH24db/x8yAUEsDS++T2jngbPSLycF2Q==
X-Received: by 2002:a05:622a:1899:b0:2e1:b3d2:138d with SMTP id
 v25-20020a05622a189900b002e1b3d2138dmr19230083qtc.331.1647330754727; 
 Tue, 15 Mar 2022 00:52:34 -0700 (PDT)
Received: from mail-yb1-f170.google.com (mail-yb1-f170.google.com.
 [209.85.219.170]) by smtp.gmail.com with ESMTPSA id
 x5-20020ae9e645000000b0067b122fae88sm8978989qkl.2.2022.03.15.00.52.33
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 15 Mar 2022 00:52:33 -0700 (PDT)
Received: by mail-yb1-f170.google.com with SMTP id l2so35653750ybe.8
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Mar 2022 00:52:33 -0700 (PDT)
X-Received: by 2002:a25:bc8f:0:b0:628:8649:5c4b with SMTP id
 e15-20020a25bc8f000000b0062886495c4bmr21295331ybk.207.1647330753044; Tue, 15
 Mar 2022 00:52:33 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1646683502.git.geert@linux-m68k.org>
 <8d3c0cc370b0214244b01a64c588e5e506531716.1646683502.git.geert@linux-m68k.org>
 <CAMuHMdVq19wpA_7nKKTm-G2EmK3cMxxP6nbR_u=vkazqCZ=KhQ@mail.gmail.com>
 <20220314170539.17400f93@eldfell>
 <CAMuHMdVj8wxAVbcov1wFsgt_knMkcySBH8nMoKjyr=G+mLQmjQ@mail.gmail.com>
 <1f915fcc-1d95-99d1-c7b7-dc4e3b49e09f@linux-m68k.org>
 <20220315093250.71352a56@eldfell>
 <CAMuHMdVU=JKwEn-=Wf3CYObtaLt2T7NmWrXUwdPHdvNsbgge=g@mail.gmail.com>
In-Reply-To: <CAMuHMdVU=JKwEn-=Wf3CYObtaLt2T7NmWrXUwdPHdvNsbgge=g@mail.gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 15 Mar 2022 08:52:21 +0100
X-Gmail-Original-Message-ID: <CAMuHMdUOwVLBLmxaVUO4yADVCf1k7CyhBZiesHx2Fr4LW3QWMQ@mail.gmail.com>
Message-ID: <CAMuHMdUOwVLBLmxaVUO4yADVCf1k7CyhBZiesHx2Fr4LW3QWMQ@mail.gmail.com>
Subject: Re: [PATCH v2 05/10] drm/fourcc: Add DRM_FORMAT_C[124]
To: Pekka Paalanen <ppaalanen@gmail.com>
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
Cc: Linux Fbdev development list <linux-fbdev@vger.kernel.org>,
 Finn Thain <fthain@linux-m68k.org>, David Airlie <airlied@linux.ie>,
 Helge Deller <deller@gmx.de>, Javier Martinez Canillas <javierm@redhat.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux/m68k <linux-m68k@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Sam Ravnborg <sam@ravnborg.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Mar 15, 2022 at 8:51 AM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> > Also, when drm_fourcc.h is describing pixel formats, it needs to
> > consider only how a little-endian CPU accesses them. That's how pixel
> > data in memory is described. Display hardware plays no part in that.
> > It is the driver's job to expose the pixel formats that match display
> > hardware behaviour.
>
> But if the "CPU format" does not match the "display support",

s/support/format/

> all pixel data must be converted?

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
