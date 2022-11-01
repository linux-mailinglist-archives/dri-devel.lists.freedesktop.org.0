Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 33FE4614275
	for <lists+dri-devel@lfdr.de>; Tue,  1 Nov 2022 01:59:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BC2F889EAC;
	Tue,  1 Nov 2022 00:59:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7C97689EAC
 for <dri-devel@lists.freedesktop.org>; Tue,  1 Nov 2022 00:59:51 +0000 (UTC)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.nyi.internal (Postfix) with ESMTP id B19965C0134;
 Mon, 31 Oct 2022 20:59:50 -0400 (EDT)
Received: from imap43 ([10.202.2.93])
 by compute3.internal (MEProxy); Mon, 31 Oct 2022 20:59:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=maxfierke.com;
 h=cc:cc:content-type:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm3; t=1667264390; x=1667350790; bh=/T
 yw2zeLdHb2+Dw5oK5UkZVpNiwdVxrfWV3SYy8GWLU=; b=oW61/4/ucjPrJA26Ib
 wMk7qNewaQZ33kSOGel0yWPIUBFMi/hOxK/A1aKopMpn4a6D5YKKm8gFjCJD98Qw
 0rSmRVVjaanH1Pl3rs5fP/BRBcxtewSYKx4oMpWXM1iliBtwttIlj0hH0bTaslsa
 I9EPkC+iWJGHBwou8M9AF/SKkYripqnXCP3ts4ceXma9RviyE+8xZEG8lLoZeYYM
 y63eZ2KVjKp6w/QI7NwIzy00ckGN/FtXE9XKq/fU0Kkryu9t7uf1pY8DHunil7yK
 dv3vUyZD7hMkzohgqhGRIsqcA596eUv8dN/FjcAxxvmIiodYFmp7E7YnwHvRyFuw
 J+MQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
 :feedback-id:from:from:in-reply-to:in-reply-to:message-id
 :mime-version:references:reply-to:sender:subject:subject:to:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm3; t=1667264390; x=1667350790; bh=/Tyw2zeLdHb2+Dw5oK5UkZVpNiwd
 VxrfWV3SYy8GWLU=; b=Zuz4i4i897MG6ZZjrh9u56tpaxyaVDiDvS6cVSzs0qkN
 KQ9OIEN/m9hpCkqPxCk2A4qPIQQAdBMKCP/2QBGp9m+Vr1QI4ohJMrmLOFykneuz
 5ElOxOW8U6llgsQMIw9JTe8rbY1wYd+MmzJ4nothufYCAEi/3zidP5nw6B100STl
 C7zqxOEWfST6bgl2inIoReJWGgSBMd5oeWPv2MBAC50zQvDdFn3mzjBv3eT+9UC8
 3zEbtw/8UYqm1FP/maV+7VlrscPf2w06tkEItdsb41Yie1KMflWHibGso0iQQUom
 Lz2YLTWbunWTySEFjNbEn9k0kg0CHxUYnSRel/0hNQ==
X-ME-Sender: <xms:hm9gY3N76yfdUFK31PMFEc4_fFWbYptVosa4NpjgCiGl_uHHU0q1ug>
 <xme:hm9gYx_-JmD4xI-VnJEE-5M3QGagFHEE1j1cDzyuUphsMMmvTGkNqnM3x2F1h5Hh8
 NUamx6JhTN3hdGdU60>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvgedrudeggddvlecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefofgggkfgjfhffhffvvefutgesthdtredtreertdenucfhrhhomhepfdforgig
 ucfhihgvrhhkvgdfuceomhgrgiesmhgrgihfihgvrhhkvgdrtghomheqnecuggftrfgrth
 htvghrnhepfffgieefueefjeeutdevgfeijeetvdfgfeekjefgfedtvdekleduueetgedt
 tefgnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepmh
 grgiesmhgrgihfihgvrhhkvgdrtghomh
X-ME-Proxy: <xmx:hm9gY2Rl3hZqVcodjeHqK7kAptvWfjptBiWCsYEycmXx-LpdkBnwyg>
 <xmx:hm9gY7tv3ADGKOpPSFSXCIKLCBstjl0rHM_aYX1b6fv66uOmx8dQcA>
 <xmx:hm9gY_dY5dBohUb8gPMHXr-s4auy_gU5krqgRJ0Skh7K6eZgmBBSkg>
 <xmx:hm9gY91d1phpyjrFtoyUs_ZLb0F89jrTu1aLDk8DJ5f1CplsBjGN6g>
Feedback-ID: idee9475d:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id 322BE2D40071; Mon, 31 Oct 2022 20:59:50 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.7.0-alpha0-1087-g968661d8e1-fm-20221021.001-g968661d8
Mime-Version: 1.0
Message-Id: <5efcce2b-4534-4777-8daa-d1ff2b6bb1c7@app.fastmail.com>
In-Reply-To: <f09812a7-5d7e-f8f8-aba4-7645810a8c52@sholland.org>
References: <20220918034415.74641-1-max@maxfierke.com>
 <20220918034415.74641-2-max@maxfierke.com>
 <f09812a7-5d7e-f8f8-aba4-7645810a8c52@sholland.org>
Date: Mon, 31 Oct 2022 19:59:07 -0500
From: "Max Fierke" <max@maxfierke.com>
To: "Samuel Holland" <samuel@sholland.org>
Subject: Re: [PATCH v3 1/4] dt-bindings: vendor-prefixes: Add prefix for
 ClockworkPi
Content-Type: text/plain
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
Cc: devicetree@vger.kernel.org, krzysztof.kozlowski+dt@linaro.org,
 airlied@linux.ie, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, robh+dt@kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, thierry.reding@gmail.com,
 Sam Ravnborg <sam@ravnborg.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sat, Oct 29, 2022, at 1:17 PM, Samuel Holland wrote:
> Hi Max,
>
> The vendor uses "clockwork" as the prefix in their downstream
> devicetrees[1][2][3], so I would suggest using the same here. I think
> there is a distinction between "Clockwork" the company and "ClockworkPi"
> the product. This is what I did for the board devicetree I sent[4].
>
> Regards,
> Samuel
>

Hi Samuel,

Ah yes, I struggled a bit with the distinction because the company itself
seems to be a bit inconsistent here.

I will follow your lead and post a v4 follow-up with that vendor prefix
changed.

Glad to see someone else working on support for this hardware!

Thanks,
Max
