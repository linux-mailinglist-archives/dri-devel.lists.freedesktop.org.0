Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1180A9A9B7F
	for <lists+dri-devel@lfdr.de>; Tue, 22 Oct 2024 09:51:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7EECE10E5F8;
	Tue, 22 Oct 2024 07:51:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="e/tRKJqL";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4859610E5F8
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Oct 2024 07:51:33 +0000 (UTC)
Received: from [192.168.88.20] (91-157-155-49.elisa-laajakaista.fi
 [91.157.155.49])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 22E50D49;
 Tue, 22 Oct 2024 09:49:45 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1729583385;
 bh=r0CoE8FwPMvdIcoU6xj671xyo7U+T9r3UXKzQdwkclc=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=e/tRKJqLs8q3kpkwIeYAMhbdpVbXxby6LFvaN96TQ/S48CrW7ZZlQWRcDMjqwLEp0
 2XPTlZ+ZGo/XvgJIMkS8lU696cJiWHwJNUkRInjNIpDhJkkapzHFeadsR/Ss+bc4n8
 Poog0tTcWUcXWCiQvai6+wTvgtJ1vTC7ya8ypi3M=
Message-ID: <4a25cd50-06be-4e95-b29e-4f5eb23d8bca@ideasonboard.com>
Date: Tue, 22 Oct 2024 10:51:28 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: fw_devlinks preventing a panel driver from probing
To: Saravana Kannan <saravanak@google.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>,
 Linux Kernel List <linux-kernel@vger.kernel.org>,
 Aradhya Bhatia <aradhya.bhatia@linux.dev>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Devarsh Thakkar <devarsht@ti.com>
References: <1a1ab663-d068-40fb-8c94-f0715403d276@ideasonboard.com>
 <CAGETcx-LtuMJM1205FwMy0U-fetAKhFdon65qAxHKV3Q2cUOGQ@mail.gmail.com>
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
In-Reply-To: <CAGETcx-LtuMJM1205FwMy0U-fetAKhFdon65qAxHKV3Q2cUOGQ@mail.gmail.com>
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

