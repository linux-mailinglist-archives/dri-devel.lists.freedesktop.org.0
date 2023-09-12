Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CEAF79CFF1
	for <lists+dri-devel@lfdr.de>; Tue, 12 Sep 2023 13:31:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B257E10E0BA;
	Tue, 12 Sep 2023 11:31:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org
 [IPv6:2604:1380:40e1:4800::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2507910E0BA;
 Tue, 12 Sep 2023 11:31:32 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by sin.source.kernel.org (Postfix) with ESMTPS id C8C0BCE19F6;
 Tue, 12 Sep 2023 11:31:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D419AC433C7;
 Tue, 12 Sep 2023 11:31:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1694518289;
 bh=g/mqhZ5VRqpjqHUFTtCPOZQA0fipLYIPInbPUYFDKgE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=XMIzOaXL6n4FSgZS+c5S+Kcf5BL28RO1B0TyizWUzsAXxhv0BjHY/x0zCq7NTLmsD
 9cdqN9CXeLSvs/chCDtOrrzSklsZ7tyK8vMvjuHdyC/jwdvASI6hY0+Acl497Wfcxl
 KaM1fAFteUmomC7/4Hak+p+yQCOfXU9K8s0w/8IA=
Date: Tue, 12 Sep 2023 13:31:26 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Bryan Jennings <bryjen423@gmail.com>
Subject: Re: [PATCH AUTOSEL 5.10 13/22] drm/amdgpu: install stub fence into
 potential unused fence pointers
Message-ID: <2023091221-reminder-joylessly-8181@gregkh>
References: <2023083119-phoney-ascend-d4ec@gregkh>
 <d32d6919-47cf-4ddc-955a-0759088220ae@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d32d6919-47cf-4ddc-955a-0759088220ae@gmail.com>
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
Cc: sashal@kernel.org, airlied@linux.ie, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 alexander.deucher@amd.com, stable@vger.kernel.org, Lang.Yu@amd.com,
 christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sun, Sep 10, 2023 at 03:43:01PM -0500, Bryan Jennings wrote:
> This is also causing log spam on 5.15.  It was included in 5.15.128 as
> commit 4921792e04f2125b5eadef9dbe9417a8354c7eff.  I encountered this and
> found https://gitlab.freedesktop.org/drm/amd/-/issues/2820 while researching
> the problem.

Now reverted, thanks.

greg k-h
