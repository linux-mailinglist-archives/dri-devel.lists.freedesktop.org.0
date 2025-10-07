Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 72E0DBC1DFF
	for <lists+dri-devel@lfdr.de>; Tue, 07 Oct 2025 17:11:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 173CA10E6D3;
	Tue,  7 Oct 2025 15:11:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="SNpjPcok";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 659C010E6D3
 for <dri-devel@lists.freedesktop.org>; Tue,  7 Oct 2025 15:11:40 +0000 (UTC)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 597ET29i029249
 for <dri-devel@lists.freedesktop.org>; Tue, 7 Oct 2025 15:11:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 uCA75ovFs7WYpxpgsqD2ctzMYhiu4ihLhFDOHVz80Ko=; b=SNpjPcok7zB6rieu
 yawGefYN+GCDtAM6LkKqBPnW8tSMfXOCYtyTMc0tfo8AEXnmhzJVFyl3GdKKFOAd
 Kd1xdxaUfBt2xrYMevWIzul1Te6oQn/1fwPSHmrAFocJ4MwNcHxBvOJDTPJSXyUs
 EOjAUKBi/4Xq96nyuknaA1K/4ZTqIycGZ8CkeuDguqYvaE0YrOkKiwVpnww1lOni
 ampa66/SVEnCazeEQIlcRCXT516J+BXM5Qp45PRFeEduP7uLEMdRTTAzamihmNeS
 xtxJcvP/BSMVNDCM/C2ANoRGjaL7eFw4vej5yJJFja2lj1t+OhFSy1UxHPT1/cVf
 JHy0Zw==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com
 [209.85.216.71])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49mnkptg5h-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Tue, 07 Oct 2025 15:11:39 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id
 98e67ed59e1d1-339b704e2e3so6466468a91.2
 for <dri-devel@lists.freedesktop.org>; Tue, 07 Oct 2025 08:11:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759849899; x=1760454699;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=uCA75ovFs7WYpxpgsqD2ctzMYhiu4ihLhFDOHVz80Ko=;
 b=KdfgtSUh/25ojeQd8CMDf2pplUs6kX7C9j/kbmaF7RXSZzWJvCGz1m6vM3LTM21eL9
 qmAt+7TBAh4JvyAQvchNIOHPaiQawe25BMBB0kEfBzEBaShzkv7e5X7YCL96e5jv1oIk
 seDab+fCi7U/SbiY3H+AZnvTYXikxpTKaFZvQM9cIE/kWmhN0vFQ5IdZYNmbyc/HCW8+
 MZfc/b7TlclKRtgII760h+wHlz5NjhPkdGdqzmQT4y4pkcIY3vIxXgYkq1QLJ9WpIMMc
 f7G/3p7vy+ZjRRaeVINF5HpMXDJTrja3ew5BtMSkFdoxQ2zsAt8bH3mF3nc1Db6D/4GJ
 0c/A==
X-Forwarded-Encrypted: i=1;
 AJvYcCUOyAZEQeJRtLQgxp5NlpzKx++Z4nSV7/73BBDR7ar5z/Jg4sX4GgAuT5mitC9FjNgVxEjIqyJpHnE=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxRf10LVQDue0zSjYoGkAnGC8JxwM7kMYaftuvjxTiWmuY+53lf
 nKpcngQrPbHp3a8T07VIJIjoncnpfIuSsFmSbPEZ6j6JKv5FLE7QI4zJ5bJfnqk9PbwkjUIkBX3
 O77pukstCQaz2tIZp2+t1NzZBWJTCSVfW4pZMZXK/XGO8w+ejpfa6KmGW+mLlGArg4TQmqcI+aG
 90A5k=
X-Gm-Gg: ASbGncvYZReoxfgZKbxNsxeYfRr52ma6EqolRjlKbLoi9ZdDw2PRaMfVMlA/Py8nQpG
 9PTrQ3GvRVPKQfg8nUS/bZQTHDMCU7liXeYMYsBgblnH1N1wnFq3v3z+YnSftmlYtrVfn4lqqu1
 WECqHkjFHTKG4OWWPEQGQxJiEUYOnnT+++OWg3mkrP81YkH2Ud1bxMNvLnHkB1WCbbAD8xPAgJr
 sv5C67aZOVa82zBr8NQW4SZUBJOoKmJY7xGor5VbHXcaGJGrvJ/6jTIvBI028j0ljciGNsaHDkk
 4uUP2woqXgxacelcuh68zn9AUVBlpqcL7cPEydXJ5Py3n18RWO37nxAnumaWmCMeIK0MNcCeJsh
 4VjX+pUa9wdHDW5JfiAE=
