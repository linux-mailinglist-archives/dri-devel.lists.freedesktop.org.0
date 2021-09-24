Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C881C417A19
	for <lists+dri-devel@lfdr.de>; Fri, 24 Sep 2021 19:52:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1A2B66E201;
	Fri, 24 Sep 2021 17:52:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new3-smtp.messagingengine.com (new3-smtp.messagingengine.com
 [66.111.4.229])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1A3DE6E1F8;
 Fri, 24 Sep 2021 17:52:39 +0000 (UTC)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailnew.nyi.internal (Postfix) with ESMTP id 4BB37580AA6;
 Fri, 24 Sep 2021 13:52:37 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute5.internal (MEProxy); Fri, 24 Sep 2021 13:52:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-type:content-transfer-encoding; s=fm3; bh=
 sp6EE7DxKHroQEvu81eWzZGB1zBIRkggUg0gv0hvam8=; b=VM6q5bS2qLSgMt+D
 goet5bmHTy6oMn4zQAzhRAs6mn7w1sUlmPwFYnvQT3A7kHXaaHnXibpwUjBmGFC5
 MW2f9LjBQ9uAmq7QGJB4Ai99bhhQZIOH39htM4p+n9xq64H3la0tXQ386DznJtvA
 rpYT0VJJNNlE2A62P3cto7y/cAeNKJMLqPU8S/q96Wd1o3l3xCP86vbmvnmOC2fN
 N+72i1Bz1SIALKklIAZU4hyRFIXO3iLcViCHthHxofFqdV0opcBtdO940YNjQxzt
 UvjotCc6CV0XlXoLLq9TW61PIg6mqCxK/NMVo8dWyEszULZVc4I7N6SLhQQsczPa
 +krAyA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:content-type
 :date:from:in-reply-to:message-id:mime-version:references
 :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm3; bh=sp6EE7DxKHroQEvu81eWzZGB1zBIRkggUg0gv0hva
 m8=; b=YOClWC7dNyVRH+WEdQwpFn3W3SRPaP3PhD64DwBD8hBOMwA3WU7F5tRLG
 ghzY6u7B01hfVKY2rOgvduoicGGPJ+8SjnhgiskkTxc2kN/1siKeoubCuy8Ek1mv
 PbjEQIcS3tbe177JyVoJeBbgmVM0pYEC69RsDBz/g8wLnRjHHuKKlE7NxgJBWbTE
 kWUdEdg5CAVqbaFJN5LV2C/KVKx1/T1kCSL88R+zuvkxRJ/rKTVAU6BgkE8gwK89
 ERGpto7Lb/Xw3fw8Pwfzg+4SrxjbC6+aFEujbLf22s94GiUwXlINKXN+5qXJDlbp
 FTTC7LXPz31pvbe7ZSTYmGqDrpabA==
X-ME-Sender: <xms:YxBOYQc_BFvFw7iVbv2i_Vaw-QjltiBlupjMV1sdiQQV1h6uMGFq3A>
 <xme:YxBOYSM82QV2YCdcIxxMFZDx0mA1jTesxid5Pm-zPXTCUjNHNOQIoFLOHHJvl-55n
 oPX8VOkhGoh1ddxWXU>
X-ME-Received: <xmr:YxBOYRhlKmtfeX2cdoRfcSEbuQo8TWqif3jU4-l0bzQmcL-bhA0jux7QZVSbMrjJOrQtct6YgfxRphCJXKOvWXbifCEhbRuFbT_z>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrudejuddguddujecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enucfjughrpefhvffufffkofgjfhggtgfgsehtkeertdertdejnecuhfhrohhmpeforgig
 ihhmvgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrf
 grthhtvghrnhepjeeugfegkeffgfeuvedtvddufffhjeffjeejvddvudduteehhfefhfef
 geeikeeknecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomh
 epmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:YxBOYV8H5P5HWDUqNCArUELWeKByLFG62t5JBnzSpI1_vpKTku2UxQ>
 <xmx:YxBOYctBjs8DcOCIp3L8xv7L8EMY-vOf-HNAAIYnAEogBlUEnXevmQ>
 <xmx:YxBOYcEBuWBdzG_rugbu0CLhT4vErI4JUZKKWUtlZRF0vWMaXbfONQ>
 <xmx:ZRBOYQcjzO1ZQXxUbAswUZATyvdlNjMAQgkMUfd4aO2LpzlVjL_qVw>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 24 Sep 2021 13:52:35 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: Thomas Zimmermann <tzimmermann@suse.de>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Daniel Vetter <daniel.vetter@intel.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, David Airlie <airlied@linux.ie>,
 Robert Foss <robert.foss@linaro.org>, Andrzej Hajda <a.hajda@samsung.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maxime Ripard <maxime@cerno.tech>, Sam Ravnborg <sam@ravnborg.org>
Cc: Chen Feng <puck.chen@hisilicon.com>, linux-samsung-soc@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, Kyungmin Park <kyungmin.park@samsung.com>,
 linux-kernel@vger.kernel.org, Rob Clark <robdclark@gmail.com>,
 Xinwei Kong <kong.kongxinwei@hisilicon.com>,
 dri-devel@lists.freedesktop.org, Joonyoung Shim <jy0922.shim@samsung.com>,
 Inki Dae <inki.dae@samsung.com>, Xinliang Liu <xinliang.liu@linaro.org>,
 Sean Paul <sean@poorly.run>, Seung-Woo Kim <sw0312.kim@samsung.com>,
 John Stultz <john.stultz@linaro.org>, freedreno@lists.freedesktop.org,
 Tian Tao <tiantao6@hisilicon.com>
Subject: Re: (subset) [PATCH v4 01/24] drm/bridge: Add documentation sections
Date: Fri, 24 Sep 2021 19:52:25 +0200
Message-Id: <163250593261.1360097.5766561564698142265.b4-ty@cerno.tech>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210910101218.1632297-2-maxime@cerno.tech>
References: <20210910101218.1632297-1-maxime@cerno.tech>
 <20210910101218.1632297-2-maxime@cerno.tech>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, 10 Sep 2021 12:11:55 +0200, Maxime Ripard wrote:
> The bridge documentation overview is quite packed already, and we'll add
> some more documentation that isn't part of an overview at all.
> 
> Let's add some sections to the documentation to separate each bits.
> 
> 

Applied to drm/drm-misc (drm-misc-next).

Thanks!
Maxime
