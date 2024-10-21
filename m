Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DC6F59A942E
	for <lists+dri-devel@lfdr.de>; Tue, 22 Oct 2024 01:30:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5483910E27E;
	Mon, 21 Oct 2024 23:29:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="x2PcINpV";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com
 [209.85.210.177])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0C61D10E27E
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Oct 2024 23:29:58 +0000 (UTC)
Received: by mail-pf1-f177.google.com with SMTP id
 d2e1a72fcca58-71e681bc315so3217442b3a.0
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Oct 2024 16:29:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1729553397; x=1730158197;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=t2NyHY7mFxB4hr1x5ym1c1fkuAGIeYy0qR52394v8ow=;
 b=x2PcINpVzbAKmR+nczhieJVvLtzEI4mKZh3Vr14YzhIGRsLMDy3u4MsRxOwXtY5HfE
 hRe2af6rw7iOLkndZUdT1/8N11Ub/5R/YmX+k1d5c4EM/QNtIArQTrP/Pl1T4ggn1Ed5
 olAdts0SadofNl+wBOJpaBh6JlY2LNZ1hkyEVMMUe72zXsHAekHHLHU/vKaxsIceMsFw
 mjth2aK+4a6lwJ8OcxU+2ManEyjUFktI2yUon1L2uUuqHVaY7rTZVBDTlPs5hC5cI368
 VaazgX3NUfg03qjgNTyjYoQoAv9C/9Y4VTclWFcxHbUL6Oduzr8l2EHN3COZNaIpfM6p
 KJrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1729553397; x=1730158197;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=t2NyHY7mFxB4hr1x5ym1c1fkuAGIeYy0qR52394v8ow=;
 b=WdRna3CE5hWvKKWHWS1fgpXAeAbUj2nPS08YPxZXNul7rhzIc1yGRvdT4wZleoorK7
 bHLVmbmu+w1INwFI7vOOcXVwkaM8C7b9q8OESAQGD5MBpPKLRszHEzw7nH/TTbZmO6Al
 32Q9BZZCYbBtYNn8Au6Z0HID+EwFkPMTbisjOgqsXKnMrTBfHXx+Ey4wZjz/ZpgeGXej
 qmOvEcfUcHSFQ0YnVWxKS8S//8dn3MYyoXzisgVSY+wJZVBidE8brD9c5JcHIn6eiYXY
 4qqrob8cvmqBhMCCU9kGR3vH+UpKEf1N/Oi9bZeft/+Lv2F7cYCRU82pDuuOjNDQso/U
 6GCA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXznmHbUvlXSsbeyIg0+td0lCV7e+vHzpTBZzvxy5LmOqi3lTozxfXK9YDY9nZuJxD5GzXkkH0/Q7o=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwBlo20qWhNFWSb1f2xtjuQLUyup6VtucUJVTPX1Vdu7x0nzzoW
 DOXEFqvbFN8gR/KhUO3I1REf+mUN5Q7LyFh6JznP2PJp4Ip4bbtcEOtcni1DIG2lIlXHy5K+QlX
 mmopizvU1XxBKIBqBNemYnSzmOsuwBXLDsogm
X-Google-Smtp-Source: AGHT+IETRJaHZlsiEAbTMWW5Y1/SYutPSqWlhc6bkNiSz1EnikRwyl+TiP+yLXrp3hPim9RxQluBfbx5mI1dAsLBdQc=
X-Received: by 2002:aa7:8d4e:0:b0:71e:7f08:492c with SMTP id
 d2e1a72fcca58-71edc13b786mr1742285b3a.1.1729553397078; Mon, 21 Oct 2024
 16:29:57 -0700 (PDT)
