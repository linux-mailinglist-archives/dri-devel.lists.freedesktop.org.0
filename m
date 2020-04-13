Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C6F61A7439
	for <lists+dri-devel@lfdr.de>; Tue, 14 Apr 2020 09:06:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5E2FE89250;
	Tue, 14 Apr 2020 07:06:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mo6-p01-ob.smtp.rzone.de (mo6-p01-ob.smtp.rzone.de
 [IPv6:2a01:238:20a:202:5301::12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 019A489C84
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Apr 2020 11:46:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1586778396;
 s=strato-dkim-0002; d=goldelico.com;
 h=To:References:Message-Id:Cc:Date:In-Reply-To:From:Subject:
 X-RZG-CLASS-ID:X-RZG-AUTH:From:Subject:Sender;
 bh=8iHbGZPtb+jLR7wFq0bcz83kvyfN8ojZLOZPdfJ3DN0=;
 b=jrFaxzCGyNRhJkz0BH4EQMoEtC5gqU8fhYYvKzbSEwiPTKHfQ+UZqoE5hUD7El/yJH
 fwVxsV1kmllc3T1iEQ32DSA+9NyftmNEfyRNyYEU+McdVBLuhDA+Mc0JkYs0bHfp9qpW
 3TNz3d2xe/+5a20sSe6fgC4gslbyz9Sy6JBEHmIcXmTT84UESq8Q5yTEAVw8/zS6rZcn
 FnzcakG7Ofk0JHplCd6wqWeI5aWGmVLoCo8lJRdhomOPBCMWDmxTlsUXmbWw7Wx4q/H6
 zbS8e3zn92gch1ZpeTqwnQr7qPBdMYTIkyiZRRA6KHX+PYQLHmgVb95frNRD/857FHVL
 ed+A==
X-RZG-AUTH: ":JGIXVUS7cutRB/49FwqZ7WcJeFKiMgPgp8VKxflSZ1P34KBj5Qpw97WFDlSfXA0Mwc0="
X-RZG-CLASS-ID: mo00
Received: from imac.fritz.box by smtp.strato.de (RZmta 46.2.1 DYNA|AUTH)
 with ESMTPSA id m02241w3DBkC5CU
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (curve X9_62_prime256v1 with 256
 ECDH bits, eq. 3072 bits RSA))
 (Client did not present a certificate);
 Mon, 13 Apr 2020 13:46:12 +0200 (CEST)
Subject: Re: DRM interaction problems on Ingenic CI20 / jz4780 with dw-hdmi
 and ingenic-drm
Mime-Version: 1.0 (Mac OS X Mail 9.3 \(3124\))
From: "H. Nikolaus Schaller" <hns@goldelico.com>
In-Reply-To: <125Q8Q.9F49TXF6ZICX1@crapouillou.net>
Date: Mon, 13 Apr 2020 13:46:12 +0200
Message-Id: <AAFD4E35-E830-4CED-956E-E354BC012698@goldelico.com>
References: <ED77DCA8-FF50-4E9E-A4B8-688262774723@goldelico.com>
 <125Q8Q.9F49TXF6ZICX1@crapouillou.net>
To: Paul Cercueil <paul@crapouillou.net>,
 "open list:DRM PANEL DRIVERS" <dri-devel@lists.freedesktop.org>
X-Mailer: Apple Mail (2.3124)
X-Mailman-Approved-At: Tue, 14 Apr 2020 07:06:18 +0000
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
Cc: Paul Boddie <paul@boddie.org.uk>, Dave Airlie <airlied@linux.ie>,
 Sascha Hauer <s.hauer@pengutronix.de>, linux-mips@vger.kernel.org,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 MIPS Creator CI20 Development <mips-creator-ci20-dev@googlegroups.com>,
 Yakir Yang <ykk@rock-chips.com>, Andy Yan <andy.yan@rock-chips.com>,
 Vladimir Zapolskiy <vladimir_zapolskiy@mentor.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


> Am 13.04.2020 um 13:25 schrieb Paul Cercueil <paul@crapouillou.net>:
> =

> Hi Nikolaus,
> =

> =

> Le sam. 11 avril 2020 =E0 16:14, H. Nikolaus Schaller <hns@goldelico.com>=
 a =E9crit :
>> Hi,
>> we (Paul Boddie and me) are working to get HDMI functional on the
>> Ingenic CI20 board with jz4780 SoC which uses a specialization of
>> the dw-hdmi driver.
>> So far we have identified two issues.
>> The first is that HPD interrupts are not properly processed.
>> drm_helper_hpd_irq_event() is called by HPD events but
>> dev->mode_config.poll_enabled is false.
>> Therefore the interrupt is ignored and nothing happens.
>> Now I wonder about the logic behind checking for poll_enabled.
>> I understand that a driver can do either polling or irq or both.
>> Therefore handling the irq_event shouldn't be disabled by poll_enabled
>> being false. Otherwise we can only do: nothing, polling, polling+irq
>> but not irq alone.
>> The jz4780 hdmi subsystem (drm/bridge/dw-hdmi.c) uses
>> 	connector->polled =3D DRM_CONNECTOR_POLL_HPD;
>> but shouldn't this enable polling? Note that there seems to be
>> no (direct) call to drm_kms_helper_poll_init().
>> If we set dev->mode_config.poll_enabled =3D true in
>> drm_helper_hpd_irq_event() things start to work.
>> Please can you clarify what would be best practise here to
>> get HPD event handling working.
>> The other issue is in dw-hdmi.c:
>> We found out that ingenic_drm_encoder_atomic_check() fails because
>> info->num_bus_formats =3D=3D 0
>> and not 1. This blocks further initialization.
>> The reason seems to be that dw_hdmi_bridge_attach() does not call
>> drm_display_info_set_bus_formats() with a proper format like
>> other drivers (e.g. drm/bridge/ti-tfp410.c) are doing.
>> We have patched to set a single bus format MEDIA_BUS_FMT_RGB888_1X24
>> and then DRM setup seems to work (although we still have no valid
>> HDMI signal but that is likely something else).
>> Please can you explain how setting the bus format should be fixed
>> in dw-hdmi.c.
>> If these questions should be forwarded to other specialists, please
>> do so.
> =

> It should be sent to the DRI mailing list, you missed the most important =
one.

Ah, ok.

> =

> -Paul
> =

>> BR and thanks,
>> Nikolaus Schaller

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
