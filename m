Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D9E43BA81D
	for <lists+dri-devel@lfdr.de>; Sat,  3 Jul 2021 11:44:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 855196E1B4;
	Sat,  3 Jul 2021 09:44:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com
 [205.220.165.32])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C79276E08C;
 Sat,  3 Jul 2021 09:44:43 +0000 (UTC)
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 1639adLD018131; Sat, 3 Jul 2021 09:44:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=date : from : to : cc
 : subject : message-id : content-type : mime-version; s=corp-2020-01-29;
 bh=svZlTCB6B20wEoWmQ58bWpl6/UGX5R4GSS6cdLUBd74=;
 b=BIrx8SWq0mZi1soB5N4PHXfkC4Xsvvg2gwD84Ih3JDyGLFd/ALNRjaKbP1XSktHb/bH1
 kMeNao2tdWyg858GWb4AVCGi3zhv+5/p6H2ANbulkCbCyRaVXVoyrycPSCrkzoQud6vX
 gxX6kprrt3zeNUKQUbE6RILej2kYCPl6e0xt3jXoCyxP6oOMKZ5IQEMIswInd+CTdmdo
 QaoXMCYZxez/xwq7TJ1CW9oo/E/B28tiTyfO+djcHGom/Q2ZtJeGRINk3THQKGHARDzb
 m9DFSqGFyz2cnR6QlwNbyZgRI3RAuhArPkShtLw7q5wnX34B/qUuPfplNC47pGLqEJne mw== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
 by mx0b-00069f02.pphosted.com with ESMTP id 39jfsc887n-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Sat, 03 Jul 2021 09:44:39 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
 by aserp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 1639a4CH026862;
 Sat, 3 Jul 2021 09:44:38 GMT
Received: from nam04-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam08lp2040.outbound.protection.outlook.com [104.47.73.40])
 by aserp3020.oracle.com with ESMTP id 39jfq2vtvy-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Sat, 03 Jul 2021 09:44:38 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RBtH3EWqdBXOkXi0i35Xrwf06OOmmxmLeWHXaV52YepenPPCTUhRXedXN9c1+SFnrY8rdJIXYAn++oALlXQGC8Ze69rmjhS1cRM9EkAqLhH0tLueEtGWPKNkls5eyWKm+0ut3O1/S484ghYwE1YthxRccwhhsLcuBZV2mK8xGxsXa4wbveZAa508UcM/lYONqryqyStv8ojjV9b77kJ3HzPzxn9fKF0/ijVkqBqiCEl8VU87TZ6489IT6XkxDV7ci8KjbKtMbDEOSaGocoExXcICrD8O3no1zN3hAANJos1hO3M0hAMliWUN/PDvai4QIRKIPRxYlLXHxb/HVBc6gA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=svZlTCB6B20wEoWmQ58bWpl6/UGX5R4GSS6cdLUBd74=;
 b=ga6XaX4x5a3Npe27HhzDU0ZRInz0KtOlEfAapIOiRLD//Il1vSb5QIU4+JZ1c+kdpt/OUvgXPwGKVc3hcWvpQOCmkHacuUNeO/EbVyMJ8bTfA1iDWJdr0/lv8O6VRuNreyUQcQdv0ptp2qExhP31o8HujCtqcS5Y4wl71JO6xhO37GDIDqvDQgsg5+aF5PB606rVxr8xCEhMz058oFrIGlhPJgcgIEB4ugL4Rw3htSoTHJhVFQ1YgZJI9BelLSe39v4kVgtd0IMVO3Q/0IFP5hNDgRUBhlcREEYbnZyE/7moIA3qfjEIRpI9ugJzhylY3nezHZwpbXRUdqHB7FHFvA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=svZlTCB6B20wEoWmQ58bWpl6/UGX5R4GSS6cdLUBd74=;
 b=PtnnvqTrQVD2GpC16IycF2Qcfe4NtUDCie3JaKcFJ+T+4bzg/tjJjMBQlzqe7F4DhNqB8SUykT4IgXEicNvXxi8O0WgVrjwxidZO7ZtbvM6uUigXnS/Qz1IoUOAEalx49udI6h/dUQoNC5uiBnOe4tMc1XFg1Z6nBiVHrHkfq3w=
Authentication-Results: amd.com; dkim=none (message not signed)
 header.d=none;amd.com; dmarc=none action=none header.from=oracle.com;
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28) by MWHPR10MB1616.namprd10.prod.outlook.com
 (2603:10b6:301:9::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4287.23; Sat, 3 Jul
 2021 09:44:35 +0000
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::3413:3c61:5067:ba73]) by MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::3413:3c61:5067:ba73%5]) with mapi id 15.20.4287.030; Sat, 3 Jul 2021
 09:44:35 +0000
Date: Sat, 3 Jul 2021 12:44:12 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
To: Alex Deucher <alexander.deucher@amd.com>,
 Luben Tuikov <luben.tuikov@amd.com>
