Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EEF266A28CD
	for <lists+dri-devel@lfdr.de>; Sat, 25 Feb 2023 11:11:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 45C5310E275;
	Sat, 25 Feb 2023 10:11:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x533.google.com (mail-pg1-x533.google.com
 [IPv6:2607:f8b0:4864:20::533])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CCF6310E0D9
 for <dri-devel@lists.freedesktop.org>; Sat, 25 Feb 2023 01:49:15 +0000 (UTC)
Received: by mail-pg1-x533.google.com with SMTP id q23so620344pgt.7
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Feb 2023 17:49:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sladewatkins.net; s=googled;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=FsXprsvi/YhUEqRRcjwtxL/wg4XbNep96f8DIcPmGEw=;
 b=q8EJppLt0O5T2/9CH2xtxHV9Z5taBbo4wM4eE24o9JiWVaNHPV8VUW4YT7M6rprdtP
 ehNzLP40Zn6XVfpHhPeYpf3OvHMpt8ejgKp97/cg3RV5e2wDK9nnd156IZc6Gz8ldibA
 UlhJAVF8llLRsevoFdlkLqCmvpowYc+sR2nmerRWSz2ZE8fPe52xRlUmmLdViwwBj7ak
 fUiENtFj0c452iJb0iyKw73Z4n/5dcWCB4mNR8sHqhUCYit9s/yGw7ZEC/TZH5nav8Pw
 FLPEfzPSlEsTONs2oAscLBId9b6RyFmNlcjphQX7wzvaqAy92sazTzjqTx/Tu0JU0Fz1
 dCmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=FsXprsvi/YhUEqRRcjwtxL/wg4XbNep96f8DIcPmGEw=;
 b=gXCKpCz4k9S8HgElt01bvuG3jR79bGqS2dxufCi79qYwCEV3Z5AAJy6pK/Xnr54cMK
 hD1EQNr1Bfl5BSOwojfk+QEZ9Rh8/H1sjYsXcnm63rnYQVB/gj8lnz9fzuWFiBjcpatR
 ZOE2xTpRtWWkXWgwN2r9ozwAih28IVa/RJeIczU1YiSWAjebAe0qfekCYzbdmmmYeA5P
 QRO9HV3l/h1YzhKUEaj+9bSareVTgcuNxKU0s0Nfy4urJ1yuQR4zAWL6xMK6UEOq3syd
 /CaHs3UI6G1sOpYrHBUJSTsyGOaEV8TdDRGn0oYygiSwxB9illVWgAlwcI30u8LZv1xu
 9dTg==
X-Gm-Message-State: AO0yUKVjKEKWhTIyBOwWLd8UfkcQ/g2MbCH5vs7oROQ0vtYl5gOZwvSg
 5xGu0peQdXNlqlg/GfeB+X/9UkzCSmQ/ERAuQJ9VSA==
X-Google-Smtp-Source: AK7set8EECIrO70bFlm0qs8tzFwXkFUhmdbhq+Zol1pwHUaugvv/K+AkqOeuRGNYr39LD11euEgKKdFPe00LrhrqnPo=
X-Received: by 2002:a63:3855:0:b0:503:253a:1da3 with SMTP id
 h21-20020a633855000000b00503253a1da3mr188284pgn.1.1677289755055; Fri, 24 Feb
 2023 17:49:15 -0800 (PST)
MIME-Version: 1.0
References: <CAPM=9txhVJ3t_3-wMdWH7F+=_BbW19NYxAnm2cceP2uHR47_5w@mail.gmail.com>
 <CAPM=9tzPxixXnRuk0Jfs2ESw-eY43H_e5_FtGbxAhRmvaByYwA@mail.gmail.com>
 <CAHk-=wj4ShzDcZVx07ObELz06dL7m3Ax-p014rAmxGQ3D0brXA@mail.gmail.com>
In-Reply-To: <CAHk-=wj4ShzDcZVx07ObELz06dL7m3Ax-p014rAmxGQ3D0brXA@mail.gmail.com>
From: Slade Watkins <srw@sladewatkins.net>
Date: Fri, 24 Feb 2023 20:49:03 -0500
Message-ID: <CA+pv=HMOXiftTEcSLeTnQLxdxxD+GushtCwO197icDYm=kPwMw@mail.gmail.com>
Subject: Re: drm next for 6.3-rc1
To: Linus Torvalds <torvalds@linux-foundation.org>
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Sat, 25 Feb 2023 10:10:08 +0000
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>, LKML <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Feb 24, 2023 at 8:35 PM Linus Torvalds
<torvalds@linux-foundation.org> wrote:
> If you were waiting for a pr-tracker-bot reply, I think you need to
> put "{GIT PULL]" in the subject line for the automation to trigger on
> it.

Had to double check, but yes, that's exactly it:

PULL_SUBJECT_RE = [
    re.compile(r'^\S*:?\s*\[GIT', re.IGNORECASE),
    re.compile(r'^\S*:?\s*\[PULL', re.IGNORECASE),
    re.compile(r'^\S*:?\s*\[PLEASE PULL', re.IGNORECASE),
]

Link: https://git.kernel.org/pub/scm/linux/kernel/git/mricon/korg-helpers.git/tree/pr-tracker-bot.py

-- Slade
