Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 50DF9B0AF55
	for <lists+dri-devel@lfdr.de>; Sat, 19 Jul 2025 12:32:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 34BBC10E16F;
	Sat, 19 Jul 2025 10:32:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="P7qGKWCl";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2962810E16F
 for <dri-devel@lists.freedesktop.org>; Sat, 19 Jul 2025 10:32:38 +0000 (UTC)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56J4CDto030531
 for <dri-devel@lists.freedesktop.org>; Sat, 19 Jul 2025 10:32:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=G06iwEutK3GO5lHqQU1Eqf05
 c4jNYrzpMWxGrGkxhJo=; b=P7qGKWClADMSME/mv2lvSzusTfdruXgsRvc8STfH
 rN6Byk2gxnN+etDjq70KR41ths+fuho2v3STtqSh0tp4lPiHC9fiMDYUD0aJI8DQ
 +djVqF4dCoPsjS4LP665vLNdGR8FbtRXYnKmH840WfZwIIpMKyiaVMPIqJedoDZJ
 16o4k0CoW3k0c89dJc98bnuZTsoZEzm5N0Y8liCwMh5rhLZhz6hg/wt8zyRUBudw
 8uoPAxubE5n0sraVoNcJKaHkjB1m6txCpveJJi6P7+oP2TL/mZg8xTZXQFzG/hGE
 KBXTCnud/NFFzGXHBO5eHH+UtheMEshZtHfkGpVi/4joqw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48044f8ghb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Sat, 19 Jul 2025 10:32:37 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id
 af79cd13be357-7e2c8137662so501760285a.2
 for <dri-devel@lists.freedesktop.org>; Sat, 19 Jul 2025 03:32:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752921156; x=1753525956;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=G06iwEutK3GO5lHqQU1Eqf05c4jNYrzpMWxGrGkxhJo=;
 b=AsuQZiICF80jM5CypZCj9AwRDmU1s6PLa0qVvQxGRlzpbZEnsUBQ7YDQDaWscI9pxs
 l+HDOPMZOkH8JvV8dfXqaH4ArLBcw2vfjwX8tjGdS/fScW7iDKgT6Bmm2p6195NhAiQA
 CtiMrOVFujrcMokIsOU1i8VBOjjIeR9c36epcZ5zgLxmdwztsgaWSj+gZHZrijnfONlh
 tuSt9stqZM7HMkORBVJk32qcD4KoXGnE+rMVfAPkYt9FlEdtNj4GTNLbjTKzUPFThAew
 dlujhhXo2iynNmw0ESZWzErC6ItjxJrjZzVUNwHqb4GSneX3mqNtQEB6LRNB4O/oH+gF
 iZIw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVRFrNOmXVjA9thqzyP0QQcmAgsphw0bACI4qz5zuH6z7oJuLQZelFMu6crlOVGNw7n/0b2VElz1pM=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzZnT6HbtmtiSNUYhOnFl6uonja+vbpC58b9Ga8LWTbiAm5hjBP
 AL2FNE+t+ncv0X8G+WF+A+55WBQzSbRUThXhYhDmetZcCPdWk7PDWRHoQxTu5oUfNbj9jtSWX1l
 ohHT27DG4jhh/AEOS7hX6CizxSexW1rdbVrQbffyWqiKn33yI7KrO5Qtw0/agYlAcnPw9ESs=
X-Gm-Gg: ASbGncsGXYCSwYQSbc8X9nBDlmKvcN3z5xRAeugGUW1vK7pqRGHd1+h/VQSB+axcz9F
 ExfgMuTVLTzvLbfJJ009Lx3dVXcj2itCkZbBvD1ZxAjBX7TWmgeBf9ZhnwSIpbzS0DkqZA1LfD8
 evbdxipfuPSgv41KpBpe9XL5srNEnZLXrChv+OvAlJotpQLb756KosrfxgA9+CnA8uzRSJUPAiT
 eNmskn7+p55rELdkRrqdaaXwxMxvP+T8VlLeG3nzbZJDmnG12G4bQmcdkIWcRx/jTxnbR60uCPK
 othBjbmNgsuzrABd2064hlZMRg/3/5w8+V48cVopdPk6HkRNbpqhW+3mK39soXVMu+KDADqLsz9
 ccipaeUfLODTKQPpOdi0ZT3MRUsEauy+L/RBYBxl0CXqU3u5pAZq3
