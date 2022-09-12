Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 176885B5766
	for <lists+dri-devel@lfdr.de>; Mon, 12 Sep 2022 11:47:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A00A110E335;
	Mon, 12 Sep 2022 09:46:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb2b.google.com (mail-yb1-xb2b.google.com
 [IPv6:2607:f8b0:4864:20::b2b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3FE9410E335
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Sep 2022 09:46:51 +0000 (UTC)
Received: by mail-yb1-xb2b.google.com with SMTP id 130so11839300ybz.9
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Sep 2022 02:46:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date;
 bh=iXsYZi2SjRrdhC6YtOInbb+wwHPsXuEDE2PJyDVsjPc=;
 b=J26G1kaMCpU/huj4irkHRikMR78rM4qjrNcAAA16uuwYo4KHGrkB3MD9z261dObhPe
 FQAde/ufBcq+XuvrIokPHQFZLQMAjc3yw0uWhax38vmOHboiVGCgfafR4ktU0G8or/jT
 EALcdewQZ9sss/15BthDtZ6ymq1psQreDc5PFYlhhOx8jf5yXZdu/Oggf9ZA7Tcr5TKl
 Ip0gx3FfwYUrEW/yCRx5WEK3qg5KoADWFgUY0QVJidOVzWZLI2HAUMdTA8YO14nVTNJx
 SmPGSQVsXoChrCjaH0R55SM2+EYpVcIsSCEUeyPwHxrcMeVshcqPhsdLrNsCvBwoc+Vj
 n8Sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date;
 bh=iXsYZi2SjRrdhC6YtOInbb+wwHPsXuEDE2PJyDVsjPc=;
 b=5BdcTv1K6+sAz0yq60RA2n+dGxA55W5tCrcJLf2urYMYQMJc6Sffa03ZO24DZCRxEG
 ucwg/09uVajh+QFea6cNGBtlKrh8LkPJhWLQJJwQBiGnE7tmHXAiOsnlsj6U+4HUNZH9
 FXE8Tmmcd+XxwH2X29So+FQfpNivEXjBZQHP94oxSgbFaCbsvEn9lPHuva2/H2xPVfsJ
 8adOrr080frN5f0hy8wUnKle8ULhiXMLMMyaxtMb734pBHlTGIc5RCDmQxCyKQ0y86n7
 WBZrllToxjkV946m3na5KrGyM4veGb9QGPJDGGP3DlAdzfUwgk5CZqj/AIskMobmP5vH
 CEow==
X-Gm-Message-State: ACgBeo26BHxCt9L9f0FxPqnhjsZjbAN0y8GMqV4MIOeo5ENA859Rv22j
 nOcPe6bev883E8sV3zvfJGXwBBrFSluNyJhTFfkOGA==
X-Google-Smtp-Source: AA6agR7RW9+RmdeYJyXDjxjNa3U1UZkW1XIRfbT2VSl9GyvcI1tMz5HBJwbMMG2bNjXo+8COy7PU0giK8+qyA3nCQfQ=
X-Received: by 2002:a25:af13:0:b0:6ae:3166:1aee with SMTP id
 a19-20020a25af13000000b006ae31661aeemr16075200ybh.288.1662976010418; Mon, 12
 Sep 2022 02:46:50 -0700 (PDT)
MIME-Version: 1.0
References: <20220429185157.3673633-1-dmitry.baryshkov@linaro.org>
 <87f178f6-0abe-7e5c-5a70-05c2bab94991@ideasonboard.com>
In-Reply-To: <87f178f6-0abe-7e5c-5a70-05c2bab94991@ideasonboard.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Mon, 12 Sep 2022 12:46:39 +0300
Message-ID: <CAA8EJpopeXeaec8Yhsu-aQsN8j4v74nBZ0TBSz0WHKiwq9f1wQ@mail.gmail.com>
Subject: Re: [PATCH v1 0/7] drm/bridge_connector: perform HPD enablement
 automatically
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
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
Cc: Sean Paul <sean@poorly.run>, freedreno@lists.freedesktop.org,
 Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org,
 David Airlie <airlied@linux.ie>, Sascha Hauer <s.hauer@pengutronix.de>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, NXP Linux Team <linux-imx@nxp.com>,
 Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>, linux-arm-msm@vger.kernel.org,
 Shawn Guo <shawnguo@kernel.org>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, 12 Sept 2022 at 11:51, Tomi Valkeinen
<tomi.valkeinen@ideasonboard.com> wrote:
>
> Hi,
>
> On 29/04/2022 21:51, Dmitry Baryshkov wrote:
> >  From all the drivers using drm_bridge_connector only iMX/dcss and OMAP
> > DRM driver do a proper work of calling
> > drm_bridge_connector_en/disable_hpd() in right places. Rather than
> > teaching each and every driver how to properly handle
> > drm_bridge_connector's HPD, make that automatic.
> >
> > Add two additional drm_connector helper funcs: enable_hpd() and
> > disable_hpd(). Make drm_kms_helper_poll_* functions call them (as this
> > is the time where the drm_bridge_connector's functions are called by the
> > drivers too).
>
> 09077bc3116581f4d1cb961ec359ad56586e370b ("drm/bridge_connector: enable
> HPD by default if supported") was merged in March, but I think that one
> is  bit broken
> (https://lore.kernel.org/all/a28a4858-c66a-6737-a9fc-502f591ba2d5@ideasonboard.com/).
> To get omapdrm work without WARNs we could just revert that commit, but
> I think this series makes things cleaner.
>
> There's one small problem with this series: in drm_bridge_connector.c
> the drm_bridge_hpd_disable() function is called from
> _drm_bridge_connector_disable_hpd() and from
> drm_bridge_connector_destroy(). This causes two hpd_disable calls when
> removing the driver modules. I think the call from
> drm_bridge_connector_destroy() could be removed, as
> _drm_bridge_connector_disable_hpd() should always get called when
> removing the drivers.
>
> Dmitry, are you still interested in this series? Can you rebase on top
> of current upstream, and revert 09077bc3116581f4d1cb961ec359ad56586e370b
> first?

Hi, I've been a bit reluctant to continue this work after the
mentioned commit got merged. However of course I can update & resend
this patch series.

-- 
With best wishes
Dmitry
