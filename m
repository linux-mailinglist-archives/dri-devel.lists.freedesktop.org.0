Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B8BC2AB9942
	for <lists+dri-devel@lfdr.de>; Fri, 16 May 2025 11:47:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1FF8510EA18;
	Fri, 16 May 2025 09:47:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=testtoast.com header.i=@testtoast.com header.b="mv2U/1NV";
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.b="ucq/8s+U";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fout-b1-smtp.messagingengine.com
 (fout-b1-smtp.messagingengine.com [202.12.124.144])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C103510EA18
 for <dri-devel@lists.freedesktop.org>; Fri, 16 May 2025 09:47:18 +0000 (UTC)
Received: from phl-compute-06.internal (phl-compute-06.phl.internal
 [10.202.2.46])
 by mailfout.stl.internal (Postfix) with ESMTP id C81FE11400D8;
 Fri, 16 May 2025 05:47:08 -0400 (EDT)
Received: from phl-imap-17 ([10.202.2.105])
 by phl-compute-06.internal (MEProxy); Fri, 16 May 2025 05:47:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=testtoast.com;
 h=cc:cc:content-transfer-encoding:content-type:content-type
 :date:date:from:from:in-reply-to:in-reply-to:message-id
 :mime-version:references:reply-to:subject:subject:to:to; s=fm3;
 t=1747388828; x=1747475228; bh=bNDnc+aKYABP6EVt0m2pTGeyc+6skQHz
 1+A+corZaFc=; b=mv2U/1NViwPZ4IAWkszV2qSUvdYJbwbNUe1ko2zc3eibVoTc
 hZn1lK9klMtX93uEkG8zmDqUJeV9RSmylTii1lKHQtQ1C/AQ9Y2FZsfIsQW1Y/1y
 4WFaapr//YiOG3WPCIynDfJIl/9P8pfBsh8+AxarSwSlG9WgUCBb9aWWwF8Ufr1r
 5cp1sBaaF+DEBJeRonx/U/1DjdLkx/coZB1rlgFMbieTgjS/REVSKHP5K+puGjuR
 2nPOyHa4UaafL5mMf6PnFmZpKNbAdJq9iE+9ANJSqwDiNpVHuN70uHdRMy+4VSpw
 7EbFStcMtULfwXCgVXvPbPt0BcP/15oE4GNhOA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:content-type:date:date:feedback-id:feedback-id
 :from:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:reply-to:subject:subject:to:to:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1747388828; x=
 1747475228; bh=bNDnc+aKYABP6EVt0m2pTGeyc+6skQHz1+A+corZaFc=; b=u
 cq/8s+U6BcBVikfrE40TvE2CwdF5aoi7noVhfsAdEo6u9DVqFWlFqtq7R7G/kM4t
 hFxhaUbWFTiJtnu2AwwrFkCa5P6mIBBKYCICQLQpRZ7r7LN/VH7zBPUl39RA3CGA
 z95tt6E/JfLUDJTtN3bm6O2S+qxvWyncRw/e95lHOFspT5sr55yDWYbgk9YAvsPc
 OoXfJG3HLVRhQOLPfze8XqV9nbhQjT6zLrlu81jlqGMHVA6SfOlyH+9AzArzA++q
 vXDdHn78yQUQOgInJGKHEMIpAq4+IpC1TYpU85Q8wlfIm6Bfs3rO7ncpQ5wEfF9G
 D2YHXb2OaOMVqMS5S0Yng==
X-ME-Sender: <xms:mgknaNW4CHO4meF6_Nt5FBL-z8WtlTvsYLtWmsPvZDk1Sj0hCiNttw>
 <xme:mgknaNksGDPm7hKLF4tDD6fto96miXAVn_9VdfRwgsmWcOZMT8AKNckyvvm-Pez2g
 6tUlXVH8rERUYLogQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdefuddvgedvucetufdoteggodetrf
 dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggv
 pdfurfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpih
 gvnhhtshculddquddttddmnecujfgurhepofggfffhvfevkfgjfhfutgfgsehtqhertder
 tdejnecuhfhrohhmpedftfihrghnucghrghlkhhlihhnfdcuoehrhigrnhesthgvshhtth
 horghsthdrtghomheqnecuggftrfgrthhtvghrnhepgefhgfektdeuieduueekvdevvefh
 udeuhfehvdeigfffudehueeiieehhfefgfevnecuvehluhhsthgvrhfuihiivgeptdenuc
 frrghrrghmpehmrghilhhfrhhomheprhihrghnsehtvghsthhtohgrshhtrdgtohhmpdhn
 sggprhgtphhtthhopedvhedpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtoheprghnug
 hrvgdrphhriiihfigrrhgrsegrrhhmrdgtohhmpdhrtghpthhtohepmhhtuhhrqhhuvght
 thgvsegsrgihlhhisghrvgdrtghomhdprhgtphhtthhopeifvghnshestghsihgvrdhorh
 hgpdhrtghpthhtohepuggrnhhivghlsehffhiflhhlrdgthhdprhgtphhtthhopegrihhr
 lhhivggusehgmhgrihhlrdgtohhmpdhrtghpthhtohepjhgvrhhnvghjrdhskhhrrggsvg
 gtsehgmhgrihhlrdgtohhmpdhrtghpthhtohepkhhikhhutghhrghnleeksehgmhgrihhl
 rdgtohhmpdhrtghpthhtohepmhgrtghrohgrlhhphhgrkedvsehgmhgrihhlrdgtohhmpd
 hrtghpthhtohepshhimhhonhhsrdhphhhilhhiphhpvgesghhmrghilhdrtghomh
