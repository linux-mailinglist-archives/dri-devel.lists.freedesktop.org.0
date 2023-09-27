Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8546C7B0EBC
	for <lists+dri-devel@lfdr.de>; Thu, 28 Sep 2023 00:02:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1845C10E5C9;
	Wed, 27 Sep 2023 22:02:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com
 [IPv6:2a00:1450:4864:20::132])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 84D9B10E5C8
 for <dri-devel@lists.freedesktop.org>; Wed, 27 Sep 2023 22:01:58 +0000 (UTC)
Received: by mail-lf1-x132.google.com with SMTP id
 2adb3069b0e04-503065c4b25so19404557e87.1
 for <dri-devel@lists.freedesktop.org>; Wed, 27 Sep 2023 15:01:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1695852117; x=1696456917;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:user-agent
 :from:references:in-reply-to:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=oSjejR5JF3wP/eMQJYeeQ3/RdpG//Fx9fX4rCgiiwsA=;
 b=EPD7jxUSEVdhAn35+TS9eHLoZESn2x4RDjmMKjzLBVNztQXntIc9EXx2924wvQAEbg
 Z6wJwRD/mWz5yAQAdqvsMTSOs/BGvnY6Gg/Vvoi7ZqWLCU5t9R8KfDLxWOM69TCH77ac
 7h+WNwS4+/EIGHLAsanoka9nATc+8P7gf5QvE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1695852117; x=1696456917;
 h=content-transfer-encoding:cc:to:subject:message-id:date:user-agent
 :from:references:in-reply-to:mime-version:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=oSjejR5JF3wP/eMQJYeeQ3/RdpG//Fx9fX4rCgiiwsA=;
 b=Wv9HXP7ObRlqpn3gyr9nhRxdPAoisaoEe/0eKWtaol25JinpG2Rkdb7sdWg2uUIVSV
 6pkDn71aW1mG3fEmM5syrwRJvFxGjYUb2j6Aoyx9xk5zVccZ62p6Bj1yUOjiwqhUmunK
 LDVtcY/zXQRCKBeyY6wARbmsst2Woh/1hvT+3VwVdNK2mlkrxZUM4vOdnchIFiDON9F8
 U3JdO84lQvLLyVKbz28VPRQl7deDLzZ2mBOleWycwrz7w6PtM2G/cWB5o5aICWcQNTMS
 ynzaihB5rrydtYPWkswELORcSYmlkRIKZ1rdjzNmm4XH/wqXeyUwax6rhWVIGKMsZjX/
 +kaQ==
X-Gm-Message-State: AOJu0Yy7CYIj29G1iZuQ0brtv+2VAgnnVBvbrco6/esL7BCfekujwoBf
 P12xD4awzqgi6uwpptndLAxi9o4Cy1z3jrJEDmBzcw==
X-Google-Smtp-Source: AGHT+IEgoSwtXUeWp+41zOUCP+Gyi7NJVp2syU0i8Hpe8Zg2aPjEvc03dD/eiB9Gw5SnGn3VLWFNtVmb2S4r5fJtUcI=
X-Received: by 2002:ac2:410e:0:b0:502:f740:220 with SMTP id
 b14-20020ac2410e000000b00502f7400220mr2552704lfi.58.1695852116130; Wed, 27
 Sep 2023 15:01:56 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 27 Sep 2023 17:01:55 -0500
MIME-Version: 1.0
In-Reply-To: <1d9bf80d-0267-937b-4dd9-c57db7a89cb4@quicinc.com>
References: <1694813901-26952-1-git-send-email-quic_khsieh@quicinc.com>
 <1694813901-26952-7-git-send-email-quic_khsieh@quicinc.com>
 <CAA8EJpqPXoFX4LXyXYgfh07Vpxg-KgD8VBR6x5bXf4GOJmbOtw@mail.gmail.com>
 <2f98d5f1-57c1-d9fe-cb1c-b975db057287@quicinc.com>
 <CAA8EJpr2wRq6Txi7YAQpJKa_9UGqH_nmHzvVOaAPkwOrtDg4Tw@mail.gmail.com>
 <CAE-0n53dqHONzMTd_ZC-fKWTzDVq6Wqwo4OFZMUcghZ5SD5RhA@mail.gmail.com>
 <65566a68-3510-2e5f-7d57-e4dba08c008c@quicinc.com>
 <1d9bf80d-0267-937b-4dd9-c57db7a89cb4@quicinc.com>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date: Wed, 27 Sep 2023 17:01:55 -0500
Message-ID: <CAE-0n51Hrs66oG4NF5rDETkVO-ocG_6_=Aqc5cE-qPDViSgKyA@mail.gmail.com>
Subject: Re: [PATCH v3 6/7] drm/msm/dp: add pm_runtime_force_suspend()/resume()
To: Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Kuogee Hsieh <quic_khsieh@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
Cc: freedreno@lists.freedesktop.org, quic_sbillaka@quicinc.com,
 linux-kernel@vger.kernel.org, andersson@kernel.org,
 dri-devel@lists.freedesktop.org, dianders@chromium.org, vkoul@kernel.org,
 agross@kernel.org, marijn.suijten@somainline.org, quic_jesszhan@quicinc.com,
 sean@poorly.run, linux-arm-msm@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Quoting Kuogee Hsieh (2023-09-25 09:07:18)
>
> On 9/22/2023 6:35 PM, Abhinav Kumar wrote:
> >
> > Doing link training when we get hpd instead of atomic_enable() is a
> > design choice we have been following for a while because for the case
> > when link training fails in atomic_enable() and setting the link
> > status property as you mentioned, the compositor needs to be able to
> > handle that and also needs to try with a different resolution or take
> > some other corrective action. We have seen many compositors not able
> > to handle this complexity. So the design sends the hotplug to usermode
> > only after link training succeeds.
> >
> > I do not think we should change this design unless prototyped with an
> > existing compositor such as chrome or android at this point.
> >
> > Thanks
> >
> > Abhinav
>
>
> We did perform link training at atomic_enable() at eDP case since we can
> assume link training will always success without link rate or link lane
> being reduced.
>
> However for external DP case, link training can not be guarantee always
> success without link rate or lane being reduced as Abhinav mentioned.
>
> In addition,=C2=A0 CTS (compliance test) it required to complete link
> training within 10ms after hpd asserted.

Is it possible to change that timeout? I have to look around for the CTS
parameters because I'm pretty confused how it can work. What do we do if
DP wakes the system from suspend and asserts HPD? We need resume time to
be < 10ms?  That's not realistic.

>
> I am not sure do link training at atomic_enable() can meet this timing
> requirement.
>

At least in the DP spec itself it doesn't require the link to be trained
within 10ms of HPD being asserted. Instead it simply recommends that the
OS start configuring the display promptly after HPD is asserted, e.g.
within 100ms. There's some strict timing on IRQ_HPD, so the driver must
read DPCD registers within 100ms of IRQ_HPD rising edge; maybe that is
what CTS is checking for?

TL;DR: I don't see why CTS should stop us from link training in
atomic_enable(). It would be beneficial to do so to make eDP and DP the
same. It would also help to report a drm connector being connected
_before_ link training so that userspace knows the link itself is the
bad part of the equation (and not that the DP connector looks
disconnected to userspace when in fact it really is connected and the
monitor is asserting HPD, just the link training failed).
