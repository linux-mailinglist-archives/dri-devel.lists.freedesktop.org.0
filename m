Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AEA51BB1DC
	for <lists+dri-devel@lfdr.de>; Tue, 28 Apr 2020 01:11:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BF00E89BBD;
	Mon, 27 Apr 2020 23:11:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0FCEF89BBD
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Apr 2020 23:11:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1588029091;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=3ncyryMDL05pBarr3ylMK+zoG1N/QDBbcZWrIlKB8+A=;
 b=AkTNNceM1g085+CkxdPgOd3wCbADUdwVB4Ixorb2XfPI93/CiZm2UCyc7XjlYw3Pmo6A4e
 Xo0f4yYw9VGrN2o50aSu6c/VMPGPlJ/A2u09ZPjW1e7MivPuXgsTd8A10UglWY0ak/u/n+
 XaU2myB8S4r2Dl3JecI8vPuM5Hnk3E0=
Received: from mail-oo1-f71.google.com (mail-oo1-f71.google.com
 [209.85.161.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-12-Io0PkGtHNKa3GvdII6Gh-Q-1; Mon, 27 Apr 2020 19:11:28 -0400
X-MC-Unique: Io0PkGtHNKa3GvdII6Gh-Q-1
Received: by mail-oo1-f71.google.com with SMTP id t23so17921812oor.1
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Apr 2020 16:11:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to;
 bh=3ZzO4dGmO9XzdcHlazCGrcpNNhUK2PWfkdhIELfeKhI=;
 b=RNDnR1Ms87/49hmC2lWWwwarXQnxv1tc11uRUXp6w9GKPsXGx9Y4uwOtEb9fYc4vHQ
 zMWwJpSQgFkCN/hTRrpruYM9/r8LECwLVlZGt+VR7VSNsBh2mScBA7A9SAGUa2zQ0sy3
 CkvlNNITdgFPiXmarSy8p50TqOJS1mgFF5Q7IP+xCroRiD+pQ3BFEFyEe3WwvCdaxWNx
 dPuEDsA5jHJ9gD+vUbLUznAvTrkAe8GZ8PsW67sEMHPEOfuhwmVgtpe3MeUkeTtITYuk
 RePupUwhW8BVbdI4EukEyGESt+H5DB0IngpQHAqi6t0N8krHhSHfLFF7BwP6XY3XruwN
 zjqg==
X-Gm-Message-State: AGi0Pua4t7PBh6Str3h+03RavBW1/IK1GkStsB2mBmZH0sX/38tOYgKh
 9jN2OnATArg1hwLREr6id3dXg7T4pxB6Mle3teTlTyy9fYoV61NAmiqTVAIpWK+FS/qbL+flZCL
 ymY07UcPAocjanEvSLWR7gUyxkMRNFPAPOrHjUObxoCWu
X-Received: by 2002:a05:6808:b0c:: with SMTP id
 s12mr887650oij.163.1588029086620; 
 Mon, 27 Apr 2020 16:11:26 -0700 (PDT)
X-Google-Smtp-Source: APiQypINZVaq5OJEgeI8fg6mvsx1sZKCdb+IFlsrwxpa/1l2rTZ3qBN7b+lm36YhGDMmuWf8UhLJBuJOt2CD4JRXHUQ=
X-Received: by 2002:a05:6808:b0c:: with SMTP id
 s12mr887614oij.163.1588029086025; 
 Mon, 27 Apr 2020 16:11:26 -0700 (PDT)
MIME-Version: 1.0
References: <b0e7694c33aadb8e3c87dee281e2bc56c9dbbc9e.camel@gmail.com>
In-Reply-To: <b0e7694c33aadb8e3c87dee281e2bc56c9dbbc9e.camel@gmail.com>
From: David Airlie <airlied@redhat.com>
Date: Tue, 28 Apr 2020 09:11:14 +1000
Message-ID: <CAMwc25pMJp7gS4dOOsieywAcGA53XjtOK47k5e8svL5QLP6muw@mail.gmail.com>
Subject: Re: Msg "PM: pci_pm_suspend(): ast_pm_suspend+0x0/0x40 [ast] returns
 -22" after migrating to V5.6.7 kernel from v5.5.10.
To: Cary Garrett <cogarre@gmail.com>,
 dri-devel <dri-devel@lists.freedesktop.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Adding dri-devel.

This might need a bisect to work out where it went wrong,

Dave.

On Tue, Apr 28, 2020 at 7:48 AM Cary Garrett <cogarre@gmail.com> wrote:
>
> Hello,
>
> System won't go into suspend state after migrating to V5.6.7 kernel. Working in V5.5.10.
>
> Journal showing following:
>
> Apr 27 16:07:54 kernel: PM: pci_pm_suspend(): ast_pm_suspend+0x0/0x40 [ast] returns -22
> Apr 27 16:07:54 kernel: PM: dpm_run_callback(): pci_pm_suspend+0x0/0x160 returns -22
> Apr 27 16:07:54 kernel: PM: Device 0000:04:00.0 failed to suspend async: error -22
>
> Journalctl output at time of failure:
>
> -- Logs begin at Tue 2020-04-21 17:10:11 CDT, end at Mon 2020-04-27 16:23:33 CDT. --
> Apr 27 16:07:54 systemd[1]: Reached target Sleep.
> Apr 27 16:07:54 systemd[1]: Starting Suspend...
> Apr 27 16:07:54 systemd-sleep[1104]: Suspending system...
> Apr 27 16:07:54 kernel: PM: suspend entry (deep)
> Apr 27 16:07:54 kernel: Filesystems sync: 0.091 seconds
> Apr 27 16:07:54 kernel: Freezing user space processes ... (elapsed 0.001 seconds) done.
> Apr 27 16:07:54 kernel: OOM killer disabled.
> Apr 27 16:07:54 kernel: Freezing remaining freezable tasks ... (elapsed 0.001 seconds) done.
> Apr 27 16:07:54 kernel: printk: Suspending console(s) (use no_console_suspend to debug)
> Apr 27 16:07:54 kernel: sd 6:0:1:0: [sdc] Synchronizing SCSI cache
> Apr 27 16:07:54 kernel: sd 6:0:0:0: [sdb] Synchronizing SCSI cache
> Apr 27 16:07:54 kernel: serial 00:09: disabled
> Apr 27 16:07:54 kernel: serial 00:06: disabled
> Apr 27 16:07:54 kernel: serial 00:05: disabled
> Apr 27 16:07:54 kernel: PM: pci_pm_suspend(): ast_pm_suspend+0x0/0x40 [ast] returns -22
> Apr 27 16:07:54 kernel: PM: dpm_run_callback(): pci_pm_suspend+0x0/0x160 returns -22
> Apr 27 16:07:54 kernel: PM: Device 0000:04:00.0 failed to suspend async: error -22
> Apr 27 16:07:54 kernel: sd 0:0:0:0: [sda] Synchronizing SCSI cache
> Apr 27 16:07:54 kernel: sd 0:0:0:0: [sda] Stopping disk
> Apr 27 16:07:54 kernel: PM: Some devices failed to suspend, or early wake event detected
> Apr 27 16:07:54 kernel: sd 0:0:0:0: [sda] Starting disk
> Apr 27 16:07:54 kernel: serial 00:05: activated
> Apr 27 16:07:54 kernel: serial 00:06: activated
> Apr 27 16:07:54 kernel: serial 00:09: activated
> Apr 27 16:07:54 kernel: OOM killer enabled.
> Apr 27 16:07:54 kernel: Restarting tasks ... done.
> Apr 27 16:07:54 kernel: PM: suspend exit
> Apr 27 16:07:54 kernel: PM: suspend entry (s2idle)
> Apr 27 16:07:55 kernel: Filesystems sync: 0.078 seconds
> Apr 27 16:07:55 kernel: Freezing user space processes ... (elapsed 0.001 seconds) done.
> Apr 27 16:07:55 kernel: OOM killer disabled.
> Apr 27 16:07:55 kernel: Freezing remaining freezable tasks ... (elapsed 0.001 seconds) done.
> Apr 27 16:07:55 kernel: printk: Suspending console(s) (use no_console_suspend to debug)
> Apr 27 16:07:55 kernel: sd 6:0:0:0: [sdb] Synchronizing SCSI cache
> Apr 27 16:07:55 kernel: sd 6:0:1:0: [sdc] Synchronizing SCSI cache
> Apr 27 16:07:55 kernel: serial 00:09: disabled
> Apr 27 16:07:55 kernel: serial 00:06: disabled
> Apr 27 16:07:55 kernel: serial 00:05: disabled
> Apr 27 16:07:55 kernel: PM: pci_pm_suspend(): ast_pm_suspend+0x0/0x40 [ast] returns -22
> Apr 27 16:07:55 kernel: PM: dpm_run_callback(): pci_pm_suspend+0x0/0x160 returns -22
> Apr 27 16:07:55 kernel: PM: Device 0000:04:00.0 failed to suspend async: error -22
> Apr 27 16:07:55 kernel: mpt2sas_cm0: pdev=0x0000000003c9e977, slot=0000:02:00.0, entering operating
> state [D4]
> Apr 27 16:07:55 kernel: mpt2sas_cm0: sending message unit reset !!
> Apr 27 16:07:55 kernel: mpt2sas_cm0: message unit reset: SUCCESS
> Apr 27 16:07:55 kernel: sd 0:0:0:0: [sda] Synchronizing SCSI cache
> Apr 27 16:07:55 kernel: sd 0:0:0:0: [sda] Stopping disk
> Apr 27 16:07:55 kernel: ata3: SATA link down (SStatus 0 SControl 300)
> Apr 27 16:07:55 kernel: ata2: SATA link down (SStatus 0 SControl 300)
> Apr 27 16:07:55 kernel: ata4: SATA link down (SStatus 0 SControl 300)
> Apr 27 16:07:55 kernel: ata6: SATA link down (SStatus 0 SControl 300)
> Apr 27 16:07:55 kernel: ata5: SATA link down (SStatus 0 SControl 300)
> Apr 27 16:07:55 kernel: PM: Some devices failed to suspend, or early wake event detected
> Apr 27 16:07:55 kernel: sd 0:0:0:0: [sda] Starting disk
> Apr 27 16:07:55 kernel: serial 00:05: activated
> Apr 27 16:07:55 kernel: serial 00:06: activated
> Apr 27 16:07:55 kernel: serial 00:09: activated
> Apr 27 16:07:55 kernel: mpt2sas_cm0: pdev=0x0000000003c9e977, slot=0000:02:00.0, previous operating
> state [D0]
> Apr 27 16:07:55 kernel: mpt2sas_cm0: 64 BIT PCI BUS DMA ADDRESSING SUPPORTED, total mem (16354848
> kB)
> Apr 27 16:07:55 kernel: mpt2sas_cm0: CurrentHostPageSize is 0: Setting default host page size to 4k
> Apr 27 16:07:55 kernel: mpt2sas_cm0: MSI-X vectors supported: 16
> Apr 27 16:07:55 kernel:          no of cores: 8, max_msix_vectors: -1
> Apr 27 16:07:55 kernel: mpt2sas_cm0:  0 8
> Apr 27 16:07:55 kernel: mpt2sas_cm0: High IOPs queues : disabled
> Apr 27 16:07:55 kernel: mpt2sas0-msix0: PCI-MSI-X enabled: IRQ 42
> Apr 27 16:07:55 kernel: mpt2sas0-msix1: PCI-MSI-X enabled: IRQ 43
> Apr 27 16:07:55 kernel: mpt2sas0-msix2: PCI-MSI-X enabled: IRQ 44
> Apr 27 16:07:55 kernel: mpt2sas0-msix3: PCI-MSI-X enabled: IRQ 45
> Apr 27 16:07:55 kernel: mpt2sas0-msix4: PCI-MSI-X enabled: IRQ 46
> Apr 27 16:07:55 kernel: mpt2sas0-msix5: PCI-MSI-X enabled: IRQ 47
> Apr 27 16:07:55 kernel: mpt2sas0-msix6: PCI-MSI-X enabled: IRQ 48
> Apr 27 16:07:55 kernel: mpt2sas0-msix7: PCI-MSI-X enabled: IRQ 49
> Apr 27 16:07:55 kernel: mpt2sas_cm0: iomem(0x00000000f7240000), mapped(0x00000000213f11d5),
> size(65536)
> Apr 27 16:07:55 kernel: mpt2sas_cm0: ioport(0x000000000000e000), size(256)
> Apr 27 16:07:55 kernel: mpt2sas_cm0: Issuing Hard Reset as part of OS Resume
> Apr 27 16:07:55 kernel: mpt2sas_cm0: CurrentHostPageSize is 0: Setting default host page size to 4k
> Apr 27 16:07:55 kernel: mpt2sas_cm0: LSISAS2308: FWVersion(20.00.04.00), ChipRevision(0x05),
> BiosVersion(07.39.00.00)
> Apr 27 16:07:55 kernel: mpt2sas_cm0: Protocol=(Initiator,Target), Capabilities=(TLR,EEDP,Snapshot
> Buffer,Diag Trace Buffer,Task Set Full,NCQ)
> Apr 27 16:07:55 kernel: mpt2sas_cm0: sending port enable !!
> Apr 27 16:07:55 kernel: mpt2sas_cm0: port enable: SUCCESS
> Apr 27 16:07:55 kernel: mpt2sas_cm0: search for end-devices: start
> Apr 27 16:07:55 kernel: scsi target6:0:1: handle(0x0009), sas_addr(0x4433221101000000)
> Apr 27 16:07:55 kernel: scsi target6:0:1: enclosure logical id(0x50030480119cb000), slot(2)
> Apr 27 16:07:55 kernel: scsi target6:0:0: handle(0x000a), sas_addr(0x4433221103000000)
> Apr 27 16:07:55 kernel: scsi target6:0:0: enclosure logical id(0x50030480119cb000), slot(0)
> Apr 27 16:07:55 kernel: mpt2sas_cm0: search for end-devices: complete
> Apr 27 16:07:55 kernel: mpt2sas_cm0: search for end-devices: start
> Apr 27 16:07:55 kernel: mpt2sas_cm0: search for PCIe end-devices: complete
> Apr 27 16:07:55 kernel: mpt2sas_cm0: search for expanders: start
> Apr 27 16:07:55 kernel: mpt2sas_cm0: search for expanders: complete
> Apr 27 16:07:55 kernel: mpt2sas_cm0: mpt3sas_base_hard_reset_handler: SUCCESS
> Apr 27 16:07:55 kernel: mpt2sas_cm0: removing unresponding devices: start
> Apr 27 16:07:55 kernel: mpt2sas_cm0: removing unresponding devices: end-devices
> Apr 27 16:07:55 kernel: mpt2sas_cm0: Removing unresponding devices: pcie end-devices
> Apr 27 16:07:55 kernel: mpt2sas_cm0: removing unresponding devices: expanders
> Apr 27 16:07:55 kernel: mpt2sas_cm0: removing unresponding devices: complete
> Apr 27 16:07:55 kernel: mpt2sas_cm0: scan devices: start
> Apr 27 16:07:55 kernel: mpt2sas_cm0:         scan devices: expanders start
> Apr 27 16:07:55 kernel: mpt2sas_cm0:         break from expander scan: ioc_status(0x0022),
> loginfo(0x310f0400)
> Apr 27 16:07:55 kernel: mpt2sas_cm0:         scan devices: expanders complete
> Apr 27 16:07:55 kernel: mpt2sas_cm0:         scan devices: end devices start
> Apr 27 16:07:55 kernel: OOM killer enabled.
> Apr 27 16:07:55 kernel: Restarting tasks ...
> Apr 27 16:07:55 kernel: mpt2sas_cm0:         break from end device scan: ioc_status(0x0022),
> loginfo(0x310f0400)
> Apr 27 16:07:55 kernel: mpt2sas_cm0:         scan devices: end devices complete
> Apr 27 16:07:55 kernel: mpt2sas_cm0:         scan devices: pcie end devices start
> Apr 27 16:07:55 kernel: mpt2sas_cm0: log_info(0x3003011d): originator(IOP), code(0x03),
> sub_code(0x011d)
> Apr 27 16:07:55 kernel: mpt2sas_cm0: log_info(0x3003011d): originator(IOP), code(0x03),
> sub_code(0x011d)
> Apr 27 16:07:55 kernel: mpt2sas_cm0:         break from pcie end device scan: ioc_status(0x0022),
> loginfo(0x3003011d)
> Apr 27 16:07:55 kernel: mpt2sas_cm0:         pcie devices: pcie end devices complete
> Apr 27 16:07:55 kernel: mpt2sas_cm0: scan devices: complete
> Apr 27 16:07:55 kernel: done.
> Apr 27 16:07:55 kernel: PM: suspend exit
> Apr 27 16:07:55 systemd-sleep[1104]: Failed to suspend system. System resumed again: Invalid
> argument
> Apr 27 16:07:55 systemd[1]: Condition check resulted in Set Up Additional Binary Formats being
> skipped.
> Apr 27 16:07:55 systemd[1]: Condition check resulted in Store a System Token in an EFI Variable
> being skipped.
> Apr 27 16:07:55 systemd[1]: Condition check resulted in First Boot Wizard being skipped.
> Apr 27 16:07:55 systemd[1]: Condition check resulted in Commit a transient machine-id on disk being
> skipped.
> Apr 27 16:07:55 systemd[1]: Condition check resulted in Load Kernel Modules being skipped.
> Apr 27 16:07:55 systemd[1]: Condition check resulted in FUSE Control File System being skipped.
> Apr 27 16:07:55 systemd[1]: Starting Atop advanced performance monitor...
> Apr 27 16:07:55 kernel: Process accounting resumed
> Apr 27 16:07:55 systemd[1]: Started Atop advanced performance monitor.
> Apr 27 16:07:55 audit[1]: SERVICE_START pid=1 uid=0 auid=4294967295 ses=4294967295 msg='unit=atop
> comm="systemd" exe="/usr/lib/systemd/systemd" hostname=? addr=? terminal=? res=success'
> Apr 27 16:07:55 kernel: audit: type=1130 audit(1588021675.058:119): pid=1 uid=0 auid=4294967295
> ses=4294967295 msg='unit=atop comm="systemd" exe="/usr/lib/systemd/systemd" hostname=? addr=?
> terminal=? res=success'
> Apr 27 16:07:55 systemd[1]: systemd-suspend.service: Main process exited, code=exited,
> status=1/FAILURE
> Apr 27 16:07:55 systemd[1]: systemd-suspend.service: Failed with result 'exit-code'.
> Apr 27 16:07:55 systemd[1]: Failed to start Suspend.
> Apr 27 16:07:55 systemd[1]: Dependency failed for Suspend.
> Apr 27 16:07:55 systemd[1]: suspend.target: Job suspend.target/start failed with result
> 'dependency'.
> Apr 27 16:07:55 audit[1]: SERVICE_START pid=1 uid=0 auid=4294967295 ses=4294967295
> msg='unit=systemd-suspend comm="systemd" exe="/usr/lib/systemd/systemd" hostname=? addr=? terminal=?
> res=failed'
> Apr 27 16:07:55 systemd-logind[653]: Operation 'sleep' finished.
> Apr 27 16:07:55 systemd-networkd[681]: lo: Reset carrier
> Apr 27 16:07:55 systemd[1]: Stopped target Sleep.
> Apr 27 16:07:55 systemd-networkd[681]: eno2: DHCP lease lost
> Apr 27 16:07:55 kernel: audit: type=1130 audit(1588021675.061:120): pid=1 uid=0 auid=4294967295
> ses=4294967295 msg='unit=systemd-suspend comm="systemd" exe="/usr/lib/systemd/systemd" hostname=?
> addr=? terminal=? res=failed'
> Apr 27 16:07:55 systemd-networkd[681]: eno2: DHCPv6 lease lost
> Apr 27 16:07:55 minidlnad[742]: getifaddr.c:109: error: Network interface eno2 not found
> Apr 27 16:07:55 dbus-daemon[647]: [system] Activating via systemd: service
> name='org.freedesktop.hostname1' unit='dbus-org.freedesktop.hostname1.service' requested by ':1.3'
> (uid=193 pid=681 comm="/usr/lib/systemd/systemd-networkd ")
> Apr 27 16:07:55 systemd-networkd[681]: eno2: Reset carrier
> Apr 27 16:07:55 systemd[1]: Condition check resulted in Set Up Additional Binary Formats being
> skipped.
> Apr 27 16:07:55 systemd[1]: Condition check resulted in Store a System Token in an EFI Variable
> being skipped.
> Apr 27 16:07:55 systemd[1]: Condition check resulted in First Boot Wizard being skipped.
> Apr 27 16:07:55 systemd[1]: Condition check resulted in Commit a transient machine-id on disk being
> skipped.
> Apr 27 16:07:55 systemd[1]: Condition check resulted in Load Kernel Modules being skipped.
> Apr 27 16:07:55 systemd[1]: Condition check resulted in FUSE Control File System being skipped.
> Apr 27 16:07:55 kernel: audit: type=1334 audit(1588021675.071:121): prog-id=12 op=LOAD
> Apr 27 16:07:55 kernel: audit: type=1334 audit(1588021675.071:122): prog-id=13 op=LOAD
> Apr 27 16:07:55 audit: AUDIT1334 prog-id=12 op=LOAD
> Apr 27 16:07:55 audit: AUDIT1334 prog-id=13 op=LOAD
> Apr 27 16:07:55 systemd[1]: Starting Hostname Service...
> Apr 27 16:07:55 kernel: ata4: SATA link down (SStatus 0 SControl 300)
> Apr 27 16:07:55 kernel: ata6: SATA link down (SStatus 0 SControl 300)
> Apr 27 16:07:55 kernel: ata3: SATA link down (SStatus 0 SControl 300)
> Apr 27 16:07:55 kernel: ata2: SATA link down (SStatus 0 SControl 300)
> Apr 27 16:07:55 kernel: ata5: SATA link down (SStatus 0 SControl 300)
> Apr 27 16:07:55 dbus-daemon[647]: [system] Successfully activated service
> 'org.freedesktop.hostname1'
> Apr 27 16:07:55 systemd[1]: Started Hostname Service.
> Apr 27 16:07:55 audit[1]: SERVICE_START pid=1 uid=0 auid=4294967295 ses=4294967295
> msg='unit=systemd-hostnamed comm="systemd" exe="/usr/lib/systemd/systemd" hostname=? addr=?
> terminal=? res=success'
> Apr 27 16:07:55 kernel: audit: type=1130 audit(1588021675.375:123): pid=1 uid=0 auid=4294967295
> ses=4294967295 msg='unit=systemd-hostnamed comm="systemd" exe="/usr/lib/systemd/systemd" hostname=?
> addr=? terminal=? res=success'
>
>
>
> "lspci -vvvv -s 00:04:00" output:
>
> 04:00.0 VGA compatible controller: ASPEED Technology, Inc. ASPEED Graphics Family (rev 30) (prog-if
> 00 [VGA controller])
>         DeviceName: Onboard VGA
>         Subsystem: Super Micro Computer Inc ASPEED Graphics Family
>         Control: I/O+ Mem+ BusMaster+ SpecCycle- MemWINV- VGASnoop- ParErr- Stepping- SERR- FastB2B-
> DisINTx-
>         Status: Cap+ 66MHz- UDF- FastB2B- ParErr- DEVSEL=medium >TAbort- <TAbort- <MAbort- >SERR-
> <PERR- INTx-
>         Latency: 0
>         Interrupt: pin A routed to IRQ 16
>         Region 0: Memory at f6000000 (32-bit, non-prefetchable) [size=16M]
>         Region 1: Memory at f7000000 (32-bit, non-prefetchable) [size=128K]
>         Region 2: I/O ports at d000 [size=128]
>         Expansion ROM at 000c0000 [virtual] [disabled] [size=128K]
>         Capabilities: [40] Power Management version 3
>                 Flags: PMEClk- DSI- D1+ D2+ AuxCurrent=375mA PME(D0+,D1+,D2+,D3hot+,D3cold+)
>                 Status: D0 NoSoftRst- PME-Enable- DSel=0 DScale=0 PME-
>         Capabilities: [50] MSI: Enable- Count=1/4 Maskable- 64bit+
>                 Address: 0000000000000000  Data: 0000
>         Kernel driver in use: ast
>         Kernel modules: ast
>
>
>
> "modinfo ast" output:
>
> filename:       /lib/modules/5.6.7-arch1-1/kernel/drivers/gpu/drm/ast/ast.ko.xz
> license:        GPL and additional rights
> description:    AST
> author:         Dave Airlie
> firmware:       ast_dp501_fw.bin
> srcversion:     64E79F607231209C250D3DF
> alias:          pci:v00001A03d00002010sv*sd*bc03sc*i*
> alias:          pci:v00001A03d00002000sv*sd*bc03sc*i*
> depends:        drm,drm_kms_helper,drm_vram_helper,i2c-algo-bit
> retpoline:      Y
> intree:         Y
> name:           ast
> vermagic:       5.6.7-arch1-1 SMP preempt mod_unload
> sig_id:         PKCS#7
> signer:         Build time autogenerated kernel key
> sig_key:        45:29:5C:B9:2E:80:AC:38:4F:95:8E:5C:8E:23:D8:83:BB:A6:34:42
> sig_hashalgo:   sha512
> signature:      29:C2:6D:CA:F4:4C:BE:87:80:66:F3:1B:EB:EA:69:CB:75:1F:2E:FD:
>                 74:08:9F:B1:A4:AE:B3:55:6D:92:94:76:81:C7:95:58:34:37:11:99:
>                 16:E7:71:C8:0C:AF:B0:64:FE:FB:39:69:0D:78:CA:36:E3:AC:87:D4:
>                 93:B1:6F:04:AF:E8:C7:41:0B:CC:5E:34:95:E2:17:CC:F3:FA:E6:70:
>                 2B:07:24:DE:DB:C1:DA:48:6E:BF:F3:F3:88:E0:73:85:F2:AE:1B:E8:
>                 39:F8:8F:31:0D:87:40:4B:D8:09:2D:83:F7:AA:57:A1:5B:48:A6:9C:
>                 3E:B0:CA:7E:E1:45:D1:07:6B:1D:B4:41:5D:E7:43:05:3B:52:E3:F7:
>                 E6:AD:7B:8D:FA:44:29:77:41:58:97:91:5D:F2:74:C0:AA:63:2F:E8:
>                 0F:D3:99:44:A8:F7:CE:20:98:49:CD:11:E0:E1:F5:75:D6:89:41:02:
>                 52:91:85:50:BC:23:E8:FD:C0:19:B9:34:79:8F:F3:B7:E7:81:93:F6:
>                 50:35:10:38:53:FC:5D:AE:4A:AC:57:92:06:26:48:80:F2:B8:5F:55:
>                 AB:51:7A:51:0C:8A:6C:0D:B5:44:AF:7F:22:33:69:43:93:7E:76:07:
>                 5F:E6:CD:CC:A0:BA:F5:B6:BF:FE:51:43:8E:70:4E:15:9B:94:26:2F:
>                 F6:69:A5:EA:F7:21:91:D2:89:BC:EC:3C:43:80:49:A8:AC:19:F8:F9:
>                 8E:3F:F1:23:33:0E:EF:8F:CF:2A:B3:40:04:1A:69:AD:55:F7:BA:91:
>                 CD:F8:C6:56:7E:BE:AC:55:AF:BA:BD:5E:FB:7E:2B:49:B1:A3:30:1F:
>                 53:92:75:09:AA:CA:F9:AD:74:6B:F4:5B:56:D6:95:B1:54:93:B5:BF:
>                 49:70:07:3C:BA:8A:81:70:0B:AB:DA:3A:88:A1:A6:AE:4B:9A:39:49:
>                 6F:CA:E3:82:5E:4D:14:5A:F0:17:87:35:6E:A6:C8:A0:A0:BE:9C:0C:
>                 31:5A:FD:5D:98:33:ED:BF:3D:C4:3C:4A:38:22:BE:DB:09:E3:5D:6E:
>                 ED:6F:1C:B6:9A:6E:93:4E:FA:13:39:59:7F:81:13:34:0A:48:D4:91:
>                 E6:10:72:EA:10:CE:43:53:77:A4:BE:79:F2:91:05:EB:AD:0D:7A:4E:
>                 1C:94:63:D7:05:10:23:CC:A8:29:53:AB:6A:D6:91:0E:E6:3C:90:42:
>                 5B:98:66:32:15:54:64:22:0A:78:98:DC:32:C4:5F:71:0C:87:80:A9:
>                 FE:04:39:A1:43:0B:25:5D:D9:43:C8:DD:73:1D:FB:D1:EE:AA:F2:C5:
>                 AF:DE:F4:DA:AA:DF:09:F9:A3:A7:AA:C9
> parm:           modeset:Disable/Enable modesetting (int)
>
>
>
> I could not find where this has been previously reported. Please contact me more info is needed>
>
> Thanks, Cary Garrett
>
>
>
>

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
