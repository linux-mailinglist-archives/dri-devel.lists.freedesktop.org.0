Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E85CD881742
	for <lists+dri-devel@lfdr.de>; Wed, 20 Mar 2024 19:18:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7311610E01F;
	Wed, 20 Mar 2024 18:18:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="RhiThRyq";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F106F10E01F;
 Wed, 20 Mar 2024 18:18:01 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id B1ED3CE11A1;
 Wed, 20 Mar 2024 18:17:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 84D5EC433F1;
 Wed, 20 Mar 2024 18:17:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1710958678;
 bh=nyR0uFG7tZpDXAGVoxwRgN9QFStj44cGzi46W0+gxB8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=RhiThRyq/MN/RH0CbLM/1cZMJ/aCX1F3SuKOSRLETFEqW3rmgrMAL0pyYZkcMLvG9
 45aqUG120Z6iQxUwUQ+a2n8I6Md45CQGLToscbOc5t9X/EebufPOLWsfQm4SaG8wUA
 TnJSpCIt0m00Amai+vANkYZixDCvxcf4k6CRZoww=
Date: Wed, 20 Mar 2024 19:17:54 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Danilo Krummrich <dakr@redhat.com>
Cc: dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 rust-for-linux@vger.kernel.org, airlied@redhat.com,
 lyude@redhat.com, pstanner@redhat.com, ajanulgu@redhat.com,
 mcanal@igalia.com, lina@asahilina.net, a.hindborg@samsung.com
Subject: Re: Nova and staging Rust abstractions
Message-ID: <2024032007-imprison-rejoicing-e925@gregkh>
References: <Zfsj0_tb-0-tNrJy@cassiopeiae>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Zfsj0_tb-0-tNrJy@cassiopeiae>
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

On Wed, Mar 20, 2024 at 06:58:43PM +0100, Danilo Krummrich wrote:
> @Greg, can you please have a first quick look at rust-device [5]?

If they are sent as patches to review, yes, I can get to them as part of
my normal patch review cycle.  Otherwise I have no cyeles to dig through
random github trees...

thanks,

greg k-h
