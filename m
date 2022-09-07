Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AAF25B0554
	for <lists+dri-devel@lfdr.de>; Wed,  7 Sep 2022 15:38:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 786DC10E762;
	Wed,  7 Sep 2022 13:38:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10olkn2025.outbound.protection.outlook.com [40.92.40.25])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C353910E762
 for <dri-devel@lists.freedesktop.org>; Wed,  7 Sep 2022 13:38:01 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JzvHn1sHlfPimYJDPpqlPoG8O0Dq5UEYPvAPvJVFYzLdUSohkfdZHPLaPgbVUM+YaeT5E8CDf73JI/Aw+yZRHTRKYzSmKCnBKET+Ad6MfhKZ9xI9J9THnrFJATnXr3TW0QgBuCsalTiLmb/EYYRd5DLofhFqU6+aGlMcPpFo67tywQBH9frIavWFqSbHwrm8mSHJjLZ7W/PvISLhYg3jIoq1E7qAwhmHLO9pejzBJXwWm0U1zh7I8XlfwpDwLAQkKcVIkFxSD3O52KV94MOFdYCjG9QWS2kDli/48njcKMs0MG4UHjmKCraZV8hJ2NjaM8tBvdkdzrV21/GH3P8cHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=r/2I2Nrmjufg0iOLei7niKnwhN8HAkKESbL1xz4qHgo=;
 b=NOV1dPGFknpYCQT9Rtyc6yzuO9xXnEAEQqdNzdvQt82RYG9c73S3reNoqxFdIeFGbnx3aTvMxPBT+ZKVF4XWngzQFKL7UvILxUaDVWfOUVDYd/721CkZmMYOJ4iv0mvSBzM+bTRIyCSCbh35boOzOwatHokBf+K1w4mw8Y99DtN0AWI/2ZgNkruVN1V1Z5PmJFxYyH6Pr6oTNusutnoMhVxJdnMrGr9X8yQ+W75veEusFiSBv/YQC4G++WZd680l77ZXKSx1/Rn5YrWtcD1uVhnikRsSHecWXNZ2drqFWCKNUZu9LluTLqG3FLBAf7stay7B5kj0AKArEUByHhhdfg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hotmail.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=r/2I2Nrmjufg0iOLei7niKnwhN8HAkKESbL1xz4qHgo=;
 b=JiCuk/OSwxI7n4Fexbu067TN/qyOBSVZ+m1sxtY4XQi45U40p/tldfR70aGxDVsxu2aYlCxlT3XyAUgfMRcv3vK7Z+laG4GrVKP6HeWH8QdKXj2J3jF/Y7R8E5plsbSH1DaMZNYekz0kNdnMGQXJLoRHbBmNZNvLxCQrsM1mnDd10mA4BWksanOwilLpnJMLDmjJ393f7iPEPBy1B+4EFQL7Mg14Ly5ACTk3X3q0LW6r5I0fD5JucwB+bA1zSShxC2XAcpW/f8550/cVwLVrRvaBrCtqDJIlELsUf3mwN4JSaxDyvN1Rs5/Eqmo+CS1srvbFzOIzjEI0iTW/OBZfzA==
Received: from SN6PR06MB5342.namprd06.prod.outlook.com (2603:10b6:805:f9::31)
 by MW4PR06MB8299.namprd06.prod.outlook.com (2603:10b6:303:127::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5588.10; Wed, 7 Sep
 2022 13:37:59 +0000
Received: from SN6PR06MB5342.namprd06.prod.outlook.com
 ([fe80::9999:3123:e227:5259]) by SN6PR06MB5342.namprd06.prod.outlook.com
 ([fe80::9999:3123:e227:5259%6]) with mapi id 15.20.5588.016; Wed, 7 Sep 2022
 13:37:59 +0000
Date: Wed, 7 Sep 2022 08:37:55 -0500
From: Chris Morgan <macromorgan@hotmail.com>
To: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH 1/2] dt-bindings: display: panel: Add Samsung AMS495QA01
 panel bindings
Message-ID: <SN6PR06MB5342EA35B891D01575B275D0A5419@SN6PR06MB5342.namprd06.prod.outlook.com>
References: <20220906183642.12505-1-macroalpha82@gmail.com>
 <20220906183642.12505-2-macroalpha82@gmail.com>
 <1662500460.105772.1224955.nullmailer@robh.at.kernel.org>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1662500460.105772.1224955.nullmailer@robh.at.kernel.org>
