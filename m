Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CF2AFA6BA88
	for <lists+dri-devel@lfdr.de>; Fri, 21 Mar 2025 13:19:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E235A10E7B2;
	Fri, 21 Mar 2025 12:19:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="o2c6zws8";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 764E310E131
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Mar 2025 12:19:40 +0000 (UTC)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52LATC1S017990
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Mar 2025 12:19:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 hasDN4p/a1W4nyEvoXqsuiWIpj77cv9FFKDtGgirZh4=; b=o2c6zws8uYfsTeiv
 46g58J9uMZkjInCyKsmSwx/Yxc61JfRYQMS4rniI5BCCGaaFnSxG1zbTa38llL+M
 GmjTf5dd3wdodRTkBSp+MAEwS/x61vKhYqfF8Sfze12yXvFQPWDDSitPUCx4NCDQ
 0zbksxeIMypt1QXn+FBMcLhJvYXXq199diArnNXvpVJ1LucGelJHaBYXRCgjUrQq
 jrGtzfUxgG5AQA9HzGbeUU+puodpQjHq01njn5ZmiTWKoAeNBU8hnpqV4J3/n2ri
 lel1U0okoWFLaHmtGLQSFBi1oJt0U3ZSLvQmszq+O4T23ZcEvreW3NoyYlpQKACS
 y5i4SQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45fdmx1tj2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Mar 2025 12:19:37 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id
 af79cd13be357-7c54e8ad9b3so462241285a.1
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Mar 2025 05:19:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1742559576; x=1743164376;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=hasDN4p/a1W4nyEvoXqsuiWIpj77cv9FFKDtGgirZh4=;
 b=ugfFEZJXigKXWMmGFGPFKN7Ip6NKwCeTijpgfPuWTQR1gzMTQzz0Mlc325crkxbiCV
 ViwGRjP1Z0B3AUDPjdt0+SHNn4xuF+lPfaEpaBljc7SU8j29TvfJjrjkl9iSNiNihekf
 AWDTgAMUPAPEifr+FCaDNfnWsMMktTMD021H7SFk3s4OBUOgpbUYhcxPFb8DAx5G9brT
 3Hkr+Pji+gRzkrXtFaaiVmAT68a891N3xrYv9hni/ZLkkUDdoE1YBCM3U6Va9840JXmi
 IHtwcQ8MaRr6OnNXd/z4LiuV/UPBjAMj7TVxdqc4qA33mZl1u6cGOQMDswyiCHr0rjqY
 tH4w==
X-Forwarded-Encrypted: i=1;
 AJvYcCWmaNhzkBpMY1Lb131XpD/Nk/xq5uiDSfZN5w7yIBWG1RNAly+3RemkOpJI6TKKECcyAPTifXg+SZs=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyJSN+4HnMqb0Cs+JQIy+pEknQ9/n8mJMjF5h1MGXTVBCq45E/M
 2v/2DqlCnpdxKEpYuLzdO5OrMpOfNbjx3WUz4I5cdlWSOh0dkguAXO0qO7iCWjTIzdQvdPDIPcK
 rsAymtF+yuszE173htwNYyvwnoqYwb1b0wPBphQdhUzZ/HMxfg/tiBzYUxg4WuBM+L4Q=
X-Gm-Gg: ASbGncs2BhUDHtAeIQIwMpgEAzuhomCZdiwL5a/lNpl84izemcJUGugrjuU3oKfdNwE
 lgG1TB6ZHr6Dv01808NiA3lv/aZeqCJStevQkXEyvx4xDBZeFW73RzBI0n7hGcj03vuAyXkl4q0
 p1CfGkrcB+muCnIaH4/SvM0uFBfyyeAHAzQnhy3DQlai5gAjalt4UsRzEvCQCtSxXqxWnovyzXB
 A2B6HhTDg/z1K+1uCfiNrX/IxQ4qnjgmIsWRkyniG6FeF8XoRnGiaxiNZhXiZvghmFAVrq2P2Wt
 tAAqdwpZzGE5pynyJ9SWuf4EvzZoXhgsGLZ7uh0DB6gZDXh5dGZMSJvSBCS5+6U1eUhubsQhzpu
 1Qa4=
X-Received: by 2002:a05:620a:2495:b0:7b1:7508:9f38 with SMTP id
 af79cd13be357-7c5b0527d35mr1174223785a.16.1742559576339; 
 Fri, 21 Mar 2025 05:19:36 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF3iWh33NZgqwz3Sb4nD2XgofXgNzfqbEkAFXjs0uQ1dNsvWPHe7INWA+p855zxzDr+khJ+8A==