On 22/10/2024 02:29, Saravana Kannan wrote:
> Hi Tomi,
> 
> Sorry it took a while to get back.
> 
> On Mon, Sep 16, 2024 at 4:52 AM Tomi Valkeinen
> <tomi.valkeinen@ideasonboard.com> wrote:
>>
>> Hi,
>>
>> We have an issue where two devices have dependencies to each other,
>> according to drivers/base/core.c's fw_devlinks, and this prevents them
>> from probing. I've been adding debugging to the core.c, but so far I
>> don't quite grasp the issue, so I thought to ask. Maybe someone can
>> instantly say that this just won't work...
>>
>> So, we have two devices, DSS (display subsystem) and an LVDS panel. The
>> DSS normally outputs parallel video from its video ports (VP), but it
>> has an integrated LVDS block (OLDI, Open LVDS Display Interface). The
>> OLDI block takes input from DSS's parallel outputs. The OLDI is not
>> modeled as a separate device (neither in the DT nor in the Linux device
>> model) as it has no register space, and is controlled fully by the DSS.
>>
>> To support dual-link LVDS, the DSS has two OLDI instances. They both
>> take their input from the same parallel video port, but each OLDI sends
>> alternate lines forward. So for a dual-link setup the connections would
>> be like this:
>>
>> +-----+-----+         +-------+         +----------+
>> |     |     |         |       |         |          |
>> |     | VP1 +----+--->| OLDI0 +-------->|          |
>> |     |     |    |    |       |         |          |
>> | DSS +-----+    |    +-------+         |  Panel   |
>> |     |     |    |    |       |         |          |
>> |     | VP2 |    +--->| OLDI1 +-------->|          |
>> |     |     |         |       |         |          |
>> +-----+-----+         +-------+         +----------+
>>
>> As the OLDI is not a separate device, it also does not have an
>> independent device tree node, but rather it's inside DSS's node. The DSS
>> parallel outputs are under a normal "ports" node, but OLDI ports are
>> under "oldi-txes/ports" (see below for dts to clarify this).
>>
>> And I think (guess...) this is the root of the issue we're seeing, as it
>> means the following, one or both of which might be the reason for this
>> issue:
>>
>> - OLDI fwnodes don't have an associated struct device *. I think the
>> reason is that the OLDI media graph ports are one level too deep in the
>> hierarchy. So while the DSS ports are associated with the DSS device,
>> OLDI ports are not.
> 
> This is the root cause of the issue in some sense. fw_devlink doesn't
> know that DSS depends on the VP. In the current DT, it only appears as
> if the OLDI depends on VP. See further below for the fix.
> 
>>
>> - The VP ports inside the DSS point to OLDI ports, which are also inside
>> DSS. So ports from a device point to ports in the same device (and back).
>>
>> If I understand the fw_devlink code correctly, in a normal case the
>> links formed with media graphs are marked as a cycle
>> (FWLINK_FLAG_CYCLE), and then ignored as far as probing goes.
>>
>> What we see here is that when using a single-link OLDI panel, the panel
>> driver's probe never gets called, as it depends on the OLDI, and the
>> link between the panel and the OLDI is not a cycle.
>>
>> The DSS driver probes, but the probe fails as it requires all the panel
>> devices to have been probed (and thus registered to the DRM framework)
>> before it can finish its setup.
>>
>> With dual-link, probing does happen and the drivers work. But I believe
>> this is essentially an accident, in the sense that the first link
>> between the panel and the OLDI still blocks the probing, but the second
>> links allows the driver core to traverse the devlinks further, causing
>> it to mark the links to the panel as FWLINK_FLAG_CYCLE (or maybe it only
>> marks one of those links, and that's enough).
>>
>> If I set fw_devlink=off as a kernel parameter, the probing proceeds
>> successfully in both single- and dual-link cases.
>>
>> Now, my questions is, is this a bug in the driver core, a bug in the DT
>> bindings, or something in between (DT is fine-ish, but the structure is
>> something that won't be supported by the driver core).
>>
>> And a follow-up question, regardless of the answer to the first one:
>> which direction should I go from here =).
>>
>> The device tree data (simplified) for this is as follows, first the
>> dual-link case, then the single-link case:
>>
>> /* Dual-link */
>>
>> dss: dss@30200000 {
>>          compatible = "ti,am625-dss";
>>
>>          oldi-txes {
>>                  oldi0: oldi@0 {
>>                          oldi0_ports: ports {
>>                                  port@0 {
>>                                          oldi_0_in: endpoint {
>>                                                  remote-endpoint = <&dpi0_out0>;
>>                                          };
>>                                  };
>>
>>                                  port@1 {
>>                                          oldi_0_out: endpoint {
>>                                                  remote-endpoint = <&lcd_in0>;
>>                                          };
>>                                  };
>>                          };
>>                  };
>>
>>                  oldi1: oldi@1 {
>>                          oldi1_ports: ports {
>>                                  port@0 {
>>                                          oldi_1_in: endpoint {
>>                                                  remote-endpoint = <&dpi0_out1>;
>>                                          };
>>                                  };
>>
>>                                  port@1 {
>>                                          oldi_1_out: endpoint {
>>                                                  remote-endpoint = <&lcd_in1>;
>>                                          };
>>                                  };
>>                          };
>>                  };
>>          };
>>
>>          dss_ports: ports {
>>                  port@0 {
>>                          dpi0_out0: endpoint@0 {
>>                                  remote-endpoint = <&oldi_0_in>;
>>                          };
>>                          dpi0_out1: endpoint@1 {
>>                                  remote-endpoint = <&oldi_1_in>;
>>                          };
>>                  };
>>          };
>> };
>>
>> display {
>>          compatible = "microtips,mf-101hiebcaf0", "panel-simple";
> 
> In here, add this new property that I added some time back.
> 
> post-init-providers = <&oldi-txes>;

Thanks! This helps:

post-init-providers = <&oldi0>;

or for dual-link:

post-init-providers = <&oldi0>, <&oldi1>;

> This tells fw_devlink that VP doesn't depend on this node for
> initialization/probing. This property is basically available to break
> cycles in DT and mark one of the edges of the cycles as "not a real
> init dependency".
> 
> You should do the same for the single link case too.

While this helps, it's not very nice... Every new DT overlay that uses 
OLDI display needs to have these.

I'm still confused about why this is needed. OF graphs are _always_ 
two-way links. Doesn't that mean that OF graphs never can be used for 
dependencies, as they go both ways? If so, shouldn't we just always 
ignore all OF graphs for dependency checking?

  Tomi

> 
> Hope that helps. Let me know.
> 
> Thanks,
> Saravana
> 
>>
>>          ports {
>>                  port@0 {
>>                          lcd_in0: endpoint {
>>                                  remote-endpoint = <&oldi_0_out>;
>>                          };
>>                  };
>>
>>                  port@1 {
>>                          lcd_in1: endpoint {
>>                                  remote-endpoint = <&oldi_1_out>;
>>                          };
>>                  };
>>          };
>> };
>>
>>
>> /* Single-link */
>>
>> dss: dss@30200000 {
>>          compatible = "ti,am625-dss";
>>
>>          oldi-txes {
>>                  oldi0: oldi@0 {
>>                          oldi0_ports: ports {
>>                                  port@0 {
>>                                          oldi_0_in: endpoint {
>>                                                  remote-endpoint = <&dpi0_out0>;
>>                                          };
>>                                  };
>>
>>                                  port@1 {
>>                                          oldi_0_out: endpoint {
>>                                                  remote-endpoint = <&lcd_in0>;
>>                                          };
>>                                  };
>>                          };
>>                  };
>>          };
>>
>>          dss_ports: ports {
>>                  port@0 {
>>                          dpi0_out0: endpoint@0 {
>>                                  remote-endpoint = <&oldi_0_in>;
>>                          };
>>                  };
>>          };
>> };
>>
>> display {
>>          compatible = "microtips,mf-101hiebcaf0", "panel-simple";
>>
>>          ports {
>>                  port@0 {
>>                          lcd_in0: endpoint {
>>                                  remote-endpoint = <&oldi_0_out>;
>>                          };
>>                  };
>>          };
>> };
>>
>>    Tomi
>>

