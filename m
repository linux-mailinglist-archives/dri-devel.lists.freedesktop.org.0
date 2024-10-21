Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 991099A9206
	for <lists+dri-devel@lfdr.de>; Mon, 21 Oct 2024 23:27:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 63BD910E04B;
	Mon, 21 Oct 2024 21:27:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="Ph/HajrU";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8AA5310E04B
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Oct 2024 21:27:50 +0000 (UTC)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49LAf3xJ010479
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Oct 2024 21:27:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=2vgxIq1K+sBX6DjBuC+X85kn
 cvch8gPf/xtxKiUcmh0=; b=Ph/HajrUVR+7nHtEbCfPgak91pZMuyVpGLCVPoYR
 VNGzltZShi3zdwCfVMMTP2i00F1bBpggI67e+XmKI69Olu7MVlN4UYc9DIEIXoJv
 O9o0YG44FGLAPP/oH6WOsx6DIkNcPGyc6Vkyhx+Az9eJYxCRGrKaSAviAZlUHUKm
 16jrbcTEHjJ2wJXtBnB/gCPj1v4fRsn0h27oKbAaVTzpyYz7emR0aYkGj44WeUZ7
 gEgBco6LO2aBju2bqxF7MeDyW7NzfzI5mN5eIhzefMNFDiS3qKSBZc8pKahqpAid
 RhQhLbMK8enEQxNmV5xyGU3Q3b/PlLgEgYHzkcUHtoD/Zw==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com
 [209.85.214.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42c6w1p1gu-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Oct 2024 21:27:49 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id
 d9443c01a7336-206b912491eso49010735ad.0
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Oct 2024 14:27:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1729546069; x=1730150869;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=2vgxIq1K+sBX6DjBuC+X85kncvch8gPf/xtxKiUcmh0=;
 b=vORtOuwh4ecOlcZo1PDw1DEwIqFfBodzPADnF96gf2obYiKhFTTtbSYs9ELqCcqU+9
 8WEr2A6lFgA0GfF1cO79sycZvjM7d2wFOKDEukp5Piz7AP/QyWk6WqvxmoFb9H42oG3j
 M/1r9SgJ//RNuQCWeRYfxTPZ+CGODm392M5ikamK+Dw4QxVvctmKYZ56RjT4uwzW/zgt
 QbRJKVqGUxTTY9Drw08b3/xlaWrPEYNBJnL6J1uK8K+iQJnnMKKKGbsbT9BWLml167g2
 ejtIbxrIA6L/gN/KVqpHSmBfsDZlnCwBBp93hVPSLUcy6/kJM8LWVI3xQTpGACrUUcKj
 TVow==
X-Forwarded-Encrypted: i=1;
 AJvYcCXlst69GSBELZvK7VttoKpBlOSb0cCd4666Ch0FaNBHifLBe1hTmt3KZa1O9T3W1T614jgjQJKlOD8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwpcMWYAhFf/6Q/0+83EnKiUiRt58C4IUpUsUidQrvU0cEtPgH4
 XCKpxdr6SDu4wTLLcpCkxQFD8kOTKFA6//wyREgl4IqQuaHybkzAE68JOSIT4RuhnRLUKbHh75R
 XopbEKQ8y9AXd0aGRZMe7GA54YbgtBW56M2ioLbLcdKBdX0f3nAVAdu+PTkIS1N6T0bM=
X-Received: by 2002:a17:902:db08:b0:206:892c:b758 with SMTP id
 d9443c01a7336-20e9700a865mr13872255ad.13.1729546068876; 
 Mon, 21 Oct 2024 14:27:48 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHXIqur1SYtINZajJaj1NzSMDl2l3N/PP6vSiFMCr4sRNM4r+R8SvuVte+loqR2Aq6Bzt0Mlg==
X-Received: by 2002:a17:902:db08:b0:206:892c:b758 with SMTP id
 d9443c01a7336-20e9700a865mr13872045ad.13.1729546068490; 
 Mon, 21 Oct 2024 14:27:48 -0700 (PDT)
Received: from hu-bjorande-lv.qualcomm.com (Global_NAT1.qualcomm.com.
 [129.46.96.20]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-20e7eee65e9sm30530495ad.42.2024.10.21.14.27.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 21 Oct 2024 14:27:48 -0700 (PDT)
Date: Mon, 21 Oct 2024 14:27:45 -0700
From: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
To: Jeffrey Hugo <quic_jhugo@quicinc.com>
Cc: andersson@kernel.org, jacek.lawrynowicz@linux.intel.com,
 quic_carlv@quicinc.com, ogabbay@kernel.org,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v2] accel/qaic: Add crashdump to Sahara
Message-ID: <ZxbHUQBdusgjJuu0@hu-bjorande-lv.qualcomm.com>
References: <20241021200355.544126-1-quic_jhugo@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241021200355.544126-1-quic_jhugo@quicinc.com>
X-Proofpoint-GUID: 85AIh5goNmuVz6qOdKUkhH2QLd4NDq-0
X-Proofpoint-ORIG-GUID: 85AIh5goNmuVz6qOdKUkhH2QLd4NDq-0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 impostorscore=0 lowpriorityscore=0 malwarescore=0 adultscore=0
 clxscore=1015 bulkscore=0 mlxlogscore=766 suspectscore=0 mlxscore=0
 phishscore=0 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2410210152
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

On Mon, Oct 21, 2024 at 02:03:55PM -0600, Jeffrey Hugo wrote:
> The Sahara protocol has a crashdump functionality. In the hello
> exchange, the device can advertise it has a memory dump available for
> the host to collect. Instead of the device making requests of the host,
> the host requests data from the device which can be later analyzed.
> 
> Implement this functionality and utilize the devcoredump framework for
> handing the dump over to userspace.
> 
> Similar to how firmware loading in Sahara involves multiple files,
> crashdump can consist of multiple files for different parts of the dump.
> Structure these into a single buffer that userspace can parse and
> extract the original files from.
> 
> Reviewed-by: Carl Vanderlip <quic_carlv@quicinc.com>
> Signed-off-by: Jeffrey Hugo <quic_jhugo@quicinc.com>

Reviewed-by: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>

Regards,
Bjorn
