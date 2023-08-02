Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D8EBE76D698
	for <lists+dri-devel@lfdr.de>; Wed,  2 Aug 2023 20:12:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A63CD10E0ED;
	Wed,  2 Aug 2023 18:12:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-x1134.google.com (mail-yw1-x1134.google.com
 [IPv6:2607:f8b0:4864:20::1134])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CB2F010E0ED
 for <dri-devel@lists.freedesktop.org>; Wed,  2 Aug 2023 18:12:12 +0000 (UTC)
Received: by mail-yw1-x1134.google.com with SMTP id
 00721157ae682-583ae4818c8so203287b3.3
 for <dri-devel@lists.freedesktop.org>; Wed, 02 Aug 2023 11:12:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1690999932; x=1691604732;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=dqrDij2SO6O+kcrLN8FbJ03HVYrEeGEEuoAOFklLWnY=;
 b=t4sNe5zqV1iDlQd58nat+2WCHtvp0oKrP7DCJ/O+KQXZRdUDFAX0GOIkyWs4mkbO1d
 I8A8Qv+4dQqCTNl2dG1LLYM8yxxmD4G77ZQnJOJyp88rjDnTbroxprVftK3VXjMxRdsi
 3m4kh1Fy5+kji5UlLgVIy8o2rzd8MTJc39xHh+yAGf+w4nkTH7MNPg1Duq/Wg7VpiVZX
 SOA0SXsMHJxbBpWB1Tq2v3OUBgVOO/Gira9eRAnUKfH4Y4l8iqYIRIXR/rqSXe2ULSNp
 qasR9i/jjMm5NpQdpa+C28sGjsMtMbT1Ho0YAVGMSaKs0MdjoJjLosRGeRtB3cJU2lyj
 x9XA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690999932; x=1691604732;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=dqrDij2SO6O+kcrLN8FbJ03HVYrEeGEEuoAOFklLWnY=;
 b=YM1JT90/3MV+CFD0zCwANNw2Hq+oc9ERuvVTIwbUQfBXcW8gH2YN4+H7r5SVgyeGgZ
 al+THAc84/Xd1EAcBSdbsRKCRcNf7WHDopgcGKiUUD44tj68UhNncTexqTfWuxrvUp07
 5gBdZnYx9CZXyCtGQ7xwqhsFf7lpQTfL+ZygiQUz/KrUpGMt5xEUoJj+yeO4o6UDU9Cv
 tTgUvMsQlohnqbUdLpYt25Whopw9GwyOAdMxaRiNt8oOYc3FDD5x40elTHv4UUgfnV1G
 sjGQoNvNbD7tBPzYNmhjH0Rv+3Ac63RXqiYr02F3lInhDKkTkvfPtOBt4SaxOas64PHQ
 z3jA==
X-Gm-Message-State: ABy/qLa2idf+5rtdL3haHFZEUTs9xFoYCj/Ii6xs+MRzAinA4CtWqlBZ
 ifa2K7UbqZ/y/FEmJVHpPYzeLaxYl7CBBCMumFQQpQ==
X-Google-Smtp-Source: APBJJlFdnh9mEDcXTT3BwxduNQuaOn5XSODZKW62gjVBtwTIDuk/MZAnaqmS4xfMWr1lAbyB3pzS3PUVl2O4i3q3K3s=
X-Received: by 2002:a25:aa45:0:b0:d0b:f845:c831 with SMTP id
 s63-20020a25aa45000000b00d0bf845c831mr16060588ybi.13.1690999931880; Wed, 02
 Aug 2023 11:12:11 -0700 (PDT)
MIME-Version: 1.0
References: <20230802-revert-do-not-generate-hfp-hbp-hsa-eot-packet-v1-1-f8a20084e15a@linaro.org>
 <6cd079a4-2f5b-0169-cbaf-b59a72f1b32b@denx.de>
 <084ca94e-d694-878e-0646-f4c89043cd28@denx.de>
 <c2644543-2e81-3351-ee1e-76f5f32c4ac5@linaro.org>
 <92992f9c-fae0-f1b3-16e7-09ad3e711561@denx.de>
