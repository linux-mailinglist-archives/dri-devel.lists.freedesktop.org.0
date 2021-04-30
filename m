Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 43F2C36F75E
	for <lists+dri-devel@lfdr.de>; Fri, 30 Apr 2021 10:49:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 614306E0E5;
	Fri, 30 Apr 2021 08:49:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-x12f.google.com (mail-il1-x12f.google.com
 [IPv6:2607:f8b0:4864:20::12f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 441186E0E5
 for <dri-devel@lists.freedesktop.org>; Fri, 30 Apr 2021 08:49:47 +0000 (UTC)
Received: by mail-il1-x12f.google.com with SMTP id e14so1046198ils.12
 for <dri-devel@lists.freedesktop.org>; Fri, 30 Apr 2021 01:49:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=6XpLFpvoM/MyCxucScV9GHbc1u0ufErrdczH8fINryA=;
 b=XfdyiakISQV0rCr116VJNrN1pSVJBxJnhTJ36wAigGd+atH9iiXt0+lNxlH+horNLb
 ITiUPgvRVyeFfalzkClX0syUiifPxjCE6CGSGGJp/t28z5etiIkNkRO9rIrnkUu15fhf
 GIO1TP2+iIaDMYSRGGp2MyxlEKrb6aGXi9T+9uaIzTKMecoxdO77gb/cI3OjjYXfDElj
 ozBDRGBu/DhpEiRe7fJsEXyaDafnVYnU0y4y4QTe42zmjWctSLpA+9WW9KGIDPCAgNoe
 w3H/j2m9HLeM9sQcgJqcggbYuKqInYiWAIqck2rs3kHs5USyYLaW9h7KmKNfRrqPhiDV
 Bghg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=6XpLFpvoM/MyCxucScV9GHbc1u0ufErrdczH8fINryA=;
 b=XLdW066H8z4hoXOJDntgDKDyFThiyV+MTH+czMoQSgrSjXfgFBMr20MsXJUxbZhCT1
 J7+tKUdwOxlBwAFlBWqXXnQUOIj11dm1luq8k9SXWI6CrHXW4a3HjTz6D72cpJca6q/8
 L2NYzyeh53Luv7mtPMf+gum48/myMYIMTqJqVJn/1DBWjirjzEOHiBSTW5tDkQqK8pDg
 YPJfUL210ehX30I3pX4P+nxCl4RXWNsLJqeJMY74htibbUT5rE/SNx4JrCVcrdS8EakH
 bBe5z6xCfdYe0H5xgJUUUECsCFHl9T0Z5h317xZPeBsd6V2mX8lXLi8Nk0TVvPRJu9Cd
 trwg==
X-Gm-Message-State: AOAM533YslI8JIHGJDjdpSthJSn7nhmza0yDCgxnlkyc9WyE9RCVAaq4
 130wTTwv+aazsSAJc1xioKZpPYhxMofoOlF8ks4=
X-Google-Smtp-Source: ABdhPJwq7AMNZNBViIBThuRjUDAbnJQd0R8zTalusTtudatSMQDlQfcewQ6cSi3aISJKRV4yX05N2MCV3b2pDAn5iAM=
X-Received: by 2002:a92:3203:: with SMTP id z3mr3244322ile.22.1619772586655;
 Fri, 30 Apr 2021 01:49:46 -0700 (PDT)
MIME-Version: 1.0
References: <20210423034247.992052-1-art@khadas.com>
 <20210423114735.GA5507@sirena.org.uk>
 <CAKaHn9+d5crmmG-aKyLuvyxk+A7aC9qqfX_3wuMXm50pg+pZ4w@mail.gmail.com>
 <20210426115645.GB4590@sirena.org.uk>
In-Reply-To: <20210426115645.GB4590@sirena.org.uk>
From: Art Nikpal <email2tema@gmail.com>
Date: Fri, 30 Apr 2021 16:49:35 +0800
Message-ID: <CAKaHn9JM-KEiz3_Btsz8_fr7hcZ2Sm8B64VyLvgpvKK-NKco3w@mail.gmail.com>
Subject: Re: [PATCH] SPI: meson-spifc add missed calls to remove function
To: Mark Brown <broonie@kernel.org>
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
Cc: Gouwa Wang <gouwa@khadas.com>, Neil Armstrong <narmstrong@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Kevin Hilman <khilman@baylibre.com>,
 Christian Hewitt <christianshewitt@gmail.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-spi@vger.kernel.org, nick@khadas.com,
 linux-amlogic@lists.infradead.org, Artem Lapkin <art@khadas.com>,
 linux-arm-kernel@lists.infradead.org, jbrunet@baylibre.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Yep! but

if i try call spi_master_put(master) or spi_unregister_controller(master);
it's made Segmentation fault for me

what's wrong - may be somebody can help me


On Mon, Apr 26, 2021 at 7:57 PM Mark Brown <broonie@kernel.org> wrote:
>
> On Sat, Apr 24, 2021 at 07:57:19AM +0800, Art Nikpal wrote:
>
> > > I would expect the driver to unregister the controller at the start of
> > > the remove function, suspend doesn't really make sense here
>
> > It's strange - But without spi_master_suspend i have randomly stucks when i
> > try unload this module - as was written before
> > i was test it (load/unload module in loop) and for me suspend make sense
> > here
>
> > If anybody has another solution - or real problem not here - please write
> > to me the right way!
>
> As I said above unregister the controller at the start of the remove
> function.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
