Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C8AB040894C
	for <lists+dri-devel@lfdr.de>; Mon, 13 Sep 2021 12:44:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8BF9B6E157;
	Mon, 13 Sep 2021 10:44:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from lb1-smtp-cloud7.xs4all.net (lb1-smtp-cloud7.xs4all.net
 [IPv6:2001:888:0:108::1a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A09376E157
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Sep 2021 10:44:15 +0000 (UTC)
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
 by smtp-cloud7.xs4all.net with ESMTPA
 id PjKdmYA5MpQdWPjKem2WJ4; Mon, 13 Sep 2021 12:37:00 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
 t=1631529420; bh=pmZak51jVw9LOZpdrL6UGBR/GrisLVXFjv5j8CBgpT0=;
 h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
 Subject;
 b=eKBfUVJYPnpCPaeZyPVYGx9dqPMioL8SFANkSpv0PCSf4P1s2ZPzDBFu9/nXY6yH2
 e0HeFmgPuvqGhF7iz/T9v9oOjld/w7xt5ORLIyIuJUZcJ3hYqhuIVbOfwSW+4Ftgs0
 pjGcFN027doqWbZEFdPHWRkncTllRldolMmJ0Jqu1JdfyWtsKBGpXj5bO6TazHMi08
 tdFswL1JJVic6rG9xSZ1vMXOMpwrd7LndPaBR1CiKMCGJ38XbDMfmqal9AP4AF91Xj
 ebnl0cfxXGVjmul6dvnhBJGRyBZ4EYHgAXvTbO07ZJnDL9NyYUvx2hL2tR8dNqghNz
 tL4GdMqAS2Fuw==
Subject: Re: [PATCH v11 23/34] media: dt: bindings: tegra-vde: Document OPP
 and power domain
To: Dmitry Osipenko <digetx@gmail.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, Ulf Hansson
 <ulf.hansson@linaro.org>, Viresh Kumar <vireshk@kernel.org>,
 Stephen Boyd <sboyd@kernel.org>, Peter De Schrijver
 <pdeschrijver@nvidia.com>, Mikko Perttunen <mperttunen@nvidia.com>,
 Peter Chen <peter.chen@kernel.org>, Mark Brown <broonie@kernel.org>,
 Lee Jones <lee.jones@linaro.org>,
 =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <u.kleine-koenig@pengutronix.de>,
 Nishanth Menon <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>,
 Richard Weinberger <richard@nod.at>,
 Miquel Raynal <miquel.raynal@bootlin.com>, Lucas Stach <dev@lynxeye.de>,
 Stefan Agner <stefan@agner.ch>, Adrian Hunter <adrian.hunter@intel.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring
 <robh+dt@kernel.org>, Michael Turquette <mturquette@baylibre.com>
Cc: linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org,
 linux-pm@vger.kernel.org, linux-usb@vger.kernel.org,
 linux-staging@lists.linux.dev, linux-spi@vger.kernel.org,
 linux-pwm@vger.kernel.org, linux-mtd@lists.infradead.org,
 linux-mmc@vger.kernel.org, linux-media@vger.kernel.org,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-clk@vger.kernel.org
References: <20210912200832.12312-1-digetx@gmail.com>
 <20210912200832.12312-24-digetx@gmail.com>
From: Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <03846b87-6235-4ec4-0f6b-a9a888e0452e@xs4all.nl>
Date: Mon, 13 Sep 2021 12:36:59 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210912200832.12312-24-digetx@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4xfJGp+P1+1KIcOMgV32T3yhr923OcCL6/wUgJil5v7QWOOP0Zhj/WgNktUtF9PouVN93W6glH/2kdp/M/y5S07oUJCcQvwyLfCPTVaw2Dszv/oabbNhmQ
 oFuzCetEg8ofIfF8vqL0fULFUZKJedzqIARGayuWOMhLOKilSixA841OJYWhqxXzn9DP1W3PYyFVJV6PnISQJighPE3R/TzqK32UcI55jHK94SWFsdMGl+QU
 kqMyij9fqa9tL1zWDSRQYgBdCUets1Vk3aGi9/rOERQ2qwzKrz39iEhzekpGRMVkcnK2HgAOCRK5Z9Aacy4/syqYzFA3eGoLzZndlbzuyTKHMCmylRevB//V
 WEL9ZDWYDqSOqVmqHYCm6V8SE75AjCOwMuqzmvwYLOtXsh3QAX0G8OBXkk5tVBSE7gypcE5NL4amI3wZdxOcR5cgpGrKf1lUYe9Cu1M7mrl8mwiNYjZ+w/7Q
 zh4AWT5+UPVekYKKGrz93eD7I2xVxK8qJhfNL2y1Aup63pe1gby0163kFDAInmrnZvpSkE2POtuZD/XsXob3wbqqM2vlujy9pir71bXk97qwMeHU1U5NO/DY
 cU8OtE/Qw7XwOQEJwE7ABkRkiSAZ3r7ihUzlVFDPGDWV4sBh7BFHv+5VmAxSIguOYRpRwhzw2a6o2IFnykdVzQ1/a4rFhNC/N2bw9HwMBd7rCzogaty1g32X
 S2GEwXcKPHyjglR/Ya4vBRJWyD5+FenQnxroHTnOJvPwqhnFRb4549L5U3U1Nnbbvk++9Ih0bC/1C8fiFA6N4dRxGKPp33gosiXCRHHyccoNIn4GyojDiMMV
 1kBvYNtab/Vay9WBDCCtGLA8RB41v1Kj95/SCTXCWRNIdtPKqMwK0kjJ/p3JYdYr3c8I+2vSzElu31GZdky7VZh3MAe8sKYTc7yvp5ST0qDWlukb2bBKOMZE
 6Poq+10P3xEvReeU3j9hkxza2xLVGuWk2viD7LQjuLplObCr3m2HESKwdKcvjwuqo+hqVMiltl+dzW7Gj+DRSVBhe2TEPw/0TY0488IQ2LvDq45JCNiMWaL2
 zfwqXTlEsPMwM5OVEZvLAY8uELfRzxk2n9/L7Kga7jtL06UQFbTM6bC95CbGH9z9fWEOn7b4g3tN9lYgaUgNhmRHON/s9fwB5oB2UEG/Ew6xtlI5sUwFjif3
 PN7zHRKa3c8Ksb5pQfUdCs20Pe9xeZc1LEpkl3LAvHOUdh7dfetF5mQpaYQY8z6Ri5jgrAPMgF4cV1POl4RJCvrowJ2dgdU1cGZTXbqiB19W622pBgKcxeyM
 WmxEFei8okYUFvM5+lHKpd5+AIIBguVKnzqNKxXY7PxhfJ8rAKuTUoDlf067hrUDr6+K51FSXFzs9L3u3opk63Ik+4BglUdrLerpdCuVJD3Eyg3SiT9kfjz2
 1CJ0ScmOaqygyuQnfakSFzFa1nVTyrgQ7pg35A==
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

On 12/09/2021 22:08, Dmitry Osipenko wrote:
> Document new OPP table and power domain properties of the video decoder
> hardware.
> 
> Reviewed-by: Rob Herring <robh@kernel.org>
> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>

Acked-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>

Regards,

	Hans

> ---
>  .../devicetree/bindings/media/nvidia,tegra-vde.yaml  | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/media/nvidia,tegra-vde.yaml b/Documentation/devicetree/bindings/media/nvidia,tegra-vde.yaml
> index 3b6c1f031e04..0b7d4d815707 100644
> --- a/Documentation/devicetree/bindings/media/nvidia,tegra-vde.yaml
> +++ b/Documentation/devicetree/bindings/media/nvidia,tegra-vde.yaml
> @@ -68,6 +68,16 @@ properties:
>      description:
>        Phandle of the SRAM MMIO node.
>  
> +  operating-points-v2:
> +    description:
> +      Should contain freqs and voltages and opp-supported-hw property,
> +      which is a bitfield indicating SoC speedo or process ID mask.
> +
> +  power-domains:
> +    maxItems: 1
> +    description:
> +      Phandle to the SoC core power domain.
> +
>  required:
>    - compatible
>    - reg
> @@ -104,4 +114,6 @@ examples:
>        reset-names = "vde", "mc";
>        resets = <&rst 61>, <&mem 13>;
>        iommus = <&mem 15>;
> +      operating-points-v2 = <&dvfs_opp_table>;
> +      power-domains = <&domain>;
>      };
> 

