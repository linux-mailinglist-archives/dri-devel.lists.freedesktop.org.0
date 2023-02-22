Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A03F169F9AC
	for <lists+dri-devel@lfdr.de>; Wed, 22 Feb 2023 18:09:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5057710E2DF;
	Wed, 22 Feb 2023 17:09:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com
 [205.220.177.32])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9783910E046
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Feb 2023 12:16:13 +0000 (UTC)
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 31M8xokI029999; Wed, 22 Feb 2023 12:16:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references :
 content-transfer-encoding : content-type : mime-version; s=corp-2022-7-12;
 bh=TYxiSO+DpfpDCcYxv5sIYzBoPGCJ6wmgiXkP2Oel+eM=;
 b=x9u2H6vtW0G7MqZTh0YEMU2D6dAFsotqT1hgpzig35NYuiz0NbsoX7oCyb7vnwZ2UxCv
 1ES6uYtaPbBMcLcWkKEnTjNsb28Ld+ahSyaOr4PLXPl/jI/Z7KgTR6rn+25y/AOFpu9/
 U18lFQWoQkjvjdfEcCcLp7T1FyBCsuXHowQyoE2OETAZu6Q6nGl7cEBSL73mFaVETgZy
 iZI+zj3zGE9gsTL6pVjH0dm0bXZ5nFZ9MZcoZqLBX+ds4WNRHsvEfN6mc7lSpJcmjuA2
 oLSwmhjluuBdNysO8R3LjVi3GXUfTtOrlsQarVUUDTQXS3W/jLoJJAZ9guG9oNdMGeDv vA== 
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com
 (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3ntn3dqqe9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 22 Feb 2023 12:16:07 +0000
Received: from pps.filterd
 (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
 by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.17.1.5/8.17.1.5)
 with ESMTP id 31MBaI6P012903; Wed, 22 Feb 2023 12:16:06 GMT
Received: from nam11-co1-obe.outbound.protection.outlook.com
 (mail-co1nam11lp2169.outbound.protection.outlook.com [104.47.56.169])
 by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id
 3ntn4dtbq1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 22 Feb 2023 12:16:06 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=G+3XAMsC2uVX3CpYRX93u7DtZfPjhTlidtUyfE9Nklpfxo9+UD0D+Mr5ep0PyWD9HM9Nb59plukJFhp0qB/Pm9vJtXZbA9NBEsj5nRL8F2SUYDvuG5q9d4GF8Lu/YPCFOV60MhiuEUtgF4zZkt+jGOD10a/m11m0PEzJkeUjT3eRLdZzY3x1WJpOz4OPNb9nMufjIj3IpnqNyiE4hUgaxcnKCjElR+t0AOzsPNDNBQ+v/dvIBfSHHQCrvJ7rXa6fPf3CcxmuxubkyA5zxpVgr1RelM0dp6FD8JZTf3W4qnsnCozHuIMeGPTD+1xnvi5HlTE0ZerV7L0cKkSxg8T6Xw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TYxiSO+DpfpDCcYxv5sIYzBoPGCJ6wmgiXkP2Oel+eM=;
 b=JyrsceS9kWFCq4oD19MFvCpISsFmxThf6rtMY3KQ7SRBrmiF7uDuKWKN6suCcVU4uUgCV8gfa6weINmF8hRe2cYBi1tJMRohVuhHObpVQ83uhaNdYix4Id+sK1IoPhCyHQqfRQIbt0yi3cEvrT6gFtA/sV8RNpa/+8lmmyi1Zvqq0WE58hQTdysKQsMQn9peiUaMKdctSb1y/s13koVk6f7/sTc4Uq/Imh+qLXdN1BsCmI7HfYvqw5eaw1lTlhyiv8ZxxXKoyvwQYARe7n2th7u/iZGnS+MkY1Nsw0AZqhsAkW6HoY0B7WTFwjrC5vzhei+zSB4ochhnLiir04zcaA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TYxiSO+DpfpDCcYxv5sIYzBoPGCJ6wmgiXkP2Oel+eM=;
 b=GHmdgfWWbpe3EEpZiD6QQywfvLt9WR8tGh0+sC5mB/RGgRXzuVKR6YSJyHXfQDmOLFvtwH3jAm4kJ+hZVBAEXNW3kjxgQLRHtbf2MtFKFuHw0gsNv5zNvpDvLx2jkVzgvaShHQUSP1haFRbVOanrGl+Ce87DrFsI6m+vtHXDgXI=
Received: from DS0PR10MB6798.namprd10.prod.outlook.com (2603:10b6:8:13c::20)
 by PH8PR10MB6412.namprd10.prod.outlook.com (2603:10b6:510:1c7::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6134.17; Wed, 22 Feb
 2023 12:16:02 +0000
Received: from DS0PR10MB6798.namprd10.prod.outlook.com
 ([fe80::d0f7:e4fd:bd4:b760]) by DS0PR10MB6798.namprd10.prod.outlook.com
 ([fe80::d0f7:e4fd:bd4:b760%3]) with mapi id 15.20.6134.019; Wed, 22 Feb 2023
 12:16:02 +0000
From: Nick Alcock <nick.alcock@oracle.com>
To: mcgrof@kernel.org
Subject: [PATCH 13/27] kbuild, vgacon: remove MODULE_LICENSE in non-modules
Date: Wed, 22 Feb 2023 12:14:39 +0000
Message-Id: <20230222121453.91915-14-nick.alcock@oracle.com>
X-Mailer: git-send-email 2.39.1.268.g9de2f9a303
In-Reply-To: <20230222121453.91915-1-nick.alcock@oracle.com>
References: <20230222121453.91915-1-nick.alcock@oracle.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO4P123CA0507.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:272::17) To DS0PR10MB6798.namprd10.prod.outlook.com
 (2603:10b6:8:13c::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR10MB6798:EE_|PH8PR10MB6412:EE_
X-MS-Office365-Filtering-Correlation-Id: 521109a3-31a9-49df-878c-08db14ce905b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: S+9Q8aco4/lov1uIlQ8dD73AnbojautfLraLO+Cc87pF83DkOQERUbZsJxRh82/wOC6r8T8+6wYognJV59Wk+fAlGztdahWHXOX4drJvBeoUjSqZ5fLbOpcyhWrspwOBoPhgHkgigrLotKh3dL4OEhd7wOCbMaJmM5hkIvx8dei4I3o7c+ImI/Vqv5re4dcbiGlXKl1fRoVFXKL9JsoahL4nW5caVk+kDGXIev/SzJlwoL9DGgc5GUZdDmt8Iyw3Hrw4ZU39ZQiOCGwrR+fHgV3IXVDtaU6g4G86+y03+6dNZev/A1VohvWGGlwkI4j29Fn6lOZZJj1XuFexl4N/DFs6CzxNJ/EHS/qigig+sqNGxDDO5K9HA1jFhrB4PpwQdHAjnNUKtzG3cF2vUd5ZoJct6pWBStG+QHJg2Gp187wotZ0xvkUVW+vSRk0IJ8JVSndG0DxMYBmbf4nR39pHQenvrexYONBM12kqlUJ9+wsNzi+ynT2I7S5xfbHt9csWAAVOc/YjCK1Dz/cBUIRJFmBaMbGigGMnecgbC74z//FN6eTu/aVkR0xgVLY4DhdV7HmNE9dCfhcvvSswFz/3GMo8GfNIIzkPKOpJT+mqc/uOXJspaRd4DnrQCCS0ROagcww7KcNpbBdv8PMPkZ9Wag==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR10MB6798.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(346002)(136003)(366004)(396003)(39860400002)(376002)(451199018)(478600001)(86362001)(54906003)(2616005)(6512007)(4326008)(316002)(6666004)(6486002)(1076003)(6506007)(186003)(44832011)(36756003)(5660300002)(8676002)(38100700002)(66556008)(66946007)(41300700001)(66476007)(8936002)(83380400001)(6916009)(2906002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?o3yD/ujfelHmhZNPbrL9paXnOV5eqkDSLGqz7n/zNgn7im8UkQ1faQWqSI0Y?=
 =?us-ascii?Q?dLSx4miO862li2uedUMu83ljCWhkKamSlcI4YZJd/uWeZ9K4m9r5uBycvFpD?=
 =?us-ascii?Q?6bStvwlhRRze9769mm37LKYGavhW4EMNiujiEU3Xb+OoHVv867rnxbxqqh2o?=
 =?us-ascii?Q?1sPBi7x8RxA3C+RIyrqmDF8i9m4jZtaAnMF6dhE0nKI/5W0/pHtE19TVlRoy?=
 =?us-ascii?Q?u8YMYhsNTXD39M/CBfQOEKuFRPt6yho0ip+AWUmRw66t4f3yKC6nWzwRN32k?=
 =?us-ascii?Q?5F0gPJJfbgFnHGzigFkNavkZoGLjz8axUJujtfkwxtaleVfTOtRUT1MGyGY2?=
 =?us-ascii?Q?00woaL4uilmmQC91sngpTqTlPc3oyFo6kGqpvzTVWKSU+iGsjrMVbDM1Y2/8?=
 =?us-ascii?Q?+KvHptlGdnH936ixv1cGwDYlwZQ5SZRShKBsHV3oXI9p6MjiI358BZN6+9v+?=
 =?us-ascii?Q?AENrohANKuMePu00DyVzs3mgCS2D+bKVs9Fb9X4qazbfhhbS5Nv04343nuQo?=
 =?us-ascii?Q?7LEd6Lr+2R/kHUxPtlNZaLiT7FFvGFgr8jRBprvwjiVTme6XQFJfxlagRNCR?=
 =?us-ascii?Q?nFl0A6HWwOJ9gBL/hrT7TuCcjOP4xLpVB1oUqYVxR9xSbUqxiU6FiDR61XaN?=
 =?us-ascii?Q?aXhjhUlm+mZycZsCLxCKKhKrTQIWZeNwm8cfa+iQ2uDstoRdpAjT3+GFBiKo?=
 =?us-ascii?Q?WVaVPzs2ak14n3n14wVyHahd1QWL++ZwjC0wMOpBKk1Ge7EodUIbzDOBiW/b?=
 =?us-ascii?Q?ZRAnNG4XWD1ROMLRzXMswaAFJ2kRdEWmYAi5NcaE2cttXh5wZXt1TulO+hJh?=
 =?us-ascii?Q?ylFRauiXP0r4Z1dWTSn6icPsTLsWUJDUP2lfUWpbT+4Xqv41lZssy3SBCQl7?=
 =?us-ascii?Q?HyMxg+9bnO6lsPtOP2OceRcYxKBep/UEfvTTFsJ8UejKXE+XqfmN6tRfzoRv?=
 =?us-ascii?Q?RpP9uya2v8xYvOZoFn2X3RhSRQVkGz/MkxYHYOMh4M9px1rt+x6A4hcpsM/R?=
 =?us-ascii?Q?RagWTloiYU3AXPoz2EqsshesfXNCb/dNe1Fy8zV2emsxlWyMV/TXtjYwdzlT?=
 =?us-ascii?Q?gPDj4a/ob64qRKgfyaueX18EtaagV3xVRu4WseCh/AsR4JKQ3ZxnSFS5i7/2?=
 =?us-ascii?Q?fTdW8VjDlLC7QRm1alAp6ipTzMr89VxCAr1z8vOpXtx3dxvOF9TWNjYV2VLn?=
 =?us-ascii?Q?88bT8i57pZmeNS2ix1wPsNFrnnSFcA4V7U09mWxdq2jBf/dft1aSS3uE3R8H?=
 =?us-ascii?Q?UVS0zNrKMXh4V8y6AfoKHcnj80OtEY3BWXYH7YrpCJehnPFlXylN6NJuCdE7?=
 =?us-ascii?Q?vgZiyk1WWGzzLEQjcRw36aAE7hYrKsS1m/9lqh3AXXAxSNCEbS/k3WuDs/+c?=
 =?us-ascii?Q?AjPcYPw3tG0ohPhArJBPWngBLrDr3uUOj1d5Gpy/aHRucYvKNQ1qUYmvU8qh?=
 =?us-ascii?Q?gH7GeMMWNA44+EWULzarjJaKTcIPP4A7Nva9bM5awjXdK3CN2gtx76vRTUrN?=
 =?us-ascii?Q?tDU0PBMf3dkpMmqrU6XLbasu3A5i88ld2AOk2zdTZB5BeznLU0GCAjMDmQXS?=
 =?us-ascii?Q?GJFlBr1fKM12z6HYF2WjBdvGfjcsqklDwkrwoDyyQgt7S55DTY/6RcjD5HLQ?=
 =?us-ascii?Q?VX0JUbQlDCMn19WdeCAEL8U=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: =?us-ascii?Q?cW+a1SWXJSoui72sYJ2a2ccswkDRWgriEQ/lrUt7nudNONTao93PKSjZ32pD?=
 =?us-ascii?Q?wsExt9TklygeKu8r2NO0vEG9wqZgP8rtJ0bEQatlWQO+Euf0s8EJN5VS9Km4?=
 =?us-ascii?Q?rPuhRRFXHsihE6Jay9m73jeyEzwOAqiWtH9atxsmTwW30Rony0FCByURLJT1?=
 =?us-ascii?Q?SOv+e/SEgMWXEtVdV+8erAQxW8ucZS/JxkEj98g6bxhm2an3eeC2jJqZ+IJ4?=
 =?us-ascii?Q?Pibdrm1KCJoeS2UbQNa52M3mlZkPDjjAtbpJPlpx0Uj00zhARqAE97kL6aJi?=
 =?us-ascii?Q?mUbFh4+pGIqG50IUIWOQOWQnic/V2JV9t4DCVe3E7M9yL7vHIRhS4+vqovWA?=
 =?us-ascii?Q?EAy30RTAhEXjj58nJOf9pQwwOqoesT8LORG162zBl22C5q2DnWMqLzHkkUU5?=
 =?us-ascii?Q?1rqmZeNcjFQtTpdrpYT6/8aMv15fheVqzMCKi+yVSbvq/Vyx3dXT9N60KFrl?=
 =?us-ascii?Q?vyC4bgIMrDdPIMO238BtefE9xYgPXY/70P/V+Q2jG7owxuiLVCyg9XDq7l9g?=
 =?us-ascii?Q?R2fmbzpIx/Sq6TYK4YQPzYoTO/IGxtvCjHQRGCVjJkZbhAK0KlLPjA1/X3TT?=
 =?us-ascii?Q?zlPJMmmOSQVsqk43mdMHuYaqrlTl251kHKHI4p+Lz1dijs+To0NU/bdQ0upM?=
 =?us-ascii?Q?VqWSvCb0ywxUwnq5IiI2sipDWFvIxu+BSeDcJ8rdUHoCt0RmsCA7r/QthAv1?=
 =?us-ascii?Q?JSED/jYK+KpT/4gqs2SNGem3X9zRZ5bMD6/T3rj1OoaQbXjnBIB6CflRT6Ra?=
 =?us-ascii?Q?7ir+Q1I3q67gNm0wCTfzPbW3Fqm4pn8ZiJkmQFaA00VstPS0lMOWxPMRncW8?=
 =?us-ascii?Q?XybwNluPlUjVYz+0CbFKhRQbmqu5Yxudp/O9JwpUS0fqc7KvX+U3IpIEC+FU?=
 =?us-ascii?Q?hrVHWTK4cG2GpFc65VrIKcGGh9/KDj0sbisfsA5SlhR5wJtLAF+Y4IoeOtmd?=
 =?us-ascii?Q?fQyZLtNoXXtRYKyBLRvVJQ=3D=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 521109a3-31a9-49df-878c-08db14ce905b
X-MS-Exchange-CrossTenant-AuthSource: DS0PR10MB6798.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Feb 2023 12:16:02.2043 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: c3orK4rSwVihI/Y658CwFUm31Il0oMDLeEp/rJP2xN7v/f0StGs0k78vY+R9G7eAOJb4Io3n3cPA496yLNZ0bQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR10MB6412
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.170.22
 definitions=2023-02-22_05,2023-02-22_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0
 malwarescore=0 spamscore=0
 mlxlogscore=999 mlxscore=0 phishscore=0 suspectscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2212070000
 definitions=main-2302220108
X-Proofpoint-GUID: PTIHjmNxRg7e8XV6KQMcyIdJHbzp0VlQ
X-Proofpoint-ORIG-GUID: PTIHjmNxRg7e8XV6KQMcyIdJHbzp0VlQ
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
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Helge Deller <deller@gmx.de>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-modules@vger.kernel.org
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
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Helge Deller <deller@gmx.de>
Cc: linux-fbdev@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org
---
 drivers/video/console/vgacon.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/video/console/vgacon.c b/drivers/video/console/vgacon.c
index fcdf017e2665..8e13af1f9042 100644
--- a/drivers/video/console/vgacon.c
+++ b/drivers/video/console/vgacon.c
@@ -1204,4 +1204,3 @@ const struct consw vga_con = {
 };
 EXPORT_SYMBOL(vga_con);
 
-MODULE_LICENSE("GPL");
-- 
2.39.1.268.g9de2f9a303

