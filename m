Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ECD875935D2
	for <lists+dri-devel@lfdr.de>; Mon, 15 Aug 2022 20:44:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4F921D179B;
	Mon, 15 Aug 2022 18:43:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 39EE9D165E
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Aug 2022 18:43:26 +0000 (UTC)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 27FI1EeB005530;
 Mon, 15 Aug 2022 18:43:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=qcppdkim1;
 bh=p8kQzWwmkE3KMqRHvpu/MqXRiD9ltGQciMmCkDrQn9Q=;
 b=I9prnWv6Yr99e+hS6QBa6IYFkQM2TKKcIh2BE4CSm7A7VcJNrbu15B7r5HqKb3sXGgr7
 VXf8Vj7QhqoPTHqgHcKkA+KRSKhLmh2G3ql6Pdu2OQhkTAyO+2IzAqlJNEcaMMg9wap5
 nM9DcTutXFwwd9rLmTHn8IHnJMM6UWWoXr1FfOWL4jJeEpKfg3yi9U/5c2eontktY2Ot
 NoQ+kLKiJsdp8Hvl8vNIS0JsuxLXOX7Q6ID5OeT0SrF1Y8l96qPn/6+XePOSKaABOrqa
 kothYh6va8PsXQE8J4wtn8fvP5pzAUOVRg8kdHyGe+rOoQvEskhmfvHqfUJ9C5yz2gea bQ== 
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3hx4qpx2my-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 15 Aug 2022 18:43:22 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 27FIhM1t028389
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 15 Aug 2022 18:43:22 GMT
Received: from jhugo-lnx.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Mon, 15 Aug 2022 11:43:21 -0700
From: Jeffrey Hugo <quic_jhugo@quicinc.com>
To: <airlied@linux.ie>, <daniel@ffwll.ch>, <maarten.lankhorst@linux.intel.com>,
 <mripard@kernel.org>, <tzimmermann@suse.de>
Subject: [RFC PATCH 12/14] drm/qaic: Add tracepoints
Date: Mon, 15 Aug 2022 12:42:34 -0600
Message-ID: <1660588956-24027-13-git-send-email-quic_jhugo@quicinc.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1660588956-24027-1-git-send-email-quic_jhugo@quicinc.com>
References: <1660588956-24027-1-git-send-email-quic_jhugo@quicinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: NqSPTkvZQCQvixCAOwq8der_Fvl0CFQP
X-Proofpoint-GUID: NqSPTkvZQCQvixCAOwq8der_Fvl0CFQP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-08-15_08,2022-08-15_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0
 lowpriorityscore=0 suspectscore=0 clxscore=1015 mlxscore=0 phishscore=0
 mlxlogscore=999 priorityscore=1501 malwarescore=0 impostorscore=0
 adultscore=0 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2207270000 definitions=main-2208150070
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
Cc: Jeffrey Hugo <quic_jhugo@quicinc.com>, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 quic_ajitpals@quicinc.com, quic_pkanojiy@quicinc.com, quic_carlv@quicinc.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add QAIC specific tracepoints which can be useful in debugging issues.

Change-Id: I8cde015990d5a3482dbba142cf0a4bbb4512cb02
Signed-off-by: Jeffrey Hugo <quic_jhugo@quicinc.com>
---
 drivers/gpu/drm/qaic/qaic_trace.h | 493 ++++++++++++++++++++++++++++++++++++++
 1 file changed, 493 insertions(+)
 create mode 100644 drivers/gpu/drm/qaic/qaic_trace.h

