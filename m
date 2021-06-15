Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EBFC3A8B90
	for <lists+dri-devel@lfdr.de>; Wed, 16 Jun 2021 00:06:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9B3A46E44C;
	Tue, 15 Jun 2021 22:06:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x232.google.com (mail-lj1-x232.google.com
 [IPv6:2a00:1450:4864:20::232])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 209086E442
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Jun 2021 22:06:05 +0000 (UTC)
Received: by mail-lj1-x232.google.com with SMTP id l4so903214ljg.0
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Jun 2021 15:06:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=osmS7oOq+n4QzI+Xe8pcxuF/br8CTQZxLkSR1NlWykI=;
 b=LIFipo7HWjrpjTL5SlngM5Sw4PgSv9EXCZ+r1OAKtSpzKg6eXPh5manUQcLrP5R8h3
 Kim346TmeSjSJBAtiBTy0DRW+J7TUhiOpXuS/WnTJPHlP603Mg6dwXTKle9BupqcFFKR
 RjGAc+lvruOKIrEre4OK5O5ljMY0IBCtVw78fjeeH3lVUa8IIvWZTP/xrkP1B+0Ny+WK
 9gv5HRq30I+9vMVALapjex177kocXuvV8Xn2r82u1T9nRFfQoXvdjqUsuYeF1Wwsv6mX
 eUD+GSttbb+RltInwOKyrOwy8O7mIHEFHtAEiTbxmzKH/5fFb/8gTFHdahKVkUFGQTR2
 1exA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=osmS7oOq+n4QzI+Xe8pcxuF/br8CTQZxLkSR1NlWykI=;
 b=GmfYQUrY1hINql7ova6GFhIvggtBrboQwWSONDRdoSJjqLoIELcc/Cb62SNqsxflCb
 KkbUEps6rUHcgs7pLdsLtWUHv8aU8rHnJai5Mk/dqk6oa90bGWw6EfHc0ARWsULlm2vi
 aM6whyD4JFvld5nX6FZYDbwzHFuiUXUCkz3BLOq425qQwbzS33Hm30dgurGEUI9mW0XS
 NZxlu6hJ4VcmYO32x/9DAD4C+d8icFWWA0h8J4N1MaQpQexPwUSDKjDxdh5jYrZ6VkvF
 bbxYbf0r6E84ujkOzt5b6azM9y+ObSpBIP/6/WVCpSTgAiTFpe/Ak1k0xrqK0yYxSnfH
 wrTA==
X-Gm-Message-State: AOAM532gCL3ttkk/AkO9jvKKLLM6phkGBYj1Svz+3NUnTMBGWlMFmpaZ
 pc8OkAbDYbuLKjIaL11wnXY=
X-Google-Smtp-Source: ABdhPJxF8WENCWUuGB9/wevnWgpArKnDPVb/KouYIIa0fHFfdI+u/ZrxZeobdR6LM84WeUXvhPHAiQ==
X-Received: by 2002:a05:651c:1193:: with SMTP id
 w19mr1556473ljo.264.1623794763571; 
 Tue, 15 Jun 2021 15:06:03 -0700 (PDT)
Received: from [192.168.2.145] (94-29-31-25.dynamic.spd-mgts.ru. [94.29.31.25])
 by smtp.googlemail.com with ESMTPSA id g15sm32451lfu.55.2021.06.15.15.06.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 15 Jun 2021 15:06:03 -0700 (PDT)
Subject: Re: [PATCH v7 02/15] gpu: host1x: Add no-recovery mode
To: Mikko Perttunen <mperttunen@nvidia.com>, thierry.reding@gmail.com,
 jonathanh@nvidia.com, airlied@linux.ie, daniel@ffwll.ch
References: <20210610110456.3692391-1-mperttunen@nvidia.com>
 <20210610110456.3692391-3-mperttunen@nvidia.com>
From: Dmitry Osipenko <digetx@gmail.com>
Message-ID: <7fc989aa-317a-fedf-b223-fe563da72ff6@gmail.com>
Date: Wed, 16 Jun 2021 01:06:02 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210610110456.3692391-3-mperttunen@nvidia.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
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
Cc: linux-tegra@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

10.06.2021 14:04, Mikko Perttunen пишет:
> Add a new property for jobs to enable or disable recovery i.e.
> CPU increments of syncpoints to max value on job timeout. This
> allows for a more solid model for hanged jobs, where userspace
> doesn't need to guess if a syncpoint increment happened because
> the job completed, or because job timeout was triggered.

Userspace should always get proper timeout. Threshold should be wrapped
into fence. Fence's error state should be set to -ETIMEDOUT.

> On job timeout, we stop the channel, NOP all future jobs on the
> channel using the same syncpoint, mark the syncpoint as locked
> and resume the channel from the next job, if any.
> 
> The future jobs are NOPed, since because we don't do the CPU
> increments, the value of the syncpoint is no longer synchronized,
> and any waiters would become confused if a future job incremented
> the syncpoint. The syncpoint is marked locked to ensure that any
> future jobs cannot increment the syncpoint either, until the
> application has recognized the situation and reallocated the
> syncpoint.

It should be much easier to switch to DRM scheduler, removing lot's of
the old code instead of updating it with new quirks that are difficult
to follow.