X-Received: by 2002:a05:620a:2495:b0:7b1:7508:9f38 with SMTP id
 af79cd13be357-7c5b0527d35mr1174217485a.16.1742559575771; 
 Fri, 21 Mar 2025 05:19:35 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-54ad6510635sm168988e87.211.2025.03.21.05.19.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 21 Mar 2025 05:19:34 -0700 (PDT)
Date: Fri, 21 Mar 2025 14:19:32 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Xiangxu Yin <quic_xiangxuy@quicinc.com>
Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Rob Clark <robdclark@gmail.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Kuogee Hsieh <quic_khsieh@quicinc.com>, Vinod Koul <vkoul@kernel.org>,
 Kishon Vijay Abraham I <kishon@kernel.org>,
 Linus Walleij <linus.walleij@linaro.org>,
 Bartosz Golaszewski <brgl@bgdev.pl>, quic_lliu6@quicinc.com,
 quic_fangez@quicinc.com, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-phy@lists.infradead.org, linux-gpio@vger.kernel.org
Subject: Re: [PATCH 3/8] phy: qcom: qmp-usbc: Add DP phy mode support on QCS615
Message-ID: <vi2lqsbu5yiak2xayq3xkpx5wtrd7fqvicaggzaklxdubclylq@j3nztszng7x7>
References: <iqcofcntirmlwcpyfr4yabymqfcgyrij57bibf337tmxpa73t6@npkt6wquenf6>
 <527baded-f348-48a8-81cd-3f84c0ff1077@quicinc.com>
 <t5vcjlf44fhae4f2h75cfs3f7r6tdstw4ysmkapvvawj6xp23x@xnxqnxvyhshe>
 <d5151b82-5f05-4826-99b4-e925c20550b4@quicinc.com>
 <7vdaasc3flhpabnorjty5qjorlbp22honuscgpbteakgagg2tq@frqa6flk2mmv>
 <df1a4457-129e-452c-8089-ee1e6f9a3e12@quicinc.com>
 <jdw3xuknq2atcowl5xboimp3fol56t5nilefrxzpbdpwdoo5oc@pggif3lysjhh>
 <4c06aeec-161d-4e67-9a64-ac74991a0f73@quicinc.com>
 <m2dz6cw6eq7ztnfdispocvt2dxtumeazbgyts5em55n67cfxlz@fwirkughbj66>
 <b82afb57-1de3-489f-aa17-91496d0f6a48@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <b82afb57-1de3-489f-aa17-91496d0f6a48@quicinc.com>
X-Proofpoint-ORIG-GUID: dI5iAx7dRgoCo5pajqC-jfTiAAw5hQHF
X-Authority-Analysis: v=2.4 cv=ReKQC0tv c=1 sm=1 tr=0 ts=67dd5959 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Vs1iUdzkB0EA:10 a=COk6AnOGAAAA:8 a=PvVr7vRqn70wVf-c534A:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: dI5iAx7dRgoCo5pajqC-jfTiAAw5hQHF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-21_05,2025-03-20_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0
 phishscore=0 suspectscore=0 impostorscore=0 clxscore=1015 mlxscore=0
 malwarescore=0 mlxlogscore=999 priorityscore=1501 adultscore=0
 lowpriorityscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2503210091
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

