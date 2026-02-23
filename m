Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EAWODPh5nGlfIAQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Mon, 23 Feb 2026 17:02:00 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BFDC179437
	for <lists+dri-devel@lfdr.de>; Mon, 23 Feb 2026 17:01:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 748B910E3AF;
	Mon, 23 Feb 2026 16:01:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="SU0HyF/I";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="OufHQ3st";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B3F6110E3AF
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Feb 2026 16:01:46 +0000 (UTC)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 61NAWIsV3733250
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Feb 2026 16:01:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 vB57/lyfKRXlbv2ojASFy7z0cDL7Clc/mnkKCE2srms=; b=SU0HyF/Iha5/1/uV
 QT0RPU4GePtTQFeUAXyZKosiNPGlzWEpjMQUrncfxIDT4bh7rMJqdupNxb1KvxNS
 TmdzhCE26CUMgeKc/oHZsIsZp8Po33YnLkuV2ewNnzVBTCJ5hePVM+UvzKlNq9ol
 4cXzS8DNebdcrTVthkKfBRmNuyYa/GRsE+g93LcGsYJE1E5+CkbShwC5M5+taHnr
 RKWkzTkNMnzMj7xHTvM+yRFfwibPPKIadzuKLSQrT1zTDDvbjbiuI3hOR8QSXADk
 BTj3qiSuUArbAkZ6Dhjn6niMGn3IGOzq5mJdLT2hw1pahRe0z/PUDIPOMa5dxSyC
 YGji1Q==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com
 [74.125.82.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cgn7t9004-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Feb 2026 16:01:45 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id
 5a478bee46e88-2ba8013a9e3so4957111eec.0
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Feb 2026 08:01:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1771862505; x=1772467305;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=vB57/lyfKRXlbv2ojASFy7z0cDL7Clc/mnkKCE2srms=;
 b=OufHQ3stySRnwCxRIHxWcvEtKLfqZrjrsy/ciG2lxqu1hf0CJE2ye0toQ3Ra2iAIS+
 yQYGEDZSZQQv+oBozVkK1sOOdqIRXMd/AqMljiYA5uaPotaFfVrXDYcuefrfblM0mc9Q
 +6zERQ+HO9bB/tu5S+0Ib9mAqm7LXmdxLbnJ3NDeQ6d5vdUnM16nOo2ybMWY9cD/7NjU
 ixrgfH6Xl/mjOIXNwCXtxfYi70V7sZTn8HeuL9c9NDec/f/xv7egnD7b56WvQnbQivIl
 tUoqGGgjhCdYoCWxXH1k5Z0VYEDqpxuhg0taEgqLWfH3D6OjStOfXOw7wSNDgOUDov8G
 S7vA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1771862505; x=1772467305;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=vB57/lyfKRXlbv2ojASFy7z0cDL7Clc/mnkKCE2srms=;
 b=csZogN2oFC/RCJEKNYaqP3guiAdAT+4AqzI/Tki41PU2rOxBJTYAZ1e25ccE7uTyAa
 n1vo4XmSubj5H67swnpRSmLXV3cJS7xFhpRR66ci1vJmw98/k3rEe0R7dOXqrIFQKS3e
 Omm80/pfBtlMejin8vZY7uEJe/mcq4rpBBygYXc87+pldRHW67DIvCnweV654aLVoBAb
 e7pbkyEBaW4Y3Ol4jvCWzCzVdZtCUXllzzMxqKZenjY3ViEzetfSv14nJRUUdT0j+l9d
 4h87cx1x51zUcmk4MknVcOCVTPcI9zIl5tSJTvAg+bBVUtzQJOop3GXoFXhiOMAfmRwZ
 6T6A==
X-Forwarded-Encrypted: i=1;
 AJvYcCVKNMkzYwWbF2xQwsJ869LI6W3wBip/WF3B9xnoL5g/CfYRvJaOuSagHRopjavjK3D9rBwBsDrxKLs=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxKtlCDVjXd3Q566kAKfKTAZlryzeYGt8MqPe3CvBL8Bk7oYtFF
 V6ShGZzx2MN42CxMVlk1b7b0M+aLDBd8dt77M2QKGP5QPX7ZpGA9iK0GhGfw1ldjBBGBQOfyRsE
 QrmkvdmLIouZ2DprsIe7fmanx+UwGPjsLe/K0tLnrxOqCFtwPVExQJBdfrdTzGrdMxjkOYCM=
X-Gm-Gg: ATEYQzw1CiCqf286kQl/ZQlf8EnVrUNByvNnRFoRPwsGlZYOz8L4kzEPOd+qNxZoONc
 tRdHLoLAW017iwAQTLfJv2AEO/Wvrdi4AHPN/H9qzAvFUOvSo0Ze+2AL8i3sDEja1IXVblQXth/
 Z3f6Z4aCSvApWuAJIDB8ErMeZAorYCfQ0sDocjCm01lot78+ubLs7612D+ZoVohaf5eukJjJHxs
 X1RzOZusEfXt8+jCyeBNJn0lHaaBltkfcaGT5Htcms6ht9c/eLJw1yA1OtUiT59IBXbyp6KHwwO
 7TkAAMzzyNA/Ln/nrMHiwcXMKCqWhfJAxIZ5Rfpq+DgS1FYqyD/DNzU03mFYDX2W0d2TDYhUO9T
 QaAgTwXUD0GjeCt2wlGabw26bSWT5KZIIXakNpkpoHj1FPZTMWFky6fGJHgUkpu47/blzS8itSl
 4=
X-Received: by 2002:a05:7300:8cab:b0:2ba:a075:5422 with SMTP id
 5a478bee46e88-2bd7bd33409mr3422959eec.34.1771862504295; 
 Mon, 23 Feb 2026 08:01:44 -0800 (PST)
X-Received: by 2002:a05:7300:8cab:b0:2ba:a075:5422 with SMTP id
 5a478bee46e88-2bd7bd33409mr3422925eec.34.1771862503206; 
 Mon, 23 Feb 2026 08:01:43 -0800 (PST)
Received: from [10.226.59.182] (i-global254.qualcomm.com. [199.106.103.254])
 by smtp.gmail.com with ESMTPSA id
 5a478bee46e88-2bd7daa37e9sm4957889eec.11.2026.02.23.08.01.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 23 Feb 2026 08:01:42 -0800 (PST)
Message-ID: <41d7d63f-bcda-4182-9340-54d480473586@oss.qualcomm.com>
Date: Mon, 23 Feb 2026 09:01:41 -0700
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
Content-Language: en-US
From: Jeff Hugo <jeff.hugo@oss.qualcomm.com>
In-Reply-To: <1771862143-89507-1-git-send-email-shawn.lin@rock-chips.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=c5OmgB9l c=1 sm=1 tr=0 ts=699c79e9 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=S6WfLNs1AR-HUFovPioA:9 a=QEXdDO2ut3YA:10 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-GUID: DYryFgY_aOCGIo7H6TAVPp9JTryrXKbh
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjIzMDEzNyBTYWx0ZWRfX1A/cfc/2Z6Z0
 D96hY6sBBEsWeXsjoKiACIrH7uLfGbzpYylty2Qv+qQrf51vVDt4lN3xanKZZWVEzQzk8yxWySS
 JJVOBfmDopMiVSYWU+QBZvcJyIzxYGnmXzeKYd8bqnYMYSevw6KsSnrXMoJjdest7WCk9CmAI1u
 Yz1ewcagRaxD2qSpyv5L6PyzFMlxbfDROrbC2YdnKwNygPBJS3GrpvCsZmFXDCZkGoGjUgoMMty
 KuGTtrRppXEdyml2oA/h+aFiLYmRUFvsMLa0l5ZGZLxgQyVam9L8I9MZdPj3MzX5dlnK4NpBIyC
 3Ok0VStLTTZ57R+1BhGwUVdM1a2VBx5zViIs1P3+do9W2436CQXUS+k2ryjMQQCWH6m8CwF7NfZ
 1Nq//qkYX12fU6g7cNRHB06B2Gam9WgOnxt64NHWNYvisymAeqtFnt+Pobabe4fkQEy414HvdAo
 JhCGd497SYd9VOGbKmg==
X-Proofpoint-ORIG-GUID: DYryFgY_aOCGIo7H6TAVPp9JTryrXKbh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-23_03,2026-02-23_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 malwarescore=0 lowpriorityscore=0 adultscore=0
 clxscore=1015 bulkscore=0 spamscore=0 suspectscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2602230137
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
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:shawn.lin@rock-chips.com,m:ogabbay@kernel.org,m:linux-arm-msm@vger.kernel.org,m:bhelgaas@google.com,m:phasta@kernel.org,m:linux-pci@vger.kernel.org,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RSPAMD_URIBL_FAIL(0.00)[oss.qualcomm.com:query timed out];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[jeff.hugo@oss.qualcomm.com,dri-devel-bounces@lists.freedesktop.org];
	ASN_FAIL(0.00)[177.210.252.131.asn.rspamd.com:query timed out];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	FROM_NEQ_ENVFROM(0.00)[jeff.hugo@oss.qualcomm.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	NEURAL_HAM(-0.00)[-0.999];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,qualcomm.com:dkim]
X-Rspamd-Queue-Id: 7BFDC179437
X-Rspamd-Action: no action

On 2/23/2026 8:55 AM, Shawn Lin wrote:
> pcim_enable_device() no longer automatically manages IRQ vectors via devres.
> Drivers must now manually call pci_free_irq_vectors() for cleanup. Alternatively,
> pcim_alloc_irq_vectors() should be used.

This seems to break bisect.  Surely you should update drivers before you 
go changing behavior.

-Jeff
