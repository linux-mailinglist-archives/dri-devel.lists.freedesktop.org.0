Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4469E24EF60
	for <lists+dri-devel@lfdr.de>; Sun, 23 Aug 2020 21:10:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 836A16E57E;
	Sun, 23 Aug 2020 19:10:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vk1-xa41.google.com (mail-vk1-xa41.google.com
 [IPv6:2607:f8b0:4864:20::a41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C10F16E570;
 Sun, 23 Aug 2020 19:10:37 +0000 (UTC)
Received: by mail-vk1-xa41.google.com with SMTP id q200so1517199vke.6;
 Sun, 23 Aug 2020 12:10:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=fixgxjlxG7QIXPN2YxGkMRUK38NeMqUp1q0BJiriqbQ=;
 b=o6X078F9Vb4O2HdbhUp4hPe9uGR1cNzRDBlHAOgBld/Jt2QkD4Yjm+LCFZ7YwP50oA
 C4KnFGhz6QjN9I1JTKyej5Yw/t2Mr6BhPpQGz+cM+Z3cctEBNqK7Cz+lIOUVmSCrm4NM
 DUKNib2DZulPwClSk8r+VSavYfZzBnA75hLcEa9/UedL0vXxoyCayOkziKLvpienRzki
 +pSG5DAq5XzXLQMB7HH5MgYvWdqIxds7Jqpxr0olzIhh4RIHphFdTOIR6c1VDGm1EA50
 xK0FKPoV7/xU1vNuGdPTUEk3iqd1IAQGKZ14+6OjjoQ6CuhLPh8lP+CQAi6NwpU4ePWg
 5RLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=fixgxjlxG7QIXPN2YxGkMRUK38NeMqUp1q0BJiriqbQ=;
 b=BditUvmwK1SNSJJOfBikH6P/gbT4tRXtPAY+/e+3QqgBHsKEK+8xkYDb2L+hKPVxLy
 lP5+KjhR/RvMIYMqHy8Voz+as0EcrZND+5kxOjMuAWuHGFy4PjuPXbquwnbyDyhbjWBo
 Dc1NSCYaCzP76MWnQnc6NEG3c8+9gcWA0/8GgVsW2SqLUXztxRD0MSI195DZHZ26ZMvj
 cZe/GK3sEJZ/ICMAVQiPcYkBJ9eiK9ifaeCOJZsqEYqwJSabx4DrzgzvBYN4t7O0Wc6H
 oVMwaMf9FJOOtns332hVEv0WHuB9AeIDu3uXJi3xi8mSfE7ouSUPZtjPHnrWRTlHAMbo
 W5QA==
X-Gm-Message-State: AOAM530/OFrT6uy4erqiFIUYxntdyBhKDTaqGhzVIkjceGG2AKARoNst
 I2rrUFaTH9WvkW4WsxJI8nOeBLR78Z47FecQlms=
X-Google-Smtp-Source: ABdhPJwmDqC+ZQlbXBXeT3R9Gfjh/ah+Or2kyGL6qa63ZORihLmlGDsR8lJSysSVo0Cdz1G/obICbLNeN+EXfzefHes=
X-Received: by 2002:a1f:1ad6:: with SMTP id a205mr936226vka.67.1598209836836; 
 Sun, 23 Aug 2020 12:10:36 -0700 (PDT)
MIME-Version: 1.0
References: <20200821181731.94852-1-christian.gmeiner@gmail.com>
 <4dbee9c7-8a59-9250-ab13-394cbab689a8@jm0.eu>
In-Reply-To: <4dbee9c7-8a59-9250-ab13-394cbab689a8@jm0.eu>
From: Christian Gmeiner <christian.gmeiner@gmail.com>
Date: Sun, 23 Aug 2020 21:10:25 +0200
Message-ID: <CAH9NwWdLnwb0BiR6qAHKFexFm2NJkpHv7Z7YAdQ7fJBVxjGH4w@mail.gmail.com>
Subject: Re: [PATCH] drm/etnaviv: fix external abort seen on GC600 rev 0x19
To: "Ing. Josua Mayer" <josua.mayer@jm0.eu>
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
Cc: David Airlie <airlied@linux.ie>, LKML <linux-kernel@vger.kernel.org>,
 stable@vger.kernel.org, The etnaviv authors <etnaviv@lists.freedesktop.org>,
 DRI mailing list <dri-devel@lists.freedesktop.org>,
 Russell King <linux+etnaviv@armlinux.org.uk>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi

> I have formally tested the patch with 5.7.10 - and it doesn't resolve
> the issue - sadly :(
>
> From my testing, the reads on
> VIVS_HI_CHIP_PRODUCT_ID
> VIVS_HI_CHIP_ECO_ID
> need to be conditional - while
> VIVS_HI_CHIP_CUSTOMER_ID
> seems to be okay.
>

Uhh.. okay.. just send a V2 - thanks for testing :)

-- 
greets
--
Christian Gmeiner, MSc

https://christian-gmeiner.info/privacypolicy
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
