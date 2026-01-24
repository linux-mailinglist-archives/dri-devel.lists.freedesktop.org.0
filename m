Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MHzFGjUcdGn82AAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Sat, 24 Jan 2026 02:11:17 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 197467BE40
	for <lists+dri-devel@lfdr.de>; Sat, 24 Jan 2026 02:11:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2ED6710EC1B;
	Sat, 24 Jan 2026 01:11:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="PqFiAPPo";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="F5hOsuTP";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CB7E010EC1A
 for <dri-devel@lists.freedesktop.org>; Sat, 24 Jan 2026 01:11:13 +0000 (UTC)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 60O0KNNO3052634
 for <dri-devel@lists.freedesktop.org>; Sat, 24 Jan 2026 01:11:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:message-id:mime-version:reply-to
 :subject:to; s=qcppdkim1; bh=onPzwbwKPYyNqS7iOfuEHuvzbaXgGWEM63D
 QQGCqs9c=; b=PqFiAPPoZCCB8o2szsfzdXeBjbo09PybAb6dWk+TvJeCrOx3azf
 aCeR/E+AOYmIw/PUGA5emZ5NuDO44SmfznkgmFI9AmfY+U47dlQqb0RPCOGo+7SB
 BOyDHQWRnIlquyKvQjBSZEeBuO5OaLEMzm1HeT2wm4zDPWxEkxxjLKYFMY6pYgEO
 h4syc2XckCxuFmpc/KLC0O0HLHTYza/5ZRXOU9qN+86+3AM6Kld8LRP39Nwtz/Qq
 DJoDGTJhT6oLa46K86m+D+nrtB8v3+Rem/ojFkIa5isSCgO9OlkuQXdBwrc5b3R/
 b98yGTs9H+19Ynj2sqINIkZyClbV4qAQRfg==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com
 [74.125.82.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bvkeng2ws-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Sat, 24 Jan 2026 01:11:12 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id
 5a478bee46e88-2b75222e9easo375371eec.1
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Jan 2026 17:11:12 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769217072; cv=none;
 d=google.com; s=arc-20240605;
 b=S5+qTRuQbaJpRUG8OBdqlYOHzU9liRSZSPWM208wdPmlTkewQ7iSLZSecadhoxXju8
 XPuaPUFgRrmWInBDhEj8zEfgIPqqk1tyvb9EpMVN5JuffOORL651CqKEnFwshH+Rx7cI
 KPM2zogJaTbdlY7ydJnVzUrdsy3gP/wx3Jzjy5l16tFPK7l6uirH1LoVAOBWZB67XlVF
 koI5ViHkpkPEVFmxI31IzIJMirbR7KBci/4k6lIvcyWI8fPXByDVAa2Ue7DLZw7clS0x
 O2H7lu9CW0L+9NvumnPKtjog4LfLPMPWuwvJzhwtiayZoKP05KFFcWgORSVzWTtjHTN8
 ryiQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=cc:to:subject:message-id:date:from:reply-to:mime-version
 :dkim-signature;
 bh=onPzwbwKPYyNqS7iOfuEHuvzbaXgGWEM63DQQGCqs9c=;
 fh=jCQ3WxEPINqn3SFNdbn4RXlqIxfEPzGEZ4CCeZdj9zM=;
 b=IQiV4j6k344tpsh1dO3khoqas6mqLsEWydZO/zP0kxRlPjzOW6g57oL4lDfja/1Rmg
 AF/F31UhKDaBznJio880F/iwEs6a1vdzaoxY5wn0S+PoHBTTm0ZUED9T4U12Km49S2nO
 fLDfadBAUUI3noQJ7CLgNGewBim0SSphAMPDV1O0/XXHyhup9LnwRLoAPwwbVAMq75bY
 5he0P4H/AMAearDBCUKGgOGlrR+8xGV3GGbgaZt/7TNY3z43p1TENr0GqubFTF1IXUH2
 9BO/GMcS7o+J29uI54p8BfQOGdGUGe9qEuiu2KPCb3N/hRnlJ8s/gV05KbUdhBivMIuo
 qG+g==; darn=lists.freedesktop.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1769217072; x=1769821872;
 darn=lists.freedesktop.org; 
 h=cc:to:subject:message-id:date:from:reply-to:mime-version:from:to:cc
 :subject:date:message-id:reply-to;
 bh=onPzwbwKPYyNqS7iOfuEHuvzbaXgGWEM63DQQGCqs9c=;
 b=F5hOsuTPaNfVE19wqR5mUTrulJVK760aRIAIJw8zkpi2hrrOU8g5ZTxyQUspGSU/O9
 3NuXYlyK3szyj5OvIWoitOE+b9PW59dc9Cb3iUInPm71vO/NLjbIUNdnkNdJOFwXYWmV
 oR65lwB4Vj/h9Oy8rzhBCoQOjdccLBEhbbqzOdpwpObcF84rImHUQYLGDL+fS2V+QU5w
 ohGD5XZumzHuh3eV1IvRUTI5DE8ekr7DmlOsw2PICzlbNLfxBJAyNqaOXQqIkBB/ZLUN
 af6sdsTvLcmbl8shRJEWwWCnQVGT1DirIWLZq4/CCn9B91aA88+dPHN02VJ2EVpGW8+m
 yh2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1769217072; x=1769821872;
 h=cc:to:subject:message-id:date:from:reply-to:mime-version:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=onPzwbwKPYyNqS7iOfuEHuvzbaXgGWEM63DQQGCqs9c=;
 b=kWLOfQjmbK7vzmfbRNi2AFsJI9JZiLqnKcC7ZWA1JoyloK4imD1sjhD9OahTfMFuN/
 EWMo5UpDGwoQNgmuAtnC2bitWRjRkwONICv+spRwzh+NJCeNpT7FbOCgZzeHnVki4Apk
 MY1URsuzsvXla9uA2fasl9p+TZ8C5LZAg0JhM2sjeGHEqehLlb2nFgJhFkH4rDQfWNMx
 aUEAWlQpsgOq4rpV91iVGT54S8D2CQq3cTyplSyfxkFezS/GNjYxDCX/0pCdR+CNQYJ4
 lPLPtXmu3GpP74wCKkjCnrl0W4fuf5g4E6XC7grgWBuvyGp5jn65d7NdN1QZED9qsAaC
 xWbQ==
X-Gm-Message-State: AOJu0YyBH84Hw20JkYMnJM1DSj73S93HcvSRzoxof0t6rJmgswpVAO4Y
 SwsLgJeIVymJvW4uFHmbQjx5mn7LNjPEWMTdxxwr0PauONuxDNPQ4PDU95jkXZm1c6OC6Jofk+G
 JcgeAmHGycAJ6lJFKG3NfcQEmxHiRB88Ix4BtbjCkzKwCJG6BHJ9KatJ3xWzo+zbT029RTgxuOU
 8q27/KjePa0bfnUxKhTYK+IsgTLGxhgloZjI7ZgWZcIVl66w==
X-Gm-Gg: AZuq6aL/X0IwRqzh7xz9Tl1GgKdjNBpxjZ5Azy29rLuAKiQgEf0VVLAOYfVhDtPNTh9
 4LoPZDXrj5XKphatqTMkH5B4BLNRBGrr8GYXEZG94hdlT8j7zSg2fqkFlAqN8RQHqago5g9UXIS
 9utCfxLi3HsZ93xI86Ckqqhu+0YT3/xn8mldNp4xkwN9MXmTKZVArQ+cyZp+pkH+PrMxVXjPHEu
 Q1D0GRECfxb1KI48KFzSWxexg==
X-Received: by 2002:a05:7022:112:b0:11b:7f9a:9f00 with SMTP id
 a92af1059eb24-1247dbaf59amr2586257c88.4.1769217071826; 
 Fri, 23 Jan 2026 17:11:11 -0800 (PST)
X-Received: by 2002:a05:7022:112:b0:11b:7f9a:9f00 with SMTP id
 a92af1059eb24-1247dbaf59amr2586243c88.4.1769217071308; Fri, 23 Jan 2026
 17:11:11 -0800 (PST)
MIME-Version: 1.0
From: Rob Clark <rob.clark@oss.qualcomm.com>
Date: Fri, 23 Jan 2026 17:10:59 -0800
X-Gm-Features: AZwV_QiAi8xrARX87HtwGvXJ3KtnTfbMYZbjGy5OdRX7_e-hsYCRCJbIWRy83PA
Message-ID: <CACSVV03A-GE5mNG1OLF3s9UCenQk4x3jO71Hmvr9j+vCF2hc7g@mail.gmail.com>
Subject: [pull] drm/msm: drm-msm-fixes-2026-01-23 for v6.19-rc7
To: David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: "open list:DRM DRIVER for Qualcomm Adreno GPUs"
 <dri-devel@lists.freedesktop.org>, 
 "open list:DRM DRIVER for Qualcomm Adreno GPUs"
 <freedreno@lists.freedesktop.org>, 
 "open list:DRM DRIVER for Qualcomm Adreno GPUs"
 <linux-arm-msm@vger.kernel.org>, Dmitry Baryshkov <lumag@kernel.org>,
 Akhil P Oommen <akhilpo@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
X-Authority-Analysis: v=2.4 cv=S+zUAYsP c=1 sm=1 tr=0 ts=69741c30 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=e5mUnYsNAAAA:8
 a=5xzA7AtM9dvb3DZk53oA:9 a=QEXdDO2ut3YA:10 a=6Ab_bkdmUrQuMsNx7PHu:22
 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-GUID: epSvXmweTLGnIzRxVnmq5C0m-mPWP1SH
X-Proofpoint-ORIG-GUID: epSvXmweTLGnIzRxVnmq5C0m-mPWP1SH
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTI0MDAwNyBTYWx0ZWRfX7JS2CuHcqZIM
 ANAVfYl7m98+Zqk6+ekIg8rLmoGWz/vv8I2JnQN8FQpdCJwsKkBlUv9QT7JdXUcAimIW7DViTSu
 xCad4foTau+tYkBfvwtyVamVrYdJlrmX3gqvFeB+EAgnz8xyxHM6Yn8f3g4EtDRWme5l7i1uMrI
 kCBc1PR0IM2dtejSFIgAv04/55EI4ECgh9IB8uVIe7zfw35Lirk56+g9yzk812DBa3234EQcQ7s
 1oTxUnLTf/x0262aXcgh5SZOzPVlVhnAZPanJKzwimRlJnz6RdegKueFXqBnglaQNPvMrsQRxsr
 y2RoBvvsQmzgQt5CgdrW3GAlzTRhLxrGA2MQtoOYMfNCGQdhsNqxykDTc59M4Yo1+r8ZA8PQZAn
 oxaqc6Zy85aHdH7AewWHrtz50F62kLfIUzdqkUvafV4Uz7bZ3vwMJvZhAlzZ//fJ1myhivLwZy+
 dq077h1CDt6nqxu45Pw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-23_04,2026-01-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 priorityscore=1501 bulkscore=0 clxscore=1015
 phishscore=0 lowpriorityscore=0 suspectscore=0 spamscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601240007
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
Reply-To: rob.clark@oss.qualcomm.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.31 / 15.00];
	ARC_ALLOW(-1.00)[google.com:s=arc-20240605:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_ALL(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:airlied@gmail.com,m:simona@ffwll.ch,m:freedreno@lists.freedesktop.org,m:linux-arm-msm@vger.kernel.org,m:lumag@kernel.org,m:akhilpo@oss.qualcomm.com,s:lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com,ffwll.ch];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER(0.00)[rob.clark@oss.qualcomm.com,dri-devel-bounces@lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	MISSING_XM_UA(0.00)[];
	HAS_REPLYTO(0.00)[rob.clark@oss.qualcomm.com];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	REPLYTO_ADDR_EQ_FROM(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[rob.clark@oss.qualcomm.com,dri-devel-bounces@lists.freedesktop.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[dri-devel];
	RCPT_COUNT_SEVEN(0.00)[7];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gitlab.freedesktop.org:url,mail.gmail.com:mid,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,qualcomm.com:dkim,oss.qualcomm.com:replyto,oss.qualcomm.com:dkim]
X-Rspamd-Queue-Id: 197467BE40
X-Rspamd-Action: no action

Hi Dave, Simona,

A late fix for v6.19-rc7.  Fixes a crash on A690.

The following changes since commit 66691e272e40c91305f1704695e0cb340cd162ff:

  drm/msm: Replace unsafe snprintf usage with scnprintf (2025-12-24
17:55:29 +0200)

are available in the Git repository at:

  https://gitlab.freedesktop.org/drm/msm.git tags/drm-msm-fixes-2026-01-23

for you to fetch changes up to dedb897f11c5d7e32c0e0a0eff7cec23a8047167:

  drm/msm/a6xx: fix bogus hwcg register updates (2026-01-23 16:51:44 -0800)

----------------------------------------------------------------
Late fix for v6.19:

GPU:
- Fix bogus hwcg register update for a690

----------------------------------------------------------------
Johan Hovold (1):
      drm/msm/a6xx: fix bogus hwcg register updates

 drivers/gpu/drm/msm/adreno/a6xx_catalog.c | 2 --
 1 file changed, 2 deletions(-)
