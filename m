Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 59791B348AF
	for <lists+dri-devel@lfdr.de>; Mon, 25 Aug 2025 19:31:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A5C2910E519;
	Mon, 25 Aug 2025 17:31:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="BbQOvtIm";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9443C10E519
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Aug 2025 17:31:54 +0000 (UTC)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57PGY1Hu028657
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Aug 2025 17:31:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 Yi6k+/Sdd3O++LmQoGjAXS8tWRplbAIkwPndWWaTDRI=; b=BbQOvtImvKfdtkzK
 9aaK/zBImPvfWRVdeA9sbSRjUYn1mSuW80872e8AyQ27X6C5bgxaYmnJK2lfqvrx
 50qIJg6G8xR6VIWCB++k6biU7demHVHIUvgUVXyOuIteU+FO7PzQ3TdsEz3fdPjM
 HYqdlOuTIaGAz5Gr1l+HwmvoocNfvkVDhh+Li8g9a7Gk4dGGjJPLf31UivSkK87P
 pEdUDf0SCsQltmrAq3nLfpE27A+jG8TfGVaiZ5/rYwuCsq8lTPUPbnd8HYxKV0we
 tMzPvXbNoXnyF2/12cMdM4GtBkc/vATEXBZutrcIjTe51fv6eGadJ374uU1eDDs4
 igHhWg==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com
 [209.85.214.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48q6thwy14-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Aug 2025 17:31:54 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id
 d9443c01a7336-246bcd0a112so11141635ad.1
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Aug 2025 10:31:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756143113; x=1756747913;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Yi6k+/Sdd3O++LmQoGjAXS8tWRplbAIkwPndWWaTDRI=;
 b=vQ/pUAfRyxUgkrBh5xvsr/v7qzeSVQybMi+cd9HYDdOATcLLFIXJplcdpIqV8n3DXu
 0VpW5EP5+kGBHbACymchOnP5dwFKtpziTpWT7nVuRJ6Waj9QmyKMQv3HnxNG4cYemEQw
 UGUp0ynFRlGb6XLRYfDoeFGP+6Z3ynBAQ0JBlwkEtez9SUWt2VNKnnVvKl8Km0PM8IvB
 gZXtimJm0HmPAzksJye1PlPgqXCpxZfQaui6yqJXrpu1AYX9biF+EART945uTifmcZQa
 96gu9ImDHCobbVq+UtgH6aEmQx8+cFXRehPlaBudqfmbV1z5e2XwDJ+Ovwpwx0S3oLLI
 PaqA==
X-Forwarded-Encrypted: i=1;
 AJvYcCU620HbzMYyjLnCO1nkauSy+V/PPjttfyrYkybn9UOehgI0d21XCO6iXIRiN2G0q/O9DsfGsSrjLBA=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyxXz/jN2lpscqy9yqaMCiJ5Cz45IkQ6cIF5+jZpR4/6TXALdBS
 jy2jBYHYCgrpc40f49l40MXNs5zm+b93rZRAcudWLST9bO58aGn/iGw/TB0Yr4uwtiNbn+AXXX1
 m6h9nPGTxob7jy914bNggHynJ6Q22es0ZSJEREl5tlWj1m+6/w+rO47X8+5CSLZyoctkop713I4
 9kJT0=
X-Gm-Gg: ASbGncuosPGu51bp/yg8geVZx0IV2T3C/QI1CiAQDGC0umekfoxn6l3do5u4Pe2A5qv
 McEjWPxe3WDhP/JuS1RZo/HwrA+P+j2CXGwLKEn91whDqubLuuZjrcZYBVjImHe3OhnLCThYvpP
 SKS888gNnygsyJ+1xgJonYeTCG96MTRxWpImyBQ/fv2e44vqBs3VxoZ4VnvdLrNlzZ84leg2cMt
 fmZyHf9lUfGNwrYBNY6ekycdrxqVcdURDuH1MP03foolWg/PE38a7nq/59qNcreDz+j0AHr1j7H
 0RXBp/L7aNP+IyCtmosT/0OLhi3Wlwb4xtyr246psmk0c3Yac4+nSS+jEYgY80nQYJPk8hvdxDX
 7PHoVrQ9UMGqAh04s6G8nXtDRlI0=
X-Received: by 2002:a17:902:cf4c:b0:246:7d4c:9f90 with SMTP id
 d9443c01a7336-2467d4ca180mr125172525ad.6.1756143113006; 
 Mon, 25 Aug 2025 10:31:53 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHCj9RYgtm6uGodfQ7CuZA/ZASRmW3qOx+WCjIx1AkSj4Yt/AjpQUG3ygOE+EekbJyvOtHrLA==
X-Received: by 2002:a17:902:cf4c:b0:246:7d4c:9f90 with SMTP id
 d9443c01a7336-2467d4ca180mr125172185ad.6.1756143112511; 
 Mon, 25 Aug 2025 10:31:52 -0700 (PDT)
Received: from [10.226.49.150] (i-global254.qualcomm.com. [199.106.103.254])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2466889de07sm73428935ad.149.2025.08.25.10.31.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 25 Aug 2025 10:31:52 -0700 (PDT)
Message-ID: <b92002ac-0fc7-404f-92b6-6bfe9964dfac@oss.qualcomm.com>
Date: Mon, 25 Aug 2025 11:31:49 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC v5 1/5] drm/netlink: Add netlink infrastructure
To: Aravind Iddamsetty <aravind.iddamsetty@linux.intel.com>,
 intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Cc: Alex Deucher <alexander.deucher@amd.com>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Hawking Zhang
 <Hawking.Zhang@amd.com>,
 Lijo Lazar <lijo.lazar@amd.com>, Michael J <michael.j.ruhl@intel.com>,
 Riana Tauro <riana.tauro@intel.com>,
 Anshuman Gupta <anshuman.gupta@intel.com>
