Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3319F506BB6
	for <lists+dri-devel@lfdr.de>; Tue, 19 Apr 2022 14:07:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2E81310F164;
	Tue, 19 Apr 2022 12:07:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 54D4110E2AE
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Apr 2022 12:07:00 +0000 (UTC)
Received: from [192.168.1.111] (91-156-85-209.elisa-laajakaista.fi
 [91.156.85.209])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id DBDDD25B;
 Tue, 19 Apr 2022 14:06:57 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1650370018;
 bh=0Xeowu0RhaZtA8PPIHf6S0q1sgEvMK0EbPNkXmVElWU=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=QD4vRkbtdEt/jjwbeO5ht1/C2/Ay4r7c43mTcue5NwcNvy/ZCkIqsSWtGB2es2ScJ
 F6CXO/c1XKEcqcsHT4DxDsRJ9e/GgFFw10M+JTRAiGlG6QEQP2bNWV0GR8vvGTVMkI
 1AtdzPj6b2AfYmbhkEJ83H1Vi0wtF56c9pbxCrdc=
Message-ID: <9e848e84-a31f-98ec-ed6b-c1dce022723b@ideasonboard.com>
Date: Tue, 19 Apr 2022 15:06:54 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH 0/2] Update register & interrupt info in am65x DSS
Content-Language: en-US
To: Aradhya Bhatia <a-bhatia1@ti.com>, Jyri Sarha <jyri.sarha@iki.fi>,
 Vignesh Raghavendra <vigneshr@ti.com>, Nishanth Menon <nm@ti.com>
References: <20220419070302.16502-1-a-bhatia1@ti.com>
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
In-Reply-To: <20220419070302.16502-1-a-bhatia1@ti.com>
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
Cc: Devicetree <devicetree@vger.kernel.org>,
 Nikhil Devshatwar <nikhil.nd@ti.com>,
 Linux ARM Kernel <linux-arm-kernel@lists.infradead.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Linux Kernel <linux-kernel@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 19/04/2022 10:03, Aradhya Bhatia wrote:
> The Display SubSystem IP on the ti's am65x soc has an additional
> register space "common1" and services a maximum of 2 interrupts.
> 
> The first patch in the series adds the required updates to the yaml
> file. The second patch then reflects the yaml updates in the DSS DT
> node of am65x soc.
> 
> Aradhya Bhatia (2):
>    dt-bindings: display: ti,am65x-dss: Add missing register & interrupt
>    arm64: dts: ti: k3-am65: Add missing register & interrupt in DSS node
> 
>   .../devicetree/bindings/display/ti/ti,am65x-dss.yaml   | 10 +++++++---
>   arch/arm64/boot/dts/ti/k3-am65-main.dtsi               |  6 ++++--
>   2 files changed, 11 insertions(+), 5 deletions(-)
> 

Reviewed-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>

How are you planning to use the common1 area?

  Tomi
