Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +Ni9L5NOgGlQ6AIAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Mon, 02 Feb 2026 08:13:23 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E36D1C91AE
	for <lists+dri-devel@lfdr.de>; Mon, 02 Feb 2026 08:13:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2A38310E285;
	Mon,  2 Feb 2026 07:13:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="WyDiOQBG";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="PYb5e26T";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 277E410E285
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Feb 2026 07:13:20 +0000 (UTC)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 611MBJHR1237320
 for <dri-devel@lists.freedesktop.org>; Mon, 2 Feb 2026 07:13:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 TOn8WxpAI+xLLi6hCoSt1O1PWlTIigMOrNKcnGiwBLM=; b=WyDiOQBGklyIBbfQ
 vckFi6VMSWQ/GrRlVpCivkJ0jub6gyYKNe+rhs7uSzcj8t5UaeZcuRygNSNcKpHR
 inVRxvT+HzRG13peJkvpFWrPgPxf47twqyKkfd1hFHdene1Jb6T+glhphwz/ORuy
 9FuOGmZRZ8MKo/oRrFbM5NrMEUh0axILn4C6M7RSP/DrsaaUUc+jepp2FPkCOutW
 +7nENTzL4kI9I7I81pHrJ+66Nv4hCJLs39lCJ09OAhe+8z1u+m6oG+b5oP4LbFDQ
 ES5RhFi+tm1x/5+Z4HbiiPNui/LXD0Z1pQb/4v/jDS3Mf+ySDTosswSQjmtelR3x
 0RcP2A==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com
 [209.85.210.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c1arrvavq-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Mon, 02 Feb 2026 07:13:19 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id
 d2e1a72fcca58-8227fdbc51cso2014457b3a.1
 for <dri-devel@lists.freedesktop.org>; Sun, 01 Feb 2026 23:13:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1770016398; x=1770621198;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:from:cc:content-language
 :references:to:subject:user-agent:mime-version:date:message-id:from
 :to:cc:subject:date:message-id:reply-to;
 bh=TOn8WxpAI+xLLi6hCoSt1O1PWlTIigMOrNKcnGiwBLM=;
 b=PYb5e26ToHtKiVqoqphXE/YENiF8OImh5aY9/xE30uI5ZlXhjfFjzBiP9VAQ7wx5Q/
 dy84f8JYI7iUspH9LChOX3DEL5UVnl7qcVCgjrwvAisdDafHsfgHAJAeyPrHNxNBVnu9
 8KFoFYOKLxsoZAgHtUdJHJBSuKAbTol44ZfgDiyCTojYKgtG1EYpAXMwFasyhnKN4zX+
 OOYy6rGOId8JyF+yT+29S24ISCdp5qGpLx+SiEhJTdhbmps4P/GpHyMQjmiEu9nc8GsT
 pn5nrxsXtWYqVSrq1A83RqB5yLe094qbsM5/z99Hmb7ir3H6CLZ6PnU0472+zQAAGXG3
 atsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1770016398; x=1770621198;
 h=content-transfer-encoding:in-reply-to:from:cc:content-language
 :references:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=TOn8WxpAI+xLLi6hCoSt1O1PWlTIigMOrNKcnGiwBLM=;
 b=jxGLBTKFPHAx7HLKPv+tPox5gUJVYHsMGMKnHLX+lbQ0SrOduIkfE68jpDabjGdgzH
 YuYu1gQHNJAvp4n92Kq44v+jcaAhPjF7nfmrzrf+P3NZ0KETr4flu21vGxwigKbZKKr6
 739aIw4vdbEyr/IlC2NcpEnRFWo8R9PUKixm8T60iqvtQZ/Hn5cI6KDzCnMCGNkZwrF0
 brjcGi21qSDhwalb8POY/JAKUxRn5uCh7PTZso5thw4sAxCDMt1/3orJZ58bAtE5xtoC
 KFjsAUbMXy4WpN7AiVCkfq/h5HtKcildrmwEL0NTHjs3d0vO6ljkJ+Kprhyyn1y5tIDB
 JG9w==
X-Forwarded-Encrypted: i=1;
 AJvYcCXzpfO7O32+Pm50kSPXsJjNgGm1AZlQhqu8XPoyd9/Nhva2uZpxpco0Ods/L6tMI+jfaEMDVRzSTBE=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw2XUFGrA50Se486F3qijUT26Y5y20MO7VkKJnj+xCcmR+c/63m
 lChmNrCqfJ22KNdug7a4ZDcSme6W/X09RsRc5GcfOq5+qZfBNpM6iFGByNrNpF1zj4NTstSxxYl
 fDw4JIK57NflXyU/QWc2eOniOgmpqzB0BUkrT3OjG54BF/o53oOY4MEtlG9HSMBS46jmuyE4=
X-Gm-Gg: AZuq6aJYEgW4BnJernJMG5alTqWhIpNj5OXrUGG8/StXrfQJT3dxxRVFngrRkCrK4to
 EWFoCFyfYRCKSqjRgCmvgkUA0HnBl2cVLpVqzsYQoXDDC4bWScT5R/DSfgGfIlt30jG3vCs++/D
 FoEOXC8Cs3USnBO9hZkQ9JxeMzafoZTeToi9zQ1m2AuWQME0Eur0Sj65qqCee0hfiK7br0Xys5d
 R8ydV6BzUzAzWEpiJ+s0ZNLMBaR424Hapocii14g3YEOtdNZNLVh63tp9PneVwiE0D5LiBepvpv
 73d8rrvpnBP0Nic3l6ejzlEQ8uyxKWTUObFhwvJd7LIqcfH1UIGTlrak8xoOtj8FzmH8Zga+Oly
 CDhPJFSzq3ZfCJjQevwzr9j2NJtFILY+d8Upe8OKRXrQJvKDwIvoVSk73OOCtFxRo+T6RUTu+dV
 dXcrCO
X-Received: by 2002:a05:6a21:4cc5:b0:38d:ebdc:353f with SMTP id
 adf61e73a8af0-392e015cd70mr8972281637.68.1770016397815; 
 Sun, 01 Feb 2026 23:13:17 -0800 (PST)
X-Received: by 2002:a05:6a21:4cc5:b0:38d:ebdc:353f with SMTP id
 adf61e73a8af0-392e015cd70mr8972255637.68.1770016397328; 
 Sun, 01 Feb 2026 23:13:17 -0800 (PST)
Received: from [10.133.33.100] (tpe-colo-wan-fw-bordernet.qualcomm.com.
 [103.229.16.4]) by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-c642add5199sm12734854a12.31.2026.02.01.23.13.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 01 Feb 2026 23:13:16 -0800 (PST)
Message-ID: <2255b500-f4fd-4d7a-a5d9-5b4fb55c78b2@oss.qualcomm.com>
Date: Mon, 2 Feb 2026 15:13:10 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/4] misc: fastrpc: Add NULL check to fastrpc_buf_free
 to prevent crash
