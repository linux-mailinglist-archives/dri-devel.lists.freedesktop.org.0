Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aFmwJJ4Qhmk1JgQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Fri, 06 Feb 2026 17:02:38 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A988FFFBD
	for <lists+dri-devel@lfdr.de>; Fri, 06 Feb 2026 17:02:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 48BD610E826;
	Fri,  6 Feb 2026 16:02:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=imgtec.com header.i=@imgtec.com header.b="c72LVO6h";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx08-00376f01.pphosted.com (mx08-00376f01.pphosted.com
 [91.207.212.86])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0CE3710E826
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Feb 2026 16:02:26 +0000 (UTC)
Received: from pps.filterd (m0168888.ppops.net [127.0.0.1])
 by mx08-00376f01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 616Fo162075907; Fri, 6 Feb 2026 16:02:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=imgtec.com; h=cc
 :content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=dk201812; bh=T
 49SW10gWcX3NHjLoPn+cMb0Ic1GvNHtBUUHVmmF1mU=; b=c72LVO6hmUhHiiaHq
 n9E/7xHPM/4ydG8r75NloQKoE6BU5UKwK4FGInRxeYruPjazWXPvuYvY57rXSxwY
 tz3fPPl+cVPN2u5gCD0raMwRZi50S9PH6Rfm+IOzoaL4hroSNO9H8ZcdCYR5i1Z3
 NLp10k7vNTG+v78buS+zW3U0wwHI2fY07gBebu4zWeKv6WfsOvTNoQXHO2J+sj0I
 feRe2xsvTo8P4F6VbAtg+ggVEHyZtpaE2IvfdTdLl9pbrjIE5449XHV193kYXxgs
 hUgw48pCHX81wxg6aDI4TbsA+2aloQFMWFKIc/dYO7mzNlWJcceD4VUQY3Yx+qmO
 IM0Pw==
Received: from hhmail01.hh.imgtec.org
 (83-244-153-141.cust-83.exponential-e.net [83.244.153.141])
 by mx08-00376f01.pphosted.com (PPS) with ESMTPS id 4c4jfy15k1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 06 Feb 2026 16:02:19 +0000 (GMT)
Received: from
 1.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.ip6.arpa
 (172.25.6.240) by HHMAIL01.hh.imgtec.org (10.100.10.19) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Fri, 6 Feb 2026 16:02:18 +0000
From: Matt Coster <matt.coster@imgtec.com>
Date: Fri, 6 Feb 2026 16:02:13 +0000
Subject: [PATCH 2/2] drm/imagination: Mark FWCCB_CMD_UPDATE_STATS as known
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20260206-improve-bad-fwccb-cmd-v1-2-831a852ca127@imgtec.com>
References: <20260206-improve-bad-fwccb-cmd-v1-0-831a852ca127@imgtec.com>
In-Reply-To: <20260206-improve-bad-fwccb-cmd-v1-0-831a852ca127@imgtec.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
CC: Frank Binns <frank.binns@imgtec.com>, Brajesh Gupta
 <brajesh.gupta@imgtec.com>, Alessio Belle <alessio.belle@imgtec.com>,
 Alexandru Dadu <alexandru.dadu@imgtec.com>,
 <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>, "Matt
 Coster" <matt.coster@imgtec.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1113;
 i=matt.coster@imgtec.com; h=from:subject:message-id;
 bh=tn8HDSE24qSm3yD77mMiGTvzvrlD9qtu62TVQDh6C0s=;
 b=owGbwMvMwCFWuUfy8817WRsYT6slMWS2CXSyJ3Bq79lSaV0hfyHkRFXEQeMixwn9m0+s2vluX
 +LsZYLTO0pZGMQ4GGTFFFl2rLBcofZHTUvixq9imDmsTCBDGLg4BWAiit8ZGW7fvRXUe3/Ckldz
 M5S6lq0Nc+f071whWWxg5L6g24M705Xhf86d9mcpjy0196oapTHsTE1bLNd7pKvLYSEn44JDOpc
 TuQE=
X-Developer-Key: i=matt.coster@imgtec.com; a=openpgp;
 fpr=05A40CFCE7269D61D97100A1747F0A9036F90DFA
