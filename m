Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uDyhCg0PrGkbjgEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Sat, 07 Mar 2026 12:42:05 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D1A122B779
	for <lists+dri-devel@lfdr.de>; Sat, 07 Mar 2026 12:42:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 53FF210E0CE;
	Sat,  7 Mar 2026 11:42:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="gO/2Ic+e";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Y5KrR4ma";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5A7FB10E0CE
 for <dri-devel@lists.freedesktop.org>; Sat,  7 Mar 2026 11:41:59 +0000 (UTC)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 6274ld2S1249597
 for <dri-devel@lists.freedesktop.org>; Sat, 7 Mar 2026 11:41:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:message-id
 :mime-version:subject:to; s=qcppdkim1; bh=3nSo4d6ACuGW4wqzMO4zRi
 XyX4asXwy79TGsDWMoSMg=; b=gO/2Ic+eCuuNyNBG6DX1wOiSmYhR6xZgc4gt1E
 DaV6icbdmVaBU53eRaly/OugAwkhW3uxzKFQYnq2fiptFFG/VcM6D3srnVkcJSYX
 gBVliCPckTeNeRVEmQSchBC39sL99aWZgo/pbgl+yYEXYLAdC3VXksxuW1swmekm
 Yk60xbw1zcamgZSxCEr2rWzY5FUBiggl3iaOPSa9cbudrpRwuy/l3H1YiBNGsQ+6
 v3jggVMHxNx/QIgUvbGdaV0WAwnOZTUMZvrsGDT5H1t2DMGUyI6dT2qN+D6WB4Gn
 OV9BkMZs6mBjD4zEho6V42lChR8gjI7izDjNXkC6YR6SUAMQ==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com
 [209.85.214.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4crda98j00-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Sat, 07 Mar 2026 11:41:58 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id
 d9443c01a7336-2ae502a1dd9so81422955ad.3
 for <dri-devel@lists.freedesktop.org>; Sat, 07 Mar 2026 03:41:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1772883718; x=1773488518;
 darn=lists.freedesktop.org; 
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:from:to:cc:subject:date:message-id:reply-to;
 bh=3nSo4d6ACuGW4wqzMO4zRiXyX4asXwy79TGsDWMoSMg=;
 b=Y5KrR4maf/EzMOto39U3+1eOV2AaQfsEeSm+8Fpj+eLjncmTqsE3Yx62S9iwwKuY/7
 V0E+hLpn9rpjGCdZTH5/73XqxSkyWm+ui0RP8lqgLIc0qBeoDdA2YleR9DrLQez+qIlF
 xn3pnXcpvYn+LAnKBdly1ZTn9eZMENHzN8S2VRowg53xKCZ9I4pt0uI+3LyHadOHqLRI
 NisgJ4ftvs6hggqtiEgHp/HqHpoDLPM4JRFIJx/h/N0VeDvDV7hFvq2DUoKJKu6OQIvw
 1/CecnBvi78cnb1wESUmesrkK1zX1oqCwQbs4QCIWKEdeU9qIW6FocayjPdzRWIvXwIK
 EgJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772883718; x=1773488518;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=3nSo4d6ACuGW4wqzMO4zRiXyX4asXwy79TGsDWMoSMg=;
 b=ecfDfJb8K1t5JbOqftXck1lwSGwxS+xxZxegytkSTXctHGP5Q7QkBK6GrZ0nLsi8z2
 QM6mT6b2LQ6N/RFhXRs09si6Xj0rLcpAaC3AP/UFrUbRTs9v+N/PC3ARLablr0fDvWfW
 3os2dKTRqxYk30YGbX6rP+gXrXPq/4+UHTjgvl6VDHKQoHVV6er26u0cQCrmXvsKo5rF
 nREEyZ3BIgG7DuVeovStJkgkkrh7LOEl6zSj0PlklbISrRQDrwDq1tCug+ERcecRkj5F
 yEJeJ53GqP6+U3yJj7wh8uTSfG+KwD1zLiC9uZkypKihBydjbOQYZegqFEezGATxLJkn
 P7/g==
X-Forwarded-Encrypted: i=1;
 AJvYcCXz1jJZlYZIqlzUhY8BkGOoEk/vVWLbeUormfIKb7hozquG8AGPVSUnXaO/HEgsLFNtuht+RH6RmS0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyXgSpQTxewbwln17pvIRpCPFN7EJnNOXvnQsmtgredi0gqLTE6
 omMA9iNDVUO1rNNQamA1SB1RvfO9uCLbhiPFmvrKy2y9cFoz/Y6k8P9lYkH3QMU1DD+nQ43Y/Ru
 +ElLrsS9CjM2wquLTj6whpiaqb5gKAoH7bvf13wyGIZGXY2DjU1vOwpAaB1QNt5/s+RDq44Q=
X-Gm-Gg: ATEYQzyuubjEi8hUK2vRr0nV+y/3pbCe9kQCW3XqhH4r0ERcboGwR9O+4Xe57dr1E1s
 U4SjHfIhjip7DSrx+AwB5IkQA0V9QI23kgXH80AZg5JIrTxVl/N7H3STVmMGSFkj0uB/PeuUUP8
 r7tp3mqPaI98BfpHT5eFktswpteGc69QtpPKyPP0Atqx0+Ixf5Gqpfa9peVJ7MM8Vs3uu/vfDvB
 5NlmP741ZlzzotU+tgXmHQYdpMHYRfiRlvKBIbxLwwBRbwW1lmP5Nezpa6LK0VvU+jj7KwSsjDD
 OGvh0qmHCkrjtjxDf0gOPY0Y8/h9RQ1cGy65IcBnlKBGlCDHHT57hYxl7PAyATeLPAlho++Lqvx
 yVC3fP6Q49Ox+nIzysPlI/4tx41tB2MOElVfG9f2yExT9ZGEyUoE=
X-Received: by 2002:a17:902:f54e:b0:2ae:478f:2eb with SMTP id
 d9443c01a7336-2ae822f1f5cmr53495025ad.0.1772883717874; 
 Sat, 07 Mar 2026 03:41:57 -0800 (PST)
X-Received: by 2002:a17:902:f54e:b0:2ae:478f:2eb with SMTP id
 d9443c01a7336-2ae822f1f5cmr53494825ad.0.1772883717343; 
 Sat, 07 Mar 2026 03:41:57 -0800 (PST)
Received: from hu-batta-hyd.qualcomm.com ([202.46.23.25])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2ae83f8c713sm47996145ad.66.2026.03.07.03.41.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 07 Mar 2026 03:41:57 -0800 (PST)
From: Kishore Batta <kishore.batta@oss.qualcomm.com>
Subject: [PATCH v2 0/9] Qualcomm Sahara protocol enhancements.
Date: Sat, 07 Mar 2026 17:11:21 +0530
Message-Id: <20260307-sahara_protocol_new_v2-v2-0-29dc748b5e9c@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAOEOrGkC/x2N0Q6CIBiFX6VxHQxQwLrqPZpzRJgs9Td+sprz3
 UNvzvad7XxnIehj8EjOh4VEPwcMMGaQxwNxnR0fnoZ7ZiK51LzghqLtbLTNFCGBg74Z/aeZJdV
 aVqo0pnCtIXk8Rd+G7y6+1pm7gAnib/+ZxdZuSsUrqQQXJ6mZFJorVVJBnwE7iJ7dbEr2Aojs9
 ba9g2FgOUi9rusfnSP4zbgAAAA=
X-Change-ID: 20260307-sahara_protocol_new_v2-662854773cf7
To: Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
 Jeff Hugo <jeff.hugo@oss.qualcomm.com>,
 Carl Vanderlip <carl.vanderlip@oss.qualcomm.com>,
 Oded Gabbay <ogabbay@kernel.org>, Manivannan Sadhasivam <mani@kernel.org>
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 mhi@lists.linux.dev, Kishore Batta <kishore.batta@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1772883713; l=5313;
 i=kishore.batta@oss.qualcomm.com; s=20260206; h=from:subject:message-id;
 bh=iEUuY3wGzLZPYjI71MhbAplsXD6EpLcgQaZDOkmWUSw=;
 b=RUj880u9mPXD5GTS+6SFf3uYgx5efxLyyzY/IPlSOkM8aMj1QCmRl3FN7mc9O/HuO1+NeVhwc
 +H4dMSpBWp/Bq7gM/RyR41jlCsZ4cZx8Jwl+8eq7RQ/sbo+knoIKUG/
X-Developer-Key: i=kishore.batta@oss.qualcomm.com; a=ed25519;
 pk=vJo8RvTf+HZpRLK2oOIljmbn9l3zFkibCGh+blaqZCw=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA3MDEwOCBTYWx0ZWRfX/Mi39To2hmZ1
 TbuT/SHgD4v2LjBkIcO8Z4Knnq7oCCN+cxp7fyttP3CZMrELAUTLksIPI+JT1DFL05yfU89+cRF
 nUGSrYwQVSwJ9NN5PvqWRQlALklELuT3IQwoE2CvKHFgAotAH9ju1zWTcNJQXYAu03xfTkzoD6C
 trdbPMnBxlSBAmVv11qLCq++MtBmga7sI+l0lu9iOl0KPwd2H2fEGNli9361noIAN8fOeNz6q8B
 rSB9YpzOBeTvFFvN/g8L4Ffht/6c93skqCzg1AcqlAdooTTMea7O20dKmJIDoQ0hWnelevmiO8z
 zaPEXSxegXH1nI/LKf47tSqjRRQIjXV2F2fvuyeKenoMtMI8Cw2J9xZHlQD4BZiUsDFlvNJjbPn
 J+vH86xEJU5wmpuZUNWERoa/PXHgX6JAk7r6ewZJ52tKAlbRKBFI/aMkCQEitP+iRGtgFlC+03i
 MFjsfFmD6acxWTKL7xQ==
X-Proofpoint-ORIG-GUID: c3rGmdOwQEQhBr4gFI1EoYrbv4C42QHN
X-Authority-Analysis: v=2.4 cv=QZtrf8bv c=1 sm=1 tr=0 ts=69ac0f06 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=lG-yCPvlEGbsawO-O7cA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-GUID: c3rGmdOwQEQhBr4gFI1EoYrbv4C42QHN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-07_04,2026-03-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1011 bulkscore=0 priorityscore=1501 impostorscore=0
 malwarescore=0 phishscore=0 spamscore=0 suspectscore=0 lowpriorityscore=0
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
X-Rspamd-Queue-Id: 8D1A122B779
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
	FORGED_RECIPIENTS(0.00)[m:corbet@lwn.net,m:skhan@linuxfoundation.org,m:jeff.hugo@oss.qualcomm.com,m:carl.vanderlip@oss.qualcomm.com,m:ogabbay@kernel.org,m:mani@kernel.org,m:linux-doc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:mhi@lists.linux.dev,m:kishore.batta@oss.qualcomm.com,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[kishore.batta@oss.qualcomm.com,dri-devel-bounces@lists.freedesktop.org];
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
	NEURAL_HAM(-0.00)[-0.991];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid]
X-Rspamd-Action: no action

Hi All,

This series reworks the Sahara protocol driver to make it reusable for
multiple MHI based devices and adds support for capturing, restoring and
exposing DDR training data using the Sahara command mode.

The Sahara protocol is transported over the MHI bus and is used by multiple
flashless devices to transfer firmware images, retrieve memory dumps and
exchange command mode data during early boot. However, the current
implementation lives under the QAIC accelerator driver and contains
device-specific assumptions that limit reuse.

Some MHI devices (for example, QDU100) expose the sahara protocol directly
on a "SAHARA" MHI channel and rely on command mode to exchange DDR training
data with the host. The existing driver does not bind to such devices and
ignores Sahara command mode packets, causing training data to be dropped.

This series addresses these issues by relocating the Sahara driver to the
MHI subsystem, centralizing device specific configuration and adding command
mode handling for DDR training data.

Overview of the changes in this series -
1. Move Sahara under the MHI subsystem:
   a. Relocate the sahara protocol driver from QAIC accelerator tree to
      drivers/bus/mhi.
   b. Register Sahara as an independent MHI protocol driver.

2. Generalize device matching and configuration
   a. Allow the driver to bind to devices exposing the protocol on a
      SAHARA MHI channel.
   b. Centralize firmware image table selection at probe time using a variant
      table, instead of scattered conditionals.
   c. Preserve existing behavior on AIC devices.

3. Add QDU100 firmware image table support
   a. Add a QDU100 image table and select it based on the matched MHI channel.
   b. No separate client driver or registration mechanism is required.

4. Add Sahara command mode support for DDR training.
   a. Handle command mode packets(CMD_READY, EXECUTE, EXECUTE_DATA).
   b. Query supported commands and retrieve DDR training data from the device.
   c. Allocate receive buffers based on the reported payload size and copy
      raw data from the MHI DL.
   d. Store training data in controller-scoped memory using devres so it
      survives sahara channel teardown.

5. Expose DDR training data to userspace
   a. Add a read-only binary sysfs attribute under the MHI controller device.
   b. The attribute reads directly from controller-scoped storage and remains
      available after the Sahara channel device is removed.
   c. Cleanup is handled automatically via device-managed resources.

6. Document the sysfs ABI
   a. Add ABI documentation describing the DDR training data sysfs node.

Signed-off-by: Kishore Batta <kishore.batta@oss.qualcomm.com>
---
Changes in v2:
- Rebased onto latest linux-next tip.
- Reworked commit messages to clearly start with the problem being solved and
  end with a technical description of the change.
- Moved the Sahara driver to drivers/bus/mhi instead of drivers/soc/qcom,
  reflecting that its an MHI protocol driver rather than a SoC specific driver.
- Removed client side image table registration and consolidated firmware
  selection directly in the sahara driver using a probe-time variant
  mechanism.
- Ensured each patch is self-contained and does not break the build or runtime
  behavior at any intermediate point.
- Simplified state handling and lifetime management to avoid duplicated state
  tracking and ad-hoc cleanup.
- Updated sysfs handling to use controller-scoped devres and avoid one-shot
  reads or manual teardown.
- Link to v1: https://lore.kernel.org/r/20250825101926.2160554-1-kishore.batta@oss.qualcomm.com

---
Kishore Batta (9):
      Add documentation for Sahara protocol.
      bus: mhi: Move sahara protocol driver under drivers/bus/mhi
      bus: mhi: Match devices exposing the protocol on the SAHARA channel
      bus: mhi: Centralize firmware image table selection at probe time
      bus: mhi: Add QDU100 firmware image table
      bus: mhi: Load DDR training data using per-device serial number
      bus: mhi: Capture DDR training data using command mode
      bus: mhi: Expose DDR training data via controller sysfs
      Documentation: ABI: Add sysfs ABI documentation for DDR training data

 .../ABI/testing/sysfs-bus-mhi-ddr_training_data    |   19 +
 Documentation/sahara/index.rst                     |   14 +
 Documentation/sahara/sahara_protocol.rst           | 1241 ++++++++++++++++++++
 drivers/accel/qaic/Kconfig                         |    1 +
 drivers/accel/qaic/Makefile                        |    3 +-
 drivers/accel/qaic/qaic_drv.c                      |   11 +-
 drivers/bus/mhi/Kconfig                            |    1 +
 drivers/bus/mhi/Makefile                           |    3 +
 drivers/bus/mhi/sahara/Kconfig                     |   18 +
 drivers/bus/mhi/sahara/Makefile                    |    2 +
 drivers/{accel/qaic => bus/mhi/sahara}/sahara.c    |  574 ++++++++-
 {drivers/accel/qaic => include/linux}/sahara.h     |    0
 12 files changed, 1844 insertions(+), 43 deletions(-)
---
base-commit: a0ae2a256046c0c5d3778d1a194ff2e171f16e5f
change-id: 20260307-sahara_protocol_new_v2-662854773cf7

Best regards,
-- 
Kishore Batta <kishore.batta@oss.qualcomm.com>

