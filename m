Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BF8D73C4E5
	for <lists+dri-devel@lfdr.de>; Sat, 24 Jun 2023 01:44:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D80CE10E013;
	Fri, 23 Jun 2023 23:44:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x22e.google.com (mail-lj1-x22e.google.com
 [IPv6:2a00:1450:4864:20::22e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5209B10E013
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Jun 2023 23:44:23 +0000 (UTC)
Received: by mail-lj1-x22e.google.com with SMTP id
 38308e7fff4ca-2b46f5d236dso20486571fa.2
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Jun 2023 16:44:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linux-foundation.org; s=google; t=1687563859; x=1690155859;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=gVT3Ae52uNnNMAjvZ6ok3W1cvzQFVUDD1dzfpAkc+Ro=;
 b=NrP6fMkluNDMLVHiZLGr7OreyMjSY3mRQW4xsjeFPJGYbtczljHjwKw3PG46QEPtYA
 5ZtC/CFIydKZnmO602tf1qEWOMg+RCt/19XXhMZBk6rSejzwkRtM7If5lTo5/D360CGS
 LSjPxU6ODch4AZ6Jb13UihWpep9DpBx7abFj0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687563859; x=1690155859;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=gVT3Ae52uNnNMAjvZ6ok3W1cvzQFVUDD1dzfpAkc+Ro=;
 b=R7rtP1Ts7p4/NW0eNbZNzu8udV7Xh9xxjmkWmZseidChdhnKNAOm3drh/YU67SrFZf
 AkWaRITCd7wuVt2/puGuVtVoZrvwxZFq0BvJyw2McC2gj1NGXYAwnhbCWFrzBUKhpr9U
 3z+/NdXy+J1yzupUZaybjKEgNaGKri93diPmwtEl9FccG9z0C+rTFRh8/apUn+OKH7u3
 hNpSi3IXyxUru16TT3+9qN+zOT15ySPKqEkIQMr5CQqJZiizHiIGMDnheXz9p7xMeeYi
 6zrnvbWR2Fcopcl3BCUswQyT8Au+K6KUifQcDRZ56cNdo6cJwzIhIC2ggZOkrHAuGg3v
 Reew==
X-Gm-Message-State: AC+VfDyJjxjXG+dASaHNC9/sQvuZ/a1HT7UgKqrbxVLw9bYS+a9hVCvB
 pwOzQicpz5mrEnXFJEgNHdwFRkH+1/kTXiswylRgSQ==
X-Google-Smtp-Source: ACHHUZ7y7x3cFZkbfHBhLad67uuqhArYc4eDe3rSq6i5tRheZglMqYAzfx/9qEiq348lVSk37Ccedw==
X-Received: by 2002:a2e:a0d5:0:b0:2b4:5cad:f246 with SMTP id
 f21-20020a2ea0d5000000b002b45cadf246mr14369487ljm.7.1687563858796; 
 Fri, 23 Jun 2023 16:44:18 -0700 (PDT)
Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com.
 [209.85.208.172]) by smtp.gmail.com with ESMTPSA id
 e19-20020a2e9e13000000b002b47278407esm23315ljk.74.2023.06.23.16.44.17
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 23 Jun 2023 16:44:18 -0700 (PDT)
Received: by mail-lj1-f172.google.com with SMTP id
 38308e7fff4ca-2b47742de92so20800891fa.0
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Jun 2023 16:44:17 -0700 (PDT)
X-Received: by 2002:a2e:6e16:0:b0:2b5:950a:711c with SMTP id
 j22-20020a2e6e16000000b002b5950a711cmr3568282ljc.10.1687563857166; Fri, 23
 Jun 2023 16:44:17 -0700 (PDT)
MIME-Version: 1.0
References: <20230623211808.7667-1-alexander.deucher@amd.com>
In-Reply-To: <20230623211808.7667-1-alexander.deucher@amd.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Fri, 23 Jun 2023 16:44:00 -0700
X-Gmail-Original-Message-ID: <CAHk-=wiOCgiwzVPOwORHPML9eBphnbtM2DhRcv+v=-tnRrgbYg@mail.gmail.com>
Message-ID: <CAHk-=wiOCgiwzVPOwORHPML9eBphnbtM2DhRcv+v=-tnRrgbYg@mail.gmail.com>
Subject: Re: [pull] amdgpu drm-fixes-6.4
To: Alex Deucher <alexander.deucher@amd.com>
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
Cc: daniel.vetter@ffwll.ch, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, 23 Jun 2023 at 14:18, Alex Deucher <alexander.deucher@amd.com> wrote:
>
> are available in the Git repository at:
>
>   https://gitlab.freedesktop.org/agd5f/linux.git tags/amd-drm-fixes-6.4-2023-06-23

That's not a valid signed tag.

Yes, it's a tag.  But it doesn't actually have any cryptographic
signing, and I'm not willing to pull random content from git sites
that I can't verify. In fact, these days I ask even kernel.org pull
requests to be proper signed tags, although I haven't really gotten to
the point where I *require* it.

So please sign your tags - use "git tag -s" (or "-u keyname" if you
have some specific key you want to use, rather than one described by
your regular git config file).

                  Linus
