Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DF56B5510FE
	for <lists+dri-devel@lfdr.de>; Mon, 20 Jun 2022 09:08:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 66FA010E235;
	Mon, 20 Jun 2022 07:08:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 427 seconds by postgrey-1.36 at gabe;
 Sun, 19 Jun 2022 23:46:07 UTC
Received: from esa5.hgst.iphmx.com (esa5.hgst.iphmx.com [216.71.153.144])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3A897112FFD
 for <dri-devel@lists.freedesktop.org>; Sun, 19 Jun 2022 23:46:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1655682366; x=1687218366;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=+r2le/0cYQHWtPMNeCxIXB43Y8pcNDHfGVPeVoKPk1w=;
 b=l93Y/vmbsqfphSGiDsD4flHQFhpTdxPk9TbpoGVYWGyotRwAZM6sbHY2
 DEZJtDDvWsqCIfozxbTDJ77xBbft7bSRDMApF2HDXWHvr37HeesHI8zVt
 e8G1+uXTEP3b9CUBqGzvoa71+keZCk4GAX11y5ej6/XZFohOaGNj/JtCi
 eYVdUZ/80byqD6lkSoI682dDt6SkeuJbsaqPhjL2Y8ci+CYEA8c0EOmWf
 bmaBAcHICz13Sg3UPdI78RClTwLUlYqBjL5hBUEMfeJBt/cRNj/jmK+jc
 tWOHjzuI4kTmeJNrS94peDiw1Tjjs7Euj/HotH9A1njADG4u1A9h5qMuO g==;
X-IronPort-AV: E=Sophos;i="5.92,306,1650902400"; d="scan'208";a="203574749"
Received: from h199-255-45-15.hgst.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 20 Jun 2022 07:38:58 +0800
IronPort-SDR: +5B1qK7YpzMkFPPT9tvie7+8DNnr4boFfOGeDUaAymMMMPPJA9MjI435RffzG4AadvR0WdazJ4
 lfYs/SsfwMh9aUHTpTRS/YpKCpDFXzbBSLI7Kp7HB6pK+SWXikK7G9L5o7AEPeeKOQPB4YMjOO
 JDoLAlWlWHxl5JqRk8xENS3Y2grHmztBqTXaeg6Hmmo1jV1EEYW9o8Fxn1GqEltf51oEhM8iBy
 C9U/LztDmSTPnqK9GsCIVk8NQ1Epue8oBwyXopGB15LwcedYpjSdTA0wSMbMKThN1anaRs9bJB
 LlLq2JpUi0DQY9ixIlyPRami
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 19 Jun 2022 15:57:08 -0700
IronPort-SDR: bj9lNDq2Y7VhMtbY1B4PQynFs79VlZC8BV1eZdy+nMHEUFGMeLHPG0u+/WhlNfyogdkESImPb2
 JhnUPNQaKuRnnT2PY0xi4FHouVO1EwHSP54FDxQ2LyMIaqUXj9fNYncRZGv96+gMMMyCagMrRo
 f4LovnnCFzkpxRUQv1Sq6VrEOz3ihFiDlFO6pBi5buKdbGwYNbB9EPsuL2+aswCYtHy0rR5o0W
 CWpaKAeaua9gKJA8Z2QHatJFV8zmyN1EmhPGlxyDvpJjK7pY41ik1yis0efmQAV4Z7LlKMajI3
 5D4=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 19 Jun 2022 16:38:59 -0700
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4LR8PG1TZwz1SVp4
 for <dri-devel@lists.freedesktop.org>; Sun, 19 Jun 2022 16:38:58 -0700 (PDT)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:content-type
 :in-reply-to:organization:from:references:to:content-language
 :subject:user-agent:mime-version:date:message-id; s=dkim; t=
 1655681937; x=1658273938; bh=+r2le/0cYQHWtPMNeCxIXB43Y8pcNDHfGVP
 eVoKPk1w=; b=fPh0jM8V9qqPW70mFILfn0oH/t6YdTP5j5nYoQaZ3qzqvNZhES8
 wM/NZ1NWJD/pJVvr1BUFf56nUIKAwsRI79NnrEmtxFiYpNl1e2IS0zFLirGVF58/
 /lWr6pXDvMN/aYVUroAahjbEZ3SknQqMnzGVcpJcirHyRBVnLNNACBcjw5W+w6Oi
 xx3LXiZvDtQes/ej6dBQtE/0UxPugLIFRuNlvSSDxKfHYhgDS+DzquTgm9yhteAd
 zxF/VPlxKkDnt0awf+PKnINUx01IznqbpZtT9I8xQTuWk9QlIfY0Ibek5uE3g8+F
 SWNFWnA6DEKhg0NU7wr0hzVc03FtrycJvSA==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026)
 with ESMTP id k_mL3e0DUiiS for <dri-devel@lists.freedesktop.org>;
 Sun, 19 Jun 2022 16:38:57 -0700 (PDT)
