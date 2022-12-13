Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3515A64BF2C
	for <lists+dri-devel@lfdr.de>; Tue, 13 Dec 2022 23:13:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8338B10E36E;
	Tue, 13 Dec 2022 22:12:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com
 [IPv6:2a00:1450:4864:20::134])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1D11310E369
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Dec 2022 22:12:32 +0000 (UTC)
Received: by mail-lf1-x134.google.com with SMTP id p36so7310969lfa.12
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Dec 2022 14:12:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:references
 :in-reply-to:user-agent:subject:cc:to:from:date:from:to:cc:subject
 :date:message-id:reply-to;
 bh=T57htGX7w3pkH4iZZTnHtoAqVjQqavKl1hAXdV9m3Xw=;
 b=aWL7c0bP6EiVYuu/P0uqLB73C7ZV/p4lnopcLYdPlg5vBlfdWSSS5J5K+68KyrWS2o
 jEqKn65kKUCDERq3/4Kc27EWfEu3nisJcQ86SU4Ef3i5kuJJtmtDThP9/tESLNCMsqWI
 /JtF/+sislqE8NIhkmm8tO6vgCALEVSHey2x8igeGSmA3ItCGa+cvhybGm6/BJz4pqwh
 V/hBcq6fzfg+1XhARv7E4x2ql/AvFifeRkUWuTnE4JXQxY0wE6R9NuCXY8Nt1F0xafiS
 2KfaRgv2mwmEOmZZ3umY5AmcRvK/TPa89EpnVXId5xqsTEj+/29aDnVj2X6BaSIIOPCu
 aYZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:references
 :in-reply-to:user-agent:subject:cc:to:from:date:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=T57htGX7w3pkH4iZZTnHtoAqVjQqavKl1hAXdV9m3Xw=;
 b=QoqOgnU36/mpNTL4yogg35sErUgPMzwUg3fG4IdvibYKLCW9O8cS8ygZQZ73J9/IER
 xNX5NlmTUSmKRE3SETaNFuDj2C/NgS9z608G5Y3nze0858whl8ywROA//HdWABab6t/l
 NvYbdJ5X48v34TG85WQDWCGwLo+KKFspWjdrj9AWGoW+1VVHUVKpqFXkPePG0lhMVzFa
 kFcNjJeCi19f7T2eKWvdBzpg5dzUi0HiY3gy5z0nb5M+y/C6uGxO2IgN1OSUjw7uVTnb
 lXZgRrZmI4LTI81mceYvujlO3XvX9qEkjhv6y4m6otun34hW+Cq7yjI7B54cIRR/KYvq
 jUNw==
X-Gm-Message-State: ANoB5pkxr/wCJMpAQaTqpnbROXe0KuJNZkuzDpfCAomVq7uxUis8tqv1
 dKtb4nG3Bl88Ifo5Ygk+4oNFoQ==
X-Google-Smtp-Source: AA0mqf4EGeYBCVnq7ugiUMSP85O1VdGYrTp1W6FPDn9r/8+q1Or+VRc9vCV7Jr28hpe4ERzuNLodXQ==
X-Received: by 2002:a05:6512:3e19:b0:4b0:6023:6f6f with SMTP id
 i25-20020a0565123e1900b004b060236f6fmr8448931lfv.57.1670969550443; 
 Tue, 13 Dec 2022 14:12:30 -0800 (PST)
Received: from ?IPv6:::1? (dzccz6yfpdgdc5vwjcs5y-3.rev.dnainternet.fi.
 [2001:14ba:a085:4d00:8c19:462c:c647:13f2])
 by smtp.gmail.com with ESMTPSA id
 z2-20020a195042000000b004b4b90a6992sm534511lfj.95.2022.12.13.14.12.29
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 13 Dec 2022 14:12:30 -0800 (PST)
Date: Wed, 14 Dec 2022 00:11:58 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Adam Skladowski <a39.skl@gmail.com>
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH_v2_01/12=5D_dt-bindings=3A_displa?=
 =?US-ASCII?Q?y=3A_msm=3A_Rename_mdss_node_name_in_example?=
User-Agent: K-9 Mail for Android
In-Reply-To: <ad7ecffc-3fc9-7859-82b7-9d161fc28cae@quicinc.com>
References: <20221130200950.144618-1-a39.skl@gmail.com>
 <20221130200950.144618-2-a39.skl@gmail.com>
 <19e78a06-2f3d-92af-1988-b22dc3ffc84e@linaro.org>
 <ad7ecffc-3fc9-7859-82b7-9d161fc28cae@quicinc.com>
