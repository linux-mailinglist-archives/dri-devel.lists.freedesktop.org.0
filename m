Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5502E22EB02
	for <lists+dri-devel@lfdr.de>; Mon, 27 Jul 2020 13:18:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6582F89B83;
	Mon, 27 Jul 2020 11:18:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from aserp2120.oracle.com (aserp2120.oracle.com [141.146.126.78])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8859289B83
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Jul 2020 11:18:35 +0000 (UTC)
Received: from pps.filterd (aserp2120.oracle.com [127.0.0.1])
 by aserp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 06RBBYkv075682;
 Mon, 27 Jul 2020 11:18:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=date : from : to : cc
 : subject : message-id : mime-version : content-type; s=corp-2020-01-29;
 bh=CW7CisCspEvmGQA5eKVvGEMkI+QfepNMKTZ5Xq6e9Tg=;
 b=L8CiPDjBVAGMRid6OeWssVHBC0hzE6NX6wN1Z39E7X1Z2w/HUrkI92t4Uz1xEPtnj8dE
 ssBH1onVuZExFpr0NA48pg1zPpvUZ7E4GdTESMEhu8WwKXUwxN1FP5c3US0eoYM71N5G
 euf8453KmdEoteXlWQepwQu9x/LFUMYuZQH9++IXtMW0GYcZVrp3uN9f3M83S/n6AMol
 pVcA1wcZqyRK/f3ocTvjqXDNXQlyGq9ZlzkEOm9cMBYRktd5frL6uA0lrD7IycGry9N2
 AWE4Qw0MATxDeOFdT4+p6KzMUvTW9NhVHxQCWp66ISC+XCnHmN9Lp28NWuqx81zHAwAp +g== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
 by aserp2120.oracle.com with ESMTP id 32hu1j0x15-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
 Mon, 27 Jul 2020 11:18:33 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
 by userp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 06RBColY098984;
 Mon, 27 Jul 2020 11:18:32 GMT
Received: from aserv0121.oracle.com (aserv0121.oracle.com [141.146.126.235])
 by userp3020.oracle.com with ESMTP id 32hu5qqu0k-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 27 Jul 2020 11:18:32 +0000
Received: from abhmp0012.oracle.com (abhmp0012.oracle.com [141.146.116.18])
 by aserv0121.oracle.com (8.14.4/8.13.8) with ESMTP id 06RBIV8V015384;
 Mon, 27 Jul 2020 11:18:31 GMT
Received: from mwanda (/41.57.98.10) by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Mon, 27 Jul 2020 04:18:30 -0700
Date: Mon, 27 Jul 2020 14:18:25 +0300
From: <dan.carpenter@oracle.com>
To: hyun.kwon@xilinx.com
Subject: [bug report] drm: xlnx: DRM/KMS driver for Xilinx ZynqMP DisplayPort
 Subsystem
Message-ID: <20200727111825.GB389488@mwanda>
MIME-Version: 1.0
Content-Disposition: inline
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9694
 signatures=668679
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0
 phishscore=0 bulkscore=0
 malwarescore=0 suspectscore=3 spamscore=0 mlxlogscore=839 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2006250000
 definitions=main-2007270083
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9694
 signatures=668679
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0
 bulkscore=0 mlxlogscore=839
 lowpriorityscore=0 malwarescore=0 clxscore=1011 mlxscore=0 impostorscore=0
 phishscore=0 adultscore=0 suspectscore=3 priorityscore=1501
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2006250000
 definitions=main-2007270083
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
Cc: dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hello Hyun Kwon,

The patch d76271d22694: "drm: xlnx: DRM/KMS driver for Xilinx ZynqMP
DisplayPort Subsystem" from Jul 7, 2018, leads to the following
static checker warning:

	drivers/gpu/drm/xlnx/zynqmp_dp.c:594 zynqmp_dp_mode_configure()
	error: iterator underflow 'bws' (-1)-2

drivers/gpu/drm/xlnx/zynqmp_dp.c
   566  static int zynqmp_dp_mode_configure(struct zynqmp_dp *dp, int pclock,
   567                                      u8 current_bw)
   568  {
   569          int max_rate = dp->link_config.max_rate;
   570          u8 bws[3] = { DP_LINK_BW_1_62, DP_LINK_BW_2_7, DP_LINK_BW_5_4 };
   571          u8 max_lanes = dp->link_config.max_lanes;
   572          u8 max_link_rate_code = drm_dp_link_rate_to_bw_code(max_rate);
   573          u8 bpp = dp->config.bpp;
   574          u8 lane_cnt;
   575          s8 i;
   576  
   577          if (current_bw == DP_LINK_BW_1_62) {
   578                  dev_err(dp->dev, "can't downshift. already lowest link rate\n");
   579                  return -EINVAL;
   580          }
   581  
   582          for (i = ARRAY_SIZE(bws) - 1; i >= 0; i--) {
                                              ^^^^^^
This exits with i == -1.

   583                  if (current_bw && bws[i] >= current_bw)
   584                          continue;
   585  
   586                  if (bws[i] <= max_link_rate_code)
   587                          break;
   588          }
   589  
   590          for (lane_cnt = 1; lane_cnt <= max_lanes; lane_cnt <<= 1) {
   591                  int bw;
   592                  u32 rate;
   593  
   594                  bw = drm_dp_bw_code_to_link_rate(bws[i]);
                                                         ^^^^^^
Potential negative array offset.

   595                  rate = zynqmp_dp_max_rate(bw, lane_cnt, bpp);
   596                  if (pclock <= rate) {
   597                          dp->mode.bw_code = bws[i];
   598                          dp->mode.lane_cnt = lane_cnt;
   599                          dp->mode.pclock = pclock;
   600                          return dp->mode.bw_code;
   601                  }
   602          }
   603  
   604          dev_err(dp->dev, "failed to configure link values\n");
   605  
   606          return -EINVAL;
   607  }

regards,
dan carpenter
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
