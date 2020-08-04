Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5995323B326
	for <lists+dri-devel@lfdr.de>; Tue,  4 Aug 2020 05:01:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 63BFB6E416;
	Tue,  4 Aug 2020 03:01:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com
 [IPv6:2a00:1450:4864:20::62b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5FA266E416
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Aug 2020 03:01:41 +0000 (UTC)
Received: by mail-ej1-x62b.google.com with SMTP id l4so40708891ejd.13
 for <dri-devel@lists.freedesktop.org>; Mon, 03 Aug 2020 20:01:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=+i+BR4/l1o9wk/g9ASs+EvArHObzFWtFi8r58GQ6rmE=;
 b=BL3CqDaFk1FQb/VietUTGs2BWvaTrxTV0gNLYy5BtpqZl9FYrNi9y1mtFQyLl265bM
 U1f7LAIyRvBC41433SPKpPJqr3GyihCz9d6/ZGjyGYxne9wRTaCQzAIbAWZww4HkN5d1
 HvkLJ73l2phXWcVZhk5AdkIYQ5RsRvHf2RHf06gg+AMxeAIqrDg1XDh2PT4AQOWh01UB
 xtOSt7a5vi9ZvWP5E3ayaKjyuVh/+jRVT4hGxlMIuC+eP1vSXBbIYr1FRPD731378r0u
 vD6YGkn7LD9xnwq8Tre1k5A/1f7Xg4tfvKpvZA+7OmhUDd8CZows8bQnelt0ZSTzJL1K
 6WfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=+i+BR4/l1o9wk/g9ASs+EvArHObzFWtFi8r58GQ6rmE=;
 b=jowpey7veA5DJXX++0I/Q7iqZpPiRYtm7cfhO5iLTYlFvIH8BmwIJkQU4Gvvc9a2Mi
 qh3h5g7VJTTO8eiQ1+xU23E1XdZsMcxkar4wqT8DqPvniUEBjBtwJqi8whbdSOYCoJRd
 kk+CbgkH9PaOTzGTGRlITntcC/e2d8t4zdV7qkNUG3J/INJpSSNx/Vs/M9bVjq1uMmlB
 MUgFOghvx29lIFJnsuDnwj8TZP9WxUmOJgNir2ecbL1gH6JciIEMaXti/5glkYVWxdu5
 tI/lpVBINIYfkSaHN7jlj0u3pz0FhhmpaykGxGeXviwIA3DBmL0PCGOmJF5b6SQQtuAG
 LmTg==
X-Gm-Message-State: AOAM530k9k+gsrxSytvhOcmYWRMiju8uOKWAx1A4/jUjpc8ATqG94oTN
 SIv/oTP8bb2Lg8YkeK03q/wffbHi/sTaTCH1vprq3SHUrk8=
X-Google-Smtp-Source: ABdhPJyNifacsSxRk2jISKoVVfNFM6qSIB4JP4UiA0lVlvXhNZ3XeDIN7lqi86E/QUCufgW9jSxJEBasQxdGz6CYdfs=
X-Received: by 2002:a17:906:1104:: with SMTP id
 h4mr19411968eja.456.1596510099889; 
 Mon, 03 Aug 2020 20:01:39 -0700 (PDT)
MIME-Version: 1.0
References: <20200804025632.3868079-1-airlied@gmail.com>
In-Reply-To: <20200804025632.3868079-1-airlied@gmail.com>
From: Dave Airlie <airlied@gmail.com>
Date: Tue, 4 Aug 2020 13:01:28 +1000
Message-ID: <CAPM=9tyavGNnK4JzZ9xW_FrTKWYFT7CQ_KvP32MXBL06KLz25w@mail.gmail.com>
Subject: Re: [00/59] ttm misc cleanups, mem refactoring, rename objects. (v2)
To: dri-devel <dri-devel@lists.freedesktop.org>
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
Cc: Linux-graphics-maintainer <linux-graphics-maintainer@vmware.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Roland Scheidegger <sroland@vmware.com>,
 "Koenig, Christian" <christian.koenig@amd.com>,
 Ben Skeggs <bskeggs@redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 4 Aug 2020 at 12:56, Dave Airlie <airlied@gmail.com> wrote:
>
> I've decided to repost the whole queue this time, it has a few driver
> patches up front that are just cleanups.

Sample branch is

https://cgit.freedesktop.org/~airlied/linux/log/?h=ttm-refactor-mem-manager-rename

Dave.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