In-Reply-To: <92992f9c-fae0-f1b3-16e7-09ad3e711561@denx.de>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Wed, 2 Aug 2023 21:12:00 +0300
Message-ID: <CAA8EJpq1KhxPTaQY_Bra0xwC7V6ftr+cAH0CdHgzkU93YksaPA@mail.gmail.com>
Subject: Re: [PATCH] Revert "drm/bridge: lt9611: Do not generate HFP/HBP/HSA
 and EOT packet"
To: Marek Vasut <marex@denx.de>
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
Cc: Amit Pundir <amit.pundir@linaro.org>, neil.armstrong@linaro.org,
 Robert Foss <rfoss@kernel.org>, Jonas Karlman <jonas@kwiboo.se>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Jagan Teki <jagan@amarulasolutions.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 2 Aug 2023 at 20:34, Marek Vasut <marex@denx.de> wrote:
>
> On 8/2/23 14:37, Neil Armstrong wrote:
> > On 02/08/2023 14:28, Marek Vasut wrote:
> >> On 8/2/23 14:07, Marek Vasut wrote:
> >>> On 8/2/23 10:52, Neil Armstrong wrote:
> >>>> This reverts commit [1] to fix display regression on the Dragonboard
> >>>> 845c
> >>>> (SDM845) devboard.
> >>>>
> >>>> There's a mismatch on the real action of the following flags:
> >>>> - MIPI_DSI_MODE_VIDEO_NO_HSA
> >>>> - MIPI_DSI_MODE_VIDEO_NO_HFP
> >>>> - MIPI_DSI_MODE_VIDEO_NO_HBP
> >>>> which leads to a non-working display on qcom platforms.
> >>>>
> >>>> [1] 8ddce13ae696 ("drm/bridge: lt9611: Do not generate HFP/HBP/HSA
> >>>> and EOT packet")
> >>>>
> >>>> Cc: Marek Vasut <marex@denx.de>
> >>>> Cc: Robert Foss <rfoss@kernel.org>
> >>>> Cc: Jagan Teki <jagan@amarulasolutions.com>
> >>>> Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> >>>> Cc: Abhinav Kumar <quic_abhinavk@quicinc.com>
> >>>> Fixes: 8ddce13ae69 ("drm/bridge: lt9611: Do not generate HFP/HBP/HSA
> >>>> and EOT packet")
> >>>> Reported-by: Amit Pundir <amit.pundir@linaro.org>
> >>>> Link:
> >>>> https://lore.kernel.org/r/CAMi1Hd0TD=2z_=bcDrht3H_wiLvAFcv8Z-U_r_KUOoeMc6UMjw@mail.gmail.com/
> >>>> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> >>>
> >>> This breaks LT9611 operation on i.MX8M Mini/Nano/Plus, so, NAK.
> >>>
> >>> I am currently using this LT9611 with Linux 6.1.y
> >>
> >> Correction, 6.1.y only with the DSIM patches backported.
> >
> > Well you'll need to keep [1] backported on your downstream branch,
> > this revert won't propagate to v6.1 stable anyway.
>
> I will still have a problem with those MX8M boards during my development
> on linux-next, so that isn't helping.
>
> >>> in production and this is not acceptable. I also believe the correct
> >>> fix is on the MSM side, not on the LT9611 driver side, since MSM
> >>> incorrectly implements these flags.
> >>
> >
> > Since [1] breaks Qcom boards on v6.5, and [1] was added for v6.5 to make
> > the bridge work
> > on i.MX8M Mini/Nano/Plus, it's not acceptable either to keep it for the
> > v6.5 release.
>
> So, we need to find a solution which works for both, I proposed one already.

We proposed another one.

-- 
With best wishes
Dmitry