X-ME-Proxy: <xmx:mgknaJZmAvdw4E5hLRz_HADffNbtUjHMknHAOYua7LbeuuweT7C33w>
 <xmx:mgknaAXeWz_saEPijL_d0p1xt3SykD_o-G48u3KIbhe4InRye7NxPA>
 <xmx:mgknaHnKdcJF3uWrJ8lx4zs7iECT6aFYrIEiP6CMDVVqATilBL7w4A>
 <xmx:mgknaNeHgrZvtJ01_DzMf6TAWarC3_v68Ct2KRGwZRVxdeEC07t8kg>
 <xmx:nAknaKiUJ9TxH1Mfz43vj2CB091KB_eozhns6ShMKMbhp02Imh1-PMPf>
Feedback-ID: idc0145fc:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
 id A5C65C40062; Fri, 16 May 2025 05:47:06 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
MIME-Version: 1.0
X-ThreadId: T8206d035b13fbed2
Date: Fri, 16 May 2025 21:46:46 +1200
From: "Ryan Walklin" <ryan@testtoast.com>
To: "Chen-Yu Tsai" <wens@csie.org>
Cc: "Maxime Ripard" <mripard@kernel.org>,
 "Maarten Lankhorst" <maarten.lankhorst@linux.intel.com>,
 "Thomas Zimmermann" <tzimmermann@suse.de>,
 "David Airlie" <airlied@gmail.com>, "Daniel Vetter" <daniel@ffwll.ch>,
 "Jernej Skrabec" <jernej.skrabec@gmail.com>,
 "Samuel Holland" <samuel@sholland.org>, "Rob Herring" <robh@kernel.org>,
 "Krzysztof Kozlowski" <krzk+dt@kernel.org>,
 "Conor Dooley" <conor+dt@kernel.org>,
 "Michael Turquette" <mturquette@baylibre.com>,
 "Stephen Boyd" <sboyd@kernel.org>, "Andre Przywara" <andre.przywara@arm.com>, 
 "Chris Morgan" <macroalpha82@gmail.com>,
 "Hironori KIKUCHI" <kikuchan98@gmail.com>,
 "Philippe Simons" <simons.philippe@gmail.com>,
 "Dmitry Baryshkov" <dmitry.baryshkov@linaro.org>,
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev, devicetree@vger.kernel.org,
 linux-clk@vger.kernel.org, "Conor Dooley" <conor.dooley@microchip.com>,
 "Chris Morgan" <macromorgan@hotmail.com>
Message-Id: <2c838188-34e1-4f62-adab-ff9182c8132b@app.fastmail.com>
In-Reply-To: <CAGb2v64BY+8ZkoxG82MCP+-5BZAFiYMRcm4LXeke9uVfpZX2bA@mail.gmail.com>
References: <20250511104042.24249-1-ryan@testtoast.com>
 <20250511104042.24249-6-ryan@testtoast.com>
 <CAGb2v64BY+8ZkoxG82MCP+-5BZAFiYMRcm4LXeke9uVfpZX2bA@mail.gmail.com>
Subject: Re: [PATCH v10 05/11] dt-bindings: allwinner: add H616 DE33 bus
 binding
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
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

On Thu, 15 May 2025, at 8:00 PM, Chen-Yu Tsai wrote:
> On Sun, May 11, 2025 at 6:42=E2=80=AFPM Ryan Walklin <ryan@testtoast.c=
om> wrote:
>> Add a display engine bus binding for the DE33.
>
> Since this just falls back to the A64 compatible, there's no matching
> driver change. Can you send this together with the DT changes instead?
>
> Otherwise it goes unused.
>
> ChenYu

Thanks for reviewing and taking the clock patches. Sure, will pull this =
out for the DT series.

Regards,

Ryan

>> Changelog v1..v2:
>> - Correct DE2 bus enum to reflect fallback devices accurately.
>>
>> Changelog v2..v3:
>> - Separate content into three patches for three separate subsystems
>>
>> Changelog v5..v6:
>> - Increase reg maxItems to 3.
>>
>> Changelog v9..v10:
>> - Remove maxItems, this was added in error to the bus binding (rather=
 than the mixer binding) when it was split from the other bindings in an=
 earlier revision.
>> ---
>>  .../devicetree/bindings/bus/allwinner,sun50i-a64-de2.yaml     | 4 ++=
+-
>>  1 file changed, 3 insertions(+), 1 deletion(-)
>>
>> diff --git a/Documentation/devicetree/bindings/bus/allwinner,sun50i-a=
64-de2.yaml b/Documentation/devicetree/bindings/bus/allwinner,sun50i-a64=
-de2.yaml
>> index 9845a187bdf6..ea7ee89158c6 100644
>> --- a/Documentation/devicetree/bindings/bus/allwinner,sun50i-a64-de2.=
yaml
>> +++ b/Documentation/devicetree/bindings/bus/allwinner,sun50i-a64-de2.=
yaml
>> @@ -24,7 +24,9 @@ properties:
>>      oneOf:
>>        - const: allwinner,sun50i-a64-de2
>>        - items:
>> -          - const: allwinner,sun50i-h6-de3
>> +          - enum:
>> +              - allwinner,sun50i-h6-de3
>> +              - allwinner,sun50i-h616-de33
>>            - const: allwinner,sun50i-a64-de2
>>
>>    reg:
>> --
>> 2.49.0
>>
