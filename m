Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A420307827
	for <lists+dri-devel@lfdr.de>; Thu, 28 Jan 2021 15:35:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 76C886E1CD;
	Thu, 28 Jan 2021 14:35:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com
 [IPv6:2a00:1450:4864:20::129])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 208CD6E1CD
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Jan 2021 14:35:45 +0000 (UTC)
Received: by mail-lf1-x129.google.com with SMTP id a12so7894756lfb.1
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Jan 2021 06:35:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=4HZ6vN2eEe9xlgJg6Acm1pXtbaRzCfTxTjwFlP4TFpU=;
 b=Dh6TtiOQldz7ctr2Vjc++l9sPFfbz1uIReK71LDhdAY7CMAfgSiOEAqExkoDQ4raee
 yiBKxu4aZyluG12epsDcVxU1V39k8CXSIeMG/3bOPvOWIoLFk8h0swTVl/glwTbkpjmk
 y56Bs8b22Ho+WA8dKqByZ9YpfuqOno7Df/De+xGLZEw6jy4cAjXsHChNzqt//SrwbPv/
 MFHIA7jAk/+jRjq2aXWCXav5v0/3LTauDbWHHZq5QthKDu2DlkOk0hEKjvSEHG23GPwW
 gggykyjVJ2IFuEciGMa8k0nx5G7Ug4zbvGdN9ksTDPu6JgRXIwl+ERrbHJbY6IRIJlWM
 IF0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=4HZ6vN2eEe9xlgJg6Acm1pXtbaRzCfTxTjwFlP4TFpU=;
 b=GHLQfl8tQPuWpXlgN2Y4apTrsOHdb+fBGKNFENOW+KYVuWFl+RBeBquujuyvQ03Yqh
 SE4XTMBp8SXMQ+ZvJDD5U2gbxlOyGFT+Hy2djMAeL0FvJHs7BaG2aw6Hb/wsyBZ8Pg/5
 EufcojBMDqPajQw5Lzor+4DiJ2TMO5uPPgB+EFDpk2JhxHCde/5VvOZlXdBKYXcEiFZe
 GbuMANH+v4z1L7oULO2NRAVD/EYH5M2JbiW8b+uU/Tx8yKJbnhibNcxK6e5zXVTVVaf7
 eb7Iz1/Sg4SUBxS948azgOSrsNTVrHssH6L/MQI1UX6P5abeERXy/wlEFeFf1ihFlamp
 dJ5Q==
X-Gm-Message-State: AOAM533HSTmiqMSNIB3HbXr99HUoqlZcxX2qUqalPixV9P0C6XJ5drX+
 ZCqznFnnTUp7lnxmT6PJMjdCldwzG6Qck0/jiBPfzw==
X-Google-Smtp-Source: ABdhPJwqwI0JXhluBVDgebMB/GJcLtoIuHaluDFZq7+Xj1RNJkY2OfC2kWQ4Clsu3GEZqQhCkC1nm3F37DJn50NMaO8=
X-Received: by 2002:ac2:5d51:: with SMTP id w17mr5544918lfd.343.1611844543382; 
 Thu, 28 Jan 2021 06:35:43 -0800 (PST)
MIME-Version: 1.0
References: <20210126204240.418297-1-hridya@google.com>
 <YBFXPbePURupbe+y@kroah.com>
 <CAO_48GHrpi9XxPhP2evwH_ZJmbVSWqxCvsYg6S2Syh-mrWBHzA@mail.gmail.com>
 <c0684400-c1e2-0ebd-ad09-cb7b24db5764@gmail.com>
 <CAO_48GGsOTLdqAQMO9vrLtWAKG6spByMC-GXwDv_f3ENvpemfA@mail.gmail.com>
 <Fu3J-fHQvkd_umZraMnhxQhFJR_JCDmgUssMBA4GJgRwo4UpIPKvVSh51Os9FQkABkhSL6tmEAV4vwBZa7hFWFTgujmjaBmrgqJJ75KM8ZU=@emersion.fr>
In-Reply-To: <Fu3J-fHQvkd_umZraMnhxQhFJR_JCDmgUssMBA4GJgRwo4UpIPKvVSh51Os9FQkABkhSL6tmEAV4vwBZa7hFWFTgujmjaBmrgqJJ75KM8ZU=@emersion.fr>
From: Sumit Semwal <sumit.semwal@linaro.org>
Date: Thu, 28 Jan 2021 20:05:32 +0530
Message-ID: <CAO_48GEzi2b5M8Gv2E2L1s76VcPksA812ZqY1ihbpxkDkwb5_A@mail.gmail.com>
Subject: Re: [Linaro-mm-sig] [PATCH v3] dmabuf: Add the capability to expose
 DMA-BUF stats in sysfs
To: Simon Ser <contact@emersion.fr>
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

Hi Simon,

On Thu, 28 Jan 2021 at 20:01, Simon Ser <contact@emersion.fr> wrote:
>
> On Thursday, January 28th, 2021 at 1:03 PM, Sumit Semwal <sumit.semwal@linaro.org> wrote:
>
> > Since he didn't comment over Hridya's last clarification about the
> > tracepoints to track total GPU memory allocations being orthogonal to
> > this series, I assumed he agreed with it.
>
> IIRC he's away this week. (I don't remember when he comes back.)
>
> > Daniel, do you still have objections around adding this patch in?
>
> (Adding him explicitly in CC)
Thanks for doing this!

Best,
Sumit.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
