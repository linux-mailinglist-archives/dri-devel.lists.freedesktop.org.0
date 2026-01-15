Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 64CABD28333
	for <lists+dri-devel@lfdr.de>; Thu, 15 Jan 2026 20:46:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8C67610E7D0;
	Thu, 15 Jan 2026 19:46:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="f06KBkMP";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ce+htOuz";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4117E10E7D0
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Jan 2026 19:46:35 +0000 (UTC)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 60FFfxU82311995
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Jan 2026 19:46:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 2vqG0Xwcvw1m5QoA2bFKvtDTrDgmpYgcSd1vh/Rdg24=; b=f06KBkMPuuzUpZdt
 hc0GhaR7F5/UUSvTMARYQMKYFhN+D1bHNCumHk4tdc0JvUmZQVhRxDnUkw/8n4cw
 2apWznBkt1tC+FyG6i8w4iI4n6vEOHvDfmdVOhlIVAM2kT2TPE8NF/tID0BHW/uo
 /ERKarByIioVKl83NGMaLietPKePFQFKpcqQ298Ppa9s301BTEfHiP0enoCbHue6
 cm25FGOU+puVeWqGWCAV4/WERQ8qHCwU3+FLL5zDQcgpUZ/E3E1CB1QOeYMCi77f
 T0LZF3x+Mh8mX2KZBiUiWDH33ZadB4IcDiYZ3AES5rZVH18UxaWAwhF6MuOKUpmJ
 smnxSA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bq340guut-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Jan 2026 19:46:34 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id
 af79cd13be357-8c5329ed28bso314026685a.2
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Jan 2026 11:46:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1768506393; x=1769111193;
 darn=lists.freedesktop.org; 
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=2vqG0Xwcvw1m5QoA2bFKvtDTrDgmpYgcSd1vh/Rdg24=;
 b=ce+htOuz32k0Msv39ZSD+YgI0Dsuo6pERdqNzUn2tl1e8EarckvC9CXzXvnSODrUXO
 OzrLpv827ysqZPGXFlR371WiZ6/objiodiQHoMY4CLmGtO2ERUvFlfv92l4+OAMQeG81
 TwSjjxeG9t6a+BzCPqkmfJsg1SrJYfoWXnkSKi5YOMh1w94kOAv9BU+BXqYgdYUHBDia
 WyP6R7rKFmkTIBMV1F5tTohCKDCXrLY3BL9p+OGaI1zyucdH8q6ckq2R+EccTUCJZV/C
 K6WOFr+5gZr8zU049E6X5LGKS7sajYmqKPM8q9Bamo+0iuJs/UGYxivdGfKNleNe4QLc
 I/ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768506393; x=1769111193;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=2vqG0Xwcvw1m5QoA2bFKvtDTrDgmpYgcSd1vh/Rdg24=;
 b=DO5jxRlrAR5tcDtVk4hJiB5lOKS/5wmhHDbmXnMXSTBGudhQezOWP9BuixUZ2q0Mou
 Za/4AJZMa2Txids2Pq0g2EMD0el1kCMPB3sslh0/Ngz6+/ZP/PlaZfkeBmcLESTgv2JQ
 ahF1R/+5KSWPYSnJ+G/YgYXzrNzMOYgsn+Vl3rrNZsjhW5mOnt1hNU5aiv0k4+LpM31k
 LzQSXnK8GMRZpQS6V5miCmaumbyp7deP8hPVnvo/CuchxFanBZHz2m9PjSAEM8kx45oD
 l7uu8HObOumaday6WsgYUmVNYlr5l4cVCq/Sg7HMnhPb9pWpTF9OQNj1S3hh/R82S0Sx
 XTcg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWpKUrM4bS1bdWWvI73/gmF0IaKzHKSTbZ/TkDDK+gMum6L6DLkZI6vyrY2Zvk6PWvlaEx67D2u07Q=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxDVLNgZURmw/TaPT4zMlYsYCH9cNLhQgmET6swEQkEkVUyRfjC
 YPpp4zgNhjez8Hm8EGPB0+7h/N7CgysTH2Ban105ya1C3exkH6oG6fSoGG3jzjoIAXlatF2JpsF
 esOlGa907jImFCPCrQ27Z6aOhK7bKMK9aAFzHbKkKvmwd2rdTryPmV0OI44NnWINFyXnhDG4=
