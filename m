Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 629622FBDC7
	for <lists+dri-devel@lfdr.de>; Tue, 19 Jan 2021 18:36:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E2D876E877;
	Tue, 19 Jan 2021 17:36:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com
 [IPv6:2a00:1450:4864:20::133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 79E8A6E877;
 Tue, 19 Jan 2021 17:36:05 +0000 (UTC)
Received: by mail-lf1-x133.google.com with SMTP id q12so3200004lfo.12;
 Tue, 19 Jan 2021 09:36:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=cpa7qj8j8t1b99X3gJalSPyPYHAME5E11qdbpk6J29U=;
 b=biHxfiVfBA5cdRJYZcZP3rrYKTcEEoXy16XiI+WZfZ9COOTsBfPAG+rfpglr0U0dxj
 gkujjPMwaErsATynxIwxcAdaAd8mDJvFqZKdLiFR2wM5RsCS5fr4avOZ1zsbAuZ9DKre
 z6OAHlQg7duBvlEWLSJcXG7Tvvg0L9lUJ+8DCI7x94saQSo+gVBvySgg+3gN0LPn10kn
 ovK+oSpxdpq1Msl6nuMcxDBCT+G/qywF/YS9TCamstoUdw8XXAsR48OEBEu8VdX/8yrT
 xcfRgr78bbgLMnULCPLNujE5HxDEUcu+L0P7YdkCCk+DunaalfELt5RGBrOmtGAwMkVg
 56LQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=cpa7qj8j8t1b99X3gJalSPyPYHAME5E11qdbpk6J29U=;
 b=r6zJzGnWPoMmVehkaljv7UfxdjEFfn5oUlwp5ADRb7YtfchXgEPO5HiTnCp/rgDrEy
 gzBgfjBHtoo6f9ZWtU4EWsoeqc5DOa82QsviXboxgaxFY8EjYTv7U+l7HMAarzBcFkhV
 IDApGb6OzwKb43c0wISEvWbtsq5fPia8X4euwPL7TH7SuGWK9gUOOiaATsw393IkOXMv
 qWfJk1+1Q2iYvKp775chmq9lOrKMSOuYEaJcayjzJ3nbEPiMNcZIg7szBldCaWi9U1rn
 9CQU5IjELQXN8wXENR+K4kw4cgYvqgQ4WyhNTEJTr2AV1aQyv+7Dd2gUmwS6qy7odsGN
 1shg==
X-Gm-Message-State: AOAM531Bfkn5BgvIdLo/Je52EJuMO3fGGjZ8g93Pkk8eGINtq2lBYIRM
 d0aLDGSGU9ICcMqLPq4QZrt6Ktvay1l0rY8SQqY=
X-Google-Smtp-Source: ABdhPJxtQVNwVVqHbUTeniHS7Dy+Dv09fBZWdA3vll3qvuBDpEa3znmGifppvKS+fNoAadzrqTchY0q+IXO21bs5G84=
X-Received: by 2002:ac2:57d2:: with SMTP id k18mr2222253lfo.500.1611077763936; 
 Tue, 19 Jan 2021 09:36:03 -0800 (PST)
MIME-Version: 1.0
References: <CAOMZO5D_dDTOgDZNy-NkQSPTiKhmrNKjEiqFWGX4rbZr2grDxQ@mail.gmail.com>
 <CAOMZO5DbgM6kPbNsu2XJcZsRauwey9UttSomquY8L4eyDLtZgw@mail.gmail.com>
 <CAOMZO5CP=xW8kFZpQxb35odUBs_9+-EDawENHeCLmVoMEYOnMA@mail.gmail.com>
 <CAKMK7uFmY7u84QOSrWy_qRDQQAzEP-97ALmP2e9N+9mXiwWA8Q@mail.gmail.com>
 <CAF6AEGuEeaSMyjVQXV-2WAJ6FamrqYc=TF8_EFQo27r+X8_gdg@mail.gmail.com>
 <CAF6AEGvxdLCLDfhnY9M4-R6U3CvH6eqJBUs=xB6ycDQf2F=JOw@mail.gmail.com>
In-Reply-To: <CAF6AEGvxdLCLDfhnY9M4-R6U3CvH6eqJBUs=xB6ycDQf2F=JOw@mail.gmail.com>
From: Fabio Estevam <festevam@gmail.com>
Date: Tue, 19 Jan 2021 14:35:51 -0300
Message-ID: <CAOMZO5CWQevgbwJPX8zmhZboX1id3c2ScYG-EsjimMUTi3ccxg@mail.gmail.com>
Subject: Re: Reboot crash at msm_atomic_commit_tail
To: Rob Clark <robdclark@gmail.com>
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
 Sascha Hauer <kernel@pengutronix.de>, Jonathan Marek <jonathan@marek.ca>,
 Sean Paul <sean@poorly.run>,
 DRI mailing list <dri-devel@lists.freedesktop.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <freedreno@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Rob,

On Tue, Jan 19, 2021 at 1:40 PM Rob Clark <robdclark@gmail.com> wrote:

> > I suppose we should do the drm_atomic_helper_shutdown() conditionally?

This suggestion works, thanks. I will submit a patch shortly.

Thanks
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
