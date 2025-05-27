Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C8367AC4FF2
	for <lists+dri-devel@lfdr.de>; Tue, 27 May 2025 15:36:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2A1BC10E4D5;
	Tue, 27 May 2025 13:36:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=fooishbar.org header.i=@fooishbar.org header.b="SoNWLZvj";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-f182.google.com (mail-qt1-f182.google.com
 [209.85.160.182])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1D57110E4F4
 for <dri-devel@lists.freedesktop.org>; Tue, 27 May 2025 13:36:50 +0000 (UTC)
Received: by mail-qt1-f182.google.com with SMTP id
 d75a77b69052e-4774ce422easo28490111cf.1
 for <dri-devel@lists.freedesktop.org>; Tue, 27 May 2025 06:36:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fooishbar.org; s=google; t=1748353009; x=1748957809;
 darn=lists.freedesktop.org; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=ish6o0Bhh995IK2wzs6updBAdJ3S2zxHBcJqrswtQm8=;
 b=SoNWLZvjgPFzCgPtDDM6gMUw0TZS40m2jaT9Uh8wlumwwGY5rF2WT6AkbNeMZ0lVcD
 +6hvtu2vQnbYr29furYbnxveBOyQ9JbNe7vj9ulSezAQz1gKD1xEILV6LcGJ2ud+lNRj
 m6yzPcdabW1aJSziPMPsOowrRjfB6zphaWXNJSEQ3OLMEJ0KCXewBg8t9IlzMAiO12Nj
 PvPuqq2wixEssYevuU8e6h7Tlcw5JIR7WSmx85O/WEGp7DYG7ppWUFtyKGm/BjMXsi3N
 LPCCbU8tz059dxPZHBrI2TSV50cH3no2Ryb6Ylo65C/oUrr+tANjPZUkfYsBRy2tB97Z
 HbtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1748353009; x=1748957809;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ish6o0Bhh995IK2wzs6updBAdJ3S2zxHBcJqrswtQm8=;
 b=EAU1H25mzGpEA027ZysxsSZT9JzbZEXqB56oL8LT1HyzFkSgKs2Vj9zYDr24gY5AVc
 /C+1fQPgGHq1uIin1o1ztaMKg0OWXqf8yP4bxF9RltvZFLuZZ3EwJg3gS73m+ztd+AxG
 izL/DolncbBEfn4WZFMDGd679yZ6yGAhKMXtsTFCY0So/qA6cOk2MvEuVzngZJG8X26/
 NoBTWT5wJawJzIVE/+YIO5zFOkDojl1yTXrjolNcqtZehZuZCMuSUaieT7n2cCIoytb1
 Dxkm88GgJ2CBL6jOw3SIgMyVgg6jyy2WxbEqhuMpf/fwck9WIR8SjdTFka+GvcxRbOFi
 91Nw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVqNNTs7S15G/k1+vP+XFsQvrZJjxsGQVxHCxZKuVN1BL2/Fk/bg4XtEXXWONFNauUZw7wDVuvE5fM=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy+FruK3entLXEFzba6DTcs9Xv9JTD6AgnbxJJ/ZSi5w8JZkG8d
 kViaagMJ8mfwtHr3DhAjSK353sXDNuj5wNfMBHde/xDrhU7ubj2BbRoOnrxbcyO8WXj5ynxRi/T
 Jv8aegR8O46bN3dGsDjb2u4hqWvMEorYomYbpShZvPQ==
X-Gm-Gg: ASbGncuGn5JWRJ+eiDUOpzHtVajG/mBw4ESSAgaiHOlUDPKoY0C39A1cMpIPV5bUPkv
 Qow/mMkayZy4tPusDSIoqP4DRjvamgqqDBs5ORFRrzNBpD/zuQN+UHsuZirsImJPoCUmLCLnZFF
 xlhh/18OP99F593IDxKoXF6ajkSV4QZg==
X-Google-Smtp-Source: AGHT+IHr4jwrHqEJczRvGQzuN87CsS5C28zJXtY9UXRLqVMsScrfx0niqPKTlAIrCpVv2931fOLgMYPlwCUzMNEDANw=
X-Received: by 2002:a05:622a:1f8e:b0:476:8eb5:1669 with SMTP id
 d75a77b69052e-49f4781ed76mr216619901cf.32.1748353009174; Tue, 27 May 2025
 06:36:49 -0700 (PDT)
MIME-Version: 1.0
References: <20250525051639.68753-2-krzysztof.kozlowski@linaro.org>
 <CAPj87rMjAv-UphvFuQjop60o=wHrkfs4-XOM=JqH7f8Kk5dyVg@mail.gmail.com>
 <e462cdc4-7243-4cef-bd1d-a0ef551b3a87@kernel.org>
In-Reply-To: <e462cdc4-7243-4cef-bd1d-a0ef551b3a87@kernel.org>
From: Daniel Stone <daniel@fooishbar.org>
Date: Tue, 27 May 2025 14:36:37 +0100
X-Gm-Features: AX0GCFvEuF0JQkg3QiWt8vTrQrmgkUnYilTb6_QdjwVCLuie3br5KvhEpdyYryI
Message-ID: <CAPj87rNZPub=hEs+86JNfR-iqiuRYGGGKGsYyXtE1aUt8dEyUA@mail.gmail.com>
Subject: Re: [PATCH] media: dt-bindings: mediatek: Constrain iommus
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 dri-devel@lists.freedesktop.org, 
 linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
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

Hi,

On Sun, 25 May 2025 at 11:51, Krzysztof Kozlowski <krzk@kernel.org> wrote:
> On 25/05/2025 12:48, Daniel Stone wrote:
> > On Sun, 25 May 2025 at 06:16, Krzysztof Kozlowski
> > <krzysztof.kozlowski@linaro.org> wrote:
> >> --- a/Documentation/devicetree/bindings/display/mediatek/mediatek,ovl-2l.yaml
> >> +++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,ovl-2l.yaml
> >> @@ -45,9 +45,8 @@ properties:
> >>        - description: OVL-2L Clock
> >>
> >>    iommus:
> >> -    description:
> >> -      This property should point to the respective IOMMU block with master port as argument,
> >> -      see Documentation/devicetree/bindings/iommu/mediatek,iommu.yaml for details.
> >> +    minItems: 1
> >> +    maxItems: 2
> >
> > The comment removals are not documented in the commit message, and
> > it's not clear why removing information and references would be a good
> > thing.
> It's obvious, isn't? The consumer shall not define which provider has to
> use or how many cells provider has.

If you feel the change is good, then document it in the commit
message, and ideally also use separate commits rather than throwing in
unrelated changes into a commit which does not explain anything.
Again, the kernel documentation explains how you can structure your
commits in a better way.

Cheers,
Daniel
