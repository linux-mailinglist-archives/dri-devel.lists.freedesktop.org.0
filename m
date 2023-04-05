Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 89DA56D7EAC
	for <lists+dri-devel@lfdr.de>; Wed,  5 Apr 2023 16:09:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5156C10E97B;
	Wed,  5 Apr 2023 14:09:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A907110E97B
 for <dri-devel@lists.freedesktop.org>; Wed,  5 Apr 2023 14:09:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
 t=1680703760; x=1712239760;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=fEw6RmUvBESoSM2ZjVsFAQILIuNMI1M95jRKuGkOs/M=;
 b=onZVYWtIyjQ30Hk20euy5SNS78NRQdUjAADc9/u2wtl7fRSypWKoaTlh
 W/EtF1+F+rLall24K0PYmZIxWGN0l7y+R4bOw09ZnOru4MkOyDUYtJfYL
 Fiy9kv3ttk5pthpqsHP/TDcqxMZ7+i5dtBptSQV47HRUYH2Nb1x3aXWgQ
 01UiFNbZzVJdNhv3MWvFrWOFrpSCVPb1pyTMPibPr4BlxHcJGJGtPqQSO
 TrVQ9sHrmAhwciW9N2V+Y4hu8XWxsVN4CqJRWHRKd+exDWmwGJ0C0ZE5B
 rP92HjTauFy81aqf/+hdDifYhfpBs1i/2km13n9e69JlrNkXX3hWMPn1a w==;
X-IronPort-AV: E=Sophos;i="5.98,319,1673910000"; d="scan'208";a="30168806"
Received: from unknown (HELO tq-pgp-pr1.tq-net.de) ([192.168.6.15])
 by mx1-pgp.tq-group.com with ESMTP; 05 Apr 2023 16:09:18 +0200
Received: from mx1.tq-group.com ([192.168.6.7])
 by tq-pgp-pr1.tq-net.de (PGP Universal service);
 Wed, 05 Apr 2023 16:09:18 +0200
X-PGP-Universal: processed;
 by tq-pgp-pr1.tq-net.de on Wed, 05 Apr 2023 16:09:18 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
 t=1680703758; x=1712239758;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=fEw6RmUvBESoSM2ZjVsFAQILIuNMI1M95jRKuGkOs/M=;
 b=WDV8WCUwwKUQJEBL88nTsWnC/0c9q3pbh+GAtEWR9uldie4WvXcb25Ds
 9RHjsr0pyI978Yd9NwbTGtgw/Pzl8ZQ/GpTOGxSLbI1tOnegf41l3Lg4c
 w//Mb59hIfQ4vBcrHJaT4AuC6Acsxu8Q0GJ/BjpJQJmUw1LYEn4J4Krfr
 KDWTypDlyKy+tI0kF6H35ptx9FTvtlkotlROa6jN/+UKmotMJan3W1KXA
 2gFPvKejIBT6WD/wyxjF/kUOzdn9wTclrfc811hOIHsvcY0Vz6j6XQqJ8
 mSR/L8NtScyNauAtqOGnQ4C2AVJKXhTD1Cep4xCzGByTVBC1m046ouIpC A==;
X-IronPort-AV: E=Sophos;i="5.98,319,1673910000"; d="scan'208";a="30168805"
Received: from vtuxmail01.tq-net.de ([10.115.0.20])
 by mx1.tq-group.com with ESMTP; 05 Apr 2023 16:09:18 +0200
Received: from steina-w.localnet (unknown [10.123.53.21])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by vtuxmail01.tq-net.de (Postfix) with ESMTPSA id C93A9280056
 for <dri-devel@lists.freedesktop.org>; Wed,  5 Apr 2023 16:09:18 +0200 (CEST)
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: dri-devel@lists.freedesktop.org
Subject: RFC: DSI/DRM multiplexer bridge
Date: Wed, 05 Apr 2023 16:09:16 +0200
Message-ID: <2991779.e9J7NaK4W3@steina-w>
Organization: TQ-Systems GmbH
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"
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

my platform has a DIP switch controlled multiplexer for MIPI DSI output=20
signals. One output has a TI SN65DSI84 (LVDS) and the other output has a TI=
=20
SN65DSI86 (eDP) attached to it. The Multiplexer status can be read back fro=
m a=20
GPIO. The GPIO is also IRQ capable, so it would be possible to support hotp=
lug=20
additionally later on.

My initial idea was to create a DRM multiplexer bridge driver which (depend=
ing=20
on the input GPIO) allows only one output to be enabled. Unfortunately ti-
sn65dsi86.c driver expects a DSI host on remote node 0 (see ti_sn_attach_ho=
st=20
and ti_sn_bridge_parse_dsi_host), so it does not work. ti-sn65dsi83.c just=
=20
requires a drm_bridge.

What is the best approach for this? I currently see two approaches:
* Create an explicit DSI/DRM multiplexer bridge driver which registers itse=
lf=20
as DSI host
* Create a DRM multiplexer bridge (only). But this needs to remove the DSI=
=20
device registration from ti-sn65dsi86.c

I am aware that DSI support is suboptimal, so I'm not sure which approach o=
n=20
the TI bridge drivers is the correct one and needs to be considered as give=
n.
Any ideas?

Best regards,
Alexander
=2D-=20
TQ-Systems GmbH | M=FChlstra=DFe 2, Gut Delling | 82229 Seefeld, Germany
Amtsgericht M=FCnchen, HRB 105018
Gesch=E4ftsf=FChrer: Detlef Schneider, R=FCdiger Stahl, Stefan Schneider
http://www.tq-group.com/