X-Received: by 2002:a17:90b:4d11:b0:336:bfcf:c50b with SMTP id
 98e67ed59e1d1-339c27dad9amr21678583a91.20.1759849898651; 
 Tue, 07 Oct 2025 08:11:38 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF3I7VC9a/jcViDril5V/qXtysglpP2dfI4f/ovpHc4k6R2PgoIIlOhxtAVX8C0BbEImTbPow==
X-Received: by 2002:a17:90b:4d11:b0:336:bfcf:c50b with SMTP id
 98e67ed59e1d1-339c27dad9amr21678538a91.20.1759849898050; 
 Tue, 07 Oct 2025 08:11:38 -0700 (PDT)
Received: from [10.226.59.182] (i-global254.qualcomm.com. [199.106.103.254])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-339ee9218ffsm1595226a91.4.2025.10.07.08.11.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 07 Oct 2025 08:11:37 -0700 (PDT)
Message-ID: <9668375d-365e-484b-b9c6-076527efc6f7@oss.qualcomm.com>
Date: Tue, 7 Oct 2025 09:11:35 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] accel/qaic: Fix bootlog initialization ordering
To: Youssef Samir <youssef.abdulrahman@oss.qualcomm.com>,
 carl.vanderlip@oss.qualcomm.com, troy.hanson@oss.qualcomm.com,
 zachary.mckevitt@oss.qualcomm.com
Cc: ogabbay@kernel.org, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org
References: <20251007115750.332169-1-youssef.abdulrahman@oss.qualcomm.com>
Content-Language: en-US
From: Jeff Hugo <jeff.hugo@oss.qualcomm.com>
In-Reply-To: <20251007115750.332169-1-youssef.abdulrahman@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: WWcWQtu-VzqN4uyLlful5eGS7bkx5AUA
X-Proofpoint-ORIG-GUID: WWcWQtu-VzqN4uyLlful5eGS7bkx5AUA
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDA2MDE2OCBTYWx0ZWRfX6FSMfj/YV1X9
 xoZy7Z3JIiK5du3sXjLqsKbG6crT7wTQkTLvAKZcksXEgRxu7nF3y9OMjsoXCDRYTQbTCznKGN0
 P4wv4Zfdt+RpUeuVlzP6VpzKzveQZ56xttlkjzlAqMTX/KHrfmttcnGWP83y49QDsPGwQYPT5kB
 T37Mmzsg8y0tDXpzOA5mVLNATQYrIzg/2ylhuD8r/UU0/cbUlvXKyeAZhviURgDHKJcK8Zr2OdH
 mCEnpPeL7FyYhcuFSVm3Kt3cjywhW6DfE6xNgCizb9Hy2w0+XCGuXExCs9asvcvlChPOsRELSv9
 auUBskFpm/rRfK5IgWYCTREbqNMimO0Os/GfVtxgrz0oXRS6EWTTWfZwIp44y0339zYDP8zdIRz
 dcqD5ji14HNtjg06A6B4VJUdsrcXLQ==
X-Authority-Analysis: v=2.4 cv=BuCQAIX5 c=1 sm=1 tr=0 ts=68e52dab cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8
 a=haWFd_X1g-iGgqmt7XIA:9 a=QEXdDO2ut3YA:10 a=uKXjsCUrEbL0IQVhDsJ9:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-07_02,2025-10-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 adultscore=0 priorityscore=1501 phishscore=0
 lowpriorityscore=0 clxscore=1015 spamscore=0 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2509150000 definitions=main-2510060168
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

On 10/7/2025 5:57 AM, Youssef Samir wrote:
> From: Jeffrey Hugo <quic_jhugo@quicinc.com>
> 
> As soon as we queue MHI buffers to receive the bootlog from the device,
> we could be receiving data. Therefore all the resources needed to
> process that data need to be setup prior to queuing the buffers.
> 
> We currently initialize some of the resources after queuing the buffers
> which creates a race between the probe() and any data that comes back
> from the device. If the uninitialized resources are accessed, we could
> see page faults.
> 
> Fix the init ordering to close the race.
> 
> Fixes: 5f8df5c6def6 ("accel/qaic: Add bootlog debugfs")
> Signed-off-by: Jeffrey Hugo <quic_jhugo@quicinc.com>
> Signed-off-by: Youssef Samir <youssef.abdulrahman@oss.qualcomm.com>

Reviewed-by: Jeff Hugo <jeff.hugo@oss.qualcomm.com>
