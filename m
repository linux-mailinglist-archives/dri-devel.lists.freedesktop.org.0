Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F4054292E76
	for <lists+dri-devel@lfdr.de>; Mon, 19 Oct 2020 21:28:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 819806EA4F;
	Mon, 19 Oct 2020 19:28:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-40131.protonmail.ch (mail-40131.protonmail.ch
 [185.70.40.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 578B46E0AA
 for <dri-devel@lists.freedesktop.org>; Sun, 18 Oct 2020 12:33:38 +0000 (UTC)
Date: Sun, 18 Oct 2020 12:33:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=connolly.tech;
 s=protonmail; t=1603024416;
 bh=GCCxJzqOnfsVI/hX933byDTiphe1ufjEW2PregmWSLo=;
 h=Date:To:From:Cc:Reply-To:Subject:In-Reply-To:References:From;
 b=f+hV804e70VkKoIWRn7lDMgkeqT2qE8ENc6nW6FtprsQ95OUyJzlP0nWidHtODY3t
 2rzpoWw8FEbph1STSYBYkit71a3mtR/Xze3Z7XyeILvONxAqoJBCNyeUaSfRCUz070
 KmqilvG2Lhych3aFR83Oq7sZeDM//DxKss96mhgQ=
To: Rob Herring <robh@kernel.org>
From: Caleb Connolly <caleb@connolly.tech>
Subject: Re: [PATCH 2/5] dt-bindings: panel: add documentation for oneplus6
 panel
Message-ID: <3b3f9ede-89ef-26c7-3ade-bf498ea483b8@connolly.tech>
In-Reply-To: <20201009140544.GB4071736@bogus>
References: <20201007174736.292968-1-caleb@connolly.tech>
 <20201007174736.292968-3-caleb@connolly.tech>
 <20201009140544.GB4071736@bogus>
MIME-Version: 1.0
X-Spam-Status: No, score=-1.2 required=10.0 tests=ALL_TRUSTED,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF shortcircuit=no
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on
 mailout.protonmail.ch
X-Mailman-Approved-At: Mon, 19 Oct 2020 19:28:29 +0000
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
Reply-To: Caleb Connolly <caleb@connolly.tech>
Cc: devicetree@vger.kernel.org, David Airlie <airlied@linux.ie>,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Thierry Reding <thierry.reding@gmail.com>,
 ~postmarketos/upstreaming@lists.sr.ht, Sam Ravnborg <sam@ravnborg.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2020-10-09 15:05, Rob Herring wrote:
> On Wed, Oct 07, 2020 at 05:49:14PM +0000, Caleb Connolly wrote:
>> Document the OnePlus 6/T common panel driver, example from
>> arch/arm64/boot/dts/qcom/sdm845-oneplus-common.dtsi
>>
>> Signed-off-by: Caleb Connolly <caleb@connolly.tech>
>> ---
>>   .../display/panel/panel-oneplus6.yaml         | 73 +++++++++++++++++++
>>   1 file changed, 73 insertions(+)
>>   create mode 100644 Documentation/devicetree/bindings/display/panel/panel-oneplus6.yaml
>>
>> diff --git a/Documentation/devicetree/bindings/display/panel/panel-oneplus6.yaml b/Documentation/devicetree/bindings/display/panel/panel-oneplus6.yaml
>> new file mode 100644
>> index 000000000000..23ba369cc2f5
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/display/panel/panel-oneplus6.yaml
>> @@ -0,0 +1,73 @@
>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/display/panel/panel-oneplus6.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: OnePlus 6/T panel driver
>> +
>> +description: |
>> +  The OnePlus 6 panel driver encompasses the display panels found in the
>> +  OnePlus 6 and 6T devices, the panels have almost identical behaviour and
>> +  are not used by any other devices.
>> +
>> +maintainers:
>> +  - Caleb Connolly <caleb@connolly.tech>
>> +
>> +allOf:
>> +  - $ref: panel-common.yaml#
>> +
>> +properties:
>> +  compatible:
>> +    enum:
>> +      - samsung,sofef00
>> +      - samsung,s6e3fc2x01
>> +
>> +  reg: true
>> +  reset-gpios: true
>> +  port: true
>> +
>> +  vddio-supply:
>> +    description: VDDIO regulator
> A panel with a single supply can use panel-simple-dsi.yaml.
>
> 'reset-gpios' was missing, but has been added recently.
>
> Rob

Thanks, I'll move docs into panel-simple-dsi.yaml

Caleb


_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
