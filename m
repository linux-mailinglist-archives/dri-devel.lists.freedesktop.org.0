Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8141C39E007
	for <lists+dri-devel@lfdr.de>; Mon,  7 Jun 2021 17:14:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E7E996E8F0;
	Mon,  7 Jun 2021 15:13:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x431.google.com (mail-pf1-x431.google.com
 [IPv6:2607:f8b0:4864:20::431])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1855A6E8F0
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Jun 2021 15:13:58 +0000 (UTC)
Received: by mail-pf1-x431.google.com with SMTP id k15so13307284pfp.6
 for <dri-devel@lists.freedesktop.org>; Mon, 07 Jun 2021 08:13:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=message-id:subject:from:to:cc:date:in-reply-to:references
 :user-agent:mime-version:content-transfer-encoding;
 bh=w9BByRMZKAQXUpr54dyylHySYfSgHFJl9yDjRVwiTsw=;
 b=Hw7rsDP4LFaD1nBLEus3QVXb8s+vUM3f1hEHhkpWxUra8y7exgf9odvIeuRw0wwZ9o
 92o+J3cL58YRn6j/1ueVQBdbn5shzk516aOo1Dwje7sQ9bv7OuaBKe19uwT0To0VUXY3
 vySJblBMagiO2tpLoFdez9waHNNWHJkhm1wwPbTVDkxF6HsfDMpXtdczVeBe30v90HyQ
 /hx7EaNf7FuIYkjRi5I+x4Eolc0HZRiTkFtHs9+78WlvfZcZRmcimVk5oTND3lwF1pkF
 fgvU5/u7EIOdRdloeE7cWLAlsBPUCYOKsQxRK652EPntPiEBQMbQ4qfBqljoW9dlwvvX
 EWkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:user-agent:mime-version:content-transfer-encoding;
 bh=w9BByRMZKAQXUpr54dyylHySYfSgHFJl9yDjRVwiTsw=;
 b=VgitlCROwW/9MwfqAr7z4lQi1Nw49d1bvkrNZWUoWBvrLfDinsBs/PffE3xrC21tQK
 LiXnul3tVhbHEHzO6x0FNsNiYGjLW0vH7zZwJzx95YBCNOA+0N64lCcyvrpen+1jSKqu
 0kbtzmQrmk6HO+ao8d4y7I+BQ+9V9gZHWuDlb1/KewuEsTfdd+XNaEuvcEDI67J33FBw
 7VBCGthH8YSAsFcMY601fyGKu8xyJDJhzS2uAhiEhlnu99NaarllwqHNCcd1oHZ6CsJM
 HzDluxYWQmIbo9BcjokBXiSSG4WruVrmGcjlyqQ+Mf5EIgMcsvYpbSK/1ltJGlGA0ksm
 LVQg==
X-Gm-Message-State: AOAM531qSUAq0ECu1TIdxgxHDEaEB884Druxvhr5mxIqRMFL3ngUZFTT
 YEp0f/qCXqF3JTewg6Jv9cc=
X-Google-Smtp-Source: ABdhPJzkbqbn00oxDeNgrfeFkk/70y7ClxHMnfhAU+Dl/Y79tmtBMKaBZSM+u6kIDYynt7h+wgD3kw==
X-Received: by 2002:a05:6a00:8c4:b029:2b4:8334:ed4d with SMTP id
 s4-20020a056a0008c4b02902b48334ed4dmr17286609pfu.36.1623078837577; 
 Mon, 07 Jun 2021 08:13:57 -0700 (PDT)
Received: from [192.168.1.8] ([50.47.106.83])
 by smtp.gmail.com with ESMTPSA id j4sm8150430pfj.111.2021.06.07.08.13.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Jun 2021 08:13:57 -0700 (PDT)
Message-ID: <2cb17f7192b93dbcfb7355d6d237c88d8e58053c.camel@gmail.com>
Subject: Re: [PATCH v6 1/3] drm/hyperv: Add DRM driver for hyperv synthetic
 video device
From: Deepak Rawat <drawat.floss@gmail.com>
To: Thomas Zimmermann <tzimmermann@suse.de>,
 dri-devel@lists.freedesktop.org,  linux-hyperv@vger.kernel.org
Date: Mon, 07 Jun 2021 08:13:56 -0700
In-Reply-To: <f58a001a-b411-78b0-bcfc-ca853b920a64@suse.de>
References: <20210527112230.1274-1-drawat.floss@gmail.com>
 <f58a001a-b411-78b0-bcfc-ca853b920a64@suse.de>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.40.2 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Cc: Dexuan Cui <decui@microsoft.com>, Michael Kelley <mikelley@microsoft.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On Thu, 2021-05-27 at 15:35 +0200, Thomas Zimmermann wrote:
> Hi
> 
> if no further comments come in, this can be moved in a few days.
> Since 
> you'll be the maintainer, you should request commit access to the 
> drm-misc repository. See
> 
>  
> https://drm.pages.freedesktop.org/maintainer-tools/commit-access.html
> 
> and
> 
>  
> https://drm.pages.freedesktop.org/maintainer-tools/getting-started.html
> 
> Best regards
> Thomas
> 
> 

Hi Thomas,

I have merged the patches to drm-mics-next. Thanks for your help.

Deepak

