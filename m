Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FF5D5151CA
	for <lists+dri-devel@lfdr.de>; Fri, 29 Apr 2022 19:25:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1E10B10EDC6;
	Fri, 29 Apr 2022 17:24:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8130F10EDC6
 for <dri-devel@lists.freedesktop.org>; Fri, 29 Apr 2022 17:24:56 +0000 (UTC)
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id C73CD80112;
 Fri, 29 Apr 2022 19:24:54 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1651253095;
 bh=6zWLKnVmPjn67OBShu1Y71mWlfzoWqDIMDyqyrKYZN8=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=E68pQaqxfWasH2aAoNYM7tVMb3+CRfTQdJZPkIuzu/M+9kRD2ag/Uj2sOkjLQEksd
 jgtgpEtXHGQ+/7aLO+E92r2WMsmxuMVC4xG9GU2Z6huO7EqVNd0ZWM+3I91pjP6bL7
 PqP5nXbvw1WFhCF0TV1Fkd2+v8oVpgkanhMolvdNsGyfz9HnTowtUB0GnptyDAdmSB
 S5jTeo5hZzbnmDSuCNjF9gWBnktJf+24BLzkfTNWta2HeDK1SMUBQhGK9DWL3UJoR6
 CYmixTULOZC79QIALa/zC1CHAX/dpy1iGiUP4TP+Wspciq0i6xDvgWeYPfXnzIdwqg
 SujgvODRIaPWA==
Message-ID: <e93f6030-b72d-4071-13c3-6f022a352cfc@denx.de>
Date: Fri, 29 Apr 2022 19:24:54 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH v3 1/2] dt-bindings: display: simple: Add Startek
 KD070WVFPA043-C069A panel
Content-Language: en-US
To: Fabio Estevam <festevam@gmail.com>, sam@ravnborg.org
References: <20220429172056.3499563-1-festevam@gmail.com>
From: Marek Vasut <marex@denx.de>
In-Reply-To: <20220429172056.3499563-1-festevam@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Virus-Scanned: clamav-milter 0.103.5 at phobos.denx.de
X-Virus-Status: Clean
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
Cc: Fabio Estevam <festevam@denx.de>, devicetree@vger.kernel.org,
 robh+dt@kernel.org, hs@denx.de, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 4/29/22 19:20, Fabio Estevam wrote:
> From: Fabio Estevam <festevam@denx.de>
> 
> Add Startek KD070WVFPA043-C069A 7" TFT LCD panel compatible string.
> 
> Signed-off-by: Fabio Estevam <festevam@denx.de>
> Acked-by: Sam Ravnborg <sam@ravnborg.org>
> ---
> Changes since v2:
> - None
> 
>   .../devicetree/bindings/display/panel/panel-simple.yaml         | 2 ++
>   1 file changed, 2 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/display/panel/panel-simple.yaml b/Documentation/devicetree/bindings/display/panel/panel-simple.yaml
> index 1eb9dd4f8f58..e190eef66872 100644
> --- a/Documentation/devicetree/bindings/display/panel/panel-simple.yaml
> +++ b/Documentation/devicetree/bindings/display/panel/panel-simple.yaml
> @@ -294,6 +294,8 @@ properties:
>         - starry,kr070pe2t
>           # Starry 12.2" (1920x1200 pixels) TFT LCD panel
>         - starry,kr122ea0sra
> +        # Startek KD070WVFPA043-C069A 7" TFT LCD panel
> +      - startek,kd070wvfpa
>           # Team Source Display Technology TST043015CMHX 4.3" WQVGA TFT LCD panel
>         - team-source-display,tst043015cmhx
>           # Tianma Micro-electronics TM070JDHG30 7.0" WXGA TFT LCD panel


Reviewed-by: Marek Vasut <marex@denx.de>
