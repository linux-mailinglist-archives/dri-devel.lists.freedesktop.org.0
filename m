Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 80A7E41FA38
	for <lists+dri-devel@lfdr.de>; Sat,  2 Oct 2021 09:13:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7646E6F4A5;
	Sat,  2 Oct 2021 07:13:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new2-smtp.messagingengine.com (new2-smtp.messagingengine.com
 [66.111.4.224])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 37E566F4A2;
 Sat,  2 Oct 2021 07:13:34 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailnew.nyi.internal (Postfix) with ESMTP id EFE27581013;
 Sat,  2 Oct 2021 03:13:30 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Sat, 02 Oct 2021 03:13:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=u92.eu; h=date
 :from:to:cc:subject:message-id:references:mime-version
 :content-type:content-transfer-encoding:in-reply-to; s=fm3; bh=h
 kdwWmElPEdAAxaQYiaUG9iDPW9L8k80trrD6uyRPLo=; b=b+qy2lC7OANZhdcFY
 lTuHru7sN/+DtcqTrF4SpXic1GmtM7cUT2qmnPzpzBoOwlJLK+z7eh8TFrUFqSQD
 TQ8jkhtPZqfnj2vBf+fDgE4RoYWo8WlREzgRC0Kgkb5u5KRBrrNW9I+jLw68qq5K
 nR1QEz/T3vXeMOnlNj/Kte72tUeYYrYxUq90NqOZhz8H/aQau8o3YqPwNJNR9p51
 IjEDlpgp6u3tl97X5eFyj1ScaFTQnCPDxidv6nerNdEjj30tannDQtOgGzaF9LP9
 ywzRJBQ3oe9A57JmpNxlJeehLxTyoJAGbhhjUtwcTPnRaupVb4E9JI7Bx0avudQu
 wU7Zw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:content-type
 :date:from:in-reply-to:message-id:mime-version:references
 :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm1; bh=hkdwWmElPEdAAxaQYiaUG9iDPW9L8k80trrD6uyRP
 Lo=; b=D/XRLalTmeWLNXMgGrYTT36Ur+ARcjhRea20l1zZycriBriaimr4jYDvH
 Y/163WSY2WWorF7d3pv3hpERLm6NZDJlTk//5jLEVXcIMWmMoPJNQxbhgBi1BWBn
 Cya7cwjtn+FBF1NZP0fA4N1ZLelGM6CeBzY0yS2wBDAcnYs2k7uqp2sBcpzNWjb6
 i2zLNiZLVqztUinKNFfAh4HmJdPap30w+S9jG7OBxVgGj0AGGzwot5oYlTBmBwa3
 wt4cnG/tw8mgyWw7yKANX9GzEEYCNUrYCiZAngxSNFSdx9IvgQwTnhE894+IssxT
 TFpzih5gWDYejAq9jm76uBihYwVjQ==
X-ME-Sender: <xms:mQZYYR7VpWIekz5jKw9rfJZPtY7gObW-Ps2HK3WAeJ6thHYPvyedzQ>
 <xme:mQZYYe7NssF99qddped0Oz3y0xvsSlXqyEN9IInl1E0lXOHMmNnU3P09OPy6-VZVV
 Kq6QxkN1Uw7cqd15Q>
X-ME-Received: <xmr:mQZYYYfa7VDv6N19FC4M0Vettj4NdhNIg1PrJFkZXVaEfhz91yBv0dzwZCvP5KfF1YQRSpIl>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrudekjedgudduhecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enucfjughrpeffhffvuffkfhggtggugfgjsehtkeertddttdejnecuhfhrohhmpefhvghr
 nhgrnhguohcutfgrmhhoshcuoehgrhgvvghnfhhoohesuhelvddrvghuqeenucggtffrrg
 htthgvrhhnpeffleelfeejkefgfffhvdffjedvteelhefgvdfftdehfefghfdtgeevgfek
 keeuleenucffohhmrghinhepfhhrvggvuggvshhkthhophdrohhrghdptddurdhorhhgne
 cuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepghhrvggv
 nhhfohhosehuledvrdgvuh
X-ME-Proxy: <xmx:mgZYYaLB8vJT6HmaAyecptRqqdECxDA3-U7v-ucSTdOqaK0yFO0hbA>
 <xmx:mgZYYVLC78TXBxqTVCuTBFhpEgbixvlFTNJh-8rLG1dppSYC7Y77OQ>
 <xmx:mgZYYTwFKgNks0BLJyv6wDGWqMfiEngurGR3Api93phNOr_Ls8Qtcg>
 <xmx:mgZYYSCN8z0NaX2WnaxUXdRraVDUxKHnoPfZ_ydCt_0QpVQB9btRYQ>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sat,
 2 Oct 2021 03:13:26 -0400 (EDT)
Date: Sat, 2 Oct 2021 09:13:22 +0200
From: Fernando Ramos <greenfoo@u92.eu>
To: Ville =?utf-8?B?U3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
Cc: Sean Paul <sean@poorly.run>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 nouveau@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
 linux-tegra@vger.kernel.org
Subject: Re: [Intel-gfx] [PATCH v2 00/17] drm: cleanup: Use
 DRM_MODESET_LOCK_ALL_* helpers where possible
Message-ID: <YVgGklsHT5fkavDL@zacax395.localdomain>
References: <20210924064324.229457-1-greenfoo@u92.eu>
 <20211001183655.GW2515@art_vandelay> <YVda4jNSGuQf50JV@intel.com>
 <20211001204815.GA2515@art_vandelay> <YVeGOyLzuhN7zzV7@intel.com>
 <YVfEWaLfYWdhezCa@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <YVfEWaLfYWdhezCa@intel.com>
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

On 21/10/02 05:30AM, Ville Syrjälä wrote:
> On Sat, Oct 02, 2021 at 01:05:47AM +0300, Ville Syrjälä wrote:
> > On Fri, Oct 01, 2021 at 04:48:15PM -0400, Sean Paul wrote:
> > > On Fri, Oct 01, 2021 at 10:00:50PM +0300, Ville Syrjälä wrote:
> > > > On Fri, Oct 01, 2021 at 02:36:55PM -0400, Sean Paul wrote:
> > > > > 
> > > > > Thank you for revising, Fernando! I've pushed the set to drm-misc-next (along
> > > > > with the necessary drm-tip conflict resolutions).
> > > > 
> > > > Ugh. Did anyone actually review the locking changes this does?
> > > > I shot the previous i915 stuff down because the commit messages
> > > > did not address any of it.
> > > 
> > > I reviewed the set on 9/17, I didn't see your feedback on that thread.
> > 
> > It was much earlir than that.
> > https://lists.freedesktop.org/archives/dri-devel/2021-June/313193.html
> > 
> > And I think I might have also shot down a similar thing earlier.
> > 
> > I was actually half considering sending a patch to nuke that
> > misleading TODO item. I don't think anything which changes
> > which locks are taken should be considred a starter level task.
> > And the commit messages here don't seem to address any of it.
> 
> And i915 is now broken :(
> 
> https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10680/fi-bwr-2160/boot.html

I completely overlooked the side effects of not having a global context anymore.
Sorry for all the trouble.

Sean, could you revert the whole patch series? I'll have a deeper look into the
patch set and come up with a v3 where all these issues will be addressed.

Thanks and sorry once again for the extra overhead this might have caused.


