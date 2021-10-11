Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7748B42931C
	for <lists+dri-devel@lfdr.de>; Mon, 11 Oct 2021 17:25:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E8F0E6E519;
	Mon, 11 Oct 2021 15:25:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from so254-9.mailgun.net (so254-9.mailgun.net [198.61.254.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1C3CD6E519
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Oct 2021 15:25:01 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1633965903; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=/Fnrpv0UZJQ/G5vlRiV4cIFXd3fhNXygriIiiQzzuUg=;
 b=Hs+xeoZs5+NqmVfG6Jc966di2CyQh/4NJhTlLsIDgf5F/fepmumQzEjbrn94D11UjurXNMQi
 gyINGaOiGacM3jLvKbr2Szbxnu0yxkdUQyZbAXzDnAhjMHcBI9P2EIhudCUIFFjrY5kMqxS4
 clWmaQZkzLal/JMtMS5MCLyTIzE=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyJkOTU5ZSIsICJkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n01.prod.us-west-2.postgun.com with SMTP id
 6164573a03355859c8fe9362 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Mon, 11 Oct 2021 15:24:42
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id C8F29C4360C; Mon, 11 Oct 2021 15:24:42 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
 aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,
 URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested) (Authenticated sender: khsieh)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 8B1E5C4338F;
 Mon, 11 Oct 2021 15:24:41 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date: Mon, 11 Oct 2021 08:24:41 -0700
From: khsieh@codeaurora.org
To: Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: Stephen Boyd <swboyd@chromium.org>, Abhinav Kumar
 <abhinavk@codeaurora.org>, Daniel Vetter <daniel@ffwll.ch>, David Airlie
 <airlied@linux.ie>, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Rob
 Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, Sankeerth
 Billakanti <sbillaka@codeaurora.org>
Subject: Re: [PATCH] drm/msm/dp: Shorten SETUP timeout
In-Reply-To: <YWB1cXoaGRXfGau1@ripper>
References: <CAE-0n53FC7JCCJoye_uKeqaLKrZeHXLtvObxWFedaUzjirmBaA@mail.gmail.com>
 <a4a4980e586a70e3b7de989bc61a3e33@codeaurora.org> <YV0FlTyMEzlyNsN9@ripper>
 <3dbe0fe48da88af9dee396a85b940e76@codeaurora.org> <YV3dddt/GOidTmlN@ripper>
 <9dc50145fb3e9b189fd38857b20f326a@codeaurora.org> <YV9TQEKPh4SXYFF/@ripper>
 <0c72f3fd8c49cdada09bb6ee366b53a6@codeaurora.org>
 <CAE-0n51bvKXmHj0X_cvR2fdk4-mh4SRsrEE33H0e1Q+p=7iPxA@mail.gmail.com>
 <ad244133bdba4570b0b45871fd136350@codeaurora.org> <YWB1cXoaGRXfGau1@ripper>
Message-ID: <44ffcac32270a8ea72dcfc044e2b2585@codeaurora.org>
X-Sender: khsieh@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
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

On 2021-10-08 09:44, Bjorn Andersson wrote:
> On Fri 08 Oct 09:07 PDT 2021, khsieh@codeaurora.org wrote:
> 
>> On 2021-10-07 15:34, Stephen Boyd wrote:
>> > Quoting khsieh@codeaurora.org (2021-10-07 13:28:12)
>> > > On 2021-10-07 13:06, Bjorn Andersson wrote:
>> > > > On Thu 07 Oct 12:51 PDT 2021, khsieh@codeaurora.org wrote:
>> > > >
>> > > >> On 2021-10-06 10:31, Bjorn Andersson wrote:
>> > > >> > On Wed 06 Oct 08:37 PDT 2021, khsieh@codeaurora.org wrote:
>> > > >> >
>> > > >> > > On 2021-10-05 19:10, Bjorn Andersson wrote:
>> > > >> > > > On Tue 05 Oct 16:04 PDT 2021, khsieh@codeaurora.org wrote:
>> > > >> > > >
>> > > >> > > > > On 2021-10-05 15:36, Stephen Boyd wrote:
>> > > >> > > > > > Quoting Bjorn Andersson (2021-10-05 14:40:38)
>> > > >> > > > > > > On Tue 05 Oct 11:45 PDT 2021, Stephen Boyd wrote:
>> > > >> > > > > > >
>> > > >> > > > > > > > Quoting Bjorn Andersson (2021-10-04 19:37:50)
>> > > >> > > > > > > > > Found in the middle of a patch from Sankeerth was the reduction of the
>> > > >> > > > > > > > > INIT_SETUP timeout from 10s to 100ms. Upon INIT_SETUP timeout the host
>> > > >> > > > > > > > > is initalized and HPD interrupt start to be serviced, so in the case of
>> > > >> > > > > > > > > eDP this reduction improves the user experience dramatically - i.e.
>> > > >> > > > > > > > > removes 9.9s of bland screen time at boot.
>> > > >> > > > > > > > >
>> > > >> > > > > > > > > Suggested-by: Sankeerth Billakanti <sbillaka@codeaurora.org>
>> > > >> > > > > > > > > Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
>> > > >> > > > > > > > > ---
>> > > >> > > > > > > >
>> > > >> > > > > > > > Any Fixes tag? BTW, the delay design is pretty convoluted. I had to go
>> > > >> > > > > > > > re-read the code a couple times to understand that it's waiting 100ms
>> > > >> > > > > > > > times the 'delay' number. Whaaaaat?
>> > > >> > > > > > > >
>> > > >> > > > > > >
>> > > >> > > > > > > I assume you're happy with the current 10s delay on the current
>> > > >> > > > > > > devices, so I don't think we should push for this to be backported.
>> > > >> > > > > > > I have no need for it to be backported on my side at least.
>> > > >> > > > > > >
>> > > >> > > > > >
>> > > >> > > > > > Sure. Fixes tag != backported to stable trees but it is close.
>> > > >> > > > > >
>> > > >> > > > > > > > Reviewed-by: Stephen Boyd <swboyd@chromium.org>
>> > > >> > > > > > >
>> > > >> > > > >   dp_add_event(dp, EV_HPD_INIT_SETUP, 0, 1); <== to 100ms
>> > > >> > > > >
>> > > >> > > > > This patch will prevent usb3 from working due to dp driver
>> > > >> > > > > initialize phy
>> > > >> > > > > earlier than usb3 which cause timeout error at power up usb3 phy
>> > > >> > > > > when both
>> > > >> > > > > edp and dp are enabled.
>> > > >> > > >
>> > > >> > > > Can you please help me understand what you mean here, I use this on my
>> > > >> > > > sc8180x with both eDP and USB-C/DP right now. What is it that doesn't
>> > > >> > > > work? Or am I just lucky in some race condition?
>> > > >> > > >
>> > > >> > > > Thanks,
>> > > >> > > > Bjorn
>> > > >> > > >
>> > > >> > > The problem is seen at sc7280.
>> > > >> > > Apple dongle have both  hdmi and usb port.
>> > > >> > > plug Apple dongle into type-c, then plug DP into apple's hdmi port
>> > > >> > > and usb
>> > > >> > > mouse into apple's usb port.
>> > > >> > > If edp enabled at this time, then usb mouse will not work due to
>> > > >> > > timeout at
>> > > >> > > phy power up.
>> > > >> > >
>> > > >> >
>> > > >> > Okay, so you're saying that if the DP driver invokes phy_power_on()
>> > > >> > before the USB driver does, USB initialization fails (or at least USB
>> > > >> > doesn't work)?
>> > > >>
>> > > >> if dp driver call qcom_qmp_phy_init() before usb3 call
>> > > >> qcom_qmp_phy_init(),
>> > > >> usb3 driver will timeout at readl_poll_timeout(status, val, (val &
>> > > >> mask) ==
>> > > >> ready, 10, PHY_INIT_COMPLETE_TIMEOUT) of qcom_qmp_phy_power_on().
>> > > >
>> > > > Thanks, I will try to reproduce this on my side. So the 10 seconds here
>> > > > is strictly to give good enough time for the dwc3 driver to probe...
>> > > >
>> > > > Any idea why you're saying that this is specific to sc7280, what
>> > > > changed
>> > > > from sc7180?
>> > >
>> > > I did not have sc7180 with edp before so that i am not sure it will
>> > > happen on sc7180 or not.
>> > > The usb3 does not work when both edp and dp enabled I just seen at
>> > > sc7280.
>> > > Current at sc7280 EC is not boot up correctly when system power up.
>> > > I have to manual reboot EC from linux kernel shell before DP/usb3 can
>> > > work.
>> > > I am not sure this contribute to this problem or not.
>> > >
>> >
>> > Can you make the usb driver into a module and only load that module
>> > later in boot after the DP driver calls qcom_qmp_phy_init()? That would
>> > be an easy way to move usb probe after DP probe and expose this problem.
>> 
>> we need usb calls qcom_qmp_phy_init() before dp.
> 
> Why?
I do not know the details.
But I did see below scenario,

if dp driver call qcom_qmp_phy_init() before usb3 call
qcom_qmp_phy_init(),
usb3 driver will timeout at readl_poll_timeout(status, val, (val &
mask) ==
ready, 10, PHY_INIT_COMPLETE_TIMEOUT) of qcom_qmp_phy_power_on().
