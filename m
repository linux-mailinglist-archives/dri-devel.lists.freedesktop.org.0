Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A17BEB4A2F3
	for <lists+dri-devel@lfdr.de>; Tue,  9 Sep 2025 09:07:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E9DD310E643;
	Tue,  9 Sep 2025 07:07:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="tmz/QTdt";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 43BA510E63D
 for <dri-devel@lists.freedesktop.org>; Tue,  9 Sep 2025 07:07:08 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id CAA5643D46;
 Tue,  9 Sep 2025 07:07:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1F7B5C4CEF4;
 Tue,  9 Sep 2025 07:07:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1757401627;
 bh=UB3ymBhPiyxYf8wquSpd7gpdKSVsLTb8dRTn8loC64w=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=tmz/QTdtMP6cfWNhmgodQagq9C+kpRUVxjnuj3fVroqKyctPvbwjlKjHc2GR9K4zf
 rr8oVcTbsq0gPgr2qxIPaRLSbRTQ7JLN3FMugcSTIt+bUxu/ADctBhdHVbPDJHYlz7
 EK9KsTl1h9eU22NJGM/LwI1ljt07bpVViHYaXiMsHAy4xZ2QG4mc+p4cd/ciwlFOrm
 Wn+M6/ytU43kkHOO1lRfR6w7Lm1SVP2o/6FzlMr7/++qAE+n1aVKM+e0YHKdiF5qPx
 Qj0W5NCKWtFiq/toeQurMEFWCpMShhkr1UEe10i54KdYAse6PAHPz+4/CN549ceywM
 gM4urmQsBMI7g==
Date: Tue, 9 Sep 2025 09:07:05 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Aleksandrs Vinarskis <alex@vinarskis.com>
Cc: "Rob Herring (Arm)" <robh@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Daniel Thompson <daniel.thompson@linaro.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Pavel Machek <pavel@kernel.org>, devicetree@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, 
 Jacopo Mondi <jacopo@jmondi.org>, Hans de Goede <hansg@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>,
 linux-kernel@vger.kernel.org, 
 Jingoo Han <jingoohan1@gmail.com>, dri-devel@lists.freedesktop.org, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, linux-media@vger.kernel.org,
 linux-leds@vger.kernel.org, 
 Jean-Jacques Hiblot <jjhiblot@traphandler.com>,
 Daniel Thompson <danielt@kernel.org>
Subject: Re: [PATCH v3 1/4] dt-bindings: leds: add generic LED consumer
 documentation
Message-ID: <20250909-vague-fantastic-bettong-5f40ee@kuoka>
References: <20250908-leds-v3-0-5944dc400668@vinarskis.com>
 <20250908-leds-v3-1-5944dc400668@vinarskis.com>
 <175734087835.1809005.14330068317471966084.robh@kernel.org>
 <COW1cS_CD75b8_MjT5gZA2c8oVf7iAbYPP7RR0TfJwPCqyhpf7LJn8YRjePaJHKnqE4TQZq4UTvmHGlSiv6rVJjdQSmp70FAjg5zkPbEeh0=@vinarskis.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <COW1cS_CD75b8_MjT5gZA2c8oVf7iAbYPP7RR0TfJwPCqyhpf7LJn8YRjePaJHKnqE4TQZq4UTvmHGlSiv6rVJjdQSmp70FAjg5zkPbEeh0=@vinarskis.com>
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

On Mon, Sep 08, 2025 at 03:43:22PM +0000, Aleksandrs Vinarskis wrote:
> 
> 
> 
> 
> 
> On Monday, September 8th, 2025 at 16:15, Rob Herring (Arm) <robh@kernel.org> wrote:
> 
> > 
> > 
> > 
> > On Mon, 08 Sep 2025 01:18:03 +0200, Aleksandrs Vinarskis wrote:
> > 
> > > Introduce common generic led consumer binding, where consumer defines
> > > led(s) by phandle, as opposed to trigger-source binding where the
> > > trigger source is defined in led itself.
> > > 
> > > Add already used in some schemas 'leds' parameter which expects
> > > phandle-array. Additionally, introduce 'led-names' which could be used
> > > by consumers to map LED devices to their respective functions.
> > > 
> > > Signed-off-by: Aleksandrs Vinarskis alex@vinarskis.com
> > > ---
> > > .../devicetree/bindings/leds/leds-consumer.yaml | 89 ++++++++++++++++++++++
> > > 1 file changed, 89 insertions(+)
> > 
> > 
> > My bot found errors running 'make dt_binding_check' on your patch:
> > 
> > yamllint warnings/errors:
> > 
> > dtschema/dtc warnings/errors:
> > /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/leds/leds-consumer.example.dtb: camera@36 (ovti,ov02c10): Unevaluated properties are not allowed ('led-names', 'leds' were unexpected)
> > from schema $id: http://devicetree.org/schemas/media/i2c/ovti,ov02e10.yaml#
> 
> Rob: this is because the 1st patch that adds `led-consumer.yaml` uses
> ov02e10 in its example, while the property is added to
> `video-interface-devices.yaml` (which is used by ov02e10 and other
> cameras) only in the 2nd patch. As I see it, reversing the order of 1st
> and 2nd patch would likewise cause 'error' when 1st patch is checked
> without the 2nd one. I don't think that 1st and 2nd patches should be
> combined, but if you prefer to do that so the warning goes away - please
> let me know.
> 

Just drop the compatible (and most of the properties) from the example.
That's a common binding, so adding there some other device DTS only
complicates things. See access-controllers, for example.

Best regards,
Krzysztof

