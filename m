Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4910CAE21E3
	for <lists+dri-devel@lfdr.de>; Fri, 20 Jun 2025 20:14:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4B40910EBAD;
	Fri, 20 Jun 2025 18:14:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="VxP0bv8W";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9712610EBB5
 for <dri-devel@lists.freedesktop.org>; Fri, 20 Jun 2025 18:14:09 +0000 (UTC)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55KD8gUL029581
 for <dri-devel@lists.freedesktop.org>; Fri, 20 Jun 2025 18:14:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 nO3sfnzlB67rNBuLuCNg6x8OnrGZzYrJhAxTg03f9r0=; b=VxP0bv8WbfY8U4LN
 fz3P3sNSRtv9aHUEX8uI5HVwpCbuTh2nh57emOwXMLWoqc3NtsQbiJVwXLHmyUuu
 Sp0abie7Q5dCp7+uBvKijNrod0gUZHqSlKtRskPQh1MvPAESaydqxXZHnOEZ1K4g
 GDlWzGI011dSdLeOUj52O14zj79MA0QDtRg+HjEk8LGx8c5pcqFG5CGwK0oBGu8y
 KPrUXZCB/79osM0o8OHQ7kxtPNO7BGRk2uVXDFJXF+l2lgJxsWIUb6i1B80deIyN
 StatHysBMFiY7KLKP/KuA5vUyf7UGJaEnoPrD5yn8+eK/syrV9560Gs0r9r5+qXL
 T2BsAQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4791h9m4pv-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Fri, 20 Jun 2025 18:14:08 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id
 af79cd13be357-7c5bb68b386so580799385a.3
 for <dri-devel@lists.freedesktop.org>; Fri, 20 Jun 2025 11:14:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1750443248; x=1751048048;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=nO3sfnzlB67rNBuLuCNg6x8OnrGZzYrJhAxTg03f9r0=;
 b=ICkiqYjKGsIRTl0/TBN9XcAgxAMzzrP7QeKmmnwwtdsuzds2UkeG+bCXBtdliIjKwJ
 BqxmKs895mlcEqlBjO4JUmnE1g0spOUTzbUgQgk9PcgmlGTURQACePV+X0pMOMIFsxlJ
 u4uZLL0cSUhP5EnxD+W6jSOOP2BQtULNDQFZu5ip/6aoVkDR8Pp1nCzPgdRb7o5AXA81
 zRG/8bvCNQMRicEktAhtgOKfaPREPghuSlaQ0GvLsHEnhDGjQi9KggzLAW9Hxo2+0afI
 C19FyNvLVbB6bE3kuw86u0+h8+sGYvwx03VTz8cacmbfCIUalKU1ZuQus1HpcEkT40Fl
 VH9g==
X-Gm-Message-State: AOJu0YxXCCBAw2iO7n6HTYA3Vf4xjpfLxp9lMoXwZi0WWRybL2ejJ+pn
 JqNXrEXe2jLcgp6NhfT2PinZ46OuHAj2M2deLI9FAIdaJZ56oq+vkTI+kXYcqLMWSSgOM74qbIs
 AgnUKeAdCED64UtHBLAst47YAYofGG1hl3zDM6ah60QSWOiii6qwCxlZf5z2JLVpecjcEGJyP4Q
 DPd6Ixaw==
X-Gm-Gg: ASbGncs1MRI/hFkLqdFxwBm+2euiABYmHtgSRNq1WoyigtvNj3i+7SSlC/s0K3/xoTs
 /a5HbWW/JART+xkHjHHqycVRpfbzILqKHheXuaE7BUyIC/Vfslv0CLIU0CJGNETgJmyj3lyyW9x
 5DiIiilCBHO5L05RsXFrNMqezEk8ctxKeUD5hGjV/O55Z3rW6/0aOHhNg6pWesAgg7p8JNdsf7s
 qidkPWwUjsH7Yo6jzMMYlBBUNT6nFA7fjb6SD3oxQtq40NyMOyZ63eapeAwbkbaj2Y8PqHlAbzE
 IJhLeMNkF++0g/x88anWa10IDEgJVavqasAa0/d3U3Mo5H2cbg++6/zWd82hAVQA95DwZu3jvVh
 VFEr861IgSkIm0yEBqZ8tCyE2t2rkhyxBM6U=
