Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 92F35BD6966
	for <lists+dri-devel@lfdr.de>; Tue, 14 Oct 2025 00:12:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A3E8F10E4F9;
	Mon, 13 Oct 2025 22:12:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="dcDr+zXl";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6E90E10E4F9
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Oct 2025 22:12:15 +0000 (UTC)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59DHDAJu020721
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Oct 2025 22:12:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 82Y2ESNzx8wbZfFpXhnmhBsvMOJ6zxaA7xBGUZX/jxQ=; b=dcDr+zXlw1RoHYEO
 E4StZeMQ/g6g8y7WoxZ7JdruVknSUX1+eV/z/VEsLG4zLTF/Qng/MXKiPHgE663c
 BvWjOsOzWuUpjU9dAC1OkccCDGP4ZPBXZDI6yG7PFCXak4jq/lvlBuUkhVF+fPTW
 AtSrbdnfdIrQM74MgsXR+VLoaYgQW2POIR1VBIP08XQC3+eA+vSwxhlyY39G2VrK
 IUJFwh+zN8MB55RMRETyDBinjao8+Ght5psl6PNOrw7+gYblmEy5PBR/JasxDec8
 WtgBgaSNgwAgVVBCemn0IOk2puc9R6tNrv6DhnoeUjOWt/fRPtQxni10Y7fQGVw5
 Ev1r3Q==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com
 [209.85.216.71])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49qfd8xd5a-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Oct 2025 22:12:14 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id
 98e67ed59e1d1-32ec2211659so8569378a91.0
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Oct 2025 15:12:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760393534; x=1760998334;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=82Y2ESNzx8wbZfFpXhnmhBsvMOJ6zxaA7xBGUZX/jxQ=;
 b=V31S+0eyaGDItFuGyrndargDbzm6RJ4EdiGE4vGFyGDGAWpUUjc+gT46PSyMzng54Q
 9dLOZUrhNZ0NzmlBBGwzEFhR13Y9dAJs7ewm5pOOHXHkLDIYDSg2f2KMLx6deN1mytI7
 O2d3Eb32zhuAGVdv9CCQOezBfwRRORYUFp49Ty6Q6w7moUVt//doVCZe3lvJ+L/T/GVr
 /l/FDH4z/i8TkhVLX+C+k4HGe1ACX5RPEXK6SstFEBEk9o6euFZHnyzBNbDiI7y9Eg+9
 NGjfLARC3y9TAita2RICTYpex/eD4UQkZcwkvmWUjpfZIhbcDG8dexrfBXimjJd89WTv
 kEgg==
X-Forwarded-Encrypted: i=1;
 AJvYcCW9CIyedtq52Fqsz0QXzUd2PNXZXuzBK5WKly2cAM6uErcKzpHHQEArHB6EWFHlYHfVVMpvN5syRyw=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyOJrjKO676dU8Mq4or5fupj6WpKLwsl1RJutdWM7Yk9H6aPsSz
 DS8CQILA4VhQRqoQyBcwlqD654ZRwrafJlmifZoYNJReTZizwUdGnRhsEidBvPWPuGuQ0BOq8QG
 YSazvjdrvEF3vJCoGG1RN6iHNC6d7UBUjeEEXz8KT4ai2DoTw/atbaAMB8Y1HqPeI4PCTnGY=
X-Gm-Gg: ASbGnctJeiAq3+38wu/tzHCbhQNmNhJGWSHI3iBZViv4Bj/HzufXGP0rikXkd6Qdlus
 /MnKCmov/YaUIGm6fXnoJGFzk9bPcXeU6jj1/xPdm/be6ghTVvlzWQwlq32nUUpG9dt+nCNm0MT
 g8ng+k7JH8li53oqBJDv+wyQ54LkvRpUzSb09ICSPEcWpjMQFAaH0NAWBGxvEqFmoeh8P8wQM6s
 nH0qeAgx7ZBU5DZaqn7e/Az9b6s0Z9ar7acJrh68HviLmkE7qTEt4nY3XNiIsicQ9mFkfYVk9vY
 s2w81w7CvEgj/o2LLkID+AMZoRDHw9bKEC0fYpjkG/mRNRz1c+ETbuLFbFBwCMyIdr4tJ9nF72Q
 HmJ/c1nHhJrvOjnM7U4I5CnZG2uE=
