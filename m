Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ECE45D3A451
	for <lists+dri-devel@lfdr.de>; Mon, 19 Jan 2026 11:10:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 151CD10E3E6;
	Mon, 19 Jan 2026 10:10:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="jDKaO7nK";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E5AC410E3E5
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Jan 2026 10:10:22 +0000 (UTC)
Received: from [192.168.88.20] (91-158-153-178.elisa-laajakaista.fi
 [91.158.153.178])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 1A16E2D9;
 Mon, 19 Jan 2026 11:09:50 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1768817391;
 bh=Qay2toySjvtV5YKvWvOb020wKuZNfIJZypshhGGJ0x8=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=jDKaO7nK3PHUWQqG8/nhkP4IsvS0dxmpZtYDrn7MSzvEH5fDqQNp3UYKrtd/cS8cz
 Q+LHiMTjyobK54ehc1aZI73CegBHLdDivvNVuU6MbYlkyLbS515lmrE7VZbau+TueK
 Xh0vc3xWkQEvPuLLn+IRx5bZmvo2wnDdB031qGoM=
Message-ID: <462b3b7a-c228-456a-84bf-0e6103be61b7@ideasonboard.com>
Date: Mon, 19 Jan 2026 12:10:17 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/3] dt-bindings: display: ti, am65x-dss: Add am62p dss
 compatible
To: Swamil Jain <s-jain1@ti.com>, jyri.sarha@iki.fi, airlied@gmail.com,
 simona@ffwll.ch, maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, aradhya.bhatia@linux.dev, mwalle@kernel.org
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, devarsht@ti.com, praneeth@ti.com,
 u-kumar1@ti.com, Nishanth Menon <nm@ti.com>
References: <20260116095406.2544565-1-s-jain1@ti.com>
 <20260116095406.2544565-2-s-jain1@ti.com>
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Content-Language: en-US
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
In-Reply-To: <20260116095406.2544565-2-s-jain1@ti.com>
Content-Type: text/plain; charset=UTF-8
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On 16/01/2026 11:54, Swamil Jain wrote:
> TI's AM62P SoC contains two instances of the TI Keystone Display
> SubSystem (DSS), each with two video ports and two video planes. These
> instances support up to three independent video streams through OLDI,
> DPI, and DSI interfaces. The OLDI interfaces utilizes two OLDI
> transmitters OLDI0 and OLDI1.
> 
> DSS0 (first instance) supports:
>  - With respect to OLDI Tx interfaces, DSS0 instance can either drive
>    both OLDI0 Tx and OLDI1 Tx together (e.g. dual link mode or clone
>    mode) or can only drive OLDI0 Tx in single link mode with OLDI1 being
>    utilized by DSS1 or left unused.
>  - DPI output from video port 2.
> 
> DSS1 (second instance) supports:
>  - With respect to OLDI Tx interfaces, DSS1 instance can only drive
>    OLDI1 Tx given DSS0 is not utilizing that as described above.
>  - DSI controller output from video port 2.
> 
> The two OLDI transmitters can be configured in clone mode to drive a
> pair of identical OLDI single-link displays. DPI outputs from
> DSS0 VP2, DSS1 VP1, and DSS1 VP2 are multiplexed, allowing only one
> DPI output at a time.
> 
> Add the compatible string "ti,am62p-dss" and update related
> description accordingly.
> 
> AM62P has different power domains for DSS and OLDI compared to other
> Keystone SoCs. DSS0 can have up to 3 power-domains for DSS0, OLDI0 and
> OLDI1, and DSS1 can have up to 2 power-domains for DSS1 and OLDI1.
> 
> Signed-off-by: Swamil Jain <s-jain1@ti.com>
> ---
>  .../bindings/display/ti/ti,am65x-dss.yaml     | 37 ++++++++++++++++++-
>  1 file changed, 35 insertions(+), 2 deletions(-)
I think we have a bad design issue here, and I don't know how to fix it.

The OLDIs have been a bit difficult to model, as they are not full
devices: they are not on a control bus, and don't have registers, yet
they need configuration. Part of the config is done via separate IO
controls with syscon, part of the config is done via DSS's registers.
It's not documented, but I assume the OLDI registers in the DSS IP are
wired somewhat directly to the OLDI IP.

So currently we just consider OLDIs to be part of the DSS. We do model
them as separate custom DSS child nodes in the DT, so that we can model
the pipelines correctly. For example, to support dual-link OLDI, we have
two OLDI TX nodes, which get their pixel stream from a single DSS port.
The power-domains for the OLDIs were just set as DSS power-domains, as
OLDIs were part of DSS in this design.

This felt perhaps slightly hacky, but it also made sense and allowed us
to model the HW.

Now, with AM62P, it gets a bit interesting. We have two independent DSS
IPs, each of which have two output ports, and we have two OLDI TX
instances. The OLDI TX instances are shared between the DSS instances,
and the first output port on both DSS can be muxed to an OLDI. The first
DSS can be connected to both OLDI TXes, the second DSS can be connected
only to the second OLDI.

This DSS application note has a bit more info and some pics:
https://www.ti.com/lit/pdf/sprads3

Now, both DSS instances have identical registers for configuring both
OLDI instances. This is not documented, but I'm guessing that when
configuring the clock muxes (the clock tree is also "interesting"), it
will also mux the configuration wires coming from the DSS instances. So
when you change the parent clocks for DSS & OLDI to be the right ones to
use, say, OLDI TX1 on DSS1, you also change where the OLDI configuration
is coming from.

So the OLDIs are now shared, and the configuration registers are
duplicated and routed based on clock setup (afaiu). Clearly the OLDIs
can not be considered being part of DSS0 or DSS1 anymore, nor can we set
the OLDI power-domains in the DSS node.

What this series does is that it adds three OLDI nodes, two for DSS0 (as
DSS0 can use either one or two OLDIs) and one for DSS1. And then,
depending on which OLDIs you happen to use, you're supposed to set the
DSS power-domains accordingly, so that the DSS being used for OLDI has
the necessary OLDI power-domains. And connect the media graph so that if
your panel uses OLDI TX1 with the DSS0, you connect to that OLDI DT
node, but if you use the same OLDI TX1 with the DSS1, you connect to
another OLDI DT node. I don't think that's right at all...

I don't right away have a good idea (well, not even a bad idea) how this
should be designed.

 Tomi

