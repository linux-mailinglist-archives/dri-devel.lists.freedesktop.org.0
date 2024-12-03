Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D4B29E2B00
	for <lists+dri-devel@lfdr.de>; Tue,  3 Dec 2024 19:36:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 68A3610E142;
	Tue,  3 Dec 2024 18:36:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="ksOrMPfR";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DB5D510E142
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Dec 2024 18:36:09 +0000 (UTC)
Received: from [192.168.88.20] (91-157-155-49.elisa-laajakaista.fi
 [91.157.155.49])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id E60BA670;
 Tue,  3 Dec 2024 19:35:39 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1733250941;
 bh=TcGLLUD9uMOYsuBJvRw54mbBra/9tntvzY8X8oSktKU=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=ksOrMPfRxzfbTdTiQiz0cKEqBrcsN2Q0uB5vplNoLNLa6rFck6UJvRR1oAbjUsuo8
 074vFhXVLAmyXLWe4WckW4ZpMshHf+aQuYtFkX35hceq6wvbPE3IJVQMBSfy9sRt82
 peeUF6tPe7eTJeMxVmCXVnzOR0SFfVs6BI5XO8Ho=
Message-ID: <9ade7a5d-dd87-4a08-9fdd-c24eb20e733c@ideasonboard.com>
Date: Tue, 3 Dec 2024 20:36:04 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 0/3] drm/tidss: Add OLDI bridge support
To: Aradhya Bhatia <aradhya.bhatia@linux.dev>
Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Nishanth Menon
 <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>,
 Devarsh Thakkar <devarsht@ti.com>, Praneeth Bajjuri <praneeth@ti.com>,
 Udit Kumar <u-kumar1@ti.com>, Jayesh Choudhary <j-choudhary@ti.com>,
 Francesco Dolcini <francesco@dolcini.it>,
 Alexander Sverdlin <alexander.sverdlin@siemens.com>,
 Max Krummenacher <max.oss.09@gmail.com>,
 DRI Development List <dri-devel@lists.freedesktop.org>,
 Devicetree List <devicetree@vger.kernel.org>,
 Linux Kernel List <linux-kernel@vger.kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Jyri Sarha <jyri.sarha@iki.fi>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <mripard@kernel.org>,
 David Airlie <airlied@gmail.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Simona Vetter <simona@ffwll.ch>
References: <20241124143649.686995-1-aradhya.bhatia@linux.dev>
 <8b57d6a4-6bc1-4542-abf4-8bc4a3120c25@ideasonboard.com>
 <b8bde033-13a8-4726-a9ff-2fa4eff898e1@linux.dev>
