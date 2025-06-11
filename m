Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 171ABAD58DC
	for <lists+dri-devel@lfdr.de>; Wed, 11 Jun 2025 16:36:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0687610E669;
	Wed, 11 Jun 2025 14:36:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="YoxF+025";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0947810E669
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Jun 2025 14:36:04 +0000 (UTC)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55B9DnHv028144
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Jun 2025 14:36:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=mLmE/RXH0IKv1odDBp7vU03/
 R92rKvfrvUmgNkGHXOE=; b=YoxF+0251EWgiYuKTbUrLXrdKQyMkNBmeJv2i5c8
 o/FtKbtjo3J1nKf8Vf5Rum7F1IX08de8eie8kJAjZTpx8k5vFSYOerXGFvuf13jY
 rCsegkyqUgrcRlJReVYtCoYQx1imTHWqpB9dYhpkGlLb9MA8mNFsVjsZH1sCNmLZ
 aBgGa5NzYhVWWNm6soxIp1vIaaurbn9SX8dsMdfssZnCqpl3bfC1hxdkUeuwYNa8
 sEFhKJog/o7zhHEakL4rz24mQ1Lydb4rpzVH1lr8K7Tvd7FvLwckYTcUZ2kYwCJQ
 WfzgYqHHPhRbVa1gCxPzhWJVwkRjiOri1IjlZU0lF39G9w==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 474ccvd72e-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Jun 2025 14:36:03 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id
 af79cd13be357-7c5e2a31f75so2072717285a.1
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Jun 2025 07:36:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1749652562; x=1750257362;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=mLmE/RXH0IKv1odDBp7vU03/R92rKvfrvUmgNkGHXOE=;
 b=DxcZBju6likws9pZWKj4fPQjmdxRuyFLgkd62VIEGyQX7iz2wMxWS2ib1MHAEyf/I0
 tAgsI1tIlB4LvBEf+PdRQdEOmyakCu5uVJlgkIfAPkIXg7LqeLnO+g8x2B0djTwdHkNv
 NQBte4tDzlw0c2RkEoQJIBppkcFOGubXYWlaAadW6pSjUC3k21WnjFQHNP8z3JNgIkN6
 rMWnxEhGTB6IxYp0s4J2/ee3s3lbuHNKZ8KaHfB7i3Ajh5FMXKsJBOmTuoVS+lk9jdL/
 um/gTH7i9bof7y+8Rnq3EtEc1LjVGhjBzvcBr1L29uRIecyDMDGXrfRKInKxs+x6Zw9N
 kp5Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCVID7GnYr2NNrTPze/IsB4OXQyd4oYR1zHB428PRoiumcbXknJuou+0Rzk5chOsbucewDOziQegpiw=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwEXyatVpUtZqDVLqvMi/Al5SU6YBiHOcZrndm9YtsY3DEcNfRs
 3at2R8SPS+kmq6sGs70/CD97nkncdUqxxIU2Tj7Jbpo4ST3mvxNjZn7kgI8KUPPaGOAvfcczV77
 FP6TnGp5Lr/OPDziHYFTHHk1Ky0zbSBpSBa22ipm0+7NNS0ZFMryK6y9CdvUy3qq/I02Vsbg=
X-Gm-Gg: ASbGnctsOySoGRkkCRcxnTUMZdlsa/g9JdezoJcpY1iW1OEDx6vJq6C5tSqSrC0Hf06
 QT5O67dmN0XFOCtHmen50rh6L+xBqGwdyQrHNyMhkEid5dCB/dGwsk2cBW0dDZcQQ80ZLDQr1dI
 1Qk/b29IBWHVadnIUGceQfCfVqLwcIZS02ZXvMs5Fhmnn2+KEeKUaWU+t0CBCN5y5pS3WdIsf/7
 xRyhB+JO99D1tzdjQfHWTNOcYfzhA8Zw2qg7HA87yLnsgyLkKmkioXklBY/mRZndVU6GdFtTBMo
 btdbokAscI/Iv60Bka19x94hoPvks1gNQgzNQ9u4R0HDJZ3/0JLYi8OclME6kHQqcajo3Ow8Apm
 OLVDEqMfZ0c1DR9xXI112z9OoS5WUJ5Xbv2A=