Subject: [PATCH 1/4] drm/amdgpu: fix a signedness bug in
 __verify_ras_table_checksum()
Message-ID: <YOAsdyWeZAHF0oll@mwanda>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
X-Originating-IP: [102.222.70.252]
X-ClientProxiedBy: JNAP275CA0033.ZAFP275.PROD.OUTLOOK.COM (2603:1086:0:4d::14)
 To MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from mwanda (102.222.70.252) by
 JNAP275CA0033.ZAFP275.PROD.OUTLOOK.COM (2603:1086:0:4d::14) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4287.21 via Frontend Transport; Sat, 3 Jul 2021 09:44:26 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: dfddde09-d3fe-48a8-f2d0-08d93e072a6c
X-MS-TrafficTypeDiagnostic: MWHPR10MB1616:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MWHPR10MB1616A3F4637C391500DBE9F78E1E9@MWHPR10MB1616.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: XLvLvzG4YTOOLDR80aMuYpv2Gxrp52ApwZCxRUEv/nkcmqTnAx42XA2MIZPu4326pjgl+Lo7vvsmaKjBT4beKLQ6ASx0NcQPWs8h11pxRKALNQ+8RP/u/6hQbk+0z/Z7e67MD+5Wkr58gRRS3eoQ1L2KKI2PTVykUxhZSSyT3r0dG2dJGgnpryBBL3UbQMlclKZnqtAM8XLRVZMhD2II+WR0QNzuqogKjH9uC87zJUTcOFWKKNKPufJEmYgOs864temqQ1NV72Hc3xTTEjeOq6FhfIkzA+kx1bUL2rv9XulNhg22hWh2D3zX8w9Qb9mvNDzxkqKC9Dbh58X+jOI1otkJ0Xp0phD3hihqequcd1vcDLINKsOl/ayGnla8o1gpXE2GSs1GcRxWhnz9Ai42oG0bXAAl8Nqkbz+OJiu9xzLj3w2mJnnWungmejr7fEQL54RpD/JaTH06X+f0195H7tCHT4PmZvnSPVcpcIiYV/WGyAK7nTz/f5B8zEAc68nlf+F7IUFKdF5YAOToEmJIMIEA335OHEFyDUo2JfEzlm3OZ2ICLEqf1xRB17lFhv3qVcEaDSf8LWsP5Qd6EDtIHXSs3ImlP5WXLoILn0ojCz62xz90NyWDZoAn8oK9OAv7UvjGtun3RGPLgU7mvznnIiRcoVbkHfgs84VnleEj4D36tmi0IQz9JdypVXQWpBp8
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR1001MB2365.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(376002)(346002)(396003)(366004)(39860400002)(136003)(52116002)(6496006)(66556008)(66476007)(8676002)(2906002)(6666004)(33716001)(38350700002)(4326008)(7416002)(66946007)(38100700002)(44832011)(26005)(83380400001)(316002)(86362001)(110136005)(5660300002)(9576002)(54906003)(956004)(478600001)(186003)(55016002)(8936002)(9686003)(16526019);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?1+h5mmM3Y6ZHtC/kAPwWkIqWTqXIq6AY6XtnBb+Nx/cBpuCyNxMT1RBw26+I?=
 =?us-ascii?Q?2jvfQkfDATW6yWT/oLr7IBYZIfCRcIGT/J2cVEoWkFf6Z/fLEPPU/bhdnkDN?=
 =?us-ascii?Q?r2r550gMQjvC1n/Oz6rvPsoYxu6XsiVS3yaKUu0iskz0RSRUu9jM0TFzeRN5?=
 =?us-ascii?Q?uicLkH4oONv0UJpoO97PL8lWSuzp/rztGKUYCzFoUQiyUF5hxLjYWbuzt4Z9?=
 =?us-ascii?Q?RlIU0/45xizhMt1i+H3uPT82UvnGv2V0IDYZnLICu6ct9tjeia6COgHASQ+s?=
 =?us-ascii?Q?lLH4FU40Cm3akyP0bhfudZFLtEDPvQf4EnLioEI/Sleq9IYJTqCXJTxEcSN5?=
 =?us-ascii?Q?8uf0S1RDKYmz98j0NnupJMygefhwto8Yleg5CnnqcYExtaI6rziSrn7AXVIi?=
 =?us-ascii?Q?y48GxdNhZRo4ZzGnchseqjwI/keSeRTLBaLwVMDwBTCYErA2Fg1Cu5gJl5W5?=
 =?us-ascii?Q?Kk64GbHQI3exFuFF/6DNPpjoQAGVlcn3Zn9rgHtqQy7MZPGaR5mJb+iFYqf3?=
 =?us-ascii?Q?XcVqBL4sBkaX+KDL66ix+XPUYPQDu8h+RkpWPVPy3UOxNxYNMbARJ6M7PNAg?=
 =?us-ascii?Q?OONNVwwL9Qio1mGhPA7mgIcP3WSu63ZAZGdarFkSnPlKuRv0yhMuQ1yX6VrQ?=
 =?us-ascii?Q?tRbXkRvi+nrgBt8K5Cbz/Yd15yY1xmK3838cBMnOHutDQqRfl5KfAHDF3OYr?=
 =?us-ascii?Q?AjKsBQ3JtyUn5IyTb+ljdg+tQhCLHXpY+oGSsoXQxjx0tPQBdFaI5rrqXuYU?=
 =?us-ascii?Q?XwN2SwKJybGXHxP4KG785GX4zIYiTKpWCD60SSPMngvf2FOYtB6zBac/hqOV?=
 =?us-ascii?Q?1HtLsXxdgdDj+cS/bkRwfQD1aEcwVe2B+cDx9ahRP6zFQwGWkJMJFL2E9RT1?=
 =?us-ascii?Q?ts9cNrVDK4dquZosSV6DDW6x47l6KtQxNW0N4+bIPJpiBG4GNlHyMzm64Fp6?=
 =?us-ascii?Q?Pf57akoKUggTyqpemAU/f3z8c2Wa8cZiBLtwHdzUgfIzfo9U0cZwTeQILw3n?=
 =?us-ascii?Q?Is3N/U5WG44BKmg6hGWuV6aMexX6WrBd7OBQESXQhZ6V3ygrxASPjmXZH4Xc?=
 =?us-ascii?Q?Boq/FKIzGIap4xEdc0fEkRpl59YB7qhd7aSdz1/3Zr8jZv+3DCG99d24edDq?=
 =?us-ascii?Q?GN1DyWc57asJnYLE+o2ijbRshSoucOwdXtwA53D5/8vlI43w6Bjv8PC9hUlG?=
 =?us-ascii?Q?hu0f/dsL9DHm+EhF7/grg7R0UNlbDVnAIPoNvGJNN2zh23WAnhVXx8+slOOD?=
 =?us-ascii?Q?/RbasHP/4rbBAFM4g2+HPISnMgQtOT0PbJMWTrG+hKC1pd68hZDr9HMPmXNv?=
 =?us-ascii?Q?M0WFJXnumjsWKJgTOiOTOimb?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dfddde09-d3fe-48a8-f2d0-08d93e072a6c
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1001MB2365.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jul 2021 09:44:35.1439 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YIdKuTjpu4uyviGLQZZsKWSNdlUw3EOiT6kRLg+Pi8fwiKSUieF2+VML3xDXnlij5ht/jrzcmncQ1zYt4X604mO4HAgYeqtuzlu4KRs5Fz8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR10MB1616
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=10033
 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 spamscore=0 phishscore=0
 mlxscore=0 bulkscore=0 malwarescore=0 adultscore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2104190000
 definitions=main-2107030059
