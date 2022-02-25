Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 62DEA4C4BD0
	for <lists+dri-devel@lfdr.de>; Fri, 25 Feb 2022 18:15:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C34AC10E85C;
	Fri, 25 Feb 2022 17:15:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new3-smtp.messagingengine.com (new3-smtp.messagingengine.com
 [66.111.4.229])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6E43E10E85A
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Feb 2022 17:15:08 +0000 (UTC)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailnew.nyi.internal (Postfix) with ESMTP id CC9AE580207;
 Fri, 25 Feb 2022 12:15:07 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute3.internal (MEProxy); Fri, 25 Feb 2022 12:15:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm2; bh=xNQNRlLUw5C9YQ
 EvZZD0MEyciFB6BjZ9uMmdZ0lur38=; b=smBW7DY78kE8m2hKyM+42lI4nb439E
 fNGZnGmyniZzN3NFqItnjSHFunJ0oF2d+5QWsfnrm+KztCA2xFu7j7IqiQG+zTte
 MAzEJlincC4byL7d5oRlXo82GoTJFVXXsivmrghxAcE3oLUdWQaP136S00PRMs+W
 pcHfRX7YqsZG4acLBPLFMK41gG/tca6GTrmZ+qC7I+NH+mFnmURoAtBbuLXGAbky
 lzKIF2mSB2xlmaVab/iUISYFZU0U4mCfv4HHfHp6TAC7uTdgwTrtFsrFuBMTPDd5
 xz6dxVIbvLEpp71Y/vdLXET4MPGyxpi85EEJYNW64BnJOkucLj40mDaQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm2; bh=xNQNRlLUw5C9YQEvZZD0MEyciFB6BjZ9uMmdZ0lur
 38=; b=h9KQFBydBEJEBxHstMqdKjCkTo6dl50hLa+E7jj71q/yqFWZIhi90+nPk
 fi8ALea0MNK2hq02mXaTBYsEX/YiVibAI+3tQKlzCdouUlk7DUYl1oBeombWzZ/m
 fFO2UqnIjWrb7zITB4g6aRrk6RhTXThfUex4eghP+9/+tsfY2GTDp/yjyR6yZNvj
 9pcoI0/KGwWgxCyw+WbVsVXhsMmGu+6eulm0abZMm3CjNHnOrYcY86BuwLiRxAPN
 lqzhsBURdneLBGAAYggIRwxkT5B++07NzZxcOJpUREGXsc+UIPchz2RwOVEo0MLL
 sNUCiD6nCZIGrFyizYaugClZUzv7Q==
X-ME-Sender: <xms:mw4ZYk4vg4Q7_5vZttQHW_xG_aKk-GN2SAnmUAVHPqBGZsru3Tm5MA>
 <xme:mw4ZYl5UOdDYESdnlchG0HDaiWRlPHg4Dyt2Xxz6nRNSpSwwWLJFTbx6wDBix5sU_
 z4DwXl3ywicGZz7_yE>
X-ME-Received: <xmr:mw4ZYje4PWw3uPlDz93m6rdkQpYGkmhafe10LJTqXkpoHklv_q1Un0-idoUKiQ6a8jb18StefAB3fdGBcpt9lmXBrHh0CVw01k2JzvY>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddrleeggdellecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhvffufffkofgjfhggtgfgsehtkeertdertdejnecuhfhrohhmpeforgigihhm
 vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
 htvghrnhepjeeugfegkeffgfeuvedtvddufffhjeffjeejvddvudduteehhfefhfefgeei
 keeknecuvehluhhsthgvrhfuihiivgepvdenucfrrghrrghmpehmrghilhhfrhhomhepmh
 grgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:mw4ZYpJFYFMufgnfr-z7VupGsFIqqIiNWKJRZh5QaCu7JgoWnmS7SA>
 <xmx:mw4ZYoKPWvlp0uBuGpp-gieqfmj6ReKyr84knKuzCqcveRFY3Vo4YA>
 <xmx:mw4ZYqyCPBHbncwFz4LOyKp4eWBnRciusl7h065ZeqPi1ND2tBPZuA>
 <xmx:mw4ZYmyY6M0h6CG2rlJJK7lYPZHG3ffV3hYR0QXvubJGponxNPjB8g>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 25 Feb 2022 12:15:07 -0500 (EST)
From: Maxime Ripard <maxime@cerno.tech>
To: Maxime Ripard <maxime@cerno.tech>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel.vetter@intel.com>
Subject: Re: (subset) [PATCH v2 15/22] drm/rcar: plane: Remove redundant zpos
 initialisation
Date: Fri, 25 Feb 2022 18:14:45 +0100
Message-Id: <164580928297.726994.13240358385635559463.b4-ty@cerno.tech>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220221095918.18763-16-maxime@cerno.tech>
References: <20220221095918.18763-1-maxime@cerno.tech>
 <20220221095918.18763-16-maxime@cerno.tech>
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
 dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Phil Elwell <phil@raspberrypi.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, 21 Feb 2022 10:59:11 +0100, Maxime Ripard wrote:
> The rcar-du KMS driver will call drm_plane_create_zpos_property() with an
> init value depending on the plane type.
> 
> Since the initial value wasn't carried over in the state, the driver had
> to set it again in rcar_du_plane_reset() and rcar_du_vsp_plane_reset().
> However, the helpers have been adjusted to set it properly at reset, so
> this is not needed anymore.
> 
> [...]

Applied to drm/drm-misc (drm-misc-next).

Thanks!
Maxime
