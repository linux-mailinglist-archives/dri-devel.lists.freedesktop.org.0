Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 42195190718
	for <lists+dri-devel@lfdr.de>; Tue, 24 Mar 2020 09:09:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A55EA6E444;
	Tue, 24 Mar 2020 08:09:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail26.static.mailgun.info (mail26.static.mailgun.info
 [104.130.122.26])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C58978984F
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Mar 2020 15:36:20 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1584977783; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=wijimHVzaAPkYdmKEb1ozTEK2M9kYeLXNSo3279w37s=;
 b=XTlDQT2QHIjIuZVMJJPNbfxJUvGIPVNh+xA8dkc7TAMq7KzV9Ojjx3wo9TZiKiIVJfFFa5Uv
 keQ/CU2CWMgvR0DIP+i5ZpdWN9BkB3BI06T++9WJGVixBeDRshhHXLoStbbsRXrlC08xZBHV
 L3ehTVsvmUAgxL398NgS/bX9uT0=
X-Mailgun-Sending-Ip: 104.130.122.26
X-Mailgun-Sid: WyJkOTU5ZSIsICJkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5e78d76c.7f8c2d4a6b20-smtp-out-n05;
 Mon, 23 Mar 2020 15:36:12 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 96276C44788; Mon, 23 Mar 2020 15:36:12 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
 aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,URIBL_BLOCKED
 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested) (Authenticated sender: kgunda)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id D7712C433D2;
 Mon, 23 Mar 2020 15:36:11 +0000 (UTC)
MIME-Version: 1.0
Date: Mon, 23 Mar 2020 21:06:11 +0530
From: kgunda@codeaurora.org
To: Daniel Thompson <daniel.thompson@linaro.org>
Subject: Re: [PATCH V3 2/4] backlight: qcom-wled: Add callback functions
In-Reply-To: <20200311103047.v7rt5ii3saack22a@holly.lan>
References: <1583760362-26978-1-git-send-email-kgunda@codeaurora.org>
 <1583760362-26978-3-git-send-email-kgunda@codeaurora.org>
 <20200310152719.5hpzh6osq22y4qbn@holly.lan>
 <05ab744dfbd83b6704bd394ce3c3dfc9@codeaurora.org>
 <20200311103047.v7rt5ii3saack22a@holly.lan>
Message-ID: <45964027ff388aec97d27f579d96c012@codeaurora.org>
X-Sender: kgunda@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
X-Mailman-Approved-At: Tue, 24 Mar 2020 08:09:16 +0000
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
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org,
 linux-fbdev@vger.kernel.org, b.zolnierkie@samsung.com, jingoohan1@gmail.com,
 Andy Gross <agross@kernel.org>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, bjorn.andersson@linaro.org,
 robh+dt@kernel.org, jacek.anaszewski@gmail.com, pavel@ucw.cz,
 linux-arm-msm@vger.kernel.org, lee.jones@linaro.org,
 linux-arm-msm-owner@vger.kernel.org, linux-leds@vger.kernel.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2020-03-11 16:00, Daniel Thompson wrote:
> On Wed, Mar 11, 2020 at 12:11:00PM +0530, kgunda@codeaurora.org wrote:
>> On 2020-03-10 20:57, Daniel Thompson wrote:
>> > On Mon, Mar 09, 2020 at 06:56:00PM +0530, Kiran Gunda wrote:
>> > > Add cabc_config, sync_toggle, wled_ovp_fault_status and wled_ovp_delay
>> > > callback functions to prepare the driver for adding WLED5 support.
>> > >
>> > > Signed-off-by: Kiran Gunda <kgunda@codeaurora.org>
>> >
>> > Overall this code would a lot easier to review if
>> > > ---
>> > >  drivers/video/backlight/qcom-wled.c | 196
>> > > +++++++++++++++++++++++-------------
>> > >  1 file changed, 126 insertions(+), 70 deletions(-)
>> > >
>> > > diff --git a/drivers/video/backlight/qcom-wled.c
>> > > b/drivers/video/backlight/qcom-wled.c
>> > > index 3d276b3..b73f273 100644
>> > > --- a/drivers/video/backlight/qcom-wled.c
>> > > +++ b/drivers/video/backlight/qcom-wled.c
>> > > @@ -128,6 +128,7 @@ struct wled_config {
>> > >  	bool cs_out_en;
>> > >  	bool ext_gen;
>> > >  	bool cabc;
>> > > +	bool en_cabc;
>> >
>> > Does this ever get set to true?
>> >
>> Yes. If user wants use the cabc pin to control the brightness and
>> use the "qcom,cabc" DT property in the device tree.
> 
> That sounds like what you intended the code to do!
> 
> Is the code that does this present in the patch? I could not find
> it.
> 
okay... It's my bad. We already have the "cabc" for this. I will remove 
the en_cabc in
next series.
> 
> Daniel.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
