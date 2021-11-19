Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9126C456DEB
	for <lists+dri-devel@lfdr.de>; Fri, 19 Nov 2021 12:01:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 11A1D6EB35;
	Fri, 19 Nov 2021 11:01:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com
 [66.111.4.26])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B24CE6EB34
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Nov 2021 11:01:04 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 0407C5C00D4;
 Fri, 19 Nov 2021 06:01:01 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Fri, 19 Nov 2021 06:01:01 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-type:content-transfer-encoding; s=fm1; bh=
 aqV1j+PWhw1EcvbQXT1J3L/THztodbDSfacb7pAVugM=; b=ftbKAxf07PobC8tc
 3xnTmS8A5B+lTLU5mM6sNe0Cl17dgo+Hfm8byyKLzo/D3VXtRpWUZlBtlN6+5qfB
 J4jOlfRjj2JD6mUbSeUyVfg+8hhkDxL7yeoJFZGc0g6Dhp7HGYbf9t6YrERVO/Ad
 TqRGbafDqh5BmIUuCvnHyVH5gB8UkBgdw43nl2BPk4GI3CW1cKMKCk0mgcfOBdjB
 JOtD5/AVeBa2oxOPNVt+/SsvQRG84nWJChTt7suSCZOzfrDfXrWoRCVYOFpHg4j8
 fw9dKu9zDIsGpYQBhro2Cr0Lm29hb+DFFxBYmm0Zx7uhB8Sche/0uNXeWe7YKlWn
 8JYY+Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:content-type
 :date:from:in-reply-to:message-id:mime-version:references
 :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm1; bh=aqV1j+PWhw1EcvbQXT1J3L/THztodbDSfacb7pAVu
 gM=; b=H+4YAfIklh5jmWWnXafnjUsLSKbg8zIQ6nqM9avIZ5UkAj8TY3VrP5ytF
 xYsa1YbPh/ZRzZRt0V9Kz9cScuC+duehuhZJO6WLvLjgq4ywoah2FGJGFsILV4mF
 7QEzjMao7pgC3svRBzSFxZlMKCtXwwzlrIQqJTR8HBNndKlJFK29bRfgJ++21AUY
 5u00wP5Hk0wAK7PvD8FCfbNszvC8c0H37PLwUjSBXOIfUIQR616EK8xrPnW5mX1R
 96jhNdiGIiq1Y8qCa930xlOzvkaib6c4uKNvDffud72i6EUQcz++E+fYpeanR1bx
 KgJzQOM/DjqiV8sA9Gyq3Tu5HrMtg==
X-ME-Sender: <xms:7IOXYTk49j4kro134d7Of7BnHXnls_ilMt4e_L-OuRNdSPxr9Q_Nrw>
 <xme:7IOXYW1C249-KZMTjIelZ0JsWVVlmHFBuPXyXNfNcy-8ZQaUhKI-OBsI_1MSWQENN
 unxs3yhG3atuiMQVQc>
X-ME-Received: <xmr:7IOXYZqO5ffRpQ5pE25xuLk1GXQXW2nJqykQpCU23Ev9mo4TwVI64sJEKq4UwSFZUhTCa1MsaR0aNf_6kN4PKsGEFcxHASdm1e6jd0_3OVc>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvuddrfeekgddvvdcutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhvffufffkofgjfhggtgfgsehtkeertdertdejnecuhfhrohhmpeforgigihhm
 vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
 htvghrnhepjeeugfegkeffgfeuvedtvddufffhjeffjeejvddvudduteehhfefhfefgeei
 keeknecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepmh
 grgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:7IOXYbl_txF_lipHZxwMYl3vuVcleg7hb0kA2rlX1MuoZCdXUhRlkQ>
 <xmx:7IOXYR1csdC__J0iMFBBRpXe10cLUSPi3Xte1rlcON4tGV5KIAcGdg>
 <xmx:7IOXYavi6MWKPRZlRoEz5smVrZ_vI6cxquVWMDCjK0ISsMleY8uk5g>
 <xmx:7IOXYelB_ig3WITGQ5wJDq0Mtj9d2bGg3r69G3qXL02K80cDdOPY2w>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 19 Nov 2021 06:00:59 -0500 (EST)
From: Maxime Ripard <maxime@cerno.tech>
To: Dan Carpenter <dan.carpenter@oracle.com>,
	Emma Anholt <emma@anholt.net>
Subject: Re: (subset) [PATCH] drm/vc4: fix error code in vc4_create_object()
Date: Fri, 19 Nov 2021 12:00:56 +0100
Message-Id: <163731964127.830809.14126199659521737361.b4-ty@cerno.tech>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211118111416.GC1147@kili>
References: <20211118111416.GC1147@kili>
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
Cc: David Airlie <airlied@linux.ie>, kernel-janitors@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Maxime Ripard <maxime@cerno.tech>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 18 Nov 2021 14:14:16 +0300, Dan Carpenter wrote:
> The ->gem_create_object() functions are supposed to return NULL if there
> is an error.  None of the callers expect error pointers so returing one
> will lead to an Oops.  See drm_gem_vram_create(), for example.
> 
> 

Applied to drm/drm-misc (drm-misc-fixes).

Thanks!
Maxime
