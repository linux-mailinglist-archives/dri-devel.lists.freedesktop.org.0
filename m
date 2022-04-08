Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2322A4F955E
	for <lists+dri-devel@lfdr.de>; Fri,  8 Apr 2022 14:08:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A29EF10E698;
	Fri,  8 Apr 2022 12:08:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x82c.google.com (mail-qt1-x82c.google.com
 [IPv6:2607:f8b0:4864:20::82c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C412A10E413
 for <dri-devel@lists.freedesktop.org>; Fri,  8 Apr 2022 12:08:19 +0000 (UTC)
Received: by mail-qt1-x82c.google.com with SMTP id t19so10447470qtc.4
 for <dri-devel@lists.freedesktop.org>; Fri, 08 Apr 2022 05:08:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=iWcOdSTeii/l+pRmYuGQf4RJhfwwNZEYurFdlxkZUaY=;
 b=OENOHcX7cCbgmhpSKLPUZxrLFHPmlHC/+n5h20Td7RCij1+nFhwcnu94n2CmBE9dIC
 vagdD5iplHtmyO66W93NURendZZEphRDfeLzBTDhepzp3576i1gV27FbyErRm6Nnn72t
 LLNy15iGT6BiHd3bZB7y0A/ZCINDQ0ICWXdIZbSCeCqpwOPBNjKzjGglD7cAMAVthWaH
 LeF82YbvUw8Q+Japqgb77cxrbx+ayEmGyyoUd18+nJ5i5r4Mkwq+M+LkPktY1lNiOteO
 oIQN0qiWl0jBvkWXk2izVQcQRDSRjrdMDq72YfzwCaJLBCEaHwQwFD+v+Xc6yUsPO5Bl
 91QQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=iWcOdSTeii/l+pRmYuGQf4RJhfwwNZEYurFdlxkZUaY=;
 b=f39N3E2LkpTkdmRlrEPBBXcxh1kGTxH0rgtaQaqv1txsX5wUbZhsWowPBdHE5zJzy8
 1Jc4jIsDLaiD4LUZH+MwpbsF6+uu4XBifpmh8BlrqpsaqxvU7PTJwvnyMahTKO8io/v4
 78K7vH+5UEYhw6VIpQwyMlnhzWtaCm1lJTcslsktZNk/ZfgvDWOqyGtn7VO6UKKm0bc6
 3eKRLrQy1cdCHdoKPZ4vAcjrVeln09On6rMQxOKz6TK3wxjO8XcuSOG3Ba6rHbaOo0lo
 Ynm7vfCYbiy8+6K7w1Aw0xUl9sX+wRP5wsJc9h2kEUePTuba6GYCgden2i8a9kVsxkT6
 D/3Q==
X-Gm-Message-State: AOAM533HOQZ04+DW2NvvA8zJbogzn4/cSEaeSy2U2SdHE4E6poW6iKaO
 t/TpX3RbfLkGLk46HT3ZtDpd3ly9AenzVcEb/xES/A==
X-Google-Smtp-Source: ABdhPJxproQt8DFvW7F/hhPbMHO0l7y9QXrApPgXog0kABlOZ/Hcl/Kg+9BCf5mwXCM/fvud95Fw+Y1DpN59iztdwjU=
X-Received: by 2002:ac8:5a46:0:b0:2e2:2edd:374 with SMTP id
 o6-20020ac85a46000000b002e22edd0374mr15446114qta.295.1649419698450; Fri, 08
 Apr 2022 05:08:18 -0700 (PDT)
MIME-Version: 1.0
References: <1648656179-10347-1-git-send-email-quic_sbillaka@quicinc.com>
 <1648656179-10347-9-git-send-email-quic_sbillaka@quicinc.com>
 <CAA8EJprvE31ex3fCQHZ-=x+EWHK4UZ0qqHRh+rH4dk5TPhmVyw@mail.gmail.com>
 <MW4PR02MB71867220A90FCFED295830D0E1E19@MW4PR02MB7186.namprd02.prod.outlook.com>
 <CAD=FV=VK0D_GzYBv+u+o6-ks-UAsw97__0mWsSn9OycX72LJFg@mail.gmail.com>
 <MW4PR02MB71865B8E17F3D194B05013EDE1E59@MW4PR02MB7186.namprd02.prod.outlook.com>
 <CAA8EJpqFh7c9ohDbR_0kG5t106-djE7TYfaoAbiT-W4-294jTw@mail.gmail.com>
 <MW4PR02MB71868617E96D59D659EFD87EE1E69@MW4PR02MB7186.namprd02.prod.outlook.com>
In-Reply-To: <MW4PR02MB71868617E96D59D659EFD87EE1E69@MW4PR02MB7186.namprd02.prod.outlook.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 8 Apr 2022 15:08:08 +0300
Message-ID: <CAA8EJpqd+JVHqjNrwZ4MHi+9JMdA5QPX2UwGpeM6RhUntv0brA@mail.gmail.com>
Subject: Re: [PATCH v6 8/8] drm/msm/dp: Handle eDP mode_valid differently from
 dp
To: "Sankeerth Billakanti (QUIC)" <quic_sbillaka@quicinc.com>
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
Cc: quic_kalyant <quic_kalyant@quicinc.com>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "bjorn.andersson@linaro.org" <bjorn.andersson@linaro.org>,
 "Abhinav Kumar \(QUIC\)" <quic_abhinavk@quicinc.com>,
 quic_vproddut <quic_vproddut@quicinc.com>,
 "airlied@linux.ie" <airlied@linux.ie>,
 "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>,
 "Kuogee Hsieh \(QUIC\)" <quic_khsieh@quicinc.com>,
 Doug Anderson <dianders@chromium.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "sean@poorly.run" <sean@poorly.run>,
 "seanpaul@chromium.org" <seanpaul@chromium.org>,
 "Aravind Venkateswaran \(QUIC\)" <quic_aravindh@quicinc.com>,
 "swboyd@chromium.org" <swboyd@chromium.org>,
 "freedreno@lists.freedesktop.org" <freedreno@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 7 Apr 2022 at 17:05, Sankeerth Billakanti (QUIC)
<quic_sbillaka@quicinc.com> wrote:
>
> Hi Dmitry,
>
> > > > > > On Wed, 30 Mar 2022 at 19:04, Sankeerth Billakanti
> > > > > > <quic_sbillaka@quicinc.com> wrote:
> > > > > > >
> > > > > > > The panel-edp driver modes needs to be validated differently
> > > > > > > from DP because the link capabilities are not available for EDP by
> > that time.
> > > > > > >
> > > > > > > Signed-off-by: Sankeerth Billakanti
> > > > > > > <quic_sbillaka@quicinc.com>
> > > > > >
> > > > > > This should not be necessary after
> > > > > >
> > > >
> > https://patchwork.freedesktop.org/patch/479261/?series=101682&rev=1.
> > > > > > Could you please check?
> > > > > >
> > > > >
> > > > > The check for DP_MAX_PIXEL_CLK_KHZ is not necessary anymore but
> > we
> > > > > need to return early for eDP because unlike DP, eDP context will
> > > > > not have the information about the number of lanes and link clock.
> > > > >
> > > > > So, I will modify the patch to return after the
> > > > > DP_MAX_PIXEL_CLK_KHZ
> > > > check if is_eDP is set.
> > > >
> > > > I haven't walked through all the relevant code but something you
> > > > said above sounds strange. You say that for eDP we don't have info
> > > > about the number of lanes? We _should_.
> > > >
> > > > It's certainly possible to have a panel that supports _either_ 1 or
> > > > 2 lanes but then only physically connect 1 lane to it. ...or you
> > > > could have a panel that supports 2 or 4 lanes and you only connect 1 lane.
> > > > See, for instance, ti_sn_bridge_parse_lanes. There we assume 4 lanes
> > > > but if a "data-lanes" property is present then we can use that to
> > > > know that fewer lanes are physically connected.
> > > >
> > > > It's also possible to connect more lanes to a panel than it supports.
> > > > You could connect 2 lanes to it but then it only supports 1. This
> > > > case needs to be handled as well...
> > > >
> > >
> > > I was referring to the checks we do for DP in dp_bridge_mode_valid. We
> > > check if the Link bandwidth can support the pixel bandwidth. For an
> > > external DP connection, the Initial DPCD/EDID read after cable
> > > connection will return the sink capabilities like link rate, lane
> > > count and bpp information that are used to we filter out the unsupported
> > modes from the list of modes from EDID.
> > >
> > > For eDP case, the dp driver performs the first dpcd read during
> > > bridge_enable. The dp_bridge_mode_valid function is executed before
> > > bridge_enable and hence does not have the full link or the sink
> > > capabilities information like external DP connection, by then.
> >
> > It sounds to me like we should emulate the HPD event for eDP to be handled
> > earlier than the get_modes()/prepare() calls are attempted.
> > However this might open another can of worms.
> >
>
> For DP, the HPD handler mainly initiates link training and gets the EDID.
>
> Before adding support for a separate eDP panel, we had discussed about
> this internally and decided to emulate eDP HPD during enable(). Main reason
> being, eDP power is guaranteed to be on only after bridge_enable().
> So, eDP link training can happen and sustain only after bridge_enable().
>
> Emulating HPD before/during get_modes will not have any effect because:

As we have seen, the term HPD is significantly overloaded. What do you
want to emulate?

>
> 1. get_modes() will go to panel's get_modes() function to power on read EDID
>
> 2. panel power will be turned off after get_modes(). Panel power off will
> reset every write transaction in DPCD. anyway invalidating link training

I tend to agree with Doug here. eDP link power status should be
handled by the pm_runtime_autosuspend with grace period being high
enough to cover the timeslot between get_mode() and enable().

panel-edp already does most of required work.

>
> 3. mode_valid will land in dp driver but panel will not be powered on at that
> time and we cannot do aux transfers or DPCD read writes.

Why do we need to perform AUX writes in mode_valid?

>
> > > So, we need to proceed with the reported mode for eDP.
> >
> > Well... Even if during the first call to get_modes() the DPCD is not read,
> > during subsequent calls the driver has necessary information, so it can
> > proceed with all the checks, can't it?
> >
>
> get_modes() currently does not land in DP driver. It gets executed in panel
> bridge. But the mode_valid() comes to DP driver to check the controller
> compatibility.

Yes, this is correct. the DP's mode_valid() knows the hardware
limitations (max clock speed, amount of lanes, etc) and thus it can
decide whether the mode is supported by the whole chain or not.
We should not skip such checks for the eDP.


-- 
With best wishes
Dmitry
