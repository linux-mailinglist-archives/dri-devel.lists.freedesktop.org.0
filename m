Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F908872A67
	for <lists+dri-devel@lfdr.de>; Tue,  5 Mar 2024 23:46:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0541510F2C4;
	Tue,  5 Mar 2024 22:46:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=fastmail.com header.i=@fastmail.com header.b="gJjBfYw3";
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.b="X3yleIdF";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 341 seconds by postgrey-1.36 at gabe;
 Tue, 05 Mar 2024 22:46:23 UTC
Received: from wout4-smtp.messagingengine.com (wout4-smtp.messagingengine.com
 [64.147.123.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E943D10E658;
 Tue,  5 Mar 2024 22:46:23 +0000 (UTC)
Received: from compute7.internal (compute7.nyi.internal [10.202.2.48])
 by mailout.west.internal (Postfix) with ESMTP id 4638432002E2;
 Tue,  5 Mar 2024 17:40:41 -0500 (EST)
Received: from imap49 ([10.202.2.99])
 by compute7.internal (MEProxy); Tue, 05 Mar 2024 17:40:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fastmail.com; h=
 cc:cc:content-type:content-type:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:subject
 :subject:to:to; s=fm1; t=1709678440; x=1709764840; bh=mrk1yfBN+M
 hQ9bhDzCSRR6zbaE9CfwyxHQuo+5BVehw=; b=gJjBfYw3gKLp4jOZq0D5YCKLXo
 eWHLhsqYSMDYW1lf9Z44vsqHXPdcX8O8MaFPvMHcsAFvVvX/QVKqoxlCrTLrfB2f
 do037+OIGrspD1ZxNLOH6W7lHXgYdML6ezf5OBgT//pr+AdVZ+wIcy87i5sNdkX/
 HKvBeCFHQU3xcD0KZqnIeyUzbuxC8O6HNwIxOEbKDUS4RYDDt+1TTrFVPVrSmXEr
 PgI/ayKDuik42ND3BH0ia6wx64u7hqHpIHw5t6SSnCVik62Fru4gqRTCyHoXkvek
 cctensJybM+/9tvOa9de+kgAmzM24t9eVH1vw8AOYloMehXKuLZNnr/vPoug==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:content-type:date:date
 :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:subject:subject:to
 :to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm1; t=1709678440; x=1709764840; bh=mrk1yfBN+MhQ9bhDzCSRR6zbaE9C
 fwyxHQuo+5BVehw=; b=X3yleIdF6EVVH5up25UFjwnvCSNFOebFve66hrx3UBrQ
 +kBrfJtOQvpeMPHBPQZIFk99/MP1VdqKqiC6is7xKG8kVoDPgdnpKnUztlXOP+UW
 CPpyNukxfsZRvLextYHUVW2Rbd5ZsJIaR2lR/dSSGhA9byW+qEJzYij9I7PbMlHc
 elTyAwEjyJHFajiXxYxcuTgYbqoAW7Kw9z8ukt0vsjkTqp/KTH2zrXjSpFu3MKND
 ojnTZcyLTkOLk1cQyVZkxKm6pGM8ec9GxteS/mTC6EN/fpyKxL5a+9fElaKYVQ8c
 18sTymU3AccQGtPKmzNTAy8y1iEO6RRVlt4DqWlBwg==
X-ME-Sender: <xms:aJ_nZegfCkgBQZRQjsV_wQN0gJEqrlfh-ge8niczyydpaA8fYONMoQ>
 <xme:aJ_nZfAh0KaxqLoyzVvST1ZwNA4p63_KBh00DjK4JSgF8jByPlqTvnTGC7dMdBsRK
 -I7O8T4GJPOl1gyek8>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvledriedtgddtudcutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefofgggkfgjfhffhffvvefutgesthdtredtreertdenucfhrhhomhepfdfkvhgr
 nhcuuehrihgrnhhofdcuoehisghrihgrnhhosehfrghsthhmrghilhdrtghomheqnecugg
 ftrfgrthhtvghrnhepfefhueelteeiheefteetffdvleduvddvuedvgedtieeufffhleff
 jeeivdetvdehnecuffhomhgrihhnpehfrhgvvgguvghskhhtohhprdhorhhgnecuvehluh
 hsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepihgsrhhirghnohes
 fhgrshhtmhgrihhlrdgtohhm
X-ME-Proxy: <xmx:aJ_nZWFrvGXFeZcgiZ41sL51mqAVV3oxeu5d9KJjdlxkSU52NT1neA>
 <xmx:aJ_nZXRKAvoxspfgZaKlHWKpHsErrylcgpoJ5KAj63E_lGHB76sMTg>
 <xmx:aJ_nZbyvEfmSxHmD39V21ZX5rv6-yobQJ_Km9Sp_Tv7Cqd8JGeJyxw>
 <xmx:aJ_nZdvMiR0yEN-X-A4bhcOkuXN3kk7Wth-DApcslpf7NytZp0IwAg>
Feedback-ID: i32e1442a:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id 5BB0315A0092; Tue,  5 Mar 2024 17:40:40 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.11.0-alpha0-208-g3f1d79aedb-fm-20240301.002-g3f1d79ae
MIME-Version: 1.0
Message-Id: <22dfa9f7-e7cf-4714-910d-1b82b2d74997@betaapp.fastmail.com>
In-Reply-To: <20240304233450.4040579-1-vinay.belgaumkar@intel.com>
References: <20240304233450.4040579-1-vinay.belgaumkar@intel.com>
Date: Tue, 05 Mar 2024 14:40:11 -0800
From: "Ivan Briano" <ibriano@fastmail.com>
To: "Vinay Belgaumkar" <vinay.belgaumkar@intel.com>,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Cc: "Rodrigo Vivi" <rodrigo.vivi@intel.com>,
 "Tvrtko Ursulin" <tvrtko.ursulin@linux.intel.com>,
 "Sushma Venkatesh Reddy" <sushma.venkatesh.reddy@intel.com>
Subject: Re: [PATCH v3] drm/i915/guc: Use context hints for GT frequency
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Mar 4, 2024, at 3:34 PM, Vinay Belgaumkar wrote:
> Allow user to provide a low latency context hint. When set, KMD
> sends a hint to GuC which results in special handling for this
> context. SLPC will ramp the GT frequency aggressively every time
> it switches to this context. The down freq threshold will also be
> lower so GuC will ramp down the GT freq for this context more slowly.
> We also disable waitboost for this context as that will interfere with
> the strategy.
>
> We need to enable the use of SLPC Compute strategy during init, but
> it will apply only to contexts that set this bit during context
> creation.
>
> Userland can check whether this feature is supported using a new param-
> I915_PARAM_HAS_CONTEXT_FREQ_HINTS. This flag is true for all guc submission
> enabled platforms as they use SLPC for frequency management.
>
> The Mesa usage model for this flag is here -
> https://gitlab.freedesktop.org/sushmave/mesa/-/commits/compute_hint
>
> v2: Rename flags as per review suggestions (Rodrigo, Tvrtko).
> Also, use flag bits in intel_context as it allows finer control for
> toggling per engine if needed (Tvrtko).
>
> v3: Minor review comments (Tvrtko)
>
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
> Cc: Sushma Venkatesh Reddy <sushma.venkatesh.reddy@intel.com>
> Acked-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Signed-off-by: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
> ---

Acked-by: Ivan Briano <ivan.briano@intel.com>