X-Gm-Gg: AY/fxX7buV2M+Eq1BecB/Slkge1Sq14WgFyxSma+fWmsGbj7jQ5P7tZ8386FLyZuLCB
 23jRt+yg20Yh4qZIlsCBlsLbq+7U7aGuql+29hA8ggOtO6uuc+gHm+9T4odoCIxRksEQ2LGXuNN
 Z3u2OiiWMoOjtw0ZsvQnV1NbRjVd4SM70nLQdev3+Pot14ehhMBBmFE6jibX5PuauMtZd3gQL9c
 Esm6U2DfqHqpPU8YZjPNPlig3OSemkTD4Qa7IQmEeyTx9suqVYQF/ZAZTS+GlKxe2hCoJh2vd7e
 +/m6iP33HO1Ajx3Wv56iTRkOSuoaCeuhbQooBabg/RQu+GwXPP0dDZKeGMDg4qhRg+fu3w+aQZ2
 rejDLBIl/xfbUMTzu4+VveFL7Zo221n/t3YEkPlKxIv3nPI02M7ilFreus+O0oCErFPd9WNPhL4
 eHns/PYvr1K+uahcDsqKgR8Tw=
X-Received: by 2002:a05:620a:4155:b0:8a2:bff5:40d9 with SMTP id
 af79cd13be357-8c6a66d1590mr97231985a.16.1768506393399; 
 Thu, 15 Jan 2026 11:46:33 -0800 (PST)
X-Received: by 2002:a05:620a:4155:b0:8a2:bff5:40d9 with SMTP id
 af79cd13be357-8c6a66d1590mr97227385a.16.1768506392844; 
 Thu, 15 Jan 2026 11:46:32 -0800 (PST)
