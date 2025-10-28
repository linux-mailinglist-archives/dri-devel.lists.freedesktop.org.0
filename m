Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B4BBCC16C47
	for <lists+dri-devel@lfdr.de>; Tue, 28 Oct 2025 21:26:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A756410E146;
	Tue, 28 Oct 2025 20:26:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="LZfMP2Tj";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="QJVaXknD";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 29BC810E146
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Oct 2025 20:26:46 +0000 (UTC)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 59SJlE2G2616660
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Oct 2025 20:26:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 Gl1Gjq3Q+a/vqxGRCVR8RvOM2T6VuSErRK4m34DaFgM=; b=LZfMP2TjMvECn0wV
 X1DKHwbyIk8JVTWm4qVrWo8E5HeVeUZ/T1jHjTk1OlOmUIQCp34s+7xiD/16oWaD
 RN1m8czUJyFGxBFtVJjNh9xJXGYYd2vpDqOYcQvtXFU/haPXMWfA6TQD4FR8Vgni
 rmfTtpUCTvGo5b/ZR+AaGKIhuOZXrwjC4oqLjkGo49msijulZumnXAHl9leD7/cw
 6+IlK7YgMMB+JFgIGqc8lVjJ/vgF5qEAWuVsTNPgjZCXqdzs0BSfdrHX77Sepkng
 agMN4fn9KfLOImaKheIpqxpTNNzb/EqvtXt46NcThBrsnBkM4rMdAepdaLck6ELA
 zEjzBw==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com
 [209.85.210.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a349y03q0-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Oct 2025 20:26:45 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id
 d2e1a72fcca58-782063922ceso5324773b3a.0
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Oct 2025 13:26:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1761683205; x=1762288005;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Gl1Gjq3Q+a/vqxGRCVR8RvOM2T6VuSErRK4m34DaFgM=;
 b=QJVaXknDQex6hPz5s8GJjT3H/zHxVLuextJX848JLrgEmEA1PVhZGSGjNGIaemnu9V
 kKc8U/ItAfD1UoOb9SgKAYIbeLftkw/ZaAaa+yqoPDX13Z2PjbVc76ixRVXxRMaXzZfk
 lpAqw7TDgnsVou5wL7uUnHsYpMlryoF8V9FF71XONgLhWTpdvd/HAp7qowmqGQ+a0ITs
 +zPc9S9LI+4zvnawUYoYfkl8v/kIpEmP9ZXJwKF7ZQmIxhg7pCKU8PkNBwUc4kcyRRAI
 Og85B6P/dDfYjjaB8UL23c95eGeCpxMa9UaTvD7t/aLMeqYympl6CbBLLZynAY7Ikbsr
 pvEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761683205; x=1762288005;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Gl1Gjq3Q+a/vqxGRCVR8RvOM2T6VuSErRK4m34DaFgM=;
 b=pvaFlThfTtEpLyWGki+ZiwLpE+Dn+WERdhheH4ZYX1fPXRJXhBfmsRXjjlkrVI+WbI
 ACs02ZC2+HR+7rdwh7iAFO5gij9Nx4/rXGLM+THsJT91M8/7khpeNM0SpiDp4aKtQoX1
 8oDmGmR5Xl0LBPCqkTSYKdWmLgC8fkUfY/phqxEbYL8hg5vTpWbGMdGOY4EuGmSaWwPs
 tcINMCN2f74yPph/I9/fUkcNAb1QTphfN7G8U+ZiiSFIXdh7OkvPO6G4oMS1JImQzkZX
 rpF18BzHx0j8HMT9u9eUxD7IpqF+xDjga+sA/JAEw5PRQl21NsrOpgMNKeVbTAUtjyef
 /xPw==
X-Forwarded-Encrypted: i=1;
 AJvYcCX1raoBwdVPkhMBUvPgiYyzV3WsFNK0rwer8b3NHMc0vSKc5CN9Yb1DXLwTBBlujQimX8aLIUXTipg=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyEQYXw2xetcpS9oZwH8BwryEgxdkVj7az2ZgU3G32Nb5cGw8yq
 Di2vNEKk8URT+CCloxnrqlqNtkc43sHsipY7RmvT5u25WrbCHUFeUrvyYi2bo81UEwB+Wijvioj
 OJ66IW7oACms+NlQLsP1Zj8yYK18jg20QDHQeSIydYx9kmfCMgr517srMNlKx2IsYCRLQleo=
X-Gm-Gg: ASbGncuUcGUolewN/qGAj65hKxSMJBQPe+psW789I8X3L0QZhrntrejZNtZQskAuTz7
 2dMwfPtAIm5KkV47ak0vNxEaiCcxDX7kgoLJycl3GK7xMIbbxzahXIUay6cvhpa0lAjK3wsiJ3P
 MYIqEz+hRtAgmlDWBKXOrZ4RbLgLTM3dsqXWAjnfUUF4aI89hIKsMcgGzl8SbxpmdxCJ1pWETqz
 g6dDhS+jJSP1RyvMe6Z85qh4vG0zS9T9pANwx0V+bRp6WP4lUSVBp2K8SCPabPT7W1W5+clpAHf
 cAUaytME37vG4qvZLXCv23MbSXT28twbBWCm7pXup+2VnMl/stT1Kdrkpf+ugVLhM3L6pKfbqv4
 AdXiJws3nhG2ScZMNxfLblq0I2N0skeX4BA3cY1EEGm29BDFHLxmQ
X-Received: by 2002:a05:6a00:2e88:b0:77f:4b9b:8c34 with SMTP id
 d2e1a72fcca58-7a4e53f71aamr501562b3a.31.1761683205015; 
 Tue, 28 Oct 2025 13:26:45 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEVEiYpCmP3s6tXGCSF0T/zsjURFZbr/6qpsudIXm6tO1vuT/cmH5r2b2oIcvrTUbb7MS6PCg==
X-Received: by 2002:a05:6a00:2e88:b0:77f:4b9b:8c34 with SMTP id
 d2e1a72fcca58-7a4e53f71aamr501538b3a.31.1761683204586; 
 Tue, 28 Oct 2025 13:26:44 -0700 (PDT)
Received: from [10.226.59.182] (i-global254.qualcomm.com. [199.106.103.254])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-7a4140492f9sm12515265b3a.30.2025.10.28.13.26.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 28 Oct 2025 13:26:44 -0700 (PDT)
Message-ID: <7d9bf88b-7935-421c-9308-a7f4f499f416@oss.qualcomm.com>
Date: Tue, 28 Oct 2025 14:26:43 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] accel/ivpu: Remove skip of dma unmap for imported buffers
To: Maciej Falkowski <maciej.falkowski@linux.intel.com>,
 dri-devel@lists.freedesktop.org
