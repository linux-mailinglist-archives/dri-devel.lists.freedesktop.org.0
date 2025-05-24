Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 59387AC3065
	for <lists+dri-devel@lfdr.de>; Sat, 24 May 2025 18:06:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 891E310E109;
	Sat, 24 May 2025 16:06:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="YiHZ9HNV";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D09A610E0E5
 for <dri-devel@lists.freedesktop.org>; Sat, 24 May 2025 16:06:21 +0000 (UTC)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54O29MYJ015438
 for <dri-devel@lists.freedesktop.org>; Sat, 24 May 2025 16:06:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 qvWre4NwLlEhheV6UhBdS9zth/I+k8wEV1eM6J753YQ=; b=YiHZ9HNVNtH2gNwj
 7WHHK0+apf+0Cv5/v/qmyCUN9D+064lld3QxPE+Vwa9CQJuMA/BuTVpWk2+zYm2T
 HnD5pBh+zjGNoP0+roqajSH6MavQ7foATxv/NO/n23QsXAR82cNrrGADNZROVztX
 XNg2DlY9JxD7phtbjJvIyA2FnVN4EecmdvIzC+cEGOxIvOB0jsIGjnrX+Ejg0KZw
 u1/FeogRIr8p2j9shvPtcM1g9637N5/IIadz6nRtGhu/gaE1DVcinUD32PDEYBxm
 3AMRU1Wmuiik5VWibR25IHW1SIOlgMFwEqUIpeb9f3S8cnOErmNwoxutD2QsUiq/
 eEp2dw==
