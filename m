Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2636A6C78CA
	for <lists+dri-devel@lfdr.de>; Fri, 24 Mar 2023 08:26:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3587B10E0CB;
	Fri, 24 Mar 2023 07:26:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com
 [IPv6:2a00:1450:4864:20::52b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E4E4110E50D
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Mar 2023 07:26:53 +0000 (UTC)
Received: by mail-ed1-x52b.google.com with SMTP id b20so4347776edd.1
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Mar 2023 00:26:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fairphone.com; s=fair; t=1679642812;
 h=in-reply-to:references:to:from:subject:cc:message-id:date
 :content-transfer-encoding:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=A3r8qlLMfX6olWr5cQiZdjWVdMvEbSYULtWmP0Of5zA=;
 b=CcWYvg60LPU9OML+C8lhqoRJ4NBCgAsEvPWM1xMIQZrQN0utGwNelBSOWBaYcmTMAP
 76O7michXJLPaunJSpjtVfnKkeSF7yEi5oNkMagIISVJOUmQrru3HAiLJ6FuK4uVQHsy
 Fa7K8lWLDB0csf5yMyjjqbMhCGtNiFc9p1ztVkpiSB2EZEjN1tm7uzaxiVJiG5SfFbMF
 DYheCDnX4J1FZjZTt8/3VB8vrnisztPXnmDtydR96Zatwyb/V90DIkYKmEDOXzhUMDCh
 1u90e88idhl9C+4V/9I12DiWEWe2tHsb68SnP2BGjSPV1uJ1sgngHLtCgDzW5pKsLQYn
 RvQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679642812;
 h=in-reply-to:references:to:from:subject:cc:message-id:date
 :content-transfer-encoding:mime-version:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=A3r8qlLMfX6olWr5cQiZdjWVdMvEbSYULtWmP0Of5zA=;
 b=GuIotRN7OkDScdyQIrsZT5zKa3T5K6PVGGq62z8wXpMRqdJDCrDIuNtLz3uz3ZOa8R
 yImMDJz8x7a/qh4JUFqBQ2nud01hUY30hHk21rYEOjqGhE7PiMcdA9/d8Y37uiCdufOW
 dTsE2Meanz8vrdSqN2CYO0eKRjC0JLM6uDMMs5fAvUkrZOh+FIPx65kM5BzGwFVNf3xL
 f2AQv2b/EOoFlRZdTUHOpMwWZyV0NnTOfhTJ49im1NlKvx6YRmFNWDeWsyckzxusk9Ug
 leB7te+yYQDz6QQpRw9X7TVAb6XlqRX6dQ3nOUKaN8kCp868vXD42TT9VTLYTvYkML9q
 9zwg==
X-Gm-Message-State: AAQBX9c9Uk3euHYbD9Ypfd16coYxlsGPBJ3h2PyxXGEUFXDT5DQPXnzh
 tPYr0ozfeJ7UwqLiDrT2UBkLGQ==
X-Google-Smtp-Source: AKy350Z3iXwVl48Ri6gzNt6zqCcLfdbS5qlgam/8hRq+uoEeXsbjnn/z6Ldk4pJgWmfxDCpq3IpEGA==
X-Received: by 2002:aa7:c7d5:0:b0:4fe:cbce:5fcb with SMTP id
 o21-20020aa7c7d5000000b004fecbce5fcbmr1765296eds.9.1679642812253; 
 Fri, 24 Mar 2023 00:26:52 -0700 (PDT)
Received: from localhost (84-115-214-73.cable.dynamic.surfer.at.
 [84.115.214.73]) by smtp.gmail.com with ESMTPSA id
 v4-20020a509544000000b004fb402a2a37sm10333082eda.33.2023.03.24.00.26.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 24 Mar 2023 00:26:52 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 24 Mar 2023 08:26:50 +0100
Message-Id: <CREFOMX7DAPN.2NR3VSFCX9K10@otso>
Subject: Re: [PATCH 7/8] arm64: dts: qcom: sm8450: remove invalid reg-names
 from ufs node
From: "Luca Weiss" <luca.weiss@fairphone.com>
To: "Eric Biggers" <ebiggers@kernel.org>, "Neil Armstrong"
 <neil.armstrong@linaro.org>
X-Mailer: aerc 0.14.0
References: <20230323-topic-sm8450-upstream-dt-bindings-fixes-v1-0-3ead1e418fe4@linaro.org>
 <20230323-topic-sm8450-upstream-dt-bindings-fixes-v1-7-3ead1e418fe4@linaro.org>
 <9614782e-0d78-e8f2-a438-452cfa86f80b@linaro.org>
 <316d7d7d-b370-36e1-648a-400447d2dd47@linaro.org>
 <20230324065247.GA9598@sol.localdomain>
In-Reply-To: <20230324065247.GA9598@sol.localdomain>
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
Cc: Alim Akhtar <alim.akhtar@samsung.com>, dri-devel@lists.freedesktop.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Bart Van Assche <bvanassche@acm.org>, linux-scsi@vger.kernel.org,
 Lee Jones <lee@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Krzysztof Kozlowski <krzk@kernel.org>, Andy Gross <agross@kernel.org>,
 devicetree@vger.kernel.org, Manivannan Sadhasivam <mani@kernel.org>,
 linux-arm-msm@vger.kernel.org, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Avri Altman <avri.altman@wdc.com>, Rob
 Herring <robh+dt@kernel.org>, Sean Paul <sean@poorly.run>,
 Stephen Boyd <sboyd@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 linux-kernel@vger.kernel.org, Konrad Dybcio <konrad.dybcio@linaro.org>, Dmitry
 Baryshkov <dmitry.baryshkov@linaro.org>, freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Eric,

On Fri Mar 24, 2023 at 7:52 AM CET, Eric Biggers wrote:
> Hi Neil,
>
> On Thu, Mar 23, 2023 at 02:10:44PM +0100, Neil Armstrong wrote:
> > Hi,
> >=20
> > On 23/03/2023 11:49, Krzysztof Kozlowski wrote:
> > > On 23/03/2023 11:25, Neil Armstrong wrote:
> > > > Fixes the following DT bindings check error:
> > > > ufshc@1d84000: Unevaluated properties are not allowed ('reg-names' =
was unexpected)
> > > >=20
> > > > Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> > > > ---
> > > >   arch/arm64/boot/dts/qcom/sm8450.dtsi | 1 -
> > > >   1 file changed, 1 deletion(-)
> > > >=20
> > > > diff --git a/arch/arm64/boot/dts/qcom/sm8450.dtsi b/arch/arm64/boot=
/dts/qcom/sm8450.dtsi
> > > > index ef9bae2e6acc..8ecc48c7c5ef 100644
> > > > --- a/arch/arm64/boot/dts/qcom/sm8450.dtsi
> > > > +++ b/arch/arm64/boot/dts/qcom/sm8450.dtsi
> > > > @@ -3996,7 +3996,6 @@ ufs_mem_hc: ufshc@1d84000 {
> > > >   				     "jedec,ufs-2.0";
> > > >   			reg =3D <0 0x01d84000 0 0x3000>,
> > > >   			      <0 0x01d88000 0 0x8000>;
> > > > -			reg-names =3D "std", "ice";
> > >=20
> > > This is also part of:
> > > https://lore.kernel.org/linux-arm-msm/20230308155838.1094920-8-abel.v=
esa@linaro.org/#Z31arch:arm64:boot:dts:qcom:sm8450.dtsi
> > > but I actually wonder whether you just missed some binding patch?
> >=20
> > I'm aware of Abel's RFC patchset to support shared ICE, but this is a c=
leanup of the current DT,
> > and the current bindings schema doesn't document reg-names.
> >=20
>
> The ufs-qcom driver accesses the "ice" registers by name, so the reg-name=
s can't
> be removed from the device tree.  A few months ago there was a patch to f=
ix the
> device tree schema for qcom,ufs to include the reg-names.  It looks like =
that
> patch got missed, though:
> https://lore.kernel.org/r/20221209-dt-binding-ufs-v2-2-dc7a04699579@fairp=
hone.com

Are you implying that I should resend the patch or something? Not sure
who to bug about applying this patch.

Regards
Luca

>
> - Eric

