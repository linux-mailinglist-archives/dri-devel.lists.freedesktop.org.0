Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D34B4EABC6
	for <lists+dri-devel@lfdr.de>; Tue, 29 Mar 2022 12:59:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 537FC10EFDC;
	Tue, 29 Mar 2022 10:59:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x736.google.com (mail-qk1-x736.google.com
 [IPv6:2607:f8b0:4864:20::736])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5153010EFDC;
 Tue, 29 Mar 2022 10:59:19 +0000 (UTC)
Received: by mail-qk1-x736.google.com with SMTP id 85so13686433qkm.9;
 Tue, 29 Mar 2022 03:59:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=WeHHguGPowcDvWMr7blgBmwq0GWd0bNHBYB846nmBBc=;
 b=R7CuH78vDiYCJvedJaROsJPEXMamwU/N6ut1asPh8lNtVeQ9xie9A2Ck2ZDyCRvwMU
 uzfEsvjCK7IFPpXPluuxrdrunYczj8sdNfT6qCG81bsOmvPDIg82DT1zGFk9FArYB+WR
 XSXgy03C+Bf+1ksfXj8/gqu4dd1Oe0kNaOZ37INj1DE9zjrQwbNVWwjval2REUDLt9lE
 qunnvuK6B0vLkMTUL7QN0Vga8qZiD77UAmhmc+hHt1sDdUHCE1Zsn9ajGIEZHh0x69uH
 9dfUabQggu7sz3o3gwJibuHG8rmWNTvOfLeSvsZgkSAVVA2ak+oOUxClmbDqt6RYvbwR
 13BA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=WeHHguGPowcDvWMr7blgBmwq0GWd0bNHBYB846nmBBc=;
 b=nALNhUgabra84CUo5GUwYCfisvE80UTTRjdo3F9G4+iM1yRmZV2mSW5otUJMRdWJm7
 4wHNOevkWSFh7wRewXoV1SNvdKACnsdXJc2W0pZ9HmqHj7VmlK+NtZHqUPPqj6+YVobo
 neoov5i/+j2VqorfCKvSI+XJmJwNVxeqfbruGeeynV0N+GfxjKHyc6BJ88jCM/CSbmiT
 CYuVVV3q4K9cqbhILF8FLq/97w14FV5dwA7/EUNurGjunADg+PpJOg8LopyngOgNPenR
 Z/aafnOPSJvSWGPl0ffYv2es66uTyA+6WOZUBSJSQOMR2ShOgXner331s2qUf3Xm0lR6
 rS7g==
X-Gm-Message-State: AOAM532IEji7nBn4iEqQDXW2bKK5avIExjfLO14ulG20xt8bSAuOkQDu
 cPlzlkBUg9up36ReHshBYWanoZGzl6EsgZfqT/U=
X-Google-Smtp-Source: ABdhPJwqoYi0XNT2COlvQmgCNj2NZw3NxFJuyzWhrMjioYDWM7gCjvABPKquYY1SZkpt4YqN7g6vw9+QeilGXieqBvY=
X-Received: by 2002:a37:a644:0:b0:680:9e24:6583 with SMTP id
 p65-20020a37a644000000b006809e246583mr18903701qke.366.1648551558094; Tue, 29
 Mar 2022 03:59:18 -0700 (PDT)
MIME-Version: 1.0
References: <CACvgo50pK3rr5UH_FyfR1pADmPRjEawi43cAecoaz7nM5AFgBg@mail.gmail.com>
 <20220328020902.19369-1-xiam0nd.tong@gmail.com>
In-Reply-To: <20220328020902.19369-1-xiam0nd.tong@gmail.com>
From: Emil Velikov <emil.l.velikov@gmail.com>
Date: Tue, 29 Mar 2022 11:59:06 +0100
Message-ID: <CACvgo5342xQHb07FVK4beXWgFexZR0LyODEqemE3y1subnEw1Q@mail.gmail.com>
Subject: Re: [PATCH] dispnv50: atom: fix an incorrect NULL check on list
 iterator
To: Xiaomeng Tong <xiam0nd.tong@gmail.com>
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
Cc: Karol Herbst <kherbst@redhat.com>, Dave Airlie <airlied@linux.ie>,
 ML nouveau <nouveau@lists.freedesktop.org>,
 "Linux-Kernel@Vger. Kernel. Org" <linux-kernel@vger.kernel.org>,
 ML dri-devel <dri-devel@lists.freedesktop.org>,
 Ben Skeggs <bskeggs@redhat.com>, yangyingliang@huawei.com,
 "# 3.13+" <stable@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, 28 Mar 2022 at 03:09, Xiaomeng Tong <xiam0nd.tong@gmail.com> wrote:
>
> on Sun, 27 Mar 2022 16:59:28 +0100, Emil Velikov wrote:
> > On Sun, 27 Mar 2022 at 08:39, Xiaomeng Tong <xiam0nd.tong@gmail.com> wrote:
> > >
> > > The bug is here:
> > >         return encoder;
> > >
> > > The list iterator value 'encoder' will *always* be set and non-NULL
> > > by drm_for_each_encoder_mask(), so it is incorrect to assume that the
> > > iterator value will be NULL if the list is empty or no element found.
> > > Otherwise it will bypass some NULL checks and lead to invalid memory
> > > access passing the check.
> > >
> > > To fix this bug, just return 'encoder' when found, otherwise return
> > > NULL.
> > >
> >
> > Isn't this covered by the upcoming list* iterator rework [1] or is
> > this another iterator glitch?
>
> Actually, it is a part of the upcoming work.
>
> > IMHO we should be looking at fixing the implementation and not the
> > hundreds of users through the kernel.
> >
> > HTH
> > -Emil
> > [1] https://lwn.net/Articles/887097/
>
> Yes, you are right. This has also been taken into account by the upcoming
> list iterator rework to avoid a lot uesr' changes as much as possible.
>
> However, this patch is fixing a potential bug caused by incorrect use of
> list iterator outside the loop, which can not be fixed by the implementation
> itself.
>

I see, thanks for the information o/

-Emil
