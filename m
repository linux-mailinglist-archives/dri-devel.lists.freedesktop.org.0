Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AC3F43EF7B4
	for <lists+dri-devel@lfdr.de>; Wed, 18 Aug 2021 03:51:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E5B2A89B45;
	Wed, 18 Aug 2021 01:51:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x834.google.com (mail-qt1-x834.google.com
 [IPv6:2607:f8b0:4864:20::834])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0CEA489B45
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Aug 2021 01:51:36 +0000 (UTC)
Received: by mail-qt1-x834.google.com with SMTP id b1so413439qtx.0
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Aug 2021 18:51:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lagfreegames.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=UZLXrFtwH3o+65HTW/KgIKeTCkEhSpywcDCDCDz453U=;
 b=BZT8hk0aWrie7novWzN8DazhdjAzlf5HxtgSHS2VBms8ow+U5y3fMgPiGriW8RSMU2
 gFqWbXOcv258X8TZv+QF/SCmlvP9HCui4d2mh6qfFREVEhV2etgU1RnHfhRNAKzuSfZ1
 gez1Enlvtpy+zO6AIlC/APo/agHnr6Pjadv8+wZNR0S+5xOtchd9ZRFh51AmRi2IAp5s
 cF+adhIvtkkrqGWH79Aq0eIztRI+xiZBeJPGzt73cF+CnnAAut4MOLbOFW/mYrCeBCX4
 7GPwjUDh56U9DNRlV4d0DSkuGQrf2bFLmFuMjUzqRRnfWyCuAXM6+SIbexfvfqG72E7l
 /oSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=UZLXrFtwH3o+65HTW/KgIKeTCkEhSpywcDCDCDz453U=;
 b=AD5WQc3xMVJ3Hp4oNS+MBE23umsqHD8DSBChsl3tO43jUL3c+ZhdDygubRhN67A+gh
 09TKFwufK/pBESnf5j7CYvN3G9L2tfGJBxql+4s2l9pRdaJwU/Opf/3LSEtOaRtm0rnF
 fz17t73CX4xVn85xOS3qopRaX/K6D29kiN8VneUAAwRSRdaTiUukLuZnfdsIF7ji0KcQ
 CcqkZBtqODdSUjpmn1nw/dwyW7NZLnI5+OvSjjCefQKybAs48k+HZ0PbaLay4zJRUP9o
 0gLQo04vQOADZUO47gWBoS1qhDEwtUFm3ylS7IW5RNFxnW8J8jrRG0TNGG+97oAm5zJl
 qB1Q==
X-Gm-Message-State: AOAM530Kp067yID068wjoR1c6PbD30KWk0FWgJchrh4Gn6z+OfQueJF5
 AuN/LdrlyVjdbHJfTcPgFZ+QmSJjFUaDl39M/IbYAA==
X-Google-Smtp-Source: ABdhPJwjqZPNdfli9d/QDsmfLxX67k0RLG/EOE+Z/XHdTO/I7AYv2pUdvMaqd+Wno7u+D8N+fdAwFT2gl5MilCjYoZw=
X-Received: by 2002:ac8:4e24:: with SMTP id d4mr5814228qtw.277.1629251495664; 
 Tue, 17 Aug 2021 18:51:35 -0700 (PDT)
MIME-Version: 1.0
References: <20210204113742.1814456-1-emil.l.velikov@gmail.com>
 <CABjik9cHYArtsTgYvcGbH_AOEcdVWpX-pTrHMq4uv7ct4_NSKQ@mail.gmail.com>
 <CABjik9dnH0dQ2Am-nfPUstF8Uv7dSixcCZ7pN7yLWNQ4QgTaAg@mail.gmail.com>
 <CACvgo53wwtkr-DeCMsnKRpjsBO=GhTVWBODC=32-6sNxgaQwLQ@mail.gmail.com>
 <CABjik9dnYjYLTBObPgn1S+1Wyc36byX+8r0PJJy+W7fa0Aj6WQ@mail.gmail.com>
In-Reply-To: <CABjik9dnYjYLTBObPgn1S+1Wyc36byX+8r0PJJy+W7fa0Aj6WQ@mail.gmail.com>
From: James Park <james.park@lagfreegames.com>
Date: Tue, 17 Aug 2021 18:51:25 -0700
Message-ID: <CABjik9dSNcxarBUtsuyLLiBW+m0ZtizUVdwZG8y_iHZjSs5gxQ@mail.gmail.com>
Subject: Re: [PATCH v2] drm/fourcc: introduce DRM_FOURCC_STANDALONE guard
To: Emil Velikov <emil.l.velikov@gmail.com>
Cc: dri-devel <dri-devel@lists.freedesktop.org>, 
 Pekka Paalanen <pekka.paalanen@collabora.com>, Simon Ser <contact@emersion.fr>,
 jason@jlekstrand.net
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Feb 26, 2021 at 12:08 AM James Park <james.park@lagfreegames.com> wrote:
>
> On Thu, Feb 4, 2021 at 1:07 PM Emil Velikov <emil.l.velikov@gmail.com> wrote:
> >
> > Do send a patch, unless someone shouts against it, I'll be happy to
> > push it and churn the whole copy to drm/mesa game.
> >
> > Thanks
> > Emil
>
> Hi Emil,
>
> Were you still planning on pushing the patch? I sent a v2 on Feb 8.
>
> Thanks,
> James

Looping in Jason Ekstrand who wants this patch for his own purposes.
To answer his question in the other email thread, I stopped pushing
once I decided to just copy/paste the necessary definitions for my own
use case to keep that ball rolling.

- James


- James
