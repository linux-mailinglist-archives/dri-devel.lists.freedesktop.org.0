Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A844089DCB7
	for <lists+dri-devel@lfdr.de>; Tue,  9 Apr 2024 16:39:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 93E6F1123AF;
	Tue,  9 Apr 2024 14:39:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="kF9Jj5Bi";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com
 [209.85.167.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B565210FD11
 for <dri-devel@lists.freedesktop.org>; Tue,  9 Apr 2024 14:39:41 +0000 (UTC)
Received: by mail-lf1-f53.google.com with SMTP id
 2adb3069b0e04-516cdb21b34so7236890e87.1
 for <dri-devel@lists.freedesktop.org>; Tue, 09 Apr 2024 07:39:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1712673580; x=1713278380; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=Sr9qt0BbADGa89YCYwT+Bbk+dGM/AHSN1tyvYdeWW7E=;
 b=kF9Jj5Bifq8bovSoaAGKMua2uz4gqRKAI/u4QsWSqz6DvmZrdIZx81TZerQrFCP/MH
 PAU5XpMm8OZfkjRM59543luNF2+bOLRVdVBE5ErsUrpNh61BY4DSKOzYtt/XIQ4VDb57
 6bGEcCmGAJr6E6aRAagViiXLgxXtmbuuOls1AGOv6jAJ57laKUCTVkuDfVBPO3//EtZA
 pL72qUIj61HCoDd5XC/8YjiOL6XGzZTi3o5sHPsNhRiIqt/mh0ri2X9dEPzQ+TgmFfVM
 Qm0kPU/P6TFIo8B0Vp/g+S410UgzIMPQw157rCp+5at5HrjLNrGqMfQWy3AiKwtMgN7h
 5jvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1712673580; x=1713278380;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Sr9qt0BbADGa89YCYwT+Bbk+dGM/AHSN1tyvYdeWW7E=;
 b=A97bJrmVns5bNI2QXvyvln7JTcxGcODuHtpuDpBcL3vWVrLqOTTc6r7qiDTmNQsm5i
 QzUTB3RMIcgma7UKW2tR4JT8p7tpbLFamtiK36BPZqiI87y5JNc55M2nXQDJuWs4gR5D
 JmBiBa2/F6kF2KFYcmjSXe+Rj4uQ2ZdGq2TOfYJePj2O4c62DnihLLmTB6FqpndhyWAD
 6ERUWCYDVzLXoSad4U69VUcHAylu3X57i4L1pqNpUEqGX3DPEd5GNOSzS/T5xQnGSFsh
 ydjSHHuCL/fui8MrSwmmZZgsHfb10in8QBFPJjWGzDt1kbVE518B9lg2SwYM4IayrB1s
 w1Ug==
X-Forwarded-Encrypted: i=1;
 AJvYcCXTHsiongwL370z1NSHWRHTml4uKfelIYT4E8wX3v6M6O5AAJd2lMDrlQl6JWx9Fng/bFfLS5u5/tYg33tmRC4a18tKMmWP0VK0ZBgATmcj
X-Gm-Message-State: AOJu0YxnkIrsApjDHv6Tx/UWeIawss6xD2xaYFeGYbe6sYspPXfUvyQU
 7t/9ismUZKK0Wc22+vhns1dKcxz2xWx2mOArSJyU8JNWYzeavW0M6k9+9xZSP7k=
X-Google-Smtp-Source: AGHT+IFhmq1jH49fs/wNDP2DWefgXDYDOHbmwLUoOSnTyawe10DQy5StJWx9djPeA8rjMN8setjnjA==
X-Received: by 2002:ac2:59d0:0:b0:516:cd83:71ce with SMTP id
 x16-20020ac259d0000000b00516cd8371cemr7651841lfn.31.1712673579685; 
 Tue, 09 Apr 2024 07:39:39 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (dzyjmhyyyyyyyyyyyykxt-3.rev.dnainternet.fi. [2001:14ba:a00e:a300::227])
 by smtp.gmail.com with ESMTPSA id
 i16-20020ac25230000000b00513d13ede82sm1561676lfl.147.2024.04.09.07.39.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Apr 2024 07:39:39 -0700 (PDT)
Date: Tue, 9 Apr 2024 17:39:37 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 freedreno@lists.freedesktop.org, Rob Clark <robdclark@gmail.com>,
 Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, 
 Daniel Vetter <daniel@ffwll.ch>, Kuogee Hsieh <quic_khsieh@quicinc.com>, 
 dri-devel@lists.freedesktop.org, seanpaul@chromium.org, swboyd@chromium.org, 
 quic_jesszhan@quicinc.com, quic_bjorande@quicinc.com, johan@kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] drm/msm/dp: call dp_hpd_plug_handle()/unplug_handle()
 directly for external HPD
