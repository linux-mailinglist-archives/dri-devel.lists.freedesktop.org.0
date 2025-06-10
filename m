Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C443AD3058
	for <lists+dri-devel@lfdr.de>; Tue, 10 Jun 2025 10:30:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 69A8E10E264;
	Tue, 10 Jun 2025 08:30:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="FC6YPbX5";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 30C1710E4C2
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Jun 2025 08:30:27 +0000 (UTC)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55A8NFXG006202
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Jun 2025 08:30:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=UCyodPVPr8Std+9Ivx4CI4FR
 F286U+QLDgMjCD3KzE4=; b=FC6YPbX5GkRBkumlTxY0TY8kWNCDFKr4dfUnsF60
 neXXV124vtbp7ENwBfzP9UmVUrgDo0+eUmTPzFQbYCj7PvNByX502U6EHd0sp61A
 Eu3Nm3dcZUtFQDKBMe+gX0s2911eTMatY7/ON5B6K97Fvkb/VujXu2v9PQoU0vtO
 ovTXiXHjwYFuk3dRZCjyJzh9qgyfcjvpwEb3y52jiEDMLg9DCG6i/gdP6lc++xFS
 qKKF0fs1a+SVuXgVF1VoWprDMZVgbf1hW1F51csvIPmYsSWLwWSeQslsLVjakp6X
 kEtsGDAZXUh5MhJvr8OJ5QYNF055Wfizb8k1gOh66RM5TA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 474dgxrym1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Jun 2025 08:30:26 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id
 af79cd13be357-7caef20a528so1308919385a.0
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Jun 2025 01:30:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1749544224; x=1750149024;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=UCyodPVPr8Std+9Ivx4CI4FRF286U+QLDgMjCD3KzE4=;
 b=K6FW2Ef9in2Gb8rUGGqI1S3pE5ifDyAy+awA9jLKPh2HdsPGuCzCRsVNLXKqOUy8tS
 IRa+EqINUwZF0D9TdsKhQPOREfZepGTwhUv+vaPZRyqzDN2K3n0LSMyNNvSajjbW42oM
 pTRyTLscjUdvqZD4unzHk9p4+BLKjKb7bLCKpzPKHuLD864VXMhgxT5mH0ZwJ9ctSq4A
 Gh7GRuMdOh5BsRrSCgiS5D/yTdw2ixEXApZ5Mml/09QFn6L3AchOZfLSGsZJpLoRuJhi
 +i8511g/oFSSkPQLTOZSq8I4mRj6EzCtVrmz6ww2QMKQjDnIyiPBcNwr4y+YSw/d5BfA
 BlKA==
X-Forwarded-Encrypted: i=1;
 AJvYcCW9A+O7K5/KvdHoPmi8EhXbaKd59yug9/wMLiI1KHGG+861xxzMXz67R5xh68GtuNlVwg1GfvGYd+o=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx+RR74wUOPKaz0h4s0O6SdpQZyOXO8bwTmVrZAQqaAbdIEsbg+
 WHMhMpuFAO1sDKAsHD2JZkUDRVXXCGxsNyyfbQMxbGP4WjSEt3I5+H7nGoyQxiKgRtGxDz00Jll
 tIK4yqsaY2g6+J3cJiIJYyi8aR6Xbx1dpXx2jy25cnuG+6O828AEg0qkrOSf4LVQxiEVDssY=
X-Gm-Gg: ASbGncvD6KhM14GQsRBsi3HmuAAOF056vgc6ftuypx7THYqahLeVmE/4+l1HLt1HtmA
 TGM8oNAyz09DGHEIR/QIsPqBvDJ4fTVxjclv7LsX4KMiQb6paPmweQw3WCtJOTXWQixrTr8YYyO
 V297DarSfFycMsQ+nuWeP0EiRODJiXaqdipnWJDrdGtvmkKAj2UKM54HrzSjxsHPNaYdpyENz38
 pmvaYPpgT8M0jnkoPEuPxo1dcuQ/Lc1bpfOnoxB3pwSGrAtZYFHa/R1aYddQJ7RM2prlJORI9jK
 PckArqKxP9NL18X0iwAp88vwuF6ZWGz/SBlrciytdqFu6NSR/rusgGh0IC9TC9RNNcQp/jDMEt0
 R7ac3qeXJw2gXj6XZlPHTysQ8n6SVhvYugdA=
X-Received: by 2002:a05:620a:223c:b0:7ca:f039:d471 with SMTP id
 af79cd13be357-7d2298ed30cmr2164436085a.52.1749544224229; 
 Tue, 10 Jun 2025 01:30:24 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHb05mlCa5MDvIu6ksUAixRaOBZtZ0d8TtfwzrJUG+IZH7TwT53aUKnmGoeEDO8XQt5vaYPyQ==
