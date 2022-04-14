Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C500B500B48
	for <lists+dri-devel@lfdr.de>; Thu, 14 Apr 2022 12:39:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6FE4510E280;
	Thu, 14 Apr 2022 10:39:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com
 [66.111.4.26])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0601D10E280;
 Thu, 14 Apr 2022 10:39:16 +0000 (UTC)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailout.nyi.internal (Postfix) with ESMTP id 7970B5C0220;
 Thu, 14 Apr 2022 06:39:14 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute2.internal (MEProxy); Thu, 14 Apr 2022 06:39:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kroah.com; h=cc
 :cc:content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm1; t=1649932754; x=
 1650019154; bh=vLA0u71ZLF0VcyHL0SIWbeMVXZKhWvjOv7ANtqzkCZQ=; b=J
 cg75aITzxJRy3Zwz1WlT4n4k4zIWc5BQW06/XDxGe9mz7X2rNH3d4R6BmnONxcSr
 t/a/GFDdULkb3UcjtUfOXmmIGtcuRf2m2Z4zeNUU+L0dXVocXmvkRfE9oHReaVZF
 O/lca/KQQwAcpTPwq2XwYUn3c10lyh08dqVdNRu2i8291uXb3EDxQkksOrzQvOhS
 xUIV5drK4lIScAIzIlT/v6bU+KyrKm8fMYY3FxhI2K/XfQey3QtBxnTgbzX6K1Or
 mgdMpkx6dZx3RsI1zZlFuZbTLoVbE7chNMzZQzaYF4HauJ56qyX6Y2EvkKXrtlzU
 J0o/oWg0GpoaGwrcWF8Bg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm1; t=1649932754; x=1650019154; bh=vLA0u71ZLF0Vc
 yHL0SIWbeMVXZKhWvjOv7ANtqzkCZQ=; b=jMC0k3q1bG9Y2+DOGz5mC5xB0Xl5b
 P1aGUAAgFlKZ4GP1NNd5DUFleq69G4rOq/B/Miy+mP1v+5oNgr26tglNaXcFNGtI
 p5hBVzKzGx9zZVqXox051CsWdVd0PyHWdU6HwJqyOm9iEZBVzyJOuZqYj8unOEnh
 /n6Gc6QAWW+yqze+4AVWlfLGdHkKIClE8Ls0FhhrXgLf21XhY8T1EnIpKQYUSOW+
 fhCvKleHrMEAbkO4M4fEX5LA1wMU7REP0vGzNJyGAs+PbagLblgpQSm9VtitqyOb
 316XH10S2ClPPDpsvOxKYsfhDeLkM2kloJ88MnRWyU4p7Ppjy2le1Lbeg==
X-ME-Sender: <xms:0vlXYkqgg3sEfK03lXvA0wM75Dl_mIRhnwnq6sF8y7bwnxRrU7qQEw>
 <xme:0vlXYqrXOxGkUjUFXey_EN7QI3Ejb1njY0pSYFagn812bTWQpJNw-i1R3dYkbC96y
 wVCN8k9V6PTsA>
X-ME-Received: <xmr:0vlXYpPnVU474PyKh00YakZ9O-opf2mtqJMy5Azs8cdQyRk8AwZT10d4U9Z1uKQbhpHXvyFt9Rjuw0OanBW1nomqgYx0grER>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddrudelfedgfeduucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvffukfhfgggtugfgjgesthekredttddtudenucfhrhhomhepifhrvghg
 ucfmjfcuoehgrhgvgheskhhrohgrhhdrtghomheqnecuggftrfgrthhtvghrnhepvedtie
 elueetgeeggfeufefhvefgtdetgfetgfdtvdegjeehieduvddtkeffheffnecuvehluhhs
 thgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepghhrvghgsehkrhhorg
 hhrdgtohhm
X-ME-Proxy: <xmx:0vlXYr4XCcN2oEk53QJEFZxnLQU399Uvi3lk8gqUqMdWXN25lPAhEg>
 <xmx:0vlXYj6UnxmGcpOKng3omE0CWs6Q6_1KZr2GOtUpr7pOU6YXrK7DwA>
 <xmx:0vlXYrhuMDZdKYs4aoRMgZAO_KrI2acppWZUtckzQfszLZ4DWMbZ3Q>
 <xmx:0vlXYnqlYNoxwTpANenJTheHnZBurKMRLIclsQ81NeX5xwX4Hw-_IA>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 14 Apr 2022 06:39:13 -0400 (EDT)
Date: Thu, 14 Apr 2022 12:39:10 +0200
From: Greg KH <greg@kroah.com>
To: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH 5.10 1/1] drm/amdgpu: Ensure the AMDGPU file descriptor
 is legitimate
Message-ID: <Ylf5zmP88Lw0md47@kroah.com>
References: <20220412152057.1170235-1-lee.jones@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220412152057.1170235-1-lee.jones@linaro.org>
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
Cc: dri-devel@lists.freedesktop.org, David Airlie <airlied@linux.ie>,
 Felix Kuehling <Felix.Kuehling@amd.com>, stable@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, Alex Deucher <alexander.deucher@amd.com>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Apr 12, 2022 at 04:20:57PM +0100, Lee Jones wrote:
> [ Upstream commit b40a6ab2cf9213923bf8e821ce7fa7f6a0a26990 ]
> 
> This is a partial cherry-pick of the above upstream commit.
> 
> It ensures the file descriptor passed in by userspace is a valid one.
> 
> Cc: Felix Kuehling <Felix.Kuehling@amd.com>
> Cc: Alex Deucher <alexander.deucher@amd.com>
> Cc: "Christian König" <christian.koenig@amd.com>
> Cc: David Airlie <airlied@linux.ie>
> Cc: Daniel Vetter <daniel@ffwll.ch>
> Cc: amd-gfx@lists.freedesktop.org
> Cc: dri-devel@lists.freedesktop.org
> Signed-off-by: Lee Jones <lee.jones@linaro.org>
> ---
>  drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c | 10 +++++++---
>  1 file changed, 7 insertions(+), 3 deletions(-)

Now queued up, thanks.

greg k-h