Cc: oded.gabbay@gmail.com, karol.wachowski@linux.intel.com, lizhi.hou@amd.com
References: <20251027150933.2384538-1-maciej.falkowski@linux.intel.com>
Content-Language: en-US
From: Jeff Hugo <jeff.hugo@oss.qualcomm.com>
In-Reply-To: <20251027150933.2384538-1-maciej.falkowski@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=D8RK6/Rj c=1 sm=1 tr=0 ts=69012705 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=QyXUC8HyAAAA:8 a=EUspDBNiAAAA:8
 a=xbW1r30GXWwLfVtEEoUA:9 a=QEXdDO2ut3YA:10 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-GUID: JTmu9e1A9Y-mVufJ2DMynhrHiS-W6Kty
X-Proofpoint-ORIG-GUID: JTmu9e1A9Y-mVufJ2DMynhrHiS-W6Kty
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDI4MDE3MSBTYWx0ZWRfX3FsM4RnHy7w0
 77faXRsTT7/fd7UZQyW8wB7rl0kQ0WzHlsiKYHoM5pMbxKjHgkwusBMUBKo8jAbsti5Em/AkW2L
 S2EbwcB4cDVQgbrE5SRQ60khGVy4NiVpikfwEOVggUR1DYm746e/ukZEZ/vDn9ceiEG2qc9q/S8
 A0RbGHtnACbD4+FUjDSf3ZbF1g1MekO4XsF0HHtsAjslqIR8Cvm+NLAveEg8wV6ap+tUk2Nh0it
 BCNxFMZcz/J5hW6heKSihTvumbBrpA9zVSRk8aod9BDB2OuT5cxN5NcYBUR+iJAa0OEEo9Rq8AY
 yUBxGsvgfQ+ALYjmZtSRwNEDlHjGD6IPvtxPKnPk/0QLPWKrtYDzAfE/dJm2rfcV4eogGwzwA8+
 Y3Kspn3hJ/sKmA3/QqSirAphOOZaYA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-28_07,2025-10-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 adultscore=0 impostorscore=0 bulkscore=0
 clxscore=1015 malwarescore=0 lowpriorityscore=0 suspectscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2510280171
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

On 10/27/2025 9:09 AM, Maciej Falkowski wrote:
> Rework of imported buffers introduced in the commit
> e0c0891cd63b ("accel/ivpu: Rework bind/unbind of imported buffers")
> switched the logic of imported buffers by dma mapping/unmaping
> them just as the regular buffers.
> 
> The commit didn't include removal of skipping dma unmap of imported
> buffers which results in them being mapped without unmapping.
> 
> Fixes: e0c0891cd63b ("accel/ivpu: Rework bind/unbind of imported buffers")
> Signed-off-by: Maciej Falkowski <maciej.falkowski@linux.intel.com>

Reviewed-by: Jeff Hugo <jeff.hugo@oss.qualcomm.com>
