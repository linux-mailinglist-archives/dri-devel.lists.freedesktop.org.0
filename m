Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EC501E1360
	for <lists+dri-devel@lfdr.de>; Mon, 25 May 2020 19:27:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 83CDF6E0D1;
	Mon, 25 May 2020 17:27:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x244.google.com (mail-oi1-x244.google.com
 [IPv6:2607:f8b0:4864:20::244])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 18EB46E0D1
 for <dri-devel@lists.freedesktop.org>; Mon, 25 May 2020 17:26:59 +0000 (UTC)
Received: by mail-oi1-x244.google.com with SMTP id b3so16521550oib.13
 for <dri-devel@lists.freedesktop.org>; Mon, 25 May 2020 10:26:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Hrf/yMlDkSvQetKM/HHl00ALv1ebVPWax6zOPG2rmWs=;
 b=PUEidobI+DpFiunltbBSsEDSGYk3mmxqmPvK2JwGseP8a6sRwf2B6ZFZichmBlcR2N
 TF2Qty5trTxRp5F4ZzTD7U00XNLAEqId32+P4HMdQp0Mz+C/TJ4rRslzDey+10Bo1CRI
 1hx2ibcvJous1lNCvz0vF7swzfYR0WXMrQEOE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Hrf/yMlDkSvQetKM/HHl00ALv1ebVPWax6zOPG2rmWs=;
 b=qOJeCOEm/mrDU7rc2wQ0naVZz7AaG9Xneat+6f2X+luIEPzGxuOCSKsrV9DbV7i/Kw
 /Jp8loOZ+HxUdMI98GCDbAnkY7wZqJqruf9FBPQQpjCT3oK3p2+R7Q/EaQTcGgXMDPxE
 GmGkchmGVfyHsbB6lyqDeGOqhZNRa6lPiNJ0rExjv4xJM/f8gkMapb96I0zQVBYd4ZJh
 hqxSxwehGFSkU2z8TzkUdprhajveEyD/4vuPQYjbNtBipPXKby+W9CgQ0SZcdWWKLxhg
 dBGOhobmX4nNEtdUHIvBA5/UT7c9KujaIg+b52hm8/wQXSL4Z5fFCBPdiJNyyaFcIJaV
 5lJw==
X-Gm-Message-State: AOAM532WnQOkVjOb9BGx3RvqRs7e6AGEO6BPzAYz7/MGxPR85GGaCiYF
 P2PG+4e3r7P+R74l4jkzoXwmmRxzIrPBCY8NQSua+v6eVV8=
X-Google-Smtp-Source: ABdhPJxbi1iPpD4AVnpMI6aTbErt8Dou2F0NAZiigbJS5+V54GhGaL5JNzZUQ/yIJFzlvBTEc4GLOuJn5idZFnY7Qn0=
X-Received: by 2002:a05:6808:282:: with SMTP id
 z2mr11029391oic.101.1590427618345; 
 Mon, 25 May 2020 10:26:58 -0700 (PDT)
MIME-Version: 1.0
References: <CY4PR1201MB013664B33FE72449DB0A6F65DEB30@CY4PR1201MB0136.namprd12.prod.outlook.com>
In-Reply-To: <CY4PR1201MB013664B33FE72449DB0A6F65DEB30@CY4PR1201MB0136.namprd12.prod.outlook.com>
From: Daniel Vetter <daniel@ffwll.ch>
Date: Mon, 25 May 2020 19:26:47 +0200
Message-ID: <CAKMK7uE6DK903YdqBRjYcvZKxB48-5ZhPzEngtL8URScM_Scyw@mail.gmail.com>
Subject: Re: [PATCH 53/59] drm/arc: Move to drm/tiny
To: Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>
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
Cc: dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, May 25, 2020 at 6:36 PM Eugeniy Paltsev
<Eugeniy.Paltsev@synopsys.com> wrote:
>
> Hi Daniel,
>
> looks like I'll finally have some time for review of "drm/arc: Move to drm/tiny".
> So, is it possible to find all these changes in any public git repo?

I have a horrible pile with everything here:

https://cgit.freedesktop.org/~danvet/drm/log/

I can also give you a cherry-picked branch with just the arc patches,
on drm-tip (maybe also linux-next, not sure everything is there
because of the merge window freeze we're in already).
-Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
+41 (0) 79 365 57 48 - http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
