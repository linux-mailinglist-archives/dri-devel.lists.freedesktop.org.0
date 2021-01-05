Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D4CE2EAA1D
	for <lists+dri-devel@lfdr.de>; Tue,  5 Jan 2021 12:43:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 14C576E0E4;
	Tue,  5 Jan 2021 11:43:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 4328 seconds by postgrey-1.36 at gabe;
 Tue, 05 Jan 2021 11:43:50 UTC
Received: from mail.skyhub.de (mail.skyhub.de [5.9.137.197])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 08AB96E0E4
 for <dri-devel@lists.freedesktop.org>; Tue,  5 Jan 2021 11:43:49 +0000 (UTC)
Received: from zn.tnic (p200300ec2f103700516ef90d43f797fe.dip0.t-ipconnect.de
 [IPv6:2003:ec:2f10:3700:516e:f90d:43f7:97fe])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.skyhub.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id 5319A1EC03C1;
 Tue,  5 Jan 2021 12:43:48 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=dkim;
 t=1609847028;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:in-reply-to:in-reply-to:  references:references;
 bh=g/xf8hdoLpsGm0AJWHiHczuDrlihyCsQII90GMgmI3E=;
 b=ogLy3w6Hs7og2FvvT3btBenp2HnFVmhtUVfNFK32nuNT6LUpHyj4Adn6j5aMvibHvGh7O5
 nfcfpgBSkq8sqjJgZfgbEVZaebn9nl7xBVwI24qWO7LHl91HEvUk3HmtS2jJ4nyypd5C1j
 l1QBlPEGEGpbrsNZKe7nzvoS1qoSl4w=
Date: Tue, 5 Jan 2021 12:43:51 +0100
From: Borislav Petkov <bp@alien8.de>
To: Huang Rui <ray.huang@amd.com>
Subject: Re: 5.11-rc1 TTM list corruption
Message-ID: <20210105114351.GD28649@zn.tnic>
References: <20201231104020.GA4504@zn.tnic>
 <e3bfa0a4-5d0a-bd68-6cc8-73db1d29f22c@amd.com>
 <20210104105802.GD32151@zn.tnic> <20210105041213.GA544780@hr-amd>
 <20210105103138.GB28649@zn.tnic> <20210105110852.GA1052081@hr-amd>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210105110852.GA1052081@hr-amd>
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
Cc: "Koenig, Christian" <Christian.Koenig@amd.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 lkml <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Jan 05, 2021 at 07:08:52PM +0800, Huang Rui wrote:
> Ah, this asic is a bit old and still use radeon driver. So we didn't
> reproduce it on amdgpu driver. I don't have such the old asic in my hand.
> May we know whether this issue can be duplicated after SI which is used
> amdgpu module (not sure whether you have recent APU or GPU)?

The latest I have (I think it is the latest) is:

[    1.826102] [drm] initializing kernel modesetting (RENOIR 0x1002:0x1636 0x17AA:0x5099 0xD1).

and so far that hasn't triggered it. Which makes sense because that
thing uses amdgpu:

[    1.810260] [drm] amdgpu kernel modesetting enabled.

Thx.

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