MIME-Version: 1.0
References: <1a1ab663-d068-40fb-8c94-f0715403d276@ideasonboard.com>
In-Reply-To: <1a1ab663-d068-40fb-8c94-f0715403d276@ideasonboard.com>
From: Saravana Kannan <saravanak@google.com>
Date: Mon, 21 Oct 2024 16:29:18 -0700
Message-ID: <CAGETcx-LtuMJM1205FwMy0U-fetAKhFdon65qAxHKV3Q2cUOGQ@mail.gmail.com>
Subject: Re: fw_devlinks preventing a panel driver from probing
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>, 
 Linux Kernel List <linux-kernel@vger.kernel.org>,
 Aradhya Bhatia <aradhya.bhatia@linux.dev>, 
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Devarsh Thakkar <devarsht@ti.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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

Hi Tomi,

Sorry it took a while to get back.

On Mon, Sep 16, 2024 at 4:52=E2=80=AFAM Tomi Valkeinen
<tomi.valkeinen@ideasonboard.com> wrote:
>
> Hi,
>
> We have an issue where two devices have dependencies to each other,
> according to drivers/base/core.c's fw_devlinks, and this prevents them
> from probing. I've been adding debugging to the core.c, but so far I
> don't quite grasp the issue, so I thought to ask. Maybe someone can
> instantly say that this just won't work...
>
> So, we have two devices, DSS (display subsystem) and an LVDS panel. The
> DSS normally outputs parallel video from its video ports (VP), but it
> has an integrated LVDS block (OLDI, Open LVDS Display Interface). The
> OLDI block takes input from DSS's parallel outputs. The OLDI is not
> modeled as a separate device (neither in the DT nor in the Linux device
> model) as it has no register space, and is controlled fully by the DSS.
>
> To support dual-link LVDS, the DSS has two OLDI instances. They both
> take their input from the same parallel video port, but each OLDI sends
> alternate lines forward. So for a dual-link setup the connections would
> be like this:
>
> +-----+-----+         +-------+         +----------+
> |     |     |         |       |         |          |
> |     | VP1 +----+--->| OLDI0 +-------->|          |
> |     |     |    |    |       |         |          |
> | DSS +-----+    |    +-------+         |  Panel   |
> |     |     |    |    |       |         |          |
> |     | VP2 |    +--->| OLDI1 +-------->|          |
> |     |     |         |       |         |          |
> +-----+-----+         +-------+         +----------+
>
> As the OLDI is not a separate device, it also does not have an
> independent device tree node, but rather it's inside DSS's node. The DSS
> parallel outputs are under a normal "ports" node, but OLDI ports are
> under "oldi-txes/ports" (see below for dts to clarify this).
>
> And I think (guess...) this is the root of the issue we're seeing, as it
> means the following, one or both of which might be the reason for this
> issue:
>
> - OLDI fwnodes don't have an associated struct device *. I think the
> reason is that the OLDI media graph ports are one level too deep in the
> hierarchy. So while the DSS ports are associated with the DSS device,
> OLDI ports are not.

This is the root cause of the issue in some sense. fw_devlink doesn't
know that DSS depends on the VP. In the current DT, it only appears as
if the OLDI depends on VP. See further below for the fix.

