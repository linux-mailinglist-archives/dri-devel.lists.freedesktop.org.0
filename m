Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F776286D76
	for <lists+dri-devel@lfdr.de>; Thu,  8 Oct 2020 06:02:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E29E06EA1C;
	Thu,  8 Oct 2020 04:02:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x641.google.com (mail-ej1-x641.google.com
 [IPv6:2a00:1450:4864:20::641])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 144876EA1C
 for <dri-devel@lists.freedesktop.org>; Thu,  8 Oct 2020 04:02:47 +0000 (UTC)
Received: by mail-ej1-x641.google.com with SMTP id ly6so6029237ejb.8
 for <dri-devel@lists.freedesktop.org>; Wed, 07 Oct 2020 21:02:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=qo1edCb/iclQk6hBHztuu9PMa3K1YL2XLMZ/huK0mqI=;
 b=edJSQbksLkCCyykP4BWuUGbk8GV3Gr5tyT+fKP/1Z2CxcvUi13pVslaOo8GgKAjZFA
 pWvFLQ0N84atQkRgryE9lLRbW37QoRSAjgi7rXbU7RrgneUmlt3ZTa6dMSLUThfhii19
 U5zRsUoozW3ZUQr6OOOsdobXF50gwf3ZTOdqWUCsv1t3FfDfyFWsBKqcPaw7B7iR3Hzf
 7jYUBICkqQL3o+2q5QkWzYVRQmfvvFMAvVySDxdZ7hJD9sBFhbVlFl4RtW+Pc0D8vgvn
 piXRpcnK/CzvNxkNCLUJw6Eqe4LgV6i941wnI7D3mUP1Bi9G2y3lxg1IpniuUWzFAO5V
 bagQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=qo1edCb/iclQk6hBHztuu9PMa3K1YL2XLMZ/huK0mqI=;
 b=N+Gf5lIg0R5iQrI9dz/mUgjxcbqRTw4VxkXM5zd9RYgV1exqDB9rlq8SuhilbvU0R/
 8nyG5NfGzkm3K1chIrVFna2Ajxovosjn+iw/pTFCg+tWkyAK+ztsMAq/jXTWk2wchKfT
 YUvV9gchuE+o4bZZCtHg3dsBR8d8eKxo9SNb8K9tHShJyQ2l/XdRHtNRCvP8B+n8RkxW
 2bXeUcwPgBpoJIIKjyUf2SxVAiUsvRFniUjPsVq398XQ1nExkXerdgSR7F3O9yhOKD/4
 yff9YHG+QRw09vGtb2UEl387Q6mPZ84kMyZbz+AfY9Q0CkTx+f9eQZRgmkZjlUC2gBuu
 KXIg==
X-Gm-Message-State: AOAM532+2+whcNsdtNLoe5YCwH2PQWqzNi0Zrw1X8+f8hSDKpErvboK5
 gsaNfRQfn5DH3NKr/ufLMNH12vKzCNfjNXxAEkg=
X-Google-Smtp-Source: ABdhPJyLfvDxtG4VmaCjtK1TghdQAydUpKT5rMmXzUnRMOQYISKL5qVhI55es1VK4acVv7dlWv2E2g1yE8MVrSfnk40=
X-Received: by 2002:a17:906:f92:: with SMTP id
 q18mr6395547ejj.237.1602129765580; 
 Wed, 07 Oct 2020 21:02:45 -0700 (PDT)
MIME-Version: 1.0
References: <20201006000644.1005758-1-airlied@gmail.com>
 <20201006000644.1005758-4-airlied@gmail.com>
 <66BA33DA-2CAD-4528-9FD1-6A4242049F68@vmware.com>
In-Reply-To: <66BA33DA-2CAD-4528-9FD1-6A4242049F68@vmware.com>
From: Dave Airlie <airlied@gmail.com>
Date: Thu, 8 Oct 2020 14:02:34 +1000
Message-ID: <CAPM=9twt1KCzdWEKCDeWhf_7d7L39BrrEsJntiYGG7FtySWvwg@mail.gmail.com>
Subject: Re: [PATCH 3/5] drm/vmwgfx: add a move callback.
To: Zack Rusin <zackr@vmware.com>
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
Cc: "rscheidegger.oss@gmail.com" <rscheidegger.oss@gmail.com>,
 "christian.koenig@amd.com" <christian.koenig@amd.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 8 Oct 2020 at 13:41, Zack Rusin <zackr@vmware.com> wrote:
>
>
> > On Oct 5, 2020, at 20:06, Dave Airlie <airlied@gmail.com> wrote:
> >
> > From: Dave Airlie <airlied@redhat.com>
> >
> > This just copies the fallback to vmwgfx, I'm going to iterate on this
> > a bit until it's not the same as the fallback path.
> >
> > Signed-off-by: Dave Airlie <airlied@redhat.com>
>
> What are your plans for it? i.e. how is it going to be different?

Initial plan is to put move_notify inside the move callback, then
eventually get rid of the ttm bind/unbind callback and let the driver
do that itself if needed.

I've got most of it in a branch (and I posted a 45 patch series a week
or two ago), but I need to rebase and clean it up for reposting.

Dave.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
