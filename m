Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EEC62C41AF5
	for <lists+dri-devel@lfdr.de>; Fri, 07 Nov 2025 22:07:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4A1DE10EB89;
	Fri,  7 Nov 2025 21:07:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.whiteo.stw.pengutronix.de
 (metis.whiteo.stw.pengutronix.de [185.203.201.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2058A10EB7E
 for <dri-devel@lists.freedesktop.org>; Fri,  7 Nov 2025 21:07:13 +0000 (UTC)
Received: from ptz.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::77]
 helo=[127.0.0.1])
 by metis.whiteo.stw.pengutronix.de with esmtp (Exim 4.92)
 (envelope-from <a.fatoum@pengutronix.de>)
 id 1vHTeG-0001aK-Mg; Fri, 07 Nov 2025 22:05:32 +0100
Message-ID: <da41c891-db89-436f-a262-61dfd33d57f9@pengutronix.de>
Date: Fri, 7 Nov 2025 22:05:30 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RESEND v4 1/3] dt-bindings: lcdif: Document a imx6sx-lcdif
 fallback
To: Fabio Estevam <festevam@gmail.com>, Liu Ying <victor.liu@nxp.com>
Cc: marex@denx.de, stefan@agner.ch, airlied@gmail.com, simona@ffwll.ch,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 shawnguo@kernel.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org
References: <20251013205155.1187947-1-festevam@gmail.com>
 <4bd512fd-b3df-484a-8a04-a1ed066c42fa@nxp.com>
 <CAOMZO5AGRejEwNvkH0Di0HVi8QPduTeCSud+_GqOkD4tqEcsdA@mail.gmail.com>
 <37b8d968-a725-404e-8fd4-84c2a0bb464c@nxp.com>
 <CAOMZO5B+VcGxx9Xa6FFXxeka0qcqBmATrartguqMLMDK4fGduA@mail.gmail.com>
Content-Language: en-US
From: Ahmad Fatoum <a.fatoum@pengutronix.de>
In-Reply-To: <CAOMZO5B+VcGxx9Xa6FFXxeka0qcqBmATrartguqMLMDK4fGduA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:900:1d::77
X-SA-Exim-Mail-From: a.fatoum@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: dri-devel@lists.freedesktop.org
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

On 04.11.25 21:44, Fabio Estevam wrote:
> On Mon, Oct 20, 2025 at 11:53 PM Liu Ying <victor.liu@nxp.com> wrote:
>> On 10/20/2025, Fabio Estevam wrote:
>>> On Tue, Oct 14, 2025 at 1:12 AM Liu Ying <victor.liu@nxp.com> wrote:
>>>
>>>> Strictly speaking, I don't think i.MX6SX LCDIF is compatible with i.MX28 LCDIF
>>>> because at least i.MX28 LCDIF has the version and debug{0,1,2} registers(at
>>>> 0x1c0, 0x1d0, 0x1e0 and 0x1f0) while i.MX6SX LCDIF hasn't.

Thanks for pointing this out. In my opinion, these registers are auxiliary
and don't really change the compatibility situation as a functional driver
can be written without their use, evidenced by the Linux driver doing just
fine without using these registers.

>>> There are some DT users, such as Barebox that matches against
>>> fsl,imx28-lcdif, so we cannot remove it.
>>
>> Hmmm, it looks like software projects like Barebox don't really follow this DT
>> binding.  Is it possible to fix Barebox to avoid changing this DT binding by
>> this patch?  I'm assuming that Uboot has already been fixed.
> > What do you think?

I am sorry my prior feedback ended up stalling this series.

There is a lot of regressions happening due to upstream DT changes and I am
just trying to raise awareness. Another example I stumbled over today:
https://lore.kernel.org/all/91f764ab-bec1-4791-b01b-3ba0803ce8f8@pengutronix.de/


I have submitted a patch[1] to barebox adding explicit i.MX6 SoloX support,
so, having expressed my opinion above, please proceed as you see fit.

[1]: https://lore.barebox.org/barebox/20251107210033.2229781-3-a.fatoum@barebox.org/

Cheers,
Ahmad

> 
> Thanks
> 


-- 
Pengutronix e.K.                           |                             |
Steuerwalder Str. 21                       | http://www.pengutronix.de/  |
31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |
