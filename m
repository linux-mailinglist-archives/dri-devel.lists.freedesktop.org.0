Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 071F228FB13
	for <lists+dri-devel@lfdr.de>; Fri, 16 Oct 2020 00:19:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E993A6E060;
	Thu, 15 Oct 2020 22:19:24 +0000 (UTC)
X-Original-To: dri-devel@freedesktop.org
Delivered-To: dri-devel@freedesktop.org
Received: from mail-pl1-x644.google.com (mail-pl1-x644.google.com
 [IPv6:2607:f8b0:4864:20::644])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B6C0A89C56
 for <dri-devel@freedesktop.org>; Thu, 15 Oct 2020 22:19:23 +0000 (UTC)
Received: by mail-pl1-x644.google.com with SMTP id w11so141391pll.8
 for <dri-devel@freedesktop.org>; Thu, 15 Oct 2020 15:19:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=QjDY/OXe3F1IcKvWQFSP6gxpaDEaOlXYjXWDXlLnfbw=;
 b=OPa+LpTPSyeUIRS+0srXLfp9xueNLSmd/1DKENmwi8xQI+fnDfQzCSHjZUFahJ3daz
 CitKC9o18koCiq7fjTNQUdy8Naye3WB42oyiKMNLCKLvZxnKzy4QZrdNLSGA9VYDjAQ+
 BJjWU3ZyWfnXa5hZ9Af0vI/7vVtQBAz0MrWdk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=QjDY/OXe3F1IcKvWQFSP6gxpaDEaOlXYjXWDXlLnfbw=;
 b=a7evt1yU+Q0w8OR5KfYcsoXueKevg+v+XoOVTBWSi1bd13yCgptzyrRiDLje/pwVhq
 hwImB8FSO452Ru/ylOvsObN4BNv2xuKiziuH43oibXlGI/Yz53Ew4B9e7mY3iR3GMwsN
 Vfe5JiVTNRzzsQ3jUBOpg6yHcxMoPiecq8OVjRTd9Vzihtms4ceo+6judv0Azy+PpOwV
 QNJ6+de6heTT8uvSUdtKJ/04StKr+vlrIC/Pb7y6UBjGH3tiuvjV7qnFpchF59+zypfq
 97ir8yHT3/SRV+5HdCwqKA9h865008paITWHc5FobqVdF9OTsBArYutDefcG424N/jXW
 c2rA==
X-Gm-Message-State: AOAM531BSXZemEKCzsVoyW3WyeGHuetv9nDSw7T1euDhUCRompdyZ6zk
 beVkizVPCfwTHwHOaSfF/1qGPA==
X-Google-Smtp-Source: ABdhPJy7zXS3x5G8mjljWvnvBGZKXs2QAfMPK7iOMKzSEJJ8bIR5FC63Ny0pseO77n8Ov//5DHYblA==
X-Received: by 2002:a17:90a:7787:: with SMTP id
 v7mr860769pjk.104.1602800363211; 
 Thu, 15 Oct 2020 15:19:23 -0700 (PDT)
Received: from localhost ([2620:15c:202:1:f693:9fff:fef4:e70a])
 by smtp.gmail.com with ESMTPSA id x10sm279283pfc.88.2020.10.15.15.19.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 15 Oct 2020 15:19:22 -0700 (PDT)
Date: Thu, 15 Oct 2020 15:19:20 -0700
From: Matthias Kaehlcke <mka@chromium.org>
To: manafm@codeaurora.org
Subject: Re: [PATCH 1/2] arm64: dts: qcom: sc7180: Add gpu cooling support
Message-ID: <20201015221920.GA1657396@google.com>
References: <1602176947-17385-1-git-send-email-akhilpo@codeaurora.org>
 <CAD=FV=WjWv040TyBaqU8ZAuxGi-YpJ2tsVcUbOV4Htv=_-n8fA@mail.gmail.com>
 <20201009165705.GA1292413@google.com>
 <fc490021-b046-68c5-7ceb-9c63d3ff5650@codeaurora.org>
 <a4be2cf9e51e4f40aae3f9a56989a42f@codeaurora.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <a4be2cf9e51e4f40aae3f9a56989a42f@codeaurora.org>
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
Cc: Doug Anderson <dianders@chromium.org>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 Amit Kucheria <amitk@kernel.org>, Akhil P Oommen <akhilpo@codeaurora.org>,
 LKML <linux-kernel@vger.kernel.org>, Rajeshwari <rkambl@codeaurora.org>,
 dri-devel@freedesktop.org, freedreno <freedreno@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Thu, Oct 15, 2020 at 12:07:01AM +0530, manafm@codeaurora.org wrote:
