Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A12FC638973
	for <lists+dri-devel@lfdr.de>; Fri, 25 Nov 2022 13:12:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2683B10E747;
	Fri, 25 Nov 2022 12:12:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D112110E747;
 Fri, 25 Nov 2022 12:12:08 +0000 (UTC)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.nyi.internal (Postfix) with ESMTP id 937175C00A0;
 Fri, 25 Nov 2022 07:12:05 -0500 (EST)
Received: from imap51 ([10.202.2.101])
 by compute3.internal (MEProxy); Fri, 25 Nov 2022 07:12:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
 :cc:content-type:date:date:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to; s=fm3; t=1669378325; x=1669464725; bh=16pI4cvoR6
 Cm8Z1b252QgFiejtIcKliu1zHdyEzNiUk=; b=dOp9WAx9t90OFDJfgKC86m1C9I
 AL78p2tpYjvbuJbOBosBZMP6sBYREUeJw2PUykGpOa4glhQ8aKt4cw1vHWHUJXzK
 MpYj1KycdGZvMXSnplO4CweY6vVikgF/RQwnU5l1FaY7nOzAk6ckKuoFRCdxpZRf
 +653sK3GiMfCORxnfU+ckIgNoOL2xZxFp4k7P2AR69gjO21huI2zBN9Q620wVjCf
 JUghQQ8jPlKe3iBDWZY4dN8eF1To4C0VSY49VDu395yV2j4ddGQTjcW/YUjPBo7t
 O1Fb65NAKwD1bSqCEQKBx+HsLlPNO3WzKxH3qTXyqczqKfEwTrdCzlRFkPHg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
 :feedback-id:from:from:in-reply-to:in-reply-to:message-id
 :mime-version:references:reply-to:sender:subject:subject:to:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm1; t=1669378325; x=1669464725; bh=16pI4cvoR6Cm8Z1b252QgFiejtIc
 Kliu1zHdyEzNiUk=; b=EWf8cOtW3sUb0+ScPFQBR3cwK7rQrBE2mmYIiMeRiAsb
 PtAh7y2Tv5nXVlxGWA92WTU4UiqRKEu9z+n1IKWL3nNczhDvOfXD0BYgLOQD2aB7
 hmi/McGZ4vom9quGXL4KjWXoKxlHYYF6NrAiGmv9oG1eYrjNvCAm6Kzr8rpb9P0H
 iqjoh02e8gM3o9r+uzgUZv+p+njJi5W0dFliwy51nnqUB0i8+jDZ/BxMuY5YmRcT
 8xSVpwFhhRNtwe8UXzFteYrL3aGMhucGTnqjJJl870oyofeAgN0lVMzE1TOJgUTu
 +frCIlpKKByf+e4W7Me5Qm5FfFuCNhNHGqsuSI9E/w==
X-ME-Sender: <xms:FLGAY_vhTbvGiEgPNu9wjdy4ayaqvoA76z5DetlxIN4oaM9vJM3zpQ>
 <xme:FLGAYwfWiv4gWgTAn2V0uJHcplsVrlYQ5MYLJRAr7n9U6dAtigqBcLB6SpYBTQBXH
 PTB-ZGLSDd4Ed1O9hI>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvgedrieehgdefkecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefofgggkfgjfhffhffvvefutgesthdtredtreertdenucfhrhhomhepfdetrhhn
 ugcuuegvrhhgmhgrnhhnfdcuoegrrhhnugesrghrnhgusgdruggvqeenucggtffrrghtth
 gvrhhnpeejvddvvdduleduheejiedtheehiedvjefgleelffeigfevhffhueduhfegfeef
 heenucffohhmrghinhepghhithhhuhgsrdgtohhmnecuvehluhhsthgvrhfuihiivgeptd
 enucfrrghrrghmpehmrghilhhfrhhomheprghrnhgusegrrhhnuggsrdguvg
X-ME-Proxy: <xmx:FLGAYyzDO3Va5xeSrAjC1KNdruRp0ASvEk-tTF6XsTEBhGfJ1QZkKw>
 <xmx:FLGAY-MNP_U09Xh62Fns-TBdrY9tMRl92JtNcXHWK4rLDMWe-BxiBQ>
 <xmx:FLGAY_-f2vWD8L3c3ExdUpbLwwygcAi8mzR1j8KCNey-ML2fQC2FYQ>
 <xmx:FbGAYy022faaAw7g1pBLbqq4l1HcWG24gIuU50nLw40GJONYIoP7jQ>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id C62B6B60086; Fri, 25 Nov 2022 07:12:04 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.7.0-alpha0-1115-g8b801eadce-fm-20221102.001-g8b801ead
Mime-Version: 1.0
Message-Id: <9ff2ed97-dd26-4af9-a943-d2c5b917a4e4@app.fastmail.com>
In-Reply-To: <20221125120750.3537134-2-lee@kernel.org>
References: <20221125120750.3537134-1-lee@kernel.org>
 <20221125120750.3537134-2-lee@kernel.org>
Date: Fri, 25 Nov 2022 13:11:43 +0100
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Lee Jones" <lee@kernel.org>, "Andrew Morton" <akpm@linux-foundation.org>, 
 "Nathan Chancellor" <nathan@kernel.org>,
 "Maarten Lankhorst" <maarten.lankhorst@linux.intel.com>, mripard@kernel.org,
 "Thomas Zimmermann" <tzimmermann@suse.de>, "Dave Airlie" <airlied@gmail.com>, 
 "Daniel Vetter" <daniel@ffwll.ch>,
 "Nick Desaulniers" <ndesaulniers@google.com>, "Tom Rix" <trix@redhat.com>,
 "Harry Wentland" <harry.wentland@amd.com>, "Leo Li" <sunpeng.li@amd.com>,
 "Rodrigo Siqueira" <Rodrigo.Siqueira@amd.com>,
 "Alex Deucher" <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Xinhui.Pan@amd.com
Subject: Re: [PATCH v2 1/2] drm/amdgpu: Temporarily disable broken Clang
 builds due to blown stack-frame
Content-Type: text/plain
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
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 llvm@lists.linux.dev, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Nov 25, 2022, at 13:07, Lee Jones wrote:
> calculate_bandwidth() is presently broken on all !(X86_64 || SPARC64 || ARM64)
> architectures built with Clang (all released versions), whereby the stack
> frame gets blown up to well over 5k.  This would cause an immediate kernel
> panic on most architectures.  We'll revert this when the following bug report
> has been resolved: https://github.com/llvm/llvm-project/issues/41896.
>
> Suggested-by: Arnd Bergmann <arnd@arndb.de>
> Signed-off-by: Lee Jones <lee@kernel.org>

Acked-by: Arnd Bergmann <arnd@arndb.de>
