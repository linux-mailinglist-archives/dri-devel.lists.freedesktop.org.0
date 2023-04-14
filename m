Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CFDC46E2C90
	for <lists+dri-devel@lfdr.de>; Sat, 15 Apr 2023 00:52:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AB2E010EEBE;
	Fri, 14 Apr 2023 22:52:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay04.th.seeweb.it (relay04.th.seeweb.it
 [IPv6:2001:4b7a:2000:18::165])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 38B5B10EEBE
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Apr 2023 22:52:31 +0000 (UTC)
Received: from SoMainline.org (94-211-6-86.cable.dynamic.v4.ziggo.nl
 [94.211.6.86])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by m-r1.th.seeweb.it (Postfix) with ESMTPSA id AD261200B8;
 Sat, 15 Apr 2023 00:52:26 +0200 (CEST)
Date: Sat, 15 Apr 2023 00:52:25 +0200
From: Marijn Suijten <marijn.suijten@somainline.org>
To: Abhinav Kumar <quic_abhinavk@quicinc.com>
Subject: Re: [PATCH v2] drm/msm/dpu: always program dsc active bits
Message-ID: <m43254ainsnznnehtziigr3akpy7lnwkel424e2emr2tycpbek@yqam6dij63d5>
References: <1681401401-15099-1-git-send-email-quic_khsieh@quicinc.com>
 <tgfbdk6q3uool365jqddibnbgq66clsmsm6tldxpm5toqghxpq@m2ic3oonv2s5>
 <aac210da-dec1-aab8-3f48-c33d9e7687d6@quicinc.com>
 <3oaangxh7gmie3cdd6rmujm7dd3hagsrnwiq3bascdtamvfn3a@bn6ou5hbsgxv>
 <c09725ff-771c-35d1-adc9-4bb1b7c1c334@quicinc.com>
 <CAA8EJppKXSGcOcYEc6UKz9Eh8JizSpdDNe+cdvfmFbuBJ9zPKw@mail.gmail.com>
 <eb8ea024-1152-418c-a048-f86253867c9e@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <eb8ea024-1152-418c-a048-f86253867c9e@quicinc.com>
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
Cc: vkoul@kernel.org, quic_sbillaka@quicinc.com, andersson@kernel.org,
 freedreno@lists.freedesktop.org, dianders@chromium.org,
 dri-devel@lists.freedesktop.org, swboyd@chromium.org, agross@kernel.org,
 linux-arm-msm@vger.kernel.org, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Kuogee Hsieh <quic_khsieh@quicinc.com>, sean@poorly.run,
 linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2023-04-14 14:03:23, Abhinav Kumar wrote:
[..]
> >> Yes, ofcourse git send-email was used to send the patch, not any other
> >> mail client.
> >>
> >> Yes i am also aware that send-email converts rb to CC.
> >>
> >> But if you keep working on the local branch, then you would have to
> >> manually add the r-bs. If you use am of the prev version and develop on
> >> that, it will automatically add the r-bs.

I don't think git-am is smart enough to fetch additional replies from
lore and apply the reviewed-by (and other trailers).  This workflow
relies on downloading the mbox from a service that extracts and
accumulates the trailers such as patchwork, see for example:

	https://patchwork.freedesktop.org/api/1.0/series/116340/revisions/1/mbox/

Note that it also picked up one sentence starting with Fixes:

	Fixes: tag below seems extraneous.

On the other hand b4 (shaz)am is itself capable of downloading the whole
mail thread and appending all trailers, just like patchwork is doing
above, in one automated `b4 shazam <lore link>` command.

And to solve the problem of trailers arriving in your inbox after
working on the next revision in a local branch - or without ever even
redownloading the series from lore/patchwork¸ b4 has a command to
download and apply them to commits in your local branch:

	b4 trailers -uF <lore link>

Try it out, b4 is amazing :)

[..]
> 2) I synced with kuogee. his git version seems to be quite old which is 
> not adding the folks from r-b to cc. So there was nothing wrong with 
> invocation, just versioning.

You are right.  The X-Mailer header of Kuogee's patch indicates git
2.7.4, while cc'ing of additional -by trailers (such as r-b's) was only
introduced in 2.20.0:

https://github.com/git/git/commit/ef0cc1df90f6b6c2987ab2db8e0ccf2cfc421edf

Fwiw 2.7.4 is from March 2016.

- Marijn
