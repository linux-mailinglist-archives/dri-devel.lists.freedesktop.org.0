Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B49E565BFD
	for <lists+dri-devel@lfdr.de>; Mon,  4 Jul 2022 18:24:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7B53810E364;
	Mon,  4 Jul 2022 16:16:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com
 [205.220.177.32])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 99A5F10E02D
 for <dri-devel@lists.freedesktop.org>; Mon,  4 Jul 2022 10:56:15 +0000 (UTC)
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 2648f0lN018982;
 Mon, 4 Jul 2022 10:56:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=date : from : to : cc
 : subject : message-id : content-type : mime-version; s=corp-2021-07-09;
 bh=5o8oYsiQIt7uK3ajLsYbYs98N9JZzHU7KjI5z8hHtCc=;
 b=wWS6clINKB1s6WjTLA2J0xIWHcTnVIue8pUE8rZUPEA5U47SaEM5dmXiu6rdXj6E5I+T
 PuMaGKNIRXxczXAoqLWUe7cbNFjhgCtKXvqplksJQWtdZ8ZqK4hekM/hnpUudtyKJzgO
 F5vz9DPvmPJ9Q8ffbh1dtf4bvolqSgLFPfrhQBNoL60UFx+al0sVC2/NGMF2CL4F+Cb4
 fmTO6dXeLxwTUeFGGpy6N+Ebcpu92b8lB2ozFeEhlNUtK0jXxp0TbIeda08Vz8FEIkCB
 CkoBejHSVc1rzvR522hb4JqQceLocwC0xroYoqM0Vb4eLE+3RCEKAvhd0vcGfCV20I4a Fw== 
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com
 (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3h2dmsu5he-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 04 Jul 2022 10:56:00 +0000
Received: from pps.filterd
 (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
 by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.16.1.2/8.16.1.2)
 with SMTP id 264AtAYZ016998; Mon, 4 Jul 2022 10:55:59 GMT
Received: from nam11-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam11lp2173.outbound.protection.outlook.com [104.47.57.173])
 by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com with ESMTP id
 3h2cf1h1mw-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 04 Jul 2022 10:55:59 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=csv4sYzONKnrdKoDmZ6AYqyCHu2lXT/2HHq7dJ/zOayQQ8FwEDhB83CWxvJ7BGcaDkSmHXVrOKkIxHmzE65sf1+fqr7o5f3ADFf9Ie8KvjAOLoL6PrazPXgmNiDyfhLON2mH62TwR+f+hlU5rYe56DKY/+j38At7a/0FjSJjCLiccRGvIkpHeu9pn58NEAzD4ILY+LN7G7xTja8R8ytm54hLTZKfyKZS7IPYXg7uunYBpU/5QKI04fAGmPkGpCw3ITxioYh7meZzmyssaCjiiGFwX1Igfl5oausm9gmnpwB38JPYslW3NGr3SV1Vu6YgjoN6JfF6PVaR9oCnfBg6pQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5o8oYsiQIt7uK3ajLsYbYs98N9JZzHU7KjI5z8hHtCc=;
 b=jl0xbZNW3Glu3p4ewRbID9z+6EGD2eoVaisTfHvzJ+7cYGBELs7XGuUaEtUwql7fZFSizCXu6e1S4jvcPYFR9ODSVZp1jR3fEvh3rNuSFXcBmnLloHk7a2SvhcWnGq6kGg+M/tDgjtroRdHjOLeP9rVJMXjncIGqVRlLniSIyqiuHfrE5maImIElD+0j3h6q+yk1liUz+LZBPGGlc8G+W706YuZ5hSKmUPYFimu/lKPDiCEwy3m3OyYCjmKzsXQ9RzAkuj2UDiw+yK7fSH0ns/IRclzs+C1BgljM/HMzpol2kdaJ6KuCyJa4PosnFUig0sk3kEQujiFyDs+m0qj1uw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5o8oYsiQIt7uK3ajLsYbYs98N9JZzHU7KjI5z8hHtCc=;
 b=aEbs1gUgPxDJUEcujHZeh/EZTi6I9wVCRUf0Wqq+zi2xbpUZNE6gC1QW6dKhIsYQ2ofGVgNvYQXf+dbHpc8PxU+2DhTHtq97RGo3CnUGmJRG1Jqfm+Icr+TzCel4+eftVDpQlskpSsVEZaHjY5I2hyNcxTcbkvBrKrvgsP2aVbk=
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28) by DM6PR10MB3563.namprd10.prod.outlook.com
 (2603:10b6:5:154::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5395.15; Mon, 4 Jul
 2022 10:55:57 +0000
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::5020:9b82:5917:40b]) by MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::5020:9b82:5917:40b%6]) with mapi id 15.20.5395.021; Mon, 4 Jul 2022
 10:55:57 +0000
