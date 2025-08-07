Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 34D6DB1DA90
	for <lists+dri-devel@lfdr.de>; Thu,  7 Aug 2025 17:09:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5850F10E879;
	Thu,  7 Aug 2025 15:08:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=arndb.de header.i=@arndb.de header.b="AcHYZ2Ai";
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.b="ZGJFbCj7";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from flow-b4-smtp.messagingengine.com
 (flow-b4-smtp.messagingengine.com [202.12.124.139])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F13C210E878
 for <dri-devel@lists.freedesktop.org>; Thu,  7 Aug 2025 15:08:55 +0000 (UTC)
Received: from phl-compute-05.internal (phl-compute-05.internal [10.202.2.45])
 by mailflow.stl.internal (Postfix) with ESMTP id 419E7130012C;
 Thu,  7 Aug 2025 11:08:54 -0400 (EDT)
Received: from phl-imap-02 ([10.202.2.81])
 by phl-compute-05.internal (MEProxy); Thu, 07 Aug 2025 11:08:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
 :cc:content-transfer-encoding:content-type:content-type:date
 :date:from:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:reply-to:subject:subject:to:to; s=fm2; t=1754579334;
 x=1754586534; bh=ETDvl7tWBdMBZS3hOrCBLHn2gtJQObg0cR5a3IFLvN8=; b=
 AcHYZ2AimpXOypR+CMXz74Cb5D24y7NeF43aDen3XqMAkfYBUD4Vkz9HaE3t+ytR
 wab5R1W+sBps+ARXpLVBeS7jyoqObFwzHPm1nIWZXtOMj1EgKnUEtaAYbyr+jmhr
 zBCM28Vn2COi2NPxNyJFi3hdTGT7cl10aJ+aIObAb4UjS1uI6NI9J3F3TcAYAbDT
 d6Tfq+JXZpCXEtcU/7d/X7QjcsLQiuHFOnVQLp3n6CWHlUEIwV/AhSED5Q80kJWk
 yQyBBi7DUFemSc8BPrGDSz5APlrMs6RBn5ch7yyca3DeMV1A9wGkZtsBsRRtX9lJ
 B77r7IlM8y0mVtxRE8Ah7A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:content-type:date:date:feedback-id:feedback-id
 :from:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:reply-to:subject:subject:to:to:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1754579334; x=
 1754586534; bh=ETDvl7tWBdMBZS3hOrCBLHn2gtJQObg0cR5a3IFLvN8=; b=Z
 GJFbCj7XGa06pNKD10MoPduaUgi3R/dwvhtvip4Fnwqy/5se3B3hR0/S/jA8z6ob
 lU+EWsQi3HkhA0mtRb6CdwFN1A7bU4dEjEjKwD9hqD7pyd/0daEYYzDtYiLEjebW
 nLiKI7aI1WZfCVRt7V9yOAc05E9YXTnvoSlEyvG9f4rN8XYkX6k5vW5waLbfmU+R
 sO0ftGuR2Rmdu595o4N5uSBUjc3HyCh2iWk9Sn+plOR9UyWsSSrpTOljMBiNJznr
 7zH3XRI6g7+w1usbXcNdeK5+otUCkNRtN9mju3M0iBsNGuWZwJj1Gm86nIwvRpdN
 wnJhNS6vFgjTUAzkRFVew==
X-ME-Sender: <xms:hcGUaNQB-_yfhZyudCUCxDyF7kNJcw9QVFPRsG2yhXheXIzek1Qx2Q>
 <xme:hcGUaGxb6glOGrkBWTz4o7VoVUWXLCM81yQ4UXTOxKpd0i1J_doKrvRHf8kv-8niJ
 nhltPMwpIPr2v2r4uc>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgdduvdduvdehucetufdoteggodetrf
 dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
 rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
 gurhepofggfffhvfevkfgjfhfutgfgsehtjeertdertddtnecuhfhrohhmpedftehrnhgu
 uceuvghrghhmrghnnhdfuceorghrnhgusegrrhhnuggsrdguvgeqnecuggftrfgrthhtvg
 hrnhephfdthfdvtdefhedukeetgefggffhjeeggeetfefggfevudegudevledvkefhvdei
 necuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomheprghrnh
 gusegrrhhnuggsrdguvgdpnhgspghrtghpthhtohepvdefpdhmohguvgepshhmthhpohhu
 thdprhgtphhtthhopehsihhmohhnrgesfhhffihllhdrtghhpdhrtghpthhtoheprghirh
 hlihgvugesghhmrghilhdrtghomhdprhgtphhtthhopegrnhhtohhmrghnihdutdefsehg
 mhgrihhlrdgtohhmpdhrtghpthhtohepnhhitghkrdguvghsrghulhhnihgvrhhsodhlkh
 hmlhesghhmrghilhdrtghomhdprhgtphhtthhopehjuhhsthhinhhsthhithhtsehgohho
 ghhlvgdrtghomhdprhgtphhtthhopehmohhrsghosehgohhoghhlvgdrtghomhdprhgtph
 htthhopegrrhhnugeskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhumhgrgheskhgv
 rhhnvghlrdhorhhgpdhrtghpthhtohepnhgrthhhrghnsehkvghrnhgvlhdrohhrgh
