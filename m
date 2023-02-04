Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B63468A91A
	for <lists+dri-devel@lfdr.de>; Sat,  4 Feb 2023 09:58:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6F21D10E0E9;
	Sat,  4 Feb 2023 08:58:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 506 seconds by postgrey-1.36 at gabe;
 Sat, 04 Feb 2023 08:58:47 UTC
Received: from bmailout1.hostsharing.net (bmailout1.hostsharing.net
 [83.223.95.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3EA4E10E0E9
 for <dri-devel@lists.freedesktop.org>; Sat,  4 Feb 2023 08:58:47 +0000 (UTC)
Received: from h08.hostsharing.net (h08.hostsharing.net [83.223.95.28])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256
 client-signature RSA-PSS (4096 bits) client-digest SHA256)
 (Client CN "*.hostsharing.net",
 Issuer "RapidSSL Global TLS RSA4096 SHA256 2022 CA1" (verified OK))
 by bmailout1.hostsharing.net (Postfix) with ESMTPS id 0DCF1300002D0;
 Sat,  4 Feb 2023 09:50:19 +0100 (CET)
Received: by h08.hostsharing.net (Postfix, from userid 100393)
 id E72C5275D55; Sat,  4 Feb 2023 09:50:18 +0100 (CET)
Date: Sat, 4 Feb 2023 09:50:18 +0100
From: Lukas Wunner <lukas@wunner.de>
To: Bjorn Helgaas <helgaas@kernel.org>
Subject: Re: [PATCH] Revert "fbdev: Remove conflicting devices on PCI bus"
Message-ID: <20230204085018.GA31758@wunner.de>
References: <20230203230909.2058637-1-helgaas@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230203230909.2058637-1-helgaas@kernel.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
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

On Fri, Feb 03, 2023 at 05:09:09PM -0600, Bjorn Helgaas wrote:
> From: Bjorn Helgaas <bhelgaas@google.com>
> 
> This reverts commit 145eed48de278007f646b908fd70ac59d24ed81a.
> 
> Zeno Davatz reported that 145eed48de27 ("fbdev: Remove conflicting devices
> on PCI bus") caused a console hang.  The machine was actually still usable
> via ssh, etc., but there was no activity on the console.
> 
> Reverting 145eed48de27 for the nvidiafb on that system fixed the problem.
> 
> Revert 145eed48de27 ("fbdev: Remove conflicting devices on PCI bus") since
> we don't know what caused the problem.
> 
> Fixes: https://bugzilla.kernel.org/show_bug.cgi?id=216859

Shouldn't that rather be:

Link: https://bugzilla.kernel.org/show_bug.cgi?id=216859
Fixes: 145eed48de27 ("fbdev: Remove conflicting devices on PCI bus")
Cc: stable@vger.kernel.org # v6.1+

?

> Reported-by: Zeno Davatz <zdavatz@gmail.com>
> Tested-by: Zeno Davatz <zdavatz@gmail.com>
> Signed-off-by: Bjorn Helgaas <bhelgaas@google.com>
> Cc: Helge Deller <deller@gmx.de>
> Cc: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: Javier Martinez Canillas <javierm@redhat.com>
> Cc: linux-fbdev@vger.kernel.org
> Cc: dri-devel@lists.freedesktop.org
> Cc: linux-kernel@vger.kernel.org
> ---
