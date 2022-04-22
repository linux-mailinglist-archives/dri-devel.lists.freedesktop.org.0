Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 139F650B284
	for <lists+dri-devel@lfdr.de>; Fri, 22 Apr 2022 10:04:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9AFB610F714;
	Fri, 22 Apr 2022 08:04:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2139.outbound.protection.outlook.com [40.107.223.139])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DBE2D10F745
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Apr 2022 08:04:50 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=D4user/IUWOfNTUTHETWezp7fJelo+X8LOgVApPCVXv0Ublj1+dNJuvtYPz5aReVvP7znDziiT9DOOtsEgZq8Rjs/P8VJWVS4Kc3V9BxMLEoTQXGIOBf6eMhhfDXZYy5buCuh1YfJgIe79s1Y+F/5aHlsa9gKnyAFmloQ/CqOg1PiV8qSvnFT+olAiFq1ZjtMrM5kwUUqL5tCbUXsEHOpeNklml36RDbcKKddbK3Jp4AQ/KHYry3Sk3qx9j99L+yfA08VyjsmDeM6wiu7331gYT63ICCKfQX4sBtd9flR13wiBkeG3A7mVzyp91pXMve28aORt/jjD/ugkFZLwn+oQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=49KaYH9qLI4v0cAZ5gIs6mbFi+XnCNidqZ6dhlcuw8I=;
 b=MoZA21fo/16A9kci9qaqAVYSNxQW2Xqhm0vdCeo2t86D+b0ux6/6TpSlcWzj3rx5aJywVSbP04K4XFSJOOZ8lO66Zpm3hoIEamK9cItm5zNkTCBQFaP1zE9iVBlQkxPHVQBawFG17eYGS/rkucSgXQ4sSeVemPPUyy2ZXR780FCkAWiXB+7xN3tKRiWcEB8q7v51i2SEV9not2H+yN1iNf5aqFOEnhoO3ZuGy57ZzONVP1OYeaMKfnFv3S/ixsk3Ym8+wKfxzests1CvdvTeOVgiKr++S2hkDwDNKRFkZw/dGr7Hjzs1hVBkfn0Y/2q8H3Hrk85QvUMtKKxCaQMz5w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=analogixsemi.com; dmarc=pass action=none
 header.from=analogixsemi.com; dkim=pass header.d=analogixsemi.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=Analogixsemi.onmicrosoft.com; s=selector2-Analogixsemi-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=49KaYH9qLI4v0cAZ5gIs6mbFi+XnCNidqZ6dhlcuw8I=;
 b=g4YqIip579xvz8hNOkxpoMpoqiKCycVjvMFd5TM7Vgm338hCSkFPwrOH30D24DNThvYC7K5KT8f8mOiyXLsdsqQikaaK0ieCUOGbVVSZr8ARMULInwFxsjmv3Yw4SjAKziUxVlnN9D/BQ3Hj/K5BjO5WPYBHyVxx7500xfE5zvQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=analogixsemi.com;
