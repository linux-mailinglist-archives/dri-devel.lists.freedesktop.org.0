Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EFC924C4BD6
	for <lists+dri-devel@lfdr.de>; Fri, 25 Feb 2022 18:15:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BE0C210E884;
	Fri, 25 Feb 2022 17:15:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com
 [66.111.4.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A276810E865
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Feb 2022 17:15:14 +0000 (UTC)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.nyi.internal (Postfix) with ESMTP id 0A71E5C01E6;
 Fri, 25 Feb 2022 12:15:14 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute3.internal (MEProxy); Fri, 25 Feb 2022 12:15:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm2; bh=QSlxAd5u6pl3pM
 G6woWTzMzpnJSngh5iLPH2zPoV/yo=; b=LNX4QSQOZLGrBoOF5uCjfIIA2nFbA/
 6vDSDhEiwg3V+dK0xDCghT72sRGV17i704zpX8KCDrudjQwXbLkAPclt97yQWKdp
 pIdNhDdFSrqFu2CjNl37i/iUmEXJ1c1uVmsKyAaDASR0B3a1crRJ1sxtPu1yP6dX
 ABajOrnNWgSwqRNnZtSzNxgGDoTIcJUHndL2Mx0XKwzEPYmsPsF0cFpCq7NWxNCb
 vLgxiJwpc6u9+gLhiz+D9W1qJYWjkOPVScdAL6T5aOx0f9q6zdi8yulA0Nl9Z5FO
 YVB5vnfbGD1d6U62xd+KFPbE3GBFZAsZRVDYvT3jLM7e0FJM4isGNm5w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm2; bh=QSlxAd5u6pl3pMG6woWTzMzpnJSngh5iLPH2zPoV/
 yo=; b=UEqEVmqZmQq4OlD9uNYKEAigX4fkXtjy16CPRJL0yikt2Op3f/ffRVW2N
 a13FwD89ytBkMUmaHoUJoBUDNosm9fq/c0AHvrlf5d/FWw05uwlEjaVdwyxH9ggQ
 kx8ziTKt/s2zM6O/HBLYHZOxwZ9j4opgsdxWrfIkUxiUetjBpHUHE9C2jnoEMzJp
 nO+Nqyb860C6Z92o+1x0UNO55y535C0RVgJaSbMvYpW/XGHNMJ9orwgg+VqoKM6D
 dqNMEC+uvFr9BhRTpOsUoYJS1BEAAufTt1Rr6xH/dU+uljQtIx+6fW03gsCkXLMR
 LKoH9M7kziyoYKYMFKUghoJi4e4rA==
X-ME-Sender: <xms:oQ4ZYnEu3NlLwHkSWaM_wc6LIoHU_aK1sSs1XLgJCHoqIMWBT5waxg>
 <xme:oQ4ZYkVom6qE9DKJP4Gk9ld5JKplNFhKXGTWXx-lRJvx5hXlSHA87iIViFprkg0mm
 dukmFFeRQN-DuxqpCY>
X-ME-Received: <xmr:oQ4ZYpK71TBNBuD_wcjNxCkIVbwavm3QTrSAtm1tpgpXABURA7QoGTLTwpuOD7ZhhWllH-dA6BOxkqumpaOMdlO4pYybsMkSp09iJQQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddrleeggdellecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhvffufffkofgjfhggtgfgsehtkeertdertdejnecuhfhrohhmpeforgigihhm
 vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
 htvghrnhepjeeugfegkeffgfeuvedtvddufffhjeffjeejvddvudduteehhfefhfefgeei
 keeknecuvehluhhsthgvrhfuihiivgepfeenucfrrghrrghmpehmrghilhhfrhhomhepmh
 grgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:oQ4ZYlF1AZ0q8R0IUe7gAwNpmByrIUfBGQ-c1WpSc6HYiDT--uPcNg>
 <xmx:oQ4ZYtV99ckdvRz-DCk-ZuRO0Usxsiozk3MNeJ1G4BQgHQth_d1upw>
 <xmx:oQ4ZYgOO1sPIZase8FwlzDx6LfHN_dw93hrOGF3yd1cjQQ1Yzxkznw>
 <xmx:og4ZYsGN85koPA30BqfOkpMz4-BYgWM-_I7tJxfkoaADLPhlOuLgPg>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 25 Feb 2022 12:15:13 -0500 (EST)
From: Maxime Ripard <maxime@cerno.tech>
To: Maxime Ripard <maxime@cerno.tech>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel.vetter@intel.com>
Subject: Re: (subset) [PATCH v2 18/22] drm/object: Add default color encoding
 and range value at reset
Date: Fri, 25 Feb 2022 18:14:48 +0100
Message-Id: <164580928298.726994.17446357022237173534.b4-ty@cerno.tech>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220221095918.18763-19-maxime@cerno.tech>
References: <20220221095918.18763-1-maxime@cerno.tech>
 <20220221095918.18763-19-maxime@cerno.tech>
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
Cc: Dom Cobley <dom@raspberrypi.com>, Tim Gover <tim.gover@raspberrypi.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 dri-devel@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>,
 Phil Elwell <phil@raspberrypi.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, 21 Feb 2022 10:59:14 +0100, Maxime Ripard wrote:
> From: Dave Stevenson <dave.stevenson@raspberrypi.com>
> 
> The drm_plane_create_color_properties() function asks for an initial
> value for the color encoding and range, and will set the associated
> plane state variable with that value if a state is present.
> 
> However, that function is usually called at a time where there's no
> state yet. Since the drm_plane_state reset helper doesn't take care of
> reading that value when it's called, it means that in most cases the
> initial value will be 0 (so DRM_COLOR_YCBCR_BT601 and
> DRM_COLOR_YCBCR_LIMITED_RANGE, respectively), or the drivers will have
> to work around it.
> 
> [...]

Applied to drm/drm-misc (drm-misc-next).

Thanks!
Maxime
