Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 00B1769F9B1
	for <lists+dri-devel@lfdr.de>; Wed, 22 Feb 2023 18:09:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EE33710EA48;
	Wed, 22 Feb 2023 17:09:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com
 [205.220.177.32])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 466BE10E442
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Feb 2023 12:15:29 +0000 (UTC)
Received: from pps.filterd (m0333520.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 31M8x0nO001206; Wed, 22 Feb 2023 12:15:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references :
 content-transfer-encoding : content-type : mime-version; s=corp-2022-7-12;
 bh=6q/tzYj7B5qwfQqaKu5mYcJG5fEtdKckVtHoY3Vt2og=;
 b=FHzUCp0F51lq60yJXng79ha4SXEh42tZI4w03qHxREWVP6qxyAUfWlSFl3lqq96ovr8Y
 9XUu+FmfLzgFaZ9MmUvQa8KGJAMBg7GhVtDaHoXEnEew8KwTiLU4hMly2oP9uJZl5Ai2
 b8txlZjW9pyOlaWRGoIbOYGZujgFNVnLTA9izUsKY6tkzUBIUFtmbyeDXA/5yz78lJ3w
 Itp5Sg2A3MlLwfGLVI6yaL31annjx+TT1wKsvRrBL6wgp4PeyLrWn/jV8xrxDRpwD/SM
 fsBcrmQBmkx2kPFeSm70sJ447t19t6mGGxRHrcmuKYnuxIYOdHRAG5bFSoyuRA6UBWxm DA== 
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com
 (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3ntpqcfr9r-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 22 Feb 2023 12:15:18 +0000
Received: from pps.filterd
 (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
 by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.17.1.5/8.17.1.5)
 with ESMTP id 31MBqWwB027867; Wed, 22 Feb 2023 12:15:17 GMT
Received: from nam12-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam12lp2171.outbound.protection.outlook.com [104.47.59.171])
 by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id
 3ntn46qy21-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 22 Feb 2023 12:15:17 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nCxGqbiGxnqrlF2d/kTqJ7T/zpdHN1H8Beyhq+O/ttkH3EgvDH1QaDQq0hbqVV1amia9gcspnDPE6X//38p9QWCiQtIKRbEcxRsgTmHTgsemvgC+7y3l8P8uQ+HpXPa+2MdMyY5Gn4Fgb66H08pDapVZ9d5Oj+7BKITYexdFrhSx/bKa9In1vrIRhzsfRkl4FNkT2WkYdKoy51DGs7aSF5GiomWHnP598vZ2aQvKxePcBeQ0TnRX08qUkgVEeWvpvSNu+43uQbWLzR/fTiowYf5BciUnF6hx71DEqCJnoKsx8jJbNOdCnQOpNSO3lZj4/H2sYH8TxDzdxJX0U4CNDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6q/tzYj7B5qwfQqaKu5mYcJG5fEtdKckVtHoY3Vt2og=;
 b=GEMvU7XlIiyBse2ztpDfdLgA+jG6uQp43aHp3McEGG1v4pChlKvsu5orQ1p+rDtoWrK+chRSBnWuZt1+Y5RC33eLWhPeH2pL6a7jEy9PEEZ8vpqDbqmyNCbJlf/6+utsSJA8u3QOC2QOxEaEIg1W4a8ToWNEUsTlRdEw6UvxjVdRPKQqV+1G7Y4iahjOiCZb08t8tWEk4OPuy9bzHdJX0zOIc/BnBxqEeGZuRSODI0mNnV4YyXt/fGLq/+ZMXQS6QtBy1ciNvFSsEEhzlhegKdRj9zg1p4n+JxlmdcFxCc26FU7SIwf4evanpJs7lI92WMmtO6Zi3o3aPguXpE4kXg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6q/tzYj7B5qwfQqaKu5mYcJG5fEtdKckVtHoY3Vt2og=;
 b=UGbbUcUl2x5YjX+AfTDCDyLNClw2VnyHEnw/jDAi0qxphkTcKnKJ5nVqUtziJF2FpwVBiTaNnJXh3zuPMN+pz5bv/8JUlyXNwj9Af6PnHKQ9yUcw0Own7dGKS/GqK59TSuXu2xiL0X527my6cAeNzoYQB96R/R2BkEcKnzezzCw=
Received: from DS0PR10MB6798.namprd10.prod.outlook.com (2603:10b6:8:13c::20)
 by IA1PR10MB6805.namprd10.prod.outlook.com (2603:10b6:208:42b::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6134.15; Wed, 22 Feb
 2023 12:15:14 +0000
Received: from DS0PR10MB6798.namprd10.prod.outlook.com
 ([fe80::d0f7:e4fd:bd4:b760]) by DS0PR10MB6798.namprd10.prod.outlook.com
 ([fe80::d0f7:e4fd:bd4:b760%3]) with mapi id 15.20.6134.019; Wed, 22 Feb 2023
 12:15:14 +0000
From: Nick Alcock <nick.alcock@oracle.com>
To: mcgrof@kernel.org
Subject: [PATCH 02/27] kbuild,
 video: fbdev: remove MODULE_LICENSE in non-modules
Date: Wed, 22 Feb 2023 12:14:28 +0000
Message-Id: <20230222121453.91915-3-nick.alcock@oracle.com>
X-Mailer: git-send-email 2.39.1.268.g9de2f9a303
In-Reply-To: <20230222121453.91915-1-nick.alcock@oracle.com>
References: <20230222121453.91915-1-nick.alcock@oracle.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO2P123CA0087.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:138::20) To DS0PR10MB6798.namprd10.prod.outlook.com
 (2603:10b6:8:13c::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR10MB6798:EE_|IA1PR10MB6805:EE_
X-MS-Office365-Filtering-Correlation-Id: 86dc4e2c-7d81-4f1c-4f24-08db14ce7395
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: GEGfNEecPCe1aFPb7J+u2mqYp5t7C1QReH/FDqqclpyQj9t1RO08uY2aAEBvhPkCt9jKGZNrx/c7oJP6LSDd9FOguHvemZsX0uoax9CIUsmwxha3pafE9zNfAqwSDx/AkeamVjJTMuwPMOWEsEoBcNIPKRoe6tRpqVWT0XNlrSG1Fk9QuwwzQigrC1JcODks7yQ6Ui9S/v7vzTj9Hz35D5cdutxnFsyKdc22HkmXXt+nadOccjgG3B7m2d6Mhcu8bSUFdepdl/AVY178QP+HbNcWJHzG383py1ded/+1w+9TyrB4UKizn1Ygi/CrwkSYhADTl2tkB0H3IrJTKnE4rwp8zNKTAvW6DTz1JeWGeSFf4PIOqrDTYquQKnAUhTaaUBYZOXEPbeldN+CY+teTzeDE6mNhgVST+8Dl2de/6rsOfWYETexNwvpq6RJPyQJwfB+quFvjACYQVlbGABPAC+vUaRIPJbRXrhsomyFF8LRYzIWzuDemlFoGS1ucuOdn1IIt1vNJKelxDiCwKluGMYkpc3NtsseEy7N87wUzqnWJ4auNKhox3yM5ZOOWNZMO/1JSzWtTh6UI56jWJWWUhaQtOXBIQHAxCFlFF1SSWKugpSlpHhmNPG1uvA8fGxoVetqOSIdzQJO/WYwoGyuW6gPi/cHRQ5uFx8s/6VHOETwwYu8m0E9b1/Y/Qb/DgNoJZyseJ4MKNVwVkcfVJIJ7Mg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR10MB6798.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(39860400002)(346002)(376002)(396003)(366004)(136003)(451199018)(36756003)(5660300002)(44832011)(83380400001)(2616005)(6512007)(478600001)(6486002)(6666004)(6506007)(186003)(6916009)(66476007)(8936002)(66556008)(4326008)(66946007)(86362001)(41300700001)(8676002)(54906003)(1076003)(38100700002)(2906002)(316002)(504134003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?X7hNY1UQqbY9gfLzm/7sNpdlYB+i0bWGSRHKp6hYFIRc2RCnoeMt8ERuBGbg?=
 =?us-ascii?Q?4LhJfNKAyVXKdbJpGIFiB/6kw+RiGiP4WsLI0tSnCV4oZMtpHBee854tHjqR?=
 =?us-ascii?Q?oVkBIx3HWNQbl+Abjan8gkKGuXAYyY8n/9hpFlBFFsxrEPEoqmXNGXK7q6d7?=
 =?us-ascii?Q?VeJOrOgLc6/ZvE+i55vO7dhtGo2p+XagtGoWSpQF5zkhGErJMYX7JTHW5sKk?=
 =?us-ascii?Q?up3xM6S6YIpI0vRcfstrkhtR0KLftEMHtv04OlEoIYmQD8Ak5QTRvTj/4gr6?=
 =?us-ascii?Q?Kr6HN5DdTXkrmEs633YTtIAbjvpxdpQPK09Wx/mruCLf0/dSLmkkx3sHz8j7?=
 =?us-ascii?Q?QbTNRzMUmnMs5516dN6s+jv5UuPw2v2MtwqgNg1gqe43wWNEVyKwqqb0+QCJ?=
 =?us-ascii?Q?2d2nq0RTNnxFpAylRXJvN2N6Ocq+9pSCRHhDQKEu4RF4MI1DroQIEX6ia40P?=
 =?us-ascii?Q?7/nhqEiIF7A6ixAqA0KiKoMzfYIeCEemajQfrucY4z2WX3VnGEfSleNVfFhI?=
 =?us-ascii?Q?WkMGcBEZfzEDBN95afkxLC1h/NpuA6qfUvsIPdLpwCUxiG2JM4YCcfxK3Ddl?=
 =?us-ascii?Q?qg5XdkhbgH1dL90nDFJq8AnzlYx6j9qh8Zm3WgO30Itvy+h10wNJHM29cFJR?=
 =?us-ascii?Q?/nGVAp8LyAV2IizYGrCu7oxeI8x7Ykkb2Oux69JPzqTsQJNUNs1TWo/fQkXR?=
 =?us-ascii?Q?8xO7e0mbNGzIJQ+0OpdHL2Y5feJrYQpNX3tvU+MCVAqQ4PNBK1cuZJT5gyC8?=
 =?us-ascii?Q?gjK4VPlrEy28sP7jW3UX0jTOoY/cH5o/TuLUZQLOAu7SL62copGRzo3Tzc4M?=
 =?us-ascii?Q?3Lk+fbeN6f4r3ppX0MSCNwDCoA38Ib+gCdPljOkjqr+WKawD3AE6uW88/qkh?=
 =?us-ascii?Q?lIwWpAKgT3/I5tGyWU91h8PQMRwq02PJa+J42/CHIpCnVfYGScwI5M8HEyM5?=
 =?us-ascii?Q?tDTrBpeBgYcLQyq0EtiazO5/J7rBZtMNjY6PfbbUvOnC0YgCLk+09Tpqkhe2?=
 =?us-ascii?Q?yau0U6UH9aWzXvm4HYNqKQr38rhVJYkmqHaCmgTCeMO4bShyD/Ek8b/7gErp?=
 =?us-ascii?Q?p/XH/FPTLSTPjQ9v7/aqoNDIcMzwkyxo/xJp775V+VxiuZOSnqvYU593j9vP?=
 =?us-ascii?Q?XiUF/XSyHAd+v27XY6/YrqadT8E8wBYoUO7WYrUbv1TU7Pen815jQ0AlMdBZ?=
 =?us-ascii?Q?62cy9bySob7bL4+OezUumP9rlFRrInT7M8BqRWzwvLtNko/vL/kz6y9ho6mi?=
 =?us-ascii?Q?fEXl6i1ukiM+S81ohfhkRK1g+2ABPMJUhTonD/BQ+uUsJEt3OWUIkDziPEmA?=
 =?us-ascii?Q?bdMfu/TJxC5qYugNbfJxpo74u/TxFe/1vUpI5JI7KazDW0e378bdXdpVre4q?=
 =?us-ascii?Q?yVg+56hA1eMINYOAI0dBm2ktcCX0ojzRMCjFsCikZjE+i1nYCMr6d0t5MzRa?=
 =?us-ascii?Q?8AIQXd3KpPOTRvIogOGBldkQa8ACl8McZX9r4+JRpiWrSbZ1kXrVU/4ea0+o?=
 =?us-ascii?Q?aR4SvgvP8MRUaK06zsu5B/yrjUfk+ZKMIsnTRPJ1uRpZAZjJktk7edd2aYnp?=
 =?us-ascii?Q?n/SsnDXonKLXt3ym7FHddfGrxSrQvto+Of1jDovwWve7w5J+QXUCk77UIovi?=
 =?us-ascii?Q?CQ=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: =?us-ascii?Q?2z4Ouh6wUonlCxOo0Ugw3xDEtTS9J0BOkrBP0WFZU6FeyFast3Vmv45gXFGv?=
 =?us-ascii?Q?R4RaanrlZMvfcbFN8TjTbTXXedwTgLkKvulmDGA+LuHXvBdMmNcEHCk+cG+1?=
 =?us-ascii?Q?YpyshwHrXjczUDA19KAvt0D64a/km2lNFmiUrBGSSDlISWZYWk5Ngw6ka2iX?=
 =?us-ascii?Q?jT2um3DJsaYqvXCvXEqopL9H15nQJ1Nm8HY1dJ6uVo9VT1+qIh5up0/+Ka+6?=
 =?us-ascii?Q?UJwD1egfJlHoQxV+nn6dypZSJxU5QGEKz+ad9oGJcXjjbza6rhU8yt8Bw/XU?=
 =?us-ascii?Q?6zU4lnHa76XI6RGjHKPBibHIe6PnNtqxt1iVTIx7egxCEexw5XcxZZ9yfG6D?=
 =?us-ascii?Q?/qxc4gzbX69LGAp3at7IBohSjjrIWg7MKj5nhJUovehPnwNA5wVkue1AvOsP?=
 =?us-ascii?Q?6kLTNKYi4VlRRLFf7kLYbF8XPAcDKihOEmqr4hCMJOIRv14hRDMuF5Id1jiM?=
 =?us-ascii?Q?KGQJBsH6ilk6DFYDxCn1KVlDyrR76+wZvVtUz/gUt6sCveuYFfoIKHZ/SOc6?=
 =?us-ascii?Q?6CsivZjTZEpZaWv8C9PoZx49y/4BmYucaNZ1i7jydd6XFQUfp0exM6XI00Ow?=
 =?us-ascii?Q?hckxaKcYyB44f1lO0IorkINGU6I/25OFiS6Rz9bUq6N/CEHhZ6zObkCY3MH3?=
 =?us-ascii?Q?rH3GQDJChJfeivUrpQJfLI01wvtXUJ6WoFY/HCUza1NzpFyTty+GgerG0LHa?=
 =?us-ascii?Q?UtE3RKIMf/wIsF74yc21Wx/vW5YSmbWWjFmL3B7Jwg5iPEh8wxdCQQGeH6S2?=
 =?us-ascii?Q?JypcHcxh5Ue3yuwABuHPA9pgUfGidCHo5ABfKLLS6PHLNYnigf9kZ/G8ZeBS?=
 =?us-ascii?Q?ODZKD6BOpXe7w3mYI9/A2pc5SmDk9ZQsL6b/SPsBd9uYyfg8jGXaTFpWQXKF?=
 =?us-ascii?Q?01/7yra/V5TvjdngS5zTzgYnP1fiAwelTJ1oYgNe4rfArLqKqxcWWrNtv6Th?=
 =?us-ascii?Q?j1UaxE0AU5yFoa/ilpP1Kg=3D=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 86dc4e2c-7d81-4f1c-4f24-08db14ce7395
X-MS-Exchange-CrossTenant-AuthSource: DS0PR10MB6798.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Feb 2023 12:15:13.9446 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ScTbwpUw6BVdj12rDrwaRmM9YjRTeSp7kDqZbMEebVa3Kro9jBso7EBbGiGV+fY1ZrNIVbSX5dWQMCiNrD0itg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR10MB6805
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.170.22
 definitions=2023-02-22_05,2023-02-22_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0
 phishscore=0
 mlxlogscore=999 bulkscore=0 suspectscore=0 mlxscore=0 spamscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2302220108
X-Proofpoint-GUID: G1wS5ZBOTFuLgULAMEAwaJMi1YzoRlDI
X-Proofpoint-ORIG-GUID: G1wS5ZBOTFuLgULAMEAwaJMi1YzoRlDI
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
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
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
Cc: Helge Deller <deller@gmx.de>
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-fbdev@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org
---
 drivers/video/fbdev/wm8505fb.c    | 1 -
 drivers/video/fbdev/wmt_ge_rops.c | 1 -
 2 files changed, 2 deletions(-)

diff --git a/drivers/video/fbdev/wm8505fb.c b/drivers/video/fbdev/wm8505fb.c
index 8f4d674fa0d0..2a2997c647f7 100644
--- a/drivers/video/fbdev/wm8505fb.c
+++ b/drivers/video/fbdev/wm8505fb.c
@@ -407,5 +407,4 @@ module_platform_driver(wm8505fb_driver);
 
 MODULE_AUTHOR("Ed Spiridonov <edo.rus@gmail.com>");
 MODULE_DESCRIPTION("Framebuffer driver for WMT WM8505");
-MODULE_LICENSE("GPL v2");
 MODULE_DEVICE_TABLE(of, wmt_dt_ids);
diff --git a/drivers/video/fbdev/wmt_ge_rops.c b/drivers/video/fbdev/wmt_ge_rops.c
index 42255d27a1db..c207fd917dce 100644
--- a/drivers/video/fbdev/wmt_ge_rops.c
+++ b/drivers/video/fbdev/wmt_ge_rops.c
@@ -170,5 +170,4 @@ module_platform_driver(wmt_ge_rops_driver);
 MODULE_AUTHOR("Alexey Charkov <alchark@gmail.com>");
 MODULE_DESCRIPTION("Accelerators for raster operations using "
 		   "WonderMedia Graphics Engine");
-MODULE_LICENSE("GPL v2");
 MODULE_DEVICE_TABLE(of, wmt_dt_ids);
-- 
2.39.1.268.g9de2f9a303