On Fri, Mar 21, 2025 at 06:17:39PM +0800, Xiangxu Yin wrote:
> 
> 
> On 3/6/2025 5:25 AM, Dmitry Baryshkov wrote:
> > On Wed, Mar 05, 2025 at 06:20:45PM +0800, Xiangxu Yin wrote:
> >>
> >>
> >> On 12/20/2024 8:01 AM, Dmitry Baryshkov wrote:
> >>> On Wed, Dec 18, 2024 at 08:55:54PM +0800, Xiangxu Yin wrote:
> >>>>
> >>>>
> >>>> On 12/12/2024 3:15 AM, Dmitry Baryshkov wrote:
> >>>>> On Wed, Dec 11, 2024 at 08:50:02PM +0800, Xiangxu Yin wrote:
> >>>>>>
> >>>>>>
> >>>>>> On 12/11/2024 5:46 PM, Dmitry Baryshkov wrote:
> >>>>>>> On Wed, Dec 11, 2024 at 08:46:16AM +0800, Xiangxu Yin wrote:
> >>>>>>>>
> >>>>>>>>
> >>>>>>>> On 12/10/2024 11:09 PM, Dmitry Baryshkov wrote:
> >>>>>>>>> On Thu, Dec 05, 2024 at 08:31:24PM +0200, Dmitry Baryshkov wrote:
> >>>>>>>>>> On Thu, Dec 05, 2024 at 09:26:47PM +0800, Xiangxu Yin wrote:
> >>>>>>>>>>>
> >>>>>>>>>>>
> >>>>>>>>>>> On 11/29/2024 10:33 PM, Dmitry Baryshkov wrote:
> >>>>>>>>>>>> On Fri, 29 Nov 2024 at 09:59, Xiangxu Yin <quic_xiangxuy@quicinc.com> wrote:
> >>>>>>>>>>>>>
> >>>>>>>>>>>>> Extended DP support for QCS615 USB or DP phy. Differentiated between
> >>>>>>>>>>>>> USBC and DP PHY using the match table’s type, dynamically generating
> >>>>>>>>>>>>> different types of cfg and layout attributes during initialization based
> >>>>>>>>>>>>> on this type. Static variables are stored in cfg, while parsed values
> >>>>>>>>>>>>> are organized into the layout structure.
> >>>>>>>>>>>>
> >>>>>>>>>>>> We didn't have an understanding / conclusion whether
> >>>>>>>>>>>> qcom,usb-ssphy-qmp-usb3-or-dp PHYs are actually a single device / PHY
> >>>>>>>>>>>> or two PHYs being placed next to each other. Could you please start
> >>>>>>>>>>>> your commit message by explaining it? Or even better, make that a part
> >>>>>>>>>>>> of the cover letter for a new series touching just the USBC PHY
> >>>>>>>>>>>> driver. DP changes don't have anything in common with the PHY changes,
> >>>>>>>>>>>> so you can split the series into two.
> >>>>>>>>>>>>
> >>>>>>>>>>> Before implement DP extension, we have discussed with abhinav and krishna about whether use combo, usbc or separate phy.
> >>>>>>>>>>
> >>>>>>>>>> What is "DP extension"?
> >>>>>>>>>>
> >>>>>>>> I'm sorry confusion casued by my description. It's means extend DP implemnt for USBC phy driver.
> >>>>>>>>>>>
> >>>>>>>>>>> We identified that DP and USB share some common controls for phy_mode and orientation.
> >>>>>>>>>>> Specifically, 'TCSR_USB3_0_DP_PHYMODE' controls who must use the lanes - USB or DP,
> >>>>>>>>>>> while PERIPH_SS_USB0_USB3PHY_PCS_MISC_TYPEC_CTRL controls the orientation.
> >>>>>>>>>>> It would be more efficient for a single driver to manage these controls. 
> >>>>>>>>>>
> >>>>>>>>>> The question is about the hardware, not about the driver.
> >>>>>>>>>>
> >>>>>>>>>>> Additionally, this PHY does not support Alt Mode, and the two control registers are located in separate address spaces. 
> >>>>>>>>>>> Therefore, even though the orientation for DP on this platform is always normal and connected to the video output board, 
> >>>>>>>>>>> we still decided to base it on the USBC extension.
> >>>>>>>>>>
> >>>>>>>>>> Could you please clarify, do usb3-or-dp PHYs support DP-over-USB-C? I
> >>>>>>>>>> thought that usbc-or-dp platforms support that, but they don't
> >>>>>>>>>> support DP+USB pin configuration. Note, the question is broader than
> >>>>>>>>>> just QCS615, it covers the PHY type itself.
> >>>>>>>>>>
> >>>>>>>>>> Also, is TCSR configuration read/write or read-only? Are we supposed to
> >>>>>>>>>> set the register from OS or are we supposed to read it and thus detemine
> >>>>>>>>>> the PHY mode?
> >>>>>>>>>
> >>>>>>>>> Any updates on these two topics?
> >>>>>>>>>
> >>>>>>>> Still confirming detail info with HW & design team.
> >>>>>>>> I’ll update the information that has been confirmed so far.
> >>>>>>>> This phy support DP-over-USB-C,but it's not support alt-mode which 2 lane work for DP, other 2 lane work for USB.
> >>>>>>>> TCSR phy mode is read/write reg and we can read for determine phy mode.
> >>>>>>>
> >>>>>>> Ok, thanks for the explanation. From my point of view:
> >>>>>>>
> >>>>>>> - Implement the DP PHY to be a part of the same driver. Each device
> >>>>>>>   supported by the usbc driver should get both PHYs.
> >>>>>>>
> >>>>>>> - Make sure not to break the ABI: #phy-cells = <0> should still work and
> >>>>>>>   return USB PHY, keeping backwards compatibility. Newer devices or
> >>>>>>>   upgraded DT for old devices should return USB PHY for <... 0> and DP
> >>>>>>>   PHY for <... 1>.
> >>>>>>>
> >>>>>> Yes, currently we have implemented like your description,
> >>>>>> Each deivce shoud get both PHYs, DP PHY for <... 1> and USB PHY for <... 0>.
> >>>>>
> >>>>> Please note the backwards compatibility clause.
> >>>>>
> >>>> For the USB node, we kept the same implementation as the original function interface, and the devicetree node definition also remains unchanged.
> >>>> In subsequent patches, I will follow Krzysztof’s suggestion to use a separate DT-binding to describe the DP PHY configuration, 
> >>>> without making changes to the USB devicetree and DT-binding implementation.
> >>>>>>> - I'm not shure how to handle the USB and DP coexistence, especially in
> >>>>>>>   your case of the USB-or-DP PHY.
> >>>>>>>
> >>>>>> For coexistence process:
> >>>>>>
> >>>>>> When we start implement DP part, usb driver team said only need config TCSR phy mode and orientation during switch in USB-C port.
> >>>>>> Based on your previous comments avout SW_PWRDN, I'm confirming with the USB team whether SW_REST/SWPWRDN/START_CTRL registers might affect DP.
> >>>>>
> >>>>> Thanks!
> >>>>>
> >>>>>> Anyway, even though the original SoC design supports DP or USB over Type-C，
> >>>>>> but on QCS615 ADP AIR platform, there are only four USB-A port which works with 'qcs615-qmp-usb3-phy' driver, and no USB-C port.
> >>>>>> DP port is mappped from usb pin to the video out sub-board.
> >>>>>> so we are unable to verify the switching case between DP and USB devices under USB-C.
> >>>>>
> >>>>> That's also fine. We will get to that point once MSM8998 / SDM660
> >>>>> get USB-C support (the only current blocker is the support for the
> >>>>> TYPEC block of the PMI8998).
> >>>>>
> >>>> I can't access MSM8998 / SDM660 documents now, but I have confirmed detail info about USB & DP phy design for sm6150.
> >>>>
> >>>> The 'usb-ssphy-qmp-usb3-or-dp PHY' on the current platform is essentially composed of three sub-PHYs, 
> >>>> which can even be considered as three separate PHYs: USB3 primary PHY, USB3 secondary PHY, and USB3 DP PHY.
> >>>
> >>> I've looked at sm6150-usb.dtsi and now I'm completely puzzled by your
> >>> answer. The msm-4.14 kernel lists a single USB QMP PHY at 0x88e6000,
> >>> used for the primary USB3 host. It it defined as
> >>> qcom,usb-ssphy-qmp-usb3-or-dp. Secondary USB host is listed as USB 2.0
> >>> only. So what do you mean by the USB3 secondary PHY? Which PHY and which
> >>> pins are connected to your video-out board?
> >>>
> >> Five PHYs are integrated into Talos SoC: two USB2 PHYs, two USB3 PHYs, and one DP PHY.
> >> PERIPH_SS_QUSB2PHY_PRIM_QUSB2PHY_PRIM_CM_QUSB2_LQ_1EX (0x088E2000)
> >> PERIPH_SS_QUSB2PHY_SEC_QUSB2PHY_SEC_CM_QUSB2_LQ_1EX (0x088E3000)
> >> PERIPH_SS_USB0_USB3PHY_USB0_USB3PHY_CM_USB3_SW (0x088E6000)
> >> PERIPH_SS_USB1_USB3PHY_USB1_USB3PHY_CM_USB3_SW (0x088E8000)
> >> PERIPH_SS_DP_PHY_DP_PHY_CM_DP_4LN_SW (0x088E9000)
> >>
> >> The USB3 secondary PHY(0x088E8000) is the one mutually exclusive with the DP PHY, which controlled by the TCSR switch.
> >> USB3 secondary PHY is not configed in qcs615 dtsi.
> > 
> > Okay, thanks for the explanation. I'm still puzzled by msm-4.14 defining
> > primary USB3 PHY as 'qcom,usb-ssphy-qmp-usb3-or-dp', but it might be
> > some kind of a hack or just a difference between QCS615 and SM6150.
> > 
> > If QCS615 follows other platforms of the same generation, I'd assume
> > that the correct way to handle it would be:
> > 
> > - Keep the primary USB3 PHY as is (it needs to be reposted though, the
> >   driver part didn't make it in).
> > 
> > - Extend the qmp-usbc driver to support USB+DP 'exclusive combo' PHYs by
> >   registering two PHYs for a single device. Make sure to continue
> >   supporting #phy-cells = 0 and region size = 0x1000. Use definitions
> >   from include/dt-bindings/phy/phy-qcom-qmp.h .
> > 
> To avoid any misunderstandings, let me double-confirm these points.
> 
> 1.In this patch [PATCH 3/8], 
> we didn't modify the USB driver logic; we only adjusted the structure and organizational relationships. 
> Does the first point suggest splitting this patch and isolating the USB structure changes into a separate patch?
> Or did I misunderstand?

I don't understand your question. See below.

> 
> 2. Does "two PHYs for a single device" means should define both usb PHY and DP PHY in dtsi, the USBC PHY driver's probe will run separately for both USB and DP?
> Then USB PHY node can keep forward compatibility with prop '#clock-cells = <0>' & '#phy-cells = <0>',
> and DP PHY will define with prop '#clock-cells = <1>' & '#phy-cells = <1>'.

No. It means replacing extending existing entries with bigger reg and
#phy-cells = <1>. The driver must keep working with old node definitions
as is to ensure backwards compatibility. New nodes should make it
register two PHYs (USB3 and DP). On the driver side modify generic code
paths, all platforms supported by the driver should be able to support
USB3+DP combination.

> 
> > - Make sure that the PHY driver doesn't allow both PHYs to be powered
> >   on. Add TCSR programming to the power_on / power_off callbacks,
> >   implementing the switch between DP and USB3.
> > 
> Ok, I will add TCSR switch logic to DP power_on / power_off callbacks, 
> During DP power off, default will reset to USB3 PHY.

Not quite. Both USB3 and DP drivers should be calling power_on / _off.
If USB3 is on, powering on DP PHY should fail. Vice versa, if DP is on,
powering on USB should fail.

> 
> > At this point all PHYs in qmp-usbc can be switched to the new USB+DP
> > configuration, still providing backwards compatibility with the existing
> > board DTs.
> > 
> >> In Ride, DP PHY, DP lane 0~3 and DP aux pins are connected to video-out board.
> >>>>
> >>>> On the QCS615, the USB primary PHY is currently used to handle USB 3.0 communication for the previously mentioned four USB Type-A ports, 
> >>>> while the USB3 secondary PHY and USB3 DP PHY are used for the output of the Type-C port,
> >>>> but since the Type-C port is forcibly pin-to-pin configured to the video out board, the Type-C port will always configure as DP PHY.
> >>>>
> >>>> The internal registers of these three PHYs are independent of each other, Neither their respective SWPWR_DN nor SWRST will affect the other two PHYs.
> >>>> Additionally, there was a misunderstanding about the orientation previously.
> >>>> The USB orientation setting only affects the current PHY and does not impact the DP PHY. The DP PHY is configured in the DP_PHY_CFG_1.
> >>>>
> >>>> TSCR_PHY_MODE can specify which PHY outputs to the Type-C port, and the global reset will simultaneously reset the two associated PHYs. 
> >>>> Therefore, the correct switching process is as follows.
> >>>> When switching the inserted device:
> >>>> 	1.Identify the PHY type.
> >>>> 	2.Enable the regulator.
> >>>> 	3.Trigger a reset.
> >>>> 	4.Enable the clock.
> >>>> 	5.Configure PHY type related orientation
> >>>> 	6.switch the TCSR PHY mode.
> >>>> 	7.Configure the registers of PHY.
> >>>> During release:
> >>>> 	1.Reset.
> >>>> 	2.Disable the clock.
> >>>> 	3.Disable the regulator.
> >>>>
> >>>> Our current design overall complies with this process, but it lacks the configuration for DP_PHY_CFG_1.
> >>>>
> >>>> Shall we continue the discussion to clarify remain comments of the USBC driver?
> >>>>
> >>>>>> However, I'm also confirming whether anything other will affect USB and DP each other.
> >>>>>
> >>>>
> >>>
> >>
> > 
> 

-- 
With best wishes
Dmitry
