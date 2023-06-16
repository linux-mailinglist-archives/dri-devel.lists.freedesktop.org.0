Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 71650733189
	for <lists+dri-devel@lfdr.de>; Fri, 16 Jun 2023 14:45:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8F16810E613;
	Fri, 16 Jun 2023 12:45:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F347110E613
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Jun 2023 12:45:48 +0000 (UTC)
Received: from [192.168.88.20] (91-154-35-171.elisa-laajakaista.fi
 [91.154.35.171])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id D8FE9AB;
 Fri, 16 Jun 2023 14:45:14 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1686919515;
 bh=2O2xVR59QzjwM/PsDbH94LJv9nRecygjI3jFJiv0M9c=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=NE5CFNNeNDwgKdnO30Y9Hs2VgQr/YGXXKDlw7dwVAC6ikh2T7efriqzFFvxQIAsRv
 LW/zYloy0dBkDud71550qVUyhvrCY5wyiN36vfJrfdSTh1xBgVAJYC4dNPuw+zMb34
 YSXY6KWChBh0daZBOWo47Vuba7kn+xMICpmqWS90=
Message-ID: <2de29abb-4c1f-9c5e-564a-ac29d953f0a1@ideasonboard.com>
Date: Fri, 16 Jun 2023 15:45:43 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v8 1/2] dt-bindings: display: ti, am65x-dss: Add am625 dss
 compatible
Content-Language: en-US
To: Aradhya Bhatia <a-bhatia1@ti.com>, Jyri Sarha <jyri.sarha@iki.fi>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>
References: <20230608163734.2578-1-a-bhatia1@ti.com>
 <20230608163734.2578-2-a-bhatia1@ti.com>
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
In-Reply-To: <20230608163734.2578-2-a-bhatia1@ti.com>
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
 Jayesh Choudhary <j-choudhary@ti.com>, Rahul T R <r-ravikumar@ti.com>,
 Devarsh Thakkar <devarsht@ti.com>,
 Linux Kernel List <linux-kernel@vger.kernel.org>,
 DRI Development List <dri-devel@lists.freedesktop.org>,
 Vignesh Raghavendra <vigneshr@ti.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 08/06/2023 19:37, Aradhya Bhatia wrote:
> The DSS controller on TI's AM625 SoC is an update from that on TI's
> AM65X SoC. The former has an additional OLDI TX on its first video port
> that helps output cloned video or WUXGA (1920x1200@60fps) resolution
> video output over a dual-link mode to reduce the required OLDI clock
> output.
> 
> The second video port is same from AM65x DSS and it outputs DPI video
> data. It can support 2K resolutions @ 60fps, independently.
> 
> Add the new controller's compatible and update descriptions.
> 
> Signed-off-by: Aradhya Bhatia <a-bhatia1@ti.com>

Reviewed-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>

  Tomi

