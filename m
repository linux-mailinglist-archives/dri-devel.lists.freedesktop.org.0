Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DA3E563FF7
	for <lists+dri-devel@lfdr.de>; Sat,  2 Jul 2022 13:57:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7479A2BCC8;
	Sat,  2 Jul 2022 11:57:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com
 [IPv6:2a00:1450:4864:20::634])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9A5082BCBE;
 Sat,  2 Jul 2022 11:57:55 +0000 (UTC)
Received: by mail-ej1-x634.google.com with SMTP id sb34so8354149ejc.11;
 Sat, 02 Jul 2022 04:57:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=5oct/Mca2P8XVhFy4lRX/Nm0TdLF7CZqD8kLxnCcVmw=;
 b=A9WAgXr9lDhNKgP4G8HYvjMcdINUQ+O0blKLB2tcp8kUZ/63IzSI/xZYQRUPLhrpfy
 OHlqJdRk1qxy0kKQDL3Kq+olIkO8QGyBDFDVHu4rvee9UY0ZMyXfzvxsfnEKJZCweEl9
 BK6I2ijY+vefkdzBrISFQlcPNajvjDFiLhIKoSSSVqUqjhbU+GA/19kyBalC7dHA4oOy
 RpAsKubmLZDqRQ31FWS1b30RpIxKLrGPxoKJlXfvDbMUr0QX7EsIUFJ3wqpGsGp81hYj
 e3P0ZWKU7TwiDIPYOgRgIOQc2AwHEA3qH78W04xh11GQGMc0EluD7megk9BWP123aSvX
 QMCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=5oct/Mca2P8XVhFy4lRX/Nm0TdLF7CZqD8kLxnCcVmw=;
 b=jRijDCDeRppb8ez3JYYeBrcF2IiIVnrcfMXZQlFMaibkb5ZgmEtEetn/BH5IARTgsG
 wSrxa4g5IwzLjU3VPWIrgtSfbxuQBby3/TH9FALp9LH5ZmieadiZvJgO0WIz/O0WujeW
 nvDbXIuSZo3/vDJ7oi3k9jlzQXIPCHfQHu1TqrMZUbyQZX7LeuFV23Bt0bhH+B5VsDaN
 vvgOhkkvouDR5OiSviFRMnplIqco46kIaHp9fV14g4aKQqM5CM/F8raIaPDD6E8WvA3/
 8uVE/TvP0A8W3hmPJlo+brja8+1bsfZ5zwQgh7QRljVHn65FXbExLDGI4BIbs1hsrfkI
 eH4Q==
X-Gm-Message-State: AJIora/oWheXwScaAvss09w1EVr/sEa2PlLvQoIa/u463uHAOqflVRWI
 f6orHFrVPXewLPZvAecroaiPjSCqT5dVMPjjIHs=
X-Google-Smtp-Source: AGRyM1sDKUNsykNANtDv0rrY4Qpou+53/pM5SXzCaaqED1Um11bXdi1XtBe/fgiKFE1UZZjQL3ZeH8oqIS9RfIUtfeM=
X-Received: by 2002:a17:906:d550:b0:726:2b34:2fd6 with SMTP id
 cr16-20020a170906d55000b007262b342fd6mr18529741ejc.311.1656763073979; Sat, 02
 Jul 2022 04:57:53 -0700 (PDT)
MIME-Version: 1.0
References: <20220621072050.76229-1-christian.gmeiner@gmail.com>
 <20220621072050.76229-5-christian.gmeiner@gmail.com>
 <2d475e77dca2395ee5b6fcff0e1d3ade2b0a36ef.camel@pengutronix.de>
In-Reply-To: <2d475e77dca2395ee5b6fcff0e1d3ade2b0a36ef.camel@pengutronix.de>
From: Christian Gmeiner <christian.gmeiner@gmail.com>
Date: Sat, 2 Jul 2022 13:57:43 +0200
Message-ID: <CAH9NwWc7x2nUQAhL4vpeOJ-gRUHs4QqqBeo4jbQt0e2Mb=a7_w@mail.gmail.com>
Subject: Re: [PATCH v2 4/4] drm/etnaviv: export loadavg via perfmon
To: Lucas Stach <l.stach@pengutronix.de>
Content-Type: text/plain; charset="UTF-8"
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
 "open list:DRM DRIVERS FOR VIVANTE GPU IP"
 <dri-devel@lists.freedesktop.org>,
 "moderated list:DRM DRIVERS FOR VIVANTE GPU IP"
 <etnaviv@lists.freedesktop.org>, Russell King <linux+etnaviv@armlinux.org.uk>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Lucas

> You need to explain a bit more how you intend to use those.
>
> Contrary to all other perfmon values, where we go to great lengths to
> only count the load put onto the GPU by the specific process requesting
> the perfmon, the loadavg values also include the load caused by other
> submits. Due to this difference in behavior I fear that those new
> counters might be confusing to use. But maybe you have a use-case in
> mind that I don't see right now.

I see these values as total load avg of a sub-GPU component. Sure it is not per
process but it is a starting point. I have no problem introducing per
process load avg
values .. lets see how the next version of this series will look like,

-- 
greets
--
Christian Gmeiner, MSc

https://christian-gmeiner.info/privacypolicy
