Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AC32AC0B5B
	for <lists+dri-devel@lfdr.de>; Thu, 22 May 2025 14:10:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 83C6A10E995;
	Thu, 22 May 2025 12:10:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="KhMa7NUv";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E15A510EA64
 for <dri-devel@lists.freedesktop.org>; Thu, 22 May 2025 12:10:00 +0000 (UTC)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54M7hBbg031739
 for <dri-devel@lists.freedesktop.org>; Thu, 22 May 2025 12:10:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=BvoQG4hxN3v9pTAKmz1SDn44
 poE7d7zcfXIMZbDRh+w=; b=KhMa7NUvYXtiGvcQRGxQKGttbjFCq3st5bxBgLm9
 bXv8sAxKKSzHr76mykyJWqpiFKwR/VcgtuzKMxzI7qP3CpdBU0OU0QStL++NH9HN
 XB4OM9hRHXx66FgbsKSlT0TT6MimbnfEBs4GIw9D8F5wM4DC/PyUeRk/g0tnLmRK
 9BxTDglpF+98INIs0WFy+6op3UjBtILbpVRcTv/3iKwKcT7lzFLNpoH7hqSyyFVz
 VHJzTKy6KW8tMgiHeT+tZPZtmvlykCmjCwGEctb/evarY+gSEIAh/9bkECwNE2fm
 Thvuc9VOHeqC4uYNSh1rpO6bH3mX9ogMVZk02ekXCA+bMg==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com
 [209.85.214.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46s8c24u93-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Thu, 22 May 2025 12:10:00 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id
 d9443c01a7336-23209d8ba1bso50154525ad.3
 for <dri-devel@lists.freedesktop.org>; Thu, 22 May 2025 05:10:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747915799; x=1748520599;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=BvoQG4hxN3v9pTAKmz1SDn44poE7d7zcfXIMZbDRh+w=;
 b=nPChn+B31huEWxOe97nItc1NuD6Ze6c1Rw7SRQqIFjUEKApjXPRFA4zoztqu0VV2wc
 5BbchjxdtDtFEgs8h/dpFxma9dOb3EEYwckdaUhN3Eu49uVptDO/SdogFlCiOJsslOyJ
 REsu41zcNfTuR0w3XbWWHmdTJXDu2AJtMMpwpaq+6qze8zjdZLI2lBu6q10sR4gh2DlY
 YlhiWr+o6AwIL2Q8Lr/1lu2VK3uEUg6NBozCYXeATejUNFgpilC0CmbMnFZ7pbgNhQID
 BNKlVIh6PYa0xdahxJ+CevvmC/jG4+TPRlJd3EU8/7EKLnmaCtAkbJ1wAql3AVVQv1eU
 dEVA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUk606kMoBNT8dLs+KrGFLkKv6TB+1FSrxPdOb1tk0AVpJ5CMaGVR/gyEASrpcb3GhkDaO2DGSK018=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy4tO3hIdxSJ1S1A+F4XM0p+dPJL7mqb5yRbkyGkpUU1SK1IqbL
 MbrVQIT8MdG2GVK0jGQrem8BetoZAGhWr9zwWmH7dSWZpOYyB6Fclv89yMKQsgVYQkBe52f1gJj
 /f2wHCLDpUfYPiMD/T8PqiZGmOP9Ijs9inU9jO6Mr2zuoGWRQtERpmSIPVGRgdIRgJ09gHFImPf
 iDr07b5rQS3um6N2ElaAj/SVMfOXrUy1j8+C78oCRxF4KHng==
X-Gm-Gg: ASbGncukO3wn6/TXtk1xuMEHTR7c54SX72cGa35q9Jg+Y5rekP3Kkq72FmfkZeKk19z
 hSyYTE0tMw6+PQeai4RA5ErFzd5yXvHYmqEFriN9D/htq4XPZOie6Tc+v/50hFA2LWI0d8Xs/ME
 +rjXTaSxI=
X-Received: by 2002:a17:903:2ece:b0:21f:988d:5758 with SMTP id
 d9443c01a7336-231d4596fe8mr400738455ad.35.1747915799387; 
 Thu, 22 May 2025 05:09:59 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGdCEwriPVhJPw7aBmQjyQWGffLnnxmkS+nFx7YdAAALnEIq7gGUgxBOtu3WCTCH7z5TqwWGCJc6wYpPvnz8mw=
X-Received: by 2002:a17:903:2ece:b0:21f:988d:5758 with SMTP id
 d9443c01a7336-231d4596fe8mr400738015ad.35.1747915798973; Thu, 22 May 2025
 05:09:58 -0700 (PDT)
MIME-Version: 1.0
References: <20250513042825.2147985-1-ekansh.gupta@oss.qualcomm.com>
 <20250513042825.2147985-3-ekansh.gupta@oss.qualcomm.com>
 <sgfcaujjpbvirwx7cwebgj46uwlcvgr4cgcnav5fmwmjsf4uku@iytanuqqiwxo>
 <71eb4b35-51a3-411c-838d-4af19631325a@oss.qualcomm.com>
 <tdae3jb7zbkbzvk546j5jnxnfkeux2bwrbz3i5gsehecj65n7v@2hseuptlk2a2>
 <999d2ca0-b3d3-4fa2-b131-092bef4951c8@oss.qualcomm.com>
In-Reply-To: <999d2ca0-b3d3-4fa2-b131-092bef4951c8@oss.qualcomm.com>
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Thu, 22 May 2025 15:09:47 +0300
X-Gm-Features: AX0GCFsNC0SwHmC2cAOj9-xXlmg4In_ViGMOryv4sEh8pgb9XcJxs6N1I7dggY4
Message-ID: <CAO9ioeUW=v_CBUchJEt3PArbzBbUgznFO8TK-j=2yUkv8S1Baw@mail.gmail.com>
Subject: Re: [PATCH v1 2/5] misc: fastrpc: Move all remote heap allocations to
 a new list
To: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
Cc: srinivas.kandagatla@oss.qualcomm.com, linux-arm-msm@vger.kernel.org,
 gregkh@linuxfoundation.org, quic_bkumar@quicinc.com,
 linux-kernel@vger.kernel.org, quic_chennak@quicinc.com,
 dri-devel@lists.freedesktop.org, arnd@arndb.de, stable@kernel.org,
 Alexey Klimov <alexey.klimov@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTIyMDEyMyBTYWx0ZWRfXzTsgC7CVzspj
 aiWXLH45XUXhXel1/zeRcaRr9OnlFTUjYPD4/jcFWiPlVjtTWQcXPiAByYjh3uOUwGdkz6dD8PJ
 wazx/80QcEXeYwveEiFYa4TmMDNcQC4bu3H72vxuEFthKJfQNmD/mtfbXekOlUUNaCCVgnzHDqT
 gmixtJ9NKe5tCw2m77r29CHH3pqu8000Ujbxy3uhu297APJcJ7NSjBMUixA9C8FlA12/cZAUwlu
 f7kwxGzntIqZ3/2InFDL5IGu2NSCu8Xh6Mfz01lkTAn/3he5WODg6JikFR4BX5EDAznMM6jd2uA
 WKFh+FO8cB1KZav/DnkWWs7Th0/lmejSrCGvdbBisnO34+LiuFjFLIRUso262mZX3noo7L7QwdM
 9Bqhp9QyF9rUHBpO5e83MdvptmH4QEOmGn4/hXoj/d+n4rpjhG6cQnz/fHWW5+r0jhSPBMTR
X-Authority-Analysis: v=2.4 cv=RIuzH5i+ c=1 sm=1 tr=0 ts=682f1418 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10
 a=EUspDBNiAAAA:8 a=mJARKV2re0eqfElz6OYA:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-ORIG-GUID: UxxkKgbG7CzZyDgPWhrY19Ik9Wy3zBPt
X-Proofpoint-GUID: UxxkKgbG7CzZyDgPWhrY19Ik9Wy3zBPt
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-22_06,2025-05-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 suspectscore=0 malwarescore=0 bulkscore=0
 mlxlogscore=997 spamscore=0 lowpriorityscore=0 mlxscore=0 priorityscore=1501
 adultscore=0 impostorscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505160000
 definitions=main-2505220123
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

On Thu, 22 May 2025 at 07:54, Ekansh Gupta
<ekansh.gupta@oss.qualcomm.com> wrote:
>
>
>
> On 5/19/2025 6:59 PM, Dmitry Baryshkov wrote:
> > On Mon, May 19, 2025 at 04:36:13PM +0530, Ekansh Gupta wrote:
> >>
> >> On 5/19/2025 3:46 PM, Dmitry Baryshkov wrote:
> >>> On Tue, May 13, 2025 at 09:58:22AM +0530, Ekansh Gupta wrote:
> >>>> Remote heap allocations are not organized in a maintainable manner,
> >>>> leading to potential issues with memory management. As the remote
> >>> Which issues? I think I have been asking this question previously.
> >>> Please expand the commit message here.
> >> This is mostly related to the memory clean-up and the other patch where
> >> unmap request was added, I'll try to pull more details about the issue
> >> scenario.
> > Thanks.
> >
> >>>> heap allocations are maintained in fl mmaps list, the allocations
> >>>> will go away if the audio daemon process is killed but there are
> >>> What is audio daemon process?
> >> As audio PD on DSP is static, there is HLOS process(audio daemon) required to
> >> attach to audio PD to fulfill it's memory and file operation requirements.
> >>
> >> This daemon can be thought of to be somewhat similar to rootPD(adsprpcd) or
> >> sensorsPD(sscrpcd) daemons. Although, there is a slight difference in case of audio
> >> daemon as it is required to take additional information and resources to audio PD
> >> while attaching.
> > I find it a little bit strange to see 'required' here, while we have
> > working audio setup on all up platforms up to and including SM8750
> > without any additional daemons. This is the primary reason for my
> > question: what is it, why is it necessary, when is it necessary, etc.
>
> This daemon is critical to facilitate dynamic loading and memory
> requirement for audio PD(running on DSP for audio processing). Even
> for audio testing on SM8750, I believe Alexey was enabling this daemon.

Could you please point out the daemon sources?

As far as I remember, we didn't need it on any of the platforms up to
and including SM8650, that's why I'm asking.

>
> What is it?
> - HLOS process to attached to audio PD to fulfill the requirements that
> cannot be met by DSP alone(like file operations, memory etc.)
>
> Why is it necessary?
> - There are limitation on DSP for which the PD requirements needs to be
> taken to HLOS. For example, DSP does not have it's own file system, so
> any file operation request it PD(say for dynamic loading) needs to be
> taken to HLOS(using listener/reverse calls) and is fulfilled there.
> Similarly memory requirement is another example.
>
> When is it necessary?
> - When audio PD needs to perform any task that requires HLOS relying
> operations like dynamic loading etc.

This doesn't exactly answer the question. I can play and capture audio
on most of the platforms that I tested without using extra daemon. So,
when is it necessary?


-- 
With best wishes
Dmitry
