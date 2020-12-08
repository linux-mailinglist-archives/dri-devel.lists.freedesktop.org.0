Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 877272D2639
	for <lists+dri-devel@lfdr.de>; Tue,  8 Dec 2020 09:34:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2A6476E965;
	Tue,  8 Dec 2020 08:32:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 (mail-eopbgr150073.outbound.protection.outlook.com [40.107.15.73])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2D5EF6E942
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Dec 2020 03:09:13 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CyPemiPEWuZNMOpmVUb5s9OssoTGYMICB/TLwR5ZENsDvy/KxffYMF4zmxwuCLTbu4XWf4+wvzhTMe/1yN5mWVWDosxY16dTp5zyFDMZtSKMrilVSQ++/tEbxWndHz1957HF14duWScKr6UHx3GXk3WgPG17+xTXJJJdrggacDidbHua8YI4eiS4NIbjTW0m2UdT22fV++KEhUF26r7nWs2rFtXm6AfxR5muj8TYypfSV/qXcNkoh0xg3uqVPAnauiIUyHEJcR6J1e5V5Wv1uu8vypCwVZ58Y1q1emn5RYbZY4taNBajVvoNbs2NNMIKIlj/FukWTR0eNE6pbGi/pA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=v2vpuQamVqr9hWJlt1AwV6i9vetJreOc/tOwxBykfjs=;
 b=R4v0RFGxai6Zc45zpfIm3aEB3CJNRZpVoeVdampigJTXCCkKDtq7btJ6zGy/L/axY5OX/K7d4+KKsSwrf1IcrkqpkyU3PFCN0Nc7eQ2swt/a97yIpV+xC2N45WPEzPjSDDRGemnZaOwuJ7O78er5PVUp9nzrQRIEWlctQhyK6Kpv9PVwwC53bjjvezV6jVi5XgJ4hMo0ZqIYmtGYfC7rnUKXPHt90fiyBfZc9o0ag5Q2MynL3TM2S9etW0hGnvklrEdZEI0B8me/kFuS3C2Q1JyVMtsbc329NS4zdXDtpfQptwFQ74Pr3Yb3UF1ouyc0JfbXsCXzD8ZQv9bHXM31vw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=v2vpuQamVqr9hWJlt1AwV6i9vetJreOc/tOwxBykfjs=;
 b=Bh6vXFVipEHVw0QHRaIxKb98NI5B8RChh+Q++41K+NY+iwlCxm4EAtZ0tmQjR0IpsQEuC9C5+FHw+YRcsMUtaopdPTmAjeYF8IhkNUqqRxQX3Zzk1lr12ipyAJPvzUotx09awFM3pB4ca6a1KwB2xhuF0lqYtcCKV+Vd3vO3ypo=
Authentication-Results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=nxp.com;
Received: from VI1PR04MB3983.eurprd04.prod.outlook.com (10.171.182.16) by
 VI1PR0402MB3424.eurprd04.prod.outlook.com (52.134.7.30) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3632.21; Tue, 8 Dec 2020 03:09:07 +0000
Received: from VI1PR04MB3983.eurprd04.prod.outlook.com
 ([fe80::dcb7:6117:3def:2685]) by VI1PR04MB3983.eurprd04.prod.outlook.com
 ([fe80::dcb7:6117:3def:2685%7]) with mapi id 15.20.3632.023; Tue, 8 Dec 2020
 03:09:07 +0000
Message-ID: <cd19cc3a260ff5b98e5f49d66fbb601668d618a4.camel@nxp.com>
Subject: Re: [PATCH v3 1/6] dt-bindings: display: imx: Add i.MX8qxp/qm DPU
 binding
From: Liu Ying <victor.liu@nxp.com>
To: Rob Herring <robh@kernel.org>
Date: Tue, 08 Dec 2020 11:07:19 +0800
In-Reply-To: <20201207165610.GA429808@robh.at.kernel.org>
References: <1607311260-13983-1-git-send-email-victor.liu@nxp.com>
 <1607311260-13983-2-git-send-email-victor.liu@nxp.com>
 <20201207165610.GA429808@robh.at.kernel.org>
