Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 368424EB245
	for <lists+dri-devel@lfdr.de>; Tue, 29 Mar 2022 18:50:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1816710E9B4;
	Tue, 29 Mar 2022 16:50:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x631.google.com (mail-pl1-x631.google.com
 [IPv6:2607:f8b0:4864:20::631])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4139E10E9B4
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Mar 2022 16:50:37 +0000 (UTC)
Received: by mail-pl1-x631.google.com with SMTP id j13so18154421plj.8
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Mar 2022 09:50:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=oo4DwVPmc4Xc8mHsSOZJPPM1+kxb1H+BME8RduWXyEc=;
 b=fon/v7xEg/MG9yKo0ZhFyVDd8Pi8tu6+Ushj4CQ5i5ZK7JvGdhYA+9e/SNRbZmP9Sv
 pCKmTk3lb6hjAAWbXCrUihV4aR6Osupca5LKufEEjFzjS5dKaHLe0jNplTFUZ36iHnVk
 sTubKidTh4TFkPcklY8dTxB8YzPtwQKC9XMO0UBR3PrCLB/DdkbgqeffVh5WeCzY1Kz3
 JiapQ7p+VMjbsVZb1XgQylMCEerXzU91lVY69si8AUutSOzJsBTatSYV6g7QbeGrvQUa
 oPrdqMZejb1WJMC3kUMFa0DQeBm3jfo1vJfKQPQsi7YcylRvBDYfhLYmZlW2miVTOKKE
 o0Mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :references:mime-version:content-disposition:in-reply-to;
 bh=oo4DwVPmc4Xc8mHsSOZJPPM1+kxb1H+BME8RduWXyEc=;
 b=R61wjKvyFgyEzHVtPpB/6iB8v9OaTDNObJA0hcO179lyLjmq7tTPhx9NLyKoHEYBSr
 rYKwcZNzuDGGRTZsZW+4dmTx2X30bTbFpROBxtX5BfqKkwOp7P6HiC8Br3yU4zacPDR4
 i3TPpwOxNLH5piQBZV+2L0T6yr6lMN2v6l9U5QVzDgVZOjYSfVHgLOZNihTZps8JVXbz
 sNJrGu+o+4FWOOp9cHtTd1SUxObWNxJvXCogyXiP6oF1vfnCr3qE+Rmw59ZYh81mgK4o
 9h5CuGHLDUPz8unC534pVK1BNDdGgN0kTavEGZklRNtlwVONJZ6vgxqHvma5mfn9PT8+
 ZyiQ==
X-Gm-Message-State: AOAM530DtU9//C2M948WQi5Li2hHp66Ll8SGAq2fVHw4CrOpTuIU/WCo
 ir5WzFm5o/dpFnryOGDQHfg=
X-Google-Smtp-Source: ABdhPJwK34gym8LY0bVce8JYqwr3XDALjGLRfStGWGhzeJS7utaFiUFkwfefNjUZnxfhL3wq68o19Q==
X-Received: by 2002:a17:903:246:b0:153:87f0:a93e with SMTP id
 j6-20020a170903024600b0015387f0a93emr31382772plh.171.1648572636435; 
 Tue, 29 Mar 2022 09:50:36 -0700 (PDT)
Received: from localhost ([2620:10d:c090:400::5:7749])
 by smtp.gmail.com with ESMTPSA id
 b25-20020a637159000000b00381fda49d15sm17968864pgn.39.2022.03.29.09.50.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 29 Mar 2022 09:50:35 -0700 (PDT)
Date: Tue, 29 Mar 2022 06:50:34 -1000
From: Tejun Heo <tj@kernel.org>
To: Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [RFC v4 4/8] dmabuf: heaps: export system_heap buffers with GPU
 cgroup charging
Message-ID: <YkM42vdq3mdIP9Zl@slm.duckdns.org>
References: <20220328035951.1817417-1-tjmercier@google.com>
 <20220328035951.1817417-5-tjmercier@google.com>
 <YkHH/0Use7F30UUE@phenom.ffwll.local>
 <CABdmKX01p6g_iHsB6dd4Wwh=8iLdYiUqdY6_yyA5ax2YNHt6tQ@mail.gmail.com>
 <YkLGbL5Z3HVCyVkK@phenom.ffwll.local>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YkLGbL5Z3HVCyVkK@phenom.ffwll.local>
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
 Todd Kjos <tkjos@android.com>, linaro-mm-sig@lists.linaro.org,
 Shuah Khan <skhan@linuxfoundation.org>, cgroups@vger.kernel.org,
 Suren Baghdasaryan <surenb@google.com>, "T.J. Mercier" <tjmercier@google.com>,
 Christian Brauner <brauner@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org,
 Liam Mark <lmark@codeaurora.org>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 Arve =?iso-8859-1?B?SGr4bm5lduVn?= <arve@android.com>,
 Michal =?iso-8859-1?Q?Koutn=FD?= <mkoutny@suse.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Johannes Weiner <hannes@cmpxchg.org>,
 Hridya Valsaraju <hridya@google.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Mar 29, 2022 at 10:42:20AM +0200, Daniel Vetter wrote:
> Hm I just realized ... are the names in the groups abi? If yes then I
> think we need to fix this before we merge anything.

Yes.

Thanks.

-- 
tejun
