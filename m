Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 278EE41FD6F
	for <lists+dri-devel@lfdr.de>; Sat,  2 Oct 2021 19:28:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6475F6F504;
	Sat,  2 Oct 2021 17:28:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new3-smtp.messagingengine.com (new3-smtp.messagingengine.com
 [66.111.4.229])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CB0D56F501;
 Sat,  2 Oct 2021 17:28:10 +0000 (UTC)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
 by mailnew.nyi.internal (Postfix) with ESMTP id 647E45804E9;
 Sat,  2 Oct 2021 13:28:08 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute6.internal (MEProxy); Sat, 02 Oct 2021 13:28:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=u92.eu; h=date
 :from:to:cc:subject:message-id:references:mime-version
 :content-type:content-transfer-encoding:in-reply-to; s=fm3; bh=N
 dG2AiDGU0yyjfZEfSHSA1eX2my+Y7Dhy95tEwsxOEE=; b=EHf38XIxyX3AijX2q
 ngopIdoNyr1T5LjiY1RSy1XuPrV8q1XjL/4tLTYscB1g0B6chFWCuxlMe9QImHiV
 kUpLrMS9xdGbUshDw+eXNLhDLdgo8zVWBjqftwU0nnAVlbE+KFdfEpgLiDq38IZ4
 AXamJNqMxQXQUKYBEugY/tcVm7z5aaZeWfLZgKrJsiQgRlW4aMI9ca3HhZF090fF
 TY/u7r/lXgDW9S5blz3NC7PUxKj/TR7c8R646Q4AK7Nu9uCUNIXZXuEROSZtl92o
 GYGRgcLS1zLTnpzVv/HMzNgUtzsoU8rYdAmiUHJVjxtvP/c6HfwAnyamZYrldcuB
 93tzw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:content-type
 :date:from:in-reply-to:message-id:mime-version:references
 :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm1; bh=NdG2AiDGU0yyjfZEfSHSA1eX2my+Y7Dhy95tEwsxO
 EE=; b=RrpcoIklxRRr1rba6cZd76mHODb8D+vtPu79QI+bAxxAMeXKLCDgaupqC
 JBUzgot1VDDL+3oxEW+xFShKnLUv8F/9i97SMqx++QNxoq3x/LVndAw7I3HX3kdJ
 /pJ7/W1ykkpDt+vPELlhrLDli4MI+GxLfSzApQw9pc2geW6yCJYw2aH9HHHcrcva
 uSwZzMvBtjl2+H0v6OiyBRIYP9LmVlltLFMa267Jd579CWYYxFkJfi1BpSL9PqFK
 aQfe+VLf7jqJ3oShgh3viO7+9jjJLuPfbRhF0qyGiIjt8ilL+WrvObsImLgTXnTr
 M+oDUovLY3IvonoBXHDIz77IcXOLQ==
X-ME-Sender: <xms:p5ZYYc6C5hKN4W1y5JtKH-pQV-GWgNVKCNp0gst7MYkbAFgbXncIXw>
 <xme:p5ZYYd7hiKdkyl5vWoA78zGA5phD8s6tDgUtMlZBjWCMf5CXr0BN4kv6re3BEBXS4
 dWP_07Ww8KH8SCIOw>
X-ME-Received: <xmr:p5ZYYbf3PQTUIfpmiTMquywnIKLHp0OtfyBwiq7Vy2Og_pzRfgRNyWCRptIe86pa3FFNjg6T>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrudekkedgudduvdcutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enucfjughrpeffhffvuffkfhggtggugfgjsehtkeertddttdejnecuhfhrohhmpefhvghr
 nhgrnhguohcutfgrmhhoshcuoehgrhgvvghnfhhoohesuhelvddrvghuqeenucggtffrrg
 htthgvrhhnpeeghfffgedufeeuheevtddukedtteeikefgiefhudfhfeffjeetvedtgfff
 keejudenucffohhmrghinhepfhhrvggvuggvshhkthhophdrohhrghdpmhhuthgvgidrsh
 honecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepghhr
 vggvnhhfohhosehuledvrdgvuh
X-ME-Proxy: <xmx:qJZYYRJPiM7v-h_OyID40YuW8z7zHCbCpFD7_x7o2gIg1-LmMH0EzQ>
 <xmx:qJZYYQKb7yPr7CSSefp3QHug76AGInQ4EfuSKY6xBTXXI7qCH73gFw>
 <xmx:qJZYYSxoB7UTJoL9NFfxQdHs61p9oapG08SeOKgWK_YlS0lJB_xsxQ>
 <xmx:qJZYYdDxWowz3_IF0LiVoWYot8015Y8My-CogxeqM1cnMlDwleOVxA>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sat,
 2 Oct 2021 13:28:04 -0400 (EDT)
