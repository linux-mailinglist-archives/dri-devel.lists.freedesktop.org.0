Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CACC50EEA2
	for <lists+dri-devel@lfdr.de>; Tue, 26 Apr 2022 04:19:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E748E10E513;
	Tue, 26 Apr 2022 02:19:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com
 [IPv6:2a00:1450:4864:20::52c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A914710E513
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Apr 2022 02:18:59 +0000 (UTC)
Received: by mail-ed1-x52c.google.com with SMTP id g20so20622436edw.6
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Apr 2022 19:18:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=c4m32+fTXzvjrK8N2PTs9HFTY5JW2xcDekaDXCQn2Jo=;
 b=UJ31W5ZGcTMdSrRnKjrJV8Q7vQiCR0y48RG002zAPW0z545pWer/A2fTaArW9Is7Jy
 epp1b/Me9p6puYs3/q2r3o9R9bp2QEb09OKfTf/KJdjzwPFEPZZskrURVnLpaJZb54PZ
 foOuSGS/UEjxyzsKHE/tENb1LS77Wnf7POSVo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=c4m32+fTXzvjrK8N2PTs9HFTY5JW2xcDekaDXCQn2Jo=;
 b=okskyhlhoidCYES7G1rb+6LUc9hCQzXuwUbRJADP8CoJL95qeqCRkHeIcDwu7JYSVk
 MDdf9mubHlDYycNjO1XEtE1RdoLRFaJ8L/OKsuvKOPhAGt8kVw6Il/kgYqhsWGMiwWGM
 RFzFRYDYJO0wdqtJPve+c9nHX8+GexoF4EkqTnzykPpcqt1oCxQeO5Q/YXweJogfapiL
 QzaHsdLSan5qGUUuzjJVFHnaCEAo7ItV7yA0jKTUML9y5l1oA+g8BSBVCkId8BASb5+4
 reGIqRNdj6tF9ulc09HGowCE/K0gq8DEaD0rkGiyci/qv7YPGZajKOAjrEsRPf/WivbM
 ukYQ==
X-Gm-Message-State: AOAM533n1pFqSJ9peeESN5nBdNlOu6sEOAxmJ+9rI054GFsWRgS/OQk3
 u5NAGWKbTOiedg5UroXaksQDa1xNHmlbmkMN
X-Google-Smtp-Source: ABdhPJyN/N/eeSZaDHuDplUq75jMFQLBrzdFi9tOOrGYd7Qs/F1IF+j+vtmd9CH1SNPYUOF+gfb4Lw==
X-Received: by 2002:a05:6402:289a:b0:425:d682:105d with SMTP id
 eg26-20020a056402289a00b00425d682105dmr13633175edb.175.1650939537796; 
 Mon, 25 Apr 2022 19:18:57 -0700 (PDT)
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com.
 [209.85.221.47]) by smtp.gmail.com with ESMTPSA id
 ci21-20020a170906c35500b006f394323ccesm1751250ejb.34.2022.04.25.19.18.55
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 25 Apr 2022 19:18:56 -0700 (PDT)
Received: by mail-wr1-f47.google.com with SMTP id u3so23396779wrg.3
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Apr 2022 19:18:55 -0700 (PDT)
X-Received: by 2002:a05:6000:c7:b0:20a:d8c1:d044 with SMTP id
 q7-20020a05600000c700b0020ad8c1d044mr7719873wrx.422.1650939535168; Mon, 25
 Apr 2022 19:18:55 -0700 (PDT)
MIME-Version: 1.0
References: <1650671124-14030-1-git-send-email-quic_khsieh@quicinc.com>
 <3b9588d2-d9f6-c96f-b316-953b56b59bfe@linaro.org>
 <73e2a37e-23db-d614-5f5c-8120f1869158@quicinc.com>
 <CAA8EJprjuzUrfwXodgKmbWxgK6t+bY601E_nS7CHNH_+4Tfn5Q@mail.gmail.com>
 <9b331b16-8d1b-4e74-8fee-d74c4041f8d7@quicinc.com>
 <CAD=FV=VxEnbBypNYSq=iTUTwZUs_v620juSA6gsMW4h2_3HyBQ@mail.gmail.com>
 <9b4ccdef-c98a-b907-c7ee-a92456dc5bba@quicinc.com>
In-Reply-To: <9b4ccdef-c98a-b907-c7ee-a92456dc5bba@quicinc.com>
From: Doug Anderson <dianders@chromium.org>
Date: Mon, 25 Apr 2022 19:18:43 -0700
X-Gmail-Original-Message-ID: <CAD=FV=U3MJ1W6CCVW0+Si8ZyAD+_ZBYsL1cT6Y8yhcTvWsCLUQ@mail.gmail.com>
Message-ID: <CAD=FV=U3MJ1W6CCVW0+Si8ZyAD+_ZBYsL1cT6Y8yhcTvWsCLUQ@mail.gmail.com>
Subject: Re: [Freedreno] [PATCH] drm/msm/dp: move add fail safe mode to
 dp_connector_get_mode()
