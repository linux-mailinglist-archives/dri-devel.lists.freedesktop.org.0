Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 05D631EBF3C
	for <lists+dri-devel@lfdr.de>; Tue,  2 Jun 2020 17:43:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1D63C6E421;
	Tue,  2 Jun 2020 15:43:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vs1-xe41.google.com (mail-vs1-xe41.google.com
 [IPv6:2607:f8b0:4864:20::e41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5A8406E421;
 Tue,  2 Jun 2020 15:43:17 +0000 (UTC)
Received: by mail-vs1-xe41.google.com with SMTP id c1so2270641vsc.11;
 Tue, 02 Jun 2020 08:43:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=DYngnraAO9v6DgzTxyaGpMxNWkQ9LAzLsVZUZnOMctU=;
 b=Rih8KGyBH40LBX8n/poZKv9x/eVmj1SMH3+mvtzB7ahZBXpM5zgOl/2ZZZrpYuDWWp
 VrJEejMmZIzUOLmIWwoivs3brFbI2xHxVTdrDsbBlbr5G7rSN5pv/CU5K0PJS8Kzh8uk
 rry00PFj7iBcTa7YWVz4K5PqexXAPP6EDn7ekuYRbDjC1O8XAq0CD66pG29XOMU+Q1bM
 Z02BfsJWl5GocDb3k8jII1nKOTf+9vdgXXPLSeXNPgHysUxG0R6LQwywuPpauFCeB9sc
 QZ4soiAEvByi7k97gMxFnAM6Vnde9bkAzowzbsaTr2NORJ3UOZteslq/IzFns5zsIZY0
 BCWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=DYngnraAO9v6DgzTxyaGpMxNWkQ9LAzLsVZUZnOMctU=;
 b=jkxyJhOSuicM5IClEcDuhrVbKoQv11gc0Q4QZNMXJopakHiXNHQGzNfgaPoh2NBF9T
 qlUFBsXiPIaEHUQCqXaiP8+2U4JK2Kgik5Va4OYtu/Pmc3MnxvpijF5McJisF8CRrqfJ
 DkazeT5yC8RlXB9FSa9BCJ3tgsL+EJcKg7qlR8ayhenwSgYyF4MP6Oh0/rDpZ83sEErq
 7WhVutzepiiEm3Epzm8n3HkXl6BFxjSIsEsf7uK9aEdrg6mhVUjbgNYaZIB/p8Fc2Yg+
 3aAiKMTzVm+A2Wx1pGa8npettSHPOg6kH+wBZ8rUTNIIIX0bpVCg5yfRFo+YSlS25/Or
 x/oA==
X-Gm-Message-State: AOAM5300TKg5osDRx2SNbnS90vUjem8UFssv4pc+cUDJ7wjL8jnfuIhP
 ou3CfpFkiV2kQb/Cafk/c1XMtpplEioYgMbTFFw=
X-Google-Smtp-Source: ABdhPJzkda1ykteQq6BwLnY+Dxu+T8WkWOO2Mx3/6MCrDeWYhdFyjxNXaMlq4pyJjgaKfSkcyDdktLKjZsXYe1+o4Pg=
X-Received: by 2002:a67:b149:: with SMTP id z9mr17431445vsl.85.1591112596522; 
 Tue, 02 Jun 2020 08:43:16 -0700 (PDT)
MIME-Version: 1.0
References: <1591009402-681-1-git-send-email-mkrishn@codeaurora.org>
 <CACvgo50eb5_jp_6B5tkV9cX_X2_y2Xnavu+wvUUhHN5FsV9hiw@mail.gmail.com>
 <cd61dd742e73b89794fc1b812d9fdcd9@codeaurora.org>
In-Reply-To: <cd61dd742e73b89794fc1b812d9fdcd9@codeaurora.org>
From: Emil Velikov <emil.l.velikov@gmail.com>
Date: Tue, 2 Jun 2020 16:39:58 +0100
Message-ID: <CACvgo50b+m2+onak=AZfgihkBXEP9POjMR52087v==-puLdkQQ@mail.gmail.com>
Subject: Re: [v2] drm/msm: add shutdown support for display platform_driver
To: Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
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
Cc: Krishna Manikandan <mkrishn@codeaurora.org>,
 devicetree-owner@vger.kernel.org, devicetree <devicetree@vger.kernel.org>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 "Linux-Kernel@Vger. Kernel. Org" <linux-kernel@vger.kernel.org>,
 ML dri-devel <dri-devel@lists.freedesktop.org>, mka@chromium.org,
 Sean Paul <seanpaul@chromium.org>, kalyan_t@codeaurora.org,
 "Kristian H . Kristensen" <hoegsberg@chromium.org>,
 freedreno@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 2 Jun 2020 at 15:49, Sai Prakash Ranjan
<saiprakash.ranjan@codeaurora.org> wrote:
>
> Hi Emil,
>
> On 2020-06-02 19:43, Emil Velikov wrote:
> > Hi Krishna,
> >
> > On Tue, 2 Jun 2020 at 08:17, Krishna Manikandan
> > <mkrishn@codeaurora.org> wrote:
> >>
> >> Define shutdown callback for display drm driver,
> >> so as to disable all the CRTCS when shutdown
> >> notification is received by the driver.
> >>
> >> This change will turn off the timing engine so
> >> that no display transactions are requested
> >> while mmu translations are getting disabled
> >> during reboot sequence.
> >>
> >> Signed-off-by: Krishna Manikandan <mkrishn@codeaurora.org>
> >>
> > AFAICT atomics is setup in msm_drm_ops::bind and shutdown in
> > msm_drm_ops::unbind.
> >
> > Are you saying that unbind never triggers? If so, then we should
> > really fix that instead, since this patch seems more like a
> > workaround.
> >
>
> Which path do you suppose that the unbind should be called from, remove
> callback? Here we are talking about the drivers which are builtin, where
> remove callbacks are not called from the driver core during
> reboot/shutdown,
> instead shutdown callbacks are called which needs to be defined in order
> to
> trigger unbind. So AFAICS there is nothing to be fixed.
>
Interesting - in drm effectively only drm panels implement .shutdown.
So my naive assumption was that .remove was used implicitly by core,
as part of the shutdown process. Yet that's not the case, so it seems
that many drivers could use some fixes.

Then again, that's an existing problem which is irrelevant for msm.
-Emil
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
