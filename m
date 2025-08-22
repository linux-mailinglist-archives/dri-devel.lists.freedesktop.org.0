Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BE7E5B32221
	for <lists+dri-devel@lfdr.de>; Fri, 22 Aug 2025 20:12:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1E10E10EB81;
	Fri, 22 Aug 2025 18:12:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="jIkIhtgd";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8EF5C10EB81
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Aug 2025 18:12:23 +0000 (UTC)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57MHUhdV005164
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Aug 2025 18:12:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 /9F4kF/0PG0gqpOGPryNaB+t1E6t5FiaNAX6DsaIWBY=; b=jIkIhtgdj5s0I7Db
 TnMfmrdMghAf+6PpmRtcXHMhhLOut7gGkaK1ibTUkBVDIeBKf8d6RUWjayhKnX5h
 bCKd2EWhQ0ZEw8TUbR3xmxsuoDuyYDlZHv+3nE5y1fb73/6lQYfqCBYc8/Y+kknX
 oOEgAi7NKytojhlzZLvyKo/vxb1xZ/dTu8mBROnHUP3szxGUWlO3pLadCOXnWCLP
 Y/H6d2K8O5zwsBE/P2m7osqazaEaulLzY2VpvXE9olmN7OkdcmPfKYdAXDysVH2h
 +P8T4ECoUMgGVKoNdNn3eBJ2WgZECC2OOg9fV57FAVh3yc2yJC9E87jDJIfTIeH0
 lCuJuw==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48pw10044k-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Aug 2025 18:12:22 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id
 6a1803df08f44-70d9f5bdf67so20768786d6.0
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Aug 2025 11:12:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755886340; x=1756491140;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=/9F4kF/0PG0gqpOGPryNaB+t1E6t5FiaNAX6DsaIWBY=;
 b=m5H+4YBQE8KPqu2R4N61wj9tAZVhShRvDWCLFypAPhgM1xAd375V5J/xOQkvkHx6gT
 eiv1mfU9c8ajeb6dyVPB0261+2CWcvwqCwKB/Ie7O40qhPJQWTQpfng/8EG4jhOoiAzh
 PBqbL40kuqWtOgMGAsral7aclYV+R3rJn04/CiO8/w0xSi5oAKR5Y/f/kJtn5BDIMVjg
 6kd5b3+Ji7AxWuhumlN7dC8KvDnKdD/zWhyKoBC99Ol3hWPkgXt3ax54Kgxw8ElxCWcT
 p2bXNwJBHa9Nbm4tqmtLc5VLX8K9vje5QlirI31TB0EuT63jrG6SQfGvCiqEwE6Allqz
 bbzw==
X-Forwarded-Encrypted: i=1;
 AJvYcCW5l84pi2wBNQ3RdZOicc1lmKXuCInZlaojy2h+5ilTJbRD7TeOFayrIPs6rru2pVTu9JOtdyHAjsE=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxmJIhOA9GJ/Jk1O2dDfJWvwgmJDELjhcnW9Aba0XbIb73Pti2c
 7/sOK/6hiARTVCGxsfdqcYhD/3IYGYQ1ZMEIJg4xXZ6gK4IlMZuVEfUIlyn2E9DHEDe+tdJLwj9
 Hx7qpY55alQhJId/3cyE6CgJzBMtBXSmkLdy1sA5Yrp/SMbIlWFRomPCcyRWMDTc/9SKWjE8=
X-Gm-Gg: ASbGncuAoUKpv6x2j4d7alCMMALnRSqySdqggn2A7m/8LRj0NU5rnmOQB8Xx4hQ00Dg
 1k3bb/WgGQwj6YttiBCmQfgOhRD79Cn1sfZBf/eyk1/BFALnn0OpY1qw9pMRnQKERwzPnDkfpUY
 Y+9dQXlHw7eAv+8QcCtw+LuwqeiHnItVPmwzo2nuw0HQbUW3CXZgf1XnFv/8HbPF5oDLI049GTs
 /BTfvuEv9fuEy72xrohCqYfYju5WtQJ9LSpbzLFQkR/0eV5psjl24hbpn9I1kxL6lte1xXXo3TH
 mtEXaP+0PWeW8DUQHO1C+D75FPnpgG5e3agJX8oBK3OC5PErv/rvpBcK/7foXmt+BOTpouOV+ei
 wQK5m1IFcmEyc3B+YAEwLyevmaBpTWIfi3iaBQ4YDy8Nz5T35HAGe