Date: Sat, 2 Oct 2021 19:28:02 +0200
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
Message-ID: <YViWomXZWdy/81uT@zacax395.localdomain>
References: <20210924064324.229457-1-greenfoo@u92.eu>
 <20211001183655.GW2515@art_vandelay> <YVda4jNSGuQf50JV@intel.com>
 <20211001204815.GA2515@art_vandelay> <YVeGOyLzuhN7zzV7@intel.com>
 <YVfEWaLfYWdhezCa@intel.com>
 <YVgGklsHT5fkavDL@zacax395.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <YVgGklsHT5fkavDL@zacax395.localdomain>
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

On 21/10/02 09:13AM, Fernando Ramos wrote:
> On 21/10/02 05:30AM, Ville Syrjälä wrote:
> > On Sat, Oct 02, 2021 at 01:05:47AM +0300, Ville Syrjälä wrote:
> > > On Fri, Oct 01, 2021 at 04:48:15PM -0400, Sean Paul wrote:
> > > > On Fri, Oct 01, 2021 at 10:00:50PM +0300, Ville Syrjälä wrote:
> > > > > On Fri, Oct 01, 2021 at 02:36:55PM -0400, Sean Paul wrote:
> > > > > > 
> > > > > > Thank you for revising, Fernando! I've pushed the set to drm-misc-next (along
> > > > > > with the necessary drm-tip conflict resolutions).
> > > > > 
> > > > > Ugh. Did anyone actually review the locking changes this does?
> > > > > I shot the previous i915 stuff down because the commit messages
> > > > > did not address any of it.
> > > > 
> > > > I reviewed the set on 9/17, I didn't see your feedback on that thread.
> > > 
> > > It was much earlir than that.
> > > https://lists.freedesktop.org/archives/dri-devel/2021-June/313193.html

Sorry, I'm new to this and it did not occur to me to search for similar patches
in the mailing list archives in case there were additional comments that applied
to my change set.

In case I had done that I would have found that, as you mentioned, you had
already raised two issues back in June:

    On Tue, Jun 29, 2021, Ville Syrjälä wrote:
    >
    > That looks wrong. You're using a private ctx here, but still
    > passing dev->mode_config.acquire_ctx to the lower level stuff.
    > 
    > Also DRM_MODESET_LOCK_ALL_{BEGIN,END}() do not seem to be
    > equivalent to drm_modeset_{lock,unlock}_all() when it comes to 
    > mode_config.mutex. So would need a proper review whether we
    > actually need that lock or not.

The first one was pointing out the same error I would later repeat in my patch
series (ups).

After further inspection of the code it looks to me that changing this:

    intel_modeset_setup_hw_state(dev, dev->mode_config.acquire_ctx);

...into this:

    intel_modeset_setup_hw_state(dev, &ctx);

...would be enough.

Why? The only difference between the old drm_modeset_{lock,unlock}_all()
functions and the new DRM_MODESET_LOCK_ALL_{BEGIN,END}() macros is that the
former use a global context stored in dev->mode_config.acquire_ctx while the
latter depend on a user provided one (typically in the stack).

In the old (working) code the global context structure is freed in
drm_modeset_unlock_all() thus we are sure no one is holding a reference to it at
that point. This means that as long as no one accesses the global
dev->mode_config.acquire_ctx context in the block that runs between lock/BEGIN
and unlock/END, the code should be equivalent before and after my changes.

In fact, now that my patch series removes the drm_modeset_{lock,unlock}_all()
functions, the acquire_ctx field of the drm_mode_config structure should be
deleted:

    /**
     * @acquire_ctx:
     *
     * Global implicit acquire context used by atomic drivers for legacy
     * IOCTLs. Deprecated, since implicit locking contexts make it
     * impossible to use driver-private &struct drm_modeset_lock. Users of
     * this must hold @mutex.
     */
    struct drm_modeset_acquire_ctx *acquire_ctx;

If I had done that (ie. removing this field) I would have detected the problem
when compiling.

There is another place (in the amdgpu driver) where this field is still being
referenced, but before I investigate that I would like to know if you agree that
this is a good path to follow.

Regarding the second issue you raised...

    > Also DRM_MODESET_LOCK_ALL_{BEGIN,END}() do not seem to be
    > equivalent to drm_modeset_{lock,unlock}_all() when it comes to 
    > mode_config.mutex. So would need a proper review whether we
    > actually need that lock or not.

...the only difference regarding mode_config.mutex I see is that in the new
macros the mutex is locked only under this condition:

    if (!drm_drv_uses_atomic_modeset(dev))

...which seems reasonable, right? Is this what you were referring to or is it
something else?

Please let me know what you think.

Thanks!



