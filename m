Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A76DD82AC5A
	for <lists+dri-devel@lfdr.de>; Thu, 11 Jan 2024 11:45:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0753A10E8D1;
	Thu, 11 Jan 2024 10:45:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 149A510E8D1;
 Thu, 11 Jan 2024 10:45:12 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by ams.source.kernel.org (Postfix) with ESMTP id 239DDB81B7D;
 Thu, 11 Jan 2024 10:45:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1B788C433C7;
 Thu, 11 Jan 2024 10:45:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1704969910;
 bh=otTxhAPvsRjqSlgmiFFIM6ilyM8UWcJKCMTo+H92XN8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Y0rVHaajgApriNuaWA17WZi171hNoFM5LJcggluyOYRxi/n6Mk5oWxp2Y4rUT2RaW
 MAIwYGBIfjcz4bqyOqGeblCTavgPjPW4ARnQoL8Ssx4XdJgcUrnBQt0V6P11asRKxZ
 n9qCPIYLSo0orM8T2OJVZNv2HykFEpud7NwhxR0s=
Date: Thu, 11 Jan 2024 11:45:07 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Fedor Pchelkin <pchelkin@ispras.ru>
Subject: Re: [PATCH 5.10 1/1] drm/qxl: fix UAF on handle creation
Message-ID: <2024011100-marsupial-outshine-e7f5@gregkh>
References: <20240109110827.9458-1-pchelkin@ispras.ru>
 <20240109110827.9458-2-pchelkin@ispras.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240109110827.9458-2-pchelkin@ispras.ru>
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
Cc: lvc-project@linuxtesting.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Wander Lairson Costa <wander@redhat.com>,
 stable@vger.kernel.org, virtualization@lists.linux-foundation.org,
 Gerd Hoffmann <kraxel@redhat.com>, spice-devel@lists.freedesktop.org,
 Dave Airlie <airlied@redhat.com>, Alexey Khoroshilov <khoroshilov@ispras.ru>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Jan 09, 2024 at 02:08:25PM +0300, Fedor Pchelkin wrote:
> From: Wander Lairson Costa <wander@redhat.com>
> 
> commit c611589b4259ed63b9b77be6872b1ce07ec0ac16 upstream.

Now queued up, thanks.

greg k-h
