Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 118214A8F8E
	for <lists+dri-devel@lfdr.de>; Thu,  3 Feb 2022 22:06:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 00C0610EB4A;
	Thu,  3 Feb 2022 21:06:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x22e.google.com (mail-oi1-x22e.google.com
 [IPv6:2607:f8b0:4864:20::22e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A85E910EB4A
 for <dri-devel@lists.freedesktop.org>; Thu,  3 Feb 2022 21:06:45 +0000 (UTC)
Received: by mail-oi1-x22e.google.com with SMTP id x193so6197984oix.0
 for <dri-devel@lists.freedesktop.org>; Thu, 03 Feb 2022 13:06:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:in-reply-to:references:from:user-agent:date:message-id
 :subject:to:cc;
 bh=rLIfM+XnZ6jdUjbJAUN7qGu3432B0un81GJS7eaWnlI=;
 b=eA0NHkz7c3q8gtxI29i0+MeN3//KbH2XueW5bFR8xOW4M0+IX+6ob3m59CCwqZ2jUF
 zioo2hgbQU1A4dv0HZbu6kYqSWzJ8cMzCE9yAmCcg+RneQemw0QUkHtuNkuVILRvO5Ug
 7KfsMIwSiTmqsu58vY09Oc2RwYOFSWRFFvtG0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:in-reply-to:references:from
 :user-agent:date:message-id:subject:to:cc;
 bh=rLIfM+XnZ6jdUjbJAUN7qGu3432B0un81GJS7eaWnlI=;
 b=U4Bb0KSsMfLPHwIiQ+zOVFZd2R7fqKmSnf++NzGFohypiJzbaDLOF300UpuV3f0DhG
 SvQMOYImqQresqXSUkyCAXHAO0QgDKAFAbro+j0JAbpCl+Vv5E/lMPKSus/5vZHMr0Dw
 BE0Nn4Y/D9ap2n7itQoxoiyEIG5W0H/V7fB0PDQzkXvFAP6zVJVukZmpIoeiNfz+W4SL
 y5R+1mBmJGp/FkFVTG7kzOBgCWv8S+NzluVTIPvV2RTAtgly+xX/Us8YgdVyKH8jTvMu
 KmO2wOezJkp4+Mfl8R0nRzYhKntdI/n2lZU8RmTN3dOS96QdzW7oEEE9wzZlbZ7f6XzS
 0IQg==
X-Gm-Message-State: AOAM531DIg49M0dyAAF/U1OWNLEIGXx2dEFTMSs0BXD08sI7MHFMHmFh
 j3RQEwwEisC+UpNR65UAn67odJvw2qAuiBotDWGxsQ==
X-Google-Smtp-Source: ABdhPJz9Y9Mi3IXo901kpkyN0YnNUq6zgmnLxMlp5JawWeOl4ZU0ovx9WI8tfAGzYsk8NvHQ99xNDuMhABwMKt/Nus0=
X-Received: by 2002:aca:df82:: with SMTP id w124mr8744227oig.112.1643922403532; 
 Thu, 03 Feb 2022 13:06:43 -0800 (PST)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 3 Feb 2022 21:06:43 +0000
MIME-Version: 1.0
In-Reply-To: <0b81d146-05fa-390e-5afc-cb29909cba3e@linaro.org>
References: <1643240768-7869-1-git-send-email-quic_khsieh@quicinc.com>
 <0b81d146-05fa-390e-5afc-cb29909cba3e@linaro.org>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date: Thu, 3 Feb 2022 21:06:42 +0000
Message-ID: <CAE-0n538cYD-F_FDib=RN_vdDy71HkY-ybQhMzK_BNoEQtpnmw@mail.gmail.com>
Subject: Re: [PATCH v2] drm/msm/dp: add connector type to enhance debug
 messages
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Kuogee Hsieh <quic_khsieh@quicinc.com>, 
 agross@kernel.org, airlied@linux.ie, bjorn.andersson@linaro.org, 
 daniel@ffwll.ch, robdclark@gmail.com, sean@poorly.run, vkoul@kernel.org
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
Cc: linux-arm-msm@vger.kernel.org, quic_abhinavk@quicinc.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 aravindh@codeaurora.org, freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Quoting Dmitry Baryshkov (2022-01-31 18:34:47)
> On 27/01/2022 02:46, Kuogee Hsieh wrote:
> > DP driver is a generic driver which supports both eDP and DP.
> > For debugging purpose it is required to have capabilities to
> > differentiate message are generated from eDP or DP.
> > This patch do:
> > 1) add connector type into debug messages within dp_display.c
> > 2) revise debug messages related to DP phy within dp_ctrl.c
> > 3) replace DRM_DEBUG_DP marco with drm_dbg_dp
>
> You list three items here. This patch should be split into respective
> three parts.
>
> >
> > Changes in V2:
> > -- replace DRM_DEBUG_DP marco with drm_dbg_dp
>
> I suppose that Stephen's idea was to pass proper drm_device to this
> function rather than always passing NULL.
>

The idea was to pass 'struct something' and then have a 'dev' named
member inside that's a struct device.

	struct something {
		struct device *dev;
		...
	};

Then the macro will extract the device out of it and use it to print
messages. It may be an abuse of the macro though because initially I
thought it needed to be a drm device but that doesn't seem to be the
case?
