Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 75163135CBC
	for <lists+dri-devel@lfdr.de>; Thu,  9 Jan 2020 16:28:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AD5906E91B;
	Thu,  9 Jan 2020 15:28:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from manjaro.org (mail.manjaro.org [176.9.38.148])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5F7876E91B
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Jan 2020 15:28:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by manjaro.org (Postfix) with ESMTP id 0A2AC36E4E6C;
 Thu,  9 Jan 2020 16:28:20 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at manjaro.org
Received: from manjaro.org ([127.0.0.1])
 by localhost (manjaro.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Er5maKmcrGp7; Thu,  9 Jan 2020 16:28:17 +0100 (CET)
Subject: Re: [RESEND 0/1] Add support for BOE NV140FHM-N49 panel to
 panel-simple
To: Sam Ravnborg <sam@ravnborg.org>
References: <20200109112952.2620-1-t.schramm@manjaro.org>
 <20200109140742.GA12940@ravnborg.org>
From: Tobias Schramm <t.schramm@manjaro.org>
Message-ID: <d4b20bfa-9315-b24b-b58b-f16825df715b@manjaro.org>
Date: Thu, 9 Jan 2020 16:27:43 +0100
MIME-Version: 1.0
In-Reply-To: <20200109140742.GA12940@ravnborg.org>
Content-Language: en-US
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
Cc: David Airlie <airlied@linux.ie>, Thierry Reding <thierry.reding@gmail.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

> Hi Tobias.
> 
> We need binding schema before we can apply this patch.
Knew I forgot something
> See patch below.
> Please review/ack the patch, then we can process your panel-simple
> patch.
LGTM, thanks!
> 	Sam
> 
> On Thu, Jan 09, 2020 at 12:29:51PM +0100, Tobias Schramm wrote:
>> This patch adds support for the 14 inch BOE NV140FHM-N49 eDP panel to
>> the panel-simple driver. The panel is used by the Pinebook Pro.
>>
>> Resending with changed CCs due to lack of feedback.
> 
> 
>>
>> Tobias Schramm (1):
>>    drm/panel: Add support for BOE NV140FHM-N49 panel to panel-simple
>>
>>   drivers/gpu/drm/panel/panel-simple.c | 35 ++++++++++++++++++++++++++++
>>   1 file changed, 35 insertions(+)
>>
>  From ad19c4636475bb05ba5c0b6cec2bee85045d628e Mon Sep 17 00:00:00 2001
> From: Sam Ravnborg <sam@ravnborg.org>
> Date: Thu, 9 Jan 2020 14:48:41 +0100
> Subject: [PATCH] dt-bindings: display: add BOE 14" panel
> 
> Add bindings for the BOE NV140FHM-N49 14" 1920x1080 panel.
> 
> The panel is used by the pine64 Pinebook Pro.
> 
> Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
> Cc: Thierry Reding <thierry.reding@gmail.com>
> Cc: Tobias Schramm <t.schramm@manjaro.org>
> ---
>   .../devicetree/bindings/display/panel/panel-simple.yaml         | 2 ++
>   1 file changed, 2 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/display/panel/panel-simple.yaml b/Documentation/devicetree/bindings/display/panel/panel-simple.yaml
> index ddc00480b6fe..6c098a0b6e1e 100644
> --- a/Documentation/devicetree/bindings/display/panel/panel-simple.yaml
> +++ b/Documentation/devicetree/bindings/display/panel/panel-simple.yaml
> @@ -35,6 +35,8 @@ properties:
>         - ampire,am800480r3tmqwa1h
>           # AUO B116XAK01 eDP TFT LCD panel
>         - auo,b116xa01
> +        # BOE NV140FHM-N49 14.0" FHD a-Si FT panel
> +      - boe,nv140fhmn49
>           # GiantPlus GPM940B0 3.0" QVGA TFT LCD panel
>         - giantplus,gpm940b0
>           # Sharp LS020B1DD01D 2.0" HQVGA TFT LCD panel
> 
Reviewed-by: Tobias Schramm <t.schramm@manjaro.org>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
