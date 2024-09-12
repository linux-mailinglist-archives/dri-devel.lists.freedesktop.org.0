Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E877975E02
	for <lists+dri-devel@lfdr.de>; Thu, 12 Sep 2024 02:32:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 38D1B10E1CE;
	Thu, 12 Sep 2024 00:32:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="VJLrfeHH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com
 [209.85.216.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0EA9E10E1CE
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Sep 2024 00:32:52 +0000 (UTC)
Received: by mail-pj1-f51.google.com with SMTP id
 98e67ed59e1d1-2db89fb53f9so255546a91.3
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Sep 2024 17:32:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1726101172; x=1726705972; darn=lists.freedesktop.org;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=SKZEyt44VR45tEDkdt8w5XN/J7n2WVNZf8Ypo0GItMs=;
 b=VJLrfeHH3Oeh7sb/ODFQC78D5mxvxwvBdiY3GKc7qZNQQuJc5h6HCJFIDn5XkgHIVF
 zk5p78+a/+ZfrqR8rNJVwLlO+LRcW5F7cEViItSsSnQU7BPCV++Td5lPWjhXl7I6CXod
 /QYN/dhVjU2vOP7CQR4q7APmbz/bl2BLiOq1oaQ6/nF0PXfRmCNO6Dzz7DdmYjxxNDtf
 9wDPx+ptzVshX9QlbFpxgQxSbZiimpBNHLg4ZzlSz8PfjX+lmUraBfoXeUjzsZtlJm/V
 0QDOMnFwe7rdAJTievB9QCcXYfdcDDrk5XEXO8qUeZHPnKTOpNtIlZhIGyVmnqeCSFOA
 kMwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1726101172; x=1726705972;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=SKZEyt44VR45tEDkdt8w5XN/J7n2WVNZf8Ypo0GItMs=;
 b=SLIiBZlX/f2GPY05VZQVk619UfkyHuUwEQNlwDFprSfkm6mTE1NNtMDEqdwR544x5L
 JJxksWZBDVEhtPKslnllWkedV9yCsFRS0ShLI5GpvNNlXifuJPluceQXwRbf/nMlh1qr
 KHVmtnex6mclvQKBdNC2TzF7tQVdXhXdN/jItJUFFLIYfYbpb8kUGBvDDzvDx0g3b2vs
 QpW8zKOIDAfviwHwLvmP3GZ4f90imOCFSLtLthmgR2+rVtwEf05aI731CQ1qeEjueByd
 CoP0l44azG4afm9YKwVKtRE7FWYON8YEjK/AG9RehSSu/3udLXwqID4Mgv73xrUlwE2D
 Tsig==
X-Forwarded-Encrypted: i=1;
 AJvYcCUHeNiVoDiRRaCB7fP1Pkwzkm6n3zykmINIZhyshtzvKnU/tpPzLEGGHlvz5wzrts5HCHS7bdEkp2c=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwSxUWyD17MwU9fxI3T0nJbxAqPCmiCppDrA2KhL5Ev+TzyzJnJ
 IsdaXubylmdsz3+fjYatMCe86VXDrtExlROI/JGfa3u1ACSNW/Gs
X-Google-Smtp-Source: AGHT+IEgH2cPJRE+7cUpcfH5nDVc6jXnUwZOO9SUHd/CFnIKnwepS2Zg47yPsjrG6EoM1VCkqr4qWQ==
X-Received: by 2002:a17:90a:d344:b0:2c2:5f25:5490 with SMTP id
 98e67ed59e1d1-2dba0080aa4mr1030334a91.34.1726101172234; 
 Wed, 11 Sep 2024 17:32:52 -0700 (PDT)
Received: from embed-PC.myguest.virtualbox.org ([106.222.234.231])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-2dadc110527sm11236436a91.36.2024.09.11.17.32.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 Sep 2024 17:32:51 -0700 (PDT)
Date: Thu, 12 Sep 2024 06:02:46 +0530
From: Abhishek Tamboli <abhishektamboli9@gmail.com>
To: neil.armstrong@linaro.org
Cc: dianders@chromium.org, tejasvipin76@gmail.com,
 quic_jesszhan@quicinc.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com,
 daniel@ffwll.ch, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, javierm@redhat.com
Subject: Re: [PATCH] drm/panel: himax-hx83112a: transition to mipi_dsi
 wrapped functions
Message-ID: <ZuI2rrEzYCK9yDU7@embed-PC.myguest.virtualbox.org>
References: <20240904141521.554451-1-tejasvipin76@gmail.com>
 <0bb94cc0-dd72-4da7-b0b6-9e1fe712709b@quicinc.com>
 <0e3bf87b-7d82-44eb-88d2-fddc8e33dd25@quicinc.com>
 <330174f9-bead-4411-b05e-ea9c009f765c@gmail.com>
 <CAD=FV=XsHuhprN-ijw8-ZmOKV6CnCrR=s4X4L57p9J8e02MTBg@mail.gmail.com>
 <8f0227fb-1457-4464-810a-c6b915d9349a@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <8f0227fb-1457-4464-810a-c6b915d9349a@linaro.org>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Sep 11, 2024 at 09:41:30AM +0200, neil.armstrong@linaro.org wrote:
> On 10/09/2024 23:19, Doug Anderson wrote:
> > Hi,
> > 
> > On Sat, Sep 7, 2024 at 1:32 AM Tejas Vipin <tejasvipin76@gmail.com> wrote:
> > > 
> > > On 9/7/24 3:53 AM, Jessica Zhang wrote:
> > > > 
> > > > 
> > > > On 9/6/2024 3:14 PM, Jessica Zhang wrote:
> > > > > 
> > > > > 
> > > > > On 9/4/2024 7:15 AM, Tejas Vipin wrote:
> > > > > > Changes the himax-hx83112a panel to use multi style functions for
> > > > > > improved error handling.
> > > > > > 
> > > > > > Signed-off-by: Tejas Vipin <tejasvipin76@gmail.com>
> > > > > 
> > > > > Reviewed-by: Jessica Zhang <quic_jesszhan@quicinc.com>
> > > > 
> > > > Hi Tejas,
> > > > 
> > > > Just a heads up, it seems that this might be a duplicate of this change [1]?
> > > > 
> > > > Thanks,
> > > > 
> > > > Jessica Zhang
> > > > 
> > > > [1] https://patchwork.freedesktop.org/patch/612367/?series=138155&rev=1
> > > 
> > > Ah, thanks for letting me know. I hadn't realized someone else had
> > > started working on this too.
> > > 
> > > However, I would argue that my patch [2] is a better candidate for merging
> > > because of the following reasons:
> > > 
> > > 1) Removes unnecessary error printing:
> > > The mipi_dsi_*_multi() functions all have inbuilt error printing which
> > > makes printing errors after hx83112a_on unnecessary as is addressed in
> > > [2] like so:
> > > 
> > > > -     ret = hx83112a_on(ctx);
> > > > +     ret = hx83112a_on(ctx->dsi);
> > > >        if (ret < 0) {
> > > > -             dev_err(dev, "Failed to initialize panel: %d\n", ret);
> > > >                gpiod_set_value_cansleep(ctx->reset_gpio, 1);
> > > >                regulator_bulk_disable(ARRAY_SIZE(ctx->supplies), ctx->supplies);
> > > > -             return ret;
> > > >        }
> > > 
> > > [2] also removes the unnecessary dev_err after regulator_bulk_enable as was
> > > addressed in [3] like so:
> > > 
> > > >        ret = regulator_bulk_enable(ARRAY_SIZE(ctx->supplies), ctx->supplies);
> > > > -     if (ret < 0) {
> > > > -             dev_err(dev, "Failed to enable regulators: %d\n", ret);
> > > > +     if (ret < 0)
> > > >                return ret;
> > > > -     }
> > > 
> > > 2) Better formatting
> > > 
> > > The mipi_dsi_dcs_write_seq_multi statements in [1] aren't formatted
> > > quite right according to what has been done so far. They are written as
> > > such in [1]:
> > > 
> > > > +     mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83112A_SETTP1,
> > > >                               0x02, 0x00, 0xa8, 0x01, 0xa8, 0x0d, 0xa4, 0x0e);
> > > 
> > > Where they should be written as such in [2]:
> > > 
> > > > +     mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83112A_SETTP1,
> > > > +                                  0x02, 0x00, 0xa8, 0x01, 0xa8, 0x0d, 0xa4, 0x0e);
> > > 
> > > All in all, the module generated using my patch ends up being a teensy
> > > bit smaller (1% smaller). But if chronology is what is important, then
> > > it would at least be nice to see the above changes as part of Abhishek's
> > > patch too. And I'll be sure to look at the mail in the drm inbox now
> > > onwards :p
> > > 
> > > [1] https://patchwork.freedesktop.org/patch/612367/?series=138155&rev=1
> > > [2] https://lore.kernel.org/all/20240904141521.554451-1-tejasvipin76@gmail.com/
> > > [3] https://lore.kernel.org/all/CAD=FV=XRZKL_ppjUKDK61fQkWhHiQCJLfmVBS7wSo4sUux2g8Q@mail.gmail.com/
> > 
> > I would tend to agree that Tejas's patch looks slightly better, but
> > Abhishek's patch appears to have been posted first.
> > 
> > Neil: any idea what to do here? Maybe a Co-Developed-by or something?
> > ...or we could land Abhishek and Tejas could post a followup for the
> > extra cleanup?
> 
> Yeah usually I take the first one when they are equal, but indeed Tejas
> cleanup up a little further and better aligned the parameters so I think
> Tejas's one is a better looking version.
> 
> In this case we should apply Teja's one, nothing personal Abhishek!
No problem at all, I completely understand. It makes sense to go with 
Tejas's version.

Thanks for letting me know, and I appreciate the feedback!

Regards,
Abhishek
