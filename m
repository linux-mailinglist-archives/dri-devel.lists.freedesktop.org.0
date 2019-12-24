Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B08DA12A232
	for <lists+dri-devel@lfdr.de>; Tue, 24 Dec 2019 15:30:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6620A6E5CD;
	Tue, 24 Dec 2019 14:30:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x542.google.com (mail-ed1-x542.google.com
 [IPv6:2a00:1450:4864:20::542])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C77BA89C86;
 Tue, 24 Dec 2019 11:28:53 +0000 (UTC)
Received: by mail-ed1-x542.google.com with SMTP id l8so17727098edw.1;
 Tue, 24 Dec 2019 03:28:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Yaa4+iEZ46im79+sodnyaIwi0xim0AIqzXbOWPR6HKg=;
 b=sIrcJv4TUYAe5BHQg2t71AAnx6Nx94wYr993rP4u32UoTOgjy3LEDQ3fDxVI+G7AHK
 q+sWW3GX1SAXlPCCrPXm+Ws7/5w6Bd2hhYhLv5JGLqnOj6hcUij5REcUN7+DSPz8Pp5t
 Yhv5GTY5XZzc4Mr9gNU4jpakCj1sn9ItanhF0MU43kVy+hd0g8wpaFGq9kZSQ4EvzfeU
 Wf0meWFnOAL2fyNrs4I4u9OyAmncTZvIIfMzDlSsFfrG0YwsvX4mEdIlQQDcKqk4STgI
 QLYaGp6Dtm0ekk3Y2seHZbvCuLFJyZKaGXwGK3SZCpwHzwzoRNU1bZ0jeCvdseMJ9zHJ
 9VWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Yaa4+iEZ46im79+sodnyaIwi0xim0AIqzXbOWPR6HKg=;
 b=VLXrfjMLkZg9m8+FElvFMJNNQaa4yrMJqHRCqdS73kyfQMJFFJztG/kayhk74Oyb2E
 7JEVKMLeRNaJ3PDc2FydVTTNE6AloOap6w9Q4ImWT4pKfhQ2SEj6KXX18gGrrkyyy1nl
 9NZo+vuh5DjUaTRk8ula9LHbKvX+UlCV7um4E6D/WCPbmhDqo8l2Y60GfoEjV0fohesX
 z9x3XqFysi9d05UGFxZawOo7LJM/oajWYMMg2MtZwjNqn9jjtS17bthLm7aiUyNTTJnx
 bRxU7P4PXRUwaOmh5HGfcodCdmrwsupcqjoyANdX9ZqPuNy0TheXGaJnIuEBLl6epy4c
 TUBg==
X-Gm-Message-State: APjAAAUrR/U6aPsbiccaPFQFg0eYtMnHq0gkVmTAggIF077+zIZBH5ZJ
 MglhUAQYVT+hCTv40OZ2hKDhIJFHDZ95/b5zee4=
X-Google-Smtp-Source: APXvYqz4kTKGwv6SPDwKOT61Zb8NcQu1uqXgs9fWzT9X8E/7hDxnWyW00OC7RSCNm35l0R9eR3N23za84e9iE4u9E04=
X-Received: by 2002:a17:906:260b:: with SMTP id
 h11mr37038328ejc.327.1577186932440; 
 Tue, 24 Dec 2019 03:28:52 -0800 (PST)
MIME-Version: 1.0
References: <20191215211223.1451499-1-martin.blumenstingl@googlemail.com>
 <20191216154803.GA3921@kevin>
In-Reply-To: <20191216154803.GA3921@kevin>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Tue, 24 Dec 2019 12:28:41 +0100
Message-ID: <CAFBinCCDmCHQW+nBHzsodz0R=GKoqv1EEzB=UY=ypFs4Q6MFmQ@mail.gmail.com>
Subject: Re: [RFC v1 0/1] drm: lima: devfreq and cooling device support
To: Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>
X-Mailman-Approved-At: Tue, 24 Dec 2019 14:29:55 +0000
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
Cc: tomeu.vizoso@collabora.com, lima@lists.freedesktop.org, airlied@linux.ie,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 steven.price@arm.com, linux-rockchip@lists.infradead.org, wens@csie.org,
 yuq825@gmail.com, linux-amlogic@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Alyssa,

On Mon, Dec 16, 2019 at 4:48 PM Alyssa Rosenzweig
<alyssa.rosenzweig@collabora.com> wrote:
>
> If so much code is being duplicated over, I'm wondering if it makes
> sense for us to move some of the common devfreq code to core DRM
> helpers?
if you have any recommendation where to put it then please let me know
(I am not familiar with the DRM subsystem at all)

my initial idea was that the devfreq logic needs the same information
that the scheduler needs (whether we're submitting something to be
executed, there was a timeout, ...).
however, looking at drivers/gpu/drm/scheduler/ this seems pretty
stand-alone so I'm not sure it should go there
also the Mali-4x0 GPUs have some "PMU" which *may* be used instead of
polling the statistics internally
so this is where I realize that with my current knowledge I don't know
enough about lima, panfrost, DRM or the devfreq subsystem to get a
good idea where to put the code.


Martin
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
