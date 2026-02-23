Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uG45E25/nGm6IQQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Mon, 23 Feb 2026 17:25:18 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A5A4B179B00
	for <lists+dri-devel@lfdr.de>; Mon, 23 Feb 2026 17:25:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AD2E610E167;
	Mon, 23 Feb 2026 16:25:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="IraS8mIn";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="JNU70pXT";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7940110E0F8
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Feb 2026 16:25:13 +0000 (UTC)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 61NC2kAg3151859
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Feb 2026 16:25:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 Sgfc6Qe9/YaCooZGkC1L+LSJ+OhHoKPGDOHRcffCz6E=; b=IraS8mIntf+gMSGs
 dq98enbYj57qNyOa8qFH5TqTItMONDWgapRKkVNfmGbnjZBkwfPrP9q5cUBIU+q3
 LdKFs02ZE0/sY+MkfmxDmS4C718Q2z13t9N21dVIfLL1zlabhV5Hnhv2R2zaXoeU
 2m1I6mP5zfoHz4wONN5rNa4nM+KlhYmLIgeiz6T3w89pXV5viXRVAKJctnevABxM
 KLppNnaoKtzmJw5O/V2y06gjYINKUaX99ohewnQ7OMeDQNSPDt9mwnQbcc1KTKn0
 9jfTFtL6IZvg0DwHqfMHHlSD/DOtktWTExH3rds36yS5735XjAVqJ9F7SYLmgjqB
 PrBuow==
Received: from mail-dl1-f70.google.com (mail-dl1-f70.google.com [74.125.82.70])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cgpj88tew-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Feb 2026 16:25:12 +0000 (GMT)
Received: by mail-dl1-f70.google.com with SMTP id
 a92af1059eb24-12737f276a2so7441788c88.1
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Feb 2026 08:25:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1771863911; x=1772468711;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Sgfc6Qe9/YaCooZGkC1L+LSJ+OhHoKPGDOHRcffCz6E=;
 b=JNU70pXTaLMyedS119Smmp/zf3plqdleS6mSMmvT2mwVr5jqjF/PPREEGSrj3vSTyH
 pAhJLQVnDPCgWuIPWQn38cBmJJtwjgtnZRbjAG32tRztUKtjEbdNzlAnQHJ1IQPs9cWS
 P9p8W52B+NdoAaPWEs18VCKvvR7fj979OwIPMpMzI80oIc8/wxAMfiC9xGwaLYXRdUUm
 EmfyCsFWcp2p3B6cbdMjVKcq+dGxvm9gEdTXB9zOL9IeLdeoUzt8XA8HWYttbbCi1keR
 2FijPZe2Sx05xzNUKD4rVN7q+IoYnu9E8QZkn2ZjW6W7lQWGFG9VMIv8r+UZmeyp3uw5
 ojPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1771863911; x=1772468711;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Sgfc6Qe9/YaCooZGkC1L+LSJ+OhHoKPGDOHRcffCz6E=;
 b=hr3j0EeOM3PrEASWlUChkeXCn/Nv9OUp7VN+w1quCzb5lon7Ms934QYvtQczfbCiuf
 8/hQvhQutpkH63WvhYICySD58C6P1q9aeSSvAr4iEck8mbzYnzpVzeTMDXyk1/G2u84z
 X9NW9V3S1PpK9WkMRz1toZ0G2v9glitmG1wLnlWgWJFl2wMmyom1qtC8MRivZ/YHuLeJ
 lQIM2tpqiYo9omSRYwWhRe9o06wRPOvJcjoVUkcxs1WyPYS1Ug5+OYG6sP7tzrWZVUAd
 poaRkMke3+h3yjpZlKTwBUwaoL4b2v8aKojVTe2pBSP1ugzPWpxAXm4D8fc2ah6wujvM
 0MxA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWVMRVrGaQE7hal8Mc9rrhamOG49EzwiJjq/qNHpjAbAxcfEMw0nzjbHBZkzTjeLZxjEFkzhG+L/SI=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwD9Yf/OUOiJ/p1EuEYYYbiv4+AwFZRQybVz884fo2POCbrgfUD
 LNubWfPo50Q584nt7J8QdM/ybxChLWJ9EkASszhUQWEWRr5z0tGaimcBOzTzo16w8fOLMrIpt1n
 cEOWY8/IR0Vcfv8RveKPPwg6QKmJmyZ6k+IGcogYUGB6+Op7sUOj8F5gEXJ+MZkeJxdjkWnk=
X-Gm-Gg: AZuq6aKp8PYq1AES9lpbf9Jp62NQpLvlpLM7jSyMjRgouf2V7j6ehzSXkqEhCHxW9Gp
 Oahq7b4T8pLsOPjYSYrGDFMMqZA+UOb3jaiyHrYp/U3bSg5fKr3KafaXZqDi/Hn0Jp8b0uPOSz6
 E11G+joUsQhmtp5ybxyoAVafZu7C99ADBl7+OmxvrWs3kay/rsQ5afO6qPKoXzijwHgUHX4+Kw9
 CbJyH2QJKhgpVw+3Y7Lgtik3CIEBhTGhMg+eUXfyUTO5I+KDoFpnEJ5QRlUpcZeCgvpABHSE1xN
 I3o9hbctrCVKuZ/mHTeQDJRYFWh+IuZfVL44AltoZmxYEdNdX8W2WiEykcDCvNNI2TTPG+pnDwN
 J/yvv2XoYsmPEbb41sC83cF4PosA8K0MBKrjhiMk7LMSU8lDJVN8/esfj4UDdNPIKpWjxmEaY1w
 I=