X-Received: by 2002:a05:620a:4413:b0:7e3:3417:8c80 with SMTP id
 af79cd13be357-7e3435eb5c8mr1843006185a.31.1752921155711; 
 Sat, 19 Jul 2025 03:32:35 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFPks1HjgTCMsnblTK4TjsiAlwy/vjObFV82l5OdaaO+bcfhs7Bu3VSA6ZEe50HuSOATIjNgw==
X-Received: by 2002:a05:620a:4413:b0:7e3:3417:8c80 with SMTP id
 af79cd13be357-7e3435eb5c8mr1843003785a.31.1752921155315; 
 Sat, 19 Jul 2025 03:32:35 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-55a31d7c226sm658791e87.85.2025.07.19.03.32.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 19 Jul 2025 03:32:34 -0700 (PDT)
Date: Sat, 19 Jul 2025 13:32:31 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Brigham Campbell <me@brighamcampbell.com>
Cc: dianders@chromium.org, tejasvipin76@gmail.com,
 diogo.ivo@tecnico.ulisboa.pt, skhan@linuxfoundation.org,
 linux-kernel-mentees@lists.linux.dev, dri-devel@lists.freedesktop.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Subject: Re: [PATCH v5 1/4] drm: Create mipi_dsi_dual* macros
Message-ID: <arbdzp3r726vvfwds65cw7thcvxu2hpnwbjwdb4u2rgm4irir5@w25kvujy36kf>
References: <20250719082639.307545-1-me@brighamcampbell.com>
 <20250719082639.307545-2-me@brighamcampbell.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250719082639.307545-2-me@brighamcampbell.com>
X-Proofpoint-ORIG-GUID: aEQHgOfHbwmbGYsRwfYCzvCyU_OxjgC7
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzE5MDEwNSBTYWx0ZWRfXxHjevbqXFYgv
 cyE6ZkouqyXZvmWQEI6SR684yRElw7LFt3xg2hJRO+cPpaiD3A7GH9Kl4JN15PiNWWP0Fnexxdb
 HcLyY+Fsf43ZKRMSojwuB6CBW5Iu64VLIL17c9ZcMCcj8kV8mIoAkFno2W+avj3h8+xQdJy5IOw
 HRCM7qXB0EnRZCyUh/aZ/e7k7NQXPGbbEAGvZKm/PTd0FAtX2y+HMDa8WTZDBMAEB8/4xbFcmIm
 XjWMO8jOw6v3QAqniCYn2i9JHArXNfxUMG5KjKHQwf5or3NWNpkbcRk/cyYbUxq13gf0W4LplYF
 QF/EUV1dBi85UQBF7pt8CnUj2aaG/yz78HUJwWlB678IIemaoveSdWkm/ovVrwLxxZXnZp9714N
 gv17Ose37J/o2zZSDoEp/xGJd8xLDwk1lY3BlP6dFEDm8ltdIekqgRdQUI3SOLVUDyUGdlLp
X-Proofpoint-GUID: aEQHgOfHbwmbGYsRwfYCzvCyU_OxjgC7
X-Authority-Analysis: v=2.4 cv=YtcPR5YX c=1 sm=1 tr=0 ts=687b7445 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Wb1JkmetP80A:10 a=wukD7SXyAAAA:8 a=EUspDBNiAAAA:8 a=n_CNi66bQm-mhO-RI4YA:9
 a=CjuIK1q_8ugA:10 a=PEH46H7Ffwr30OY-TuGO:22 a=n7THaJik3DRP1sDdJiGm:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-19_01,2025-07-17_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 priorityscore=1501 malwarescore=0 lowpriorityscore=0
 impostorscore=0 mlxlogscore=738 suspectscore=0 clxscore=1015 spamscore=0
 phishscore=0 adultscore=0 bulkscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507190105
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

On Sat, Jul 19, 2025 at 02:26:35AM -0600, Brigham Campbell wrote:
> Create mipi_dsi_dual, mipi_dsi_dual_dcs_write_seq_multi, and
> mipi_dsi_dual_generic_write_seq_multi macros for panels which are driven
> by two parallel serial interfaces. This allows for the reduction of code
> duplication in drivers for these panels.
> 
> Signed-off-by: Brigham Campbell <me@brighamcampbell.com>
> ---
> 
> mipi_dsi_dual_dcs_write_seq_multi goes unused by jdi-lpm102a188a. It's
> included in this patch for completeness and in anticipation of its use
> in other drivers in the future.
> 
>  drivers/gpu/drm/drm_mipi_dsi.c | 48 ++++++++++++++++++
>  include/drm/drm_mipi_dsi.h     | 89 ++++++++++++++++++++++++++++++++++
>  2 files changed, 137 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
