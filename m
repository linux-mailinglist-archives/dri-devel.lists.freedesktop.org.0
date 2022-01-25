Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F40449B639
	for <lists+dri-devel@lfdr.de>; Tue, 25 Jan 2022 15:29:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EB0FB10E31D;
	Tue, 25 Jan 2022 14:29:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3429A10E31D
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Jan 2022 14:29:50 +0000 (UTC)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.nyi.internal (Postfix) with ESMTP id 8C4385C018B;
 Tue, 25 Jan 2022 09:29:49 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute3.internal (MEProxy); Tue, 25 Jan 2022 09:29:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm1; bh=4m4Nfajjru0qWT
 duIOfwHl5xFRQrSBLuUd6OLp8Yw0k=; b=J889hK9aoApwJqMHnRLdNg8qOV2LuG
 2W/UG7LRazCkHL+x3+5UHjsHR1jVlRLsmRSp2sa/vnNSyHdV7iTLrXsDPMjPkN+E
 muJZkNHQMSFOywnj9+wKtm+d7QaFaXV6ikYLYQkaxDHJGvzBDrgQU8WNkQXlm1/e
 mbJfqXtTtdCFY04HNKdf0gN+ZVga0+s9BzZ3gN6lf8s3RKfuHxVMVDsnOlekF7lE
 su/+yAep2IuOIXwipQUb5LhFyQn5WCkY/Apx9iQbTOJCO4ir0ZxmkpIYFVA76nho
 ON6QYccZFdMXngXMrPTwJo5pMPtj3SmcSH0IUCj0Pw+4F2lQvpv5SR9Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm1; bh=4m4Nfajjru0qWTduIOfwHl5xFRQrSBLuUd6OLp8Yw
 0k=; b=E5BY7NepFfEh1RnIAvSG1rRGmVp5e0aKSf1bHtIYBgdc24FSamSNacMcN
 8V/33IUg1CJ/ET4XMccupDq9VV0XmMklt7gNsDiyJgnC94Dv149qT7pv7hhc/UtP
 x/XqjPfhVDEZVDOkDt6Bjdlpcfpy9cCT81x5uNsEjBJKJqRO6yo/9pc2D5Oic8zR
 AZ3t2Yp3Bp6t5bt76zaiy0MEJ3PTs/7G4wa2laWKOwl+g96GjhuaRSvYONsHa9JZ
 WWxCuHg+xwIb0LkPB0zsVE3UWujJhJyqPEd5PV1rtHNlHgB7oDekotr5gKsDSXNe
 vXHEZJTG9IIofw0oTXRbcsQ3F8K8Q==
X-ME-Sender: <xms:XQnwYR43w7zQsQxZtr0284UZqhBI3j4Z2AkGMCe28aw12LPSUpz1Jw>
 <xme:XQnwYe6HQd6gw1ZEeNkJd_wJS0-uRyVH9OI4KcE-1UHT5iSbr5BGv7RD-DRfZxvxR
 Aod2NH-8R5mA-9iYLc>
X-ME-Received: <xmr:XQnwYYcMzyxXY931l1KNkc9ka7kcsBXQAcSCOUS2C1VqnCeZ23mpXaul1ZZkzNl6gnjGMOWw4Xe7BJj-pAVcXMuYzuvmc8I_g-20zmY>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddrvdelgdeigecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhvffufffkofgjfhggtgfgsehtkeertdertdejnecuhfhrohhmpeforgigihhm
 vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
 htvghrnhepjeeugfegkeffgfeuvedtvddufffhjeffjeejvddvudduteehhfefhfefgeei
 keeknecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepmh
 grgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:XQnwYaILwfydhPyahY0q2_pNdp06UtN2ti3f1JaRTEAcw9qHhhHR6w>
 <xmx:XQnwYVJEQYCJJYdIm9yfuueUdj0cE0qoWYoAbWc1EE0N-RV7d8PLOQ>
 <xmx:XQnwYTxfqtddoicLwU3xn9Mqq_M683FWAN5d17_pGNKMdViLvSFWiQ>
 <xmx:XQnwYSGFWesPYLYB-aWZv2bbOjE1aakQzX4LS7mUWYjxgst_fabDgQ>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 25 Jan 2022 09:29:49 -0500 (EST)
From: Maxime Ripard <maxime@cerno.tech>
To: Maxime Ripard <maxime@cerno.tech>, Thomas Zimmermann <tzimmermann@suse.de>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>
Subject: Re: (subset) [PATCH] drm/edid: Clear EDID Deep Color Modes in
 drm_reset_display_info()
Date: Tue, 25 Jan 2022 15:29:47 +0100
Message-Id: <164312096477.750222.10027203445604881237.b4-ty@cerno.tech>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220125093251.594772-1-maxime@cerno.tech>
References: <20220125093251.594772-1-maxime@cerno.tech>
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
Cc: dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 25 Jan 2022 10:32:51 +0100, Maxime Ripard wrote:
> Even though we have the other drm_display_info fields reset, the DC
> modes are missing.
> 
> This shouldn't be an issue since it's explicitely reset every time a new
> EDID is parsed.
> 
> 
> [...]

Applied to drm/drm-misc (drm-misc-next).

Thanks!
Maxime