X-Received: by 2002:a05:6214:2244:b0:70d:a4bf:66ae with SMTP id
 6a1803df08f44-70da4bf69c5mr19413916d6.12.1755886340103; 
 Fri, 22 Aug 2025 11:12:20 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHZ9vrMkeP87y8XS1HYbM10ipCEtP2NQ/1/i89/UBtmnM3Uakd6ZPlSGQcOg+/ENSPZGgsjeA==
X-Received: by 2002:a05:6214:2244:b0:70d:a4bf:66ae with SMTP id
 6a1803df08f44-70da4bf69c5mr19413446d6.12.1755886339585; 
 Fri, 22 Aug 2025 11:12:19 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-55f35c01e5asm89897e87.26.2025.08.22.11.12.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 22 Aug 2025 11:12:18 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: heiko@sntech.de, Andy Yan <andyshrk@163.com>
Cc: hjc@rock-chips.com, mripard@kernel.org, naoki@radxa.com, stephen@radxa.com,
 cristian.ciocaltea@collabora.com, neil.armstrong@linaro.org,
 Laurent.pinchart@ideasonboard.com, yubing.zhang@rock-chips.com,
 krzk+dt@kernel.org, devicetree@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org,
 robh@kernel.org, sebastian.reichel@collabora.com,
 Andy Yan <andy.yan@rock-chips.com>
Subject: Re: (subset) [PATCH v7 00/10] Add support for RK3588 DisplayPort
 Controller
Date: Fri, 22 Aug 2025 21:12:16 +0300
Message-ID: <175588622226.771426.4504932000654632813.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250822063959.692098-1-andyshrk@163.com>
References: <20250822063959.692098-1-andyshrk@163.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIyMDE2MCBTYWx0ZWRfX7CUxEl/YVTi0
 HvaLAaeDw9P4lxaz/AmEsk4HWJqc4JYr3SJjqhbnGQFZD2VSKt7RsDdeZveUtZjaeWMtvdVKY6d
 odDId7CnKHMywZmho1qTcnm2/NV1EoNGaqBXHnEiDKkBhuE02HwBRN3hd43ltivuAT+kLLhPRAu
 kl7gJIONn7HoMBtEmn0KSGBSef85Z1qetdnpSFWLc7Yk7ei9yk8YeLeSYBIBc+VW+bEWCHl5cV1
 JFDxp8r6eBcYR+vsf3sBN45brklIIZqMLqmWAakhfeVZ3NXrDplwYwFdg+SxVzhEDsZIO3QyrzZ
 WwaysdLo5qvVWkUiQvHiy6kRc2FYmr1YzR6pRr+tsg184I6ensGgEt1GDg5GiYDG+yi2WE3QjTy
 2jcAftbT
X-Proofpoint-GUID: MiPnSZ_jHbaxCE82OmB7hFyUJdyzEKaK
X-Authority-Analysis: v=2.4 cv=bsRMBFai c=1 sm=1 tr=0 ts=68a8b306 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=2OwXVqhp2XgA:10 a=s8YR1HE3AAAA:8 a=u1nK3qfxStItYws1ViEA:9 a=QEXdDO2ut3YA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22 a=jGH_LyMDp9YhSvY-UuyI:22
X-Proofpoint-ORIG-GUID: MiPnSZ_jHbaxCE82OmB7hFyUJdyzEKaK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-22_04,2025-08-20_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 clxscore=1015 spamscore=0 bulkscore=0
 malwarescore=0 suspectscore=0 adultscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508220160
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

On Fri, 22 Aug 2025 14:39:44 +0800, Andy Yan wrote:
> From: Andy Yan <andy.yan@rock-chips.com>
> 
> 
> There are two DW DPTX based DisplayPort Controller on rk3588 which
> are compliant with the DisplayPort Specification Version 1.4 with
> the following features:
> 
> [...]

Applied to drm-misc-next, thanks! I will wait for a few more days to apply the
rest, maybe it gets some more R-b (especially the MAINTAINERS patch).

[05/10] dt-bindings: display: simple-bridge: Add ra620 compatible
        commit: 480a76c64f4f6a7f8d4aa2ac86cd2178687716b9
[06/10] drm/bridge: simple-bridge: Add support for radxa ra620
        commit: 73b81fcb12df1051bd169e488245f8bf4c37bc93

Best regards,
-- 
With best wishes
Dmitry

