Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F2C04E6E2F
	for <lists+dri-devel@lfdr.de>; Fri, 25 Mar 2022 07:29:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 55A5110EBEC;
	Fri, 25 Mar 2022 06:29:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2131.outbound.protection.outlook.com [40.107.223.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 70A9B10EBEC
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Mar 2022 06:29:23 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ak58RHtT6NutZvHbq0Ua2sp7+51qvJwEi1+cK1VAq/sBuFbEB5bQUGlYx8Bx/58KE5KeZ1KKLnBW7HvY+6eCIiwVL87dvleISrbA9X8TIVI2qIo0WnYtuIDkBp04mhaeEIQupWLPfTCeNbtYIgjQ2b00MzBrkCkiWvgufYSnnIzdU6rPfwl0/WlpBLy3UUhFxW6/EvJpq+xERZ6x1oAILFYefMJsbtulLlgaB35thqsLcWhSEMitNOGgRIBCqUqJxqtQA0xN3SnhiSuHR+YdJ1g/MoA0BbZ4gtIEHI9090J5cZAIHp6lFPHLWZjarERbgWJoNn52HzJSshUof8fijw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=r6VFVv/7uRp8NolX6ZrCNXlaX0OPbRBpkwe/7lSAHPk=;
 b=Nrr9H7Ncbbw4sRW0q7CfzG9igF7QNrrBu6l/Zs1q0VDIxXLyAhuvrBHG5xGLyIMCZWl2dp1o4/lZbOeNEOtfEI/6++3P+tWJKiQ/sW3Lo/uK8WpY3FuwykUo9ie07eRNz5kJgfgojMsCoV2++EsMGpmM2KU5GUnEGo3BeUxWBYM5GSIaavJyeRuMVRpddVj2NXVAvRmmDxIJ9MdPukBKGQlAQMSkSaWHB2+1IbWmM7/yE/1rTbvb/p8V40j0EjjLJC/FyleXmppyfnyvLOV2zCUUz/VWBTc29xMqkPL0bOIZoEox1GNEbUzSYHdUQ1kc8BvEy4yiF099cB+w0rKimw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=analogixsemi.com; dmarc=pass action=none
 header.from=analogixsemi.com; dkim=pass header.d=analogixsemi.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=Analogixsemi.onmicrosoft.com; s=selector2-Analogixsemi-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=r6VFVv/7uRp8NolX6ZrCNXlaX0OPbRBpkwe/7lSAHPk=;
 b=jxXOnuI78msF+pjXQ5jGY2Yi8dOgm0h7nwpHXb5bX/RVdh1e3VmLCZ3I92KBCRHtJCMRyU7fcWJIuCMku4OTTR9it6Or623IFnG4EyjIDSHWo2TyUi6LjVPJxq69LgTZyrXu+e0ISuDCYCVTM3izi0s2DQm1U4h5Rj+Nk7rAdXY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=analogixsemi.com;
Received: from BY5PR04MB6739.namprd04.prod.outlook.com (2603:10b6:a03:229::8)
 by BYAPR04MB4246.namprd04.prod.outlook.com (2603:10b6:a02:f3::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5081.18; Fri, 25 Mar
 2022 06:29:20 +0000
Received: from BY5PR04MB6739.namprd04.prod.outlook.com
 ([fe80::a865:6d10:c4a9:1142]) by BY5PR04MB6739.namprd04.prod.outlook.com
 ([fe80::a865:6d10:c4a9:1142%9]) with mapi id 15.20.5102.016; Fri, 25 Mar 2022
 06:29:20 +0000
Date: Fri, 25 Mar 2022 14:29:12 +0800
From: Xin Ji <xji@analogixsemi.com>
To: Robert Foss <robert.foss@linaro.org>
Subject: Re: [PATCH v2] drm/bridge: anx7625: Set downstream sink into normal
 status
Message-ID: <20220325062912.GA1527766@anxtwsw-Precision-3640-Tower>
References: <20220322080213.1487134-1-xji@analogixsemi.com>
 <CAJMQK-j+PhB6dZBuKG3NtW94oT0bVkp9G1bXhmyZLgYOmTCgog@mail.gmail.com>
 <20220322085208.GA1487511@anxtwsw-Precision-3640-Tower>
 <CAGXv+5Gddu8VU7xjX-r2=u85i7Ut=_6JpQV6py52OyzEkpezTg@mail.gmail.com>
 <20220322101342.GA1493353@anxtwsw-Precision-3640-Tower>
 <CAG3jFytYcLP_1JJzoTU8YcwXp8==EpPdad5z02ROu8HtuaqfzQ@mail.gmail.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAG3jFytYcLP_1JJzoTU8YcwXp8==EpPdad5z02ROu8HtuaqfzQ@mail.gmail.com>
X-ClientProxiedBy: HKAPR04CA0006.apcprd04.prod.outlook.com
 (2603:1096:203:d0::16) To BY5PR04MB6739.namprd04.prod.outlook.com
 (2603:10b6:a03:229::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c67a0c08-164c-42a4-bf52-08da0e28cb48
X-MS-TrafficTypeDiagnostic: BYAPR04MB4246:EE_
X-Microsoft-Antispam-PRVS: <BYAPR04MB424607B2A4327617DC617378C71A9@BYAPR04MB4246.namprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: rPmZyVCUXIzzQDsWgnXkcrK33K5RjIw73zrJ3gR2QWulnpFQ1YIrW12NFaJ2z+0cDL5V25JdZ8oaIc/93yPPVcNo3/bYGCcAfPDrWZPaxO45C+zST69njGYx/E5JB6MNNnQke4xCrbUDd1sZ4Z7bLmzfT9y93ALrFCcLeZvYqxV01esxrPZ3L3ABq23g06ZDAWmqLTvhnarxSk0ebQhXcclL2L/5glgiNOy0GTwURwJIvE04jt759i7zrITnTWxC91d0TrLIsblhalP0Z8iQ0GBgaO+gGXopWAitNCrBafj2TzSr0eSZ2epxZCY1FKnPa8p/DrgV3DuwQO+7lZpeJOqSokXIttorkKxjc5nzJu2Yrzu/8xTaIWcHVUHi8J07DuGLiWUV+HQR+eVnfgpeeeB7l4PuMxGD28lyo/+D3i3LjfkH1B/Q+swyZShP9dKhw2BYbF4pJBTew1gVv+88X26FDyG317d+Yukcyi+jWbnEHLyrMwosf2bcDGWwRaqFktYKr1Lpk6WUmvNyuV7K4LvPSmy2LeMGB1qQc105ZyfZ9Sv5CaW0SQrYnLwFC0AfKErkmKV36qaoufKQGLFlhPdalHBK3GfFwNnsztxLrxWWLGoY99EzrU94ABO816B1hhaD/34xGxtHb9QpIfq9+4bDdBQBOizB9845Fjk7Nt3MRqvFLaIwZ50qoBoE29qx7mb4MgSVl34VRkAsb5povg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR04MB6739.namprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(7916004)(366004)(9686003)(86362001)(6512007)(8936002)(6506007)(2906002)(186003)(5660300002)(33656002)(55236004)(33716001)(38350700002)(8676002)(316002)(6666004)(7416002)(66556008)(4326008)(52116002)(26005)(66946007)(107886003)(508600001)(66476007)(6486002)(38100700002)(6916009)(54906003)(1076003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?UaYkzOX81GE4yBOYP47hRxoxZ/ShmGrmRncslAWUZ85BY0ohF00QgKDO5L5F?=
 =?us-ascii?Q?Y4QOVCTLputynsusevzlDfeLvztd1FgmAO+hOMXqDLurR4Q0ZKniyYZVKzlk?=
 =?us-ascii?Q?NwExYEX7zwRqTWgg7woDqwMH75doFfpsOjA0qGXAsorlU9PIBcvRVPNf2rAk?=
 =?us-ascii?Q?XNUyKoBTAWawgrxNHXraS6iT9WXqoOmn1+daUkFcq8zk/wfo3TnVec0P2W6J?=
 =?us-ascii?Q?kcwhleZHR75bDJKdI4SrMsvFq3hLVMZkW86pH4/TOh6FZQmZAYGPyJBZ6O7R?=
 =?us-ascii?Q?evJDV7TLgLwCZqs/Tza27QNYCNN82QCAMB/irw0GOBLA3Lj9F0ICKUePlgGX?=
 =?us-ascii?Q?LrRs0Sr4jD1eIPEtrHlk+/Sw5nmRHMLlLU0D8jSUycZZg5oc8bRoAffwtXpg?=
 =?us-ascii?Q?8kn9JPhxXWzV7ackDdSflpqV9gJofhagwVDtWQry+qtt1V+E4ylf/RM5ZKhk?=
 =?us-ascii?Q?yl5oCnusKHD7A33X77/17iuEGKwg4H9BpVwV2pvWjfZLxrJ4sRZrx7ucJyQ+?=
 =?us-ascii?Q?m5y4mDzek7IzoDs/fOvTLvjHiQbtX5fHp6Mcl3Thqtmd8VO0K+0C1vrlUckI?=
 =?us-ascii?Q?EtixLXgZw2NLcXvboSksMa5UKI1NUBDmtiyBW9sMYaR3KM1fixNxh9qEWgdp?=
 =?us-ascii?Q?zLBYEfE3RrIpSssY/1MLBxGxOXHS6C9r96CJMm6maOcDVx7kklxfSJy8GFwF?=
 =?us-ascii?Q?rRwL2sk2ovn8qtdTlAnywrAyjBcQPW3DXdVMZnMF5g+06/P7l+Ra9pV++ZZI?=
 =?us-ascii?Q?FyygOezuxaEuk8fq2YihepnQfeNiRzPbCki39Y66WPVgZiUlpUUxebAcOEOc?=
 =?us-ascii?Q?7wEYiNdHYPFr1GtLPhZRs4g8n0aK2Iyvpf/FlS3ee5WGZYjwoFWyfw8391e5?=
 =?us-ascii?Q?Mg3RAA+x7YQVFv/6nmK8EHxVBS4/zd/FeC6k86Q/uOZLK3ucEzQTWddCQ7TA?=
 =?us-ascii?Q?gkPU57qeQvgDVEsxSSBuHzAwD1nyGRV0omf+1i65RbRvAesSltd5ZmPd52Qo?=
 =?us-ascii?Q?9ZNZf/onGdb69FyWirDsjyRTiwwc8qHOfDHORPYbtxJhXTbDxqjcPUbHzS+M?=
 =?us-ascii?Q?jHh7pEfzCWTYo7fPrzSb+Mu6T5Qr6dTFElyUXKQl+op+0UQR5t5FkQX9xpEl?=
 =?us-ascii?Q?VntgrMqiJviK8ioHjIrGYgsYtHE1NjoNv7R6AFJPpgp/8tnk/yddWR0pNgdg?=
 =?us-ascii?Q?uKTVzXT0q/NknzbKsDhF/MGcIiFU3ft2x9sUJ5+Tj+RXquF4qTGm93IrUI7F?=
 =?us-ascii?Q?M4ZqFTngYznT1mclZ1wbJZ/hbpgCVNl2hNHgI25jYp6f3X0F6N4cY3mEjLUn?=
 =?us-ascii?Q?+XMpJoB5/pxynITjpDlH9khEkJerYtH9mgF4iI4PReUQCs2S+rjD0hLin+j4?=
 =?us-ascii?Q?kxwUp1m0TQQ2S249zkxQrA62ibPC3SAtXIVsFDy/uo6bfYnYoX4X7hpxf2K1?=
 =?us-ascii?Q?o8oB5N1FMZOBjkhrzttzbqXGr13l54eK?=
X-OriginatorOrg: analogixsemi.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c67a0c08-164c-42a4-bf52-08da0e28cb48
X-MS-Exchange-CrossTenant-AuthSource: BY5PR04MB6739.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Mar 2022 06:29:20.2588 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b099b0b4-f26c-4cf5-9a0f-d5be9acab205
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5WM77Rsyt8t3qq+uw5IdE6VVdPc3Kzxxtz1fEwE5ORlqIIFzsaBYxaX5OWmop+2cbKS9XzHgYogYAYq2NauOvg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR04MB4246
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
Cc: Andrzej Hajda <andrzej.hajda@intel.com>, Jonas Karlman <jonas@kwiboo.se>,
 David Airlie <airlied@linux.ie>, qwen@analogixsemi.com,
 Chen-Yu Tsai <wenst@chromium.org>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Neil Armstrong <narmstrong@baylibre.com>,
 treapking@chromium.org, Jernej Skrabec <jernej.skrabec@gmail.com>,
 pihsun@chromium.org, Hsin-Yi Wang <hsinyi@chromium.org>, tzungbi@google.com,
 bliang@analogixsemi.com, Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Mar 24, 2022 at 01:07:56PM +0100, Robert Foss wrote:
> > > > > The driver uses DRM_DEV_* for logs. Can we use this?
> > > > Hi Hsin-Yi, as comment in drm/drm_print.h:
> > > > "NOTE: this is deprecated in favor of drm_dbg". DRM bridge driver not
> > > > use DRM_DEV_* any more. I'll send a patch to replace all of DRM_DEV_*
> > > > later.
> > >
> > > drm_dbg is better than dev_dbg though. With the former, you still get the
> > > option to control it with the drm.debug module parameter, unlike the latter
> > > which normally gets compiled out.
> > >
> > > Please use drm_dbg*.
> > >
> > > ChenYu
> >
> > Hi ChenYu, the parameter of drm_dbg is "drm", if use drm_dbg, it will
> > change more code, I'll consider to upstream new patch to replace all of
> > them later.
> >
> 
> Alright, since the driver already uses these logging functions, let's
> apply this patch and fix the logging function this driver uses in a
> separate series.
> 
> Xin: Can you submit a patch/series that converts this driver to use
> drm_dbg* functions instead?
Hi Robert Foss, OK, I'll submit patch after this patch get merged.
Thanks,
Xin
