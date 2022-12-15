Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DBAB664D772
	for <lists+dri-devel@lfdr.de>; Thu, 15 Dec 2022 08:55:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A468910E069;
	Thu, 15 Dec 2022 07:55:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ACA4D10E069
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Dec 2022 07:55:00 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 559DF5C00C5;
 Thu, 15 Dec 2022 02:54:58 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Thu, 15 Dec 2022 02:54:58 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm3; t=1671090898; x=
 1671177298; bh=Fv5Kg8SLdoV9Ti+vnl7dxNlNJMvGN9UNUxEgZDoL710=; b=Y
 8YsnCw5g9X6jPtt1dbmnJ7+EotVYImvCrDL9JMiejO/3Tk4Zt5fEefKIt2MWR4BR
 9AU6VlWakTv9JVxpqZXi2LnBkQnlWlI7PKEsIw1eD31wHzHFQwtzr5TrIuMraxLo
 3aAKhfhigd8nDNolf9s5F7TfuixgyZxKWyfGbOZ6ESRq1bBPs6MVLp0dSYofn4aB
 8EnKAtwqlVLWgGIGSZkl4EuXi/C8/qq20huxpVY8XF8aO1FiUN6CTiPMIwtfySvs
 Q8uTaCQH3Ej0HTQiyuqA6IsRoBGzLPPJpIl0V5WbldxQjphQ3Aio8ebF047hZODc
 UtIEFYAexvii0S+eyY4gA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1671090898; x=
 1671177298; bh=Fv5Kg8SLdoV9Ti+vnl7dxNlNJMvGN9UNUxEgZDoL710=; b=J
 TQbbL8uIVRxg5Myv1I7npcNsNBLhGnGrzxB/wjVBYJEFNCt7+IWooZjIdMFcWQYf
 b07Hpk0ug6FA0uLRM6VsGOG4ZfDHCTmN5ZG55/Rn1zqWpP4TJMIBbx+GGEvp94xF
 WfPiMBbSTsjM2I9NXHD8RChWRQkZdwfF54PTc3wOj5e2uYxfxry1xeU49UxJqNj1
 JrH4B5qFN6EDyhWbM3YoDi8tXUS+jdOWH4cxbJ83mi3Igqyd7r1BIP+kcao7mKjB
 1T8TFjeN9SNVnA0swZoN4YgTUw9y3ap8Rez2jZF95jDFpwlWi7ta2U4FzfwyfytQ
 28wqgujvnHrnsv5h/n1xw==
X-ME-Sender: <xms:0dKaYypjGvLvJmSB9pHlScgVHivF2_kkFswqU3yKZtISsteIZhsNvA>
 <xme:0dKaYwoRAul0FuzubdC2EPP_RatZpTaV5sWtus_BtW4JPjYv_N8zQivK5vR6WjK2j
 0mNnf4jtW1tMlNTREc>
X-ME-Received: <xmr:0dKaY3OVyGkHVifZKvsYEPTIoaIR8tCHJvIIec2AqKiGTW7YD9XbXL1dtXY8i4sybl9_bg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrfeeggddutdelucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvvefufffkofgjfhggtgfgsehtkeertdertdejnecuhfhrohhmpeforgig
 ihhmvgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrf
 grthhtvghrnhepueeigefghfffffeifeehudeiuedvteegueefffevgfetvdffheehkeff
 vedufeeinecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomh
 epmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:0dKaYx5glAVghipKtKlCz_w8ze6zQpor4mMsLzAvDLLBGjumxy1ZxQ>
 <xmx:0dKaYx6lc4qtxkWyIWdscNAXNjGwjmJyIOyqz-eTRcIBALzM__CbZg>
 <xmx:0dKaYxjeJJaoeRu28IZo71fMT1JppTC-iDrzdHHJpon3nsF850c2OA>
 <xmx:0tKaY5ydjfBdiktiZ5AGHgiI7LkV4SvkWvBnrEeu4I2T1hGHCw1tRg>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 15 Dec 2022 02:54:56 -0500 (EST)
From: Maxime Ripard <maxime@cerno.tech>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Daniel Vetter <daniel.vetter@intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>,
 David Airlie <airlied@linux.ie>
Subject: Re: (subset) [PATCH] drm/vc4: Improve the KUnit documentation
Date: Thu, 15 Dec 2022 08:54:54 +0100
Message-Id: <167109087174.9136.16323712047091343535.b4-ty@cerno.tech>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221208094727.2848310-1-maxime@cerno.tech>
References: <20221208094727.2848310-1-maxime@cerno.tech>
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
Cc: =?UTF-8?q?Ma=C3=ADra=20Canal?= <mcanal@igalia.com>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 8 Dec 2022 10:47:27 +0100, Maxime Ripard wrote:
> The command-line can be expressed using a code-block, and we were
> missing which architectures were available.
> 
> 

Applied to drm/drm-misc (drm-misc-next).

Thanks!
Maxime
