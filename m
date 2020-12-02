Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BD752CBD0C
	for <lists+dri-devel@lfdr.de>; Wed,  2 Dec 2020 13:34:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5E9BB89F3C;
	Wed,  2 Dec 2020 12:34:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from FRA01-PR2-obe.outbound.protection.outlook.com
 (mail-eopbgr120049.outbound.protection.outlook.com [40.107.12.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5BE5289F3C
 for <dri-devel@lists.freedesktop.org>; Wed,  2 Dec 2020 12:34:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NtdhCB66KDRJg9zU2HweAUhAOy5oowP8OqUfpRjgvqQ=;
 b=5McHPIdK959kByDv0R9BCzamhvmvqPuI7VnZ4qik2vGGAC30yG5lemEzU6N9QxIjMA+gfGSE7EeWrUFvdSyPJLMEpK3M+sAckh63ixEPMGqN2VpP4JmJ5yBFvJd3NdmsfXObLzf1To1HNDdgu/m8KS0HNs/zsYaG8R+IOMETNio=
Received: from AM5PR0601CA0047.eurprd06.prod.outlook.com
 (2603:10a6:203:68::33) by PR2PR08MB4921.eurprd08.prod.outlook.com
 (2603:10a6:101:22::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3611.25; Wed, 2 Dec
 2020 12:34:35 +0000
Received: from VE1EUR03FT035.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:203:68:cafe::c1) by AM5PR0601CA0047.outlook.office365.com
 (2603:10a6:203:68::33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3632.17 via Frontend
 Transport; Wed, 2 Dec 2020 12:34:35 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.freedesktop.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.freedesktop.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT035.mail.protection.outlook.com (10.152.18.110) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3632.17 via Frontend Transport; Wed, 2 Dec 2020 12:34:34 +0000
Received: ("Tessian outbound fc5cc0046d61:v71");
 Wed, 02 Dec 2020 12:34:33 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: c55f17d9e081709d
X-CR-MTA-TID: 64aa7808
Received: from b712e63fdade.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 3E87426C-56B3-4FAC-AA10-FE755E74954F.1; 
 Wed, 02 Dec 2020 12:34:28 +0000
Received: from EUR03-AM5-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id b712e63fdade.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 02 Dec 2020 12:34:28 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Y6EcHboeCzdbWIpWh1n7VWPtGxThO1uXED450rlqgXugcJrDpalWMX3EMuCEg3Ct8q+IRfPlG1uOJBzK4jKCSg6Xcw2XDvHkq+BfK9/hi6RjVkEGz92r8JSGivvVGo+r6NGzUSN5mNvxtzt6As/QoeuFmOK3l30/OXJgbCehN0H1Kfm3hXamaRypf47gII5NYCmHGnJTdJ06OhU1vx+XOhi1H7HRG0CFbo/hXlY3XBucrIRumbO/pxilyk6rPSeJ+Eg21yFWk0gGMP9rUNe+i+ZEu0jSmzdTQAda5+cbyiEOb5kvD/eJXklagKI12pVXyHFfT2dJukVvRjsTGmneQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NtdhCB66KDRJg9zU2HweAUhAOy5oowP8OqUfpRjgvqQ=;
 b=nilHN180gYQHVMl1oRv/tdqSGfCt3tvdaERA7/wQ8sDNjb8226BSfUa3Pnj3YnT+L/YLnKTFrlXIV2jAS/z3XyHExSM8YNl8kbFmKyWMuveIkv86uvdL799YvSbRWyBAZDa/fe9YJxkGenzAWYvoWajuQus4HTk3/CcZyti45anFBB7fWHMitMCk2tvdj2nam2lc2TYFKGYF2IKEGxRHn/7KDv4lRCARDxJ/CLCCyvG0TxMBSTfsLExO83h+IbMIIygmAn5IaFzR5xf7zG+esV0Fpd3nZn9/GSe3O5i59tDBk3faDc3xACtsfI33jo2s5PS8X7YyLwbScFTVh5iH5Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NtdhCB66KDRJg9zU2HweAUhAOy5oowP8OqUfpRjgvqQ=;
 b=5McHPIdK959kByDv0R9BCzamhvmvqPuI7VnZ4qik2vGGAC30yG5lemEzU6N9QxIjMA+gfGSE7EeWrUFvdSyPJLMEpK3M+sAckh63ixEPMGqN2VpP4JmJ5yBFvJd3NdmsfXObLzf1To1HNDdgu/m8KS0HNs/zsYaG8R+IOMETNio=
Authentication-Results-Original: google.com; dkim=none (message not signed)
 header.d=none;google.com; dmarc=none action=none header.from=arm.com;
Received: from DB6PR08MB2631.eurprd08.prod.outlook.com (2603:10a6:6:23::10) by
 DB8PR08MB4154.eurprd08.prod.outlook.com (2603:10a6:10:b1::28) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3632.17; Wed, 2 Dec 2020 12:34:22 +0000
Received: from DB6PR08MB2631.eurprd08.prod.outlook.com
 ([fe80::5466:56bd:bfb2:53db]) by DB6PR08MB2631.eurprd08.prod.outlook.com
 ([fe80::5466:56bd:bfb2:53db%5]) with mapi id 15.20.3632.017; Wed, 2 Dec 2020
 12:34:22 +0000
Date: Wed, 2 Dec 2020 12:34:20 +0000
From: Brian Starkey <brian.starkey@arm.com>
To: Peiyong Lin <lpy@google.com>
Subject: Re: [PATCH v4] Add power/gpu_frequency tracepoint.
Message-ID: <20201202123420.g3ivr5le4imcrdsa@DESKTOP-E1NTVVP.localdomain>
References: <20200820162738.33053904@oasis.local.home>
 <20201022173434.910879-1-lpy@google.com>
 <CA+0soA=JR45Tad6+0jCDoiXPk_ctDmmFhg9NtPRrMFb9fM3V0Q@mail.gmail.com>
 <CA+0soAkd3nq0ys1TQ3m8DxMAT4-EGfo7obQ9OrGQ15bipT=wTA@mail.gmail.com>
Content-Disposition: inline
In-Reply-To: <CA+0soAkd3nq0ys1TQ3m8DxMAT4-EGfo7obQ9OrGQ15bipT=wTA@mail.gmail.com>
User-Agent: NeoMutt/20180716-849-147d51-dirty
X-Originating-IP: [217.140.99.251]
X-ClientProxiedBy: LO2P265CA0330.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:a4::30) To DB6PR08MB2631.eurprd08.prod.outlook.com
 (2603:10a6:6:23::10)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from DESKTOP-E1NTVVP.localdomain (217.140.99.251) by
 LO2P265CA0330.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:a4::30) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3632.17 via Frontend Transport; Wed, 2 Dec 2020 12:34:21 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: c0879ec1-00c3-4256-c037-08d896bea04f
X-MS-TrafficTypeDiagnostic: DB8PR08MB4154:|PR2PR08MB4921:
X-Microsoft-Antispam-PRVS: <PR2PR08MB4921B22EAA2B049054C0C2E3F0F30@PR2PR08MB4921.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: S26q9JlnDcO1ot55DM3Saw81V7sqOF240ZK722Rj9HGb4cF9JIduozuy/49LB+dtW4/+NV7VffFrLu0tfzMeL/CJ8QWnaWIdrYxQ6G/MWTYHbN9fJ0KB5HowOVplKU5/khipYHaFgxHU0ZJTrc3YjHt4ZOt+fA7yQyzoz2nlmmK5M1ps9msPlnOT7HXQ02H6k1+6a7Qr759CCVGX1c2SxNAiIFcQEF9sdDOpw5hDMrgQabt/REcMxZtz+imGv2N49DpFlfGTrngWi1Q1RM2h+E/tRFspH1Iv1Jsjnhpog8Sth7DOv6CJu8GY+6KxJ2zl9cvkFxXhGa9Y4D6vvzh8ghPkpDglHtMlme0OAESQNMcm3dVGGuDL9qZRiHDE8spHZgwPhmV1gE7ka9/r3Y18kCVBZrfly/nx+pY79oG0arI=
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255; CTRY:; LANG:en;
 SCL:1; SRV:; IPV:NLI; SFV:NSPM; H:DB6PR08MB2631.eurprd08.prod.outlook.com;
 PTR:; CAT:NONE;
 SFS:(4636009)(366004)(136003)(376002)(396003)(346002)(39860400002)(53546011)(6506007)(966005)(1076003)(6916009)(4326008)(44832011)(86362001)(16526019)(956004)(478600001)(186003)(26005)(7416002)(5660300002)(2906002)(316002)(8676002)(8936002)(54906003)(7696005)(52116002)(66476007)(9686003)(66556008)(66946007)(83380400001)(55016002)(357404004);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?JS04nCwtXWB+tKagB4W8pvO4jNTRWB8HB7WNH7NIAC7rn/J1oB3dX7FglIiY?=
 =?us-ascii?Q?Oydb647iAaBeWFQUtCd9qJnGr3hARWOqE6Mfdh94/mAf5BVEYX/LbWIrSvuS?=
 =?us-ascii?Q?eRR0bIuWeQZNhmoxucVQw9Dmi1xt0rQ1nKMrnhFWFeSNXLOwoaVJTqaI55j3?=
 =?us-ascii?Q?y8I6abQa8uMAED/dBGYs8Gnd0nGog0C10Bu6hQ4nXo1Ep3jpt18eMY1aYfN7?=
 =?us-ascii?Q?rtCVgvvB0sUfzrkw+yhvX66U3B+gprTMzf24MrLdrdEJOQC3mQxhOtzdMCwY?=
 =?us-ascii?Q?gnLB9BEH3qf4Fwco2p4QnaU7M/qtthUl0BXqjrCeQWgMu8uA17c95ATZc3YK?=
 =?us-ascii?Q?oJQECx+uBbW5KGdwf/LQsMFrpOinbSOci0Vt9i23MkYpBc9a6hZbCmjsicaE?=
 =?us-ascii?Q?Vn90kItyStVFsZT39pAe9Mi5kG3YGu1pTue8B2zp/XvGUhoV9TMHqRpsIIKx?=
 =?us-ascii?Q?xYSK86zoqV08fFlM3d7FrdxQtwVpnhQV4JmlX5uNpf5mnJN857YYDEOAkPJz?=
 =?us-ascii?Q?UoPa08atLcRqPn9tBD7xP2gtl0l/b4eKg3qQBKS2rqwtHXGBg5K/vBSIfEyP?=
 =?us-ascii?Q?KB43AWC+/F9WrgS3DEdF6OrOkIgmrLbriedgq9xBccRLuCUfn0Shkd+zR+/N?=
 =?us-ascii?Q?FKWOvKLX8KnkM6ZNqFbgIgSBeGb8cvqlwCr9htiWxrT5tQR/g4gNaq5pbKbi?=
 =?us-ascii?Q?6cC4xdWaiIsZEuB0sXzCLqCVUwTDIrjKBJO4AqnCoEgGoaFlQWTzIptLvMY6?=
 =?us-ascii?Q?QlU7B0fBA0lAVddppq6Hv9S75xul1LOJNdYGU6/9F9OTHyDq/+ox3IMfKrk1?=
 =?us-ascii?Q?cqleEG7vlfDO6OLWnrEKFgTYrz5xdeiQi/hvXYzCkCK9FOntruxk45DvafyJ?=
 =?us-ascii?Q?CN3XJ06LWuf/4J3/lRkfVARl+1PPVYLyABBEK+MjRVCry9ow/9W8L1XNpSwT?=
 =?us-ascii?Q?lGi3DPw9itSmgJEZLtqxtfISDcOQsW3VMUK4F/uc5Q6hqgoijpm/RRcRoTyp?=
 =?us-ascii?Q?zLfn?=
X-MS-Exchange-Transport-Forked: True
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR08MB4154
Original-Authentication-Results: google.com; dkim=none (message not signed)
 header.d=none;google.com; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: VE1EUR03FT035.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs: ad0fec4a-c71e-41fe-3575-08d896be9875
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 3nOMdEXXnhnXKAeXZtz8AVH0puV9QML3w/4VynyBzGKKSj0K2IIk9G4FxV0s3wVTcKMmOHD1+GCnX5oql0q96TPEdSSOCui1kWYeZZM79HfcMSyMqZ5mojlr2lQp2NzRYpY0UFwtiqQYm3SSviKVQ9XB44nkIbyJT6aFwkYgJx5Zn6hLGgggP7p3RvoxC7Cix9zct4YdPZINNEjqYB0+WLyL2+eq5yQ07tic/kPLXHRkXIXzV47huB74TrYWqiRWznxCiu7o5iajEFhAqGPCrIYGjq4t6FGXcq7QeNPBLD3moW49/HGIiOxrFeZ1X0Hl6jWW4omcqBS1L8HeQdRV7vrJAjiog4lDXkbYzZsuvEXeBQXLyRjxHebkQ2h9ZmzZeGdMNmOOruO2ngyiKIySpgRZFaFztSSTaNIpVXXsF1Y0MIWUumqbZZMcBLDBF/jcfzA6ZU+WyztiONkNhJ8wjg==
X-Forefront-Antispam-Report: CIP:63.35.35.123; CTRY:IE; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:64aa7808-outbound-1.mta.getcheckrecipient.com;
 PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com; CAT:NONE;
 SFS:(4636009)(39860400002)(396003)(346002)(376002)(136003)(46966005)(1076003)(4326008)(81166007)(478600001)(356005)(53546011)(6506007)(55016002)(47076004)(9686003)(70206006)(5660300002)(186003)(82310400003)(70586007)(16526019)(26005)(8936002)(83380400001)(82740400003)(8676002)(54906003)(6862004)(44832011)(336012)(86362001)(966005)(2906002)(316002)(956004)(7696005)(357404004);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Dec 2020 12:34:34.9139 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c0879ec1-00c3-4256-c037-08d896bea04f
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[63.35.35.123];
 Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: VE1EUR03FT035.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR2PR08MB4921
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
Cc: Ulf Hansson <ulf.hansson@linaro.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>,
 Sidath Senanayake <sidaths@google.com>, Steven Rostedt <rostedt@goodmis.org>,
 linux-kernel@vger.kernel.org, Masahiro Yamada <yamada.masahiro@socionext.com>,
 Prahlad Kilambi <prahladk@google.com>, Ingo Molnar <mingo@redhat.com>,
 dri-devel@lists.freedesktop.org, Pavel Machek <pavel@ucw.cz>,
 Paul Walmsley <paul.walmsley@sifive.com>, nd@arm.com, zzyiwei@android.com,
 android-kernel@google.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Peiyong,

On Mon, Nov 30, 2020 at 02:33:59PM -0800, Peiyong Lin wrote:
> On Tue, Nov 17, 2020 at 1:31 PM Peiyong Lin <lpy@google.com> wrote:
> >
> > On Thu, Oct 22, 2020 at 10:34 AM Peiyong Lin <lpy@google.com> wrote:
> > >
> > > Historically there is no common trace event for GPU frequency, in
> > > downstream Android each different hardware vendor implements their own
> > > way to expose GPU frequency, for example as a debugfs node.  This patch
> > > standardize it as a common trace event in upstream linux kernel to help
> > > the ecosystem have a common implementation across hardware vendors.
> > > Toolings in the Linux ecosystem will benefit from this especially in the
> > > downstream Android, where this information is critical to graphics
> > > developers.
> > >
> > > Signed-off-by: Peiyong Lin <lpy@google.com>
> > > ---
> > >
> > > Changelog since v3:
> > >  - Correct copyright title.
> > >
> > > Changelog since v2:
> > >  - Add more comments to indicate when the event should be emitted.
> > >  - Change state to frequency.
> > >
> > > Changelog since v1:
> > >  - Use %u in TP_printk
> > >
> > >  drivers/gpu/Makefile                    |  1 +
> > >  drivers/gpu/trace/Kconfig               |  3 +++
> > >  drivers/gpu/trace/Makefile              |  1 +
> > >  drivers/gpu/trace/trace_gpu_frequency.c | 13 ++++++++++
> > >  include/trace/events/power.h            | 33 +++++++++++++++++++++++++
> > >  5 files changed, 51 insertions(+)
> > >  create mode 100644 drivers/gpu/trace/trace_gpu_frequency.c
> > >
> > > diff --git a/drivers/gpu/Makefile b/drivers/gpu/Makefile
> > > index 835c88318cec..f289a47eb031 100644
> > > --- a/drivers/gpu/Makefile
> > > +++ b/drivers/gpu/Makefile
> > > @@ -6,3 +6,4 @@ obj-$(CONFIG_TEGRA_HOST1X)      += host1x/
> > >  obj-y                  += drm/ vga/
> > >  obj-$(CONFIG_IMX_IPUV3_CORE)   += ipu-v3/
> > >  obj-$(CONFIG_TRACE_GPU_MEM)            += trace/
> > > +obj-$(CONFIG_TRACE_GPU_FREQUENCY)              += trace/
> > > diff --git a/drivers/gpu/trace/Kconfig b/drivers/gpu/trace/Kconfig
> > > index c24e9edd022e..ac4aec8d5845 100644
> > > --- a/drivers/gpu/trace/Kconfig
> > > +++ b/drivers/gpu/trace/Kconfig
> > > @@ -2,3 +2,6 @@
> > >
> > >  config TRACE_GPU_MEM
> > >         bool
> > > +
> > > +config TRACE_GPU_FREQUENCY
> > > +       bool
> > > diff --git a/drivers/gpu/trace/Makefile b/drivers/gpu/trace/Makefile
> > > index b70fbdc5847f..2b7ae69327d6 100644
> > > --- a/drivers/gpu/trace/Makefile
> > > +++ b/drivers/gpu/trace/Makefile
> > > @@ -1,3 +1,4 @@
> > >  # SPDX-License-Identifier: GPL-2.0
> > >
> > >  obj-$(CONFIG_TRACE_GPU_MEM) += trace_gpu_mem.o
> > > +obj-$(CONFIG_TRACE_GPU_FREQUENCY) += trace_gpu_frequency.o
> > > diff --git a/drivers/gpu/trace/trace_gpu_frequency.c b/drivers/gpu/trace/trace_gpu_frequency.c
> > > new file mode 100644
> > > index 000000000000..668fabd6b77a
> > > --- /dev/null
> > > +++ b/drivers/gpu/trace/trace_gpu_frequency.c
> > > @@ -0,0 +1,13 @@
> > > +// SPDX-License-Identifier: GPL-2.0
> > > +/*
> > > + * GPU frequency trace points
> > > + *
> > > + * Copyright (C) 2020 Google LLC
> > > + */
> > > +
> > > +#include <linux/module.h>
> > > +
> > > +#define CREATE_TRACE_POINTS
> > > +#include <trace/events/power.h>
> > > +
> > > +EXPORT_TRACEPOINT_SYMBOL(gpu_frequency);
> > > diff --git a/include/trace/events/power.h b/include/trace/events/power.h
> > > index af5018aa9517..343825a76953 100644
> > > --- a/include/trace/events/power.h
> > > +++ b/include/trace/events/power.h
> > > @@ -500,6 +500,39 @@ DEFINE_EVENT(dev_pm_qos_request, dev_pm_qos_remove_request,
> > >
> > >         TP_ARGS(name, type, new_value)
> > >  );
> > > +
> > > +/**
> > > + * gpu_frequency - Reports the GPU frequency in GPU clock domains.
> > > + *
> > > + * This event should be emitted whenever there's a GPU frequency change happens,
> > > + * or a GPU goes from idle state to active state, or vice versa.
> > > + *
> > > + * When the GPU goes from idle state to active state, this event should report
> > > + * the GPU frequency of the active state. When the GPU goes from active state to
> > > + * idle state, this event should report a zero frequency value.
> > > + *
> > > + * @frequency:  New frequency (in KHz)
> > > + * @gpu_id: Id for each GPU clock domain

Thinking about options for how to assign this, there are a few
existing tracepoints (I see block device and jb2) which use dev_t, so
perhaps that would be an option. We'd still want to be able to expose
multiple clocks per device though, either with a separate field or
with a defined packing into this one.

dev_t is a little bit tricky because the packing can (is?) different
between the kernel and C library. major + minor + clock domain as
3 separate fields would be the most explicit.

As the intended use-case is tools, I imagine userspace will want to
link this to data exposed via other APIs, so gpu_id needs to somehow
allow that. That probably means some opaque integer assigned within
the kernel isn't OK.

Hopefully some other vendors have thoughts on what would work in their
systems.

Thanks,
-Brian

> > > + */
> > > +TRACE_EVENT(gpu_frequency,
> > > +
> > > +       TP_PROTO(unsigned int frequency, unsigned int gpu_id),
> > > +
> > > +       TP_ARGS(frequency, gpu_id),
> > > +
> > > +       TP_STRUCT__entry(
> > > +               __field(unsigned int, frequency)
> > > +               __field(unsigned int, gpu_id)
> > > +       ),
> > > +
> > > +       TP_fast_assign(
> > > +               __entry->frequency = frequency;
> > > +               __entry->gpu_id = gpu_id;
> > > +       ),
> > > +
> > > +       TP_printk("frequency=%u gpu_id=%u",
> > > +               __entry->frequency, __entry->gpu_id)
> > > +);
> > >  #endif /* _TRACE_POWER_H */
> > >
> > >  /* This part must be outside protection */
> > > --
> > > 2.29.0.rc1.297.gfa9743e501-goog
> > >
> >
> >
> > Hi there,
> >
> > Per request, re-send this patch with dri-devel@ list CCed.
> >
> > Thanks,
> > Peiyong
> 
> Hi there,
> 
> For GPU drivers folks in dri-devel@ list, any input?
> 
> Thanks,
> Peiyong
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
