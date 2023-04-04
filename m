Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D01A6D5A4B
	for <lists+dri-devel@lfdr.de>; Tue,  4 Apr 2023 10:06:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1036F10E607;
	Tue,  4 Apr 2023 08:06:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new2-smtp.messagingengine.com (new2-smtp.messagingengine.com
 [66.111.4.224])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2909410E607
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Apr 2023 08:06:20 +0000 (UTC)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailnew.nyi.internal (Postfix) with ESMTP id 0B063581E42;
 Tue,  4 Apr 2023 04:06:18 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute2.internal (MEProxy); Tue, 04 Apr 2023 04:06:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:content-type:content-type:date
 :date:from:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:reply-to:sender:subject:subject:to:to; s=fm3; t=
 1680595577; x=1680602777; bh=wvCuyZAuwEh94yyPjnRpCKIdQGJiyQn4/4B
 DEJQFbU0=; b=AtkH6rvUj5U5huHejp3uB3Zz5g/hfaZcg4lsnDaWzOdc/s6GMft
 NwOliXjFRM9vVv/5coyHFJSjD5zmTN/T37LeiJs0b2AZvqX/rt4tsMCrt/N/mUKn
 zRYtB4SI2VlvljEIKLsNOMgFgM6qyxGJDGJPN0945PL9ga3Ca/7lyRfVSG32mbeN
 LyeAFhMO7GP0Qj/HN/9Vez66bmAZNzuq0Q4iE8Wh1SaaaCaGIyR1YfW+Wuoivgzr
 /K48Uzq20/2G8SU91+mJb7xFLPNS7sY1U+r9OYBjgGGCWyxVevi31hiFgyJ3JIeS
 0XXwam1+YzQ9WmyBH56dK3lhq0DPrrvXMzg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:content-type:date:date:feedback-id:feedback-id
 :from:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:reply-to:sender:subject:subject:to:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=
 1680595577; x=1680602777; bh=wvCuyZAuwEh94yyPjnRpCKIdQGJiyQn4/4B
 DEJQFbU0=; b=UaMS3EDcjVFS4oxlGIxcvqHEj0KmZmkMx1ngoKgbdfNCdsqPX+l
 iqLDWwLjLB0rpf+Ve7rB2O4d4xQicHN2vw6D+Q7JB4R2qBHP3aWVEYjXwJZT4nG6
 Q9tEMq3jw28REojZB3Vhj7GSZ3b4x8ItQlK9nxgs77UR+uiXU1jWjH0XPom35e9e
 7JjotqVoOu5S7nndrLkQ9/28cmv95coqNcScMuksL7V8NuS/li3XMoRCdAspyM/2
 hnhiWenn5ndLvQh4BHZZiq5zTucX1DhUayFte6tbFRfJAD799vNFlnFT8jkcxZN0
 FRy2ZIekTz5ZU6GGZYXol2pqjVipgsKy7Hg==
X-ME-Sender: <xms:edorZHIIqODZo1ouiFGUdwEfH5urh1EIj0JkdajfjuRlvdvRs039SQ>
 <xme:edorZLIgMIyLPRMpb66mIZt06QdaBBMEuuNbk0r_DDNIBz0HcQD1V61hjniM3zcQF
 HhreuYgxcKdovAMXEA>
X-ME-Received: <xmr:edorZPsvVmVs6jpuUnK5ghI97GyKWkpiB0SO0kXc_7VImZXehAfR201wB8M0zovQsenzlIc6mmnxCd16rbn0ztyMNt1I5gE>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrvdeikedgudduvdcutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enucfjughrpeffhffvvefukfhfgggtugfgjgesthhqredttddtudenucfhrhhomhepofgr
 gihimhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtf
 frrghtthgvrhhnpeelleefieelleetteefvdeikeeffeffvefhtdevgfehveduveehjedv
 vdeiledtieenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhroh
 hmpehmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:edorZAZcFb_guoENutFxYld2KfQ381xhFJ-Z-w0jCc_rcxw-HlztJQ>
 <xmx:edorZOZWkdIO5ImT_hOE3FG8G4LsDz_sZ6DCxNM2E5KgFcP0ncmQ6g>
 <xmx:edorZEBA40wmGZl3MFznaF1dW2twdxRLJ1IHsvCRgI9ZIBTCKhhM1A>
 <xmx:edorZLJD1KYskIfRNoT51A9Zhc-Mk2yGgI6jyzWZrXY3Q9hLaZiJKw>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 4 Apr 2023 04:06:16 -0400 (EDT)
Date: Tue, 4 Apr 2023 10:06:14 +0200
From: Maxime Ripard <maxime@cerno.tech>
To: Ville Syrjala <ville.syrjala@linux.intel.com>
Subject: Re: [PATCH v2] drm/scdc-helper: Pimp SCDC debugs
Message-ID: <20230404080614.zhfm5cq5uzx26ha5@houat>
References: <20230329171402.2772-1-ville.syrjala@linux.intel.com>
 <20230403223652.18848-1-ville.syrjala@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20230403223652.18848-1-ville.syrjala@linux.intel.com>
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
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Robert Foss <rfoss@kernel.org>,
 Emma Anholt <emma@anholt.net>, Jonas Karlman <jonas@kwiboo.se>,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Thierry Reding <thierry.reding@gmail.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, linux-tegra@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Apr 04, 2023 at 01:36:52AM +0300, Ville Syrjala wrote:
> From: Ville Syrj=E4l=E4 <ville.syrjala@linux.intel.com>
>=20
> Include the device and connector information in the SCDC
> debugs. Makes it easier to figure out who did what.
>=20
> v2: Rely on connector->ddc (Maxime)
>=20
> Cc: Andrzej Hajda <andrzej.hajda@intel.com>
> Cc: Neil Armstrong <neil.armstrong@linaro.org>
> Cc: Robert Foss <rfoss@kernel.org>
> Cc: Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
> Cc: Jonas Karlman <jonas@kwiboo.se>
> Cc: Jernej Skrabec <jernej.skrabec@gmail.com>
> Cc: Thierry Reding <thierry.reding@gmail.com>
> Cc: Emma Anholt <emma@anholt.net>
> Cc: Maxime Ripard <mripard@kernel.org>
> Cc: intel-gfx@lists.freedesktop.org
> Cc: linux-tegra@vger.kernel.org
> Signed-off-by: Ville Syrj=E4l=E4 <ville.syrjala@linux.intel.com>

Acked-by: Maxime Ripard <maxime@cerno.tech>

Thanks!
Maxime
