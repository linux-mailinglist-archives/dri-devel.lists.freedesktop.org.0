Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E3BB837201
	for <lists+dri-devel@lfdr.de>; Mon, 22 Jan 2024 20:11:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F142610E0B7;
	Mon, 22 Jan 2024 19:11:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 541 seconds by postgrey-1.36 at gabe;
 Mon, 22 Jan 2024 19:11:07 UTC
Received: from out3-smtp.messagingengine.com (out3-smtp.messagingengine.com
 [66.111.4.27])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E044910EC72
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Jan 2024 19:11:07 +0000 (UTC)
Received: from compute7.internal (compute7.nyi.internal [10.202.2.48])
 by mailout.nyi.internal (Postfix) with ESMTP id 8ACEF5C01F9;
 Mon, 22 Jan 2024 14:02:04 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute7.internal (MEProxy); Mon, 22 Jan 2024 14:02:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kroah.com; h=cc
 :cc:content-type:content-type:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:subject
 :subject:to:to; s=fm3; t=1705950124; x=1706036524; bh=/3jn0klblO
 JlmE5L7RLA0gOkZzg+qb+808qcNYDq010=; b=heyykCPWh+Xa6vDvp7ZcdHVxU/
 TxfUXFJpV9R1lEO8HMaexmQPhympkFcfigzzA6vrwy0gcpROd5JyeOrXLen3MXoA
 2x3GeGk0021My1fPlupI7JniwqaIVvVsECdmfqFSzLbIErYkewWK2+x413bZHUjx
 lMc7nOOx5dZ4KOC9VsoP9WaZXOvjnyUEKUdYvfEVoXfR9hT8pPheF1qiWpxi6vd4
 C8JyOpwMt+og36JTZcBuXrt5qWGp2FIWPpO11au2Cx9TNlY93xcwJbcLUBwCwP0w
 7YtgpxCAQkU78/ARpWrcTVOvRNnPlCWR5Ia9GdEVG2kU9Mik3FQiiQYmQQ7A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:content-type:date:date
 :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:subject:subject:to
 :to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm3; t=1705950124; x=1706036524; bh=/3jn0klblOJlmE5L7RLA0gOkZzg+
 qb+808qcNYDq010=; b=r07nOuw5c8s6MBJBuBJqnawdRfqryJM6KUnDAyRjPpc9
 DpUZCfcrbmv7tfa4U+3VsQAGQAjmec6lwcjK0m1HwhTrQvgsXydWKkKs+HYYtd5Y
 WTy2ZkXSIh5UBLAiB+8IxlAWlROq6xMUPdJphXWv83jeO8phgZa9C6iBdI+86bNH
 1SsgzPA2lgg+63jqiNWb2yt+MwrqgCBht9mkYV5JLWpZinKviT/1JjACdyf8uH7f
 Hplju25RYAz9ZMAiL2vofBJ+zMOvkix7OyXFvTKGc+hJ4apcxuG7vaukfPd0HBYU
 Ky4b2wf7dzsSqIJdnh1UqCKXChkl5mZ27Fwayj8RTQ==
X-ME-Sender: <xms:rLuuZZXkVEg-9XYlwFFZHoR_kNN0ng8LXcN3yxoCBLWcbkYglDrLpQ>
 <xme:rLuuZZlN1Uj9KyybnaLPygmi72tYsLLi2RBiF5xQJlv-_omgdN75Nu0P05GBCxxEE
 CwOtrnbMZ9lRA>
X-ME-Received: <xmr:rLuuZVbY9dSidZxnLroOyT3jZwbfig5p8Ab_nNz2VCItMPurdkCXAYkeVHP3eMDXJi1UDHLyQtzvgW0>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvkedrvdekiedguddujecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enucfjughrpeffhffvvefukfhfgggtuggjsehttdertddttddvnecuhfhrohhmpefirhgv
 ghcumffjuceoghhrvghgsehkrhhorghhrdgtohhmqeenucggtffrrghtthgvrhhnpeehge
 dvvedvleejuefgtdduudfhkeeltdeihfevjeekjeeuhfdtueefhffgheekteenucevlhhu
 shhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehgrhgvgheskhhroh
 grhhdrtghomh
X-ME-Proxy: <xmx:rLuuZcXMNdWjc29ejrYwOHGMEhn5UmWBt06KtAoYyVihpSO1K6YAcQ>
 <xmx:rLuuZTnywPVcAbSH9HT6nX38KcYYjzf01_6IltHpaBZbImexWtKTfw>
 <xmx:rLuuZZf0ODir7JAmQaC7s5t9CWuRg_x3xNX0DwO-kctKFkCsp8ZRyw>
 <xmx:rLuuZRaZSCbPFmkzWihhgMBQojYOivWrfercD5yXVOUuvkKcYCXfHQ>
Feedback-ID: i787e41f1:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 22 Jan 2024 14:02:03 -0500 (EST)
Date: Mon, 22 Jan 2024 11:01:56 -0800
From: Greg KH <greg@kroah.com>
To: Jocelyn Falempe <jfalempe@redhat.com>
Subject: Re: [PATCH 0/2] drm/vmwgfx backport two fixes to v6.1.x branch
Message-ID: <2024012246-affirm-vixen-e598@gregkh>
References: <20240122172031.243604-1-jfalempe@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240122172031.243604-1-jfalempe@redhat.com>
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
Cc: dri-devel@lists.freedesktop.org, stable@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Jan 22, 2024 at 06:10:11PM +0100, Jocelyn Falempe wrote:
> Hi,
> 
> I've backported this two commits:
> f9e96bf19054 drm/vmwgfx: Fix possible invalid drm gem put calls
> 91398b413d03 drm/vmwgfx: Keep a gem reference to user bos in surfaces
> 
> They both fixes a950b989ea29 ("drm/vmwgfx: Do not drop the reference
> to the handle too soon")
> which has been backported to v6.1.x branch as 0a127ac97240
> 
> There was a lot of conflicts, and as I'm not familiar with the vmwgfx
> driver, it's better to review and test them.
> I've run a short test, and it worked, but that's certainly not enough.

All now queued up, thanks.

greg k-h
