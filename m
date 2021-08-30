Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 166023FB69E
	for <lists+dri-devel@lfdr.de>; Mon, 30 Aug 2021 15:00:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3A7E489A1F;
	Mon, 30 Aug 2021 13:00:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com
 [205.220.165.32])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7F85F89A1F
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Aug 2021 13:00:41 +0000 (UTC)
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 17UBO0N8014293; 
 Mon, 30 Aug 2021 13:00:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=date : from : to : cc
 : subject : message-id : references : content-type : in-reply-to :
 mime-version; s=corp-2021-07-09;
 bh=bcjPxZS3sqBxi2fZB94p+SGJNUBKQEzkPc1CM21Krvw=;
 b=vM+uf0XQno/aCWaDEpltyE8BQthdtCK141YJdlR/LOGoxdG7gJukk0sX0LcwDwziNQ7q
 gRkl4g84sp5gqCFiTelnbbLJofwehbMbJ/MKhHJlsTafoZXYhomEbmeX/IF21k/RO3SJ
 YBQaXnrDPz0wsN6Q+t/1hyIv28QbEFVaWag0/ZjwTjFzRzRgnTSu3pCb3Dp/HsNNhDab
 MSSx4MpSEV2qeUurN6x/8ZMQ6gN+MIeRz7LdJwl4yZFGOk4P4Tjs7dirP3uNu1/BgcaO
 lITqjhxOUWQisczk9PQr1jzmkzPjSAj8Y2+Z/Wb5DQfIGQCtkOEjNJW6Xnoo/zCkagmG 6g== 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=date : from : to : cc
 : subject : message-id : references : content-type : in-reply-to :
 mime-version; s=corp-2020-01-29;
 bh=bcjPxZS3sqBxi2fZB94p+SGJNUBKQEzkPc1CM21Krvw=;
 b=scm6TmON1aPyMKBI1JOsZbQnx+7P9hxAvdA9Vck988oDyq5oA3KG9SS5fueQSKHKCoUc
 6h6Q5JjBYy6ga45UL9kRNkSNF5XLZ0FfTPm8vmeL/oxYWOD2rTtygD15pzUzxhUtuPhU
 zsbUlBW2pz4NV8LWFwontf7uHTCvJ7udwOhKHIcoAanxic7qr0zKf9a6VlGN/MvOBeRk
 pmYXX32MhhjTm/0NDMalp0ysIqZ+5+g7IRVXiRvq2A3KG0aZKlrM/AosROU0f66HgD5B
 7QxG4EMe19mDoxKQY1/FiwbDJj+P81DtOouHDMNoTmqUqYNpZhzB+oY4U6T9ifQd/vti sA== 
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
 by mx0b-00069f02.pphosted.com with ESMTP id 3arbymhemt-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 30 Aug 2021 13:00:26 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
 by userp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 17UCuAxE016761;
 Mon, 30 Aug 2021 13:00:24 GMT
Received: from nam10-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam10lp2103.outbound.protection.outlook.com [104.47.55.103])
 by userp3030.oracle.com with ESMTP id 3arpf29frk-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 30 Aug 2021 13:00:23 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Doc5Jp4sd1wb/mQR9h6Q41TKX4fkchDxX1+++hdXvP/cvkkJZYqGQLvsOtmZxb/quUXAbewlOTXirwLSHwLF66S9OJKiCq31VtXFaIwuloc71EPOfXJeQro3lL5bTLuEy1+YPVFtv5TY8r/4aRJfHrQbaKYhzii/bSBSFn05hMU8wGOFNZmLsg7gDjp2umQH/pxQ2EOk941p78qRhiS0r3k8hIikrEbLenpSIJPD9MZLeNVKVXuv+FbLl6aXl0O41EWYY0ICRP3MlvoQAyJLNRpG6pNc6pWPaf/MfMflXeWJ4pcFpeyvzxy5yFu9IvF96T0JT5TGmZ+FUGOmYfetPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bcjPxZS3sqBxi2fZB94p+SGJNUBKQEzkPc1CM21Krvw=;
 b=A0n81nQhOSzIce0NGQB1gm7HkDYi+IvDQyCbp1MpwLgfuv8P2VPT6CIhQ80bc5EAMWBcAdZjS6tyc3AkgGanC/BtPantxVwJK6DTp+3U1EFE7eceqOc0STdg8d6MaN99PURiGF7sFwPZLffCDab64XSBD4SII9pDhGDt1GHsEBwXh6FCOAu0cxLIBgKdaj8Ltw/ELJ6dOKqcih9ygNdexWnE7Anfs8ywAdaR58DaeFiIbXSuuc/PUgXHJINNg8eQP/CoLdZoeq3bC/XaZxIwDvgD9nQnulv3utUH1UnLx84AaMd6vygFoeio8LWjzkYliL2vx7VnrAuKZGyaMxcqCg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bcjPxZS3sqBxi2fZB94p+SGJNUBKQEzkPc1CM21Krvw=;
 b=NSQc8aBe0+sOK9I4VphFOlA7BnsBKQrjh01dtdJQMEzxRdER+elBvxNuOcWfmMoPnbmOLsUL5kFTV+5/pQCCEgcfykXv2eX632gPP5zpMHIdO9wPuVmj3BtSRsrppuAxPEv7GjoLfLRiMuKM6X1/HLPKjoisv/ziBC1agtio46o=