X-Received: by 2002:a05:7022:6b94:b0:122:a2:ffcd with SMTP id
 a92af1059eb24-1276ad622d5mr2369798c88.23.1771863911438; 
 Mon, 23 Feb 2026 08:25:11 -0800 (PST)
X-Received: by 2002:a05:7022:6b94:b0:122:a2:ffcd with SMTP id
 a92af1059eb24-1276ad622d5mr2369787c88.23.1771863910794; 
 Mon, 23 Feb 2026 08:25:10 -0800 (PST)
Received: from [10.226.59.182] (i-global254.qualcomm.com. [199.106.103.254])
 by smtp.gmail.com with ESMTPSA id
 a92af1059eb24-1276af2edd7sm8614239c88.8.2026.02.23.08.25.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 23 Feb 2026 08:25:10 -0800 (PST)
Message-ID: <d69a2cc9-15fe-453f-b647-41c5ead7a1c7@oss.qualcomm.com>
Date: Mon, 23 Feb 2026 09:25:09 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 25/37] accel/qaic: Replace pci_alloc_irq_vectors() with
 pcim_alloc_irq_vectors()
To: Shawn Lin <shawn.lin@rock-chips.com>, Oded Gabbay <ogabbay@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Bjorn Helgaas <bhelgaas@google.com>,
 Philipp Stanner <phasta@kernel.org>, linux-pci@vger.kernel.org
References: <1771860581-82092-1-git-send-email-shawn.lin@rock-chips.com>
 <1771862143-89507-1-git-send-email-shawn.lin@rock-chips.com>
 <41d7d63f-bcda-4182-9340-54d480473586@oss.qualcomm.com>
 <6f0932f0-1e08-62a8-eb92-2380bb9f6928@rock-chips.com>
Content-Language: en-US
From: Jeff Hugo <jeff.hugo@oss.qualcomm.com>
In-Reply-To: <6f0932f0-1e08-62a8-eb92-2380bb9f6928@rock-chips.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjIzMDE0MSBTYWx0ZWRfX6ruD7EpLfpKH
 S8Qh0s/ZfWwshI7HDOOEnReGGqvjEs+1OAVaPdanBkBk54kL8xu1BQ30lHhCy3nVDFRxAUG1o+Y
 VaSBxyCws3MPY6AlGl8FtyjDINfjQjyg5BdEn9JGX2/d4BYEgG1gq3ygJZCKN2MEqnxaFonJJAs
 sOlyW/JqjLDdkwzhAoyXFiWQaoJf+s1+epYCU9WamwQKYIaOt1NpJpjpQEnamv92KBKEPxTla+j
 Mmr7SrGR605y8hojJiIZ2h6JpvGUyroV9VmHhOZyJMNTSLW0sn95NwAW4mZFGl+kAORn8Jsyp/S
 ygCkMRz+Oe0W0rJVZfBLtSDfPsLjplMA2Lu5MT8RtBOi2gbVB7NZBg+c13MRTJnMJ/h/M0Liwi4
 THrWBrh/3XsxGElxvUhB10BnNmcS/MXqI993VlaVDReLHOkunbhw7/2njOcjnDVLGM5P/inUKf4
 yOtsCJtZ8ZHBTCh6dVg==
X-Proofpoint-GUID: fSl9yWG2T7zhEElJWewQp1XKxHJawToz
X-Authority-Analysis: v=2.4 cv=Z5Lh3XRA c=1 sm=1 tr=0 ts=699c7f68 cx=c_pps
 a=SvEPeNj+VMjHSW//kvnxuw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=rUhstlRxwOIcCgk686EA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=Kq8ClHjjuc5pcCNDwlU0:22
X-Proofpoint-ORIG-GUID: fSl9yWG2T7zhEElJWewQp1XKxHJawToz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-23_03,2026-02-23_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 bulkscore=0 adultscore=0 impostorscore=0
 priorityscore=1501 phishscore=0 spamscore=0 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2602230141
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
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:shawn.lin@rock-chips.com,m:ogabbay@kernel.org,m:linux-arm-msm@vger.kernel.org,m:bhelgaas@google.com,m:phasta@kernel.org,m:linux-pci@vger.kernel.org,s:lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[jeff.hugo@oss.qualcomm.com,dri-devel-bounces@lists.freedesktop.org];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jeff.hugo@oss.qualcomm.com,dri-devel-bounces@lists.freedesktop.org];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	NEURAL_HAM(-0.00)[-0.999];
	RCPT_COUNT_SEVEN(0.00)[7];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:dkim]
X-Rspamd-Queue-Id: A5A4B179B00
X-Rspamd-Action: no action

On 2/23/2026 9:15 AM, Shawn Lin wrote:
> Hi Jeff
> 
> 在 2026/02/24 星期二 0:01, Jeff Hugo 写道:
>> On 2/23/2026 8:55 AM, Shawn Lin wrote:
>>> pcim_enable_device() no longer automatically manages IRQ vectors via 
>>> devres.
>>> Drivers must now manually call pci_free_irq_vectors() for cleanup. 
>>> Alternatively,
>>> pcim_alloc_irq_vectors() should be used.
>>
>> This seems to break bisect.  Surely you should update drivers before 
>> you go changing behavior.
> 
> Patch 1 introduces pcim_alloc_irq_vectors() and then convert all needed
> users to it. Then the final patch(37) remove the implict IRQ vector
> management in pci_alloc_irq_vectors(). So the individual patch for each
> driver should be safe IMO. And if these patches go via a single
> tree with acks, it seems unlikely to break bisect.

There is a conflict here between the patch description and what you have 
just described. It seems like the patch description is wrong.

The patch says that pcim_enable_device() has already changed behavior, 
and now drivers are broken and must update.

It seems that the description should be updated.

-Jeff
