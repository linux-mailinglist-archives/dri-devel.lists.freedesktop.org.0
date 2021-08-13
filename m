Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DAFB23EBC9C
	for <lists+dri-devel@lfdr.de>; Fri, 13 Aug 2021 21:36:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B54526E8C7;
	Fri, 13 Aug 2021 19:36:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR02-AM5-obe.outbound.protection.outlook.com
 (mail-eopbgr00062.outbound.protection.outlook.com [40.107.0.62])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 420EF6E5D1
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Aug 2021 12:54:42 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Wy083JwF5SirZlUsPoqDfIPoPa9AuYGfz+Nfbmdn2Jf/S1kcbMtyFiMaswVUDnIKGRheU9y+pRj2+LsMFvwdL69LV/x39TJOtibkziayiExBs2KWN+bOjMqdzvhb9ttiq6GinfLquj86XcXNHDmDqdM7vjfN1MZGy8Ey1w7Bef/MAmeyHSCwbu3xdXPLOkqdqTQXdsZDTolM43SMpq3FP43x+dHafuxIxxRSMTQS2WclaE6gW67U5jlxbNmx33/PnIy1LPuJ9T4liUEfgnfGvMsjT18ClpT3OCvXmVcJUr3Mhp/vVpsIzZciRCxHNppPDc4nSnbpoHXihd4qhv3W/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Srk3eF3DuckrUsK50O1sICFFzlBFqwYQt4e1+uW5Dvw=;
 b=ml8JWHZx3qwVtog6nE0C63BPZbaCKerBfxxTzZfoYQ5g4dBLKpsMvZKlmiT1sn0hqFDK0y9/rGLEQoH9t7HjL407YYGBh533Qq1KJelD1zNabs/RMt/4nQaPIwX9phdVAr4/Q1ConvS1aniZZ5O0PuaEymMwRWO3yY31lPRMMNpnduUGgnHVLnCR7rzIDg/LbWk9KWomdTYAfz8vbRo9KQuHcTfSsscDwjuEvA3FEZgf3G85VGuL6qhq9MxFLzJZCjwepss/dYuserpb81OWG2dFmj5PGCy63h8K+iLF2HzdqgEXjhQ8thYmz2kurKHkGsKMR3+uRFVCNqQcvHC5CQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=kococonnector.com; dmarc=pass action=none
 header.from=kococonnector.com; dkim=pass header.d=kococonnector.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=KoCoConnector.onmicrosoft.com; s=selector2-KoCoConnector-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Srk3eF3DuckrUsK50O1sICFFzlBFqwYQt4e1+uW5Dvw=;
 b=aekxq0OacsQvhBu841SdZtEP4cKVpgVl6+Xnd9dI32pFYFQH09rhhxOzuObHSn531DAK0xau/rKGuoggxLF5tU/qqz65yJCsFOl/X3oWpvo20w1IdPzVYtET3015rtttRUCHbGZDDT/EY2uvB0bABOkiDfw5YVeOzAXanKRwWOI=
Authentication-Results: linuxfoundation.org; dkim=none (message not signed)
 header.d=none;linuxfoundation.org; dmarc=none action=none
 header.from=kococonnector.com;
Received: from AM9PR09MB4884.eurprd09.prod.outlook.com (2603:10a6:20b:281::9)
 by AM9PR09MB4545.eurprd09.prod.outlook.com (2603:10a6:20b:2d4::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4415.15; Fri, 13 Aug
 2021 12:54:40 +0000
Received: from AM9PR09MB4884.eurprd09.prod.outlook.com
 ([fe80::35c9:eaa2:9d67:9ec1]) by AM9PR09MB4884.eurprd09.prod.outlook.com
 ([fe80::35c9:eaa2:9d67:9ec1%6]) with mapi id 15.20.4415.019; Fri, 13 Aug 2021
 12:54:39 +0000
Date: Fri, 13 Aug 2021 14:54:30 +0200
From: Oliver Graute <oliver.graute@kococonnector.com>
To: Greg KH <gregkh@linuxfoundation.org>
Cc: Carlis <zhangxuezhi1@yulong.com>, dri-devel@lists.freedesktop.org,
 linux-fbdev@vger.kernel.org, linux-staging@lists.linux.dev,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1] fbtft: fb_st7789v: added reset on init_display()
