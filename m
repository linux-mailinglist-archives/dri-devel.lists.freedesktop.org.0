Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BB49AB402AF
	for <lists+dri-devel@lfdr.de>; Tue,  2 Sep 2025 15:22:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 02B1B10E6DC;
	Tue,  2 Sep 2025 13:22:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="A/+illMS";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D911810E6DC
 for <dri-devel@lists.freedesktop.org>; Tue,  2 Sep 2025 13:21:59 +0000 (UTC)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 582B4gX4012433
 for <dri-devel@lists.freedesktop.org>; Tue, 2 Sep 2025 13:21:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=x8/5eG6v7E0FD7GzN3gPOpMM
 xQ0UOLsFJJbc5ROhj+s=; b=A/+illMSYlm+5KJh0m3UFOEdmhVXN6ekOcVxk5hQ
 NuDez9EkO/2Mos4p+mzhgeNuMaRyfT/HQGMPA/7Iahf1sVBbeN9r69RcgFqtStI5
 qpe8mGbw6CKoDjCKM24nYyZwcTneIjZRpEbEfFcoQ4/rW3B0IF5LUmth1LPfvZ99
 nJ1S+S3wmO5qF3+eAFnuRqjgfejW/xS2ox4hHEezkrSkGnjxBxXj3PUvu2py/uK2
 X59HWU3IdiHWPiZ2JGeW4dM91j3AI7wrVGoOxVAIxvf9y4jMa1roHBwangMELLy8
 uZ0CrWR6lEH9RU/rG8Ci6nH5Fcwc5AhudjFBGpu8JomwYQ==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48uq0eg1wv-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Tue, 02 Sep 2025 13:21:59 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id
 d75a77b69052e-4b345aff439so20859781cf.0
 for <dri-devel@lists.freedesktop.org>; Tue, 02 Sep 2025 06:21:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756819318; x=1757424118;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=x8/5eG6v7E0FD7GzN3gPOpMMxQ0UOLsFJJbc5ROhj+s=;
 b=I7nXsz6ENmJVu1B+xRU+uiuf8D3zQqsl1XEMhX6fw0U2jDfTe3Mepc0HL2QHeX+eCC
 RfVSJCInC9M0XfQIpYyQoZACdszZ7XWORHLYhOtHk5EHclV1huOZhLWjuNqqvy+rpvSW
 u4bB4zdSW1wom/yzLLnDqRh8MQc/u9m9Cnb+YpnAIRvxBsjTGqGV4t15R2OMpKDBrjo4
 e4xYHaTX2dVKqCY8WEy7xnNmJ4i5aXFSOEUIVd87NXAyor9PZZX8NQ/vzA017FtIorOg
 dMbs47AducVx6hHl66gtPD9Ycp3Xb6Uj+O3pyCNCgS8GENXndFG7okI/SxXauHqZxKS5
 kj4w==
X-Forwarded-Encrypted: i=1;
 AJvYcCXMDz2eMv6pirBasum1fOWHphHkUH6LqheAnRe2nkgDR+DE52F5n1DS9Ttk3mHQDBckWEXL0QywDas=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzXghJMO7bfzXd97veG/8ELZg3J5sihw3Dzwc2gReuY4rBU3yT3
 3B3MOUOau4PXFQA9KQDET3qfjtKOGYIbE7nGxJEvBHt8LsxFWL24Jjq+jOEn6FegUkK/OUbFAFW
 GWJeE6xWtq3rBGYNZ1OlpXZcLMJHjiJodgz8iM2Soy9nqnJHZMyUqip1R5q+WxLhBPjpeDfQ=
X-Gm-Gg: ASbGnctsoZFRBtG/29nEcmUVnvY92ck71L6K1H6awkpHFGe/6MUeLAwJkWNNPQ6S+cq
 XNz7mcQOlzqmCN0AZUa0e6o65Cl3dOgoFeWr+tMCWgKjqRULq1PSWoQzZyZsDNWNpiroOtsWFoY
 JdAxvRqNjEAMjULTGzW5cLjJ0mynXXMXcIydc254JYVx0v6Mn/25l6WZnIk8/sS7DqBJbBkGeG/
 tAAIbH2owGds+owovWJenKBcJq/bgUYHt5fXHVUP3cYfjQpCY9x3kQ82+4E/ugVbceOvzclJLh1
 qTSP/KD1GDlUSOra9qxkR+z6HXNUMl1/ibTi1xMxFWITY4538pswuVMYopUkT5+1eblNx9k3MHm
 UnXFpJL5kV5ZlG9xA+br3ddf6vlBI26wNHNJgQiSb4zA1rv4yDM67
