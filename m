Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 52565969119
	for <lists+dri-devel@lfdr.de>; Tue,  3 Sep 2024 03:53:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 19F1910E136;
	Tue,  3 Sep 2024 01:53:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=testtoast.com header.i=@testtoast.com header.b="Z9mXTYKS";
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.b="tBNgqY6m";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fhigh2-smtp.messagingengine.com
 (fhigh2-smtp.messagingengine.com [103.168.172.153])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2EDBC10E136
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Sep 2024 01:53:02 +0000 (UTC)
Received: from phl-compute-02.internal (phl-compute-02.nyi.internal
 [10.202.2.42])
 by mailfhigh.nyi.internal (Postfix) with ESMTP id 492831140187;
 Mon,  2 Sep 2024 21:53:01 -0400 (EDT)
Received: from phl-imap-07 ([10.202.2.97])
 by phl-compute-02.internal (MEProxy); Mon, 02 Sep 2024 21:53:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=testtoast.com;
 h=cc:cc:content-transfer-encoding:content-type:content-type
 :date:date:from:from:in-reply-to:in-reply-to:message-id
 :mime-version:references:reply-to:subject:subject:to:to; s=fm1;
 t=1725328381; x=1725414781; bh=eDbi4gWSWJjjOV7pKTumnIfA9DfLYr7+
 Xf9PEudOE90=; b=Z9mXTYKSJMM0Ru0OoAhiZ+v8EKlo81YHrN6sFEgwhQZtt3Si
 ISW6nOaeF/YtLojwW69YmQL9+VdzqzjthYPvnEbdeYTN//XqvLMVtNsazWH+Gtrf
 EFRSjLWgHXe42alK8rbSsqbiM1fTYnYOetfI/5p0EXS8zkTYYToHkDZnbpIt1XYT
 5i1MW69C1otTVI0M+SFQeC7JCYfGLxtgsqNq1Wdcw7BQiVcgHYmJrIHdf3OiuPvb
 PGCoojYyzS37C2nFPJb0OVMaCpNJcIPWxwX+UweXc3ASqrNQs2Dy/sN8W/dAwS/P
 nWh+PgVp1CCPNP3n9VfgDAmP5ynBtfTYyhS/3g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:content-type:date:date:feedback-id:feedback-id
 :from:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1725328381; x=
 1725414781; bh=eDbi4gWSWJjjOV7pKTumnIfA9DfLYr7+Xf9PEudOE90=; b=t
 BNgqY6mamGsbVwkySJH0MRBfm6ValSEAwSn3rP7+R2IC2aafzRhAovQXomCtOl4m
 kFPtzSMvIuAu16zbTEZB+N1J2O22XoJFbOav0ii+HSS9tW01z4jMPKNRNwJsPfaZ
 yKCSJ2WM+AedgZCyxYIc+Yd1rpZTzQIVhFmzreLxZEH9JDj0MVMxxdT3V92aavF0
 QqhTMgRvOtCbxG0HchdQu6qc8R66xK/HQtrEr45892J6TSWl72lx509M0PqwPi8Y
 Sl6idqNcMnp/PZpGTJ46Tohb7IE/L7krZLy/WdRZf8zjAvVfZTThrot9oLDlBWKp
 kBjv2YjS079zpyjnuFqSw==
X-ME-Sender: <xms:_GvWZuL-sC5I_dI5MqbAEIiGFhHeRuM2kC7HvoX4tpPy51u5iG1X4g>
 <xme:_GvWZmKuqSKmY_8jyrQXr-nu7fGVCPBChz3F0buP058D6l-8p6zwoiNd3euk8Ij_e
 mHuNxYJkndQjgwlhQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeftddrudehgedgheefucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggvpdfu
 rfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnh
 htshculddquddttddmnecujfgurhepofggfffhvfevkfgjfhfutgfgsehtjeertdertddt
 necuhfhrohhmpedftfihrghnucghrghlkhhlihhnfdcuoehrhigrnhesthgvshhtthhorg
 hsthdrtghomheqnecuggftrfgrthhtvghrnhepjefhueekjeejgfduvdffheevveejhfdt
 uddthfduuddvveefjeffgfdvleefuefgnecuvehluhhsthgvrhfuihiivgeptdenucfrrg
 hrrghmpehmrghilhhfrhhomheprhihrghnsehtvghsthhtohgrshhtrdgtohhmpdhnsggp
 rhgtphhtthhopeduiedpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtohepuggrnhhivg
 hlsehffhiflhhlrdgthhdprhgtphhtthhopegrihhrlhhivggusehgmhgrihhlrdgtohhm
 pdhrtghpthhtohepkhhikhhutghhrghnleeksehgmhgrihhlrdgtohhmpdhrtghpthhtoh
 epmhgrtghrohgrlhhphhgrkedvsehgmhgrihhlrdgtohhmpdhrtghpthhtoheptghonhho
 rhdoughtsehkvghrnhgvlhdrohhrghdprhgtphhtthhopegtohhnohhrsehkvghrnhgvlh
 drohhrghdprhgtphhtthhopehkrhiikhdoughtsehkvghrnhgvlhdrohhrghdprhgtphht
 thhopehmrhhiphgrrhgusehkvghrnhgvlhdrohhrghdprhgtphhtthhopehrohgshheskh
 gvrhhnvghlrdhorhhg
