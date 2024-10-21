Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 864189A60F7
	for <lists+dri-devel@lfdr.de>; Mon, 21 Oct 2024 12:01:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0BBC610E471;
	Mon, 21 Oct 2024 10:01:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=arndb.de header.i=@arndb.de header.b="fW8qPxjG";
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.b="jABelndI";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fhigh-a6-smtp.messagingengine.com
 (fhigh-a6-smtp.messagingengine.com [103.168.172.157])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D5E3410E471
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Oct 2024 10:01:49 +0000 (UTC)
Received: from phl-compute-10.internal (phl-compute-10.phl.internal
 [10.202.2.50])
 by mailfhigh.phl.internal (Postfix) with ESMTP id 16752114014E;
 Mon, 21 Oct 2024 06:01:49 -0400 (EDT)
Received: from phl-imap-11 ([10.202.2.101])
 by phl-compute-10.internal (MEProxy); Mon, 21 Oct 2024 06:01:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
 :cc:content-transfer-encoding:content-type:content-type:date
 :date:from:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:reply-to:subject:subject:to:to; s=fm2; t=1729504909;
 x=1729591309; bh=PsU+reKmiMH+6dEqfODUv58RE75ILNro4ASwJ7hVYxU=; b=
 fW8qPxjG7VpETcQZqSN8x7slQpdpGZSXj/1i0G+iYnzS65RSdZDu6nZKZPCwUA5D
 ojXmy4onqcjAyxlTVJWvzsQlwrpSU2ec1WElDzalvD5hSrKR/FqaxWfmoa+FjFIn
 8qHR8WUVFURK9guGsh+p/m8xI/jJhtpx4CndtTxPGbI1JP/93O+zMEWLiVuuKMXq
 KT4PnTiqc/FHg3PTyXM4rNfgPAnyISRYqGIZkaHr12QwQFAM143HuiRU/sS7U1Pv
 m/3/ucIdtZ930Tt8EplH01vxQIITKJQ4VQMsxSetNWPkzXl3dS2TwpsF2q2VZdPI
 B1YWt/SPaAIF/LJoP+jidg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:content-type:date:date:feedback-id:feedback-id
 :from:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1729504909; x=
 1729591309; bh=PsU+reKmiMH+6dEqfODUv58RE75ILNro4ASwJ7hVYxU=; b=j
 ABelndIinU4Ip3zsU2JLWu9OK82+lIcLkoK5GjsL5/jsw1zKkhfVn87BBhhcQ0sY
 YcSo0fbRVJ+zy0dv7SdcLIZ06MvtdZyaLXBXLPdCL5vLh8GCmnxwstvBHB/hZ076
 veSSNj5kIpJdAMv5lAQLfcieGl8N8xmZ6f3drRv5X+ij2fjGyRovySrqe/gWazf2
 tdAyMRPLsmAXMgOMBIhkoMj/cLZIww0lTO4sr8yLe/LQW6wJoDzQ51W+yC//+/5V
 +DASU2O1z+aCWeUy7pcg8CV1qDymURDlSP8IyaaFKL/j5Rk9s7wLbCiRp9Wyg6gE
 Ho/1rOjSmtDbZfNnGvSEw==
X-ME-Sender: <xms:jCYWZyUjmgpQ2rFm9PI5WmhydfRMwhu9juI9XhP6D2OsvcwxWs82Ow>
 <xme:jCYWZ-lQRsM5NJjNwLZ6fQUj_ZKsDF8ejCoV8ENmeVk7Eeo3xjeixatFiPkVVt-V6
 OQy4SUeKpBMchwfMrc>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeftddrvdehledgvdefucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggvpdfu
 rfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnh
 htshculddquddttddmnecujfgurhepofggfffhvfevkfgjfhfutgfgsehtjeertdertddt
 necuhfhrohhmpedftehrnhguuceuvghrghhmrghnnhdfuceorghrnhgusegrrhhnuggsrd
 guvgeqnecuggftrfgrthhtvghrnhephfdthfdvtdefhedukeetgefggffhjeeggeetfefg
 gfevudegudevledvkefhvdeinecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpe
 hmrghilhhfrhhomheprghrnhgusegrrhhnuggsrdguvgdpnhgspghrtghpthhtohepudel
 pdhmohguvgepshhmthhpohhuthdprhgtphhtthhopehsihhmohhnrgesfhhffihllhdrtg
 hhpdhrtghpthhtoheprghirhhlihgvugesghhmrghilhdrtghomhdprhgtphhtthhopehr
 ohgsuggtlhgrrhhksehgmhgrihhlrdgtohhmpdhrtghpthhtohepjhhushhtihhnshhtih
 htthesghhoohhglhgvrdgtohhmpdhrtghpthhtohepmhhorhgsohesghhoohhglhgvrdgt
 ohhmpdhrtghpthhtohepnhguvghsrghulhhnihgvrhhssehgohhoghhlvgdrtghomhdprh
 gtphhtthhopegrrhhnugeskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepkhhonhhrrggu
 higstghioheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepnhgrthhhrghnsehkvghrnh
 gvlhdrohhrgh