X-Received: by 2002:a05:622a:3d1:b0:4b3:b4e:1c9a with SMTP id
 d75a77b69052e-4b31d89da12mr148861571cf.7.1756819318042; 
 Tue, 02 Sep 2025 06:21:58 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHSu9MaJnIIZaoe/V76qtqYQ63ADVJqzG0Rx4DRd5KbJ1VO8rsaot5Rm1kMuU0ilPHHcOjiRw==
X-Received: by 2002:a05:622a:3d1:b0:4b3:b4e:1c9a with SMTP id
 d75a77b69052e-4b31d89da12mr148860901cf.7.1756819317396; 
 Tue, 02 Sep 2025 06:21:57 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5608279c0b3sm706256e87.99.2025.09.02.06.21.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Sep 2025 06:21:56 -0700 (PDT)
Date: Tue, 2 Sep 2025 16:21:55 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Maxime Ripard <mripard@kernel.org>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v2 32/37] drm/atomic: Switch to
 drm_atomic_get_new_crtc_state()
Message-ID: <bawmlio6yp3kzedbbpdqx2mviuauv6f4gikziwvlh6hgmos5kt@zoqem7k7i733>
References: <20250902-drm-no-more-existing-state-v2-0-de98fc5f6d66@kernel.org>
 <20250902-drm-no-more-existing-state-v2-32-de98fc5f6d66@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250902-drm-no-more-existing-state-v2-32-de98fc5f6d66@kernel.org>
X-Proofpoint-GUID: 49RE8PRIDOWxXjRT_vd7cDQFWT3Amp1s
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODMwMDAwNCBTYWx0ZWRfX11YehkL9UbJP
 SoLMFZH4n7HVyIF8U0Lji+oQROlQc6M59fbyqh6uac8oNkyDv4jV9To/tQBzbtwD2oByzY67aNb
 rRMN68zfVLzfzWTq0KMSLBw+9udvgOecMvMhcW8IYVJ0+FK4/KlvRA90JwFCRTNHNg3RLr+CoV2
 TE19Bi0AHvzMy8Lg4yyhsF64i0Q63axIC3lQsM+cI8TdJ1S1aqLb6myBx7jjBX0dwHx+QyYNXSX
 E/3q6f5F/devyTnQbhxEk3D4nnaAGOOoA/lufnQV6rltm3yoORYux6wLiVryEs1FKT9JT07rKrU
 XMM84XoDaORJzm93wd3tpgyMDUn4rzuuDecoYdGz1acl9MtJhTG9zzQLRk82Wtzn6lY6dcTbrcX
 7YoIR6Ju
X-Proofpoint-ORIG-GUID: 49RE8PRIDOWxXjRT_vd7cDQFWT3Amp1s
X-Authority-Analysis: v=2.4 cv=ea09f6EH c=1 sm=1 tr=0 ts=68b6ef77 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=yJojWOMRYYMA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=mzyTX5D_FkPtKFnfGmYA:9
 a=CjuIK1q_8ugA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-02_04,2025-08-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 clxscore=1015 malwarescore=0 phishscore=0
 bulkscore=0 spamscore=0 priorityscore=1501 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508300004
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

On Tue, Sep 02, 2025 at 11:35:31AM +0200, Maxime Ripard wrote:
> The drm_atomic_connector_check() function uses the deprecated
> drm_atomic_get_existing_crtc_state() helper.
> 
> This hook is called as part of the global atomic_check, thus before the
> states are swapped. The existing state thus points to the new state, and
> we can use drm_atomic_get_new_crtc_state() instead.
> 
> Signed-off-by: Maxime Ripard <mripard@kernel.org>
> ---
>  drivers/gpu/drm/drm_atomic.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
