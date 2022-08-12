Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 929855916CB
	for <lists+dri-devel@lfdr.de>; Fri, 12 Aug 2022 23:43:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6A9358A445;
	Fri, 12 Aug 2022 21:43:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1036.google.com (mail-pj1-x1036.google.com
 [IPv6:2607:f8b0:4864:20::1036])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1496C18B5CC;
 Fri, 12 Aug 2022 21:43:10 +0000 (UTC)
Received: by mail-pj1-x1036.google.com with SMTP id
 w11-20020a17090a380b00b001f73f75a1feso9465396pjb.2; 
 Fri, 12 Aug 2022 14:43:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:sender:from:to:cc;
 bh=HsCUQ8j36I4b68/toXmGXuF2hsPiyYP9smjWccI2rQk=;
 b=T8edxcRXD18BsL1RTMjGrj5n5dQsaZ4ojGAmMwVXKsYJdht7fJ7wztz/lJ1kLjnRrU
 6Q7c32Y6LN1DE3ooBXiX1OUl6mf/pVEtG+KgbRHbR6NKEp0cSOrtaM+jq500rZ+KzukA
 mc/wTkGgq4u9MKsQT0i919rJABVE6il55R8QLPNON59KLiyPH0abZHeRnsixJqjlZz74
 P1pnhPNaFVgWLAU+ZB+dW7vmVM7yHyVBv3Z4Ldo9oUzYBcC34Z8ZXJTo29AtuInBURZU
 nEx3PPBKtG0g1ceLACYgAXiP6itMQ9oIL1UEEjnecWNcY+pVJiNV/pMKYRyNMh++rqv+
 CmOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc;
 bh=HsCUQ8j36I4b68/toXmGXuF2hsPiyYP9smjWccI2rQk=;
 b=JHVK9zN/3hWVAXzg04lJybXIfxGL+7Qv6VY90+Sbbaiy3bWRIVIqSKeX519Oh2TYho
 ApNCILvpiFwUoNfMybIi9ZEK3HLlidwbInmcGHou4CD/O8e/gNoK2zOK+w1iOfQVl7o7
 mXokriKaHI/P7EcWOjGBiY468G0GGkzOzEckPGgSu87eV4IxgjqqH6fwARyJEg5o7gF2
 gGJFav/1a/DvOl0zVuAMvAGLlGeSGIV9kRt1UFbNLs3qg+ZZMjGQAuDvEWHfTxdXA72h
 q72LhqqBxjo3r9nQlILbgMa0L5SaEYx+2Zw9sIarKExhlfq3EmYukWPJs+yDJKHW9w98
 rM1Q==
X-Gm-Message-State: ACgBeo26G0gWjbJpBW5AqIW38f9tQC5t0Zb64EjtQxF9v7uShsc4zS8O
 XtVF9hmUHesCd1nk+frRd4w=
X-Google-Smtp-Source: AA6agR4Fgetd/4HyBb1xn64ltu8RG1s/lBb7ckWrb3o9x7Qa3INFkzW5TI9HPOMXY2FYziGwhUfswQ==
X-Received: by 2002:a17:90a:d70f:b0:1f3:290b:c8f6 with SMTP id
 y15-20020a17090ad70f00b001f3290bc8f6mr15857826pju.190.1660340589426; 
 Fri, 12 Aug 2022 14:43:09 -0700 (PDT)
Received: from localhost ([2620:10d:c090:400::5:aae])
 by smtp.gmail.com with ESMTPSA id
 g23-20020a63e617000000b0041cd2417c66sm1762561pgh.18.2022.08.12.14.43.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 12 Aug 2022 14:43:08 -0700 (PDT)
Date: Fri, 12 Aug 2022 11:43:07 -1000
From: Tejun Heo <tj@kernel.org>
To: Felix Kuehling <felix.kuehling@amd.com>
Subject: Re: Selecting CPUs for queuing work on
Message-ID: <YvbJa/6UvSswf8ve@slm.duckdns.org>
References: <82233e68-106f-39e9-b20d-7794eb7a8933@amd.com>
 <Yva4g3V2jAP0NKcY@slm.duckdns.org>
 <5256fc4b-437b-f7fb-55b6-abab091e0182@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5256fc4b-437b-f7fb-55b6-abab091e0182@amd.com>
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
Cc: Philip Yang <Philip.Yang@amd.com>, Lai Jiangshan <jiangshanlai@gmail.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hello,

On Fri, Aug 12, 2022 at 04:54:04PM -0400, Felix Kuehling wrote:
> In principle, I think IRQ routing to CPUs can change dynamically with
> irqbalance.

I wonder whether this is something which should be exposed to userland
rather than trying to do dynamically in the kernel and let irqbalance or
whatever deal with it. People use irq affinity to steer these handlings to
specfic CPUs and the usual expectation is that the bottom half handling is
gonna take place on the same cpu usually through softirq. It's kinda awkard
to have this secondary assignment happening implicitly.

> What we need is kind of the opposite of WQ_UNBOUND. As I understand it,
> WQ_UNBOUND can schedule anywhere to maximize concurrency. What we need is to
> schedule to very specific, predictable CPUs. We only have one work item per
> GPU that processes all the interrupts in order, so we don't need the
> concurrency of WQ_UNBOUND.

Each WQ_UNBOUND workqueue has a cpumask associated with it and the cpumask
can be changed dynamically, so it can be used for sth like this, but I'm not
yet convinced that's the right thing to do.

Thanks.

-- 
tejun
