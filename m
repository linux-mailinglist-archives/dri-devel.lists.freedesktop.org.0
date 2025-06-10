Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 25282AD3067
	for <lists+dri-devel@lfdr.de>; Tue, 10 Jun 2025 10:32:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7351610E246;
	Tue, 10 Jun 2025 08:32:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="bEaqjg1a";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3DA7B10E246
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Jun 2025 08:32:01 +0000 (UTC)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 559MLpQu026500
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Jun 2025 08:32:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=JZrn3vl29ETLeyef2H75LJZ8
 lkv5P66IpdGTrgWehgc=; b=bEaqjg1awy/7I7egSy8etrDgmlBdeP4BmIFkyrfY
 xFealOQ2CNUsbNraFymUckpY12Jebk448A4LgGD9pgCRgb/AJQ+fXATCn0ySSoIW
 UpuwKg7uZC62LzmAik9nZWOKPiyZKR39qXfo2DrMVLBDmI7U89mkbXI4srQmNeAT
 iCy08G8a36Jbwf/M/mTvfU6y1fWgiZch+RGe/M7OceP33oXruxnhMmsnXYeTSgpF
 Z/vJiy3SuSBCX+nfiFkTaYGhFo4NnCv5UfEzHMMGlf4Jw/0wTUrYX4E34+XiEFqI
 Lmfnw/8+DSckF8MC0qJCKdMuiZUMskX6H2z0PK83/7EaCg==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 474ce9rrfk-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Jun 2025 08:32:00 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id
 af79cd13be357-7c790dc38b4so883573385a.0
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Jun 2025 01:32:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1749544319; x=1750149119;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=JZrn3vl29ETLeyef2H75LJZ8lkv5P66IpdGTrgWehgc=;
 b=X7Oddp3rdhZ9PoGVclX1+rHmyEGOQrOHGO3Pg7hZlVVifFwl43IqMUF5rRUZkp1gXg
 jFsFOrDf2EJZKRfRoImx1oNCITFRxt1TTcJpPrKZVvrYYwY7TYOyybYF01fOsW+BseuN
 ieuCYot7lGeEDQ0yuwAg8oAAcSu54SWFyv2reo9nWlAY+nMuZVxP4C6zRAcqKObJ9/7x
 AUapHy+1QXtO7wQtZ27Xn9TMCx7/fvk3+j3DIob0DnANPLMcy3Djwxmpv5VYG6tcbVy6
 OhhsJ8cMaXh6/xsjCSDtawtOvbO8P4ZatW8A8Is2vZHWUw1W8dZJCyqXQMBA9XVXv4XI
 6kLA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWiyFn8ymCScfkG9Y/j0xVZELrpZRTEMVoCpE5uQ0HyBEjTkqj/i30OT7xoEOLR4JuAVl3ohJKff78=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxDhm3OjfSvOmgsSPfS7NmI9VaJWi8y+Me3r8dWkV09jTpKfn5o
 fNj6OShlWkKmTBF+LEmZ+kVEV7yOY+H5XwxzBqGVYg+Ba6v1y4DSRcZ3BfXlxH1Y1MpryqvOovK
 k6giirxNYAFDPICg4kFmj5kJ2ZtuvtlzxEPH9NxIFtrOL6QE/1SwRpbwgWTgYpA78hBwpDEE=
X-Gm-Gg: ASbGncvyO4pdSByqAxynKFUlQ88Srelz3qULv0guXUhm7mawLEzc/dK4c4Ga63FQf1M
 MF48HB2hvnsAOPnZ/9wkr+lI19tB+g3Beqck5qXRCwbZGfTG5LPSd7J+A1hvJ6wMb3YsfpKVab+
 t0CPsvcUdPvnr3UefFfVwCPAf/myXLmOCC//MrBxj6d3nuR+6Gm34IvSNyP3EsK7i0CiK1BNi/1
 Z3X2IotrIpOZ6bI0jP0wCP2kYC+MjRH7NEsnQ4sv3Szz+EbBuxFkhNK2yKSylIhpCydbObG4msR
 s5RWz3fzefcpF9C1sIBt40N6QsSQ50AwQ+O+uZI6fVgHh5uToUHXA2ZUgJJHsqAPoTKKPiJx00j
 6pacT6DEezxMVE63F7roZApNLt+M/BsN7+qk=
X-Received: by 2002:a05:620a:4415:b0:7ce:ea5d:abfb with SMTP id
 af79cd13be357-7d39d8ad67fmr414411785a.12.1749544319540; 
 Tue, 10 Jun 2025 01:31:59 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFFRon5fmkrg0jRZltDF8NJeGjA/n00qtehYkJGydzz1jCNf65GDG05D22qeb1dd2ENpeasmg==
X-Received: by 2002:a05:620a:4415:b0:7ce:ea5d:abfb with SMTP id
 af79cd13be357-7d39d8ad67fmr414408585a.12.1749544319133; 
 Tue, 10 Jun 2025 01:31:59 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-32ae1cad354sm13794281fa.65.2025.06.10.01.31.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Jun 2025 01:31:58 -0700 (PDT)
