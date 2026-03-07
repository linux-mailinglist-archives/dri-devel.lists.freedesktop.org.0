Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cPT0KBcPrGkbjgEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Sat, 07 Mar 2026 12:42:15 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 58AB522B7A6
	for <lists+dri-devel@lfdr.de>; Sat, 07 Mar 2026 12:42:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3FF1E10E357;
	Sat,  7 Mar 2026 11:42:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="XwzR2mDA";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="QWKMOkBl";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 019E110E357
 for <dri-devel@lists.freedesktop.org>; Sat,  7 Mar 2026 11:42:11 +0000 (UTC)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 6276r4dT277598
 for <dri-devel@lists.freedesktop.org>; Sat, 7 Mar 2026 11:42:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 Ql/OBlsnmzWsbfZsETPUc9XH7il2mDmKIxDrs/rob/k=; b=XwzR2mDAVP8gQTmc
 ONv/9nBbSN6R1/IGchyt5pVMxbvkE+HFfnOaPpL3gKYssoTyJjrdBodQJLB9bkNl
 bbELNoZRi+f/yXKdHSR2QNGN202Me4tnPDtMvgEFsyEw3v8vSZLOJxjwGvvEygoD
 474gv3EinsdqUM2MqtJeKbK7qDKvuRedK8hSnoqO0c6kvLtX0SSF3pqmK5G8QWZK
 eQ7ExLmVM5by6tSH4MlHvuAjlAO47zPkWYRIHevZg0nOtMuuUi0gEG8lxjT8rBTv
 027wBHsbgvg1sshTTQrLhquygJn0fC+aKYAB/hbXM3B/3f7Eu3j2fzcpPiqK8G9s
 8CyhJQ==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com
 [209.85.214.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4crcse0m6q-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Sat, 07 Mar 2026 11:42:11 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id
 d9443c01a7336-2ae59e057f1so71130545ad.1
 for <dri-devel@lists.freedesktop.org>; Sat, 07 Mar 2026 03:42:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1772883731; x=1773488531;
 darn=lists.freedesktop.org; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=Ql/OBlsnmzWsbfZsETPUc9XH7il2mDmKIxDrs/rob/k=;
 b=QWKMOkBlIoIv0qLdT47UDIqaL15sZQZcGfqmylYI764jLRHFyFmgiW5UFcuIbLyPWm
 G9iYpKDfNkuatXhoeH8+c1tkRGlIgJMrGjJ/RUnkWrZGMKB9SVpUqKgerCRuQp3fOmdR
 /uw9mP8mhZZnhJS4ovlBLFgpOHeWQhh0MALraX66A01vL4scZJaakKSryaEY7kVnJeme
 bJrD/fpFk/PSwcyoQ0U6OUtQVvBIgrqLO0Low7o5OnBVyzs1G/mBJSyIsP0rygMr25x/
 YbU54G+J0d3YHbcu6t8RF/9BkGmva+3FB9eGQju4vqfmI0sqerraoW3OAFP1vhq5MVGT
 Z5aQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772883731; x=1773488531;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=Ql/OBlsnmzWsbfZsETPUc9XH7il2mDmKIxDrs/rob/k=;
 b=dwevfkgDXEviW0FxZz3eTJOr5FT0sMq9ivFfuifpmEwDax2f4LjJyqL4OGMDme2Fq6
 gNgEnNF0IPbSEV0GJsrQ9wUmrj8UfFtHhQltxGoSkeLRNWGLORLFIeUhl3uiSkFPoZXx
 fYTvT+viKpZdASOXxkjOIGHWnAhWFVltMcxiWAjX74aqSbcxivJl++NVY5zdg3o9SK1T
 qz/RCb/OXFQ7jPs8o5lclM2H2w0RUhnfdgv8Yq1W4IUekg3SzNUgNBjjEeSyTytvnE64
 jbSuS0i9Iqf/7knxfgevnatpakfo7zruLkdJ9kchmFmBXNp9dtRczgezEXVvIft0yKvk
 C9/w==
X-Forwarded-Encrypted: i=1;
 AJvYcCV1NGXv7moo5iuH4I40GN4eggcAsxytsS4+m4ts7fB2cLczUWTIHwAySlFu0m7KzYJZRRzPZVBrvZw=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxKwUVqY1jHqXKC8r6ZomYXt0v4Fa2Qkk6T+EgZas40OhylYIsY
 RE29TXxMFE7WdT8fT5GWO9APEgv9EfElttzpSP9i9jmPj/9VjIknYmEOPDlEjXJk+HTfqIc0HrL
 n+B6pHTFPdBQ7SbHT6tcDMLyRok1ITDDSvGhCUa+Bszg6ZjXWt6rzcd2cTQdHrUSpp3vIAiU=
X-Gm-Gg: ATEYQzyXlMG0tn6TeRaK/YFjyfOcFWKctnmtBM5d75tSnW7TJzyqDLdBsZxYv8D67WQ
 Z4l1abDdRsEIsWVcY4wQg1Qdi1TE65+d9i56ELMDeNzrAeg0DYDG69FrRc5oWldURaUi6iztuvu
 969OAt7q2+dE5uu6U7wt1GzccjNcui9wUI+gcxMbsS4+OYgKprXUCe6CmebBK7Q9GF/FT7Iws/r
 X1mQxxfwDT2ufwekt1VuATVWqu0Zlkfz6CAHDd+pJTVmqn18xF2tcNnEFJN8ONsPz2apES7OVN5
 bOZ+e+i/ecucJpzzdQ35DOwy2bO2LKg8aL4kyzWlakM9EjJc+nM3Md6tjMUNhmaz4rNkMfScoit
 HoE3TOesYct3O7bbLLbd2V0wOPgEy1yTUBGN72KE8JVTu5LQgbp8=
X-Received: by 2002:a17:902:ef50:b0:2ae:5797:e082 with SMTP id
 d9443c01a7336-2ae823aad45mr55366045ad.24.1772883730930; 
 Sat, 07 Mar 2026 03:42:10 -0800 (PST)
X-Received: by 2002:a17:902:ef50:b0:2ae:5797:e082 with SMTP id
 d9443c01a7336-2ae823aad45mr55365825ad.24.1772883730454; 
 Sat, 07 Mar 2026 03:42:10 -0800 (PST)
Received: from hu-batta-hyd.qualcomm.com ([202.46.23.25])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2ae83f8c713sm47996145ad.66.2026.03.07.03.42.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 07 Mar 2026 03:42:10 -0800 (PST)
From: Kishore Batta <kishore.batta@oss.qualcomm.com>
Date: Sat, 07 Mar 2026 17:11:24 +0530
Subject: [PATCH v2 3/9] bus: mhi: Match devices exposing the protocol on
 the SAHARA channel
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260307-sahara_protocol_new_v2-v2-3-29dc748b5e9c@oss.qualcomm.com>
References: <20260307-sahara_protocol_new_v2-v2-0-29dc748b5e9c@oss.qualcomm.com>
In-Reply-To: <20260307-sahara_protocol_new_v2-v2-0-29dc748b5e9c@oss.qualcomm.com>
To: Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
 Jeff Hugo <jeff.hugo@oss.qualcomm.com>,
 Carl Vanderlip <carl.vanderlip@oss.qualcomm.com>,
 Oded Gabbay <ogabbay@kernel.org>, Manivannan Sadhasivam <mani@kernel.org>
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 mhi@lists.linux.dev, Kishore Batta <kishore.batta@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1772883713; l=1219;
 i=kishore.batta@oss.qualcomm.com; s=20260206; h=from:subject:message-id;
 bh=IdXz01mR4Rs8f0RYsO8zVitGxgHIzvaHiQFtik+wHJE=;
 b=3HTb3lNqq1SBlZH8owlRUqgc1PykEjlh9ZnscaYY2XCHwlu9RlWn/8c29wYzbFP832FhPqK4M
 6/gbGM0wW/kAcei6sxdVFhRnS5Q53iyxG//r/OMoyPfrXciF+4abQ5k
X-Developer-Key: i=kishore.batta@oss.qualcomm.com; a=ed25519;
 pk=vJo8RvTf+HZpRLK2oOIljmbn9l3zFkibCGh+blaqZCw=
X-Authority-Analysis: v=2.4 cv=IdqKmGqa c=1 sm=1 tr=0 ts=69ac0f13 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=O3MGeqbvIhhX5qxHWLUA:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-GUID: wkVwER7Ykt5eXddM5YDjuPDLmkEgyiUQ
X-Proofpoint-ORIG-GUID: wkVwER7Ykt5eXddM5YDjuPDLmkEgyiUQ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA3MDEwOCBTYWx0ZWRfX6bKf8dN+veqS
 pHClAO/OVppNJHh+XpltOV9NXpnEGaXgglb/3kvr6yfdeUg6TqNMgbS1ttQdgmo9mJm6oY5mJ5f
 d5RCNb0pj00WdKKG2t8yuGXaDndrwY26xVmPUd/1FoZ9sOkSp3Vg/tvK8K/iZczXtisEoSjsJoW
 kULrthk8cs0DRbYC/44Hv96Zpm5IM1RKt6Vfyo9zwPxcB/RxrVgAlVVrR7VL7MtXu3+UGDW44C0
 EsCYl/z1j34k9CHrYGrsDnpq+iSurht3xTBTMTXSM6KMtbg6WRqDvV7Gmgo3jYeU32b75RxlE3a
 6blgC2BIO/4ynYUiKyy6Lmzz+1NGGrRMFmizjtRj6gZcKho3NgVF5XC7L/0fcH2EqLTU0yxD26l
 qM7XDa4OrLElL/H02ZERgk+HyFnXSvT5oogns84z3GJYmE55QAGoZ1nigYevMQIgjWwO0SDotps
 p+lpA1W78DiTN9wlMiA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-07_04,2026-03-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 bulkscore=0 suspectscore=0 lowpriorityscore=0 spamscore=0
 malwarescore=0 clxscore=1015 phishscore=0 priorityscore=1501 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603070108
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
X-Rspamd-Queue-Id: 58AB522B7A6
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.31 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:corbet@lwn.net,m:skhan@linuxfoundation.org,m:jeff.hugo@oss.qualcomm.com,m:carl.vanderlip@oss.qualcomm.com,m:ogabbay@kernel.org,m:mani@kernel.org,m:linux-doc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:mhi@lists.linux.dev,m:kishore.batta@oss.qualcomm.com,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[kishore.batta@oss.qualcomm.com,dri-devel-bounces@lists.freedesktop.org];
	RCPT_COUNT_TWELVE(0.00)[12];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	FROM_NEQ_ENVFROM(0.00)[kishore.batta@oss.qualcomm.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-0.988];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo]
