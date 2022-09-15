Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DB8A5BA005
	for <lists+dri-devel@lfdr.de>; Thu, 15 Sep 2022 18:53:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E732610EB84;
	Thu, 15 Sep 2022 16:53:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-x12d.google.com (mail-il1-x12d.google.com
 [IPv6:2607:f8b0:4864:20::12d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2F9A410EB84
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Sep 2022 16:53:12 +0000 (UTC)
Received: by mail-il1-x12d.google.com with SMTP id d16so9989880ils.8
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Sep 2022 09:53:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=to:references:message-id:content-transfer-encoding:cc:date
 :in-reply-to:from:subject:mime-version:from:to:cc:subject:date;
 bh=Ctva506wfgkNUCjN4L6nhIaTESGYUbw4ZySDGQZBtV8=;
 b=oc7ESAuTdyerQ1dAIB3KzibBp3CNpWKq62EdBV7wU0Z2uItCGQMPyWdPnvV3H9TT25
 0QuVHaVipjp3A0ZN7t62m/G7r7yefFahy0w+4uVZdMw2DBIaMC3qj9V7Seq+C5YKozVj
 yneXcOL0pL1HSE5vO0jjrl90X19SyevnynQLQMNMAJr+cVklx2EPcmfaL5bcNA3snsc8
 PmvzTNepfrObWYrBhaIb1xN8yFTkDzI/1C47FZv0WcmKWWZWL6voby+YTa+utTZbdki3
 Vbd9GpmPCbvMIWOs8a4noOHpdhcx3v9jubIp2TNLkSOmwj5x1MMLSOxsdVLVMoAUwFlT
 hnYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=to:references:message-id:content-transfer-encoding:cc:date
 :in-reply-to:from:subject:mime-version:x-gm-message-state:from:to:cc
 :subject:date;
 bh=Ctva506wfgkNUCjN4L6nhIaTESGYUbw4ZySDGQZBtV8=;
 b=mvOAlB68JGf/vv0bAlwBoQJbDI4xsm37ZiHFnPhkXsmnOyEFEvxdvNCg2WPW5EkAaL
 ByAr1LT5rOg9nXRt6QV3P6YCRHvxEPUE8AjwQ5P4RJ4QpYSgfMRuDt+ShbReoWNzKXdH
 i55+ragiKhgZEYW7TFNz6K8hTRrDox6JIy8xdAoMZFvnuiUROxP8q7oj1YAS2v3bMRju
 1yJlVgI6n2YTw1Ia9aYOdISVIU8z6bJSKtPQxCA9qbM7qCcODCd1UQdgrMcsQVuNHacB
 Tt/95CERw/s1B+doctstFdov9f8wTMJyMwGrcTNsXOLjMaKnAKvPpGR4pGk+ggE1RVSy
 jGxw==
X-Gm-Message-State: ACrzQf0ljxjeFwEZShU6RIrZXbO1MxjJTIW5UoxMNl9pEsryxbnjGpq9
 q+c7Ph/UCtRcaIbK48ykvIM=
X-Google-Smtp-Source: AMsMyM4XSl+CKPYQP2VV2gOIV41ixVw4PiE9yGwFMqjXF1MGteHZTFrpA9iF45BxUtlB84ik5K6u2g==
X-Received: by 2002:a05:6e02:178c:b0:2ee:3296:4c5 with SMTP id
 y12-20020a056e02178c00b002ee329604c5mr401656ilu.265.1663260791394; 
 Thu, 15 Sep 2022 09:53:11 -0700 (PDT)
Received: from smtpclient.apple (ebrouter.sigmaris.info. [82.69.107.165])
 by smtp.gmail.com with ESMTPSA id
 x12-20020a92d64c000000b002e97becb248sm8083874ilp.29.2022.09.15.09.53.09
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 15 Sep 2022 09:53:10 -0700 (PDT)
Content-Type: text/plain;
	charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3696.120.41.1.1\))