X-Received: by 2002:a05:620a:223c:b0:7ca:f039:d471 with SMTP id
 af79cd13be357-7d2298ed30cmr2164431885a.52.1749544223781; 
 Tue, 10 Jun 2025 01:30:23 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-553676d0207sm1452751e87.4.2025.06.10.01.30.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Jun 2025 01:30:22 -0700 (PDT)
Date: Tue, 10 Jun 2025 11:30:21 +0300
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
Message-ID: <20250610083021.gqj4q75hybtfkszn@umbar.lan>
References: <20250609-msm-dp-mst-v2-0-a54d8902a23d@quicinc.com>
 <chbsxsy3vltr4752uutnu77a6mt5jbsjixfsgb7dqqdcgypkhq@vuldhcnkksy6>
 <b4d54e57-e365-4ec7-932a-79d35a75c2c1@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b4d54e57-e365-4ec7-932a-79d35a75c2c1@quicinc.com>
X-Proofpoint-GUID: 195qhwN5-kDGmRBhfAVE0LRouJ2dlp0b
X-Authority-Analysis: v=2.4 cv=HMbDFptv c=1 sm=1 tr=0 ts=6847ed22 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=6IFa9wvqVegA:10 a=e5mUnYsNAAAA:8 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=tVI0ZWmoAAAA:8 a=pGLkceISAAAA:8 a=COk6AnOGAAAA:8 a=8AiveE1uLiwWvzgexEUA:9
 a=CjuIK1q_8ugA:10 a=PEH46H7Ffwr30OY-TuGO:22 a=Vxmtnl_E_bksehYqCbjh:22
 a=-BPWgnxRz2uhmvdm1NTO:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: 195qhwN5-kDGmRBhfAVE0LRouJ2dlp0b
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjEwMDA2NCBTYWx0ZWRfXwWbaCs2AT0kG
 0VWUFX14xpAX5FpqtnfGL9JycgHln6A5At/hd3BebwquSOMTOdY7ryxcQe99Q4fNrtstOdRZhw0
 uh8QHGBkanJAfd2YgPxKdHXodTUpFuK2I0xsHbfad+Wo7J7KJNBeBX1qVaqi6jWK5uEg2enPVVy
 lQ+KIg7CO1SMtJl4cm6I4T7qEeQEiONaV3yy93eoN9ob/QG3m1R/cMd31qIDeDYHnDgRL1bw2Ao
 FncLU4/QHvzbEylB8p6xcB+29Kpn6doWiTuzEN7a6718KUKPQpS6E87bhuTM9vaA8p87YB+W+rN
 owcEXdUC1kzbU+zoMbEmzXvAhldrZAaGpMGMyEc6Ppp9rUzw4ilQAg1PFBkvefxib0WoTGtMcis
 VQC7BACoGYQAdGC42XBWZYITnCe19wRsVY4DnT8bVXYAJscn5ITcBaASf/EnzgLfW56xJJrG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-10_03,2025-06-09_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 mlxlogscore=999 priorityscore=1501 impostorscore=0
 suspectscore=0 malwarescore=0 phishscore=0 spamscore=0 lowpriorityscore=0
 adultscore=0 mlxscore=0 bulkscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506100064
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

On Tue, Jun 10, 2025 at 12:47:00PM +0800, Yongxing Mou wrote:
> 
> 
> On 2025/6/9 20:36, Dmitry Baryshkov wrote:
> > On Mon, Jun 09, 2025 at 08:21:19PM +0800, Yongxing Mou wrote:
> > > Add support for Multi-stream transport for MSM chipsets that allow
> > > a single instance of DP controller to send multiple streams.
> > > 
> > > This series has been validated on sa8775p ride platform using multiple
> > > MST dongles and also daisy chain method on both DP0 and DP1 upto 1080P.
> > 
> > Which means that you didn't validate the MST interaction with the USB-C
> > stack (there is a significant difference in the way HPD event is handled
> > in the Linux kernel).
> > 
> Yes. this patch series not test with USB-DP. Actually, our initial plan was
> 2x2 MST on SA8775P and 4 MST on ACS8300. All of them are native DP
> interface, not USB-DP. So can we only support SA8775P/QCS8300 in this
> series. We don't plan to support other platform in this patch series.

I'm sorry, it doesn't work this way. This is not a product kernel,
limited to a selected set of platforms. So, you have to hook MST support
in both paths. The series is not going to be merged tomorrow, so you
have enough time to validate MST on the platforms providing DP over
USB-C.

> > > With 4x4K monitors, due to lack of layer mixers that combination will not
> > > work but this can be supported as well after some rework on the DPU side.
> > > 
> > > In addition, SST was re-validated with all these changes to ensure there
> > > were no regressions.
> > > 
> > > This patch series was made on top of:
> > > 
> > > [1] : https://patchwork.freedesktop.org/seriedds/142010/ (v2 to fix up HPD)
> > 
> > This series has serious concerns and most likely will not be merged. Not
> > to mention that the URL is invalid.
> > 
> Got it. Sorry for the typo in the URL. So should we drop this patch series
> or wait the state machine rework from Jessica zhang ?

