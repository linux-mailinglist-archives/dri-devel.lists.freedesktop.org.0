Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 807674C4BD3
	for <lists+dri-devel@lfdr.de>; Fri, 25 Feb 2022 18:15:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 00DD110E881;
	Fri, 25 Feb 2022 17:15:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new3-smtp.messagingengine.com (new3-smtp.messagingengine.com
 [66.111.4.229])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9354210E85A
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Feb 2022 17:15:10 +0000 (UTC)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailnew.nyi.internal (Postfix) with ESMTP id EFCC7580246;
 Fri, 25 Feb 2022 12:15:09 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute5.internal (MEProxy); Fri, 25 Feb 2022 12:15:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm2; bh=hMnWWu8ovSC1sp
 O9JS/utN2lZhzxyZ14CTzikOD23BQ=; b=vwSGphWI6U60akE6SlPtIIpsDkIeu4
 um0vqvJBXhX5EhBYc/k3XwGxiiS/qbgPFWG37Wjyp7wC8qShfwCKTL3hhWr8iOza
 UWbpFucosI1A7u4/Mbmx60jgE+ULeWpZBdEf23/VqCsr7+pH+VH7wsq4WK06RxSI
 ZJNN9HqLaqnqAxYyrI67qP2ghB4XYR051qFmcGB3gr8WA5zQuOXw92z/fAF3pOVr
 wOaG6GQ/qi9MFvLOHefDeFUg+rHbDuAjzsHk2mT0S6ZpASfHHTGlsJOChZLMRTHh
 yhi7qHp0JRhD67QBGFwiTCdrtkn4GMmo4Ju20NHi7kXs/4y2a7wfM/Jg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm2; bh=hMnWWu8ovSC1spO9JS/utN2lZhzxyZ14CTzikOD23
 BQ=; b=KUQMApRAp+YPNwHO/FTaTtr+Q7e8k+FZVQDxgZl6W6MSabWkgfusKvq2T
 S1a962ivghVy82G25YzEED6oXm0RrT8ym3tOf+6fazoVYlsJCTjs7KKHN3We+eXl
 ue9SfWxRVqz6oX+vy4NcRsdW/UHVcBvR73VHaoaL7jDAWlcbkUHDPTKfTzVviJE7
 ipw3ELSyOxcLGcEKZbWKcwBwpcOLIqlOJxDZcD3k94imwNTUA3Up6/ZhEZm4LE1C
 hltmfI5glFq8iX6NpfgHGtE6wJ3J4702GEmK9yeVExiet76hg75npD/uwE82u4dL
 9Xh/gdjXCkeE427n7/USM4RRloOIw==
X-ME-Sender: <xms:nQ4ZYgvVjw63r7963kUcNpdOsGRaEa7xpe3HwulptY2bL0glHRfpbw>
 <xme:nQ4ZYtezv6QsHrq2UtwrFSGBzS2yl3AQHmGlNnFZLmNlKoXQT8UA1RdnEWc_fikLJ
 7YC5RHcGx4jEJZqzR4>
X-ME-Received: <xmr:nQ4ZYrwUx5RLwT6TfAIApAtSyqRqEHCe_BBhZ1QIq2lRPqFEPX8Up5uzJQpO2a5Mg0Wo-L06FbFcqPGzuz6HZEY8E2ePqtQMlTISwaw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddrleeggdelkecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhvffufffkofgjfhggtgfgsehtkeertdertdejnecuhfhrohhmpeforgigihhm
 vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
 htvghrnhepjeeugfegkeffgfeuvedtvddufffhjeffjeejvddvudduteehhfefhfefgeei
 keeknecuvehluhhsthgvrhfuihiivgepudenucfrrghrrghmpehmrghilhhfrhhomhepmh
 grgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:nQ4ZYjMomJ9u4LcDXOaOZDhSF1q5c8XziVxD9fV_Ru-C4cRiey982g>
 <xmx:nQ4ZYg-0Li19A8X8Hh53Lm19e_--2C_MGvHicG5OtJLPr7b3jjcVVg>
 <xmx:nQ4ZYrXAYrNRFeNjRJsYxzF_S2RcUwHXUIlFVKAkyr7Q4AV8FAp4Tw>
 <xmx:nQ4ZYra7IyoUDEaB4SyHh6SJuRa_5Ior5VTbtOD3Dbskt9wxZUCZWQ>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 25 Feb 2022 12:15:09 -0500 (EST)
From: Maxime Ripard <maxime@cerno.tech>
To: Maxime Ripard <maxime@cerno.tech>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel.vetter@intel.com>
Subject: Re: (subset) [PATCH v2 16/22] drm/sti: plane: Remove redundant zpos
 initialisation
Date: Fri, 25 Feb 2022 18:14:46 +0100
Message-Id: <164580928298.726994.11656874131497345076.b4-ty@cerno.tech>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220221095918.18763-17-maxime@cerno.tech>
References: <20220221095918.18763-1-maxime@cerno.tech>
 <20220221095918.18763-17-maxime@cerno.tech>
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
 dri-devel@lists.freedesktop.org, Philippe Cornu <philippe.cornu@foss.st.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Alain Volmat <alain.volmat@foss.st.com>, Phil Elwell <phil@raspberrypi.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, 21 Feb 2022 10:59:12 +0100, Maxime Ripard wrote:
> The sti KMS driver will call drm_plane_create_zpos_property() with an
> init value depending on the plane type.
> 
> Since the initial value wasn't carried over in the state, the driver had
> to set it again in sti_plane_reset().
> However, the helpers have been adjusted to set it properly at reset, so
> this is not needed anymore.
> 
> [...]

Applied to drm/drm-misc (drm-misc-next).

Thanks!
Maxime