X-TMN: [5JVweMJkp17nOuBgzxd6BJjQVpGoZJns]
X-ClientProxiedBy: DM6PR02CA0118.namprd02.prod.outlook.com
 (2603:10b6:5:1b4::20) To SN6PR06MB5342.namprd06.prod.outlook.com
 (2603:10b6:805:f9::31)
X-Microsoft-Original-Message-ID: <20220907133755.GA29551@wintermute.localdomain>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5c742f89-f026-4bcd-d5c9-08da90d62dbf
X-MS-TrafficTypeDiagnostic: MW4PR06MB8299:EE_
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 8GXq6HRmGvjtEJxZiaUK2XzuP747+md6wFR3H37Y3KEbIXZf0WD9GW0h4QCXXmbo7VOCObfTs+vSmMgX3AppBzdSwQLF5Ep+/QF/Ztrh1Ixj3Tc4ahkpNy1QdUNDsmiMre3g1f5tMF2qxa02cUN+AJdZDK61wQc4XcjGSukFupomJy95/bcaHj7BkxVF1+yOHw2kGk5SS2XRse1ly4RP50lZQARt5Yr0erElfqPDmVVnJhAK8ghuSQd/TqUSEsXbSchjZMvbVSWB8E/QCYhZeDSapznIwWJe1hF3npy6IxpbfImQ73FpiJq70z/zPBd+j9K8I/rbSWObyDDtvsvks6DbwZWZWgONpTMfzYn00dVYQQC9ROeyVhI0e6S4l2C8SvlasWwtvpt0maflZkiG0ZiffHBBFMbdcCy2X2KKvVCESY2QZPl/tuQ5kOdTsQx3xPVLBG9Y/nx81cD5HQqvb1MdoCj4+EhxnweaxOW1X1LCc6qvO+e1mtcegJNDNQkQlR6zvrXcZnsmjmlHbkVr2YF+Q4NPCAoj2zdKP5HJ7d2NRcjUWrsygGrowKSTbNxKjZ3sarvoo7OwfWl6sURgUaW4G5qESMpOtLITbDK3SyQVd+s8xukRst2gyYjbu2Z92Ui2+dTb+otG90Xoy2Tg13Rib66948cw06kQVppmFB7FyeaoFGM3M+YRg/TnHqnl
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?S+az45j6SDPW0UOGE3VSc51DmrrPVGokbsuGGOJpUkX4htIeklpsMulbRKoV?=
 =?us-ascii?Q?1rJksS9bxq4gck6iquyw2hteQHlc60qH/0+efDq+evtYmwRzdy7dqsgbby6n?=
 =?us-ascii?Q?rUwUF0XWyrI8EeX+5I6QOf9X9RwdjhR6DaxGNiw2iAx7z75Og8Qiz9WRRyRs?=
 =?us-ascii?Q?zWjZHexi0K1vqOcqPTPoSGjfLQh6/hWebQ33mwn0DbFQa4nZwLa4ZD1tetM5?=
 =?us-ascii?Q?g73d3wSyZsQqYC5ZY5HiOwSeqQa7UOvQUcbwE4GoJvGiJCwuEIhQR6Re33iL?=
 =?us-ascii?Q?BtcLi1UwhS/8nDOQXJ6L3/9X/WQM3lzgxus2CokFAZHIqWaR2zUyzk9xfGU0?=
 =?us-ascii?Q?DIZ+uU6tBc/IUsN8PwqiPdf/PhH4YI0AFqnPdhrjG/hlxHp/1iVZQ8krX+02?=
 =?us-ascii?Q?Qz91ZD8Zi6yNgkYRxLCifOpds8HOe7vc2UupMYoznZ/gn+n1y2p0SZET4iDr?=
 =?us-ascii?Q?+t/zihJFHi5uQl8+0z7VPIySebt9njnFZ41Lw7L21vc4nqPJlF8mgpG4XkPb?=
 =?us-ascii?Q?o9QWlJHqVZYwFsocke9pLxMEBN/0XGDw+RVSyc6AuHeH3SpbftubbpkhnRPY?=
 =?us-ascii?Q?aimZA4epOfY5bDB9qjEBUfXAKBe6nEO+6S+XTwtbJWTlIOnm5vBOt1H/V5fA?=
 =?us-ascii?Q?MINORovMe82XYlJZaUdbzsJlSYya+GTb7TId2K1IOfidqOFuhtD7grkT7FnY?=
 =?us-ascii?Q?EwuzHNap89Zs0QasStYSt5IWOYuQWgx/jKPCE/2h+Uf0f4PDETIjLUdgwWif?=
 =?us-ascii?Q?44IiDLBQ6WlpGpjbe6WqcSnb2WwMQgjjiecK6CtW9pmnyCVuDXaLs/1sXhsH?=
 =?us-ascii?Q?DPDQ0v8yJ7yz5XcUePqdqZjtj0qrdKavLQlMADlcj2IwFoN5P5I50UdjWcWu?=
 =?us-ascii?Q?+vmf8Nn+5Sb9+IjXnbM0ZNV1M6IKcp2sWMQOjDHnRT9Ft67a6SIEKhPQCeac?=
 =?us-ascii?Q?JbCqTi262DXai7y64F0wvy+dUr4UkQNTNlRJZiTWdKALJ51n51OPofQPCCU5?=
 =?us-ascii?Q?Zzi+3DTYckDEFnf1ImrlYWRHH2NZ3ppp99caFgXOOdZfPWMl1Nj5r75e99nJ?=
 =?us-ascii?Q?mefSSFs6+U60m0BM1vuNtSyiTWTeb3X7auaeDMCCsYdyzVa7gDJ9Azb+a7Tt?=
 =?us-ascii?Q?ab8LAaUNckRYkv9AV6IMHdjnG80vGZ+B1xQyWjulUe9iBKGRVDMk/68+sNnD?=
 =?us-ascii?Q?+W844swGgR3lWYVUJjZ6BhCJYRNyqMV4b87+FSCAJVJhg5nJSo5wwak1dzf8?=
 =?us-ascii?Q?RFCUQie74EhpV/fwJ+pSektnujd1gpUNqE0rT8PEtQ=3D=3D?=
