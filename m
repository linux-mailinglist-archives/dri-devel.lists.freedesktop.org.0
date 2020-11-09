Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C94512AD10E
	for <lists+dri-devel@lfdr.de>; Tue, 10 Nov 2020 09:17:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 22ED589919;
	Tue, 10 Nov 2020 08:17:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mo4-p01-ob.smtp.rzone.de (mo4-p01-ob.smtp.rzone.de
 [85.215.255.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 141B589842
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Nov 2020 09:30:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1604914231;
 s=strato-dkim-0002; d=goldelico.com;
 h=To:References:Message-Id:Cc:Date:In-Reply-To:From:Subject:
 X-RZG-CLASS-ID:X-RZG-AUTH:From:Subject:Sender;
 bh=MeJsKUHFOOrDgplDFdDbDkQpr7ypxrq9Rfygh+VRKKw=;
 b=Ed7iBwLzPih9B+q0BKc6d1csDzd98fNZeNwRAhQfMUmZIueOrF3k5lnSdNP9s9cowM
 DZt8oe7rPb+cMRsAynB1zStJlJ+dzoYfXZ07SVyAIlPgdsfzcPHom6x9uEbZOF0uFz2x
 XDWRkTyDo8bY6RHLgMvZ44ITcIedyfoctVPhUwFPauMRfSI6+WyXp5XUH33a59nfT0R4
 j+R1Yo06eS7VhG9yYtUKWyU3ZlOlMlRQnM07lcod0yiWiGRjjvCpZUis4cKYMbgBn02M
 lzoL4qjx87AcVC3qy7Nuf4R0vYoNFhc/jPOTAvjYVLUQhju9rfHC9vCdGdy7r51XWhzG
 /Tww==
X-RZG-AUTH: ":JGIXVUS7cutRB/49FwqZ7WcJeFKiMgPgp8VKxflSZ1P34KBj5Qpw97WFDlaVXA0JCQ=="
X-RZG-CLASS-ID: mo00
Received: from imac.fritz.box by smtp.strato.de (RZmta 47.3.3 DYNA|AUTH)
 with ESMTPSA id d04888wA99UKAp0
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (curve X9_62_prime256v1 with 256
 ECDH bits, eq. 3072 bits RSA))
 (Client did not present a certificate);
 Mon, 9 Nov 2020 10:30:20 +0100 (CET)
Subject: Re: [PATCH v3 00/56] Convert DSI code to use drm_mipi_dsi and
 drm_panel
Mime-Version: 1.0 (Mac OS X Mail 9.3 \(3124\))
From: "H. Nikolaus Schaller" <hns@goldelico.com>
In-Reply-To: <a20f2b88-bfe6-0ab4-a19b-ba5316db6c4f@ti.com>
Date: Mon, 9 Nov 2020 10:30:21 +0100
Message-Id: <17F5238B-1CC3-4764-B744-C57D9CE4EB42@goldelico.com>
References: <20201105120333.947408-1-tomi.valkeinen@ti.com>
 <61C04176-4654-4D2D-A55B-31FBB6D2E5AA@goldelico.com>
 <fcbc8488-5861-8e51-0f86-1ed6498083f7@ti.com>
 <579243AA-014A-411B-9014-F5846C9B8137@goldelico.com>
 <ab33baff-dd8c-2ee0-6f89-35aa4df7b9cf@ti.com>
 <837EA533-9946-43B3-B058-69060EC43981@goldelico.com>
 <08589e51-f5e6-2743-57ec-8ac509f97ff0@ti.com>
 <1f1afce4-c822-0fbf-1ce3-dda0064b65c6@ti.com>
 <67786545-23D2-444F-85B8-7A030070B317@goldelico.com>
 <a20f2b88-bfe6-0ab4-a19b-ba5316db6c4f@ti.com>
To: Tomi Valkeinen <tomi.valkeinen@ti.com>
X-Mailer: Apple Mail (2.3124)
X-Mailman-Approved-At: Tue, 10 Nov 2020 08:16:56 +0000
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
Cc: Tony Lindgren <tony@atomide.com>, Sekhar Nori <nsekhar@ti.com>,
 Sebastian Reichel <sre@kernel.org>, dri-devel@lists.freedesktop.org,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 linux-omap@vger.kernel.org, Nikhil Devshatwar <nikhil.nd@ti.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


> Am 09.11.2020 um 09:04 schrieb Tomi Valkeinen <tomi.valkeinen@ti.com>:
> 
> On 07/11/2020 14:19, H. Nikolaus Schaller wrote:
> 
>> I have set up based on our complete letux-5.10-rc2 tree and maybe using our private config makes
>> the difference. Anyways, the driver is now probed and I can see the call to w677l_get_modes().
>> 
>> I have still no image and no calls to prepare/unprepare etc. but now I can start to debug on omap5.
>> And hopefully we are close to push the panel driver for review. And in a second step some device
>> tree for the Pyra.
>> 
>> The new tree is here: https://git.goldelico.com/?p=letux-kernel.git;a=shortlog;h=refs/heads/work-pyra-panel
> 
> Ok, good. Do you have a link the previous driver that works (omapdrm specific panel driver)? I think
> it's good to have that as a reference.

Yes, here:

https://git.goldelico.com/?p=letux-kernel.git;a=shortlog;h=refs/heads/letux/panels

BR and thanks,
Nikolaus

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
