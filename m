Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A998517CD8D
	for <lists+dri-devel@lfdr.de>; Sat,  7 Mar 2020 11:15:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 557326E16D;
	Sat,  7 Mar 2020 10:15:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail26.static.mailgun.info (mail26.static.mailgun.info
 [104.130.122.26])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E834E6ECDC
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Mar 2020 11:41:30 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1583494893; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=gIcrcb+AYJXClFtK1B2gbZo5Y/fM6LFQWGlHyk1Ymk0=;
 b=MgibC45uf1BDXnyfr3CHeWvALABxmeieD4Y8uCHfvtHdflTFGWQzZdXQuJAidGv5UlXeoGzV
 9Ybz6W2nMS4DUu9YsxmASsANSppU4ieOKXgCdiL+YV1qxV9d8XmEa13WkOhDBgC9/2N/XkDj
 qe1DQvTXGcZWyj0+LLOO5Fha+QU=
X-Mailgun-Sending-Ip: 104.130.122.26
X-Mailgun-Sid: WyJkOTU5ZSIsICJkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5e6236dd.7fb06c4a8030-smtp-out-n01;
 Fri, 06 Mar 2020 11:41:17 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 2B880C433BA; Fri,  6 Mar 2020 11:41:17 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
 aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED
 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested) (Authenticated sender: harigovi)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 5B1A7C433F2;
 Fri,  6 Mar 2020 11:41:15 +0000 (UTC)
MIME-Version: 1.0
Date: Fri, 06 Mar 2020 17:11:15 +0530
From: harigovi@codeaurora.org
To: Doug Anderson <dianders@chromium.org>
Subject: Re: [v1] dt-bindings: msm:disp: update dsi and dpu bindings
In-Reply-To: <CAD=FV=XXyYTqVV4=e8Kz0tYQ=5TWjZi2QETNL_0BaFqKi5o0Cg@mail.gmail.com>
References: <1580825737-27189-1-git-send-email-harigovi@codeaurora.org>
 <CAD=FV=XXyYTqVV4=e8Kz0tYQ=5TWjZi2QETNL_0BaFqKi5o0Cg@mail.gmail.com>
Message-ID: <f24b45a36d2bd79c9d8053d29abef88d@codeaurora.org>
X-Sender: harigovi@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
X-Mailman-Approved-At: Sat, 07 Mar 2020 10:14:46 +0000
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
Cc: "open list:OPEN FIRMWARE AND FLATTENED
 DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 LKML <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, Sean Paul <seanpaul@chromium.org>,
 Kalyan Thota <kalyan_t@codeaurora.org>,
 "Kristian H. Kristensen" <hoegsberg@chromium.org>,
 freedreno <freedreno@lists.freedesktop.org>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2020-02-04 23:52, Doug Anderson wrote:
> Hi,
> 
> On Tue, Feb 4, 2020 at 6:15 AM Harigovindan P <harigovi@codeaurora.org> 
> wrote:
>> 
>> Updating bindings of dsi and dpu by adding and removing certain
>> properties.
>> 
>> Signed-off-by: Harigovindan P <harigovi@codeaurora.org>
>> ---
>> 
>> Changes in v1:
>>         - Adding "ahb" clock as a required property.
>>         - Adding "bus", "rot", "lut" as optional properties for sc7180 
>> device.
>>         - Removing properties from dsi bindings that are unused.
>>         - Removing power-domain property since DSI is the child node 
>> of MDSS
>>           and it will inherit supply from its parent.
>> 
>>  Documentation/devicetree/bindings/display/msm/dpu.txt | 7 +++++++
>>  Documentation/devicetree/bindings/display/msm/dsi.txt | 5 -----
>>  2 files changed, 7 insertions(+), 5 deletions(-)
>> 
>> diff --git a/Documentation/devicetree/bindings/display/msm/dpu.txt 
>> b/Documentation/devicetree/bindings/display/msm/dpu.txt
>> index 551ae26..dd58472a 100644
>> --- a/Documentation/devicetree/bindings/display/msm/dpu.txt
>> +++ b/Documentation/devicetree/bindings/display/msm/dpu.txt
>> @@ -19,6 +19,7 @@ Required properties:
>>    The following clocks are required:
>>    * "iface"
>>    * "bus"
>> +  * "ahb"
> 
> This is only required for sc7180?  ...or old SoCs should have had it
> all along too?
> 
> 
>>    * "core"
>>  - interrupts: interrupt signal from MDSS.
>>  - interrupt-controller: identifies the node as an interrupt 
>> controller.
>> @@ -50,6 +51,8 @@ Required properties:
>>  - clock-names: device clock names, must be in same order as clocks 
>> property.
>>    The following clocks are required.
>>    * "bus"
>> +  For the device "qcom,sc7180-dpu":
>> +  * "bus" - is an optional property due to architecture change.
> 
> This is a really odd way to write it for two reasons:
> * You're breaking up the flow of the list.
> * This shouldn't be listed as "optional" in sc7180 but unless there is
> some reason to ever provide it on sc7180.  It should simply be
> disallowed.
> 
> Maybe instead just:
> 
>    The following clocks are required.
> -  * "bus"
> +  * "bus" (anything other than qcom,sc7180-dpu)
> 
> We really need to get this into yaml ASAP but that'd probably be OK to
> tide us over.
> 
> NOTE: when converting to yaml, ideally we'll have a separate file per
> SoC to avoid crazy spaghetti, see commit 2a8aa18c1131 ("dt-bindings:
> clk: qcom: Fix self-validation, split, and clean cruft") in clk-next
> for an example of starting the transition to one yaml per SoC (at
> least for anything majorly different).
> 
> 
>>    * "iface"
>>    * "core"
>>    * "vsync"
>> @@ -70,6 +73,10 @@ Optional properties:
>>  - assigned-clocks: list of clock specifiers for clocks needing rate 
>> assignment
>>  - assigned-clock-rates: list of clock frequencies sorted in the same 
>> order as
>>    the assigned-clocks property.
>> +- For the device "qcom,sc7180-dpu":
>> +  clock-names: optional device clocks, needed for accessing LUT 
>> blocks.
>> +  * "rot"
>> +  * "lut"
>> 
>>  Example:
>> 
>> diff --git a/Documentation/devicetree/bindings/display/msm/dsi.txt 
>> b/Documentation/devicetree/bindings/display/msm/dsi.txt
>> index af95586..61d659a 100644
>> --- a/Documentation/devicetree/bindings/display/msm/dsi.txt
>> +++ b/Documentation/devicetree/bindings/display/msm/dsi.txt
>> @@ -8,13 +8,10 @@ Required properties:
>>  - reg-names: The names of register regions. The following regions are 
>> required:
>>    * "dsi_ctrl"
>>  - interrupts: The interrupt signal from the DSI block.
>> -- power-domains: Should be <&mmcc MDSS_GDSC>.
> 
> Is this supposed to be removed from all SoCs using this bindings, or
> just yours?
> 
> I'll also note that you left it in the "Example:" below.
> 
> 
>>  - clocks: Phandles to device clocks.
>>  - clock-names: the following clocks are required:
>> -  * "mdp_core"
>>    * "iface"
>>    * "bus"
>> -  * "core_mmss"
> 
> As Jeffrey pointed out, you shouldn't be removing these from old SoCs.
> In "drivers/gpu/drm/msm/dsi/dsi_cfg.c" you can clearly see them used.
> Maybe it's time for you to do the yaml conversion and handle this
> correctly per-SoC.
> 
> -Doug


Hi,

yaml files have been created and new patchset has been created for that.
https://patchwork.kernel.org/patch/11423653/
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
