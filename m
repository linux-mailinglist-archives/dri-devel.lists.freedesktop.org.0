Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B915264430
	for <lists+dri-devel@lfdr.de>; Thu, 10 Sep 2020 12:34:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E20416E8FA;
	Thu, 10 Sep 2020 10:34:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BC7F86E8FA
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Sep 2020 10:34:35 +0000 (UTC)
Received: from [192.168.0.20]
 (cpc89244-aztw30-2-0-cust3082.18-1.cable.virginm.net [86.31.172.11])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 3FC7A3B;
 Thu, 10 Sep 2020 12:34:26 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1599734067;
 bh=Dmmg95bt89l1Tptk+BHOHpTSANQEVcyWBQUkB+1pjXU=;
 h=Reply-To:Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=AFIIPzX85Ce46c9OhFYJ8Gdg6nu+Y5MEudB42iCuWZdmGiO3FblSOmxW+BHNWUigp
 JcyLvXUU5nr5SHghkPl71lsHigBYrB183hQKWkyYK+fUd3hr/hY5hMrZlGCAHchK8z
 Teh6wSTfMy6ugzBMwYyWkEdq0k+iS0iCBH48vaow=
Subject: Re: [PATCH 5/9] arm64: dts: renesas: r8a77961: Add VSP device nodes
To: Geert Uytterhoeven <geert@linux-m68k.org>
References: <87sgbu70tq.wl-kuninori.morimoto.gx@renesas.com>
 <87lfhm70s6.wl-kuninori.morimoto.gx@renesas.com>
 <31ec6196-7613-8eb3-e092-07d0c874632a@ideasonboard.com>
 <CAMuHMdVHGQ0FFcLjQfXhke5PKJKnNfZ3NOF-p08v3QrQ-87npA@mail.gmail.com>
From: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Organization: Ideas on Board
Message-ID: <f1ed4b08-59eb-986e-4036-820887993f00@ideasonboard.com>
Date: Thu, 10 Sep 2020 11:34:23 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <CAMuHMdVHGQ0FFcLjQfXhke5PKJKnNfZ3NOF-p08v3QrQ-87npA@mail.gmail.com>
Content-Language: en-GB
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
Reply-To: kieran.bingham+renesas@ideasonboard.com
Cc: Linux-DT <devicetree@vger.kernel.org>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 David Airlie <airlied@linux.ie>,
 "\(Renesas\) shimoda" <yoshihiro.shimoda.uh@renesas.com>,
 Magnus <magnus.damm@gmail.com>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
 Rob Herring <robh+dt@kernel.org>, Laurent <laurent.pinchart@ideasonboard.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Geert,

On 10/09/2020 10:44, Geert Uytterhoeven wrote:
> Hi Kieran,
> 
> On Mon, Sep 7, 2020 at 5:55 PM Kieran Bingham
> <kieran.bingham+renesas@ideasonboard.com> wrote:
>> On 07/09/2020 03:59, Kuninori Morimoto wrote:
>>> From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
>>>
>>> This patch adds VSP device nodes for R-Car M3-W+ (r8a77961) SoC.
>>> This patch is test on R-Car M3-W+ Salvator-XS board.
>>>
>>> Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
>>> ---
>>>  arch/arm64/boot/dts/renesas/r8a77961.dtsi | 55 +++++++++++++++++++++++
>>>  1 file changed, 55 insertions(+)
>>>
>>> diff --git a/arch/arm64/boot/dts/renesas/r8a77961.dtsi b/arch/arm64/boot/dts/renesas/r8a77961.dtsi
>>> index fe0db11b9cb9..c2a6918ed5e6 100644
>>> --- a/arch/arm64/boot/dts/renesas/r8a77961.dtsi
>>> +++ b/arch/arm64/boot/dts/renesas/r8a77961.dtsi
>>> @@ -2056,6 +2056,61 @@ fcpvd2: fcp@fea37000 {
>>>                       iommus = <&ipmmu_vi0 10>;
>>>               };
>>
>> The FCP's added are:
>>
>>                 fcpf0: fcp@fe950000 {
>>                 fcpf1: fcp@fe951000 {
>>                 fcpvb0: fcp@fe96f000 {
>>                 fcpvb1: fcp@fe92f000 {
>>                 fcpvi0: fcp@fe9af000 {
>>                 fcpvi1: fcp@fe9bf000 {
>>                 fcpvd0: fcp@fea27000 {
>>                 fcpvd1: fcp@fea2f000 {
>>                 fcpvd2: fcp@fea37000 {
>>
>> So indeed, the first fcpf0 comes before fe960000.
>>
>> Do we keep the items grouped by the first occurrence? or sort the nodes
>> based on address?
>>
>> for some reason I thought we were ordering based on address, but I see
>> other situations where we group too - so I'm confused (and wishing there
>> was an automatic tool to get the sorting correct without fuss).
>>
>> Is there a set policy?
> 
> For nodes with a unit-address, we usually[*] sort by unit-address, but we keep
> similar nodes grouped.  Hence I prefer this v1 over v2.

I assume then the groups are sorted by the first entry,

I.e. hypothetically:

fdp@0
fcp@1
vsp@2
fdp@3
fcp@4
vsp@5
cmm@6
cmm@7

would become

fdp@0
fdp@3
fcp@1
fcp@4
vsp@2
vsp@5
cmm@6
cmm@7

Has anyone already created any scripting/validation to automate the
sorting requirements?

> 
> [*] Seems like FCP/VSP are interleaved in r8a77990.dsi, doh.
> 

Personally I prefer that - but my opinion doesn't matter here - so as
long as the rules are defined (or even better, automatically
enforceable) that's fine.


>>> +             vspb: vsp@fe960000 {
>>> +                     compatible = "renesas,vsp2";
>>> +                     reg = <0 0xfe960000 0 0x8000>;
>>> +                     interrupts = <GIC_SPI 266 IRQ_TYPE_LEVEL_HIGH>;
>>> +                     clocks = <&cpg CPG_MOD 626>;
>>> +                     power-domains = <&sysc R8A77961_PD_A3VC>;
>>> +                     resets = <&cpg 626>;
>>> +
>>> +                     renesas,fcp = <&fcpvb0>;
>>> +             };
> 
> Gr{oetje,eeting}s,
> 
>                         Geert
> 

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
