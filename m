Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EE83852A72
	for <lists+dri-devel@lfdr.de>; Tue, 13 Feb 2024 09:04:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B290910E1CE;
	Tue, 13 Feb 2024 08:04:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=sigxcpu.org header.i=@sigxcpu.org header.b="Hr9M4xuh";
	dkim=pass (2048-bit key) header.d=sigxcpu.org header.i=@sigxcpu.org header.b="ECbq23hU";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from honk.sigxcpu.org (honk.sigxcpu.org [24.134.29.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 593D410E1CE
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Feb 2024 08:04:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by honk.sigxcpu.org (Postfix) with ESMTP id 7E9A5FB05;
 Tue, 13 Feb 2024 09:04:19 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=sigxcpu.org; s=2024;
 t=1707811459; bh=zYMtwDFNNdylEZibK4LgoVQSY1dI+zems8RvSMNHedo=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Hr9M4xuhbFt5WPk0TctUss8hPKdE2JTNBi8yEZ5/6nGyx6TFzJtirB3BBNyJtKz/N
 sxp7ZN8eWz4QJAzce2sG9eGP7YOXBuBfTKZTMhzkcFR3nVq1kmoWq9r+9lH6n9jvLN
 3YGocieZrry3PYM5QoSjr0se6u36v+3v/sxcwzJswGZNMpaMXInlaJOJeO8Ji20a1j
 e2hXm5z/X/v8SFQ8+1c81lnpKCO+W+etTHEy7PRC1rWJQUpZwBlPV7njFOMeV6aY8x
 n9z+OHfg+7TW2zSxvKcP8sVX/ruqgNMPlQ1+i4OMe4BWuI/FmvhNQ/NkaxtzHlZ4rn
 5Aed9mTO2AMeA==
Received: from honk.sigxcpu.org ([127.0.0.1])
 by localhost (honk.sigxcpu.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id g3nQOoHFiO74; Tue, 13 Feb 2024 09:04:18 +0100 (CET)
Date: Tue, 13 Feb 2024 09:04:16 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=sigxcpu.org; s=2024;
 t=1707811458; bh=zYMtwDFNNdylEZibK4LgoVQSY1dI+zems8RvSMNHedo=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ECbq23hUw64uiw8QnL4Cv6UxNpmvfpn9h6irH6Twx0XtAbAP9XVb4y8xz1txRUq/g
 CCxhYweGrlouzyTCdqBY+9MtbsVBPDnW6f3cv39o9455+JeAHWpA/W/hkmLFN68YIt
 BZUkGSgDYYodNLFFeOgCIAtuQhYF6HWj4Ljbymekwz13SEfAP8xtrrVZDAAH0jKLUs
 3XX1eUtThIPoXYn0tFX2S1AHKZxP+Sa6YkUbFhuDtAEZdg7S3NXtPbQY4fTAzuGSwM
 McpXOi1diBJKrQ7J8lPWfm+vDOHtcjZFCm6mGMWU7/5BjZB3+Nad2kwZ778CLu0o3+
 QD4C+W2dWSF5A==
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
Subject: Re: [PATCH 3/7] dt-bindings: display: Document ST7703 panel rotation
Message-ID: <ZcsigBwmMoZeD1Vn@qwark.sigxcpu.org>
References: <20240212184950.52210-1-macroalpha82@gmail.com>
 <20240212184950.52210-4-macroalpha82@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240212184950.52210-4-macroalpha82@gmail.com>
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
On Mon, Feb 12, 2024 at 12:49:46PM -0600, Chris Morgan wrote:
> From: Chris Morgan <macromorgan@hotmail.com>
> 
> Document the rotation property for ST7703 based panels.
> 
> Signed-off-by: Chris Morgan <macromorgan@hotmail.com>
> ---
>  .../devicetree/bindings/display/panel/rocktech,jh057n00900.yaml | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/display/panel/rocktech,jh057n00900.yaml b/Documentation/devicetree/bindings/display/panel/rocktech,jh057n00900.yaml
> index 8dfe8951bf5b..97e0d14790e3 100644
> --- a/Documentation/devicetree/bindings/display/panel/rocktech,jh057n00900.yaml
> +++ b/Documentation/devicetree/bindings/display/panel/rocktech,jh057n00900.yaml
> @@ -46,6 +46,8 @@ properties:
>  
>    backlight: true
>  
> +  rotation: true
> +

I'd avoid newlines here:

  backlight: true
  rotation: true

(which also seems to match what other panels do). With that

Reviewd-by: Guido Günther <agx@sigxcpu.org>

Cheers,
 -- Guido


>  required:
>    - compatible
>    - reg
> -- 
> 2.34.1
> 