X-OriginatorOrg: sct-15-20-4755-11-msonline-outlook-89723.templateTenant
X-MS-Exchange-CrossTenant-Network-Message-Id: 5c742f89-f026-4bcd-d5c9-08da90d62dbf
X-MS-Exchange-CrossTenant-AuthSource: SN6PR06MB5342.namprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Sep 2022 13:37:59.5043 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR06MB8299
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
Cc: devicetree@vger.kernel.org, airlied@linux.ie,
 dri-devel@lists.freedesktop.org, Chris Morgan <macroalpha82@gmail.com>,
 robh+dt@kernel.org, thierry.reding@gmail.com,
 krzysztof.kozlowski+dt@linaro.org, sam@ravnborg.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Sep 06, 2022 at 04:41:00PM -0500, Rob Herring wrote:
> On Tue, 06 Sep 2022 13:36:41 -0500, Chris Morgan wrote:
> > From: Chris Morgan <macromorgan@hotmail.com>
> > 
> > Add documentation for the Samsung AMS495QA01 panel.
> > 
> > Signed-off-by: Chris Morgan <macromorgan@hotmail.com>
> > ---
> >  .../display/panel/samsung,ams495qa01.yaml     | 49 +++++++++++++++++++
> >  1 file changed, 49 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/display/panel/samsung,ams495qa01.yaml
> > 
> 
> My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
> on your patch (DT_CHECKER_FLAGS is new in v5.13):
> 
> yamllint warnings/errors:
> 
> dtschema/dtc warnings/errors:
> /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/display/panel/samsung,ams495qa01.example.dtb: panel@0: 'backlight' does not match any of the regexes: 'pinctrl-[0-9]+'
> 	From schema: /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/display/panel/samsung,ams495qa01.yaml
> 
> doc reference errors (make refcheckdocs):
> 
> See https://patchwork.ozlabs.org/patch/
> 
> This check can fail if there are any dependencies. The base for a patch
> series is generally the most recent rc1.
> 
> If you already ran 'make dt_binding_check' and didn't see the above
> error(s), then make sure 'yamllint' is installed and dt-schema is up to
> date:
> 
> pip3 install dtschema --upgrade
> 
> Please check and re-submit.
> 

A dumb mistake on my part that I will fix for v2. OLED panels don't have
backlights and I forgot to remove this from the example I copied.

Thank you.
