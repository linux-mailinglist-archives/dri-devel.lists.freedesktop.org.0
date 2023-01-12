Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 720EC666C2D
	for <lists+dri-devel@lfdr.de>; Thu, 12 Jan 2023 09:13:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 79CE810E89B;
	Thu, 12 Jan 2023 08:13:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x104a.google.com (mail-pj1-x104a.google.com
 [IPv6:2607:f8b0:4864:20::104a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4258410E8AA
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Jan 2023 08:13:40 +0000 (UTC)
Received: by mail-pj1-x104a.google.com with SMTP id
 b16-20020a17090a551000b00225aa26f1dbso7678557pji.8
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Jan 2023 00:13:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=VWdRXf2+F3B6naWulQRoVncCtgT+T33N/C9h1MKyUek=;
 b=RGhd7Gam36sQbHlynE0qAtHIsyX4aCLddPEY2Ot/Dgnedc14Puqc+N15BF4HB1+p/F
 EyiFI8PkNHaolrVoe7QK5BM3CZp8vk6W4pTXG5t695yYCvf//btA1VGQaXM5Z9EWJrrS
 xLHhPHGK7LgyKGGfWBnGBtXkZ8Wr4/C7eaUCkaE01oIFkojxBDOH6PCPZu8BNx5Djp6V
 IfwRrmeF7rOuyASGIPSCTwqUXba95DqJIXmf+I/r32QKtPTm9Z4todzk318w55UFVqKx
 +j/E0vEN9DOhznh8mKC4jQPd/KfjI32B1A83D6ZGmdcx152TXiUUGw3Pro8wO5zpPEJ8
 n0bQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=VWdRXf2+F3B6naWulQRoVncCtgT+T33N/C9h1MKyUek=;
 b=UAJXcI/4qi8/IQjjYGg1eLnpGFK/bzUwpcp5QUSIGb7VJ4gsTaETxD1bmPj1bRmpM4
 rqAHsRpyXpk2tgFRnM+xlr/bnrnkVQlxKYRPvel9kr6gomdvr86id+/YPJciLS7GFl13
 JeXxPPB7zX/yYQQ62miyIUqzJolmhFCeZ2EOEiEYk7EhlxIyk+Kn7M/lOu/hFXQshFIy
 F2mjxQBFQIE49DbNk8oB0QQAKwrOpm7AXpXXXGTAwweZ2mUaaZko0iNdRldOatoxTzWM
 cA1dGzYn7mG54DCWkFK4pAkG7ougiorf8gRdeWebpmiUx8O1Mli8/U+19KeJUDS0odiL
 FqsQ==
X-Gm-Message-State: AFqh2kq03kCbbqoKwA/RFGFjG2wkjMIip4ug/ACx007WoNn6qB0q//zh
 BkpZoynXL1rx7z3QtFvlh2A5MfF52sOCPg==
X-Google-Smtp-Source: AMrXdXsnUERgCx1wBY/PUV43pyxeJkOgHSEhh4R8ej3lO942bcK1tz6HE+NyNfEUpzC5WGguaBo2zTGHvm8JZA==
X-Received: from shakeelb.c.googlers.com
 ([fda3:e722:ac3:cc00:7f:e700:c0a8:262e])
 (user=shakeelb job=sendgmr) by 2002:a05:6a00:1244:b0:56b:8181:fe3e with SMTP
 id u4-20020a056a00124400b0056b8181fe3emr5060573pfi.57.1673511219777; Thu, 12
 Jan 2023 00:13:39 -0800 (PST)
Date: Thu, 12 Jan 2023 08:13:37 +0000
In-Reply-To: <CABdmKX0TAv=iRz0s+F6dVVX=xsK00BeUPkRM4bnsfemDAY9U4w@mail.gmail.com>
Mime-Version: 1.0
References: <20230109213809.418135-1-tjmercier@google.com>
 <CALvZod4ru7F38tAO-gM9ZFKaEhS0w3KqFbPwhwcTvgJs4xMUow@mail.gmail.com>
 <Y78+rfzXPq5XGs9O@phenom.ffwll.local>
 <CABdmKX0TAv=iRz0s+F6dVVX=xsK00BeUPkRM4bnsfemDAY9U4w@mail.gmail.com>
Message-ID: <20230112081337.fxgnhdk44mxu26et@google.com>
Subject: Re: [PATCH 0/4] Track exported dma-buffers with memcg
From: Shakeel Butt <shakeelb@google.com>
To: "T.J. Mercier" <tjmercier@google.com>
Content-Type: text/plain; charset="us-ascii"
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
Cc: linux-doc@vger.kernel.org, daniel.vetter@ffwll.ch,
 Roman Gushchin <roman.gushchin@linux.dev>, Carlos Llamas <cmllamas@google.com>,
 dri-devel@lists.freedesktop.org, Michal Hocko <mhocko@kernel.org>,
 linux-mm@kvack.org, jstultz@google.com, Zefan Li <lizefan.x@bytedance.com>,
 cgroups@vger.kernel.org, Joel Fernandes <joel@joelfernandes.org>,
 Sumit Semwal <sumit.semwal@linaro.org>, android-mm@google.com,
 Paul Moore <paul@paul-moore.com>, Jonathan Corbet <corbet@lwn.net>,
 Martijn Coenen <maco@android.com>, James Morris <jmorris@namei.org>,
 "Serge E. Hallyn" <serge@hallyn.com>, Todd Kjos <tkjos@android.com>,
 selinux@vger.kernel.org, linaro-mm-sig@lists.linaro.org,
 Eric Paris <eparis@parisplace.org>, Suren Baghdasaryan <surenb@google.com>,
 Christian Brauner <brauner@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Stephen Smalley <stephen.smalley.work@gmail.com>,
 Muchun Song <muchun.song@linux.dev>, linux-security-module@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 Arve =?utf-8?B?SGrDuG5uZXbDpWc=?= <arve@android.com>,
 Johannes Weiner <hannes@cmpxchg.org>, Tejun Heo <tj@kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>, linux-media@vger.kernel.org,
 Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Jan 11, 2023 at 04:49:36PM -0800, T.J. Mercier wrote:
> 
[...]
> > The problem is a bit that with gpu allocations reclaim is essentially "we
> > pass the error to userspace and they get to sort the mess out". There are
> > some exceptions (some gpu drivers to have shrinkers) would we need to make
> > sure these shrinkers are tied into the cgroup stuff before we could enable
> > charging for them?
> >
> I'm also not sure that we can depend on the dmabuf being backed at
> export time 100% of the time? (They are for dmabuf heaps.) If not,
> that'd make calling the existing memcg folio based functions a bit
> difficult.
> 

Where does the actual memory get allocated? I see the first patch is
updating the stat in dma_buf_export() and dma_buf_release(). Does the
memory get allocated and freed in those code paths?
