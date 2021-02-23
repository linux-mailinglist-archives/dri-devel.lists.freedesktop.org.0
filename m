Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 037EE322CA8
	for <lists+dri-devel@lfdr.de>; Tue, 23 Feb 2021 15:44:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C3EA46E838;
	Tue, 23 Feb 2021 14:44:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [IPv6:2a00:1450:4864:20::329])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A208F6E838
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Feb 2021 14:44:09 +0000 (UTC)
Received: by mail-wm1-x329.google.com with SMTP id o16so758725wmh.0
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Feb 2021 06:44:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fooishbar-org.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=yycLNDM5Jja/WKv5UcYK74fWgM1ylVR065tnmkV9a+U=;
 b=bVfqetSKmH0KFQWh30nnZhRb3FSSqD1lQ8KQm4iK7gAtpjPwf5byyezOaaj2xhjDG8
 yuUdj2Czlx0oFAu4zPIN60VVbZihI+2SdjvyF9gYIknUPE12pyBJ8qGbPon9H/+BitMy
 CVqbiZEYMdDJfP5fkktzi0NWFWcRlaVyO5oFawJK33VzguL3PHQI6MxbvzJ22c+YR03n
 1y3ch094Q4GSA2RYNvljctndjUIEvpbmsGCjIQa+0bNDUwiFBBydxUZMkNpjJrd378eF
 oRT5+WitdxeNA/yUgpUI8HD3ZRC0mTcHWB8rcvXwU7neBIUSWZgNy9inJwUKpFPCKuEi
 aNNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=yycLNDM5Jja/WKv5UcYK74fWgM1ylVR065tnmkV9a+U=;
 b=fLiqhVNn+oqa1HfEiwiVz2CJhmsQptPq063x7TxDmWmCZGP8vpSUVcX3fF9ZCxcLcX
 8waygNFoy1Z4zXUqb9EmJcsD3PFlKk7tJrPFKSEBfGkUQcHwuAkYqiVPQiOOK5t71F+9
 Mx+N43y+yPVIh8rXmh9W+xkg3rFJN1dpwL4lVwUL0QxSn+U8xhn8fgOu8rIxClcEjcHr
 zbQpLZayt/xvWUEMT+ZF9RiDqUtJccsvS0p5anMH9836zfgZb6Q66HnC1DAGfNG8sE3d
 yxb0U66J3htdxe2ipcgMoUxDqL8gnwPCPMFq5aeTo7ZkZAf5rqyErh41v7YuRQl1cyMp
 fDHA==
X-Gm-Message-State: AOAM532KEqdGkISksk/nj1n8+/qwtPc/4uw7iNyUimpyhEowRfYtDoa1
 OQ5YCKy6ajTT8Gg7bxRZloT/gCruUyyNajaa2yW5Ww==
X-Google-Smtp-Source: ABdhPJwlKOkN+si71DuZZmSLa53NEDdaUB445YKm/6ZiRjVDHaP8g2BSyXzfuTlzdOUL7KKcKrUmiaUzTWSg4j+lBfg=
X-Received: by 2002:a1c:1982:: with SMTP id 124mr25825911wmz.84.1614091448105; 
 Tue, 23 Feb 2021 06:44:08 -0800 (PST)
MIME-Version: 1.0
References: <20200811202631.3603-1-alyssa.rosenzweig@collabora.com>
 <CAPj87rMS5zxY6sK4N8zVZF9MHThmURj6kuso=G5+MQDVmNjC4Q@mail.gmail.com>
In-Reply-To: <CAPj87rMS5zxY6sK4N8zVZF9MHThmURj6kuso=G5+MQDVmNjC4Q@mail.gmail.com>
From: Daniel Stone <daniel@fooishbar.org>
Date: Tue, 23 Feb 2021 14:43:56 +0000
Message-ID: <CAPj87rNy9TWn=GSK=gVzW9Y71anZe2oeq8sUoYwPW+vwoLFxpA@mail.gmail.com>
Subject: Re: [PATCH] drm/rockchip: Require the YTR modifier for AFBC
To: Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>
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
Cc: Sandy Huang <hjc@rock-chips.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Andrzej Pietrasiewicz <andrzej.p@collabora.com>,
 linux-rockchip <linux-rockchip@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Tue, 23 Feb 2021 at 14:27, Daniel Stone <daniel@fooishbar.org> wrote:
> Bumping this one: it seems like the Rockchip VOP either always applies
> the YTR transform, or has a YTR control bit which is not documented in
> the driver's register definitions. This means that it is incorrect to
> advertise the currently-used modifier, which specifies that YTR is
> _not_ used, and doing so breaks Panfrost which correctly uses the
> modifier as documented. Based on our knowledge of Mali, we believe
> that Panfrost is correct, and the error lies with Rockchip erroneously
> using the YTR transform in the VOP's AFBC decoder despite declaring
> through the modifier that YTR is not in use.
>
> Looking at the downstream vendor tree, VOP2 as used in newer SoCs has
> explicit control bits for YTR and other AFBC knobs, but this has been
> substantially reworked from the original VOP and is not applicable to
> this IP block.
>
> Mark, or others from Rockchip, can you please:

Sorry, I meant Sandy rather than Mark! Old habits die hard.

Anyway, this patch itself is:
Acked-by: Daniel Stone <daniels@collabora.com>

Cheers,
Daniel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
