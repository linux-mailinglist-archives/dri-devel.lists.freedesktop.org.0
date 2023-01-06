Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A512765F941
	for <lists+dri-devel@lfdr.de>; Fri,  6 Jan 2023 02:44:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 99FBC10E822;
	Fri,  6 Jan 2023 01:43:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x62e.google.com (mail-pl1-x62e.google.com
 [IPv6:2607:f8b0:4864:20::62e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 329C310E822
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Jan 2023 01:43:56 +0000 (UTC)
Received: by mail-pl1-x62e.google.com with SMTP id jn22so185187plb.13
 for <dri-devel@lists.freedesktop.org>; Thu, 05 Jan 2023 17:43:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=zq2tTlqoca8fgMZv+DSfwKOM4QZRj+aLU599+3ypWLs=;
 b=aT3ec5YU5kW9kVY37MkKgkTc8VMR6+NxP+HPcJ8t9J9c94T+ItW36xG5UN+qJeg8jn
 orhx9mlGVaPLg2q5tlgxc2OVnTMSUOUpEWbai6U5leqDU7aPt7GPDsUY7Ebe423J2NHM
 Vh6ro3SfUaCL3pirzzjv6uiOdX3ijLWXQDUog=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=zq2tTlqoca8fgMZv+DSfwKOM4QZRj+aLU599+3ypWLs=;
 b=U20RvXDdojO2SkLRmtePuLZLdeFDkhvTiSzkLCo4Z6ySgVQeBTfgjV0yj0HU4vDdBL
 jbz9hblzmClDdUoSREALfd0U8XHgwioF+aVUqkz2sj/HxweG45LODV7g7IdSCw+z/SYA
 4PWo8U4sF+oE/STGeHyHI+o1qEuUOXjaFlP8xu8nL1p9+mUPq0AwIJ+teBDSwr1+20x5
 kx5VjL1BaNYhHM4aaHQcRxkjW5vBq5eADppl0l26LVbZGS5NBDHV7vBTQxw2ZdEVa4M9
 MNdW4w879YVQlqMZ1+b1BspeLFA1Hb9A15xd0hb2TVBRNHFUxd6v+o+yfM4ImZq5I+wQ
 oB4Q==
X-Gm-Message-State: AFqh2kqxNzpWq+olmh/kEdAPMNc3tAhhnwPHchyMdNfthSIVo//HalMS
 38EcZlp3T8U1TtUwaQ0dM/W3vQ==
X-Google-Smtp-Source: AMrXdXvpKiXLt2gXj8DJbU08aSnbZ+9SGellA9tGLkhsf4ENbOej9zoRDEaxgIKHPPmL8ehI2RyDYg==
X-Received: by 2002:a17:90b:482:b0:226:ae11:b55b with SMTP id
 bh2-20020a17090b048200b00226ae11b55bmr7987265pjb.11.1672969435732; 
 Thu, 05 Jan 2023 17:43:55 -0800 (PST)
Received: from google.com ([2620:15c:9d:2:5567:fb20:aa4f:352])
 by smtp.gmail.com with ESMTPSA id
 d10-20020a17090a3b0a00b0021806f631ccsm1889218pjc.30.2023.01.05.17.43.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Jan 2023 17:43:55 -0800 (PST)
Date: Thu, 5 Jan 2023 17:43:52 -0800
From: Brian Norris <briannorris@chromium.org>
To: Michel =?iso-8859-1?Q?D=E4nzer?= <michel.daenzer@mailbox.org>
Subject: Re: renesas/master bisection:
 igt-kms-rockchip.kms_vblank.pipe-A-wait-forked on rk3399-gru-kevin
Message-ID: <Y7d82A9FrHDraRYB@google.com>
References: <6398848e.170a0220.f8e8e.d44f@mx.google.com>
 <Y5itf0+yNIQa6fU4@sirena.org.uk> <Y5qOwmqIIp+2qWOy@google.com>
 <Y6OCg9BPnJvimQLT@google.com>
 <a62cd71c-f025-739a-4822-58ff8fa78cbd@mailbox.org>
 <Y7TgXA+bnkPm4y/6@google.com>
 <9ff68af1-63f6-1a95-6380-d0d8503fe511@mailbox.org>
 <Y7dyh1AkJRZnf+Dq@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Y7dyh1AkJRZnf+Dq@google.com>
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
Cc: Neil Armstrong <neil.armstrong@linaro.org>, kernelci-results@groups.io,
 bot@kernelci.org, Jonas Karlman <jonas@kwiboo.se>,
 dri-devel@lists.freedesktop.org, Douglas Anderson <dianders@chromium.org>,
 Robert Foss <robert.foss@linaro.org>, Mark Brown <broonie@kernel.org>,
 Sean Paul <seanpaul@chromium.org>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, gtucker@collabora.com,
 linux-arm-kernel@lists.infradead.org,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Jan 05, 2023 at 04:59:55PM -0800, Brian Norris wrote:
> On Wed, Jan 04, 2023 at 10:11:46AM +0100, Michel Dänzer wrote:
> > On 1/4/23 03:11, Brian Norris wrote:
> > > On Tue, Jan 03, 2023 at 07:04:00PM +0100, Michel Dänzer wrote:
> > >> On 12/21/22 23:02, Brian Norris wrote:
> > >>> 3. leave vblank enabled even in the presence of PSR
> > > 
> > > I'm leaning toward this.
> > 
> > If this means vblank interrupts will arrive as expected even while in PSR, that may be the ideal solution indeed.
> 
> Yes. And I think I have a working patchset for this now. It passes all
> the igt-gpu-tools/kms_vblank tests for me now, and I don't think it
> causes any other issues. I'll send it out shortly, after a bit more
> testing.

For the record, that's here:
https://lore.kernel.org/lkml/20230105174001.2.Ic07cba4ab9a7bd3618a9e4258b8f92ea7d10ae5a@changeid/

I didn't CC everyone who got this report. In included a:

  Reported-by: "kernelci.org bot" <bot@kernelci.org>

even though it didn't really bisect the right thing. Let me know if
there's a different/better way to give credit.

Brian
