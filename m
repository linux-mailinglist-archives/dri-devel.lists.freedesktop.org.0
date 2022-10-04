Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 289295F47B9
	for <lists+dri-devel@lfdr.de>; Tue,  4 Oct 2022 18:37:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6DAB110E01F;
	Tue,  4 Oct 2022 16:36:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp1.tecnico.ulisboa.pt (smtp1.tecnico.ulisboa.pt
 [193.136.128.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 269AC10E01F
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Oct 2022 16:36:51 +0000 (UTC)
Received: from localhost (localhost.localdomain [127.0.0.1])
 by smtp1.tecnico.ulisboa.pt (Postfix) with ESMTP id 074816005417;
 Tue,  4 Oct 2022 17:36:50 +0100 (WEST)
X-Virus-Scanned: by amavisd-new-2.11.0 (20160426) (Debian) at
 tecnico.ulisboa.pt
Received: from smtp1.tecnico.ulisboa.pt ([127.0.0.1])
 by localhost (smtp1.tecnico.ulisboa.pt [127.0.0.1]) (amavisd-new, port 10025)
 with LMTP id j8yPc4mpqb_j; Tue,  4 Oct 2022 17:36:47 +0100 (WEST)
Received: from mail1.tecnico.ulisboa.pt (mail1.ist.utl.pt
 [IPv6:2001:690:2100:1::b3dd:b9ac])
 by smtp1.tecnico.ulisboa.pt (Postfix) with ESMTPS id 0E566600881E;
 Tue,  4 Oct 2022 17:36:45 +0100 (WEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=tecnico.ulisboa.pt;
 s=mail; t=1664901407;
 bh=DMhcGkQbTq6SDO0SLsiFN4a0xZV0HfX1yyp+AGRsmVo=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To;
 b=fabVcPBNbSXlLC7+WUv5tqiPTOvXo7j6AWxsirSb9ZAAs5TBaofkbX8nH15fURDWi
 b0YZ/T8CHc5BQt9d0Gp0oe2dJQAshoByDzia6i6beu2KnhknCX6/BpU3VC4jUwwq3Z
 KzCcthCBp5fPl8PwJtoa0cSOlD5HAnue6jO9lJOo=
Received: from wslaptop (unknown [IPv6:2001:818:dcb5:dc00:7a88:7f12:8ed8:518d])
 (Authenticated sender: ist187313)
 by mail1.tecnico.ulisboa.pt (Postfix) with ESMTPSA id B7304360083;
 Tue,  4 Oct 2022 17:36:44 +0100 (WEST)
Date: Tue, 4 Oct 2022 17:37:18 +0100
From: Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH 1/4] dt-bindings: display: Add bindings for JDI LPM102A188A
Message-ID: <20221004163718.ederwgmvt24kvhms@wslaptop>
References: <20220929170502.1034040-1-diogo.ivo@tecnico.ulisboa.pt>
 <20220929170502.1034040-2-diogo.ivo@tecnico.ulisboa.pt>
 <efa2f644-0a1d-00f7-970c-f17ceb0cc550@linaro.org>
 <20221003170634.56jibls3xjxiiulg@wslaptop>
 <98d3b42d-3f9f-9b6e-8c17-46deae4b4030@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <98d3b42d-3f9f-9b6e-8c17-46deae4b4030@linaro.org>
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
Cc: devicetree@vger.kernel.org, arnd@arndb.de, airlied@linux.ie,
 dri-devel@lists.freedesktop.org, jonathanh@nvidia.com,
 diogo.ivo@tecnico.ulisboa.pt, robh+dt@kernel.org, thierry.reding@gmail.com,
 krzysztof.kozlowski+dt@linaro.org, linux-tegra@vger.kernel.org,
 sam@ravnborg.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Oct 04, 2022 at 01:05:04PM +0200, Krzysztof Kozlowski wrote:
> On 03/10/2022 19:06, Diogo Ivo wrote:
> > On Fri, Sep 30, 2022 at 12:49:31PM +0200, Krzysztof Kozlowski wrote:
> >> Isn't touchscreen a separate (input) device?
> > 
> > Hello, thank you for the feedback.
> > 
> > According to the downstream kernel's log, it seems like the panel and
> > the touchscreen controller are considered to be embedded in the same unit
> > (for example in [1]), 
> 
> Downstream kernel is not a proof of proper description of hardware. If
> downstream says orange is an apple, does it mean orange is really an
> apple? No... Downstream creates a lot of junk, hacks and workarounds.

After some searching (which I should have done sooner, so
apologies) I came across a teardown of the Pixel C ([1], for completeness),
which incorporates this panel. Indeed a separate touch controller was found,
so it seems the downstream kernel threw me off as per your warning.

[1]: https://www.ifixit.com/Teardown/Google+Pixel+C+Teardown/62277 (Step 4)

> > with the touch input being transmitted via HID-over-I2C,
> > and since I did not find any reset gpio handling in that driver I opted to
> > include this reset here, unless there is a better way of going about this.
> 
> Instead it should be in touch screen device.

Noted, I will remove it from the binding in the next version. 

> Where is the DTS of that device?

The relevant part of the DTS can be found here:
https://android.googlesource.com/kernel/tegra/+/refs/heads/android-tegra-dragon-3.18-oreo/arch/arm64/boot/dts/tegra/tegra210-smaug.dtsi

Best regards,
Diogo