Received: from [10.225.163.87] (unknown [10.225.163.87])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4LR8P82TBvz1Rvlc;
 Sun, 19 Jun 2022 16:38:52 -0700 (PDT)
Message-ID: <9cd60b3b-44fe-62ac-9874-80ae2223d078@opensource.wdc.com>
Date: Mon, 20 Jun 2022 08:38:50 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH 07/14] riscv: dts: canaan: fix the k210's memory node
Content-Language: en-US
To: Conor Dooley <mail@conchuod.ie>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>, Vinod Koul
 <vkoul@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Serge Semin <fancer.lancer@gmail.com>,
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, Palmer Dabbelt <palmer@rivosinc.com>
References: <20220618123035.563070-1-mail@conchuod.ie>
 <20220618123035.563070-8-mail@conchuod.ie>
From: Damien Le Moal <damien.lemoal@opensource.wdc.com>
Organization: Western Digital Research
In-Reply-To: <20220618123035.563070-8-mail@conchuod.ie>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Mailman-Approved-At: Mon, 20 Jun 2022 07:08:14 +0000
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
Cc: Niklas Cassel <niklas.cassel@wdc.com>, alsa-devel@alsa-project.org,
 Albert Ou <aou@eecs.berkeley.edu>, devicetree@vger.kernel.org,
 Masahiro Yamada <masahiroy@kernel.org>, linux-kernel@vger.kernel.org,
 Heng Sia <jee.heng.sia@intel.com>, linux-spi@vger.kernel.org,
 Conor Dooley <conor.dooley@microchip.com>, Jose Abreu <joabreu@synopsys.com>,
 Geert Uytterhoeven <geert@linux-m68k.org>, dri-devel@lists.freedesktop.org,
 Paul Walmsley <paul.walmsley@sifive.com>, dmaengine@vger.kernel.org,
 Thomas Gleixner <tglx@linutronix.de>, Dillon Min <dillon.minfei@gmail.com>,
 linux-riscv@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 6/18/22 21:30, Conor Dooley wrote:
> From: Conor Dooley <conor.dooley@microchip.com>
> 
> The k210 memory node has a compatible string that does not match with
> any driver or dt-binding & has several non standard properties.
> Replace the reg names with a comment and delete the rest.
> 
> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
> ---
> ---
>  arch/riscv/boot/dts/canaan/k210.dtsi | 6 ------
>  1 file changed, 6 deletions(-)
> 
> diff --git a/arch/riscv/boot/dts/canaan/k210.dtsi b/arch/riscv/boot/dts/canaan/k210.dtsi
> index 44d338514761..287ea6eebe47 100644
> --- a/arch/riscv/boot/dts/canaan/k210.dtsi
> +++ b/arch/riscv/boot/dts/canaan/k210.dtsi
> @@ -69,15 +69,9 @@ cpu1_intc: interrupt-controller {
>  
>  	sram: memory@80000000 {
>  		device_type = "memory";
> -		compatible = "canaan,k210-sram";
>  		reg = <0x80000000 0x400000>,
>  		      <0x80400000 0x200000>,
>  		      <0x80600000 0x200000>;
> -		reg-names = "sram0", "sram1", "aisram";
> -		clocks = <&sysclk K210_CLK_SRAM0>,
> -			 <&sysclk K210_CLK_SRAM1>,
> -			 <&sysclk K210_CLK_AI>;
> -		clock-names = "sram0", "sram1", "aisram";
>  	};

These are used by u-boot to setup the memory clocks and initialize the
aisram. Sure the kernel actually does not use this, but to be in sync with
u-boot DT, I would prefer keeping this as is. Right now, u-boot *and* the
kernel work fine with both u-boot internal DT and the kernel DT.

-- 
Damien Le Moal
Western Digital Research
