Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 99C6750AA02
	for <lists+dri-devel@lfdr.de>; Thu, 21 Apr 2022 22:34:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 90C2610E02C;
	Thu, 21 Apr 2022 20:34:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x62d.google.com (mail-pl1-x62d.google.com
 [IPv6:2607:f8b0:4864:20::62d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B6BDA10E02C
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Apr 2022 20:34:43 +0000 (UTC)
Received: by mail-pl1-x62d.google.com with SMTP id c12so6290049plr.6
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Apr 2022 13:34:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=G4IR1S+2VnwD7ZwrNOGPf8P9V36/go7S4VZyJGUy/Eg=;
 b=BeBm2eCz8cCv5EEwO12oLBJh46F9ARV+D9fbWF0OpKzAlZ2f9Cqn1mlMW0Q+hqt1si
 SNwqiVkEcfOlrK5XuSyNB6WwgLvoYWjzyzSB1Cj+1QyZZUBhq5r48tYzxK5JC52cCC3/
 ajIkbwxhpssuY+ODp6aFA+bKiKHDBWWX2Gp9I/8LIsjU3iPgPRL9WQSjqdQZWqm5OWhs
 IpBqsF2uHR/6eeapencgOESAi9gjjtGdJdnIUFyFQWpxgP0oDVygH0jscEMiHW97DGoL
 NBMS+PaSdFRiQn0bVqbDm6/3e2ALxpSdOWopem8ZJWwzLhpRDDKjjzHgoYSKBw1koicA
 schg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :references:mime-version:content-disposition:in-reply-to;
 bh=G4IR1S+2VnwD7ZwrNOGPf8P9V36/go7S4VZyJGUy/Eg=;
 b=Jom7eoaTMGiF0kpjtT1ScqxHfaqmrGlSNiUQciX0lAibD77W8So4uBI4cttXTQSu+Y
 I5f/Cbk9sw4SRAerN9mCULMEndH3Iamzm5d8nHR/teWCUtIdBtOpxfh21a1NOA+ZSg9H
 pecZh2v3X9TVMrY9iShP2dG9wX7KBBVP9/TwMlxaLH3Ax4I32gdgh0RXz36t1wdZ68ri
 jtJCl6ZEmRWZzT2xpa+bEAJdIOefN1Ow/aLhCZ9BTFulNhviJihFi9OYb25xrVlILyzW
 zyCsDo4oSjTkkgse0ve7MMvw7/TwU1bUv9xqWrJxpdK9DAuaQxLSRGr86oFjU/mWyt2J
 44RQ==
X-Gm-Message-State: AOAM530x1bn57zfQtsPryCRA7RuyuT1A8jPORKTdtqgaqOREQqDvK3tM
 HpvArhZ2ikZUVDNpkl3zUec=
X-Google-Smtp-Source: ABdhPJxtMvhIb2TjDzKuAYMD44ZqmSeED73RT8ANu1mxwafrsnuy9aQ+rPJG550seXXJi/jenUB82w==
X-Received: by 2002:a17:902:ab96:b0:159:1ff:4ea0 with SMTP id
 f22-20020a170902ab9600b0015901ff4ea0mr1272731plr.60.1650573283231; 
 Thu, 21 Apr 2022 13:34:43 -0700 (PDT)
Received: from localhost ([2620:10d:c090:400::5:2c86])
 by smtp.gmail.com with ESMTPSA id
 z7-20020a056a00240700b004e1cde37bc1sm25720846pfh.84.2022.04.21.13.34.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Apr 2022 13:34:42 -0700 (PDT)
Date: Thu, 21 Apr 2022 10:34:41 -1000
From: Tejun Heo <tj@kernel.org>
To: "T.J. Mercier" <tjmercier@google.com>
Subject: Re: [RFC v5 1/6] gpu: rfc: Proposal for a GPU cgroup controller
Message-ID: <YmG/4Q0Cz0yUMbu+@slm.duckdns.org>
References: <20220420235228.2767816-1-tjmercier@google.com>
 <20220420235228.2767816-2-tjmercier@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220420235228.2767816-2-tjmercier@google.com>
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
Cc: kernel-team@android.com, tkjos@android.com,
 Jonathan Corbet <corbet@lwn.net>, David Airlie <airlied@linux.ie>,
 Kenny.Ho@amd.com, skhan@linuxfoundation.org, cmllamas@google.com,
 linux-doc@vger.kernel.org, jstultz@google.com, dri-devel@lists.freedesktop.org,
 Thomas Zimmermann <tzimmermann@suse.de>, kaleshsingh@google.com,
 hridya@google.com, mkoutny@suse.com, surenb@google.com,
 christian.koenig@amd.com, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hello,

On Wed, Apr 20, 2022 at 11:52:19PM +0000, T.J. Mercier wrote:
> From: Hridya Valsaraju <hridya@google.com>
> 
> This patch adds a proposal for a new GPU cgroup controller for
> accounting/limiting GPU and GPU-related memory allocations.
> The proposed controller is based on the DRM cgroup controller[1] and
> follows the design of the RDMA cgroup controller.
> 
> The new cgroup controller would:
> * Allow setting per-device limits on the total size of buffers
>   allocated by device within a cgroup.
> * Expose a per-device/allocator breakdown of the buffers charged to a
>   cgroup.
> 
> The prototype in the following patches is only for memory accounting
> using the GPU cgroup controller and does not implement limit setting.
> 
> [1]: https://lore.kernel.org/amd-gfx/20210126214626.16260-1-brian.welty@intel.com/
> 
> Signed-off-by: Hridya Valsaraju <hridya@google.com>
> Signed-off-by: T.J. Mercier <tjmercier@google.com>

Looks straight-forward enough from cgroup side. Are gpu folks generally
happy? David, Daniel, Kenny, what are your thoughts?

>  Documentation/gpu/rfc/gpu-cgroup.rst | 190 +++++++++++++++++++++++++++

Can you fold the important part into cgroup-v2.rst and maybe make the rest
code comments if necessary?

Thanks.

-- 
tejun