Please work with Jessica. As I wrote, I do not intend to land the
mentioned series.

> > > 
> > > Bindings for the pixel clock for additional stream is available at :
> > > 
> > > [2] : https://patchwork.freedesktop.org/series/142016/
> > 
> > This series needs another revision.
> > 
> Got it.
> > Not to mention that I plan to land [3] this cycle
> > 
> > [3] http://lore.kernel.org/dri-devel/20250518-fd-dp-audio-fixup-v6-0-2f0ec3ec000d@oss.qualcomm.com
> > 
> > 
> Got it. will rebase on this patch series.
> > > Overall, the patch series has been organized in the following way:
> > > 
> > > 1) First set are a couple of fixes made while debugging MST but applicable
> > > to SST as well so go ahead of everything else
> > > 2) Prepare the DP driver to get ready to handle multiple streams. This is the bulk
> > > of the work as current DP driver design had to be adjusted to make this happen.
> > > 3) Finally, new files to handle MST related operations
> > > 
> > > Validation was done on the latest linux-next on top of above changes and
> > > both FB console and weston compositors were validated with these changes.
> > 
> > Validation should be using IGT for testing. Please ensure that there are
> > no regressions.
> > 
> > > 
> > > To: Rob Clark <robin.clark@oss.qualcomm.com>
> > > To: Dmitry Baryshkov <lumag@kernel.org>
> > > To: Abhinav Kumar <abhinav.kumar@linux.dev>
> > > To: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
> > > To: Sean Paul <sean@poorly.run>
> > > To: Marijn Suijten <marijn.suijten@somainline.org>
> > > To: David Airlie <airlied@gmail.com>
> > > To: Simona Vetter <simona@ffwll.ch>
> > > Cc: linux-arm-msm@vger.kernel.org
> > > Cc: dri-devel@lists.freedesktop.org
> > > Cc: freedreno@lists.freedesktop.org
> > > Cc: linux-kernel@vger.kernel.org
> > > 
> > > Signed-off-by: Yongxing Mou <quic_yongmou@quicinc.com>
> > > ---
> > > Changes in v2: Fixed review comments from Dmitry
> > > - Rebase on top of next-20250606
> > > - Add all 4 streams pixel clks support and MST2/MST3 Link clk support
> > > - Address the formatting issues mentioned in the review comments
> > > - Drop the cache of msm_dp_panel->drm_edid cached
> > > - Remove the one-line wrapper funtion and redundant conditional check
> > > - Fixed the commit messgae descriptions of some patches
> > > - Reordered the patches and renamed some functions and variables
> > > - Link to v1: https://lore.kernel.org/all/20241205-dp_mst-v1-0-f
> > > 8618d42a99a@quicinc.com/
> > > 
> > > ---
> > > Abhinav Kumar (35):
> > >        drm/msm/dp: split msm_dp_panel_read_sink_caps() into two parts and drop panel drm_edid
> > >        drm/msm/dp: remove dp_display's dp_mode and use dp_panel's instead
> > >        drm/msm/dp: break up dp_display_enable into two parts
> > >        drm/msm/dp: re-arrange dp_display_disable() into functional parts
> > >        drm/msm/dp: allow dp_ctrl stream APIs to use any panel passed to it
> > >        drm/msm/dp: move the pixel clock control to its own API
> > >        drm/msm/dp: split dp_ctrl_off() into stream and link parts
> > >        drm/msm/dp: make bridge helpers use dp_display to allow re-use
> > >        drm/msm/dp: separate dp_display_prepare() into its own API
> > >        drm/msm/dp: introduce the max_streams for dp controller
> > >        drm/msm/dp: introduce stream_id for each DP panel
> > >        drm/msm/dp: add support for programming p1/p2/p3 register block
> > >        drm/msm/dp: use stream_id to change offsets in dp_catalog
> > >        drm/msm/dp: add support to send ACT packets for MST
> > >        drm/msm/dp: add support to program mst support in mainlink
> > >        drm/msm/dp: no need to update tu calculation for mst
> > >        drm/msm/dp: add support for mst channel slot allocation
> > >        drm/msm/dp: add support to send vcpf packets in dp controller
> > >        drm/msm/dp: always program MST_FIFO_CONSTANT_FILL for MST
> > >        drm/msm/dp: abstract out the dp_display stream helpers to accept a panel
> > >        drm/msm/dp: move link related operations to dp_display_unprepare()
> > >        drm/msm/dp: replace power_on with active_stream_cnt for dp_display
> > >        drm/msm/dp: make the SST bridge disconnected when mst is active
> > >        drm/msm/dp: add an API to initialize MST on sink side
> > >        drm/msm/dp: skip reading the EDID for MST cases
> > >        drm/msm/dp: add dp_display_get_panel() to initialize DP panel
> > >        drm/msm/dp: add dp_mst_drm to manage DP MST bridge operations
> > >        drm/msm/dp: add connector abstraction for DP MST
> > >        drm/msm/dp: add HPD callback for dp MST
> > >        drm/msm: add support for non-blocking commits
> > >        drm/msm: initialize DRM MST encoders for DP controllers
> > >        drm/msm/dp: initialize dp_mst module for each DP MST controller
> > >        drm/msm/dpu: use msm_dp_get_mst_intf_id() to get the intf id
> > >        drm/msm/dp: mark ST_DISCONNECTED only if all streams are disabled
> > >        drm/msm/dp: fix the intf_type of MST interfaces
> > > 
> > > Yongxing Mou (3):
> > >        drm/msm/dp: Add catalog support for 3rd/4th stream MST
> > >        drm/msm/dp: propagate MST state changes to dp mst module
> > >        drm/msm/dp: Add MST stream support for SA8775P DP controller 0 and 1
> > > 
> > >   drivers/gpu/drm/msm/Makefile                       |    3 +-
> > >   .../drm/msm/disp/dpu1/catalog/dpu_8_4_sa8775p.h    |    8 +-
> > >   drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c        |   21 +-
> > >   drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h        |    2 +
> > >   drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c            |   72 +-
> > >   drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h            |    2 +-
> > >   drivers/gpu/drm/msm/dp/dp_audio.c                  |    2 +-
> > >   drivers/gpu/drm/msm/dp/dp_catalog.c                |  558 ++++++++--
> > >   drivers/gpu/drm/msm/dp/dp_catalog.h                |   64 +-
> > >   drivers/gpu/drm/msm/dp/dp_ctrl.c                   |  474 ++++++---
> > >   drivers/gpu/drm/msm/dp/dp_ctrl.h                   |   22 +-
> > >   drivers/gpu/drm/msm/dp/dp_display.c                |  510 +++++++---
> > >   drivers/gpu/drm/msm/dp/dp_display.h                |   33 +-
> > >   drivers/gpu/drm/msm/dp/dp_drm.c                    |   53 +-
> > >   drivers/gpu/drm/msm/dp/dp_drm.h                    |   12 -
> > >   drivers/gpu/drm/msm/dp/dp_mst_drm.c                | 1065 ++++++++++++++++++++
> > >   drivers/gpu/drm/msm/dp/dp_mst_drm.h                |  106 ++
> > >   drivers/gpu/drm/msm/dp/dp_panel.c                  |   66 +-
> > >   drivers/gpu/drm/msm/dp/dp_panel.h                  |   10 +-
> > >   drivers/gpu/drm/msm/dp/dp_reg.h                    |   46 +-
> > >   drivers/gpu/drm/msm/msm_atomic.c                   |    3 +
> > >   drivers/gpu/drm/msm/msm_drv.h                      |   19 +
> > >   drivers/gpu/drm/msm/msm_kms.c                      |    2 +
> > >   23 files changed, 2725 insertions(+), 428 deletions(-)
> > > ---
> > > base-commit: 475c850a7fdd0915b856173186d5922899d65686
> > > change-id: 20250609-msm-dp-mst-cddc2f61daee
> > > prerequisite-message-id: <20250529-hpd_display_off-v1-0-ce33bac2987c@oss.qualcomm.com>
> > > prerequisite-patch-id: a1f426b99b4a99d63daa9902cde9ee38ae1128d1
> > > prerequisite-patch-id: ae9e0a0db8edd05da06f9673e9de56761654ed3c
> > > prerequisite-patch-id: 7cb84491c6c3cf73480343218c543d090f8cb5e2
> > > prerequisite-patch-id: f32638e79dd498db2075735392e85729b1b691fc
> > > prerequisite-message-id: <20250530-dp_mst_bindings-v2-0-f925464d32a8@oss.qualcomm.com>
> > > prerequisite-patch-id: e505c21f653c8e18ce83cad1fc787c13a6c8ed12
> > > prerequisite-patch-id: cfdd5c37d38b2a4f1386af4021ba3920c6d8dcf8
> > > prerequisite-patch-id: f4abdddcb90c8203044395f4768d794214fe3225
> > > prerequisite-patch-id: 45013dfaf34856422b7b6b3d2ee42d81a917177b
> > > prerequisite-patch-id: 2f35bedb0410bead1b66cbfaf51984fc7016828f
> > > 
> > > Best regards,
> > > -- 
> > > Yongxing Mou <quic_yongmou@quicinc.com>
> > > 
> > 
> 