Message-ID: <20210813125430.GA1527@optiplex>
References: <20210813062511.14537-1-oliver.graute@kococonnector.com>
 <YRYrPfEHrcvDL4va@kroah.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YRYrPfEHrcvDL4va@kroah.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-ClientProxiedBy: AM0PR04CA0039.eurprd04.prod.outlook.com
 (2603:10a6:208:1::16) To AM9PR09MB4884.eurprd09.prod.outlook.com
 (2603:10a6:20b:281::9)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost (2.207.138.2) by
 AM0PR04CA0039.eurprd04.prod.outlook.com (2603:10a6:208:1::16) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4415.13 via Frontend Transport; Fri, 13 Aug 2021 12:54:39 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b6f3584a-4335-440f-fe9c-08d95e598338
X-MS-TrafficTypeDiagnostic: AM9PR09MB4545:
X-Microsoft-Antispam-PRVS: <AM9PR09MB45456E1123C4D58336C48446EBFA9@AM9PR09MB4545.eurprd09.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:483;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: TRFsZUvBMA2Fk8WHsswvpYHVjlLNr388XrtZa0Ti9Az3PDUVy+V4LCQvZCutCsjKPYXj8mIB1sYcoYMVx9y0d+CzrjCTvqHLOMCqXA5O2/BnFBglH1CEf5JYqKppdjmG7qRq/kzbdmXRi0SREBd93uJ2jMOXeRpPcHkwpDeBzeZg8P8WcH/Ecv6HztV4DuZySwvPBcz1aitDpWUxYnual9gOwAJIzfsXBMrgTTsZYZKb343E630wos7EbqHls6UFgOhSMM2wxZ7JNYZN4UdLAPMwYQvr0/gauL+1+x3XPF4T8Zw0EzLXSS/6Jmg1TJA2brGoFk2hUzvEoW7A92+VB5P4Ro+qYuvK83vx8m2Pz+Va/efxQriYjt5Tmz+XjJVumyyBp92n97kBe5HglDrexUZuozX5NE/LOVLDICHFnTW0CC9L5rT4Pf7vlA4FaWwdq6oXIA49p53+0nb+KGpkGhhvbaob9v22IuNA7Xpn0gnV3dPBlPyicXhRvphNPcs2GzSgjaJfJY7+HtfNUBktoX/kXSIRWemJspxmCH4q5Nb2C19OE09hJGmJ8Ag5RV6cKF3V0p5sK3DDvD6wbMPlJcEte+cyVISWa5BMjzw0bUGXncwrUE4PChJsuU4ACSybsYu38h8v0Yc/zQ2wx+46HVZtka7GaDPedcnWyOJaRGZwtHiQQH/ewH8evDzMHoCJXidz5SOELVXWffc8MWQFNQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM9PR09MB4884.eurprd09.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(7916004)(376002)(136003)(366004)(396003)(346002)(39830400003)(1076003)(316002)(4326008)(6496006)(956004)(52116002)(4744005)(6916009)(66946007)(186003)(66476007)(8676002)(38350700002)(478600001)(8936002)(38100700002)(66556008)(6486002)(33716001)(5660300002)(26005)(6666004)(33656002)(2906002)(86362001)(44832011)(9686003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?vvsMoxtqpy3t87SzjVC9EGPT8lY99iRAGvC1baXZpP88c3O41+jGV2o4QjFd?=
 =?us-ascii?Q?K7nn0VfYYd10gn3UVDxboTq15ljuyXq5MMI0ZUV9FD4emaKHv07H3J2sN219?=
 =?us-ascii?Q?S0ZOrP8xTV9jKJ94F+OePb+7fZ9TnoAl0T7YtiEhoMhw0cBdhcbJJBBYMAlG?=
 =?us-ascii?Q?DIZRtPaOFqIXjYdrTrUq7zYnmfX58Msb4WsqD2rjj4O8NM0U+GfWQAuCmoaW?=
 =?us-ascii?Q?ilLKFjNqU4WUThQN3aSSW2bimi5AdgGM3RTx3ftYnLIAThUcBKVyaKjZYL6Z?=
 =?us-ascii?Q?g9oB9dy4yQg/4qO0WmWsj4gpJgPX1EMk1xuminsEl9rMdFps/bK0DfqciH+N?=
 =?us-ascii?Q?N41Rqpnp4wQlmSzJtHRaBSzPTX15ad39DkIQTDDaIuhEAVQrHLbWJofSRT5M?=
 =?us-ascii?Q?y6ecy880MQQKYYhDTL7vSZXmwIUehcg/EPS1gxBsF9KsFdzG8puWiTw9VvMS?=
 =?us-ascii?Q?6DhAw7zoPoVCCbopgmFafufpX/sSPWBLg/RrJigrN857vOCiBISJEVLfWy/A?=
 =?us-ascii?Q?o/B9Iz/XwFvSLRSHe5hlkRm1SAe6SvRmQvVt9yuEN0UQ+lqisnxtL3Mxt+TV?=
 =?us-ascii?Q?QcmVWW69biJ8M7frX/3Yf7uY0qCvnjvcVRX3oWUMjAfBqtbLq1NnuZvwZWxL?=
 =?us-ascii?Q?yotFDrL5OunkjzBprM/CKFw7M7p6y6jb+Gc29g4z7WhAEgrVW40NK7oQVzFu?=
 =?us-ascii?Q?RSTg3JfpCX+9R+FI6Rcuonf2bQ+tB7k3Zp1MBjhaYTP/oknCTUHvoZTwdR+2?=
 =?us-ascii?Q?v7ckcE8oHh5ud1c/pEydQsAjBcoemSoAGd6TwyKquWUTA5MHnj0uwypijp/b?=
 =?us-ascii?Q?9sD3hIKAjgo8Tci5ZlIRGyKxY9aOCqP3E2XSMRSgZhVsd1Ur+7+2+IwlU7qh?=
 =?us-ascii?Q?UWmS5rfyjpyNhEPCYtKTcUMxS7qrMQjoKhDefC01KTkkNUenyTnjiaAzbas3?=
 =?us-ascii?Q?WibuFJUxhNF3j6mqyAnd7C0c+2CxJWpqGbhwrIWN4FWzAkUVatLRW2XT1Or9?=
 =?us-ascii?Q?Cpol4f6bTE+flmpzhH3vdJ1AcV09jRSu97KJzyF6nbKjOL0eIar6aFKxVMXF?=
 =?us-ascii?Q?6S+gA1zTraN7x+Hk7BNYzlJTyprSOwimwBa6c4wYH9QN+CiI3j2qxJEIbFhO?=
 =?us-ascii?Q?M4jIywa2EWTKWBt7sPQ4DwYbDy30SW/n2l/nQRUU54uHPerz1s4fx8kLmGDK?=
 =?us-ascii?Q?vFvaogC3dp15kBRfsRnzhcZ0G3//nHAjM5DDobz33rWYGMW4kPTg9bk6DDdA?=
 =?us-ascii?Q?gFhdGmmjE41EOpf77O1SwRThdeDV8GoQyKZVbabrTPRT3yxTCPbHAx/NNyE+?=
 =?us-ascii?Q?MbCTFUKCkdtzKVDmCE+A21Xf?=
X-OriginatorOrg: kococonnector.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b6f3584a-4335-440f-fe9c-08d95e598338
X-MS-Exchange-CrossTenant-AuthSource: AM9PR09MB4884.eurprd09.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Aug 2021 12:54:39.7441 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 59845429-0644-4099-bd7e-17fba65a2f2b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hjqQ+JcCI0xSeeQCU7fcFvsvvTKjnXLNP4ue7jJZOFMi3yVElJ/E4t3WZ78r09FhBZUaQbdwwDuOt2Uz/xEcdOsyl1l2bLcAYo62c6Ve5RU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR09MB4545
X-Mailman-Approved-At: Fri, 13 Aug 2021 19:36:13 +0000
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

On 13/08/21, Greg KH wrote:
> On Fri, Aug 13, 2021 at 08:25:10AM +0200, Oliver Graute wrote:
> > staging: fbtft: fb_st7789v: reset display before initialization
> 
> What is this line here, and why is this not your subject line instead?

I'll put the line as subject instead.

> > In rare cases the display is flipped or mirrored. This was observed more
> > often in a low temperature environment. A clean reset on init_display()
> > should help to get registers in a sane state.
> > 
> > Signed-off-by: Oliver Graute <oliver.graute@kococonnector.com>
> 
> What commit does this fix?

this is a fix for a rare behavior of the fb_st7789v display. Not a
bugfix for a specific commit.

Best regards,

Oliver
