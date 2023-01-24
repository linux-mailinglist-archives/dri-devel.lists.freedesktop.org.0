Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 58436679FBE
	for <lists+dri-devel@lfdr.de>; Tue, 24 Jan 2023 18:07:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4DB2F10E6E4;
	Tue, 24 Jan 2023 17:07:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com
 [66.111.4.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C4E9510E6E7
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Jan 2023 17:06:54 +0000 (UTC)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.nyi.internal (Postfix) with ESMTP id DFD8C5C030C;
 Tue, 24 Jan 2023 12:06:53 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute3.internal (MEProxy); Tue, 24 Jan 2023 12:06:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm1; t=1674580013; x=
 1674666413; bh=YtX0AywM+WbMQVqKSAFHmwvjTwXS2Ip8eGMj6mruLJk=; b=Y
 DOGsOq1zncdqkjXr8jVSjyqZXVnkQ9UGx2V/F8vQc2VEs/8nMzA0ea3DAys4wHG2
 XCI9uH+olWFj59VwjpkaCGRUq3rppZollcb3qAAFC0DDDdqKiGRryfSoQnNvcJCk
 3FvCXA1UfHSk5aB89KdyGveOMTlzhEldr95/sa/iq9AVEsKadYY7WE/qTqIRNyRO
 XblrbjdLuUvFYKVF84qJfdCTIWDsSmCrC66OLeFeBFtYyMj5iBlqyZIOqV3Uhkyj
 RCfYLHcdrg+v/lCybNPeE79N7mJqu5JYSvMoA0DckSpctxYKmo3c7UYONwFQZvBc
 3brdKljWeBUtdKH/dlT4g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1674580013; x=
 1674666413; bh=YtX0AywM+WbMQVqKSAFHmwvjTwXS2Ip8eGMj6mruLJk=; b=m
 /dvJklh3HAi3RJhm3deKbLM4RlyAX4dXGHM5Z+AT/7qldOUhzdRDlcpzCdHACowN
 En+5uPbfDe21xL1TW0F/GyEJwsR52GqecS+2yyVCSt2TDhKRCUYXIxakfc+uD7Fg
 FL41jUqNp/CJewCWVS5d4Yb0x8BvkY8DxSj9j3/2vclSFMX2MH8+Cyt9cWpAYhkW
 OsbeXYd8O9QJPtQSUSV5B0cuV6qxakmiJ70OjQrraaKLwXAhL8mhj77nJkAv5F1y
 ZX62cr3alXxQtFDT1Qeyf9LlQ2pLjw0yGUqzXJk1UCFr1SPAKASs1ESbR4YcPZs0
 OZTkJWd52lDZS74buXYtA==
X-ME-Sender: <xms:LRDQY2eu-IsjARj9N5aRkjHO_x53v2TAat5Scv1upJFoNPjuZSUA0g>
 <xme:LRDQYwPofGbdtA-NpR7cWvxhO-Jf10BOXz39K_Mv60emz8g9AJYZdLodY5-pecfWa
 Dw47az262EtztJcn1I>
X-ME-Received: <xmr:LRDQY3jTxU8ys2qY2PXk0mRi0N-AtVMi0gCak1f8oHqnIAEUvito1nKVANSUDywebV1qvA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedruddvtddgleefucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvfevuffkfhggtggugfgjsehtqhertddttddvnecuhfhrohhmpeforgig
 ihhmvgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrf
 grthhtvghrnheptefgleeggfegkeekgffgleduieduffejffegveevkeejudektdduueet
 feetfefgnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomh
 epmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:LRDQYz9GvPqLcbkDgBCnJtUvjwOaGkMyboE9v-tvYIbemaLmNYzAyw>
 <xmx:LRDQYytHnomW2gssmzU3f02aabNLgMl6R4wC8Pd6xeytz5yAoxF0wQ>
 <xmx:LRDQY6GL3zKP9wk_fBZ76EYX1nio7xHUXvl_UAyePfJzadb98kDNfA>
 <xmx:LRDQYy5BBgNxq3w8koMIfLfjtgbbwAoB1k8SyRVty8mgHmsbYqlKpQ>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 24 Jan 2023 12:06:52 -0500 (EST)
Date: Tue, 24 Jan 2023 18:06:51 +0100
From: Maxime Ripard <maxime@cerno.tech>
To: Chris Morgan <macroalpha82@gmail.com>
Subject: Re: [PATCH V12 1/4] drm: of: Add drm_of_get_dsi_bus helper function
Message-ID: <20230124170651.z7mam6lherlsony6@houat>
References: <20230123154603.1315112-1-macroalpha82@gmail.com>
 <20230123154603.1315112-2-macroalpha82@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20230123154603.1315112-2-macroalpha82@gmail.com>
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
Cc: devicetree@vger.kernel.org, Chris Morgan <macromorgan@hotmail.com>,
 krzysztof.kozlowski+dt@linaro.org, sam@ravnborg.org,
 dri-devel@lists.freedesktop.org, linux-rockchip@lists.infradead.org,
 robh+dt@kernel.org, thierry.reding@gmail.com, tzimmermann@suse.de,
 Maya Matuszczyk <maccraft123mc@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Jan 23, 2023 at 09:46:00AM -0600, Chris Morgan wrote:
> From: Chris Morgan <macromorgan@hotmail.com>
>=20
> Add helper function to find DSI host for devices where DSI panel is not
> a minor of a DSI bus (such as the Samsung AMS495QA01 panel or the
> official Raspberry Pi touchscreen display).
>=20
> Co-developed-by: Maya Matuszczyk <maccraft123mc@gmail.com>
> Signed-off-by: Maya Matuszczyk <maccraft123mc@gmail.com>
> Signed-off-by: Chris Morgan <macromorgan@hotmail.com>

Reviewed-by: Maxime Ripard <maxime@cerno.tech>

Maxime
