Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QFQ0I+EvgGk94AIAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Mon, 02 Feb 2026 06:02:25 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D73D6C83FC
	for <lists+dri-devel@lfdr.de>; Mon, 02 Feb 2026 06:02:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9C8C810E00A;
	Mon,  2 Feb 2026 05:02:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="OaHlfMmg";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="AylLybaC";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 08E0B10E00A
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Feb 2026 05:02:20 +0000 (UTC)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 611MRKRN2650800
 for <dri-devel@lists.freedesktop.org>; Mon, 2 Feb 2026 05:02:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:message-id
 :mime-version:subject:to; s=qcppdkim1; bh=YXNUu3DUU1gaG9IkgktmJs
 5uf0EZrLPdEv1g9uEpfZs=; b=OaHlfMmgnmq14Bib10T4z0MFUa4AqS8CEYAYr0
 1pU+yxOpKxo5dApIxmiALLr+4/biZ7A+gwl1ghlg/v1COf4dAyES18KZoZOvZnnS
 biGllqmR/rZSto8wLKo+K4NdtIYeq+hXrj+7UNPME2rt1Kvfj0/uhR8ziFKGe0Dc
 82IFieil1UNVYvgCMAgtcb6JaDrkMjsTxBitgVQbj1EfQgkNXiaxeoUTo4UcgdHw
 Qvk81OWWBcwWqu11VR5WLIzxwOtPI5zJT7t9p1/YSel89wYsL/ikVywA5UNFWXZ7
 AIGoBFpPSNMCTLB7vhnI7TA+ZOpV0AggIb8aWfLb1WSsF9vw==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com
 [209.85.214.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c1awdbyhj-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Mon, 02 Feb 2026 05:02:20 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id
 d9443c01a7336-2a90510a6d1so8192325ad.0
 for <dri-devel@lists.freedesktop.org>; Sun, 01 Feb 2026 21:02:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1770008540; x=1770613340;
 darn=lists.freedesktop.org; 
 h=cc:to:message-id:content-transfer-encoding:mime-version:subject
 :date:from:from:to:cc:subject:date:message-id:reply-to;
 bh=YXNUu3DUU1gaG9IkgktmJs5uf0EZrLPdEv1g9uEpfZs=;
 b=AylLybaCpQxynUnjxNof+4rZVQ17ofqf5//aHKPsB43ESXHC0GTLw3SYzsMK5NgOV9
 rO2ILc1R+8+vUQPbsUHerIpNPPMHBb+V2Xl6Iauczam/PIjoLJvTL/cIkMCT5t52gkZu
 LLppc7kxC0ohh3XdPRP9BtGxC01GcfEuCkFrHF9/RqzlZKZkNNbj1c/m6vZ4ReVy1h6c
 DWSgF9yJKgUSrmkKgTRco49UJ23ELtM2rnlPxH8OirbP3tkJwU2Ew/FH/N/vnNr9a26e
 ySTbg/UwvL7PeY+DC5OuMAQVTsD5+1oQLbbzxz8PK5DA5ulhGeOj+tyhO+FsQx2q9cEn
 0rlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1770008540; x=1770613340;
 h=cc:to:message-id:content-transfer-encoding:mime-version:subject
 :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=YXNUu3DUU1gaG9IkgktmJs5uf0EZrLPdEv1g9uEpfZs=;
 b=GSVlXiVu3otJTtGMa80VszD4SrOR7yYCsX+GsNcvZNsXHRIayYBOP86PJRUccaS9OP
 MUnfePbiRR7WAGu5g3gmYqD6csme2bDVwmuoofzPkaudt/B8FSEIP+fmnEnPLo2KhAvD
 cnLuXeZQOVjUcaNeChXmwsWhfm4jhINCREdsLiYhoaAJjJ1A2nTWVQELltx0H7lgiTPs
 O6BlLZLNT3tbyx7bB+gkRtwXfpVblVs2zvX9WyrHNmbVL3mBN9qcipLVrxtesxIc7kBp
 yhVq1gSZH88v9OM64/rvuIDyMAMjKpyvEY7QH9pQ68N3vawvJz67eFeDuwAOWbGYGXsX
 8GYg==
X-Gm-Message-State: AOJu0YxaRf9g46JkdwG5ZNxulynYA2f+gTTV+haNnU2lRsriwj3IRcsj
 6ZgJIRyhEAZiVQrqZbcmM8dE99dG38NyVATj8Z0byZaZSLzwPZNoZNISoL3DascXade8Adq5Uz+
 4WS9dZv/yvh7dxBJz18jCco7Kib7+iPlFEqmBZ6X0w0h3y+563y40gu1qd34nnYZXxB3yng==
X-Gm-Gg: AZuq6aLBL6BdesdaFfNIOIDv8pEDtdE/nqcvOFzLomqXVDvZTEl57PpSP+cz2WG0nwc
 9f0DRhW0IFmVyKwnW8fklwb3dTtjIWteAAcIsBN1PCTFOGq0gF82NxMT/c38WwYaWXX8yneifJd
 XhLh+dtnxBvTtElT+CNiUb6nVQ19oigc/49Ez6c0XXBziZBAqI4t0lSIbVqHkkDgUiIhu8S0QcD
 tGnkdWd3zuJx++vj8ayoBKWZRciV/o+Qey7MAO1nCM4yyf+jsYEOvp2gw2T0B8MsO3jXxLTHZ7t
 RIZ+Kj/w5j3j0Td7d3fWzSCkM/5fbUDcEm98bQeD8TxWHpHsTtMb0k0KA4A4UR54Cb9hAqyONi+
 xdnFOpm4ef4rsST2lzWV4Uv3DOa9HmGGYb7U=
X-Received: by 2002:a05:6a20:6f87:b0:38d:e730:bd6e with SMTP id
 adf61e73a8af0-392cc720c52mr12365486637.27.1770008539428; 
 Sun, 01 Feb 2026 21:02:19 -0800 (PST)
X-Received: by 2002:a05:6a20:6f87:b0:38d:e730:bd6e with SMTP id
 adf61e73a8af0-392cc720c52mr12365460637.27.1770008538884; 
 Sun, 01 Feb 2026 21:02:18 -0800 (PST)
Received: from hu-nlaad-hyd.qualcomm.com ([202.46.22.19])
 by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-c64276efd8asm13232742a12.7.2026.02.01.21.02.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 01 Feb 2026 21:02:18 -0800 (PST)
From: Nilesh Laad <nilesh.laad@oss.qualcomm.com>
Date: Mon, 02 Feb 2026 10:32:12 +0530
Subject: [PATCH v2] drm/bridge: lt9611uxc: reset edid_read on disconnect
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260202-lt9611uxc-reset-edid-v2-1-b1e1d72edc90@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIANMvgGkC/3XMywqDMBCF4VeRWXckEy+pXfU9ShcxGWtAjU1UB
 PHdGwpddnPgW5z/gMjBcYRbdkDgzUXnpwR5ycD0enoxOpsMUshaUCFwWJqaaN0NBo68IFtnURk
 jqFRtJa8C0nUO3Ln9m308k7vgR1z6wPoXq4T6F9sICQvWpa1aqqlRdx9j/l71YPw45mngPD+3k
 tEquQAAAA==
X-Change-ID: 20260130-lt9611uxc-reset-edid-7cc0147b5280
To: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 venkata.valluru@oss.qualcomm.com, Jessica Zhang <jesszhan0024@gmail.com>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Nilesh Laad <nilesh.laad@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-a9b2a
X-Developer-Signature: v=1; a=ed25519-sha256; t=1770008533; l=1376;
 i=nilesh.laad@oss.qualcomm.com; s=20250718; h=from:subject:message-id;
 bh=eFySvnyd1a9KqHUJXTuN4ppDaRadYj8VQlJTAdixE3o=;
 b=i/bmixtP4lWDDxFtMuxZMhS4u2Ewt1vrrrHn8JD+fRGcVdZsGoKPn/9zALK0gmBco9Nvxo0Sf
 wxdb+yr4HYRBgb0X7WWkSuqyJmqLA/XjVyn8SEUDG0sJjMY45MMyl9+
X-Developer-Key: i=nilesh.laad@oss.qualcomm.com; a=ed25519;
 pk=MjLHvGipC16awutyYh0FnLpT1nPxL/Cs1dCevHMrrD4=
X-Proofpoint-GUID: wQYkQYLr0_XNqDN8hgowWqhyGo8qAreD
X-Proofpoint-ORIG-GUID: wQYkQYLr0_XNqDN8hgowWqhyGo8qAreD
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjAyMDA0MSBTYWx0ZWRfX6ciCamTPisJp
 J7XgbRsbZE87F3Au5nd8eYQTkvdCQAQBSZgtUxVSw3H1t2AcOhkrq9ItCb9PYb2S4lFLM/R1V6Z
 TnS9UC4kF8fzYRdlrGfEx0fgchkdTSgzW4nVzLoypIEgjcMifLJCvhU+15OFriSHvsCuIRvG7Gv
 4GO/SpUelk9zXZNySWb5J+zbdhsICoG2827UxivtyOY+xPBtqL+VikOaIw515mHVyOTLJnsLC+Z
 kCsjyH81xSvgxRyh40Bk6cekDIsxUxIoqt/uHv63HV/Bp41FhPiYmHscglLX2UoVTC3anUYgV94
 k+hHu5kOLcw5mzc9zauxSnLgSIr/WbvmUdw3Z57q6n8gKx65jXbTun/GK36A57cPSdzgXGkA+Ip
 f4yMvMorbLAL0IPKH0CZq8C4tZ+Jg8pmYTHM8CasEyByd+55MFmJfmBlk9DbizrLlmTs9B63kCm
 O28xy1U/SqBsX9xw2mg==
X-Authority-Analysis: v=2.4 cv=T8OBjvKQ c=1 sm=1 tr=0 ts=69802fdc cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=epPyvgG4nFS5MlfyoUcA:9 a=QEXdDO2ut3YA:10 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-02_01,2026-01-30_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 clxscore=1011 suspectscore=0 impostorscore=0
 bulkscore=0 lowpriorityscore=0 adultscore=0 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602020041
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
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.20)[mailman];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[17];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_RECIPIENTS(0.00)[m:andrzej.hajda@intel.com,m:neil.armstrong@linaro.org,m:rfoss@kernel.org,m:Laurent.pinchart@ideasonboard.com,m:jonas@kwiboo.se,m:jernej.skrabec@gmail.com,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:linux-kernel@vger.kernel.org,m:venkata.valluru@oss.qualcomm.com,m:jesszhan0024@gmail.com,m:dmitry.baryshkov@oss.qualcomm.com,m:nilesh.laad@oss.qualcomm.com,m:jernejskrabec@gmail.com,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[intel.com,linaro.org,kernel.org,ideasonboard.com,kwiboo.se,gmail.com,linux.intel.com,suse.de,ffwll.ch];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[nilesh.laad@oss.qualcomm.com,dri-devel-bounces@lists.freedesktop.org];
	FREEMAIL_CC(0.00)[lists.freedesktop.org,vger.kernel.org,oss.qualcomm.com,gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[nilesh.laad@oss.qualcomm.com,dri-devel-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: D73D6C83FC
X-Rspamd-Action: no action

Currently edid_read has value from previous connect session
and resulting in drm using older edid before new edid is available
in lt9611uxc.
Reset edid_read so that correct status is updated and correct edid
is available for drm.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Nilesh Laad <nilesh.laad@oss.qualcomm.com>
---
Changes in v2:
 - Collected Dmitry Baryshkov tag
 - Link to v1: https://lore.kernel.org/lkml/20250730-lt9611uxc-reset-edid-v1-1-3ea4d5b16197@oss.qualcomm.com
---
 drivers/gpu/drm/bridge/lontium-lt9611uxc.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/bridge/lontium-lt9611uxc.c b/drivers/gpu/drm/bridge/lontium-lt9611uxc.c
index 11aab07d88df..4d989381904c 100644
--- a/drivers/gpu/drm/bridge/lontium-lt9611uxc.c
+++ b/drivers/gpu/drm/bridge/lontium-lt9611uxc.c
@@ -170,6 +170,9 @@ static void lt9611uxc_hpd_work(struct work_struct *work)
 	connected = lt9611uxc->hdmi_connected;
 	mutex_unlock(&lt9611uxc->ocm_lock);
 
+	if (!connected)
+		lt9611uxc->edid_read = false;
+
 	drm_bridge_hpd_notify(&lt9611uxc->bridge,
 			      connected ?
 			      connector_status_connected :

---
base-commit: 3ea699b56d31c2a5140d9fac309ff5e0f2041411
change-id: 20260130-lt9611uxc-reset-edid-7cc0147b5280

Best regards,
--  
Nilesh Laad <nilesh.laad@oss.qualcomm.com>

