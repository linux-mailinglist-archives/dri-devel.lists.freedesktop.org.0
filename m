Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 43E12633B79
	for <lists+dri-devel@lfdr.de>; Tue, 22 Nov 2022 12:35:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9080C10E0AA;
	Tue, 22 Nov 2022 11:35:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x82c.google.com (mail-qt1-x82c.google.com
 [IPv6:2607:f8b0:4864:20::82c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F0D2110E08F;
 Tue, 22 Nov 2022 11:35:12 +0000 (UTC)
Received: by mail-qt1-x82c.google.com with SMTP id a27so9020444qtw.10;
 Tue, 22 Nov 2022 03:35:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=to:subject:message-id:date:from:in-reply-to:references:mime-version
 :from:to:cc:subject:date:message-id:reply-to;
 bh=yjcaEIU8aaszVdE2YJFXT5V87395aETVGSUxQ01ZdKA=;
 b=iGmNWndvUeaZGjqbr+ZMN0HCB7sowPojucwRe5nzbbkZjp2gkNI6GeOVVqdl2+XZQu
 bpgxuU1nTZ+O/CQ2xwq8g+ZxYDAQTkn/bo8sLC2gULM3gFHhr0+fiExG/57/5Qe1TMYB
 7UFKRmZtL2OUxyZwQsgRJXmqnh9vCK2Wf0CW89C6rk/1qgaCBGFQsW8MhGAAEnYpos69
 OIv9qlMf9r7uG1dMjFfHr/N9yL3AbZsq+A1QqLlW9QPFlUQudfZXhqPFMC3Fura0H91u
 De98fi3JvpFJ5YcJscDjA80WbQHcm+/ci0rZN3PSQNdQkkdPxkvySXRhgxb4Y4w29+cq
 RI3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=to:subject:message-id:date:from:in-reply-to:references:mime-version
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=yjcaEIU8aaszVdE2YJFXT5V87395aETVGSUxQ01ZdKA=;
 b=VegSwh8TLZR4u5gMFflKF2w5mvSXRS8/DipzoM9FAOJ4g8KVge3nn0wueopvmwuzI1
 uHl1H8rbx5YzX7PHRgOokfaAO7qYKotizEKuYXJHgMNzmROe0yKr1EhAbk8lIuARBGNg
 WFDxZ51iT4+zNQ2anYzRaWvZv5iQvemyQv33aSDP/JxN6wt6hLL5NyAzi/QKzH1l3nO8
 RcbXk4MUrSQ9jCTXWVQJNXIpmdByNadnK5kpuX1KN34svp1V80rNbwj1g6EQNzo9HUUr
 BsE0QKvaHFKizjhR7yELNZUyst/hCRfjhxecpvb5fUMddDWyk8fs+NPKPrSIwAtKxWJX
 tDVA==
X-Gm-Message-State: ANoB5pl0wTkgZzG084UeleGcvCN2v8GsCPSG5MJ8Nj6leAPnY4MNpWXj
 2Ipkpe0cLf1pLVvIl5F+sa+ZYm7k75Jloak/23MBPDOotAMqF9C9aCQ=
X-Google-Smtp-Source: AA0mqf4s/tmixJs7XFTUNXmYEIqSfZaZ+o3bkQmJ0pO+hCd0Zlcrm7DU5ubR77tUpZsMXto5dpdCfITM+2Ajbk4WwAI=
X-Received: by 2002:ac8:480c:0:b0:3a4:f1c1:49a9 with SMTP id
 g12-20020ac8480c000000b003a4f1c149a9mr5452589qtq.464.1669116911696; Tue, 22
 Nov 2022 03:35:11 -0800 (PST)
MIME-Version: 1.0
References: <CABXGCsNFRQ9A1Vx6_qsP7NqedhG7QScOG4-Eupvz3etgykJt=Q@mail.gmail.com>
In-Reply-To: <CABXGCsNFRQ9A1Vx6_qsP7NqedhG7QScOG4-Eupvz3etgykJt=Q@mail.gmail.com>
From: Mikhail Gavrilov <mikhail.v.gavrilov@gmail.com>
Date: Tue, 22 Nov 2022 16:35:00 +0500
Message-ID: <CABXGCsNvLzTMaYqcTM6Wn+uC__H3S94eiHTDLVqAeQByw3fqPg@mail.gmail.com>
Subject: Re: [regression][6.0] After commit
 b261509952bc19d1012cf732f853659be6ebc61e
 I see WARNING message at drivers/gpu/drm/drm_modeset_lock.c:276
 drm_modeset_drop_locks+0x63/0x70
To: amd-gfx list <amd-gfx@lists.freedesktop.org>, 
 Linux List Kernel Mailing <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, 
 Harry Wentland <hwentlan@amd.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Oct 13, 2022 at 6:36 PM Mikhail Gavrilov
<mikhail.v.gavrilov@gmail.com> wrote:
>
> Hi!
> I bisected an issue of the 6.0 kernel which started happening after
> 6.0-rc7 on all my machines.
>
> Backtrace of this issue looks like as:
>
> [ 2807.339439] ------------[ cut here ]------------
> [ 2807.339445] WARNING: CPU: 11 PID: 2061 at
> drivers/gpu/drm/drm_modeset_lock.c:276
> drm_modeset_drop_locks+0x63/0x70
>
> bisect points to this commit: b261509952bc19d1012cf732f853659be6ebc61e.
>
> After reverting this commit the WARNING messages described here disappeared.
>

Hi Harry, Christian says that you can help with it.

Thanks.

-- 
Best Regards,
Mike Gavrilov.