X-Rspamd-Action: no action

Some Qualcomm devices expose the Sahara protocol on a generic SAHARA MHI
channel rather than a QAIC specific channel name. As a result, the sahara
driver does not currently bind to such devices and never probes.

Extend the MHI device ID match table to also match the SAHARA channel
name. This allows the Sahara protocol driver to bind to devices that
expose the protocol directly on a standard sahara MHI channel.

Signed-off-by: Kishore Batta <kishore.batta@oss.qualcomm.com>
---
 drivers/bus/mhi/sahara/sahara.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/bus/mhi/sahara/sahara.c b/drivers/bus/mhi/sahara/sahara.c
index 8ff7b6425ac5423ef8f32117151dca10397686a8..e3499977e7c6b53bc624a8eb00d0636f2ea63307 100644
--- a/drivers/bus/mhi/sahara/sahara.c
+++ b/drivers/bus/mhi/sahara/sahara.c
@@ -911,8 +911,10 @@ static void sahara_mhi_dl_xfer_cb(struct mhi_device *mhi_dev, struct mhi_result
 
 static const struct mhi_device_id sahara_mhi_match_table[] = {
 	{ .chan = "QAIC_SAHARA", },
+	{ .chan = "SAHARA"},
 	{},
 };
+MODULE_DEVICE_TABLE(mhi, sahara_mhi_match_table);
 
 static struct mhi_driver sahara_mhi_driver = {
 	.id_table = sahara_mhi_match_table,

-- 
2.34.1