X-Received: by 2002:a17:90b:1d92:b0:32e:389b:8762 with SMTP id
 98e67ed59e1d1-33b50f2b05fmr30450137a91.0.1760393533933; 
 Mon, 13 Oct 2025 15:12:13 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IETTmeURcZWirOrYydsMIpplDhpkGPn5hy7sXV7d6VJnClJh0zuf4RUDf1xz/iHvBRh7/IBsA==
X-Received: by 2002:a17:90b:1d92:b0:32e:389b:8762 with SMTP id
 98e67ed59e1d1-33b50f2b05fmr30450113a91.0.1760393533440; 
 Mon, 13 Oct 2025 15:12:13 -0700 (PDT)
Received: from [192.168.0.43] (ip68-107-70-201.sd.sd.cox.net. [68.107.70.201])
 by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-b67de1d6227sm50977a12.46.2025.10.13.15.12.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 13 Oct 2025 15:12:12 -0700 (PDT)
Message-ID: <afe67509-fbe2-4eff-9ae9-80387651637f@oss.qualcomm.com>
Date: Mon, 13 Oct 2025 15:12:11 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] accel/qaic: Treat remaining == 0 as error in
 find_and_map_user_pages()
To: Youssef Samir <youssef.abdulrahman@oss.qualcomm.com>,
 jeff.hugo@oss.qualcomm.com, troy.hanson@oss.qualcomm.com,
 zachary.mckevitt@oss.qualcomm.com
Cc: ogabbay@kernel.org, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org
References: <20251007122320.339654-1-youssef.abdulrahman@oss.qualcomm.com>
From: Carl Vanderlip <carl.vanderlip@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20251007122320.339654-1-youssef.abdulrahman@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: zVFbva_vIcOzPHEPmJNOdixYLu08fu8-
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDExMDAxOCBTYWx0ZWRfXxgJlDkf8Wr7i
 ARCup4eLsyoHvdZwILG5FCV3AEXBvUrO5c/aigbu4ZgnlY00PwUqvGnZd0NB9eHh86vZCxxOR05
 VPBpxGeckl+WYwPt7U1LNmWqRFoFOByDWXv1tK3tsavdTevHyox/5RClZiBFaxn9wDkeZbq9szp
 q4H/xEZ+L17udR5/dO29gh+tMc2xQx2ebV5WoVxqNvBxHm/I3fC21YyVZDdpCXWJYbOwZ+xHRjw
 7sn5VfQtwRZs8+d7fzwSzGIVmLXlxlZLxLVV7C5lJBZa9JEWis3AkhfUJ9xK+8lX7VFNZ5JcYHQ
 Xjh3Vc0VkUSA6uGHKbAWpn0uTbf/T0q3lG2HzwqxkKsLzlsKEk3nBLaaFM2fQSjjNIbyxYhxLAL
 /mlOuoBxAkTKesNjxswtDpQl8dD+gQ==
X-Proofpoint-GUID: zVFbva_vIcOzPHEPmJNOdixYLu08fu8-
X-Authority-Analysis: v=2.4 cv=PdTyRyhd c=1 sm=1 tr=0 ts=68ed793e cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=5tLIbcgRqjftBxpLK6l6Jw==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8
 a=mizEDCQyCps1tdB_wZQA:9 a=QEXdDO2ut3YA:10 a=uKXjsCUrEbL0IQVhDsJ9:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-13_08,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 bulkscore=0 clxscore=1011 adultscore=0
 lowpriorityscore=0 impostorscore=0 priorityscore=1501 spamscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2510020000
 definitions=main-2510110018
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

On 10/7/2025 5:23 AM, Youssef Samir wrote:
> From: Youssef Samir <quic_yabdulra@quicinc.com>
> 
> Currently, if find_and_map_user_pages() takes a DMA xfer request from the
> user with a length field set to 0, or in a rare case, the host receives
> QAIC_TRANS_DMA_XFER_CONT from the device where resources->xferred_dma_size
> is equal to the requested transaction size, the function will return 0
> before allocating an sgt or setting the fields of the dma_xfer struct.
> In that case, encode_addr_size_pairs() will try to access the sgt which
> will lead to a general protection fault.
> 
> Return an EINVAL in case the user provides a zero-sized ALP, or the device
> requests continuation after all of the bytes have been transferred.
> 
> Fixes: 96d3c1cadedb ("accel/qaic: Clean up integer overflow checking in map_user_pages()")
> Signed-off-by: Youssef Samir <quic_yabdulra@quicinc.com>
> Signed-off-by: Youssef Samir <youssef.abdulrahman@oss.qualcomm.com>

Reviewed-by: Carl Vanderlip <carl.vanderlip@oss.qualcomm.com>
