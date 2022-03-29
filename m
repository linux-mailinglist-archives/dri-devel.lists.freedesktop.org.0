Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A55B94EB262
	for <lists+dri-devel@lfdr.de>; Tue, 29 Mar 2022 18:59:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5E36710E4EC;
	Tue, 29 Mar 2022 16:59:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1033.google.com (mail-pj1-x1033.google.com
 [IPv6:2607:f8b0:4864:20::1033])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4C19410E4EC
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Mar 2022 16:59:46 +0000 (UTC)
Received: by mail-pj1-x1033.google.com with SMTP id gb19so18092998pjb.1
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Mar 2022 09:59:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=67yHXoFmcX0ZazheDKYQVpHoB656ZGpg7LX2oma8XGY=;
 b=l1oIEc6kFQcKGLgIxGfSwqNZBvaZGfVzYIpmLE5Rh6nGhFdWOqxOLcEiD5UGOeShLo
 a3iUDj7MTnw1ZVoumywlaRlOqrOguzQaaUg8sl/W8xYELNabR0FkepIhxq53qWfWRHqT
 ocM2HSkoX6c1ycU+gtCJdRWBI5LQV8B2NcIE2eGHLknFjpgkEJzAV6QEilvZPsFmftqT
 gEf10uCzq4cyr50t7r+MHukvbyXMswobdfj+UiEjLCGz8uU2kyzlTjXvCPVu1iLyYPLF
 hpLrTonQaPEFCwIiW4cB09XczJYAql+ov2htCytwylqN1iQbCWxBZsm43uimxjTneIJO
 mdzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :references:mime-version:content-disposition:in-reply-to;
 bh=67yHXoFmcX0ZazheDKYQVpHoB656ZGpg7LX2oma8XGY=;
 b=K90JbSGZofhkax1L9pc7fpNhH6I9FX8ctLbopTOkb14Ezn2s6Km0Sa6NtiCF6rOGRh
 VNYiquHcgoi9GGgzrl76TOCEJMYzN4BCYjBsXpEWwC7zpzEaAirE5ylgL0UGj/QgYkon
 d2EMecjHF9XtYLbBn186bSp7eETousJxiOClCoVP3NggnBs/RJ9uiaPVzcpLQxsbABLP
 nbb+gBBulHsv2k3T5Nh5eBDTpo8LaDmO2IWhW1xjuwUBbXM5BhZfwPFBwVctEOtlHRnh
 IEk/DEP1QvHscS23HGhuzuDnHsokdERswjoPWFYe1IT+B/2FdsHxOvloYpYOnTOzh9DM
 b6XQ==
X-Gm-Message-State: AOAM531mF/hYYybuaaWU1u0cvIAB/GVQco+us+vuBmtg0Lz9OKutEzEe
 BTn/aNjdBygd+JhdHaNKTjo=
X-Google-Smtp-Source: ABdhPJwzy42BlJVB0bBm4Ge7A7WVOaCsDi/5yGBrI0VAwZfeGFTf8i7B6I5tAtAaOfrhDGFcEZ17Ug==
X-Received: by 2002:a17:902:f68f:b0:154:759c:c78 with SMTP id
 l15-20020a170902f68f00b00154759c0c78mr30853829plg.49.1648573185719; 
 Tue, 29 Mar 2022 09:59:45 -0700 (PDT)
Received: from localhost ([2620:10d:c090:400::5:7749])
 by smtp.gmail.com with ESMTPSA id
 qe15-20020a17090b4f8f00b001c6f4991cd4sm3571258pjb.45.2022.03.29.09.59.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 29 Mar 2022 09:59:45 -0700 (PDT)
Date: Tue, 29 Mar 2022 06:59:43 -1000
From: Tejun Heo <tj@kernel.org>
To: "T.J. Mercier" <tjmercier@google.com>
Subject: Re: [RFC v4 2/8] cgroup: gpu: Add a cgroup controller for allocator
 attribution of GPU memory
Message-ID: <YkM6/57mVxoNfSvm@slm.duckdns.org>
References: <20220328035951.1817417-1-tjmercier@google.com>
 <20220328035951.1817417-3-tjmercier@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220328035951.1817417-3-tjmercier@google.com>
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
 Benjamin Gaignard <benjamin.gaignard@linaro.org>, kaleshsingh@google.com,
 Joel Fernandes <joel@joelfernandes.org>, Shuah Khan <shuah@kernel.org>,
 Sumit Semwal <sumit.semwal@linaro.org>, Kenny.Ho@amd.com,
 Jonathan Corbet <corbet@lwn.net>, Martijn Coenen <maco@android.com>,
 Laura Abbott <labbott@redhat.com>, linux-media@vger.kernel.org,
 linux-kselftest@vger.kernel.org, Todd Kjos <tkjos@android.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, linaro-mm-sig@lists.linaro.org,
 skhan@linuxfoundation.org, cgroups@vger.kernel.org,
 Suren Baghdasaryan <surenb@google.com>, Christian Brauner <brauner@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org,
 Liam Mark <lmark@codeaurora.org>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 Arve =?iso-8859-1?B?SGr4bm5lduVn?= <arve@android.com>, mkoutny@suse.com,
 Johannes Weiner <hannes@cmpxchg.org>, Hridya Valsaraju <hridya@google.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hello,

On Mon, Mar 28, 2022 at 03:59:41AM +0000, T.J. Mercier wrote:
> The API/UAPI can be extended to set per-device/total allocation limits
> in the future.

This total thing kinda bothers me. Can you please provide some concrete
examples of how this and per-device limits would be used?

Thanks.

-- 
tejun