X-Originating-IP: [172.25.6.240]
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjA2MDExNiBTYWx0ZWRfXx9a3e8FhxxNw
 vKD9FQVOgiHfDaUeIoJMS1w6GRxe0FMy10Yd+rITLfT2lk1GPiRWs9E6oL4ZlWtjq6wCiqaxQyG
 5AehXcCs7gm5rFmVcPfqufSt3/IFBvyqGB7YMffTGaIFcwR3z3A554eDWL5OO2LxIZZj+N1ybXm
 emfb3BYyKEt6DSX+/aTONwpIkg62PbqbSLf0IddMvvTDFW8+eZJMI93pP12B0MPGx2w7fSFqJpI
 qIqpP9W9JV1n9ZJEGpybZzX6sFhWYpU7Qn7WX8B1wt8lENcSVJRNRPO30a3x50I2dUfuCUar9uy
 1NzggRLY4Ypv0ivChZFyxEIjL0zAyr9iBhj+5Ev6oLGugQgZLCMpvwGo7ovGogZmloBoOBhQYaf
 b8xauTtr6tQ4yhO4MY1B4Ta2N6xIm+xjEmk+j+Mn9anZi52FhL4/vpSs33CZdxIqjvDHju8uoLt
 xcQjQUE0T7wupgeY7+g==
X-Proofpoint-ORIG-GUID: HFpKYz3bVldTcKA_fiFQn7KjL5e1TvEV
X-Proofpoint-GUID: HFpKYz3bVldTcKA_fiFQn7KjL5e1TvEV
X-Authority-Analysis: v=2.4 cv=GakaXAXL c=1 sm=1 tr=0 ts=6986108b cx=c_pps
 a=AKOq//PuzOIrVTIF9yBwbA==:117 a=AKOq//PuzOIrVTIF9yBwbA==:17
 a=N16aOacbDtMA:10 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22
 a=r_1tXGB3AAAA:8 a=VPWUrtGD2CiLOTWkNAAA:9 a=QEXdDO2ut3YA:10
 a=t8nPyN_e6usw4ciXM-Pk:22
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
	DMARC_POLICY_ALLOW(-0.50)[imgtec.com,none];
	R_DKIM_ALLOW(-0.20)[imgtec.com:s=dk201812];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[linux.intel.com,kernel.org,suse.de,gmail.com,ffwll.ch];
	FORGED_RECIPIENTS(0.00)[m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:frank.binns@imgtec.com,m:brajesh.gupta@imgtec.com,m:alessio.belle@imgtec.com,m:alexandru.dadu@imgtec.com,m:linux-kernel@vger.kernel.org,m:matt.coster@imgtec.com,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[matt.coster@imgtec.com,dri-devel-bounces@lists.freedesktop.org];
	RCPT_COUNT_TWELVE(0.00)[12];
	SUSPICIOUS_AUTH_ORIGIN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	DKIM_TRACE(0.00)[imgtec.com:+];
	RSPAMD_EMAILBL_FAIL(0.00)[matt.coster.imgtec.com:query timed out];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[matt.coster@imgtec.com,dri-devel-bounces@lists.freedesktop.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	HAS_XOIP(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	NEURAL_HAM(-0.00)[-0.867];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imgtec.com:email,imgtec.com:dkim,imgtec.com:mid,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: 3A988FFFBD
X-Rspamd-Action: no action

Suppress the "unknown type" warning when processing a FWCCB command of
type CMD_UPDATE_STATS which is known but (currently) unused.

Signed-off-by: Matt Coster <matt.coster@imgtec.com>
---
 drivers/gpu/drm/imagination/pvr_ccb.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/gpu/drm/imagination/pvr_ccb.c b/drivers/gpu/drm/imagination/pvr_ccb.c
index 2f4356a1e69f..9d4464583129 100644
--- a/drivers/gpu/drm/imagination/pvr_ccb.c
+++ b/drivers/gpu/drm/imagination/pvr_ccb.c
@@ -158,6 +158,14 @@ process_fwccb_command(struct pvr_device *pvr_dev, struct rogue_fwif_fwccb_cmd *c
 		pvr_free_list_process_grow_req(pvr_dev, &cmd->cmd_data.cmd_free_list_gs);
 		break;
 
+	case ROGUE_FWIF_FWCCB_CMD_UPDATE_STATS:
+		/*
+		 * We currently have no infrastructure for processing these
+		 * stats. It may be added in the future, but for now just
+		 * suppress the "unknown" warning when receiving this command.
+		 */
+		break;
+
 	default:
 		drm_info(drm_dev, "Received unknown FWCCB command (type=%d)\n",
 			 cmd->cmd_type & ~ROGUE_CMD_MAGIC_DWORD_MASK);

-- 
2.52.0

