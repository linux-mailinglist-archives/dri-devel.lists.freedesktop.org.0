Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wIArJX/CqmlXWQEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Fri, 06 Mar 2026 13:03:11 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EB4722005E
	for <lists+dri-devel@lfdr.de>; Fri, 06 Mar 2026 13:03:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0DE7E10ED2C;
	Fri,  6 Mar 2026 12:03:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="Ftqcklqz";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="FCtp+jpR";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A029310ED15
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Mar 2026 12:03:07 +0000 (UTC)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 626BahP51451394
 for <dri-devel@lists.freedesktop.org>; Fri, 6 Mar 2026 12:03:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:message-id
 :mime-version:subject:to; s=qcppdkim1; bh=1GiqlgsFE8CGKryXMNnXKy
 5aJvVVfqLeFztsWGF06E8=; b=FtqcklqzdG+X+PcXkmHygFC9TzkZHhQ9Pt19Su
 gXav84dk5ETapmSlrL96cZWEZ9rBX+8ZX8GmdlS9636TOjhJdK2Byf42pPpAMHAv
 +h+sIfvkIaiBjvlbs2ECOPLwoq6Fhny4/oDSQOhY1qY+8vCt35VJ9EsXddCrAAOY
 HQ97MXlYEVCGT/VXP0bqINkp3OHc9Tdb5iN/3A/fxJZWkVvi42wbztascXKxoS3u
 MrkjlbtnedNnR7M1RxSCxqzHdlMRycU+KH201TjJ3nXptK3a0LcEZNobZdEMNkLY
 odyLP3hcfVKSOvFiZs7hPBrGddVXwCBriNVm+yHDMVOdE8ng==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cqv9agffv-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Fri, 06 Mar 2026 12:03:06 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id
 af79cd13be357-8cb4817f3c8so4533945385a.3
 for <dri-devel@lists.freedesktop.org>; Fri, 06 Mar 2026 04:03:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1772798586; x=1773403386;
 darn=lists.freedesktop.org; 
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:from:to:cc:subject:date:message-id:reply-to;
 bh=1GiqlgsFE8CGKryXMNnXKy5aJvVVfqLeFztsWGF06E8=;
 b=FCtp+jpR66n8CACUG4jZOJnAGMGg/6QCz+JtkGTd8nDBSWDK8LBggtzx5mcUUacn7b
 uF+u3KwKUsdC8ViiVsmPLkQoTE+JFIqZ00td88OQ3yWyykc81P2buHHdrdwliAqLdztt
 RXCwrNSGpmU7Pbx4xXN7OXewTXCw/h3KVy/yPVwapin04CJMGCdDxiirCR/XbnBCRUZi
 Segqq62hBDmPnCj7NuxuD6rl0jpNwBhIlXVrevZp2SQjPczzbR7+MEkFnSjcW2bCCr8o
 qNGpzMMObHaX5D4rVOcfSocISC4bua1DT13TuYn26vm4H4vpVIB97C2bUXEakAWZb5KN
 ITDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772798586; x=1773403386;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=1GiqlgsFE8CGKryXMNnXKy5aJvVVfqLeFztsWGF06E8=;
 b=dMMpBPCaLoRNN846Rv6v/8wnZr3CdCNMvUbIwmz41rnvkdw5gEXpHK4BWOdc3tNAHY
 WoTfLI5BqK1LqtaoFoZl1lK+L1wWsjynhHD3uRKWkJJzdzjUHd8i92GE4rNuPdujpDN7
 YQlQiu6utch7aKBb6KBHVbZFmG+CZpoNuDKqERhBog7rl6TWLc8JxKwoHGFx9VyC7Z3t
 B8VAtap/GFsr96wglQ27fXbp3OkQtEETJ+PZwjQqrcDA/11l/I0j6e0ohf0eiNbF0VfB
 xpZ62zfvi5Wm4fHBSOLPd+FhdT7kbByRXkW1l+z/lheSJoOGrJTfwmH+puM3dCy+/cQp
 +JUg==
X-Gm-Message-State: AOJu0YyILqT0FjOJ85MBGTP2aWQWRleDlXujgBq58PfVx7dcGhv9ZyuQ
 RP2Gk5SyK4llJzq2duPX60xq4xNUY4aMuKQrR0c3hvfTc9eDglrSJrvAUYigOLVkS9DFykN9A+m
 OMpkCsh3SMP7P41rHVn07Zd3pie1Yaud0NXSe7IUDEK5jLtwz9VVbHdlfGxWPt7AlyfZnG+Y=
