Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A391603AED
	for <lists+dri-devel@lfdr.de>; Wed, 19 Oct 2022 09:48:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8AC2D10E395;
	Wed, 19 Oct 2022 07:48:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from szxga01-in.huawei.com (szxga01-in.huawei.com [45.249.212.187])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A0F2010E395;
 Wed, 19 Oct 2022 07:48:36 +0000 (UTC)
Received: from kwepemi500008.china.huawei.com (unknown [172.30.72.57])
 by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4MsjQr6fcdzmV8R;
 Wed, 19 Oct 2022 15:43:48 +0800 (CST)
Received: from huawei.com (10.67.175.83) by kwepemi500008.china.huawei.com
 (7.221.188.139) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.31; Wed, 19 Oct
 2022 15:48:32 +0800
From: ruanjinjie <ruanjinjie@huawei.com>
To: <harry.wentland@amd.com>, <sunpeng.li@amd.com>,
 <Rodrigo.Siqueira@amd.com>, <alexander.deucher@amd.com>,
 <christian.koenig@amd.com>, <Xinhui.Pan@amd.com>, <airlied@gmail.com>,
 <daniel@ffwll.ch>, <qingqing.zhuo@amd.com>, <agustin.gutierrez@amd.com>,
 <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>
Subject: [PATCH -next] drm/amd/display: Make some symbols static
Date: Wed, 19 Oct 2022 15:45:02 +0800
Message-ID: <20221019074502.4048521-1-ruanjinjie@huawei.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.67.175.83]
X-ClientProxiedBy: dggems706-chm.china.huawei.com (10.3.19.183) To
 kwepemi500008.china.huawei.com (7.221.188.139)
X-CFilter-Loop: Reflected
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
Cc: ruanjinjie@huawei.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

These symbols qp_table_422_10bpc_min, qp_table_444_8bpc_max,
qp_table_420_12bpc_max, qp_table_444_10bpc_min, qp_table_420_8bpc_max,
qp_table_444_8bpc_min, qp_table_444_12bpc_min, qp_table_420_12bpc_min,
qp_table_422_12bpc_min, qp_table_422_12bpc_max, qp_table_444_12bpc_max,
qp_table_420_8bpc_min, qp_table_422_8bpc_min, qp_table_422_10bpc_max,
qp_table_420_10bpc_max, qp_table_420_10bpc_min, qp_table_444_10bpc_max,
qp_table_422_8bpc_max are not used outside of the file,
so mark them static.

./drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dsc/qp_tables.h:28:18: warning:
symbol 'qp_table_422_10bpc_min' was not declared. Should it be static?

./drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dsc/qp_tables.h:61:18: warning:
symbol 'qp_table_444_8bpc_max' was not declared. Should it be static?

./drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dsc/qp_tables.h:102:18: warning:
symbol 'qp_table_420_12bpc_max' was not declared. Should it be static?

./drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dsc/qp_tables.h:135:18: warning:
symbol 'qp_table_444_10bpc_min' was not declared. Should it be static?

./drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dsc/qp_tables.h:188:18: warning:
symbol 'qp_table_420_8bpc_max' was not declared. Should it be static?

./drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dsc/qp_tables.h:209:18: warning:
symbol 'qp_table_444_8bpc_min' was not declared. Should it be static?

./drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dsc/qp_tables.h:250:18: warning:
symbol 'qp_table_444_12bpc_min' was not declared. Should it be static?

./drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dsc/qp_tables.h:315:18: warning:
symbol 'qp_table_420_12bpc_min' was not declared. Should it be static?

./drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dsc/qp_tables.h:348:18: warning:
symbol 'qp_table_422_12bpc_min' was not declared. Should it be static?

./drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dsc/qp_tables.h:389:18: warning:
symbol 'qp_table_422_12bpc_max' was not declared. Should it be static?

./drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dsc/qp_tables.h:430:18: warning:
symbol 'qp_table_444_12bpc_max' was not declared. Should it be static?

./drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dsc/qp_tables.h:495:18: warning:
symbol 'qp_table_420_8bpc_min' was not declared. Should it be static?

./drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dsc/qp_tables.h:516:18: warning:
symbol 'qp_table_422_8bpc_min' was not declared. Should it be static?

./drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dsc/qp_tables.h:541:18: warning:
symbol 'qp_table_422_10bpc_max' was not declared. Should it be static?

./drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dsc/qp_tables.h:574:16: warning:
symbol 'qp_table_420_10bpc_max' was not declared. Should it be static?

./drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dsc/qp_tables.h:601:18: warning:
symbol 'qp_table_420_10bpc_min' was not declared. Should it be static?

./drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dsc/qp_tables.h:628:18: warning:
symbol 'qp_table_444_10bpc_max' was not declared. Should it be static?

./drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dsc/qp_tables.h:681:18: warning:
symbol 'qp_table_422_8bpc_max' was not declared. Should it be static?

Signed-off-by: ruanjinjie <ruanjinjie@huawei.com>
---
 .../drm/amd/display/dc/dml/dsc/qp_tables.h    | 36 +++++++++----------
 1 file changed, 18 insertions(+), 18 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/dc/dml/dsc/qp_tables.h b/drivers/gpu/drm/amd/display/dc/dml/dsc/qp_tables.h
index e5fac9f4181d..dcff0dd2b6a1 100644
--- a/drivers/gpu/drm/amd/display/dc/dml/dsc/qp_tables.h
+++ b/drivers/gpu/drm/amd/display/dc/dml/dsc/qp_tables.h
@@ -25,7 +25,7 @@
  */
 
 