Received: from BY5PR04MB6739.namprd04.prod.outlook.com (2603:10b6:a03:229::8)
 by BN6PR04MB0452.namprd04.prod.outlook.com (2603:10b6:404:9b::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5186.14; Fri, 22 Apr
 2022 08:04:47 +0000
Received: from BY5PR04MB6739.namprd04.prod.outlook.com
 ([fe80::e9ba:4c90:6e9c:39f]) by BY5PR04MB6739.namprd04.prod.outlook.com
 ([fe80::e9ba:4c90:6e9c:39f%4]) with mapi id 15.20.5186.015; Fri, 22 Apr 2022
 08:04:47 +0000
Date: Fri, 22 Apr 2022 16:04:38 +0800
From: Xin Ji <xji@analogixsemi.com>
To: Chen-Yu Tsai <wenst@chromium.org>
Subject: Re: [PATCH 3/4] dt-bindings: drm/bridge: anx7625: Change bus-type to
 7 (DPI)
Message-ID: <20220422080438.GA678741@anxtwsw-Precision-3640-Tower>
References: <20220328120956.1848795-1-xji@analogixsemi.com>
 <20220328120956.1848795-3-xji@analogixsemi.com>
 <YkswTpDiPYfdIFtE@robh.at.kernel.org>
 <20220409044740.GA595530@anxtwsw-Precision-3640-Tower>
 <CAG3jFyt1Srtn2aTFQ6b8Rxc6F_GCzU2mKxiEiWwgskMwHHjj5Q@mail.gmail.com>
 <20220414022655.GA606685@anxtwsw-Precision-3640-Tower>
 <CAGXv+5EXpfVQCSUwgMP2fGf6ZPzvTuZxYbLB+F=cOKH4op0o3Q@mail.gmail.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAGXv+5EXpfVQCSUwgMP2fGf6ZPzvTuZxYbLB+F=cOKH4op0o3Q@mail.gmail.com>
X-ClientProxiedBy: TYAPR01CA0173.jpnprd01.prod.outlook.com
 (2603:1096:404:ba::17) To BY5PR04MB6739.namprd04.prod.outlook.com
 (2603:10b6:a03:229::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: cbfe2529-6246-4f32-1410-08da2436c475
X-MS-TrafficTypeDiagnostic: BN6PR04MB0452:EE_
X-Microsoft-Antispam-PRVS: <BN6PR04MB045291490C54695BFBC5FB97C7F79@BN6PR04MB0452.namprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: uxGAsbuyoZS3zYuL9yDLBishk9Vpk36KfMtB0CxYDYYJr//D6lWX2WY9WxC0njdpTmZU2gtpen4zgeQZVPlthMNeUnV23oV8AsYtwO9tkVn7hYW7BF0/rPxspczLeAARGMMdlMiyq66WiKDGZmBPfmeM6PDXX+Be0hfb9NO5A68CFGdGpYMv2vtiZy4r+1wApzWObz5tgIqNsxUBtvv/ejgMDjBHYutEBTxqnfS5ZnqmuFqxnQLolJCOW/j9zK/7P/wDpzEgMJojfafg6MVXHFyFB9REO4QRtXhF6cMlxpwS8xKFNcQqABI0LFAjU5kcMIhUjebB37dJdOVPezfsd+UOfXEl8gwxmZTkm7/hK/z7SuG+y3dojA1oz40VrAp15kOzugyOnQCYqccvBI9lk+DbZg/F9lSv8/aNlM28VXe4qggU/8r6Xqb+Psz8z0EPQNV5eQxAw0WACMBgH+0NvqcJIR8asLBPeK5tIj2cG5BO0BbuDYxCJH2tncTe8goq7DH8GVgsKCPhMfRZyr93vtZ+pZ/2//Qx5GRNq/TViY1Of/Y5JJYwcMqd7304IyfgrxwF3A+ExvvEvXednv212jEgaV5Gv2K46yollSiqcbMtAuanPQA186h0DhWjDM3hlRAfUMyE/3L9q3R6jY8dhs8dH5l5pl/mdkGOY1IB6KV9HgU7DqF0wlIkdpdNH2/kXtuaWpi/4O2BBEiLSltxTQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR04MB6739.namprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(7916004)(366004)(33656002)(186003)(107886003)(55236004)(66556008)(53546011)(4326008)(5660300002)(8676002)(83380400001)(2906002)(1076003)(9686003)(26005)(6512007)(52116002)(6506007)(8936002)(6666004)(7416002)(45080400002)(86362001)(508600001)(966005)(6486002)(6916009)(38100700002)(38350700002)(66476007)(66946007)(54906003)(316002)(33716001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?3gzqjfT7P7lVSH+Y9g1zf22dGiOGKgYhMiJTaZNYdYN5+TZNDxdZ5CvbnMSw?=
 =?us-ascii?Q?c5tEiCVVQP6K5C39ObCbGYbo7gJNjrHIU61ON7d4OyOtd3fzBXpuYQWaTPL8?=
 =?us-ascii?Q?KOyM3g+ZEJWgWJg0UpShYLpAsQRnx2vX883aXQFnTqeSbjhRgyw6fRFJuCMX?=
 =?us-ascii?Q?bVh0aJNqOsT6he3BWDerDePpUYvtsNwAAQhhyr3KSLOfpgeCNnFFu/xh8+zJ?=
 =?us-ascii?Q?ynBfBaHzCUjL9udcFyGW0WkJScDtWqgu9PLxrGF3QhqUQCPU4VrOpNyaHjSS?=
 =?us-ascii?Q?Y/KHMJEeJk5uYqEC+IT6/NJ5esk/iPRBRfQ9XnBdtM62fq2RvCzExVeDJQ/P?=
 =?us-ascii?Q?rc/qopUcVlXCOpaG15GjxZ0SXAHd51A57p3IAfN4WJecAbFbpcB022mgWMOt?=
 =?us-ascii?Q?EjufsXbEzPfuDXzIMlb1V8QDaJMVft5qg3Crt0oe9tMmExYlXnLURHxrjwK9?=
 =?us-ascii?Q?l28OxN89tYQRlQjzR1XS0ryzWq8TG0WWfZZXBA7B2d/EV1D1X3dzu8B78Scw?=
 =?us-ascii?Q?nVNCGtnO0kTz62bHifZ9HYqh1cSTLUafiD26v2QE6DSnax+lInz7EokglyON?=
 =?us-ascii?Q?+PHjaH4LHWmb6YIp4gojh6eTFDAK1C2TqzTi+SJ4tmH4kPxGdYD78gkBo4j9?=
 =?us-ascii?Q?0SpCAaZSQgetLCvpTQdr/5VSPlRWWI6ixq2gIL2eXZLnNjA5jy2MZhPBlpe7?=
 =?us-ascii?Q?NuT1YAEB8lGL+R77jWk2G1sk/9DxTi8nD1fvNNcjbbgqRnPoLKisPRDZSa1p?=
 =?us-ascii?Q?7koHHhq46QYZE4i8etAxJjU7a7TXebDW3r0viWwNPzkR6kgj/jI03ZA9egoi?=
 =?us-ascii?Q?ZMKiHAheF/GiFmToSYmkuhSG4RtdF133jC7LyMYPuBmf5B6EZYR/DlPf3iM2?=
 =?us-ascii?Q?FGfB2wMtDzOxa2ffJ3BMZdepojCDvJBthaoXW7fcSZBaT/a7GM1xdPQh9e76?=
 =?us-ascii?Q?tbcaJeM+i6CFRJsEhgU/QjTt/twsNRX7Jb+aQmw8XXTSIOk++1sG1zm8soUi?=
 =?us-ascii?Q?PYi97sD/ziM0lzpiNVmT0s8qqCGtmlNAa5D4jEewLl7+e5DVF6iuUYxy2Trh?=
 =?us-ascii?Q?M4+Z9+D7S3rdqKYGNqBLyxSSLw/SwlKhGchvLNafLJTGhIHtTxiwWFnmonYI?=
 =?us-ascii?Q?kTf0Um0eshfWt9V41enM0XYngfiLJR/AHY0nmJ+el4S0e2K+9NPj20l/6H0Q?=
 =?us-ascii?Q?MxF83mm1fOaSVOnl8tbwdmvCArVLmnZvo5Qogi0YzKyhZr/QeQtgzwVpTFMb?=
 =?us-ascii?Q?jlnTxuTEov2CCfdziftsLJLp72nVmZ0bimgIyUIL+b0MGPO1dPqVO1WJnU6Q?=
 =?us-ascii?Q?Lwoo+KxZPIT2BuuglH2s7tiRgjroI2EGSFKmZ9VpLjj21uYvm8LF139A3eSQ?=
 =?us-ascii?Q?K90d7dzitkcYExr9mWzg6lPmiA2q3w/vyW9zeh/iKQHd2jpywycD1VtqRpwM?=
 =?us-ascii?Q?5nWHdgy6jv03ZLRd7XIpg7xpcik11B88yrpO0baTpxQJJf/QqOwRUo7d7Zmz?=
 =?us-ascii?Q?y5rwkvBzFXA4gXavTFJVxhsZebmxY0DICT/eo9m5E0acyQfzpGg8rnCJtZJk?=
 =?us-ascii?Q?w3vNvnpN/flA1AHCqiZ0qSHO5d0d9b0wMOh5nbI/whRaY0GiVXJVGxZznfxM?=
 =?us-ascii?Q?MSLBXFTUy3gbmdWDIInMUm1p+1vbw05AHw0mma1B2OEA8AaSRA+oIjXvUeyu?=
 =?us-ascii?Q?NouFxmPHEo1tyZGMphuuzAGdJpPCU6CNiILGvt4WfvYUSDY90u2fk3dTISmz?=
 =?us-ascii?Q?CztmFm58/Q=3D=3D?=
X-OriginatorOrg: analogixsemi.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cbfe2529-6246-4f32-1410-08da2436c475
X-MS-Exchange-CrossTenant-AuthSource: BY5PR04MB6739.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Apr 2022 08:04:47.1999 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b099b0b4-f26c-4cf5-9a0f-d5be9acab205
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LdnFDOcjAY+ObsvK7RFz1LeG2wtcda97Cgxw7ycpousWkTUr3rYHxmv4FeFkONtBL2FfN6bK41yiyJBSQLZ1aQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR04MB0452
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
Cc: devicetree@vger.kernel.org, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Neil Armstrong <narmstrong@baylibre.com>, David Airlie <airlied@linux.ie>,
 qwen@analogixsemi.com, Jonas Karlman <jonas@kwiboo.se>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Robert Foss <robert.foss@linaro.org>, Andrzej Hajda <andrzej.hajda@intel.com>,
 bliang@analogixsemi.com, Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Apr 18, 2022 at 02:31:38PM +0800, Chen-Yu Tsai wrote:
> Hi,
> 
> On Thu, Apr 14, 2022 at 10:27 AM Xin Ji <xji@analogixsemi.com> wrote:
> >
> > On Wed, Apr 13, 2022 at 04:28:51PM +0200, Robert Foss wrote:
> > > On Sat, 9 Apr 2022 at 06:47, Xin Ji <xji@analogixsemi.com> wrote:
> > > >
> > > > On Mon, Apr 04, 2022 at 12:52:14PM -0500, Rob Herring wrote:
> > > > > On Mon, Mar 28, 2022 at 08:09:54PM +0800, Xin Ji wrote:
> > > > > > Change bus-type define for DPI.
> > > > > >
> > > > > > Fixes: a43661e7e819 ("dt-bindings:drm/bridge:anx7625:add vendor define")
> > > > > >
> > > > > > Signed-off-by: Xin Ji <xji@analogixsemi.com>
> > > > > > ---
> > > > > >  .../devicetree/bindings/display/bridge/analogix,anx7625.yaml  | 4 ++--
> > > > > >  1 file changed, 2 insertions(+), 2 deletions(-)
> > > > > >
> > > > > > diff --git a/Documentation/devicetree/bindings/display/bridge/analogix,anx7625.yaml b/Documentation/devicetree/bindings/display/bridge/analogix,anx7625.yaml
> > > > > > index 0d38d6fe3983..4590186c4a0b 100644
> > > > > > --- a/Documentation/devicetree/bindings/display/bridge/analogix,anx7625.yaml
> > > > > > +++ b/Documentation/devicetree/bindings/display/bridge/analogix,anx7625.yaml
> > > > > > @@ -106,7 +106,7 @@ properties:
> > > > > >                remote-endpoint: true
> > > > > >
> > > > > >                bus-type:
> > > > > > -                enum: [1, 5]
> > > > > > +                enum: [7]
> > > > >
> > > > > Changing is an ABI break, but didn't we revert adding this?
> > > > Hi Rob, sorry, what do you mean about ABI break? Do I need remove this
> > > > patch in this serial? Or do I need revert patch
> > > > https://nam10.safelinks.protection.outlook.com/?url=https%3A%2F%2Fpatchwork.freedesktop.org%2Fpatch%2F462331%2F&amp;data=04%7C01%7Cxji%40analogixsemi.com%7C7d3089c9ec10458a4ea208da21051e7b%7Cb099b0b4f26c4cf59a0fd5be9acab205%7C0%7C0%7C637858603556318586%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000&amp;sdata=YMjW9RnMbbIiUA7dVCitqo9P2Axr2MxPCxxUK3W6pII%3D&amp;reserved=0, I don't know how to do
> > > > it.
> > > >
> > >
> > > I contributed to the confusion about this, let's see if we can clear it up.
> > >
> > > An issue was found related to which enum values were used to represent
> > > what late in the last release cycle. As a result a revert[1] patch for
> > > everything touching bus-type in anx7625 was merged.
> > >
> > > This patch, does not apply to drm-misc-next due to the revert, and if
> > > Xin Ji rebases his work on the drm-misc-next there should be no
> > > ABI-change as this patch when fixed up will introduce bus-type to the
> > > nax7625 ABI.
> > >
> > > Xin: Does this make sense to you?
> > Hi Robert Foss, yes, my work is based on drm-misc-next, all I can do,
> > just make a fix up patch(this patch) to change the bus-type define.
> 
> The revert was applied to the soc tree and merged into Linus's tree
> in v5.17-rc8. It was not present in drm-misc-next until April 5 with
> commit 9cbbd694a58b ("Merge drm/drm-next into drm-misc-next").
> 
> So please fetch the latest drm-misc-next, rebase your patches on top, and
> resend.
Hi ChenYu, OK, I'll resend this patch serial.
Thanks,
Xin
> 
> 
> Thanks
> ChenYu