X-Gm-Gg: ATEYQzx2LGUfshrxcZdWeTp08Xq01RiQ16ij8nlx3Thy6a8259nzYbGzCQ8iIcYQtdO
 vvHnjFizWbVIA0jhB4fv6ZrV1XQDnofEIvBmAsdih/PMJ30c+X9fJd3U9Oz9rem7APREhTQjMPv
 QBd2HI79lF2P13VRU/IbMhiiIHW+Lp5PW/gnk3VipqsYercKPo0PSozYXeJX6ecIoV0w7HzfCku
 VpqjaMxzo38mvZnqeDbhEpZnEiBrjI8HCFfCm7JgPINfnI9X2C2IZx4uyw0L+H+S81XvpQ5KIn4
 +FbqX68JhigR05Q12ZAOfkQX6lbsxgUbwdXsMBHR0ioYLMdzQ7D/3SJaJ1Nm+fV2SpNbb7mji/x
 I0nUOu8hJEpvqDyj/zrHJqOLDvx0tifQNswJ1aEN6el6f
X-Received: by 2002:a05:620a:4149:b0:8cb:4c29:66b3 with SMTP id
 af79cd13be357-8cd6d325855mr217725585a.15.1772798586115; 
 Fri, 06 Mar 2026 04:03:06 -0800 (PST)
X-Received: by 2002:a05:620a:4149:b0:8cb:4c29:66b3 with SMTP id
 af79cd13be357-8cd6d325855mr217720985a.15.1772798585549; 
 Fri, 06 Mar 2026 04:03:05 -0800 (PST)
Received: from [127.0.1.1] ([178.197.219.94]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-439dad1cb7csm3410129f8f.0.2026.03.06.04.03.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 Mar 2026 04:03:04 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH 0/5] dt-bindings: display: panel: Few cleanups and fixes
Date: Fri, 06 Mar 2026 13:02:53 +0100
Message-Id: <20260306-dt-bindings-display-panel-clean-v1-0-3086eda1efaf@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAG3CqmkC/x3NQQrCMBBG4auUWTsQU6jFq4iL2PlbB8IYMiKV0
 rs3dPlt3tvIURVO926jip+6fqzheuloeidbwCrNFEMcQh8Gli+/1ERtcRb1ktOfSzJknjKScS8
 iI8J4wxypVUrFrOt5eDz3/QCX1fu2cQAAAA==
X-Change-ID: 20260306-dt-bindings-display-panel-clean-3ddd8e087ef2
To: Artur Weber <aweber.kernel@gmail.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <jesszhan0024@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Dzmitry Sankouski <dsankouski@gmail.com>,
 Tomi Valkeinen <tomi.valkeinen@ti.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Konrad Dybcio <konradybcio@kernel.org>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=3891;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=v5d+8TMs//diZzfnEWgGyhhdAKGNkQFzaTDjGWP7gr8=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpqsJv0GKN3ISA0GmNPQMccFSNZcG6op212Zbfd
 lm4FxQ0e8mJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaarCbwAKCRDBN2bmhouD
 1yM1EACBGR0+PA3/8X66dX5Lot1jR1nfgaoCSnR55X1oNKVXwq5vZkG8YoU6aO2WvrmEFkzV8pH
 nwLARLOlgkI2NhIHGZGnPBoJ1HBpqslQmcyo7rJE6vsclCWvqSY/2CiSePn17IQMnFP/r+OqHR9
 KCHziZoNTJd3+aq4kdYGdEyHav/455lm+eNXDOrPnKZI93w0U2mK5haSSKsJ4GgAiTqLIVLkiaL
 SOmBLdVVqe2NYbDH5KBH8yYq7xbQq2zRDmaddzvX0vY1K93ZqsI5SA+VWwqS1agSn1Tm/WvAgDQ
 lMDuERCmK9Dn2v4G+sFLWb6S1kwKRH5vRgoR3M2MMqp6WAxYRaixzYh6qoHluu4f5XC0s2U6mYY
 oBCY/cbXQFGotePWMY5Iv/cUVUBtH50jZuZnM8QjlkHbaR05UdwV2pbbmooX6wgG3GWYakTVqu9
 LCS+8DBVbnb83DXQNdFJpt50X0qKRUYQKL5oTFP5xCl9oNaZghn7Qd5oe2ea0dFNUPKNmFQAQmI
 iRFdvV8fuhakRXB8c0IK/h1DF3mf1E3mbGcpXMN41M3LN6oRUz+vtdOwtjJrreS4keIJ52xdAdK
 Jvq8jHm6TuJcsVGYkhpUkprRgj1cPBYhs5+unDYLHJ+iBhbVCZgT0DgBChb2QenGh4c9BvU0cbq
 EjTpUkaHkaodGrw==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-GUID: px11XIg9njPZRMcXBiAyuU4dhsZlcZMg