Received: from mail-yw1-f198.google.com (mail-yw1-f198.google.com
 [209.85.128.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46u52urybs-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Sat, 24 May 2025 16:06:20 +0000 (GMT)
Received: by mail-yw1-f198.google.com with SMTP id
 00721157ae682-707d49f9c3bso13877537b3.0
 for <dri-devel@lists.freedesktop.org>; Sat, 24 May 2025 09:06:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1748102779; x=1748707579;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=qvWre4NwLlEhheV6UhBdS9zth/I+k8wEV1eM6J753YQ=;
 b=K9HF+UtFE4LQgPbwjPZwZr98M2W9T7zRIoViayeSm0ZwsH0e+ArM/RUP8LkPZMMj+b
 rLPkCz6qQFmlLNSwWn4+6GEqEU5nS1VuT/GOlbOIyHioTe/bcMy4feKhB06kYXh9qYBN
 y1z1Nc1UgjCmlEndW6VMCRhNmxyi/PW8lDq98wZWknXZE7Wm8v+XgXnLgTJe3uONvAK7
 tpCcvZYpaZIuv94cqxztsu6Azuj2VjVrR66tbFNu8goCnFc26Lj0zKkMgB6ffmKb9nLw
 UutoFmmkGh0QSlBuHZKdDrG/+0obUsHeMW5h2aInCdrBL4J3y8m3cFDwWbGlT/R9VPy7
 hrHg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVXsf6KZp5FNOGrl6lwLj8kBclRZa0CMMFEzG8IRF/5GAJPh3CIIQ38lc0vKbeVvYQHYIeaJ/w3BcE=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyuZ0jKyyaS94wvg1eHOyHtJDJEgoJjr20n1BbimkohiH0C9g4V
 KnbXHq9vfPym5VW+ubWHvO5pJJPgiF/MYry0InETfEZd6fHh88w55ir04Zgm20YUfT6gsfoFUrW
 yAkixdmTEVhfLptgyDaimw7aZMxif7L8+8MblueMv+iGJ+EJlRJ+j1eozRGo9twW9f/v1a/eJUg
 JZ3CVLxcFalprEdR/q8P78y3Z82nS0U1Gp88Xh9kS489zcqQ==
X-Gm-Gg: ASbGncv7EF4O/TT92QJrVmKWjxtJ/mxlG2LTQ4ONh6sAAL5lMzX+K8zhl5Xxb8uQjGW
 eT6F4P/89fxiM4etNLSzlZOs+XbfPlhF1wpKUilXGitmwt7sXPVabA25lb8uHvSdKik1F2sk=
X-Received: by 2002:a05:690c:6710:b0:70d:f53d:dd34 with SMTP id
 00721157ae682-70e2d9d50c6mr27825967b3.20.1748102779182; 
 Sat, 24 May 2025 09:06:19 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH4tL39voPqdTiKIP3IIIX1ysehsTY0iOqhgM4UabaxxGpMrBca877TkCTIF4JkmyrzRULHgkdJPd2B9DdtaSI=
X-Received: by 2002:a05:690c:6710:b0:70d:f53d:dd34 with SMTP id
 00721157ae682-70e2d9d50c6mr27825507b3.20.1748102778853; Sat, 24 May 2025
 09:06:18 -0700 (PDT)
MIME-Version: 1.0
References: <20250523-binrep-v1-1-c3a446518847@oss.qualcomm.com>
 <76xrcy5lvic7mucwuph7a5mgq47atuoocukanjf2q7g5ov6ffa@wbfks6f4hvpk>
In-Reply-To: <76xrcy5lvic7mucwuph7a5mgq47atuoocukanjf2q7g5ov6ffa@wbfks6f4hvpk>
From: Viswanath Kraleti <viswanath.kraleti@oss.qualcomm.com>
Date: Sat, 24 May 2025 21:36:08 +0530
X-Gm-Features: AX0GCFtYDaH1Ic7QEuPAQQ8ozFwzgT7xoanbWmVWsm-9FahKFxoR6k6aeF5-CQ0
Message-ID: <CAHyS93o+zgBK=zP6N9O+qvKDgPTe+OWtpp70D5ciYUfQyqAf7Q@mail.gmail.com>
Subject: Re: [PATCH] drivers: gpu: drm: msm: registers: improve reproducibility
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Ryan Eatmon <reatmon@ti.com>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Bruce Ashfield <bruce.ashfield@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTI0MDE0NyBTYWx0ZWRfXyRgjhmCgEqi7
 PNUi3v4CD/xq4IKfx2yTMjwfMmZeTgD9ah4lKRiRNpB/YnhJHT6NIHdprWGMF+iExwyhmBnOPDt
 79/WyXFY3686KhzTb+gw2wOnMw6dC3koA7hHB0TcXBCmnS6zzJnGa4TLOUCSq7kJPryxz8IzYqV
 WRHMKfMjLG73llUDD9Qjn9uybylU1fizddGSzKSQ48cFwdW72MsFcvTzJH8D+n+fQsVDcTqElvc
 kTyI7l4JFt8YpZ/02aq5/NxRgWOZNrGM6khI6FC2EEWV1wRMZluOFonTj0zfU2IrGVOQq67AKyL
 liS9aL3ATza6hAbFR1KgVNyh99yBwW9Y7u9s7p7cug1GKEFI7z9R9qwg171jrbVV/zMsjcnXcOd
 FxqGo0at+gdtmebtG7gKmtWPZaeh1sF7En5bq1ZUk1nNwc+g4remkYImWnladDiOD4cvKnyZ
X-Authority-Analysis: v=2.4 cv=f/5IBPyM c=1 sm=1 tr=0 ts=6831ee7c cx=c_pps
 a=g1v0Z557R90hA0UpD/5Yag==:117 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10
 a=EUspDBNiAAAA:8 a=sozttTNsAAAA:8 a=pGLkceISAAAA:8 a=DbLYaGFL_cwN43_H1DIA:9
 a=QEXdDO2ut3YA:10 a=MFSWADHSvvjO3QEy5MdX:22
X-Proofpoint-ORIG-GUID: x92Gb_Pf_wObyhe36akdMARajWBnLulE
X-Proofpoint-GUID: x92Gb_Pf_wObyhe36akdMARajWBnLulE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-24_06,2025-05-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 adultscore=0 impostorscore=0 suspectscore=0 mlxlogscore=479
 spamscore=0 clxscore=1015 phishscore=0 bulkscore=0 lowpriorityscore=0
 priorityscore=1501 malwarescore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505160000 definitions=main-2505240147
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

On Fri, May 23, 2025 at 10:30=E2=80=AFPM Dmitry Baryshkov
<dmitry.baryshkov@oss.qualcomm.com> wrote:
>
> On Fri, May 23, 2025 at 06:36:16PM +0530, Viswanath Kraleti wrote:
> > The files generated by gen_header.py capture the source path to the
> > input files and the date.  While that can be informative, it varies
>
> You are not the author of this patch. Why did you drop authorshop
> information when picking it up and resending?
>
Apologies for the oversight. I've corrected the author ID in the v2 posting=
.
> > based on where and when the kernel was built as the full path is
> > captured.
> >
> > Since all of the files that this tool is run on is under the drivers
> > directory, this modifies the application to strip all of the path befor=
e
> > drivers.  Additionally it prints <stripped> instead of the date.
> >
> > Signed-off-by: Ryan Eatmon <reatmon@ti.com>
> > Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
> > Signed-off-by: Viswanath Kraleti <viswanath.kraleti@oss.qualcomm.com>
>
> --
> With best wishes
> Dmitry
