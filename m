Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6785C27A73B
	for <lists+dri-devel@lfdr.de>; Mon, 28 Sep 2020 08:08:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5E9246E0C2;
	Mon, 28 Sep 2020 06:08:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x644.google.com (mail-ej1-x644.google.com
 [IPv6:2a00:1450:4864:20::644])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5C1FF6E0C2
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Sep 2020 06:08:49 +0000 (UTC)
Received: by mail-ej1-x644.google.com with SMTP id p15so6806050ejm.7
 for <dri-devel@lists.freedesktop.org>; Sun, 27 Sep 2020 23:08:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=W94+USkFOEw29LE8CB5eIdgPT0Swcp2//ikNQs39wI8=;
 b=LAZYNjM3G/CcV3a5b7ikfdXvsqLboydZLUWluGdZlPbENZBXIr1znw2HuOHa++Z1/w
 QEM5PfLTZ/122a5FiGefQsa7DWppDGVSDmJOISbrTbzWNEegsLg8VRXCcELnmY3vVJPV
 dDldTdPCx27Bp4eCvwEvmIX3Lf/QdVa3ssi2qQq8KviyULWVQtW8Ez8XeZ9D2zhaNTmw
 vMO+CIKmV6Lojy/EXgNM2i1Qf3xUpkkjfqotrxsmqOqtssbjwXW8tLTNkqlqUTtyoBOB
 HP1rxAhi5/OeED+oYyjbsTimi39EMzGXfRvHJJe2AVNfbf1DxPHcNk6ja6GLt1H2wBsc
 89+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=W94+USkFOEw29LE8CB5eIdgPT0Swcp2//ikNQs39wI8=;
 b=bdL19amyEfaThfkd+J11Pmvhefa8Sw6Dqh8USTlKZkzgzCQbnhdCGfVfVlKtsJYhOP
 F9QlelWIcckTi+GWCbKYlx/hhzWknfG24+e3G8b99AUkuPLo+zaXfM2IuLTM8eGfa8er
 ywcHs5pcGcXNZA4jLRTkp4xwE75eOgsUd3veH0p3tcDZeqssZbMwnS+U5Y0k1U/kt80Z
 FBj9QGFdqophha1h6HQwiTnkhF8fuTFTkE1pUc+lqRF5THtk40jggcqf8cE8ZkCaUnQR
 mCv3Txhn0K0eP/pjFSK6tfJ1T/F1gI5Jih5zD5jEaMxqIrA0ClrmG0P2774TW0YEZPGd
 Xfwg==
X-Gm-Message-State: AOAM533dtXch3azQmJthbT5d4Uy+ZgrX90IsR0aa/CO4AZ6xXHYdxKhW
 CoeoH+AdpBJ9d31WCrEPgHEwOZ3FhXw3NuY4EI4=
X-Google-Smtp-Source: ABdhPJwnmwKg6CTBdT1WpaQr+mK3XPL3ayBHn/1nHxViptewGpSpXXVGOtaQDyHJV04k07v5RDDwgJts8rPZEuPVoqU=
X-Received: by 2002:a17:906:6b95:: with SMTP id
 l21mr123687ejr.317.1601273327952; 
 Sun, 27 Sep 2020 23:08:47 -0700 (PDT)
MIME-Version: 1.0
References: <20200928135405.73404219@canb.auug.org.au>
 <20200928060427.GA15041@lst.de>
In-Reply-To: <20200928060427.GA15041@lst.de>
From: Dave Airlie <airlied@gmail.com>
Date: Mon, 28 Sep 2020 16:08:36 +1000
Message-ID: <CAPM=9txFX+M8O+-PCxAUnrSovXRHEZyRwOX2r3GUr7hP0A_o3A@mail.gmail.com>
Subject: Re: linux-next: build failure after merge of the drm tree
To: Christoph Hellwig <hch@lst.de>
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
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Dave Airlie <airlied@linux.ie>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 DRI <dri-devel@lists.freedesktop.org>, Paul Cercueil <paul@crapouillou.net>,
 Linux Next Mailing List <linux-next@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, 28 Sep 2020 at 16:05, Christoph Hellwig <hch@lst.de> wrote:
>
> On Mon, Sep 28, 2020 at 01:54:05PM +1000, Stephen Rothwell wrote:
> > Hi all,
> >
> > After merging the drm tree, today's linux-next build (x86_64 allmodconfig)
> > failed like this:
>
> The driver needs to switch do dma_alloc_noncoherent + dma_sync_single*
> like the other drivers converted in the dma tree.  Paul, let me know if
> you have any questions.

Is this possible in drm-next now (it's 5.9.0-rc5 based)?

or will I need to get a stable shared git tree that goes into drm-next
and you send to Linus early in the MR?

Dave.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