X-ME-Proxy: <xmx:jCYWZ2Yhzu2akfZrZXSayTsw8WmZoV4vH5mcPhNJLxFvmlBalUAOIg>
 <xmx:jCYWZ5VIsfWAmVcaWQKxstu8OQDdUJtPWNuBN-ZbW147Cqn0LKlIYA>
 <xmx:jCYWZ8mJUT9n2g6iT5Vrxtvhy6sC4Z0m9JF6HpeMyAeerDFjgYSkqw>
 <xmx:jCYWZ-fctAsd8clqYV3sdEV6qpUbmzALG6BHgPI5dZp61ACP49y5VQ>
 <xmx:jSYWZ7cl9AYBzFKgb6f7YxD93SOgWHmFu6zwK5_rHqop8fDSx6LV_fYq>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
 id 2A3942220072; Mon, 21 Oct 2024 06:01:48 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
MIME-Version: 1.0
Date: Mon, 21 Oct 2024 10:01:27 +0000
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Akhil P Oommen" <quic_akhilpo@quicinc.com>,
 "Dmitry Baryshkov" <dmitry.baryshkov@linaro.org>
Cc: "Arnd Bergmann" <arnd@kernel.org>, "Rob Clark" <robdclark@gmail.com>,
 "Abhinav Kumar" <quic_abhinavk@quicinc.com>,
 "Dave Airlie" <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>,
 "Nathan Chancellor" <nathan@kernel.org>, "Sean Paul" <sean@poorly.run>,
 "Konrad Dybcio" <konradybcio@kernel.org>,
 "Marijn Suijten" <marijn.suijten@somainline.org>,
 "Nick Desaulniers" <ndesaulniers@google.com>,
 "Bill Wendling" <morbo@google.com>, "Justin Stitt" <justinstitt@google.com>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 llvm@lists.linux.dev
Message-Id: <cb728358-ac32-4b37-a954-967f338385e2@app.fastmail.com>
In-Reply-To: <20241021092509.tm4w3ufdgcd7of37@hu-akhilpo-hyd.qualcomm.com>
References: <20241018151143.3543939-1-arnd@kernel.org>
 <20241019093146.kdp25pir5onjmg4g@hu-akhilpo-hyd.qualcomm.com>
 <k42wmgziqia6balqsrfualbg73giesjxxtyaldkxsrdxkro2li@6neybqsu27me>
 <20241021092509.tm4w3ufdgcd7of37@hu-akhilpo-hyd.qualcomm.com>
Subject: Re: [PATCH] drm: a6xx: avoid excessive stack usage
Content-Type: text/plain
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Oct 21, 2024, at 09:25, Akhil P Oommen wrote:
> On Sat, Oct 19, 2024 at 04:14:13PM +0300, Dmitry Baryshkov wrote:
>> On Sat, Oct 19, 2024 at 03:01:46PM +0530, Akhil P Oommen wrote:
>> > On Fri, Oct 18, 2024 at 03:11:38PM +0000, Arnd Bergmann wrote:
>> > > From: Arnd Bergmann <arnd@arndb.de>
>> > > 
>> > > Clang-19 and above sometimes end up with multiple copies of the large
>> > > a6xx_hfi_msg_bw_table structure on the stack. The problem is that
>> > > a6xx_hfi_send_bw_table() calls a number of device specific functions to
>> > > fill the structure, but these create another copy of the structure on
>> > > the stack which gets copied to the first.
>> > > 
>> > > If the functions get inlined, that busts the warning limit:
>> > > 
>> > > drivers/gpu/drm/msm/adreno/a6xx_hfi.c:631:12: error: stack frame size (1032) exceeds limit (1024) in 'a6xx_hfi_send_bw_table' [-Werror,-Wframe-larger-than]
>> > 
>> > Why does this warning says that the limit is 1024? 1024 bytes is too small, isn't it?
>> 
>> Kernel stacks are expected to be space limited, so 1024 is a logical
>> limit for a single function.
>
> Thanks for the clarification. I think it is better to move this table to
> struct a6xx_gmu which is required anyway when we implement dynamic generation
> of bw table. Also, we can skip initializing it in subsequent gpu wake ups.
>
> Arnd, do you think that would be sufficient? I can send that patch if you
> want help.

Yes, that should work. I actually tried first to turn the model
specific data into static const structures but that ended up 
not working because some of them have a couple of dynamically
computed values. I think that would have been even nicer.

      Arnd
