Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B5841CC44E
	for <lists+dri-devel@lfdr.de>; Sat,  9 May 2020 22:00:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3B0766E392;
	Sat,  9 May 2020 20:00:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk4.altibox.net (asavdk4.altibox.net [109.247.116.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0D0576E392
 for <dri-devel@lists.freedesktop.org>; Sat,  9 May 2020 20:00:55 +0000 (UTC)
Received: from ravnborg.org (unknown [158.248.194.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk4.altibox.net (Postfix) with ESMTPS id B831B804C8;
 Sat,  9 May 2020 22:00:52 +0200 (CEST)
Date: Sat, 9 May 2020 22:00:51 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: Douglas Anderson <dianders@chromium.org>
Subject: Re: [PATCH 2/3] dt-bindings: display: simple: Add BOE NV133FHM-N62
Message-ID: <20200509200051.GB30802@ravnborg.org>
References: <20200508155859.1.I4d29651c0837b4095fb4951253f44036a371732f@changeid>
 <20200508155859.2.I37c879ef4ec6d4028a3d45728bc3a58060bba175@changeid>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200508155859.2.I37c879ef4ec6d4028a3d45728bc3a58060bba175@changeid>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=MOBOZvRl c=1 sm=1 tr=0
 a=UWs3HLbX/2nnQ3s7vZ42gw==:117 a=UWs3HLbX/2nnQ3s7vZ42gw==:17
 a=kj9zAlcOel0A:10 a=cm27Pg_UAAAA:8 a=KCbFThoRF98PNkAbFwoA:9
 a=CjuIK1q_8ugA:10 a=xmb-EsYY8bH0VWELuYED:22
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
Cc: robdclark@chromium.org, devicetree@vger.kernel.org,
 David Airlie <airlied@linux.ie>, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Thierry Reding <thierry.reding@gmail.com>, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, May 08, 2020 at 03:59:01PM -0700, Douglas Anderson wrote:
> This panel appears to be the same or nearly the same as the BOE
> NV133FHM-N61, but since (in the very least) it identifies itself as a
> different model in the EDID we should add a new compatible string for
> it.
> 
> Signed-off-by: Douglas Anderson <dianders@chromium.org>
Applied this and the next patch to drm-misc-next.

Thanks,
	Sam

> ---
> 
>  .../devicetree/bindings/display/panel/panel-simple.yaml         | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/display/panel/panel-simple.yaml b/Documentation/devicetree/bindings/display/panel/panel-simple.yaml
> index fdd74d07f645..d6cca1479633 100644
> --- a/Documentation/devicetree/bindings/display/panel/panel-simple.yaml
> +++ b/Documentation/devicetree/bindings/display/panel/panel-simple.yaml
> @@ -75,6 +75,8 @@ properties:
>        - boe,nv101wxmn51
>          # BOE NV133FHM-N61 13.3" FHD (1920x1080) TFT LCD Panel
>        - boe,nv133fhm-n61
> +        # BOE NV133FHM-N62 13.3" FHD (1920x1080) TFT LCD Panel
> +      - boe,nv133fhm-n62
>          # BOE NV140FHM-N49 14.0" FHD a-Si FT panel
>        - boe,nv140fhmn49
>          # CDTech(H.K.) Electronics Limited 4.3" 480x272 color TFT-LCD panel
> -- 
> 2.26.2.645.ge9eca65c58-goog
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