User-Agent: Evolution 3.36.4-0ubuntu1 
X-Originating-IP: [119.31.174.66]
X-ClientProxiedBy: SG2PR06CA0207.apcprd06.prod.outlook.com
 (2603:1096:4:68::15) To VI1PR04MB3983.eurprd04.prod.outlook.com
 (2603:10a6:803:4c::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from blueberry.ap.freescale.net (119.31.174.66) by
 SG2PR06CA0207.apcprd06.prod.outlook.com (2603:1096:4:68::15) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3632.17 via Frontend Transport; Tue, 8 Dec 2020 03:09:03 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 9d48b5c5-2dad-45c4-5c9e-08d89b26a06b
X-MS-TrafficTypeDiagnostic: VI1PR0402MB3424:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <VI1PR0402MB34241AB240C22E2F06953F5398CD0@VI1PR0402MB3424.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: rAOf0m2DbMaFjFUYsVaHh8L+1v3qX1IhwSl/8gvO50j+mammdp1OnyW08tAS+kmgtnQwGVugMPP2Lf9GfN39V2KT2DxVQn2NnMpM+2gFMQAN8RwtalbC+k0r5MitbkJKUgjAT9FVOL5Ipc5GBorLq9Soudviudq1cgPBuZ8PMm+NPITs5u9zIYxJTNwUiC99N3qRdbP3giemW7kX7tVUpVOQDmkuQSm1URjo/sXFXyupTFcrLoNp9sLqZhDajbL+f2Y70pqhIqkoMYIHEAuQNjQ/qRImJl39SiFG8yZz3ueNoZK8gA58oF0gl9J60XOpc7Bil794+vuN7ANtrZ9vwaa8O3KXq7RPoNIesWLO23+KVpKLKyBiZZ7q5WSQAyBZ
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1PR04MB3983.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(366004)(136003)(346002)(26005)(4326008)(34490700003)(2616005)(86362001)(956004)(6506007)(36756003)(7416002)(8676002)(5660300002)(6916009)(8936002)(52116002)(83380400001)(508600001)(6486002)(66556008)(66476007)(6666004)(2906002)(186003)(16526019)(66946007)(6512007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?czZEWWtRSnZMVWkrVnBoS24yNTc5VlZUYkw2eUZMa2t1bU5zM01Ga3ZZZmk5?=
 =?utf-8?B?Umk4Tk05b1dIekpOeEphL1dvMzFzQ1FWWWtJOVJrVUY2WFVFVUkvWVJ3Sm43?=
 =?utf-8?B?TUM2akx0WmFnbjUzd3JTVlRhdkpqczNSZUtJWGIwQmM4emR5Rkt1QndHc0My?=
 =?utf-8?B?YzRMWTVud0FON0RsdGhWellFeW9LY1lmdlZsZVlUN1BNa1ZZVE13UEZiRm5O?=
 =?utf-8?B?cUtxU05vSjdjUVBWK0dPSHRrVXVaa2dKdGFzTE5XQit1QXczR3ZhbkZ2NGt6?=
 =?utf-8?B?K1BjM1ZDckpJbkY4N2U2MUVaQWFDSVp2WVRRMFdQT0RVU1NRdU5McVVLaDZZ?=
 =?utf-8?B?ck4xRys0d0FrTG1xTDRXWTVzSTJFSlF0aEZtR3Fwa0pPUTEyREY4VG5tQWNH?=
 =?utf-8?B?UUphdlk0Q1p4OXBRa3JKMVVBc2F3VlFQL3YwYUJPZXJ3R0xXZTFscFpaL290?=
 =?utf-8?B?NGZ6ZXY1SEJmZkxYT3hWNHJZcXR0d1cwUUQvZzQ2RTA5Zk8xMkM3b3o1dzRF?=
 =?utf-8?B?NmgwdDJNcWMrTnpocDFNOGp3UTBTZW43cFR6N3U1dVljaDRIeS9tc3k3RmJP?=
 =?utf-8?B?bTkxQUF0OEd3ZlNRMlFWRDh2M3RCL2dDemdaVFBLVkpZRzQvMnpNMXozK2V5?=
 =?utf-8?B?WDEzNFJkUkp1cmZtaitPelRhTmNHNFQ4cGRHK2E2SmNHZmhGZ1FMY0p5NTZi?=
 =?utf-8?B?dGdnR2I2N3Zadnhwbnd1ZmtQYjZsRkQ1My9haFRkUlFTQzJFcnlLdjV1RnYz?=
 =?utf-8?B?T2hlZXlWQS9YMS9lRXFjb0lhbll3VHd5TjlJWXhkVjBaTHk1TVdCK0hXbHFL?=
 =?utf-8?B?NGxjbHRuU2toVU90bm9zckc0RTcxUmJoMno2eVFnYWh1WUNGR1Nmdk1aRGpm?=
 =?utf-8?B?RTZ5cU5tU2ZXTXArMEV0bjZBcys1aEVEajlWdEpVb2EyZVpvUUtkMERQbUdZ?=
 =?utf-8?B?ZHk5dzFTUTdabWc5Tm1YeHE2OFNtOU5Sam9KVE9kYUk4YnpyWkl2S3c3dWhh?=
 =?utf-8?B?eStIWjArS2MxbnB6YkxybHNUL3lNUTh3SnhWVncwVDV4TUZNcEZQNlhuNjU5?=
 =?utf-8?B?SDN3eXQ5VTE3aWZBaHlHaW9uMyttY3BzZElGbXpqb1ArTE9ObStiZ0pETkpa?=
 =?utf-8?B?dUM1RnozVWcyczFhcG5laStqQXhxdWEwMFNocm04K2FUb21GQXRoczZQVEd6?=
 =?utf-8?B?YnVNaWtTc2sxZ0p5UDlqREtWUHFuZ1RuWWFQLzJobm40R0poY25VcjNvMFhG?=
 =?utf-8?B?VUpUdkVVTmdCai9NWENPTnJtSUpnRE1yWERxeDE5cEIzMm1LdTROSXFqSDVP?=
 =?utf-8?Q?d/lSmOUvB3nPRCR/eEAyWY7Kx1IrvT0Bwd?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9d48b5c5-2dad-45c4-5c9e-08d89b26a06b
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB3983.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Dec 2020 03:09:07.8046 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Svp6jROuGsTqNge8tkniwrUb8K3dsJcccCaK4RM06KosZiPRrWVA3TCLocbAEWtDq573lIvyOvj980BuUUW2hQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0402MB3424
X-Mailman-Approved-At: Tue, 08 Dec 2020 08:32:06 +0000
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
Cc: devicetree@vger.kernel.org, tzimmermann@suse.de, airlied@linux.ie,
 s.hauer@pengutronix.de, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, robh+dt@kernel.org, linux-imx@nxp.com,
 kernel@pengutronix.de, laurentiu.palcu@oss.nxp.com, shawnguo@kernel.org,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, 2020-12-07 at 10:56 -0600, Rob Herring wrote:
> On Mon, 07 Dec 2020 11:20:55 +0800, Liu Ying wrote:
> > This patch adds bindings for i.MX8qxp/qm Display Processing Unit.
> > 
> > Signed-off-by: Liu Ying <victor.liu@nxp.com>
> > ---
> > Note that this depends on the 'two cell binding' clock patch set which has
> > already landed in Shawn's i.MX clk/imx git branch.  Otherwise, imx8-lpcg.h
> > won't be found.
> > 
> > v2->v3:
> > * No change.
> > 
> > v1->v2:
> > * Fix yamllint warnings.
> > * Require bypass0 and bypass1 clocks for both i.MX8qxp and i.MX8qm, as the
> >   display controller subsystem spec does say that they exist.
> > * Use new dt binding way to add clocks in the example.
> > * Trivial tweaks for the example.
> > 
> >  .../bindings/display/imx/fsl,imx8qxp-dpu.yaml      | 416 +++++++++++++++++++++
> >  1 file changed, 416 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dpu.yaml
> > 
> 
> Reviewed-by: Rob Herring <robh@kernel.org>

Same to 2/6 and 3/6, will also use enum instead of oneOf+const for this
one in the next version, if no objections.

Thanks,
Liu Ying

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
