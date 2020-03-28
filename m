Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 17D4219751C
	for <lists+dri-devel@lfdr.de>; Mon, 30 Mar 2020 09:12:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AF52889F6D;
	Mon, 30 Mar 2020 07:11:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x543.google.com (mail-ed1-x543.google.com
 [IPv6:2a00:1450:4864:20::543])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F205F6EACB
 for <dri-devel@lists.freedesktop.org>; Sat, 28 Mar 2020 10:20:36 +0000 (UTC)
Received: by mail-ed1-x543.google.com with SMTP id e5so14609849edq.5
 for <dri-devel@lists.freedesktop.org>; Sat, 28 Mar 2020 03:20:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=fe7vSqTovofs2pbqQ9vBZGE4ICdZzytA51ufbrvug5A=;
 b=gZzoGR9pE2WwhIDeENQCW/x6kpV7USjpLVpyp0uH7+Fq6u4Pr6VyHGy5MxT65P1Jpw
 2IwFjZAWystaYH29GKa4oevh37fKQClAFd/6sCfi35W9/6H9b2st92hznyzG7txJxifb
 /rOL5DyfJHFcQ1DEf9C9BCL3MHhibBA+GsdlWkc2rtg4LaQNcOoG8QB05tzrj49/0eEl
 TNgbeY007ZskTRpSiblMaihBN7H0uViDxG4hyT5N99Ih65I26eZdiIXjHM30n+J5tKLq
 f17zIR90Cyfv7UAgzMoz+/WEq+n+OILmc0z/EbKvXtKix0P6yR+vJ4s4g6k4anerM3wJ
 WYtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=fe7vSqTovofs2pbqQ9vBZGE4ICdZzytA51ufbrvug5A=;
 b=aG1KLplXtKHpl6Ya6Agx+UPJb0A4Rzq92UPBn0VpHNti11j5ig32ME3/CMHHFz95on
 rOLnUUF+xVE5XfLw+LVThQLtkD9enednq0zeHVsb6eMUEGkC+ugbMDC+xdhZyhFC4s2Y
 F/n7whcH/8BVPZuJdpcjigxkiHgiGX/K0K4KmSXmbGjRVpwx5GmD5TcbDCLr4Fy4sdDW
 96k/Wue19zPQLVeGU0nzBRSjL5AFhol/AfNjhiSh0X82+8vFc63yqjGvDELtY915vOW+
 58V6eKeIt3X3RyBhB05tTbDMv1qElB71pqSmYh1d8qNJAbsVg3xbaNCzTJVG8/nvpASN
 7fDw==
X-Gm-Message-State: ANhLgQ2YO0h00nfBNyC8GFHlPmwTLI20I1dPyhNvvaYF6ptYklNm4fJP
 UrGt2WvcEFMfbER2OR64qfXQoEW9s8T5LyrnIYE=
X-Google-Smtp-Source: ADFU+vt+CGOstPPiyOkXccPeNwU+SbD3xZ1o9QkolQ8v/Gi9v/pdo4TjR6yY1eJHtp+rIWU3zHv5rAEhRHHb9xghbBI=
X-Received: by 2002:a05:6402:b14:: with SMTP id
 bm20mr2831787edb.365.1585390835491; 
 Sat, 28 Mar 2020 03:20:35 -0700 (PDT)
MIME-Version: 1.0
References: <20200319203427.2259891-1-martin.blumenstingl@googlemail.com>
 <20200319203427.2259891-3-martin.blumenstingl@googlemail.com>
 <CAKGbVbtKqdCEcawkjG=7TRd30df6GJ+gagV_JegntyqRpzC4cg@mail.gmail.com>
 <CAKGbVbvAvk0L5sGQmuqfxeL6AwtVnSsYyCp6YBYV6ZHKepWBXg@mail.gmail.com>
In-Reply-To: <CAKGbVbvAvk0L5sGQmuqfxeL6AwtVnSsYyCp6YBYV6ZHKepWBXg@mail.gmail.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Sat, 28 Mar 2020 11:20:24 +0100
Message-ID: <CAFBinCDUhVaky6EUA7dOAhAZM9itbydQ+w=0P-1m2u0o0HUUeA@mail.gmail.com>
Subject: Re: [PATCH v4 2/2] drm/lima: Add optional devfreq and cooling device
 support
To: Qiang Yu <yuq825@gmail.com>
X-Mailman-Approved-At: Mon, 30 Mar 2020 07:11:44 +0000
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
Cc: Tomeu Vizoso <tomeu.vizoso@collabora.com>, linux-pm@vger.kernel.org,
 David Airlie <airlied@linux.ie>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Steven Price <steven.price@arm.com>, linux-rockchip@lists.infradead.org,
 Chen-Yu Tsai <wens@csie.org>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
 "open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sat, Mar 28, 2020 at 9:40 AM Qiang Yu <yuq825@gmail.com> wrote:
>
> Applied to drm-misc-next.
thank you!

regarding patch #1 - can you apply this as well?
patch #1 just takes this midgard change [0] and ports it to utgard


Thank you!
Martin


[0] https://cgit.freedesktop.org/drm/drm-misc/commit/Documentation/devicetree/bindings/gpu?id=982c0500fd1a8012c31d3c9dd8de285129904656
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