diff --git a/drivers/gpu/drm/qaic/qaic_trace.h b/drivers/gpu/drm/qaic/qaic_trace.h
new file mode 100644
index 0000000..0be824eb
--- /dev/null
+++ b/drivers/gpu/drm/qaic/qaic_trace.h
@@ -0,0 +1,493 @@
+/* SPDX-License-Identifier: GPL-2.0-only
+ *
+ * Copyright (c) 2020-2021, The Linux Foundation. All rights reserved.
+ * Copyright (c) 2022 Qualcomm Innovation Center, Inc. All rights reserved.
+ */
+
+#if !defined(_TRACE_QAIC_H) || defined(TRACE_HEADER_MULTI_READ)
+#define _TRACE_QAIC_H
+#include <linux/tracepoint.h>
+#include <uapi/drm/qaic_drm.h>
+
+#undef TRACE_SYSTEM
+#define TRACE_SYSTEM qaic
+#define TRACE_INCLUDE_FILE qaic_trace
+#define TRACE_INCLUDE_PATH ../../drivers/gpu/drm/qaic
+
+TRACE_EVENT(qaic_ioctl,
+	TP_PROTO(struct qaic_device *qdev, struct qaic_user *usr,
+		 unsigned int cmd, bool in),
+	TP_ARGS(qdev, usr, cmd, in),
+	TP_STRUCT__entry(
+		__string(device, dev_name(&qdev->pdev->dev))
+		__field(unsigned int, user)
+		__field(unsigned int, cmd)
+		__field(unsigned int, type)
+		__field(unsigned int, nr)
+		__field(unsigned int, size)
+		__field(unsigned int, dir)
+		__field(bool, in)
+	),
+	TP_fast_assign(
+		__assign_str(device, dev_name(&qdev->pdev->dev));
+		__entry->user =	usr->handle;
+		__entry->cmd =	cmd;
+		__entry->type =	_IOC_TYPE(cmd);
+		__entry->nr =	_IOC_NR(cmd);
+		__entry->size =	_IOC_SIZE(cmd);
+		__entry->dir =	_IOC_DIR(cmd);
+		__entry->in =	in;
+	),
+	TP_printk("%s:%s user:%d cmd:0x%x (%c nr=%d len=%d dir=%d)",
+		__entry->in ? "Entry" : "Exit", __get_str(device),
+		__entry->user, __entry->cmd, __entry->type, __entry->nr,
+		__entry->size, __entry->dir)
+);
+
+TRACE_EVENT(qaic_mhi_queue_error,
+	TP_PROTO(struct qaic_device *qdev, const char *msg, int ret),
+	TP_ARGS(qdev, msg, ret),
+	TP_STRUCT__entry(
+		__string(device, dev_name(&qdev->pdev->dev))
+		__string(msg, msg)
+		__field(int, ret)
+	),
+	TP_fast_assign(
+		__assign_str(device, dev_name(&qdev->pdev->dev));
+		__assign_str(msg, msg);
+		__entry->ret = ret;
+	),
+	TP_printk("%s %s %d",
+		__get_str(device), __get_str(msg), __entry->ret)
+);
+
+DECLARE_EVENT_CLASS(qaic_manage_error,
+	TP_PROTO(struct qaic_device *qdev, struct qaic_user *usr,
+		 const char *msg),
+	TP_ARGS(qdev, usr, msg),
+	TP_STRUCT__entry(
+		__string(device, dev_name(&qdev->pdev->dev))
+		__field(unsigned int, user)
+		__string(msg, msg)
+	),
+	TP_fast_assign(
+		__assign_str(device, dev_name(&qdev->pdev->dev));
+		__entry->user =	usr->handle;
+		__assign_str(msg, msg);
+	),
+	TP_printk("%s user:%d %s",
+		  __get_str(device), __entry->user, __get_str(msg))
+);
+
+DEFINE_EVENT(qaic_manage_error, manage_error,
+	TP_PROTO(struct qaic_device *qdev, struct qaic_user *usr,
+		 const char *msg),
+	TP_ARGS(qdev, usr, msg)
+);
+
+DECLARE_EVENT_CLASS(qaic_encdec_error,
+	TP_PROTO(struct qaic_device *qdev, const char *msg),
+	TP_ARGS(qdev, msg),
+	TP_STRUCT__entry(
+		__string(device, dev_name(&qdev->pdev->dev))
+		__string(msg, msg)
+	),
+	TP_fast_assign(
+		__assign_str(device, dev_name(&qdev->pdev->dev));
+		__assign_str(msg, msg);
+	),
+	TP_printk("%s %s", __get_str(device), __get_str(msg))
+);
+
+DEFINE_EVENT(qaic_encdec_error, encode_error,
+	TP_PROTO(struct qaic_device *qdev, const char *msg),
+	TP_ARGS(qdev, msg)
+);
+
+DEFINE_EVENT(qaic_encdec_error, decode_error,
+	TP_PROTO(struct qaic_device *qdev, const char *msg),
+	TP_ARGS(qdev, msg)
+);
+
+TRACE_EVENT(qaic_control_dbg,
+	TP_PROTO(struct qaic_device *qdev, const char *msg, int ret),
+	TP_ARGS(qdev, msg, ret),
+	TP_STRUCT__entry(
+		__string(device, dev_name(&qdev->pdev->dev))
+		__string(msg, msg)
+		__field(int, ret)
+	),
+	TP_fast_assign(
+		__assign_str(device, dev_name(&qdev->pdev->dev));
+		__assign_str(msg, msg);
+		__entry->ret = ret;
+	),
+	TP_printk("%s %s %d",
+		  __get_str(device), __get_str(msg), __entry->ret)
+);
+
+TRACE_EVENT(qaic_encode_passthrough,
+	TP_PROTO(struct qaic_device *qdev,
+		 struct qaic_manage_trans_passthrough *in_trans),
+	TP_ARGS(qdev, in_trans),
+	TP_STRUCT__entry(
+		__string(device, dev_name(&qdev->pdev->dev))
+		__field(__u32, len)
+	),
+	TP_fast_assign(
+		__assign_str(device, dev_name(&qdev->pdev->dev));
+		__entry->len = in_trans->hdr.len;
+	),
+	TP_printk("%s len %u", __get_str(device), __entry->len)
+);
+
+TRACE_EVENT(qaic_encode_dma,
+	TP_PROTO(struct qaic_device *qdev,
+		 struct qaic_manage_trans_dma_xfer *in_trans),
+	TP_ARGS(qdev, in_trans),
+	TP_STRUCT__entry(
+		__string(device, dev_name(&qdev->pdev->dev))
+		__field(__u32, len)
+		__field(__u32, tag)
+		__field(__u32, count)
+		__field(__u64, addr)
+		__field(__u64, size)
+	),
+	TP_fast_assign(
+		__assign_str(device, dev_name(&qdev->pdev->dev));
+		__entry->len = in_trans->hdr.len;
+		__entry->tag = in_trans->tag;
+		__entry->count = in_trans->count;
+		__entry->addr = in_trans->addr;
+		__entry->size = in_trans->size;
+	),
+	TP_printk("%s len %u tag %u count %u address 0x%llx size %llu",
+		  __get_str(device), __entry->len, __entry->tag, __entry->count,
+		  __entry->addr, __entry->size)
+);
+
+TRACE_EVENT(qaic_encode_activate,
+	TP_PROTO(struct qaic_device *qdev,
+		 struct qaic_manage_trans_activate_to_dev *in_trans),
+	TP_ARGS(qdev, in_trans),
+	TP_STRUCT__entry(
+		__string(device, dev_name(&qdev->pdev->dev))
+		__field(__u32, len)
+		__field(__u32, queue_size)
+		__field(__u32, eventfd)
+		__field(__u32, options)
+		__field(__u32, pad)
+	),
+	TP_fast_assign(
+		__assign_str(device, dev_name(&qdev->pdev->dev));
+		__entry->len = in_trans->hdr.len;
+		__entry->queue_size = in_trans->queue_size;
+		__entry->eventfd = in_trans->eventfd;
+		__entry->options = in_trans->options;
+		__entry->pad = in_trans->pad;
+	),
+	TP_printk("%s len %u queue_size %u eventfd %u options %u pad %u",
+		  __get_str(device), __entry->len, __entry->queue_size,
+		  __entry->eventfd, __entry->options, __entry->pad)
+);
+
+TRACE_EVENT(qaic_encode_deactivate,
+	TP_PROTO(struct qaic_device *qdev,
+		 struct qaic_manage_trans_deactivate *in_trans),
+	TP_ARGS(qdev, in_trans),
+	TP_STRUCT__entry(
+		__string(device, dev_name(&qdev->pdev->dev))
+		__field(__u32, len)
+		__field(__u32, dbc_id)
+	),
+	TP_fast_assign(
+		__assign_str(device, dev_name(&qdev->pdev->dev));
+		__entry->len = in_trans->hdr.len;
+		__entry->dbc_id = in_trans->dbc_id;
+	),
+	TP_printk("%s len %u dbc_id %u",
+		  __get_str(device), __entry->len, __entry->dbc_id)
+);
+
+TRACE_EVENT(qaic_encode_status,
+	TP_PROTO(struct qaic_device *qdev,
+		 struct qaic_manage_trans_status_to_dev *in_trans),
+	TP_ARGS(qdev, in_trans),
+	TP_STRUCT__entry(
+		__string(device, dev_name(&qdev->pdev->dev))
+		__field(__u32, len)
+	),
+	TP_fast_assign(
+		__assign_str(device, dev_name(&qdev->pdev->dev));
+		__entry->len = in_trans->hdr.len;
+	),
+	TP_printk("%s len %u", __get_str(device), __entry->len)
+);
+
+TRACE_EVENT(qaic_decode_passthrough,
+	TP_PROTO(struct qaic_device *qdev,
+		 struct qaic_manage_trans_passthrough *out_trans),
+	TP_ARGS(qdev, out_trans),
+	TP_STRUCT__entry(
+		__string(device, dev_name(&qdev->pdev->dev))
+		__field(__u32, len)
+	),
+	TP_fast_assign(
+		__assign_str(device, dev_name(&qdev->pdev->dev));
+		__entry->len = out_trans->hdr.len;
+	),
+	TP_printk("%s len %u", __get_str(device), __entry->len)
+);
+
+TRACE_EVENT(qaic_decode_activate,
+	TP_PROTO(struct qaic_device *qdev,
+		struct qaic_manage_trans_activate_from_dev *out_trans),
+	TP_ARGS(qdev, out_trans),
+	TP_STRUCT__entry(
+		__string(device, dev_name(&qdev->pdev->dev))
+		__field(__u32, len)
+		__field(__u32, status)
+		__field(__u32, dbc_id)
+		__field(__u64, options)
+	),
+	TP_fast_assign(
+		__assign_str(device, dev_name(&qdev->pdev->dev));
+		__entry->len = out_trans->hdr.len;
+		__entry->status = out_trans->status;
+		__entry->dbc_id = out_trans->dbc_id;
+		__entry->options = out_trans->options;
+	),
+	TP_printk("%s len %u status %u dbc_id %u options %llu",
+		  __get_str(device), __entry->len, __entry->status,
+		  __entry->dbc_id, __entry->options)
+);
+
+TRACE_EVENT(qaic_decode_deactivate,
+	TP_PROTO(struct qaic_device *qdev, u32 dbc_id, u32 status),
+	TP_ARGS(qdev, dbc_id, status),
+	TP_STRUCT__entry(
+		__string(device, dev_name(&qdev->pdev->dev))
+		__field(u32, dbc_id)
+		__field(u32, status)
+	),
+	TP_fast_assign(
+		__assign_str(device, dev_name(&qdev->pdev->dev));
+		__entry->dbc_id = dbc_id;
+		__entry->status = status;
+	),
+	TP_printk("%s dbc_id %u status %u",
+		  __get_str(device), __entry->dbc_id, __entry->status)
+);
+
+TRACE_EVENT(qaic_decode_status,
+	TP_PROTO(struct qaic_device *qdev,
+		 struct qaic_manage_trans_status_from_dev *out_trans),
+	TP_ARGS(qdev, out_trans),
+	TP_STRUCT__entry(
+		__string(device, dev_name(&qdev->pdev->dev))
+		__field(__u32, len)
+		__field(__u16, major)
+		__field(__u16, minor)
+		__field(__u32, status)
+		__field(__u64, status_flags)
+	),
+	TP_fast_assign(
+		__assign_str(device, dev_name(&qdev->pdev->dev));
+		__entry->len = out_trans->hdr.len;
+		__entry->major = out_trans->major;
+		__entry->minor = out_trans->minor;
+		__entry->status = out_trans->status;
+		__entry->status_flags = out_trans->status_flags;
+	),
+	TP_printk("%s len %u major %u minor %u status %u flags 0x%llx",
+		  __get_str(device), __entry->len, __entry->major, __entry->minor,
+		  __entry->status, __entry->status_flags)
+);
+
+DECLARE_EVENT_CLASS(qaic_data_err,
+	TP_PROTO(struct qaic_device *qdev, const char *msg, int ret),
+	TP_ARGS(qdev, msg, ret),
+	TP_STRUCT__entry(
+		__string(device, dev_name(&qdev->pdev->dev))
+		__string(msg, msg)
+		__field(int, ret)
+	),
+	TP_fast_assign(
+		__assign_str(device, dev_name(&qdev->pdev->dev));
+		__assign_str(msg, msg);
+		__entry->ret = ret;
+	),
+	TP_printk("%s %s %d", __get_str(device), __get_str(msg), __entry->ret)
+);
+
+DEFINE_EVENT(qaic_data_err, qaic_mem_err,
+	TP_PROTO(struct qaic_device *qdev, const char *msg, int ret),
+	TP_ARGS(qdev, msg, ret)
+);
+
+DEFINE_EVENT(qaic_data_err, qaic_mmap_err,
+	TP_PROTO(struct qaic_device *qdev, const char *msg, int ret),
+	TP_ARGS(qdev, msg, ret)
+);
+
+DEFINE_EVENT(qaic_data_err, qaic_exec_err,
+	TP_PROTO(struct qaic_device *qdev, const char *msg, int ret),
+	TP_ARGS(qdev, msg, ret)
+);
+
+DEFINE_EVENT(qaic_data_err, qaic_wait_err,
+	TP_PROTO(struct qaic_device *qdev, const char *msg, int ret),
+	TP_ARGS(qdev, msg, ret)
+);
+
+DEFINE_EVENT(qaic_data_err, qaic_stats_err,
+	TP_PROTO(struct qaic_device *qdev, const char *msg, int ret),
+	TP_ARGS(qdev, msg, ret)
+);
+
+DEFINE_EVENT(qaic_data_err, qaic_util_err,
+	TP_PROTO(struct qaic_device *qdev, const char *msg, int ret),
+	TP_ARGS(qdev, msg, ret)
+);
+
+DEFINE_EVENT(qaic_data_err, qaic_attach_err,
+	TP_PROTO(struct qaic_device *qdev, const char *msg, int ret),
+	TP_ARGS(qdev, msg, ret)
+);
+
+DECLARE_EVENT_CLASS(qaic_data_err_1,
+	TP_PROTO(struct qaic_device *qdev, const char *msg, const char *msg_var1,
+		 int ret, u64 var1),
+	TP_ARGS(qdev, msg, msg_var1, ret, var1),
+	TP_STRUCT__entry(
+		__string(device, dev_name(&qdev->pdev->dev))
+		__string(msg, msg)
+		__string(msg_var1, msg_var1)
+		__field(int, ret)
+		__field(u64, var1)
+	),
+	TP_fast_assign(
+		__assign_str(device, dev_name(&qdev->pdev->dev));
+		__assign_str(msg, msg);
+		__assign_str(msg_var1, msg_var1);
+		__entry->ret = ret;
+		__entry->var1 = var1;
+	),
+	TP_printk("%s %s Error:%d %s:%llu",
+		  __get_str(device), __get_str(msg), __entry->ret,
+		  __get_str(msg_var1), __entry->var1)
+);
+
+DEFINE_EVENT(qaic_data_err_1, qaic_mem_err_1,
+	TP_PROTO(struct qaic_device *qdev, const char *msg, const char *msg_var1,
+		 int ret, u64 var1),
+	TP_ARGS(qdev, msg, msg_var1, ret, var1)
+);
+
+DEFINE_EVENT(qaic_data_err_1, qaic_mmap_err_1,
+	TP_PROTO(struct qaic_device *qdev, const char *msg, const char *msg_var1,
+		 int ret, u64 var1),
+	TP_ARGS(qdev, msg, msg_var1, ret, var1)
+);
+
+DEFINE_EVENT(qaic_data_err_1, qaic_attach_err_1,
+	TP_PROTO(struct qaic_device *qdev, const char *msg, const char *msg_var1,
+		 int ret, u64 var1),
+	TP_ARGS(qdev, msg, msg_var1, ret, var1)
+);
+
+DEFINE_EVENT(qaic_data_err_1, qaic_exec_err_1,
+	TP_PROTO(struct qaic_device *qdev, const char *msg, const char *msg_var1,
+		 int ret, u64 var1),
+	TP_ARGS(qdev, msg, msg_var1, ret, var1)
+);
+
+DEFINE_EVENT(qaic_data_err_1, qaic_wait_err_1,
+	TP_PROTO(struct qaic_device *qdev, const char *msg, const char *msg_var1,
+		 int ret, u64 var1),
+	TP_ARGS(qdev, msg, msg_var1, ret, var1)
+);
+
+DEFINE_EVENT(qaic_data_err_1, qaic_stats_err_1,
+	TP_PROTO(struct qaic_device *qdev, const char *msg, const char *msg_var1,
+		 int ret, u64 var1),
+	TP_ARGS(qdev, msg, msg_var1, ret, var1)
+);
+
+DECLARE_EVENT_CLASS(qaic_data_err_2,
+	TP_PROTO(struct qaic_device *qdev, const char *msg, const char *msg_var1,
+		 const char *msg_var2, int ret, u64 var1, u64 var2),
+	TP_ARGS(qdev, msg, msg_var1, msg_var2, ret, var1, var2),
+	TP_STRUCT__entry(
+		__string(device, dev_name(&qdev->pdev->dev))
+		__string(msg, msg)
+		__string(msg_var1, msg_var1)
+		__string(msg_var2, msg_var2)
+		__field(int, ret)
+		__field(u64, var1)
+		__field(u64, var2)
+	),
+	TP_fast_assign(
+		__assign_str(device, dev_name(&qdev->pdev->dev));
+		__assign_str(msg, msg);
+		__assign_str(msg_var1, msg_var1);
+		__assign_str(msg_var2, msg_var2);
+		__entry->ret = ret;
+		__entry->var1 = var1;
+		__entry->var2 = var2;
+	),
+	TP_printk("%s %s Error:%d %s:%llu %s:%llu",
+		  __get_str(device), __get_str(msg), __entry->ret,
+		  __get_str(msg_var1), __entry->var1,
+		  __get_str(msg_var2), __entry->var2)
+);
+
+DEFINE_EVENT(qaic_data_err_2, qaic_mem_err_2,
+	TP_PROTO(struct qaic_device *qdev, const char *msg, const char *msg_var1,
+		 const char *msg_var2, int ret, u64 var1, u64 var2),
+	TP_ARGS(qdev, msg, msg_var1, msg_var2, ret, var1, var2)
+);
+
+DEFINE_EVENT(qaic_data_err_2, qaic_attach_err_2,
+	TP_PROTO(struct qaic_device *qdev, const char *msg, const char *msg_var1,
+		 const char *msg_var2, int ret, u64 var1, u64 var2),
+	TP_ARGS(qdev, msg, msg_var1, msg_var2, ret, var1, var2)
+);
+
+DEFINE_EVENT(qaic_data_err_2, qaic_exec_err_2,
+	TP_PROTO(struct qaic_device *qdev, const char *msg, const char *msg_var1,
+		 const char *msg_var2, int ret, u64 var1, u64 var2),
+	TP_ARGS(qdev, msg, msg_var1, msg_var2, ret, var1, var2)
+);
+
+DECLARE_EVENT_CLASS(qaic_ssr,
+	TP_PROTO(struct qaic_device *qdev, const char *msg),
+	TP_ARGS(qdev, msg),
+	TP_STRUCT__entry(
+		__string(device, dev_name(&qdev->pdev->dev))
+		__string(msg, msg)
+	),
+	TP_fast_assign(
+		__assign_str(device, dev_name(&qdev->pdev->dev));
+		__assign_str(msg, msg);
+	),
+	TP_printk("%s %s", __get_str(device), __get_str(msg))
+);
+
+DEFINE_EVENT(qaic_ssr, qaic_ssr_cmd,
+	TP_PROTO(struct qaic_device *qdev, const char *msg),
+	TP_ARGS(qdev, msg)
+);
+
+DEFINE_EVENT(qaic_ssr, qaic_ssr_event,
+	TP_PROTO(struct qaic_device *qdev, const char *msg),
+	TP_ARGS(qdev, msg)
+);
+
+DEFINE_EVENT(qaic_ssr, qaic_ssr_dump,
+	TP_PROTO(struct qaic_device *qdev, const char *msg),
+	TP_ARGS(qdev, msg)
+);
+
+#endif /* _TRACE_QAIC_H */
+#include <trace/define_trace.h>
-- 
2.7.4

