Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7914BB45F3D
	for <lists+dri-devel@lfdr.de>; Fri,  5 Sep 2025 18:50:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AE99510E35D;
	Fri,  5 Sep 2025 16:50:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="maMH/SiF";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 473FE10E35D
 for <dri-devel@lists.freedesktop.org>; Fri,  5 Sep 2025 16:50:02 +0000 (UTC)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 585G11Oc024267
 for <dri-devel@lists.freedesktop.org>; Fri, 5 Sep 2025 16:50:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=9XYNERtBPOO9KHd6gblQiOck
 lBdNp7mI+kJcs2pzXbI=; b=maMH/SiF0k3R7jr9nOPmMR0ubPcAuKDxdq4fVOFn
 V2apm33QIUGTulrASzHPfpDDGiP/QSltqZuky/aDNjsiqcbioaJnZXImmxc3WEvC
 PfpNU1emhbpxn5DjkvGKPEe7XUovPdPKlru9LAwRmyzewmRhIlrdq0jgxIaDjH2v
 MERFbkYhm4cRNfaEY4/wYWIXwQftPtDxf4V0k9hWw3t6r+O/AUPnm38XpQdOsmjs
 wJUGDRB4RvD7XFx/90PO03QBTWk2XJeu8GWgte6nP0C/ZQKvVUf5HUQSilU1KzOS
 iQWmS+faD2pNOS9gBgUgN3Tj3DQ5lYZWdf6QRshuQd/D5A==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48ut2fuq4e-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Fri, 05 Sep 2025 16:50:01 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id
 d75a77b69052e-4b32d323297so52116271cf.1
 for <dri-devel@lists.freedesktop.org>; Fri, 05 Sep 2025 09:50:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757091000; x=1757695800;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=9XYNERtBPOO9KHd6gblQiOcklBdNp7mI+kJcs2pzXbI=;
 b=GmdkfGV5kytuQPJ870ypKkaesAPMSGMRY/+owvyppOMd0u+pw3tbEovhVeBKqYykko
 oW5zG6akGqNLZcLaS8k52ZW/Oq0eV9L2H6mM/u/dCFMBJig941HJSV1jhwQQBqK/kjN0
 e/E5frLew5sCZkj9zukDPCZg3JgHq5pe78588MoSBWl0fqzdg6tEtP2sDCx/HG1R03RU
 F0qrloKivTr35roARHktDGiMqrZChUpEAt5VAxloockVaZpHkc4MB3TtEBQXocINn0Fd
 AjjnQ8XIqZZHQnnanBxq5zjYYTdk4qfjPpUyZIq0LXF2EJWYaAE8i7moCVAwLLDta+oZ
 Xcqg==
X-Gm-Message-State: AOJu0YyCotmnO6RuMiEvNx+8rTvap1MJyp4OwH7YXSjsDWTDpC6xfmpL
 LYKyIzhF8bj5jg9bzJ7nXPrWaKmMbgAGif10zsRuciVqlr6I79WyQamx0DfEMlGfEFLfTVAqM6k
 suiQisVhIGruYk+VwQaq+o2CRm3uRb6FiQ10ImgpuL2Yd+D9eMVfhK2EUjPs1FKy15xM/KD8=
X-Gm-Gg: ASbGncvt5OD28tMMcSU4tIU+00DXTyXGsijkuaLSXlt8/ccl7TQ790QhdJtjpzWnWKK
 l2knrZJlp2d9xAgN0SRDTFljXbJPuYBdbzWuNrorCWnjgWX7JINyinO5Xc0Q1iU79XDiaMg78vQ
 OkzeoM3E8rpgqh1w8w6FHFBK7XRK8ptS4ooCh0OcyKVDcNRf7K14tpQBpx4Ijn7WYsA2yu+Omws
 2xuV3qZKQ/qbj5d0pEz6F031hvmx9FxJ/kjcbeeTLWAdUQiWqDLB6qP11NiB5lfJF76ReBi0DSs
 Cz0vxyA807iS4ohq+HUhtAjGXLC+O8nNbF4FgBhEh1LvJZyZbOVDg/36wNvQciVGNzqQo5kyP79
 VmuO1ETYv/S2+XHwbLGuQESfENoFzpAZKZnUmI1M45/xiJKzNJElD
X-Received: by 2002:a05:622a:1988:b0:4b0:da90:d7d with SMTP id
 d75a77b69052e-4b31d80c426mr223970781cf.3.1757091000042; 
 Fri, 05 Sep 2025 09:50:00 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IESUiemXAgecIsqgg/wr+NsF/v1aaJddqDM6nMppXNbjeqxcZ2N1fHPzDKjQPw3tbxAbO/V/Q==
X-Received: by 2002:a05:622a:1988:b0:4b0:da90:d7d with SMTP id
 d75a77b69052e-4b31d80c426mr223970501cf.3.1757090999302; 
 Fri, 05 Sep 2025 09:49:59 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5608acfcd18sm1861710e87.108.2025.09.05.09.49.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 Sep 2025 09:49:58 -0700 (PDT)
Date: Fri, 5 Sep 2025 19:49:56 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/tests: make sure drm_client_modeset tests are enabled
Message-ID: <voexthncfmefgr37xx57jf35h72s2zjc4wyn2dujyhtouq3tr2@xux57zdqov4m>
References: <20250821-drm-client-tests-v1-1-49e7212c744a@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250821-drm-client-tests-v1-1-49e7212c744a@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODMwMDAzOCBTYWx0ZWRfX2BWSwPhxkzHE
 jQ/AtMIYaq6mHKGER5mNxUNap4QF31Wsp/wlkZlH4srwaBhLY/QMz1MRNhrSEWzwQOGwNMRhkzq
 h/SjubDi+6q6aZeK1rxL6+6VYX/VcLyq0plBHrJZ5R/YWUBdeELXjIcyXIutP7gYDYmwcYPpvwm
 wwSi6MBDnozmXxGH2g45e/nyMFPBRgSunKRju7ml7KxheDGJh37FOpK/543W3RIfBtPaICedX9I
 uhVZfUroSfQyjmeyotcJ4ebt19AmIGx2BS6avNU4R42CSDJIUYLLbJv62aIct05V7V6LxuxRvH/
 gFXWYQ3yHiOX8cTVlpqIEOJVC5rpGInDYVFr9MyNety36BvOx/YG98UIy7wzNO9i7calWMSc8tz
 Sye/qpCa
X-Proofpoint-ORIG-GUID: _salSpFLGbZkyi5ZnoskQ_rSRkFZE_wk
X-Proofpoint-GUID: _salSpFLGbZkyi5ZnoskQ_rSRkFZE_wk
X-Authority-Analysis: v=2.4 cv=U7iSDfru c=1 sm=1 tr=0 ts=68bb14b9 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=F7yDxb397TplVcg9Gk0A:9 a=CjuIK1q_8ugA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-05_05,2025-09-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 clxscore=1015 impostorscore=0 suspectscore=0
 malwarescore=0 priorityscore=1501 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508300038
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

On Thu, Aug 21, 2025 at 02:25:06PM +0300, Dmitry Baryshkov wrote:
> Default config for UML (x86_64) doesn't include any driver which
> supports DRM_CLIENT_SELECTION, which makes drm_client_modeset disabled
> (and correspondingly tests for that module are not executed too).
> 
> Enable DRM_VKMS and DRM_FBDEV_EMULATION in order to be able to run DRM
> client modesetting tests.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---
>  drivers/gpu/drm/tests/.kunitconfig | 2 ++
>  1 file changed, 2 insertions(+)
> 

Gracious ping

-- 
With best wishes
Dmitry
