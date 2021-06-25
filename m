Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D76993B4039
	for <lists+dri-devel@lfdr.de>; Fri, 25 Jun 2021 11:21:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BA10D6E0D2;
	Fri, 25 Jun 2021 09:21:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EC9A26E0D2
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Jun 2021 09:21:32 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: dafna) with ESMTPSA id 49B961F442A9
Subject: Re: [PATCH 10/12] dt-bindings: media: rockchip-vpu: Add PX30
 compatible
To: Ezequiel Garcia <ezequiel@collabora.com>, linux-media@vger.kernel.org,
 dri-devel@lists.freedesktop.org
References: <20210624182612.177969-1-ezequiel@collabora.com>
 <20210624182612.177969-11-ezequiel@collabora.com>
From: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
Message-ID: <176dce10-8e8c-b34b-8b9c-1a0a6a5501ba@collabora.com>
Date: Fri, 25 Jun 2021 12:21:27 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210624182612.177969-11-ezequiel@collabora.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
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
Cc: Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
 Jernej Skrabec <jernej.skrabec@siol.net>, Jonas Karlman <jonas@kwiboo.se>,
 David Airlie <airlied@linux.ie>, Alex Bee <knaerzche@gmail.com>,
 Hans Verkuil <hverkuil@xs4all.nl>, Thierry Reding <thierry.reding@gmail.com>,
 kernel@collabora.com, Sam Ravnborg <sam@ravnborg.org>,
 Chris Healy <cphealy@gmail.com>, maccraft123mc@gmail.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On 24.06.21 21:26, Ezequiel Garcia wrote:
> From: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
> 
> The Rockchip PX30 SoC has a Hantro VPU that features a decoder (VDPU2)
> and an encoder (VEPU2).
> 
> Signed-off-by: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
> Signed-off-by: Ezequiel Garcia <ezequiel@collabora.com>
> ---
>   Documentation/devicetree/bindings/media/rockchip-vpu.yaml | 3 +++
>   1 file changed, 3 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/media/rockchip-vpu.yaml b/Documentation/devicetree/bindings/media/rockchip-vpu.yaml
> index b88172a59de7..3b9c5aa91fcc 100644
> --- a/Documentation/devicetree/bindings/media/rockchip-vpu.yaml
> +++ b/Documentation/devicetree/bindings/media/rockchip-vpu.yaml
> @@ -28,6 +28,9 @@ properties:
>         - items:
>             - const: rockchip,rk3228-vpu
>             - const: rockchip,rk3399-vpu
> +      - items:
> +          - const: rockchip,px30-vpu
> +          - const: rockchip,rk3399-vpu

This rk3399 compatible is already mentioned in the last 'items' list, should we add it again?

Thanks,
Dafna

>   
>     reg:
>       maxItems: 1
> 
