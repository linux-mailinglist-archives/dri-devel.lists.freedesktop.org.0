Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CD39C12470D
	for <lists+dri-devel@lfdr.de>; Wed, 18 Dec 2019 13:39:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 078A46E332;
	Wed, 18 Dec 2019 12:39:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0E7E389D5C
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Dec 2019 08:50:55 +0000 (UTC)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.nyi.internal (Postfix) with ESMTP id 11B1B2226D;
 Wed, 18 Dec 2019 03:50:55 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute3.internal (MEProxy); Wed, 18 Dec 2019 03:50:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm1; bh=61X8RsHQ6EcABsEBMC0ORNRgE7k
 pSZ2Lgfyht6KUc/c=; b=NnqUQOUIzLPienFd2UfAtNd1PGcPFcf1vAtIjTHMfTm
 fNJ4OtsgwjwP0OEGsdjnjto3ynJGwUI2bJ3t7MVeIP5TWK3xVMzi3sp64shaQI/G
 7CLVE2z4nXz/hXmle3n5/Jf5E8oIkI4s6lEtr0qWlTPQY1mdsStoJSFdee6JzErh
 GUmY4A8kNh+Gc358cXJHvsgK1XVrWVTbgP3sGd2Apt55BCv1Z3lBWZtGGx8NqSTC
 wH3xxIV17ds8LZvM/yan7ZC4gYPBpy3yk131CGn65RyFpxwWwvyXr7aYMhrb0Zpa
 LFAA1gdz1FZJAshGuJmbQf5a0VSoOwiuDvsVkTsfpcw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=61X8Rs
 HQ6EcABsEBMC0ORNRgE7kpSZ2Lgfyht6KUc/c=; b=hE1MbfWTPexMYS+fl981oP
 XhjnDjTLq5/ckbPkrZeXDQ/Rf0248+k8jqw5/4vOgWyfTi0ixs3rnRIdjXupZWkU
 1e/p/yxwSvBsxumo+Pljln97f4iemNdzOwxC2GNungKIuX88qGLKAvdVtWeuaXzS
 EMRscJG7GkRkm/J1jwJwG1BXOf4r2cw7AvRdBaZDugMRq8UioRBgF0QpBd7Wgsdp
 VIKNxUSwleImVZJRfMSp8lesdORVcwDt5IA//Ibpc4FbH65S++qcc6fara7IgeXi
 9V2ANg7/J4mUVpWziQGt3Q/F/iXkf2LgppungbTHXWxkd3ZSEz+WfaIQh064fVaQ
 ==
X-ME-Sender: <xms:bej5XSM0CQAZvUUIygTF4i9YRMNnaSK1Qgci6r7aAEzswGSzb9Ru0A>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedufedrvddtkedguddviecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enucfjughrpeffhffvuffkfhggtggujgesthdtredttddtvdenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucfkpheple
 dtrdekledrieekrdejieenucfrrghrrghmpehmrghilhhfrhhomhepmhgrgihimhgvsegt
 vghrnhhordhtvggthhenucevlhhushhtvghrufhiiigvpedt
X-ME-Proxy: <xmx:bej5XRQFU5WkuKmO5oMNJY03BfhDDKsIV619yRaVoKS6fIcDCTTNmw>
 <xmx:bej5XUtCJRuGR1hzUHWtW5HOII1DvNXRcMpqDbp3W2EKlkLjhdCTZA>
 <xmx:bej5XdLFuw2COBFGafQYgKfmUY62cZjJzAP5pWC6gUIl4IOdxFHcpA>
 <xmx:b-j5XYZ05xI3R5mCmIDNHJfH47_itId8YtG5dXsOvEQo37Yzls1yuA>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76])
 by mail.messagingengine.com (Postfix) with ESMTPA id EFBEF8005A;
 Wed, 18 Dec 2019 03:50:52 -0500 (EST)
Date: Wed, 18 Dec 2019 09:50:50 +0100
From: Maxime Ripard <maxime@cerno.tech>
To: Heiko Stuebner <heiko@sntech.de>
Subject: Re: [PATCH v4 2/3] dt-bindings: display: panel: Add binding document
 for Xinpeng XPP055C272
Message-ID: <20191218085050.bjlpbavxwua4copu@gilmour.lan>
References: <20191217222906.19943-1-heiko@sntech.de>
 <20191217222906.19943-2-heiko@sntech.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191217222906.19943-2-heiko@sntech.de>
X-Mailman-Approved-At: Wed, 18 Dec 2019 12:38:50 +0000
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
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org,
 Heiko Stuebner <heiko.stuebner@theobroma-systems.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 robh+dt@kernel.org, thierry.reding@gmail.com, sam@ravnborg.org,
 christoph.muellner@theobroma-systems.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Dec 17, 2019 at 11:29:05PM +0100, Heiko Stuebner wrote:
> From: Heiko Stuebner <heiko.stuebner@theobroma-systems.com>
>
> The XPP055C272 is a 5.5" 720x1280 DSI display.
>
> changes in v4:
> - fix id (Maxime)
> - drop port (Maxime)
> changes in v2:
> - add size info into binding title (Sam)
> - add more required properties (Sam)
>
> Signed-off-by: Heiko Stuebner <heiko.stuebner@theobroma-systems.com>
> Reviewed-by: Sam Ravnborg <sam@ravnborg.org>

Acked-by: Maxime Ripard <mripard@kernel.org>

Thanks!
Maxime
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
