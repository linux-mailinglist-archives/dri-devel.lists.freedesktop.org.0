Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B24D4C4BD1
	for <lists+dri-devel@lfdr.de>; Fri, 25 Feb 2022 18:15:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1816410E852;
	Fri, 25 Feb 2022 17:15:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com
 [66.111.4.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9C8BB10E852
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Feb 2022 17:15:06 +0000 (UTC)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.nyi.internal (Postfix) with ESMTP id E916E5C01E6;
 Fri, 25 Feb 2022 12:15:05 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute3.internal (MEProxy); Fri, 25 Feb 2022 12:15:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm2; bh=7YYM5Pr0XDvE1I
 Uv5xY2/pVhjzcSjaal0ZQjKv+k0u4=; b=hQhJjkKlVCotzzqGfjIk8TCtm7OXpA
 +MP1rVCN5UhYq72X1f9gipR2scDeEoANSfnbMMQ1Tbc9PVeY6DQnbLJ4IjojeHLC
 ILcp9IeODNrcGVYTMjyuN4krFs7uLd9so9Y++c/O0ZAwkG1NBoKQV8ZuiZ3s1tDi
 i/Ol4iuPVhyWRo7HbgeYiEkSdYaQZLkci2axTuSPgd9D2bv4wK+N0ItxPrxcIIxs
 ZIZRSxFzSgRD7DkAElHzPLEFavou/Rx7yBSdPL2gf0jC/gnvTpd5gp8eIkO64Srp
 HuRTFUj49brHpCkECkKSpPiyB6lOTmT2N/n7HSXBdzmlIQGEkm0fsrDg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm2; bh=7YYM5Pr0XDvE1IUv5xY2/pVhjzcSjaal0ZQjKv+k0
 u4=; b=cA6uO4FDa467MeDLp4OjQJ/mOMFNWyf3149+GIDdRpWUiB0W8cv4W4NaW
 kzun4+oszxgyhauOD/0tMfRkU69qhr6mrmhU8YW1zqH7y3Mi/MxueyzcKKJsWDEP
 swuLqxX+LNpcTLptbG2ddg3i2NyRdhX28boI/yniuI4eeQoZRf+f9W7Hc9XIfu3a
 CkpeMCOdp3bNkougFgvC5XcW03nDMJQCXwX7AbCmuxik3H1D7JQ4xVDu2KDg0kMZ
 6V1TBa8Lx+mTEOB3ju2+L8q3QMp5t217jFsXnAQirSGEaf4ymU9gk+E6zP6wnwfY
 /Op7uzvSDRbV3+AgZpAf1ddTB0dvg==
X-ME-Sender: <xms:mQ4ZYkfAYuuhTiAO58moVUEUVwg7raMcQrHLkArxmnMfmdHbcZ0CWA>
 <xme:mQ4ZYmPENQ1sC427WEtONR4Q9GNqpvi336R8oSy99MsMrF0Ehjew84jhd0MXI394l
 wlrRwjfeo8Bf7UUr0Q>
X-ME-Received: <xmr:mQ4ZYljo-cpETkOJ7tCnf1CKstT-CEcgSrRShDUDl9q0EfhH1Y9zWpKt8BIuYuu1gXa3tqXguqu26-tjIQGkIZzBeLDuttF88mpcvKc>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddrleeggdellecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhvffufffkofgjfhggtgfgsehtkeertdertdejnecuhfhrohhmpeforgigihhm
 vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
 htvghrnhepjeeugfegkeffgfeuvedtvddufffhjeffjeejvddvudduteehhfefhfefgeei
 keeknecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepmh
 grgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:mQ4ZYp9pKrnLssdVRCaqHBEzLtBHBtSIueFAY0_EnKGGln4a-aAFgQ>
 <xmx:mQ4ZYguXy24Ehf_BBYHDkP2O0Uf0TjIqhdmC_W7m1WuMEPnDoejFxg>
 <xmx:mQ4ZYgHObV8wo67ZRpFoaXPQQTFqYY0vabfGzRqMra746QIGX2I1mg>
 <xmx:mQ4ZYuCW0_ycRIgkeIgIgQYgFQY_0udxUqx7fdeOlsxgCno47QcaGQ>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 25 Feb 2022 12:15:05 -0500 (EST)
From: Maxime Ripard <maxime@cerno.tech>
To: Maxime Ripard <maxime@cerno.tech>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel.vetter@intel.com>
Subject: Re: (subset) [PATCH v2 14/22] drm/omap: plane: Remove redundant zpos
 initialisation
Date: Fri, 25 Feb 2022 18:14:44 +0100
Message-Id: <164580928297.726994.7709137326903186288.b4-ty@cerno.tech>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220221095918.18763-15-maxime@cerno.tech>
References: <20220221095918.18763-1-maxime@cerno.tech>
 <20220221095918.18763-15-maxime@cerno.tech>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
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
Cc: Tomi Valkeinen <tomba@kernel.org>, Tim Gover <tim.gover@raspberrypi.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 dri-devel@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>,
 Phil Elwell <phil@raspberrypi.com>, Dom Cobley <dom@raspberrypi.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, 21 Feb 2022 10:59:10 +0100, Maxime Ripard wrote:
> The omap KMS driver will call drm_plane_create_zpos_property() with an
> init value of the plane index and the plane type.
> 
> Since the initial value wasn't carried over in the state, the driver had
> to set it again in omap_plane_reset(). However, the helpers have been
> adjusted to set it properly at reset, so this is not needed anymore.
> 
> [...]

Applied to drm/drm-misc (drm-misc-next).

Thanks!
Maxime
