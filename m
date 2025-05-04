Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 23C85AA87C8
	for <lists+dri-devel@lfdr.de>; Sun,  4 May 2025 18:14:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7095510E2F0;
	Sun,  4 May 2025 16:13:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="HnA4f4aq";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 04EFC10E2E8
 for <dri-devel@lists.freedesktop.org>; Sun,  4 May 2025 16:13:57 +0000 (UTC)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 544DDwJ6030246
 for <dri-devel@lists.freedesktop.org>; Sun, 4 May 2025 16:13:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 cfdsQNjtgTXSpICV+XJjH/jK4YQyRmRdmbdXbvMbr6I=; b=HnA4f4aqSTGjwKOb
 Dm7vLbj/46k2CAS2BXIF3QnAySBj1MkUoq9Ke52uq3Djd6NYKVmKZ7UYy04UFyb/
 wnIYMx3iMQBCVUk0AuiEQoZkDDtiROZEbyH5xE0sdCFXouASd+UtRVlwto8PY5er
 w8lBtFCDM9B4YvW1NrZWPsIL6RcJy0JfmlC1J96JqF4+8vFsG9l4aVxwK/qm9lLf
 qZuBiP+fQfa2l34JmPWLUI38drmgh5FWAMtZKB2/OZPKbFB9uBIjyqYcUCLzWW6/
 acMx69grj90RVvygiKE4BgKTa94LveXtrYIu2+L7EwZUzMLhbazoLLdoKN285IJy
 Up1cIg==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46d9nkt9bp-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Sun, 04 May 2025 16:13:57 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id
 af79cd13be357-7c7c30d8986so411576085a.2
 for <dri-devel@lists.freedesktop.org>; Sun, 04 May 2025 09:13:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1746375236; x=1746980036;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=cfdsQNjtgTXSpICV+XJjH/jK4YQyRmRdmbdXbvMbr6I=;
 b=XQjwhle1nYTH+O5fFOsTnqbLO79rVX+mLESbA77h69fcnaI/aWu/xCz/aoNrrGTKsd
 8LcAiHlH+wKMLg2FrMLxyQV/kIiVh2Fwh9FgKW1NqBgBT8sNFt4ETdRfeqh0uJX3ndGs
 Zm0c1BUp2hYT7Q8t7UEaq+uD+lAlZGVVt1z9Q5LaxCmnF1TSrig1mkirsoTsUxNeZTM6
 tQMSo3JYH1ykF+3X4a91OZTl5WO52pG/bdxJMkEgjuQf2QAmKhuXNASFFzcLO8/BRSNX
 FO7Pl5WWK5BPYkkSwFd0pZcedkYtGU05JNDII3BgGNUQADsGlVZeMuBZunFo8Ij4+1dZ
 CvRQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUWtQOk1KDI0L7imm4MY9kAq1fIWn/kLYhQD6vNk1khHMXGw1KBNs1/qC1ia514PiFdmSI/IkcMLY8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz3qJteyx89xhklDee7i7QOJdqIRWHIqY/mghXetFih1REiuINS
 oJfXcPKbvsQmhkWTjGenlidF7V37qMDapPaumoeXe5ocY/nYhVBlF1nJS2bz6nVdM5DWpS9xY1a
 9P6qgGhIh5+O+qKUMvUJjGmo/wagraogrvvr6icf18Xatz3yvDLix6IwsdiNRQQRMtV0=
X-Gm-Gg: ASbGnctDhy/Cv8euIPXgpTdFIcwpVSDDEZAP2stainNi8fdaF+uv2jnFn9VuCKmRjfo
 1rkVR1nsWb6uqqRi7peHzSk7gRoMia+wLHmDwxv6CtbH5Doz5ZGRaGUD5GgaNRCvWTtqbl+fmjk
 0Ynp6wvnKpyfNZK5FqTjxFmhoXS6DnZQsSFZ8VoZrrCbY4Kax67XN1ysUSuhqTpKgRmhe0ngwtF
 mLxALUq/vJiMxj+UGKBKvYzt388zeXPH7MoLn/T2fPuF05lvGMq5u3XyDOiBSO9jo9oyxmIixZi
 21j3EGNS7JdoNfBeyUNqXHbPe2zTCq0M0sA0GRq+WacPvTcrcc/BuE9q+Ba3Uc3fqFtXR6kR+Z0
 RFqLB7RyyZXQDO3yabs0y06hq
X-Received: by 2002:a05:620a:3949:b0:7c5:6140:734f with SMTP id
 af79cd13be357-7cae3a926c1mr607138085a.18.1746375236108; 
 Sun, 04 May 2025 09:13:56 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IESd4V/tl84ujiy+ueBS1wdjRHJiBAwRJzy9189FWkkAARUTf7JATItoLt9gDMWQyef3WGC8Q==
