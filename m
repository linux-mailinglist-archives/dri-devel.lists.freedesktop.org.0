Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C7F6D4AB8A1
	for <lists+dri-devel@lfdr.de>; Mon,  7 Feb 2022 11:22:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B9C6D10E296;
	Mon,  7 Feb 2022 10:22:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com
 [66.111.4.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 65A7A10E296
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Feb 2022 10:22:27 +0000 (UTC)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.nyi.internal (Postfix) with ESMTP id D66F85C0180;
 Mon,  7 Feb 2022 05:22:24 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute5.internal (MEProxy); Mon, 07 Feb 2022 05:22:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm2; bh=xdRRArzSTqmUDv
 xiI6wBLv1+AxopfJjXjYcTEwFVKgU=; b=n9gfkghsn2mTZokKKNvqe07Kyz1QdD
 f1rEiVHFuw94mSIYvGn3WZB/nMRWo2eHZG9dCYGil59oNRcUWFUJhARvBqT+RXud
 zJ73F4JmeGjpMZo0A5ABdFeVveC6IuTYZoedKR2R+EtLOxKQLul8mcCbzrEROHgI
 PXhp+ZhFLjEQnMU4qQxJezY/ocwhDRpOlKCBhYUszTVFP9uewTlRgzc2xPSxcrsn
 sY1SwI3g6gMv0OcfXY1BsUvUsrHneS5flLd+rIPAbsPpDoYz22fPToA1G6vFE6LF
 AifKUPoWyUM5ez/0Eb4+KCD+Hav/FYTFg96MYobMb6v8u4Jq/AStH8Cw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm2; bh=xdRRArzSTqmUDvxiI6wBLv1+AxopfJjXjYcTEwFVK
 gU=; b=J+GAhLq/wWu7T0I/IIWrH0L6KVZiYoxtNh54eNRmOjKC/cLEfD+e1XNhG
 XKpuoI+QDcXPOSODAfYkzp+EjY667Zbyefh9PueGf0QHpK4PFLcT2E0kTPAw2zx3
 w1L3sT34cFgUDMMrdq76N6oR4PagIxEvN2JCS5IYbmWKaZB89ELBwxby361yXMqX
 gd6g5NnvazMAlcmZxYWGvwl6GLPI7j0+WhnW6qmB7gibUcELGJTekW96icQ+0YpQ
 yZOFTlq9U0XStI4o+nozNbyuIOuMw2eBXKqCuJoYe1X4ueQR53aM/Sdxp5GeJbK5
 iTJYkgbz6Tjc1BHKN0nuRb7esVqjg==
X-ME-Sender: <xms:4PIAYiWo3eK5mbhjP8L7-7-8wgfPkx3sY2dly5E6MqFy43wKSoiQYA>
 <xme:4PIAYunxgx0u16OAA8cwdjnGwJEByVzBk4yJkLA8UbkLbp-i6ioLG02f_4ZpTuh6T
 DWohWJVuw_bpHCliI4>
X-ME-Received: <xmr:4PIAYmausSRdWPks8WymKy94QFUqTcoAmHX5oH8ceDcxHl6eKyW6e4D7-ISTt2dIxdvtVJMoGJ21_d7fHxhbmRcxIGH2uWRw9gGjj64>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddrheehgddufecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhvffufffkofgjfhggtgfgsehtkeertdertdejnecuhfhrohhmpeforgigihhm
 vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
 htvghrnhepjeeugfegkeffgfeuvedtvddufffhjeffjeejvddvudduteehhfefhfefgeei
 keeknecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepmh
 grgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:4PIAYpVRQsEzELl_bD8AgzZenQgHAfu2TCNqGWSqDwJLnEbykmu4dw>
 <xmx:4PIAYsleKIaNPzZpXQwa9YfQnPFWD2e0blr_4ux8nfQCFgRR8x27Lg>
 <xmx:4PIAYueNi5S-0wDKRVtJAScfWBg1ysJUFtC5-b3v7FJeED5AAVsiiw>
 <xmx:4PIAYtCwB7IH6vCpEdT252Z1rWEvfvVJroK96671I4rckSs6GLxmbw>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 7 Feb 2022 05:22:24 -0500 (EST)
From: Maxime Ripard <maxime@cerno.tech>
To: Maxime Ripard <maxime@cerno.tech>,
	dri-devel@lists.freedesktop.org
Subject: Re: (subset) [PATCH] drm/vc4: crtc: Fix redundant variable assignment
Date: Mon,  7 Feb 2022 11:22:21 +0100
Message-Id: <164422933776.544573.12482553887651722804.b4-ty@cerno.tech>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220203151151.1270461-1-maxime@cerno.tech>
References: <20220203151151.1270461-1-maxime@cerno.tech>
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
Cc: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel.vetter@intel.com>,
 kernel test robot <yujie.liu@intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 3 Feb 2022 16:11:51 +0100, Maxime Ripard wrote:
> The variable is assigned twice to the same value. Let's drop one.
> 
> 

Applied to drm/drm-misc (drm-misc-fixes).

Thanks!
Maxime
