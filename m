Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CFD0A30780E
	for <lists+dri-devel@lfdr.de>; Thu, 28 Jan 2021 15:31:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7E10C6E97E;
	Thu, 28 Jan 2021 14:31:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-40133.protonmail.ch (mail-40133.protonmail.ch
 [185.70.40.133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 227376E97E
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Jan 2021 14:31:34 +0000 (UTC)
Date: Thu, 28 Jan 2021 14:31:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
 s=protonmail3; t=1611844291;
 bh=QsiNncsO1rJnX9cE9CyiN9lVlCZ9brT9ldCySW20O6Q=;
 h=Date:To:From:Cc:Reply-To:Subject:In-Reply-To:References:From;
 b=XA8RL1VkTrE1PN+d6/gKlX0zGb8Z4HLb1MnhaESmKYmH3P7WgF2p5QzpYzYxdt0Xy
 ZbMRRGXyQ2j2owRMaG4/xkJD4PipBEoMQnLan1pVjP3I+WMRsVrhyITtLsmAotrqpZ
 6zEwh22/asudG9Ma8319YFRh78slVmubr/G8vUHqwNhhkYiqKZuRI3Lj9ShWpAzHVB
 AoA7VWM+JbJeQGfRiQvxkyuXDDr7vPOzu1ThjnGGYFXuhFTFsu3SljHI0fsNZPYoRy
 zpQqPhHLl1TMFloCKpy9g449EoxWrVBJ8mfVgM400XV2hhsh1aTkOx6jezcbTOQ55l
 FgExs73SpSU2Q==
To: Sumit Semwal <sumit.semwal@linaro.org>
From: Simon Ser <contact@emersion.fr>
Subject: Re: [Linaro-mm-sig] [PATCH v3] dmabuf: Add the capability to expose
 DMA-BUF stats in sysfs
Message-ID: <Fu3J-fHQvkd_umZraMnhxQhFJR_JCDmgUssMBA4GJgRwo4UpIPKvVSh51Os9FQkABkhSL6tmEAV4vwBZa7hFWFTgujmjaBmrgqJJ75KM8ZU=@emersion.fr>
In-Reply-To: <CAO_48GGsOTLdqAQMO9vrLtWAKG6spByMC-GXwDv_f3ENvpemfA@mail.gmail.com>
References: <20210126204240.418297-1-hridya@google.com>
 <YBFXPbePURupbe+y@kroah.com>
 <CAO_48GHrpi9XxPhP2evwH_ZJmbVSWqxCvsYg6S2Syh-mrWBHzA@mail.gmail.com>
 <c0684400-c1e2-0ebd-ad09-cb7b24db5764@gmail.com>
 <CAO_48GGsOTLdqAQMO9vrLtWAKG6spByMC-GXwDv_f3ENvpemfA@mail.gmail.com>
MIME-Version: 1.0
X-Spam-Status: No, score=-1.2 required=10.0 tests=ALL_TRUSTED,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF shortcircuit=no
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on
 mailout.protonmail.ch
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
Reply-To: Simon Ser <contact@emersion.fr>
Cc: kernel test robot <lkp@intel.com>, Greg KH <gregkh@linuxfoundation.org>,
 LKML <linux-kernel@vger.kernel.org>,
 DRI mailing list <dri-devel@lists.freedesktop.org>,
 Suren Baghdasaryan <surenb@google.com>,
 Linaro MM SIG <linaro-mm-sig@lists.linaro.org>, hyesoo.yu@samsung.com,
 Daniel Vetter <daniel.vetter@ffwll.ch>, Hridya Valsaraju <hridya@google.com>,
 Android Kernel Team <kernel-team@android.com>,
 Christian Koenig <christian.koenig@amd.com>,
 "open list:DMA BUFFER SHARING FRAMEWORK" <linux-media@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thursday, January 28th, 2021 at 1:03 PM, Sumit Semwal <sumit.semwal@linaro.org> wrote:

> Since he didn't comment over Hridya's last clarification about the
> tracepoints to track total GPU memory allocations being orthogonal to
> this series, I assumed he agreed with it.

IIRC he's away this week. (I don't remember when he comes back.)

> Daniel, do you still have objections around adding this patch in?

(Adding him explicitly in CC)
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
