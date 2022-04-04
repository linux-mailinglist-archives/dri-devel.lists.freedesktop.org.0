Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7470C4F199C
	for <lists+dri-devel@lfdr.de>; Mon,  4 Apr 2022 19:42:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9897C10E449;
	Mon,  4 Apr 2022 17:42:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x635.google.com (mail-pl1-x635.google.com
 [IPv6:2607:f8b0:4864:20::635])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9289410E449
 for <dri-devel@lists.freedesktop.org>; Mon,  4 Apr 2022 17:41:59 +0000 (UTC)
Received: by mail-pl1-x635.google.com with SMTP id d15so3403215pll.10
 for <dri-devel@lists.freedesktop.org>; Mon, 04 Apr 2022 10:41:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=cN+cryxrTnBG0VJoafZ3s+TyTmI2BuJ8Y3SjnOF9NwE=;
 b=q3aN/qFotQnWnl+DjEG8MO6ne2oneqFucG+YMqB8k3tZY4ziHRZjt9uG5kk2ucPSyJ
 B3t4mekt0LtHaY6B2DxdS9ITSE1r5EeeAd/rhW1xKoa1wo3vU4K2S8P61apUpP5h4bNm
 Ie0A7GhmrIV13SapWYC+pBHHxcMfzG1xl5pi5A5mA6QQacPLxq32GEg+r615aQjVj0cM
 ScAvsigcU1WuLyjMICOCbYf7dvvMMcfNL5CZ9k+EEuJADXpZ4eKJcbWnBjSBr+bT6AiL
 7lCs1XU5CcdliX4j+yjAr9C7RGzTsxJzZ3oMolqcxQoEMANHXQ/CG9u/lINvdUreaUZ7
 6UmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :references:mime-version:content-disposition:in-reply-to;
 bh=cN+cryxrTnBG0VJoafZ3s+TyTmI2BuJ8Y3SjnOF9NwE=;
 b=f0xWO5B/uvkh7pS5ejbq7yKBZyHqkIWD3Ny0k6BhV0r5Yji/4EmxZsyXjMujKnwpay
 V4YN81REn29mWrKAaGSBGAQ5T01sUqfFI+DmFUr4ncvb7HfZc+y2uFwsMwgJyenVotUj
 xLz8YiaQdbyMHyoJt+NoN2YPXf/MaLg2NaR+trrAnOgCx2drEndUFYiz7u31sjxQqEzJ
 3zS607YSJNDQ7uRc30g+oY5SWUsKziIkDaz2t+QWj0UwztwPGBL0PDel6BTcguLPaddA
 B9CihFltRKxdnXrVErZR/KpLNB0KDIwdyIaQwyheQEQehdirSqJLIOEgYz0R9Lo2Oc0E
 +liA==
X-Gm-Message-State: AOAM533uPiXz71s7LnOX27T8e5IjOXJFQn7HbHQ5pqbVvMoxGbODlC4/
 nQZ/lFdz8Ht5S770eToA8D0=
X-Google-Smtp-Source: ABdhPJzKUk4qJcY2Yl04uIk073pVWVy0TAgu29TjkZGtqRzd2GqD3mnxPAiabi9k3biaI+nz18T1DA==
X-Received: by 2002:a17:903:110c:b0:14d:8859:5c8 with SMTP id
 n12-20020a170903110c00b0014d885905c8mr1112876plh.156.1649094118990; 
 Mon, 04 Apr 2022 10:41:58 -0700 (PDT)
Received: from localhost ([2620:10d:c090:400::5:baee])
 by smtp.gmail.com with ESMTPSA id
 v17-20020a63b951000000b0038644f62aeesm10984699pgo.68.2022.04.04.10.41.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 04 Apr 2022 10:41:58 -0700 (PDT)
Date: Mon, 4 Apr 2022 07:41:56 -1000
From: Tejun Heo <tj@kernel.org>
To: "T.J. Mercier" <tjmercier@google.com>
Subject: Re: [RFC v4 2/8] cgroup: gpu: Add a cgroup controller for allocator
 attribution of GPU memory
Message-ID: <Ykst5K/cI+DUVc94@slm.duckdns.org>
References: <20220328035951.1817417-1-tjmercier@google.com>
 <20220328035951.1817417-3-tjmercier@google.com>
 <YkM6/57mVxoNfSvm@slm.duckdns.org>
 <CABdmKX2Gxg35k7QiL2Vn4zWhmQ4UnM-Z8cnOXR0fwBWyJnZ+Ng@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CABdmKX2Gxg35k7QiL2Vn4zWhmQ4UnM-Z8cnOXR0fwBWyJnZ+Ng@mail.gmail.com>
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
Cc: Zefan Li <lizefan.x@bytedance.com>, linux-doc@vger.kernel.org,
 David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org,
 Benjamin Gaignard <benjamin.gaignard@linaro.org>,
 Kalesh Singh <kaleshsingh@google.com>, Joel Fernandes <joel@joelfernandes.org>,
 Shuah Khan <shuah@kernel.org>, Sumit Semwal <sumit.semwal@linaro.org>,
 Kenny.Ho@amd.com, Jonathan Corbet <corbet@lwn.net>,
 Martijn Coenen <maco@android.com>, Laura Abbott <labbott@redhat.com>,
 linux-media@vger.kernel.org, linux-kselftest@vger.kernel.org,
 Todd Kjos <tkjos@android.com>, Thomas Zimmermann <tzimmermann@suse.de>,
 linaro-mm-sig@lists.linaro.org, Shuah Khan <skhan@linuxfoundation.org>,
 cgroups@vger.kernel.org, Suren Baghdasaryan <surenb@google.com>,
 Christian Brauner <brauner@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org,
 Liam Mark <lmark@codeaurora.org>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 Arve =?iso-8859-1?B?SGr4bm5lduVn?= <arve@android.com>,
 Michal =?iso-8859-1?Q?Koutn=FD?= <mkoutny@suse.com>,
 Johannes Weiner <hannes@cmpxchg.org>, Hridya Valsaraju <hridya@google.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hello,

On Wed, Mar 30, 2022 at 01:56:09PM -0700, T.J. Mercier wrote:
> The use case we have for accounting the total (separate from the
> individual devices) is to include the value as part of bugreports, for
> understanding the system-wide amount of dmabuf allocations. I'm not
> aware of an existing need to limit the total. Admittedly this is just
> the sum over the devices, but we currently maintain out of tree code
> to do this sort of thing today. [1]

So, drop this part?

Thanks.

-- 
tejun
