Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 67741C1BC4C
	for <lists+dri-devel@lfdr.de>; Wed, 29 Oct 2025 16:47:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9CF9C10E14B;
	Wed, 29 Oct 2025 15:47:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="lSwT+C41";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Vla+9zAi";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2BDC410E80C
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Oct 2025 15:47:33 +0000 (UTC)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 59TC9bfA3663647
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Oct 2025 15:47:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 RekmVKWrCvXzM/j9GSoTaAobqMvaiGt6QxLrXZmRYiA=; b=lSwT+C41lxiR6TW8
 7EF1sQ8XJJ7Gvhc2uIDnCVPsAB/gUyELvTeLuMZIE57TcvqxcG0HD4VG1t2lIZTO
 bIbMrNYPSUVsAag3GlCvKheehJUaRhgI6XVJYP3VW/hU+ajG5qzVPGSCdDpXnz2Y
 9811xIOn+PbdCIR157K3sUjox+/YvXr2LPfbQKChfDE/hznbK1BgTspN99bMkCyh
 z2Vt/+2mGABmeiQvyb11SKSVC/6KohsKmNXwUHwFOLBmiCBvB+StN01Il6v+5fab
 SrXoIdzqQXrDquhP9QzvZRiyr2iCMJ6IDIrp/xdfVnlj7UCgGuAgZk/3tam+cH5N
 /Dk95g==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com
 [209.85.216.70])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a34a1u3vt-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Oct 2025 15:47:32 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id
 98e67ed59e1d1-32ee62ed6beso87622a91.2
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Oct 2025 08:47:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1761752852; x=1762357652;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=RekmVKWrCvXzM/j9GSoTaAobqMvaiGt6QxLrXZmRYiA=;
 b=Vla+9zAitRJ70AuvqMuwMwPz9BouMchyzkOQHTRYhuyO/XRgP35uOLqAaw7Ljv5gid
 cv9YJxuaZj4TDaaIML7oDN380wMc4Lk+8bBybgRNh3AERewi3VMcUHKqpSPb1o8ZJwgX
 Mo7QQbBj0jUzZAG08c+SEaG3YRzZiXoKXz4OO+SWt3NjnmjNZjwBdrx+YxSqA5KOAR3Z
 f89MKscq3NUSq+3L6BO8LF26aRwGfVCvS5U0XEIPg9ZG6BsT4XhhraB4dldypqCOejey
 PoTrqVAGx1VqRfRODIkjpfAk6CEqxd6Es9M5lSU3iO/sXbbu0o8zSkQx12ifBQyYTN44
 kKJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761752852; x=1762357652;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=RekmVKWrCvXzM/j9GSoTaAobqMvaiGt6QxLrXZmRYiA=;
 b=rXwUBucwdnu36EaH+P2rYQMi32Bee+6JHcajYJMprwkbonJYT1SU2Qt06nbUmbK32U
 tNvLoL/EZck0sFzNY9iXCAUheYTgIdJpeRqjD4fKwluobzcDdQ2S8IRacjz7EvCKzb90
 VkliQgDb2wMvWyffNI7SIjlqLAH22tJQxB5ix25/C72vH1RG1weXCy3YNCyzKAi4WlFT
 UPK+tLHRtEXGv/CFLGpC8eixBAILzLyU9FLeJ01/T+FIKWnsp9KTOt13b98297j33djx
 NQlLopHuwyiXX+DPFjwALU2egoZbHrOE5X/T9cKFAy9MKH3if7aFUTZrPmKFpITQoioP
 Aauw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVqR5I2n+qdmZ3V/YXerPNQsZshyVX0HFz7OEz6iwBE/kCeuSoDCg7Jzg5Qn9qmkkYFwKvsDTx9Ezc=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzXVfrVngtx7WopNhAUI+L5D4jHU2JGhGal17eItViLB1sXhKt+
 4FFa0PgGkQhepWE4n2HVJ2l8sgGLkzvrg2eE3r+TNNozOSP40FW5gQ95q85YTa9PjRIuH+FsnML
 DIfKuqVNRQ+qFTttGz8zAa17eUGa7mdG3Z6T38Fp8bqF1rKqKINsxh9PtVF2mdwXUCvTBSCI=