X-Proofpoint-GUID: lZuFU0xJVD_t-6CFspR3pJV8oqZKJx62
X-Proofpoint-ORIG-GUID: lZuFU0xJVD_t-6CFspR3pJV8oqZKJx62
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
Cc: Guchun Chen <guchun.chen@amd.com>, David Airlie <airlied@linux.ie>, "Pan,
 Xinhui" <Xinhui.Pan@amd.com>, kernel-janitors@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 John Clements <john.clements@amd.com>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 Dennis Li <Dennis.Li@amd.com>, Hawking Zhang <Hawking.Zhang@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

If amdgpu_eeprom_read() returns a negative error code then the error
handling checks:

	if (res < buf_size) {

The problem is that "buf_size" is a u32 so negative values are type
promoted to a high positive values and the condition is false.  Fix
this by changing the type of "buf_size" to int.

Fixes: 79beb6114014 ("drm/amdgpu: Optimize EEPROM RAS table I/O")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
It's hard for me to tell the exact upper bound that "buf_size" can be,
but if it's over USHRT_MAX then we are well toasted.

 drivers/gpu/drm/amd/amdgpu/amdgpu_ras_eeprom.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ras_eeprom.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_ras_eeprom.c
index fc70620369e4..f07a456506ef 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ras_eeprom.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ras_eeprom.c
@@ -978,9 +978,8 @@ const struct file_operations amdgpu_ras_debugfs_eeprom_table_ops = {
 static int __verify_ras_table_checksum(struct amdgpu_ras_eeprom_control *control)
 {
 	struct amdgpu_device *adev = to_amdgpu_device(control);
-	int res;
+	int buf_size, res;
 	u8  csum, *buf, *pp;
-	u32 buf_size;
 
 	buf_size = RAS_TABLE_HEADER_SIZE +
 		control->ras_num_recs * RAS_TABLE_RECORD_SIZE;
-- 
2.30.2