-const qp_table   qp_table_422_10bpc_min = {
+static const qp_table   qp_table_422_10bpc_min = {
 	{   6, { 0, 4, 5, 6, 6, 6, 6, 7, 7, 8, 9, 9, 9, 12, 16} },
 	{ 6.5, { 0, 4, 5, 6, 6, 6, 6, 7, 7, 8, 9, 9, 9, 12, 16} },
 	{   7, { 0, 4, 5, 6, 6, 6, 6, 7, 7, 7, 9, 9, 9, 11, 15} },
@@ -58,7 +58,7 @@ const qp_table   qp_table_422_10bpc_min = {
 };
 
 
-const qp_table   qp_table_444_8bpc_max = {
+static const qp_table   qp_table_444_8bpc_max = {
 	{   6, { 4, 6, 8, 8, 9, 9, 9, 10, 11, 12, 12, 12, 12, 13, 15} },
 	{ 6.5, { 4, 6, 7, 8, 8, 8, 9, 10, 11, 11, 12, 12, 12, 13, 15} },
 	{   7, { 4, 5, 7, 7, 8, 8, 8, 9, 10, 11, 11, 12, 12, 13, 14} },
@@ -99,7 +99,7 @@ const qp_table   qp_table_444_8bpc_max = {
 };
 
 
-const qp_table   qp_table_420_12bpc_max = {
+static const qp_table   qp_table_420_12bpc_max = {
 	{   4, {11, 12, 13, 14, 15, 15, 15, 16, 17, 18, 18, 19, 19, 21, 22} },
 	{ 4.5, {10, 11, 12, 13, 14, 15, 15, 16, 17, 18, 18, 19, 19, 20, 21} },
 	{   5, { 9, 11, 12, 13, 14, 15, 15, 16, 17, 17, 18, 18, 19, 20, 21} },
@@ -132,7 +132,7 @@ const qp_table   qp_table_420_12bpc_max = {
 };
 
 
-const qp_table   qp_table_444_10bpc_min = {
+static const qp_table   qp_table_444_10bpc_min = {
 	{   6, { 0, 4, 7, 7, 9, 9, 9, 9, 9, 10, 10, 10, 10, 12, 18} },
 	{ 6.5, { 0, 4, 6, 7, 8, 8, 9, 9, 9, 9, 10, 10, 10, 12, 18} },
 	{   7, { 0, 4, 6, 6, 8, 8, 8, 8, 8, 9, 9, 10, 10, 12, 17} },
@@ -185,7 +185,7 @@ const qp_table   qp_table_444_10bpc_min = {
 };
 
 
-const qp_table   qp_table_420_8bpc_max = {
+static const qp_table   qp_table_420_8bpc_max = {
 	{   4, { 4, 4, 5, 6, 7, 7, 7, 8, 9, 10, 10, 11, 11, 13, 14} },
 	{ 4.5, { 4, 4, 5, 6, 7, 7, 7, 8, 9, 10, 10, 11, 11, 12, 13} },
 	{   5, { 3, 4, 5, 6, 7, 7, 7, 8, 9, 9, 10, 10, 11, 12, 13} },
@@ -206,7 +206,7 @@ const qp_table   qp_table_420_8bpc_max = {
 };
 
 
-const qp_table   qp_table_444_8bpc_min = {
+static const qp_table   qp_table_444_8bpc_min = {
 	{   6, { 0, 1, 3, 3, 5, 5, 5, 5, 5, 6, 6, 6, 6, 9, 14} },
 	{ 6.5, { 0, 1, 2, 3, 4, 4, 5, 5, 5, 5, 6, 6, 6, 9, 14} },
 	{   7, { 0, 0, 2, 2, 4, 4, 4, 4, 4, 5, 5, 6, 6, 9, 13} },
@@ -247,7 +247,7 @@ const qp_table   qp_table_444_8bpc_min = {
 };
 
 
-const qp_table   qp_table_444_12bpc_min = {
+static const qp_table   qp_table_444_12bpc_min = {
 	{   6, { 0, 5, 11, 11, 13, 13, 13, 13, 13, 14, 14, 14, 14, 17, 22} },
 	{ 6.5, { 0, 5, 10, 11, 12, 12, 13, 13, 13, 13, 14, 14, 14, 17, 22} },
 	{   7, { 0, 5, 10, 10, 12, 12, 12, 12, 12, 13, 13, 14, 14, 17, 21} },
@@ -312,7 +312,7 @@ const qp_table   qp_table_444_12bpc_min = {
 };
 
 
-const qp_table   qp_table_420_12bpc_min = {
+static const qp_table   qp_table_420_12bpc_min = {
 	{   4, { 0, 4, 9, 10, 11, 11, 11, 11, 11, 11, 13, 13, 13, 15, 21} },
 	{ 4.5, { 0, 4, 8, 9, 10, 11, 11, 11, 11, 11, 13, 13, 13, 15, 20} },
 	{   5, { 0, 4, 8, 9, 10, 11, 11, 11, 11, 11, 13, 13, 13, 15, 20} },
@@ -345,7 +345,7 @@ const qp_table   qp_table_420_12bpc_min = {
 };
 
 
-const qp_table   qp_table_422_12bpc_min = {
+static const qp_table   qp_table_422_12bpc_min = {
 	{   6, { 0, 4, 9, 10, 11, 11, 11, 11, 11, 11, 13, 13, 13, 16, 20} },
 	{ 6.5, { 0, 4, 9, 10, 11, 11, 11, 11, 11, 11, 13, 13, 13, 16, 20} },
 	{   7, { 0, 4, 9, 10, 11, 11, 11, 11, 11, 11, 13, 13, 13, 15, 19} },
@@ -386,7 +386,7 @@ const qp_table   qp_table_422_12bpc_min = {
 };
 
 
-const qp_table   qp_table_422_12bpc_max = {
+static const qp_table   qp_table_422_12bpc_max = {
 	{   6, {12, 12, 13, 14, 15, 15, 15, 16, 17, 18, 18, 19, 19, 20, 21} },
 	{ 6.5, {12, 12, 13, 14, 15, 15, 15, 16, 17, 18, 18, 19, 19, 20, 21} },
 	{   7, {11, 12, 13, 14, 15, 15, 15, 16, 17, 17, 18, 18, 19, 19, 20} },
@@ -427,7 +427,7 @@ const qp_table   qp_table_422_12bpc_max = {
 };
 
 
-const qp_table   qp_table_444_12bpc_max = {
+static const qp_table   qp_table_444_12bpc_max = {
 	{   6, {12, 14, 16, 16, 17, 17, 17, 18, 19, 20, 20, 20, 20, 21, 23} },
 	{ 6.5, {12, 14, 15, 16, 16, 16, 17, 18, 19, 19, 20, 20, 20, 21, 23} },
 	{   7, {12, 13, 15, 15, 16, 16, 16, 17, 18, 19, 19, 20, 20, 21, 22} },
@@ -492,7 +492,7 @@ const qp_table   qp_table_444_12bpc_max = {
 };
 
 
-const qp_table   qp_table_420_8bpc_min = {
+static const qp_table   qp_table_420_8bpc_min = {
 	{   4, { 0, 0, 1, 1, 3, 3, 3, 3, 3, 3, 5, 5, 5, 9, 13} },
 	{ 4.5, { 0, 0, 1, 1, 3, 3, 3, 3, 3, 3, 5, 5, 5, 8, 12} },
 	{   5, { 0, 0, 1, 1, 3, 3, 3, 3, 3, 3, 5, 5, 5, 8, 12} },
@@ -513,7 +513,7 @@ const qp_table   qp_table_420_8bpc_min = {
 };
 
 
-const qp_table   qp_table_422_8bpc_min = {
+static const qp_table   qp_table_422_8bpc_min = {
 	{   6, { 0, 0, 1, 2, 3, 3, 3, 3, 3, 3, 5, 5, 5, 8, 12} },
 	{ 6.5, { 0, 0, 1, 2, 3, 3, 3, 3, 3, 3, 5, 5, 5, 8, 12} },
 	{   7, { 0, 0, 1, 2, 3, 3, 3, 3, 3, 3, 5, 5, 5, 7, 11} },
@@ -538,7 +538,7 @@ const qp_table   qp_table_422_8bpc_min = {
 };
 
 
-const qp_table   qp_table_422_10bpc_max = {
+static const qp_table   qp_table_422_10bpc_max = {
 	{   6, { 8, 8, 9, 10, 11, 11, 11, 12, 13, 14, 14, 15, 15, 16, 17} },
 	{ 6.5, { 8, 8, 9, 10, 11, 11, 11, 12, 13, 14, 14, 15, 15, 16, 17} },
 	{   7, { 7, 8, 9, 10, 11, 11, 11, 12, 13, 13, 14, 14, 15, 15, 16} },
@@ -571,7 +571,7 @@ const qp_table   qp_table_422_10bpc_max = {
 };
 
 
-const qp_table qp_table_420_10bpc_max = {
+static const qp_table qp_table_420_10bpc_max = {
 	{   4, { 8, 8, 9, 10, 11, 11, 11, 12, 13, 14, 14, 15, 15, 17, 18} },
 	{ 4.5, { 8, 8, 9, 10, 11, 11, 11, 12, 13, 14, 14, 15, 15, 16, 17} },
 	{   5, { 7, 8, 9, 10, 11, 11, 11, 12, 13, 13, 14, 14, 15, 16, 17} },
@@ -598,7 +598,7 @@ const qp_table qp_table_420_10bpc_max = {
 };
 
 
-const qp_table   qp_table_420_10bpc_min = {
+static const qp_table   qp_table_420_10bpc_min = {
 	{   4, { 0, 4, 4, 5, 7, 7, 7, 7, 7, 7, 9, 9, 9, 13, 17} },
 	{ 4.5, { 0, 4, 4, 5, 7, 7, 7, 7, 7, 7, 9, 9, 9, 12, 16} },
 	{   5, { 0, 4, 4, 5, 7, 7, 7, 7, 7, 7, 9, 9, 9, 12, 16} },
@@ -625,7 +625,7 @@ const qp_table   qp_table_420_10bpc_min = {
 };
 
 
-const qp_table   qp_table_444_10bpc_max = {
+static const qp_table   qp_table_444_10bpc_max = {
 	{   6, { 8, 10, 12, 12, 13, 13, 13, 14, 15, 16, 16, 16, 16, 17, 19} },
 	{ 6.5, { 8, 10, 11, 12, 12, 12, 13, 14, 15, 15, 16, 16, 16, 17, 19} },
 	{   7, { 8, 9, 11, 11, 12, 12, 12, 13, 14, 15, 15, 16, 16, 17, 18} },
@@ -678,7 +678,7 @@ const qp_table   qp_table_444_10bpc_max = {
 };
 
 
-const qp_table   qp_table_422_8bpc_max = {
+static const qp_table   qp_table_422_8bpc_max = {
 	{   6, { 4, 4, 5, 6, 7, 7, 7, 8, 9, 10, 10, 11, 11, 12, 13} },
 	{ 6.5, { 4, 4, 5, 6, 7, 7, 7, 8, 9, 10, 10, 11, 11, 12, 13} },
 	{   7, { 3, 4, 5, 6, 7, 7, 7, 8, 9, 9, 10, 10, 11, 11, 12} },
-- 
2.25.1