X-Gm-Gg: ASbGncuilQw2ZZ9eqMqAom5Nj9xg7KFEhH8ZY60BfTh84TN6W8yDPwx5QvSfokAecQm
 D5ZUa7P+icQjzSWrpElDpw9FVbJcSua/zrEoDGdcJQDAmxDXyUbcmPwNJd+g8OoAiBYVo27llxw
 APi75/BZFd+T+jVmdOd+Qvn2U+/qL+ynnyV6njXpaIUj7uOizANN8elr4Am0yEECqeSlXjg3Am3
 +bTN0TSAN9amq2h8kNcXzEqpgN9yh3W4aGmhrWeVl/nLIB9BG9oEXtB6+r4lBJ4akkRzBBdjraJ
 UnciQzWfOkWn8zA3a8hmaZFOZbO/qxXx1zClHNqUYhWmRs2xaBoPVXEdik2j+xT+1Bg6bF5KTAr
 94rAOn9GliN/V5ujTp1xyM42HjJ+NKTwDr46CG67IX9ttw8okKh28
X-Received: by 2002:a17:90b:2811:b0:33e:2d0f:478e with SMTP id
 98e67ed59e1d1-3403a14191dmr3445168a91.3.1761752851875; 
 Wed, 29 Oct 2025 08:47:31 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGZ39r+36rUhyBD0fu0OSgVuiZBMWGUrsrB/mnLAglFnh1PbOBfhkQHCppW+f1YqivKDa/Ojg==
X-Received: by 2002:a17:90b:2811:b0:33e:2d0f:478e with SMTP id
 98e67ed59e1d1-3403a14191dmr3445139a91.3.1761752851258; 
 Wed, 29 Oct 2025 08:47:31 -0700 (PDT)
Received: from [10.226.59.182] (i-global254.qualcomm.com. [199.106.103.254])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-33fed706449sm15959184a91.2.2025.10.29.08.47.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 29 Oct 2025 08:47:30 -0700 (PDT)
Message-ID: <dd579486-efbf-41a4-8523-a804c8f7e68f@oss.qualcomm.com>
Date: Wed, 29 Oct 2025 09:47:29 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] accel/ivpu: Wait for CDYN de-assertion during power down
 sequence
To: Karol Wachowski <karol.wachowski@linux.intel.com>,
 dri-devel@lists.freedesktop.org
Cc: oded.gabbay@gmail.com, maciej.falkowski@linux.intel.com, lizhi.hou@amd.com
References: <20251028070642.135166-1-karol.wachowski@linux.intel.com>
Content-Language: en-US
From: Jeff Hugo <jeff.hugo@oss.qualcomm.com>
In-Reply-To: <20251028070642.135166-1-karol.wachowski@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: v9VEjumom8MbSbj73IUKsazLkG0QhY0j
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDI5MDEyNCBTYWx0ZWRfXwYPm88N3F0M2
 w1kAq1c9w53QzlBIr0+tRmNAeo0kJz3znBAHG3zBhAsCaYsEZUerjyEjvw3q2P0vXUhwYZH5qWb
 uBHKS+CfALWNoRyEKnDbsVkwBOEClMIIpd6L0geiX0mTvhLjn1egUveqKrofqXoXg+ewE9eU/EI
 tX/nbmYglJFXHeMAwyNh/qsWn9cqCVMBXSguFADgG16i6HVoNTBpgSfgX94JmkbBl1xA9alw25J
 INDWaMxGcpnYj0Hvh29HfdEeCUqRtelClg8Bvz3AXd6LqxZXg+2WLgChlMy5CO6xuhvigVOS3xr
 SmHVNSefjcPCL7j6PpCwShHtb0Ty73bekZDuGSDrHlUGKdbNUfERVQqruZ/xD3F7T7B1WQqe2Q0
 dHBZiDYaSkNx882PdoSyHI7BMVMPiw==
X-Proofpoint-ORIG-GUID: v9VEjumom8MbSbj73IUKsazLkG0QhY0j
X-Authority-Analysis: v=2.4 cv=UObQ3Sfy c=1 sm=1 tr=0 ts=69023714 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=bWUy6ffCo7lWDh6rsR8A:9 a=QEXdDO2ut3YA:10
 a=zgiPjhLxNE0A:10 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-10-29_06,2025-10-29_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 phishscore=0 bulkscore=0 priorityscore=1501
 spamscore=0 impostorscore=0 adultscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2510290124
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

On 10/28/2025 1:06 AM, Karol Wachowski wrote:
> During power down, pending DVFS operations may still be in progress
> when the NPU reset is asserted after CDYN=0 is set. Since the READY
> bit may already be deasserted at this point, checking only the READY
> bit is insufficient to ensure all transactions have completed.
> 
> Add an explicit check for CDYN de-assertion after the READY bit check
> to guarantee no outstanding transactions remain before proceeding.

Is it worthwhile to mention what can break if transactions are pending 
while we proceed? Is there something that the user will see?

I'm guessing that proceeding with active transactions is bad, but its 
unclear to me if this is just a best practice, or actually fixes some 
kind of issue that will actually impact the user.  If there is actual 
user impact that this addresses, should we consider a fixes tag?

-Jeff
