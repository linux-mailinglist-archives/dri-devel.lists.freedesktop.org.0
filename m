Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C427A1A6EB8
	for <lists+dri-devel@lfdr.de>; Mon, 13 Apr 2020 23:53:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A276C6E10B;
	Mon, 13 Apr 2020 21:53:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x741.google.com (mail-qk1-x741.google.com
 [IPv6:2607:f8b0:4864:20::741])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5CB9E6E0CA;
 Mon, 13 Apr 2020 21:53:33 +0000 (UTC)
Received: by mail-qk1-x741.google.com with SMTP id 20so3153776qkl.10;
 Mon, 13 Apr 2020 14:53:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=kr/9d9Xct1hX07rDbEYx8wUsf1dJ+pFlOXTM040jufY=;
 b=gt6u/J4rlzknBml16vacwiBKZilSvdoYDgWZrDknJ+/046sco+2EB80oMUdV/xHBPs
 JXsoYf9KaaFkZbzeDRtByuMlHipVMlzej9/sgWSKPxw3Y2bbq19joPpCqEeVpFGZN/kW
 LGzexbW2TXKA87eDlyeQPbwbYK//L1/PGzT+32hn9sEykCWesA9Z4Z+XJ6qgnQblAwke
 zxLDzq78qEG9KKKCo/BbyLfOgUYD3uVPXzDtQOaEHP2kvWOMG1rr9rTw2Hse/IGwcYsD
 8Xg55dDgYHJ90FzihCUobI7Sv7LeHFHd7CqDtHUuB7DdwAEPvH+OY+6IqE3xGXs/m7+0
 7kxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :references:mime-version:content-disposition:in-reply-to;
 bh=kr/9d9Xct1hX07rDbEYx8wUsf1dJ+pFlOXTM040jufY=;
 b=WVx3JHWCRIaTBzMwMuhCF6gx4m1vzqMt96EQ75oDZAfgmaipfEEfqEi6U0RChOH44S
 EXfdyPv/goVk7y+b/Z3nd7Cfv+QcVMiYE11lfwLT1OJzNeBd/Hv9XedMMRlwN2bhZli6
 n/5bQEXPn9Ukei/DESgBlU2Kbp6za3hW727Lh8OIFOq8vZKo/igQZenx6uU/20NrUPXh
 Js9Dm6cYQewkMwD6EnJp12moUleK4E4TpR7a1KH3wdsPDTGDBn7pQvyhLSkgsELTaZg8
 W6CrfQ+AOxYBHDHpEiD3/ggmhoxaekDVonmkV9TaSnpRQrwGADmchWHSaYlAAfwgZVIK
 cr0w==
X-Gm-Message-State: AGi0PuYlmcwObTrwTWu6WvnrFnedZjUwPDPLQiqEy/PdsoedxjlWL4zr
 0EI6EnH0Qma8/hSNRHeJHAA=
X-Google-Smtp-Source: APiQypKYvGVAUQdJvUhUcfpVugeCgnmzh+M4+j8oxN9vOsaUt+g4IHvXRJi0IouPshrZh4OlXSZCIA==
X-Received: by 2002:a37:a0c7:: with SMTP id j190mr9233931qke.461.1586814812277; 
 Mon, 13 Apr 2020 14:53:32 -0700 (PDT)
Received: from localhost ([199.96.181.106])
 by smtp.gmail.com with ESMTPSA id y127sm9339458qkb.76.2020.04.13.14.53.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Apr 2020 14:53:31 -0700 (PDT)
Date: Mon, 13 Apr 2020 17:53:30 -0400
From: Tejun Heo <tj@kernel.org>
To: Kenny Ho <y2kenny@gmail.com>
Subject: Re: [PATCH v2 00/11] new cgroup controller for gpu/drm subsystem
Message-ID: <20200413215330.GN60335@mtj.duckdns.org>
References: <20200226190152.16131-1-Kenny.Ho@amd.com>
 <CAOWid-eyMGZfOyfEQikwCmPnKxx6MnTm17pBvPeNpgKWi0xN-w@mail.gmail.com>
 <20200324184633.GH162390@mtj.duckdns.org>
 <CAOWid-cS-5YkFBLACotkZZCH0RSjHH94_r3VFH8vEPOubzSpPA@mail.gmail.com>
 <20200413191136.GI60335@mtj.duckdns.org>
 <CAOWid-dM=38faGOF9=-Pq=sxssaL+gm2umctyGVQWVx2etShyQ@mail.gmail.com>
 <20200413205436.GM60335@mtj.duckdns.org>
 <CAOWid-fvmxSXtGUtQSZ4Ow1fK+wR8hbnUe5PcsM56EZMOMwb6g@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAOWid-fvmxSXtGUtQSZ4Ow1fK+wR8hbnUe5PcsM56EZMOMwb6g@mail.gmail.com>
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
Cc: Kenny Ho <Kenny.Ho@amd.com>, "Kuehling, Felix" <felix.kuehling@amd.com>,
 jsparks@cray.com, amd-gfx list <amd-gfx@lists.freedesktop.org>,
 lkaplan@cray.com, dri-devel <dri-devel@lists.freedesktop.org>, "Greathouse,
 Joseph" <joseph.greathouse@amd.com>, Alex Deucher <alexander.deucher@amd.com>,
 cgroups@vger.kernel.org,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hello,

On Mon, Apr 13, 2020 at 05:40:32PM -0400, Kenny Ho wrote:
> By lack of consense, do you mean Intel's assertion that a standard is
> not a standard until Intel implements it? (That was in the context of
> OpenCL language standard with the concept of SubDevice.)  I thought
> the discussion so far has established that the concept of a compute
> unit, while named differently (AMD's CUs, ARM's SCs, Intel's EUs,
> Nvidia's SMs, Qualcomm's SPs), is cross vendor.  While an AMD CU is
> not the same as an Intel EU or Nvidia SM, the same can be said for CPU
> cores.  If cpuset is acceptable for a diversity of CPU core designs
> and arrangements, I don't understand why an interface derived from GPU
> SubDevice is considered premature.

CPUs are a lot more uniform across vendors than GPUs and have way higher user
observability and awareness. And, even then, it's something which has limited
usefulness because the configuration is inherently more complex involving
topology details and the end result is not work-conserving.

cpuset is there partly due to historical reasons and its features can often be
trivially replicated with some scripting around taskset. If that's all you're
trying to add, I don't see why it needs to be in cgroup at all. Just implement
a tool similar to taskset and build sufficient tooling around it. Given how
hardware specific it can become, that is likely the better direction anyway.

Thanks.

-- 
tejun
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
