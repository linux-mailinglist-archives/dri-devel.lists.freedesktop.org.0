Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D15CC58F7C8
	for <lists+dri-devel@lfdr.de>; Thu, 11 Aug 2022 08:40:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C74432B414;
	Thu, 11 Aug 2022 06:40:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com
 [205.220.177.32])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CED99A3D71;
 Thu, 11 Aug 2022 06:39:54 +0000 (UTC)
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 27B0hxFK022339;
 Thu, 11 Aug 2022 06:39:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=date : from : to : cc
 : subject : message-id : content-type : mime-version; s=corp-2022-7-12;
 bh=ZK4FStUiMT4hzpuut74tMcRd1cDwbQi5zpVCz1fN8uA=;
 b=qEelI0QVhKX4hZ6Eh4AS64ve+yjDmiMQUdZW0XI+u81XJC+vaYElGLhQcoASnIaqi+ak
 U7ByuiMMsSTBN1FYc3c9hSbRUBKICfLBSq4MHvocNig2uz8mLE+XW3FTnwvtWLM6Q45e
 KvpyvQn3ireupROMIXbXOpzejG74SQhMGPatus5XJRpoNfJz5tK0cbz2sYcFZFt0HD0H
 nPF7RRC6BSniLDuw38eZzCBq1S8ncdP5G2HGDS0GAb8faShWAORdi/Bj4Ym7IKYwvfuu
 AacSywfujXOLLaX7ljetvolFZmh55HpPIwEiD52xjyWul6g0/jVImEuHgL9shVjthLSu 4g== 
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com
 (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3huwqbkynu-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 11 Aug 2022 06:39:52 +0000
Received: from pps.filterd
 (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
 by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.17.1.5/8.17.1.5)
 with ESMTP id 27B57VnD019052; Thu, 11 Aug 2022 06:39:51 GMT
Received: from nam12-bn8-obe.outbound.protection.outlook.com
 (mail-bn8nam12lp2174.outbound.protection.outlook.com [104.47.55.174])
 by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id
 3huwqjtqk5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 11 Aug 2022 06:39:51 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=m/Mb/+0Lowoq8RFiK1ybzkLpHfSaQmldTaqlh7nyhTMeNEs2mTtbW++5gCfcbXn8YUz66QD2+2CAk5XuasWa9haVOIpOLlRhPL9OH26eCtd7dBb+5rg1aZUyPvl962CemGHruRnI7cTqnANUakfBqrvWgk2pLFN2rOcd+Yvo/qr52UJ4r/lb1jvJnQ9ya/FiKpSX/T4dSW62b4EopgnRO9mw4dKOF9qb5Z7hPkfhNC+7biGzBAHDz6l1A/JkBar/vzsvZQyqz++wahQiLaSNHRkKNxv22erLUtJ4G7l30NRvxd6ifSzDQ8FURktli0H52gJy0VBBcNhr59tm5TUiZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZK4FStUiMT4hzpuut74tMcRd1cDwbQi5zpVCz1fN8uA=;
 b=UFYx9I4t/gnWbMBJho9OfKgnT5Z0JvkbELk6rvmt8qQQ1EHCjjKlcIHF1LGjIUQTCLvsea6lvoOdfvlAN3ZUHfk9uVvu5JJdMMxQ+HydP2vn/4ZJ8RaYonS+8/JGLGBRSB9+nn5CyKKTaVMUAeM1TICimdmz5ir4b//87w0x3nDSnqJi+is56q4YbZE04CG8G0YQSTxNBOCH0rQ75j2mtJ3aQeyCtIzafvWHzMTI64ezkIgXGj9BLPfLmaFhFaOW7meGnKnqOdG2A977B1Ii5u+fS0+iegLiJwilvmCaV6a7vSQdvsx+d46LLtnZipAlD6FrbTZDIAoKMpHLwq/uJQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZK4FStUiMT4hzpuut74tMcRd1cDwbQi5zpVCz1fN8uA=;
 b=jfxU6wyBjigkVv5m/gq4NacC4P9N9DKZmPjtfwOpcHj0YG8UMkFmycFkBuarUbk+7kuBxrwLXD6GA4KhWErell6CnYRBUTceIxl5w7/UvM5uhONrjd2V5+QwK26AcaozF88wCEVuNNbxy1Y6OdMIKbDX27VyCbwa5YjBY5akGqs=
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28) by BN8PR10MB3267.namprd10.prod.outlook.com
 (2603:10b6:408:ca::32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5525.10; Thu, 11 Aug
 2022 06:39:49 +0000
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::209e:de4d:68ea:c026]) by MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::209e:de4d:68ea:c026%3]) with mapi id 15.20.5504.020; Thu, 11 Aug 2022
 06:39:47 +0000