Message-ID: <d4gcj4dg5vv5wd72kj7lpzs5cy7b2a4gh4t4lixuigwfkpwt3s@4toc3fpqycwi>
References: <20240406031548.25829-1-quic_abhinavk@quicinc.com>
 <ale6wbwzkfagcg2q6glb4vsxu3pthhkk3tquv2ixlatbdryqvh@xscsq2h6emho>
 <01cb1c0d-a801-37f9-2f55-2bbd8d3a68b9@quicinc.com>
 <CAA8EJprzH0LiWNx9Udt6og3G063odY6ccvaAgsNS1r3zG8TmdA@mail.gmail.com>
 <905222ad-612a-3eaf-d966-23c89c99e1f0@quicinc.com>
 <CAA8EJpp6Lc7sc5fnKp+O8TYdaywiE+dZ=YJin351s=r5rxi+Kw@mail.gmail.com>
 <covjipaso7bhgiifb62vdh24dpadr7kdypl2dleg7a2vc4jwjd@s4ci5xc6qpa3>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <covjipaso7bhgiifb62vdh24dpadr7kdypl2dleg7a2vc4jwjd@s4ci5xc6qpa3>
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

On Mon, Apr 08, 2024 at 09:33:01PM -0500, Bjorn Andersson wrote:
> On Tue, Apr 09, 2024 at 01:07:57AM +0300, Dmitry Baryshkov wrote:
> > On Tue, 9 Apr 2024 at 00:23, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
> > > On 4/8/2024 2:12 PM, Dmitry Baryshkov wrote:
> > > > On Mon, 8 Apr 2024 at 22:43, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
> > > >> On 4/7/2024 11:48 AM, Bjorn Andersson wrote:
> > > >>> On Fri, Apr 05, 2024 at 08:15:47PM -0700, Abhinav Kumar wrote:
> > > >>>> From: Kuogee Hsieh <quic_khsieh@quicinc.com>
> > > >>> [..]
> > > >>>> diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
> [..]
> > > >>
> > > >> I will need sometime to address that use-case as I need to see if we can
> > > >> handle that better and then drop the the DISCONNECT_PENDING state to
> > > >> address this fully. But it needs more testing.
> > > >>
> > > >> But, we will need this patch anyway because without this we will not be
> > > >> able to fix even the most regular and commonly seen case of basic
> > > >> connect/disconnect receiving complementary events.
> > > >
> > > > Hmm, no. We need to drop the HPD state machine, not to patch it. Once
> > > > the driver has proper detect() callback, there will be no
> > > > complementary events. That is a proper way to fix the code, not these
> > > > kinds of band-aids patches.
> > > >
> > >
> > > I had discussed this part too :)
> > >
> > > I totally agree we should fix .detect()'s behavior to just match cable
> > > connect/disconnect and not link_ready status.
> > >
> > > But that alone would not have fixed this issue. If HPD thread does not
> > > get scheduled and plug_handle() was not executed, .detect() would have
> > > still returned old status as we will update the cable status only in
> > > plug_handle() / unplug_handle() to have a common API between internal
> > > and external hpd execution.
> > 
> > I think there should be just hpd_notify, which if the HPD is up,
> > attempts to read the DPCD. No need for separate plug/unplug_handle.
> > The detect() can be as simple as !drm_dp_is_branch() || sink_count != 0.
> > 
> 
> What is detect() supposed to return in the event that we have external
> HPD handler? The link state? While the external HPD bridge would return
> the HPD state?

It should return the same: there is a sensible display attached. Other
drivers (and drm/msm/dp internally) use !branch || (sink_count > 0).

> If a driver only drives the link inbetween atomic_enable() and
> atomic_disable() will the "connected state" then ever be reported as
> "connected"? (I'm sure I'm still missing pieces of this puzzle).

I don't probably get the question. Nothing stops the driver from
accessing the AUX bus outside of the atomic_enable/disable() brackets.

> 
> Regards,
> Bjorn

-- 
With best wishes
Dmitry