Date: Tue, 10 Jun 2025 11:31:55 +0300
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
Message-ID: <20250610083155.cag3de7l727zkcxf@umbar.lan>
References: <20250609-msm-dp-mst-v2-0-a54d8902a23d@quicinc.com>
 <h4zfn52i6jpfbclylgfutdgow7wm2hyl4urtegwcqiw5dkhwef@cfw3fjus4tq5>
 <828ebe51-1a02-41e8-b844-2f1ed8410482@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <828ebe51-1a02-41e8-b844-2f1ed8410482@quicinc.com>
X-Proofpoint-GUID: 751lJdNM2SNHsZnsNbPDZQyiPkAKY60s
X-Authority-Analysis: v=2.4 cv=drjbC0g4 c=1 sm=1 tr=0 ts=6847ed80 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=6IFa9wvqVegA:10 a=e5mUnYsNAAAA:8 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=kJDM2j0BT9hQBkDc-9QA:9 a=CjuIK1q_8ugA:10 a=NFOGd7dJGGMPyQGDc5-O:22
 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-ORIG-GUID: 751lJdNM2SNHsZnsNbPDZQyiPkAKY60s
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjEwMDA2NCBTYWx0ZWRfX4C5KS3vmpeyj
 VU2OefVysSqXKGNRyx74OrzY+gnTZ1UP4DstleQFItmOWchFeeqmzSMQZ076R9ya2Wgp7KrbGif
 vKLWZQppKKytgTcCj/yXMPfSZQkVYnqCPivw2EC2IqvuCUJtM48gEMggRl3x0f8ofvoRhYqRmUe
 QHNvx3DrVBtiRhnr3V4Z7jHe1tPVq3kDm8LGkJycKY6OKoYcnV9CpzmV2u6Zh8XPYqCATCfV3Wo
 RRra1xas2i3BIXi17K++AjO2QQBRjlEd+CK/TgLP/ZV1tFZ08nbrd7MNtEMohN8ocHT3jMhitAf
 h41Fol/Z99yP9K930qK2ddP2ZN5jI2pnBSuRv32KE9kcrC14gGdakWIQX+tOnUidL4QDELuxd9s
 EosPoQVAwUxFUK2lUfED1ekdvcymboEbnGkxDU1MVQtiFRw7RW1/WC7G9MfqmWcr8E6sVFOd
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-10_03,2025-06-09_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 lowpriorityscore=0 malwarescore=0 clxscore=1015
 priorityscore=1501 suspectscore=0 bulkscore=0 mlxlogscore=999 adultscore=0
 phishscore=0 mlxscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506100064
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

On Tue, Jun 10, 2025 at 12:31:40PM +0800, Yongxing Mou wrote:
> 
> 
> On 2025/6/10 0:07, Dmitry Baryshkov wrote:
> > On Mon, Jun 09, 2025 at 08:21:19PM +0800, Yongxing Mou wrote:
> > > Add support for Multi-stream transport for MSM chipsets that allow
> > > a single instance of DP controller to send multiple streams.
> > > 
> > > This series has been validated on sa8775p ride platform using multiple
> > > MST dongles and also daisy chain method on both DP0 and DP1 upto 1080P.
> > > 
> > > With 4x4K monitors, due to lack of layer mixers that combination will not
> > > work but this can be supported as well after some rework on the DPU side.
> > > 
> > > In addition, SST was re-validated with all these changes to ensure there
> > > were no regressions.
> > > 
> > > This patch series was made on top of:
> > > 
> > > [1] : https://patchwork.freedesktop.org/seriedds/142010/ (v2 to fix up HPD)
> > > 
> > > Bindings for the pixel clock for additional stream is available at :
> > > 
> > > [2] : https://patchwork.freedesktop.org/series/142016/
> > > 
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
> > I went about a halfway through the series. During that I noticed ignored
> > feedback, missing reviewer tags, invalid or strange authorship / SoB
> > tags, overgrown functions, one line wrappers, etc.
> > 
> > Please rebase on top of [3], review the patch series on your own,
> > removing / reworking all the bits that can catch my eye, implement the
> > feedback, ask questions where you don't understand it, etc. After that
> > please post v3. I'll most likely skip the rest of the patches for now.
> > 
> > [3] https://lore.kernel.org/dri-devel/20250518-fd-dp-audio-fixup-v6-0-2f0ec3ec000d@oss.qualcomm.com
> > 
> Hi, Dmitry, thanks for your reviewing very much. Actually i have reviewed
> all the comments on Patch v1. Sorry for not cleaning up everything as
> expected. I will address and discuss all the remaining items in the comments
> for Patch v2, and will follow up with Patch v3 accordingly.

Please discuss the items where they have been raised - either in v1 or
v2 thread.

> 