Message-ID: <86FA3AF9-5B35-4E27-80DA-8B5BF9E6B3AC@linaro.org>
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
Cc: "Rafael J. Wysocki" <rafael@kernel.org>,
 Thara Gopinath <thara.gopinath@gmail.com>, dri-devel@lists.freedesktop.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 phone-devel@vger.kernel.org, Daniel Lezcano <daniel.lezcano@linaro.org>,
 Andy Gross <agross@kernel.org>, Zhang Rui <rui.zhang@intel.com>,
 devicetree@vger.kernel.org, Amit Kucheria <amitk@kernel.org>,
 linux-pm@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, ~postmarketos/upstreaming@lists.sr.ht,
 Sean Paul <sean@poorly.run>, Loic Poulain <loic.poulain@linaro.org>,
 Bjorn Andersson <andersson@kernel.org>, linux-kernel@vger.kernel.org,
 Konrad Dybcio <konrad.dybcio@linaro.org>, freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 13 December 2022 23:53:48 EET, Abhinav Kumar <quic_abhinavk@quicinc=2Ec=
om> wrote:
>
>
>On 12/1/2022 11:54 AM, Dmitry Baryshkov wrote:
>> On 30/11/2022 22:09, Adam Skladowski wrote:
>>> Follow other YAMLs and replace mdss name into display-subystem=2E
>>>=20
>>> Signed-off-by: Adam Skladowski <a39=2Eskl@gmail=2Ecom>
>>=20
>> Reviewed-by: Dmitry Baryshkov <dmitry=2Ebaryshkov@linaro=2Eorg>
>
>Going to add two fixes tags here as we are touching two chipsets:
>
>Fixes: b93bdff44a85 ("dt-bindings: display/msm: add support for SM6115")
>Fixes: 06097b13ef97 ("dt-bindings: display/msm: split dpu-qcm2290 into DP=
U and MDSS parts")

Note, your tag gif wrapped, so patchwork will pick it up incorrectly=2E

>
>Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc=2Ecom>
>
>>=20
>> We will pick this into msm-fixes during the next cycle=2E
>
>Yes, we can with the above fixes tags but first, can you please send a MR=
 from msm-next-lumag to msm-next? So that I can send a MR for fixes to msm-=
next=2E

This would create an additional merge commit in msm-next for no particular=
 reason=2E You can branch -fixes from rc1, or from the msm-next-lumag and t=
hen send MR to msm-next=2E

>
>ATM, they are out of sync=2E
>
>
>>=20
>>> ---
>>> =C2=A0 =2E=2E=2E/devicetree/bindings/display/msm/qcom,qcm2290-mdss=2Ey=
aml=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 2 +-
>>> =C2=A0 =2E=2E=2E/devicetree/bindings/display/msm/qcom,sm6115-mdss=2Eya=
ml=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 2 +-
>>> =C2=A0 2 files changed, 2 insertions(+), 2 deletions(-)
>>>=20
>>> diff --git a/Documentation/devicetree/bindings/display/msm/qcom,qcm229=
0-mdss=2Eyaml b/Documentation/devicetree/bindings/display/msm/qcom,qcm2290-=
mdss=2Eyaml
>>> index d6f043a4b08d=2E=2E4795e13c7b59 100644
>>> --- a/Documentation/devicetree/bindings/display/msm/qcom,qcm2290-mdss=
=2Eyaml
>>> +++ b/Documentation/devicetree/bindings/display/msm/qcom,qcm2290-mdss=
=2Eyaml
>>> @@ -72,7 +72,7 @@ examples:
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 #include <dt-bindings/interconnect/qcom=
,qcm2290=2Eh>
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 #include <dt-bindings/power/qcom-rpmpd=
=2Eh>
>>> -=C2=A0=C2=A0=C2=A0 mdss@5e00000 {
>>> +=C2=A0=C2=A0=C2=A0 display-subsystem@5e00000 {
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 #address-cells =
=3D <1>;
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 #size-cells =3D=
 <1>;
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 compatible =3D =
"qcom,qcm2290-mdss";
>>> diff --git a/Documentation/devicetree/bindings/display/msm/qcom,sm6115=
-mdss=2Eyaml b/Documentation/devicetree/bindings/display/msm/qcom,sm6115-md=
ss=2Eyaml
>>> index a86d7f53fa84=2E=2E886858ef6700 100644
>>> --- a/Documentation/devicetree/bindings/display/msm/qcom,sm6115-mdss=
=2Eyaml
>>> +++ b/Documentation/devicetree/bindings/display/msm/qcom,sm6115-mdss=
=2Eyaml
>>> @@ -62,7 +62,7 @@ examples:
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 #include <dt-bindings/interrupt-control=
ler/arm-gic=2Eh>
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 #include <dt-bindings/power/qcom-rpmpd=
=2Eh>
>>> -=C2=A0=C2=A0=C2=A0 mdss@5e00000 {
>>> +=C2=A0=C2=A0=C2=A0 display-subsystem@5e00000 {
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 #address-cells =
=3D <1>;
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 #size-cells =3D=
 <1>;
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 compatible =3D =
"qcom,sm6115-mdss";
>>=20

--=20
With best wishes
Dmitry
