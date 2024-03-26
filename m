Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7490E88C860
	for <lists+dri-devel@lfdr.de>; Tue, 26 Mar 2024 17:02:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 95A9F10ED99;
	Tue, 26 Mar 2024 16:02:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=arndb.de header.i=@arndb.de header.b="mjCT9fo6";
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.b="R8Az+nHD";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fhigh8-smtp.messagingengine.com
 (fhigh8-smtp.messagingengine.com [103.168.172.159])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7623D10E222
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Mar 2024 16:02:34 +0000 (UTC)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailfhigh.nyi.internal (Postfix) with ESMTP id E88BB114008C;
 Tue, 26 Mar 2024 12:02:32 -0400 (EDT)
Received: from imap51 ([10.202.2.101])
 by compute5.internal (MEProxy); Tue, 26 Mar 2024 12:02:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
 :cc:content-transfer-encoding:content-type:content-type:date
 :date:from:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:reply-to:subject:subject:to:to; s=fm1; t=1711468952;
 x=1711555352; bh=uZQNPynhKPF46EB/VI6vYwBBa1dqaara1pLLBIisxc8=; b=
 mjCT9fo6BpB7CSjlxicGaG/bS9hBLKCK3w6UShjKUvJktIIjba0cHRBKQAimrc5Q
 Emv6TmTcP0KOyBxUFeKu7CE83/rb1jMarfYe0oIwxsWa65ehQ8LTpZFtTFQDVOuo
 wDBcHV1cN4ZnimtBxcgqh0RhCjGYsF9Sg7tKIvkfjgc7IZqiG3+oiX4kjl3YqZt9
 ORsRs+LHyp48c1UEPbHS/AnyUCJHWBWmNbxtsAZU3yrh917L6a7wt6A2JfqnKE5w
 MnJ3d9DHRmb2vQE3TEOK9phybyGejur466HXU1Ve6Tylxan1k7JO4XG+f+63cVut
 Zsmng4dpx0203Bo+/PR1Kw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:content-type:date:date:feedback-id:feedback-id
 :from:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1711468952; x=
 1711555352; bh=uZQNPynhKPF46EB/VI6vYwBBa1dqaara1pLLBIisxc8=; b=R
 8Az+nHDQmgC0yNbisHXJ3de+Z7rjacbhC5d6IM8Pa/bXUI0Sd3iTpgvvmFOrS0XU
 4gp2B6BhmcXpSUScqla22drDVDBJr5u4AMhja1b/rJqrH8uSG13hPOlwPt734Oaq
 1XWClBMuivbPZ3QXR0XzJJOoTtjwk9co108Jbaw8+MmyDuhT27H5bCmwCTCvz3BI
 zGV8mMLxna7ZeEakS/YOIZlGq8uaP9w7g4X/+kc+WLgzXsz7Az25CW8GngrZ6roY
 tC4sy+dQ2y4+Zy3CqE0dr/pgKcc5/+UFr424G3twWiW+OTXI10K0dYngGx3w5Rlg
 6RzWNHNFxT8Ms9gzRhQLw==
X-ME-Sender: <xms:mPECZmlxNndyoYvxX8n8aZ8p-SODnrkhPolr7FnGtnOaDXgFEmFSsA>
 <xme:mPECZt271I6AHIkNXTxfSLwq6bbyzElUmhfR_acKZVgknUhqzx8HjaNoVUFTfyUrM
 Os5coHg9CEiyXGBIxU>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvledruddufedgkeefucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepofgfggfkjghffffhvfevufgtgfesthhqredtreerjeenucfhrhhomhepfdet
 rhhnugcuuegvrhhgmhgrnhhnfdcuoegrrhhnugesrghrnhgusgdruggvqeenucggtffrrg
 htthgvrhhnpeegfeejhedvledvffeijeeijeeivddvhfeliedvleevheejleetgedukedt
 gfejveenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 grrhhnugesrghrnhgusgdruggv
X-ME-Proxy: <xmx:mPECZkrjeL7nPoJNmijVdb-ahSvhcg_bE8hgRozi4GcjyMeD6uj5KQ>
 <xmx:mPECZqmuyK4ZJG0f6NfE0gTIEWVqFYcNmZ6yW5uATjejt6Zt_qvF-Q>
 <xmx:mPECZk34bYanMNteHxGz8LdvyuGNWD--R_2OSUu9BfTL_8dTOR_-gQ>
 <xmx:mPECZhuDyjdOTdo5KtUM54qOIaombyJlL0JbTmzdK79dXiL-pAqLCg>
 <xmx:mPECZl78g8uWX-GHxDXztR0_nDoF-pERrigkFb2Ez_-UbX0ZndJ7MQ>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id E4F75B6008D; Tue, 26 Mar 2024 12:02:31 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.11.0-alpha0-328-gc998c829b7-fm-20240325.002-gc998c829
MIME-Version: 1.0
Message-Id: <e1ec2f8c-c1e9-4459-a6d4-c14ca57404fe@app.fastmail.com>
In-Reply-To: <ddd9519fa51f95eb14a6dd3f2a4b7d67ae7e47a9.camel@nvidia.com>
References: <20240326144741.3094687-1-arnd@kernel.org>
 <20240326145140.3257163-5-arnd@kernel.org>
 <ddd9519fa51f95eb14a6dd3f2a4b7d67ae7e47a9.camel@nvidia.com>
Date: Tue, 26 Mar 2024 17:02:11 +0100
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Timur Tabi" <ttabi@nvidia.com>, "Masahiro Yamada" <masahiroy@kernel.org>, 
 "kherbst@redhat.com" <kherbst@redhat.com>,
 "linux-kbuild@vger.kernel.org" <linux-kbuild@vger.kernel.org>,
 "Arnd Bergmann" <arnd@kernel.org>, "Lyude Paul" <lyude@redhat.com>,
 "bskeggs@redhat.com" <bskeggs@redhat.com>, "Dave Airlie" <airlied@gmail.com>, 
 "Danilo Krummrich" <dakr@redhat.com>,
 "Nathan Chancellor" <nathan@kernel.org>, "Daniel Vetter" <daniel@ffwll.ch>
Cc: "Justin Stitt" <justinstitt@google.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "Bill Wendling" <morbo@google.com>,
 "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>,
 "Nicolas Schier" <nicolas@fjasle.eu>,
 "Nick Desaulniers" <ndesaulniers@google.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "llvm@lists.linux.dev" <llvm@lists.linux.dev>
Subject: Re: [PATCH 06/12] nouveau: fix function cast warning
Content-Type: text/plain;charset=utf-8
Content-Transfer-Encoding: quoted-printable
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

On Tue, Mar 26, 2024, at 16:20, Timur Tabi wrote:
> On Tue, 2024-03-26 at 15:51 +0100, Arnd Bergmann wrote:
>> Calling a function through an incompatible pointer type causes breaks
>> kcfi, so clang warns about the assignment:
>>=20
>
> ...
>
>> +static void of_fini(void *p)
>> +{
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0return kfree(p);
>> +}
>> +
>
> I don't know anything about kfci, but shouldn't this just be "kfree(p)=
",
> without the "return"?

You are right, fixed this up locally now, waiting for more
comments before I resend patches from my series.

I think it works because of a gcc extension, but isn't
valid C otherwise, and I did not mean to rely on this.

     Arnd