References: <20250730064956.1385855-1-aravind.iddamsetty@linux.intel.com>
 <20250730064956.1385855-2-aravind.iddamsetty@linux.intel.com>
 <b84ccec7-3971-4497-b563-21b4807f0c98@oss.qualcomm.com>
 <b0447abc-5082-4c87-a21d-6a43de5c788c@linux.intel.com>
Content-Language: en-US
From: Zack McKevitt <zachary.mckevitt@oss.qualcomm.com>
In-Reply-To: <b0447abc-5082-4c87-a21d-6a43de5c788c@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIzMDA0MyBTYWx0ZWRfX+OWnalhxOYRF
 zSoHAfLJ3HiDjeWNMm/lRQz1f+k1GoksQ53RJsuAjn+rK/ExrB22UljoAFU/CSD+vqX2lfdiaBy
 TEDi3JBKrIWxU10zEGQFo+vMm3KPm9JcruchKkcUBZnn0/+HpXbQd6CtC8lEhHDyhfmm0zn1Msj
 y9Sdd2gwDg0NjwrQv94/YUQeVkOeUIfWSwShbDlUGDE/m/tzoQHT7UX/q27fvYUUg0k0xXp1sN0
 CdLVM0YbteMM3GeCK70CK1v7TmYwUysp1abgP1H0LKW22cx9FM/n0X+4Njy+gEdPwv2I1zSQ0Dp
 HLs3sCdnxYOXM1qJxUeMj7tJIe3Wcxu48dizLLsq92wBE+D3ylhCFVdZ65vuFXr1G9RzCJ9gIgn
 pK3zZqY1
X-Proofpoint-ORIG-GUID: 8NWG_LCACjGmn1b2rr4-lzUb2wdYrFEG
X-Proofpoint-GUID: 8NWG_LCACjGmn1b2rr4-lzUb2wdYrFEG
X-Authority-Analysis: v=2.4 cv=W544VQWk c=1 sm=1 tr=0 ts=68ac9e0a cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=WtnXQbCkuiZG9bo0y7MA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-25_08,2025-08-20_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 clxscore=1015 suspectscore=0 phishscore=0
 bulkscore=0 impostorscore=0 adultscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508230043
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



On 8/21/2025 3:45 AM, Aravind Iddamsetty wrote:
> Glad to know the interest,  at present the code does create drm netlink
> family for accel device as well, but it is tries to register with the
> drm primary node name which might not be present for dev->accel,
> checking for the "DRIVER_COMPUTE_ACCEL" and registering with the name
> will fix that.

This is correct, trying to access dev->primary->kdev->kobj.name through 
an accel device will cause a fault. I believe your solution will work, 
and the node name can instead be retrieved via dev->accel->kdev->kobj.name.
> But also to bring to your attention the current series focuses on
> reporting RAS errors and hence the commands are as well oriented towards
> errors, anything specific to telemetry needs to be added. Do you have
> any thought as to what kind of data and what kind of command support you
> might need.

Understood. We will likely be interested in RAS functionality in the 
future but thought this would be a good avenue for telemetry as well 
since our device currently has a functional RAS implementation.

An early prototype for this might add a new command for telemetry and a 
new policy with 4 new attributes: the type of telemetry to read/write 
(e.g., SoC temp), whether the request is a read or write from/to the 
device, the status of the request, and the telemetry value read or 
written. As actual telemetry fields are likely device specific, these 
can be defined in the driver's uapi header and passed opaquely through 
the netlink interface.

The above description was sufficient for an initial prototype on top of 
our driver. Mostly, however, we want to reiterate our interest in these 
changes and will keep an eye out for a future patchset that incorporates 
generated boilerplate from a YAML description.

Thanks again,

Zack

> Thanks,
> Aravind.
