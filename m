Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 89FC12AEA86
	for <lists+dri-devel@lfdr.de>; Wed, 11 Nov 2020 08:55:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 55C5A89F6E;
	Wed, 11 Nov 2020 07:54:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mo4-p01-ob.smtp.rzone.de (mo4-p01-ob.smtp.rzone.de
 [85.215.255.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D52C389D99
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Nov 2020 07:48:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1605080903;
 s=strato-dkim-0002; d=goldelico.com;
 h=To:References:Message-Id:Cc:Date:In-Reply-To:From:Subject:
 X-RZG-CLASS-ID:X-RZG-AUTH:From:Subject:Sender;
 bh=UipCBNxvSkYMD0ld5DKa/yFCoPhHKzPCKQYEYVERROM=;
 b=AFnrbbzQAG4N3X41nePG1z/Bsr8PK0s7UfUXML1ySLYCaIDfUJw0ZHEIwH8dz+ETHZ
 D+B1fEtFONXwjBZ/udYbpLXa4KZW7zQgPYuFp1NhHdMuVMfyKA5uSAubRVyn35vJgLbv
 JLU+sNM3kGdc9poKsl5GpQ/GiBTN1bOu6IALyT76FGm+BUdAPEhC/vf9PEnPKF4DE2nY
 Yk9vqnmL9TN8wUZM4LX2O8ChvGiy6f92TfIE9bKTUCJ4MiChgBoDtRuYHpfwTbjTQJXk
 ZvzJOouX4JkThNviKyV/SuB8xSbgisX/o4eddTTH5USOobc23Qpot4/yofcoTc/6nfrm
 hksQ==
X-RZG-AUTH: ":JGIXVUS7cutRB/49FwqZ7WcJeFKiMgPgp8VKxflSZ1P34KBj4Qpw9iZeHmAvw43o9ik="
X-RZG-CLASS-ID: mo00
Received: from imac.fritz.box by smtp.strato.de (RZmta 47.3.4 DYNA|AUTH)
 with ESMTPSA id N02faawAB7m96cA
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (curve X9_62_prime256v1 with 256
 ECDH bits, eq. 3072 bits RSA))
 (Client did not present a certificate);
 Wed, 11 Nov 2020 08:48:09 +0100 (CET)
Subject: Re: [PATCH v3 00/56] Convert DSI code to use drm_mipi_dsi and
 drm_panel
Mime-Version: 1.0 (Mac OS X Mail 9.3 \(3124\))
From: "H. Nikolaus Schaller" <hns@goldelico.com>
In-Reply-To: <dd0a41eb-aa86-7c5c-3151-313a0d9d0883@ti.com>
Date: Wed, 11 Nov 2020 08:48:09 +0100
Message-Id: <CA791A57-9B35-42A4-95FD-3792C4F83048@goldelico.com>
References: <20201105120333.947408-1-tomi.valkeinen@ti.com>
 <fcbc8488-5861-8e51-0f86-1ed6498083f7@ti.com>
 <579243AA-014A-411B-9014-F5846C9B8137@goldelico.com>
 <ab33baff-dd8c-2ee0-6f89-35aa4df7b9cf@ti.com>
 <837EA533-9946-43B3-B058-69060EC43981@goldelico.com>
 <08589e51-f5e6-2743-57ec-8ac509f97ff0@ti.com>
 <1f1afce4-c822-0fbf-1ce3-dda0064b65c6@ti.com>
 <67786545-23D2-444F-85B8-7A030070B317@goldelico.com>
 <a20f2b88-bfe6-0ab4-a19b-ba5316db6c4f@ti.com>
 <17F5238B-1CC3-4764-B744-C57D9CE4EB42@goldelico.com>
 <db0b9694-4d04-18ba-fdf0-093b5914bbf0@ti.com>
 <6A9407FC-69F7-4E30-B4A3-FFB2E91CAE3B@goldelico.com>
 <1cf563e5-2dc0-1802-86e3-3e24150f0651@ti.com>
 <BBC7824A-A689-4144-969C-32608A202A75@goldelico.com>
 <7f820fd2-820b-bfdd-a43b-174ad6b09868@ti.com>
 <0AF59BFD-89F2-46D3-9EB6-F47FBB52B183@goldelico.com>
 <AEAA7281-7B82-47A6-A0BA-EF08C56824A8@goldelico.com>
 <917fe1c6-4009-7788-f815-fcc1fc2ba7df@ti.com>
 <2265AEF5-42BC-4E7B-B263-D0B93B78DE91@goldelico.com>
 <dd0a41eb-aa86-7c5c-3151-313a0d9d0883@ti.com>
To: Tomi Valkeinen <tomi.valkeinen@ti.com>
X-Mailer: Apple Mail (2.3124)
X-Mailman-Approved-At: Wed, 11 Nov 2020 07:54:43 +0000
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
Cc: Discussions about the Letux Kernel <letux-kernel@openphoenux.org>,
 Tony Lindgren <tony@atomide.com>, Sekhar Nori <nsekhar@ti.com>,
 Sebastian Reichel <sre@kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Linux-OMAP <linux-omap@vger.kernel.org>, Nikhil Devshatwar <nikhil.nd@ti.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


> Am 11.11.2020 um 07:40 schrieb Tomi Valkeinen <tomi.valkeinen@ti.com>:
> 
> On 10/11/2020 23:04, H. Nikolaus Schaller wrote:
>> 
>>> Am 10.11.2020 um 17:52 schrieb Tomi Valkeinen <tomi.valkeinen@ti.com>:
>>> 
>>> On 10/11/2020 18:49, H. Nikolaus Schaller wrote:
>>> 
>>> I guess you have the same issue. It goes to dsi_bridge_mode_valid, then __dsi_calc_config, and stays
>>> there finding good clocks.
>> 
> 
> drm_display_mode.clock is in kHz, but the panel driver writes Hz (w677l_PIXELCLOCK) to it.

Ok, fixing this removes the stuck thread issue. Thanks for pointing this out!

> But
> there's more after fixing that. The DSI gets configured in bridge's modeset, which I think is before
> w677l_prepare where the panel already sends DSI commands. Also, the dsi driver fails to lock the
> PLL, so possibly the clock calcs are still wrong.

What I now get is

[  131.035006] [drm:drm_atomic_helper_wait_for_dependencies [drm_kms_helper]] *ERROR* [CRTC:55:crtc-0] flip_done timed out
[  141.272174] [drm:drm_atomic_helper_wait_for_dependencies [drm_kms_helper]] *ERROR* [CONNECTOR:54:DSI-1] flip_done timed out

I think for further experiments we could hack the device tree to compatible = "orisetech,otm8009a";
and configure for panel-orisetech-otm8009a.ko. Since this panel driver is known to work elsewhere
we could exclude panel driver issues for the moment. To be safe we can modify otm8009a_dcs_write_buf()
to just print what it would be doing.

BR,
Nikolaus

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
