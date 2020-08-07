Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 24BFD23E6D3
	for <lists+dri-devel@lfdr.de>; Fri,  7 Aug 2020 06:30:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 788FB8967A;
	Fri,  7 Aug 2020 04:30:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x543.google.com (mail-ed1-x543.google.com
 [IPv6:2a00:1450:4864:20::543])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6B5276E957;
 Fri,  7 Aug 2020 04:30:38 +0000 (UTC)
Received: by mail-ed1-x543.google.com with SMTP id l23so302171edv.11;
 Thu, 06 Aug 2020 21:30:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=odjxoTeUBlGk86nx1hPeB4GTRIrOC22DvPJlmYOp3Gs=;
 b=P9wKrz/Ig+kKDcy8t8SQB+zgrUvjDl2S3Z56th20NQBVxN1xyYCcSQukwzOxwBtWS9
 5MNjEqqe3bUhikTHuUjoZU4MEL40ouK5g4VkbGOIvY9eHKJ9X691KnPcMJNhaFRtCF+G
 sk3qUMTGPBlzktJSeJAuBB7lV0OpQR4W49BEWXvs8kmHuk9rrO8LPXLcWKjGxhfWfiQq
 p84s1JGRmlK0w3m48xhtfg3lABrxueRy9n7sB4UtnK0MM9iRLzrTtvhm9MnI8Q4Pf871
 DiaL8x0WToUon1du4uIVJ8yLlq7cuhEg0y85Aq0+Ajoh2Y8LEaJTRJeq+t/d8IkWttoU
 t2Lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=odjxoTeUBlGk86nx1hPeB4GTRIrOC22DvPJlmYOp3Gs=;
 b=n9EJQ1QNfcO8cPz7JzjK9ysPmUJizlB4ZUY6Qs7MC2Ts8WU36XuHrrUUp450OIQnHA
 3LV730L3eYwanYaYSEAln45+u6F9m3gV9hDbg7ja8Zl8PCveSJu/BxaWh2f61EsSiA5I
 rvLDAmrDpPBTknGkMn6xYS79RpWKVXmCztQ+kpgjwRrnIobcPEn4lhP8pvix3NCJ+TqW
 pXckW3T+VdsbcDaK09qUd8yc6Me8BQu4GnBb6zZ7/80Js58Gd8Bih0EA28WS5I9gy/Ss
 INk0XoqZosmE+Lu1p7cC1s4f8NcWm1nY502yQrsPPZJzmArePSYir2uYeYf8gjRQCqpm
 rr/g==
X-Gm-Message-State: AOAM533AtG6tQ40ainaq+V9y7viQ+y510lNV+yaIbtMdSm0IeToDtc30
 xxN/yDlRd/SPXRWSXa23esg1NoVNMBUeSinsDR/3GA==
X-Google-Smtp-Source: ABdhPJz6iMfyLIRBEDTSFdMuENld+gAtw5qJxB4rxaKnT3wJ4Qz1nos2ukpY1fP15uDJqMuARTpxe64zz/iGwMgLFcY=
X-Received: by 2002:a05:6402:2069:: with SMTP id
 bd9mr7001699edb.127.1596774637007; 
 Thu, 06 Aug 2020 21:30:37 -0700 (PDT)
MIME-Version: 1.0
References: <20200807011517.2814096-1-rodrigo.vivi@intel.com>
 <CAPM=9txAFXQoRcD-uw3nNUKDg+QrOgdafC6J401Da5ax=1US2w@mail.gmail.com>
In-Reply-To: <CAPM=9txAFXQoRcD-uw3nNUKDg+QrOgdafC6J401Da5ax=1US2w@mail.gmail.com>
From: Dave Airlie <airlied@gmail.com>
Date: Fri, 7 Aug 2020 14:30:25 +1000
Message-ID: <CAPM=9txoPFXo=+sRV1UanY9iBUkCcuTu62Hz4X0C1iEG=qZCuA@mail.gmail.com>
Subject: Re: [Nouveau] [PATCH] drm/nouveau: missing cases of rename
 ttm_mem_reg to ttm_resource.
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
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
Cc: nouveau <nouveau@lists.freedesktop.org>,
 dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, 7 Aug 2020 at 14:03, Dave Airlie <airlied@gmail.com> wrote:
>
> On Fri, 7 Aug 2020 at 11:13, Rodrigo Vivi <rodrigo.vivi@intel.com> wrote:
> >
> > From: Rodrigo Vivi <rodrigo.vivi@gmail.com>
> >
> > These are missed cases that I just identified with allyesconfig build.
> >
>
> Is this against drm-tip? it's a merge problem, that I thought I'd
> already addressed, but tip seems to have lost it.

I think I've fixed drm-tip rebuilds now.

Dave.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
