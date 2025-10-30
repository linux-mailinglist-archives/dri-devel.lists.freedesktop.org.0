Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 40CBFC21A80
	for <lists+dri-devel@lfdr.de>; Thu, 30 Oct 2025 19:05:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5D03510E323;
	Thu, 30 Oct 2025 18:05:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="Gx8gZ6Hq";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YBPQIY/L";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C033910E31D
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Oct 2025 18:05:11 +0000 (UTC)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 59UFHIA8102774
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Oct 2025 18:05:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=hpNzVsUmvobA7lIT4TbTwiLz
 yOdc/tSke27DY7ldyFQ=; b=Gx8gZ6HqWOMBNy+5o5c1F/H1BM468lUL8C5s7jXF
 ddMnH/KTbqp4wovULa7lxwB/mo+gReXt79A1Me2YtHlMlFJWVAanAXOceF+xDmqD
 8Sb2JHkATKruHEvU/8q1khpclepcXCE6OCpd6Oc/ZEWH07BEdOXA8QVureLjpPaw
 c+FStGuplxeRwgK7gkcwkhma8ma6/fqDq7gl5aTyI4pyab2NkFSGq4Tn8rxwAFWO
 QgWUNHRtJZaRTbXxuLoG1C9mvrR3BmP6hMWncO38YLXqnNSJ3saA95vs3BaVitoR
 gsd1a8HxOYpjvBcLUQPi578hS/xMRDP/wMlkoCdMJ/aDqQ==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a4ahdggcp-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Oct 2025 18:05:11 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id
 d75a77b69052e-4e8a89c9750so37755941cf.0
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Oct 2025 11:05:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1761847510; x=1762452310;
 darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=hpNzVsUmvobA7lIT4TbTwiLzyOdc/tSke27DY7ldyFQ=;
 b=YBPQIY/LZCku60UH+XCdEq7u4tvJ3fDsYM9jR+Z0TAknhQzduWAV9IBxC41hZZh4iY
 QXN7TT8/oathLITv4gFaiLXQRmjympKui+kZd0quChitu3Pfdm12y/CJ4SDBXWPcgoi3
 tAqzg+LdcMq+MultqidNEn8nb7lA/ssU4bNYOSaU7NeQ3tztDzXztvG2xXqjrg1dw7C/
 iPDtgPz9zRgPYG66DKUOpIq9wRnoNx06qBIL38XdLF+5md50oBmB61B735w66sgle927
 9BiiwKCvCQYsP1p7jhtmbbKg1F/8V3QoXYrI968bT+NReORh5D40KojF38XMDMFH1vhT
 4Q+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761847510; x=1762452310;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=hpNzVsUmvobA7lIT4TbTwiLzyOdc/tSke27DY7ldyFQ=;
 b=kLe0LQDXobVvk8xVfeYxCE8d4Ii/gZSvK64Y3uEa6epVWWpUX4MGzt1CwmzNMw4aQS
 RdORAZWNt6qrdwttW4C/oiHjV+FAjJA9ZtQ4dD8BdcIutQbqJLtsr+49FIbsAN0HUAPd
 u/a7YKx40ZjZJPN4hObSGu32buDGRicMzqJzuHqebMPH//0WtKQv9Ha1ixX4r33OxX+p
 m62NIacY1q2AmJPJq3HZdmZ3u+mmHKqp0xMhZsnYgKVBIQJY520wQTTzZ92+tPJJ0CXy
 I0EqqW11unzipOfIqDZxmtRL08vegPPGWnD7VxyBRCXaUIL1hX1Bfds7Z8e/BWnHAgQV
 y3fQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXhHmnV4Ae6XCgNw0KZo4b8L1KAxqvhtZT9XrRZfG5Drr+8IKtKQsBG5xOiE5wvZALr6Z/f8i4WiDM=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxHNo88SHRbhBHKY0QYeQpX6elCOJJvoCxk4JjAIDrOCdao4fa3
 GXl2IrB5zbehb5Q/r5I/vmo+QTRlLwaI1+Jjl6XVd/mLTs2MvFq9PqeO7ZHEhzfff8f3U6vUSlL
 mmMch4Sj8IKd6EFkGuvQ9l1CH0jl4gnHe2tTLU3LfVXJ0NKuehNq0CKIdW6AbBzm419phcJ4=