X-Proofpoint-ORIG-GUID: px11XIg9njPZRMcXBiAyuU4dhsZlcZMg
X-Authority-Analysis: v=2.4 cv=G4wR0tk5 c=1 sm=1 tr=0 ts=69aac27a cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=gOEeR9iKwsj33Yj5oN/cWg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=qVg1fvbrlvnUHraqLWwA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA2MDExNSBTYWx0ZWRfX+5fnoIM5ZWCD
 n7m+EkBzM35AHTrIH+CvN/ev1ep7YzBuLcbo5CCfYGsgJlIn15bLsJ1SKmevz/T1QzUYMhUquNe
 Rrd94yJwCioGJHrnkpUmJ1aamOfYlFYDfH0vIPGuqdXVtBupMW7RYB5ZQxzhJ9nIcXtYfuefO7i
 L9XMpOp2ASVM0yTJufzBQwmNyf7UXJpBkDO0f0KEizCOeNZ3qIFPBKuYerOUyOvgAsGjcgfgDIb
 q+CnDdBYoApVjEK5hWxwW/etYtrEjEOdA9eb31Y3BQgRdcn83aWdipYxR4REOX6d2v97MfxxS1b
 b8c0r79rlunM/h1aFfCCX08EUHM05EWYz8N3zgZ354703C+ZenHjhl9qBPuSbbQQA9jxQMeldto
 0oTwJQZzHcndo1CKM9RKe0ZuFcdX6L4kL1CGKRqT1T93ftbWd7FH+v4EdRfL83qBT/PzKo8pb0+
 vlzrB/sFKh0GbjhQ3Ew==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-06_04,2026-03-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 phishscore=0 bulkscore=0 impostorscore=0
 adultscore=0 malwarescore=0 lowpriorityscore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603060115
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
X-Rspamd-Queue-Id: 0EB4722005E
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.19 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:aweber.kernel@gmail.com,m:neil.armstrong@linaro.org,m:jesszhan0024@gmail.com,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:dsankouski@gmail.com,m:tomi.valkeinen@ti.com,m:laurent.pinchart@ideasonboard.com,m:konradybcio@kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-renesas-soc@vger.kernel.org,m:krzysztof.kozlowski@oss.qualcomm.com,m:aweberkernel@gmail.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[krzysztof.kozlowski@oss.qualcomm.com,dri-devel-bounces@lists.freedesktop.org];
	RCPT_COUNT_TWELVE(0.00)[20];
	FREEMAIL_TO(0.00)[gmail.com,linaro.org,linux.intel.com,kernel.org,suse.de,ffwll.ch,ti.com,ideasonboard.com];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	FROM_NEQ_ENVFROM(0.00)[krzysztof.kozlowski@oss.qualcomm.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[dri-devel,dt];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo]
X-Rspamd-Action: no action

I would expect this going via display, but that does not happen often,
so Rob's tree?

BR,
Krzysztof