X-Received: by 2002:a05:620a:904b:b0:7d3:abf2:5034 with SMTP id
 af79cd13be357-7d3abf25054mr166588485a.26.1749652562087; 
 Wed, 11 Jun 2025 07:36:02 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHcocr3jV5zIUE3s4dT6Wkzy0azFjS2wr6u1QVQ3RdqHa151L1pCo4IWZNjGrBpAGsMUDwaiQ==
X-Received: by 2002:a05:620a:904b:b0:7d3:abf2:5034 with SMTP id
 af79cd13be357-7d3abf25054mr166586485a.26.1749652561691; 
 Wed, 11 Jun 2025 07:36:01 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-32ae1d009a7sm17997671fa.107.2025.06.11.07.36.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 Jun 2025 07:36:00 -0700 (PDT)
Date: Wed, 11 Jun 2025 17:35:59 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Yongxing Mou <quic_yongmou@quicinc.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
Subject: Re: [PATCH v2 00/38] drm/msm/dp: Add MST support for MSM chipsets
Message-ID: <xrgrnjnu4ngod6uizhyx2jtti5xjjhskey7id7xzhpuc5suqbk@g3a57j42ukty>
References: <20250609-msm-dp-mst-v2-0-a54d8902a23d@quicinc.com>
 <chbsxsy3vltr4752uutnu77a6mt5jbsjixfsgb7dqqdcgypkhq@vuldhcnkksy6>
 <b4d54e57-e365-4ec7-932a-79d35a75c2c1@quicinc.com>
 <20250610083021.gqj4q75hybtfkszn@umbar.lan>
 <f5f46747-6c0b-4799-8974-ca666b78ac54@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f5f46747-6c0b-4799-8974-ca666b78ac54@quicinc.com>
X-Proofpoint-ORIG-GUID: yZPxPqwsZtOlC7sfUb-D-6c-epQRGoIB
X-Authority-Analysis: v=2.4 cv=TsLmhCXh c=1 sm=1 tr=0 ts=68499453 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=6IFa9wvqVegA:10 a=e5mUnYsNAAAA:8 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=3eWIT1bEIV1il--ZwuIA:9 a=CjuIK1q_8ugA:10 a=NFOGd7dJGGMPyQGDc5-O:22
 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-GUID: yZPxPqwsZtOlC7sfUb-D-6c-epQRGoIB
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjExMDEyMSBTYWx0ZWRfX7HAEHqrON96V
 1wz+eAUT3oRlVaPnd3h9nym7VllqzlW9kI8JxF4ttkamyhyqxSOrhEUEtZCljmkM0Zx+RHdxlcU
 wDSq4QeRpsBLIthmPTKcRGbQKN76EyZebwbrwqP/Ge3EmrJCggpcPuJNSHPqEz2jgMON6o2lvov
 zJIUp0uGtm0FylXUrtpoM94uLaHDX6llpiH8wegAGKYyuhDLu0FlErpylSjS32c4CwLIHkgHt1R
 NgkW9Sgoo6plwCL7aHbz+VrE7b+bh66eKl/Y7kifhC91S/HxvWb4HH6rb1i+sIcVj9e0f/jqkHT
 Ylxf2stoX2RotlrcFewStl+Nm92p7SUCS9QRjRfjkEPLc3fHiuCK1noW1LxZMy7MSk+HlLdE2Ph
 dKszcI+JX4c4pM5vZxX8j8v+Z2K4hFWpALfN9IakXFW9NAk0iNuOpc3vmuFKprybL/Byc3kW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-11_05,2025-06-10_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 spamscore=0 mlxlogscore=999 impostorscore=0
 priorityscore=1501 bulkscore=0 adultscore=0 clxscore=1015 mlxscore=0
 malwarescore=0 lowpriorityscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506110121
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

