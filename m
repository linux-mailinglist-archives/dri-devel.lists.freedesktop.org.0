Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C266178FE1
	for <lists+dri-devel@lfdr.de>; Wed,  4 Mar 2020 12:53:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4ADD66EB28;
	Wed,  4 Mar 2020 11:53:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 461 seconds by postgrey-1.36 at gabe;
 Wed, 04 Mar 2020 11:53:35 UTC
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.17.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AF4796EB26;
 Wed,  4 Mar 2020 11:53:35 +0000 (UTC)
Received: from [192.168.242.100] ([84.139.200.112]) by
 mrelayeu.kundenserver.de (mreue106 [212.227.15.183]) with ESMTPSA (Nemesis)
 id 1M3DeV-1j5tUH0HiX-003cuc; Wed, 04 Mar 2020 12:40:36 +0100
Subject: Re: [PATCH 0/5] drm/lima: add error debug functionality
To: Qiang Yu <yuq825@gmail.com>, dri-devel@lists.freedesktop.org
References: <20200222024210.18697-1-yuq825@gmail.com>
From: Andreas Baierl <list@imkreisrum.de>
Message-ID: <9bbffc05-e79d-bbd3-94aa-33be223cfe3c@imkreisrum.de>
Date: Wed, 4 Mar 2020 12:40:34 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200222024210.18697-1-yuq825@gmail.com>
X-Provags-ID: V03:K1:Pt/9AMIrbNHnoWnleQEg2Qte3kNoMO2Nr85vYy1UoQNU6YGR3xT
 MLAt2UMA1aMVA5BOJ0Yv4zhHuSfIBy8LIPAmSamVwPFB477Ajv9N0T65Q/nu8TV6twkeqje
 0vn4p9f7eDWs6C4EJi/nY3IrF1mGTEQ55YmL8jN5zpZ1G54nyC7zqBF3PFUXdoB82P5M0Iz
 xfnaLI7B8ngkzTn/KqqUg==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:zM42z6cw8nQ=:ITXVFZerDWm+wliHYBClXw
 g2pZxGyiCr2hNuvnO2Pct58dj0wWIAekAIhpIP3OBCzHOexxCfcBIS7vL+2zkJE9/LjfqKGt9
 DgOZN2OGzCsledAhcWosIC04SGLC8o3GLjYhg46PlgqLPVvbXAp1cbaHxpsPwVaPRcMH2ai3O
 3wrOR/5a4tPMOwwkBURQU80lzmyspi/Q5vdlkr5OR7XwuNKNPml1BNd3Vj7VJg4R86PXtDB+5
 q5v8Q1KZu7rjoeZ4znAvmQwHsCS90acnj70woGGKYRWl3jD8kjMp+FIiyc3/j4pRpZJj/jffI
 0dN3h2NbalrLrr/fkxwX8bbu9enXyoXMeFMRJ4x3dymLWCU8N8/kCil3Fs+HQnk2x4PHjhPe8
 XJpk2Nk1sPnTJd3RN259cHryzkrojXXbKDb6eamOluBzeBlQauqT3ZK6C6ngdXmVV0/UA/81T
 Gpwkc82yMEPLOGSnu/HbZJHnwgL/W9KGXi11Ymj0qIx4ZWSUe9vcqe7IpR2fNba2uyPtCgO/J
 5geA3MBx2xG0Ktsn3qqs1gGUBxmsNwt3ImUYzycQszAm+N2FkjtN/+puqBY3pcX/nP5pV2LYy
 EasG5kWqnHU3zTCfX7PZCDXwaZa55NeSxTysPs2YFId7uMY8dyi6Ft62igrEj7vFHvdEiV3MP
 9F+IxHTBkAOtGSJxauwSwvRcjCQdP1oV5c3WkKu5K3BHT+cFxt9Z+V5spC/AQWL5qsx1hPzVa
 S6hqF6gZcVsXM2sMalewPT6Z1RMX6tMrSjrGdgzOQ6BmErQ6pd/1SMs2NdBDOkqzeSLEbgNM/
 2WlSCqgd0RD4Bj/0qEK72z5COhzBOnfRGgMAzWzyli17LFSRDbNlZZuCYohubVvaSWLa0+a
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
Cc: lima@lists.freedesktop.org, David Airlie <airlied@linux.ie>,
 Vasily Khoruzhick <anarsoul@gmail.com>, Andreas Baierl <ichgeh@imkreisrum.de>,
 Erico Nunes <nunes.erico@gmail.com>, Icenowy Zheng <icenowy@aosc.io>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

I could successfully use the output with 
https://gitlab.freedesktop.org/lima/lima.dump

So you can add my
Tested-by: Andreas Baierl <ichgeh@imkreisrum.de>


Am 22.02.2020 um 03:42 schrieb Qiang Yu:
> Save task error state when it fail and export to user by
> sysfs as a binary file which can be dumped and replayed
> by lima_dump tool at:
> https://gitlab.freedesktop.org/lima/lima_dump
>
> Qiang Yu (5):
>    drm/lima: save process info for debug usage
>    drm/lima: add max_error_tasks module parameter
>    drm/lima: save task info dump when task fail
>    drm/lima: add error sysfs to export error task dump
>    drm/lima: add LIMA_BO_FLAG_FORCE_VA
>
>   drivers/gpu/drm/lima/lima_ctx.c    |   3 +
>   drivers/gpu/drm/lima/lima_ctx.h    |   5 ++
>   drivers/gpu/drm/lima/lima_device.c |  13 +++
>   drivers/gpu/drm/lima/lima_device.h |   8 ++
>   drivers/gpu/drm/lima/lima_drv.c    | 123 +++++++++++++++++++++++++--
>   drivers/gpu/drm/lima/lima_drv.h    |   1 +
>   drivers/gpu/drm/lima/lima_dump.h   |  77 +++++++++++++++++
>   drivers/gpu/drm/lima/lima_gem.c    |   7 +-
>   drivers/gpu/drm/lima/lima_gem.h    |   4 +-
>   drivers/gpu/drm/lima/lima_sched.c  | 128 +++++++++++++++++++++++++++++
>   drivers/gpu/drm/lima/lima_sched.h  |   7 ++
>   drivers/gpu/drm/lima/lima_vm.c     |  13 ++-
>   include/uapi/drm/lima_drm.h        |   9 +-
>   13 files changed, 385 insertions(+), 13 deletions(-)
>   create mode 100644 drivers/gpu/drm/lima/lima_dump.h
>

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
