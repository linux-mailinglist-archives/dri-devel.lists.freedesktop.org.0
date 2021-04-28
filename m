Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4647636E17E
	for <lists+dri-devel@lfdr.de>; Thu, 29 Apr 2021 00:22:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B36D76ECFD;
	Wed, 28 Apr 2021 22:22:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com
 [IPv6:2a00:1450:4864:20::134])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C97C96ECFD
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Apr 2021 22:22:16 +0000 (UTC)
Received: by mail-lf1-x134.google.com with SMTP id 4so41813655lfp.11
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Apr 2021 15:22:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linux-foundation.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=8rY2O6I8V9olhtWB9b4/RtsHeRlI9151ci1isDXaebA=;
 b=D+vRDauZOJdt3mAK066Dxx+uj5KyRs+qmiKOMPZC9S/2G5C+tru2w9J4y2E8JNeasO
 +5HA2gsch9GyiZ783mgiJPhJ7Fh4Qwyh/TT5QHc/F5NDfPzNCp3R615E/jBxQxl0/kHd
 NxZkr4cC8HiIq4i8kmhALYx9My1iGo3NNacdw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=8rY2O6I8V9olhtWB9b4/RtsHeRlI9151ci1isDXaebA=;
 b=KkCsfFJhys1KQb4WJOV+2wcscOCRGSeZTEnPvM8FdDRNErdfztm24XugkMDPlAoZxo
 EUXreiI9O85CIhF/wQ3CITyyeNej2rIpvqJt1XK7/G39vh3fVzOSBEpavM2RSk2fIq7x
 7/nAkSIgb678JbLP8dDN0C7sOSxRqWy1Vqtyna9IfG4dSwU09Lk12KOAnQnEj46cg3KZ
 Nf6JOoW5Niz0nexKlOzf/AJhSlrpiwSRrtIXH2g6nUOB9eq5rpSpCGbKEI5SAHU0hFyZ
 19fM3jwNWJ96QS6H+IST5c5Zc1t+geXtMzycH62Ge7yaeJtbOi8V+fJHM62YFb6K4ZBy
 ZVXA==
X-Gm-Message-State: AOAM530gVscT0ZRZicuvr23FzUcalr9MAfRrfzCc2NT83IeSkiJs9er1
 /dGNTy5IHIuXNeu8xib4MMFchmEo4pftAIfT
X-Google-Smtp-Source: ABdhPJxxol6HftyxEOg28G5E9QNXbXexuKJJ1B1f4kW1LIIAKoK3082yStS9p7ZM77oGj5T15WhWoQ==
X-Received: by 2002:a05:6512:2089:: with SMTP id
 t9mr22700869lfr.378.1619648535045; 
 Wed, 28 Apr 2021 15:22:15 -0700 (PDT)
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com.
 [209.85.167.52])
 by smtp.gmail.com with ESMTPSA id n7sm261404lft.65.2021.04.28.15.22.13
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 28 Apr 2021 15:22:14 -0700 (PDT)
Received: by mail-lf1-f52.google.com with SMTP id 2so8988634lft.4
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Apr 2021 15:22:13 -0700 (PDT)
X-Received: by 2002:ac2:5f97:: with SMTP id r23mr2129654lfe.377.1619648533751; 
 Wed, 28 Apr 2021 15:22:13 -0700 (PDT)
MIME-Version: 1.0
References: <CAPM=9txMo5f9QvPqdzt8g3CmUpyDFf2Q_0XS4V1FyjHX8WQPRA@mail.gmail.com>
In-Reply-To: <CAPM=9txMo5f9QvPqdzt8g3CmUpyDFf2Q_0XS4V1FyjHX8WQPRA@mail.gmail.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Wed, 28 Apr 2021 15:21:57 -0700
X-Gmail-Original-Message-ID: <CAHk-=wh3x4Q4pCkYe7__OAnvOyPqdZLN5ha0z4U035FwT5G57w@mail.gmail.com>
Message-ID: <CAHk-=wh3x4Q4pCkYe7__OAnvOyPqdZLN5ha0z4U035FwT5G57w@mail.gmail.com>
Subject: Re: [git pull] drm for 5.13-rc1
To: Dave Airlie <airlied@gmail.com>, Mikita Lipski <mikita.lipski@amd.com>, 
 Sun peng Li <Sunpeng.Li@amd.com>, Qingqing Zhuo <qingqing.zhuo@amd.com>, 
 Alex Deucher <alexander.deucher@amd.com>
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Apr 27, 2021 at 8:32 PM Dave Airlie <airlied@gmail.com> wrote:
>
> This is the main drm pull request for 5.13. The usual lots of work all
> over the place. [...]
>
> Mikita Lipski:
>       drm/amd/display: Add MST capability to trigger_hotplug interface

Hmm. I've already merged this, but my clang build shows that this looks buggy:

drivers/gpu/drm/amd/amdgpu/amdgpu_dm/amdgpu_dm_debugfs.c:3015:53:
warning: address of 'aconnector->mst_port->mst_mgr' will always
evaluate to 'true' [-Wpointer-bool-conversion]
                        if (!(aconnector->port &&
&aconnector->mst_port->mst_mgr))
                                               ~~  ~~~~~~~~~~~~~~~~~~~~~~^~~~~~~

and yeah, checking for the address of a member of a structure benign
NULL doesn't really work.

I'm assuming the '&' is just a left-over cut-and-paste error or something.

Please fix after reviewing (I'm not going to blindly just remove the
'&' just to silence the warning, since I don't know the code).

                Linus
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
