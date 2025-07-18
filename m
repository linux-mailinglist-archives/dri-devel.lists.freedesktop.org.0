Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F1F8B09EF3
	for <lists+dri-devel@lfdr.de>; Fri, 18 Jul 2025 11:17:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 051D210E149;
	Fri, 18 Jul 2025 09:17:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="pYXNZ6n/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5BAE810E149
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Jul 2025 09:16:58 +0000 (UTC)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56I969PX022149
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Jul 2025 09:16:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=pYokExG8ocOnk32ffLPXtOoL
 wlbRQtxlYfSR/1QHzsA=; b=pYXNZ6n/YlzDtpShATqmFxwAfM6AIPdaYXLHCk4k
 FWpViIuBFfRz+pJgUJ9KHeOpsGbRG8JID1Qc+01Y2uewLbxA3+tVlUlkaosf2vdg
 qbuPz0ihK4rBo2vkdONdUoMz9PwCis0JHEgF9oFl6BK1s0ZALsu3CethPwYPn2/2
 U4zE2BWTMcl63GmB11jJ3qx7RSoACP7Fl5TTImWIXbTiLCyVyHPlrXAu62G99JYb
 FxiMZMe6/cthvQIO8BhOlZgyyDwCULfo9J/jVRsKeOR67K5IoK7fjRxopxhaTF1X
 25ZIYoEHqCfsX61bXxtVlR9i2qeOwoUkIfjnxqKVkWMS/A==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47ufu8jqvd-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Jul 2025 09:16:57 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id
 af79cd13be357-7e2e237fb4eso324830185a.2
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Jul 2025 02:16:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752830216; x=1753435016;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=pYokExG8ocOnk32ffLPXtOoLwlbRQtxlYfSR/1QHzsA=;
 b=n8cHkz99B4EZKdnESj0aWRVtKHsT/zGlJ67+m89S0UBq7PNoxZcH32C/aa+esHfqPZ
 kj0LURbxSeWOqQqxNJjj1Zd2vkj3mAJ5SAq+aSTm4bOOqkbbKEGU0mhfgkHz/2DkW5SL
 jDO3Hg7gPNxXORA2iPy2g3Ch5DTGccJSInLyVm0Z62CCsEDOrkwDqeqWda/NgD+ua5+Q
 xADbeXvJoF29+qv5a0duDH2vNIeqtWaP9hw2Dnv95zF/O80lNmjhsV3UnnezuJHFqf48
 wzXa+ppjNIvpZ/DxLTF6k/GREI5URfPwpi/fkLQfD6UhyE7PdpNqZRR2FFqWNwkcCOIY
 zs1A==
X-Forwarded-Encrypted: i=1;
 AJvYcCU8afjdRMtSQ7kjOMpNIStxDYhSRbTd50dg5/rTlNfHa/wYuhVe/vrAhTlOyT4corbg16e6rouYOyA=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzmTs0dspiIOpY+UNHy0NhiMVaFynsz6GCmq5NLxd8AL5Ow9/uN
 To87og5KU71EX/D94ZxyS41vmsJV8eSAnE8uqSQ+pYyBaVXX86XdrP0R1dJTrR8NEdCbgZRpty0
 G2wg+aOskEq3PEl/IxPiWB+JnXejpcpucusl9HxjXS4Mh5BZLJxWx5R1+PO9kr3VKp4moIc8=
X-Gm-Gg: ASbGncttbuSrkIeZh6TZUS2179ElLX6ObGFPRzy6Vo8nOD6a0JfT/sEtwsmlt0HmAmA
 +aqiS7YCoE/pSnfFYlhgaVycV1K59Q65A73wG/9JlR0V/Wq4H1zNADrPp2hZFKy6x7tT7sVQP6J
 8oi62evggpF3xjcjenxF0tN5LCqvNdr1vD7Nyg/deZ+WE0F384zGZjh1d+youUEUAJ5ebgf+6V6
 wwKq286kfHgmcnHknYD+Oaz8CupssBQS0iqjOsyIhN6S0hqRn2QibUK/+QdZwUvM9ANJVM5BAdR
 wtihda6+fhP4ZwSPXQcwpGZeOken9/0nptKpGYhJKVMgr65Xkjt53AVj3gL7Dq59V4KG8rEsWzz
 MzRb2BYz0XAY49VpWPqWqp8hFoIHK10PrnfdwGgauuOq7vzp1QN3m
X-Received: by 2002:ae9:e304:0:b0:7e3:2c2c:4ce6 with SMTP id
 af79cd13be357-7e34d9abf75mr544629485a.38.1752830215896; 
 Fri, 18 Jul 2025 02:16:55 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH0z4h/bNYjkTKcJEdw5AHQ4fY+3EvQdQvkxbqzZEQfmjF2dKwRZRVkd1oo0FyAL9YgvMwgkA==
X-Received: by 2002:ae9:e304:0:b0:7e3:2c2c:4ce6 with SMTP id
 af79cd13be357-7e34d9abf75mr544626985a.38.1752830215310; 
 Fri, 18 Jul 2025 02:16:55 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-55a31ab0fe9sm187324e87.80.2025.07.18.02.16.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 18 Jul 2025 02:16:54 -0700 (PDT)
