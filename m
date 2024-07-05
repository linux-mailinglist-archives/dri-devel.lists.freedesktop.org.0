Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C65889283E3
	for <lists+dri-devel@lfdr.de>; Fri,  5 Jul 2024 10:42:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4B00B10E13B;
	Fri,  5 Jul 2024 08:42:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=testtoast.com header.i=@testtoast.com header.b="7a36SZQp";
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.b="fOORByrO";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fhigh7-smtp.messagingengine.com
 (fhigh7-smtp.messagingengine.com [103.168.172.158])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 89CAD10E13B
 for <dri-devel@lists.freedesktop.org>; Fri,  5 Jul 2024 08:42:19 +0000 (UTC)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailfhigh.nyi.internal (Postfix) with ESMTP id E80E4114009A;
 Fri,  5 Jul 2024 04:42:18 -0400 (EDT)
Received: from imap47 ([10.202.2.97])
 by compute5.internal (MEProxy); Fri, 05 Jul 2024 04:42:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=testtoast.com;
 h=cc:cc:content-type:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:subject:subject:to:to; s=fm2; t=1720168938; x=
 1720255338; bh=ZHz2NRDW/PQpb9LDnMtin8S3gOU/tY5jqNZoRPgSMVA=; b=7
 a36SZQpxtfUcYN4Zo6FrQx/dcGwN2cEOe0l8yFwW5bOjsb3IFteEygihPEIkQnJh
 xLUE+Z6oRCOah2wlv6bVb3xN3BQc4GLqpXdh/kuFxp4lP5BDZc7yFEtOz8ED7WfX
 0c2YFXr0XTe1JRvI8/RLRHuVlWrg6RJdUlxWHa4WGafo00gJu5mtEAvS7DwsyfjB
 YJToyzpRaPaxkVj+SY373UqOneTOGraUPpXekNDq3plue4XBn3dQSdjk3U1r4UVd
 L+nkzO4Pd1m65N/k3eRjs8S+sKUQvh/zUEryUbom01i/aESFrYLTRiR8GMdGq/ss
 NLff2VOvs1rbPG/Q+oR8A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:content-type:date:date
 :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:subject:subject:to
 :to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; t=1720168938; x=1720255338; bh=ZHz2NRDW/PQpb9LDnMtin8S3gOU/
 tY5jqNZoRPgSMVA=; b=fOORByrObrFDRwZGQdwuk/JrF70SahTy6ojAZnz3lu8z
 5+ICmKp9gGa1drSDx4y5znkukEZBtA6/o4dvsMvgBv0ZBULs/2VutWwbn52xSZ1E
 Fy9lbzDej9+l80yAtbZpy/wqGOnGa3w+6gJj0fPzrnW0uTbIvrRc6eeD383mecF0
 t/0Y2rA9eLoFrkspU6Of9hu0pK9JX9IDnDolfDofn6BbFRziDQGA9eWpsXd3VboF
 B5bfcwhJhkq0LuPvNl1ACbtqLhq4v4ALuZjrJbhDqLE4Ph6s/lmmZLGHlixgrJ0Z
 yAWb9cHIAA1C/zAIR1ocXipnbwF5aEFxfOVpTWKYag==
X-ME-Sender: <xms:6rGHZuEMknt7Jh_6V5McMc9VV4ltDr-jOhxcQppB7YErgMrhojiEOA>
 <xme:6rGHZvW9IxptNqqqXLGXeLRoC_rUZ9VuVviNBEhRE0ZCFoiCIREpHH85Z0ohmFe2w
 gHb_3WEsaTN9bdTVQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeftddrvddugddtjecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefofgggkfgjfhffhffvvefutgesthdtredtreertdenucfhrhhomhepfdfthigr
 nhcuhggrlhhklhhinhdfuceorhihrghnsehtvghsthhtohgrshhtrdgtohhmqeenucggtf
 frrghtthgvrhhnpeehvdevieegudejueefgeffhefhffevudfhieejgfdtffetlefgteeu
 veeiudeijeenucevlhhushhtvghrufhiiigvpedunecurfgrrhgrmhepmhgrihhlfhhroh
 hmpehrhigrnhesthgvshhtthhorghsthdrtghomh
X-ME-Proxy: <xmx:6rGHZoJXHsneANVJ5imNt4t-71pMGPBW58iYo_s13F61SnQd7kcDeQ>
 <xmx:6rGHZoF6RZHn4_Id0JgDyCL1s2YKbSXc89NFM9AoEpI5hpib7B93eQ>
 <xmx:6rGHZkXT1E-cfealDH4kEz5Y2DueKM6xFWFnoE1TTIiRqB0tMvOUWQ>
 <xmx:6rGHZrOO8E3ytvILeuwaHKkW93K2ruYXwrZpwhYVArtnfa6q9Qgg3A>
 <xmx:6rGHZpXYvFKY9B9ow9_f9AC2gyRxQo1KYbF4DmB5Aw63lCAK-gC1dDXU>
Feedback-ID: idc0145fc:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id 80574A60078; Fri,  5 Jul 2024 04:42:18 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.11.0-alpha0-566-g3812ddbbc-fm-20240627.001-g3812ddbb
MIME-Version: 1.0
Message-Id: <16bbd1a1-4bc2-4769-9ff4-91b29973580f@app.fastmail.com>
In-Reply-To: <20240703-cataract-suitor-f930bcc83aa8@spud>
References: <20240703103710.31169-1-ryan@testtoast.com>
 <20240703103710.31169-4-ryan@testtoast.com>
 <20240703-cataract-suitor-f930bcc83aa8@spud>
Date: Fri, 05 Jul 2024 20:41:53 +1200
From: "Ryan Walklin" <ryan@testtoast.com>
To: "Conor Dooley" <conor@kernel.org>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 "Neil Armstrong" <neil.armstrong@linaro.org>,
 "Jessica Zhang" <quic_jesszhan@quicinc.com>,
 "Sam Ravnborg" <sam@ravnborg.org>, "David Airlie" <airlied@gmail.com>,
 "Daniel Vetter" <daniel@ffwll.ch>,
 "Maarten Lankhorst" <maarten.lankhorst@linux.intel.com>,
 "Maxime Ripard" <mripard@kernel.org>,
 "Thomas Zimmermann" <tzimmermann@suse.de>, "Rob Herring" <robh@kernel.org>,
 "Krzysztof Kozlowski" <krzk+dt@kernel.org>,
 "Conor Dooley" <conor+dt@kernel.org>,
 "Hironori KIKUCHI" <kikuchan98@gmail.com>,
 "Chris Morgan" <macroalpha82@gmail.com>
Subject: Re: [PATCH v2 3/3] dt-bindings: display: panel: correct Anbernic
 RG35XX panel example
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 4 Jul 2024, at 3:38 AM, Conor Dooley wrote:
> I forgot to reply to, or somehow didn't notice your reply to my comments
> on this patch. I would just drop this change as I think it's a tooling
> issue. I checked the version of dt-schema etc that I have here locally
> and there were no complaints with the binding prior to your patches.
>
> Sorry for missing your reply,
> Conor.
>
Thanks Conor, no worries. Happy to resend without this patch in that case, or just have it dropped.

Regards,

Ryan
