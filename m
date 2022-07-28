Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BA4C0583E52
	for <lists+dri-devel@lfdr.de>; Thu, 28 Jul 2022 14:07:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1377498E45;
	Thu, 28 Jul 2022 12:07:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 89D32977A3
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Jul 2022 12:07:40 +0000 (UTC)
Received: from [192.168.1.111] (91-158-154-79.elisa-laajakaista.fi
 [91.158.154.79])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 7F2EE56D;
 Thu, 28 Jul 2022 14:07:38 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1659010059;
 bh=NYs1CegJfOdzTMrWzKcwsScJu3f3bNBSqgfmlYee5Ak=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=j1bGehUMRAMkTOMtefUeFkONS1rJvY3Q2Xxaq0dKdqYuxQftsyJ6NExvMVJ6HvPtF
 tKvYMJGKVWbT8/2NOzCD4B3Aa2hLI5rWynCcCCP5g7oCoocWKK5fm3OFDV7pIk1i6g
 4sTnfVgLdjnIVUvrq/p8qDCbyk7HKQr4lrKNPBc0=
Message-ID: <ca2c4f5b-7300-60cd-9667-f6441dec969f@ideasonboard.com>
Date: Thu, 28 Jul 2022 15:07:35 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 3/8] drm/tidss: Add support for DSS port properties
Content-Language: en-US
To: Aradhya Bhatia <a-bhatia1@ti.com>, Jyri Sarha <jyri.sarha@iki.fi>,
 Rob Herring <robh+dt@kernel.org>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
References: <20220719080845.22122-1-a-bhatia1@ti.com>
 <20220719080845.22122-4-a-bhatia1@ti.com>
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
In-Reply-To: <20220719080845.22122-4-a-bhatia1@ti.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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
Cc: Nishanth Menon <nm@ti.com>, Devicetree List <devicetree@vger.kernel.org>,
 Vignesh Raghavendra <vigneshr@ti.com>, Devarsh Thakkar <devarsht@ti.com>,
 Linux Kernel List <linux-kernel@vger.kernel.org>,
 DRI Development List <dri-devel@lists.freedesktop.org>,
 Darren Etheridge <detheridge@ti.com>, Rahul T R <r-ravikumar@ti.com>,
 Krunal Bhargav <k-bhargav@ti.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 19/07/2022 11:08, Aradhya Bhatia wrote:
> Add support to enable and read the dss port properties.
> 
> The "ti,oldi-mode" property indicates the tidss driver how many OLDI
> TXes are enabled as well as which mode do they need to be connected in.
> 
> The "ti,rgb565_to_888" is a special property that forces the DSS to
> output 16bit RGB565 data to a 24bit RGB888 bridge. This property can be
> used when the bridge does not explicity support RGB565.
> 
> Signed-off-by: Aradhya Bhatia <a-bhatia1@ti.com>

I think it would be good if you would split the patches that contain 
both OLDI and rgb565 changes, and arrange the series so that you first 
have patches that add the rgb565 (dt and driver), and after that, the 
OLDI changes.

They are fully separate things, and makes understanding the changes a 
bit easier.

  Tomi
