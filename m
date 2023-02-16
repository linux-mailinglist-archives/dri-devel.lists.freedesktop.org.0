Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DC85E6991D6
	for <lists+dri-devel@lfdr.de>; Thu, 16 Feb 2023 11:40:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0535710ED1C;
	Thu, 16 Feb 2023 10:40:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on2101.outbound.protection.outlook.com [40.107.22.101])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7AA6F10ED1C
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Feb 2023 10:40:22 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=g/tuZf+ESysFGZyQHUoOAV904fCH1eEmAIs1OlSB2V+OPXmeZFxuBBN8RIuXflFqogmJQo34FM+BXtozfcomL0/b0bdav7UmhpEB+NsqVnL3NP/Ezwk5zNS1PDZq30R6APeAq2gPqmUKNHuCQ94p8XEERdurRK65+z7pBMObWDictTKJXa02055eFO+fTo5O5yFEDn92TBVd0v2VtLj4K18/pKGfbfbZHnMg2ilprmaRZINdXG8c+IY9RS4sk+MBNcctxMziIq/OmSFxa3j1EmAL+iB2WSYs0+Bf3yNmkXvqmGn3vCo2qlPr+XYG5VPl5HpULkHtZtBehopONOh8Vg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=28mhLTGcn8sz5bi++II+UAJyUldQruV2GLFdRy4q6IY=;
 b=N+rTzKNpivCYVOz3uxDAjJH1Tq/Kt8pJql4LPA5t9WPrtVe6DilvyNA7NncEj8NmXoiMb/qeGvIXq6cM9cbokecQth+Dfs2qpm0/V5rUU55YuEVLG+3LTehZgn0HhSkbuK+q669Cfzvp+cYdp7MS/kYqk6hzFPDd2PL4t2Gg6qOnSaPghptRbyAlzgpXW1/kWhn7xtf0yc6K9YHnHxNYIF/1mRBTYv/y/Ryfxdc+t+Gr1B1isBs5sp+aDzisYIABWwFyI5ZP3DPRv77M7MMc6HYNvX7mUIYpXLCVivmTY9Ed4fcQkK8PFNhvSXRybWA8IggqUqRT2CIH7WiepLmTpg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=habana.ai; dmarc=pass action=none header.from=habana.ai;
 dkim=pass header.d=habana.ai; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=habana.ai; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=28mhLTGcn8sz5bi++II+UAJyUldQruV2GLFdRy4q6IY=;
 b=dl+7dJFa6n7cGV1YydjqgBMf+y8AJgGkOl7JtEKfanVSZI4bgblrhWSCQfSDwvUtpNoRlTRODeXQBJMQhspTifxj4emeHWhq935MzPE+iXxj2jvfXlD2SbAbw3cvKGMFzOVhN3De6Yk8fTLbZ/iiCpMfwWaxS9VAIs55UHJ9NBH+LeR2Hxyh2K7DNEVHgMGetRJPwS3B5Rvix1S7NSvuinNbPus+wKdvJtBqjtosmcqOUeycwNz0c7m6W9xq7zAbakMvxOA9K4WQJF+NvIr+V/S6J7Ntm2gG0CVIeOa8tZsO/Q0AzJZfj1aIokWPaBQasHdWj5iBgWouao1FQbJ+Yw==
