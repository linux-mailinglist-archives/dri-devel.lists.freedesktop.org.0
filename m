Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CB2C4CD5CD1
	for <lists+dri-devel@lfdr.de>; Mon, 22 Dec 2025 12:25:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8544510E06D;
	Mon, 22 Dec 2025 11:25:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="Ezri3mmK";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ZYS/nzE/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2A8E210E06D
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Dec 2025 11:25:10 +0000 (UTC)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5BM7br2b3560022
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Dec 2025 11:25:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=iWSRj4xOS49AfDZxODi+vOvE
 +0IKhcDdBzG5hEFHaBY=; b=Ezri3mmKJBBTikVVZUXDNDVNoTcfcDB+hq3cgIid
 HS+YNZZyXD6sD2OG+HzFSaU8QntiGlf/BXdJo0q9lzs59kal60FoEpSK11S+DbAq
 sEvJ5e0udyJeFFiWQYo2uy88G/FlYOa7e4uCZkXUldDlD9JNdAnl2Ie/1Vj8e8gE
 NbVVeBiise5pzJJEcu2L+e5kxVM/jjetJHa0HIn/G7JY4Ij71hVYsGFTLnJx6XLL
 G/FkpaCwesGiB5FiDTyewuNQKwg8qtvrWaEHhBlfC6g1oWMhq4Enl6Ucj9HRhBkr
 tnZHlRki9LzMAy0dIDIDKGccRD2UCeYOz7nupbhnhACN6w==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com
 [209.85.216.71])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b69ahk4bt-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Dec 2025 11:25:09 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id
 98e67ed59e1d1-34c387d3eb6so3675511a91.2
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Dec 2025 03:25:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1766402709; x=1767007509;
 darn=lists.freedesktop.org; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=iWSRj4xOS49AfDZxODi+vOvE+0IKhcDdBzG5hEFHaBY=;
 b=ZYS/nzE/ijpawLcQkYxipLXnF6JSKDPXIDhKbdE0TMOZsuaXGaXnNJrmuhr/h0GyB/
 EH+1mLdImPTC3L76oGJ4XJr3iZigfoIvtPHi1rAn8sOMQ+h21ywfXZBS8KQFDm7POWN9
 MKTyP9lsb67JDRK9IUc0i2/tUEKCTmg/tbl45VAhsHDRIz/VAYUZ2gvwL+CEApMTkbvC
 jvaMSsEhyq4OhqInWQIVRHnG1zKadd2cE1xeN0KBBYeyuaqSYxSJsSyHLQu0hSTkyJZF
 kcCD6loabheYaXKPjHG3FWZy+7tsFVmABDS/3PApy7yow0ATP9c78Kw9jWKzEwGkwwUo
 jPyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1766402709; x=1767007509;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=iWSRj4xOS49AfDZxODi+vOvE+0IKhcDdBzG5hEFHaBY=;
 b=QpUS/FBGQiVqZMOgliahlcJ7zakQVzAczqtU/ZkDF4Doh7/vnXDCOt00Oybmkqj2W/
 cDCWLozKTp4zuLXcjG2KlrMU/24tEFDv448LtNxQvdD65XB0PYP/XyMTWChNzw8Rql7L
 aq8CAgw1RyuGezDn1GJ2/AKbOXJ7iv3D/xNqn5IiMdDzGXxQBL655uOzE5vD6oVPJfV3
 9nWqX0EVOSWdGvtRlSeZjxAKQYR1CLyZA0mvdxaaq4mRsc46Z1N0yG2Excup80EGGUST
 etRwu/tb/ThzDirXLO5In9+oFs2WeA5Efs2ZnensttItI1lt9bpqammGJe8X1HaZic8t
 6sQQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWUWhHZ8XOrUWfk2XMrJn6wQ2NQ8LO+Ck7CN6idZpf/lCj245y2Sm3pkvsqTvIV/WnNJ5pK3a0X/eM=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzckS2YaJ1orF5tBirebK3vUL59x10WO2y5N2DagVlge/mcIb86
 SAixEAQt512NML0GnFtNqGN4EUeC7E+4tx+BmBtIEu+rK84GMn77kIOnMZuLBWB++N2/76c3nQW
 qakyEKwD5a6rU0mo647FA2F8ekKqHX4buwqda1GM/281r/1f1BYCvXfhA7oPThonB7c8cvmmhoz
 KoRi5kvHzDXqGWDjXP5x6RRGnADqmiATFAZzm008/9aR9e/w==
