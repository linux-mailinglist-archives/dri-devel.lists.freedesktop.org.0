Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A409852A61
	for <lists+dri-devel@lfdr.de>; Tue, 13 Feb 2024 09:00:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5448410E2B5;
	Tue, 13 Feb 2024 08:00:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=sigxcpu.org header.i=@sigxcpu.org header.b="cxrZ1tXQ";
	dkim=pass (2048-bit key) header.d=sigxcpu.org header.i=@sigxcpu.org header.b="YGGjLTNo";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from honk.sigxcpu.org (honk.sigxcpu.org [24.134.29.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3077010E2B5
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Feb 2024 08:00:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by honk.sigxcpu.org (Postfix) with ESMTP id DBA98FB03;
 Tue, 13 Feb 2024 09:00:35 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=sigxcpu.org; s=2024;
 t=1707811236; bh=yKmzIACGmln6cc4um1JqjafqS8ErymUzJ7el3Su2Bto=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=cxrZ1tXQ+DTiT2bXkMROARspyq8fRVtd7B1+JhuSxyS/ITRKvC94ETl0dOFXO4qfb
 7vqyewaas+9DiH2ZF3VJUdenX4oJL3P5qjdr0HH7TAJMJ+WpXM8z2XSUWxBpwTq8JY
 zjstmSjFI0jSH/w4tqYvxxk8YhoDbJzONDCWhofQ3kfaJNeixH+cFFKEw8FvyzZJwb
 wOIGBAZ2oVrE40PGkKWaJKOIZkkK7b5taRQUyNAimCOnAZtM8yLyVsTwwDSZwNLCQP
 LACHxDfGoU9/UwJoAkk0ZDTnilK8ifnrJuxEbNzOBPg0K8pzKLLldEjmZeICzooHbZ
 mC4YDrC3ikCgw==
Received: from honk.sigxcpu.org ([127.0.0.1])
 by localhost (honk.sigxcpu.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id AeDCnu0LeCGH; Tue, 13 Feb 2024 09:00:35 +0100 (CET)
Date: Tue, 13 Feb 2024 09:00:32 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=sigxcpu.org; s=2024;
 t=1707811235; bh=yKmzIACGmln6cc4um1JqjafqS8ErymUzJ7el3Su2Bto=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=YGGjLTNoQsDaOUQMux+e5bOF7f6QZY2pvlrtlF+ibfkO+J7IGcJ4ewWCM0S3TZ7iG
 cIJFnPG4KaKCnNtfDwWoQvndgQ23IdmIZh5VGUwtyfrdTzZucQS26FO5Ic5NRg2A7C
 5fuZhyHImzwk8FIPRKl9ZLW/h7AHfHPUVNY/z7po9aRTBf/GtO+Gsgd/Y2U+AnwfVY
 Vx3Q33c2qVz/n6OuABIAWXPmdHvcJwGoTyu8EPiXGRI7D8G8q2Y97shogfKfHY0AuC
 1wWfZhXnyFeA8oqpxCqrAzD6Hq7q+jsZvfQYyFuLhXV/rosdORDMuy3SCf91CTzb7/
 ww4oh2Jvot4XQ==
From: Guido =?iso-8859-1?Q?G=FCnther?= <agx@sigxcpu.org>
To: Chris Morgan <macroalpha82@gmail.com>
Cc: linux-rockchip@lists.infradead.org, devicetree@vger.kernel.org,
 dri-devel@lists.freedesktop.org, tzimmermann@suse.de,
 mripard@kernel.org, maarten.lankhorst@linux.intel.com,
 daniel@ffwll.ch, airlied@gmail.com, sam@ravnborg.org,
 quic_jesszhan@quicinc.com, neil.armstrong@linaro.org, megi@xff.cz,
 kernel@puri.sm, heiko@sntech.de, conor+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, robh+dt@kernel.org,
 Chris Morgan <macromorgan@hotmail.com>
Subject: Re: [PATCH 1/7] dt-bindings: display: st7703: Add Powkiddy RGB10MAX3
 panel
Message-ID: <ZcshoKi9cbhZQ6V5@qwark.sigxcpu.org>
References: <20240212184950.52210-1-macroalpha82@gmail.com>
 <20240212184950.52210-2-macroalpha82@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240212184950.52210-2-macroalpha82@gmail.com>
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

Hi,
On Mon, Feb 12, 2024 at 12:49:44PM -0600, Chris Morgan wrote:
> From: Chris Morgan <macromorgan@hotmail.com>
> 
> The RGB10MAX3 panel is a panel specific to the Powkiddy RGB10MAX3
> handheld device that measures 5 inches diagonally with a resolution
> of 720x1280.
> 
> Signed-off-by: Chris Morgan <macromorgan@hotmail.com>
> ---
>  .../devicetree/bindings/display/panel/rocktech,jh057n00900.yaml | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/display/panel/rocktech,jh057n00900.yaml b/Documentation/devicetree/bindings/display/panel/rocktech,jh057n00900.yaml
> index 97cccd8a8479..8dfe8951bf5b 100644
> --- a/Documentation/devicetree/bindings/display/panel/rocktech,jh057n00900.yaml
> +++ b/Documentation/devicetree/bindings/display/panel/rocktech,jh057n00900.yaml
> @@ -22,6 +22,8 @@ properties:
>      enum:
>        # Anberic RG353V-V2 5.0" 640x480 TFT LCD panel
>        - anbernic,rg353v-panel-v2
> +      # Powkiddy RGB10MAX3 5.0" 720x1280 TFT LCD panel
> +      - powkiddy,rgb10max3-panel
>        # Powkiddy RGB30 3.0" 720x720 TFT LCD panel
>        - powkiddy,rgb30-panel
>        # Rocktech JH057N00900 5.5" 720x1440 TFT LCD panel

Reviewed-by: Guido Günther <agx@sigxcpu.org>

Cheers,
 -- Guido

> -- 
> 2.34.1
> 
