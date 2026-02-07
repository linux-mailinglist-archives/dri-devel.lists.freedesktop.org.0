Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MLIhH7wWh2nBTQQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Sat, 07 Feb 2026 11:41:00 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BFC5310593D
	for <lists+dri-devel@lfdr.de>; Sat, 07 Feb 2026 11:40:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 83D4A10E0FA;
	Sat,  7 Feb 2026 10:40:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="GYrtw/AE";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="RBZXRmsq";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 98CCF10E0FA
 for <dri-devel@lists.freedesktop.org>; Sat,  7 Feb 2026 10:40:55 +0000 (UTC)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 6174NlbY410890
 for <dri-devel@lists.freedesktop.org>; Sat, 7 Feb 2026 10:40:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 mCw7wSL4eGHs+p13won9KVzKu1j034CJcclFyyJMlEs=; b=GYrtw/AEZqpHs3Vf
 C0yazVgvvhdM4ledK+f2K1QS3Mzh1vJq+Vgc/CySD6Ja3Zqe1doQUwncaXjxduKk
 NB3Vl7+UlP26dFgfuvUuzzMez9vrNchFzHF4/x3b+YxLrysEvHGI9d/IXvTQ5eKx
 7itDffzklrsDoLFcekTQs+KmMKfj9Or3DSkI9OraBnVL6CwNlx+ERqjzujNI4YGD
 DwtI3f8cwCv6aRJajkXDGMd+kbvQ3V9rLWdbxR2+GhkKmD+ZmP6dcoFhhWAvpdTW
 Ri+9S7eb8yTXI6QwEynS8eZ2BNyZG9NTz9qOqp3jKYwfE1kAh2Wk4Zwwt9iFs/KF
 DzXd8A==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c5xb4rhy5-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Sat, 07 Feb 2026 10:40:54 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id
 af79cd13be357-8c70a62ca32so868170585a.2
 for <dri-devel@lists.freedesktop.org>; Sat, 07 Feb 2026 02:40:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1770460854; x=1771065654;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=mCw7wSL4eGHs+p13won9KVzKu1j034CJcclFyyJMlEs=;
 b=RBZXRmsqhNATRtx293irTNkxzqo6QVWY9CTCDEBUeyG3BJAGMdCCVL6Koq1MK7SeBW
 cJNoHDAnjCgThF6Ip5bYQczYLoL+g2NvEYROOfvb+3DBoqS3fzvljH92Sv87LE6nnthh
 SKcgB6FkIxrABiJR0tmqaZ0qYZiFrzUQQHZWKR2vH4G2ASSSc6qezLYSY4rhvBWeqxdc
 yA9sMJ/pToXWdmAXI3icS2jIc7WQOgdHGSXhydlMcJhH1HN5XFhM6jeIymKxZOgxRyLX
 T7TJ83fQRDINVx3db3o40BBh2sVeABdGUXnmMTHK5q/Le8Qzme7GT2DO+82gGt9W5/tA
 yMlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1770460854; x=1771065654;
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=mCw7wSL4eGHs+p13won9KVzKu1j034CJcclFyyJMlEs=;
 b=Ne+ipnxMLAMUGmS3fAAzKXQFQUxn946DwPuVleqGJg8Kfjj4XUvM6DLrDDA1L4HlXH
 aOedRP27cmS5TyqKqV76I+3ZRf4NU+tl3hrJ4sfAYz/HRuSXJlpWv89sczLcMMsewAwD
 PFUY/VG11BJBG+79iD+pH4Qo7MUUAnz5z7nFhA3dKPYwRaI4WRV2kLLLZgxsUSCk5BvH
 jDdA6QCjDSYNGqIed6W5tb0PfmiHaPsFeDaCnyY5+GxU9JRkaes0RS9EL0ZKzNBmaEpE
 8/Ry9X/SrqGHUyaQc+9RZQs2rPLKaCWxtJFpOjMlQrxe/teLZficFzJlsOE/xiE2RV6Q
 DKWA==
X-Gm-Message-State: AOJu0YymOPigXLD3t2tJ57YudfKfnw3KepPmXrT3CrtXmvGjRoWangV6
 mh3pktI5X6TA6f5Bnn17kv/4RiSjj3Fx/3xt2HyVOK7ZLfQZrYJT8J0pgGDtq7aUfx2/iRRbQ7y
 C14qrDJzadVV1+VBrlTLhDW7h/6cH0EE13qceorcxuMmHbqCl4o1vGIq/mctfksx1YdOe01g=
X-Gm-Gg: AZuq6aLtBovREWhIVaA5RI/MGshgu006HY42G2ZS8aJuSxBvQL63vESIY/DtyF2mxsH
 x7mCaKxf4nFtGtvjCnfUhlRSR6U1IQu9Sc4n2aS+If0daFel107CR006o/H1gNBuDUOXSadQFxn
 979ePl+9ihddFZKv8489s6UECsDM9J+V5a57pCPtehUKVMdmKAAaeurrtPANHNTCCxOAnUiXpN6
 D60Oi7Reyr7OvvQDgkjS94xVi0MldWybFFQwotFPPYE3LzLVL0G6B7T2l8ooTrhnm/IWLx9T2+d
 qqR2j0UUzTuu0fIfgzAHpun5CP9rq68GG12ucGWlDHgX/4aXqf/+Q4LKR6jIG5bmhwBTp9KUx1q
 YQO9Ogc4jhGf+wp4qMRusxxr6OmUr3I8bsCdyq03VXoFYsRbmEMhdT0eeq5nrjgOOi6eUkbon5J
 fVjMX6RCJJXYhrKoeWt8HIzqA=
