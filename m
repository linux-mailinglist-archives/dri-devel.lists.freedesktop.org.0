Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 23BD6A419C8
	for <lists+dri-devel@lfdr.de>; Mon, 24 Feb 2025 10:57:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BCBD310E1B3;
	Mon, 24 Feb 2025 09:57:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=3xo.fr header.i=@3xo.fr header.b="BXW8cJ8A";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.3xo.fr (mail.3xo.fr [212.129.21.66])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6300610E1B3
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Feb 2025 09:57:40 +0000 (UTC)
Received: from localhost (mail.3xo.fr [212.129.21.66])
 by mail.3xo.fr (Postfix) with ESMTP id 815E88D;
 Mon, 24 Feb 2025 10:57:38 +0100 (CET)
X-Virus-Scanned: Debian amavis at nxo2.3xo.fr
Received: from mail.3xo.fr ([212.129.21.66])
 by localhost (mail.3xo.fr [212.129.21.66]) (amavis, port 10024) with ESMTP
 id eLhPAqcJMhzr; Mon, 24 Feb 2025 10:57:36 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.3xo.fr 0EC4C8C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=3xo.fr; s=3xo;
 t=1740391056; bh=NFlPp2fA2pDpeFVq75KIRnfMMtdGC9swH34bQDpPKdk=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=BXW8cJ8AoWFZakWzml0RkTc50uPb9O2nXfdFdjNicF08tRTxq1iWvbP8mdZQ3Z7nE
 m4wTpInI/9IVPb7IfsCXJfaTCUNesoWhHGewRr4fhCeuECz6XEeu5RdUSuzCv9/Eab
 m1fDECNnqZGUtIbOQmRKu6bPxSrX57i4YXdthDm1ZHpj44bb49u7HqD9qmDiZ37ht/
 BXLxRY1Xewx4wPRNPzmxPPd8OkSyeLRwzWO68+L7fZCZp/yWImG/4tNzqbuSnJaJyw
 nmFjj4f6cqtV8MhiPaCUhOnmZ8d+vK1OimHDZp1iDBErv3lY3DHpd72bf4/0IrtqKM
 yoMbznt+2EMPg==
Received: from mail.3xo.fr (mail.3xo.fr [212.129.21.66])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
 (No client certificate requested)
 by mail.3xo.fr (Postfix) with ESMTPSA id 0EC4C8C;
 Mon, 24 Feb 2025 10:57:36 +0100 (CET)
MIME-Version: 1.0
Date: Mon, 24 Feb 2025 10:57:35 +0100
From: Nicolas Baranger <nicolas.baranger@3xo.fr>
To: Jani Nikula <jani.nikula@linux.intel.com>
Cc: Thomas Zimmermann <tzimmermann@suse.de>,
 dri-devel@lists.freedesktop.org, airlied@redhat.com, Jocelyn Falempe
 <jfalempe@redhat.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 linux-kernel@vger.kernel.org
Subject: Re: Include ASPEED ast-drm 1.15.1 video driver in kernel tree
In-Reply-To: <87o6yr911t.fsf@intel.com>
References: <d507f6268ea3158b5af82b6860ca7b71@3xo.fr>
 <194c4656963debcf074d87e89ab1a829@3xo.fr>
 <b296bfef-1a9c-4452-baeb-09f86758addd@suse.de>
 <984c317de1027f5886390a65f1f66126@3xo.fr> <87o6yr911t.fsf@intel.com>
Message-ID: <78ac8b58affdd365506fe72822e30f6f@3xo.fr>
X-Sender: nicolas.baranger@3xo.fr
Content-Type: text/plain; charset=UTF-8;
 format=flowed
Content-Transfer-Encoding: 8bit
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

Hi Jani

> I'm not sure what you're trying to say here. The driver date was 
> removed
> because it was virtually never updated for any driver. It provided no
> useful information.

Sure your right, when I removed it from NVIDIA driver (to be able to 
build nvidia driver with DKMS on mainline), the .date value was still 
set to 20160202 !
See the PR here 
https://github.com/NVIDIA/open-gpu-kernel-modules/pull/783

I did just say that to be able to build and use the ast_new on mainline 
(6.14-rcX) I had to update the source which were working on linux-stable 
and to remove .date from drm structure.
That's why on the online directory there are 2 versions of the driver, 
one for linux-stable (up to 6.13.2) and one for mainline (from 
6.14.0-rc1).

Kind regards
Nicolas Baranger



Le 2025-02-24 09:53, Jani Nikula a écrit :

> On Thu, 13 Feb 2025, Nicolas Baranger <nicolas.baranger@3xo.fr> wrote:
> 
>> Yes, due to .date total removal in linux 6.14
>> (https://github.com/torvalds/linux/commit/cb2e1c2136f71618142557ceca3a8802e87a44cd)
>> the last DKMS sources are :
>> https://xba.soartist.net/ast-drm_nba_20250211/nba-dkms/nba_last_src_20250212/src/
> 
> I'm not sure what you're trying to say here. The driver date was 
> removed
> because it was virtually never updated for any driver. It provided no
> useful information.
> 
> BR,
> Jani.