X-Gm-Gg: AY/fxX5vlsoTg+49+G8Wm8v9PYVvpVMKV/kX7pHWkZX8hG6bzEp4f7+yn5DgiFvRk3Y
 z20qDEIHTwYcSed9fzjxHdi2WqK5uZ4pO4Anmvr+fQN00Uast/RfL61/7C0hYV1hu5jyWvoWjiF
 vb9Iz6QIL5HG7zzy9MxJBS6FD2agQlbGEsxb/h0MJrwYiyqlyDZ0GKURqToh0gg/ebjee0w23Ix
 p0O+WVF
X-Received: by 2002:a17:90b:518d:b0:343:7714:4caa with SMTP id
 98e67ed59e1d1-34e9211c415mr9308370a91.3.1766402708748; 
 Mon, 22 Dec 2025 03:25:08 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEsO3P8/fIABQLjFUaFbFIEXwXeI5uHECCvLk+jSZOEvOad7uBLFI6CLnKRV99lGtCoKhzbAX4dppxVLXsj0No=
X-Received: by 2002:a17:90b:518d:b0:343:7714:4caa with SMTP id
 98e67ed59e1d1-34e9211c415mr9308339a91.3.1766402708147; Mon, 22 Dec 2025
 03:25:08 -0800 (PST)
MIME-Version: 1.0
References: <6fa1da5d-9ea7-4d72-a03a-82edc4bef099@oss.qualcomm.com>
 <3gqq3w6ovy5srgvabyeugsjbwrhaxmjvicykhjmlcxd74gtsaf@5u6wvvzeq52z>
 <90bc84e7-19ca-450d-b41f-fd96367e8cce@oss.qualcomm.com>
 <2e5sqv2gnxdfwnfsepzdkchxip5zdeamp6bzbamq6kbk77kr3p@u5i4rrnrywno>
 <9971bd9b-88db-4628-b36b-de50c1619396@oss.qualcomm.com>
 <raj276z7euq7skvhsw7prwzlgsdy6ay7bhm4wgb64mt63q4ot4@eyvhcou7qwgg>
 <57706b2e-becf-47ac-a874-79ce17d12b74@oss.qualcomm.com>
 <812cfa55-269d-4b19-8e18-4815608b6bbb@oss.qualcomm.com>
 <6agidc2r2d2jevtiizj77mtlytoo3raxaoe6b53rvk3obmmiha@x7pqjco4ulhg>
 <030a8eb3-c79e-4be0-8305-7c9bb2005785@oss.qualcomm.com>
 <wwrc637p5nkz6ptuef2hrhyjgqnyifcztlkjrqyw4764vg6jpf@wso4tp6onb5l>
 <1afebfb7-00aa-4f19-b6c7-dd6fadb83664@oss.qualcomm.com>
 <CAO9ioeXqP5i9hEa-DfrEvK3U-3py9KjdMmWnjzZ9kGd4BPqdYw@mail.gmail.com>
 <9fd21cf7-6576-4091-81ab-a09be6b7579b@oss.qualcomm.com>
In-Reply-To: <9fd21cf7-6576-4091-81ab-a09be6b7579b@oss.qualcomm.com>
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Mon, 22 Dec 2025 13:24:56 +0200
X-Gm-Features: AQt7F2rZBUJOlPi2G-8HRC0BwIzXNKNG1B-P46eRIcqwHEIvts_GZw9UM3EW5ys
Message-ID: <CAO9ioeXKBD0ab2+FmNnFQozKq_cp+hFwc5B6LtgfEC2FLULUYQ@mail.gmail.com>
Subject: Re: [PATCH v3 5/6] arm64: dts: qcom: sm6150: Add gpu and rgmu nodes
To: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Jessica Zhang <jesszhan0024@gmail.com>,
 Dan Carpenter <dan.carpenter@linaro.org>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, Jie Zhang <quic_jiezh@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
