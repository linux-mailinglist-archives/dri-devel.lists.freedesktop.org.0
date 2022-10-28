Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 68938610F75
	for <lists+dri-devel@lfdr.de>; Fri, 28 Oct 2022 13:16:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EEB0F10E7E9;
	Fri, 28 Oct 2022 11:16:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out3-smtp.messagingengine.com (out3-smtp.messagingengine.com
 [66.111.4.27])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 27AFC10E102
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Oct 2022 11:16:20 +0000 (UTC)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.nyi.internal (Postfix) with ESMTP id 4B3095C00A0;
 Fri, 28 Oct 2022 07:16:19 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute5.internal (MEProxy); Fri, 28 Oct 2022 07:16:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm3; t=1666955779; x=
 1667042179; bh=S4nrmRrN9LLovFQ0GCifKoKEy95gaDLojXGam5IIJtY=; b=h
 S+ItV/7rV4AGoG7wF2D5c1YLlMf9I8lpOJEQPUW+waaKjRJU1y7zdjyElHPC39TY
 5e/PYEm5NPm0GqnM2u3XMpft/SXLt5nOwn3qWsheGw7DRTcyjitbe9QdiMnKOMTG
 /UPadgHVM68wY6Wif3af+te6VbCTh3qRGEctZdbssNgBxahH5QFEHIjZxnkW9zOj
 nvFpLloZL1BD8ed9QOG5eLIUvaDNDUgYF01XnuWOAWh9b+YE/2g22L/ZWU4R7BVv
 AJBvC5sLzoghhOIO/tIs6jRTQFyhRoPvP+8jr+pqJ3gBIBqzmexkgI8y2inibdnX
 9xl3BHmPqRTHnAu778IdQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1666955779; x=
 1667042179; bh=S4nrmRrN9LLovFQ0GCifKoKEy95gaDLojXGam5IIJtY=; b=c
 JAPSZA8Hjr4U46dI2mw5EF/QPjD8t0dKbODIMKVKHJuRrv/rf2K9y4NOuxuzoTIr
 PoLaku5vghix70vggD06s2Zz0vI8DBvp5RFqcfi0+WmtCfohA5eLEqN0RIaVMl5A
 gfYDL/6nLQ/jsQ2sESyZrhVTLlsLJfxrmHOZcADuAbHVhHpRnVKrMASG2UicRtGS
 DXpmb88kv31sL1c/GG5tvnjtaUfEt3wHZcANuYQEtzIcVnOL9ctc74lwcKU1U+32
 XiEhApJNDBBsqNiHKGs2zA9A7KZcECjHIxGP0AnNlUGKej4U8r0U/F/yVxWW2Kc5
 h222VYLyV6MWY/RmLLbWA==
X-ME-Sender: <xms:ArpbY4kP6SDvS6yKyskuXofgdL_HPLFtV65ZzcEctnydkhUOYmuoTw>
 <xme:ArpbY33Pcs9HgVtIkba_t9PAUr6o3feVl9mLvO4OVTDxEssxZ8_Q7-zkl0NdNpi_n
 _LfroPsJ9moAG9yPJk>
X-ME-Received: <xmr:ArpbY2r-6B7R3Bf0-LMgtwancz6RINxCwOi_ld9n0YEPHu4-nar6vQU6lPicSxrh4UrpGQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvgedrtdeigdefiecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhvfevjghfuffkffggtgfgofesthekredtredtjeenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpeeifeeigeelhfehkeeltdetjeetueelteeuveekueevffduhefffefhhfeh
 gfehieenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 hmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:ArpbY0n7Yjhf5b2X2OEKcXtVLJeJXApGi6uxJaA8uozjLqvu2Jv2tg>
 <xmx:ArpbY21YeCHp_c7UpvOuRbF69la2XF2rlD16MosVZFFcDdOmY0hhUg>
 <xmx:ArpbY7swEutoeRjo8TugiNtpbl2exxAv4sRpfd3-rY-7kukf_kKaPg>
 <xmx:A7pbY9u1bvqW-kDQKlI4QFRktnjRF9v1q4RXzWM1_V0GDAXBQ2Jhnw>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 28 Oct 2022 07:16:18 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, maxime@cerno.tech,
 Thomas Zimmermann <tzimmermann@suse.de>, 
 Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>
In-Reply-To: <20221024093634.118190-1-maxime@cerno.tech>
References: <20221024093634.118190-1-maxime@cerno.tech>
Subject: Re: [PATCH 1/2] drm/vc4: hdmi: Take our lock to reset the link
Message-Id: <166695556785.323008.13066938330885584758.b4-ty@cerno.tech>
Date: Fri, 28 Oct 2022 13:12:47 +0200
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
Cc: Tim Gover <tim.gover@raspberrypi.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 Phil Elwell <phil@raspberrypi.com>, dri-devel@lists.freedesktop.org,
 Dom Cobley <dom@raspberrypi.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, 24 Oct 2022 11:36:33 +0200, maxime@cerno.tech wrote:
> We access some fields protected by our internal mutex in
> vc4_hdmi_reset_link() (saved_adjusted_mode, output_bpc, output_format)
> and are calling functions that need to have that lock taken
> (vc4_hdmi_supports_scrambling()).
> 
> However, the current code doesn't lock that mutex. Let's make sure it
> does.
> 
> [...]

Applied to drm/drm-misc (drm-misc-fixes).

Thanks!
Maxime
