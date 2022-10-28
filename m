Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BA9E610F80
	for <lists+dri-devel@lfdr.de>; Fri, 28 Oct 2022 13:16:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2C6EA10E102;
	Fri, 28 Oct 2022 11:16:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out3-smtp.messagingengine.com (out3-smtp.messagingengine.com
 [66.111.4.27])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E7C6C10E102
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Oct 2022 11:16:21 +0000 (UTC)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailout.nyi.internal (Postfix) with ESMTP id 569D25C009C;
 Fri, 28 Oct 2022 07:16:21 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute2.internal (MEProxy); Fri, 28 Oct 2022 07:16:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm3; t=1666955781; x=
 1667042181; bh=taKperktD46P0ZRumBpcfNwuGr/acogk/saQub0hD38=; b=B
 01o9ZGyXwtay5UQn+yG751I0Ku+rnDbbLJZnd0XVhh2UkAWpXsWwdN9KTVv3WlH9
 vzmcjUlpBmH6qUK1+dZv5r4jM/wlq4mpCmvuN6dvqPTVSVOBHMZynzXwPn8iwVtj
 N3UAFmjJNPT3vM6b2CfEY1ZCBUaviO5YIJrq0ugVS26l8eQXSg5D5SmtCfP5PfUt
 /VUungl5pl46o5VwZXP74AfuAxJtNqMSi+zlu4QVzh52MGSBSeQ6QDgctCYMIxQB
 rwxD7qqGBpFzQDiBtmoHTA2Bfo1hynDMxqI8VsLnyic7JMzxRmx1T319VpXCyL4W
 DI0IUBx7qzBj32dOWkBhw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1666955781; x=
 1667042181; bh=taKperktD46P0ZRumBpcfNwuGr/acogk/saQub0hD38=; b=Q
 dKeiCq/CNPSjulEFmF26AkCazshzRoCH1YjGNMDBSRqNa6e4sUJbUZdxhRyzfAHW
 pUTLAdZER1Y1yqQNBKjRN9cY5LTlK1lfZYnwt9Lt7mI474Gss9Oc+en4CfBGEXFC
 +j72DFy53FEuBHA193ow7v1FQDuNitnNdnPJg9bB+wqau1b4YEPxQ2xiiuUIJMuL
 LOb/iFJHfQyFpbQ/UBMcyQoEl2P2EKhq/vwtkBuORZOjQkPiO+2ZGnsKOD9Ad/V0
 HsvTZzuCS1j+cCAlipgb1LsyozmVTCM/o65CX0Uz08KPdZf9GCtgqwfA2myIC1oc
 hvyY9ju5f0xfJ84TaicpQ==
X-ME-Sender: <xms:BLpbY-irsQ9s4xl4zBkuImJQHmdIh86pKDT8CTyPlX29rrCFl2nqQQ>
 <xme:BLpbY_C97kDK14fVlYM0-ZxZmdAKnvEQpqDLmbYctA99zVSlGk-AoM5EfHbZ3HHgO
 8FkntEoLEDPyuLcYnc>
X-ME-Received: <xmr:BLpbY2HX7FRtEAvhRPbZkgGugjB28PpWiYcfB9TbmWpNKYBaIoAh8c_j6U2jFt1vl2khFg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvgedrtdeigdefjecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhvfevjghfuffkffggtgfgofesthekredtredtjeenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpeeifeeigeelhfehkeeltdetjeetueelteeuveekueevffduhefffefhhfeh
 gfehieenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 hmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:BbpbY3RGqOKQRUgg9n16EcaQGwr7cS5aHssMFbdFptGyeNuCE_us9w>
 <xmx:BbpbY7z7JXiAwAjh8bOkg6EjJK1HTKKeFTh3Toh5HEg8dN9SkAEXkg>
 <xmx:BbpbY16zjeLM1Bxhm689yl2VU6uG4AB0nzVTdcOzoqRpKbtasfiW3w>
 <xmx:BbpbYwKfO2nkniWxXwVW9c7NKmrOL-AoAuRhncqJhhD-GyTQELAtkw>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 28 Oct 2022 07:16:20 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, maxime@cerno.tech,
 Thomas Zimmermann <tzimmermann@suse.de>, 
 Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>
In-Reply-To: <20221021131339.2203291-1-maxime@cerno.tech>
References: <20221021131339.2203291-1-maxime@cerno.tech>
Subject: Re: [PATCH v2] drm/vc4: hdmi: Fix HSM clock too low on Pi4
Message-Id: <166695557425.323008.226168740312903260.b4-ty@cerno.tech>
Date: Fri, 28 Oct 2022 13:12:54 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.10.1
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
Cc: Javier Martinez Canillas <javierm@redhat.com>,
 dri-devel@lists.freedesktop.org, Peter Robinson <pbrobinson@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, 21 Oct 2022 15:13:39 +0200, maxime@cerno.tech wrote:
> Commit ae71ab585c81 ("drm/vc4: hdmi: Enforce the minimum rate at
> runtime_resume") reintroduced the call to clk_set_min_rate in an attempt
> to fix the boot without a monitor connected on the RaspberryPi3.
> 
> However, that introduced a regression breaking the display output
> entirely (black screen but no vblank timeout) on the Pi4.
> 
> [...]

Applied to drm/drm-misc (drm-misc-fixes).

Thanks!
Maxime