On Wed, Jun 11, 2025 at 08:08:49PM +0800, Yongxing Mou wrote:
> 
> 
> On 2025/6/10 16:30, Dmitry Baryshkov wrote:
> > On Tue, Jun 10, 2025 at 12:47:00PM +0800, Yongxing Mou wrote:
> > > 
> > > 
> > > On 2025/6/9 20:36, Dmitry Baryshkov wrote:
> > > > On Mon, Jun 09, 2025 at 08:21:19PM +0800, Yongxing Mou wrote:
> > > > > Add support for Multi-stream transport for MSM chipsets that allow
> > > > > a single instance of DP controller to send multiple streams.
> > > > > 
> > > > > This series has been validated on sa8775p ride platform using multiple
> > > > > MST dongles and also daisy chain method on both DP0 and DP1 upto 1080P.
> > > > 
> > > > Which means that you didn't validate the MST interaction with the USB-C
> > > > stack (there is a significant difference in the way HPD event is handled
> > > > in the Linux kernel).
> > > > 
> > > Yes. this patch series not test with USB-DP. Actually, our initial plan was
> > > 2x2 MST on SA8775P and 4 MST on ACS8300. All of them are native DP
> > > interface, not USB-DP. So can we only support SA8775P/QCS8300 in this
> > > series. We don't plan to support other platform in this patch series.
> > 
> > I'm sorry, it doesn't work this way. This is not a product kernel,
> > limited to a selected set of platforms. So, you have to hook MST support
> > in both paths. The series is not going to be merged tomorrow, so you
> > have enough time to validate MST on the platforms providing DP over
> > USB-C.
> > 
> Would it be okay to implement USB-C DP MST in a separate patch series later?

What will happen if I plug in MST hub after applying this series?
Also... There were several items beforehand, which were left out 'to be
fixed later'. Up to now, it didn't happen. So... I'm really tempted to
say 'No' here.

Also, as I wrote, HPD rework would need to go first (and it wasn't even
posted). One of the reasons why I demand that is to be able to
streamline HPD handling and use the same code path for both USB-DP and
DP-connector.

> > > > > With 4x4K monitors, due to lack of layer mixers that combination will not
> > > > > work but this can be supported as well after some rework on the DPU side.
> > > > > 
> > > > > In addition, SST was re-validated with all these changes to ensure there
> > > > > were no regressions.
> > > > > 
> > > > > This patch series was made on top of:
> > > > > 
> > > > > [1] : https://patchwork.freedesktop.org/seriedds/142010/ (v2 to fix up HPD)
> > > > 
> > > > This series has serious concerns and most likely will not be merged. Not
> > > > to mention that the URL is invalid.
> > > > 
> > > Got it. Sorry for the typo in the URL. So should we drop this patch series
> > > or wait the state machine rework from Jessica zhang ?
> > 
> > Please work with Jessica. As I wrote, I do not intend to land the
> > mentioned series.
> > 
> > > > > 
> > > > > Bindings for the pixel clock for additional stream is available at :
> > > > > 
> > > > > [2] : https://patchwork.freedesktop.org/series/142016/
> > > > 
> > > > This series needs another revision.
> > > > 
> > > Got it.
> > > > Not to mention that I plan to land [3] this cycle
> > > > 
> > > > [3] http://lore.kernel.org/dri-devel/20250518-fd-dp-audio-fixup-v6-0-2f0ec3ec000d@oss.qualcomm.com
> > > > 
> > > > 
> > > Got it. will rebase on this patch series.
> > > > > Overall, the patch series has been organized in the following way:
> > > > > 
> > > > > 1) First set are a couple of fixes made while debugging MST but applicable
> > > > > to SST as well so go ahead of everything else
> > > > > 2) Prepare the DP driver to get ready to handle multiple streams. This is the bulk
> > > > > of the work as current DP driver design had to be adjusted to make this happen.
> > > > > 3) Finally, new files to handle MST related operations
> > > > > 
> > > > > Validation was done on the latest linux-next on top of above changes and
> > > > > both FB console and weston compositors were validated with these changes.
> > > > 
> > > > Validation should be using IGT for testing. Please ensure that there are
> > > > no regressions.

-- 
With best wishes
Dmitry