Date: Mon, 4 Jul 2022 13:55:40 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Boris Brezillon <boris.brezillon@collabora.com>
Subject: [PATCH v2] drm/bridge: Avoid uninitialized variable warning
Message-ID: <YrrIs3hoGcPVmXc5@kili>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
X-ClientProxiedBy: ZR0P278CA0012.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:16::22) To MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: fb756850-b75d-4fed-81d1-08da5dabc649
X-MS-TrafficTypeDiagnostic: DM6PR10MB3563:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 2J8dYMmMaqPYy5VbT0TAVTE4dbf/+eeibATsyAoJtJw2WBnix36+lHYgNS6beaMTsNCsE6PGuYu/Nx+id2uILI+FTGj056whwcV3UgRz0oe8bJnSsY8nRnpQIxFnrz3BmM/3OmscbrC4VLTnu71jcERizjGPFD1hGQo1ycTadsDNH6rHzChAMCUvspZkEYGMHHq5na6IG5ketYNgg+GSZB8DXn1yBGeOVUrwgv5J8WkrDPFSKaNIfCo+MdmTmBmOcZcSHB0M/iInCh95u5elLqhmOkHdKkO0MhXKv9w1L3VPh2qtcTpMQ1kDbWSDPJA5Xy6sFd+UBSEwxWXq3sX+Q8ALlcSgd7DxmgzZagZ0jDBmz4Y7SyUllFOWEk/HaQbYKtmfqSZgvZ/UmK4YCCB/vUARfPe6JxR27ipsOV2dIDiS6UiNiGnMuenHwGwwEemvjMMJ1vb4YKI01i6Fsp+GHxi8OMg8OrJvIGPnjb/jEVaSp6RX3GGQKl7DRxWiSl9Rg/uQnRHT9HqI5Qjbb51JVenVA1f0dDhE67PCopT9j8LjwhZVXkvwpeUXonNdLqrvCaTDrDLtkKW6mQ+S4VkIE0Nx+m4He8mXp3OGXqLoleS6wpvvp8fX/a9H8qYdmnif52DusB3z263vwZNhLVXfC517uZ8oCb1KIJdQMV+HdCL+8SGvLfQvMyAIAssiIMgo+a817Y4K+j6tmBp1F/OPznay1CIuHvQM8xy9FTEyZBCwEiR2FwCdHnOxpfKguODg0S0OrkGymQKXyNo7xQhcjgfaCGADiGgNfSZRcXAq5O+f6UWKUFfTOHcx5S1Xq0KB
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR1001MB2365.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(7916004)(346002)(366004)(376002)(136003)(396003)(39860400002)(110136005)(66556008)(478600001)(6486002)(38350700002)(86362001)(66946007)(6666004)(41300700001)(66476007)(26005)(9686003)(52116002)(186003)(54906003)(6506007)(38100700002)(4326008)(316002)(8676002)(33716001)(6512007)(2906002)(44832011)(5660300002)(8936002)(7416002)(83380400001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?WplHoXY5dAsyEwbPy+Uoajpr2wNdfpen5dZv21KDu/Jqm8ScF1kz+g1NWMO4?=
 =?us-ascii?Q?eMVbPkJxf47jW0iqL5qSzdMW54IcrjVfZXqnAbMzz6hGOeLzujFjdSiH1EtO?=
 =?us-ascii?Q?QuNfATKf0Fk/pxpbtEahVTVRH79ri2uTDBLw3JPgSXmfUzzVsEw48IeWwgCb?=
 =?us-ascii?Q?8vVkNAF6YobKurEPfzAUeZp1S/P68UEp68KcR65v5VdtOq57gQlymTlz1S/x?=
 =?us-ascii?Q?nibMXu/+o2Qv/Refo6HY2XcKikX7q/jLgaNeCR/f7I7yUd54KnPvlB5fK7xc?=
 =?us-ascii?Q?ORM4xVyrH+5Mt/X669xIpQsy6orxMIMIM61P0zUHzIvNd6RPdBw3GUBtWdkE?=
 =?us-ascii?Q?HvPc8ygmlF/+/0MafDDrhiaSfhgROexQyyf2PeZJX+x7TnTxuZb0J7Wss4Mh?=
 =?us-ascii?Q?kHMOT/rGtS0cK66u8vqu5WZTDdVnIAzc4MmC+FxvWmXLD50iqHkmFe63BWlu?=
 =?us-ascii?Q?fRo5reSTJhr+/Bg/vscax8Uhcfeh//DZBq8wwyO5vbWd0QHfeq0EBR7YrWmW?=
 =?us-ascii?Q?QNdQGIehS8szwFFW3Juz5IiuiNPmQq0cO9tQGjI0aQ529IsyjvAnVohmMZhd?=
 =?us-ascii?Q?IfP90x2ha35OoHSY2/7Tc/y5DoPnMBqiN3WpFicCeTn8B8A68eq6434hNLPa?=
 =?us-ascii?Q?hKH8SWWRUl0Q62pMkMt/F4ixOq4cFDpVj5D/9yA4MgE/qlFLn9A378AjG+43?=
 =?us-ascii?Q?ZX6I6Bp1CnfJi4IqGwqQ0lM9Ac83wRfCLGYBoEs//zgrvTfFb4HSG8mN5Qtf?=
 =?us-ascii?Q?2PKQ4V2il6c/DnfRXDVUMKeqe5XRvypsUCYiuxVLyfRtppNYXCK0Lm/ASeLA?=
 =?us-ascii?Q?Z99aAvFJ3RPte7+UJ/jRBlmcB+ccr8I/rXdWQE5CNP72si8tNeA9BdxU41+h?=
 =?us-ascii?Q?gTEdc1GIr6LnoTE+JL9s+8cbl8KyYKxtaBYdLvTVOwMMIVTczpqjRPDg7BKE?=
 =?us-ascii?Q?mQnD4aucmDPKTHBnAh17N0mbKNYenW1SnRu6wWgA7hc3uE29QHmA80tcXny0?=
 =?us-ascii?Q?8/xJCil+Hx0Axo0/Hj2UJsTIs40pc7TOA4V0zi1bXwFqj6M20fN1THGEEhiL?=
 =?us-ascii?Q?fjO1gEZOJCZf8gFCsD52JgsA4+WT8z92DvHqztddC/0QB8IAiPxyIJIP79jS?=
 =?us-ascii?Q?LGsiMn6EbQz3gxAHvVfuEmvh+VJhArdv3wOZNrdYCYhdMPxUzPHA/YMnjZ34?=
 =?us-ascii?Q?K2YtC86njI8bmKg49S1vpZ3N8SQs53uFURtyhoEpZ4A1cw3YD3BZwYXrAsIl?=
 =?us-ascii?Q?YU5TiMH4zpZDYB6r/DnRmzaNcqZHb29AYdnMh2xdsh9eMP1ZF3e53HUv8nAn?=
 =?us-ascii?Q?WaWcehwHOQBcPGdrwiF0vCWiAAYs3uUF428bKMQZ4nOgKvoI9rShU1Ypg8km?=
 =?us-ascii?Q?3sRZTONfkxpjA9kJcM3CBaokFHA1WxzeO1LVGwiJcN8c7Ya6rzlxkVj80rMN?=
 =?us-ascii?Q?hrAcEpLMrdbB0ZbZ6cFQGE+INFqexhdqZbNNnZagMUDWVC5eiRrYBqSifgxn?=
 =?us-ascii?Q?4kInqE2PRq10D7+MiSpIKYB5iO5JXwA4C1S92PB0RluOWn4/BFwmNZXHnx9X?=
 =?us-ascii?Q?qJpt/wTJcoZbwUdofQjtwvoVyc7taRw6FTROut2dqWPiswYv9NzNcDwsa5tr?=
 =?us-ascii?Q?YA=3D=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fb756850-b75d-4fed-81d1-08da5dabc649
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1001MB2365.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jul 2022 10:55:57.6030 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HpIu/0tznUV9PTZghOb3UAsOcRk58RAQWh+lviTBaEVKDv0ILYJwpE0HpAP+AdMO0Sq5TjJFEI1lw3UqgqB61YW0LL6q1MS9Bd0GJ4IWFAA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR10MB3563
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.517, 18.0.883
 definitions=2022-07-04_09:2022-06-28,
 2022-07-04 signatures=0
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 spamscore=0 adultscore=0
 mlxlogscore=999 bulkscore=0 malwarescore=0 mlxscore=0 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2204290000
 definitions=main-2207040047
X-Proofpoint-GUID: zbgy3Qxed9OK66Jog1jfQAruGnX8O6tq
X-Proofpoint-ORIG-GUID: zbgy3Qxed9OK66Jog1jfQAruGnX8O6tq
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>,
 Neil Armstrong <narmstrong@baylibre.com>, David Airlie <airlied@linux.ie>,
 dri-devel@lists.freedesktop.org, kernel-janitors@vger.kernel.org,
 Jernej Skrabec <jernej.skrabec@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This code works, but technically it uses "num_in_bus_fmts" before it
has been initialized so it leads to static checker warnings and probably
KMEMsan warnings at run time.  Initialize the variable to zero to
silence the warning.

Fixes: f32df58acc68 ("drm/bridge: Add the necessary bits to support bus format negotiation")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
v2: initialize the variable instead, this keeps the original error codes.

 drivers/gpu/drm/drm_bridge.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/drm_bridge.c b/drivers/gpu/drm/drm_bridge.c
index e275b4ca344b..d4601201f31d 100644
--- a/drivers/gpu/drm/drm_bridge.c
+++ b/drivers/gpu/drm/drm_bridge.c
@@ -846,8 +846,8 @@ static int select_bus_fmt_recursive(struct drm_bridge *first_bridge,
 				    struct drm_connector_state *conn_state,
 				    u32 out_bus_fmt)
 {
+	unsigned int i, num_in_bus_fmts = 0;
 	struct drm_bridge_state *cur_state;
-	unsigned int num_in_bus_fmts, i;
 	struct drm_bridge *prev_bridge;
 	u32 *in_bus_fmts;
 	int ret;
@@ -968,7 +968,7 @@ drm_atomic_bridge_chain_select_bus_fmts(struct drm_bridge *bridge,
 	struct drm_connector *conn = conn_state->connector;
 	struct drm_encoder *encoder = bridge->encoder;
 	struct drm_bridge_state *last_bridge_state;
-	unsigned int i, num_out_bus_fmts;
+	unsigned int i, num_out_bus_fmts = 0;
 	struct drm_bridge *last_bridge;
 	u32 *out_bus_fmts;
 	int ret = 0;
-- 
2.35.1

