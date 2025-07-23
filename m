Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CEB55B0EBE2
	for <lists+dri-devel@lfdr.de>; Wed, 23 Jul 2025 09:27:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 085C910E0E1;
	Wed, 23 Jul 2025 07:27:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="WpFNvuK4";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D232410E0E1
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Jul 2025 07:27:21 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 16D094372E;
 Wed, 23 Jul 2025 07:27:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DCC38C4CEE7;
 Wed, 23 Jul 2025 07:27:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1753255640;
 bh=bf9PaPOgFqxUTKwmAInneVFpDKX7U1g8t0Uc+GYu1J4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=WpFNvuK4W+NWoO0APgZK0qaJgYMa1bmENI+725ngQ1ZO7xDvrjsl/XH5iB42a78+B
 XX64eGz5ahvmKit9daWehUGcQ7pql1G9jml0RCqf6SJIN+xYF9hKbbMBiS1PIhPcNJ
 NgqjV9NGxPPyxLd2VBTgcOI7H6kCq05eOp3CSHbf0NG44UNx5T8wtKN9R4BYH/T5nK
 xHfinbRCaxD9z6WKbxsU/lmtyF1UeA+MIhu1j9aoczze0KKAMVZRKPvL4HftRzY/3O
 A1PNVJAppIami1epkhtj79mPoG0JH/mihT0AaUKsF9pT0gHZb1gKh9Z99pJdbY08BW
 E3XaM5y0qy4Ug==
Received: from johan by xi.lan with local (Exim 4.98.2)
 (envelope-from <johan@kernel.org>) id 1ueTse-000000002Jb-1bvS;
 Wed, 23 Jul 2025 09:27:12 +0200
Date: Wed, 23 Jul 2025 09:27:12 +0200
From: Johan Hovold <johan@kernel.org>
To: Neil Armstrong <neil.armstrong@linaro.org>
Cc: Rui Miguel Silva <rmfrfs@gmail.com>,
 Christopher Obbard <christopher.obbard@linaro.org>,
 Douglas Anderson <dianders@chromium.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, Rui Miguel Silva <rui.silva@linaro.org>,
 Abel Vesa <abel.vesa@linaro.org>, devicetree@vger.kernel.org
Subject: Re: [PATCH v5 0/3] Add support for OLED panel used on Snapdragon
 Lenovo T14s Gen6
Message-ID: <aICO0CXxp4Vu331u@hovoldconsulting.com>
References: <20250402-wip-obbardc-qcom-t14s-oled-panel-v5-0-ff33f4d0020f@linaro.org>
 <aCw9pYehCdfXXeiR@hovoldconsulting.com>
 <aG-QyF12rGY55gcG@hovoldconsulting.com>
 <d431435b-4ac0-44aa-922d-0bde126ca563@linaro.org>
 <DBIMQO2CS0I3.17XLZPKPCVW2S@linaro.com>
 <e9c63414-8434-4e35-a159-66df1864f9f3@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e9c63414-8434-4e35-a159-66df1864f9f3@linaro.org>
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

On Wed, Jul 23, 2025 at 08:51:22AM +0200, Neil Armstrong wrote:
> On 22/07/2025 15:48, Rui Miguel Silva wrote:
> > On Tue Jul 22, 2025 at 2:01 PM WEST, Neil Armstrong wrote:
> >> On 10/07/2025 12:07, Johan Hovold wrote:

> >>> Neil, do you have the OLED version now?
> >>
> >> I'm not sure, how do I determine that ? Is there something specific in the type number ?
> > 
> > Yes, yours is the OLED version, the exact models stated above.
> 
> Ack thx, I'll test and re-spin this patchset then.

Thanks. Note that this depends on this series as well which also needs a
minor update:

	https://lore.kernel.org/all/20250330-wip-obbardc-qcom-t14s-oled-panel-brightness-v6-1-84ad1cd1078a@linaro.org/

Can you respin that one as well?

Johan
