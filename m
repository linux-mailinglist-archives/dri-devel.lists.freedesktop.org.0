Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 403F2C00DAA
	for <lists+dri-devel@lfdr.de>; Thu, 23 Oct 2025 13:46:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 025E710E3DB;
	Thu, 23 Oct 2025 11:46:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="AG/7kiHs";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4462C10E3DC
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Oct 2025 11:46:16 +0000 (UTC)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59N6fN8D028863
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Oct 2025 11:46:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=MxuIotyBL55oBcMXr+JxN4AV
 8Gzau+khOnLw0uMLwiE=; b=AG/7kiHs7N6pOQg3k2714gtxaacwe+b11V+Qxw0I
 Gu3nGXyQXnnl2wcGdF4vMjXMe/9qh3BGYvdzCS0MsPOsKxCTt/wzX9Rq1tl2xrbU
 73PCUnFsHIskxPhes8UiAHznc8EZcKfCyUud6Wvtk9iD71ex9VJMS/PMvMgfMZMh
 nHr3826/BOjI8mxOxiIhGQJZKLIdayhTdzbGifxonGp2Ot/2dcR6VAqaQ5CPKyKx
 7OOdihE1qqqXk2t2Rtmgx0354pQ2uieNY437lT1DP0qdHgHr12jP8xDC1IfgsH+9
 fRlKxhSQ6lyIuk8OotssUFYlf49PYcTYFgoQbXxDp03SwA==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49w08wdwdm-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Oct 2025 11:46:15 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id
 d75a77b69052e-4e88e094a5dso33349041cf.1
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Oct 2025 04:46:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761219974; x=1761824774;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=MxuIotyBL55oBcMXr+JxN4AV8Gzau+khOnLw0uMLwiE=;
 b=qtl8s1nwJ7c1364FLFizBHfox7nqcIKebIPXD+BDdf+zHPVlTN7eeGqugL3NoQHND/
 ACaJi12WvJAejuUBV9nDOlNRCAiVRpiJTE3CjuoLfDMItkRDDYHMaYys8+rrpjTkWJEZ
 hQOkrK36ZjzU/GQBpwgoo883WR8kUntzJGXgInxDUjsIWsfCckvtA74MU6N3JXSZ/62t
 UnbBZh2l9Gpg0xzzM9nUBdALt5KNBNmFBsDffao8nXUS3JBHZs4EfcpemsRVu3P+t12w
 tiDaXNwqxNxk22hNyWeMEvIsJLCVDQbrV7BeOhkEcRgC4KOUn2Qx37WN6oIh4MaLu1da
 FX0g==
X-Forwarded-Encrypted: i=1;
 AJvYcCXzZ9yd2ZxOco9ldLkLSbg2ARqmAe/gyGGTGqJrTvDRdT9HCI0MeY2q+R7Rk8AIM1oBPVKFBJsPeus=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz8ZdB+4ZV3Q+n+Df9DsHU5c+/7PDi9poQb0yRZGUrON91kvjsg
 oR3anY2IkBZjzIZHhtfLezUnQZkci3a7yGW2SLQ9sXVRgH4+cmm+AtCj5SUom0nz3JUImzM+cY+
 YCxvhJGYQwoVB8Rtd7ifUpku4iayLehZOI0nASCIyp5xczUQvZ4Y7ykZu5+0kzdkS7LMFzE8=
X-Gm-Gg: ASbGncv+4N8XXdAbCqFQ0Oi0bxbgY+ckMPZqwkq5RqsL3BdMwdYyJ8Hy9/s4kgQzO+9
 ZvwSmsmn+QQvfL4qKvIPf4ymcaL3F33AB5nQ1J8657c50E2nBLeADTjp/2y34GcK+tGdb5/iNBA
 ctC0Qds+khNFNBt0GgUV6g3iRNdvvkWR0OSt2k8jlXroCMUsdU4FHmeG9TEFY4wsR6S1sutdznv
 oH3HFIrTn/+d5+9np/JKeQQqTnTpfDJmiQf8FYjbo87PM1pplEa3r4w+qdbuAMlcYrZiS/J/gMf
 GhbTnnaCoiJUGh3yKQFFlTzxeyy010+oxzeTDNO4PbwuuwcmQG4tynKqwbFLUiRcdI2y/8CK8UI
 OFV9oMQrlFx1YCofpHYzKoB++TfTocYaQKwxk6wmsfemviFG52PmUa/6XrXvroIGbzX4lac4BuY
 I8RNYrekAHylch
X-Received: by 2002:a05:622a:1a21:b0:4e8:ac66:ee44 with SMTP id
 d75a77b69052e-4e8ac66f4a4mr250238201cf.39.1761219974211; 
 Thu, 23 Oct 2025 04:46:14 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE8+pCnO8ZvR8ffZYHTiXBpe8PitkiTaa+bMCiZZSPHl7XKSC3gu/++FOyxZx7Quca27fB8MQ==