Received: from DU2PR02MB7573.eurprd02.prod.outlook.com (2603:10a6:10:2d8::6)
 by PA4PR02MB6573.eurprd02.prod.outlook.com (2603:10a6:102:d2::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6086.19; Thu, 16 Feb
 2023 10:40:19 +0000
Received: from DU2PR02MB7573.eurprd02.prod.outlook.com
 ([fe80::46d6:40b:b9:61ca]) by DU2PR02MB7573.eurprd02.prod.outlook.com
 ([fe80::46d6:40b:b9:61ca%6]) with mapi id 15.20.6111.012; Thu, 16 Feb 2023
 10:40:19 +0000
From: Tomer Tayar <ttayar@habana.ai>
To: Oded Gabbay <ogabbay@kernel.org>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>
Subject: RE: [PATCH 03/27] habanalabs: split cdev creation to separate function
Thread-Topic: [PATCH 03/27] habanalabs: split cdev creation to separate
 function
Thread-Index: AQHZPyLsL3lcmZMH3kmCc8nXrP9uKq7RZmHQ
Date: Thu, 16 Feb 2023 10:40:19 +0000
Message-ID: <DU2PR02MB75737A8AD4D16BFD74CBC5F4D2A09@DU2PR02MB7573.eurprd02.prod.outlook.com>
References: <20230212204454.2938561-1-ogabbay@kernel.org>
 <20230212204454.2938561-3-ogabbay@kernel.org>
In-Reply-To: <20230212204454.2938561-3-ogabbay@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=habana.ai;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DU2PR02MB7573:EE_|PA4PR02MB6573:EE_
x-ms-office365-filtering-correlation-id: f5e013c3-68db-48da-6a5a-08db100a32dd
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 1m24v9HEytNvkShglm0bVQ211A0qmXzVBfmToIRcpYCwa5qvZcq5W7bW1F1KnjWslw3ITp/4LT0lWHnGgdswrepRyUE7+uiS2n7RRmg5CMpC7PKRfJgTu9lj6FGO7dw3VH7AQ8yyc/Y9KPsMKvWAL29n4M2B92aihM0I01oiYEIykU5OJE/rHdxBZ1ww9sUCXKH2UqJpsiAOu0QbMjC6wGDKh7hL5AlwHLfmx4G9DHDuuAx3TgzqnTmcIn5+8qw9HmYHGAmFoeiQyDvJcG3J416trkOSoBoho3xCPaF1SZOuTXy4d8oTluNLr/FG1ufSkD8+l5oyWfjhk06f0ksSClqxju3y/0dYexwgicV1bMg2y/uYhtgboFfaSECybMvJ9zm57UWIcdcsC4+Wqsq9o7wimXqZ25/8IYhy0hZ52smeXUfPG0boALEmhbl3t6HBN7YtbPETc9NEkaJnVv7imezZzQai5T6OVzUtHAkMScBX07qpeXtUv6CnmcKS6emltCQ+O7RL0tyxFAfvExhl5Xgq4r88m2/Og4BaI5OsOEJRm/Vji76zB56Pzi2/VceWdhG3NMIHD+XuYwISJj8zhWpBTwE33vo49CMs0YvlJBByIAhuKqTZKxhx2o70HvoYR7dsaIXcQWzqvImYk3HndIDWtPyNWyWeb+1PsUDC4ddR6V9l9cxv3VmSWtTJu8utNxNcBs9Jm4G/kdeqfKQw0Q==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DU2PR02MB7573.eurprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(4636009)(39850400004)(366004)(346002)(136003)(396003)(376002)(451199018)(6506007)(33656002)(26005)(186003)(53546011)(9686003)(478600001)(38100700002)(86362001)(82960400001)(122000001)(55016003)(316002)(71200400001)(41300700001)(64756008)(66446008)(66476007)(110136005)(4744005)(8936002)(5660300002)(76116006)(8676002)(52536014)(2906002)(66556008)(7696005)(38070700005)(66946007);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?2ENZtaTOggf0SZp3lyte1UWLxhrlpYW8yna9oAKG/6vuAzOQERiu4OlCJpua?=
 =?us-ascii?Q?9vZpO1Iw691ofIGH/yKTeU0WMXxe4SB+kSxaYvvKV+hvYh9YEYAEeMrk+Rvi?=
 =?us-ascii?Q?61+7XglR1hAn6wzonFBjJ+ADnKXe0panohZaZsHGRpdBThh7FaOwAzlX8f5H?=
 =?us-ascii?Q?dcA/8A9VN1k1+Lopfsqd4l8pHV0CG1Ns/ANaxSF8I5Nvtd7IiIldipf3mbLs?=
 =?us-ascii?Q?Hl1DQ9RkFiK4rkGPOFcnGRnc9xN48o0sDJbRcP8bshaPC5z6WzJCwLu/dlLN?=
 =?us-ascii?Q?DGCC3XR5bskoBfkmaDGlsX3ltgqMx+/foEv0FWZewDcaZEHbMSFjt1QvCc0C?=
 =?us-ascii?Q?nVPhTJ7Sh33e6DUoLxg59OLWVeKc2BByLuzAYGWppdW+Tf1Ri9OQltr0lcOu?=
 =?us-ascii?Q?r9PsNdPlA5v2aFEvCbQY5ckxszRYD7vvtr36AfC5JQgoKTxQSFlK3zHV3ofQ?=
 =?us-ascii?Q?eSc47UFBts7/tCmOE7G94/Yt9qTayQ4w02vqy6NWHg2ze56r9Tr0SluvRzrh?=
 =?us-ascii?Q?du0jTcVYCFvNteJd+RI0ZHDU88si/u/18fUIObOdCzzvbxYG3ulDmUlVn5XE?=
 =?us-ascii?Q?/fNEy1LrV8mxpIN4LYHW6I7a5uFEyD/czik9btK38HxJEE4XcM2oVE1FnMcK?=
 =?us-ascii?Q?egAM/tqGO1iv3TO0qksgmCh/H+NtU3prX7uWFk18Zn+h6i+yDCtBVbX17Itc?=
 =?us-ascii?Q?BoULE6MxA28zpHc2MrYhFLUxuKIOyUZeLufyEO1C/JdfMTjX1gDvuyv7YEW/?=
 =?us-ascii?Q?o0nbwkueglNVhN1d9pK8Ju2sax14vgrKRrZuEkHxCCbXLQuty5/Dfsq7mTkn?=
 =?us-ascii?Q?rxdYUTavAQolaK9Nvk+ycLcLu2c8byzM6EpXiZF5roChY1RKGuJTpj67Wta1?=
 =?us-ascii?Q?DM3ZJdjdUVynsQT+IrgosesNArPz/ckclMIGNMhKClmYS02JdVM/xo3Yfuay?=
 =?us-ascii?Q?f/FeqgtCKQgYN53y+9DRnEJbabtqz2Rp101rZTDsVR3srAc3iDhkJvBghxTG?=
 =?us-ascii?Q?seUDOHPORZTUPhy25YxbdScHj9TJ5EBArW8JPeI1ULdjhbwDHo1Um9KUlzR0?=
 =?us-ascii?Q?7nyPjLOagxQzuv5TM7G6VovrLnFzk72oB8CUrPVuhW/bxFjoHRtvR8zjv7cj?=
 =?us-ascii?Q?V5MqtDRZLSzn5OkFDdkd7gdAheOrrcl9VVHBma8LeUckAfs6aSJsJoxjC1NH?=
 =?us-ascii?Q?EArxrrAKT9zy4fF1988FPreVufHspmmnMB0zMwCxkSexKmfAKJfIPEIW4zx2?=
 =?us-ascii?Q?Vn+uzPUwGfcsA1hba8GxuFO+Y/gIbyYIhLETZWSD0UJJMRtX07LUWBCuab+l?=
 =?us-ascii?Q?JcZhX6lG1rFwJ41A0lK9Ebm9BaE4UOO/FYO42p+YH0lK1ZJF7p2bDKAm8r5/?=
 =?us-ascii?Q?9gCCPVTfaw4elMBoVvNiNMLEAOaSrW8okOm5VWKmWJW8vsXdbo6OZKLNF4pa?=
 =?us-ascii?Q?VphJIKO1Ywa7lkMHL9DmRtMGW27qpTKsNci9XskYXIbKnezJu0e8wCDNH5W/?=
 =?us-ascii?Q?8IY4QPHc1emRENyZLl9rd7pfU8LlP2Ims1J3jQiTyep1PhtNQxvvL91M9S8w?=
 =?us-ascii?Q?soCyyMGE8mXCZ+Bc5UY=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: habana.ai
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DU2PR02MB7573.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f5e013c3-68db-48da-6a5a-08db100a32dd
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Feb 2023 10:40:19.1990 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 0d4d4539-213c-4ed8-a251-dc9766ba127a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: +MFbsw1b0QSTycEv218B5+9xRfQ6LCbLoTX5xzPrS/c2yapXngKlsuhO2zMDWxXo2AuTOiGfAAC9Qhg3LpHH3g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR02MB6573
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

On Sun, Feb 12, 2023 at 22:45 Oded Gabbay <ogabbay@kernel.org> wrote:
> Move the cdev creation code from the main hdev init function to
> a separate function. This will make the code more readable once we
> add the accel registration code (instead/in addition to legacy
> cdev).
>=20
> Signed-off-by: Oded Gabbay <ogabbay@kernel.org>

Reviewed-by: Tomer Tayar <ttayar@habana.ai>
