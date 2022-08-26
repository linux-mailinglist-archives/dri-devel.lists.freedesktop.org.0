Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BF645A2758
	for <lists+dri-devel@lfdr.de>; Fri, 26 Aug 2022 14:05:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3EFA910E569;
	Fri, 26 Aug 2022 12:05:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com
 [205.220.165.32])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5DBCE10E569
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Aug 2022 12:05:27 +0000 (UTC)
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 27QBPbIk027154;
 Fri, 26 Aug 2022 12:05:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=date : from : to : cc
 : subject : message-id : references : content-type : in-reply-to :
 mime-version; s=corp-2022-7-12;
 bh=csTBbfLz9c0aM1UmSZfeWjyiVcCdYXAurhfMobPOzak=;
 b=qgmj3UxoYXgyBIBzh8RA0nvXKKepnGX18Pff2fSL2+kroGWGnyc0XdKaRVnTSIWgnc7g
 5rX287TJMOxbccwK4EI3XjXJjuBfIPJqOW+xcQV7DS1HpAJjD8KUG9h2coDNOdVCMglc
 PJnnSrWQJKUAcyXsQoafvHikzLgMcmtLMOFgT505yjQ3IA0fTPLr6pHss8tGKPgM2mJl
 Zsur7FKYF+umrv4yxIRhbE/kjZ/KSkZs0RhHk4JqqhtahZJxl3rNkfyGQcPua+WOQwrW
 PRxxB6kMVhUAeT6CNISOMqEx4+v5dJW3Z1JPBX/UlqlXCZbT+YJ4DN6ik3XYdPKhd6zG ig== 
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com
 (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3j55nyfr9r-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 26 Aug 2022 12:05:21 +0000
Received: from pps.filterd
 (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
 by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.17.1.5/8.17.1.5)
 with ESMTP id 27Q8OoOc016229; Fri, 26 Aug 2022 12:05:20 GMT
Received: from nam10-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam10lp2104.outbound.protection.outlook.com [104.47.55.104])
 by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id
 3j5n6p81ft-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 26 Aug 2022 12:05:20 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ax4z8oeqY1Bo2MSHFlP1SdZthPmrxx7sqT02KjVvGoIAO7BggFweMhAQ6x7J9mgHnRiSbjS/KgKUYZw/DsNcK2kZXTBrPT4q/e5s+8E9AlcYYZdnRkijkchBUmOZDUPxnrpOYALRm5ENAbRTrjiG8NVbPOxaq8aqSx0/0O+V0Ry2EG1DTpl8oeZ8Y41EjtwKP9ZduDsFNnFH0Nm1o7OXerHAQWNO1L4VUePel3rzaQ24pCQePGs6hf9oXslVDqQxciNNqKWV1cXR0mbR4o8Vkh7deOhgiuKsSBMHPGAUOmoVCtXo2VR8gpkvazwE5csh7KOxysEWFFCEKl1ujyTz7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=csTBbfLz9c0aM1UmSZfeWjyiVcCdYXAurhfMobPOzak=;
 b=ktsutK5av9H1Ut7vobzCVnDZJrukSxpmE47cMemlEBP856r9/RRQkS4hb1Mj09n6x3ncxmytd61qR8wH4P8O/ipNYoGx0SkLRYt3swg5DOML9FKuMfN2MsNEEyt0MhKe8tIu/v1auZz0H4xHZZfBP8g74f5fiwWrzOWj56kWPZD9PUCOlU3aLTtYUhdHy8hTythwmTuL6DQD1R+IHL8hthjSgqLTP4IV2I8GVsbtAoFlN7DSz+rqVVoDbwNvlBM+yAEsKqJY5pvNItZ+CbtTY8cEJnfmQJ/hMj2taZOmCcjpCqMqTGBkmVqb2eh5T7HdcOWvqmqDCzYNZjnmwDRSSg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=csTBbfLz9c0aM1UmSZfeWjyiVcCdYXAurhfMobPOzak=;
 b=B+vOf9P3wEwDg8i/voxpT5u8VidYdullBTT77xxQoNgc2WhKrDcUaJ5f9Xb4j/PCENW5L7IjpZEq73Fb1RpQTO7NagM4xMBe+P0cZ85joNF+AWULA6e/EFaLBf4OduFxlbwNvPqTcAG/WDI9CpYGd69ixlgPKVZiTWn1wSVxtpQ=
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28) by CY4PR10MB1576.namprd10.prod.outlook.com
 (2603:10b6:903:2c::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5566.15; Fri, 26 Aug
 2022 12:05:18 +0000
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::209e:de4d:68ea:c026]) by MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::209e:de4d:68ea:c026%3]) with mapi id 15.20.5566.016; Fri, 26 Aug 2022
 12:05:18 +0000