X-Received: by 2002:a05:622a:1a21:b0:4e8:ac66:ee44 with SMTP id
 d75a77b69052e-4e8ac66f4a4mr250237771cf.39.1761219973768; 
 Thu, 23 Oct 2025 04:46:13 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-592f4d39b96sm656447e87.110.2025.10.23.04.46.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 23 Oct 2025 04:46:12 -0700 (PDT)
Date: Thu, 23 Oct 2025 14:46:10 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: yuanjie yang <yuanjie.yang@oss.qualcomm.com>
Cc: robin.clark@oss.qualcomm.com, lumag@kernel.org, abhinav.kumar@linux.dev,
 sean@poorly.run, marijn.suijten@somainline.org, airlied@gmail.com,
 simona@ffwll.ch, maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, quic_mkrishn@quicinc.com, jonathan@marek.ca,
 quic_khsieh@quicinc.com, neil.armstrong@linaro.org,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, tingwei.zhang@oss.qualcomm.com,
 aiqun.yu@oss.qualcomm.com, yongxing.mou@oss.qualcomm.com
Subject: Re: [PATCH 00/12] drm/msm: Add support for Kaanapali
Message-ID: <r6kjuxajnimaqazeimzc5gscv2qxudjzkyooxumzakjzojibbl@2jiw6duxfbtz>
References: <20251023075401.1148-1-yuanjie.yang@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251023075401.1148-1-yuanjie.yang@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: KKi7evNUGMEL3B_iyVeUVyTrOePdL2Kt
X-Proofpoint-GUID: KKi7evNUGMEL3B_iyVeUVyTrOePdL2Kt
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDE5MDA5MCBTYWx0ZWRfX78bzMt+Ancq2
 l6rtap+90xhH2I2SlUiZbFlKRG6Sc0eemIodKgudEu8nBi1/chHGuwBmUlxXdH7RgqybPYZYA8Q
 iiL2WzUxFE5ukR0eWnFymXC5YnByI9he/b1qDA5aqqnc6YRDDzIA+IEgD94ZpvXulNXimaqveLd
 6v9sutT8Lfl8kxDU4o17yoIrYqbJRYFJI1neVDPaJtsgQ4MNvXOqgbacRveuIEznejvTECunthg
 K4Zk/t+V+y1z4jJA0JemapFY9ATagxmiHwE69PdWmhEdnA6uM7hc/HiwyHkkaZt7Mp/tw1z3iyB
 /JCBC/6gYHGxVUZ4iiwZ6rwULbnooLHa3lauQyUcQ9lsi0RIN9Fk8NcfdG8NcDv6j3LYBltHDt7
 xT3MVQVkWM9H4vlQKedQQWxvWbiphA==
X-Authority-Analysis: v=2.4 cv=V5NwEOni c=1 sm=1 tr=0 ts=68fa1587 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22 a=qC_FGOx9AAAA:8 a=EUspDBNiAAAA:8
 a=PFSzt4Q9d-Ge22CFuaAA:9 a=CjuIK1q_8ugA:10 a=kacYvNCVWA4VmyqE58fU:22
 a=fsdK_YakeE02zTmptMdW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-22_08,2025-10-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 adultscore=0 priorityscore=1501 lowpriorityscore=0
 spamscore=0 suspectscore=0 clxscore=1015 phishscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510190090
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

On Thu, Oct 23, 2025 at 03:53:49PM +0800, yuanjie yang wrote:
> From: Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>
> 
> The Kaanapali MDSS has some differences compared to the SM8750 MDSS:
> - DSI PHY/DSI base address have some changes.
> - DPU 13.0:
>   - SSPP layout has a great change.
>   - interrupt INTF layout has some changes.
> 
> This patchset contains DSI PHY, DSI Controller, DPU & MDSS bindings
> in addition to the driver changes.
> 
> We have already tested the display functionality using the Kaanapali-mtp
> device on the Kaanapali branch of kernel-qcom repository.
> Test command: "modetest -r -v"
> kernel-qcom repository: https://git.codelinaro.org/clo/linux-kernel/kernel-qcom/-/tree/kaanapali
> 
> Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
> Signed-off-by: Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>
> ---
> Yuanjie Yang (12):
>   drm/msm/dsi/phy: Add support for Kaanapali
>   drm/msm/dpu: Add support for Kaanapali DPU
>   drm/msm/dpu: Compatible with Kaanapali interrupt register
>   drm/msm/mdss: Add support for Kaanapali
>   drm/msm/dsi: Add support for Kaanapali
>   drm/msm/dpu: Add Kaanapali SSPP sub-block support
>   drm/panel: Set sufficient voltage for panel nt37801
>   arm64: defconfig: Enable NT37801 DSI panel driver
>   dt-bindings: display/msm: qcom,kaanapali-dpu: Add Kaanapali
>   dt-bindings: display/msm: dsi-phy-7nm: Add Kaanapali DSi PHY
>   dt-bindings: display/msm: dsi-controller-main: Add Kaanapali
>   dt-bindings: display/msm: qcom,kaanapali-mdss: Add Kaanapali

The order is wrong:

- bindings
- driver changes
- DT changes


-- 
With best wishes
Dmitry