Subject: Re: [PATCH v2 3/3] arm64: dts: rockchip: enable gamma control on
 RK3399
From: Hugh Cole-Baker <sigmaris@gmail.com>
In-Reply-To: <9196035b-273a-adca-2b87-c70bbab7f5c9@arm.com>
Date: Thu, 15 Sep 2022 17:53:07 +0100
Content-Transfer-Encoding: quoted-printable
Message-Id: <7B966E6B-1D3F-4975-AC44-1840951257F1@gmail.com>
References: <20211019215843.42718-1-sigmaris@gmail.com>
 <20211019215843.42718-4-sigmaris@gmail.com>
 <9196035b-273a-adca-2b87-c70bbab7f5c9@arm.com>
To: Robin Murphy <robin.murphy@arm.com>
X-Mailer: Apple Mail (2.3696.120.41.1.1)
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
Cc: hjc@rock-chips.com, dri-devel@lists.freedesktop.org,
 linux-rockchip@lists.infradead.org, ezequiel@collabora.com,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


> On 15 Sep 2022, at 15:40, Robin Murphy <robin.murphy@arm.com> wrote:
>=20
> On 2021-10-19 22:58, Hugh Cole-Baker wrote:
>> Define the memory region on RK3399 VOPs containing the gamma LUT at
>> base+0x2000.
>> Signed-off-by: Hugh Cole-Baker <sigmaris@gmail.com>
>> ---
>> Changes from v1: no changes in this patch
>>  arch/arm64/boot/dts/rockchip/rk3399.dtsi | 4 ++--
>>  1 file changed, 2 insertions(+), 2 deletions(-)
>> diff --git a/arch/arm64/boot/dts/rockchip/rk3399.dtsi =
b/arch/arm64/boot/dts/rockchip/rk3399.dtsi
>> index 3871c7fd83b0..9cbf6ccdd256 100644
>> --- a/arch/arm64/boot/dts/rockchip/rk3399.dtsi
>> +++ b/arch/arm64/boot/dts/rockchip/rk3399.dtsi
>> @@ -1619,7 +1619,7 @@ i2s2: i2s@ff8a0000 {
>>    	vopl: vop@ff8f0000 {
>>  		compatible =3D "rockchip,rk3399-vop-lit";
>> -		reg =3D <0x0 0xff8f0000 0x0 0x3efc>;
>> +		reg =3D <0x0 0xff8f0000 0x0 0x2000>, <0x0 0xff8f2000 0x0 =
0x400>;
>>  		interrupts =3D <GIC_SPI 119 IRQ_TYPE_LEVEL_HIGH 0>;
>>  		assigned-clocks =3D <&cru ACLK_VOP1>, <&cru HCLK_VOP1>;
>>  		assigned-clock-rates =3D <400000000>, <100000000>;
>> @@ -1676,7 +1676,7 @@ vopl_mmu: iommu@ff8f3f00 {
>>    	vopb: vop@ff900000 {
>>  		compatible =3D "rockchip,rk3399-vop-big";
>> -		reg =3D <0x0 0xff900000 0x0 0x3efc>;
>> +		reg =3D <0x0 0xff900000 0x0 0x2000>, <0x0 0xff902000 0x0 =
0x1000>;
>=20
> Doesn't the second range still need to be shorter than 0xf00 to avoid =
overlapping the IOMMU?
>=20
> Robin.

This should be OK, the other registers are in the range =
ff900000-ff902000, the
gamma LUT occupies the range ff902000-ff903000, and then the IOMMU =
registers
begin at ff903f00. I don't see any overlaps with the IOMMU unless I'm
misreading the dts.

>>  		interrupts =3D <GIC_SPI 118 IRQ_TYPE_LEVEL_HIGH 0>;
>>  		assigned-clocks =3D <&cru ACLK_VOP0>, <&cru HCLK_VOP0>;
>>  		assigned-clock-rates =3D <400000000>, <100000000>;

br, Hugh.

