Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B4A8817170E
	for <lists+dri-devel@lfdr.de>; Thu, 27 Feb 2020 13:23:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C0C376EC98;
	Thu, 27 Feb 2020 12:23:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk4.altibox.net (asavdk4.altibox.net [109.247.116.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B064D6EC98
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Feb 2020 12:23:34 +0000 (UTC)
Received: from ravnborg.org (unknown [158.248.194.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk4.altibox.net (Postfix) with ESMTPS id 0E14C804D0;
 Thu, 27 Feb 2020 13:23:26 +0100 (CET)
Date: Thu, 27 Feb 2020 13:23:25 +0100
From: Sam Ravnborg <sam@ravnborg.org>
To: "H. Nikolaus Schaller" <hns@goldelico.com>
Subject: Re: [RFC 0/8] MIPS: CI20: add HDMI out support
Message-ID: <20200227122325.GA7587@ravnborg.org>
References: <cover.1582744379.git.hns@goldelico.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <cover.1582744379.git.hns@goldelico.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=XpTUx2N9 c=1 sm=1 tr=0
 a=UWs3HLbX/2nnQ3s7vZ42gw==:117 a=UWs3HLbX/2nnQ3s7vZ42gw==:17
 a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=kj9zAlcOel0A:10 a=ptjrNaXRAAAA:8
 a=r_1tXGB3AAAA:8 a=ewWNKpoYB36fyWn1uZ8A:9 a=CjuIK1q_8ugA:10
 a=6TjziPoOuUJhFL2Tmcc1:22 a=t8nPyN_e6usw4ciXM-Pk:22
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
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 Paul Boddie <paul@boddie.org.uk>, Geert Uytterhoeven <geert+renesas@glider.be>,
 Paul Burton <paulburton@kernel.org>, linux-gpio@vger.kernel.org,
 David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Ralf Baechle <ralf@linux-mips.org>,
 linux-mips@vger.kernel.org, Paul Cercueil <paul@crapouillou.net>,
 Andi Kleen <ak@linux.intel.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzk@kernel.org>, kernel@pyra-handheld.com,
 letux-kernel@openphoenux.org, "Eric W. Biederman" <ebiederm@xmission.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Nikolaus.

On Wed, Feb 26, 2020 at 08:12:52PM +0100, H. Nikolaus Schaller wrote:
> This patch series adds HDMI output to the jz4780/CI20 board.
> 
> It is based on taking the old 3.18 vendor kernel and trying
> to achieve the same with modern DTS setup and new/modified
> drivers.
> 
> Unfortunately, in this first RFC, only EDID and creation of
> /dev/fb0 are working. Also, HDMI hot plugging is detected.
> 
> But there is no HDMI output signal. So some tiny piece seems
> to be missing to enable/configure the Synposys HDMI controller.
> 
> We need help from the community to fix this.
> 
> Note: device tree bindings are from 2015 and still seem to
> fit - except they are not in yaml format.
> 
> Original authors of most patches are
> * Paul Boddie <paul@boddie.org.uk>
> * Zubair Lutfullah Kakakhel <Zubair.Kakakhel@imgtec.com>
> 
> 
> H. Nikolaus Schaller (2):
>   drm: ingenic-drm: add MODULE_DEVICE_TABLE
>   MIPS: CI20: defconfig: configure for DRM_DW_HDMI_JZ4780
> 
> Paul Boddie (4):
>   drm: ingenic: add jz4780 Synopsys HDMI driver.
>   pinctrl: ingenic: add hdmi-ddc pin control group
>   MIPS: DTS: jz4780: account for Synopsys HDMI driver and LCD controller
>   MIPS: DTS: CI20: add HDMI setup
> 
> Zubair Lutfullah Kakakhel (2):
>   dt-bindings: video: Add jz4780-lcd binding
>   dt-bindings: video: Add jz4780-hdmi binding
> 
>  .../bindings/display/ingenic-jz4780-hdmi.txt  |  41 ++++++
>  .../bindings/display/ingenic-jz4780-lcd.txt   |  39 ++++++
New bindings in DT Schema format please...
We want to have then in a formal launguage so we can use these
to verify the DT files.

	Sam
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