---
Krzysztof Kozlowski (5):
      dt-bindings: display: samsung,s6d7aa0: Document port
      dt-bindings: display: innolux,p097pfg: Document ports
      dt-bindings: display: panel: Drop redundant properties
      dt-bindings: display: panel: Align style of additionalProperties
      dt-bindings: display: panel: Align style of "true" properties

 .../bindings/display/panel/abt,y030xx067a.yaml     |  5 -----
 .../display/panel/advantech,idk-1110wr.yaml        |  4 ++--
 .../display/panel/advantech,idk-2121wr.yaml        |  4 ++--
 .../display/panel/bananapi,s070wv20-ct16.yaml      |  4 ++--
 .../bindings/display/panel/dlc,dlc0700yzg-1.yaml   |  4 ++--
 .../display/panel/feiyang,fy07024di26a30d.yaml     |  1 -
 .../bindings/display/panel/himax,hx83112a.yaml     |  2 --
 .../bindings/display/panel/himax,hx8394.yaml       |  7 ++----
 .../bindings/display/panel/ilitek,ili9163.yaml     |  4 ----
 .../bindings/display/panel/ilitek,ili9322.yaml     |  3 ---
 .../bindings/display/panel/ilitek,ili9341.yaml     |  6 ++---
 .../bindings/display/panel/innolux,ej030na.yaml    |  5 -----
 .../bindings/display/panel/innolux,p097pfg.yaml    | 26 +++++++++++++++++++++-
 .../bindings/display/panel/jadard,jd9365da-h3.yaml |  2 --
 .../display/panel/kingdisplay,kd035g6-54nt.yaml    |  5 -----
 .../display/panel/leadtek,ltk050h3146w.yaml        |  1 +
 .../display/panel/leadtek,ltk500hd1829.yaml        |  1 +
 .../bindings/display/panel/lgphilips,lb035q02.yaml |  4 ----
 .../display/panel/mantix,mlaf057we51-x.yaml        |  5 ++---
 .../display/panel/mitsubishi,aa104xd12.yaml        |  4 ++--
 .../display/panel/mitsubishi,aa121td01.yaml        |  4 ++--
 .../bindings/display/panel/nec,nl8048hl11.yaml     |  4 ----
 .../bindings/display/panel/novatek,nt35510.yaml    |  3 ++-
 .../bindings/display/panel/novatek,nt36523.yaml    |  3 ---
 .../bindings/display/panel/novatek,nt36672a.yaml   |  3 ---
 .../bindings/display/panel/orisetech,otm8009a.yaml |  4 ++--
 .../bindings/display/panel/pda,91-00156-a0.yaml    |  4 ++--
 .../bindings/display/panel/raydium,rm68200.yaml    |  4 ++--
 .../bindings/display/panel/raydium,rm692e5.yaml    |  2 --
 .../bindings/display/panel/renesas,r61307.yaml     |  3 +--
 .../bindings/display/panel/renesas,r69328.yaml     |  1 -
 .../display/panel/rocktech,jh057n00900.yaml        |  5 ++---
 .../bindings/display/panel/samsung,atna33xc20.yaml |  4 ++--
 .../bindings/display/panel/samsung,ld9040.yaml     |  4 ----
 .../bindings/display/panel/samsung,lms380kf01.yaml |  6 -----
 .../bindings/display/panel/samsung,lms397kf04.yaml |  6 -----
 .../bindings/display/panel/samsung,s6d27a1.yaml    |  6 -----
 .../bindings/display/panel/samsung,s6d7aa0.yaml    |  8 +++++++
 .../bindings/display/panel/samsung,s6e3ha8.yaml    |  4 ----
 .../bindings/display/panel/samsung,s6e63m0.yaml    |  2 --
 .../bindings/display/panel/sgd,gktw70sdae4se.yaml  |  4 ++--
 .../bindings/display/panel/sitronix,st7701.yaml    |  6 -----
 .../bindings/display/panel/sitronix,st7789v.yaml   |  6 -----
 .../bindings/display/panel/sony,acx565akm.yaml     |  4 ----
 .../display/panel/sony,tulip-truly-nt35521.yaml    |  2 --
 .../display/panel/startek,kd070fhfid015.yaml       | 11 ++++-----
 .../devicetree/bindings/display/panel/tpo,td.yaml  |  5 -----
 .../bindings/display/panel/visionox,r66451.yaml    |  4 ++--
 .../bindings/display/panel/visionox,rm69299.yaml   |  4 ++--
 .../bindings/display/panel/visionox,vtdr6130.yaml  |  4 ++--
 50 files changed, 78 insertions(+), 149 deletions(-)
---
base-commit: c025f6cf4209e1542ec2afebe49f42bbaf1a5c7b
change-id: 20260306-dt-bindings-display-panel-clean-3ddd8e087ef2

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

