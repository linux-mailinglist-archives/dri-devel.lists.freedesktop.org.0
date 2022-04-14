Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3217650042B
	for <lists+dri-devel@lfdr.de>; Thu, 14 Apr 2022 04:27:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4CA1D10FB9F;
	Thu, 14 Apr 2022 02:27:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-sn1anam02on2133.outbound.protection.outlook.com [40.107.96.133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B533A10FB9F
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Apr 2022 02:27:05 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bM/OX9hO3GzAqZ03UHAkqc6u80IzyJiYRrcYGWZq+sSFSv5tAOluZkqjRgNNdlNH6AOK3Q/uxCDlYVklpou84nwxLiwJDEa7BTtzO0Z/j3NxObGn/Gfs/9XlHO6kiQ7jxkccufYW/AdCKzsmmazbRxSuN1M7/fBKhqEqrCtJdqYt39S2p+0QxIhPbpQ6rLLBv3+0pHhSI/G9v546a8fGIu2R0lXepyoOjKiW6Mp+IcPMYvXwLemeDdb5h/OgpAKS57LFJhf6vvjy4eJ95BsRSNtzuKcb/XmaIluOmGu6+qDyIqWcDDY5PiHRoQT6ZSDF+jxkg19QgCez/5Me3sqHMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CY46XyQbf7CMld4qUjFkIUKKV6RoxhWgPHQaLMoBpbI=;
 b=e4YWstGrg3yp0N+glKWmTG2lcv5o8nTuWoUP9FTHwXBgX6hJbY+Nyrwu2PjoDcOWnHuJIXKeXJGesAexNvTdE3wBDLR7bpyUDrZhpJ68SY8xCy5laCJLg8AzaUrSZ3629YGmS9BoHONCYfdcJ0bM+biUOmelDg5oIDWV+JNFB78iTbtmGDHokxoogVrqlJZSGN1Aj430ZDI0KaTK3xj6AqYOBK0V7FoKOzCRSd4Uao9r9gZTrdnSkKWq73ux2mZUctUK3Z6NehEnioJRxAc5Lu1SIUk4NGcCa+tdyYTWp4rYtIIpI0pnzCv+CSexAemBwnhI17lvv1/of+NRQpHQcQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=analogixsemi.com; dmarc=pass action=none
 header.from=analogixsemi.com; dkim=pass header.d=analogixsemi.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=Analogixsemi.onmicrosoft.com; s=selector2-Analogixsemi-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CY46XyQbf7CMld4qUjFkIUKKV6RoxhWgPHQaLMoBpbI=;
 b=hZ8orU1YLNpknOGYihpd2+vTmErWsKZsDJBbAcyr4XalK+p14duiyQ4oyl9F2qU5J1/uqjBI6lJq46K2ZWBBHik9tqeVg/8QrTCs9EKvcauJNKb8QD6MqdPMaceB+yIZCslAfSuUtNVZ0thFemldxHAwL4OT5lwdsJs6w0FN9oI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=analogixsemi.com;
Received: from BY5PR04MB6739.namprd04.prod.outlook.com (2603:10b6:a03:229::8)
 by CH2PR04MB6680.namprd04.prod.outlook.com (2603:10b6:610:93::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5144.29; Thu, 14 Apr
 2022 02:27:03 +0000
Received: from BY5PR04MB6739.namprd04.prod.outlook.com
 ([fe80::e9ba:4c90:6e9c:39f]) by BY5PR04MB6739.namprd04.prod.outlook.com
 ([fe80::e9ba:4c90:6e9c:39f%3]) with mapi id 15.20.5144.030; Thu, 14 Apr 2022
 02:27:03 +0000
Date: Thu, 14 Apr 2022 10:26:55 +0800
From: Xin Ji <xji@analogixsemi.com>
To: Robert Foss <robert.foss@linaro.org>
Subject: Re: [PATCH 3/4] dt-bindings: drm/bridge: anx7625: Change bus-type to
 7 (DPI)
Message-ID: <20220414022655.GA606685@anxtwsw-Precision-3640-Tower>
References: <20220328120956.1848795-1-xji@analogixsemi.com>
 <20220328120956.1848795-3-xji@analogixsemi.com>
 <YkswTpDiPYfdIFtE@robh.at.kernel.org>
 <20220409044740.GA595530@anxtwsw-Precision-3640-Tower>
 <CAG3jFyt1Srtn2aTFQ6b8Rxc6F_GCzU2mKxiEiWwgskMwHHjj5Q@mail.gmail.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAG3jFyt1Srtn2aTFQ6b8Rxc6F_GCzU2mKxiEiWwgskMwHHjj5Q@mail.gmail.com>
X-ClientProxiedBy: HK2PR06CA0017.apcprd06.prod.outlook.com
 (2603:1096:202:2e::29) To BY5PR04MB6739.namprd04.prod.outlook.com
 (2603:10b6:a03:229::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0e1e596b-fb7c-41b1-37cf-08da1dbe42a2
X-MS-TrafficTypeDiagnostic: CH2PR04MB6680:EE_
X-Microsoft-Antispam-PRVS: <CH2PR04MB6680BED7619E5FE7EA965018C7EF9@CH2PR04MB6680.namprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 980fY/zlanhHEOCfQQXItnfr7i1G/sOdfqUyxcOvDstEjSKmR+aRpRCcRE/+i2bJmfPWSLA7xjbXMuC52UP7lLmLNPWJ81yZDGfUw+yQPXKB6HCrQthN+7ZcBmh+Ji5p3wmPQ59xEAomxvc1jRblyiB+/Ll7ezFgMu5VPPBmCmTnpHS87OjJSNUXqQxZCSDBl4iezshyEmQLt5/H2p1G3gkg9VWgjU6prsbGChZcNwtTNnyVx+5Twc6gJbMxaRD+TAvMMUc6cc0XzO3hxP8F/rNu7JKoPxlPtW2vTOY6beVh1w4V6wNxip8U6x2gL0SU3fHS7/aHGFZ85UyA0TcOS+PFHkfwVMD1gkkJGZxb4Xc8mN7/nJbAanFUmYD9EKVSMAyxDgkaRHbflXEU4tBQJuqVS4LXUXzMFzsKZZ10avDscl9/hGOIIFHgKpW0yummkEdxbQ/7alstMnR0AZHkivvteuMLZkBt3iMPi4LEAnRGdEY18uoyKunJubjT1n3cbcu8/D2nn3S+TEniatQCXCtNYT6gxX6rE5haJwDXqqOJl5H2h1kRXE+n55nyW3ZhsmgM9PIBicmCsToFZTyiiH9DVOpEqhIFf6e0GXoyzdPSND8Xf05GKsTUEg9YVE2S58u3w6ghJWfX47CAc5fIIkhlYvIBsP0yjnsB/ugX7TlBDrfYvX2sS0ox40hoGCep0PmVMRD1AebLolNFGPmQsQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR04MB6739.namprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(7916004)(366004)(38100700002)(66946007)(1076003)(54906003)(508600001)(8936002)(6666004)(55236004)(6512007)(5660300002)(52116002)(7416002)(4326008)(6506007)(38350700002)(66476007)(8676002)(66556008)(86362001)(9686003)(83380400001)(33716001)(316002)(6486002)(966005)(2906002)(33656002)(186003)(26005)(6916009)(45080400002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?wALdjCFwHTr8HoMA1x7woshKgZ7V35VgtTCr2wCF0/68nK09Zvz1lae4B5Ag?=
 =?us-ascii?Q?3C4dVWKNVumcD2dwvgdJt3VQAIEGRLweLy3MjNr9v22ghJzzC1rI9WC7Atv9?=
 =?us-ascii?Q?P+p+g/GvMLedFSHGatlgpiLK3BIWgg0YSyIQqtotCvlSvhYs+hnf+RIj+RoV?=
 =?us-ascii?Q?kZ5wQEbjueuMQ/TaNrHdwb3R00C3LP8xUzA+4zQTEH4FaRnibYW+oSq1OAgs?=
 =?us-ascii?Q?lP4S8CB6z5JcnyDHgr+XnGSkauX39K05D9dUN/L3yF7RgGQ/h6BzpRapCq+d?=
 =?us-ascii?Q?YwZxERT3V6M2ahIXTHgXebx6LxUecpkA4OUHnJvlYukEFxS4ZwdNrtkDX1Cc?=
 =?us-ascii?Q?KmfXO/4dB0LI0xgHCMOE1pnjD5p9fWr70V9/ITBbZvNYc7pnqRCZMw1eH/cD?=
 =?us-ascii?Q?pUg/HG0xqGBW955yuc7tR0iZXSyBO1kZwedpPk94S5BmVc9QHrnZAfLZS291?=
 =?us-ascii?Q?KPBLhGGDDzN5PrbQ23a31K0AQm4XkDxsV8zK+e9SuHewO28hV/0Kh2iJAhhg?=
 =?us-ascii?Q?nsMWOy5lgQc/gD9fyci4XHC1qNvVE/NQJ24Nj3EhD6DardKbzWD9KPkOIYQx?=
 =?us-ascii?Q?S+CzsippDy/I0eNV5sTFUqpoG6Q1SVO6pSVKGRKODSkPgJ4YEx1Bxbb5VgYu?=
 =?us-ascii?Q?JN0t14Fnbe477hnVEZElR4+8uFO2xdgqhnHI929AGtwI0RI196gU+Agdci7f?=
 =?us-ascii?Q?DMYEb2REt/fAXU6UF/Cb//cwNTeNsSz78qnUqGkuYALC5cEZfMaLvQIWpIYy?=
 =?us-ascii?Q?WuRQ7lr6M3/1B19ZukZeb024GvBbWnOr3cVNTbWAt0IpmNDvD8KAx376ZVjJ?=
 =?us-ascii?Q?EBLBoXfPUJvwPjsqLIbJyMK/09ORY5s1rXbowTfRpvfLddmQff03OACxSeOp?=
 =?us-ascii?Q?m9CIyC+NhwHEKRd38zJWPcNRldHCa6qdIsVLfMXUzoCWT2ZciVLuiO7GmUVD?=
 =?us-ascii?Q?K8dr5/C94O8yE/kGxy/Q5DJnVSvDcoBQP0Vur3K+KM2tPgpgMi2OaEFwiyW9?=
 =?us-ascii?Q?NV0R9UH2d+eYzfB7XyLYlmP8pPpXEYB5X1kUcdqW1o/g8DUn64FzHkp36y61?=
 =?us-ascii?Q?Milla5ufXWkV5wL67HuR38C0kd/w+owAZnQ91YgjzixUuwrzu9GpSD3UyL+Z?=
 =?us-ascii?Q?fcQe0ABL0YV10o7R/AlbriTUrcQh8VvxehyaKBP+PN+9V4kTomrpbezzZlo1?=
 =?us-ascii?Q?H+bNAgs/bTvOzv7nXFlD80A/FA3wrbLb19670HT/T+hcoY+S2VIxznpk/9t7?=
 =?us-ascii?Q?JgNyKcgmjOIEF69/PFWo+g3Xps6msODSa2XbuPQC0CfolJMOLqdDhhVWidrK?=
 =?us-ascii?Q?tHceedT4C32GI32j3UcSIviIgnlvQk+GBPL1xhTX1YE7BvjIkSm+cWl6uaCz?=
 =?us-ascii?Q?GHNaErUUvc2TJgN2HjA0q28Pv8U00TMqv7vQlz0N1ncFrBwuG7/zTQOFYmXp?=
 =?us-ascii?Q?rUiP7vieb7dFrGoSQRjYOKLCXi5Pah04nzUMQQ+7ZQEf8VUfeFhgRZ07ml7p?=
 =?us-ascii?Q?4bF915wlAFJbHkH5AwBNTi78USq87w4umhpoATDR67TVaSIUd3CC4xvWJWuZ?=
 =?us-ascii?Q?jf/IG+OmWztngC7eK4QzV8YakDkO4dZyPUSnEt5feoO0HVqYe0j18DqPr1Er?=
 =?us-ascii?Q?NsYEb6JtnJMcoKEzPyNL3We1gHJ6JmdY2ZOT82ZcAy+V7nKRqDdO+V+so1tH?=
 =?us-ascii?Q?rKUBAQLt6VsP1kZIGjXZ7rc3ddStT75mNEu391qL8PYbuFwakY0aOzbVgFeH?=
 =?us-ascii?Q?V6FilNKJSw=3D=3D?=
X-OriginatorOrg: analogixsemi.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0e1e596b-fb7c-41b1-37cf-08da1dbe42a2
X-MS-Exchange-CrossTenant-AuthSource: BY5PR04MB6739.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Apr 2022 02:27:02.9495 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b099b0b4-f26c-4cf5-9a0f-d5be9acab205
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZOTaktAYSz1zYIEztLbck2UQ8HtxsAkuGVI2YXtWM0P5bHrsMoricHZ+BPcOHjBHdntZXz9/kYnN441TxcyArA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR04MB6680
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
Cc: dri-devel@lists.freedesktop.org, Jonas Karlman <jonas@kwiboo.se>,
 David Airlie <airlied@linux.ie>, qwen@analogixsemi.com,
 Neil Armstrong <narmstrong@baylibre.com>, linux-kernel@vger.kernel.org,
 Jernej Skrabec <jernej.skrabec@gmail.com>, devicetree@vger.kernel.org,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, bliang@analogixsemi.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Apr 13, 2022 at 04:28:51PM +0200, Robert Foss wrote:
> On Sat, 9 Apr 2022 at 06:47, Xin Ji <xji@analogixsemi.com> wrote:
> >
> > On Mon, Apr 04, 2022 at 12:52:14PM -0500, Rob Herring wrote:
> > > On Mon, Mar 28, 2022 at 08:09:54PM +0800, Xin Ji wrote:
> > > > Change bus-type define for DPI.
> > > >
> > > > Fixes: a43661e7e819 ("dt-bindings:drm/bridge:anx7625:add vendor define")
> > > >
> > > > Signed-off-by: Xin Ji <xji@analogixsemi.com>
> > > > ---
> > > >  .../devicetree/bindings/display/bridge/analogix,anx7625.yaml  | 4 ++--
> > > >  1 file changed, 2 insertions(+), 2 deletions(-)
> > > >
> > > > diff --git a/Documentation/devicetree/bindings/display/bridge/analogix,anx7625.yaml b/Documentation/devicetree/bindings/display/bridge/analogix,anx7625.yaml
> > > > index 0d38d6fe3983..4590186c4a0b 100644
> > > > --- a/Documentation/devicetree/bindings/display/bridge/analogix,anx7625.yaml
> > > > +++ b/Documentation/devicetree/bindings/display/bridge/analogix,anx7625.yaml
> > > > @@ -106,7 +106,7 @@ properties:
> > > >                remote-endpoint: true
> > > >
> > > >                bus-type:
> > > > -                enum: [1, 5]
> > > > +                enum: [7]
> > >
> > > Changing is an ABI break, but didn't we revert adding this?
> > Hi Rob, sorry, what do you mean about ABI break? Do I need remove this
> > patch in this serial? Or do I need revert patch
> > https://nam10.safelinks.protection.outlook.com/?url=https%3A%2F%2Fpatchwork.freedesktop.org%2Fpatch%2F462331%2F&amp;data=04%7C01%7Cxji%40analogixsemi.com%7C10f5b0213f434592936008da1d59f566%7Cb099b0b4f26c4cf59a0fd5be9acab205%7C0%7C0%7C637854569490105386%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000&amp;sdata=vK0Vmb9S425kHZc1WurfnNhnoXDMbUGkkdY1PVnfS9g%3D&amp;reserved=0, I don't know how to do
> > it.
> >
> 
> I contributed to the confusion about this, let's see if we can clear it up.
> 
> An issue was found related to which enum values were used to represent
> what late in the last release cycle. As a result a revert[1] patch for
> everything touching bus-type in anx7625 was merged.
> 
> This patch, does not apply to drm-misc-next due to the revert, and if
> Xin Ji rebases his work on the drm-misc-next there should be no
> ABI-change as this patch when fixed up will introduce bus-type to the
> nax7625 ABI.
> 
> Xin: Does this make sense to you?
Hi Robert Foss, yes, my work is based on drm-misc-next, all I can do,
just make a fix up patch(this patch) to change the bus-type define.

Thanks,
Xin
> 
> [1] https://nam10.safelinks.protection.outlook.com/?url=https%3A%2F%2Fcgit.freedesktop.org%2Fdrm%2Fdrm-misc%2Fcommit%2F%3Fid%3D979452fbc43028675b5a5da156f91928b739dea8&amp;data=04%7C01%7Cxji%40analogixsemi.com%7C10f5b0213f434592936008da1d59f566%7Cb099b0b4f26c4cf59a0fd5be9acab205%7C0%7C0%7C637854569490105386%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000&amp;sdata=onmKAoEEP1XDbl%2FaeAIfVYJ4cSbiTfTBYCd%2BHCA9fzw%3D&amp;reserved=0
