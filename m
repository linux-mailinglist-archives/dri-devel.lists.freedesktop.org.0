Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B95A38B10B
	for <lists+dri-devel@lfdr.de>; Thu, 20 May 2021 16:07:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A414F6E332;
	Thu, 20 May 2021 14:07:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x729.google.com (mail-qk1-x729.google.com
 [IPv6:2607:f8b0:4864:20::729])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A54FA6E332;
 Thu, 20 May 2021 14:07:44 +0000 (UTC)
Received: by mail-qk1-x729.google.com with SMTP id v8so16270656qkv.1;
 Thu, 20 May 2021 07:07:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ytwyc2rd26HegdNA2IyeEVfQs5d/jjcm5L5OfWQMEn8=;
 b=T8mYpGc7SpzWbitRRqvnct/KPb7fwyDo84beqMY2effwHKpU2cjarPNyiA02jO5VoA
 139l0kQAHbeccNh3SOk+rgPDpMorLAyEn4ObCZelupUnP/rx/fYxeIGBzFTq9RHhULdS
 z22j+LJMF43YkDGXDa7gQ3aKZjbR5jSU/qHy6g+HrsFp0oD1ikHg5RFvX/1PSpKekopT
 LZEV22ndA9u8oCChTH1x7kwUizgvvdQvXQBTdftOsUn3wmjbv7onWA5SjI+2NvSyUUFn
 BH3qfs444NuuZuZsISXvY4qQ0kkkfnlHY+8aYefPcu7obkitnoS5sE3sCc8ILe1kNwSH
 ORnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ytwyc2rd26HegdNA2IyeEVfQs5d/jjcm5L5OfWQMEn8=;
 b=hMlJDVSM9W+p6kC945SWaD8wD1K78BfvY+EVYOQMCBUviiPWAupxnHBQrhR76qHccK
 3lTneSIecTTVllcPSj1twNayK1VazlHXA2mHTzc5SfPFnpnTy4qU30QfRj+I1g/I70pb
 m3hnYKF2LA0f53rmF3WcN06DtiBk0fTK0R4bwATX9Blc1//kUKerB2Uyk56IPgqQI+Ee
 JDPMej9JpX/cTsVJlJwzwrgME0447mVgbTN1u8td5u57Tb+BqMXHcIZAv6xLkOzELFIq
 F0e2JsYGeKRLhSxpmiTqqZAA6QZAh9Z7r0QX4/f+Jq3T/yskkK+93WOsmtVLdbbZug2W
 YCsg==
X-Gm-Message-State: AOAM531PgZ0wyZ0PhonlasTWIAoOrl0Z/jgQApXChSnRLUWbXsDE48Q5
 /vTdEcBcP+AOgQuSww9r2N1GWErjyt5sfZ8OuqE=
X-Google-Smtp-Source: ABdhPJyGvUjwwyny1TE05MUhwqeqp/dZ1srNSNit/9c9Y/6m22v8UX9ydbry0qV9MnfmZL6mkbhqxRCfmHfDONgfHbo=
X-Received: by 2002:a05:620a:14b9:: with SMTP id
 x25mr2960889qkj.460.1621519663865; 
 Thu, 20 May 2021 07:07:43 -0700 (PDT)
MIME-Version: 1.0
References: <20210520080646.24132-1-samirweng1979@163.com>
In-Reply-To: <20210520080646.24132-1-samirweng1979@163.com>
From: Matthew Auld <matthew.william.auld@gmail.com>
Date: Thu, 20 May 2021 15:07:17 +0100
Message-ID: <CAM0jSHO1K_qrnPMAvoGst=_dRF7BjzSumLH8pVd-3k9Ejk_44w@mail.gmail.com>
Subject: Re: [PATCH] drm/i915/gt: fix typo issue
To: samirweng1979 <samirweng1979@163.com>
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
Cc: sudeep.holla@arm.com, wengjianfeng <wengjianfeng@yulong.com>,
 David Airlie <airlied@linux.ie>, Mika Kuoppala <mika.kuoppala@linux.intel.com>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 kernel list <linux-kernel@vger.kernel.org>,
 Chris Wilson <chris@chris-wilson.co.uk>,
 ML dri-devel <dri-devel@lists.freedesktop.org>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 20 May 2021 at 09:23, samirweng1979 <samirweng1979@163.com> wrote:
>
> From: wengjianfeng <wengjianfeng@yulong.com>
>
> change 'freqency' to 'frequency'.
>
> Signed-off-by: wengjianfeng <wengjianfeng@yulong.com>

Pushed to intel-gt-next. Thanks.
