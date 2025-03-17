Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B557A647FF
	for <lists+dri-devel@lfdr.de>; Mon, 17 Mar 2025 10:49:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2842F10E3DA;
	Mon, 17 Mar 2025 09:49:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=mainlining.org header.i=@mainlining.org header.b="HjKaTdPy";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.mainlining.org (unknown [5.75.144.95])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B3EDC10E3DA;
 Mon, 17 Mar 2025 09:49:04 +0000 (UTC)
Received: from [127.0.0.1] (254C1C5A.nat.pool.telekom.hu [37.76.28.90])
 by mail.mainlining.org (Postfix) with ESMTPSA id C8F94BBAC4;
 Mon, 17 Mar 2025 09:48:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mainlining.org;
 s=psm; t=1742204929;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=KQUc1TIqImv/gjsL1SsdE5mqG9ewHx8AMbVf5J90/JE=;
 b=HjKaTdPyYIaSu2gQhXv0c2GnzmfZhGAMCKxZ8Uzv2knIpTsW44IwlfaN142YjxS6Iv4BkT
 BOI+LRkkwuL9s7HKOfzGxRyBrhgO1jGgBMhSRvmqRMQOwuG1mp1bfy31tASnmODSUpT1FJ
 hxrEu0LsLpBqMONxp69RU4XxSj68pQFGpLhacpQni5tiRINKPHc0ihgpJ029CyxqbtaLfu
 JkyQQRm+MwhZK5/wSUDyBxA0sfU3IJXwu/yqtSwxPosBKCl1HhRBNOhVYFBCX9zihrgjmv
 FJEHe2Qj3fyJPNV4drbURK+9avdc7rgSkmwvyENBwh5cPImGI/kwMBJ5ERHPJw==
Date: Mon, 17 Mar 2025 10:48:47 +0100
From: =?ISO-8859-1?Q?Barnab=E1s_Cz=E9m=E1n?= <barnabas.czeman@mainlining.org>
To: Krzysztof Kozlowski <krzk@kernel.org>
CC: Bjorn Andersson <andersson@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Stephan Gerhold <stephan@gerhold.net>,
 =?ISO-8859-1?Q?Otto_Pfl=FCger?= <otto.pflueger@abscue.de>,
 Linus Walleij <linus.walleij@linaro.org>, Lee Jones <lee@kernel.org>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
 Robin Murphy <robin.murphy@arm.com>, Konrad Dybcio <konradybcio@kernel.org>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Dmitry Baryshkov <lumag@kernel.org>, linux-arm-msm@vger.kernel.org,
 linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
 iommu@lists.linux.dev, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, phone-devel@vger.kernel.org,
 ~postmarketos/upstreaming@lists.sr.ht, linux@mainlining.org,
 Adam Skladowski <a39.skl@gmail.com>
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH_v4_3/6=5D_dt-bindings=3A_drm/msm/g?=
 =?US-ASCII?Q?pu=3A_Document_AON_clock_for_A505/A506/A510?=
User-Agent: Thunderbird for Android
In-Reply-To: <20250317-hypnotic-weightless-mosquito-f489ad@krzk-bin>
References: <20250315-msm8937-v4-0-1f132e870a49@mainlining.org>
 <20250315-msm8937-v4-3-1f132e870a49@mainlining.org>
 <20250317-hypnotic-weightless-mosquito-f489ad@krzk-bin>
Message-ID: <73631B5F-0916-4F81-AAB4-C8E2F4B999EC@mainlining.org>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
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



On March 17, 2025 10:21:50 AM GMT+01:00, Krzysztof Kozlowski <krzk@kernel=
=2Eorg> wrote:
>On Sat, Mar 15, 2025 at 03:57:37PM +0100, Barnab=C3=A1s Cz=C3=A9m=C3=A1n =
wrote:
>> From: Adam Skladowski <a39=2Eskl@gmail=2Ecom>
>>=20
>> Adreno 505 (MSM8937), Adreno 506(MSM8953) and Adreno 510(MSM8976)
>> require Always-on branch clock to be enabled, describe it=2E
>>=20
>> Signed-off-by: Adam Skladowski <a39=2Eskl@gmail=2Ecom>
>> [reword commit, move alwayson on the first place]
>> Signed-off-by: Barnab=C3=A1s Cz=C3=A9m=C3=A1n <barnabas=2Eczeman@mainli=
ning=2Eorg>
>> ---
>>  Documentation/devicetree/bindings/display/msm/gpu=2Eyaml | 6 ++++--
>>  1 file changed, 4 insertions(+), 2 deletions(-)
>>=20
>> diff --git a/Documentation/devicetree/bindings/display/msm/gpu=2Eyaml b=
/Documentation/devicetree/bindings/display/msm/gpu=2Eyaml
>> index 6ddc72fd85b04537ea270754a897b4e7eb269641=2E=2E5028398cc3b517e404a=
92a2c30688f72eab4c1b3 100644
>> --- a/Documentation/devicetree/bindings/display/msm/gpu=2Eyaml
>> +++ b/Documentation/devicetree/bindings/display/msm/gpu=2Eyaml
>> @@ -152,11 +152,13 @@ allOf:
>>        properties:
>>          clocks:
>>            minItems: 2
>> -          maxItems: 7
>> +          maxItems: 8
>> =20
>>          clock-names:
>>            items:
>>              anyOf:
>> +              - const: alwayson
>> +                description: GPU Always-On clock
>
>Are you adding bindings for devices which were not described previously?
>Then don't grow this pattern, but create if:then: with a strictly
>ordered list for them (and keeping order of other variants)=2E
>
8956, 8976, 8953 schemas are failing because of missing always-on clock=2E
>Best regards,
>Krzysztof
>
