Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DD6F3B5B79
	for <lists+dri-devel@lfdr.de>; Mon, 28 Jun 2021 11:39:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 92D7A6E3DA;
	Mon, 28 Jun 2021 09:39:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AB8896E3DA
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Jun 2021 09:39:36 +0000 (UTC)
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 (Authenticated sender: bbrezillon)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 264111F42420;
 Mon, 28 Jun 2021 10:39:32 +0100 (BST)
Date: Mon, 28 Jun 2021 11:39:28 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Steven Price <steven.price@arm.com>
Subject: Re: [PATCH v4 07/14] drm/panfrost: Use a threaded IRQ for job
 interrupts
Message-ID: <20210628113928.5a5a7791@collabora.com>
In-Reply-To: <ba0b5a88-d853-ee66-4ec5-58781e2469fe@arm.com>
References: <20210628074210.2695399-1-boris.brezillon@collabora.com>
 <20210628074210.2695399-8-boris.brezillon@collabora.com>
 <ba0b5a88-d853-ee66-4ec5-58781e2469fe@arm.com>
Organization: Collabora
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
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
Cc: Tomeu Vizoso <tomeu.vizoso@collabora.com>, dri-devel@lists.freedesktop.org,
 Rob Herring <robh+dt@kernel.org>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
 Robin Murphy <robin.murphy@arm.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, 28 Jun 2021 10:26:39 +0100
Steven Price <steven.price@arm.com> wrote:

> On 28/06/2021 08:42, Boris Brezillon wrote:
> > This should avoid switching to interrupt context when the GPU is under
> > heavy use.
> > 
> > v3:
> > * Don't take the job_lock in panfrost_job_handle_irq()
> > 
> > Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
> > Acked-by: Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>  
> 
> I thought I'd already reviewed this one, but anyway:
> 
> Reviewed-by: Steven Price <steven.price@arm.com>
> 

Oops, indeed, I overlooked that one.