>
> - The VP ports inside the DSS point to OLDI ports, which are also inside
> DSS. So ports from a device point to ports in the same device (and back).
>
> If I understand the fw_devlink code correctly, in a normal case the
> links formed with media graphs are marked as a cycle
> (FWLINK_FLAG_CYCLE), and then ignored as far as probing goes.
>
> What we see here is that when using a single-link OLDI panel, the panel
> driver's probe never gets called, as it depends on the OLDI, and the
> link between the panel and the OLDI is not a cycle.
>
> The DSS driver probes, but the probe fails as it requires all the panel
> devices to have been probed (and thus registered to the DRM framework)
> before it can finish its setup.
>
> With dual-link, probing does happen and the drivers work. But I believe
> this is essentially an accident, in the sense that the first link
> between the panel and the OLDI still blocks the probing, but the second
> links allows the driver core to traverse the devlinks further, causing
> it to mark the links to the panel as FWLINK_FLAG_CYCLE (or maybe it only
> marks one of those links, and that's enough).
>
> If I set fw_devlink=3Doff as a kernel parameter, the probing proceeds
> successfully in both single- and dual-link cases.
>
> Now, my questions is, is this a bug in the driver core, a bug in the DT
> bindings, or something in between (DT is fine-ish, but the structure is
> something that won't be supported by the driver core).
>
> And a follow-up question, regardless of the answer to the first one:
> which direction should I go from here =3D).
>
> The device tree data (simplified) for this is as follows, first the
> dual-link case, then the single-link case:
>
> /* Dual-link */
>
> dss: dss@30200000 {
>         compatible =3D "ti,am625-dss";
>
>         oldi-txes {
>                 oldi0: oldi@0 {
>                         oldi0_ports: ports {
>                                 port@0 {
>                                         oldi_0_in: endpoint {
>                                                 remote-endpoint =3D <&dpi=
0_out0>;
>                                         };
>                                 };
>
>                                 port@1 {
>                                         oldi_0_out: endpoint {
>                                                 remote-endpoint =3D <&lcd=
_in0>;
>                                         };
>                                 };
>                         };
>                 };
>
>                 oldi1: oldi@1 {
>                         oldi1_ports: ports {
>                                 port@0 {
>                                         oldi_1_in: endpoint {
>                                                 remote-endpoint =3D <&dpi=
0_out1>;
>                                         };
>                                 };
>
>                                 port@1 {
>                                         oldi_1_out: endpoint {
>                                                 remote-endpoint =3D <&lcd=
_in1>;
>                                         };
>                                 };
>                         };
>                 };
>         };
>
>         dss_ports: ports {
>                 port@0 {
>                         dpi0_out0: endpoint@0 {
>                                 remote-endpoint =3D <&oldi_0_in>;
>                         };
>                         dpi0_out1: endpoint@1 {
>                                 remote-endpoint =3D <&oldi_1_in>;
>                         };
>                 };
>         };
> };
>
> display {
>         compatible =3D "microtips,mf-101hiebcaf0", "panel-simple";

In here, add this new property that I added some time back.

post-init-providers =3D <&oldi-txes>;

This tells fw_devlink that VP doesn't depend on this node for
initialization/probing. This property is basically available to break
cycles in DT and mark one of the edges of the cycles as "not a real
init dependency".

You should do the same for the single link case too.

Hope that helps. Let me know.

Thanks,
Saravana

>
>         ports {
>                 port@0 {
>                         lcd_in0: endpoint {
>                                 remote-endpoint =3D <&oldi_0_out>;
>                         };
>                 };
>
>                 port@1 {
>                         lcd_in1: endpoint {
>                                 remote-endpoint =3D <&oldi_1_out>;
>                         };
>                 };
>         };
> };
>
>
> /* Single-link */
>
> dss: dss@30200000 {
>         compatible =3D "ti,am625-dss";
>
>         oldi-txes {
>                 oldi0: oldi@0 {
>                         oldi0_ports: ports {
>                                 port@0 {
>                                         oldi_0_in: endpoint {
>                                                 remote-endpoint =3D <&dpi=
0_out0>;
>                                         };
>                                 };
>
>                                 port@1 {
>                                         oldi_0_out: endpoint {
>                                                 remote-endpoint =3D <&lcd=
_in0>;
>                                         };
>                                 };
>                         };
>                 };
>         };
>
>         dss_ports: ports {
>                 port@0 {
>                         dpi0_out0: endpoint@0 {
>                                 remote-endpoint =3D <&oldi_0_in>;
>                         };
>                 };
>         };
> };
>
> display {
>         compatible =3D "microtips,mf-101hiebcaf0", "panel-simple";
>
>         ports {
>                 port@0 {
>                         lcd_in0: endpoint {
>                                 remote-endpoint =3D <&oldi_0_out>;
>                         };
>                 };
>         };
> };
>
>   Tomi
>