X-Received: by 2002:a05:620a:1b90:b0:7d3:8d16:cfb with SMTP id
 af79cd13be357-7d3f994652dmr464231485a.39.1750443247772; 
 Fri, 20 Jun 2025 11:14:07 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE58pSYF6MxuiRzGS1LvzWtsB3m3BexOiTThz68ytr6Mc+HTEwb5RlSh9XRTP66yPct1Sc7bg==
X-Received: by 2002:a05:620a:1b90:b0:7d3:8d16:cfb with SMTP id
 af79cd13be357-7d3f994652dmr464229185a.39.1750443247411; 
 Fri, 20 Jun 2025 11:14:07 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-553e4144306sm363384e87.18.2025.06.20.11.14.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 20 Jun 2025 11:14:06 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: dri-devel@lists.freedesktop.org, Randy Dunlap <rdunlap@infradead.org>
Cc: patches@lists.linux.dev, Stephen Boyd <swboyd@chromium.org>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Rob Clark <robin.clark@oss.qualcomm.com>,
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH] drm/msm/dp: add linux/io.h header to fix build errors
Date: Fri, 20 Jun 2025 21:13:55 +0300
Message-Id: <175044313807.2014621.18142017999140082135.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250617185611.2965223-1-rdunlap@infradead.org>
References: <20250617185611.2965223-1-rdunlap@infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: 7Q0-jEtwGTGzciF_FavlunUm7c3hmWnJ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjIwMDEyNyBTYWx0ZWRfX3hI7UqVfEHYE
 HBXHnBF0nM7DjOji7p24W5AeD0T2IMvtUwSELc6YKJaeo38nKr5AB/whvvvX8wq2x3lZ8ZkEUE8
 C6xOKC3Dk7rpcO1/Zad7YhTYpi0hV8PBcFhwdC7YtrSZaGOp2yTb8t7eGyKhMDT6Lik6eEQEp2E
 O8R27RYRo6zudunSZui9OfLqwBii7xj30qA/7Op+/eEU1mWQo4idCvMXC4ELYQ1tyMDBDErMx6e
 LzZG1X3rhlmsXu2IzjYo2fYY1WXBTy68qKo4KDPoa07SI1ZBNpsQClSX5Iup4Si2dSay28f7qeI
 POs8DBbVWVxn3JJqoRhHm+EC/p8aags5fQDTIajr7xVzONKNx+Sx+FYeBT4RBLsGdC3IFw/I/mt
 gHmf9cpw+/hYGQyxaCvA6krcjMTxumJ/pj0RZeWR5YKNvS4ZDf1WTf6az09fMEjPbyCA8pUp
X-Authority-Analysis: v=2.4 cv=UL/dHDfy c=1 sm=1 tr=0 ts=6855a4f0 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=6IFa9wvqVegA:10 a=e5mUnYsNAAAA:8 a=QBdSVzX5EUQIqSI3YyQA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-GUID: 7Q0-jEtwGTGzciF_FavlunUm7c3hmWnJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-20_07,2025-06-20_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 clxscore=1015 suspectscore=0 priorityscore=1501 adultscore=0
 lowpriorityscore=0 bulkscore=0 spamscore=0 phishscore=0 mlxlogscore=952
 malwarescore=0 impostorscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506200127
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


On Tue, 17 Jun 2025 11:56:11 -0700, Randy Dunlap wrote:
> Add <linux/io.h> header to pull in readl/writel and friends.
> This eliminates the following build errors:
> 
> drivers/gpu/drm/msm/dp/dp_panel.c: In function 'msm_dp_read_link':
> drivers/gpu/drm/msm/dp/dp_panel.c:33:16: error: implicit declaration of function 'readl_relaxed' [-Wimplicit-function-declaration]
>    33 |         return readl_relaxed(panel->link_base + offset);
> drivers/gpu/drm/msm/dp/dp_panel.c: In function 'msm_dp_write_link':
> drivers/gpu/drm/msm/dp/dp_panel.c:43:9: error: implicit declaration of function 'writel' [-Wimplicit-function-declaration]
>    43 |         writel(data, panel->link_base + offset);
> 
> [...]

Applied, thanks!

[1/1] drm/msm/dp: add linux/io.h header to fix build errors
      https://gitlab.freedesktop.org/lumag/msm/-/commit/ee1c98ae63d1

Best regards,
-- 
With best wishes
Dmitry