X-ME-Proxy: <xmx:_GvWZuujo-rHBHGdOjBmE3Cd-C_9JA83yBHsgJTPWj54n4BY6fcBPg>
 <xmx:_GvWZjZZeRgoWYnCtnSO7SWEUCjEW16x8IBr7AJIxfAmqUGkQ8J8Uw>
 <xmx:_GvWZlZE3b-yiNFNClf4gaP5IVKBaalBKcXRxhksecNZmkj5celPNw>
 <xmx:_GvWZvD4yZC0xLDpJS5GvP2T8WwXS7lYYlO0uYtUDNpjTXV3tlTcHQ>
 <xmx:_WvWZuLmh_DzVJkx1Gp9GndfK7oQhG2BJA7hbKE5aTtebdJ4xa967_Rn>
Feedback-ID: idc0145fc:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id 62404BA006E; Mon,  2 Sep 2024 21:53:00 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
MIME-Version: 1.0
Date: Tue, 03 Sep 2024 13:52:00 +1200
From: "Ryan Walklin" <ryan@testtoast.com>
To: "Neil Armstrong" <neil.armstrong@linaro.org>,
 "Maxime Ripard" <mripard@kernel.org>
Cc: "Conor Dooley" <conor@kernel.org>, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, "Jessica Zhang" <quic_jesszhan@quicinc.com>,
 "Sam Ravnborg" <sam@ravnborg.org>, "David Airlie" <airlied@gmail.com>,
 "Daniel Vetter" <daniel@ffwll.ch>,
 "Maarten Lankhorst" <maarten.lankhorst@linux.intel.com>,
 "Thomas Zimmermann" <tzimmermann@suse.de>, "Rob Herring" <robh@kernel.org>,
 "Krzysztof Kozlowski" <krzk+dt@kernel.org>,
 "Conor Dooley" <conor+dt@kernel.org>,
 "Hironori KIKUCHI" <kikuchan98@gmail.com>,
 "Chris Morgan" <macroalpha82@gmail.com>
Message-Id: <6ab54fb5-8723-457d-b5e6-483f82faf30e@app.fastmail.com>
In-Reply-To: <e9f5f554-b773-4a16-97b7-331fa3c179d9@linaro.org>
References: <20240828-aboriginal-vivid-goldfish-3ee4fc@houat>
 <8490347B-2729-4B79-869B-FFCE41E0A7F9@testtoast.com>
 <e9f5f554-b773-4a16-97b7-331fa3c179d9@linaro.org>
Subject: Re: [PATCH 1/3] dt-bindings: display: panel: Rename WL-355608-A8 panel
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
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

On Fri, 30 Aug 2024, at 7:56 PM, Neil Armstrong wrote:

Thanks Neil,

>
> The only valid compatible with anbernic would be to use the exact 
> device in use and not a wildcard,

> so you said the 3 devices using this panel are:
>   anbernic,rg35xx-2024
>   anbernic,rg35xx-plus
>   anbernic,rg35xx-h
> you should introduce 3 compatibles:
>   anbernic,rg35xx-2024-panel
>   anbernic,rg35xx-plus-panel
>   anbernic,rg35xx-h-panel
>
> but it's duplicating for nothing, to you should use fallbacks for 2 of 
> them to have in DT :
>
>   anbernic,rg35xx-2024-panel
>   anbernic,rg35xx-plus-panel, anbernic,rg35xx-2024-panel
>   anbernic,rg35xx-h-panel, anbernic,rg35xx-2024-panel
>
> and only use anbernic,rg35xx-2024-panel in the driver.
>
> In this case bindings should be like:
>    properties:
>      compatible:
>        oneOf:
>          - const: anbernic,rg35xx-2024-panel
>          - items:
>              - enum:
>                  - anbernic,rg35xx-plus-panel
>                  - anbernic,rg35xx-h-panel
>              - const: anbernic,rg35xx-2024-panel
>
> (of course I selected rg35xx-2024 as the primary one, it could be 
> another, usually the older one)
>

If all are happy with this approach I will resubmit a V2 with that change this evening.

Regards,

Ryan
