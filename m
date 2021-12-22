Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1432747CD92
	for <lists+dri-devel@lfdr.de>; Wed, 22 Dec 2021 08:31:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E13A5112393;
	Wed, 22 Dec 2021 07:31:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2075.outbound.protection.outlook.com [40.107.93.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8464A112392;
 Wed, 22 Dec 2021 07:31:28 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Vp0BeWwElw4GfTXicNPz5sPbIUJ9R7lb6cybw1ORZRi2efADozFoM5qFQOS8yN5FFfvFNELZd2dwcpzAU3Aw+39vwdc0xop6o3lHW4gX0axsjKnH8lPniGNKn6vQo/JUKDymlxxVoSt47GVNNXbE1XIWyng/b0Gexum2vq3vSEOuaUuB0hztyACrd4ovqpy9WNJqKimqjwAarzAnNnZhld9e97lSIhXdJ+PnLpR2CmAgJ+wqC7QMaCxDMn8PchZgXXfKqtNo5lKq8cpjUq8jG5ZZRzjYRnJS53RlpQ+TXnHCsC2x+QDiS9WBvFTW+kYc7krPFOthjX4D1NdH2sLgYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2sjllIj9Oh8qrvTo38Jzsn3lpQpqe/t3aXCiIdZGy6Q=;
 b=a0D3Pm9oMxeUFYKVHkCYt3mnF4oAiQO2lBtAOg+x9R/syLiOXWy72ploUg6y1v6Xw2kRg+vloGHiQPZJhRTaZ5+0EHAM44do+YLs+2CzoivOdoCnWaePcQs5FRwCGnKtJ2qjQJmM3OFNJgbTgLHEkqc6sR84O2+sk7Dl21fSKGTIn1N4S6XLikD7gHGs0yLKXLLNGbCyNA18nxXzJPdwE8WyQrHbiG6vpF5PMpTeCbiz8l5Z1rnoIRiKBI8hLbIfDrtUSez/9TQSMIdRmHNUhps0ZQ6ryWPOlArb2aZZFhy/FBQjQwpDT/8xm4GOoJm1AcXPq068Sp2ZCZaRk+B9mw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2sjllIj9Oh8qrvTo38Jzsn3lpQpqe/t3aXCiIdZGy6Q=;
 b=lI8LCyMcB/tdJrxJpQdYuIc+uzW0+4xjdquFcXtembLFAwjuhHn/cGvycuJV5o7uoLLKSckdEzw35vjDxVRX7D40BlYvUP5iSbIsNJuiJKIXoUoGVplgKhaxS7ScI+8ZpLXNUaAPuobr8M/i079SUeQPF9bylS+mpyHYmUM2ZRc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MWHPR1201MB0192.namprd12.prod.outlook.com
 (2603:10b6:301:5a::14) by MW3PR12MB4492.namprd12.prod.outlook.com
 (2603:10b6:303:57::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4801.17; Wed, 22 Dec
 2021 07:31:26 +0000
Received: from MWHPR1201MB0192.namprd12.prod.outlook.com
 ([fe80::d16c:a6d5:5d2e:f9d4]) by MWHPR1201MB0192.namprd12.prod.outlook.com
 ([fe80::d16c:a6d5:5d2e:f9d4%12]) with mapi id 15.20.4801.023; Wed, 22 Dec
 2021 07:31:26 +0000
Subject: Re: linux-next: manual merge of the drm tree with the drm-misc-fixes
 tree
To: Stephen Rothwell <sfr@canb.auug.org.au>, Dave Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 Intel Graphics <intel-gfx@lists.freedesktop.org>,
 DRI <dri-devel@lists.freedesktop.org>
References: <20211222145014.472328be@canb.auug.org.au>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <c55af047-3207-fb42-19ee-71f2e18e60ac@amd.com>
Date: Wed, 22 Dec 2021 08:31:18 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <20211222145014.472328be@canb.auug.org.au>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-ClientProxiedBy: AM0PR06CA0136.eurprd06.prod.outlook.com
 (2603:10a6:208:ab::41) To MWHPR1201MB0192.namprd12.prod.outlook.com
 (2603:10b6:301:5a::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ab1080d6-8fb1-4e1c-843e-08d9c51d1022
X-MS-TrafficTypeDiagnostic: MW3PR12MB4492:EE_
X-Microsoft-Antispam-PRVS: <MW3PR12MB4492177CF58D210DEA49CB66837D9@MW3PR12MB4492.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 6IcS10ftYs98uIfyghVe4RiJsRqVfbrfrrZOAktoPZ6MvY0l0TF0CPE6FM0hgOUiGLWd10dyjP37ec2vWehXKiL0ZjeJOHXfQCJKncw2MAoRKoaQ2ebLExMhioK2Epdly0z2SzbZQjzVlxqLRpnM7h3Kb4Ps29iWqcKHC0KN9ty97se3HgkEaC3LecBBsNxcFnPvJAF/OqLHC3gb5YxuvDFMm6zVrS6ofIaNA4y7OuwIxcgZNcgpGPoeYWc3aSLkzwbOuE0mwa+57JcO9MtrMfHsMiYhvG84DvWCToQYRfzZXKChxjyMjclk3e0XCmIIUNsfDdIfA94pzToozwSViamIcwvQ/0iv3nXVH5I+zWOCYBB6gYIOKxbY+XfBodc+Z3RSmR5yA/Rq2pMEr/3FQelCNCL6UA5+oYsgvstdEGgof8aHnXXuwEArG1H2Ew/LN8mZstPg+mDBWO5KFtcCxrDvR58oyomW+FBexuEXszZblMIOd7zBKiWK8au2OyXkB3qLXfb3qXJuBgdjYa6yIF3f5Wd7JKg24PxpOodoj/X3yi6ZfRtgXvIAv7f13b11A1Y1dx+s46sMA4OvIdr66YWxzp/a4VZg+Ah8GQcxRwDG40+Q8DrqWeI5H+dlnj9Pc889Tjs9tgpXD5FFPUcbdziBSknCs1LS1Snz7jNXcM1Dqs1NTRmZqqmIjlwdSR7C5v0u87p1TUL9uzFgw/lHuqfIgZxiq2sb3SwZha1vX94wJ9Shww65GhedElIk8Sdw
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR1201MB0192.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(83380400001)(66476007)(6512007)(186003)(508600001)(8936002)(6666004)(4326008)(36756003)(26005)(8676002)(66946007)(2616005)(66556008)(6506007)(54906003)(316002)(110136005)(2906002)(6486002)(31686004)(5660300002)(31696002)(86362001)(38100700002)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?Windows-1252?Q?i44nWEID2cJRZGnPR1cYwRJTUYvp2x/SgFqyaK9wxqCGgd7ueP5LJTkw?=
 =?Windows-1252?Q?W0x8nxrHhUBHXRmWFW/rRvIHig7rjZ2uMp/BHAZrqUqH+zk5CjkY0OyT?=
 =?Windows-1252?Q?dtxpOdKn0AkZ9Yb41Xtl5kjABKaxv6u1tIhhAWgAstibFcx0JdwQGn+e?=
 =?Windows-1252?Q?350RB0Rrh/2nCNPQx/slh1lCc+K2Zrr+y97R2Y25vEDwRzuSVh2oowtB?=
 =?Windows-1252?Q?y1uN02FpYFnvgnEQYA3/lHCa6gG5BFWuY9aZrJlq9NMXgUWan9/3YOiY?=
 =?Windows-1252?Q?+NJD/YWPvr3/uAqmCDGAPn/n2iw22FVpGemHm3fCUXiwHesbxYHX0tOx?=
 =?Windows-1252?Q?ReiEfUcU3C2DjUETvnhTK9MPk/jQHuPeNN3PY0K13pHSGeJqJOX98jWE?=
 =?Windows-1252?Q?FV7SOUGLcPb2+Jq37LnCfnzmDiPwSNYIBu7gXDQgZaKTb6d5lzddXtCP?=
 =?Windows-1252?Q?/sDRIlll0VhfmEVbtsopuIUv6UtGY0hzjGkuhUoKT1QkbAvoqfdE2PS0?=
 =?Windows-1252?Q?k4nvzZtgG6FL0wnJpsek203j7zYZK2W6crOBud34FtBZEaqU2X9DTrd8?=
 =?Windows-1252?Q?UwWF2nNmmLEZ4B1OWmbrEyHa+q799+qir9Sy+tEZGovHR2qANXF2a5pP?=
 =?Windows-1252?Q?hNzp7R2z2m1RX2Zxmjrz3ayYUgElwdegiy1bZIAcVEFScgd/71b6dEcQ?=
 =?Windows-1252?Q?p8Vsv9Tim24p2sboPtY/BSeKEXARKNCu02tss8DFrUrQQEKFBrFfXsiB?=
 =?Windows-1252?Q?hPGmu/fih9CpLjo/9K3cYxD0kvfOZUq85Vv6PLhN52ZRxWgESTwx0Cti?=
 =?Windows-1252?Q?RTQnI1Abrfl/2cYHjp1b2ovt5vcZq7qdobYlihUCkyr02gw82ST94Ep6?=
 =?Windows-1252?Q?M/vBYAs0OtaCtUw2dBfcK7b6XPHBhNVW8qaAecGHcsiLFrMSUbtiwJ6n?=
 =?Windows-1252?Q?ulHCSS+5I5judpU6UWCAEY2HWwUuoo1LNiIqDq5lp1q4gVGRT/nEnCGj?=
 =?Windows-1252?Q?eq6Ex8y0/2hkmR0MigERADP/Z2O1Bp6mqEQr+AWcZfp4ZAcBzXB+yjKH?=
 =?Windows-1252?Q?Ly+WPLC/lqwaPkau8/T6RCaTjRCCmEj6CfM2uMdZTp4Xbn6Cdtuh+0cz?=
 =?Windows-1252?Q?sDKl6mB9CbMxwU+5eGgLOZaCGnsty7FL6BQ8L/j2jOZ3fu31ezyh0GSv?=
 =?Windows-1252?Q?dP6QHwe9Qf6ngch0NImBHS/it6WLPm4Q2xEAAxoz7tl5gxCXn5uXQ02H?=
 =?Windows-1252?Q?mf806eLCAUwsB/qp0jBEkrLifmgqWqFn5q5c26KQe2BvDUN5J8eC5LMZ?=
 =?Windows-1252?Q?p5tWDKBHBGsnC6GEIOlbHyjyKCrVulv7Q1xxbHHRPOnwNreWtJNdptLG?=
 =?Windows-1252?Q?5IBuMyayyXj+Hl2rjxYhgp3z4ft8oYseYAZ1isSTS4WZXKsOxzNDh9C4?=
 =?Windows-1252?Q?Yc2RYSOdIgfaRxJCcGZp/KkwPOpOs1du/PRKlLocUHyLAciW5MX9bN6E?=
 =?Windows-1252?Q?wO3G/V+89wxa/k9R3iaNMihvQuMsMZiK+lafQvtoHCkhbgYkrI4zHOWL?=
 =?Windows-1252?Q?NVXyqdq1kAgyp9hyz4LkuDSP9+J88xyrU4EGja2Vrf9Gf+OsG1ZBFG6h?=
 =?Windows-1252?Q?XhM2b5B/AQRrPShaojeewPoPKdvTXf7QmmgET2z0tzulyZ+nfBrvdVDA?=
 =?Windows-1252?Q?40gHwMWQQWE=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ab1080d6-8fb1-4e1c-843e-08d9c51d1022
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1201MB0192.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Dec 2021 07:31:26.6406 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wBdorj70uowFiNDX0R00KXB/pCa6I2ybZaelFMWAll38UFZpsPf/0KLp/8BhOTUT
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR12MB4492
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
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Stephen,

Am 22.12.21 um 04:50 schrieb Stephen Rothwell:
> Hi all,
>
> Today's linux-next merge of the drm tree got a conflict in:
>
>    drivers/gpu/drm/nouveau/nouveau_fence.c
>
> between commit:
>
>    67f74302f45d ("drm/nouveau: wait for the exclusive fence after the shared ones v2")
>
> from the drm-misc-fixes tree and commit:
>
>    40298cb45071 ("drm/nouveau: use the new iterator in nouveau_fence_sync")
>
> from the drm tree.
>
> I fixed it up (I just used the latter version) and can carry the fix as
> necessary. This is now fixed as far as linux-next is concerned, but any
> non trivial conflicts should be mentioned to your upstream maintainer
> when your tree is submitted for merging.  You may also want to consider
> cooperating with the maintainer of the conflicting tree to minimise any
> particularly complex conflicts.
>

That will cause a performance regression in linux-next for nouveau users.

The real fix is already queued up for merging into drm-next. So no 
immediately action item here.

Just keep it in the back of your mind in case any nouveau users starts 
to complain about the performance in linux-next.

Thanks,
Christian.