X-Authority-Analysis: v=2.4 cv=JuH8bc4C c=1 sm=1 tr=0 ts=69492a95 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=COk6AnOGAAAA:8
 a=TCJ3qRJy67llW4gWdqQA:9 a=QEXdDO2ut3YA:10 a=uKXjsCUrEbL0IQVhDsJ9:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: R7lPLnZGWsNxn_PxqNBghEr-MCKkZnEb
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjIyMDEwMyBTYWx0ZWRfX2Fw9IKieFuo3
 NNfbX5rbtet2ALDSjMizbzIrYxChbOSh5rxBoWDxUhDE9lT8JMAoKLxuHEc8HfLO1fJuOM58VUc
 elzUHJTPWpUQ1fymqcSYLAI1mISZm3k1zdAoFU/5fLFQc8PF7WwFHGQcNLN4ubGQKeR24JArszd
 JT2A5IAG+MO1po+GT76T2sBjyUqb0fon8jNzN2tMNACyXRgBZUuTlNY52vcQ+4UU2Q4dHcUV9YJ
 63eD3es31ycPf86SkOjQi5boW8Xk0tyPy4nOQtaPzuM4Eq12WtCCtyOTiKUKXqkZIFxz5HJ2V3F
 ZlI1UsIW1rtBCyCTV6hRU7hgisCyls9+1mSrNKrHWIlEpk53b636Gal1EcBYo071PTVY0zwzjPP
 N8DIRcgHlpqzhmoeIi+0X6PL1fz9ymSflTjuSAcBwNTay1ar8zFwtBfDw77Q8vxhJ+SGxlDkk5A
 U+H7F4Z5E/ucNnZR+vw==
X-Proofpoint-GUID: R7lPLnZGWsNxn_PxqNBghEr-MCKkZnEb
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-21_05,2025-12-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 adultscore=0 phishscore=0
 lowpriorityscore=0 clxscore=1015 impostorscore=0 suspectscore=0 spamscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2512220103
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