X-ME-Proxy: <xmx:hcGUaN81N-1JIrR-P6_tJ8-TTlYLB7E29acrP-Zf6E_LSW1hV9gq2w>
 <xmx:hcGUaEeWxs6NgN6PyglirqkqvhNrLA7m4uMKYsKQaMWGXorTOMKk6g>
 <xmx:hcGUaH5hYiTCabNaAVO6RIBDDjbnrQeXBPekvkePxVrSol5dwDvhJQ>
 <xmx:hcGUaI9noQJCO6uDDu3zVQ5tWa9qmePtZPhQd_FEKlR8yVsu6BfRtw>
 <xmx:hsGUaERVOFIkKDFFc39kCkP1jZSms9Xz2e4ri8G44fvuGI8682QUGw3N>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
 id 43083700065; Thu,  7 Aug 2025 11:08:53 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
MIME-Version: 1.0
X-ThreadId: T654cc969b17eaba3
Date: Thu, 07 Aug 2025 17:08:31 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Dmitry Baryshkov" <dmitry.baryshkov@oss.qualcomm.com>,
 "Arnd Bergmann" <arnd@kernel.org>
Cc: "Rob Clark" <robin.clark@oss.qualcomm.com>,
 "Dmitry Baryshkov" <lumag@kernel.org>, "Dave Airlie" <airlied@gmail.com>,
 "Simona Vetter" <simona@ffwll.ch>, "Nathan Chancellor" <nathan@kernel.org>,
 "Abhinav Kumar" <quic_abhinavk@quicinc.com>,
 "Abhinav Kumar" <abhinav.kumar@linux.dev>,
 "Jessica Zhang" <jessica.zhang@oss.qualcomm.com>,
 "Sean Paul" <sean@poorly.run>,
 "Marijn Suijten" <marijn.suijten@somainline.org>,
 "Nick Desaulniers" <nick.desaulniers+lkml@gmail.com>,
 "Bill Wendling" <morbo@google.com>, "Justin Stitt" <justinstitt@google.com>,
 "Antonino Maniscalco" <antomani103@gmail.com>,
 "Konrad Dybcio" <konrad.dybcio@oss.qualcomm.com>,
 "Jun Nie" <jun.nie@linaro.org>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, llvm@lists.linux.dev
Message-Id: <76680ece-f88c-4960-a263-b96f64c35bbf@app.fastmail.com>
In-Reply-To: <ouan6tfmoefwuvs7wmhpzjdwmxfhqh3ad26j5tmwdugnq7ieda@ddw6dfqtq27g>
References: <20250807072016.4109051-1-arnd@kernel.org>
 <ouan6tfmoefwuvs7wmhpzjdwmxfhqh3ad26j5tmwdugnq7ieda@ddw6dfqtq27g>
Subject: Re: [PATCH] drm/msm/dpu: avoid uninitialized variable use
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

On Thu, Aug 7, 2025, at 10:09, Dmitry Baryshkov wrote:
> On Thu, Aug 07, 2025 at 09:19:48AM +0200, Arnd Bergmann wrote:
>>
>> The bug is real, but the suggestion from clang to set it to NULL is
>> unfortunately just as harmful as dereferencing a NULL pointer is little
>> better than uninitialized data.
>
>
> Having no plane->crtc is a valid setting and it is handled inside
> drm_atomic_helper_check_plane_state() by setting plane_state->visible =
> false and returning early. Setting crtc_state to NULL is a correct fix.
> Could you please send it?

Ah, I see. I saw the crtc_state dereference in

  WARN_ON(plane_state->crtc && plane_state->crtc != crtc_state->crtc);

but that is indeed guarded by the plane_state->crtc check.

Nathan's patch is sufficient then.

    Arnd
