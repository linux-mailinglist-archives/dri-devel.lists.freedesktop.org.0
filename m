Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 631AFB0823C
	for <lists+dri-devel@lfdr.de>; Thu, 17 Jul 2025 03:26:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1FADF10E16D;
	Thu, 17 Jul 2025 01:26:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mxhk.zte.com.cn (mxhk.zte.com.cn [160.30.148.35])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CAFC110E16D
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Jul 2025 01:26:08 +0000 (UTC)
Received: from mse-fl2.zte.com.cn (unknown [10.5.228.133])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mxhk.zte.com.cn (FangMail) with ESMTPS id 4bjFcX5h0Vz8Xs6x;
 Thu, 17 Jul 2025 09:26:04 +0800 (CST)
Received: from xaxapp04.zte.com.cn ([10.99.98.157])
 by mse-fl2.zte.com.cn with SMTP id 56H1PoN0037389;
 Thu, 17 Jul 2025 09:25:50 +0800 (+08)
 (envelope-from jiang.peng9@zte.com.cn)
Received: from mapi (xaxapp01[null]) by mapi (Zmail) with MAPI id mid31;
 Thu, 17 Jul 2025 09:25:51 +0800 (CST)
Date: Thu, 17 Jul 2025 09:25:51 +0800 (CST)
X-Zmail-TransId: 2af96878511fffffffffe78-dc0f4
X-Mailer: Zmail v1.0
Message-ID: <20250717092551456yMDDlrv0yFKFOsnqotOlG@zte.com.cn>
In-Reply-To: <20250716095046-mutt-send-email-mst@kernel.org>
References: 20250705105803198ff11jYCkg1TxntcCEb00R@zte.com.cn,
 20250716095046-mutt-send-email-mst@kernel.org
Mime-Version: 1.0
From: <jiang.peng9@zte.com.cn>
To: <mst@redhat.com>
Cc: <jasowang@redhat.com>, <krzk@kernel.org>, <xuanzhuo@linux.alibaba.com>,
 <eperezma@redhat.com>, <sumit.semwal@linaro.org>,
 <christian.koenig@amd.com>, <virtualization@lists.linux.dev>,
 <linux-kernel@vger.kernel.org>, <linux-media@vger.kernel.org>,
 <dri-devel@lists.freedesktop.org>, <xu.xin16@zte.com.cn>,
 <yang.yang29@zte.com.cn>
Subject: =?UTF-8?B?UmU6IFtQQVRDSCB2Ml0gdmlydGlvOiBVcGRhdGUga2VybmVsZG9jIGluIGRyaXZlcnMvdmlydGlvL3ZpcnRpb19kbWFfYnVmLmM=?=
Content-Type: text/plain;
	charset="UTF-8"
X-MAIL: mse-fl2.zte.com.cn 56H1PoN0037389
X-TLS: YES
X-SPF-DOMAIN: zte.com.cn
X-ENVELOPE-SENDER: jiang.peng9@zte.com.cn
X-SPF: None
X-SOURCE-IP: 10.5.228.133 unknown Thu, 17 Jul 2025 09:26:04 +0800
X-Fangmail-Anti-Spam-Filtered: true
X-Fangmail-MID-QID: 6878512C.000/4bjFcX5h0Vz8Xs6x
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

> The extra documentation unfortunately just mechanically repeats what the
> code does. Code comments should explain the reasoning behind the code,
> instead.

Thanks for the helpful feedback - I appreciate you taking the time to review this.

In v3 I'll:

1.Remove the parentheses from function names to match virtio conventions;

2.Simplify all descriptions to focus on purpose rather than repeating code mechanics;

3.Consolidate return value documentation to essential information only.

The revised patch will maintain W=1 warning fixes while aligning with the kernel's documentation philosophy. I'll send the update shortly.

Best regards,
Peng Jiang
