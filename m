Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A9DB018ED7A
	for <lists+dri-devel@lfdr.de>; Mon, 23 Mar 2020 01:36:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6D0DE6E107;
	Mon, 23 Mar 2020 00:36:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x242.google.com (mail-oi1-x242.google.com
 [IPv6:2607:f8b0:4864:20::242])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D79C06E107
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Mar 2020 00:36:21 +0000 (UTC)
Received: by mail-oi1-x242.google.com with SMTP id e9so4717254oii.1
 for <dri-devel@lists.freedesktop.org>; Sun, 22 Mar 2020 17:36:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=9NF8PlidfjNHBWFI+hybyEMf4F5FOLQ97iuF5T1RvoA=;
 b=bUjgXO2MzQk8jMFSWkCpGa35wtTY6ZK8q9ifOy/FYmXr0+699viTFY7VrWq63fQukC
 bAyHJQmzagwqOfMG9Bd3+oMN6u5PmcwG88d2/2L+UGW8oe5ZhFZ7cmLUebbm1tvxiE0M
 BPU2vVh7Yq3DzRY0jJ4eli9v/iFgBIfc5GzkyfTHngdk5pDWqj/V9oytlg9IX3sZ1JSq
 ps9OuNkeGEVPjMNJQTy7jWNkdahDyinr5ZIP62HfPoZQraoz667haotsse3s8VUlzy62
 oNDygK2NJfFdlpgiM+1PVjXsaeyo/QuBaK7bFdUvCO7KBECQyzn0D+BxEzGocelFliud
 LyQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=9NF8PlidfjNHBWFI+hybyEMf4F5FOLQ97iuF5T1RvoA=;
 b=fCCpxCSIJAcFU8+e9K4EXsps83NP53WnYqSlNOmCqCcN+NfIEwge714leLtfZUe3BI
 ScECMu5Dml1XVM+589kcw1S1yghsDlanoOILCOzXHIk50Xa3c/8imQAMWyFnmbLr8ri9
 SW59buoBAKH/hJF5pQEhnNDPwMckmbC5+xi+JL2ljZVYMuubFSrSLT8dGeOrK61YvOp5
 ETguLwGP6w+Z5ovVD6635FFhb4YarLxu7IRcTd3IDIjFJXFuAkVHEYPU+KL746Ns3F9A
 YCt7amzonHJNMR5lMnr4hMAC2qnasmoWsaFOtWhmWidu6i9cvPPzwc9HgitpqyoSPCnR
 2t4Q==
X-Gm-Message-State: ANhLgQ1mYKnTglzu2J04FphvGG3fQ8BELqqRJRvu+WcbVOosd53LdggG
 Xyr09rUTWU0AmsIU1SQnv/IrAgHUnFho4odVSzc=
X-Google-Smtp-Source: ADFU+vupuWKlnjiy/xdzsmv0xJlVV68oJl61C35YubMB8MMct3e9dab2Wzyvtcc4QStWloBusb16CVDjQkZMnd/DEjs=
X-Received: by 2002:aca:3857:: with SMTP id f84mr14540301oia.150.1584923781074; 
 Sun, 22 Mar 2020 17:36:21 -0700 (PDT)
MIME-Version: 1.0
References: <20200320225659.8431-1-rscheidegger.oss@gmail.com>
In-Reply-To: <20200320225659.8431-1-rscheidegger.oss@gmail.com>
From: Dave Airlie <airlied@gmail.com>
Date: Mon, 23 Mar 2020 10:36:09 +1000
Message-ID: <CAPM=9tyfeZEy==Aq0U0y8nB=ct2S1JCCriN9CwoKS8gXZ6-e2Q@mail.gmail.com>
Subject: Re: [git pull] feature/staging_sm5
To: "Roland Scheidegger (VMware)" <rscheidegger.oss@gmail.com>
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
Cc: Dave Airlie <airlied@redhat.com>,
 Linux-graphics-maintainer <linux-graphics-maintainer@vmware.com>,
 dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sat, 21 Mar 2020 at 08:57, Roland Scheidegger (VMware)
<rscheidegger.oss@gmail.com> wrote:
>
> Dave, Daniel,
>
> vmwgfx pull for for 5.7. Needed for GL4 functionality.
> Sync up device headers, add support for new commands, code
> refactoring around surface definition.

Two things,

1.for some reason patchwork didn't process this, Daniel might be able
to tell me why I forget who to ask everytime :-)

2. Not sure how happy fd.o gitlab is to host kernel trees, might be
safe to stick to old school anongit until we work it out.

I'm happy to process this but it should be in patchwork so we can make
sure the process is followed.

Dave.
>
> Preliminary mesa userspace code using these new vmwgfx features
> can be found at: https://gitlab.freedesktop.org/bhenden/mesa
>
> The following changes since commit dad569af718c4e603c35f59ed03bf0555633dd95:
>
>   drm/vmwgfx: Refuse DMA operation when SEV encryption is active (2020-01-28 09:27:45 +0100)
>
> are available in the Git repository at:
>
>   git@gitlab.freedesktop.org:sroland/vmwgfx_drm.git feature/staging_sm5
>
> for you to fetch changes up to 4526035058cc6cc09afbca3a5d86862438ae1edf:
>
>   drm/vmwgfx: Use vmwgfx version 2.18 to signal SM5 compatibility (2020-03-20 23:35:53 +0100)
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