Date: Fri, 26 Aug 2022 15:05:07 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
To: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] drm/tve200: Fix smatch warning
Message-ID: <20220826120507.GI2030@kadam>
References: <20220505215019.2332613-1-linus.walleij@linaro.org>
 <CACRpkdZKUGu_BCP1sUWU_-ObNuc9MhgO98WRi-6OT4Vv-VYibg@mail.gmail.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CACRpkdZKUGu_BCP1sUWU_-ObNuc9MhgO98WRi-6OT4Vv-VYibg@mail.gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-ClientProxiedBy: MR2P264CA0187.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501::26)
 To MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: eab83488-fefe-40a3-e21d-08da875b3e06
X-MS-TrafficTypeDiagnostic: CY4PR10MB1576:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: JWpsHrQ4T/1BKjeWanItruMfpaj+TiyBVj+wFdsdStK1vWK9wxNEsmTHI4Le1BCilNNg9Irbyh9Asl3NQAMiPcLikAnF+I0PYlt52YprXbF7tJVixznoOvsCkQPry/foNtclZW6JO2HEurhs1q+zfmPME0vj1Dj7siUD8fxrCTUnraWlq/+pW4t1Ihci3qWT26xeyWlHsWqJwiTz/74rIhYRXgWWtghrhKSO/IYUQ6ij2rR7OL1wLFLBeh2mEpGNhAeiIajr+YdHoK+f2oI4NIunf/3jSySWsEj3KBqELokZNZu3bVaMe2J75qwd8L4n1g1OAB6U6NZY1Om5ORh2UAmrCX/85lo70grygHCJRQtqf/lIkjtkw34kPyJETZ2d7W1vpTQC/328691rCcA9YKLt75+lSEPj4r1vTvSALQU33V+i8tg4WBTLT0BKOqlr9Ar3LRRFH9EQlu9dkL+et29QdIQZvMbRVh5i58r46nhNT6Zgz8oadlKMACGtiKYyhNKH/sMIduvxFAqFiS9euQar+FbtC6b1ty/dRBsjbKQOqMyRghGpp9KcEwtIlCZP3i+CT5SO+ANsMdluUTZ0b3PyhWGn/+S+8hDh7+rSGgvUGEs3ZV2itMLWZphx1HIsAg8nBbPqpNC4nWCuWC5Q1wvg4IKduNUHoocRE9s8lwgTnqbgPM+1sGdeO1pmygbKENOY9UOfbTcYQSaD6I/0a48a8lVKknUArMh/1u8UCSxaSSHd05S0W9eN3YAJapCR472Tbdwyuwn4HVUx7rzGrA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR1001MB2365.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(7916004)(136003)(396003)(376002)(346002)(366004)(39860400002)(26005)(6486002)(1076003)(66476007)(6916009)(4326008)(33716001)(44832011)(66556008)(316002)(186003)(66946007)(41300700001)(9686003)(6512007)(52116002)(33656002)(6506007)(53546011)(478600001)(8676002)(6666004)(86362001)(38350700002)(5660300002)(2906002)(54906003)(4744005)(8936002)(38100700002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?ML3EGx2F9FipuSPDkedeCDwacwQuvvzNSF+GHTR+9CK95UKsgKeI912TttxW?=
 =?us-ascii?Q?ICmz6HaPSdWAeroypfNpHTSW+a4vt7FFTsL002rHTEmpBqNhP92v0N9E8VdB?=
 =?us-ascii?Q?CmPo2W5txImFOxNl7f3ttrpD202J07gT4EPzbGVHaR8c/TgkCVsn/CWuEQac?=
 =?us-ascii?Q?JM2G8NHIIGr9wOgngllZJp+UGmOaCeWTaDnlS8GGQJaeRpuqT68wF3aujPV/?=
 =?us-ascii?Q?5PJIfPGPe+Wy9l2IDPev6EScC9akv9MmliVAtp4msDo8VF/jGhx/GNZsOOK8?=
 =?us-ascii?Q?FgB+qCcXyYqkplJmkQHsECiljZ2rku2nE3UPEz8E6jvtiqMdwYt1fGmWzZqZ?=
 =?us-ascii?Q?NwZLoyoHmtdkNiGkAOMSJw7mpN6ZuULszxClry1rGfMzJ+zP/dfkixi3ocJ3?=
 =?us-ascii?Q?DJT4IKeNMmEcapUiU1mBfUuiaEWLY8nwlM/J7YAkneKqL8NQ3/rrpTYuZydK?=
 =?us-ascii?Q?1Dzk2GQrSCJ8YErhlA3yC+gG4irJ1EMPY0scpc38TuOJNp1yXIgyVgyQlNfB?=
 =?us-ascii?Q?0+xgr10AgKMUiPtpIiZzPa6ktHcisKS9y83sxBZlPZoJ3uj1dTi3NYQS7SB1?=
 =?us-ascii?Q?QLMJajRghf8D3awZH6Z4DilATPTNKI/IPP+DQJLrvwc8X2HOGN1oobEIIBle?=
 =?us-ascii?Q?KbA8AMV53XMN5Y2HpPQn9swDVDnUtKCN8KXb067oadzSgwIexiuXTw7Sq+71?=
 =?us-ascii?Q?ISOsgMkZ9OfElecvRNImN74OuJRY9kzBdN2O1JDYl+6gyJcrMZqC6RpeP8v5?=
 =?us-ascii?Q?cROzoGvPA8/xlveIw0fDJwiDGyWfYwAqmEVEHUIS8uFBS7PIuCsdK+XjaKdS?=
 =?us-ascii?Q?NzVK4EwrQSj0kvb2WjX2zKF2JtU8kDigUdM9IpZXShdshNZOyvYXE650tqLu?=
 =?us-ascii?Q?NZEur1/kOk2pw3ef4n1CaDNjtmRzh4czW0bhZIejbsnxSG8z2Q9+22VuQ8Px?=
 =?us-ascii?Q?G+F2Y7iUmdYEGzFAAJ47ywQPIk0KCTlJeiQUiq/ekzOll1+6sDxPX2OuKyuw?=
 =?us-ascii?Q?MePsDEABaXH6RD2i7Ly+jP0stDfxQzI/gXzZGsqFGPG7yxww80R9A+rmjqDd?=
 =?us-ascii?Q?4nlsA/hPsnpFFYjYyY48QnFVv786EKDQRkSpqeGIu8i3t4P8Ryqe4qRUuvl2?=
 =?us-ascii?Q?mMBvzG0IBd6Z0MUqj+BWID6H59RnQGP+UMvidliyibWe11coqrQxI5Db4BCU?=
 =?us-ascii?Q?UlcYRdkpSJV6AevcFfEqLdYz45Jeb6swI1TG52OoawVLV0RcSfFk0BEBJhay?=
 =?us-ascii?Q?rV2ggdn4l+sgua6nA7iy6FYEf5nz0mVdFLi31TcpRUuKxwB89Ux0249Su7lf?=
 =?us-ascii?Q?EyOtPAFireE2vo36AWfbVsdZe17vjYtdHUkEvSUj7SkRXYkIvtYP+XCj6tG1?=
 =?us-ascii?Q?2+r1cNXi8E0YUNTUXIRVC0lc1wGKaJSbejjQ4SsijziZj80RX9O3afFL38UR?=
 =?us-ascii?Q?YTPnU0jemqLAu9pd1Zfl3o/yyACb2AaYkcb/4VQE6hbMjaXtUC9DtmmnlFgD?=
 =?us-ascii?Q?TMd790ICU6QnHz/ANvms34W9V7ngxWWTVqE+NKwyP55I2LloDv272AVHowjJ?=
 =?us-ascii?Q?NeZVRoF7sm7HnyB7BKfJc6mdHMvsqLito7BIvwR3M1e3BgF1ri3FRdGYddOn?=
 =?us-ascii?Q?XQ=3D=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: eab83488-fefe-40a3-e21d-08da875b3e06
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1001MB2365.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Aug 2022 12:05:18.0633 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bN+9OxGGIhgTHU0F4TvP3eLh55qgCBOWkhTT6E8AmuBngCxKAPuHJAHlgU7CzvMhxG8wwCapAk2KkPwbvUl21AsZWu8Gry2gk8xtf8KhTeQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR10MB1576
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-08-26_06,2022-08-25_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0
 suspectscore=0
 mlxlogscore=999 mlxscore=0 spamscore=0 adultscore=0 phishscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2207270000 definitions=main-2208260051
X-Proofpoint-ORIG-GUID: 1zNyufYLrDCv2CSAUaIGt7wAeHUulPDz
X-Proofpoint-GUID: 1zNyufYLrDCv2CSAUaIGt7wAeHUulPDz
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
Cc: linux-arm-kernel@lists.infradead.org,
 Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Aug 26, 2022 at 01:35:56PM +0200, Linus Walleij wrote:
> On Thu, May 5, 2022 at 11:52 PM Linus Walleij <linus.walleij@linaro.org> wrote:
> 
> > The "ret" variable is ambiguously returning something that
> > could be zero in the tve200_modeset_init() function, assign
> > it an explicit error return code to make this unambiguous.
> >
> > Reported-by: Dan Carpenter <dan.carpenter@oracle.com>
> > Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> 
> Would someone show mercy on this patch and review it so I
> can apply it?
> 
> Dan maybe? If it solves the problem you reported.

Yes.  This patch makes me happy.  Thanks!

Reviewed-by: Dan Carpenter <dan.carpenter@oracle.com>

regards,
dan carpenter