Content-Language: en-US
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Autocrypt: addr=tomi.valkeinen@ideasonboard.com; keydata=
 xsFNBE6ms0cBEACyizowecZqXfMZtnBniOieTuFdErHAUyxVgtmr0f5ZfIi9Z4l+uUN4Zdw2
 wCEZjx3o0Z34diXBaMRJ3rAk9yB90UJAnLtb8A97Oq64DskLF81GCYB2P1i0qrG7UjpASgCA
 Ru0lVvxsWyIwSfoYoLrazbT1wkWRs8YBkkXQFfL7Mn3ZMoGPcpfwYH9O7bV1NslbmyJzRCMO
 eYV258gjCcwYlrkyIratlHCek4GrwV8Z9NQcjD5iLzrONjfafrWPwj6yn2RlL0mQEwt1lOvn
 LnI7QRtB3zxA3yB+FLsT1hx0va6xCHpX3QO2gBsyHCyVafFMrg3c/7IIWkDLngJxFgz6DLiA
 G4ld1QK/jsYqfP2GIMH1mFdjY+iagG4DqOsjip479HCWAptpNxSOCL6z3qxCU8MCz8iNOtZk
 DYXQWVscM5qgYSn+fmMM2qN+eoWlnCGVURZZLDjg387S2E1jT/dNTOsM/IqQj+ZROUZuRcF7
 0RTtuU5q1HnbRNwy+23xeoSGuwmLQ2UsUk7Q5CnrjYfiPo3wHze8avK95JBoSd+WIRmV3uoO
 rXCoYOIRlDhg9XJTrbnQ3Ot5zOa0Y9c4IpyAlut6mDtxtKXr4+8OzjSVFww7tIwadTK3wDQv
 Bus4jxHjS6dz1g2ypT65qnHen6mUUH63lhzewqO9peAHJ0SLrQARAQABzTBUb21pIFZhbGtl
 aW5lbiA8dG9taS52YWxrZWluZW5AaWRlYXNvbmJvYXJkLmNvbT7CwY4EEwEIADgWIQTEOAw+
 ll79gQef86f6PaqMvJYe9QUCX/HruAIbAwULCQgHAgYVCgkICwIEFgIDAQIeAQIXgAAKCRD6
 PaqMvJYe9WmFD/99NGoD5lBJhlFDHMZvO+Op8vCwnIRZdTsyrtGl72rVh9xRfcSgYPZUvBuT
 VDxE53mY9HaZyu1eGMccYRBaTLJSfCXl/g317CrMNdY0k40b9YeIX10feiRYEWoDIPQ3tMmA
 0nHDygzcnuPiPT68JYZ6tUOvAt7r6OX/litM+m2/E9mtp8xCoWOo/kYO4mOAIoMNvLB8vufi
 uBB4e/AvAjtny4ScuNV5c5q8MkfNIiOyag9QCiQ/JfoAqzXRjVb4VZG72AKaElwipiKCWEcU
 R4+Bu5Qbaxj7Cd36M/bI54OrbWWETJkVVSV1i0tghCd6HHyquTdFl7wYcz6cL1hn/6byVnD+
 sR3BLvSBHYp8WSwv0TCuf6tLiNgHAO1hWiQ1pOoXyMEsxZlgPXT+wb4dbNVunckwqFjGxRbl
 Rz7apFT/ZRwbazEzEzNyrBOfB55xdipG/2+SmFn0oMFqFOBEszXLQVslh64lI0CMJm2OYYe3
 PxHqYaztyeXsx13Bfnq9+bUynAQ4uW1P5DJ3OIRZWKmbQd/Me3Fq6TU57LsvwRgE0Le9PFQs
 dcP2071rMTpqTUteEgODJS4VDf4lXJfY91u32BJkiqM7/62Cqatcz5UWWHq5xeF03MIUTqdE
 qHWk3RJEoWHWQRzQfcx6Fn2fDAUKhAddvoopfcjAHfpAWJ+ENc7BTQROprNHARAAx0aat8GU
 hsusCLc4MIxOQwidecCTRc9Dz/7U2goUwhw2O5j9TPqLtp57VITmHILnvZf6q3QAho2QMQyE
 DDvHubrdtEoqaaSKxKkFie1uhWNNvXPhwkKLYieyL9m2JdU+b88HaDnpzdyTTR4uH7wk0bBa
 KbTSgIFDDe5lXInypewPO30TmYNkFSexnnM3n1PBCqiJXsJahE4ZQ+WnV5FbPUj8T2zXS2xk
 0LZ0+DwKmZ0ZDovvdEWRWrz3UzJ8DLHb7blPpGhmqj3ANXQXC7mb9qJ6J/VSl61GbxIO2Dwb
 xPNkHk8fwnxlUBCOyBti/uD2uSTgKHNdabhVm2dgFNVuS1y3bBHbI/qjC3J7rWE0WiaHWEqy
 UVPk8rsph4rqITsj2RiY70vEW0SKePrChvET7D8P1UPqmveBNNtSS7In+DdZ5kUqLV7rJnM9
 /4cwy+uZUt8cuCZlcA5u8IsBCNJudxEqBG10GHg1B6h1RZIz9Q9XfiBdaqa5+CjyFs8ua01c
 9HmyfkuhXG2OLjfQuK+Ygd56mV3lq0aFdwbaX16DG22c6flkkBSjyWXYepFtHz9KsBS0DaZb
 4IkLmZwEXpZcIOQjQ71fqlpiXkXSIaQ6YMEs8WjBbpP81h7QxWIfWtp+VnwNGc6nq5IQDESH
 mvQcsFS7d3eGVI6eyjCFdcAO8eMAEQEAAcLBXwQYAQIACQUCTqazRwIbDAAKCRD6PaqMvJYe
 9fA7EACS6exUedsBKmt4pT7nqXBcRsqm6YzT6DeCM8PWMTeaVGHiR4TnNFiT3otD5UpYQI7S
 suYxoTdHrrrBzdlKe5rUWpzoZkVK6p0s9OIvGzLT0lrb0HC9iNDWT3JgpYDnk4Z2mFi6tTbq
 xKMtpVFRA6FjviGDRsfkfoURZI51nf2RSAk/A8BEDDZ7lgJHskYoklSpwyrXhkp9FHGMaYII
 m9EKuUTX9JPDG2FTthCBrdsgWYPdJQvM+zscq09vFMQ9Fykbx5N8z/oFEUy3ACyPqW2oyfvU
 CH5WDpWBG0s5BALp1gBJPytIAd/pY/5ZdNoi0Cx3+Z7jaBFEyYJdWy1hGddpkgnMjyOfLI7B
 CFrdecTZbR5upjNSDvQ7RG85SnpYJTIin+SAUazAeA2nS6gTZzumgtdw8XmVXZwdBfF+ICof
 92UkbYcYNbzWO/GHgsNT1WnM4sa9lwCSWH8Fw1o/3bX1VVPEsnESOfxkNdu+gAF5S6+I6n3a
 ueeIlwJl5CpT5l8RpoZXEOVtXYn8zzOJ7oGZYINRV9Pf8qKGLf3Dft7zKBP832I3PQjeok7F
 yjt+9S+KgSFSHP3Pa4E7lsSdWhSlHYNdG/czhoUkSCN09C0rEK93wxACx3vtxPLjXu6RptBw
 3dRq7n+mQChEB1am0BueV1JZaBboIL0AGlSJkm23kw==