Authentication-Results: linux-m68k.org; dkim=none (message not signed)
 header.d=none;linux-m68k.org; dmarc=none action=none header.from=oracle.com;
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28) by MWHPR1001MB2318.namprd10.prod.outlook.com
 (2603:10b6:301:2f::24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4457.23; Mon, 30 Aug
 2021 13:00:20 +0000
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::5820:e42b:73d7:4268]) by MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::5820:e42b:73d7:4268%7]) with mapi id 15.20.4457.024; Mon, 30 Aug 2021
 13:00:20 +0000
Date: Mon, 30 Aug 2021 16:00:00 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>,
 Randy Dunlap <rdunlap@infradead.org>,
 syzbot <syzbot+04168c8063cfdde1db5e@syzkaller.appspotmail.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Colin King <colin.king@canonical.com>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Linux Fbdev development list <linux-fbdev@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Masahiro Yamada <masahiroy@kernel.org>, syzkaller-bugs@googlegroups.com
Subject: Re: [syzbot] BUG: unable to handle kernel paging request in
 vga16fb_fillrect
Message-ID: <20210830130000.GW7722@kadam>
References: <000000000000815b9605c70e74f8@google.com>
 <131b24e5-ee31-6f7b-42b4-c34583711913@infradead.org>
 <2fccb5d3-191c-924e-159f-1c9d423e282f@i-love.sakura.ne.jp>
 <CAMuHMdV=xVhEHLEoYt3OF+kmGrLOr6t7SP1sghSmp9JqXD+3Og@mail.gmail.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMuHMdV=xVhEHLEoYt3OF+kmGrLOr6t7SP1sghSmp9JqXD+3Og@mail.gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-ClientProxiedBy: JNXP275CA0004.ZAFP275.PROD.OUTLOOK.COM (2603:1086:0:19::16)
 To MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from kadam (62.8.83.99) by JNXP275CA0004.ZAFP275.PROD.OUTLOOK.COM
 (2603:1086:0:19::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4457.20 via Frontend
 Transport; Mon, 30 Aug 2021 13:00:14 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b8df0aab-e346-4237-51ee-08d96bb61f31
X-MS-TrafficTypeDiagnostic: MWHPR1001MB2318:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MWHPR1001MB23188A656EDA39F08BAF89F88ECB9@MWHPR1001MB2318.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: QvF5E273TJt433B29Qd3fLMjlggSlOhcfZMp2/A1lHrLzTFrQC33Z54HS/IrVWbIsfM7KT7UGZVHQDKTVcdbSOQphIpPKegDwiuNyurzrp60fsswBmk31n000m8OT3zD7E5Lyhp4SzFhWkhWCacACRvlkBrqPfJGx5kpU9h7+uJNYTFWAZTvJbMsk4zEruGSDIadrRlea/qt+yCBZs0YxhGHEMYvaJZRYzmRcFHEWrY7qC2MuOXSSPIBwX+/HdqCQ1bpJ+BlpWPbIuzGJccvYV914vTGGmiOmfedrbF6Gfk/tV/e4KTXvcVqYQ99r2hDfL9kAncIagR+60O/6gR60iHb8ETkyt0LH2J5Qm0T1k4Kp065NOXcIVjDHwgGnu72DuIlwbzxdcJMd3YsheLcdxh7xmHdx5DLnf5M2pfQg1tRm5O3CcN/Ii9GFlKV8527zJ+KIDyhUibGmKauY2aIzVw0eLSatrGjet2bPutX8F0EDIyhfZcuqlr0QArFlGOLULAKSFx39B7ZjkzLvIHeJjnIm6rIxcnTC1oWKUOwL9y9o4UHSIAvsJw3mPENYmEj4Ifzt0owC22qxV92wq/ZUCUII+KzkamE+TnRomSscHHSQece429ELMINFFRhMS8ohgquPR3g1nD1d0NF45xlJbSJ13TdkVGaz4fXV8UEvd4Veg4UpydTmN8o7ZPcMkAgdamZFa9OKnM5/gxUShy2Sg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR1001MB2365.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(39860400002)(376002)(346002)(136003)(366004)(396003)(6666004)(33716001)(9686003)(55016002)(54906003)(33656002)(478600001)(956004)(6916009)(44832011)(86362001)(8676002)(38100700002)(38350700002)(8936002)(52116002)(83380400001)(2906002)(66946007)(1076003)(26005)(53546011)(66556008)(6496006)(186003)(316002)(5660300002)(9576002)(4326008)(7416002)(66476007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?J2AbSXZyRj9//ay6Ea7bX5IcUm+uBBO02kGyRC/duJyqZD0GpPLLZnIEeeSx?=
 =?us-ascii?Q?r8Unhl7jnnjIGyJaFXXvAqIk6Ecf/nD7ryPF5BGOZ9XX+EnSEkZkDdn21baR?=
 =?us-ascii?Q?o2mJ54htK8v5bR5qtxsnzrXe3fveZp9zbGucKMRuK+GAzaWVPT9c/9mx/YSv?=
 =?us-ascii?Q?Gl7CtOvtiTaO0Ec2wpqgZiHEsVdOaaV4McHnqJOsBYK52MCS9Pv8fo6doZGc?=
 =?us-ascii?Q?bg2lLU7eIEK4sfbxbxZH6k90uU7XxZKV7Xx7eTrKdsIEARayXqZzjbrTk/Kn?=
 =?us-ascii?Q?/UxDcC1CWAssW9t8Gty+jLZbCoULgu+LhzWYh5k7WeDvNA88R5uQgFQ8+f52?=
 =?us-ascii?Q?Ab7gooPgGGLNkaEjkwCLJTBKnSAZF1cYrvDJEs5d6XNw10djBhHDmQVNWfe6?=
 =?us-ascii?Q?BlUwtQIig+nKdMspgxbpaPOom6XvpcARNGioKBFZrH26uFSH/5mBAJYX39Zi?=
 =?us-ascii?Q?Mze+0DuGc0zSs0k7QOTbQlHHz1hYh56mikzBe+zMnehHMU51CZEvoel/YXB/?=
 =?us-ascii?Q?E92XErHt5GL5aF6Ti70V9tqe6jSIIqMCIO97SjpF6gLFEHA930AeYi6EYN7v?=
 =?us-ascii?Q?1TpxsYEHGCgVbAe/hYYCcY6IjAGMn2WGuNpVYtgZrH3gU3FV1RjWFjxlBysM?=
 =?us-ascii?Q?eZQFmUeR0VO4rWgou9Yhkl4go3wFv41HIb4K8ME1McsiA5lXCgSsTaViZUqb?=
 =?us-ascii?Q?cNx8eB8hfyFls/N6TgUduXPX5PjtNuvRe0D1bHGD9BdifsyVDOa6mjyJj0bY?=
 =?us-ascii?Q?NNmT+i++7nvkKwwdOLdb1p9bObyQwIFhr2r/OHn9G08y2guMYcQt980GBb0T?=
 =?us-ascii?Q?buiMw17EscXkKjj4m31IPYy/rk021vRj+OK6Q5/1vWduf2cLW7Ro1aAS+9t5?=
 =?us-ascii?Q?HCsfusAeV1SO8J4iJJSXpM/wmKp2fwJwoUpaUUwd7RPfAJeKMDq5D5B/qB4N?=
 =?us-ascii?Q?xNeMbLWFV3fYZwr7ptuWleTk21NQmfohnMyKay/mMmg6k2WRlHIRldAT1xJk?=
 =?us-ascii?Q?M8/9nL6RlRwt+PE8tAai34NAfFcve/2hZ+kOJBys+PldmOLrNGTxgUlCNXJl?=
 =?us-ascii?Q?YaOB6LCNZ4rwgH+vRh/9vnmHBnFKHCbwEm/m5n7KWaCLW7N3HlXbO7cX9Wrj?=
 =?us-ascii?Q?i8FmrnonD5QkmUObZ6AWncWbc+7NTWISfz3b7WVjsIYlILhzqwLtBRRkqcLI?=
 =?us-ascii?Q?2Pjr3f+XLKQBLWstxvkZzz7SB/QcHyv1PYi4bOCHoMUZoze0F6FsT8L2dsl9?=
 =?us-ascii?Q?7O4P9D66Di2BK7TN7PIWFvQSHRwtXyq48GAFXWM86EnP+fQko4/tIGscwVSY?=
 =?us-ascii?Q?M9QwpS89djnA/vz8VU8ci7wk?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b8df0aab-e346-4237-51ee-08d96bb61f31
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1001MB2365.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Aug 2021 13:00:20.6362 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NEuBAIbljagaz1+svTK+k5BjK8C5QJ7RVEe7O7oLrgxKTgK9HB098auP2XSajtbsjw+WItXdW5fd+k1igw9tnvLuMKb2Apd0VmWpwMDE4yY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR1001MB2318
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10091
 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0
 bulkscore=0 phishscore=0
 spamscore=0 mlxlogscore=999 adultscore=0 suspectscore=0 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2107140000
 definitions=main-2108300093
X-Proofpoint-ORIG-GUID: ouoOpO6IVxP804W5Zp4g2KOtS-NVKE8O
X-Proofpoint-GUID: ouoOpO6IVxP804W5Zp4g2KOtS-NVKE8O
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

On Mon, Aug 30, 2021 at 02:00:21PM +0200, Geert Uytterhoeven wrote:
> Hi Testsuo,
> 
> On Mon, Aug 30, 2021 at 4:27 AM Tetsuo Handa
> <penguin-kernel@i-love.sakura.ne.jp> wrote:
> > On 2021/08/30 9:24, Randy Dunlap wrote:
> > > Note that yres_virtual is set to 0x10000000. Is there no practical limit
> > > (hence limit check) that can be used here?
> > >
> > > Also, in vga16fb_check_var(), beginning at line 404:
> > >
> > >   404        if (yres > vyres)
> > >   405            vyres = yres;
> > >   406        if (vxres * vyres > maxmem) {
> > >   407            vyres = maxmem / vxres;
> > >   408            if (vyres < yres)
> > >   409                return -ENOMEM;
> > >   410        }
> > >
> > > At line 406, the product of vxres * vyres overflows 32 bits (is 0 in this
> > > case/example), so any protection from this block is lost.
> >
> > OK. Then, we can check overflow like below.
> >
> > diff --git a/drivers/video/fbdev/vga16fb.c b/drivers/video/fbdev/vga16fb.c
> > index e2757ff1c23d..e483a3f5fd47 100644
> > --- a/drivers/video/fbdev/vga16fb.c
> > +++ b/drivers/video/fbdev/vga16fb.c
> > @@ -403,7 +403,7 @@ static int vga16fb_check_var(struct fb_var_screeninfo *var,
> >
> >         if (yres > vyres)
> >                 vyres = yres;
> > -       if (vxres * vyres > maxmem) {
> > +       if ((u64) vxres * vyres > (u64) maxmem) {
> 
> Mindlessly changing the sizes is not the solution.
> Please use e.g. the array_size() helper from <linux/overflow.h>
> instead.

On a 64bit system the array_size() macro is going to do the exact same
casts?  But I do think this code would be easier to understand if the
integer overflow check were pull out separately and done first:

	if (array_size(vxres, vyres) >= UINT_MAX)
		return -EINVAL;

	if (vxres * vyres > maxmem) {
		...

The UINT_MAX is because vxres and vyres are u32.

This would maybe be the first time anyone ever did an integer overflow
check like this in the kernel.  It's a new idiom.

regards,
dan carpenter

