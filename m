Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0588AA37D41
	for <lists+dri-devel@lfdr.de>; Mon, 17 Feb 2025 09:36:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ED42A10E392;
	Mon, 17 Feb 2025 08:35:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=adrian.larumbe@collabora.com header.b="EgaJO2NC";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E9CC810E392
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Feb 2025 08:35:23 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1739781321; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=N5j/H3W6v89nLI+AK6sosNnb2ClNPRcdKzMAm8I3G4bZ/RPGpMxdEgRQ5UI5ntZiDQb3W3CbJaS9LugZMzIGx6nvbIBIP429W3muQKYcVqb9W2qv/xAEYqP4tz+gO2rmagtk/paVYgx38rBYNwFw+ABSxqpOhkpTBdCy8QXUAyY=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1739781321;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=DhptLPuZPDLUhtdo4A/L9DOuFj+9oKDP7oYJohfFXv4=; 
 b=JL4sHmwAh36LXZiKXC6iVlHqJGmXCTRQ8btlVJ90XYFu3wULjbkChNz0LVAGM5zTPG7KOMwX01csmU/1bDmPpG6vjoEtuu+tdQpzGJ8o1b2VCMD3VAsDpm8qYtiXhctx07oo7w9JyXmSDss/gToMTkSqk5+yhJIGMQF3nAeUPxU=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=adrian.larumbe@collabora.com;
 dmarc=pass header.from=<adrian.larumbe@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1739781321; 
 s=zohomail; d=collabora.com; i=adrian.larumbe@collabora.com;
 h=Date:Date:From:From:To:To:Cc:Cc:Subject:Subject:Message-ID:References:MIME-Version:Content-Type:Content-Transfer-Encoding:In-Reply-To:Message-Id:Reply-To;
 bh=DhptLPuZPDLUhtdo4A/L9DOuFj+9oKDP7oYJohfFXv4=;
 b=EgaJO2NCUMRNlyLuIU1ZA6rYe2MNETD/SHbN6o6Lj6zWT8fzZMUC0iSnIORAbzib
 0+sP25q/6Y8pNUk9M3/0/ARFCdnPicjMuDujYa5vmVaL87bveT4BjE3sYZxmh8E/n3H
 LRNGIrrcO+eL/OPo/A2B3Wz1MOCoNWCgy5ELbo7Y=
Received: by mx.zohomail.com with SMTPS id 1739781319936106.17352859243897;
 Mon, 17 Feb 2025 00:35:19 -0800 (PST)
Date: Mon, 17 Feb 2025 08:35:16 +0000
From: =?utf-8?Q?Adri=C3=A1n?= Larumbe <adrian.larumbe@collabora.com>
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: dri-devel@lists.freedesktop.org
Subject: Re: [bug report] drm/panthor: Expose size of driver internal BO's
 over fdinfo
Message-ID: <cd4bwv3pxpapl3nxiym2zml4vcpm7q5zdl44ntdatk5vug7ppj@fyhnahr2e5zm>
References: <083ef44a-ea8a-4291-b345-c570cc1078f4@stanley.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <083ef44a-ea8a-4291-b345-c570cc1078f4@stanley.mountain>
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

Hi Dan, thanks for the bug report.

A fix is already being discussed at https://lore.kernel.org/dri-devel/20250215102807.7502e7ba@collabora.com/

On 17.02.2025 00:36, Dan Carpenter wrote:
> Hello Adrián Larumbe,
>
> Commit 434e5ca5b5d7 ("drm/panthor: Expose size of driver internal
> BO's over fdinfo") from Jan 30, 2025 (linux-next), leads to the
> following Smatch static checker warning:
>
> 	drivers/gpu/drm/panthor/panthor_mmu.c:1968 panthor_vm_heaps_sizes()
> 	warn: sleeping in atomic context
>
> drivers/gpu/drm/panthor/panthor_mmu.c
>     1956 void panthor_vm_heaps_sizes(struct panthor_file *pfile, struct drm_memory_stats *stats)
>     1957 {
>     1958         struct panthor_vm *vm;
>     1959         unsigned long i;
>     1960
>     1961         if (!pfile->vms)
>     1962                 return;
>     1963
>     1964         xa_lock(&pfile->vms->xa);
>                  ^^^^^^^
> This is a spinlock.
>
>     1965         xa_for_each(&pfile->vms->xa, i, vm) {
>     1966                 size_t size = 0;
>     1967
> --> 1968                 mutex_lock(&vm->heaps.lock);
>                          ^^^^^^^^^^
> So we can't take a mutex if we're holding a spinlock.
>
>     1969                 if (vm->heaps.pool)
>     1970                         size = panthor_heap_pool_size(vm->heaps.pool);
>     1971                 mutex_unlock(&vm->heaps.lock);
>     1972
>     1973                 stats->resident += size;
>     1974                 if (vm->as.id >= 0)
>     1975                         stats->active += size;
>     1976         }
>     1977         xa_unlock(&pfile->vms->xa);
>     1978 }
>
> regards,
> dan carpenter

Kind Regards,
Adrian Larumbe