Date: Fri, 18 Jul 2025 12:16:52 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
Cc: Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <lumag@kernel.org>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Kuogee Hsieh <quic_khsieh@quicinc.com>,
 Abel Vesa <abel.vesa@linaro.org>, Bjorn Andersson <andersson@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Mahadevan <quic_mahap@quicinc.com>,
 Krishna Manikandan <quic_mkrishn@quicinc.com>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Rob Clark <robin.clark@oss.qualcomm.com>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Danila Tikhonov <danila@jiaxyga.com>, cros-qcom-dts-watchers@chromium.org,
 Abhinav Kumar <abhinav.kumar@oss.qualcomm.com>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Yongxing Mou <quic_yongmou@quicinc.com>
Subject: Re: [PATCH v3 4/5] dt-bindings: display/msm: add stream pixel clock
 bindings for MST
Message-ID: <x6nqzxuz272j4on7e7s5loitql2zhrlcojuydbhka4epb4b4di@vencjok2tfmm>
References: <20250717-dp_mst_bindings-v3-0-72ce08285703@oss.qualcomm.com>
 <20250717-dp_mst_bindings-v3-4-72ce08285703@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250717-dp_mst_bindings-v3-4-72ce08285703@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzE4MDA3MiBTYWx0ZWRfX6lEL/KwYgcl4
 tM9TUS9gojEjdmhY2NxzH64Ojip3bjW3ERmWGWmiUAOxsht/j8ug/QKWWpvlaA/8CyZkLoictDs
 Hq3yiOqyBuHIpMfoP2l1teyYIg1ccz96w7uoqLwMlINtbp9VqT0bdQf1SYHPaQbFJV9cpzhQGhB
 5hnBmwNAgtGEFFU3+CJXs1Pq2NH9kw1mbmqcRFbRkjjq/5zNL8LXbIJaDMECleptIls1A9wlRFt
 JxS9pcynIIT04mgF5JL26FFhnF5EoAfrvuZTdWde+XaGnHqJrYVDmdF0MNR1cfD+himbB7x5Ow9
 Cl2VfSmmEOKUpVlfncy+OsqCM63XGg+dGdwEf/BJIPMBbnth4NI4+8rt1hkIngMMV1LV7O7D3/Y
 hAGZSBXbCEm/V5NbSjF47xGyykNK8e6XBzLr3IuZQRqYYp1D6PAGDwTh9I5vth+UXwZsR9px
X-Proofpoint-ORIG-GUID: tjTCtcT13CACF8IAwg5Y-liJ2YOUcIEU
X-Proofpoint-GUID: tjTCtcT13CACF8IAwg5Y-liJ2YOUcIEU
X-Authority-Analysis: v=2.4 cv=f59IBPyM c=1 sm=1 tr=0 ts=687a1109 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Wb1JkmetP80A:10 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=TLo0AdDBy_HI3n6x0gMA:9
 a=CjuIK1q_8ugA:10 a=IoWCM6iH3mJn3m4BftBB:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-18_02,2025-07-17_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 lowpriorityscore=0 malwarescore=0 spamscore=0 mlxscore=0
 bulkscore=0 suspectscore=0 impostorscore=0 adultscore=0 priorityscore=1501
 mlxlogscore=999 phishscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507180072
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

On Thu, Jul 17, 2025 at 04:28:46PM -0700, Jessica Zhang wrote:
> From: Abhinav Kumar <quic_abhinavk@quicinc.com>
> 
> On some chipsets such as qcom,sa8775p-dp, qcom,sm8650-dp and some more,
> the display port controller can support more than one pixel stream
> (multi-stream transport).
> 
> These chipsets can support up to 4 stream pixel clocks for display port
> controller. To support MST on these platforms, add the appropriate
> stream pixel clock bindings
> 
> Since this mode is not supported on all chipsets, add exception
> rules and min/max items to clearly mark which chipsets support
> only SST mode (single stream) and which ones support MST.
> 
> Note: On chipsets that do support MST, the number of streams supported
> can vary between controllers. For example, SA8775P supports 4 MST
> streams on mdss_dp0 but only 2 streams on mdss_dp1.

Then for this platform it should be oneOf: minItems: 6 / minItems: 8

> 
> In addition, many chipsets depend on the "sm8350-dp" compatibility
> string but not all (ex. SM6350) support MST. Because of these reasons,
> the min/maxItem for MST-supported platforms is a range of 5-8.

Do we still consider them to be compatible?

> 
> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> Signed-off-by: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
> ---
>  .../bindings/display/msm/dp-controller.yaml        | 36 +++++++++++++++++++++-
>  .../bindings/display/msm/qcom,sa8775p-mdss.yaml    | 10 ++++--
>  .../bindings/display/msm/qcom,sar2130p-mdss.yaml   |  6 ++--
>  .../bindings/display/msm/qcom,sc7280-mdss.yaml     |  6 ++--
>  .../bindings/display/msm/qcom,sm8750-mdss.yaml     |  6 ++--
>  .../bindings/display/msm/qcom,x1e80100-mdss.yaml   |  6 ++--
>  6 files changed, 59 insertions(+), 11 deletions(-)
> 

-- 
With best wishes
Dmitry