In-Reply-To: <b8bde033-13a8-4726-a9ff-2fa4eff898e1@linux.dev>
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

Hi,

On 03/12/2024 20:14, Aradhya Bhatia wrote:
> Hi,
> 
> On 03/12/24 17:42, Tomi Valkeinen wrote:
>> Hi,
>>
>> On 24/11/2024 16:36, Aradhya Bhatia wrote:
>>> Hello all,
>>>
>>> This patch series add support for the dual OLDI TXes supported in Texas
>>> Instruments' AM62x and AM62Px family of SoCs. The OLDI TXes support
>>> single-lvds
>>> lvds-clone, and dual-lvds modes. These have now been represented
>>> through DRM
>>> bridges within TI-DSS.
>>>
>>>    - Some history and hardware description for this patch series.
>>>
>>> This patch series is a complete re-vamp from the previously posted
>>> series[1] and
>>> hence, the version index has been reset to v1. The OLDI support from
>>> that series
>>> was dropped and only the base support for AM62x DSS was kept (and
>>> eventually
>>> merged)[2].
>>>
>>> The OLDI display that the tidss driver today supports, could not be
>>> extended for
>>> the newer SoCs. The OLDI display in tidss is modelled after the DSS
>>> and OLDI
>>> hardware in the AM65x SoC. The DSS in AM65x SoC, has two video-ports.
>>> Both these
>>> video-ports (VP) output DPI video signals. One of the DPI output (from
>>> VP1) from
>>> the DSS connects to a singular OLDI TX present inside the SoC. There
>>> is no other
>>> way for the DPI from VP1 to be taken out of the SoC. The other DPI output
>>> however - the one from VP2 - is taken out of the SoC as is. Hence we
>>> have an
>>> OLDI bus output and a DPI bus output from the SoC. Since the VP1 and
>>> OLDI are
>>> tightly coupled, the tidss driver considers them as a single entity.
>>> That is
>>> why, any OLDI sink connects directly to the DSS ports in the OF graphs.
>>>
>>> The newer SoCs have varying DSS and OLDI integrations.
>>>
>>> The AM62x DSS also has 2 VPs. The 2nd VP, VP2, outputs DPI signals
>>> which are
>>> taken out of the SoC - similar to the AM65x above. For the VP1, there
>>> are 2 OLDI
>>> TXes. These OLDI TXes can only receive DPI signals from VP1, and don't
>>> connect
>>> to VP2 at all.
>>>
>>> The AM62Px SoC has 2 OLDI TXes like AM62x SoC. However, the AM62Px SoC
>>> also has
>>> 2 separate DSSes. The 2 OLDI TXes can now be shared between the 2 VPs
>>> of the 2
>>> DSSes.
>>>
>>> The addition of the 2nd OLDI TX (and a 2nd DSS in AM62Px) creates a
>>> need for
>>> some major changes for a full feature experience.
>>>
>>> 1. The OF graph needs to be updated to accurately show the data flow.
>>> 2. The tidss and OLDI drivers now need to support the dual-link and
>>> the cloned
>>>      single-link OLDI video signals.
>>> 3. The drivers also need to support the case where 2 OLDI TXes are
>>> connected to
>>>      2 different VPs - thereby creating 2 independent streams of
>>> single-link OLDI
>>>      outputs.
>>>
>>> Note that the OLDI does not have registers of its own. It is still
>>> dependent on
>>> the parent VP. The VP that provides the DPI video signals to the OLDI
>>> TXes, also
>>> gives the OLDI TXes all the config data. That is to say, the hardware
>>> doesn't
>>> sit on the bus directly - but does so through the DSS.
>>>
>>> In light of all of these hardware variations, it was decided to have a
>>> separate
>>> OLDI driver (unlike AM65x) but not entirely separate so as to be a
>>> platform
>>> device. The OLDI TXes are now being represented as DRM bridges under
>>> the tidss.
>>>
>>> Also, since the DRM framework only really supports a linear encoder-
>>> bridge
>>> chain, the OLDI driver creates a DRM bridge ONLY for the primary OLDI
>>> TX in
>>> cases of dual-link or cloned single-link OLDI modes. That bridge then
>>> attaches
>>
>> How does the clone case work, then? There are two panels, what does the
>> second one connect to?
> 
> For the clone case, the devicetree will show the true connections - as
> they are in the hardware.
> 
> 2 endpoints from a single DSS VP devicetree port will be connected to 2
> OLDIs, OLDI0 and OLDI1. The outputs of these OLDIs will be connected to
> 2 distinct single-link panels.
> 
> The driver and DRM side of things do not show the same picture, however.
> The tidss_oldi code creates and registers a drm_bridge only for the
> primary OLDI. The driver is capable of detecting the expected OLDI mode,
> and if a companion OLDI is present, then the primary OLDI drm_bridge
> keeps a note of that.
> 
> The clock and config resources are shared between the primary and
> companion OLDI hardware. So configuring the primary OLDI takes care of
> the companion too.
> The only case where it is not shared is the OLDI IO bit in the Control
> MMR (ctrl_mmr) region. But, since the primary OLDI drm_bridge remains
> aware about the presence of companion OLDI, it makes sure to enable /
> disable the comapnion OLDI IO when required.

But if there's just one bridge (for the first oldi), how is the second 
panel connected to the DRM pipeline? Who e.g. calls the 
drm_panel_funcs.enable() in the panel driver for the second panel?

Or, say, if we have two LVDS->HDMI bridges, with the cloning setup, how 
does all the plumbing work if "DRM framework only really supports a 
linear encoder-bridge chain"?

  Tomi