X-Received: by 2002:a05:620a:700d:b0:8be:6733:92ab with SMTP id
 af79cd13be357-8caec1bf257mr730168185a.0.1770460853725; 
 Sat, 07 Feb 2026 02:40:53 -0800 (PST)
X-Received: by 2002:a05:620a:700d:b0:8be:6733:92ab with SMTP id
 af79cd13be357-8caec1bf257mr730164685a.0.1770460853192; 
 Sat, 07 Feb 2026 02:40:53 -0800 (PST)
Received: from umbar.lan
 (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-59e44cf6feasm1244990e87.7.2026.02.07.02.40.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 07 Feb 2026 02:40:51 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Xin Ji <xji@analogixsemi.com>,
 Heikki Krogerus <heikki.krogerus@linux.intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-usb@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org
In-Reply-To: <20260121-anx7625-typec-v2-0-d14f31256a17@oss.qualcomm.com>
References: <20260121-anx7625-typec-v2-0-d14f31256a17@oss.qualcomm.com>
Subject: Re: [PATCH v2 0/3] drm: bridge: anx7625: implement Type-C support
Message-Id: <177046084993.2611002.7265880027469077346.b4-ty@oss.qualcomm.com>
Date: Sat, 07 Feb 2026 12:40:49 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3
X-Proofpoint-GUID: axGy_Gvavec2cxuCN68kYZjlfsOxvsti
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjA3MDA4NCBTYWx0ZWRfXyNVKZq4pGbQh
 iqzlqFTgngKhwlyFu+LjrXsgF+XeX7aLXhulk73ZCLtA8VtQFyFiH7quPtYnl639XfBKl/1sldT
 ymoi5K5PzGQpXds7DXJ2rSuthU6xAB8t5OhkzayEcaNu6BCVEJWKmb9ypaq3nep1ZkEilGJ1+Vp
 onP5LkMT/YEtrXpeFTeAYpGn6YPtjyVZoRltDpTe1WcB+bRKwVgH3n2QtJCz4uAF3PX9ApJ8mxZ
 vxickTOamyMduqi1VJusKYKBTgGpfj//tr3AGNfd2KFrLLYTVTRLDoywgEElB/OZ8yzmBeYTwiu
 lpQR4Q8Wwlq0+0WtQDBDHTU4PoakggNlhjOHpuUMxI5FPuBtYV39je5lPWhxXLNHuXJnU7DVk6A
 6AoH+cqrMaUneJEbRNZt2vX/qbUuWb0iRKG5poUD1Zgtl5JtfVB8sALp4YV+/9lsy5jqt0R71j5
 2rmSMWBmUaTQPwXaT2g==
X-Authority-Analysis: v=2.4 cv=PYLyRyhd c=1 sm=1 tr=0 ts=698716b6 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22 a=_bsLKE6ODhMN5xNVZ6sA:9
 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-ORIG-GUID: axGy_Gvavec2cxuCN68kYZjlfsOxvsti
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-06_05,2026-02-05_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 phishscore=0 malwarescore=0 priorityscore=1501
 suspectscore=0 bulkscore=0 impostorscore=0 spamscore=0 clxscore=1015
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2602070084
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
X-Spamd-Result: default: False [0.19 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andrzej.hajda@intel.com,m:neil.armstrong@linaro.org,m:rfoss@kernel.org,m:Laurent.pinchart@ideasonboard.com,m:jonas@kwiboo.se,m:jernej.skrabec@gmail.com,m:airlied@gmail.com,m:simona@ffwll.ch,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:xji@analogixsemi.com,m:heikki.krogerus@linux.intel.com,m:gregkh@linuxfoundation.org,m:dmitry.baryshkov@oss.qualcomm.com,m:devicetree@vger.kernel.org,m:linux-usb@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:jernejskrabec@gmail.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[intel.com,linaro.org,kernel.org,ideasonboard.com,kwiboo.se,gmail.com,ffwll.ch,linux.intel.com,suse.de,analogixsemi.com,linuxfoundation.org,oss.qualcomm.com];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER(0.00)[dmitry.baryshkov@oss.qualcomm.com,dri-devel-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	RCPT_COUNT_TWELVE(0.00)[23];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	NEURAL_HAM(-0.00)[-0.967];
	TAGGED_RCPT(0.00)[dri-devel,dt];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: BFC5310593D
X-Rspamd-Action: no action

On Wed, 21 Jan 2026 12:15:44 +0200, Dmitry Baryshkov wrote:
> ANX7625 can be used to mux converted video stream with the USB signals
> on a Type-C connector. Provide minimal Type-C support necessary for
> ANX7625 to register the Type-C port device and properly respond to data
> / power role events from the Type-C partner.
> 
> Notes:
> - I'm not 100% happy having Type-C code in the DRM subtree. Should I use
>   AUX device and to move Type-C-related code to drivers/usb/typec?
> 
> [...]

Applied to drm-misc-next, thanks!

[1/3] dt-bindings: drm/bridge: anx7625: describe Type-C connector
      commit: 1d7532444a32b53ff7344dc52019bab5a4b5ed66
[2/3] drm: bridge: anx7625: implement minimal Type-C support
      commit: f81455b2d3327a5685623e7db4050dbbe5513bc3
[3/3] drm: bridge: anx7625: implement message sending
      commit: 8ad0f7d2e6fdfc4462a5b168ec64d73b7e952ab9

Best regards,
-- 
With best wishes
Dmitry