X-Gm-Gg: ASbGncs5MOK7e2hx3fdGdRyE1OUjqmNIZsWuSUa7wvnEhRk6xUCRyviSIID65gY129K
 4ikWrgFnkyKUVp9f6PCpqJ+BhVOmpb98uG3V7F5LJWitLfh8GOB72FeSagHZ56MjICkGLMBDHeE
 rikBKIVvXLkf2X0q2wH0pQxvcEZdCzsGtXqrqbd2gn7KcJord3CjIbR1ZjPkZoGMb8vbkUKIv8d
 /Td8G1ZDpuoDYa5C/aVr2CKOBmfMAlE/HPA4t/+cjt/BoB4X/U21tK9A00n/InMeJr/Nsqizr7n
 4RSD4wq7Bqori35YNlkLs8RW1LxBPYboDhP7d46WrZK0dYPaINtNsq+IKc5wRpB0KX0TYq6dyzj
 41CFTjIHYO9hpFJ5zUbuP/SyXx6FMfdQkChd/xGeuKtorknKh3ewhSWQPTC+MCKNTKdoq6ieoNB
 /5mgDyZCfcySKj
X-Received: by 2002:a05:622a:1aa4:b0:4e8:9596:ee6d with SMTP id
 d75a77b69052e-4ed30e159f8mr7797481cf.9.1761847509942; 
 Thu, 30 Oct 2025 11:05:09 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IElDt9l0NR9/vDPiU5LTv+UBt4T29PKNjIh11r0yOe2hphXbziVzZPIVwEal2E9S0jpWwC89Q==
X-Received: by 2002:a05:622a:1aa4:b0:4e8:9596:ee6d with SMTP id
 d75a77b69052e-4ed30e159f8mr7796561cf.9.1761847509253; 
 Thu, 30 Oct 2025 11:05:09 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-59301f50a6fsm4714062e87.35.2025.10.30.11.05.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 30 Oct 2025 11:05:08 -0700 (PDT)
Date: Thu, 30 Oct 2025 20:05:06 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: yuanjiey <yuanjie.yang@oss.qualcomm.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>, robin.clark@oss.qualcomm.com,
 lumag@kernel.org, abhinav.kumar@linux.dev, sean@poorly.run,
 marijn.suijten@somainline.org, airlied@gmail.com, simona@ffwll.ch,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, quic_mkrishn@quicinc.com, jonathan@marek.ca,
 quic_khsieh@quicinc.com, neil.armstrong@linaro.org,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, tingwei.zhang@oss.qualcomm.com,
 aiqun.yu@oss.qualcomm.com, yongxing.mou@oss.qualcomm.com
Subject: Re: [PATCH 08/12] arm64: defconfig: Enable NT37801 DSI panel driver
Message-ID: <g5oia3ndlitxrquptsvalfesjujjtlfh7gvrao4vf7vqaqzxvo@5q3bwz7ubmrb>
References: <20251023075401.1148-1-yuanjie.yang@oss.qualcomm.com>
 <20251023080609.1212-1-yuanjie.yang@oss.qualcomm.com>
 <20251023080609.1212-3-yuanjie.yang@oss.qualcomm.com>
 <wuh7agcgg6spghilnx4amqukaaydj25u7kbdiod7fl6pu2ulvm@pmosyuo43cyw>
 <aQF98RvLuOlJZlFi@yuanjiey.ap.qualcomm.com>
 <38c8e26c-08a4-42d9-8f6d-93969af90d50@kernel.org>
 <aQLOaI3ngjswi7kd@yuanjiey.ap.qualcomm.com>
 <7c1e0cb5-2483-4efa-be52-84cbe5d1a4b2@kernel.org>
 <aQMOz4P2/WyjXy1b@yuanjiey.ap.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aQMOz4P2/WyjXy1b@yuanjiey.ap.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDMwMDE1MCBTYWx0ZWRfXzjlD4g0ob6rt
 8xpGXuDqvKsjwqtvIaXtdUE9yBIO9CqaWDNtxI0mBSQQaplC7x+f6oHK/5x0r5lx0QdFoPaU2LR
 w3oMpz+6Wv9LMLzVd40Xf1yu5ojNjmAOiSai0JijUeH3fK0VLHwzTpAIDI2vqLtEWJhZ/3MIeV5
 KUt32UVW1L2s/lpdOAWv+387yGS4bKNakKMSJ4ioqNZa8hxbBmcfu1YKZmCgAkBpl8sgXoUSL0o
 aXHHioG9JR4pVjeiyceCG0IpaGrTdXxyXWFxPutak1Rh4Am9vP1PHZsK7UUr+oZpAEm1RhAlDyN
 C05T8eB/WpvhABf/JieXfi2+j9Qw38QMTzd9aGtDtQyExm6eV8+fHzJp8gSIDbJNlFVojeDQKyN
 lBiq8uMWxmcaFFm+fKhRaymBU3Kbfw==
