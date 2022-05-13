Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AC085262FA
	for <lists+dri-devel@lfdr.de>; Fri, 13 May 2022 15:28:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 75FF410FD32;
	Fri, 13 May 2022 13:28:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x72d.google.com (mail-qk1-x72d.google.com
 [IPv6:2607:f8b0:4864:20::72d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B798F10FD2D
 for <dri-devel@lists.freedesktop.org>; Fri, 13 May 2022 13:27:59 +0000 (UTC)
Received: by mail-qk1-x72d.google.com with SMTP id m1so7012248qkn.10
 for <dri-devel@lists.freedesktop.org>; Fri, 13 May 2022 06:27:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=8S9g4KQqR0Y+Qp51yHNjHminE8QmWr3+dG/iwQt5Rt4=;
 b=GTv9Fa74lrLx+8ZHZYwqHwAqdG1aVOF/qw7sV54SGwQsWxUtPiz77Kr+b1yqxhHQz0
 v9ZB+5M7fHEOdX/NZjlMVA46mLgkTnQXtRJeLcSgpuc/45lPFHDhjUc8EXuDbyMgU+tk
 Mmr3puCmivuJlBTJ3VS7aJpc5Sv+ri2U4EzN8CSjJJHi318OlgmG2AnlQ/cNuMWS1mzO
 8FH9OaVE3KFE2xbxFcpkihVpZ3Cf+ubUScsMFjY+3Q7jKeFSGPeLWM/uSBLgNcpus4I8
 QIlERRsOyfur1AtwPGO/5cWWMpDs0gwzf5sbRcvVfM6CvlwLG9YIuXKz49qdVR1A/xBQ
 B+ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=8S9g4KQqR0Y+Qp51yHNjHminE8QmWr3+dG/iwQt5Rt4=;
 b=lMafSKpYiZ3Dp8DUlr8OnvPiwARm//CUsonY+NN8AOT0fGVe2O9MAewd2rLxO93BK1
 2xHY5BuHli4j51X7LI4NtnYO3zAWtnDBb96T1hUsHejxS8gNKmD7FXxk2HAwCQiL4fng
 2zQz0o2Do5U6vdDOJQSlxbDDDAT9GtqcylKnPvPRnNcF6hZv2bJ0DRBrg4tnbTN51vsZ
 tQUSHNdiW1zAJ9UY6u8N2UAb+1BOoFxq0pEMv8Zm2Z50wyVbHy584l7J7Puzot1sJh4L
 39sYKxrH+ITbsnz0H640Oo9RNm8sd1cT29CO/og96+xUC72LjL8kAt7jbyn8hZUrzSN1
 wkhA==
X-Gm-Message-State: AOAM533ZAmdDN/z88z0NAnWrSnJzMEj73GRsBbtH3P+sXs70I5zanJo/
 QfS01Nwmj0qjrjwytJEtlXy6ZDRFWgZ2ePsWPC0=
X-Google-Smtp-Source: ABdhPJxnDJQ0aB49nh8JoclnYuMxSPMH16b9LkawLffPg+YIpDw+Ux0sReHaJiw2SUdVR5d6FzA6AeqMrABF8KvcygU=
X-Received: by 2002:a05:620a:4155:b0:6a0:4cd7:3847 with SMTP id
 k21-20020a05620a415500b006a04cd73847mr3590000qko.7.1652448478464; Fri, 13 May
 2022 06:27:58 -0700 (PDT)
MIME-Version: 1.0
References: <20220509130951.486344-1-christian.koenig@amd.com>
 <CAM0jSHOiWtYXAOy_jN_MN-fc8JMWNBxuaZ1bXa5KO3VANP7Eow@mail.gmail.com>
 <2ce56d0f-3009-f717-f1c9-d6e4bab70501@gmail.com>
In-Reply-To: <2ce56d0f-3009-f717-f1c9-d6e4bab70501@gmail.com>
From: Matthew Auld <matthew.william.auld@gmail.com>
Date: Fri, 13 May 2022 14:27:32 +0100
Message-ID: <CAM0jSHPJ7sPOksV0uOEWqHje7rrrVfTVi7F+QMr_xNpx=SY-jg@mail.gmail.com>
Subject: Re: Improve TTMs empty object handling
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
Cc: Robert Beckett <bob.beckett@collabora.com>,
 ML dri-devel <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, 13 May 2022 at 14:03, Christian K=C3=B6nig
<ckoenig.leichtzumerken@gmail.com> wrote:
>
> Am 13.05.22 um 11:21 schrieb Matthew Auld:
> > On Mon, 9 May 2022 at 14:09, Christian K=C3=B6nig
> > <ckoenig.leichtzumerken@gmail.com> wrote:
> >> Hi everyone,
> >>
> >> re-sending this because Daniel was requesting a background why this is
> >> useful.
> >>
> >> When TTM creates a buffer this object initially should not have any
> >> backing store and there no resource object associated with it. The sam=
e
> >> can happen when a driver requests that the backing store of an object =
is
> >> destroyed without allocating a new one.
> >>
> >> This is really useful during initial buffer creation as well as tempor=
ary
> >> buffers and page tables which content doesn't need to be preserved whe=
n
> >> they are evicted.
> >>
> >> Currently TTM allocates dummy system resources for that because driver=
s
> >> couldn't handle a NULL pointer there. Audit the drivers and then clean
> >> up TTM to stop making those dummy allocations.
> >>
> >> Please review and comment,
> > Any chance we can throw this at intel-ci? Series seems to apply to drm-=
tip.
>
> It should be enough to CC intel-gfx@lists.freedesktop.org when sending
> the patch set out, right?

Yes, that should be enough.

>
> Christian.
>
> >
> >> Christian.
> >>
> >>
>
