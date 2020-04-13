Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 438D41A6796
	for <lists+dri-devel@lfdr.de>; Mon, 13 Apr 2020 16:12:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 325E089E1D;
	Mon, 13 Apr 2020 14:12:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f68.google.com (mail-ed1-f68.google.com
 [209.85.208.68])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 957B489E1D
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Apr 2020 14:12:52 +0000 (UTC)
Received: by mail-ed1-f68.google.com with SMTP id s10so3948167edy.9
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Apr 2020 07:12:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=qwii8YlQE8mee1Z5xIVhf603RnvUDTx/2KtWa57lsHE=;
 b=Nq/hvfpwHEUJ7ewb/Mmg6IE/TIsWKyh6Ev319Xatdu6MYaRObw8KX+BT5XwOQZpVG7
 NkPB+W+aQ30gJHdf1rFT0lH0nJ2owrsSQZQNofVljRKgFW2XINJWXMzHfD4IIdNTadAS
 RaLbaGKk9Ejpm6imBBM3haWJssaJlLn94XsCi0rH0dCai0CqEgC8KEuXYpBk51YfZ2tQ
 uwMqNZmJz/dWam1Xot3p1Pahilr6bE4s72JjZ69jskkRcdo6d6wpIDUdyX+nbg5FFiL5
 aRXvsfQABPDzGjZHfFHhhs22pGe/C9/+JFuB2BE4x9lw+qYw46Mbrq8dbz6Ofepjk4Yt
 I2ww==
X-Gm-Message-State: AGi0Pua+EaakW9104uuRvYBsZt3gOrek9kcqHCIxX6VSiu2BspwccWdJ
 WaxcZEcJa2sMlzUB+0akKBX1FZMNzxQ=
X-Google-Smtp-Source: APiQypIGYRKIaY97VCbor6OwHwHJD/dy+rBf89IrpzYBpavnhmIm+Tc37fyBb9DcLD5qqkF1UrKAMg==
X-Received: by 2002:a50:fb9a:: with SMTP id e26mr15285118edq.377.1586787170805; 
 Mon, 13 Apr 2020 07:12:50 -0700 (PDT)
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com.
 [209.85.221.47])
 by smtp.gmail.com with ESMTPSA id k18sm1594093ejq.84.2020.04.13.07.12.50
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 13 Apr 2020 07:12:50 -0700 (PDT)
Received: by mail-wr1-f47.google.com with SMTP id d27so1073389wra.1
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Apr 2020 07:12:50 -0700 (PDT)
X-Received: by 2002:adf:f04a:: with SMTP id t10mr6751961wro.64.1586787169975; 
 Mon, 13 Apr 2020 07:12:49 -0700 (PDT)
MIME-Version: 1.0
References: <20200413095457.1176754-1-jernej.skrabec@siol.net>
 <CAGb2v65qetxxVX1yoCjyduM4zRTyF3YKX1g9CuaHZkF_Z+AKQg@mail.gmail.com>
In-Reply-To: <CAGb2v65qetxxVX1yoCjyduM4zRTyF3YKX1g9CuaHZkF_Z+AKQg@mail.gmail.com>
From: Chen-Yu Tsai <wens@csie.org>
Date: Mon, 13 Apr 2020 22:12:39 +0800
X-Gmail-Original-Message-ID: <CAGb2v66LxhqTBeA_Br=kUrTq83hocEcAzYYC6nXpASvkkjn+1g@mail.gmail.com>
Message-ID: <CAGb2v66LxhqTBeA_Br=kUrTq83hocEcAzYYC6nXpASvkkjn+1g@mail.gmail.com>
Subject: Re: [PATCH] drm/sun4i: hdmi ddc clk: Fix size of m divider
To: Jernej Skrabec <jernej.skrabec@siol.net>,
 Maxime Ripard <mripard@kernel.org>
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
Cc: David Airlie <airlied@linux.ie>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Apr 13, 2020 at 6:11 PM Chen-Yu Tsai <wens@csie.org> wrote:
>
> On Mon, Apr 13, 2020 at 5:55 PM Jernej Skrabec <jernej.skrabec@siol.net> wrote:
> >
> > m divider in DDC clock register is 4 bits wide. Fix that.
> >
> > Fixes: 9c5681011a0c ("drm/sun4i: Add HDMI support")
> > Signed-off-by: Jernej Skrabec <jernej.skrabec@siol.net>
>
> Reviewed-by: Chen-Yu Tsai <wens@csie.org>

Cc stable?
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
