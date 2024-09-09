Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DD99497145E
	for <lists+dri-devel@lfdr.de>; Mon,  9 Sep 2024 11:50:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5B19410E35D;
	Mon,  9 Sep 2024 09:50:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="d6Wo3+Dz";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 72AF310E35D
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Sep 2024 09:50:11 +0000 (UTC)
Received: from [192.168.88.20] (91-156-87-48.elisa-laajakaista.fi
 [91.156.87.48])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id EF2742C6;
 Mon,  9 Sep 2024 11:48:52 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1725875334;
 bh=gXQyLs4Falod6BhS9AqrAuvVHD5ygStW1u0vafdUDUM=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=d6Wo3+Dzy3rjRoFaYxBJqW4T5DCoWreSynSohVQfzz4mAMSgyFoJ/mWkZ3RJlhH25
 Del03H00/kXAV4Z2RYvW4Gb0kJzfyZ0XIK8ddOLc/9ukOhEfxvGwqxt3emt07p0wZz
 hwtmgMxcvJBGAPShVEYbcwMUkOOcsrvlHKsYHMLs=
Message-ID: <d5f7d7f7-8e85-4aa1-ae27-b14a4e749021@ideasonboard.com>
Date: Mon, 9 Sep 2024 12:50:05 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 0/4] drm/tidss: Add OLDI bridge support
To: Aradhya Bhatia <aradhya.bhatia@linux.dev>,
 Francesco Dolcini <francesco@dolcini.it>, max.krummenacher@toradex.com
Cc: Jyri Sarha <jyri.sarha@iki.fi>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 DRI Development List <dri-devel@lists.freedesktop.org>,
 Devicetree List <devicetree@vger.kernel.org>,
 Linux Kernel List <linux-kernel@vger.kernel.org>, Nishanth Menon
 <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>,
 Praneeth Bajjuri <praneeth@ti.com>, Udit Kumar <u-kumar1@ti.com>,
 Alexander Sverdlin <alexander.sverdlin@siemens.com>,
 Randolph Sapp <rs@ti.com>, Devarsh Thakkar <devarsht@ti.com>,
 Jayesh Choudhary <j-choudhary@ti.com>, Jai Luthra <j-luthra@ti.com>
References: <20240716084248.1393666-1-a-bhatia1@ti.com>
 <20240906114311.GA32916@francesco-nb>
 <c60d518b-ace4-48a8-87e5-35de13bc426a@ideasonboard.com>
 <b8c5d719-5214-4e3a-84c5-b8767cd6ab7e@linux.dev>
Content-Language: en-US
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Autocrypt: addr=tomi.valkeinen@ideasonboard.com; keydata=
 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
In-Reply-To: <b8c5d719-5214-4e3a-84c5-b8767cd6ab7e@linux.dev>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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

On 09/09/2024 12:31, Aradhya Bhatia wrote:
> Hi,
> 
> Thank you, Francesco and Max, for testing and reporting this!
> 
> On 09/09/24 13:45, Tomi Valkeinen wrote:
>> Hi,
>>
>> On 06/09/2024 14:43, Francesco Dolcini wrote:
>>> +Max
>>>
>>> Hello Aradhya,
>>>
>>> On Tue, Jul 16, 2024 at 02:12:44PM +0530, Aradhya Bhatia wrote:
>>>> The addition of the 2nd OLDI TX (and a 2nd DSS in AM62Px) creates a need
>>>> for some major changes for a full feature experience.
>>>>
>>>> 1. The OF graph needs to be updated to accurately show the data flow.
>>>> 2. The tidss and OLDI drivers now need to support the dual-link and the
>>>>      cloned single-link OLDI video signals.
>>>> 3. The drivers also need to support the case where 2 OLDI TXes are
>>>>      connected to 2 different VPs - thereby creating 2 independent
>>>> streams
>>>>      of single-link OLDI outputs.
>>>
>>> Have you considered/tested the use case in which only single link is
>>> used?
>>> You do not mention it here and to me this is a relevant use case.
>>>
>>> There is a workaround for this (use option 2, cloned, even if nothing is
>>> connected to the second link), but this seems not correct.
> 
> I agree. The whole idea behind the series is to be able to accurately
> describe the hardware. Putting the devicetree in clone mode in order to
> get the single-link mode working is far from ideal.

Btw, with the fw_devlink=off hack, and removing the second link from 
k3-am625-sk-microtips-mf101hie-panel.dtso, is still not enough, as the 
k3-am62-main.dtsi contains the ti,companion-oldi property which makes 
the driver think it's a cloning case.

So, I think, either the ti,companion-oldi and ti,secondary-oldi should 
only be set in the overlay when setting up cloning/dual-link, or the 
companion-oldi property shouldn't actually make a difference, and the 
selection between clone and single-link should be done via some other means.

>>> We (Max in Cc here) noticed that this specific use case is broken on
>>> your downstream v6.6 TI branch.
> 
> Yes, it was been brought to my attention that the single-link usecase is
> not working over the downstream ti-6.6 kernel. As I have since
> discovered, it's not working on this series either.
> 
> For some reason, the supplier-consumer dependency between the OLDI and
> the panel devicetree nodes is not getting flagged as `FWLINK_FLAG_CYCLE`
> in cases of single-link configuration.
> 
> This flag allows the panel driver to continue to probe without waiting
> for the OLDI driver (panel's supplier). Absence of the flag getting set
> is causing these drivers to keep deferring probe in an endless cycle.
> 
> Even with the flag, the OLDI (and tidss) cannot complete probe until the
> panel driver is probed and ready. That is because the OLDI (and tidss)
> need the panel to continue with the bridge-chain creation.
> 
> However, over with the dual-lvds configuration (and as Francesco has
> now mentioned the clone configuration as well), the flag gets set by
> default, and everything works.
> 
> This is what the debug has led to, so far.

Yes, I came to the same conclusion with my debug.

>>
>> What if you set "fw_devlink=off" kernel boot parameter?
>>
> 
> Yes! I haven't tested it, but it seems that this will bypass the
> supplier check and let the panel probe continue.
> 
> 
> Tomi, any idea, why is this issue happening only for single-link in the
> first place? It seems as if having 2 ports inside the panel devicetree
> lets the probe mechanism recognize the circular dependency and ignore
> the supplier OLDIs?

I have to say I have no idea...

I don't really understand the devlink code here, but I'm guessing that 
the "cycle" part comes from the fact that with a media graph we have 
links (remote-endpoint) both ways in the DT data. So it's not possible 
to say which side is the consumer, which one is the supplier. Thus, it's 
marked as a cycle and, I think, basically ignored for the probing purpose.

But why not here? I can see the links being created both ways:

/display Linked as a fwnode consumer to 
/bus@f0000/dss@30200000/oldi-txes/oldi@0
/bus@f0000/dss@30200000/oldi-txes/oldi@0 Linked as a fwnode consumer to 
/display

but it's never marked as a cycle.

> This is the function where the difference comes down to, by the way -
> __fw_devlink_relax_cycles(), per my knowledge. I am still on my way to
> understand what exactly it is doing and why is it not relaxing the
> single-link case.

Yep. The answer is probably somewhere there =).

  Tomi

