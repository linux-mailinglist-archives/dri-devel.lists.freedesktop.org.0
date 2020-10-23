Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C5899297255
	for <lists+dri-devel@lfdr.de>; Fri, 23 Oct 2020 17:31:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9203E6E113;
	Fri, 23 Oct 2020 15:31:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 138556E113
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Oct 2020 15:31:27 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: aratiu) with ESMTPSA id 03D1F1F4684E
From: Adrian Ratiu <adrian.ratiu@collabora.com>
To: Neil Armstrong <narmstrong@baylibre.com>, Ezequiel Garcia
 <ezequiel@collabora.com>, linux-arm-kernel@lists.infradead.org,
 devicetree@vger.kernel.org, linux-rockchip@lists.infradead.org, Laurent
 Pinchart <Laurent.pinchart@ideasonboard.com>
Subject: Re: [PATCH v9 00/11] Genericize DW MIPI DSI bridge and add i.MX 6
 driver
In-Reply-To: <e841d90b-0f1d-d5d9-9f67-f90d64c4fbc7@baylibre.com>
References: <20200609174959.955926-1-adrian.ratiu@collabora.com>
 <c6f10db1-7f56-a156-36a1-125e764c8c1a@baylibre.com>
 <87lfk3kaj4.fsf@iwork.i-did-not-set--mail-host-address--so-tickle-me>
 <b318069fe873e456f18d07d11f5d165667c9b04a.camel@collabora.com>
 <e0d0efec-09e0-6bf8-bab7-44accd14fa52@baylibre.com>
 <e841d90b-0f1d-d5d9-9f67-f90d64c4fbc7@baylibre.com>
Date: Fri, 23 Oct 2020 18:32:56 +0300
Message-ID: <87ft65vtxz.fsf@iwork.i-did-not-set--mail-host-address--so-tickle-me>
MIME-Version: 1.0
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
Cc: Jernej Skrabec <jernej.skrabec@siol.net>, Jonas Karlman <jonas@kwiboo.se>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Philippe CORNU <philippe.cornu@st.com>, Yannick FERTRE <yannick.fertre@st.com>,
 Andrzej Hajda <a.hajda@samsung.com>, linux-imx@nxp.com, kernel@collabora.com,
 linux-stm32@st-md-mailman.stormreply.com
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Neil,

On Tue, 15 Sep 2020, Neil Armstrong <narmstrong@baylibre.com> 
wrote:
> Hi Adrian, 
> 
> Gentle ping. 
> 
> can you rebase on drm-misc-next so I can apply the IMX and STM 
> patches ?

Sorry for the late reply, somehow missed this e-mail chain.

I have a rebase of the series but further investigation revealed 
we might regress Rockchip with a partial integration, so I'm 
getting a panel for RK to test to be sure and will re-submit.

>
> On 24/08/2020 11:47, Neil Armstrong wrote:
>> Hi,
>> 
>> 
>> On 15/08/2020 15:05, Ezequiel Garcia wrote:
>>> Hi Neil,
>>>
>>> On Wed, 2020-07-01 at 09:35 +0300, Adrian Ratiu wrote:
>>>> Hi Neil,
>>>>
>>>> On Mon, 29 Jun 2020, Neil Armstrong <narmstrong@baylibre.com> 
>>>> wrote:
>>>>> Hi Adrian, 
>>>>>
>>>>> On 09/06/2020 19:49, Adrian Ratiu wrote: 
>> [...]
>>>>
>>>
>>> It's been a month so I think it's a good idea to go forward
>>> applying IMX and STM patches (probably with the usual
>>> rebase dance).
>>>
>>> As for Rockchip...
>>>
>>>> The binding API removal change which directly touches RK can also 
>>>> be applied separately, but unfortunately I do not have access to a 
>>>> RK board with a DSI display to test it (or the bridge regmap logic 
>>>> on RK btw...), I just "eye-balled" the RK code based on the public 
>>>> docs and it LGTM.
>>>>
>>>
>>> ... I'll be getting some DSI hardware to help with the pending
>>> Rockchip issues, so we can tackle Rockchip as well. I'm quite sure
>>> we'll loop Heiko as well if needed :-)
>> 
>> Sure, Adrian, can you rebase on drm-misc-next so I can apply the IMX and STM patches ?
>> 
>>>
>>> Cheers,
>>> Ezequiel
>>>
>>>>> Neil
>>>>>
>>>>>> Big thank you to everyone who has contributed to this up to now,
>>>>>> Adrian
>>>>>>
>>>>>> Adrian Ratiu (11):
>>>>>>   drm: bridge: dw_mipi_dsi: add initial regmap infrastructure
>>>>>>   drm: bridge: dw_mipi_dsi: abstract register access using reg_fields
>>>>>>   drm: bridge: dw_mipi_dsi: add dsi v1.01 support
>>>>>>   drm: bridge: dw_mipi_dsi: remove bind/unbind API
>>>>>>   dt-bindings: display: add i.MX6 MIPI DSI host controller doc
>>>>>>   ARM: dts: imx6qdl: add missing mipi dsi properties
>>>>>>   drm: imx: Add i.MX 6 MIPI DSI host platform driver
>>>>>>   drm: stm: dw-mipi-dsi: let the bridge handle the HW version check
>>>>>>   drm: bridge: dw-mipi-dsi: split low power cfg register into fields
>>>>>>   drm: bridge: dw-mipi-dsi: fix bad register field offsets
>>>>>>   Documentation: gpu: todo: Add dw-mipi-dsi consolidation plan
>>>>>>
>>>>>>  .../display/imx/fsl,mipi-dsi-imx6.yaml        | 112 +++
>>>>>>  Documentation/gpu/todo.rst                    |  25 +
>>>>>>  arch/arm/boot/dts/imx6qdl.dtsi                |   8 +
>>>>>>  drivers/gpu/drm/bridge/synopsys/Kconfig       |   1 +
>>>>>>  drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi.c | 713 ++++++++++++------
>>>>>>  drivers/gpu/drm/imx/Kconfig                   |   8 +
>>>>>>  drivers/gpu/drm/imx/Makefile                  |   1 +
>>>>>>  drivers/gpu/drm/imx/dw_mipi_dsi-imx6.c        | 399 ++++++++++
>>>>>>  .../gpu/drm/rockchip/dw-mipi-dsi-rockchip.c   |   7 +-
>>>>>>  drivers/gpu/drm/stm/dw_mipi_dsi-stm.c         |  16 +-
>>>>>>  10 files changed, 1059 insertions(+), 231 deletions(-)
>>>>>>  create mode 100644 Documentation/devicetree/bindings/display/imx/fsl,mipi-dsi-imx6.yaml
>>>>>>  create mode 100644 drivers/gpu/drm/imx/dw_mipi_dsi-imx6.c
>>>>>>
>>>
>> 
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
