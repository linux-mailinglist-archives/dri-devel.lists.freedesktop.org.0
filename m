Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F044737FC0
	for <lists+dri-devel@lfdr.de>; Wed, 21 Jun 2023 13:03:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3ABFA10E443;
	Wed, 21 Jun 2023 11:02:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BCA7810E441
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Jun 2023 11:02:56 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 72603614BE;
 Wed, 21 Jun 2023 11:02:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 87BBEC433C8;
 Wed, 21 Jun 2023 11:02:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1687345374;
 bh=/ZP93gyM4ekuY/OOvuft6EH5tLpk4c1Fh1xaSgC03N8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=EdjXfEW6gkhrgmW/IQiYnl+YPab9l8ik1UoemqCFAcc6QPtyCR5w7iqbEnADESSGW
 KR5E463zeEeBepaSOjuy6VqSVuUcGAOr4qZEFAyfIaiec4h+1JV5YlNt0zBLhEtHOb
 f7QEhl9IpaDzIxiYNsJ+W7405oQyxv50lO1/uAjg=
Date: Wed, 21 Jun 2023 13:02:50 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Christian =?iso-8859-1?Q?K=F6nig?= <ckoenig.leichtzumerken@gmail.com>
Subject: Re: [PATCH] dma-buf: keep the signaling time of merged fences
Message-ID: <2023062140-bartender-closable-9fa9@gregkh>
References: <20230621073204.28459-1-christian.koenig@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230621073204.28459-1-christian.koenig@amd.com>
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
Cc: stable@vger.kernel.org, juan.hao@nxp.com,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Jun 21, 2023 at 09:32:04AM +0200, Christian König wrote:
> Some Android CTS is testing for that.
> 
> Signed-off-by: Christian König <christian.koenig@amd.com>
> CC: stable@vger.kernel.org

What commit id does this fix?

thanks,

greg k-h
