Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 58497365407
	for <lists+dri-devel@lfdr.de>; Tue, 20 Apr 2021 10:24:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1652E6E11E;
	Tue, 20 Apr 2021 08:24:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id A64646E11E
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Apr 2021 08:24:43 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 1746A1435;
 Tue, 20 Apr 2021 01:24:43 -0700 (PDT)
Received: from bogus (unknown [10.57.52.142])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 0529B3F85F;
 Tue, 20 Apr 2021 01:24:41 -0700 (PDT)
Date: Tue, 20 Apr 2021 09:24:39 +0100
From: Sudeep Holla <sudeep.holla@arm.com>
To: Kai-Heng Feng <kai.heng.feng@canonical.com>
Subject: Re: [PATCH] efifb: Fix runtime pm calls for non PCI efifb device
Message-ID: <20210420082439.2xvrmcoa6kygbhow@bogus>
References: <20210415102224.2764054-1-sudeep.holla@arm.com>
 <20210420075332.t56dlpppb6bnpjzd@bogus>
 <CAAd53p6zti5rmJ5LjW3WbYsSGBs5CgBuOztHv-nvMObGBh7Q+A@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAAd53p6zti5rmJ5LjW3WbYsSGBs5CgBuOztHv-nvMObGBh7Q+A@mail.gmail.com>
User-Agent: NeoMutt/20171215
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
Cc: "open list:EFIFB FRAMEBUFFER DRIVER" <linux-fbdev@vger.kernel.org>,
 LKML <linux-kernel@vger.kernel.org>,
 "open list:DRM DRIVERS" <dri-devel@lists.freedesktop.org>,
 Peter Jones <pjones@redhat.com>, Thomas Zimmermann <tzimmermann@suse.de>,
 Alex Deucher <alexander.deucher@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Apr 20, 2021 at 04:12:26PM +0800, Kai-Heng Feng wrote:
> Hi Sudeep,
>
> On Tue, Apr 20, 2021 at 3:53 PM Sudeep Holla <sudeep.holla@arm.com> wrote:
> >
> > Gentle Ping! There is boot failure because of this issue with linux-next
> > on few arm platforms with non PCIe efifb. Please review and get the fix
> > merged ASAP so the testing on these platforms can continue with linux-next.
>
> It was merged in drm-tip as d510c88cfbb2 ("efifb: Check efifb_pci_dev
> before using it").
>

Ah OK, thanks! But I don't think it is appear on -next yet.

--
Regards,
Sudeep
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
