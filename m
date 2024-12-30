Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D4E1A9FE347
	for <lists+dri-devel@lfdr.de>; Mon, 30 Dec 2024 08:33:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E878610E04D;
	Mon, 30 Dec 2024 07:33:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=yeah.net header.i=@yeah.net header.b="NETHTdzZ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-m16.yeah.net (mail-m16.yeah.net [1.95.21.15])
 by gabe.freedesktop.org (Postfix) with ESMTP id 54E1E10E04D
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Dec 2024 07:33:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
 s=s110527; h=Date:From:Subject:Message-ID:MIME-Version:
 Content-Type; bh=Ni0/JXBdNOrRusohFjRxi3utlOmJOryGodrzHL5Q1yM=;
 b=NETHTdzZPxV/6p/IBSYZ+MiJK/VNwXVHn+DM2oh2TVefCARJrwhk7stAltdKs5
 BK/4w7piqUwQxv8LUHufQYBjLoWI+vng4TvFJTPLLBsYEH4P+EHHN7hCdK/0HDJ1
 kBLOqP/vjyzTWSv1D7pxGNC5Zmd8A32NL0ce5hSSGy66g=
Received: from dragon (unknown [])
 by gzsmtp2 (Coremail) with SMTP id Ms8vCgAHbinJSXJnSekeBg--.61568S3;
 Mon, 30 Dec 2024 15:20:42 +0800 (CST)
Date: Mon, 30 Dec 2024 15:20:40 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: Fabio Estevam <festevam@gmail.com>
Cc: neil.armstrong@linaro.org, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, shawnguo@kernel.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 Fabio Estevam <festevam@denx.de>
Subject: Re: [PATCH v2 2/2] arm64: dts: imx8mm-phg: Add LVDS compatible string
Message-ID: <Z3JJyDsHSpH7jJuu@dragon>
References: <20241210105705.116116-1-festevam@gmail.com>
 <20241210105705.116116-2-festevam@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241210105705.116116-2-festevam@gmail.com>
X-CM-TRANSID: Ms8vCgAHbinJSXJnSekeBg--.61568S3
X-Coremail-Antispam: 1Uf129KBjvdXoWrKry8tw43Jr48KrW5uFWkCrg_yoWxCrgEkF
 1FvF4xCw47ZF48JF15Can5JFWUua1DCay3Awn8J3yqgw1v9FyrWF15tryUJrW8ArZxCr97
 tF45X3s5t39rGjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
 9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IU08MaUUUUUU==
X-Originating-IP: [114.216.146.204]
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiEgXFZWdyDiXY5AAAs1
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

On Tue, Dec 10, 2024 at 07:57:05AM -0300, Fabio Estevam wrote:
> From: Fabio Estevam <festevam@denx.de>
> 
> The imx8mm-phg board has an AUO G084SN05 V9 8.4" 800x600 LVDS panel.
> 
> Improve the devicetree description by passing the LVDS compatible
> string to fix the following dt-schema warning:
> 
> imx8mm-phg.dtb: panel: compatible:0: 'panel-lvds' is not one of
> ['admatec,9904379', 'auo,b101ew05', 'auo,g084sn05',
> 'chunghwa,claa070wp03xg','edt,etml0700z9ndha', 'hannstar,hsd101pww2',
> 'hydis,hv070wx2-1e0', 'jenson,bl-jt60050-01a', 'tbs,a711-panel']
> ...
> 
> Signed-off-by: Fabio Estevam <festevam@denx.de>

Applied, thanks!

