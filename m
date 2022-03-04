Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9237D4CDFEC
	for <lists+dri-devel@lfdr.de>; Fri,  4 Mar 2022 22:49:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 55D40113AA8;
	Fri,  4 Mar 2022 21:49:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com
 [IPv6:2a00:1450:4864:20::62c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ECD69113AA4
 for <dri-devel@lists.freedesktop.org>; Fri,  4 Mar 2022 21:49:44 +0000 (UTC)
Received: by mail-ej1-x62c.google.com with SMTP id yy13so11239473ejb.2
 for <dri-devel@lists.freedesktop.org>; Fri, 04 Mar 2022 13:49:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=gorolFJ2WIFQvAsoxOSrO8YEN0k5n1TryFpMGW1zZQQ=;
 b=LzsQ5rUYvvNub8x9l9kvDaWf7K77rlY+iRkn5dlD+82ZPl7ZCGrmcqBTtvNe+X0bPW
 MXRTMoQCl8ndHSQ6jy2WO/qD7mm7dVBag6oQqBnicr4/Dj55BzR195+oqLqUf8RbLZob
 PzkGqmSuP2Iou/Cr3Jb7zTgkEP2cvx8IU6iZs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=gorolFJ2WIFQvAsoxOSrO8YEN0k5n1TryFpMGW1zZQQ=;
 b=DkRUCYkyUt9gMjzXhvXhsmS1kxgZE1+k7IwYLMwoyOiX2/o6HCBIkhXlqf5cCiqGWD
 0j5FDYB2qdlHqs6fgh8gD133G0WLeGtx4jo71LLWqnXiAyX83N3GGE87UrpcJjW+/sxR
 m+gcbcoBZ5uVk+meUuqH2WS+kkHnPKFB0N50KQZUrPTVDO6pCe5kz/LmaQ05iSMyfAKY
 /qEWbd2UZ6SttrbPw/qiG0PkM4WMaLGoINrjEBeq2qwHQlL2V+4AjSgEImwjOAENzVrk
 S3QJQO3xt+WsWB5pryH7KsVUUkKaemE2QpRcawuJjfgYfa2wM5aXteEjWorGXEU0kgnE
 uqyg==
X-Gm-Message-State: AOAM53076S8tOX17XhhnExfsgHPUrx22AfjC5hdQSrTItsNnhAmqXM8Y
 6LeWUPxk9/OJ0UnSrrcOJLlZIfWsQSyZC/Fz
X-Google-Smtp-Source: ABdhPJwKe82oT3iuI3Egyy3tDUqRUQ0WLKWcu4bA+9emOaPqhLS5O7FwO8+JUB6yMaAfys7eIJBKWg==
X-Received: by 2002:a17:907:3ea1:b0:6da:633b:9143 with SMTP id
 hs33-20020a1709073ea100b006da633b9143mr662369ejc.10.1646430582331; 
 Fri, 04 Mar 2022 13:49:42 -0800 (PST)
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com.
 [209.85.128.46]) by smtp.gmail.com with ESMTPSA id
 f5-20020a17090624c500b006cee6661b6esm2185448ejb.10.2022.03.04.13.49.40
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 04 Mar 2022 13:49:40 -0800 (PST)
Received: by mail-wm1-f46.google.com with SMTP id 19so5497804wmy.3
 for <dri-devel@lists.freedesktop.org>; Fri, 04 Mar 2022 13:49:40 -0800 (PST)
X-Received: by 2002:a05:600c:1d08:b0:381:6eda:67d1 with SMTP id
 l8-20020a05600c1d0800b003816eda67d1mr9758221wms.88.1646430579829; Fri, 04 Mar
 2022 13:49:39 -0800 (PST)
MIME-Version: 1.0
References: <1646300401-9063-1-git-send-email-quic_vpolimer@quicinc.com>
 <1646300401-9063-5-git-send-email-quic_vpolimer@quicinc.com>
 <CAA8EJpqkK8q7g8q56rfiOO22ykxgycJTpSJKHuhcqGk05nsVzA@mail.gmail.com>
 <CAE-0n53jGQcn=NThrrW92NL-cry8yrFErdSYTHHEHWW48b3xbg@mail.gmail.com>
 <CAA8EJpoEpn2RPByeDkaGPUX+OC7tvbEw4k78Gd+RKs02jpzG1w@mail.gmail.com>
In-Reply-To: <CAA8EJpoEpn2RPByeDkaGPUX+OC7tvbEw4k78Gd+RKs02jpzG1w@mail.gmail.com>
From: Doug Anderson <dianders@chromium.org>
Date: Fri, 4 Mar 2022 13:49:27 -0800
X-Gmail-Original-Message-ID: <CAD=FV=WZUSuNa0Ei_0ByjHRdsJ7smhD+uVghs28NzNGvGp0LwQ@mail.gmail.com>
Message-ID: <CAD=FV=WZUSuNa0Ei_0ByjHRdsJ7smhD+uVghs28NzNGvGp0LwQ@mail.gmail.com>
Subject: Re: [PATCH v4 4/4] arm64/dts/qcom/sm8250: remove assigned-clock-rate
 property for mdp clk
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
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
Cc: quic_kalyant@quicinc.com,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 LKML <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Vinod Polimera <quic_vpolimer@quicinc.com>, Stephen Boyd <swboyd@chromium.org>,
 freedreno <freedreno@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Thu, Mar 3, 2022 at 4:16 PM Dmitry Baryshkov
<dmitry.baryshkov@linaro.org> wrote:
>
> On Fri, 4 Mar 2022 at 02:56, Stephen Boyd <swboyd@chromium.org> wrote:
> >
> > Quoting Dmitry Baryshkov (2022-03-03 15:50:50)
> > > On Thu, 3 Mar 2022 at 12:40, Vinod Polimera <quic_vpolimer@quicinc.com> wrote:
> > > >
> > > > Kernel clock driver assumes that initial rate is the
> > > > max rate for that clock and was not allowing it to scale
> > > > beyond the assigned clock value.
> > > >
> > > > Drop the assigned clock rate property and vote on the mdp clock as per
> > > > calculated value during the usecase.
> > > >
> > > > Fixes: 7c1dffd471("arm64: dts: qcom: sm8250.dtsi: add display system nodes")
> > >
> > > Please remove the Fixes tags from all commits. Otherwise the patches
> > > might be picked up into earlier kernels, which do not have a patch
> > > adding a vote on the MDP clock.
> >
> > What patch is that? The Fixes tag could point to that commit.
>
> Please correct me if I'm wrong.
> Currently the dtsi enforces bumping the MDP clock when the mdss device
> is being probed and when the dpu device is being probed.
> Later during the DPU lifetime the core_perf would change the clock's
> rate as it sees fit according to the CRTC requirements.

"Currently" means _before_ ${SUBJECT} patch lands, right? Since
${SUBJECT} patch is removing the bump to max.


> However it would happen only when the during the
> dpu_crtc_atomic_flush(), before we call this function, the MDP clock
> is left in the undetermined state. The power rails controlled by the
> opp table are left in the undetermined state.
>
> I suppose that during the dpu_bind we should bump the clock to the max
> possible freq and let dpu_core_perf handle it afterwards.

Definitely feels like seeing the clock to something predictable during
the initial probe makes sense. If it's just for the initial probe then
setting it to max (based on the opp table) seems fine. I think an
earlier version of this series set it to max every time we did runtime
resume. We'd have to have a good reason to do that.

-Doug
