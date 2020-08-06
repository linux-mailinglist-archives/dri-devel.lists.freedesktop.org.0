Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F16D523D575
	for <lists+dri-devel@lfdr.de>; Thu,  6 Aug 2020 04:28:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0D4DD6E86E;
	Thu,  6 Aug 2020 02:28:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x544.google.com (mail-ed1-x544.google.com
 [IPv6:2a00:1450:4864:20::544])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 662C26E86E
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Aug 2020 02:28:39 +0000 (UTC)
Received: by mail-ed1-x544.google.com with SMTP id di22so26823112edb.12
 for <dri-devel@lists.freedesktop.org>; Wed, 05 Aug 2020 19:28:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ZEm+dlp1WdNi0+PXsBNsNlqTbpmLlIffHnRCEZ/ShIw=;
 b=LHytj7wEOoUKbN8Af702TsxP7iQcm0vGOWJ/kzlC+zRXabbRwX3UYnXrz9ca1HNhnv
 9ZTJXYUEW6rx66iYOaoLglszTSuPCjuoxh/nAe0Jo3edR8OQBgNihGxWExdft0TGUK2j
 DLyu54D/KcPwUXxzvRzfKyi3D0nsh2mpXtCzZQ6Jqvso1KEZ/IUJZ4wayMXdlCKlelyJ
 4f0QSW1B2n5TcCkkWn6dQqPiVr+hnjlazZ0QqL3D3rcMOXDe2U36dtkrSL1XhWRNcz9Y
 0nQOtAcln4FY+D99l+IdYOCIDpZ7Z984QRyx6ey6ieD6dvKYJeEDgyhjJqEMTmF+zx8d
 ZEzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ZEm+dlp1WdNi0+PXsBNsNlqTbpmLlIffHnRCEZ/ShIw=;
 b=fmccAbk3pBTidbvBxXJ2Xpg3qi23yu3kNtOa2Ed3jyt+jE4GjeC1I80TUJl6CAEL+d
 FeKGGzMiNchT1Yb4K1+Abqx0HrFU1LDrqQ8vGDKrdJk3bUwxdTZWOt8w85TK3KqQl4qH
 y+UiTvRWvoqztP79Qc6iWbHnD1Z0pFY6tfW5Z8hy8IjHXRf2J25SFTX18ujAfudaqPlO
 MKkqH0Lzbn0TosRTSvAV0TkEi5X3d3bGRRYG/jVwEJmsRKhz3kNmQ6ixG+XFSbR7gPva
 /24e7+LG2bwf7Q4g0yBTOMm0DPYXhFEXHV1e2yred2Kjla/bdHSLH/RwKIkDfUNP5QLi
 1EcQ==
X-Gm-Message-State: AOAM531DP+vRr6P3+JPoyVoqAudleT7XI4+VzlywtZHMVqB52gkKHSHa
 4/rNvPbYcieNd/aDkWA2RI0J8o4HXwJ6i4GVvHA=
X-Google-Smtp-Source: ABdhPJzZOFtmp8gmQerAwygw4JMNDMYMMF73frKCBmWS8ROr79j8FTkhETlIodmilbZKIOf3K+uwiPnXvyJHimIJDbk=
X-Received: by 2002:aa7:c983:: with SMTP id c3mr1977991edt.383.1596680917928; 
 Wed, 05 Aug 2020 19:28:37 -0700 (PDT)
MIME-Version: 1.0
References: <CAPM=9ty8hOY0m2+RJdRiRADY5Li-hs3ZaDEK-DTf6rgFewar7g@mail.gmail.com>
In-Reply-To: <CAPM=9ty8hOY0m2+RJdRiRADY5Li-hs3ZaDEK-DTf6rgFewar7g@mail.gmail.com>
From: Dave Airlie <airlied@gmail.com>
Date: Thu, 6 Aug 2020 12:28:25 +1000
Message-ID: <CAPM=9tx5bMLofaA75ZrBwdjAF-ZpQ3xU+pf5QGKJakLUQYNKNg@mail.gmail.com>
Subject: Re: [git pull] drm next for 5.9-rc1
To: Linus Torvalds <torvalds@linux-foundation.org>,
 Daniel Vetter <daniel.vetter@ffwll.ch>
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
Cc: LKML <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 6 Aug 2020 at 11:07, Dave Airlie <airlied@gmail.com> wrote:
>
> Hi Linus,
>
> This the main drm pull request for 5.9-rc1.
>
> New xilinx displayport driver, AMD support for two new GPUs (more
> header files), i915 initial support for RocketLake and some work on
> their DG1 (discrete chip).
>
> The core also grew some lockdep annotations to try and constrain what
> drivers do with dma-fences, and added some documentation on why the
> idea of indefinite fences doesn't work.
>
> The long list is below.
>
> I did a test merge into your tree and only had two minor conflicts, so
> I think you should be able to take care of it fine.

I should say I did a test merge yesterday, but you likely pulled more trees,

https://lore.kernel.org/dri-devel/20200806115140.6aa46042@canb.auug.org.au/T/#t

So there was an unfortunate miscommunication and one patch went two
ways, in future Jason and Ben will coordinate better.

Dave.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
