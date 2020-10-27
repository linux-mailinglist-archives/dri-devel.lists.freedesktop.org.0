Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F56429A48F
	for <lists+dri-devel@lfdr.de>; Tue, 27 Oct 2020 07:22:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 391446EAE3;
	Tue, 27 Oct 2020 06:22:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CA1A66EAE3
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Oct 2020 06:22:21 +0000 (UTC)
Received: from localhost (83-86-74-64.cable.dynamic.v4.ziggo.nl [83.86.74.64])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 3728B216FD;
 Tue, 27 Oct 2020 06:22:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1603779741;
 bh=OX6Gx1/fazV7MgcdQVipYlPzthf7xQVRu6z13u2l37g=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=HTJ1CB3eGJLWuPKuMtrCh2xzKMlhQJzY7OyRAEsQkiyXoPuPQ3/UIjGDGEqhF+yiJ
 /JPjDYkCvD4H+1UIX0jaI6YuJn7BO30UI5CnA+4On75ZvM89inOD78+DF0csBaErG6
 F1x+QZ7ywt8xKjBsnK57ByYzRrtRKf0Opyz+4ATM=
Date: Tue, 27 Oct 2020 07:22:17 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Saeed Mirzamohammadi <saeed.mirzamohammadi@oracle.com>
Subject: Re: [PATCH 1/1] video: fbdev: fix divide error in fbcon_switch
Message-ID: <20201027062217.GE206502@kroah.com>
References: <20201021235758.59993-1-saeed.mirzamohammadi@oracle.com>
 <ad87c5c1-061d-8a81-7b2c-43a8687a464f@suse.de>
 <3294C797-1BBB-4410-812B-4A4BB813F002@oracle.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <3294C797-1BBB-4410-812B-4A4BB813F002@oracle.com>
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
Cc: linux-fbdev@vger.kernel.org, b.zolnierkie@samsung.com,
 jani.nikula@intel.com, daniel.vetter@ffwll.ch, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org, gustavoars@kernel.org, dri-devel@lists.freedesktop.org,
 Thomas Zimmermann <tzimmermann@suse.de>, akpm@linux-foundation.org,
 rppt@kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Oct 26, 2020 at 10:00:11AM -0700, Saeed Mirzamohammadi wrote:
> Thanks, adding stable.

Why?  What are we supposed to do with this?
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