To: Abhinav Kumar <quic_abhinavk@quicinc.com>
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
Cc: freedreno <freedreno@lists.freedesktop.org>,
 Sankeerth Billakanti <quic_sbillaka@quicinc.com>,
 David Airlie <airlied@linux.ie>, linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 LKML <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Kuogee Hsieh <quic_khsieh@quicinc.com>, Vinod Koul <vkoul@kernel.org>,
 Andy Gross <agross@kernel.org>, Bjorn Andersson <bjorn.andersson@linaro.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 "Aravind Venkateswaran \(QUIC\)" <quic_aravindh@quicinc.com>,
 Stephen Boyd <swboyd@chromium.org>, Sean Paul <sean@poorly.run>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Mon, Apr 25, 2022 at 6:42 PM Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
>
> >> 2) When there was a valid EDID but no 640x480 mode
> >>
> >> This is the equipment specific case and the one even I was a bit
> >> surprised. There is a DP compliance equipment we have in-house and while
> >> validation, it was found that in its list of modes , it did not have any
> >> modes which chromebook supported ( due to 2 lanes ). But my
> >> understanding was that, all sinks should have atleast 640x480 but
> >> apparently this one did not have that. So to handle this DP compliance
> >> equipment behavior, we had to do this.
> >
> > That doesn't seem right. If there's a valid EDID and the valid EDID
> > doesn't contain 640x480, are you _sure_ you're supposed to be adding
> > 640x480? That doesn't sound right to me. I've got a tiny display in
> > front of me for testing that only has one mode:
> >
> >    #0 800x480 65.68 800 840 888 928 480 493 496 525 32000
> >
>
> As I had wrote, DRM core kicks in only when the count of modes is 0.
> Here what is happening is the count was not 0 but 640x480 was not
> present in the EDID. So we had to add it explicitly.
>
> Your tiny display is a display port display?
>
> I am referring to only display port monitors. If your tiny display is
> DP, it should have had 640x480 in its list of modes.

My tiny display is actually a HDMI display hooked up to a HDMI to DP
(active) adapter.

...but this is a legal and common thing to have. I suppose possibly my
HDMI display is "illegal"?

OK, so reading through the spec more carefully, I do see that the DP
spec makes numerous mentions of the fact that DP sinks _must_ support
640x480. Even going back to DP 1.4, I see section "5.2.1.2 Video
Timing Format" says that we must support 640x480. It seems like that's
_intended_ to be used only if the EDID read fails, though or if we
somehow have to output video without knowledge of the EDID. It seems
hard to believe that there's a great reason to assume a display will
support 640x480 if we have more accurate knowledge.

In any case, I guess I would still say that adding this mode belongs
in the DRM core. The core should notice that it's a DP connection
(bridge->type == DRM_MODE_CONNECTOR_DisplayPort) and that 640x480 was
left out and it should add it. We should also make sure it's not
"preferred" and is last in the list so we never accidentally pick it.
If DP truly says that we should always give the user 640x480 then
that's true for everyone, not just Qualcomm. We should add it in the
core. If, later, someone wants to hide this from the UI it would be
much easier if they only needed to modify one place.


> > So IMO we _shouldn't_ land ${SUBJECT} patch.
> >
> > Just for testing, I also tried a hack to make EDID reading fail
> > (return -EIO in the MSM dp_aux_transfer() function if msg->request <
> > 8). Before ${SUBJECT} patch I'd see these modes:
> >
> >    #0 1024x768 60.00 1024 1048 1184 1344 768 771 777 806 65000
> >    #1 800x600 60.32 800 840 968 1056 600 601 605 628 40000
> >    #2 800x600 56.25 800 824 896 1024 600 601 603 625 36000
> >    #3 848x480 60.00 848 864 976 1088 480 486 494 517 33750
> >    #4 640x480 59.94 640 656 752 800 480 490 492 525 25175
> >
> > ...and after ${SUBJECT} patch I'd see:
> >
> >    #0 640x480 59.94 640 656 752 800 480 490 492 525 25175
> >    #1 1024x768 60.00 1024 1048 1184 1344 768 771 777 806 65000
> >    #2 800x600 60.32 800 840 968 1056 600 601 605 628 40000
> >    #3 800x600 56.25 800 824 896 1024 600 601 603 625 36000
> >    #4 848x480 60.00 848 864 976 1088 480 486 494 517 33750
> >
> > ...so your patch causes 640x480 to be prioritized. That also doesn't
> > seem ideal. If it was ideal, the DRM core should have listed 640x480
> > first.
>
> So this is a different display or these modes are coming due to the
> drm_add_modes_noedid() call because of the EDID read fail right?

Right, it's from the !edid case.

-Doug