To: Greg KH <gregkh@linuxfoundation.org>
References: <20260115082851.570-1-jianping.li@oss.qualcomm.com>
 <20260115082851.570-2-jianping.li@oss.qualcomm.com>
 <2026011621-fang-moneywise-d6b2@gregkh>
Content-Language: en-US
Cc: srini@kernel.org, amahesh@qti.qualcomm.com, arnd@arndb.de,
 gregkh@linuxfoundation.org, linux-arm-msm@vger.kernel.org,
 Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>,
 thierry.escande@linaro.org, abelvesa@kernel.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 quic_chennak@quicinc.com, stable@kernel.org
From: Jianping <jianping.li@oss.qualcomm.com>
In-Reply-To: <2026011621-fang-moneywise-d6b2@gregkh>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: Ew1iMrwJN-G2_RrR2d6yghPMGPxyu-26
X-Authority-Analysis: v=2.4 cv=FNYWBuos c=1 sm=1 tr=0 ts=69804e8f cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=A4WIMml1adry92zxVK8A:9 a=QEXdDO2ut3YA:10 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjAyMDA2MCBTYWx0ZWRfXwmfzrCtmUqvo
 bjuXdAFgqLyOz/v30tX6TPtQe93d6nShmCV3fqwr1ojwROAaxT1kO6hPHe4atbyK831oCR/kKf8
 a5FhsdI8fgnlIGmQrIL2hHa6fL0wr8XyvhcWM5aLrZCOaZ3BA9TPoWut/xY1Khx6Za/aagQ2/nb
 DiUfbDBVQ5tKTU9TVah+5p3ERb9ihiamWflU0k5SFrBvttswLqbpjXHjhjxiZzPjJLEw6lgan4v
 bOaBr9MW78K4bgpL5yu0WaaOM2eohvOazVcTCHhmV490s3tCSJvJxv27qles7CEsJhiifpCfo+R
 qO61elFtugVAk8PHzkF1O4CDB6WvNpk7gCYI16xO0bZlhf/VXtUw6DZNEuV0EMMWEaGamY3zobi
 iHLTAjeTrHv71zVhVEAEhcPrtXnzlMBxtrbAQruDIyY68NsJ7u7Yu743z9R9A6lhj7Tvp7nIRQn
 WNlb0l+Dfafqgd2dh1w==
X-Proofpoint-GUID: Ew1iMrwJN-G2_RrR2d6yghPMGPxyu-26
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-02_02,2026-01-30_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 bulkscore=0 priorityscore=1501 clxscore=1015
 spamscore=0 adultscore=0 lowpriorityscore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602020060
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.31 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:gregkh@linuxfoundation.org,m:srini@kernel.org,m:amahesh@qti.qualcomm.com,m:arnd@arndb.de,m:linux-arm-msm@vger.kernel.org,m:ekansh.gupta@oss.qualcomm.com,m:thierry.escande@linaro.org,m:abelvesa@kernel.org,m:linux-kernel@vger.kernel.org,m:quic_chennak@quicinc.com,m:stable@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[jianping.li@oss.qualcomm.com,dri-devel-bounces@lists.freedesktop.org];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	FROM_NEQ_ENVFROM(0.00)[jianping.li@oss.qualcomm.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,qualcomm.com:email,qualcomm.com:dkim]
X-Rspamd-Queue-Id: E36D1C91AE
X-Rspamd-Action: no action



On 1/16/2026 10:49 PM, Greg KH wrote:
> On Thu, Jan 15, 2026 at 04:28:48PM +0800, Jianping Li wrote:
>> From: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
>>
>> The fastrpc_buf_free function currently does not handle the case where
>> the input buffer pointer (buf) is NULL. This can lead to a null pointer
>> dereference, causing a crash or undefined behavior when the function
>> attempts to access members of the buf structure. Add a NULL check to
>> ensure safe handling of NULL pointers and prevent potential crashes.
> 
> What caller passes in NULL here?  I did a quick look, and see where the
> callers check this properly if it could be NULL, otherwise it all looks
> sane to me.  What in-kernel user is causing a crash here?  Why not fix
> the caller up instead?
> 
> thanks,
> 
> greg k-h

It's a saftety coding: to eliminate NULL checks on the caller side, as 
we do in a lot of other kernel API.

And it was pointed out in the v1 patch discussion that this change was 
needed:
https://lore.kernel.org/all/c80c48a1-f1b6-4520-9d7c-3a83915c7717@oss.qualcomm.com/

Thanks,
Jianping.