X-Proofpoint-GUID: Px0YfvB2iwFzPwvOdYqI0SDA9UtXRATp
X-Authority-Analysis: v=2.4 cv=TsnrRTXh c=1 sm=1 tr=0 ts=6903a8d7 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=x6icFKpwvdMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=P-IC7800AAAA:8 a=EUspDBNiAAAA:8 a=59EQD5k8VZCOn1K0OjEA:9 a=CjuIK1q_8ugA:10
 a=uxP6HrT_eTzRwkO_Te1X:22 a=d3PnA9EDa4IxuAV0gXij:22
X-Proofpoint-ORIG-GUID: Px0YfvB2iwFzPwvOdYqI0SDA9UtXRATp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-10-30_06,2025-10-29_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 impostorscore=0 lowpriorityscore=0
 spamscore=0 bulkscore=0 phishscore=0 suspectscore=0 adultscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2510300150
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

On Thu, Oct 30, 2025 at 03:07:59PM +0800, yuanjiey wrote:
> On Thu, Oct 30, 2025 at 06:37:40AM +0100, Krzysztof Kozlowski wrote:
> > On 30/10/2025 03:33, yuanjiey wrote:
> > > On Wed, Oct 29, 2025 at 02:05:20PM +0100, Krzysztof Kozlowski wrote:
> > >> On 29/10/2025 03:37, yuanjiey wrote:
> > >>> On Mon, Oct 27, 2025 at 10:51:23PM -0500, Bjorn Andersson wrote:
> > >>>> On Thu, Oct 23, 2025 at 04:06:05PM +0800, yuanjie yang wrote:
> > >>>>> From: Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>
> > >>>>>
> > >>>>> Build the NT37801 DSI panel driver as module.
> > >>>>>
> > >>>>> Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
> > >>>>> Signed-off-by: Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>
> > >>>>
> > >>>> You (Yuanjie) authored the patch, but forgot to sign-off, then Yongxing
> > >>>> provided certificate of origin, then you provide certificate of origin
> > >>>> and send it to list?
> > >>>>
> > >>>> Please correct.
> > >>>
> > >>> All the display patches were jointly developed by Yongxing and me.
> > >>> So every patch 
> > >>
> > >>
> > >> So two people were working on this absolutely trivial defconfig change?
> > >> I have troubles believing this.
> > > I want to say these patches I am first author and yongxing give me support, so
> > > I think yongxing is second author.
> > > 
> > > I want to express my gratitude for Yongxing's support in every patch, so I included
> > > both our names in the sign-off for each one.
> > > 
> > > However, if my intention causes any trouble for maintainer, I can remove Yongxing's
> > > sign-off from this patch.
> > 
> > 
> > Please read submitting patches to understand what Signed-off-by means.
> > Otherwise I have doubts we can accept your patches - you simply do not
> > understand what you are certifying.
> Thanks for your tips, and I learn some tips from submitting patches: 
> https://elixir.bootlin.com/linux/v6.18-rc3/source/Documentation/process/submitting-patches.rst#L524
> 
> I thinks below sign should be true, if you also think it true, I will use it in next patches.
> 
>  Co-developed-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
>  Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
>  Signed-off-by: Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>

Does one-liner need two engineers to co-develop it?

-- 
With best wishes
Dmitry