Received: from umbar.lan
 (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-38384bc471dsm1191491fa.0.2026.01.15.11.46.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 15 Jan 2026 11:46:32 -0800 (PST)
Date: Thu, 15 Jan 2026 21:46:28 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Nicolas Dufresne <nicolas@ndufresne.ca>,
 Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
 Akhil P Oommen <akhilpo@oss.qualcomm.com>,
 Jessica Zhang <jesszhan0024@gmail.com>
Cc: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
 Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
 Abhinav Kumar <abhinav.kumar@linux.dev>, Bryan O'Donoghue <bod@kernel.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, freedreno@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v2 0/3] Add support for QC08C format in iris driver
Message-ID: <qkkjsjvhwovbh7stjc53htkt3wucd34nzcvnkilnbxv4ukbozj@e4ierwjhs7wp>
References: <20251008-video-iris-ubwc-enable-v2-0-478ba2d96427@oss.qualcomm.com>
 <s2qjimx4tq2jdnir7b5dljf4onsbcmvb5prxcvc22q76l5cgnz@wrgcqdrl26sb>
 <50137983757d754609d8164dbdfc429b32e3d6b5.camel@ndufresne.ca>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <50137983757d754609d8164dbdfc429b32e3d6b5.camel@ndufresne.ca>
X-Proofpoint-GUID: l7E8HPNCMyACDN-gZsLvZDuj2erKeF6u
X-Authority-Analysis: v=2.4 cv=bp9BxUai c=1 sm=1 tr=0 ts=6969441a cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=8nJEP1OIZ-IA:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=e5mUnYsNAAAA:8 a=9hB0ncMiyRH3-G76khgA:9
 a=3ZKOabzyN94A:10 a=wPNLvfGTeEIA:10 a=PEH46H7Ffwr30OY-TuGO:22
 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-ORIG-GUID: l7E8HPNCMyACDN-gZsLvZDuj2erKeF6u
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE1MDE1NCBTYWx0ZWRfX3t6J+eMjdFNf
 gxlpOqrUsS6SqVf9xFRSBSNWKSjh3aRSwJJXJY8hTxRUZUs9AU2/poGt+7Q7F/4kM5C+Q2Pvzs5
 rWOA5KOaapaeO2dDfW8FFpikW6ZI2MFc4Ta3elDShSfid8TkmQUjD75FOd51Ty/H9QfoZybi8bT
 j3NYsp6PjZotyCku0uWdzFhPaT48VGk995Q2CLGhohHYmh1szFi6s0cmjzoCxvkf2L/JiOTa56f
 FlR1iAh8eColB+1X2t8+ygy3nnrl58Uuy4R2cfu46UMq7SbeXukikLfMKEeDQ+RFosURNRxNz52
 o4HoGk7gIGAIqmJSIeMv8EbWO0fHfNyA4K3trFG4GIwU3RrKS1P/E/ibTNY4QDoakcyvMHpUflL
 hTtdIhBVDDaJ1rSB6jbBP30enWmkbqWMFc2paQaCb9N1iAuXNYOR7J3YwprnUARlI70TibXs/87
 iq8vZdNEo5kE4Y8/SSg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-15_06,2026-01-15_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 bulkscore=0 impostorscore=0 malwarescore=0
 lowpriorityscore=0 phishscore=0 clxscore=1015 priorityscore=1501 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601150154
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

I should have added GPU maintainers and ML beforehand. Fixing it now.

On Thu, Jan 15, 2026 at 09:02:07AM -0500, Nicolas Dufresne wrote:
> Le jeudi 15 janvier 2026 à 10:08 +0200, Dmitry Baryshkov a écrit :
> > On Wed, Oct 08, 2025 at 03:22:24PM +0530, Dikshita Agarwal wrote:
> > > Add support for the QC08C color format in both the encoder and decoder 
> > > paths of the iris driver. The changes include:
> > > 
> > > - Adding QC08C format handling in the driver for both encoding and 
> > > decoding.
> > > - Updating format enumeration to properly return supported formats.
> > > - Ensuring the correct HFI format is set for firmware communication.
> > > -Making all related changes required for seamless integration of QC08C 
> > > support.
> > > 
> > > The changes have been validated using v4l2-ctl, compliance, and GStreamer
> > > (GST) tests.
> > > Both GST and v4l2-ctl tests were performed using the NV12 format, as 
> > > these clients do not support the QCOM-specific QC08C format, and all 
> > > tests passed successfully.
> > > 
> > > During v4l2-ctl testing, a regression was observed when using the NV12 
> > > color format after adding QC08C support. A fix for this regression has 
> > > also been posted [1].
> > > 
> > > [1]:
> > > https://lore.kernel.org/linux-media/20250918103235.4066441-1-dikshita.agarwal@oss.qualcomm.com/T/#u
> > >  
> > > 
> > > Changes in v2:
> > > - Added separate patch to add support for HFI_PROP_OPB_ENABLE (Bryan)
> > > - Updated commit text to indicate QC08C is NV12 with UBWC compression
> > > (Bryan, Dmitry)
> > > - Renamed IRIS_FMT_UBWC to IRIS_FMT_QC08C (Dmitry)
> > > - Link to v1:
> > > https://lore.kernel.org/r/20250919-video-iris-ubwc-enable-v1-0-000d11edafd8@oss.qualcomm.com
> > > 
> > > Signed-off-by: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
> > > ---
> > > Dikshita Agarwal (3):
> > >       media: iris: Add support for HFI_PROP_OPB_ENABLE to control split mode
> > >       media: iris: Add support for QC08C format for decoder
> > >       media: iris: Add support for QC08C format for encoder
> > > 
> > 
> > Looking at the series again... What is the definition of V4L formats?
> > Are they expected to be self-compatible? Transferable between machines?
> > In DRM world we made a mistake, making use of a single non-parametrized
> > UBWC modifier, and then later we had to introduce OOB values to
> > represent different params of UBWC compressed images.
> > 
> > So, I wanted to ask, is single "UBWC-compressed NV12" enough for V4L2 or
> > should we have different format values (at least for different swizzle
> > and macrotile modes)?
> 
> Our expectation is that the decoder will produce the same format regardless the
> resolution. And that format should be shareable, so that same format coming from
> two drivers means the same thing without out of band data, except that
> resolution and strides are needed oob anyway and can obviously be used as an
> acceptable workaround the issue you describe. It should also have a single
> translation to DRM fourcc + modifier, and hopefully the other way around is
> possible too, otherwise its a bit broken and unusable.

Well... As I wrote, we made a certain decision several years go: there
is only one DRM modifier. At that point the decision was made by
open-source people which had a very limited information about hardware
internals. We can probably try deprecating it and shifting towards
multiple entries. On the other side, most of the blocks would only be
able to support only one of very few possible configurations.

> 
> So bottom line, since V4L2 does not have modifiers, you have to treat one V4L2
> format as a pair of DRM fourcc + modifier. Decoders typically only support a
> subset, or hardware engineers can generally pick a handful of performant
> configurations that works for all cases (its all 2D with similarly sized
> macroblocks).

This is not quite applicable: even if we try to fix all other settings,
the format differs from platform to platform because of the memory
organisation (highest_bank_bit in drivers/soc/qcom/ubwc_config.c).

There is a description of swizzling in Mesa ([1])

[1] https://gitlab.freedesktop.org/mesa/mesa/-/blob/main/src/freedreno/fdl/fd6_tiled_memcpy.cc

> Since these formats are only usable when consumed by GPU or
> display controllers, its important that all party uses the same convention for
> the limited information available.

Yes, we added UBWC config database in order to have a single source of
information for the kernel.

So... On the practical side there can be:
 - UBWC 1.0, 2.0, 3.0, 4.0, etc.

 - swizzle 1-2-3, 2-3 and 3, partially depends on UBWC version.

 - HBB or 13, 14, 15, 16

 - bank spreading (true or false)

From the practical point of view, drivers/soc/qcom/ubwc.c defines the
following formats (currently, I'd like to cross-check some of them):

- linear
- 1.0_123_14
- 1.0_123_14_spread
- 1.0_123_15
- 2.0_23_14
- 2.0_23_14_spread
- 2.0_23_15
- 3.0_23_13_spread
- 3.0_23_14_spread
- 3.0_23_15
- 3.0_23_16
- 4.0_23_15_spread
- 4.0_23_16_spread
- 4.0_3_13_spread
- 5.0_23_15_spread
- 5.0_23_16_spread
- 6.0_23_16_spread

Would it be benefitable to define separate DRM modifiers (and NV12
compressed variant for V4L2) for each of them?

-- 
With best wishes
Dmitry
