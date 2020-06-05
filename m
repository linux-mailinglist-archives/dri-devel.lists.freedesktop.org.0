Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2357F1EFA30
	for <lists+dri-devel@lfdr.de>; Fri,  5 Jun 2020 16:14:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A294F6E909;
	Fri,  5 Jun 2020 14:14:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vs1-xe44.google.com (mail-vs1-xe44.google.com
 [IPv6:2607:f8b0:4864:20::e44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 32ECB6E906;
 Fri,  5 Jun 2020 14:14:48 +0000 (UTC)
Received: by mail-vs1-xe44.google.com with SMTP id q2so5688253vsr.1;
 Fri, 05 Jun 2020 07:14:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=92tfzhWVlr2aeqK6HzMd7FHEFDVr/SwIXq1vTN+sBsE=;
 b=slC13LUI63Z1B/lBFeHzqxfKXgHGu+NWsOaWx/VY3tEIMAz36JD2glQbgAOqnCdXbr
 vcJoMUqM1fMC4H4ja7kjAkGBV8O28unPretRpywWtW9KDU3RkUc15rSc7Onpivvqzdfw
 SVboV6cjc7XBfCVbQKKB8foHRY2gSgkTSfYs68RQmE69KBrm6rbOBrM+p03DAe3omKG2
 GsAjLEuDzhg8NN7ew4JTjebwu69A/Y8G5Zwd3lpuczD/gi8N+9ovP4AUZoCqoQIwjsc0
 CpGc3tKy8ZoDo3NHDt4K5McRKhuNv1DkmxfHtPQM45sWoMsaF3nBj3QOf6ex3gX2zoAo
 F2dQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=92tfzhWVlr2aeqK6HzMd7FHEFDVr/SwIXq1vTN+sBsE=;
 b=Uqx7kkX45ZsR0iHJIPGw3LPodlmVknhtAPhOJccTGIYWgfb0JPg0uDe/ElGZLlYgfJ
 N8a0+uy4B8mP1BJ7MkMSZNN2/3UphCnK9Wh6a/9DeCqcnjxKhtikUIh7mGmTHgAE8C0/
 ut+60bM/Oiv7XW2H792r89wT4pYALA69RpQHJztrXYJCaEyG+A/RyBo8KDf1jOG4TmGA
 WrE4xBYQzdim76ZFNLPk5wxfOkPq0eDM+IdybcDAgkQNP5nVhMDRN4DQcpL+aKz96+gg
 j2xUoQHao1/kJScnWBnLz6bfM9xMVE1Z2vIRDJO2CNbzbm+7yvCW3VgalkMn8z78X/zC
 KBxQ==
X-Gm-Message-State: AOAM532KubHrrCb6mSVthu/biRzE5o+KBhAJK3Zk33MSVEhzRV8C/WUK
 /xUVdJzwB1noRLtyoEm3aKR3C1Z9vIKf1g9lJQg=
X-Google-Smtp-Source: ABdhPJxwwCSalJFjI5Abuw6mc/isptPZeXUnUU8oFM57642z1EvQWUDOIZOqC/bjcW+INW9fkNsyYq792j8ZcgxWh/k=
X-Received: by 2002:a67:b149:: with SMTP id z9mr6882548vsl.85.1591366487388;
 Fri, 05 Jun 2020 07:14:47 -0700 (PDT)
MIME-Version: 1.0
References: <1591009402-681-1-git-send-email-mkrishn@codeaurora.org>
 <CACvgo50eb5_jp_6B5tkV9cX_X2_y2Xnavu+wvUUhHN5FsV9hiw@mail.gmail.com>
 <cd61dd742e73b89794fc1b812d9fdcd9@codeaurora.org>
 <CACvgo50b+m2+onak=AZfgihkBXEP9POjMR52087v==-puLdkQQ@mail.gmail.com>
 <8742ac6fbd498fdc22dcd469c3a2d52a@codeaurora.org>
In-Reply-To: <8742ac6fbd498fdc22dcd469c3a2d52a@codeaurora.org>
From: Emil Velikov <emil.l.velikov@gmail.com>
Date: Fri, 5 Jun 2020 15:11:24 +0100
Message-ID: <CACvgo52Rz+QzA4k7ttg6Gh124fZBAfaX0nrPpaMTECvr_8D2zw@mail.gmail.com>
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

On Tue, 2 Jun 2020 at 17:10, Sai Prakash Ranjan
<saiprakash.ranjan@codeaurora.org> wrote:
>
> Hi Emil,
>
> On 2020-06-02 21:09, Emil Velikov wrote:
> > On Tue, 2 Jun 2020 at 15:49, Sai Prakash Ranjan
> > <saiprakash.ranjan@codeaurora.org> wrote:
> >>
> >> Hi Emil,
> >>
> >> On 2020-06-02 19:43, Emil Velikov wrote:
> >> > Hi Krishna,
> >> >
> >> > On Tue, 2 Jun 2020 at 08:17, Krishna Manikandan
> >> > <mkrishn@codeaurora.org> wrote:
> >> >>
> >> >> Define shutdown callback for display drm driver,
> >> >> so as to disable all the CRTCS when shutdown
> >> >> notification is received by the driver.
> >> >>
> >> >> This change will turn off the timing engine so
> >> >> that no display transactions are requested
> >> >> while mmu translations are getting disabled
> >> >> during reboot sequence.
> >> >>
> >> >> Signed-off-by: Krishna Manikandan <mkrishn@codeaurora.org>
> >> >>
> >> > AFAICT atomics is setup in msm_drm_ops::bind and shutdown in
> >> > msm_drm_ops::unbind.
> >> >
> >> > Are you saying that unbind never triggers? If so, then we should
> >> > really fix that instead, since this patch seems more like a
> >> > workaround.
> >> >
> >>
> >> Which path do you suppose that the unbind should be called from,
> >> remove
> >> callback? Here we are talking about the drivers which are builtin,
> >> where
> >> remove callbacks are not called from the driver core during
> >> reboot/shutdown,
> >> instead shutdown callbacks are called which needs to be defined in
> >> order
> >> to
> >> trigger unbind. So AFAICS there is nothing to be fixed.
> >>
> > Interesting - in drm effectively only drm panels implement .shutdown.
> > So my naive assumption was that .remove was used implicitly by core,
> > as part of the shutdown process. Yet that's not the case, so it seems
> > that many drivers could use some fixes.
> >
> > Then again, that's an existing problem which is irrelevant for msm.
> > -Emil
>
> To give more context, we are actually targeting the clients/consumers
> of SMMU/IOMMU here because we have to make sure that before the supplier
> (SMMU) shuts down, its consumers/clients need to be shutdown properly.
> Now the ordering of this is taken care in the SMMU driver via
> device_link
> which makes sure that consumer shutdown callbacks are called first, but
> we
> need to define shutdown callbacks for all its consumers to make sure we
> actually shutdown the clients or else it would invite the crashes during
> reboot
> which in this case was seen for display.
>
Thank you very much for the extra details. I think other DRM drivers
will be safe as-is.

-Emil
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
