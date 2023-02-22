Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A1CA69F9B4
	for <lists+dri-devel@lfdr.de>; Wed, 22 Feb 2023 18:10:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DC99E10EA58;
	Wed, 22 Feb 2023 17:10:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com
 [205.220.177.32])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8B15110E046
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Feb 2023 12:17:05 +0000 (UTC)
Received: from pps.filterd (m0333520.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 31M8x0H8001209; Wed, 22 Feb 2023 12:16:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references :
 content-transfer-encoding : content-type : mime-version; s=corp-2022-7-12;
 bh=6CSUJ2fVnygQu94tFww+KSS1kwIc3t7JRp8em+javqQ=;
 b=CFXSQ9hIWHE9IuayeiSqxf/KwvBeX/wM2vW/vKroz34SOgAhJurSk1NgcUfzEIybKGK8
 X6DX7rNfyCCAcT96jsxvwDh3VmTAAfILA/LmKMrS1BGNdKtKV55gkUU/yDMfwpZmVssa
 4hdZzYqFnfd0SPeMOp7uYNEFMxyw+OmB+2utnHlQeZls2jN8n5gPhZBL6bdBN98ChsYS
 IfgpAPTYrUjSd15r18ocXtO+VgHkWgBp17ubi0k6pzxqEzAlMSy7WUGYzPf/oFziLKH8
 l0hYIGg1t1aBD2hnN3HHBugWWl13KWM0uvSVXln4OY6ji/piUBZLk7ZT8HJtIWXfE+JK tA== 
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com
 (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3ntpqcfrdc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 22 Feb 2023 12:16:59 +0000
Received: from pps.filterd
 (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
 by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.17.1.5/8.17.1.5)
 with ESMTP id 31MATfpb023474; Wed, 22 Feb 2023 12:16:59 GMT
Received: from nam12-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam12lp2172.outbound.protection.outlook.com [104.47.59.172])
 by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id
 3ntn46j5n7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 22 Feb 2023 12:16:58 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jpI2lka0jbLKBW9jssKEmgy9AY+4OsBMBJYuoYQmWE3agKy7QA0le+orv6F+9wVnue4qQUh4STne2dvghgslfz1Wldsp0lll+z8Fxegpy3BwOrsHjG1HL25iTctLv4ExfVALJIHCx9FBuZ90oaJUaUTt175nUagno1SOzvN6UCt+xViaiMfxxjD5N8x+KdRYl1Kqoq7aR6TzwQmcFdZ2vvQakUAEHLxnIUXIEia8nlZk04gQshTgnowMP3HcXgYrHTBcHn5QvXDTNIyJnnp5dusty363hXOQdZIsYLLUdym1/XzLJ+eVNCWoxUg+Dy7ITkBS5BHa3ymVsLGEdidCmw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6CSUJ2fVnygQu94tFww+KSS1kwIc3t7JRp8em+javqQ=;
 b=GpKuQ1PGECY1RwtbKGgfI7FkMWBKFsaskzNF0keVu7qqnf1Lhc4lI4dHmqGvC2mVxFIhyARemOT+qMpMv7YL0/h21tC+Bwz22UnCHbg8EDCKNvytBIW2WXVgoiHaORIJB2hWvrgdiAYI5Uyt/rzYaZNz7I4Pl6fnnjkko9DfHUIujZ8tZHmp6bUhtqFGgwSUZ9S0Y7+AxivUa1Fkm386fY3HfvJechM6tYPvbPAeSCTyQzh1kVDhZCpOwjU4cdqB8NzP46xz3eNMvAuE4FjqR+JaJdEVYR2Rbj5nUklb3QVH7dbnFmRwYC0/I3CF4kicjXwI/alYv/1k+Ao75TmfAA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6CSUJ2fVnygQu94tFww+KSS1kwIc3t7JRp8em+javqQ=;
 b=fvG+gb45x5BXV5kbz5zsJ1AsiNiZKn340t7iiAbblP8BGIrE0Uk+RUZ8nCVxOB7espU8iprXTYPqno2MGb4wbEfjJkSsk7zvhhqRN2/fcNbygCmwAHzHGd4DwCTLAwy0z9ssurGjFTxonzhgmzhXNqel1SiKYcqVD4Hf9xlIn/E=
Received: from DS0PR10MB6798.namprd10.prod.outlook.com (2603:10b6:8:13c::20)
 by IA1PR10MB6805.namprd10.prod.outlook.com (2603:10b6:208:42b::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6134.15; Wed, 22 Feb
 2023 12:16:57 +0000
Received: from DS0PR10MB6798.namprd10.prod.outlook.com
 ([fe80::d0f7:e4fd:bd4:b760]) by DS0PR10MB6798.namprd10.prod.outlook.com
 ([fe80::d0f7:e4fd:bd4:b760%3]) with mapi id 15.20.6134.019; Wed, 22 Feb 2023
 12:16:57 +0000
From: Nick Alcock <nick.alcock@oracle.com>
To: mcgrof@kernel.org
Subject: [PATCH 25/27] kbuild,
 video: fbdev: remove MODULE_LICENSE in non-modules
Date: Wed, 22 Feb 2023 12:14:51 +0000
Message-Id: <20230222121453.91915-26-nick.alcock@oracle.com>
X-Mailer: git-send-email 2.39.1.268.g9de2f9a303
In-Reply-To: <20230222121453.91915-1-nick.alcock@oracle.com>
References: <20230222121453.91915-1-nick.alcock@oracle.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO4P265CA0069.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2af::12) To DS0PR10MB6798.namprd10.prod.outlook.com
 (2603:10b6:8:13c::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR10MB6798:EE_|IA1PR10MB6805:EE_
X-MS-Office365-Filtering-Correlation-Id: 9f4fbe0f-f64f-4cbd-618f-08db14ceb107
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: m3J0wuH1f/igTyWB1hmrSNDzUA94VNPlnJpKBBUz09OFw2NYfnb5YaR5/pEb2cdpcclXzvIX7av9bO+cX4OTHBUyR5+aL4aXQibv0E/CXHFzZBHbdRUAyGCtv4Zp9zVGBtfGfcDhCqvE5QkhWvYXczyCJrmpEfk8ePoGQGDvXIuXwcDjxDdOu80DHcAJmkcdXMIm+cZYXUq/vkRBVTH4gZXG0EXUBGpatRj7SSbir6JpcljPC7YkH++EDJvswZDHRUJ8z83GYugVgU8TqF5UnKDGv9J59RL8IDwSOAe+oCgD0J+YQx8yDWLhe0+IUmlvYqTlRbKoRfQBJVJdd0RevTBFMC0ZEMW3OQZNnCHYrHBhl8tRGQxVoz7cEEbM/8fhauOfhYXcgGqK/3/y5kKd0cfj3EjXnW0eCx0eIGz5ZWiG6QkRU3EiQaY/gt70ro22/orGqWjFBepTmEy6jAh8Lg9/muVXhm4DZW8efAhk0Ed2rnmdhaKKPgcTwbAdXycgUQy0SYLfY2WlOgqnoBcSe622o2ZdhGEX7LLgRQkHVWkrz36LHaNLkb08WIRDY6rfAYhVNE+Ut1yZ1t9chzkuc2YahOEtOEaWEGq5HzAndfgGBVp4nwhRJedV90eMgMGBcb8ucZbFqkqrD8dyYJMdiQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR10MB6798.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(39860400002)(346002)(376002)(396003)(366004)(136003)(451199018)(36756003)(5660300002)(44832011)(83380400001)(2616005)(6512007)(478600001)(6486002)(6666004)(6506007)(186003)(6916009)(66476007)(8936002)(66556008)(4326008)(66946007)(86362001)(41300700001)(8676002)(54906003)(1076003)(38100700002)(2906002)(316002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?n3H0a/K+lb1hv8zCOYL2m9EJJIDY5cSM7qQc8/kofOyEFB/JbcHLEeRV1/AD?=
 =?us-ascii?Q?9dtnIiZ6aQgnA3wOudHsDk9OrN741qh2qhcK9bvrDovBUoJtxWi2n1FUrpUE?=
 =?us-ascii?Q?x3T3sCSBB5HlReWzHCQ4XF4A93Eb/sUdQTqx0evkhBNlR/z4JbSJ5W4i5ap0?=
 =?us-ascii?Q?vOVV7wb0rx7vI1GcaJPqgOpnq7Bl1xX6u8qZheRb4lajOj9r31+4MLPzDnHX?=
 =?us-ascii?Q?5qMTKVaKUhH9iELsxdzhaG8PnQawNKfizjwjTcifZW1H6h43lXEDWIfWII+7?=
 =?us-ascii?Q?2lyWkrCDOpWKILEOWnkIUWMQnvdl9q2G9cAHb9HMyJUGc5s0uu0oQmjrLNwS?=
 =?us-ascii?Q?91jMfI4VJZrNmsn4zGYgRfO0fVZfKpx8oW4jkASjmNfUBQ9XUswrCW/WQxJ+?=
 =?us-ascii?Q?xL1IU8MbkjdoySrXF5zREs0Lj5nNNUMRnrwsKBR7y4RkBF7A9sr3f67nLRMa?=
 =?us-ascii?Q?fk/KFAlmHSIqFBePX8m6b894xyFWM+5Yayf5Tik16/kI1s3SQhCIYzqXG6fp?=
 =?us-ascii?Q?0M6iIXIm6HWMRTapTpXnI2EL///4OE/wr9obYkGX7qIa1tKwyMxg7taUQgRD?=
 =?us-ascii?Q?jnjymWnx6uux9CS+OSS8B11C5V00WXsAHe6gvXlu64BX0K2XZxe2Fpy5EQgK?=
 =?us-ascii?Q?YL0DijLn8+U83+eWcHA8GcarnhFJF1bOD9s5VWYWPl+24zASpd5USAuzFaCP?=
 =?us-ascii?Q?sMEAiJ6h6oHU56QBH5ED0iMaYYLLirP0DLsSluxzIbxf/wXlhy0pCTBWvI3+?=
 =?us-ascii?Q?XPyQRp4T0hPfPXNTFpcZuZKxQVilYBksVwXGYPnohtdQ/7lZUNQMEmUTIH0E?=
 =?us-ascii?Q?BmuzhXTGy+iq3gD+Y/EYaCJsi79tULWBvx288N8Fwh0dBtcQOdEiL3R4cRXO?=
 =?us-ascii?Q?h8uIzEojprq6IfZgfHDuatWr5nEQE8kodrqpBI0eBQ0BaDczvBYb0PQv0d/k?=
 =?us-ascii?Q?AmVx218kKnfjCdmshpXA5YwSqBBDvRaRtzYT36EJLlyt3tEOFqZfaaXictu8?=
 =?us-ascii?Q?i+Kj32bLcMLHOv4ST/SfCJBKpE+obDKzOxm2LCM6FAj4i6Vae8aRfmY5o3L5?=
 =?us-ascii?Q?7S+3d878BHdIhs+SatY4P6rz1y0gXeMKRB3m1w+Wy4c2KmbCwkwxsdhei8ow?=
 =?us-ascii?Q?uAEfAqZdVtGZnylMHwdAFuctdYlKnoYUmLFwR/lnEDayonZWz1QJ+K1KuAgL?=
 =?us-ascii?Q?39L9bdcIBXJWvE1nYvoLfIWKRg0AJZ5dvQwhMO6j3Nq+s4mOtBlXg0RJf7xh?=
 =?us-ascii?Q?9EtwXwSrTHvv7PJPeC2Oc5WuASHuI2W0bzPd3fAXXNG+pJIwMtOZMMevFfhG?=
 =?us-ascii?Q?BR64pLTNsyvi7+LM4ak/DJ6+k02RmloMmWqnMkYvXSt08TNMvANdOsO1As/j?=
 =?us-ascii?Q?PU8wNMlcu+CakeVNjzZPZp2bYbfL7Dm6gBgA6LWA+raBbM71G1FsKnBDq8+L?=
 =?us-ascii?Q?ogXmxAQ7OT3JeWCXgjvQgg5JE2uJNAbhdQuRfbde1+y8lXCBVnXO1vkG7hTV?=
 =?us-ascii?Q?JEzVn7LVNBvKulQEQ4vVGm75G7iz60OV+VgUDQLbCNml/51BIP1FZWogElS8?=
 =?us-ascii?Q?GmvJXPq67fXg+eYIRj/oIohP8WKVNkoxp1lGmF3Sz4LY4CrJ6PyaGPtG87zj?=
 =?us-ascii?Q?l7/AISH2m8uV9Xd3HWvzNP8=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: dfvMTVNKfuW77UyQSo6d6VbSEv1nU2WyqNSWOT2o5d5MgnzPOscJIPiXc6hLQYmkUbg3fB9uUVQVCuWQWXH5oGbAVgfkwDbt0ZCoNaN2TdvxQOd5e4N8uXAxXXEXnYDk+88S1p5TM0O9/UNxn1xeftFHhWRlg9GNS8Vsre7vaTBoEN1c4H5PZtrX6o58/cdbg7PrrEsEm6Jeydwu4zQUxpptvIEBYLsMlXtRTQKdyXOFcZkpGfFeKcGhaXU8hPCxmx0SaZFOYwmzF2VUXhW689WTU+sq+gIIoeZPe3dQsONiVDBvBOq0nR34v4bWQK4tJkv1mDhn9BfN5cIIu3lsVLB/FZSmso5YbhnPNn/v4XHLYe98PimqGpKmWh1EoePZfCymcKku3cuU/hBnZdUEdecZ3UFWbaYuqKkDbmkX4x6nGsg0iCmGABmQl004rpwzwKcf+UdhKGTpc6qwvZFwFDlCy6ahH2uhVH/KZu1YvKWoJ5MyWs1Z5y1+gf2sPqg+8nIdd2KQ3YBFZTnwaZnWLTOiE9stJD8AL3E9sNL2dT41vbPkw+WwAZ0JQDPvwSOrt2HPKVWBl+CDsolSB7IxQQjtcFAnuGny2vgjNQcFSXOadWHLryJl2jpSPLFC/+5UcPEyUKBHu5R9rn07IrYEvK0c4h5ZA1NllLED58QHAtkU99Nu0LUfgzRmFcbrFnspt/v23H1SEo1CzOJ2S84n1fqOJlr4ZEpb64zPdnEsYZ99XmEevl9fOLwqlpIi18q4mrH8LUYTjgiPbWJF61DgIEqy9tnLo4Hi+b6Kixn2SCTr48gCyOeTIfcBd65I1UC+vDCs2RsZEXyqdrOxtVORZxEJgsw7bjX9FyM8l7d7mr80HCm8QN6AADgrYT0/ZaPmISW6n3tuwTbjQgFFAWyzwA==
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9f4fbe0f-f64f-4cbd-618f-08db14ceb107
X-MS-Exchange-CrossTenant-AuthSource: DS0PR10MB6798.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Feb 2023 12:16:57.1114 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: flDBULmBxiR+cmh0Hj1mBz0Bsu2ktS/7x5DX4QdfkZViqavrIkTFm7T6TK+35cnf1ZXkITs80NYjG0KGUkYHlg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR10MB6805
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.170.22
 definitions=2023-02-22_05,2023-02-22_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999
 phishscore=0
 malwarescore=0 mlxscore=0 spamscore=0 adultscore=0 bulkscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2302220108
X-Proofpoint-GUID: bXZAh0BILeOg82KlkMKgYVFGDiAnc0eG
X-Proofpoint-ORIG-GUID: bXZAh0BILeOg82KlkMKgYVFGDiAnc0eG
X-Mailman-Approved-At: Wed, 22 Feb 2023 17:09:36 +0000
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
Cc: Hitomi Hasegawa <hasegawa-hitomi@fujitsu.com>, linux-fbdev@vger.kernel.org,
 Helge Deller <deller@gmx.de>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-modules@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Since commit 8b41fc4454e ("kbuild: create modules.builtin without
Makefile.modbuiltin or tristate.conf"), MODULE_LICENSE declarations
are used to identify modules. As a consequence, uses of the macro
in non-modules will cause modprobe to misidentify their containing
object file as a module when it is not (false positives), and modprobe
might succeed rather than failing with a suitable error message.

So remove it in the files in this commit, none of which can be built as
modules.

Signed-off-by: Nick Alcock <nick.alcock@oracle.com>
Suggested-by: Luis Chamberlain <mcgrof@kernel.org>
Cc: Luis Chamberlain <mcgrof@kernel.org>
Cc: linux-modules@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Cc: Hitomi Hasegawa <hasegawa-hitomi@fujitsu.com>
Cc: Helge Deller <deller@gmx.de>
Cc: linux-fbdev@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org
---
 drivers/video/fbdev/asiliantfb.c                | 1 -
 drivers/video/fbdev/gbefb.c                     | 1 -
 drivers/video/fbdev/mmp/hw/mmp_ctrl.c           | 1 -
 drivers/video/fbdev/mmp/panel/tpo_tj032md01bw.c | 1 -
 drivers/video/fbdev/vesafb.c                    | 1 -
 5 files changed, 5 deletions(-)

diff --git a/drivers/video/fbdev/asiliantfb.c b/drivers/video/fbdev/asiliantfb.c
index 8383468f5577..0d33c75afc48 100644
--- a/drivers/video/fbdev/asiliantfb.c
+++ b/drivers/video/fbdev/asiliantfb.c
@@ -632,4 +632,3 @@ static void __exit asiliantfb_exit(void)
 	pci_unregister_driver(&asiliantfb_driver);
 }
 
-MODULE_LICENSE("GPL");
diff --git a/drivers/video/fbdev/gbefb.c b/drivers/video/fbdev/gbefb.c
index 000b4aa44241..39e89b9f8dca 100644
--- a/drivers/video/fbdev/gbefb.c
+++ b/drivers/video/fbdev/gbefb.c
@@ -1285,4 +1285,3 @@ static void __exit gbefb_exit(void)
 module_init(gbefb_init);
 module_exit(gbefb_exit);
 
-MODULE_LICENSE("GPL");
diff --git a/drivers/video/fbdev/mmp/hw/mmp_ctrl.c b/drivers/video/fbdev/mmp/hw/mmp_ctrl.c
index a9df8ee79810..8b2838a67b76 100644
--- a/drivers/video/fbdev/mmp/hw/mmp_ctrl.c
+++ b/drivers/video/fbdev/mmp/hw/mmp_ctrl.c
@@ -576,4 +576,3 @@ module_init(mmphw_init);
 
 MODULE_AUTHOR("Li Guoqing<ligq@marvell.com>");
 MODULE_DESCRIPTION("Framebuffer driver for mmp");
-MODULE_LICENSE("GPL");
diff --git a/drivers/video/fbdev/mmp/panel/tpo_tj032md01bw.c b/drivers/video/fbdev/mmp/panel/tpo_tj032md01bw.c
index 34fae588e202..84ed83ee2366 100644
--- a/drivers/video/fbdev/mmp/panel/tpo_tj032md01bw.c
+++ b/drivers/video/fbdev/mmp/panel/tpo_tj032md01bw.c
@@ -169,4 +169,3 @@ module_spi_driver(panel_tpohvga_driver);
 
 MODULE_AUTHOR("Lisa Du<cldu@marvell.com>");
 MODULE_DESCRIPTION("Panel driver for tpohvga");
-MODULE_LICENSE("GPL");
diff --git a/drivers/video/fbdev/vesafb.c b/drivers/video/fbdev/vesafb.c
index 929d4775cb4b..73b35fc67d8b 100644
--- a/drivers/video/fbdev/vesafb.c
+++ b/drivers/video/fbdev/vesafb.c
@@ -508,4 +508,3 @@ static struct platform_driver vesafb_driver = {
 };
 
 module_platform_driver(vesafb_driver);
-MODULE_LICENSE("GPL");
-- 
2.39.1.268.g9de2f9a303