On Mon, 22 Dec 2025 at 12:54, Akhil P Oommen <akhilpo@oss.qualcomm.com> wrote:
>
> On 12/22/2025 2:45 PM, Dmitry Baryshkov wrote:
> > On Mon, 22 Dec 2025 at 09:19, Akhil P Oommen <akhilpo@oss.qualcomm.com> wrote:
> >>
> >> On 12/13/2025 12:58 AM, Dmitry Baryshkov wrote:
> >>> On Fri, Dec 12, 2025 at 01:01:44AM +0530, Akhil P Oommen wrote:
> >>>> On 12/11/2025 6:56 PM, Dmitry Baryshkov wrote:
> >>>>> On Thu, Dec 11, 2025 at 05:22:40PM +0530, Akhil P Oommen wrote:
> >>>>>> On 12/11/2025 4:42 PM, Akhil P Oommen wrote:
> >>>>>>> On 12/11/2025 6:06 AM, Dmitry Baryshkov wrote:
> >>>>>>>> On Thu, Dec 11, 2025 at 02:40:52AM +0530, Akhil P Oommen wrote:
> >>>>>>>>> On 12/6/2025 2:04 AM, Dmitry Baryshkov wrote:
> >>>>>>>>>> On Fri, Dec 05, 2025 at 03:59:09PM +0530, Akhil P Oommen wrote:
> >>>>>>>>>>> On 12/4/2025 7:49 PM, Dmitry Baryshkov wrote:
> >>>>>>>>>>>> On Thu, Dec 04, 2025 at 03:43:33PM +0530, Akhil P Oommen wrote:
> >>>>>>>>>>>>> On 11/26/2025 6:12 AM, Dmitry Baryshkov wrote:
> >>>>>>>>>>>>>> On Sat, Nov 22, 2025 at 03:03:10PM +0100, Konrad Dybcio wrote:
> >>>>>>>>>>>>>>> On 11/21/25 10:52 PM, Akhil P Oommen wrote:
> >>>>>>>>>>>>>>>> From: Jie Zhang <quic_jiezh@quicinc.com>
> >>>>>>>>>>>>>>>>
> >>>>>>>>>>>>>>>> Add gpu and rgmu nodes for qcs615 chipset.
> >>>>>>>>>>>>>>>>
> >>>>>>>>>>>>>>>> Signed-off-by: Jie Zhang <quic_jiezh@quicinc.com>
> >>>>>>>>>>>>>>>> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
> >>>>>>>>>>>>>>>> ---
> >>>>>>>>>>>>>>>
> >>>>>>>>>>>>>>> [...]
> >>>>>>>>>>>>>>>
> >>>>>>>>>>>>>>>> +                        gpu_opp_table: opp-table {
> >>>>>>>>>>>>>>>> +                                compatible = "operating-points-v2";
> >>>>>>>>>>>>>>>> +
> >>>>>>>>>>>>>>>> +                                opp-845000000 {
> >>>>>>>>>>>>>>>> +                                        opp-hz = /bits/ 64 <845000000>;
> >>>>>>>>>>>>>>>> +                                        required-opps = <&rpmhpd_opp_turbo>;
> >>>>>>>>>>>>>>>> +                                        opp-peak-kBps = <7050000>;
> >>>>>>>>>>>>>>>> +                                };
> >>>>>>>>>>>>>>>
> >>>>>>>>>>>>>>> I see another speed of 895 @ turbo_l1, perhaps that's for speedbins
> >>>>>>>>>>>>>>> or mobile parts specifically?
> >>>>>>>>>>>>>>
> >>>>>>>>>>>>>> msm-4.14 defines 7 speedbins for SM6150. Akhil, I don't see any of them
> >>>>>>>>>>>>>> here.
> >>>>>>>>>>>>>
> >>>>>>>>>>>>> The IoT/Auto variants have a different frequency plan compared to the
> >>>>>>>>>>>>> mobile variant. I reviewed the downstream code and this aligns with that
> >>>>>>>>>>>>> except the 290Mhz corner. We can remove that one.
> >>>>>>>>>>>>>
> >>>>>>>>>>>>> Here we are describing the IoT variant of Talos. So we can ignore the
> >>>>>>>>>>>>> speedbins from the mobile variant until that is supported.
> >>>>>>>>>>>>
> >>>>>>>>>>>> No, we are describing just Talos, which hopefully covers both mobile and
> >>>>>>>>>>>> non-mobile platforms.
> >>>>>>>>>>>
> >>>>>>>>>>> We cannot assume that.
> >>>>>>>>>>>
> >>>>>>>>>>> Even if we assume that there is no variation in silicon, the firmware
> >>>>>>>>>>> (AOP, TZ, HYP etc) is different between mobile and IoT version. So it is
> >>>>>>>>>>> wise to use the configuration that is commercialized, especially when it
> >>>>>>>>>>> is power related.
> >>>>>>>>>>
> >>>>>>>>>> How does it affect the speed bins? I'd really prefer if we:
> >>>>>>>>>> - describe OPP tables and speed bins here
> >>>>>>>>>> - remove speed bins cell for the Auto / IoT boards
> >>>>>>>>>> - make sure that the driver uses the IoT bin if there is no speed bin
> >>>>>>>>>>   declared in the GPU.
> >>>>>>>>>>
> >>>>>>>>>
> >>>>>>>>> The frequency plan is different between mobile and IoT. Are you
> >>>>>>>>> proposing to describe a union of OPP table from both mobile and IoT?
> >>>>>>>>
> >>>>>>>> Okay, this prompted me to check the sa6155p.dtsi from msm-4.14... And it
> >>>>>>>> has speed bins. How comes we don't have bins for the IoT variant?
> >>>>>>>>
> >>>>>>>> Mobile bins: 0, 177, 187, 156, 136, 105, 73
> >>>>>>>> Auto bins:   0, 177,      156, 136, 105, 73
> >>>>>>>>
> >>>>>>>> Both Mobile and Auto chips used the same NVMEM cell (0x6004, 8 bits
> >>>>>>>> starting from bit 21).
> >>>>>>>>
> >>>>>>>> Mobile freqs:
> >>>>>>>> 0:         845M, 745M, 700M,       550M,       435M,       290M
> >>>>>>>> 177:       845M, 745M, 700M,       550M,       435M,       290M
> >>>>>>>> 187: 895M, 845M, 745M, 700M,       550M,       435M,       290M
> >>>>>>>> 156:             745M, 700M,       550M,       435M,       290M
> >>>>>>>> 136:                         650M, 550M,       435M,       290M
> >>>>>>>> 105:                                     500M, 435M,       290M
> >>>>>>>> 73:                                                  350M, 290M
> >>>>>>>>
> >>>>>>>> Auto freqs:
> >>>>>>>> 0:         845M, 745M, 650M, 500M, 435M
> >>>>>>>> 177:       845M, 745M, 650M, 500M, 435M
> >>>>>>>> 156:             745M, 650M, 500M, 435M
> >>>>>>>> 136:                   650M, 500M, 435M
> >>>>>>>> 105:                         500M, 435M
> >>>>>>>> 73:                                      350M
> >>>>>>>>
> >>>>>>>> 290M was a part of the freq table, but later it was removed as "not
> >>>>>>>> required", so probably it can be brought back, but I'm not sure how to
> >>>>>>>> handle 650 MHz vs 700 MHz and 500 MHz vs 550 MHz differences.
> >>>>>>>>
> >>>>>>>> I'm a bit persistent here because I really want to avoid the situation
> >>>>>>>> where we define a bin-less OPP table and later we face binned QCS615
> >>>>>>>> chips (which is possible since both SM and SA were binned).
> >>>>>>>
> >>>>>>> Why is that a problem as long as KMD can handle it without breaking
> >>>>>>> backward compatibility?
> >>>>>>
> >>>>>> I replied too soon. I see your point. Can't we keep separate OPP tables
> >>>>>> when that happen? That is neat-er than complicating the driver, isn't it?
> >>>>>
> >>>>> I have different story in mind. We ship DTB for IQ-615 listing 845 MHz
> >>>>> as a max freq without speed bins. Later some of the chips shipped in
> >>>>> IQ-615 are characterized as not belonging to bin 0 / not supporting 845
> >>>>> MHz. The users end up overclocking those chips, because the DTB doesn't
> >>>>> make any difference.
> >>>>
> >>>> That is unlikely, because the characterization and other similiar
> >>>> activities are completed and finalized before ramp up at foundries.
> >>>> Nobody likes to RMA tons of chipsets.
> >>>>
> >>>> Anyway, this hypothetical scenarios is a problem even when we use the
> >>>> hard fuse.
> >>>
> >>> So, are you promising that while there were several characterization
> >>> bins for SM6150 and SA6155P, there is only one bin for QCS615, going up
> >>> to the max freq?
> >>
> >> I have cross checked with our Product team. I can confirm that for both
> >> internal and external SKUs of Talos IoT currently, there is only a
> >> single bin for GPU with Fmax 845Mhz.
> >
> > Okay. Thanks for the confirmation.
> >
> > What happens when somebody starts working on a phone using SM6150 SoC
> > (e.g. Xiaomi Redmi Note 7 Pro)?
>
> Update it in a way without disturbing the qcs615-ride.dtb? It is safe if
> we add speedbin for Mobile in future, because KMD can correctly handle both.

Corresponding entry in a6xx_catalog.c will receive speed bin
information. Will that break compatibility with the existing
qcs615-ride.dtb?

>
> > Likewise, If I understand correctly, QCS615 RIDE aka ADP Air uses an
> > auto SKU rather than the IoT one (please correct me if I'm wrong
> > here).
> >
>
> AFAIK, IoT variant is QCS615 and Auto variants uses SA6155P chipset.
> Both chipsets are functionally same except some fuses.

Ah, ok. I wasn't sure if we are using QCS615 or SA6155P in the Ride devices.

-- 
With best wishes
Dmitry