X-Received: by 2002:a05:620a:3949:b0:7c5:6140:734f with SMTP id
 af79cd13be357-7cae3a926c1mr607133085a.18.1746375235745; 
 Sun, 04 May 2025 09:13:55 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-54ea94ee937sm1335231e87.142.2025.05.04.09.13.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 04 May 2025 09:13:54 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Ayushi Makhija <quic_amakhija@quicinc.com>
Cc: robdclark@gmail.com, sean@poorly.run, marijn.suijten@somainline.org,
 andersson@kernel.org, robh@kernel.org, robh+dt@kernel.org,
 krzk+dt@kernel.org, konradybcio@kernel.org, conor+dt@kernel.org,
 andrzej.hajda@intel.com, neil.armstrong@linaro.org, rfoss@kernel.org,
 Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
 jernej.skrabec@gmail.com, quic_abhinavk@quicinc.com,
 quic_rajeevny@quicinc.com, quic_vproddut@quicinc.com,
 quic_jesszhan@quicinc.com
Subject: Re: [PATCH v5 00/11] Add DSI display support for SA8775P target
Date: Sun,  4 May 2025 19:13:31 +0300
Message-Id: <174637445757.1385605.6744814496349716759.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250424062431.2040692-1-quic_amakhija@quicinc.com>
References: <20250424062431.2040692-1-quic_amakhija@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTA0MDE1MiBTYWx0ZWRfX8BzXDlpJqb5f
 1iHh9OW9qv8G466JOZ9rImllgRkL2VwmbiP50RhfnG/nvLeakm37j+mEiZj+syUVSyZ/B1lfZOO
 IRsPhcrG4VtEIdKV80b8tjpZDs1hEvhlttklmJGgWGEhkB9H3NLyEaaItIOpPBEFYbv789ayboN
 b6Y1wIi8BQZqYlh7DY5Zni/Tn26wTFgaeDQgBdisD1SXIQAQtFu9H061W1+gNFZcnEsOk4X2QiM
 LWQ7LPw+u5dJqe9JE3pW4w70C/htsKZSgKmW3NAmeuJKQvKbsxg4hiYHTpkVZIPlsgJWn44OTH2
 cpyAAReaIF0mPyWMbdNsoC3NjmGlyRBzNGred17jYzixP2aTv3MPj31KnJYQV1A3Xc880FDCEA8
 7Rn5BG00Hd91omfRgZk0iv7XcZC7X+b2zBeUc5loHSq/XnbiyLyj2ri93CUwFurAmkuLfb87
X-Proofpoint-GUID: TZXelgcdDJXSnE0VZm2CPx18I_nwiLSZ
X-Authority-Analysis: v=2.4 cv=LpeSymdc c=1 sm=1 tr=0 ts=68179245 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=dt9VzEwgFbYA:10 a=e5mUnYsNAAAA:8 a=EUspDBNiAAAA:8 a=rcLBrfNTdlfi3Zk1C0sA:9
 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-ORIG-GUID: TZXelgcdDJXSnE0VZm2CPx18I_nwiLSZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-04_06,2025-04-30_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=996 adultscore=0 lowpriorityscore=0 impostorscore=0 mlxscore=0
 spamscore=0 malwarescore=0 priorityscore=1501 clxscore=1015 phishscore=0
 bulkscore=0 suspectscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2505040152
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


On Thu, 24 Apr 2025 11:54:20 +0530, Ayushi Makhija wrote:
> This series enables the support for DSI to DP bridge ports
> (labled as DSI0 and DSI1) of the Qualcomm's SA8775P Ride platform.
> 
> SA8775P SoC has DSI controller v2.5.1 and DSI PHY v4.2.
> The Ride platform is having ANX7625 DSI to DP bridge chip from Analogix.
> 

Applied, thanks!

[01/11] dt-bindings: display: msm-dsi-phy-7nm: document the SA8775P DSI PHY
        https://gitlab.freedesktop.org/lumag/msm/-/commit/850e13b65e3c
[02/11] dt-bindings: msm: dsi-controller-main: document the SA8775P DSI CTRL
        https://gitlab.freedesktop.org/lumag/msm/-/commit/2a0195b94cbc
[03/11] dt-bindings: display: msm: document DSI controller and phy on SA8775P
        https://gitlab.freedesktop.org/lumag/msm/-/commit/a6f2524f4d5e
[04/11] drm/msm/dsi: add DSI PHY configuration on SA8775P
        https://gitlab.freedesktop.org/lumag/msm/-/commit/d3979192fac5
[05/11] drm/msm/dsi: add DSI support for SA8775P
        https://gitlab.freedesktop.org/lumag/msm/-/commit/249a965c3759

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
