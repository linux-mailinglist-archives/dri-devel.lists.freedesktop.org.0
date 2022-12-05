Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A6489642501
	for <lists+dri-devel@lfdr.de>; Mon,  5 Dec 2022 09:47:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6900810E127;
	Mon,  5 Dec 2022 08:47:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-f172.google.com (mail-qt1-f172.google.com
 [209.85.160.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 700DA10E127
 for <dri-devel@lists.freedesktop.org>; Mon,  5 Dec 2022 08:47:22 +0000 (UTC)
Received: by mail-qt1-f172.google.com with SMTP id h24so10912030qta.9
 for <dri-devel@lists.freedesktop.org>; Mon, 05 Dec 2022 00:47:22 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=/2M6e7vkBDgSrCC9BD3sQ0rLf96pF/miUTqj+QzFjF8=;
 b=xQUpf/Euc8Mc/obpbiaPtJ1J+5x/riyJaIOoeEEW0ON8kpgXPTOnoSYmIyAEZQ1Dc6
 6UzJiOMwrTYlHxCwkRs8UiU0V0TtcszkwHXI+M5sfbal4Y0K1DhiPsi4stXqKIuJDYzt
 0RMIrIBDMW0QhNMoAccIYChgoyr4PMRg+V0DVuR0eAgvLL0bXZ/AIJ+coF/zXh1v5lxo
 MhQ06h2iHMBT4iebx9xMU4hQLrn47UE53Otlm59MFAOLivRCbnWfPUniaHvd6PW8EWMx
 o2yJPUNRTamNty2OyEKmt85k9ZDOIa+RkQNNHJGnHF7qy+oANWoew+xR+Wqk+txbl6sV
 +w5Q==
X-Gm-Message-State: ANoB5pl1n8i89HhaLA9MwihnagG3yWgjPQMwLbJFLOex5s1x3uqa/YOE
 SgxskoaZnTPf+xILoZYFBClfV9KHfFUhyA==
X-Google-Smtp-Source: AA0mqf5PG3RNk86a/nU7lB+qoXHuCgpwukYE+iJmBF/jySxri1IKPrYO9uMTNUWQ9fsBTOGwA6mVNA==
X-Received: by 2002:ac8:60d9:0:b0:3a7:e616:e091 with SMTP id
 i25-20020ac860d9000000b003a7e616e091mr1411214qtm.537.1670230041391; 
 Mon, 05 Dec 2022 00:47:21 -0800 (PST)
Received: from mail-yw1-f174.google.com (mail-yw1-f174.google.com.
 [209.85.128.174]) by smtp.gmail.com with ESMTPSA id
 c15-20020ac8518f000000b003a7e7bb0432sm383808qtn.29.2022.12.05.00.47.20
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 05 Dec 2022 00:47:21 -0800 (PST)
Received: by mail-yw1-f174.google.com with SMTP id
 00721157ae682-3b48b139b46so110445597b3.12
 for <dri-devel@lists.freedesktop.org>; Mon, 05 Dec 2022 00:47:20 -0800 (PST)
X-Received: by 2002:a05:690c:b81:b0:37e:6806:a5f9 with SMTP id
 ck1-20020a05690c0b8100b0037e6806a5f9mr60999579ywb.47.1670230040599; Mon, 05
 Dec 2022 00:47:20 -0800 (PST)
MIME-Version: 1.0
References: <202212051631391777945@zte.com.cn>
In-Reply-To: <202212051631391777945@zte.com.cn>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 5 Dec 2022 09:47:08 +0100
X-Gmail-Original-Message-ID: <CAMuHMdV=ryCjskpYeh8vCo+ZUapuNBNFS22JktxARy+1XgSEtQ@mail.gmail.com>
Message-ID: <CAMuHMdV=ryCjskpYeh8vCo+ZUapuNBNFS22JktxARy+1XgSEtQ@mail.gmail.com>
Subject: Re: [PATCH linux-next v3] fbdev: use sysfs_emit() to instead of
 scnprintf()
To: ye.xingchen@zte.com.cn
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
Cc: linux-fbdev@vger.kernel.org, geert+renesas@glider.be, deller@gmx.de,
 javierm@redhat.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, tzimmermann@suse.de
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Ye,

Thanks for your patch!

On Mon, Dec 5, 2022 at 9:31 AM <ye.xingchen@zte.com.cn> wrote:
> From: ye xingchen <ye.xingchen@zte.com.cn>
>
> Follow the advice of the Documentation/filesystems/sysfs.rst and show()
> should only use sysfs_emit() or sysfs_emit_at() when formatting the
> value to be returned to user space.
>
> Signed-off-by: ye xingchen <ye.xingchen@zte.com.cn>
> ---
> v2 -> v3
> Fix the mistakes in v2.

Indeed, that's usually what a v3 does ;-)
It would help if you listed the actual changes instead.

But "b4 diff 202212051631391777945@zte.com.cn" doesn't show any?

Thanks!

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
