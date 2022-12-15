Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C9A4C64D98E
	for <lists+dri-devel@lfdr.de>; Thu, 15 Dec 2022 11:29:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 247EB10E516;
	Thu, 15 Dec 2022 10:29:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-x2c.google.com (mail-oa1-x2c.google.com
 [IPv6:2001:4860:4864:20::2c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A86E310E516
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Dec 2022 10:29:16 +0000 (UTC)
Received: by mail-oa1-x2c.google.com with SMTP id
 586e51a60fabf-144b21f5e5fso20344557fac.12
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Dec 2022 02:29:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=oXw7NIVPJMG8+PM6AqoYuOzdnbApW+aYda86CP39V/M=;
 b=pbR+AoUW7XkzVI6hslj50b+8n6ZYADDBFfvCJcr09vYPd6isxF1bPgdBNd9uc1FmhK
 yzh2Ox2m4cLaLOFJPVq/Rozw6gnxCxyAfPg9kIgETBr7+4hrzG0vr0km0TO/4wdQmJOD
 Qh48Lwudg/JBlCNnTDep5CCPrNMaXeRP5pnMw7UMThzd2UkV1E6+mh7RnAJFQ61g1Avx
 8wmJu61Tc4A7zqnh2TnV5XslS0hMgZJhbYe8e+U0Ami6cqP+YtRvn2CeIlfjvZF0vADi
 5MprXybHopawd9lKWPNJcXUtICWmB948C2lEITpWgnwI4UBy2huybTVbD4OVcSuHDkpU
 B/pA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=oXw7NIVPJMG8+PM6AqoYuOzdnbApW+aYda86CP39V/M=;
 b=GGXFEeza/Nqyp76Rldgffe9UYl1b2tJxnB8YWmY1ySuJK8qFPeFjTM2XhsYWmk8SZ2
 JdFPPr3W6oczbtxHr5w/nI4cXP5FnweZxp5OoylxSaxKCbWOCOdpTQ+bUveQqNR6P/Tv
 bq2U49Ef/CS+aIVEy3SecJ54isSyzxG8GfqcRXmvmYMhXJ8LGvIwTCLdYPQ9b9jvTPRM
 CYkqSJTWtzumqJGjFtKXnKzJJjFM8aTT015IYvNfO+o4oL392+gmB3e8aYhqu9mskzSK
 5J6djKrGJ+8BJjcpOy998poecJbMPmB0EnMB9ftG42U5aRzJZTs8uxrx94+ktPzUETD7
 MzFw==
X-Gm-Message-State: AFqh2kq0k1cpS9uxF8qGkZaxdCSjDl/TzRPY9Zw/7uJrCsRJtVpF1MF5
 KgLmw/GI0JuX/ddb6QQCDv0ppTPYtuCrwpOy0YhBUA==
X-Google-Smtp-Source: AA0mqf48x0Ly0lTHVC6+zanhcKAfhc9CQQ27Yszl1vpQXNwpDj4LShgOnGxn/oMFV65gE+GYqDp1jb5049WikZUWkXI=
X-Received: by 2002:a05:6870:2393:b0:144:b04d:1669 with SMTP id
 e19-20020a056870239300b00144b04d1669mr170374oap.155.1671100155842; Thu, 15
 Dec 2022 02:29:15 -0800 (PST)
MIME-Version: 1.0
References: <20221115112720.911158-1-treapking@chromium.org>
 <167103665890.995711.9267085599513513874.b4-ty@linaro.org>
 <CAEXTbpfgCVWNE=ao5=d8_Bo1YHmfb7e08aeMCaz38Tvt0jAcTw@mail.gmail.com>
In-Reply-To: <CAEXTbpfgCVWNE=ao5=d8_Bo1YHmfb7e08aeMCaz38Tvt0jAcTw@mail.gmail.com>
From: Robert Foss <robert.foss@linaro.org>
Date: Thu, 15 Dec 2022 11:29:05 +0100
Message-ID: <CAG3jFysB_nWvJ7pqJj_jRNvncK58Rw=kHgdWu=ek7msHGi4E2w@mail.gmail.com>
Subject: Re: [PATCH] drm/bridge: it6505: Add caching for EDID
To: Pin-yen Lin <treapking@chromium.org>
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
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Jonas Karlman <jonas@kwiboo.se>,
 allen chen <allen.chen@ite.com.tw>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 15 Dec 2022 at 09:36, Pin-yen Lin <treapking@chromium.org> wrote:
>
> Hi Robert,
>
> Thanks for the review.
>
> I didn't see this patch on drm-misc-next, but my another patch merged
> instead: https://cgit.freedesktop.org/drm/drm-misc/commit/?id=5eb9a4314053bda7642643f70f49a2b415920812
>
> Did something go wrong? Or is it me missing something?

This is my mistake. I'm switching to a 'b4 ty' based workflow, and the
wrong thank you message got sent out.

Let me have a look at this patch too.

>
> Regards,
> Pin-yen
>
> On Thu, Dec 15, 2022 at 12:51 AM Robert Foss <robert.foss@linaro.org> wrote:
> >
> > On Tue, 15 Nov 2022 19:27:20 +0800, Pin-yen Lin wrote:
> > > Add caching when EDID is read, and invalidate the cache until the
> > > bridge detects HPD low or sink count changes on HPD_IRQ.
> > >
> > > It takes 1.2s for IT6505 bridge to read a 3-block EDID, and skipping
> > > one EDID read would be a notable difference on user experience.
> > >
> > >
> > > [...]
> >
> > Applied, thanks!
> >
> > Repo: https://cgit.freedesktop.org/drm/drm-misc/
> >
> >
> > [1/1] drm/bridge: it6505: Add caching for EDID
> >       (no commit info)
> >
> >
> >
> > rob
> >
