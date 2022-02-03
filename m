Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C7AA4A8748
	for <lists+dri-devel@lfdr.de>; Thu,  3 Feb 2022 16:10:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9190E10EA64;
	Thu,  3 Feb 2022 15:10:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EBBDC10EA64
 for <dri-devel@lists.freedesktop.org>; Thu,  3 Feb 2022 15:10:14 +0000 (UTC)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.nyi.internal (Postfix) with ESMTP id 557DE5C0180;
 Thu,  3 Feb 2022 10:10:14 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute3.internal (MEProxy); Thu, 03 Feb 2022 10:10:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm2; bh=wCJ8M3VDMqtG0j
 Lcb9TN2fibv59wCoc+Ky3xe2NhX2M=; b=oGj8ROwvYPO9xb0/Gpdet6oqYMfB2A
 ROxA2lkobCn/YHROqrWuLBlvF619i0Z738SiEPs8QNrrsxuux+rlhllnx2kE45Lu
 0lUOBqkkD0F1wUcqqzdaytc0MmNFf1CjzLpQOPPGoJw0B6f/QE4YssN8a4FoZ1vG
 CGOhsa6E99Kbpr/13SXlE184hT9GFIbIvAwiLxLZcpzPsXMTxZIAuWLsIafXLtVl
 2xxRENPfZSxbFKsrVpO7y+HVfNzQlNmKs/5sEYsHuGzUM9oyKtxlSKPR1HREoGBS
 eIDLE1m3OogAZeiJWktzUgm9oepyaf46XswAr3OIvgK0X4JCuwDSqtqg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm2; bh=wCJ8M3VDMqtG0jLcb9TN2fibv59wCoc+Ky3xe2NhX
 2M=; b=J3VQhvYq37yZNlDWEVCTHPi1EChfcWpvzdaM1xGNUB59sEfnOpwDHNAUu
 1iWthYTLaU7B/2Timkg6gp5z2IXwgQ2iDH98MF/S92S9SGtMzZe6xrRPJ8W4dpHr
 1k3owKPABbtqmj/PKCu6uhTdGRNPNaksbIUjYdsz8DNv1a84j+b+7e2aQMzgsAzD
 KCoamNq4wUH5wQIIVPS+NmtDi1LKrQ9LSkMNv1IQmdg5c5fJbJezQNHz3UxtAsKX
 Z+FcHFoyBTFm9qufoOkBYMaz2u1X4ihtovVcWJ9wGyEjoNgmDoi1NtDupYkunjwD
 WpEZp+aeBJxA0JuSLXdsWGQkZyMUA==
X-ME-Sender: <xms:VfD7YW1_QA9rKnUYfujIRmU_H1qGGIpzmRfmDcj4yqJDgDbeaqEL8w>
 <xme:VfD7YZFLZLd1IWEz5I6zkvaybFGo2dcTXV1kY7ljSiWFNGvS4_kfshNPtAa3b4Jdb
 9BGKYqVqVA-YV979do>
X-ME-Received: <xmr:VfD7Ye7KpJAXHO6bpsVY65OMS5jEKesPJSt2ssHpKK-rTbZET-5MjOTmXrupYTWhqcUln1BgHXK8CUuU9FmUNy_dff9ljLUsWptiEwY>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddrgeejgdejvdcutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhvffufffkofgjfhggtgfgsehtkeertdertdejnecuhfhrohhmpeforgigihhm
 vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
 htvghrnhepjeeugfegkeffgfeuvedtvddufffhjeffjeejvddvudduteehhfefhfefgeei
 keeknecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepmh
 grgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:VfD7YX2nx2BcVGxTIpRvwW3sz8V4zio0K7JktxNXFk2RfqnvA-hR6A>
 <xmx:VfD7YZFi_J4Wx4M1VYUBmrCoe9tSU135D2BK767kd9LOEswUKhKNsQ>
 <xmx:VfD7YQ_alo4H-YUkWKXAEpoEOdhJaT_wkOAQV3XE15noPYzzZmy5yA>
 <xmx:VvD7YdimfuDM5IgOYUn9l3980_fRRChwnEZ_zrnkHQjF76Nu2T6Eqw>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 3 Feb 2022 10:10:13 -0500 (EST)
From: Maxime Ripard <maxime@cerno.tech>
To: Maxime Ripard <maxime@cerno.tech>,
	dri-devel@lists.freedesktop.org
Subject: Re: (subset) [PATCH] drm/connector: Fix typo in documentation
Date: Thu,  3 Feb 2022 16:10:11 +0100
Message-Id: <164390100845.1269942.4846444424257876540.b4-ty@cerno.tech>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220202094340.875190-1-maxime@cerno.tech>
References: <20220202094340.875190-1-maxime@cerno.tech>
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
 Thomas Zimmermann <tzimmermann@suse.de>,
 Stephen Rothwell <sfr@canb.auug.org.au>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 2 Feb 2022 10:43:40 +0100, Maxime Ripard wrote:
> Commit 4adc33f36d80 ("drm/edid: Split deep color modes between RGB and
> YUV444") introduced two new variables in struct drm_display_info and
> their documentation, but the documentation part had a typo resulting in
> a doc build warning.
> 
> 

Applied to drm/drm-misc (drm-misc-next).

Thanks!
Maxime