> On 2020-10-14 18:59, Akhil P Oommen wrote:
> > On 10/9/2020 10:27 PM, Matthias Kaehlcke wrote:
> > > On Fri, Oct 09, 2020 at 08:05:10AM -0700, Doug Anderson wrote:
> > > > Hi,
> > > > 
> > > > On Thu, Oct 8, 2020 at 10:10 AM Akhil P Oommen
> > > > <akhilpo@codeaurora.org> wrote:
> > > > > 
> > > > > Add cooling-cells property and the cooling maps for the gpu tzones
> > > > > to support GPU cooling.
> > > > > 
> > > > > Signed-off-by: Akhil P Oommen <akhilpo@codeaurora.org>
> > > > > ---
> > > > >   arch/arm64/boot/dts/qcom/sc7180.dtsi | 29
> > > > > ++++++++++++++++++++++-------
> > > > >   1 file changed, 22 insertions(+), 7 deletions(-)
> > > > > 
> > > > > diff --git a/arch/arm64/boot/dts/qcom/sc7180.dtsi
> > > > > b/arch/arm64/boot/dts/qcom/sc7180.dtsi
> > > > > index d46b383..40d6a28 100644
> > > > > --- a/arch/arm64/boot/dts/qcom/sc7180.dtsi
> > > > > +++ b/arch/arm64/boot/dts/qcom/sc7180.dtsi
> > > > > @@ -2,7 +2,7 @@
> > > > >   /*
> > > > >    * SC7180 SoC device tree source
> > > > >    *
> > > > > - * Copyright (c) 2019, The Linux Foundation. All rights reserved.
> > > > > + * Copyright (c) 2019-20, The Linux Foundation. All rights
> > > > > reserved.
> > > > >    */
> > > > > 
> > > > >   #include <dt-bindings/clock/qcom,dispcc-sc7180.h>
> > > > > @@ -1885,6 +1885,7 @@
> > > > >                          iommus = <&adreno_smmu 0>;
> > > > >                          operating-points-v2 = <&gpu_opp_table>;
> > > > >                          qcom,gmu = <&gmu>;
> > > > > +                       #cooling-cells = <2>;
> > > > 
> > > > Presumably we should add this to the devicetree bindings, too?
> > Yes, thanks for catching this. Will update in the next patch.
> > 
> > > > 
> > > > 
> > > > >                          interconnects = <&gem_noc
> > > > > MASTER_GFX3D &mc_virt SLAVE_EBI1>;
> > > > >                          interconnect-names = "gfx-mem";
> > > > > @@ -3825,16 +3826,16 @@
> > > > >                  };
> > > > > 
> > > > >                  gpuss0-thermal {
> > > > > -                       polling-delay-passive = <0>;
> > > > > +                       polling-delay-passive = <100>;
> > > > 
> > > > Why did you make this change?  I'm pretty sure that we _don't_ want
> > > > this since we're using interrupts for the thermal sensor.  See commit
> > > > 22337b91022d ("arm64: dts: qcom: sc7180: Changed polling mode in
> > > > Thermal-zones node").
> > > 
> > > I was going to ask the same, this shouldn't be needed.
> As per our understanding unlike "polling-delay",  this delay property is
> intended to activate polling thread on post trip threshold violation and  it
> is irrespective of sensor is capable for trip interrupt or not.
> This polling is more of governor related. Below are the few references from
> Documentation/code which tells polling-delay-passive is needed for IPA for
> better IPA performance.
> 
> As per Power allocator documentations
> 
> 1. https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/tree/Documentation/driver-api/thermal/power_allocator.rst?h=v5.4.71#n264
> 
> "The power allocator governor's PID controller works best if there is a
> periodic tick.  If you have a driver that calls
> `thermal_zone_device_update()` (or anything that ends up calling the
> governor's `throttle()` function) repetitively, the governor response
> won't be very good.  Note that this is not particular to this
> governor, step-wise will also misbehave if you call its throttle()
> faster than the normal thermal framework tick (due to interrupts for
> example) as it will overreact"
> 
> 2. In Power allocator code, when  switch_on/control trip temp violation, it
> is enabling passive counter to activate passive polling @ https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/tree/drivers/thermal/power_allocator.c?h=v5.4.71#n634
> 
> 3. while calculating derivative term, it is using passive_delay @
> https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/tree/drivers/thermal/power_allocator.c?h=v5.4.71#n243
> 
> 4. Sensor interrupt will work if temperature is fluctuating between
> trip_temp and hysteresis. But say a case where we are not enabling
> polling-delay-passive. In this case if  current temperature > control_temp
> trip(2nd passive trip) and
>  temperature trend is still raising, then sensor high trip will be disabled
> (OR configured for critical trip threshold). No more trip interrupt from
> sensor until it reaches critical trip or falls below control_temp
> hysteresis.
>  How  the governor re-evaluate its next mitigation without passive polling
> thread  here ?
> 
> I think the same is required for CPU thermal zone as well.

Thanks for the explication and pointers!

I ran some tests to re-confirm. For that I lowered the trip point temperatures
of CPU6 to 60/70, to make it easier to trigger throttling without necessarily
affecting the other CPUs. Further I enabled tracing for the events 'thermal_temperature',
'thermal_zone_trip' and 'thermal_power_allocator'. With that I ran a CPU
intensive task on CPU6.

Without polling-delay the trace log looks like this:

  irq/40-c263000.-157   [000] ....    48.035986: thermal_temperature: thermal_zone=cpu6-thermal id=6 temp_prev=57800 temp=60000
  irq/40-c263000.-157   [000] ....    48.036029: thermal_power_allocator_pid: thermal_zone_id=6 err=10000 err_integral=0 p=2402 i=0 d=0 output=1776
  irq/40-c263000.-157   [000] ....    48.036036: thermal_power_allocator: thermal_zone_id=6 req_power={{0x96}} total_req_power=150 granted_power={{0x6f0}} total_granted_power=1776 power_range=1776 max_allocatable_power=1776 current_temperature=60000 delta_temperature=10000
  irq/40-c263000.-157   [000] ....    52.480888: thermal_temperature: thermal_zone=cpu6-thermal id=6 temp_prev=60000 temp=70000
  irq/40-c263000.-157   [000] ....    52.480925: thermal_power_allocator_pid: thermal_zone_id=6 err=0 err_integral=0 p=0 i=0 d=0 output=1202
  irq/40-c263000.-157   [000] ....    52.480931: thermal_power_allocator: thermal_zone_id=6 req_power={{0x45e}} total_req_power=1118 granted_power={{0x4b2}} total_granted_power=1202 power_range=1202 max_allocatable_power=1776 current_temperature=70000 delta_temperature=0

i.e. power_allocator only acts on the sensor interrupts at the trip points

It looks different with a non-zero value for 'polling-delay-passive':

  irq/40-c263000.-156   [000] ....   104.501777: thermal_power_allocator: thermal_zone_id=6 req_power={{0x331}} total_req_power=817 granted_power={{0x591}} total_granted_power=1425 power_range=1425 max_allocatable_power=1776 current_temperature=67800 delta_temperature=2200
  irq/40-c263000.-156   [000] ....   104.523073: thermal_temperature: thermal_zone=cpu6-thermal id=6 temp_prev=67800 temp=70000
  irq/40-c263000.-156   [000] ....   104.523121: thermal_power_allocator_pid: thermal_zone_id=6 err=0 err_integral=-31200 p=0 i=-305 d=0 output=897
  irq/40-c263000.-156   [000] ....   104.523148: thermal_power_allocator: thermal_zone_id=6 req_power={{0x406}} total_req_power=1030 granted_power={{0x381}} total_granted_power=897 power_range=897 max_allocatable_power=1776 current_temperature=70000 delta_temperature=0
  irq/40-c263000.-156   [000] ....   104.608566: thermal_temperature: thermal_zone=cpu6-thermal id=6 temp_prev=70000 temp=67800
  irq/40-c263000.-156   [000] ....   104.608612: thermal_power_allocator_pid: thermal_zone_id=6 err=2200 err_integral=-31200 p=528 i=-305 d=0 output=1425
  irq/40-c263000.-156   [000] ....   104.608642: thermal_power_allocator: thermal_zone_id=6 req_power={{0x331}} total_req_power=817 granted_power={{0x591}} total_granted_power=1425 power_range=1425 max_allocatable_power=1776 current_temperature=67800 delta_temperature=2200
  irq/40-c263000.-156   [000] ....   104.630863: thermal_temperature: thermal_zone=cpu6-thermal id=6 temp_prev=67800 temp=70000
  irq/40-c263000.-156   [000] ....   104.630907: thermal_power_allocator_pid: thermal_zone_id=6 err=0 err_integral=-31200 p=0 i=-305 d=0 output=897
  irq/40-c263000.-156   [000] ....   104.630932: thermal_power_allocator: thermal_zone_id=6 req_power={{0x3f4}} total_req_power=1012 granted_power={{0x381}} total_granted_power=897 power_range=897 max_allocatable_power=1776 current_temperature=70000 delta_temperature=0
  irq/40-c263000.-156   [000] ....   104.687495: thermal_temperature: thermal_zone=cpu6-thermal id=6 temp_prev=70000 temp=67800
  irq/40-c263000.-156   [000] ....   104.687541: thermal_power_allocator_pid: thermal_zone_id=6 err=2200 err_integral=-31200 p=528 i=-305 d=0 output=1425
  irq/40-c263000.-156   [000] ....   104.687567: thermal_power_allocator: thermal_zone_id=6 req_power={{0x338}} total_req_power=824 granted_power={{0x591}} total_granted_power=1425 power_range=1425 max_allocatable_power=1776 current_temperature=67800 delta_temperature=2200
  irq/40-c263000.-156   [000] ....   104.711664: thermal_temperature: thermal_zone=cpu6-thermal id=6 temp_prev=67800 temp=70000

So it seems indeed the 'polling-delay-passive' is needed for better reactivity,
and it should also be re-added to the other thermal zones.

On a different note I first tried something similar on the GPU, the trip points
triggered, however there was no reaction from power_allocator, the reason is
that there is no power information for the GPU (num power actors = 0). It seems
it doesn' make sense to use IPA as long as there is no energy model (even if it
worked by using the lowest frequency as 'estimated power' throttling would
likely be overly aggressive). Since the trip point configuration for IPA and
'step_wise' (and probably others) is somewhat incompatible (IPA aims for a
temperature around the 2nd trip point, 'step_wise' interprets the first trip
point as limit) I think it makes sense to continue with a single trip point
for now.

Thanks

Matthias
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
