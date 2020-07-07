Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 37141217523
	for <lists+dri-devel@lfdr.de>; Tue,  7 Jul 2020 19:29:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E99B86E0D9;
	Tue,  7 Jul 2020 17:29:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EX13-EDG-OU-001.vmware.com (ex13-edg-ou-001.vmware.com
 [208.91.0.189])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5C1BA6E0D9
 for <dri-devel@lists.freedesktop.org>; Tue,  7 Jul 2020 17:29:54 +0000 (UTC)
Received: from sc9-mailhost2.vmware.com (10.113.161.72) by
 EX13-EDG-OU-001.vmware.com (10.113.208.155) with Microsoft SMTP Server id
 15.0.1156.6; Tue, 7 Jul 2020 10:29:49 -0700
Received: from [0.0.0.0] (oddjob.vmware.com [10.253.4.32])
 by sc9-mailhost2.vmware.com (Postfix) with ESMTP id 7F233B2B61;
 Tue,  7 Jul 2020 13:29:50 -0400 (EDT)
Subject: Re: PROBLEM: kernel oops caused by vmwgfx_cmdbuf.c:399
To: "Carle, Peter" <Peter.Carle@trojans.dsu.edu>,
 "linux-graphics-maintainer@vmware.com" <linux-graphics-maintainer@vmware.com>
References: <80fabd1334a54787b490db8ef5f0550f@BR3EXC01A.k12.sd.local>
From: Roland Scheidegger <sroland@vmware.com>
Message-ID: <4e398d32-9d5f-fc2e-542a-d92c6e2330b4@vmware.com>
Date: Tue, 7 Jul 2020 19:29:49 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Firefox/68.0 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <80fabd1334a54787b490db8ef5f0550f@BR3EXC01A.k12.sd.local>
Content-Language: de-DE
Received-SPF: None (EX13-EDG-OU-001.vmware.com: sroland@vmware.com does not
 designate permitted sender hosts)
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
Cc: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

we are aware of an issue in our driver with kernel 5.7 resulting in
black screen and working on fixing it.

Roland

Am 07.07.20 um 17:43 schrieb Carle, Peter:
> Good morning! Line 399 of vmwgfx_cmdbuf.c apparently causes a kernel oops that freezes the OS during boot-time. 
> 
> Here is the full line of the summary as reported by the Fedora notification system:
> 
> ---
> 
> WARNING: CPU: 2 PID: 414 at drivers/gpu/drm/vmwgfx/vmwgfx_cmdbuf.c:399 vmw_cmdbuf_ctx_process+0x262/0x270 [vmwgfx]
> 
> ---
> 
> This problem started with Fedora 32's recent upgrade to kernel version 5.7 on July 2nd. It does not exist in kernel version 5.6. 
> 
> The problem occurs with Fedora running within VMware Workstation Pro on a Windows 10 host. It does not occur with VirtualBox. 
> 
> When I attempt to boot the VM, it freezes with a black screen after getting past the initial boot screen. 
> 
> I have included screenshots of the full error report from the notification system, since it was having trouble exporting it to text format. Probably the most pertinent screenshots are vmwgfx_crash.PNG and coredump_dmesg.PNG.
> 
> Thank you!
> 

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
