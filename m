Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D425168AB2A
	for <lists+dri-devel@lfdr.de>; Sat,  4 Feb 2023 17:23:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7CD5810E231;
	Sat,  4 Feb 2023 16:23:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B5B6010E231
 for <dri-devel@lists.freedesktop.org>; Sat,  4 Feb 2023 16:23:09 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 0615EB80B1C;
 Sat,  4 Feb 2023 16:23:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 70506C433EF;
 Sat,  4 Feb 2023 16:23:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1675527786;
 bh=GW1ACmXKBNrpKVcgej0zSNr6jh0aqwGGlnfV1C4ghAY=;
 h=Date:From:To:Cc:Subject:In-Reply-To:From;
 b=pSoTIYf0iREhh6mkf+z07L0TFNOBOEeRJfTsVFMjwrTSVUCNw+JYLBzG4avN7WFuk
 lYAFX1DxLDStHq57p/ZnovAo35FDbMoezbaAYFMDIKV9erAXBN+6D+1K98EcYDJ+PT
 o0g382x4E96BW4NbIj2bAQnFGL77IKankPqdJObPKF/UqPhyh0PV3PjMZXiLi89Ibn
 793v+PW3fhfb2JRPQuQLls+itHkVjBjsmW7gJOuKsQX7R2M/sP3Aw/WVRkIepM/SSG
 Ho2q9kDAB6q1lCo08+Cw3sEanI7FfaPCgqTNvLsZJ0S0PptsnfETVpf4U6k0VetsuB
 8uayRn7y0GcYA==
Date: Sat, 4 Feb 2023 10:23:05 -0600
From: Bjorn Helgaas <helgaas@kernel.org>
To: Lukas Wunner <lukas@wunner.de>
Subject: Re: [PATCH] Revert "fbdev: Remove conflicting devices on PCI bus"
Message-ID: <20230204162305.GA2098741@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230204085018.GA31758@wunner.de>
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
Cc: linux-fbdev@vger.kernel.org, linux-pci@vger.kernel.org,
 Helge Deller <deller@gmx.de>, Javier Martinez Canillas <javierm@redhat.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Thomas Zimmermann <tzimmermann@suse.de>, Bjorn Helgaas <bhelgaas@google.com>,
 Zeno Davatz <zdavatz@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sat, Feb 04, 2023 at 09:50:18AM +0100, Lukas Wunner wrote:
> On Fri, Feb 03, 2023 at 05:09:09PM -0600, Bjorn Helgaas wrote:
> > From: Bjorn Helgaas <bhelgaas@google.com>
> > 
> > This reverts commit 145eed48de278007f646b908fd70ac59d24ed81a.
> > 
> > Zeno Davatz reported that 145eed48de27 ("fbdev: Remove conflicting devices
> > on PCI bus") caused a console hang.  The machine was actually still usable
> > via ssh, etc., but there was no activity on the console.
> > 
> > Reverting 145eed48de27 for the nvidiafb on that system fixed the problem.
> > 
> > Revert 145eed48de27 ("fbdev: Remove conflicting devices on PCI bus") since
> > we don't know what caused the problem.
> > 
> > Fixes: https://bugzilla.kernel.org/show_bug.cgi?id=216859
> 
> Shouldn't that rather be:
> 
> Link: https://bugzilla.kernel.org/show_bug.cgi?id=216859
> Fixes: 145eed48de27 ("fbdev: Remove conflicting devices on PCI bus")
> Cc: stable@vger.kernel.org # v6.1+

Yes, of course, thank you, Lukas!
