Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 11BD0178BDB
	for <lists+dri-devel@lfdr.de>; Wed,  4 Mar 2020 08:48:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8DE386EADC;
	Wed,  4 Mar 2020 07:47:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd41.google.com (mail-io1-xd41.google.com
 [IPv6:2607:f8b0:4864:20::d41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7BB40895F5;
 Tue,  3 Mar 2020 15:50:40 +0000 (UTC)
Received: by mail-io1-xd41.google.com with SMTP id z190so4111748iof.1;
 Tue, 03 Mar 2020 07:50:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
 bh=j84Ru6YRyjy8XrpWWMZUKiBSMz/kERSXjre3xUJKPDg=;
 b=pkYTx01VXtKQhEMhRomlMVQuLbt7IhCU5ZQQK22nxQmGLUnOYyZ5PXHNgn0xXnn1n/
 DU9CRzyQ8tmin67ugHIjaComXw/SUBy954YiMIV2zJcJeUt4wZu1ygd7EvH2uC+mV2Ow
 QoV3wSESA7vNTO+cNH/Pt3ScDRd6WwoRv7uIGqi0cMoX+u2Xx6LLZYs+XlpboUG1qe2k
 rDGC4JC6MoNGmFJqX69L7ftUEU1nkTAXeobJomiBRkYhLAXfp2IQYQUfu90EMWLwS24E
 FpD64jZakOTvJ+rQ4jY3+sV2ySBLfvwN9Ej8tz9Xgi2cxryHYrnJL6FH8h/Gv4Cnk4q4
 M51A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to;
 bh=j84Ru6YRyjy8XrpWWMZUKiBSMz/kERSXjre3xUJKPDg=;
 b=NcziLh+RHIair4L04mfv6h3mVtBuySQsVV6utVkwlozPkhI16PJ7I6sDpJfByGJTdR
 nIfcu+AKdBZKktCauaUBiHvxEEHvuQSCzzynz0NbT/4OLfmAviMlFylHLEOCDTTx9r6o
 J7G8HEIYAjckQUiB7PycLFKbgwlTKuc81kyJN3UaedrDfWedYuhnDW1TbIvaKe2VRUgw
 AbmQx9ZsugQeXqshJtRkBbGccKvYlmGhP4jVV4JmtTg5luKpWQ/goBuPAtEnY1YdBsdU
 au87WkNCZGmsVorfpBj7yJwVKbNKFI8AKuguqa0EaSRdohY/F250cNuJQlXNyj3hngeA
 NkBg==
X-Gm-Message-State: ANhLgQ3qZU4Ef5CeNKOKky0HB5ZGhNUX1lkKGaCNGggd1wKCkhfGr78y
 NAMEiSVyv+SjeXwSnZPHCMDpKgLzY8R7+K1NTt0=
X-Google-Smtp-Source: ADFU+vtkDzcIE96OybJSZPHz/P0vEwxM7/TnkT+i8lH4nDVIs2TL2oKe61GMFc4z8vHV4/9eLwi+YH6Fw29L+N6G83k=
X-Received: by 2002:a02:cf0f:: with SMTP id q15mr4685504jar.48.1583250639785; 
 Tue, 03 Mar 2020 07:50:39 -0800 (PST)
MIME-Version: 1.0
References: <1583173424-21832-1-git-send-email-jcrouse@codeaurora.org>
 <1583173424-21832-2-git-send-email-jcrouse@codeaurora.org>
 <20200302204906.GA32123@ravnborg.org>
 <20200303154321.GA24212@jcrouse1-lnx.qualcomm.com>
In-Reply-To: <20200303154321.GA24212@jcrouse1-lnx.qualcomm.com>
From: Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
Date: Tue, 3 Mar 2020 08:50:28 -0700
Message-ID: <CAOCk7NpP8chviZ0eM_4Fm3b2Jn+ngtVq=EYB=7yMK0H7rnfWMg@mail.gmail.com>
Subject: Re: [Freedreno] [PATCH v3 1/2] dt-bindings: display: msm: Convert GMU
 bindings to YAML
To: Sam Ravnborg <sam@ravnborg.org>, Sean Paul <sean@poorly.run>,
 DTML <devicetree@vger.kernel.org>, 
 David Airlie <airlied@linux.ie>, MSM <linux-arm-msm@vger.kernel.org>, 
 Sharat Masetty <smasetty@codeaurora.org>, lkml <linux-kernel@vger.kernel.org>, 
 "open list:DRM PANEL DRIVERS" <dri-devel@lists.freedesktop.org>,
 Rob Herring <robh+dt@kernel.org>, 
 freedreno <freedreno@lists.freedesktop.org>,
 Brian Masney <masneyb@onstation.org>
X-Mailman-Approved-At: Wed, 04 Mar 2020 07:47:28 +0000
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Mar 3, 2020 at 8:43 AM Jordan Crouse <jcrouse@codeaurora.org> wrote:
>
> On Mon, Mar 02, 2020 at 09:49:06PM +0100, Sam Ravnborg wrote:
> > Hi Jordan.
> >
> > On Mon, Mar 02, 2020 at 11:23:43AM -0700, Jordan Crouse wrote:
> > > Convert display/msm/gmu.txt to display/msm/gmu.yaml and remove the old
> > > text bindings.
> > >
> > > Signed-off-by: Jordan Crouse <jcrouse@codeaurora.org>
> > > ---
> > >
> > >  .../devicetree/bindings/display/msm/gmu.txt        | 116 -------------------
> > > -
> > > -Required properties:
> > > -- compatible: "qcom,adreno-gmu-XYZ.W", "qcom,adreno-gmu"
> > > -    for example: "qcom,adreno-gmu-630.2", "qcom,adreno-gmu"
> > > -  Note that you need to list the less specific "qcom,adreno-gmu"
> > > -  for generic matches and the more specific identifier to identify
> > > -  the specific device.
> > > -- reg: Physical base address and length of the GMU registers.
> > > -- reg-names: Matching names for the register regions
> > > -  * "gmu"
> > > -  * "gmu_pdc"
> > > -  * "gmu_pdc_seg"
> > > -- interrupts: The interrupt signals from the GMU.
> > > -- interrupt-names: Matching names for the interrupts
> > > -  * "hfi"
> > > -  * "gmu"
> > > -- clocks: phandles to the device clocks
> > > -- clock-names: Matching names for the clocks
> > > -   * "gmu"
> > > -   * "cxo"
> > > -   * "axi"
> > > -   * "mnoc"
> > The new binding - and arch/arm64/boot/dts/qcom/sdm845.dtsi agrees that
> > "mnoc" is wrong.
> >
> > > -- power-domains: should be:
> > > -   <&clock_gpucc GPU_CX_GDSC>
> > > -   <&clock_gpucc GPU_GX_GDSC>
> > > -- power-domain-names: Matching names for the power domains
> > > -- iommus: phandle to the adreno iommu
> > > -- operating-points-v2: phandle to the OPP operating points
> > > -
> > > -Optional properties:
> > > -- sram: phandle to the On Chip Memory (OCMEM) that's present on some Snapdragon
> > > -        SoCs. See Documentation/devicetree/bindings/sram/qcom,ocmem.yaml.
> > This property is not included in the new binding.
>
> Yeah, that guy shouldn't be here. I'm not sure how it got there in the first
> place but I'll update the commit log. Thanks for the poke.

I thought this was something Brian M added for older targets (A4XX?).
Perhaps he should chime in?

>
> Jordan
>
> > Everything else looked fine to me.
> > With sram added - or expalined in commit why it is dropped:
> > Acked-by: Sam Ravnborg <sam@ravnborg.org>
> >
> >       Sam
> > _______________________________________________
> > Freedreno mailing list
> > Freedreno@lists.freedesktop.org
> > https://lists.freedesktop.org/mailman/listinfo/freedreno
>
> --
> The Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
> a Linux Foundation Collaborative Project
> _______________________________________________
> Freedreno mailing list
> Freedreno@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/freedreno
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
