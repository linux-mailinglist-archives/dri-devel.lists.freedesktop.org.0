Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EAEAF87097D
	for <lists+dri-devel@lfdr.de>; Mon,  4 Mar 2024 19:26:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C03B6112457;
	Mon,  4 Mar 2024 18:26:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kroah.com header.i=@kroah.com header.b="EQCWL2C2";
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.b="QFMofaAk";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 433 seconds by postgrey-1.36 at gabe;
 Mon, 04 Mar 2024 18:26:17 UTC
Received: from wfhigh6-smtp.messagingengine.com
 (wfhigh6-smtp.messagingengine.com [64.147.123.157])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D71E2112455;
 Mon,  4 Mar 2024 18:26:17 +0000 (UTC)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailfhigh.west.internal (Postfix) with ESMTP id 9FCD118000AF;
 Mon,  4 Mar 2024 13:19:02 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute2.internal (MEProxy); Mon, 04 Mar 2024 13:19:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kroah.com; h=cc
 :cc:content-type:content-type:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:subject
 :subject:to:to; s=fm1; t=1709576342; x=1709662742; bh=5I72IAgIle
 ks6OLkLYZtEzLf5RcIGAx8NGNiSl4OvSo=; b=EQCWL2C2QauoVC9rUwHvnjBA5T
 NFozWAkcoidonwbim7YkhJ0tTq3/JhxK3Mrmeuq3h019PChikmOE2rRqdfW8wzOl
 yoFDWuENytQBNuifFGYx+rKcgTZcW+rgwZIu11gZCnjBDFW9e++kW+CyQd811uFC
 Q62N2FZHgakr8BUsY9cuCWhSxo0ExhDPnmfk6FYoyjpx0mSRHJ96DY9gGlyqiPca
 WRL69LlAS0/IbqcOH2BGpTaSEQRMw7+MM4lkhVfKPtaRDriRrG64ezQ0ATucmPwY
 cLDvY3MCDNdmYEcErEyLaSVCEYNZvK5E8JG+M/V9J/V+b6SAxkWqLuvUnu6w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:content-type:date:date
 :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:subject:subject:to
 :to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm1; t=1709576342; x=1709662742; bh=5I72IAgIleks6OLkLYZtEzLf5RcI
 GAx8NGNiSl4OvSo=; b=QFMofaAkyrd7zIUWQMhWAe+RHcXPBDmruSxTWDr1tXWq
 ODwRuVjRS+n9G6xiy81gSm1nCPobOcK2G1xz/8vFmmr2RTyEd15D2TgTqpJHNvs/
 0sjgjvS2jhYXV+MGHLSLPZPrp0KYYGx4bk+ZTllmbqh2D5HMoJ/pKFzdb/tryr1U
 hyun5pU4VAKnDL40ENUplhf6FmAuZhnW3saMrSfJDhtVCBIN7eUTv5QMgOzDpDrP
 IQGjrmCxiw1Fk46tmXd2U7DF7PkNGnpO/WQbdKe4WhQDLLYJwFm3cmC6V0heK/pF
 8xZ3hDe5nmc+31aC8ykcJbMzqLOcLvztcdQhp2pjfg==
X-ME-Sender: <xms:lRDmZSFT-0ZSUeBdGkx61QFPqy2yuSW8R4n1ZoUFRF5WmU4aHaQwIg>
 <xme:lRDmZTUnFI4c9cQ52rUbXZ4MxfYwzaRXY8MYkqOxS2_fbc_eGa6X-g8JN8ZqF_Fdg
 yB4EYCv7t-D1w>
X-ME-Received: <xmr:lRDmZcKnCqxN1outkorvoz5dgcZ2iTHtG3-NtLR3h5H7XPv3HtJEj5OvMg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvledrheejgddutdelucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvfevuffkfhggtggujgesthdtredttddtvdenucfhrhhomhepifhrvghg
 ucfmjfcuoehgrhgvgheskhhrohgrhhdrtghomheqnecuggftrfgrthhtvghrnhepheegvd
 evvdeljeeugfdtudduhfekledtiefhveejkeejuefhtdeufefhgfehkeetnecuvehluhhs
 thgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepghhrvghgsehkrhhorg
 hhrdgtohhm
X-ME-Proxy: <xmx:lhDmZcEl_frVW884Fn4uYEJDJ-GpOVSfvwZQQp0oUhs3U6wPwNY5xg>
 <xmx:lhDmZYU95LX2anQC30gbRNg9cSh0xgDZddv4bNvTgJpvbaNyU4Il5g>
 <xmx:lhDmZfNL9g6lQPuTpxhw7pnR46GJ6G8JyTQYjAABI-_5aURFmC8vng>
 <xmx:lhDmZZuzjgyDWCi9FwysD36oRd0cv3wE9kmfeMYk9EeP9DYK7fRreXca8s0>
Feedback-ID: i787e41f1:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 4 Mar 2024 13:19:01 -0500 (EST)
Date: Mon, 4 Mar 2024 19:18:53 +0100
From: Greg KH <greg@kroah.com>
To: Danilo Krummrich <dakr@redhat.com>
Cc: stable@vger.kernel.org, nouveau@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Karol Herbst <kherbst@redhat.com>
Subject: Re: [PATCH stable v6.7] drm/nouveau: don't fini scheduler before
 entity flush
Message-ID: <2024030446-upside-nest-59b5@gregkh>
References: <20240304170158.4206-1-dakr@redhat.com>
 <2024030448-basin-grit-b550@gregkh>
 <4a3dc556-d7f4-4741-ae5b-6722bd2ce1c1@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4a3dc556-d7f4-4741-ae5b-6722bd2ce1c1@redhat.com>
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

On Mon, Mar 04, 2024 at 07:10:56PM +0100, Danilo Krummrich wrote:
> On 3/4/24 18:55, Greg KH wrote:
> > On Mon, Mar 04, 2024 at 06:01:46PM +0100, Danilo Krummrich wrote:
> > > Cc: <stable@vger.kernel.org> # v6.7 only
> > You say 6.7 only, but this commit is in 6.6, so why not 6.6 also?
> 
> Good catch, I was sure I originally merged this for 6.7. This fix should indeed
> be applied to 6.6 as well. Should have double checked that, my bad.

Great, now queued up, thanks!

greg k-h
