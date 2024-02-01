Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A49B4846381
	for <lists+dri-devel@lfdr.de>; Thu,  1 Feb 2024 23:36:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B56FF10EC7A;
	Thu,  1 Feb 2024 22:36:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="nV42FT9k";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 247FA10EC7A
 for <dri-devel@lists.freedesktop.org>; Thu,  1 Feb 2024 22:36:25 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 462F3CE1691;
 Thu,  1 Feb 2024 22:36:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CE0D4C433F1;
 Thu,  1 Feb 2024 22:36:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1706826978;
 bh=xeqyaatnEraCZ26CZitiT3fDyTSc0Y5yG9m/ZQcicx4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=nV42FT9kp63iE84kO5nAsodc/Ea+/OFYFrpndQnFOYtYvbyN6iSjeKAAHajDcqUZZ
 6o80losGRkwIzmvBDbWJhHDWjjBl0SfshCb+jyH0dH6rXUu8ioNT6/Z1DbESF5hcIJ
 bjdJJjDD06cCpVxqKPF973R9xHEWKGJ3+VHtt5JzK64vvmsYqFoEWzjVJxgidsiFQ3
 qiNf/g+5dVQd9DL9K+RaYbS26a2d+4TLi/+4VzDgqXF2mBxRdKLEddqP6qsDGAu/sp
 boPJRveXT09ymMOEv+eFIo/SSzuGrWb/Ei3K5ULAPx1Dw1Btk3y792IUFZ3jDKIl95
 cGPqf9N5FFxow==
Date: Thu, 1 Feb 2024 16:36:15 -0600
From: Rob Herring <robh@kernel.org>
To: Dharma.B@microchip.com
Cc: sam@ravnborg.org, bbrezillon@kernel.org,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, airlied@gmail.com, daniel@ffwll.ch,
 krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
 Nicolas.Ferre@microchip.com, alexandre.belloni@bootlin.com,
 claudiu.beznea@tuxon.dev, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, lee@kernel.org,
 thierry.reding@gmail.com, u.kleine-koenig@pengutronix.de,
 linux-pwm@vger.kernel.org, Hari.PrasathGE@microchip.com,
 Manikandan.M@microchip.com
Subject: Re: [linux][PATCH v5 0/3] Convert Microchip's HLCDC Text based DT
 bindings to JSON schema
Message-ID: <20240201223615.GA1726520-robh@kernel.org>
References: <20240131033523.577450-1-dharma.b@microchip.com>
 <478cab42-5f30-4fbe-b42d-02d16b81ca11@microchip.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <478cab42-5f30-4fbe-b42d-02d16b81ca11@microchip.com>
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

On Thu, Feb 01, 2024 at 03:38:37AM +0000, Dharma.B@microchip.com wrote:
> Hi Rob,
> 
> On 31/01/24 9:05 am, Dharma B - I70843 wrote:
> > Converted the text bindings to YAML and validated them individually using following commands
> > 
> > $ make dt_binding_check DT_SCHEMA_FILES=Documentation/devicetree/bindings/
> > $ make dtbs_check DT_SCHEMA_FILES=Documentation/devicetree/bindings/
> > 
> > changelogs are available in respective patches.
> > 
> > As Sam suggested I'm sending the PWM binding as it is in this patch series, clean up patch
> > will be sent as separate patch.
> > 
> 
> I would want to know if I can have the examples in display and pwm 
> bindings separately or if I have to delete them from both and have a 
> single, comprehensive example in mfd binding. I'm a little puzzled about 
> this.

The strong preference is 1 complete example in the MFD binding. That 
avoids 2 copies of the same thing, issues with incomplete examples, 
and temporary warnings bisecting the series.

Rob