Date: Thu, 11 Aug 2022 09:39:36 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
To: Ben Skeggs <bskeggs@redhat.com>
Subject: [PATCH] drm/nouveau/clk: fix end of loop test in
 nvkm_clk_ustate_update()
Message-ID: <YvSkKAdk8Pe0g2K9@kili>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
X-ClientProxiedBy: ZR0P278CA0053.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:1d::22) To MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: fd882a3c-4ac8-47b4-f73d-08da7b6448f3
X-MS-TrafficTypeDiagnostic: BN8PR10MB3267:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: VWvIZyf9APwxzOaAA3YjhqAWrntCVB+ZnmHHsmbHXfKUhUNd0wv9hAf93tqdI50O7fV87Ek9KU/7aUogMkNSPGs78GZCuFSWTFfDpoY/CNz7Z3V4y+ySHYSNFvc7HjWco8qj5s+ASa9DXt+mPWEIbjIirBu8nhwqhoJyRRA3lCmlSibnSe+80LcIZeqhmP3PBuxjZexbnCaE2ZGB/75yjrrhG42w9jiU+0z045heiyye6lGfkM5P0fK82wOOb4NUbFw+EgXzvBIp4i1I7oD3KsiI3MQtXX/t8lA683UR8kKoqVrq4m06PVywXpYvt3Np8Ch8L78WRfri20toFMZDmWG4egP70V/PBbGfE1jL/3hkxOhVmXa1SmXZ2X5PG9ohkqep1e5hHABvmuFmD/lkycmLpEKbQ4dL/P56Cq56tNzuyaqG54RqJrQcsjynZyCj+KdIb/XCAs9qulPwYb8GCofFr8RaXXPJTKmfWZ38nrDMzLHQfGaR2kcqN4fgvuIbJc99uGtQ+NA5qx5Fd00IejFD6Wn7DbI3WjsVLhES/n76QhedypC1RPdP7702h0JWwV43GqXofBiV8FmtG/YXMJClheA7NS08CDQrvZtS5r3Dx+1AuJvXjF9PyXu1PGAYCH87HM0EKpU0k1hRS5/YNQ3PnvjuAp3PrCNisML+izJRwsiLIMBGMojnfpfR6bDOzSwLaYSUnNzki4hIiJLzg6IrFzEQxeoeIut3LeESn3Jt9Qt8MCxPU/VNvKgWZrGuEvtHHmJ8shf8QA6xeqHTj6ajoA+TxOKM7nXcax69fYU=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR1001MB2365.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(7916004)(346002)(39860400002)(396003)(376002)(366004)(136003)(38350700002)(38100700002)(6666004)(6512007)(26005)(52116002)(66946007)(66556008)(8676002)(4326008)(66476007)(6506007)(6486002)(478600001)(316002)(41300700001)(9686003)(6916009)(54906003)(2906002)(33716001)(186003)(5660300002)(7416002)(8936002)(44832011)(86362001)(83380400001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?AeL7c86IgqfLAoHvE4SNgchggfggZ4JMNuycRZF4ikOAtBfSbmJ+TjM8M4yF?=
 =?us-ascii?Q?EKcuaVpto/ekpzZHAKvop6SsnK6rYCggQjz89VSmhgn7rfDYP7l+owkcSo94?=
 =?us-ascii?Q?129Y/1ogpw35974WqMsV4Wsz3RTHqIe+OBnhQj1ts7nC8GsBPwS5U/ravqni?=
 =?us-ascii?Q?yfz9cTissBaO893FyTtsFr8x242/7hJCUboN/fI0VqV8gs2o3o9L4RgY+93B?=
 =?us-ascii?Q?sliB7PqOA7zKb1nImETZvBm+/x4iwl5TSlyg8OVl0rcn0oRo2l449Y5sY0Kv?=
 =?us-ascii?Q?/RaGlmkS6JKzbOrADhzofTvMH7q6UlSs48ONinINHd2EbJu5M+4QXJP1mR5g?=
 =?us-ascii?Q?nexzfLtK1mk7sPnUKXudrsJInSfgU0meLzgAyRFiHOUFL+WpeJH9+tqYDdDh?=
 =?us-ascii?Q?fEotx7Lwt3LPdex4gSYHEXQSFCNXN6adesj2pnujZ99RY/U/fHZvqowMlBkI?=
 =?us-ascii?Q?r1dtM3KgoK8c3vrAohxny01xduQDpgdqWtxDA/64aXQC1vBCT4pD6LkFTkgf?=
 =?us-ascii?Q?C7SZppJi3DWL+5LQr209tw3PfHwRFPFLuIHeNT5EkFqXOTizsmdcdAv/cwAZ?=
 =?us-ascii?Q?6/t06Wt1SLIcqQw5RCyFBKCyo4chtbRlmtEIVLO+Fh4E+bZe4tsfpT8qRANT?=
 =?us-ascii?Q?BrqQfPkcuMtI+o5XVCqf+cnB8QuX+8SRcUV2mAU75+//eVSxOJLpZ6yJ5pfV?=
 =?us-ascii?Q?Yf/v6R948kGRQsVeKVbGVfaJdEf2BOhpkg6z07SGkvKF6trS9NmMbdn/PFso?=
 =?us-ascii?Q?uKagQ+em/hygmpga2UYFyy784Z5Ririv/pjaLClSVb9aRlY2A8bt6L1F6PZw?=
 =?us-ascii?Q?4Q7TEA1UXk68lGxC6h0KKisQ2eer/BJajbeGASwHrdpQnY8yV56yXgDOLCqO?=
 =?us-ascii?Q?VJmK0w80/aSxgrUUoE8YUN3VFqx2pmd6/VO46PD/WYhjgumGHryK0z+ogO9y?=
 =?us-ascii?Q?J6mWpzLabOkcElXaSMvhPhuBk6HV+pRHBFY6j774k808jhoMEF63ZPU9WKaF?=
 =?us-ascii?Q?ISNs/KtRiegWF5ncDMczx3Ax/c5faVi6DrnRQa5Yns4JN/SE1wgz6dAlg2Wx?=
 =?us-ascii?Q?PLorLh9EKE/iWr6EQnQ2AZlGAriO536+II1Qkt5J84oyHeLuiXB3VfDjKjVc?=
 =?us-ascii?Q?tvvRTGVnns/l3O67RxnGlBokcawxVYXQMqti3d6zKLtATx1bNJZWJ61BF8h6?=
 =?us-ascii?Q?8/KKcwhZ7Ah4m2pBkT5TsTkeNW9HSYhJ8kYf6nwXMM+DRH0cDdMWIOBZjxGk?=
 =?us-ascii?Q?MlKliGMEklB7/4zQqoko97BGcEC4IAvdtzsJ+o4oEVY2Xuo1630iuFrsSP+M?=
 =?us-ascii?Q?ClYtYELP95OjWpLyhXJeNRt/QymbrtRGaMuT4BUtLxHFkbFb0q1jprNiDHu1?=
 =?us-ascii?Q?j364Xu/urrPVkzqA7PCSTO4fyaXOqgX9s3duICTGJ0aEPKQI1zhrXuF7bW8J?=
 =?us-ascii?Q?ciS455ke3nUi73coSphzVlS73dOggFmhgaGHFi+DhpvBRpohQumYR0RnPlEj?=
 =?us-ascii?Q?8SW44RcdOY6ugDeynDldqJ262Ki21L1doyJiyGXTsDzWLUJSqWWIqZIjC2vk?=
 =?us-ascii?Q?fP0v6WdgPcNQxPENhXn70BgU1UtgReD4DWnjGl1K?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: =?us-ascii?Q?qX91ARD5NPY1GnKq3BbRhydbdmazRsJ5UJc8T3WSQ2OwCVEfOH+mtezDwgQR?=
 =?us-ascii?Q?W94cgfpcQan+pJoCoCUhvrLDzbJf/unioZKu4M6ZTaYJJVn164Iusn2c1T8b?=
 =?us-ascii?Q?b0G+WBmiGXPHTjQE1xc+M37pgM+i+EDyMdwBjZfR1TQljrZvLQAHV61oAw/2?=
 =?us-ascii?Q?fNDVHgv93+uHTmpkcm9R+CUmtV9fCdjYlySBrsGRieCHM4h3jA5snLrYAM+H?=
 =?us-ascii?Q?sXZQYe+10U5M34S5MwqLdeqTnbgNC8XuNU8KzaAUIV9aFc1UaPayP75wSBSr?=
 =?us-ascii?Q?FHq7gHmHLgKmN8fPxvSlAV3nUAw3Y7Z8FeraSJjVEahEZoBXBs3Q+dGuA5j1?=
 =?us-ascii?Q?0KfY2cbToKKrTvPNumw9DpjF7HMrygze+J0VUMPZSQQynM0hbKC9emvCRbxm?=
 =?us-ascii?Q?PoQePADqDn4dEjCtLB/NmFz216R9lAiYECseJpNHS1pIgYBFDwzO4i90PtdM?=
 =?us-ascii?Q?c4nI54+nv6kH5goWjm1I+etYjme5ad5Wgsvyg7xQmwZZZtNYa6XN0qbEZoKg?=
 =?us-ascii?Q?WajTG/z73NW818Zi3NYHk3FzJFxoAFubZ9qdmgrpQLE4WQOLsl1b2hzmBUpn?=
 =?us-ascii?Q?gf/lVVrzlEOYCLhWh75bP7HqmlQzjLzPHdvCVh2ZuT0iv20HNO215dADt/+B?=
 =?us-ascii?Q?Qae1HhScabOeou/x/9AW0geiKStIRobmkq+7oDzKbUr2zeQQTG/r56u1j7Di?=
 =?us-ascii?Q?7OrY0tH7oNb/AyxWJy/gIf/aZYfUn64407iwItITRfhuIvLuGja+DdSJPv+G?=
 =?us-ascii?Q?DY3hj+U+A8OpkvWrL6GNBK07cl3AncRovHrkoUP+xOX27lBH7y44vdBkdZ+b?=
 =?us-ascii?Q?eW0DhfDdauXcGb9Q/pItHdMQB2UWPXss+AIGcXhERHID7eTzCMOKHa0XCgMq?=
 =?us-ascii?Q?+hLMjET58EQ9dNrn3/L9D5BaWuk+i0Ezg6zU0rkkmY9qAOzJFeoEDhz4YzVN?=
 =?us-ascii?Q?l5Dp4aggVcFFTA9wOs0CVrGLup+PwqKi+KNUTeNbtkI/0gKEIL+D/+IHL5Cv?=
 =?us-ascii?Q?sK5nq8WmaWdJ7a7T1nw6IP2HAAfDzqDZ4tiqMVEZrgJxDi8JbIWmEhoQbhMx?=
 =?us-ascii?Q?G8mtdCgFdsevJBR9i62ot97k8aoTv9rq+Q15OcHoScwYFlYVLK1xlT8zzq4D?=
 =?us-ascii?Q?t8szfTCBYhzri6nlQbKA0waM8mA5Fv9sSn/sVyxMHw/nhug+xSQebD7wE2gU?=
 =?us-ascii?Q?edLklH0BwbUaY9BkIbNkIW+eaTK5oSnvHFgaOxXS+8NlnMSPPJYjO6aAIVw?=
 =?us-ascii?Q?=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fd882a3c-4ac8-47b4-f73d-08da7b6448f3
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1001MB2365.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Aug 2022 06:39:47.8646 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YXpGUI+TZa4vtKWdVmfVRI5v8QDN2GqBYStj8TQKI7VfeZrlVu4AfTF9WENO1GtRG7uWJVolB27FWz1DW/A4t1rEMtZWpZtex38lD7L2jQ8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN8PR10MB3267
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-08-11_03,2022-08-10_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999
 suspectscore=0
 spamscore=0 phishscore=0 adultscore=0 mlxscore=0 malwarescore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2207270000 definitions=main-2208110017
X-Proofpoint-GUID: H0Ml8X_SU5dTKrmARFfIyO4f2KsnitNv
X-Proofpoint-ORIG-GUID: H0Ml8X_SU5dTKrmARFfIyO4f2KsnitNv
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
Cc: Karol Herbst <kherbst@redhat.com>, David Airlie <airlied@linux.ie>,
 nouveau@lists.freedesktop.org, kernel-janitors@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Xiaomeng Tong <xiam0nd.tong@gmail.com>,
 Dave Airlie <airlied@redhat.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

If list_for_each_entry() exits without hitting a break then "pstate"
is not a valid pstate pointer.  Introduce a "found" variable instead.

Fixes: 7c8565220697 ("drm/nouveau/clk: implement power state and engine clock control in core")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
There were a couple other places where there is no error handling which
also led to similar warnings.  It wasn't clear why the error handling
was not needed there.

drivers/gpu/drm/nouveau/nvkm/engine/device/ctrl.c:111 nvkm_control_mthd_pstate_attr() warn: iterator used outside loop: 'pstate'
drivers/gpu/drm/nouveau/nvkm/subdev/clk/base.c:283 nvkm_pstate_prog() warn: iterator used outside loop: 'pstate'

net/xfrm/xfrm_ipcomp.c:246 ipcomp_free_tfms() warn: iterator used outside loop: 'pos'
 drivers/gpu/drm/nouveau/nvkm/subdev/clk/base.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/clk/base.c b/drivers/gpu/drm/nouveau/nvkm/subdev/clk/base.c
index da07a2fbef06..33f073ab3c49 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/clk/base.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/clk/base.c
@@ -473,6 +473,7 @@ static int
 nvkm_clk_ustate_update(struct nvkm_clk *clk, int req)
 {
 	struct nvkm_pstate *pstate;
+	bool found = false;
 	int i = 0;
 
 	if (!clk->allow_reclock)
@@ -480,12 +481,14 @@ nvkm_clk_ustate_update(struct nvkm_clk *clk, int req)
 
 	if (req != -1 && req != -2) {
 		list_for_each_entry(pstate, &clk->states, head) {
-			if (pstate->pstate == req)
+			if (pstate->pstate == req) {
+				found = true;
 				break;
+			}
 			i++;
 		}
 
-		if (pstate->pstate != req)
+		if (!found)
 			return -EINVAL;
 		req = i;
 	}
-- 
2.35.1

